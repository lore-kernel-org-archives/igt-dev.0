Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983E86E3CE
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2020 10:17:52 +0000 (UTC)
Date: Mon, 16 Mar 2020 12:10:47 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200316101047.wcmjhzrmnls6ugsy@ahiler-desk1.fi.intel.com>
References: <20200313152911.580802-1-arkadiusz.hiler@intel.com>
 <158411617600.30350.11856992595631414910@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158411617600.30350.11856992595631414910@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/intel-ci/blacklist=3A_Bl?=
 =?utf-8?q?acklist_kms=5Fchamelium=40hdmi-*-planes-random?=
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

On Fri, Mar 13, 2020 at 04:16:16PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,1/2] tests/intel-ci/blacklist: Blacklist kms_chamelium@hdmi-*-planes-random
> URL   : https://patchwork.freedesktop.org/series/74684/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8134 -> IGTPW_4302
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4302 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4302, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4302:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@ring_submission:
>     - fi-bwr-2160:        NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/fi-bwr-2160/igt@i915_selftest@live@ring_submission.html

We are removing some chamelium tests with this series, so this failure
is not related.

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
