Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3173972228093351361=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Tue, 19 Apr 2022 11:22:53 -0000
Message-ID: <165036737329.19109.17734480774759625952@emeril.freedesktop.org>
References: <20220419073319.541-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220419073319.541-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Iga21zL3Rl?=
 =?utf-8?q?sts_=3A_IGT_cleanup?=
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

--===============3173972228093351361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kms/tests : IGT cleanup
URL   : https://patchwork.freedesktop.org/series/102806/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11513_full -> IGTPW_6945_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_6945_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6945_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/index.html

Participating hosts (10 -> 9)
------------------------------

  Additional (3): shard-rkl shard-dg1 shard-tglu 
  Missing    (4): pig-skl-6260u shard-skl pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6945_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_concurrent@pipe-d@hdmi-a-1} (NEW):
    - {shard-dg1}:        NOTRUN -> [CRASH][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-dg1-13/igt@kms_concurrent@pipe-d@hdmi-a-1.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-kbl:          [SKIP][2] ([fdo#109271]) -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-kbl3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@gem_contexts:
    - {shard-rkl}:        NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-rkl-5/igt@i915_selftest@live@gem_contexts.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11513_full and IGTPW_6945_full:

### New IGT tests (79) ###

  * igt@kms_concurrent@pipe-a@dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.43, 0.53] s

  * igt@kms_concurrent@pipe-a@edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.45, 0.51] s

  * igt@kms_concurrent@pipe-a@hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.92] s

  * igt@kms_concurrent@pipe-a@hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_concurrent@pipe-a@vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_concurrent@pipe-b@dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.42, 0.58] s

  * igt@kms_concurrent@pipe-b@edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.58, 1.63] s

  * igt@kms_concurrent@pipe-b@hdmi-a-1:
    - Statuses : 1 crash(s) 2 pass(s)
    - Exec time: [0.03, 0.88] s

  * igt@kms_concurrent@pipe-b@hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_concurrent@pipe-b@vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_concurrent@pipe-c@dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.44] s

  * igt@kms_concurrent@pipe-c@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_concurrent@pipe-c@hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.92] s

  * igt@kms_concurrent@pipe-c@hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_concurrent@pipe-d@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.55] s

  * igt@kms_concurrent@pipe-d@hdmi-a-1:
    - Statuses : 1 crash(s) 1 pass(s)
    - Exec time: [0.03, 0.27] s

  * igt@kms_sequence@get-busy@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [2.39, 2.43] s

  * igt@kms_sequence@get-busy@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [2.47, 2.55] s

  * igt@kms_sequence@get-busy@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [2.47, 2.54] s

  * igt@kms_sequence@get-busy@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [1.87, 2.67] s

  * igt@kms_sequence@get-busy@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [2.64, 3.43] s

  * igt@kms_sequence@get-busy@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [2.69, 3.46] s

  * igt@kms_sequence@get-busy@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [2.67] s

  * igt@kms_sequence@get-busy@hdmi-a-1-pipe-a:
    - Statuses : 3 pass(s)
    - Exec time: [1.23, 2.75] s

  * igt@kms_sequence@get-busy@hdmi-a-1-pipe-b:
    - Statuses : 3 pass(s)
    - Exec time: [1.23, 2.51] s

  * igt@kms_sequence@get-busy@hdmi-a-1-pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [1.21, 2.57] s

  * igt@kms_sequence@get-busy@hdmi-a-1-pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [1.21, 2.38] s

  * igt@kms_sequence@get-busy@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [2.57] s

  * igt@kms_sequence@get-busy@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [2.53] s

  * igt@kms_sequence@get-busy@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [2.54] s

  * igt@kms_sequence@get-busy@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [2.32] s

  * igt@kms_sequence@get-busy@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [2.35] s

  * igt@kms_sequence@get-forked-busy@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [2.43] s

  * igt@kms_sequence@get-forked-busy@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [2.53, 2.54] s

  * igt@kms_sequence@get-forked-busy@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [2.53] s

  * igt@kms_sequence@get-forked-busy@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [1.89, 2.71] s

  * igt@kms_sequence@get-forked-busy@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [2.69, 3.50] s

  * igt@kms_sequence@get-forked-busy@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [2.70, 3.46] s

  * igt@kms_sequence@get-forked-busy@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [2.66] s

  * igt@kms_sequence@get-forked-busy@hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [2.74, 2.78] s

  * igt@kms_sequence@get-forked-busy@hdmi-a-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [2.50, 2.69] s

  * igt@kms_sequence@get-forked-busy@hdmi-a-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [2.51, 2.71] s

  * igt@kms_sequence@get-forked-busy@hdmi-a-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [2.71] s

  * igt@kms_sequence@get-forked-busy@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [2.54] s

  * igt@kms_sequence@get-forked-busy@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [2.52] s

  * igt@kms_sequence@get-forked-busy@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [2.53] s

  * igt@kms_sequence@get-forked-busy@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_sequence@get-forked-busy@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [2.35] s

  * igt@kms_sequence@get-forked@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [2.26, 2.30] s

  * igt@kms_sequence@get-forked@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [2.32, 2.40] s

  * igt@kms_sequence@get-forked@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [2.31, 2.41] s

  * igt@kms_sequence@get-forked@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [1.80, 2.51] s

  * igt@kms_sequence@get-forked@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [2.63, 3.32] s

  * igt@kms_sequence@get-forked@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [2.62, 3.33] s

  * igt@kms_sequence@get-forked@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [2.62] s

  * igt@kms_sequence@get-forked@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [2.68] s

  * igt@kms_sequence@get-forked@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [2.39] s

  * igt@kms_sequence@get-forked@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [2.35] s

  * igt@kms_sequence@get-forked@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [2.43] s

  * igt@kms_sequence@get-forked@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [2.41] s

  * igt@kms_sequence@get-forked@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [2.44] s

  * igt@kms_sequence@get-forked@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_sequence@get-forked@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@kms_sequence@queue-busy@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [2.39, 2.44] s

  * igt@kms_sequence@queue-busy@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [2.45, 2.52] s

  * igt@kms_sequence@queue-busy@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [2.47, 2.55] s

  * igt@kms_sequence@queue-busy@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [1.88, 2.68] s

  * igt@kms_sequence@queue-busy@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [2.68, 3.46] s

  * igt@kms_sequence@queue-busy@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [2.67, 3.46] s

  * igt@kms_sequence@queue-busy@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [2.65] s

  * igt@kms_sequence@queue-busy@hdmi-a-1-pipe-a:
    - Statuses : 3 pass(s)
    - Exec time: [1.23, 2.79] s

  * igt@kms_sequence@queue-busy@hdmi-a-1-pipe-b:
    - Statuses : 3 pass(s)
    - Exec time: [1.22, 2.62] s

  * igt@kms_sequence@queue-busy@hdmi-a-1-pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [1.20, 2.54] s

  * igt@kms_sequence@queue-busy@hdmi-a-1-pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [1.21, 2.39] s

  * igt@kms_sequence@queue-busy@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [2.64] s

  * igt@kms_sequence@queue-busy@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [2.56] s

  * igt@kms_sequence@queue-busy@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [2.56] s

  * igt@kms_sequence@queue-busy@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [2.32] s

  * igt@kms_sequence@queue-busy@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [2.35] s

  

Known issues
------------

  Here are the changes found in IGTPW_6945_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-snb:          [PASS][5] -> [DMESG-WARN][6] ([i915#4528])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-snb7/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-snb2/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_ccs@suspend-resume:
    - shard-iclb:         NOTRUN -> [SKIP][7] ([i915#5327])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb8/igt@gem_ccs@suspend-resume.html
    - shard-tglb:         NOTRUN -> [SKIP][8] ([i915#5325])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb6/igt@gem_ccs@suspend-resume.html

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#1099])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-snb2/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html

  * igt@gem_ctx_shared@q-in-order:
    - shard-snb:          NOTRUN -> [SKIP][10] ([fdo#109271]) +149 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-snb2/igt@gem_ctx_shared@q-in-order.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         NOTRUN -> [SKIP][11] ([i915#4525])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb5/igt@gem_exec_balancer@parallel-ordering.html
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][12] ([i915#5076] / [i915#5614])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb1/igt@gem_exec_balancer@parallel-ordering.html
    - shard-kbl:          NOTRUN -> [DMESG-FAIL][13] ([i915#5076] / [i915#5614])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl3/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][14] -> [FAIL][15] ([i915#2846])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-kbl3/igt@gem_exec_fair@basic-deadline.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl6/igt@gem_exec_fair@basic-deadline.html
    - shard-glk:          [PASS][16] -> [FAIL][17] ([i915#2846])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-glk9/igt@gem_exec_fair@basic-deadline.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk8/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-kbl:          [PASS][18] -> [FAIL][19] ([i915#2842]) +3 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-kbl3/igt@gem_exec_fair@basic-none@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl4/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [PASS][20] -> [FAIL][21] ([i915#2842]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl1/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][22] -> [FAIL][23] ([i915#2842])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         NOTRUN -> [FAIL][24] ([i915#2842]) +5 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][25] ([i915#2842]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb6/igt@gem_exec_fair@basic-pace@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][26] ([i915#2842])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk7/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          NOTRUN -> [FAIL][27] ([i915#2842]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#109313])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-snb:          [PASS][29] -> [SKIP][30] ([fdo#109271]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-snb7/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#109283])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb7/igt@gem_exec_params@rsvd2-dirt.html
    - shard-iclb:         NOTRUN -> [SKIP][32] ([fdo#109283])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb4/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-apl:          NOTRUN -> [SKIP][33] ([fdo#109271] / [i915#4613]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl2/igt@gem_lmem_swapping@heavy-multi.html
    - shard-glk:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#4613])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk8/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([i915#4613]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb4/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-kbl:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#4613]) +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl3/igt@gem_lmem_swapping@parallel-random-verify.html
    - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#4613]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb6/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#4270]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb2/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#4270]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb3/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([i915#768]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb1/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#3297]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb6/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([i915#3297])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb7/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([i915#2856]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb8/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([i915#2527] / [i915#2856]) +5 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb8/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         NOTRUN -> [FAIL][45] ([i915#454])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
    - shard-tglb:         NOTRUN -> [FAIL][46] ([i915#454])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb1/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([i915#4281])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb1/igt@i915_pm_dc@dc9-dpms.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([i915#1902])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb8/igt@i915_pm_lpsp@screens-disabled.html
    - shard-iclb:         NOTRUN -> [SKIP][50] ([i915#1902])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb7/igt@i915_pm_lpsp@screens-disabled.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#111644] / [i915#1397] / [i915#2411])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][52] ([i915#5096])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb7/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          [PASS][53] -> [INCOMPLETE][54] ([i915#3921])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-snb4/igt@i915_selftest@live@hangcheck.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-snb4/igt@i915_selftest@live@hangcheck.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#404])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-iclb:         NOTRUN -> [SKIP][56] ([i915#404])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#1769])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb3/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#5286]) +5 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([i915#5286]) +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb8/igt@kms_big_fb@linear-32bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#111614]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb6/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-kbl:          NOTRUN -> [SKIP][62] ([fdo#109271] / [i915#3777]) +3 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-glk:          NOTRUN -> [SKIP][63] ([fdo#109271] / [i915#3777]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#3777])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#111615]) +9 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#110723]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([i915#2705])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb8/igt@kms_big_joiner@2x-modeset.html
    - shard-tglb:         NOTRUN -> [SKIP][68] ([i915#2705])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb6/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#3689]) +10 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb3/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#3886]) +5 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk1/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109278] / [i915#3886]) +9 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb4/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#3886]) +13 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl4/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html
    - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#3886]) +5 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl8/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([i915#3689] / [i915#3886]) +3 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb8/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109278]) +35 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb7/igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#111615] / [i915#3689]) +6 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb1/igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-apl:          NOTRUN -> [SKIP][77] ([fdo#109271]) +120 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl2/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium@vga-edid-read:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109284] / [fdo#111827]) +12 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb4/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_color@pipe-d-ctm-max:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109278] / [i915#1149])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb8/igt@kms_color@pipe-d-ctm-max.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-5:
    - shard-apl:          NOTRUN -> [SKIP][80] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl2/igt@kms_color_chamelium@pipe-a-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-a-degamma:
    - shard-kbl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [fdo#111827]) +18 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl6/igt@kms_color_chamelium@pipe-a-degamma.html

  * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
    - shard-glk:          NOTRUN -> [SKIP][82] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk9/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html

  * igt@kms_color_chamelium@pipe-d-ctm-max:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +3 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-max.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#109284] / [fdo#111827]) +21 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb6/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html
    - shard-snb:          NOTRUN -> [SKIP][85] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-snb6/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          NOTRUN -> [TIMEOUT][86] ([i915#1319]) +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl1/igt@kms_content_protection@atomic.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][87] ([i915#1319]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@uevent:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([i915#1063]) +3 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb8/igt@kms_content_protection@uevent.html
    - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#109300] / [fdo#111066]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb7/igt@kms_content_protection@uevent.html
    - shard-kbl:          NOTRUN -> [FAIL][90] ([i915#2105])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109278] / [fdo#109279]) +3 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][92] -> [DMESG-WARN][93] ([i915#180]) +4 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x10-random:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([i915#3359]) +11 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-32x10-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][95] ([i915#3319]) +4 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x256-random:
    - shard-glk:          NOTRUN -> [SKIP][96] ([fdo#109271]) +82 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk4/igt@kms_cursor_crc@pipe-d-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][97] ([fdo#109279] / [i915#3359]) +5 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglb:         NOTRUN -> [SKIP][98] ([i915#4103])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][99] ([fdo#109274] / [fdo#109278]) +5 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][100] ([fdo#109274] / [fdo#111825]) +8 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [PASS][101] -> [FAIL][102] ([i915#2346] / [i915#533])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-tglb:         NOTRUN -> [SKIP][103] ([fdo#109274])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb8/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:
    - shard-tglb:         NOTRUN -> [SKIP][104] ([i915#3788])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb3/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][105] ([i915#5287]) +5 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled:
    - shard-iclb:         NOTRUN -> [SKIP][106] ([i915#5287]) +3 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][107] -> [FAIL][108] ([i915#4767])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][109] ([fdo#109274]) +3 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-iclb:         [PASS][110] -> [SKIP][111] ([i915#3701]) +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-tglb:         NOTRUN -> [SKIP][112] ([i915#2587]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling:
    - shard-iclb:         NOTRUN -> [SKIP][113] ([i915#2587]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][114] ([fdo#109280] / [fdo#111825]) +49 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-iclb:         NOTRUN -> [SKIP][115] ([fdo#109280]) +40 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][116] ([i915#3555]) +4 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb2/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-iclb:         NOTRUN -> [SKIP][117] ([fdo#109289]) +4 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb6/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-tglb:         NOTRUN -> [SKIP][118] ([fdo#109289]) +4 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb3/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][119] ([fdo#109271] / [i915#533])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html
    - shard-glk:          NOTRUN -> [SKIP][120] ([fdo#109271] / [i915#533])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk8/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
    - shard-kbl:          NOTRUN -> [SKIP][121] ([fdo#109271] / [i915#533]) +2 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl3/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][122] ([i915#265])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
    - shard-apl:          NOTRUN -> [FAIL][123] ([i915#265])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][124] ([fdo#108145] / [i915#265])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl3/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
    - shard-glk:          NOTRUN -> [FAIL][125] ([fdo#108145] / [i915#265])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk3/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
    - shard-kbl:          NOTRUN -> [FAIL][126] ([fdo#108145] / [i915#265]) +1 similar issue
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html

  * igt@kms_plane_lowres@pipe-b-tiling-none:
    - shard-iclb:         NOTRUN -> [SKIP][127] ([i915#3536])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb3/igt@kms_plane_lowres@pipe-b-tiling-none.html

  * igt@kms_plane_lowres@pipe-d-tiling-4:
    - shard-tglb:         NOTRUN -> [SKIP][128] ([i915#5288])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb7/igt@kms_plane_lowres@pipe-d-tiling-4.html

  * igt@kms_plane_lowres@pipe-d-tiling-none:
    - shard-tglb:         NOTRUN -> [SKIP][129] ([i915#3536]) +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb3/igt@kms_plane_lowres@pipe-d-tiling-none.html

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-75@pipe-b-edp-1-downscale-with-pixel-format:
    - shard-iclb:         [PASS][130] -> [INCOMPLETE][131] ([i915#5293])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb5/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-75@pipe-b-edp-1-downscale-with-pixel-format.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb2/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-75@pipe-b-edp-1-downscale-with-pixel-format.html

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-a-dp-1-downscale-with-rotation:
    - shard-kbl:          NOTRUN -> [SKIP][132] ([fdo#109271]) +222 similar issues
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl6/igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-a-dp-1-downscale-with-rotation.html

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-downscale-with-rotation:
    - shard-iclb:         NOTRUN -> [SKIP][133] ([i915#5176]) +2 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb6/igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-downscale-with-rotation.html

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-c-edp-1-downscale-with-rotation:
    - shard-tglb:         NOTRUN -> [SKIP][134] ([i915#5176]) +3 similar issues
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb2/igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-c-edp-1-downscale-with-rotation.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale:
    - shard-tglb:         NOTRUN -> [SKIP][135] ([i915#5235]) +3 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale.html

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping:
    - shard-iclb:         [PASS][136] -> [SKIP][137] ([i915#5176]) +1 similar issue
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb7/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-tglb:         NOTRUN -> [SKIP][138] ([i915#2920])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
    - shard-iclb:         NOTRUN -> [SKIP][139] ([fdo#111068] / [i915#658])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-tglb:         NOTRUN -> [SKIP][140] ([i915#1911])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-kbl:          NOTRUN -> [SKIP][141] ([fdo#109271] / [i915#658]) +1 similar issue
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][142] ([fdo#109441]) +1 similar issue
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb7/igt@kms_psr@psr2_cursor_mmap_cpu.html
    - shard-tglb:         NOTRUN -> [FAIL][143] ([i915#132] / [i915#3467]) +2 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb5/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][144] -> [SKIP][145] ([fdo#109441]) +1 similar issue
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb6/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:
    - shard-tglb:         NOTRUN -> [SKIP][146] ([i915#5030]) +3 similar issues
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb8/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a.html

  * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c:
    - shard-iclb:         NOTRUN -> [SKIP][147] ([i915#5030]) +2 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb7/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c.html

  * igt@kms_setmode@basic@pipe-a-vga-1:
    - shard-snb:          NOTRUN -> [FAIL][148] ([i915#5465]) +1 similar issue
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-snb2/igt@kms_setmode@basic@pipe-a-vga-1.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-iclb:         NOTRUN -> [SKIP][149] ([i915#3555]) +1 similar issue
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb4/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-kbl:          NOTRUN -> [FAIL][150] ([IGT#2])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl4/igt@kms_sysfs_edid_timing.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-kbl:          NOTRUN -> [SKIP][151] ([fdo#109271] / [i915#2437])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl1/igt@kms_writeback@writeback-fb-id.html
    - shard-tglb:         NOTRUN -> [SKIP][152] ([i915#2437])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb6/igt@kms_writeback@writeback-fb-id.html

  * igt@nouveau_crc@pipe-c-ctx-flip-detection:
    - shard-iclb:         NOTRUN -> [SKIP][153] ([i915#2530]) +3 similar issues
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb6/igt@nouveau_crc@pipe-c-ctx-flip-detection.html

  * igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame:
    - shard-tglb:         NOTRUN -> [SKIP][154] ([i915#2530]) +4 similar issues
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb7/igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame.html

  * igt@perf@polling-parameterized:
    - shard-kbl:          NOTRUN -> [FAIL][155] ([i915#5639])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl1/igt@perf@polling-parameterized.html

  * igt@perf_pmu@busy-accuracy-2@bcs0:
    - shard-glk:          [PASS][156] -> [DMESG-WARN][157] ([i915#118])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-glk2/igt@perf_pmu@busy-accuracy-2@bcs0.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk7/igt@perf_pmu@busy-accuracy-2@bcs0.html

  * igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:
    - shard-tglb:         NOTRUN -> [SKIP][158] ([fdo#109291]) +4 similar issues
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb7/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html

  * igt@prime_nv_test@i915_import_cpu_mmap:
    - shard-iclb:         NOTRUN -> [SKIP][159] ([fdo#109291]) +3 similar issues
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb5/igt@prime_nv_test@i915_import_cpu_mmap.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-tglb:         NOTRUN -> [SKIP][160] ([fdo#109295]) +1 similar issue
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb8/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-iclb:         NOTRUN -> [SKIP][161] ([fdo#109295])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb4/igt@prime_vgem@fence-read-hang.html

  * igt@sysfs_clients@sema-25:
    - shard-iclb:         NOTRUN -> [SKIP][162] ([i915#2994]) +2 similar issues
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb2/igt@sysfs_clients@sema-25.html

  * igt@sysfs_clients@sema-50:
    - shard-kbl:          NOTRUN -> [SKIP][163] ([fdo#109271] / [i915#2994]) +3 similar issues
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl6/igt@sysfs_clients@sema-50.html
    - shard-glk:          NOTRUN -> [SKIP][164] ([fdo#109271] / [i915#2994]) +2 similar issues
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk7/igt@sysfs_clients@sema-50.html
    - shard-tglb:         NOTRUN -> [SKIP][165] ([i915#2994]) +3 similar issues
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb2/igt@sysfs_clients@sema-50.html

  * igt@sysfs_clients@split-10:
    - shard-apl:          NOTRUN -> [SKIP][166] ([fdo#109271] / [i915#2994]) +3 similar issues
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl3/igt@sysfs_clients@split-10.html

  
#### Possible fixes ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-iclb:         [DMESG-WARN][167] -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb8/igt@device_reset@unbind-reset-rebind.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb6/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [FAIL][169] ([i915#2842]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk9/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-snb:          [SKIP][171] ([fdo#109271]) -> [PASS][172] +3 similar issues
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-snb6/igt@gem_exec_flush@basic-wb-ro-before-default.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-snb2/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][173] ([i915#2190]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-tglb7/igt@gem_huc_copy@huc-copy.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb5/igt@gem_huc_copy@huc-copy.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][175] ([i915#5566] / [i915#716]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-apl7/igt@gen9_exec_parse@allowed-all.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl7/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          [DMESG-WARN][177] ([i915#118]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-glk2/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-glk:          [FAIL][179] ([i915#3444]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-glk7/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk2/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-iclb:         [FAIL][181] ([i915#5072]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
    - shard-glk:          [DMESG-WARN][183] ([i915#118] / [i915#1888]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-glk8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk4/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-apl:          [DMESG-WARN][185] ([i915#180]) -> [PASS][186] +1 similar issue
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-apl6/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl4/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt:
    - shard-glk:          [FAIL][187] ([i915#1888] / [i915#2546]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-glk8/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:
    - shard-glk:          [FAIL][189] ([i915#2546]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
    - shard-kbl:          [INCOMPLETE][191] ([i915#3614]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html

  * igt@kms_plane_cursor@pipe-c-overlay-size-256:
    - shard-glk:          [FAIL][193] -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-glk8/igt@kms_plane_cursor@pipe-c-overlay-size-256.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk6/igt@kms_plane_cursor@pipe-c-overlay-size-256.html

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format:
    - shard-iclb:         [SKIP][195] ([i915#5176]) -> [PASS][196] +2 similar issues
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb2/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb4/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][197] ([fdo#109441]) -> [PASS][198] +1 similar issue
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb3/igt@kms_psr@psr2_basic.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb2/igt@kms_psr@psr2_basic.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         [DMESG-WARN][199] ([i915#5614]) -> [SKIP][200] ([i915#4525])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb6/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         [SKIP][201] ([i915#4525]) -> [DMESG-WARN][202] ([i915#5614]) +1 similar issue
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb6/igt@gem_exec_balancer@parallel-contexts.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb2/igt@gem_exec_balancer@parallel-contexts.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][203] ([i915#658]) -> [SKIP][204] ([i915#588])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb7/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-iclb:         [SKIP][205] ([fdo#111068] / [i915#658]) -> [SKIP][206] ([i915#2920])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb6/igt@kms_psr2_sf@cursor-plane-update-sf.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-iclb:         [SKIP][207] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [FAIL][208] ([i915#4148])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb5/igt@kms_psr2_su@page_flip-xrgb8888.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112022]: https://bugs.freedesktop.org/show_bug.cgi?id=112022
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2435]: https://gitlab.freedesktop.org/drm/intel/issues/2435
  [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3376]: https://gitlab.freedesktop.org/drm/intel/issues/3376
  [i915#3444]: https://gitlab.freedesktop.org/drm/intel/issues/3444
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3464]: https://gitlab.freedesktop.org/drm/intel/issues/3464
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3614]: https://gitlab.freedesktop.org/drm/intel/issues/3614
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3736]: https://gitlab.freedesktop.org/drm/intel/issues/3736
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3777]: https://gitlab.freedesktop.org/drm/intel/issues/3777
  [i915#3788]: https://gitlab.freedesktop.org/drm/intel/issues/3788
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3810]: https://gitlab.freedesktop.org/drm/intel/issues/3810
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3963]: https://gitlab.freedesktop.org/drm/intel/issues/3963
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4148]: https://gitlab.freedesktop.org/drm/intel/issues/4148
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4807]: https://gitlab.freedesktop.org/drm/intel/issues/4807
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4842]: https://gitlab.freedesktop.org/drm/intel/issues/4842
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4884]: https://gitlab.freedesktop.org/drm/intel/issues/4884
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4929]: https://gitlab.freedesktop.org/drm/intel/issues/4929
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5030]: https://gitlab.freedesktop.org/drm/intel/issues/5030
  [i915#5072]: https://gitlab.freedesktop.org/drm/intel/issues/5072
  [i915#5076]: https://gitlab.freedesktop.org/drm/intel/issues/5076
  [i915#5080]: https://gitlab.freedesktop.org/drm/intel/issues/5080
  [i915#5096]: https://gitlab.freedesktop.org/drm/intel/issues/5096
  [i915#5098]: https://gitlab.freedesktop.org/drm/intel/issues/5098
  [i915#5115]: https://gitlab.freedesktop.org/drm/intel/issues/5115
  [i915#5174]: https://gitlab.freedesktop.org/drm/intel/issues/5174
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5182]: https://gitlab.freedesktop.org/drm/intel/issues/5182
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5264]: https://gitlab.freedesktop.org/drm/intel/issues/5264
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5293]: https://gitlab.freedesktop.org/drm/intel/issues/5293
  [i915#5303]: https://gitlab.freedesktop.org/drm/intel/issues/5303
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5341]: https://gitlab.freedesktop.org/drm/intel/issues/5341
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5465]: https://gitlab.freedesktop.org/drm/intel/issues/5465
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#5614]: https://gitlab.freedesktop.org/drm/intel/issues/5614
  [i915#5639]: https://gitlab.freedesktop.org/drm/intel/issues/5639
  [i915#5691]: https://gitlab.freedesktop.org/drm/intel/issues/5691
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6439 -> IGTPW_6945
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11513: 620ecc233bc7908c2113b5a170573b5a15aac637 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6945: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/index.html
  IGT_6439: 0c6c92745d89c8244d6af8732a0dd03f45ac2030 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/index.html

--===============3173972228093351361==
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
<tr><td><b>Series:</b></td><td>kms/tests : IGT cleanup</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/102806/">https://patchwork.freedesktop.org/series/102806/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11513_full -&gt; IGTPW_6945_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_6945_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6945_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/index.html</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Additional (3): shard-rkl shard-dg1 shard-tglu <br />
  Missing    (4): pig-skl-6260u shard-skl pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6945_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@kms_concurrent@pipe-d@hdmi-a-1} (NEW):<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-dg1-13/igt@kms_concurrent@pipe-d@hdmi-a-1.html">CRASH</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-kbl3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_selftest@live@gem_contexts:<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-rkl-5/igt@i915_selftest@live@gem_contexts.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11513_full and IGTPW_6945_full:</p>
<h3>New IGT tests (79)</h3>
<ul>
<li>
<p>igt@kms_concurrent@pipe-a@dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.43, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-a@edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.45, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-a@hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-a@hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-a@vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-b@dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.42, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-b@edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.58, 1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-b@hdmi-a-1:</p>
<ul>
<li>Statuses : 1 crash(s) 2 pass(s)</li>
<li>Exec time: [0.03, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-b@hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-b@vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-c@dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-c@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-c@hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-c@hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-d@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-d@hdmi-a-1:</p>
<ul>
<li>Statuses : 1 crash(s) 1 pass(s)</li>
<li>Exec time: [0.03, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.39, 2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.47, 2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.47, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.87, 2.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.64, 3.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.69, 3.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.23, 2.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.23, 2.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.21, 2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy@hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.21, 2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.53, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.89, 2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.69, 3.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.70, 3.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.74, 2.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.50, 2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.51, 2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.26, 2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.32, 2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.31, 2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.80, 2.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.63, 3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.62, 3.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.39, 2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.45, 2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.47, 2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.88, 2.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.68, 3.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.67, 3.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.23, 2.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.22, 2.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.20, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.21, 2.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6945_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-snb7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-snb2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb8/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5327">i915#5327</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb6/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile-preempt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-snb2/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-in-order:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-snb2/igt@gem_ctx_shared@q-in-order.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +149 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb5/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb1/igt@gem_exec_balancer@parallel-ordering.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5076">i915#5076</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5614">i915#5614</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl3/igt@gem_exec_balancer@parallel-ordering.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5076">i915#5076</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5614">i915#5614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-kbl3/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-glk9/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk8/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-kbl3/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl4/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl1/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb6/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109313">fdo#109313</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-snb7/igt@gem_exec_flush@basic-batch-kernel-default-wb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-wb.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb7/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109283">fdo#109283</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb4/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109283">fdo#109283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl2/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk8/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb4/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl3/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb6/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb2/igt@gem_pxp@create-regular-context-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb3/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb1/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/768">i915#768</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb6/igt@gem_userptr_blits@access-control.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb7/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb8/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb8/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb1/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb1/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@screens-disabled:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb8/igt@i915_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1902">i915#1902</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb7/igt@i915_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1902">i915#1902</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111644">fdo#111644</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb7/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5096">i915#5096</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-snb4/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-snb4/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/404">i915#404</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/404">i915#404</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb3/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb8/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110725">fdo#110725</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb6/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3777">i915#3777</a>) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3777">i915#3777</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3777">i915#3777</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb8/igt@kms_big_joiner@2x-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#2705</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb6/igt@kms_big_joiner@2x-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#2705</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb3/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk1/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb4/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +9 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl4/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +13 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl8/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb8/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb7/igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +35 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb1/igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl2/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +120 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb4/igt@kms_chamelium@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb8/igt@kms_color@pipe-d-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-5:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl2/igt@kms_color_chamelium@pipe-a-ctm-0-5.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-degamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl6/igt@kms_color_chamelium@pipe-a-degamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-green-to-red:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk9/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb6/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +21 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-snb6/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl1/igt@kms_content_protection@atomic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl3/igt@kms_content_protection@atomic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb8/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1063">i915#1063</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb7/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109300">fdo#109300</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111066">fdo#111066</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl4/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2105">i915#2105</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x10-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-32x10-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3319">i915#3319</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x256-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk4/igt@kms_cursor_crc@pipe-d-cursor-256x256-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +82 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb8/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb3/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3788">i915#3788</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5287">i915#5287</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5287">i915#5287</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4767">i915#4767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3701">i915#3701</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +49 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +40 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb2/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb6/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb3/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk8/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl3/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl3/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk3/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-none:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb3/igt@kms_plane_lowres@pipe-b-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3536">i915#3536</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-4:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb7/igt@kms_plane_lowres@pipe-d-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5288">i915#5288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-none:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb3/igt@kms_plane_lowres@pipe-d-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3536">i915#3536</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-75@pipe-b-edp-1-downscale-with-pixel-format:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb5/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-75@pipe-b-edp-1-downscale-with-pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb2/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-75@pipe-b-edp-1-downscale-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5293">i915#5293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-a-dp-1-downscale-with-rotation:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl6/igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-a-dp-1-downscale-with-rotation.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +222 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-downscale-with-rotation:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb6/igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-downscale-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-c-edp-1-downscale-with-rotation:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb2/igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-c-edp-1-downscale-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb7/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#2920</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1911">i915#1911</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb7/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb5/igt@kms_psr@psr2_cursor_mmap_cpu.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/132">i915#132</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3467">i915#3467</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb6/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb8/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5030">i915#5030</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb7/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5030">i915#5030</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-snb2/igt@kms_setmode@basic@pipe-a-vga-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5465">i915#5465</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb4/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl4/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IGT#2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl1/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb6/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-detection:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb6/igt@nouveau_crc@pipe-c-ctx-flip-detection.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2530">i915#2530</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb7/igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2530">i915#2530</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl1/igt@perf@polling-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5639">i915#5639</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-2@bcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-glk2/igt@perf_pmu@busy-accuracy-2@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk7/igt@perf_pmu@busy-accuracy-2@bcs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb7/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_import_cpu_mmap:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb5/igt@prime_nv_test@i915_import_cpu_mmap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb8/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb4/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb2/igt@sysfs_clients@sema-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2994</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-50:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl6/igt@sysfs_clients@sema-50.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2994</a>) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk7/igt@sysfs_clients@sema-50.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2994</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb2/igt@sysfs_clients@sema-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2994</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl3/igt@sysfs_clients@split-10.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2994</a>) +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb8/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb6/igt@device_reset@unbind-reset-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk9/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-before-default:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-snb6/igt@gem_exec_flush@basic-wb-ro-before-default.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-snb2/igt@gem_exec_flush@basic-wb-ro-before-default.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-tglb7/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-tglb5/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-apl7/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl7/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-glk2/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-128x42-random:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-glk7/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3444">i915#3444</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk2/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5072">i915#5072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-glk8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk4/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-apl6/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-apl4/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-glk8/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2546">i915#2546</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2546">i915#2546</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3614">i915#3614</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-c-overlay-size-256:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-glk8/igt@kms_plane_cursor@pipe-c-overlay-size-256.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-glk6/igt@kms_plane_cursor@pipe-c-overlay-size-256.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb2/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb4/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb3/igt@kms_psr@psr2_basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb2/igt@kms_psr@psr2_basic.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5614">i915#5614</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb6/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb6/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb2/igt@gem_exec_balancer@parallel-contexts.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5614">i915#5614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb7/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb6/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11513/shard-iclb5/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4148">i915#4148</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6439 -&gt; IGTPW_6945</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11513: 620ecc233bc7908c2113b5a170573b5a15aac637 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6945: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6945/index.html<br />
  IGT_6439: 0c6c92745d89c8244d6af8732a0dd03f45ac2030 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============3173972228093351361==--
