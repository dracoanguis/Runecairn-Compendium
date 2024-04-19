import { readable } from "svelte/store";
import getDirectusInstance from "./directus";


export const directus = readable(getDirectusInstance())