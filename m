Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4460A6FB9F
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 17:07:49 +0000 (UTC)
References: <20200131003915.2563-1-antonio.argenziano@intel.com>
 <87k1585hle.wl-ashutosh.dixit@intel.com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <2ebabb8f-7769-8343-b007-1d45e712bb2b@intel.com>
Date: Fri, 31 Jan 2020 09:07:48 -0800
MIME-Version: 1.0
In-Reply-To: <87k1585hle.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_sseu: Skip gtt tests
 if mappable aperture unavailable
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>



On 30/01/20 21:18, Dixit, Ashutosh wrote:
> On Thu, 30 Jan 2020 16:39:15 -0800, Antonio Argenziano wrote:
>>
>> The gtt tests try to verify that a gtt mapped area can be used as an
>> sseu pointer so it wouldn't make sense to run those when gtt mapping is
>> not available.
>>
>> Signed-off-by: Antonio Argenziano <antonio.argenziano@intel.com>
>> ---
>>   tests/i915/gem_ctx_sseu.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/tests/i915/gem_ctx_sseu.c b/tests/i915/gem_ctx_sseu.c
>> index 38dc584b..8b014b30 100644
>> --- a/tests/i915/gem_ctx_sseu.c
>> +++ b/tests/i915/gem_ctx_sseu.c
>> @@ -374,6 +374,8 @@ test_ggtt_args(int fd)
>> 	};
>> 	uint32_t bo;
>>
>> +	gem_require_mappable_ggtt(fd);
>> +
>> 	bo = gem_create(fd, 4096);
>> 	arg.value = to_user_pointer(gem_mmap__gtt(fd, bo, 4096,
>> 						  PROT_READ | PROT_WRITE));
>> --
>> 2.21.0
> 
> Assuming no issues of memory leaks here:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> Otherwise this is better?

No strong preference for me.

Antonio

> 
> diff --git a/tests/i915/gem_ctx_sseu.c b/tests/i915/gem_ctx_sseu.c
> index 38dc584bc..2add20c97 100644
> --- a/tests/i915/gem_ctx_sseu.c
> +++ b/tests/i915/gem_ctx_sseu.c
> @@ -528,8 +528,10 @@ igt_main
>                  igt_subtest("invalid-sseu")
>                          test_invalid_sseu(fd);
> 
> -               igt_subtest("ggtt-args")
> +               igt_subtest("ggtt-args") {
> +                       gem_require_mappable_ggtt(fd);
>                          test_ggtt_args(fd);
> +               }
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
