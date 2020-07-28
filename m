Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61107896E9
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2020 15:34:15 +0000 (UTC)
Date: Tue, 28 Jul 2020 18:34:12 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200728153412.GG20883@platvala-desk.ger.corp.intel.com>
References: <20200728073359.15807-1-petri.latvala@intel.com>
 <159594990331.21869.129691479426691033@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159594990331.21869.129691479426691033@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgYXV0b3Rv?=
 =?utf-8?q?ols=3A_Remove_=24=28HANG=29_handling?=
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
To: igt-dev@lists.freedesktop.org, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jul 28, 2020 at 03:25:03PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: autotools: Remove $(HANG) handling
> URL   : https://patchwork.freedesktop.org/series/79966/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8800_full -> IGTPW_4809_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4809_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4809_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4809_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-tglb:         [PASS][1] -> [INCOMPLETE][2] +6 similar issues
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb3/igt@i915_module_load@reload-with-fault-injection.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-tglb2/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@hdmi-a-1-pipe-a:
>     - shard-glk:          [PASS][3] -> [INCOMPLETE][4] +2 similar issues
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-glk3/igt@kms_atomic_transition@plane-all-modeset-transition@hdmi-a-1-pipe-a.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-glk8/igt@kms_atomic_transition@plane-all-modeset-transition@hdmi-a-1-pipe-a.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-glk9/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_flip@nonexisting-fb-interruptible@a-edp1:
>     - shard-iclb:         [PASS][6] -> [INCOMPLETE][7] +2 similar issues
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-iclb6/igt@kms_flip@nonexisting-fb-interruptible@a-edp1.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-iclb7/igt@kms_flip@nonexisting-fb-interruptible@a-edp1.html
> 
>   * igt@kms_flip@nonexisting-fb@b-dp1:
>     - shard-kbl:          [PASS][8] -> [INCOMPLETE][9] +1 similar issue
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-kbl6/igt@kms_flip@nonexisting-fb@b-dp1.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-kbl7/igt@kms_flip@nonexisting-fb@b-dp1.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
>     - shard-tglb:         NOTRUN -> [INCOMPLETE][10] +1 similar issue
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
> 


Lakshmi, all of the above are false failures.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
