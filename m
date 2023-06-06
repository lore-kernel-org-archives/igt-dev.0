Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9AB10E37B
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jun 2023 16:38:31 +0000 (UTC)
Date: Tue, 6 Jun 2023 18:38:06 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230606163806.eb6vqbdnbb6bgauu@zkempczy-mobl2>
References: <20230606123741.72759-1-zbigniew.kempczynski@intel.com>
 <168605991234.22671.13438817053113387800@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168605991234.22671.13438817053113387800@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgIHRlc3Rz?=
 =?utf-8?q?/xe=5Fcreate=3A_Add_multiple_engines_create/destroy_subtest?=
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

On Tue, Jun 06, 2023 at 01:58:32PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/xe_create: Add multiple engines create/destroy subtest   
>    URL:     https://patchwork.freedesktop.org/series/118931/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9117/index.html 
> 
>               CI Bug Log - changes from CI_DRM_13236 -> IGTPW_9117
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_9117 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_9117, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9117/index.html
> 
> Participating hosts (41 -> 40)
> 
>    Missing (1): fi-snb-2520m
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_9117:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@i915_suspend@basic-s3-without-i915:
>           * fi-apl-guc: PASS -> ABORT

Unrelated to this failure. May I ask for resume?

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_9117 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_exec_suspend@basic-s0@smem:
> 
>           * fi-skl-6600u: PASS -> ABORT (i915#5122)
>      * igt@i915_selftest@live@gt_lrc:
> 
>           * bat-dg2-11: PASS -> INCOMPLETE (i915#7609 / i915#7913)
>      * igt@i915_selftest@live@guc:
> 
>           * bat-rpls-1: NOTRUN -> DMESG-WARN (i915#7852)
>      * igt@i915_selftest@live@slpc:
> 
>           * bat-rpls-1: NOTRUN -> DMESG-WARN (i915#6367)
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * bat-rpls-1: NOTRUN -> ABORT (i915#6687 / i915#7978)
>      * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#1845 / i915#5354) +1 similar
>             issue
>      * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1:
> 
>           * bat-dg2-8: PASS -> FAIL (i915#7932)
> 
>     Possible fixes
> 
>      * igt@i915_selftest@live@gt_mocs:
> 
>           * {bat-mtlp-8}: DMESG-FAIL (i915#7059) -> PASS
>      * igt@i915_selftest@live@requests:
> 
>           * bat-rpls-1: ABORT (i915#7911 / i915#7920 / i915#7982) -> PASS
>      * {igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-dp-5}:
> 
>           * {bat-adlp-11}: FAIL -> PASS
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7320 -> IGTPW_9117
> 
>    CI-20190529: 20190529
>    CI_DRM_13236: 6ef9ba991d96572648aa75eb7818d8c111f2eb4f @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_9117: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9117/index.html
>    IGT_7320: 1c96b08a4cde6f2d49824a8cc3303bd860617b52 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> Testlist changes
> 
>    +igt@xe_create@create-engines-leak
>    +igt@xe_create@create-engines-noleak
