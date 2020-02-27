Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667EC898C0
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2020 11:38:57 +0000 (UTC)
References: <20200220125207.16423-1-petri.latvala@intel.com>
 <20200220125207.16423-2-petri.latvala@intel.com>
From: Martin Peres <martin.peres@linux.intel.com>
Message-ID: <cd539f54-df4c-a5f4-67b6-22c2b760bf70@linux.intel.com>
Date: Thu, 27 Feb 2020 13:38:52 +0200
MIME-Version: 1.0
In-Reply-To: <20200220125207.16423-2-petri.latvala@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] intel-ci: Kernel selftest changes
 to fast-feedback and blacklist
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-02-20 14:52, Petri Latvala wrote:
> Now that selftest launchers are enumerable, we can control them with
> fast-feedback.testlist and blacklist.txt. For now, apply the status
> quo.

This patch series will end up being a no-op on Intel CI since we were
appending the selftests as part of BAT testing. With this change done,
CI will be able to drop this extra test list, and simplify execution.

I renamed the tests in cibuglog, so this patch series is:

Acked-by: Martin Peres <martin.peres@linux.intel.com>

And it is ready to merge from my PoV.

Martin
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>
> ---
>  tests/intel-ci/blacklist.txt          | 5 -----
>  tests/intel-ci/fast-feedback.testlist | 4 ++++
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index 51d0417c..390e4fa0 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -1,10 +1,5 @@
>  igt@meta_test(@.*)?
>  ###############################################
> -# Kernel selftests (run separately)
> -###############################################
> -igt@i915_selftest(@.*)?
> -igt@drm_mm(@.*)?
> -###############################################
>  # Handle module reloads with great care!
>  #
>  # Reloading a module is more likely to leave
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index 1b00485e..b41fb4a0 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -171,3 +171,7 @@ igt@vgem_basic@sysfs
>  igt@vgem_basic@unload
>  igt@i915_module_load@reload
>  igt@i915_pm_rpm@module-reload
> +
> +# Kernel selftests
> +igt@i915_selftest@live
> +igt@dmabuf@all
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
