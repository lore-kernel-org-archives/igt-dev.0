Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F5A10E180
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 19:43:44 +0000 (UTC)
Date: Wed, 29 Mar 2023 12:43:37 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
Message-ID: <ZCSU6U3vMWMITLEk@nvishwa1-DESK>
References: <20230329172748.21877-1-niranjana.vishwanathapura@intel.com>
 <CY8PR11MB6940BBB5661C8A244D474224C3899@CY8PR11MB6940.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CY8PR11MB6940BBB5661C8A244D474224C3899@CY8PR11MB6940.namprd11.prod.outlook.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] xe/xe_vm: Create BO in proper tile
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Mar 29, 2023 at 11:40:21AM -0700, Chang, Yu bruce wrote:
>Change looks good, but it will be good if it mentions what it intents for.
>
>Reviewed-by: Bruce Chang <yu.bruce.chang@intel.com>
>

Thanks Bruce.
Test used to fail if BO was created on a tile different from where the
job is run. Hence was this patch.
But Matt Brost claims that recent fix in xe driver should resolve it,
but we both think that we still need this IGT fix as the intention of
the test is to validate each tile independently and not to do cross
tile allocation validation. Ok, will update commit text and mention
that this is to validate each tile independently.

Niranjana

>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>> Niranjana Vishwanathapura
>> Sent: Wednesday, March 29, 2023 10:28 AM
>> To: igt-dev@lists.freedesktop.org
>> Subject: [igt-dev] [PATCH i-g-t] xe/xe_vm: Create BO in proper tile
>>
>> Create BO in the same tile where gpu job using this BO runs.
>>
>[BC] Looks like reasonable change from perf point view, but what will it go
>wrong if not on the same tile?
>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  tests/xe/xe_vm.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c index
>> 15356c704..203721c8e 100644
>> --- a/tests/xe/xe_vm.c
>> +++ b/tests/xe/xe_vm.c
>> @@ -549,7 +549,7 @@ shared_pte_page(int fd, struct
>> drm_xe_engine_class_instance *eci, int n_bo,
>>  			xe_get_default_alignment(fd));
>>
>>  	for (i = 0; i < n_bo; ++i) {
>> -		bo[i] = xe_bo_create(fd, 0, vm, bo_size);
>> +		bo[i] = xe_bo_create(fd, eci->gt_id, vm, bo_size);
>>  		data[i] = xe_bo_map(fd, bo[i], bo_size);
>>  	}
>>
>> @@ -717,7 +717,7 @@ test_bind_engines_independent(int fd, struct
>> drm_xe_engine_class_instance *eci)
>>  	bo_size = sizeof(*data) * N_ENGINES;
>>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>>  			xe_get_default_alignment(fd));
>> -	bo = xe_bo_create(fd, 0, vm, bo_size);
>> +	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
>>  	data = xe_bo_map(fd, bo, bo_size);
>>
>>  	for (i = 0; i < N_ENGINES; i++) {
>> @@ -874,7 +874,7 @@ test_bind_array(int fd, struct
>> drm_xe_engine_class_instance *eci, int n_execs,
>>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>>  			xe_get_default_alignment(fd));
>>
>> -	bo = xe_bo_create(fd, 0, vm, bo_size);
>> +	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
>>  	data = xe_bo_map(fd, bo, bo_size);
>>
>>  	if (flags & BIND_ARRAY_BIND_ENGINE_FLAG) @@ -1052,7 +1052,7
>> @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
>>  		map = aligned_alloc(xe_get_default_alignment(fd),
>> bo_size);
>>  		igt_assert(map);
>>  	} else {
>> -		bo = xe_bo_create(fd, 0, vm, bo_size);
>> +		bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
>>  		map = xe_bo_map(fd, bo, bo_size);
>>  	}
>>
>> @@ -1329,7 +1329,7 @@ test_munmap_style_unbind(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>  			    MAP_ANONYMOUS, -1, 0);
>>  		igt_assert(data != MAP_FAILED);
>>  	} else {
>> -		bo = xe_bo_create(fd, 0, vm, bo_size);
>> +		bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
>>  		map = xe_bo_map(fd, bo, bo_size);
>>  	}
>>  	memset(map, 0, bo_size);
>> --
>> 2.21.0.rc0.32.g243a4c7e27
>
