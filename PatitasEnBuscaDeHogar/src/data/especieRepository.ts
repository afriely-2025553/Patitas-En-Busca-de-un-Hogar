import { readFile, writeFile } from "fs/promises";
import { Especies } from "../models/especie";

export class EspecieRepository {

    private ruta = "./src/data/especies.json";


    async obtenerEspecies(): Promise<Especies[]> {

        try {

            const datos = await readFile(this.ruta, "utf-8");

            return JSON.parse(datos);

        } catch(error) {

            console.log("Error al leer especies");

            return [];

        }

    }


    async guardarEspecies(especies: Especies[]): Promise<void> {

        try {

            await writeFile(
                this.ruta,
                JSON.stringify(especies, null, 4)
            );

        } catch(error) {

            console.log("Error al guardar especies");

        }

    }

}