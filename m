Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3779F6E106
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2020 09:14:42 +0000 (UTC)
Date: Wed, 22 Apr 2020 12:14:39 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200422091439.GH9497@platvala-desk.ger.corp.intel.com>
References: <20200422081011.3523086-1-chris@chris-wilson.co.uk>
 <158754636599.5178.16440643637234646417@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158754636599.5178.16440643637234646417@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9p?=
 =?utf-8?q?915=5Fpm=5Frpm=3A_Split_the_planes_into_dynamic_subtests_=28rev?=
 =?utf-8?q?2=29?=
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 22, 2020 at 09:06:05AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: i915/i915_pm_rpm: Split the planes into dynamic subtests (rev2)
> URL   : https://patchwork.freedesktop.org/series/76311/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8347 -> IGTPW_4498
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4498 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4498, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4498/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4498:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@ring_submission:
>     - fi-ivb-3770:        [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8347/fi-ivb-3770/igt@i915_selftest@live@ring_submission.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4498/fi-ivb-3770/igt@i915_selftest@live@ring_submission.html
> 


Lakshmi, false positive here.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
