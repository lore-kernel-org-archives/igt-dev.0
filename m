Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7536E207
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2020 12:33:29 +0000 (UTC)
Date: Tue, 5 May 2020 15:33:25 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200505123325.io6gbbrmeohsdtin@ahiler-desk1.fi.intel.com>
References: <20200504112623.285610-1-arkadiusz.hiler@intel.com>
 <158862803206.5817.10052975495255112826@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158862803206.5817.10052975495255112826@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=5D_lib/igt=5Fcore=3A__Make_assert?=
 =?utf-8?q?_on_invalid_magic_blocks_nesting_more_verbose?=
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
To: igt-dev@lists.freedesktop.org
Cc: Lakshmi <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, May 04, 2020 at 09:33:52PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,1/3] lib/igt_core: Make assert on invalid magic blocks nesting more verbose
> URL   : https://patchwork.freedesktop.org/series/76900/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8417_full -> IGTPW_4529_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4529_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4529_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4529_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_ctx_persistence@engines-hostile@bcs0:
>     - shard-kbl:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8417/shard-kbl7/igt@gem_ctx_persistence@engines-hostile@bcs0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4529/shard-kbl6/igt@gem_ctx_persistence@engines-hostile@bcs0.html

Unrelated GEM failure. No need for re-reporting, the patch is already merged.
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
