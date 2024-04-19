
interface Monster {
    id: number,
    sort: any,
    Name: string,
    Res: number,
    Def: number | undefined,
    Str: number,
    Dex: number,
    Wit: number,
    Spi: number,
    Speed: number,
    Weapon: string,
    Description?: string,
    Speed_type?: string[],
}

interface Item {
    id: number,
    sort: any,
    Name: string,
    Type?: string[],
    TDI?: number,
    Qualities?: string[],
    skills?: number[],
    Description?: string,
}

interface Skill {
    id: number,
    sort?: any,
    Name: string,
    Properties?: string[],
    short_desc?: string,
    long_desc?: string,
}