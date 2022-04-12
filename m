Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB91410E744
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Apr 2022 11:55:51 +0000 (UTC)
Date: Tue, 12 Apr 2022 14:55:44 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <YlVowJW3h0iVFl+t@platvala-desk.ger.corp.intel.com>
References: <20220412104616.1669124-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412104616.1669124-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [PATCH] intel-ci: Drop
 kms_setmode@basic-clone-single-crtc from BAT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Apr 12, 2022 at 04:16:16PM +0530, Bhanuprakash Modem wrote:
> Remove subtest "kms_setmode@basic-clone-single-crtc" from the
> BAT test-list as most BAT systems are having single display
> only and this subtest requires a multi-display configuration.
> 
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

True, there's only fi-snb-2600 that has non-skips on this test. But
wouldn't it be better to request more multi-display configs in the BAT
farm?

From what I can see, removing this test from fast-feedback gains under
2 seconds of runtime on said fi-snb-2600, 0.001s on the other
platforms. What's the real gain here?


-- 
Petri Latvala


> ---
>  tests/intel-ci/fast-feedback.testlist | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index f6329708..0f980319 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -133,7 +133,6 @@ igt@kms_psr@primary_page_flip
>  igt@kms_psr@cursor_plane_move
>  igt@kms_psr@sprite_plane_onoff
>  igt@kms_psr@primary_mmap_gtt
> -igt@kms_setmode@basic-clone-single-crtc
>  igt@i915_pm_backlight@basic-brightness
>  igt@i915_pm_rpm@basic-pci-d3-state
>  igt@i915_pm_rpm@basic-rte
> -- 
> 2.35.1
> 
