<script lang="ts">
	import ItemCard from "$lib/components/items/item_card.svelte";
	import { directus } from "$lib/store";
	import { readItems } from "@directus/sdk";
	import { Alert, Spinner } from "flowbite-svelte";

    let items = $directus.request(readItems('Items')) as Promise<Item[]>;

</script>

<div class="p-4">
    {#await items}
        <div class="text-center">
            <div class="h-96" />
            <Spinner size={24} color="gray"/>
        </div>
    {:then items}
        <div class="flex flex-wrap justify-evenly gap-6">
            {#each items as item}
                <ItemCard {item}/>
            {/each}
        </div>
    {:catch e}
        <Alert>An unexpected error occured: {JSON.stringify(e)}</Alert>
    {/await}
</div>