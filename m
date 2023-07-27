Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <ec6d0e7f-f561-24fd-ec6e-e880258f96d7@linux.intel.com>
Date: Thu, 27 Jul 2023 16:17:25 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Rob Clark
 <robdclark@chromium.org>, Chris Healy <cphealy@gmail.com>
References: <20230727092025.1895728-1-tvrtko.ursulin@linux.intel.com>
 <20230727092025.1895728-3-tvrtko.ursulin@linux.intel.com>
 <20230727141059.lu76jilirgvcjb5f@kamilkon-desk1>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230727141059.lu76jilirgvcjb5f@kamilkon-desk1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] lib/igt_drm_clients: Store memory
 info in the client
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


Hi,

On 27/07/2023 15:10, Kamil Konieczny wrote:
> Hi Tvrtko,
> 
> On 2023-07-27 at 10:20:24 +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Define the storage structure and copy over memory data as parsed by the
>> fdinfo helpers.
>>
>> v2:
>>   * Fix empty region map entry skip condition. (Kamil, Chris)
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Rob Clark <robdclark@chromium.org>
>> Cc: Chris Healy <cphealy@gmail.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> ---
>>   lib/igt_drm_clients.c | 32 ++++++++++++++++++++++++++++++++
>>   lib/igt_drm_clients.h | 11 +++++++++++
>>   2 files changed, 43 insertions(+)
>>
>> diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
>> index fdea42752a81..47ad137d5f1f 100644
>> --- a/lib/igt_drm_clients.c
>> +++ b/lib/igt_drm_clients.c
>> @@ -103,6 +103,8 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
>>   			c->clients->max_name_len = len;
>>   	}
>>   
>> +	/* Engines */
>> +
>>   	c->last_runtime = 0;
>>   	c->total_runtime = 0;
>>   
>> @@ -118,6 +120,13 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
>>   		c->last[i] = info->busy[i];
>>   	}
>>   
>> +	/* Memory regions */
>> +	for (i = 0; i <= c->regions->max_region_id; i++) {
>> +		assert(i < ARRAY_SIZE(info->region_mem));
>> +
>> +		c->memory[i] = info->region_mem[i];
>> +	}
>> +
>>   	c->samples++;
>>   	c->status = IGT_DRM_CLIENT_ALIVE;
>>   }
>> @@ -154,6 +163,8 @@ igt_drm_client_add(struct igt_drm_clients *clients,
>>   	c->id = info->id;
>>   	c->drm_minor = drm_minor;
>>   	c->clients = clients;
>> +
>> +	/* Engines */
>>   	c->engines = malloc(sizeof(*c->engines));
>>   	assert(c->engines);
>>   	memset(c->engines, 0, sizeof(*c->engines));
>> @@ -178,6 +189,27 @@ igt_drm_client_add(struct igt_drm_clients *clients,
>>   	c->last = calloc(c->engines->max_engine_id + 1, sizeof(c->last));
>>   	assert(c->val && c->last);
>>   
>> +	/* Memory regions */
>> +	c->regions = malloc(sizeof(*c->regions));
>> +	assert(c->regions);
>> +	memset(c->regions, 0, sizeof(*c->regions));
>> +	c->regions->names = calloc(info->last_region_index + 1,
>> +				   sizeof(*c->regions->names));
>> +	assert(c->regions->names);
>> +
>> +	for (i = 0; i <= info->last_region_index; i++) {
>> +		/* Region map is allowed to be sparse. */
>> +		if (!info->region_names[i][0])
>> +			continue;
>> +
>> +		c->regions->names[i] = strdup(info->region_names[i]);
> --------------------------------- ^
> Should this be c->regions->num_regions?

No, it was supposed to carry over the same memory region index from the 
region map provided to igt_parse_drm_fdinfo.

I copy pasted that concept from engine names (class names for i915) but, 
given it is unused, maybe I should drop it.

Gputop does not need it, at least not yet, and I haven't thought much if 
it will be useful for intel_gpu_top. Point is, it allows passing in 
fixed region id to name mapping, which can simplify things and guarantee 
order of memory regions in the arrays. (Otherwise the order would depend 
on the order of keys in the fdinfo text.)

Regards,

Tvrtko

> 
> Regards,
> Kamil
> 
>> +		assert(c->regions->names[i]);
>> +		c->regions->num_regions++;
>> +		c->regions->max_region_id = i;
>> +	}
>> +	c->memory = calloc(c->regions->max_region_id + 1, sizeof(*c->memory));
>> +	assert(c->memory);
>> +
>>   	igt_drm_client_update(c, pid, name, info);
>>   }
>>   
>> diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
>> index ed795c193986..07bd236d43bf 100644
>> --- a/lib/igt_drm_clients.h
>> +++ b/lib/igt_drm_clients.h
>> @@ -8,6 +8,8 @@
>>   
>>   #include <stdint.h>
>>   
>> +#include "lib/igt_drm_fdinfo.h"
>> +
>>   /**
>>    * SECTION:igt_drm_clients
>>    * @short_description: Parsing driver exposed fdinfo to track DRM clients
>> @@ -39,12 +41,20 @@ struct igt_drm_client_engines {
>>   	char **names; /* Array of engine names, either auto-detected or from the passed in engine map. */
>>   };
>>   
>> +struct igt_drm_client_regions {
>> +	unsigned int num_regions; /* Number of discovered memory_regions. */
>> +	unsigned int max_region_id; /* Largest memory region index discovered.
>> +				       (Can differ from num_regions - 1 when using the region map facility.) */
>> +	char **names; /* Array of region names, either auto-detected or from the passed in region map. */
>> +};
>> +
>>   struct igt_drm_clients;
>>   
>>   struct igt_drm_client {
>>   	struct igt_drm_clients *clients; /* Owning list. */
>>   
>>   	enum igt_drm_client_status status;
>> +	struct igt_drm_client_regions *regions; /* Memory regions present in this client, to map with memory usage. */
>>   	struct igt_drm_client_engines *engines; /* Engines used by this client, to map with busynees data. */
>>   	unsigned int id; /* DRM client id from fdinfo. */
>>   	unsigned int drm_minor; /* DRM minor of this client. */
>> @@ -57,6 +67,7 @@ struct igt_drm_client {
>>   	unsigned long last_runtime; /* Aggregate busyness on all engines since previous scan. */
>>   	unsigned long *val; /* Array of engine busyness data, relative to previous scan. */
>>   	uint64_t *last; /* Array of engine busyness data as parsed from fdinfo. */
>> +	struct drm_client_meminfo *memory; /* Array of region memory utilisation as parsed from fdinfo. */
>>   };
>>   
>>   struct igt_drm_clients {
>> -- 
>> 2.39.2
>>
