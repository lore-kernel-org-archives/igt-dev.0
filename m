Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3010410E239
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 14:01:43 +0000 (UTC)
Date: Thu, 30 Nov 2023 15:01:14 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231130140114.usu5r6grr74rpkr6@kamilkon-desk.igk.intel.com>
References: <20231017125428.607100-1-marcin.bernatowicz@linux.intel.com>
 <169757011230.14379.7167114649167668325@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <169757011230.14379.7167114649167668325@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSAgZm9yIGxpYi9k?=
 =?utf-8?q?rmtest=2Eh=3A_make_ALIGN_work_with_uint64=5Ft_values?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: lgci.bug.filing@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

below regressions were unrelated to change,
no need for respining tests.

Regards,
Kamil

On 2023-10-17 at 19:15:12 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/drmtest.h: make ALIGN work with uint64_t values
> URL   : https://patchwork.freedesktop.org/series/125235/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7543_full -> IGTPW_10017_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10017_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10017_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10017/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   Additional (1): shard-rkl0 
>   Missing    (1): shard-tglu0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10017_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_parallel@contexts@vcs0:
>     - shard-tglu:         NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10017/shard-tglu-9/igt@gem_exec_parallel@contexts@vcs0.html
> 
>   * igt@kms_psr@psr2_sprite_render:
>     - shard-mtlp:         [PASS][2] -> [FAIL][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7543/shard-mtlp-4/igt@kms_psr@psr2_sprite_render.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10017/shard-mtlp-8/igt@kms_psr@psr2_sprite_render.html
> 
>   * igt@sw_sync@sync_busy_fork:
>     - shard-tglu:         [PASS][4] -> [INCOMPLETE][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7543/shard-tglu-3/igt@sw_sync@sync_busy_fork.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10017/shard-tglu-7/igt@sw_sync@sync_busy_fork.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-snb:          [DMESG-WARN][6] ([i915#8841]) -> [INCOMPLETE][7]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7543/shard-snb1/igt@i915_suspend@basic-s3-without-i915.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10017/shard-snb1/igt@i915_suspend@basic-s3-without-i915.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10017_full that come from known issues:
> 

[...cut...]

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7543 -> IGTPW_10017
> 
>   CI-20190529: 20190529
>   CI_DRM_13765: 201c8a7bd1f3f415920a2df4b8a8817e973f42fe @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10017: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10017/index.html
>   IGT_7543: 688f12831f876590e084e9b13b4d5ab85fe13d51 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10017/index.html
