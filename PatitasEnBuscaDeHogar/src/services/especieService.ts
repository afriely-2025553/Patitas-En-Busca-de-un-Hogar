import { Especies } from "../models/especie";
import { EspecieRepository } from "../data/especieRepository";


export class EspecieService {


    private repository: EspecieRepository;


    constructor(){

        this.repository = new EspecieRepository();

    }


    async obtenerEspecies(): Promise<Especies[]> {

        return await this.repository.obtenerEspecies();

    }


    async crearEspecie(especie: Especies): Promise<Especies> {


        const especies = await this.repository.obtenerEspecies();


        const nuevoId = especies.length > 0
            ? especies[especies.length - 1].id_especie! + 1
            : 1;


        const nuevaEspecie: Especies = {

            id_especie: nuevoId,

            nombreEspecie: especie.nombreEspecie

        };


        especies.push(nuevaEspecie);


        await this.repository.guardarEspecies(especies);


        return nuevaEspecie;

    }


    async eliminarEspecie(id:number): Promise<boolean>{


        const especies = await this.repository.obtenerEspecies();


        const nuevasEspecies = especies.filter(
            especie => especie.id_especie !== id
        );


        if(especies.length === nuevasEspecies.length){

            return false;

        }


        await this.repository.guardarEspecies(nuevasEspecies);


        return true;

    }


}