Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A3B10E029
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jul 2023 04:28:16 +0000 (UTC)
Date: Thu, 20 Jul 2023 06:28:13 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230720042813.qehjklumku367fje@zkempczy-mobl2>
References: <20230719153619.841459-1-zbigniew.kempczynski@intel.com>
 <168979707835.20708.11566588933368665671@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168979707835.20708.11566588933368665671@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgIHRlc3Rz?=
 =?utf-8?q?/gem=5F*=3A_Migrate_allocator_start/stop_to_fixtures_=28rev4=29?=
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

On Wed, Jul 19, 2023 at 08:04:38PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/gem_*: Migrate allocator start/stop to fixtures (rev4)   
>    URL:     https://patchwork.freedesktop.org/series/120968/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9437/index.html 
> 
>               CI Bug Log - changes from CI_DRM_13396 -> IGTPW_9437
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_9437 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_9437, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9437/index.html
> 
> Participating hosts (42 -> 42)
> 
>    Additional (1): bat-rpls-2
>    Missing (1): fi-snb-2520m
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_9437:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@debugfs_test@read_all_entries:
>           * bat-mtlp-6: PASS -> DMESG-WARN

Unfortunately CI stucks here but this is not related to the change.
May I ask for full run?

--
Zbigniew


> 
> Known issues
> 
>    Here are the changes found in IGTPW_9437 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@debugfs_test@basic-hwmon:
> 
>           * bat-rpls-2: NOTRUN -> SKIP (i915#7456)
>      * igt@fbdev@info:
> 
>           * bat-rpls-2: NOTRUN -> SKIP (i915#1849 / i915#2582)
>      * igt@fbdev@read:
> 
>           * bat-rpls-2: NOTRUN -> SKIP (i915#2582) +3 similar issues
>      * igt@gem_exec_suspend@basic-s0@smem:
> 
>           * bat-jsl-3: PASS -> ABORT (i915#5122)
>      * igt@gem_lmem_swapping@verify-random:
> 
>           * bat-rpls-2: NOTRUN -> SKIP (i915#4613) +3 similar issues
>      * igt@gem_tiled_pread_basic:
> 
>           * bat-rpls-2: NOTRUN -> SKIP (i915#3282)
>      * igt@i915_pm_backlight@basic-brightness:
> 
>           * bat-rpls-2: NOTRUN -> SKIP (i915#7561)
>      * igt@i915_pm_rpm@basic-pci-d3-state:
> 
>           * fi-kbl-7567u: PASS -> FAIL (i915#7940)
>      * igt@i915_pm_rpm@basic-rte:
> 
>           * fi-cfl-guc: PASS -> FAIL (i915#7940)
>      * igt@i915_pm_rpm@module-reload:
> 
>           * fi-rkl-11600: PASS -> FAIL (i915#7940)
>      * igt@i915_pm_rps@basic-api:
> 
>           * bat-rpls-2: NOTRUN -> SKIP (i915#6621)
>      * igt@i915_selftest@live@gt_pm:
> 
>           * bat-rpls-2: NOTRUN -> DMESG-FAIL (i915#4258 / i915#7913)
>      * igt@i915_selftest@live@reset:
> 
>           * bat-rpls-2: NOTRUN -> ABORT (i915#4983 / i915#7461 / i915#7913 /
>             i915#7981 / i915#8347)
>      * igt@i915_selftest@live@workarounds:
> 
>           * bat-rpls-1: PASS -> DMESG-FAIL (i915#6763)
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * bat-jsl-3: PASS -> FAIL (fdo#103375)
>      * igt@kms_busy@basic:
> 
>           * bat-rpls-2: NOTRUN -> SKIP (i915#1845) +14 similar issues
>      * igt@kms_chamelium_edid@hdmi-edid-read:
> 
>           * bat-rpls-2: NOTRUN -> SKIP (i915#7828) +7 similar issues
>      * igt@kms_flip@basic-flip-vs-dpms:
> 
>           * bat-rpls-2: NOTRUN -> SKIP (i915#3637) +3 similar issues
>      * igt@kms_force_connector_basic@force-load-detect:
> 
>           * bat-rpls-2: NOTRUN -> SKIP (fdo#109285)
>      * igt@kms_frontbuffer_tracking@basic:
> 
>           * bat-rpls-2: NOTRUN -> SKIP (i915#1849)
>      * igt@kms_psr@sprite_plane_onoff:
> 
>           * bat-rpls-2: NOTRUN -> SKIP (i915#1072) +3 similar issues
>      * igt@kms_setmode@basic-clone-single-crtc:
> 
>           * bat-rpls-2: NOTRUN -> SKIP (i915#3555)
>      * igt@prime_vgem@basic-fence-flip:
> 
>           * bat-rpls-2: NOTRUN -> SKIP (fdo#109295 / i915#1845 / i915#3708)
>      * igt@prime_vgem@basic-write:
> 
>           * bat-rpls-2: NOTRUN -> SKIP (fdo#109295 / i915#3708) +2 similar
>             issues
> 
>     Possible fixes
> 
>      * igt@core_auth@basic-auth:
> 
>           * bat-mtlp-6: DMESG-WARN -> PASS
>      * igt@i915_pm_rpm@basic-rte:
> 
>           * fi-tgl-1115g4: FAIL (i915#7940) -> PASS
>      * igt@i915_selftest@live@gt_heartbeat:
> 
>           * fi-glk-j4005: DMESG-FAIL (i915#5334) -> PASS
>      * igt@i915_selftest@live@guc:
> 
>           * bat-rpls-1: DMESG-WARN (i915#7852) -> PASS
> 
>     Warnings
> 
>      * igt@i915_pm_rpm@basic-pci-d3-state:
> 
>           * fi-cfl-guc: FAIL (i915#7691) -> FAIL (i915#7940)
> 
>           * fi-skl-guc: FAIL (i915#7940) -> FAIL (i915#7691)
> 
>      * igt@i915_selftest@live@requests:
> 
>           * bat-mtlp-6: DMESG-WARN -> ABORT (i915#7982)
>      * igt@kms_psr@cursor_plane_move:
> 
>           * bat-rplp-1: SKIP (i915#1072) -> ABORT (i915#8434 / i915#8668)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7394 -> IGTPW_9437
> 
>    CI-20190529: 20190529
>    CI_DRM_13396: da1bb773ff84001b185e7bec54b32b89dff44f91 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_9437: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9437/index.html
>    IGT_7394: 3b0c82d7e9f1b8708d351243de7f227153793ede @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
