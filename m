Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3FE6E0DF
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Feb 2020 12:53:26 +0000 (UTC)
References: <20200204114837.887623-1-chris@chris-wilson.co.uk>
From: Martin Peres <martin.peres@linux.intel.com>
Message-ID: <e86bbe9a-a638-3fa4-9cb6-4eb1ba7f73d2@linux.intel.com>
Date: Tue, 4 Feb 2020 14:53:21 +0200
MIME-Version: 1.0
In-Reply-To: <20200204114837.887623-1-chris@chris-wilson.co.uk>
Content-Language: en-PH
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci: Delegate exhaustive
 fault-injection to the idle runs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 04/02/2020 13:48, Chris Wilson wrote:
> i915_module_reload/fault-injection is valuable for its exhaustive trawl
> through (hopefully) every path that hits i915_probe_error, unfortunately
> such thoroughness comes at a cost. On kbl-guc, it takes almost 3minutes,
> and on tgl-y takes over 4 minutes, which is unacceptable for BAT, so leave
> it to the shards and idle runs to catch unusual errors on module load.
> 
> v2: remove blacklisting to allow module-reload in shards.
> 
> Tomi prefers not to have to manually create a runlist for the idle-runs,
> so let's take a risk by allowing the module-reload within the shards.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Martin Peres <martin.peres@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>

I think this is the right call! Thanks for doing it :)

Acked-by: Martin Peres <martin.peres@linux.intel.com>

Martin

> ---
>  tests/intel-ci/blacklist.txt          | 2 +-
>  tests/intel-ci/fast-feedback.testlist | 2 --
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index 723f24457..181c8cd5f 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -12,7 +12,7 @@ igt@drm_mm(@.*)?
>  # self-contained tests, leading to random
>  # failures in tests run afterwards.
>  ###############################################
> -igt@i915_module_load(@.*)?
> +#igt@i915_module_load(@.*)? # danger, danger; hope for taints!
>  igt@i915_pm_rpm@module-reload
>  igt@i915_pm_rpm@gem-execbuf-stress-extra-wait
>  ###############################################
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index 40d273c1d..467e11267 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -172,6 +172,4 @@ igt@vgem_basic@sysfs
>  
>  igt@vgem_basic@unload
>  igt@i915_module_load@reload
> -igt@i915_module_load@reload-no-display
> -igt@i915_module_load@reload-with-fault-injection
>  igt@i915_pm_rpm@module-reload
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
