Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF85C10E038
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jun 2023 11:12:35 +0000 (UTC)
Date: Fri, 23 Jun 2023 13:12:15 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230623111215.lffhv44nz6s3545l@zkempczy-mobl2>
References: <20230623084635.350402-1-zbigniew.kempczynski@intel.com>
 <168751656798.31832.2540077072662800407@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168751656798.31832.2540077072662800407@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2lu?=
 =?utf-8?q?tel=5Fblt=3A_Prepare_blt_library_to_support_xe?=
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

On Fri, Jun 23, 2023 at 10:36:07AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/intel_blt: Prepare blt library to support xe               
>    URL:     https://patchwork.freedesktop.org/series/119792/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9245/index.html 
> 
>               CI Bug Log - changes from CI_DRM_13312 -> IGTPW_9245
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_9245 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_9245, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9245/index.html
> 
> Participating hosts (41 -> 41)
> 
>    Additional (1): bat-dg1-8
>    Missing (1): fi-snb-2520m
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_9245:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@i915_selftest@live@gtt:
>           * bat-atsm-1: PASS -> INCOMPLETE

Change doesn't touch the above.

--
Zbigniew

> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * {igt@xe_create@create-massive-size}:
>           * {bat-dg1-8}: NOTRUN -> FAIL +2 similar issues
> 
> Known issues
> 
>    Here are the changes found in IGTPW_9245 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@debugfs_test@basic-hwmon:
> 
>           * bat-adlp-11: NOTRUN -> SKIP (i915#7456)
>      * igt@gem_tiled_pread_basic:
> 
>           * bat-adlp-11: NOTRUN -> SKIP (i915#3282)
>      * igt@i915_selftest@live@gt_mocs:
> 
>           * bat-mtlp-8: PASS -> DMESG-FAIL (i915#7059)
> 
>           * bat-mtlp-6: PASS -> DMESG-FAIL (i915#7059)
> 
>      * igt@i915_selftest@live@guc:
> 
>           * bat-rpls-2: NOTRUN -> DMESG-WARN (i915#7852)
>      * igt@i915_selftest@live@slpc:
> 
>           * bat-mtlp-6: PASS -> DMESG-WARN (i915#6367)
> 
>           * bat-rpls-2: NOTRUN -> DMESG-WARN (i915#6367)
> 
>      * igt@i915_suspend@basic-s2idle-without-i915:
> 
>           * bat-rpls-2: NOTRUN -> ABORT (i915#6687 / i915#8668)
>      * igt@kms_chamelium_frames@hdmi-crc-fast:
> 
>           * bat-adlp-11: NOTRUN -> SKIP (i915#7828) +7 similar issues
>      * igt@kms_chamelium_hpd@common-hpd-after-suspend:
> 
>           * bat-adlm-1: NOTRUN -> SKIP (i915#7828)
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * bat-adlp-11: NOTRUN -> SKIP (i915#3546)
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>           * bat-adlp-11: NOTRUN -> SKIP (i915#4103)
>      * igt@kms_flip@basic-plain-flip@d-dp6:
> 
>           * bat-adlp-11: NOTRUN -> ABORT (i915#4423)
>      * igt@kms_pipe_crc_basic@suspend-read-crc:
> 
>           * bat-adlm-1: NOTRUN -> SKIP (i915#1845)
> 
>     Possible fixes
> 
>      * igt@dmabuf@all-tests@dma_fence:
> 
>           * bat-adlm-1: DMESG-FAIL (i915#8189) -> PASS
>      * igt@dmabuf@all-tests@sanitycheck:
> 
>           * bat-adlm-1: ABORT (i915#8423) -> PASS
>      * igt@gem_exec_suspend@basic-s0@smem:
> 
>           * fi-rkl-11600: FAIL (fdo#103375 / i915#8011) -> PASS
>      * igt@i915_module_load@load:
> 
>           * bat-adlp-11: ABORT (i915#4423) -> PASS
>      * igt@i915_selftest@live@migrate:
> 
>           * bat-mtlp-8: DMESG-FAIL (i915#7699) -> PASS
>      * igt@i915_selftest@live@requests:
> 
>           * bat-mtlp-8: DMESG-FAIL (i915#8497) -> PASS
> 
>           * bat-rpls-2: ABORT (i915#4983 / i915#7913) -> PASS
> 
>      * igt@i915_selftest@live@slpc:
> 
>           * bat-rpls-1: DMESG-WARN (i915#6367) -> PASS
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7347 -> IGTPW_9245
> 
>    CI-20190529: 20190529
>    CI_DRM_13312: 08d15de81b3b0db3c9046d2556c10b9f136cc90f @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_9245: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9245/index.html
>    IGT_7347: 621c2d3115d40a1ba0b53668413ea21edf03a5ff @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
