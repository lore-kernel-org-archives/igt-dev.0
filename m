Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A8610E3FA
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 07:29:43 +0000 (UTC)
Date: Tue, 14 Nov 2023 08:29:38 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231114072938.ct54nzaqcwmbjxra@zkempczy-mobl2>
References: <20231107144803.165466-1-zbigniew.kempczynski@intel.com>
 <169942825252.24272.9217931041188182671@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169942825252.24272.9217931041188182671@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIGRn?=
 =?utf-8?q?1_compute_pipeline?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Nov 08, 2023 at 07:24:12AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add dg1 compute pipeline                                        
>    URL:     https://patchwork.freedesktop.org/series/126077/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10130/index.html 
> 
>         CI Bug Log - changes from CI_DRM_13846_full -> IGTPW_10130_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_10130_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_10130_full, please notify your bug team
>    (lgci.bug.filing@intel.com) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10130/index.html
> 
> Participating hosts (9 -> 11)
> 
>    Additional (2): shard-mtlp0 shard-rkl0
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_10130_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@i915_pm_rc6_residency@rc6-accuracy:
>           * shard-dg2: NOTRUN -> FAIL

Unrelated to above regression.

> 
> Known issues
> 
>    Here are the changes found in IGTPW_10130_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit

<cut>
>      * {igt@gem_compute@compute-square}:
> 
>           * shard-dg1: SKIP (i915#9310) -> PASS

This patch fixes above skip.

--
Zbigniew

