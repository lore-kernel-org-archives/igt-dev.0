Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 14 Dec 2023 18:52:27 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for Two
 fixes for meson.sh script
Message-ID: <20231214175227.tnptuwc2u4zfczi6@kamilkon-desk.igk.intel.com>
References: <20231214161511.81153-1-kamil.konieczny@linux.intel.com>
 <170257522185.19959.4127514241779331342@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170257522185.19959.4127514241779331342@emeril.freedesktop.org>
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

On 2023-12-14 at 17:33:41 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Two fixes for meson.sh script
> URL   : https://patchwork.freedesktop.org/series/127817/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7642 -> IGTPW_10421
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10421 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10421, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10421/index.html
> 
> Participating hosts (38 -> 37)
> ------------------------------
> 
>   Additional (1): bat-dg2-9 
>   Missing    (2): bat-rpls-2 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10421:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@vgem_basic@unload:
>     - fi-apl-guc:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7642/fi-apl-guc/igt@vgem_basic@unload.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10421/fi-apl-guc/igt@vgem_basic@unload.html
> 

This is unrelated to change in meson.sh script.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10421 that come from known issues:
> 
> ### IGT changes ###
> 

[...cut...]

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7642 -> IGTPW_10421
> 
>   CI-20190529: 20190529
>   CI_DRM_14021: 3358bace1b70e41bca852449df50287d5de0d446 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10421: 10421
>   IGT_7642: 071c380aa0f7332c8b48653c818c500d01e94a53 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10421/index.html
