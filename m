Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 4 Dec 2023 11:12:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231204101241.xnmben7oks6i7anr@kamilkon-desk.igk.intel.com>
References: <20231201132706.84787-1-mwen@igalia.com>
 <170156650294.25279.2916285420244157981@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170156650294.25279.2916285420244157981@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fatomic=3A_skip_mutable_zpos_test_on_non-mutable_planes?=
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

below is unrelated to kms_atomic change.

Regards,
Kamil

On 2023-12-03 at 01:21:42 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_atomic: skip mutable zpos test on non-mutable planes
> URL   : https://patchwork.freedesktop.org/series/127190/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13959_full -> IGTPW_10319_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10319_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10319_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10319/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10319_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>     - shard-mtlp:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13959/shard-mtlp-8/igt@i915_selftest@live@gt_heartbeat.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10319/shard-mtlp-4/igt@i915_selftest@live@gt_heartbeat.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10319/shard-glk7/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10319_full that come from known issues:
> 
> ### IGT changes ###

[...cut...]
