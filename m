Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26B910E50F
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jul 2023 06:03:22 +0000 (UTC)
Date: Thu, 6 Jul 2023 23:03:05 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
Message-ID: <ZKeqmfz8FDL1bv5j@nvishwa1-DESK>
References: <20230704210530.7721-1-niranjana.vishwanathapura@intel.com>
 <MW3PR11MB4748FD362BEFDDAAF6FF2BC7AE2FA@MW3PR11MB4748.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <MW3PR11MB4748FD362BEFDDAAF6FF2BC7AE2FA@MW3PR11MB4748.namprd11.prod.outlook.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [RFC i-g-t] tests/xe/xe_evict: Check for memory
 availability
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Hellstrom,
 Thomas" <thomas.hellstrom@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jul 05, 2023 at 03:54:27AM -0700, Kumar, Janga Rahul wrote:
>
>
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Niranjana
>> Vishwanathapura
>> Sent: 05 July 2023 02:36
>> To: igt-dev@lists.freedesktop.org
>> Cc: Hellstrom, Thomas <thomas.hellstrom@intel.com>
>> Subject: [igt-dev] [RFC i-g-t] tests/xe/xe_evict: Check for memory availability
>>
>> On systems with low system memory the subtests fail in various ways including
>> returning -ENOMEM, hanging, etc.
>> Ensure system has enough memory for the tests, otherwise skip it.
>
>Instead of skipping the tests, we can update the num_bo to fit in the available memory.

Thanks Rahul for the review.

Seems like num_bo is chosen based on vram size to exercise vram overcommit.
But there may not be enough system memory to evict all vram BOs.
Hence, we need to skip the test.

>
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  tests/xe/xe_evict.c | 42 ++++++++++++++++++++++++++++--------------
>>  1 file changed, 28 insertions(+), 14 deletions(-)
>>
>> diff --git a/tests/xe/xe_evict.c b/tests/xe/xe_evict.c index
>> 1a70f1b45..d28400f1c 100644
>> --- a/tests/xe/xe_evict.c
>> +++ b/tests/xe/xe_evict.c
>> @@ -454,6 +454,13 @@ static uint64_t calc_bo_size(uint64_t vram_size, int
>> mul, int div)
>>  	return (ALIGN(vram_size, 0x40000000)  * mul) / div;  }
>>
>> +static bool has_required_memory(uint64_t mem_size, uint64_t vram_size,
>> +				int num_bos, uint64_t bo_size)
>> +{
>> +	/* Assume 1/2 of system memory is available to use */
>> +	return (mem_size / 2 + vram_size) >= (num_bos * bo_size); }
>I think here available VRAM size for use needs to considered instead of total VRAM size.
>

The issue seems to be not the VRAM size, but the available system memory size (mem_size)
may not be enough to evict all the VRAM bos.

Niranjana

>Thanks,
>Rahul
>> +
>>  /**
>>   * SUBTEST: evict-%s
>>   * Description:  %arg[1] evict test.
>> @@ -658,12 +665,13 @@ igt_main
>>  			MIXED_THREADS | MULTI_VM | THREADED |
>> BIND_ENGINE },
>>  		{ NULL },
>>  	};
>> -	uint64_t vram_size;
>> +	uint64_t mem_size, vram_size;
>>  	int fd;
>>
>>  	igt_fixture {
>>  		fd = drm_open_driver(DRIVER_XE);
>>  		igt_require(xe_has_vram(fd));
>> +		mem_size = igt_get_total_ram_mb() << 20;
>>  		vram_size = xe_vram_size(fd, 0);
>>  		igt_assert(vram_size);
>>
>> @@ -673,25 +681,31 @@ igt_main
>>  	}
>>
>>  	for (const struct section *s = sections; s->name; s++) {
>> -		igt_subtest_f("evict-%s", s->name)
>> -			test_evict(-1, hwe, s->n_engines, s->n_execs,
>> -				   calc_bo_size(vram_size, s->mul, s->div),
>> -				   s->flags, NULL);
>> +		igt_subtest_f("evict-%s", s->name) {
>> +			uint64_t bo_size = calc_bo_size(vram_size, s->mul, s-
>> >div);
>> +
>> +			igt_require(has_required_memory(mem_size,
>> vram_size, s->n_execs / 2, bo_size));
>> +			test_evict(-1, hwe, s->n_engines, s->n_execs, bo_size,
>> s->flags, NULL);
>> +		}
>>  	}
>>
>>  	for (const struct section_cm *s = sections_cm; s->name; s++) {
>> -		igt_subtest_f("evict-%s", s->name)
>> -			test_evict_cm(-1, hwe, s->n_engines, s->n_execs,
>> -				      calc_bo_size(vram_size, s->mul, s->div),
>> -				      s->flags, NULL);
>> +		igt_subtest_f("evict-%s", s->name) {
>> +			uint64_t bo_size = calc_bo_size(vram_size, s->mul, s-
>> >div);
>> +
>> +			igt_require(has_required_memory(mem_size,
>> vram_size, s->n_execs / 2, bo_size));
>> +			test_evict(-1, hwe, s->n_engines, s->n_execs, bo_size,
>> s->flags, NULL);
>> +		}
>>  	}
>>
>>  	for (const struct section_threads *s = sections_threads; s->name; s++) {
>> -		igt_subtest_f("evict-%s", s->name)
>> -			threads(-1, hwe, s->n_threads, s->n_engines,
>> -				 s->n_execs,
>> -				 calc_bo_size(vram_size, s->mul, s->div),
>> -				 s->flags);
>> +		igt_subtest_f("evict-%s", s->name) {
>> +			uint64_t bo_size = calc_bo_size(vram_size, s->mul, s-
>> >div);
>> +
>> +			igt_require(has_required_memory(mem_size,
>> vram_size,
>> +							s->n_threads * (s-
>> >n_execs / 2), bo_size));
>> +			threads(-1, hwe, s->n_threads, s->n_engines, s-
>> >n_execs, bo_size, s->flags);
>> +		}
>>  	}
>>
>>  	igt_fixture
>> --
>> 2.21.0.rc0.32.g243a4c7e27
>
