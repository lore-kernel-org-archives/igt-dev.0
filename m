Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 25 May 2021 17:27:23 -0000
Message-ID: <162196364305.1318.8628525678439491475@emeril.freedesktop.org>
References: <20210525125718.244109-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
In-Reply-To: <20210525125718.244109-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgZ2VtX2V4?=
 =?utf-8?q?ec=5Fschedule=3A_Report_and_check_for_timeslicing_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0010766326=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0010766326==
Content-Type: multipart/alternative;
 boundary="===============1995631792287080133=="

--===============1995631792287080133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gem_exec_schedule: Report and check for timeslicing (rev2)
URL   : https://patchwork.freedesktop.org/series/90471/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10130_full -> IGTPW_5848_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5848_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5848_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5848_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_schedule@submit-late-slice@bcs0 (NEW):
    - shard-iclb:         [PASS][1] -> [SKIP][2] +26 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-iclb1/igt@gem_exec_schedule@submit-late-slice@bcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb2/igt@gem_exec_schedule@submit-late-slice@bcs0.html

  * igt@gem_exec_schedule@u-fairslice:
    - shard-tglb:         NOTRUN -> [SKIP][3] +6 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb7/igt@gem_exec_schedule@u-fairslice.html

  * igt@gem_exec_schedule@u-submit-golden-slice@rcs0:
    - shard-iclb:         NOTRUN -> [SKIP][4] +10 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb8/igt@gem_exec_schedule@u-submit-golden-slice@rcs0.html

  * igt@gem_exec_schedule@u-submit-late-slice@rcs0:
    - shard-tglb:         [PASS][5] -> [SKIP][6] +38 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-tglb7/igt@gem_exec_schedule@u-submit-late-slice@rcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb1/igt@gem_exec_schedule@u-submit-late-slice@rcs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10130_full and IGTPW_5848_full:

### New IGT tests (109) ###

  * igt@gem_exec_balancer@hog:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.58] s

  * igt@gem_exec_balancer@sliced:
    - Statuses : 5 pass(s)
    - Exec time: [1.12, 4.52] s

  * igt@gem_exec_endless@dispatch:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_endless@dispatch@bcs0:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_endless@dispatch@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_endless@dispatch@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_endless@dispatch@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.00] s

  * igt@gem_exec_endless@dispatch@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_reloc@basic-concurrent0:
    - Statuses : 5 pass(s)
    - Exec time: [5.39, 5.47] s

  * igt@gem_exec_reloc@basic-concurrent16:
    - Statuses : 5 pass(s)
    - Exec time: [5.40, 5.51] s

  * igt@gem_exec_schedule@preempt-engines:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_schedule@submit-early-slice:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_schedule@submit-early-slice@bcs0:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_schedule@submit-early-slice@rcs0:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_schedule@submit-early-slice@vcs0:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_schedule@submit-early-slice@vcs1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@submit-early-slice@vecs0:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_schedule@submit-golden-slice:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@submit-golden-slice@bcs0:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@submit-golden-slice@rcs0:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_schedule@submit-golden-slice@vcs0:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@submit-golden-slice@vcs1:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@submit-golden-slice@vecs0:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@submit-late-slice:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@submit-late-slice@bcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_schedule@submit-late-slice@rcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_schedule@submit-late-slice@vcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_schedule@submit-late-slice@vcs1:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@submit-late-slice@vecs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_pciid:
    - Statuses : 4 pass(s)
    - Exec time: [0.05, 0.11] s

  * igt@i915_pm_lpsp@kms-lpsp:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rc6_residency@rc6-fence:
    - Statuses : 2 pass(s) 2 warn(s)
    - Exec time: [12.22, 18.25] s

  * igt@i915_query@engine-info:
    - Statuses : 6 pass(s)
    - Exec time: [0.00] s

  * igt@i915_query@engine-info-invalid:
    - Statuses : 6 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - Statuses : 4 pass(s)
    - Exec time: [1.66, 5.61] s

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - Statuses : 5 skip(s)
    - Exec time: [0.02, 0.26] s

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - Statuses : 5 skip(s)
    - Exec time: [0.01, 0.24] s

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - Statuses : 3 pass(s)
    - Exec time: [1.76, 2.87] s

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - Statuses : 4 skip(s)
    - Exec time: [0.05, 0.27] s

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - Statuses : 6 skip(s)
    - Exec time: [0.02, 0.25] s

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - Statuses : 4 pass(s)
    - Exec time: [2.10, 30.38] s

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - Statuses : 4 skip(s)
    - Exec time: [0.09, 0.51] s

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - Statuses : 4 skip(s)
    - Exec time: [0.05, 0.52] s

  * igt@kms_big_fb@linear-8bpp-rotate-0:
    - Statuses : 1 pass(s)
    - Exec time: [1.98] s

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - Statuses : 4 pass(s)
    - Exec time: [1.34, 4.67] s

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - Statuses : 6 skip(s)
    - Exec time: [0.02, 0.30] s

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@linear-addfb:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - Statuses : 4 pass(s)
    - Exec time: [1.50, 4.01] s

  * igt@kms_big_fb@x-tiled-16bpp-rotate-180:
    - Statuses : 4 pass(s)
    - Exec time: [1.53, 4.78] s

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - Statuses : 5 skip(s)
    - Exec time: [0.03, 0.25] s

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - Statuses : 6 skip(s)
    - Exec time: [0.01, 0.23] s

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - Statuses : 4 pass(s)
    - Exec time: [1.67, 29.52] s

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - Statuses : 6 skip(s)
    - Exec time: [0.01, 0.26] s

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - Statuses : 5 skip(s)
    - Exec time: [0.03, 0.28] s

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - Statuses : 1 pass(s)
    - Exec time: [4.11] s

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - Statuses : 4 pass(s)
    - Exec time: [2.97, 10.96] s

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - Statuses : 6 skip(s)
    - Exec time: [0.06, 0.50] s

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - Statuses : 4 skip(s)
    - Exec time: [0.09, 0.39] s

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - Statuses : 4 skip(s)
    - Exec time: [0.02, 0.30] s

  * igt@kms_big_fb@x-tiled-addfb:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
    - Statuses : 4 pass(s)
    - Exec time: [0.00] s

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - Statuses : 5 pass(s)
    - Exec time: [1.56, 4.63] s

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.14] s

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.77] s

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.08] s

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.71] s

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 29.49] s

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 10.97] s

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.53] s

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - Statuses : 4 skip(s)
    - Exec time: [0.09, 0.50] s

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.78] s

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.69] s

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - Statuses : 4 skip(s)
    - Exec time: [0.05, 0.31] s

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - Statuses : 4 skip(s)
    - Exec time: [0.06, 0.29] s

  * igt@kms_big_fb@y-tiled-addfb:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 28.91] s

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 4.81] s

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.11] s

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 1.97] s

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 6.53] s

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.60] s

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 6.59] s

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.66] s

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-addfb:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.00] s

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_chamelium@hdmi-audio:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_5848_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-clear:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#1888] / [i915#3160])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-glk7/igt@gem_create@create-clear.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-glk2/igt@gem_create@create-clear.html

  * igt@gem_create@create-massive:
    - shard-snb:          NOTRUN -> [DMESG-WARN][9] ([i915#3002])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-snb2/igt@gem_create@create-massive.html
    - shard-apl:          NOTRUN -> [DMESG-WARN][10] ([i915#3002])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-apl8/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#1099]) +11 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglb:         NOTRUN -> [SKIP][12] ([i915#280])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb5/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][13] ([i915#3354])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-snb2/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-apl:          NOTRUN -> [FAIL][14] ([i915#2846])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-apl2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [PASS][15] -> [FAIL][16] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb6/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][17] ([i915#2842]) +6 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb2/igt@gem_exec_fair@basic-none-vip@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][18] ([i915#2842])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-glk6/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][19] ([i915#2842]) +5 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#2842]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-glk7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-glk2/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][22] ([i915#2849])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_params@no-bsd:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([fdo#109283])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb4/igt@gem_exec_params@no-bsd.html

  * igt@gem_exec_params@secure-non-master:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([fdo#112283])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb5/igt@gem_exec_params@secure-non-master.html
    - shard-iclb:         NOTRUN -> [SKIP][25] ([fdo#112283])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb4/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][26] ([i915#2389])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb1/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_exec_schedule@submit-early-slice@bcs0 (NEW):
    - shard-apl:          [PASS][27] -> [SKIP][28] ([fdo#109271]) +16 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-apl3/igt@gem_exec_schedule@submit-early-slice@bcs0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-apl8/igt@gem_exec_schedule@submit-early-slice@bcs0.html

  * igt@gem_exec_schedule@submit-golden-slice@rcs0 (NEW):
    - shard-glk:          [PASS][29] -> [SKIP][30] ([fdo#109271]) +31 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-glk8/igt@gem_exec_schedule@submit-golden-slice@rcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-glk9/igt@gem_exec_schedule@submit-golden-slice@rcs0.html

  * igt@gem_exec_schedule@submit-golden-slice@vcs1 (NEW):
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109276]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-iclb4/igt@gem_exec_schedule@submit-golden-slice@vcs1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb1/igt@gem_exec_schedule@submit-golden-slice@vcs1.html

  * igt@gem_exec_schedule@thriceslice@vcs1:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#109276]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb4/igt@gem_exec_schedule@thriceslice@vcs1.html

  * igt@gem_exec_schedule@u-fairslice:
    - shard-glk:          NOTRUN -> [SKIP][34] ([fdo#109271]) +129 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-glk7/igt@gem_exec_schedule@u-fairslice.html

  * igt@gem_exec_schedule@u-submit-late-slice@vcs1:
    - shard-kbl:          [PASS][35] -> [SKIP][36] ([fdo#109271]) +20 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-kbl7/igt@gem_exec_schedule@u-submit-late-slice@vcs1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-kbl2/igt@gem_exec_schedule@u-submit-late-slice@vcs1.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-iclb:         [PASS][37] -> [INCOMPLETE][38] ([i915#1895])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-iclb6/igt@gem_exec_whisper@basic-queues-forked-all.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb2/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_fenced_exec_thrash@too-many-fences:
    - shard-snb:          NOTRUN -> [INCOMPLETE][39] ([i915#2055])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-snb5/igt@gem_fenced_exec_thrash@too-many-fences.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#2190])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-apl2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_media_vme:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#284])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb5/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy:
    - shard-glk:          [PASS][42] -> [INCOMPLETE][43] ([i915#2055] / [i915#3468])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-glk1/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-glk9/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
    - shard-apl:          [PASS][44] -> [INCOMPLETE][45] ([i915#3468]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-apl2/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-apl2/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
    - shard-tglb:         [PASS][46] -> [INCOMPLETE][47] ([i915#3468])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-tglb3/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb3/igt@gem_mmap_gtt@cpuset-basic-small-copy.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-snb:          NOTRUN -> [INCOMPLETE][48] ([i915#2055] / [i915#3468])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-snb5/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
    - shard-glk:          [PASS][49] -> [FAIL][50] ([i915#307])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-glk2/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-glk9/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html

  * igt@gem_mmap_gtt@fault-concurrent-x:
    - shard-apl:          NOTRUN -> [INCOMPLETE][51] ([i915#3468])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-apl1/igt@gem_mmap_gtt@fault-concurrent-x.html

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - shard-glk:          NOTRUN -> [INCOMPLETE][52] ([i915#3468])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-glk3/igt@gem_mmap_gtt@fault-concurrent-y.html
    - shard-iclb:         NOTRUN -> [INCOMPLETE][53] ([i915#3468])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb3/igt@gem_mmap_gtt@fault-concurrent-y.html

  * igt@gem_pread@exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][54] ([i915#2658]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb7/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][55] ([i915#2658]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-glk8/igt@gem_pread@exhaustion.html
    - shard-apl:          NOTRUN -> [WARN][56] ([i915#2658]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-apl7/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][57] ([i915#2658]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb4/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][58] ([i915#2658])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-snb6/igt@gem_pwrite@basic-exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][59] ([i915#2658]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-kbl2/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([i915#768]) +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb4/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#109312])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb2/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#3297]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb7/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-iclb:         NOTRUN -> [SKIP][63] ([i915#3297]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb6/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#112306]) +5 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb1/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-snb:          NOTRUN -> [SKIP][65] ([fdo#109271]) +572 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-snb5/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([fdo#112306]) +4 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb1/igt@gen9_exec_parse@bb-secure.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109293] / [fdo#109506]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#109506] / [i915#2411])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([fdo#109303])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb7/igt@i915_query@query-topology-known-pci-ids.html
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109303])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb4/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_selftest@live@execlists:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][71] ([i915#3462])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb1/igt@i915_selftest@live@execlists.html
    - shard-glk:          NOTRUN -> [DMESG-FAIL][72] ([i915#3462])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-glk8/igt@i915_selftest@live@execlists.html
    - shard-iclb:         NOTRUN -> [DMESG-FAIL][73] ([i915#3462])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb3/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_lrc:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][74] ([i915#2373])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb1/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][75] ([i915#1759] / [i915#2291])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb1/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          NOTRUN -> [INCOMPLETE][76] ([i915#2782])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-snb2/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [PASS][77] -> [DMESG-WARN][78] ([i915#180])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([i915#1769]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
    - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#1769])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90 (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][81] ([fdo#111614]) +4 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270 (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#110725] / [fdo#111614]) +3 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270 (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#110723])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb4/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_big_joiner@basic:
    - shard-apl:          NOTRUN -> [SKIP][84] ([fdo#109271] / [i915#2705]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-apl3/igt@kms_big_joiner@basic.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([i915#2705])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb8/igt@kms_big_joiner@invalid-modeset.html
    - shard-kbl:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#2705])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-kbl2/igt@kms_big_joiner@invalid-modeset.html
    - shard-glk:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#2705])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-glk5/igt@kms_big_joiner@invalid-modeset.html
    - shard-tglb:         NOTRUN -> [SKIP][88] ([i915#2705])
   [88]: https://intel-gfx-ci.01.org/tree/drm-ti

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/index.html

--===============1995631792287080133==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>gem_exec_schedule: Report and check for timeslicing (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/90471/">https://patchwork.freedesktop.org/series/90471/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10130_full -&gt; IGTPW_5848_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5848_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5848_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5848_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_schedule@submit-late-slice@bcs0 (NEW):</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-iclb1/igt@gem_exec_schedule@submit-late-slice@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb2/igt@gem_exec_schedule@submit-late-slice@bcs0.html">SKIP</a> +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb7/igt@gem_exec_schedule@u-fairslice.html">SKIP</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-golden-slice@rcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb8/igt@gem_exec_schedule@u-submit-golden-slice@rcs0.html">SKIP</a> +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-late-slice@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-tglb7/igt@gem_exec_schedule@u-submit-late-slice@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb1/igt@gem_exec_schedule@u-submit-late-slice@rcs0.html">SKIP</a> +38 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10130_full and IGTPW_5848_full:</p>
<h3>New IGT tests (109)</h3>
<ul>
<li>
<p>igt@gem_exec_balancer@hog:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.58] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@sliced:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.12, 4.52] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [5.39, 5.47] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [5.40, 5.51] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-engines:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-early-slice:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-early-slice@bcs0:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-early-slice@rcs0:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-early-slice@vcs0:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-early-slice@vcs1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-early-slice@vecs0:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-golden-slice:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-golden-slice@bcs0:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-golden-slice@rcs0:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-golden-slice@vcs0:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-golden-slice@vcs1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-golden-slice@vecs0:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-late-slice:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-late-slice@bcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-late-slice@rcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-late-slice@vcs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-late-slice@vcs1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-late-slice@vecs0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_pciid:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.05, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>Statuses : 2 pass(s) 2 warn(s)</li>
<li>Exec time: [12.22, 18.25] s</li>
</ul>
</li>
<li>
<p>igt@i915_query@engine-info:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_query@engine-info-invalid:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.66, 5.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.02, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.01, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.76, 2.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.05, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.02, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.10, 30.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.09, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.05, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.34, 4.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.02, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-addfb:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.50, 4.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-180:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.53, 4.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.03, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.01, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.67, 29.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.01, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.03, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.97, 10.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.06, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.09, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.02, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.56, 4.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 6.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 6.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 29.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 10.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.09, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.05, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.06, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 28.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 4.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 6.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 6.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 6.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 6.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5848_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-clear:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-glk7/igt@gem_create@create-clear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-glk2/igt@gem_create@create-clear.html">FAIL</a> ([i915#1888] / [i915#3160])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-snb2/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-apl8/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed.html">SKIP</a> ([fdo#109271] / [i915#1099]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb5/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-snb2/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#3354])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-apl2/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb6/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb2/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842]) +6 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-glk6/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> ([i915#2842]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-glk7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-glk2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-bsd:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb4/igt@gem_exec_params@no-bsd.html">SKIP</a> ([fdo#109283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb5/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb4/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([fdo#112283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb1/igt@gem_exec_reloc@basic-wide-active@vcs1.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-early-slice@bcs0 (NEW):</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-apl3/igt@gem_exec_schedule@submit-early-slice@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-apl8/igt@gem_exec_schedule@submit-early-slice@bcs0.html">SKIP</a> ([fdo#109271]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-golden-slice@rcs0 (NEW):</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-glk8/igt@gem_exec_schedule@submit-golden-slice@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-glk9/igt@gem_exec_schedule@submit-golden-slice@rcs0.html">SKIP</a> ([fdo#109271]) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-golden-slice@vcs1 (NEW):</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-iclb4/igt@gem_exec_schedule@submit-golden-slice@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb1/igt@gem_exec_schedule@submit-golden-slice@vcs1.html">SKIP</a> ([fdo#109276]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@thriceslice@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb4/igt@gem_exec_schedule@thriceslice@vcs1.html">SKIP</a> ([fdo#109276]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-glk7/igt@gem_exec_schedule@u-fairslice.html">SKIP</a> ([fdo#109271]) +129 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-late-slice@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-kbl7/igt@gem_exec_schedule@u-submit-late-slice@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-kbl2/igt@gem_exec_schedule@u-submit-late-slice@vcs1.html">SKIP</a> ([fdo#109271]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-iclb6/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb2/igt@gem_exec_whisper@basic-queues-forked-all.html">INCOMPLETE</a> ([i915#1895])</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@too-many-fences:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-snb5/igt@gem_fenced_exec_thrash@too-many-fences.html">INCOMPLETE</a> ([i915#2055])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-apl2/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb5/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-glk1/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-glk9/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">INCOMPLETE</a> ([i915#2055] / [i915#3468])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-apl2/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-apl2/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">INCOMPLETE</a> ([i915#3468]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-tglb3/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb3/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">INCOMPLETE</a> ([i915#3468])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-snb5/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">INCOMPLETE</a> ([i915#2055] / [i915#3468])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-odd:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-glk2/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-glk9/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-x:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-apl1/igt@gem_mmap_gtt@fault-concurrent-x.html">INCOMPLETE</a> ([i915#3468])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-y:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-glk3/igt@gem_mmap_gtt@fault-concurrent-y.html">INCOMPLETE</a> ([i915#3468])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb3/igt@gem_mmap_gtt@fault-concurrent-y.html">INCOMPLETE</a> ([i915#3468])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb7/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-glk8/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-apl7/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb4/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-snb6/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-kbl2/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb4/igt@gem_render_copy@y-tiled-to-vebox-linear.html">SKIP</a> ([i915#768]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb2/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb7/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb6/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb1/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([fdo#112306]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-snb5/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> ([fdo#109271]) +572 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb1/igt@gen9_exec_parse@bb-secure.html">SKIP</a> ([fdo#112306]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109293] / [fdo#109506]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109506] / [i915#2411])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb7/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb4/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb1/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> ([i915#3462])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-glk8/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> ([i915#3462])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb3/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> ([i915#3462])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb1/igt@i915_selftest@live@gt_lrc.html">DMESG-FAIL</a> ([i915#2373])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb1/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> ([i915#1759] / [i915#2291])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-snb2/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> ([i915#2782])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> ([i915#1769]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> ([i915#1769])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90 (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-tglb6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270 (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270 (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb4/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-apl3/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109271] / [i915#2705]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-iclb8/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-kbl2/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5848/shard-glk5/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-ti">SKIP</a> ([i915#2705])</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============1995631792287080133==--

--===============0010766326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0010766326==--
