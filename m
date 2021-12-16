Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFCB112421
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Dec 2021 06:35:52 +0000 (UTC)
Date: Thu, 16 Dec 2021 08:35:10 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YbreHoq9/14yCQCL@platvala-desk.ger.corp.intel.com>
References: <20211215103506.17273-1-petri.latvala@intel.com>
 <163957608713.18075.11111011809903076679@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163957608713.18075.11111011809903076679@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fcore=3A_Ensure_subtest_result_is_skip_if_all_dynamic_subtes?=
 =?utf-8?q?ts_skip?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Dec 15, 2021 at 01:48:07PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_core: Ensure subtest result is skip if all dynamic subtests skip
> URL   : https://patchwork.freedesktop.org/series/98053/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_6309_full -> IGTPW_6496_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_6496_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_6496_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6496/index.html
> 
> Participating hosts (7 -> 7)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_6496_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_endless@dispatch@vcs1:
>     - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6309/shard-tglb7/igt@gem_exec_endless@dispatch@vcs1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6496/shard-tglb2/igt@gem_exec_endless@dispatch@vcs1.html
> 
>   

Lakshmi, false positive here.



-- 
Petri Latvala
