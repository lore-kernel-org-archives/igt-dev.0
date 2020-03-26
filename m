Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 26 Mar 2020 04:23:39 -0000
Message-ID: <158519661991.23002.218262427092139463@emeril.freedesktop.org>
References: <20200325231938.527211-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200325231938.527211-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_i915/gem=5Fctx=5Fshared=3A_Use?=
 =?utf-8?q?_dynamic_subtests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] i915/gem_ctx_shared: Use dynamic subtests
URL   : https://patchwork.freedesktop.org/series/75094/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8190_full -> IGTPW_4354_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4354_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4354_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4354_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_ctx_shared@q-independent@vcs0} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-iclb3/igt@gem_ctx_shared@q-independent@vcs0.html
    - shard-tglb:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-tglb5/igt@gem_ctx_shared@q-independent@vcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-snb:          [PASS][3] -> [TIMEOUT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-snb6/igt@i915_pm_rc6_residency@rc6-idle.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-snb4/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-glk:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-glk4/igt@i915_pm_rc6_residency@rc6-idle.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-glk3/igt@i915_pm_rc6_residency@rc6-idle.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8190_full and IGTPW_4354_full:

### New IGT tests (90) ###

  * igt@gem_ctx_isolation@clean:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_isolation@clean@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.05, 0.21] s

  * igt@gem_ctx_isolation@clean@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.03, 0.11] s

  * igt@gem_ctx_isolation@clean@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.05, 0.13] s

  * igt@gem_ctx_isolation@clean@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@gem_ctx_isolation@clean@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.05, 0.13] s

  * igt@gem_ctx_isolation@dirty-create:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_isolation@dirty-create@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.24, 1.62] s

  * igt@gem_ctx_isolation@dirty-create@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.21, 0.89] s

  * igt@gem_ctx_isolation@dirty-create@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.24, 0.91] s

  * igt@gem_ctx_isolation@dirty-create@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.31] s

  * igt@gem_ctx_isolation@dirty-create@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.25, 0.91] s

  * igt@gem_ctx_isolation@dirty-switch:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_isolation@dirty-switch@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.23, 1.53] s

  * igt@gem_ctx_isolation@dirty-switch@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.21, 0.89] s

  * igt@gem_ctx_isolation@dirty-switch@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.23, 0.88] s

  * igt@gem_ctx_isolation@dirty-switch@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.31] s

  * igt@gem_ctx_isolation@dirty-switch@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.23, 0.88] s

  * igt@gem_ctx_isolation@nonpriv:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_isolation@nonpriv-switch:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_isolation@nonpriv-switch@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.32, 2.35] s

  * igt@gem_ctx_isolation@nonpriv-switch@rcs0:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.02] s

  * igt@gem_ctx_isolation@nonpriv-switch@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.33, 1.40] s

  * igt@gem_ctx_isolation@nonpriv-switch@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.32, 0.43] s

  * igt@gem_ctx_isolation@nonpriv-switch@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.33, 1.35] s

  * igt@gem_ctx_isolation@nonpriv@bcs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.31, 1.46] s

  * igt@gem_ctx_isolation@nonpriv@rcs0:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.21] s

  * igt@gem_ctx_isolation@nonpriv@vcs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.32, 1.12] s

  * igt@gem_ctx_isolation@nonpriv@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@gem_ctx_isolation@nonpriv@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.33, 1.01] s

  * igt@gem_ctx_isolation@preservation:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_isolation@preservation-reset:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_isolation@preservation-reset@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.17, 1.07] s

  * igt@gem_ctx_isolation@preservation-reset@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.15, 0.62] s

  * igt@gem_ctx_isolation@preservation-reset@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.19, 0.63] s

  * igt@gem_ctx_isolation@preservation-reset@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.22] s

  * igt@gem_ctx_isolation@preservation-reset@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.17, 0.62] s

  * igt@gem_ctx_isolation@preservation-s3:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - Statuses : 1 dmesg-warn(s) 4 pass(s)
    - Exec time: [1.16, 2.25] s

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [1.10, 1.81] s

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [1.13, 2.11] s

  * igt@gem_ctx_isolation@preservation-s3@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [1.11, 1.77] s

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [1.11, 1.97] s

  * igt@gem_ctx_isolation@preservation@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.17, 1.06] s

  * igt@gem_ctx_isolation@preservation@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.15, 0.60] s

  * igt@gem_ctx_isolation@preservation@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.17, 0.62] s

  * igt@gem_ctx_isolation@preservation@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.21] s

  * igt@gem_ctx_isolation@preservation@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.16, 0.61] s

  * igt@gem_ctx_shared@exec-shared-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_shared@exec-shared-gtt@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_ctx_shared@exec-shared-gtt@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_ctx_shared@exec-shared-gtt@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_ctx_shared@exec-shared-gtt@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@gem_ctx_shared@exec-shared-gtt@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_ctx_shared@exec-single-timeline:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@exec-single-timeline@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [1.02] s

  * igt@gem_ctx_shared@exec-single-timeline@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [1.03, 1.07] s

  * igt@gem_ctx_shared@exec-single-timeline@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [1.02] s

  * igt@gem_ctx_shared@exec-single-timeline@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [1.02] s

  * igt@gem_ctx_shared@exec-single-timeline@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [1.02] s

  * igt@gem_ctx_shared@q-in-order:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-in-order@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.06] s

  * igt@gem_ctx_shared@q-in-order@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.07] s

  * igt@gem_ctx_shared@q-in-order@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.06] s

  * igt@gem_ctx_shared@q-in-order@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.01] s

  * igt@gem_ctx_shared@q-in-order@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@gem_ctx_shared@q-independent:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_shared@q-independent@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@gem_ctx_shared@q-independent@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@gem_ctx_shared@q-independent@vcs0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_ctx_shared@q-independent@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ctx_shared@q-independent@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.05] s

  * igt@gem_ctx_shared@q-out-order:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_shared@q-out-order@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.05] s

  * igt@gem_ctx_shared@q-out-order@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.05] s

  * igt@gem_ctx_shared@q-out-order@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@gem_ctx_shared@q-out-order@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ctx_shared@q-out-order@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@gem_ctx_shared@q-promotion:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-promotion@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.05] s

  * igt@gem_ctx_shared@q-promotion@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.05] s

  * igt@gem_ctx_shared@q-promotion@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@gem_ctx_shared@q-promotion@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ctx_shared@q-promotion@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.05] s

  * igt@gem_ctx_shared@q-smoketest:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_shared@q-smoketest@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [5.39, 5.42] s

  * igt@gem_ctx_shared@q-smoketest@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [5.39, 5.42] s

  * igt@gem_ctx_shared@q-smoketest@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [5.39, 5.42] s

  * igt@gem_ctx_shared@q-smoketest@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [5.39] s

  * igt@gem_ctx_shared@q-smoketest@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [5.39, 5.43] s

  

Known issues
------------

  Here are the changes found in IGTPW_4354_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110854])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb1/igt@gem_exec_balancer@smoke.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-iclb8/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@deep-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb6/igt@gem_exec_schedule@deep-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-iclb2/igt@gem_exec_schedule@deep-bsd.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276] / [i915#677]) +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-iclb7/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#677])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb3/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [PASS][15] -> [DMESG-WARN][16] ([fdo#110789] / [fdo#111870] / [i915#478])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-snb4/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][17] -> [DMESG-WARN][18] ([i915#716])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-glk5/igt@gen9_exec_parse@allowed-all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-glk3/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([i915#1316])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb4/igt@i915_pm_rpm@system-suspend-devices.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-iclb6/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-tglb:         [PASS][21] -> [SKIP][22] ([i915#1316])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-tglb5/igt@i915_pm_rpm@system-suspend-devices.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-tglb1/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-glk:          [PASS][23] -> [SKIP][24] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-glk2/igt@i915_pm_rpm@system-suspend-devices.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-glk3/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#54])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-glk6/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-glk7/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          [PASS][29] -> [SKIP][30] ([fdo#109271])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([i915#93] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#52] / [i915#54]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180] / [i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#79])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-kbl:          [PASS][39] -> [DMESG-WARN][40] ([i915#1297])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl7/igt@kms_flip@absolute-wf_vblank.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-kbl2/igt@kms_flip@absolute-wf_vblank.html
    - shard-apl:          [PASS][41] -> [DMESG-WARN][42] ([i915#1297])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl3/igt@kms_flip@absolute-wf_vblank.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-apl3/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-kbl:          [PASS][43] -> [DMESG-WARN][44] ([i915#180]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl6/igt@kms_flip@flip-vs-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-kbl6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@modeset-vs-vblank-race:
    - shard-apl:          [PASS][45] -> [INCOMPLETE][46] ([fdo#103927] / [i915#1297])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl8/igt@kms_flip@modeset-vs-vblank-race.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-apl7/igt@kms_flip@modeset-vs-vblank-race.html
    - shard-kbl:          [PASS][47] -> [INCOMPLETE][48] ([i915#1297])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl4/igt@kms_flip@modeset-vs-vblank-race.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-kbl1/igt@kms_flip@modeset-vs-vblank-race.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][49] -> [DMESG-WARN][50] ([i915#180] / [i915#93] / [i915#95])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [PASS][51] -> [FAIL][52] ([fdo#108145] / [i915#93] / [i915#95])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [PASS][53] -> [FAIL][54] ([fdo#108145] / [i915#95])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][55] -> [SKIP][56] ([fdo#109441]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-iclb8/igt@kms_psr@psr2_cursor_blt.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][57] -> [FAIL][58] ([i915#1085])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-tglb2/igt@perf@gen12-mi-rpc.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-tglb5/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [PASS][59] -> [SKIP][60] ([fdo#112080]) +7 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb4/igt@perf_pmu@init-busy-vcs1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-iclb6/igt@perf_pmu@init-busy-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][61] -> [SKIP][62] ([fdo#109276]) +18 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb1/igt@prime_busy@hang-bsd2.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-iclb3/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][63] ([fdo#112080]) -> [PASS][64] +9 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb7/igt@gem_busy@busy-vcs1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-iclb2/igt@gem_busy@busy-vcs1.html

  * igt@gem_exec_schedule@implicit-both-bsd2:
    - shard-iclb:         [SKIP][65] ([fdo#109276] / [i915#677]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb3/igt@gem_exec_schedule@implicit-both-bsd2.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-iclb2/igt@gem_exec_schedule@implicit-both-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][67] ([i915#677]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][69] ([fdo#112146]) -> [PASS][70] +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-iclb5/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [SKIP][71] ([fdo#109276]) -> [PASS][72] +10 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb8/igt@gem_exec_schedule@promotion-bsd1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-iclb4/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl7/igt@gem_softpin@noreloc-s3.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-apl4/igt@gem_softpin@noreloc-s3.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][75] ([i915#716]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl7/igt@gen9_exec_parse@allowed-all.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-apl4/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@i2c:
    - shard-tglb:         [SKIP][77] ([i915#1316]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-tglb2/igt@i915_pm_rpm@i2c.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-tglb6/igt@i915_pm_rpm@i2c.html
    - shard-glk:          [SKIP][79] ([fdo#109271]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-glk3/igt@i915_pm_rpm@i2c.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-glk3/igt@i915_pm_rpm@i2c.html
    - shard-iclb:         [SKIP][81] ([i915#1316]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb7/igt@i915_pm_rpm@i2c.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-iclb5/igt@i915_pm_rpm@i2c.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [FAIL][83] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:
    - shard-kbl:          [FAIL][85] ([i915#54]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
    - shard-apl:          [FAIL][87] ([i915#54]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
    - shard-glk:          [FAIL][89] ([i915#54]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-glk7/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-glk5/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][91] ([i915#180]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][93] ([fdo#109349]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][95] ([i915#52] / [i915#54]) -> [PASS][96] +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [FAIL][97] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [FAIL][99] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - shard-apl:          [DMESG-WARN][101] ([i915#1297]) -> [PASS][102] +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl2/igt@kms_flip@basic-flip-vs-modeset.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-apl1/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@flip-vs-fences:
    - shard-kbl:          [DMESG-WARN][103] ([i915#1297]) -> [PASS][104] +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl1/igt@kms_flip@flip-vs-fences.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-kbl3/igt@kms_flip@flip-vs-fences.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [FAIL][105] ([fdo#108145] / [i915#93] / [i915#95]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [FAIL][107] ([i915#95]) -> [PASS][108] +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][109] ([i915#93] / [i915#95]) -> [PASS][110] +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][111] ([i915#899]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][113] ([fdo#109441]) -> [PASS][114] +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb5/igt@kms_psr@psr2_cursor_render.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * ig

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4354/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
