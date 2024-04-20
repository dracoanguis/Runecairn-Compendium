<script lang="ts">
	import { Modal, Hr } from "flowbite-svelte";

    export let monster: Monster;
    export let open = false;

    let speed_type = (monster.Speed_type == null) ? "": "("+monster.Speed_type+")";
    let def = (monster.Def == null) ? "": "Def: "+monster.Def+" |"
</script>

<Modal bind:open outsideclose>
    <svelte:fragment slot="header">
        <div>
            <h2 class="font-jacquard text-6xl font-semibold text-black dark:text-white">{monster.Name}</h2>
            <p class="font-bold">Res: {monster.Res} | {def} Str: {monster.Str} | Dex: {monster.Dex} | Wit: {monster.Wit} | Spi: {monster.Spi} | Speed: {monster.Speed}ft {speed_type} | {monster.Weapon}</p>    
        </div>
    </svelte:fragment>
    <div class="text-black dark:text-white">
        {@html monster.Description}
    </div>
</Modal>

