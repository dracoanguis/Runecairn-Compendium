<script lang="ts">
	import { Button, Card } from "flowbite-svelte";
	import MonsterModal from "./monster_modal.svelte";

    export let monster: Monster;
    let open = false;

    let speed_type = (monster.Speed_type == null) ? "": "("+monster.Speed_type+")";
    let def = (monster.Def == null) ? "": "Def: "+monster.Def+" |"
</script>

<Card class="max-h-40 border-black dark:border-gray-400 cursor-pointer bg-slate-100 hover:text-slate-600 text-gray-900 dark:hover:text-gray-400 dark:text-white" on:click={() => open=true}>
    <h3 class="mb-2 font-jacquard text-4xl font-semibold tracking-tight">{monster.Name}</h3>
    <p class="font-bold">Res: {monster.Res} | {def} Str: {monster.Str} | Dex: {monster.Dex} | Wit: {monster.Wit} | Spi: {monster.Spi} | Speed: {monster.Speed}ft {speed_type} | {monster.Weapon}</p>
</Card>
<MonsterModal {monster} bind:open/>