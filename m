Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3800314387294350079=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Wed, 31 Aug 2022 11:49:54 -0000
Message-ID: <166194659436.4258.313648842514116160@emeril.freedesktop.org>
References: <20220810122023.1816804-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220810122023.1816804-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fcursor=3A_Convert_tests_to_dynamic_=28rev3=29?=
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

--===============3800314387294350079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_cursor: Convert tests to dynamic (rev3)
URL   : https://patchwork.freedesktop.org/series/107119/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12046_full -> IGTPW_7703_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/index.html

Participating hosts (13 -> 9)
------------------------------

  Missing    (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005 

New tests
---------

  New tests have been introduced between CI_DRM_12046_full and IGTPW_7703_full:

### New IGT tests (111) ###

  * igt@kms_plane_cursor@overlay:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_cursor@overlay@pipe-a-dp-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.43] s

  * igt@kms_plane_cursor@overlay@pipe-a-dp-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_cursor@overlay@pipe-a-dp-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.43] s

  * igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.40] s

  * igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.40] s

  * igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.39] s

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [3.08] s

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [3.07] s

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.13] s

  * igt@kms_plane_cursor@overlay@pipe-a-vga-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.69] s

  * igt@kms_plane_cursor@overlay@pipe-a-vga-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.69] s

  * igt@kms_plane_cursor@overlay@pipe-a-vga-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.67] s

  * igt@kms_plane_cursor@overlay@pipe-b-dp-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_cursor@overlay@pipe-b-dp-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_cursor@overlay@pipe-b-dp-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.60] s

  * igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.40] s

  * igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.40] s

  * igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.24] s

  * igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [3.08] s

  * igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [3.13] s

  * igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.06] s

  * igt@kms_plane_cursor@overlay@pipe-b-vga-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.69] s

  * igt@kms_plane_cursor@overlay@pipe-b-vga-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.69] s

  * igt@kms_plane_cursor@overlay@pipe-b-vga-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.73] s

  * igt@kms_plane_cursor@overlay@pipe-c-dp-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_cursor@overlay@pipe-c-dp-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_cursor@overlay@pipe-c-dp-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.60] s

  * igt@kms_plane_cursor@overlay@pipe-c-edp-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.40] s

  * igt@kms_plane_cursor@overlay@pipe-c-edp-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.40] s

  * igt@kms_plane_cursor@overlay@pipe-c-edp-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.27] s

  * igt@kms_plane_cursor@overlay@pipe-c-hdmi-a-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [3.10] s

  * igt@kms_plane_cursor@overlay@pipe-c-hdmi-a-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [3.08] s

  * igt@kms_plane_cursor@overlay@pipe-c-hdmi-a-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.07] s

  * igt@kms_plane_cursor@overlay@pipe-d-hdmi-a-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [3.10] s

  * igt@kms_plane_cursor@overlay@pipe-d-hdmi-a-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [3.10] s

  * igt@kms_plane_cursor@overlay@pipe-d-hdmi-a-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.10] s

  * igt@kms_plane_cursor@primary:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_cursor@primary@pipe-a-dp-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_cursor@primary@pipe-a-dp-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_cursor@primary@pipe-a-dp-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.43] s

  * igt@kms_plane_cursor@primary@pipe-a-edp-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.40] s

  * igt@kms_plane_cursor@primary@pipe-a-edp-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.40] s

  * igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.41] s

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [1.21] s

  * igt@kms_plane_cursor@primary@pipe-a-vga-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_cursor@primary@pipe-a-vga-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_cursor@primary@pipe-a-vga-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.41] s

  * igt@kms_plane_cursor@primary@pipe-b-dp-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_cursor@primary@pipe-b-dp-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_cursor@primary@pipe-b-dp-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.58] s

  * igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.40] s

  * igt@kms_plane_cursor@primary@pipe-b-edp-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.40] s

  * igt@kms_plane_cursor@primary@pipe-b-edp-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.36] s

  * igt@kms_plane_cursor@primary@pipe-b-hdmi-a-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_plane_cursor@primary@pipe-b-hdmi-a-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_plane_cursor@primary@pipe-b-hdmi-a-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_plane_cursor@primary@pipe-b-vga-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_cursor@primary@pipe-b-vga-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_cursor@primary@pipe-b-vga-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.46] s

  * igt@kms_plane_cursor@primary@pipe-c-dp-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_cursor@primary@pipe-c-dp-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_cursor@primary@pipe-c-dp-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.61] s

  * igt@kms_plane_cursor@primary@pipe-c-edp-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.40] s

  * igt@kms_plane_cursor@primary@pipe-c-edp-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.40] s

  * igt@kms_plane_cursor@primary@pipe-c-edp-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.35] s

  * igt@kms_plane_cursor@primary@pipe-c-hdmi-a-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_plane_cursor@primary@pipe-c-hdmi-a-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_plane_cursor@primary@pipe-c-hdmi-a-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_plane_cursor@primary@pipe-d-hdmi-a-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_plane_cursor@primary@pipe-d-hdmi-a-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_plane_cursor@primary@pipe-d-hdmi-a-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_plane_cursor@viewport:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_cursor@viewport@pipe-a-dp-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.43] s

  * igt@kms_plane_cursor@viewport@pipe-a-dp-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.43] s

  * igt@kms_plane_cursor@viewport@pipe-a-dp-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.43] s

  * igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.43] s

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-4-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [3.12] s

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-4-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [3.12] s

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-4-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.08] s

  * igt@kms_plane_cursor@viewport@pipe-a-vga-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.69] s

  * igt@kms_plane_cursor@viewport@pipe-a-vga-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.69] s

  * igt@kms_plane_cursor@viewport@pipe-a-vga-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.68] s

  * igt@kms_plane_cursor@viewport@pipe-b-dp-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_cursor@viewport@pipe-b-dp-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_cursor@viewport@pipe-b-dp-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.61] s

  * igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.24] s

  * igt@kms_plane_cursor@viewport@pipe-b-hdmi-a-4-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [3.08] s

  * igt@kms_plane_cursor@viewport@pipe-b-hdmi-a-4-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [3.10] s

  * igt@kms_plane_cursor@viewport@pipe-b-hdmi-a-4-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.13] s

  * igt@kms_plane_cursor@viewport@pipe-b-vga-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.69] s

  * igt@kms_plane_cursor@viewport@pipe-b-vga-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.69] s

  * igt@kms_plane_cursor@viewport@pipe-b-vga-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.73] s

  * igt@kms_plane_cursor@viewport@pipe-c-dp-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.43] s

  * igt@kms_plane_cursor@viewport@pipe-c-dp-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_cursor@viewport@pipe-c-dp-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.60] s

  * igt@kms_plane_cursor@viewport@pipe-c-edp-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_cursor@viewport@pipe-c-edp-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_plane_cursor@viewport@pipe-c-edp-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.27] s

  * igt@kms_plane_cursor@viewport@pipe-c-hdmi-a-4-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [3.10] s

  * igt@kms_plane_cursor@viewport@pipe-c-hdmi-a-4-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [3.08] s

  * igt@kms_plane_cursor@viewport@pipe-c-hdmi-a-4-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.08] s

  * igt@kms_plane_cursor@viewport@pipe-d-hdmi-a-4-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [3.08] s

  * igt@kms_plane_cursor@viewport@pipe-d-hdmi-a-4-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [3.10] s

  * igt@kms_plane_cursor@viewport@pipe-d-hdmi-a-4-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.10] s

  

Known issues
------------

  Here are the changes found in IGTPW_7703_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-apl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/shard-apl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_ctx_persistence@processes:
    - shard-snb:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#1099])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-snb6/igt@gem_ctx_persistence@processes.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         NOTRUN -> [SKIP][4] ([i915#4525])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-iclb5/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][5] -> [FAIL][6] ([i915#2842])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][7] -> [FAIL][8] ([i915#2842])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-apl:          NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#4613]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl6/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@verify:
    - shard-iclb:         NOTRUN -> [SKIP][10] ([i915#4613]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-iclb3/igt@gem_lmem_swapping@verify.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][11] ([i915#768])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-iclb1/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gen3_render_mixed_blits:
    - shard-iclb:         NOTRUN -> [SKIP][12] ([fdo#109289]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-iclb2/igt@gen3_render_mixed_blits.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-snb:          NOTRUN -> [SKIP][13] ([fdo#109271]) +109 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-snb6/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-iclb:         NOTRUN -> [SKIP][14] ([fdo#110723])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-iclb8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][15] ([fdo#109278]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-iclb3/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#3886]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl2/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_color_chamelium@ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][17] ([fdo#109284] / [fdo#111827])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-iclb6/igt@kms_color_chamelium@ctm-0-25.html
    - shard-apl:          NOTRUN -> [SKIP][18] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl1/igt@kms_color_chamelium@ctm-0-25.html

  * igt@kms_color_chamelium@ctm-0-50:
    - shard-snb:          NOTRUN -> [SKIP][19] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-snb4/igt@kms_color_chamelium@ctm-0-50.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-iclb:         NOTRUN -> [SKIP][20] ([i915#3116])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-iclb5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa@legacy:
    - shard-iclb:         NOTRUN -> [SKIP][21] ([fdo#109274]) +6 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-iclb7/igt@kms_cursor_legacy@cursorb-vs-flipa@legacy.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][22] ([i915#2672]) +8 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#1888] / [i915#2546])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([fdo#109280]) +4 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-iclb6/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([i915#3555])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-iclb1/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][27] ([fdo#108145] / [i915#265])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [SKIP][28] ([fdo#109271]) +63 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl3/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-dp-1.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([i915#658])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-iclb3/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-apl:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#658]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl8/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-iclb1/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#109441])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-iclb6/igt@kms_psr@psr2_suspend.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-apl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#2437])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl3/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sysfs_clients@fair-7:
    - shard-apl:          NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#2994])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl1/igt@sysfs_clients@fair-7.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@engines-hang@bcs0:
    - {shard-dg1}:        [FAIL][36] ([i915#4883]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/shard-dg1-15/igt@gem_ctx_persistence@engines-hang@bcs0.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-dg1-18/igt@gem_ctx_persistence@engines-hang@bcs0.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         [SKIP][38] ([i915#4525]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/shard-iclb5/igt@gem_exec_balancer@parallel-bb-first.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [DMESG-WARN][40] ([i915#5566] / [i915#716]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/shard-apl3/igt@gen9_exec_parse@allowed-single.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl3/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [SKIP][42] ([fdo#109271]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/shard-apl2/igt@i915_pm_dc@dc9-dpms.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl7/igt@i915_pm_dc@dc9-dpms.html

  * igt@kms_atomic_interruptible@legacy-setmode@dp-1-pipe-a:
    - shard-apl:          [DMESG-WARN][44] ([i915#180] / [i915#62]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/shard-apl2/igt@kms_atomic_interruptible@legacy-setmode@dp-1-pipe-a.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl3/igt@kms_atomic_interruptible@legacy-setmode@dp-1-pipe-a.html

  * igt@kms_atomic_interruptible@universal-setplane-primary@dp-1-pipe-a:
    - shard-apl:          [DMESG-WARN][46] ([i915#62]) -> [PASS][47] +49 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/shard-apl2/igt@kms_atomic_interruptible@universal-setplane-primary@dp-1-pipe-a.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl1/igt@kms_atomic_interruptible@universal-setplane-primary@dp-1-pipe-a.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:
    - shard-apl:          [DMESG-WARN][48] ([i915#165] / [i915#180] / [i915#62]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/shard-apl2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid:
    - shard-apl:          [DMESG-WARN][50] ([i915#165] / [i915#62]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1:
    - shard-iclb:         [SKIP][52] ([i915#5235]) -> [PASS][53] +5 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-iclb7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html

  * igt@perf_pmu@busy-idle-check-all@vecs0:
    - {shard-dg1}:        [FAIL][54] ([i915#4521]) -> [PASS][55] +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/shard-dg1-16/igt@perf_pmu@busy-idle-check-all@vecs0.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-dg1-13/igt@perf_pmu@busy-idle-check-all@vecs0.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][56] ([i915#658]) -> [SKIP][57] ([i915#588])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-apl:          [DMESG-FAIL][58] ([fdo#108145] / [i915#62]) -> [FAIL][59] ([fdo#108145] / [i915#265]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][60], [FAIL][61], [FAIL][62], [FAIL][63]) ([fdo#109271] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#6599]) -> ([FAIL][64], [FAIL][65], [FAIL][66], [FAIL][67], [FAIL][68], [FAIL][69]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#6599])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/shard-apl1/igt@runner@aborted.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/shard-apl8/igt@runner@aborted.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/shard-apl3/igt@runner@aborted.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/shard-apl3/igt@runner@aborted.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl7/igt@runner@aborted.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl2/igt@runner@aborted.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl8/igt@runner@aborted.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl1/igt@runner@aborted.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl6/igt@runner@aborted.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4521]: https://gitlab.freedesktop.org/drm/intel/issues/4521
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4883]: https://gitlab.freedesktop.org/drm/intel/issues/4883
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5182]: https://gitlab.freedesktop.org/drm/intel/issues/5182
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6599]: https://gitlab.freedesktop.org/drm/intel/issues/6599
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6637 -> IGTPW_7703
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12046: 3670ab033054d1817e1480cc7a1fdab412231876 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7703: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/index.html
  IGT_6637: a23e8aed0b54018339647d0817267431bd2b7075 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/index.html

--===============3800314387294350079==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_cursor: Convert tests to dyn=
amic (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/107119/">https://patchwork.freedesktop.org/series/107119/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7703/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7703/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12046_full -&gt; IGTPW_7703_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/index.=
html</p>
<h2>Participating hosts (13 -&gt; 9)</h2>
<p>Missing    (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005 </p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12046_full and IGTPW_7703_=
full:</p>
<h3>New IGT tests (111)</h3>
<ul>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-dp-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-dp-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-dp-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-vga-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-vga-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-vga-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-dp-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-dp-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-dp-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-vga-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-vga-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-vga-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-c-dp-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-c-dp-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-c-dp-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-c-edp-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-c-edp-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-c-edp-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-c-hdmi-a-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-c-hdmi-a-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-c-hdmi-a-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-d-hdmi-a-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-d-hdmi-a-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-d-hdmi-a-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-dp-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-dp-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-dp-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-edp-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-edp-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-vga-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-vga-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-vga-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-dp-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-dp-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-dp-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-edp-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-edp-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-hdmi-a-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-hdmi-a-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-hdmi-a-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-vga-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-vga-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-vga-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-dp-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-dp-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-dp-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-edp-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-edp-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-edp-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-hdmi-a-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-hdmi-a-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-hdmi-a-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-d-hdmi-a-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-d-hdmi-a-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-d-hdmi-a-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-dp-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-dp-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-dp-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-4-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-4-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-4-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-vga-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-vga-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-vga-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-dp-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-dp-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-dp-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-hdmi-a-4-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-hdmi-a-4-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-hdmi-a-4-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-vga-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-vga-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-vga-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-c-dp-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-c-dp-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-c-dp-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-c-edp-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-c-edp-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-c-edp-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-c-hdmi-a-4-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-c-hdmi-a-4-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-c-hdmi-a-4-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-d-hdmi-a-4-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-d-hdmi-a-4-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-d-hdmi-a-4-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.10] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7703_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12046/shard-apl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_770=
3/shard-apl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180=
</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@processes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7703/shard-snb6/igt@gem_ctx_persistence@processes.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7703/shard-iclb5/igt@gem_exec_balancer@parallel-orderin=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12046/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/sh=
ard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12046/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/sh=
ard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7703/shard-apl6/igt@gem_lmem_swapping@parallel-random-v=
erify.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7703/shard-iclb3/igt@gem_lmem_swapping@verify.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">i91=
5#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7703/shard-iclb1/igt@gem_render_copy@yf-tiled-mc-ccs-to=
-vebox-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/768">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_mixed_blits:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7703/shard-iclb2/igt@gen3_render_mixed_blits.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo=
#109289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7703/shard-snb6/igt@gen9_exec_parse@basic-rejected-ctx-=
param.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a>) +109 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7703/shard-iclb8/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D110723">fdo#110723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7703/shard-iclb3/igt@kms_ccs@pipe-a-crc-primary-rotatio=
n-180-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109278">fdo#109278</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7703/shard-apl2/igt@kms_ccs@pipe-b-crc-sprite-planes-ba=
sic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-0-25:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7703/shard-iclb6/igt@kms_color_chamelium@ctm-0-25.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284"=
>fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7703/shard-apl1/igt@kms_color_chamelium@ctm-0-25.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-0-50:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7703/shard-snb4/igt@kms_color_chamelium@ctm-0-50.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7703/shard-iclb5/igt@kms_content_protection@dp-mst-type=
-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa@legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7703/shard-iclb7/igt@kms_cursor_legacy@cursorb-vs-flipa=
@legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109274">fdo#109274</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7703/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +8=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12046/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-p=
ri-shrfb-draw-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7703/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-pri-shrfb-draw-blt.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1888">i915#1888</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2546">i915#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7703/shard-iclb6/igt@kms_frontbuffer_tracking@psr-2p-pr=
i-indfb-multidraw.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109280">fdo#109280</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7703/shard-iclb1/igt@kms_hdr@bpc-switch-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i=
915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7703/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-=
opaque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-dp-=
1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7703/shard-apl3/igt@kms_plane_scaling@plane-upscale-wit=
h-rotation-factor-0-25@pipe-a-dp-1.html">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +63 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7703/shard-iclb3/igt@kms_psr2_sf@overlay-plane-move-con=
tinuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7703/shard-apl8/igt@kms_psr2_su@page_flip-p010.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12046/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-iclb1/=
igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7703/shard-iclb6/igt@kms_psr@psr2_suspend.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#10=
9441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7703/shard-apl3/igt@kms_writeback@writeback-invalid-par=
ameters.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-7:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7703/shard-apl1/igt@sysfs_clients@fair-7.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-hang@bcs0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12046/shard-dg1-15/igt@gem_ctx_persistence@engines-hang@bcs0.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4883">=
i915#4883</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7703/shard-dg1-18/igt@gem_ctx_persistence@engines-hang@bcs0.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12046/shard-iclb5/igt@gem_exec_balancer@parallel-bb-first.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7703/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12046/shard-apl3/igt@gen9_exec_parse@allowed-single.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i91=
5#5566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716=
">i915#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7703/shard-apl3/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12046/shard-apl2/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl=
7/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@dp-1-pipe-a:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12046/shard-apl2/igt@kms_atomic_interruptible@legacy-setmode@dp-1-p=
ipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/62">i915#62</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7703/shard-apl3/igt@kms_atomic_interruptible@legacy-s=
etmode@dp-1-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-primary@dp-1-pipe-a:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12046/shard-apl2/igt@kms_atomic_interruptible@universal-setplane-pr=
imary@dp-1-pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/62">i915#62</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl1/igt@kms_atomic_interruptible@=
universal-setplane-primary@dp-1-pipe-a.html">PASS</a> +49 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12046/shard-apl2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp=
-linear-upscaling@pipe-a-valid-mode.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl8/i=
gt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-v=
alid-mode.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12046/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mi=
d.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/165">i915#165</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/62">i915#62</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7703/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-constant=
-alpha-mid.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12046/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-=
downscale-factor-0-5@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-iclb7/igt@kms_plane_=
scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html">=
PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@vecs0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12046/shard-dg1-16/igt@perf_pmu@busy-idle-check-all@vecs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4521">i91=
5#4521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7703/shard-dg1-13/igt@perf_pmu@busy-idle-check-all@vecs0.html">PASS</a> +2=
 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12046/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/=
shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12046/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.h=
tml">DMESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/62">i915#62</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7703/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-alpha-o=
paque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/265">i915#265</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_12046/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/shard-apl8/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_12046/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12046/shard-apl3/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/5257">i915#5257</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/6599">i915#6599</a>) -&gt; (<a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl7/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7703/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl8/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/sh=
ard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7703/shard-apl6/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/shard-apl=
1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/6599">i915#6599</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6637 -&gt; IGTPW_7703</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12046: 3670ab033054d1817e1480cc7a1fdab412231876 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7703: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7703/index.htm=
l<br />
  IGT_6637: a23e8aed0b54018339647d0817267431bd2b7075 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============3800314387294350079==--
