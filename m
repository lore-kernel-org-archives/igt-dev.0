Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACA66E4DE
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2020 13:31:11 +0000 (UTC)
Date: Tue, 14 Apr 2020 16:31:07 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200414133107.l2ellrxszmiskyuo@ahiler-desk1.fi.intel.com>
References: <20200414081447.1451675-1-arkadiusz.hiler@intel.com>
 <158687082382.30377.4522458170885477400@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158687082382.30377.4522458170885477400@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=5D_test/kms=5Fchamelium=3A_Start_?=
 =?utf-8?q?with_disabling_modeset?=
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

On Tue, Apr 14, 2020 at 01:27:03PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,1/3] test/kms_chamelium: Start with disabling modeset
> URL   : https://patchwork.freedesktop.org/series/75910/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8294 -> IGTPW_4455
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4455 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4455, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4455/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4455:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gt_contexts:
>     - fi-bwr-2160:        [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/fi-bwr-2160/igt@i915_selftest@live@gt_contexts.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4455/fi-bwr-2160/igt@i915_selftest@live@gt_contexts.html


Hey Lakshmi,

This is a selftest failure that is not related to this change.

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
