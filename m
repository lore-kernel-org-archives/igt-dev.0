Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB9010E8EA
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 17:35:30 +0000 (UTC)
Message-ID: <f09a03dc-f488-a931-3ee9-5a37f9d99569@intel.com>
Date: Thu, 9 Nov 2023 17:35:06 +0000
MIME-Version: 1.0
Content-Language: en-GB
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231109171554.313952-1-zbigniew.kempczynski@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20231109171554.313952-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe_evict_ccs: Disable compression
 on platforms without flatccs
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

On 09/11/2023 17:15, Zbigniew Kempczyński wrote:
> Platforms like PVC don't use flatccs compression so on them exercise
> eviction only. Rename all subtests and remove "-ccs-" part in it.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>

Curious to see what PVC says with this,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

It's a bit funny having a test called xe_evict_ccs which doesn't use 
ccs? I guess skipping would be another option, but then again these 
tests have proven to be really good at finding general eviction bugs so 
that would be quite a loss of coverage on platforms like PVC. Do we need 
to marry together xe_evict and xe_evict_ccs, possibility extracting a 
couple more testcases from xe_evict_ccs that turn off compression and 
can be made part of xe_evict, or perhaps moving xe_evict into here somehow?

> ---
>   tests/intel-ci/xe-fast-feedback.testlist |  4 ++--
>   tests/intel/xe_evict_ccs.c               | 17 ++++++++++++-----
>   2 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index f11761ac85..e9ff5cb4fe 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -26,8 +26,8 @@ igt@xe_evict@evict-small-external-cm
>   igt@xe_evict@evict-small-multi-vm
>   igt@xe_evict@evict-small-multi-vm-cm
>   igt@xe_evict@evict-threads-small
> -igt@xe_evict_ccs@evict-ccs-overcommit-simple
> -igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd
> +igt@xe_evict_ccs@evict-overcommit-simple
> +igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd
>   igt@xe_exec_balancer@twice-virtual-basic
>   igt@xe_exec_balancer@no-exec-virtual-basic
>   igt@xe_exec_balancer@twice-cm-virtual-basic
> diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
> index 4f2876ecb2..8a98aae8f3 100644
> --- a/tests/intel/xe_evict_ccs.c
> +++ b/tests/intel/xe_evict_ccs.c
> @@ -380,15 +380,15 @@ static void evict_ccs(int fd, uint32_t flags, const struct param *param)
>   
>   /**
>    *
> - * SUBTEST: evict-ccs-overcommit-simple
> - * Description: FlatCCS eviction test.
> + * SUBTEST: evict-overcommit-simple
> + * Description: Eviction test - exercises FlatCCS if possible.
>    * Feature: flatccs
>    * Test category: stress test
>    */
>   /**
>    *
> - * SUBTEST: evict-ccs-overcommit-%s-%s-%s
> - * Description: FlatCCS eviction test.
> + * SUBTEST: evict-overcommit-%s-%s-%s
> + * Description: Eviction test - exercises FlatCCS if possible.
>    * Feature: flatccs
>    * Test category: stress test
>    *
> @@ -490,6 +490,7 @@ igt_main_args("bdDn:p:s:S:V", NULL, help_str, opt_handler, NULL)
>   		{ },
>   	};
>   	uint64_t vram_size;
> +	bool has_flatccs;
>   	int fd;
>   
>   	igt_fixture {
> @@ -497,14 +498,20 @@ igt_main_args("bdDn:p:s:S:V", NULL, help_str, opt_handler, NULL)
>   		igt_require(xe_has_vram(fd));
>   		vram_size = xe_visible_vram_size(fd, 0);
>   		igt_assert(vram_size);
> +		has_flatccs = HAS_FLATCCS(intel_get_drm_devid(fd));
>   	}
>   
>   	igt_fixture
>   		intel_allocator_multiprocess_start();
>   
>   	for (const struct ccs *s = ccs; s->name; s++) {
> -		igt_subtest_f("evict-ccs-overcommit-%s", s->name)
> +		igt_subtest_f("evict-overcommit-%s", s->name) {
> +			if (!params.disable_compression && !has_flatccs) {
> +				igt_info("Device has no flatccs, disabling compression\n");
> +				params.disable_compression = true;
> +			}
>   			evict_ccs(fd, s->flags, &params);
> +		}
>   	}
>   
>   	igt_fixture {
