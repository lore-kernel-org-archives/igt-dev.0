Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 14 Dec 2023 18:53:43 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 meson.sh: add setup option for meson
Message-ID: <20231214175343.ndm4qb5b4pwsvunp@kamilkon-desk.igk.intel.com>
References: <20231214145530.78479-1-kamil.konieczny@linux.intel.com>
 <170257431182.19959.5885194350043504558@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170257431182.19959.5885194350043504558@emeril.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: lgci.bug.filing@intel.com, I915-ci-infra@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2023-12-14 at 17:18:31 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: meson.sh: add setup option for meson
> URL   : https://patchwork.freedesktop.org/series/127812/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7642_full -> IGTPW_10419_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10419_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10419_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10419/index.html
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10419_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_ctx_freq@sysfs:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10419/shard-glk6/igt@gem_ctx_freq@sysfs.html
> 
>   * igt@gem_ctx_freq@sysfs@gt0:
>     - shard-tglu:         NOTRUN -> [INCOMPLETE][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10419/shard-tglu-4/igt@gem_ctx_freq@sysfs@gt0.html
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10419/shard-rkl-4/igt@gem_ctx_freq@sysfs@gt0.html
>     - shard-dg1:          NOTRUN -> [INCOMPLETE][4]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10419/shard-dg1-17/igt@gem_ctx_freq@sysfs@gt0.html
> 
>   * igt@i915_power@sanity:
>     - shard-snb:          NOTRUN -> [INCOMPLETE][5] +1 other test incomplete
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10419/shard-snb5/igt@i915_power@sanity.html
> 

This is unrelated to change in meson.sh script,

Regards,
Kamil

[...cut...]

> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7642 -> IGTPW_10419
> 
>   CI-20190529: 20190529
>   CI_DRM_14021: 3358bace1b70e41bca852449df50287d5de0d446 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10419: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10419/index.html
>   IGT_7642: 071c380aa0f7332c8b48653c818c500d01e94a53 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10419/index.html
