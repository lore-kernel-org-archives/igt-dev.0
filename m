Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0824141664128265260=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Wed, 10 Aug 2022 23:34:01 -0000
Message-ID: <166017444134.12354.5112415390517279327@emeril.freedesktop.org>
References: <20220810122023.1816804-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220810122023.1816804-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fcursor=3A_Convert_tests_to_dynamic?=
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

--===============0824141664128265260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_cursor: Convert tests to dynamic
URL   : https://patchwork.freedesktop.org/series/107119/
State : success

== Summary ==

CI Bug Log - changes from IGT_6620_full -> IGTPW_7631_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/index.html

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between IGT_6620_full and IGTPW_7631_full:

### New IGT tests (111) ###

  * igt@kms_plane_cursor@overlay:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_cursor@overlay@pipe-a-dp-1-size-128:
    - Statuses : 2 pass(s)
    - Exec time: [2.46] s

  * igt@kms_plane_cursor@overlay@pipe-a-dp-1-size-256:
    - Statuses : 2 pass(s)
    - Exec time: [2.45, 2.46] s

  * igt@kms_plane_cursor@overlay@pipe-a-dp-1-size-64:
    - Statuses : 2 pass(s)
    - Exec time: [2.46] s

  * igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128:
    - Statuses : 2 pass(s)
    - Exec time: [1.64, 2.47] s

  * igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-256:
    - Statuses : 2 pass(s)
    - Exec time: [1.63, 2.47] s

  * igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-64:
    - Statuses : 2 pass(s)
    - Exec time: [1.63, 2.47] s

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.50] s

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.50] s

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.67] s

  * igt@kms_plane_cursor@overlay@pipe-a-vga-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.74] s

  * igt@kms_plane_cursor@overlay@pipe-a-vga-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.74] s

  * igt@kms_plane_cursor@overlay@pipe-a-vga-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.72] s

  * igt@kms_plane_cursor@overlay@pipe-b-dp-1-size-128:
    - Statuses : 2 pass(s)
    - Exec time: [2.46] s

  * igt@kms_plane_cursor@overlay@pipe-b-dp-1-size-256:
    - Statuses : 2 pass(s)
    - Exec time: [2.46, 2.47] s

  * igt@kms_plane_cursor@overlay@pipe-b-dp-1-size-64:
    - Statuses : 2 pass(s)
    - Exec time: [2.60, 2.65] s

  * igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-128:
    - Statuses : 2 pass(s)
    - Exec time: [1.64, 2.45] s

  * igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-256:
    - Statuses : 2 pass(s)
    - Exec time: [1.63, 2.45] s

  * igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-64:
    - Statuses : 2 pass(s)
    - Exec time: [2.49, 3.31] s

  * igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-2-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.46] s

  * igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-2-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.46] s

  * igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-2-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.55] s

  * igt@kms_plane_cursor@overlay@pipe-b-vga-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.74] s

  * igt@kms_plane_cursor@overlay@pipe-b-vga-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.74] s

  * igt@kms_plane_cursor@overlay@pipe-b-vga-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.78] s

  * igt@kms_plane_cursor@overlay@pipe-c-dp-1-size-128:
    - Statuses : 2 pass(s)
    - Exec time: [2.46] s

  * igt@kms_plane_cursor@overlay@pipe-c-dp-1-size-256:
    - Statuses : 2 pass(s)
    - Exec time: [2.46] s

  * igt@kms_plane_cursor@overlay@pipe-c-dp-1-size-64:
    - Statuses : 2 pass(s)
    - Exec time: [2.60, 2.63] s

  * igt@kms_plane_cursor@overlay@pipe-c-edp-1-size-128:
    - Statuses : 2 pass(s)
    - Exec time: [1.64, 2.45] s

  * igt@kms_plane_cursor@overlay@pipe-c-edp-1-size-256:
    - Statuses : 2 pass(s)
    - Exec time: [1.64, 2.45] s

  * igt@kms_plane_cursor@overlay@pipe-c-edp-1-size-64:
    - Statuses : 2 pass(s)
    - Exec time: [2.45, 3.31] s

  * igt@kms_plane_cursor@overlay@pipe-c-hdmi-a-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.47] s

  * igt@kms_plane_cursor@overlay@pipe-c-hdmi-a-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.46] s

  * igt@kms_plane_cursor@overlay@pipe-c-hdmi-a-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.54] s

  * igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [1.64] s

  * igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [1.63] s

  * igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.44] s

  * igt@kms_plane_cursor@primary:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_cursor@primary@pipe-a-dp-1-size-128:
    - Statuses : 2 pass(s)
    - Exec time: [2.43, 2.45] s

  * igt@kms_plane_cursor@primary@pipe-a-dp-1-size-256:
    - Statuses : 2 pass(s)
    - Exec time: [2.43, 2.45] s

  * igt@kms_plane_cursor@primary@pipe-a-dp-1-size-64:
    - Statuses : 2 pass(s)
    - Exec time: [2.44, 2.46] s

  * igt@kms_plane_cursor@primary@pipe-a-edp-1-size-128:
    - Statuses : 2 pass(s)
    - Exec time: [1.62, 2.45] s

  * igt@kms_plane_cursor@primary@pipe-a-edp-1-size-256:
    - Statuses : 2 pass(s)
    - Exec time: [1.62, 2.45] s

  * igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64:
    - Statuses : 2 pass(s)
    - Exec time: [1.62, 2.45] s

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.47] s

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.47] s

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.64] s

  * igt@kms_plane_cursor@primary@pipe-a-vga-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.46] s

  * igt@kms_plane_cursor@primary@pipe-a-vga-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.46] s

  * igt@kms_plane_cursor@primary@pipe-a-vga-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.44] s

  * igt@kms_plane_cursor@primary@pipe-b-dp-1-size-128:
    - Statuses : 2 pass(s)
    - Exec time: [2.43, 2.45] s

  * igt@kms_plane_cursor@primary@pipe-b-dp-1-size-256:
    - Statuses : 2 pass(s)
    - Exec time: [2.43, 2.45] s

  * igt@kms_plane_cursor@primary@pipe-b-dp-1-size-64:
    - Statuses : 2 pass(s)
    - Exec time: [2.56, 2.63] s

  * igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128:
    - Statuses : 2 pass(s)
    - Exec time: [1.62, 2.43] s

  * igt@kms_plane_cursor@primary@pipe-b-edp-1-size-256:
    - Statuses : 2 pass(s)
    - Exec time: [1.62, 2.43] s

  * igt@kms_plane_cursor@primary@pipe-b-edp-1-size-64:
    - Statuses : 2 pass(s)
    - Exec time: [2.52, 3.29] s

  * igt@kms_plane_cursor@primary@pipe-b-hdmi-a-2-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.45] s

  * igt@kms_plane_cursor@primary@pipe-b-hdmi-a-2-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.44] s

  * igt@kms_plane_cursor@primary@pipe-b-hdmi-a-2-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.53] s

  * igt@kms_plane_cursor@primary@pipe-b-vga-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.46] s

  * igt@kms_plane_cursor@primary@pipe-b-vga-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.46] s

  * igt@kms_plane_cursor@primary@pipe-b-vga-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.50] s

  * igt@kms_plane_cursor@primary@pipe-c-dp-1-size-128:
    - Statuses : 2 pass(s)
    - Exec time: [2.43, 2.45] s

  * igt@kms_plane_cursor@primary@pipe-c-dp-1-size-256:
    - Statuses : 2 pass(s)
    - Exec time: [2.43, 2.45] s

  * igt@kms_plane_cursor@primary@pipe-c-dp-1-size-64:
    - Statuses : 2 pass(s)
    - Exec time: [2.57, 2.62] s

  * igt@kms_plane_cursor@primary@pipe-c-edp-1-size-128:
    - Statuses : 2 pass(s)
    - Exec time: [1.62, 2.43] s

  * igt@kms_plane_cursor@primary@pipe-c-edp-1-size-256:
    - Statuses : 2 pass(s)
    - Exec time: [1.62, 2.43] s

  * igt@kms_plane_cursor@primary@pipe-c-edp-1-size-64:
    - Statuses : 2 pass(s)
    - Exec time: [2.48, 3.28] s

  * igt@kms_plane_cursor@primary@pipe-c-hdmi-a-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.45] s

  * igt@kms_plane_cursor@primary@pipe-c-hdmi-a-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.45] s

  * igt@kms_plane_cursor@primary@pipe-c-hdmi-a-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.54] s

  * igt@kms_plane_cursor@primary@pipe-d-edp-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_plane_cursor@primary@pipe-d-edp-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_plane_cursor@primary@pipe-d-edp-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.50] s

  * igt@kms_plane_cursor@viewport:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_cursor@viewport@pipe-a-dp-1-size-128:
    - Statuses : 2 pass(s)
    - Exec time: [2.45, 2.47] s

  * igt@kms_plane_cursor@viewport@pipe-a-dp-1-size-256:
    - Statuses : 2 pass(s)
    - Exec time: [2.45, 2.48] s

  * igt@kms_plane_cursor@viewport@pipe-a-dp-1-size-64:
    - Statuses : 2 pass(s)
    - Exec time: [2.45, 2.47] s

  * igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128:
    - Statuses : 2 pass(s)
    - Exec time: [1.63, 2.52] s

  * igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-256:
    - Statuses : 2 pass(s)
    - Exec time: [1.63, 2.52] s

  * igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-64:
    - Statuses : 2 pass(s)
    - Exec time: [1.63, 2.51] s

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.48] s

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.50] s

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.65] s

  * igt@kms_plane_cursor@viewport@pipe-a-vga-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.74] s

  * igt@kms_plane_cursor@viewport@pipe-a-vga-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.74] s

  * igt@kms_plane_cursor@viewport@pipe-a-vga-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.73] s

  * igt@kms_plane_cursor@viewport@pipe-b-dp-1-size-128:
    - Statuses : 2 pass(s)
    - Exec time: [2.45, 2.47] s

  * igt@kms_plane_cursor@viewport@pipe-b-dp-1-size-256:
    - Statuses : 2 pass(s)
    - Exec time: [2.45, 2.48] s

  * igt@kms_plane_cursor@viewport@pipe-b-dp-1-size-64:
    - Statuses : 2 pass(s)
    - Exec time: [2.58, 2.64] s

  * igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-128:
    - Statuses : 2 pass(s)
    - Exec time: [1.63, 2.50] s

  * igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-256:
    - Statuses : 2 pass(s)
    - Exec time: [1.63, 2.50] s

  * igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-64:
    - Statuses : 2 pass(s)
    - Exec time: [2.47, 3.32] s

  * igt@kms_plane_cursor@viewport@pipe-b-hdmi-a-2-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.47] s

  * igt@kms_plane_cursor@viewport@pipe-b-hdmi-a-2-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.47] s

  * igt@kms_plane_cursor@viewport@pipe-b-hdmi-a-2-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.57] s

  * igt@kms_plane_cursor@viewport@pipe-b-vga-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.74] s

  * igt@kms_plane_cursor@viewport@pipe-b-vga-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.74] s

  * igt@kms_plane_cursor@viewport@pipe-b-vga-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.78] s

  * igt@kms_plane_cursor@viewport@pipe-c-dp-1-size-128:
    - Statuses : 2 pass(s)
    - Exec time: [2.45, 2.47] s

  * igt@kms_plane_cursor@viewport@pipe-c-dp-1-size-256:
    - Statuses : 2 pass(s)
    - Exec time: [2.45, 2.48] s

  * igt@kms_plane_cursor@viewport@pipe-c-dp-1-size-64:
    - Statuses : 2 pass(s)
    - Exec time: [2.59, 2.64] s

  * igt@kms_plane_cursor@viewport@pipe-c-edp-1-size-128:
    - Statuses : 2 pass(s)
    - Exec time: [1.63, 2.50] s

  * igt@kms_plane_cursor@viewport@pipe-c-edp-1-size-256:
    - Statuses : 2 pass(s)
    - Exec time: [1.63, 2.50] s

  * igt@kms_plane_cursor@viewport@pipe-c-edp-1-size-64:
    - Statuses : 2 pass(s)
    - Exec time: [2.47, 3.34] s

  * igt@kms_plane_cursor@viewport@pipe-c-hdmi-a-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.46] s

  * igt@kms_plane_cursor@viewport@pipe-c-hdmi-a-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.47] s

  * igt@kms_plane_cursor@viewport@pipe-c-hdmi-a-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.54] s

  * igt@kms_plane_cursor@viewport@pipe-d-edp-1-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [1.63] s

  * igt@kms_plane_cursor@viewport@pipe-d-edp-1-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [1.64] s

  * igt@kms_plane_cursor@viewport@pipe-d-edp-1-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.47] s

  

Known issues
------------

  Here are the changes found in IGTPW_7631_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-massive:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][1] ([i915#4991])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl7/igt@gem_create@create-massive.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][2] ([i915#180]) +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([i915#4525]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-iclb2/igt@gem_exec_balancer@parallel-out-fence.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb6/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][5] -> [FAIL][6] ([i915#2842]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-apl8/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-apl8/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [PASS][7] -> [FAIL][8] ([i915#2842])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][9] -> [FAIL][10] ([i915#2849])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][11] -> [SKIP][12] ([i915#2190])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-tglb3/igt@gem_huc_copy@huc-copy.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-tglb7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-kbl:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#4613]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl1/igt@gem_lmem_swapping@parallel-random.html
    - shard-apl:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#4613])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-apl8/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-tglb:         NOTRUN -> [SKIP][15] ([i915#4270]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-tglb7/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-iclb:         NOTRUN -> [SKIP][16] ([i915#4270]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb3/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-apl:          NOTRUN -> [SKIP][17] ([fdo#109271]) +123 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-apl6/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_softpin@32b-excludes-last-page:
    - shard-snb:          NOTRUN -> [SKIP][18] ([fdo#109271]) +52 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-snb4/igt@gem_softpin@32b-excludes-last-page.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-kbl:          NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#3323])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl4/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-kbl:          NOTRUN -> [FAIL][20] ([i915#3318])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl1/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-iclb:         NOTRUN -> [SKIP][21] ([fdo#109289])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb8/igt@gen7_exec_parse@basic-offset.html
    - shard-tglb:         NOTRUN -> [SKIP][22] ([fdo#109289])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-tglb2/igt@gen7_exec_parse@basic-offset.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#2856])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb3/igt@gen9_exec_parse@unaligned-jump.html
    - shard-tglb:         NOTRUN -> [SKIP][24] ([i915#2527] / [i915#2856])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-tglb3/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][25] -> [SKIP][26] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-apl6/igt@i915_pm_dc@dc9-dpms.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-apl8/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_query@hwconfig_table:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#6245])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-tglb5/igt@i915_query@hwconfig_table.html
    - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#6245])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb4/igt@i915_query@hwconfig_table.html

  * igt@i915_selftest@live@sanitycheck:
    - shard-snb:          [PASS][29] -> [SKIP][30] ([fdo#109271])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-snb6/igt@i915_selftest@live@sanitycheck.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-snb7/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_suspend@debugfs-reader:
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-apl1/igt@i915_suspend@debugfs-reader.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-apl6/igt@i915_suspend@debugfs-reader.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([i915#5286])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-tglb3/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
    - shard-iclb:         NOTRUN -> [SKIP][34] ([i915#5286])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb8/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#111614])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-tglb7/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#110725] / [fdo#111614])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb1/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([fdo#110723])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb4/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#111615])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-tglb2/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#6095])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-tglb7/igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#3886]) +10 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl4/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#3886]) +6 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-apl6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#109278] / [i915#3886])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb2/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html
    - shard-glk:          NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#3886])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-glk1/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#111615] / [i915#3689])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-tglb3/igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109278]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb5/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#3689])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-tglb2/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-kbl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl1/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-apl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-apl1/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_chamelium@vga-hpd-enable-disable-mode:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-tglb3/igt@kms_chamelium@vga-hpd-enable-disable-mode.html

  * igt@kms_color_chamelium@ctm-limited-range:
    - shard-glk:          NOTRUN -> [SKIP][50] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-glk6/igt@kms_color_chamelium@ctm-limited-range.html
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb1/igt@kms_color_chamelium@ctm-limited-range.html
    - shard-snb:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-snb6/igt@kms_color_chamelium@ctm-limited-range.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          NOTRUN -> [TIMEOUT][53] ([i915#1319]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl1/igt@kms_content_protection@srm.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109274] / [fdo#111825])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-tglb2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb@varying-size:
    - shard-kbl:          NOTRUN -> [SKIP][55] ([fdo#109271]) +233 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl7/igt@kms_cursor_legacy@cursorb-vs-flipb@varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
    - shard-tglb:         [PASS][56] -> [FAIL][57] ([i915#2346])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#4103])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-tglb5/igt@kms_cursor_legacy@short-busy-flip-before-cursor.html
    - shard-iclb:         NOTRUN -> [SKIP][59] ([i915#4103])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb8/igt@kms_cursor_legacy@short-busy-flip-before-cursor.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([i915#3555] / [i915#3828])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb7/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109274]) +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb1/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([fdo#109274] / [fdo#111825] / [i915#3637]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-tglb3/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([i915#2672]) +7 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([i915#3555])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#109280] / [fdo#111825]) +9 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-stridechange:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#6497]) +3 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109280]) +9 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
    - shard-kbl:          [PASS][68] -> [DMESG-WARN][69] ([i915#180]) +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][70] ([i915#265])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][71] ([fdo#108145] / [i915#265])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][72] ([fdo#108145] / [i915#265])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-4:
    - shard-glk:          NOTRUN -> [SKIP][73] ([fdo#109271]) +26 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-glk2/igt@kms_plane_multiple@atomic-pipe-b-tiling-4.html
    - shard-tglb:         NOTRUN -> [SKIP][74] ([i915#5288])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-b-tiling-4.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-edp-1:
    - shard-iclb:         [PASS][75] -> [SKIP][76] ([i915#5176]) +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-iclb1/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-edp-1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb2/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-edp-1.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-kbl:          NOTRUN -> [SKIP][77] ([fdo#109271] / [i915#658]) +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl7/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-apl:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#658]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-apl1/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-iclb:         [PASS][79] -> [SKIP][80] ([fdo#109642] / [fdo#111068] / [i915#658])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb8/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         [PASS][81] -> [SKIP][82] ([fdo#109441]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb4/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-iclb:         [PASS][83] -> [SKIP][84] ([i915#5519]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-iclb4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglb:         [PASS][85] -> [SKIP][86] ([i915#5519])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-tglb2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-tglb7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-kbl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#533])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl1/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-kbl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#2437])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl7/igt@kms_writeback@writeback-fb-id.html

  * igt@prime_nv_api@i915_self_import_to_different_fd:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([fdo#109291])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-tglb7/igt@prime_nv_api@i915_self_import_to_different_fd.html
    - shard-iclb:         NOTRUN -> [SKIP][90] ([fdo#109291])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb1/igt@prime_nv_api@i915_self_import_to_different_fd.html

  * igt@sysfs_clients@fair-7:
    - shard-apl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#2994])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-apl4/igt@sysfs_clients@fair-7.html

  * igt@sysfs_clients@recycle-many:
    - shard-kbl:          NOTRUN -> [SKIP][92] ([fdo#109271] / [i915#2994]) +3 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl7/igt@sysfs_clients@recycle-many.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@smoketest:
    - shard-iclb:         [FAIL][93] ([i915#5099]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-iclb2/igt@gem_ctx_persistence@smoketest.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb3/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [TIMEOUT][95] ([i915#3070]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-iclb7/igt@gem_eio@unwedge-stress.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb5/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-iclb:         [SKIP][97] ([i915#4525]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-iclb7/igt@gem_exec_balancer@parallel-keep-in-fence.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb1/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [FAIL][99] ([i915#2846]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-kbl1/igt@gem_exec_fair@basic-deadline.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl4/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-glk:          [FAIL][101] ([i915#2842]) -> [PASS][102] +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-glk9/igt@gem_exec_fair@basic-pace@vcs0.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-glk2/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [DMESG-WARN][103] ([i915#180]) -> [PASS][104] +2 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-kbl1/igt@i915_suspend@forcewake.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl4/igt@i915_suspend@forcewake.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
    - shard-kbl:          [FAIL][105] ([i915#1188]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-kbl1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl7/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][107] ([fdo#109441]) -> [PASS][108] +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][109] ([i915#180]) -> [PASS][110] +2 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-apl3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [FAIL][111] ([i915#5784]) -> [TIMEOUT][112] ([i915#3063])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-tglb3/igt@gem_eio@unwedge-stress.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-tglb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [SKIP][113] ([i915#4525]) -> [FAIL][114] ([i915#6117])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-iclb6/igt@gem_exec_balancer@parallel-ordering.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          [SKIP][115] ([fdo#109271]) -> [FAIL][116] ([i915#2842])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@kms_content_protection@mei_interface:
    - shard-tglb:         [SKIP][117] ([fdo#109300]) -> [SKIP][118] ([i915#1063])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-tglb3/igt@kms_content_protection@mei_interface.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-tglb2/igt@kms_content_protection@mei_interface.html
    - shard-iclb:         [SKIP][119] ([fdo#109300]) -> [SKIP][120] ([fdo#109300] / [fdo#111066])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-iclb7/igt@kms_content_protection@mei_interface.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb5/igt@kms_content_protection@mei_interface.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [FAIL][121] ([i915#4767]) -> [INCOMPLETE][122] ([i915#180] / [i915#4939])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-iclb:         [SKIP][123] ([i915#2920]) -> [SKIP][124] ([fdo#111068] / [i915#658])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][125], [FAIL][126], [FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130], [FAIL][131], [FAIL][132], [FAIL][133]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][134], [FAIL][135], [FAIL][136], [FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#92])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-kbl1/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-kbl1/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-kbl1/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-kbl7/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-kbl7/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-kbl4/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-kbl7/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-kbl7/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-kbl7/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl1/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl1/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl7/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl7/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl7/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl1/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl1/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl7/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl7/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl7/igt@runner@aborted.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3070]: https://gitlab.freedesktop.org/drm/intel/issues/3070
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4939]: https://gitlab.freedesktop.org/drm/intel/issues/4939
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5099]: https://gitlab.freedesktop.org/drm/intel/issues/5099
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6620 -> IGTPW_7631

  CI-20190529: 20190529
  CI_DRM_11981: 6f207fdd93a13166b4adfe2f3a2972a9c632e757 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7631: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/index.html
  IGT_6620: 90549cfba1606b695fe60f78ef87b7d54586eab7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/index.html

--===============0824141664128265260==
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
amic</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/107119/">https://patchwork.freedesktop.org/series/107119/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7631/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6620_full -&gt; IGTPW_7631_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/index.=
html</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6620_full and IGTPW_7631_full=
:</p>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-dp-1-size-256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.45, 2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-dp-1-size-64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.64, 2.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.63, 2.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.63, 2.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-vga-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-vga-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-vga-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-dp-1-size-128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-dp-1-size-256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.46, 2.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-dp-1-size-64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.60, 2.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.64, 2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.63, 2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.49, 3.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-2-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-2-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-2-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-vga-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-vga-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-b-vga-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-c-dp-1-size-128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-c-dp-1-size-256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-c-dp-1-size-64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.60, 2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-c-edp-1-size-128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.64, 2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-c-edp-1-size-256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.64, 2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-c-edp-1-size-64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.45, 3.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-c-hdmi-a-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-c-hdmi-a-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-c-hdmi-a-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.44] s</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.43, 2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-dp-1-size-256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.43, 2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-dp-1-size-64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.44, 2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-edp-1-size-128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.62, 2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-edp-1-size-256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.62, 2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.62, 2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-vga-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-vga-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-vga-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-dp-1-size-128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.43, 2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-dp-1-size-256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.43, 2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-dp-1-size-64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.56, 2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.62, 2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-edp-1-size-256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.62, 2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-edp-1-size-64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.52, 3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-hdmi-a-2-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-hdmi-a-2-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-hdmi-a-2-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-vga-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-vga-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-vga-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-dp-1-size-128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.43, 2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-dp-1-size-256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.43, 2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-dp-1-size-64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.57, 2.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-edp-1-size-128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.62, 2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-edp-1-size-256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.62, 2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-edp-1-size-64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.48, 3.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-hdmi-a-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-hdmi-a-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-hdmi-a-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-d-edp-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-d-edp-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-d-edp-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.50] s</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.45, 2.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-dp-1-size-256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.45, 2.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-dp-1-size-64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.45, 2.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.63, 2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.63, 2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.63, 2.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-vga-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-vga-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-vga-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-dp-1-size-128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.45, 2.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-dp-1-size-256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.45, 2.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-dp-1-size-64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.58, 2.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.63, 2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.63, 2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.47, 3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-hdmi-a-2-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-hdmi-a-2-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-hdmi-a-2-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-vga-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-vga-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-vga-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-c-dp-1-size-128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.45, 2.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-c-dp-1-size-256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.45, 2.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-c-dp-1-size-64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.59, 2.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-c-edp-1-size-128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.63, 2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-c-edp-1-size-256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.63, 2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-c-edp-1-size-64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.47, 3.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-c-hdmi-a-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-c-hdmi-a-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-c-hdmi-a-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-d-edp-1-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-d-edp-1-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-d-edp-1-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.47] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7631_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-kbl7/igt@gem_create@create-massive.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/499=
1">i915#4991</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@b=
cs0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/180">i915#180</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-iclb2/igt@gem_exec_balancer@parallel-out-fence.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/sha=
rd-iclb6/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>) +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-apl8/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-=
apl8/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shar=
d-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-=
iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2849">i915#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-tglb3/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-tglb7/igt@ge=
m_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-kbl1/igt@gem_lmem_swapping@parallel-random.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>) +3 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-apl8/igt@gem_lmem_swapping@parallel-random.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-tglb7/igt@gem_pxp@create-protected-buffer.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/42=
70">i915#4270</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-valid-protected-context:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-iclb3/igt@gem_pxp@create-valid-protected-con=
text.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4270">i915#4270</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-apl6/igt@gem_render_copy@x-tiled-to-vebox-yf=
-tiled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a>) +123 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@32b-excludes-last-page:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-snb4/igt@gem_softpin@32b-excludes-last-page.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a>) +52 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-kbl4/igt@gem_userptr_blits@dmabuf-sync.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-kbl1/igt@gem_userptr_blits@vma-merge.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3318">i=
915#3318</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-iclb8/igt@gen7_exec_parse@basic-offset.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289"=
>fdo#109289</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-tglb2/igt@gen7_exec_parse@basic-offset.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289"=
>fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-iclb3/igt@gen9_exec_parse@unaligned-jump.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856=
">i915#2856</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-tglb3/igt@gen9_exec_parse@unaligned-jump.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527=
">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2856">i915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-apl6/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-apl8/igt@i915=
_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-tglb5/igt@i915_query@hwconfig_table.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6245">i91=
5#6245</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-iclb4/igt@i915_query@hwconfig_table.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6245">i91=
5#6245</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-snb6/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-snb7=
/igt@i915_selftest@live@sanitycheck.html">SKIP</a> (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-apl1/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-apl6/ig=
t@i915_suspend@debugfs-reader.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-tglb3/igt@kms_big_fb@4-tiled-8bpp-rotate-0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/52=
86">i915#5286</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-iclb8/igt@kms_big_fb@4-tiled-8bpp-rotate-0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/52=
86">i915#5286</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-tglb7/igt@kms_big_fb@y-tiled-8bpp-rotate-270.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-iclb1/igt@kms_big_fb@y-tiled-8bpp-rotate-270.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
10725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-iclb4/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
0723">fdo#110723</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-tglb2/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1615">fdo#111615</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-tglb7/igt@kms_ccs@pipe-b-crc-primary-basic-4=
_tiled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-kbl4/igt@kms_ccs@pipe-c-bad-aux-stride-y_til=
ed_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-apl6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-iclb2/igt@kms_ccs@pipe-c-crc-primary-rotation=
-180-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-glk1/igt@kms_ccs@pipe-c-crc-primary-rotation-=
180-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-tglb3/igt@kms_ccs@pipe-c-crc-primary-rotatio=
n-180-yf_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3689">i915#3689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-iclb5/igt@kms_ccs@pipe-d-crc-primary-basic-y_=
tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109278">fdo#109278</a>) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-tglb2/igt@kms_ccs@pipe-d-crc-primary-basic-y_=
tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3689">i915#3689</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-kbl1/igt@kms_chamelium@hdmi-hpd-enable-disab=
le-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-apl1/igt@kms_chamelium@hdmi-hpd-storm.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-tglb3/igt@kms_chamelium@vga-hpd-enable-disab=
le-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-limited-range:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-glk6/igt@kms_color_chamelium@ctm-limited-rang=
e.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-iclb1/igt@kms_color_chamelium@ctm-limited-ran=
ge.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-snb6/igt@kms_color_chamelium@ctm-limited-rang=
e.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-kbl1/igt@kms_content_protection@srm.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319"=
>i915#1319</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-tglb2/igt@kms_cursor_legacy@2x-long-cursor-v=
s-flip-legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D111825">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb@varying-size:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-kbl7/igt@kms_cursor_legacy@cursorb-vs-flipb@=
varying-size.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271">fdo#109271</a>) +233 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitio=
ns-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor@a=
tomic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-tglb5/igt@kms_cursor_legacy@short-busy-flip-b=
efore-cursor.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4103">i915#4103</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-iclb8/igt@kms_cursor_legacy@short-busy-flip-b=
efore-cursor.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4103">i915#4103</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-iclb7/igt@kms_dsc@dsc-with-formats.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i91=
5#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/382=
8">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-iclb1/igt@kms_flip@2x-modeset-vs-vblank-race=
-interruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109274">fdo#109274</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-tglb3/igt@kms_flip@2x-plain-flip-ts-check.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/3637">i915#3637</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +7=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-xti=
le-to-16bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-stridechange:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-st=
ridechange.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/6497">i915#6497</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-iclb7/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-=
a-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7631/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspe=
nd@pipe-a-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/180">i915#180</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-=
transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-=
basic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-=
opaque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-4:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-glk2/igt@kms_plane_multiple@atomic-pipe-b-til=
ing-4.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a>) +26 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-b-ti=
ling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5288">i915#5288</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-=
b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-iclb1/igt@kms_plane_scaling@plane-downscale-with-pixel-form=
at-factor-0-5@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7631/shard-iclb2/igt@kms_plane_scaling@plane=
-downscale-with-pixel-format-factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +=
2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-kbl7/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-exceed-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/658">i915#658</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-apl1/igt@kms_psr2_sf@overlay-plane-move-cont=
inuous-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-icl=
b8/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-ic=
lb4/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar i=
ssue</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-iclb4/igt@kms_psr_stress_test@flip-primary-invalidate-overl=
ay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7631/shard-iclb4/igt@kms_psr_stress_test@flip-primary-invalidate-ove=
rlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/5519">i915#5519</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-tglb2/igt@kms_psr_stress_test@invalidate-primary-flip-overl=
ay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7631/shard-tglb7/igt@kms_psr_stress_test@invalidate-primary-flip-ove=
rlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/5519">i915#5519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-kbl1/igt@kms_vblank@pipe-d-wait-idle.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-kbl7/igt@kms_writeback@writeback-fb-id.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_self_import_to_different_fd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-tglb7/igt@prime_nv_api@i915_self_import_to_di=
fferent_fd.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109291">fdo#109291</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-iclb1/igt@prime_nv_api@i915_self_import_to_di=
fferent_fd.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109291">fdo#109291</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-7:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-apl4/igt@sysfs_clients@fair-7.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7631/shard-kbl7/igt@sysfs_clients@recycle-many.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2994">i915#2994</a>) +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-iclb2/igt@gem_ctx_persistence@smoketest.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5099">i915#5099</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shar=
d-iclb3/igt@gem_ctx_persistence@smoketest.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-iclb7/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3070">i915#3070</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-ic=
lb5/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-iclb7/igt@gem_exec_balancer@parallel-keep-in-fence.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i9=
15#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7631/shard-iclb1/igt@gem_exec_balancer@parallel-keep-in-fence.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-kbl1/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-=
kbl4/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-glk9/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard=
-glk2/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-kbl1/igt@i915_suspend@forcewake.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kb=
l4/igt@i915_suspend@forcewake.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-kbl1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#118=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631=
/shard-kbl7/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/s=
hard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/18=
0">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7631/shard-apl3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">P=
ASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-tglb3/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-tglb7=
/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/3063">i915#3063</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-iclb6/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#45=
25</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_763=
1/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/6117">i915#6117</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/sha=
rd-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6620/shard-tglb3/igt@kms_content_protection@mei_interface.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">fdo#10=
9300</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
631/shard-tglb2/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1063">i915#1063</a=
>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6620/shard-iclb7/igt@kms_content_protection@mei_interface.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">fdo#10=
9300</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
631/shard-iclb5/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">fdo#109300<=
/a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111066">fdo=
#111066</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4767">i915#4767</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kb=
l1/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/4939">i915#4939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6620/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/29=
20">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7631/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-continuous-sf=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6620/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-kbl1/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/=
shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGT_6620/shard-kbl7/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-kbl7/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_6620/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-kbl7/igt@runner=
@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6620/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/shard-kbl7/igt@runner@aborted.ht=
ml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/5257">i915#5257</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7631/shard-kbl1/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl1=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7631/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl7/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7631/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl1/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7631/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl7/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_76=
31/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7631/shard-kbl7/igt@runner@aborted.html">FA=
IL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i9=
15#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/300=
2">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/5257">i915#5257</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/92">i915#92</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6620 -&gt; IGTPW_7631</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11981: 6f207fdd93a13166b4adfe2f3a2972a9c632e757 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7631: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7631/index.htm=
l<br />
  IGT_6620: 90549cfba1606b695fe60f78ef87b7d54586eab7 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0824141664128265260==--
