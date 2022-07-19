Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7677025684490358898=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Tue, 19 Jul 2022 09:30:47 -0000
Message-ID: <165822304798.16363.7036807938080905739@emeril.freedesktop.org>
References: <20220718223205.1629532-1-ashutosh.dixit@intel.com>
In-Reply-To: <20220718223205.1629532-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?perf/i915=5Fref=5Fcount=3A_Skip_on_=5F=5Fdrm=5Fopen=5Fdriver_fa?=
 =?utf-8?q?ilure?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============7677025684490358898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/perf/i915_ref_count: Skip on __drm_open_driver failure
URL   : https://patchwork.freedesktop.org/series/106455/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11915_full -> IGTPW_7536_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/index.html

Participating hosts (13 -> 10)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

New tests
---------

  New tests have been introduced between CI_DRM_11915_full and IGTPW_7536_full:

### New IGT tests (30) ###

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@hdmi-a-4-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [3.81] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@hdmi-a-4-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [3.88] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@hdmi-a-4-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [3.81] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@hdmi-a-4-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [3.86] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@hdmi-a-4-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@hdmi-a-4-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.40] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [7.85] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@b-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [7.80] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@c-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [7.79] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@d-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [7.79] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.07] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.09] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.07] s

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.07] s

  * igt@kms_sequence@get-idle@hdmi-a-4-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [2.30] s

  * igt@kms_sequence@get-idle@hdmi-a-4-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_sequence@get-idle@hdmi-a-4-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_sequence@get-idle@hdmi-a-4-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  

Known issues
------------

  Here are the changes found in IGTPW_7536_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-iclb:         NOTRUN -> ([SKIP][1], [SKIP][2]) ([i915#5327])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-tglb:         NOTRUN -> [SKIP][3] ([i915#5325])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_create@create-massive:
    - shard-kbl:          NOTRUN -> ([DMESG-WARN][4], [DMESG-WARN][5]) ([i915#4991])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@gem_create@create-massive.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl1/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@file:
    - shard-snb:          NOTRUN -> ([SKIP][6], [SKIP][7]) ([fdo#109271] / [i915#1099])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-snb5/igt@gem_ctx_persistence@file.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-snb2/igt@gem_ctx_persistence@file.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-snb:          NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#1099]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-snb4/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         NOTRUN -> ([SKIP][9], [PASS][10]) ([i915#4525])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb3/igt@gem_exec_balancer@parallel-bb-first.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [PASS][11] -> ([SKIP][12], [SKIP][13]) ([i915#4525]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-iclb4/igt@gem_exec_balancer@parallel-out-fence.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb7/igt@gem_exec_balancer@parallel-out-fence.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb3/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][14] -> ([FAIL][15], [FAIL][16]) ([i915#2846])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-kbl6/igt@gem_exec_fair@basic-deadline.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@gem_exec_fair@basic-deadline.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][17] -> ([FAIL][18], [PASS][19]) ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-kbl:          [PASS][20] -> ([PASS][21], [FAIL][22]) ([i915#2842])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-kbl4/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl1/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl7/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [PASS][23] -> ([PASS][24], [FAIL][25]) ([i915#2842])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-glk6/igt@gem_exec_fair@basic-none-share@rcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk5/igt@gem_exec_fair@basic-none-share@rcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk3/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][26] -> ([PASS][27], [FAIL][28]) ([i915#2842])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl8/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl4/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-glk:          NOTRUN -> ([FAIL][29], [FAIL][30]) ([i915#2842]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk1/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk2/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#2842])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-glk9/igt@gem_exec_fair@basic-none@vcs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk2/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#2842]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl7/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          NOTRUN -> ([PASS][35], [FAIL][36]) ([i915#2851])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][37] ([i915#2842])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html
    - shard-kbl:          NOTRUN -> ([SKIP][38], [PASS][39]) ([fdo#109271])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs1.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-glk:          [PASS][40] -> ([FAIL][41], [FAIL][42]) ([i915#2842])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-glk3/igt@gem_exec_fair@basic-pace@vecs0.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk7/igt@gem_exec_fair@basic-pace@vecs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk5/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][43] -> ([FAIL][44], [FAIL][45]) ([i915#2849])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_suspend@basic-s3-devices@smem:
    - shard-apl:          [PASS][46] -> ([DMESG-WARN][47], [PASS][48]) ([i915#6461])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-apl8/igt@gem_exec_suspend@basic-s3-devices@smem.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl3/igt@gem_exec_suspend@basic-s3-devices@smem.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl6/igt@gem_exec_suspend@basic-s3-devices@smem.html

  * igt@gem_exec_whisper@basic-queues:
    - shard-snb:          NOTRUN -> [SKIP][49] ([fdo#109271]) +39 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-snb6/igt@gem_exec_whisper@basic-queues.html

  * igt@gem_lmem_swapping@basic:
    - shard-kbl:          NOTRUN -> ([SKIP][50], [SKIP][51]) ([fdo#109271] / [i915#4613])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl7/igt@gem_lmem_swapping@basic.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl1/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-glk:          NOTRUN -> ([SKIP][52], [SKIP][53]) ([fdo#109271] / [i915#4613]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk3/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-kbl:          NOTRUN -> [SKIP][54] ([fdo#109271] / [i915#4613]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@gem_lmem_swapping@parallel-multi.html
    - shard-apl:          NOTRUN -> ([SKIP][55], [SKIP][56]) ([fdo#109271] / [i915#4613])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl7/igt@gem_lmem_swapping@parallel-multi.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl2/igt@gem_lmem_swapping@parallel-multi.html
    - shard-tglb:         NOTRUN -> ([SKIP][57], [SKIP][58]) ([i915#4613])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@gem_lmem_swapping@parallel-multi.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb1/igt@gem_lmem_swapping@parallel-multi.html
    - shard-iclb:         NOTRUN -> ([SKIP][59], [SKIP][60]) ([i915#4613])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb6/igt@gem_lmem_swapping@parallel-multi.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb5/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-kbl:          NOTRUN -> ([WARN][61], [WARN][62]) ([i915#2658])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@gem_pwrite@basic-exhaustion.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-tglb:         NOTRUN -> ([SKIP][63], [SKIP][64]) ([i915#4270])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb3/igt@gem_pxp@reject-modify-context-protection-on.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb2/igt@gem_pxp@reject-modify-context-protection-on.html
    - shard-iclb:         NOTRUN -> [SKIP][65] ([i915#4270])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb8/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> ([SKIP][66], [SKIP][67]) ([i915#768])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb5/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb7/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-tglb:         NOTRUN -> ([SKIP][68], [SKIP][69]) ([i915#3297])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb1/igt@gem_userptr_blits@unsync-unmap.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@gem_userptr_blits@unsync-unmap.html
    - shard-iclb:         NOTRUN -> ([SKIP][70], [SKIP][71]) ([i915#3297])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb5/igt@gem_userptr_blits@unsync-unmap.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb7/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_workarounds@suspend-resume:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][72] ([i915#180])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [PASS][73] -> ([DMESG-WARN][74], [PASS][75]) ([i915#5566] / [i915#716])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-glk9/igt@gen9_exec_parse@allowed-single.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk1/igt@gen9_exec_parse@allowed-single.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk7/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([i915#2856])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb4/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglb:         NOTRUN -> ([SKIP][77], [SKIP][78]) ([i915#2527] / [i915#2856]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb2/igt@gen9_exec_parse@bb-secure.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb8/igt@gen9_exec_parse@bb-secure.html
    - shard-iclb:         NOTRUN -> ([SKIP][79], [SKIP][80]) ([i915#2856])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb3/igt@gen9_exec_parse@bb-secure.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb1/igt@gen9_exec_parse@bb-secure.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [PASS][81] -> ([PASS][82], [SKIP][83]) ([i915#4281])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-iclb5/igt@i915_pm_dc@dc9-dpms.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         NOTRUN -> ([SKIP][84], [SKIP][85]) ([fdo#111644] / [i915#1397] / [i915#2411])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb1/igt@i915_pm_rpm@dpms-non-lpsp.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#110892])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb8/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@pm-caching:
    - shard-snb:          NOTRUN -> ([SKIP][87], [SKIP][88]) ([fdo#109271]) +93 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-snb4/igt@i915_pm_rpm@pm-caching.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-snb5/igt@i915_pm_rpm@pm-caching.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-iclb:         NOTRUN -> ([SKIP][89], [SKIP][90]) ([i915#5903])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb3/igt@i915_suspend@basic-s3-without-i915.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb1/igt@i915_suspend@basic-s3-without-i915.html
    - shard-tglb:         NOTRUN -> ([SKIP][91], [SKIP][92]) ([i915#5903])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb5/igt@i915_suspend@basic-s3-without-i915.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb3/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          NOTRUN -> ([PASS][93], [DMESG-WARN][94]) ([i915#180])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@i915_suspend@forcewake.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglb:         NOTRUN -> ([SKIP][95], [SKIP][96]) ([i915#5286]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
    - shard-iclb:         NOTRUN -> ([SKIP][97], [SKIP][98]) ([i915#5286]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-tglb:         NOTRUN -> ([SKIP][99], [SKIP][100]) ([fdo#111615]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-iclb:         NOTRUN -> ([SKIP][101], [SKIP][102]) ([fdo#110723])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> ([SKIP][103], [SKIP][104]) ([fdo#111615] / [i915#3689]) +2 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb1/igt@kms_ccs@pipe-a-bad-rotation-90-yf_tiled_ccs.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@kms_ccs@pipe-a-bad-rotation-90-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> ([SKIP][105], [SKIP][106]) ([fdo#109278] / [i915#3886])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb2/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb1/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> ([SKIP][107], [SKIP][108]) ([fdo#109271] / [i915#3886]) +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl7/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl6/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> ([SKIP][109], [SKIP][110]) ([i915#3689]) +5 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb3/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_ccs.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> ([SKIP][111], [SKIP][112]) ([i915#6095]) +2 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb2/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_mc_ccs.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb3/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> ([SKIP][113], [SKIP][114]) ([fdo#109271] / [i915#3886]) +3 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk5/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk7/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
    - shard-iclb:         NOTRUN -> [SKIP][115] ([fdo#109278] / [i915#3886]) +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb4/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
    - shard-kbl:          NOTRUN -> ([SKIP][116], [SKIP][117]) ([fdo#109271] / [i915#3886]) +8 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl7/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][118] ([fdo#109271] / [i915#3886])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl7/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> ([SKIP][119], [SKIP][120]) ([i915#3689] / [i915#3886])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb1/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs.html
    - shard-glk:          NOTRUN -> [SKIP][121] ([fdo#109271] / [i915#3886]) +1 similar issue
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk2/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs.html
    - shard-kbl:          NOTRUN -> [SKIP][122] ([fdo#109271] / [i915#3886]) +1 similar issue
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl7/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][123] ([fdo#109278]) +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb4/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_chamelium@dp-edid-change-during-suspend:
    - shard-glk:          NOTRUN -> ([SKIP][124], [SKIP][125]) ([fdo#109271] / [fdo#111827]) +10 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk7/igt@kms_chamelium@dp-edid-change-during-suspend.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk6/igt@kms_chamelium@dp-edid-change-during-suspend.html

  * igt@kms_chamelium@dp-hpd-for-each-pipe:
    - shard-glk:          NOTRUN -> [SKIP][126] ([fdo#109271] / [fdo#111827])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk6/igt@kms_chamelium@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium@dp-hpd-storm:
    - shard-kbl:          NOTRUN -> ([SKIP][127], [SKIP][128]) ([fdo#109271] / [fdo#111827]) +6 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@kms_chamelium@dp-hpd-storm.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl1/igt@kms_chamelium@dp-hpd-storm.html

  * igt@kms_chamelium@dp-hpd-storm-disable:
    - shard-snb:          NOTRUN -> [SKIP][129] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-snb6/igt@kms_chamelium@dp-hpd-storm-disable.html

  * igt@kms_chamelium@hdmi-audio-edid:
    - shard-tglb:         NOTRUN -> ([SKIP][130], [SKIP][131]) ([fdo#109284] / [fdo#111827]) +5 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@kms_chamelium@hdmi-audio-edid.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb1/igt@kms_chamelium@hdmi-audio-edid.html
    - shard-apl:          NOTRUN -> [SKIP][132] ([fdo#109271] / [fdo#111827])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl6/igt@kms_chamelium@hdmi-audio-edid.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - shard-iclb:         NOTRUN -> ([SKIP][133], [SKIP][134]) ([fdo#109284] / [fdo#111827]) +4 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb6/igt@kms_chamelium@hdmi-hpd-fast.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb5/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> ([SKIP][135], [SKIP][136]) ([fdo#109271] / [fdo#111827]) +4 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl6/igt@kms_chamelium@vga-hpd.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl2/igt@kms_chamelium@vga-hpd.html

  * igt@kms_color_chamelium@pipe-a-gamma:
    - shard-kbl:          NOTRUN -> [SKIP][137] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl1/igt@kms_color_chamelium@pipe-a-gamma.html

  * igt@kms_color_chamelium@pipe-d-ctm-negative:
    - shard-iclb:         NOTRUN -> ([SKIP][138], [SKIP][139]) ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-negative.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-negative.html
    - shard-snb:          NOTRUN -> ([SKIP][140], [SKIP][141]) ([fdo#109271] / [fdo#111827]) +2 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-snb5/igt@kms_color_chamelium@pipe-d-ctm-negative.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-snb2/igt@kms_color_chamelium@pipe-d-ctm-negative.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-kbl:          NOTRUN -> [TIMEOUT][142] ([i915#1319])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-512x512:
    - shard-tglb:         NOTRUN -> ([SKIP][143], [SKIP][144]) ([i915#3359]) +7 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb8/igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-512x512.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb5/igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-512x512:
    - shard-iclb:         NOTRUN -> ([SKIP][145], [SKIP][146]) ([i915#3359]) +5 similar issues
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb3/igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-512x512.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb7/igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-32x10:
    - shard-tglb:         NOTRUN -> ([SKIP][147], [SKIP][148]) ([i915#4462]) +7 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb5/igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-32x10.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb8/igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-32x10.html
    - shard-iclb:         NOTRUN -> ([SKIP][149], [SKIP][150]) ([i915#4462]) +5 similar issues
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb7/igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-32x10.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb3/igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-32x10.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-tglb:         NOTRUN -> ([SKIP][151], [SKIP][152]) ([fdo#109274] / [fdo#111825]) +1 similar issue
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb3/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
    - shard-iclb:         NOTRUN -> ([SKIP][153], [SKIP][154]) ([fdo#109274]) +3 similar issues
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb8/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-glk:          [PASS][155] -> ([FAIL][156], [PASS][157]) ([i915#2346]) +1 similar issue
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
    - shard-iclb:         [PASS][158] -> ([PASS][159], [FAIL][160]) ([i915#2346])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-iclb6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb5/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-iclb:         NOTRUN -> ([SKIP][161], [SKIP][162]) ([i915#3555] / [i915#3828])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb5/igt@kms_dsc@dsc-with-formats.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb7/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][163] -> [FAIL][164] ([i915#4767])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-tglb:         NOTRUN -> ([SKIP][165], [SKIP][166]) ([fdo#109274] / [fdo#111825] / [i915#3637]) +1 similar issue
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb1/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-apl:          [PASS][167] -> [DMESG-WARN][168] ([i915#180]) +1 similar issue
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-apl2/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl6/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> ([SKIP][169], [PASS][170]) ([i915#6375])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> ([SKIP][171], [SKIP][172]) ([i915#2672]) +1 similar issue
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][173] ([i915#2672]) +11 similar issues
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglb:         NOTRUN -> ([SKIP][174], [SKIP][175]) ([i915#2672]) +1 similar issue
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-iclb:         [PASS][176] -> [SKIP][177] ([i915#3555])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][178] ([i915#3555]) +2 similar issues
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][179] ([i915#2672] / [i915#3555]) +1 similar issue
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-apl:          NOTRUN -> [SKIP][180] ([fdo#109271]) +15 similar issues
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html
    - shard-tglb:         NOTRUN -> ([SKIP][181], [SKIP][182]) ([fdo#109280] / [fdo#111825]) +14 similar issues
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-kbl:          NOTRUN -> ([SKIP][183], [SKIP][184]) ([fdo#109271]) +84 similar issues
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][185] -> ([DMESG-WARN][186], [PASS][187]) ([i915#180] / [i915#62])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-tglb:         NOTRUN -> ([FAIL][188], [FAIL][189]) ([i915#160]) +2 similar issues
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-iclb:         NOTRUN -> ([SKIP][190], [SKIP][191]) ([fdo#109280]) +12 similar issues
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-tglb:         NOTRUN -> [SKIP][192] ([fdo#109280] / [fdo#111825])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-iclb:         NOTRUN -> [SKIP][193] ([fdo#109280]) +2 similar issues
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-kbl:          NOTRUN -> [SKIP][194] ([fdo#109271]) +98 similar issues
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-apl:          NOTRUN -> ([SKIP][195], [SKIP][196]) ([fdo#109271]) +69 similar issues
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
    - shard-kbl:          [PASS][197] -> [FAIL][198] ([i915#1188])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-kbl7/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
    - shard-kbl:          NOTRUN -> [FAIL][199] ([i915#1188])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-1:
    - shard-kbl:          NOTRUN -> ([FAIL][200], [PASS][201]) ([i915#1188])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl1/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-tglb:         NOTRUN -> ([SKIP][202], [SKIP][203]) ([fdo#109289]) +1 similar issue
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb5/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb8/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
    - shard-snb:          [PASS][204] -> ([SKIP][205], [PASS][206]) ([fdo#109271]) +2 similar issues
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-snb2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-snb4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-snb5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-kbl:          NOTRUN -> ([FAIL][207], [FAIL][208]) ([fdo#108145] / [i915#265])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-glk:          NOTRUN -> ([FAIL][209], [FAIL][210]) ([i915#265])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk3/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk1/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-glk:          NOTRUN -> ([FAIL][211], [FAIL][212]) ([fdo#108145] / [i915#265])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk8/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk5/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
    - shard-apl:          [PASS][213] -> ([PASS][214], [DMESG-WARN][215]) ([i915#62]) +13 similar issues
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-apl7/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl6/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl3/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2:
    - shard-glk:          NOTRUN -> ([SKIP][216], [SKIP][217]) ([fdo#109271]) +116 similar issues
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk1/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk2/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2.html

  * {igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][218] ([i915#5176]) +3 similar issues
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-dg1-15/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-b-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][219] ([fdo#109271]) +16 similar issues
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk6/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp-1:
    - shard-tglb:         NOTRUN -> ([SKIP][220], [SKIP][221]) ([i915#5176]) +3 similar issues
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb5/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp-1.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb3/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp-1.html
    - shard-iclb:         NOTRUN -> ([SKIP][222], [SKIP][223]) ([i915#5176]) +2 similar issues
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb1/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp-1.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb3/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp-1.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-kbl:          NOTRUN -> [SKIP][224] ([fdo#109271] / [i915#658])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-apl:          NOTRUN -> [SKIP][225] ([fdo#109271] / [i915#658])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl8/igt@kms_psr2_sf@cursor-plane-update-sf.html
    - shard-tglb:         NOTRUN -> ([SKIP][226], [SKIP][227]) ([i915#2920])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@kms_psr2_sf@cursor-plane-update-sf.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb3/igt@kms_psr2_sf@cursor-plane-update-sf.html
    - shard-glk:          NOTRUN -> ([SKIP][228], [SKIP][229]) ([fdo#109271] / [i915#658])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk9/igt@kms_psr2_sf@cursor-plane-update-sf.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk2/igt@kms_psr2_sf@cursor-plane-update-sf.html
    - shard-iclb:         NOTRUN -> ([SKIP][230], [SKIP][231]) ([fdo#111068] / [i915#658])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb6/igt@kms_psr2_sf@cursor-plane-update-sf.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb8/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-apl:          NOTRUN -> ([SKIP][232], [SKIP][233]) ([fdo#109271] / [i915#658]) +1 similar issue
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-iclb:         NOTRUN -> ([SKIP][234], [SKIP][235]) ([fdo#109642] / [fdo#111068] / [i915#658])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb1/igt@kms_psr2_su@page_flip-xrgb8888.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb3/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-kbl:          NOTRUN -> ([SKIP][236], [SKIP][237]) ([fdo#109271] / [i915#658]) +3 similar issues
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl7/igt@kms_psr2_su@page_flip-xrgb8888.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl1/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-tglb:         NOTRUN -> ([SKIP][238], [SKIP][239]) ([i915#1911])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb2/igt@kms_psr2_su@page_flip-xrgb8888.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb8/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-glk:          NOTRUN -> [SKIP][240] ([fdo#109271] / [i915#658])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [PASS][241] -> ([SKIP][242], [SKIP][243]) ([fdo#109441]) +2 similar issues
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb6/igt@kms_psr@psr2_primary_mmap_gtt.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb8/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-tglb:         NOTRUN -> ([SKIP][244], [SKIP][245]) ([i915#3555]) +1 similar issue
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb3/igt@kms_setmode@clone-exclusive-crtc.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb2/igt@kms_setmode@clone-exclusive-crtc.html
    - shard-iclb:         NOTRUN -> ([SKIP][246], [SKIP][247]) ([i915#3555]) +1 similar issue
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb1/igt@kms_setmode@clone-exclusive-crtc.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb2/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-kbl:          NOTRUN -> ([FAIL][248], [FAIL][249]) ([IGT#2])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl7/igt@kms_sysfs_edid_timing.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl1/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][250] -> ([DMESG-WARN][251], [PASS][252]) ([i915#180])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-apl:          [PASS][253] -> ([DMESG-WARN][254], [PASS][255]) ([i915#180]) +5 similar issues
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-d-query-forked-hang:
    - shard-iclb:         NOTRUN -> ([SKIP][256], [SKIP][257]) ([fdo#109278]) +6 similar issues
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb5/igt@kms_vblank@pipe-d-query-forked-hang.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb6/igt@kms_vblank@pipe-d-query-forked-hang.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> ([SKIP][258], [SKIP][259]) ([fdo#109271] / [i915#2437])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk3/igt@kms_writeback@writeback-fb-id.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk1/igt@kms_writeback@writeback-fb-id.html

  * igt@nouveau_crc@pipe-b-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> ([SKIP][260], [SKIP][261]) ([i915#2530])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb1/igt@nouveau_crc@pipe-b-ctx-flip-detection.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb2/igt@nouveau_crc@pipe-b-ctx-flip-detection.html
    - shard-iclb:         NOTRUN -> ([SKIP][262], [SKIP][263]) ([i915#2530])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb8/igt@nouveau_crc@pipe-b-ctx-flip-detection.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb2/igt@nouveau_crc@pipe-b-ctx-flip-detection.html

  * igt@perf@gen12-mi-rpc:
    - shard-iclb:         NOTRUN -> ([SKIP][264], [SKIP][265]) ([fdo#109289]) +1 similar issue
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb5/igt@perf@gen12-mi-rpc.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb7/igt@perf@gen12-mi-rpc.html

  * igt@prime_nv_test@nv_write_i915_gtt_mmap_read:
    - shard-iclb:         NOTRUN -> ([SKIP][266], [SKIP][267]) ([fdo#109291])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb1/igt@prime_nv_test@nv_write_i915_gtt_mmap_read.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb2/igt@prime_nv_test@nv_write_i915_gtt_mmap_read.html
    - shard-tglb:         NOTRUN -> ([SKIP][268], [SKIP][269]) ([fdo#109291])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@prime_nv_test@nv_write_i915_gtt_mmap_read.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb1/igt@prime_nv_test@nv_write_i915_gtt_mmap_read.html

  * igt@sysfs_clients@pidname:
    - shard-apl:          NOTRUN -> [SKIP][270] ([fdo#109271] / [i915#2994])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl4/igt@sysfs_clients@pidname.html
    - shard-tglb:         NOTRUN -> ([SKIP][271], [SKIP][272]) ([i915#2994])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb2/igt@sysfs_clients@pidname.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb3/igt@sysfs_clients@pidname.html
    - shard-glk:          NOTRUN -> ([SKIP][273], [SKIP][274]) ([fdo#109271] / [i915#2994]) +1 similar issue
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk1/igt@sysfs_clients@pidname.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk3/igt@sysfs_clients@pidname.html
    - shard-iclb:         NOTRUN -> [SKIP][275] ([i915#2994])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb8/igt@sysfs_clients@pidname.html

  * igt@sysfs_clients@split-10:
    - shard-kbl:          NOTRUN -> ([SKIP][276], [SKIP][277]) ([fdo#109271] / [i915#2994]) +3 similar issues
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl7/igt@sysfs_clients@split-10.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl1/igt@sysfs_clients@split-10.html

  
#### Possible fixes ####

  * igt@gem_eio@unwedge-stress:
    - {shard-tglu}:       [TIMEOUT][278] ([i915#3063]) -> ([PASS][279], [PASS][280])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-tglu-2/igt@gem_eio@unwedge-stress.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglu-2/igt@gem_eio@unwedge-stress.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglu-6/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-iclb:         [SKIP][281] ([i915#4525]) -> [PASS][282]
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-iclb8/igt@gem_exec_balancer@parallel-keep-in-fence.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb4/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_reloc@basic-cpu-wc:
    - {shard-rkl}:        [SKIP][283] ([i915#3281]) -> [PASS][284] +2 similar issues
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-rkl-1/igt@gem_exec_reloc@basic-cpu-wc.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-wc.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-apl:          [DMESG-WARN][285] ([i915#180]) -> ([PASS][286], [PASS][287])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-apl8/igt@gem_exec_suspend@basic-s3@smem.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl2/igt@gem_exec_suspend@basic-s3@smem.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl6/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_pread@bench:
    - {shard-rkl}:        [SKIP][288] ([i915#3282]) -> [PASS][289] +1 similar issue
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-rkl-2/igt@gem_pread@bench.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-rkl-5/igt@gem_pread@bench.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][290] ([i915#5566] / [i915#716]) -> ([PASS][291], [PASS][292])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-glk8/igt@gen9_exec_parse@allowed-all.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk2/igt@gen9_exec_parse@allowed-all.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk9/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-kbl:          [DMESG-WARN][293] ([i915#5566] / [i915#716]) -> ([PASS][294], [PASS][295])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-kbl6/igt@gen9_exec_parse@allowed-single.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@gen9_exec_parse@allowed-single.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl1/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-start-param:
    - {shard-rkl}:        [SKIP][296] ([i915#2527]) -> [PASS][297]
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-rkl-1/igt@gen9_exec_parse@bb-start-param.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-rkl-5/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - {shard-dg1}:        [SKIP][298] ([i915#1397]) -> [PASS][299]
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-dg1-18/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-dg1-15/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_sseu@full-enable:
    - {shard-rkl}:        [SKIP][300] ([i915#4387]) -> [PASS][301]
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-rkl-2/igt@i915_pm_sseu@full-enable.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-rkl-5/igt@i915_pm_sseu@full-enable.html

  * igt@i915_selftest@live@hangcheck:
    - shard-tglb:         [DMESG-WARN][302] ([i915#5591]) -> ([PASS][303], [PASS][304])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-tglb1/igt@i915_selftest@live@hangcheck.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb2/igt@i915_selftest@live@hangcheck.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb3/igt@i915_selftest@live@hangcheck.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:
    - shard-kbl:          [DMESG-WARN][305] ([i915#180]) -> ([PASS][306], [PASS][307]) +3 similar issues
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-kbl4/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl7/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html

  * igt@kms_flip@plain-flip-ts-check@c-hdmi-a1:
    - shard-glk:          [FAIL][308] ([i915#2122]) -> ([PASS][309], [PASS][310])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-glk9/igt@kms_flip@plain-flip-ts-check@c-hdmi-a1.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk7/igt@kms_flip@plain-flip-ts-check@c-hdmi-a1.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk9/igt@kms_flip@plain-flip-ts-check@c-hdmi-a1.html

  * igt@kms_vblank@pipe-c-ts-continuation-idle-hang:
    - shard-apl:          [SKIP][311] ([fdo#109271]) -> ([PASS][312], [PASS][313]) +1 similar issue
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-apl7/igt@kms_vblank@pipe-c-ts-continuation-idle-hang.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-idle-hang.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl4/igt@kms_vblank@pipe-c-ts-continuation-idle-hang.html
    - shard-glk:          [SKIP][314] ([fdo#109271]) -> ([PASS][315], [PASS][316])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-glk7/igt@kms_vblank@pipe-c-ts-continuation-idle-hang.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk7/igt@kms_vblank@pipe-c-ts-continuation-idle-hang.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk5/igt@kms_vblank@pipe-c-ts-continuation-idle-hang.html
    - shard-kbl:          [SKIP][317] ([fdo#109271]) -> ([PASS][318], [PASS][319])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-idle-hang.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-idle-hang.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-idle-hang.html

  
#### Warnings ####

  * igt@gem_eio@kms:
    - shard-tglb:         [FAIL][320] ([i915#5784]) -> ([FAIL][321], [PASS][322]) ([i915#5784])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-tglb8/igt@gem_eio@kms.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb1/igt@gem_eio@kms.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [FAIL][323] ([i915#6117]) -> ([SKIP][324], [FAIL][325]) ([i915#4525] / [i915#6117])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb6/igt@gem_exec_balancer@parallel-ordering.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [FAIL][326] ([i915#2842]) -> ([PASS][327], [FAIL][328]) ([i915#2842]) +1 similar issue
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][329] ([i915#2842]) -> ([FAIL][330], [PASS][331]) ([i915#2842])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-kbl:          [FAIL][332] ([i915#2842]) -> ([FAIL][333], [PASS][334]) ([i915#2842])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-kbl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          [WARN][335] ([i915#2658]) -> ([WARN][336], [DMESG-WARN][337]) ([i915#2658] / [i915#62])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-apl8/igt@gem_pread@exhaustion.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl6/igt@gem_pread@exhaustion.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl3/igt@gem_pread@exhaustion.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-iclb:         [FAIL][338] ([i915#2684]) -> [WARN][339] ([i915#2684])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - shard-kbl:          [WARN][340] ([i915#6405]) -> ([WARN][341], [PASS][342]) ([i915#6405])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-kbl7/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-iclb:         [SKIP][343] ([i915#658]) -> ([SKIP][344], [SKIP][345]) ([i915#2920] / [i915#658]) +3 similar issues
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-iclb:         [SKIP][346] ([fdo#109642] / [fdo#111068] / [i915#658]) -> ([SKIP][347], [FAIL][348]) ([fdo#109642] / [fdo#111068] / [i915#5939] / [i915#658])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-iclb3/igt@kms_psr2_su@page_flip-nv12.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb1/igt@kms_psr2_su@page_flip-nv12.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][349] ([fdo#109441]) -> ([SKIP][350], [PASS][351]) ([fdo#109441]) +3 similar issues
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][352] ([i915#180]) -> ([DMESG-WARN][353], [PASS][354]) ([i915#180]) +2 similar issues
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][355], [FAIL][356], [FAIL][357]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][358], [FAIL][359], [FAIL][360], [FAIL][361], [FAIL][362], [FAIL][363], [FAIL][364], [FAIL][365], [FAIL][366], [FAIL][367], [FAIL][368], [FAIL][369]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-apl2/igt@runner@aborted.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-apl6/igt@runner@aborted.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-apl8/igt@runner@aborted.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl8/igt@runner@aborted.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl6/igt@runner@aborted.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl8/igt@runner@aborted.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl6/igt@runner@aborted.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl8/igt@runner@aborted.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl4/igt@runner@aborted.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl7/igt@runner@aborted.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl8/igt@runner@aborted.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl2/igt@runner@aborted.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl4/igt@runner@aborted.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl3/igt@runner@aborted.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl6/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][370], [FAIL][371], [FAIL][372], [FAIL][373], [FAIL][374]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#716]) -> ([FAIL][375], [FAIL][376], [FAIL][377], [FAIL][378], [FAIL][379], [FAIL][380], [FAIL][381], [FAIL][382], [FAIL][383], [FAIL][384]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-kbl4/igt@runner@aborted.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-kbl6/igt@runner@aborted.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-kbl4/igt@runner@aborted.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-kbl1/igt@runner@aborted.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-kbl4/igt@runner@aborted.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@runner@aborted.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@runner@aborted.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@runner@aborted.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@runner@aborted.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@runner@aborted.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@runner@aborted.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl1/igt@runner@aborted.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@runner@aborted.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@runner@aborted.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#160]: https://gitlab.freedesktop.org/drm/intel/issues/160
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2851]: https://gitlab.freedesktop.org/drm/intel/issues/2851
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3639]: https://gitlab.freedesktop.org/drm/intel/issues/3639
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3736]: https://gitlab.freedesktop.org/drm/intel/issues/3736
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3778]: https://gitlab.freedesktop.org/drm/intel/issues/3778
  [i915#3810]: https://gitlab.freedesktop.org/drm/intel/issues/3810
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3963]: https://gitlab.freedesktop.org/drm/intel/issues/3963
  [i915#4032]: https://gitlab.freedesktop.org/drm/intel/issues/4032
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4462]: https://gitlab.freedesktop.org/drm/intel/issues/4462
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4883]: https://gitlab.freedesktop.org/drm/intel/issues/4883
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4941]: https://gitlab.freedesktop.org/drm/intel/issues/4941
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5030]: https://gitlab.freedesktop.org/drm/intel/issues/5030
  [i915#5099]: https://gitlab.freedesktop.org/drm/intel/issues/5099
  [i915#5115]: https://gitlab.freedesktop.org/drm/intel/issues/5115
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5182]: https://gitlab.freedesktop.org/drm/intel/issues/5182
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#6011]: https://gitlab.freedesktop.org/drm/intel/issues/6011
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6251]: https://gitlab.freedesktop.org/drm/intel/issues/6251
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6375]: https://gitlab.freedesktop.org/drm/intel/issues/6375
  [i915#6405]: https://gitlab.freedesktop.org/drm/intel/issues/6405
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6461]: https://gitlab.freedesktop.org/drm/intel/issues/6461
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6589 -> IGTPW_7536
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11915: 59ad60b8e2d9defbdf03fc9c2f38b573fa053b2d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7536: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/index.html
  IGT_6589: f1fcde9103383c59d91881d1390a8859be395ce0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/index.html

--===============7677025684490358898==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/perf/i915_ref_count: Skip on __drm_ope=
n_driver failure</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/106455/">https://patchwork.freedesktop.org/series/106455/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7536/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7536/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11915_full -&gt; IGTPW_7536_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/index.=
html</p>
<h2>Participating hosts (13 -&gt; 10)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11915_full and IGTPW_7536_=
full:</p>
<h3>New IGT tests (30)</h3>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@hdmi-=
a-4-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@hdmi-=
a-4-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@hdmi-a-4-pipe=
-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@hdmi-a-4-pipe=
-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@hdmi-a-4-pi=
pe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@hdmi-a-4-pi=
pe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@b-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@c-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@d-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@hdmi-a-4-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle@hdmi-a-4-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle@hdmi-a-4-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle@hdmi-a-4-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle@hdmi-a-4-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7536_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-iclb7/igt@gem_ccs@ctrl-surf-copy-new-ctx.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536=
/shard-iclb5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/5327">i915#5327</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7536/shard-tglb5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5325=
">i915#5325</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@gem_create@create-massive.html">DM=
ESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_753=
6/shard-kbl1/igt@gem_create@create-massive.html">DMESG-WARN</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4991">i915#4991</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@file:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-snb5/igt@gem_ctx_persistence@file.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard=
-snb2/igt@gem_ctx_persistence@file.html">SKIP</a>) (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-snb4/igt@gem_ctx_persistence@smoketest.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1099">i915#1099</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-iclb3/igt@gem_exec_balancer@parallel-bb-fir=
st.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7536/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html">PASS</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525=
</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-iclb4/igt@gem_exec_balancer@parallel-out-fence.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_753=
6/shard-iclb7/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb3/igt@=
gem_exec_balancer@parallel-out-fence.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>) +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-kbl6/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-k=
bl4/igt@gem_exec_fair@basic-deadline.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@gem_exec_fair@basic=
-deadline.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2846">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard=
-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb1/igt@gem_exec_fair@=
basic-flow@rcs0.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-kbl4/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS<=
/a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/s=
hard-kbl1/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl7/igt@gem_exe=
c_fair@basic-none-rrul@rcs0.html">FAIL</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-glk6/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS=
</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/=
shard-glk5/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk3/igt@gem_=
exec_fair@basic-none-share@rcs0.html">FAIL</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS<=
/a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/s=
hard-apl8/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl4/igt@gem_exe=
c_fair@basic-none-solo@rcs0.html">FAIL</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-glk1/igt@gem_exec_fair@basic-none-vip@rcs0.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
536/shard-glk2/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) =
+1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-glk9/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-g=
lk2/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-k=
bl7/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/=
shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2851">i915#2851</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7536/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842"=
>i915#2842</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs1.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/s=
hard-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a>) (<a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-glk3/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard=
-glk7/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk5/igt@gem_exec_fair@b=
asic-pace@vecs0.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS<=
/a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/s=
hard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb7/igt@gem_ex=
ec_fair@basic-throttle@rcs0.html">FAIL</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2849">i915#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3-devices@smem:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-apl8/igt@gem_exec_suspend@basic-s3-devices@smem.html">P=
ASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_75=
36/shard-apl3/igt@gem_exec_suspend@basic-s3-devices@smem.html">DMESG-WARN</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-ap=
l6/igt@gem_exec_suspend@basic-s3-devices@smem.html">PASS</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/6461">i915#6461</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-snb6/igt@gem_exec_whisper@basic-queues.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a>) +39 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-kbl7/igt@gem_lmem_swapping@basic.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-=
kbl1/igt@gem_lmem_swapping@basic.html">SKIP</a>) (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-glk6/igt@gem_lmem_swapping@heavy-verify-mul=
ti-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7536/shard-glk3/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SK=
IP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7536/shard-kbl6/igt@gem_lmem_swapping@parallel-multi.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4613">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-apl7/igt@gem_lmem_swapping@parallel-multi.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_753=
6/shard-apl2/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a>) (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613=
</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@gem_lmem_swapping@parallel-multi.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_75=
36/shard-tglb1/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</=
p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-iclb6/igt@gem_lmem_swapping@parallel-multi.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_75=
36/shard-iclb5/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</=
p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@gem_pwrite@basic-exhaustion.html">=
WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/sh=
ard-kbl4/igt@gem_pwrite@basic-exhaustion.html">WARN</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-tglb3/igt@gem_pxp@reject-modify-context-prot=
ection-on.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7536/shard-tglb2/igt@gem_pxp@reject-modify-context-protection-on.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4270">i915#4270</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7536/shard-iclb8/igt@gem_pxp@reject-modify-context-prote=
ction-on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4270">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-iclb5/igt@gem_render_copy@y-tiled-to-vebox-=
yf-tiled.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7536/shard-iclb7/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/768=
">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-tglb1/igt@gem_userptr_blits@unsync-unmap.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536=
/shard-tglb7/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-iclb5/igt@gem_userptr_blits@unsync-unmap.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536=
/shard-iclb7/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@gem_workarounds@suspend-resume.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-glk9/igt@gen9_exec_parse@allowed-single.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard=
-glk1/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk7/igt@gen9_exec=
_parse@allowed-single.html">PASS</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/5566">i915#5566</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-iclb4/igt@gen9_exec_parse@bb-chained.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856">i=
915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-tglb2/igt@gen9_exec_parse@bb-secure.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shar=
d-tglb8/igt@gen9_exec_parse@bb-secure.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +1 simila=
r issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-iclb3/igt@gen9_exec_parse@bb-secure.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shar=
d-iclb1/igt@gen9_exec_parse@bb-secure.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-iclb5/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; (<a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb7/igt=
@i915_pm_dc@dc9-dpms.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#42=
81</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-tglb1/igt@i915_pm_rpm@dpms-non-lpsp.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shar=
d-tglb7/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a>) (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D111644">fdo#111644</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</=
p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7536/shard-iclb8/igt@i915_pm_rpm@dpms-non-lpsp.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110892">fd=
o#110892</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-caching:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-snb4/igt@i915_pm_rpm@pm-caching.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-s=
nb5/igt@i915_pm_rpm@pm-caching.html">SKIP</a>) (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +93 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-iclb3/igt@i915_suspend@basic-s3-without-i915=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7536/shard-iclb1/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5903">i915#5903</a=
>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-tglb5/igt@i915_suspend@basic-s3-without-i915=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7536/shard-tglb3/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5903">i915#5903</a=
>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@i915_suspend@forcewake.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-k=
bl4/igt@i915_suspend@forcewake.html">DMESG-WARN</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-tglb1/igt@kms_big_fb@4-tiled-max-hw-stride-6=
4bpp-rotate-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7536/shard-tglb7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-ro=
tate-0.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/5286">i915#5286</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-iclb3/igt@kms_big_fb@4-tiled-max-hw-stride-6=
4bpp-rotate-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7536/shard-iclb4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-ro=
tate-0.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/5286">i915#5286</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-tglb8/igt@kms_big_fb@yf-tiled-max-hw-stride=
-32bpp-rotate-0-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@kms_big_fb@yf-tiled-max-hw-stride=
-32bpp-rotate-0-hflip.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D111615">fdo#111615</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-iclb2/igt@kms_big_fb@yf-tiled-max-hw-stride=
-64bpp-rotate-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7536/shard-iclb6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp=
-rotate-0.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D110723">fdo#110723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-tglb1/igt@kms_ccs@pipe-a-bad-rotation-90-yf=
_tiled_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7536/shard-tglb7/igt@kms_ccs@pipe-a-bad-rotation-90-yf_tiled_ccs.=
html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3689">i915#3689</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-iclb2/igt@kms_ccs@pipe-b-ccs-on-another-bo-=
y_tiled_gen12_rc_ccs_cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7536/shard-iclb1/igt@kms_ccs@pipe-b-ccs-on-another-b=
o-y_tiled_gen12_rc_ccs_cc.html">SKIP</a>) (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-apl7/igt@kms_ccs@pipe-c-bad-rotation-90-y_t=
iled_gen12_mc_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7536/shard-apl6/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled=
_gen12_mc_ccs.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-tglb3/igt@kms_ccs@pipe-c-crc-primary-basic-=
y_tiled_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7536/shard-tglb7/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_cc=
s.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3689">i915#3689</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-tglb2/igt@kms_ccs@pipe-c-crc-primary-rotati=
on-180-4_tiled_dg2_mc_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7536/shard-tglb3/igt@kms_ccs@pipe-c-crc-primary-ro=
tation-180-4_tiled_dg2_mc_ccs.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/6095">i915#6095</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-glk5/igt@kms_ccs@pipe-c-missing-ccs-buffer-y=
_tiled_gen12_rc_ccs_cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7536/shard-glk7/igt@kms_ccs@pipe-c-missing-ccs-buffer=
-y_tiled_gen12_rc_ccs_cc.html">SKIP</a>) (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7536/shard-iclb4/igt@kms_ccs@pipe-c-missing-ccs-buffer-y=
_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@kms_ccs@pipe-c-missing-ccs-buffer-y=
_tiled_gen12_rc_ccs_cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7536/shard-kbl7/igt@kms_ccs@pipe-c-missing-ccs-buffer=
-y_tiled_gen12_rc_ccs_cc.html">SKIP</a>) (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7536/shard-apl7/igt@kms_ccs@pipe-c-random-ccs-data-y_til=
ed_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-tglb1/igt@kms_ccs@pipe-c-random-ccs-data-y_t=
iled_gen12_mc_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7536/shard-tglb7/igt@kms_ccs@pipe-c-random-ccs-data-y_tile=
d_gen12_mc_ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7536/shard-glk2/igt@kms_ccs@pipe-c-random-ccs-data-y_til=
ed_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7536/shard-kbl7/igt@kms_ccs@pipe-c-random-ccs-data-y_til=
ed_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-iclb4/igt@kms_ccs@pipe-d-crc-sprite-planes-b=
asic-y_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109278">fdo#109278</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-glk7/igt@kms_chamelium@dp-edid-change-durin=
g-suspend.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7536/shard-glk6/igt@kms_chamelium@dp-edid-change-during-suspend.ht=
ml">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-glk6/igt@kms_chamelium@dp-hpd-for-each-pipe.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@kms_chamelium@dp-hpd-storm.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/sha=
rd-kbl1/igt@kms_chamelium@dp-hpd-storm.html">SKIP</a>) (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">fdo#111827</a>) +6 s=
imilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm-disable:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-snb6/igt@kms_chamelium@dp-hpd-storm-disable.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio-edid:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@kms_chamelium@hdmi-audio-edid.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/=
shard-tglb1/igt@kms_chamelium@hdmi-audio-edid.html">SKIP</a>) (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109284">fdo#109284</a> / <a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">fdo#111827</a=
>) +5 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7536/shard-apl6/igt@kms_chamelium@hdmi-audio-edid.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-iclb6/igt@kms_chamelium@hdmi-hpd-fast.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/s=
hard-iclb5/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a>) (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D109284">fdo#109284</a> / <a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">fdo#111827</a>) =
+4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-apl6/igt@kms_chamelium@vga-hpd.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-ap=
l2/igt@kms_chamelium@vga-hpd.html">SKIP</a>) (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D111827">fdo#111827</a>) +4 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-gamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-kbl1/igt@kms_color_chamelium@pipe-a-gamma.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-negative:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-neg=
ative.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7536/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-negative.html">SKI=
P</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278">f=
do#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-snb5/igt@kms_color_chamelium@pipe-d-ctm-nega=
tive.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7536/shard-snb2/igt@kms_color_chamelium@pipe-d-ctm-negative.html">SKIP<=
/a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
827">fdo#111827</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@kms_content_protection@atomic-dpms.=
html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1319">i915#1319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-512x512:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-tglb8/igt@kms_cursor_crc@cursor-onscreen@pi=
pe-a-edp-1-512x512.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7536/shard-tglb5/igt@kms_cursor_crc@cursor-onscreen@pipe-=
a-edp-1-512x512.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3359">i915#3359</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-512x512:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-iclb3/igt@kms_cursor_crc@cursor-onscreen@pi=
pe-b-edp-1-512x512.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7536/shard-iclb7/igt@kms_cursor_crc@cursor-onscreen@pipe-=
b-edp-1-512x512.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3359">i915#3359</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-32x10:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-tglb5/igt@kms_cursor_crc@cursor-onscreen@pip=
e-c-edp-1-32x10.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7536/shard-tglb8/igt@kms_cursor_crc@cursor-onscreen@pipe-c-e=
dp-1-32x10.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4462">i915#4462</a>) +7 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-iclb7/igt@kms_cursor_crc@cursor-onscreen@pip=
e-c-edp-1-32x10.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7536/shard-iclb3/igt@kms_cursor_crc@cursor-onscreen@pipe-c-e=
dp-1-32x10.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4462">i915#4462</a>) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@kms_cursor_legacy@2x-cursor-vs-fli=
p-atomic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7536/shard-tglb3/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.htm=
l">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111825">fdo#111825</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-iclb6/igt@kms_cursor_legacy@2x-cursor-vs-fli=
p-atomic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7536/shard-iclb8/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.htm=
l">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
274">fdo#109274</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7536/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-tran=
sitions.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7536/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transiti=
ons.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2346">i915#2346</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-iclb6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-trans=
itions-varying-size.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7536/shard-iclb5/igt@kms_cursor_legacy@flip-vs-cur=
sor@atomic-transitions-varying-size.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb7/igt@kms_cursor_legacy@f=
lip-vs-cursor@atomic-transitions-varying-size.html">FAIL</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-iclb5/igt@kms_dsc@dsc-with-formats.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shar=
d-iclb7/igt@kms_dsc@dsc-with-formats.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl4/=
igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/4767">i915#4767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-tglb1/igt@kms_flip@2x-blocking-absolute-wf_=
vblank-interruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@kms_flip@2x-blocking-absolute-wf_v=
blank-interruptible.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D111825">fdo#111825</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +1 similar issue<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-apl2/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-=
apl6/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb3/igt=
@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-=
a-default-mode.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/6375">i915#6375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb5/ig=
t@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@p=
ipe-a-valid-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2672">i915#2672</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +11 si=
milar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-tglb3/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.htm=
l">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/26=
72">i915#2672</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bp=
p-linear-downscaling@pipe-a-default-mode.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb2/igt@kms_flip_=
scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mod=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-xti=
le-to-16bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#355=
5</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7536/shard-apl7/igt@kms_frontbuffer_tracking@fbc-2p-scnd=
scrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +15 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a>) (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) =
+14 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@kms_frontbuffer_tracking@f=
bc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +84 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536=
/shard-apl3/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl6/i=
gt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-spr-indfb-draw-mmap-wc.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@kms_frontbuffer_track=
ing@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">FAIL</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/160">i915#160</a>) +2 simila=
r issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb1/igt@kms_frontbuffer_tracking@=
fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +12 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +2 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +98 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-apl3/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-spr-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7536/shard-apl1/igt@kms_frontbuffer_tracking@ps=
r-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +69 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-kbl7/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/s=
hard-kbl1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@kms_hdr@bpc-switch-suspend@pipe-a-d=
p-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1188">i915#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@kms_hdr@bpc-switch@pipe-a-dp-1.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536=
/shard-kbl1/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html">PASS</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-tglb5/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b=
-with-3-lanes.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7536/shard-tglb8/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-=
lanes.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109289">fdo#109289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-snb2/igt@kms_plane@plane-panning-bottom-right-suspend@p=
ipe-b-planes.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7536/shard-snb4/igt@kms_plane@plane-panning-bottom-right-=
suspend@pipe-b-planes.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-snb5/igt@kms_plane@plane-panning-bottom-rig=
ht-suspend@pipe-b-planes.html">PASS</a>) (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha=
-opaque-fb.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7536/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.=
html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-glk3/igt@kms_plane_alpha_blend@pipe-a-alpha=
-transparent-fb.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7536/shard-glk1/igt@kms_plane_alpha_blend@pipe-a-alpha-trans=
parent-fb.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-glk8/igt@kms_plane_alpha_blend@pipe-b-alpha=
-opaque-fb.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7536/shard-glk5/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.=
html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-apl7/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.htm=
l">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7536/shard-apl6/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-=
apl3/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html">DMESG-WARN</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)=
 +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hd=
mi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-glk1/igt@kms_plane_scaling@plane-downscale-=
with-rotation-factor-0-5@pipe-b-hdmi-a-2.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk2/igt@kms_plane_scali=
ng@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2.html">SKIP</a>)=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a>) +116 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe=
-c-hdmi-a-4} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-dg1-15/igt@kms_plane_scaling@plane-scaler-wi=
th-clipping-clamping-rotation@pipe-c-hdmi-a-4.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-b-hdm=
i-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-glk6/igt@kms_plane_scaling@plane-upscale-wit=
h-rotation-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +16 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp=
-1:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-tglb5/igt@kms_plane_scaling@plane-upscale-wi=
th-rotation-factor-0-25@pipe-c-edp-1.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb3/igt@kms_plane_scaling@=
plane-upscale-with-rotation-factor-0-25@pipe-c-edp-1.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) =
+3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-iclb1/igt@kms_plane_scaling@plane-upscale-wi=
th-rotation-factor-0-25@pipe-c-edp-1.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb3/igt@kms_plane_scaling@=
plane-upscale-with-rotation-factor-0-25@pipe-c-edp-1.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) =
+2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-kbl6/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7536/shard-apl8/igt@kms_psr2_sf@cursor-plane-update-sf.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@kms_psr2_sf@cursor-plane-update-sf=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7536/shard-tglb3/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#2920</a=
>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-glk9/igt@kms_psr2_sf@cursor-plane-update-sf.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
536/shard-glk2/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a>) (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#65=
8</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-iclb6/igt@kms_psr2_sf@cursor-plane-update-sf=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7536/shard-iclb8/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a>) (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#=
658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-apl1/igt@kms_psr2_sf@overlay-plane-update-s=
f-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7536/shard-apl8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.=
html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-iclb1/igt@kms_psr2_su@page_flip-xrgb8888.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536=
/shard-iclb3/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a>) (<a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#=
658</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-kbl7/igt@kms_psr2_su@page_flip-xrgb8888.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/=
shard-kbl1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a>) (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +=
3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-tglb2/igt@kms_psr2_su@page_flip-xrgb8888.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536=
/shard-tglb8/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1911">i915#1911</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7536/shard-glk6/igt@kms_psr2_su@page_flip-xrgb8888.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard=
-iclb6/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb8/igt@kms_psr@psr2_p=
rimary_mmap_gtt.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-tglb3/igt@kms_setmode@clone-exclusive-crtc.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_75=
36/shard-tglb2/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +=
1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-iclb1/igt@kms_setmode@clone-exclusive-crtc.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_75=
36/shard-iclb2/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +=
1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-kbl7/igt@kms_sysfs_edid_timing.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kb=
l1/igt@kms_sysfs_edid_timing.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/igt-gpu-tools/issues/2">IGT#2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html=
">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7536/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-=
WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/sh=
ard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html=
">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7536/shard-apl2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">DMESG-=
WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/sh=
ard-apl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">PASS</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) =
+5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-query-forked-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-iclb5/igt@kms_vblank@pipe-d-query-forked-ha=
ng.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7536/shard-iclb6/igt@kms_vblank@pipe-d-query-forked-hang.html">SKIP</a>) =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278">fdo#1092=
78</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-glk3/igt@kms_writeback@writeback-fb-id.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/=
shard-glk1/igt@kms_writeback@writeback-fb-id.html">SKIP</a>) (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-detection:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-tglb1/igt@nouveau_crc@pipe-b-ctx-flip-detect=
ion.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7536/shard-tglb2/igt@nouveau_crc@pipe-b-ctx-flip-detection.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2530">i915#2=
530</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-iclb8/igt@nouveau_crc@pipe-b-ctx-flip-detect=
ion.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7536/shard-iclb2/igt@nouveau_crc@pipe-b-ctx-flip-detection.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2530">i915#2=
530</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-mi-rpc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-iclb5/igt@perf@gen12-mi-rpc.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb7=
/igt@perf@gen12-mi-rpc.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109289">fdo#109289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@nv_write_i915_gtt_mmap_read:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-iclb1/igt@prime_nv_test@nv_write_i915_gtt_mm=
ap_read.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7536/shard-iclb2/igt@prime_nv_test@nv_write_i915_gtt_mmap_read.html"=
>SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10929=
1">fdo#109291</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-tglb7/igt@prime_nv_test@nv_write_i915_gtt_mm=
ap_read.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7536/shard-tglb1/igt@prime_nv_test@nv_write_i915_gtt_mmap_read.html"=
>SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10929=
1">fdo#109291</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@pidname:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7536/shard-apl4/igt@sysfs_clients@pidname.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-tglb2/igt@sysfs_clients@pidname.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tg=
lb3/igt@sysfs_clients@pidname.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2994">i915#2994</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7536/shard-glk1/igt@sysfs_clients@pidname.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk=
3/igt@sysfs_clients@pidname.html">SKIP</a>) (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2994">i915#2994</a>) +1 similar issue<=
/p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7536/shard-iclb8/igt@sysfs_clients@pidname.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#29=
94</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-kbl7/igt@sysfs_clients@split-10.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-k=
bl1/igt@sysfs_clients@split-10.html">SKIP</a>) (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2994">i915#2994</a>) +3 similar iss=
ues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-tglu-2/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a=
>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/sh=
ard-tglu-2/igt@gem_eio@unwedge-stress.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglu-6/igt@gem_eio@unwedge-=
stress.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-iclb8/igt@gem_exec_balancer@parallel-keep-in-fence.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525=
">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7536/shard-iclb4/igt@gem_exec_balancer@parallel-keep-in-fence.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-wc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-rkl-1/igt@gem_exec_reloc@basic-cpu-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/sh=
ard-rkl-5/igt@gem_exec_reloc@basic-cpu-wc.html">PASS</a> +2 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-apl8/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915=
#180</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7536/shard-apl2/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl6/igt@gem_=
exec_suspend@basic-s3@smem.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@bench:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-rkl-2/igt@gem_pread@bench.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-rkl-5/ig=
t@gem_pread@bench.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-glk8/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5=
566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i=
915#716</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7536/shard-glk2/igt@gen9_exec_parse@allowed-all.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk9/igt@gen9=
_exec_parse@allowed-all.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-kbl6/igt@gen9_exec_parse@allowed-single.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i91=
5#5566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716=
">i915#716</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7536/shard-kbl6/igt@gen9_exec_parse@allowed-single.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl1/igt=
@gen9_exec_parse@allowed-single.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-rkl-1/igt@gen9_exec_parse@bb-start-param.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#252=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536=
/shard-rkl-5/igt@gen9_exec_parse@bb-start-param.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-dg1-18/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397">i=
915#1397</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7536/shard-dg1-15/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-rkl-2/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/4387">i915#4387</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard=
-rkl-5/igt@i915_pm_sseu@full-enable.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-tglb1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5591">i915=
#5591</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7536/shard-tglb2/igt@i915_selftest@live@hangcheck.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb3/igt@i91=
5_selftest@live@hangcheck.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-kbl4/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/180">i915#180</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7536/shard-kbl7/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_753=
6/shard-kbl4/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html">PASS</a>) =
+3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-glk9/igt@kms_flip@plain-flip-ts-check@c-hdmi-a1.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2122">i=
915#2122</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7536/shard-glk7/igt@kms_flip@plain-flip-ts-check@c-hdmi-a1.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-gl=
k9/igt@kms_flip@plain-flip-ts-check@c-hdmi-a1.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-idle-hang:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11915/shard-apl7/igt@kms_vblank@pipe-c-ts-continuation-idle-hang.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7536/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-idle-hang.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_75=
36/shard-apl4/igt@kms_vblank@pipe-c-ts-continuation-idle-hang.html">PASS</a=
>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11915/shard-glk7/igt@kms_vblank@pipe-c-ts-continuation-idle-hang.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7536/shard-glk7/igt@kms_vblank@pipe-c-ts-continuation-idle-hang.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_75=
36/shard-glk5/igt@kms_vblank@pipe-c-ts-continuation-idle-hang.html">PASS</a=
>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11915/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-idle-hang.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7536/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-idle-hang.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_75=
36/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-idle-hang.html">PASS</a=
>)</p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-tglb8/igt@gem_eio@kms.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb1/igt@g=
em_eio@kms.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7536/shard-tglb7/igt@gem_eio@kms.html">PASS</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6117">i91=
5#6117</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7536/shard-iclb6/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb2/=
igt@gem_exec_balancer@parallel-ordering.html">FAIL</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/6117">i915#6117</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i91=
5#2842</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7536/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-tglb7/=
igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar is=
sue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7536/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-glk9/igt=
@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-kbl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7536/shard-kbl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@g=
em_exec_fair@basic-pace-solo@rcs0.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-apl8/igt@gem_pread@exhaustion.html">WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658</a>) -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-a=
pl6/igt@gem_pread@exhaustion.html">WARN</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7536/shard-apl3/igt@gem_pread@exhaustion.html">=
DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2658">i915#2658</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/62">i915#62</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i91=
5#2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7536/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</=
a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-kbl7/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6405">i915=
#6405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7536/shard-kbl6/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">WARN</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl4/igt=
@i915_pm_rc6_residency@rc6-idle@vcs0.html">PASS</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/6405">i915#6405</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-=
big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/658">i915#658</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7536/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dm=
g-area-big-fb.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7536/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-a=
rea-big-fb.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2920">i915#2920</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/658">i915#658</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-iclb3/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642<=
/a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo=
#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
8">i915#658</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7536/shard-iclb1/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb2/igt@=
kms_psr2_su@page_flip-nv12.html">FAIL</a>) (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/5939">i915#5939</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
536/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-iclb2/igt@kms=
_psr@psr2_sprite_plane_move.html">PASS</a>) (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/180">i915#180</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7536/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7536/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">PASS=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915=
#180</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-apl6/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11915/shard-apl8/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/s=
hard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7536/shard-apl6/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-ap=
l8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7536/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl8/igt@=
runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7536/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl7/igt@runner@=
aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7536/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl2/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7536/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-apl3/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/sh=
ard-apl6/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>)</=
p>
</li>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11915/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-kbl6/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11915/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11915/shard-kbl1/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_11915/shard-kbl4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#=
5257</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">=
i915#716</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7536/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_753=
6/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard=
-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl1/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7536/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/shard-kbl4/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7536/shard-kbl4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#=
5257</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6589 -&gt; IGTPW_7536</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11915: 59ad60b8e2d9defbdf03fc9c2f38b573fa053b2d @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7536: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7536/index.htm=
l<br />
  IGT_6589: f1fcde9103383c59d91881d1390a8859be395ce0 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============7677025684490358898==--
