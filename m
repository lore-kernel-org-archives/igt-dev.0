Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 25 May 2021 16:12:53 -0000
Message-ID: <162195917314.1316.9447258216153053326@emeril.freedesktop.org>
References: <20210525200508.5451-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20210525200508.5451-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fsetmode=3A_Fix_mode_selection_for_Nx_tests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1854041424=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1854041424==
Content-Type: multipart/alternative;
 boundary="===============4409813326193772605=="

--===============4409813326193772605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_setmode: Fix mode selection for Nx tests
URL   : https://patchwork.freedesktop.org/series/90525/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10130_full -> IGTPW_5847_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/index.html

New tests
---------

  New tests have been introduced between CI_DRM_10130_full and IGTPW_5847_full:

### New IGT tests (117) ###

  * igt@gem_exec_balancer@hog:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_balancer@sliced:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.61] s

  * igt@gem_exec_endless@dispatch:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_endless@dispatch@bcs0:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.00] s

  * igt@gem_exec_endless@dispatch@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_endless@dispatch@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_endless@dispatch@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@gem_exec_endless@dispatch@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_reloc@basic-concurrent0:
    - Statuses : 6 pass(s)
    - Exec time: [5.39, 5.47] s

  * igt@gem_exec_reloc@basic-concurrent16:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_schedule@preempt-engines:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_schedule@preempt-engines@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.34] s

  * igt@gem_exec_schedule@preempt-engines@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.09, 0.31] s

  * igt@gem_exec_schedule@preempt-engines@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.26] s

  * igt@gem_exec_schedule@preempt-engines@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.11] s

  * igt@gem_exec_schedule@preempt-engines@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.25] s

  * igt@gem_exec_schedule@submit-early-slice:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_schedule@submit-early-slice@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_exec_schedule@submit-early-slice@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.08] s

  * igt@gem_exec_schedule@submit-early-slice@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.03, 0.07] s

  * igt@gem_exec_schedule@submit-early-slice@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@gem_exec_schedule@submit-early-slice@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_exec_schedule@submit-golden-slice:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_schedule@submit-golden-slice@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@gem_exec_schedule@submit-golden-slice@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@gem_exec_schedule@submit-golden-slice@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@gem_exec_schedule@submit-golden-slice@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@gem_exec_schedule@submit-golden-slice@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@gem_exec_schedule@submit-late-slice:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@submit-late-slice@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.06] s

  * igt@gem_exec_schedule@submit-late-slice@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_exec_schedule@submit-late-slice@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.06] s

  * igt@gem_exec_schedule@submit-late-slice@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@gem_exec_schedule@submit-late-slice@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@i915_pciid:
    - Statuses : 6 pass(s)
    - Exec time: [0.04, 0.21] s

  * igt@i915_pm_lpsp@kms-lpsp:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.17] s

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_pm_rc6_residency@rc6-fence:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_query@engine-info:
    - Statuses : 5 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_query@engine-info-invalid:
    - Statuses : 5 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - Statuses : 5 pass(s)
    - Exec time: [1.71, 5.64] s

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - Statuses : 5 pass(s)
    - Exec time: [1.71, 4.62] s

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - Statuses : 4 skip(s)
    - Exec time: [0.05, 0.26] s

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - Statuses : 4 skip(s)
    - Exec time: [0.03, 0.25] s

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - Statuses : 5 pass(s)
    - Exec time: [1.75, 5.75] s

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - Statuses : 5 pass(s)
    - Exec time: [1.74, 7.57] s

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - Statuses : 5 skip(s)
    - Exec time: [0.01, 0.27] s

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - Statuses : 4 skip(s)
    - Exec time: [0.03, 0.25] s

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - Statuses : 3 pass(s)
    - Exec time: [2.13, 9.63] s

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - Statuses : 6 pass(s)
    - Exec time: [2.12, 11.68] s

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - Statuses : 5 skip(s)
    - Exec time: [0.06, 0.49] s

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - Statuses : 4 skip(s)
    - Exec time: [0.18, 0.51] s

  * igt@kms_big_fb@linear-8bpp-rotate-0:
    - Statuses : 5 pass(s)
    - Exec time: [1.33, 28.48] s

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - Statuses : 4 skip(s)
    - Exec time: [0.04, 0.31] s

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - Statuses : 5 skip(s)
    - Exec time: [0.01, 0.28] s

  * igt@kms_big_fb@linear-addfb:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - Statuses : 2 pass(s)
    - Exec time: [1.58, 4.55] s

  * igt@kms_big_fb@x-tiled-16bpp-rotate-180:
    - Statuses : 5 pass(s)
    - Exec time: [1.52, 4.49] s

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - Statuses : 5 skip(s)
    - Exec time: [0.03, 0.25] s

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - Statuses : 6 skip(s)
    - Exec time: [0.02, 0.28] s

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - Statuses : 5 pass(s)
    - Exec time: [1.69, 29.30] s

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - Statuses : 5 pass(s)
    - Exec time: [1.67, 6.59] s

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - Statuses : 5 skip(s)
    - Exec time: [0.03, 0.24] s

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - Statuses : 4 pass(s)
    - Exec time: [3.03, 8.95] s

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - Statuses : 6 skip(s)
    - Exec time: [0.06, 0.54] s

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - Statuses : 5 skip(s)
    - Exec time: [0.06, 0.50] s

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - Statuses : 5 pass(s)
    - Exec time: [1.37, 3.83] s

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - Statuses : 5 pass(s)
    - Exec time: [1.33, 3.57] s

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - Statuses : 5 skip(s)
    - Exec time: [0.02, 0.28] s

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - Statuses : 6 skip(s)
    - Exec time: [0.02, 0.32] s

  * igt@kms_big_fb@x-tiled-addfb:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.65] s

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.47] s

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 1.98] s

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.04, 2.00] s

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - Statuses : 5 pass(s)
    - Exec time: [1.97, 6.66] s

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.41] s

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.66] s

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - Statuses : 3 pass(s)
    - Exec time: [1.98, 5.44] s

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.00, 30.38] s

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - Statuses : 4 skip(s)
    - Exec time: [0.11, 0.51] s

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - Statuses : 4 pass(s)
    - Exec time: [1.29, 28.41] s

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - Statuses : 5 pass(s)
    - Exec time: [1.29, 3.60] s

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.30] s

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - Statuses : 5 skip(s)
    - Exec time: [0.05, 0.29] s

  * igt@kms_big_fb@y-tiled-addfb:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - Statuses : 4 pass(s)
    - Exec time: [0.00] s

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 28.59] s

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 5.83] s

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 2.00] s

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 28.71] s

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 5.54] s

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.79] s

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 6.24] s

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 5.28] s

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-addfb:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.00] s

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_chamelium@hdmi-audio:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_5847_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-massive:
    - shard-snb:          NOTRUN -> [DMESG-WARN][1] ([i915#3002])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-snb5/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#1099]) +9 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-snb6/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglb:         NOTRUN -> [SKIP][3] ([i915#280])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb3/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          NOTRUN -> [FAIL][4] ([i915#2846])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-kbl7/igt@gem_exec_fair@basic-deadline.html
    - shard-apl:          NOTRUN -> [FAIL][5] ([i915#2846])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-apl8/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [PASS][6] -> [FAIL][7] ([i915#2842])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb6/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][8] ([i915#2842]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb5/igt@gem_exec_fair@basic-none-vip@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][9] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-glk6/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [PASS][10] -> [FAIL][11] ([i915#2842]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-glk7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-glk6/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [PASS][12] -> [FAIL][13] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-kbl2/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][14] ([i915#2842]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_params@no-bsd:
    - shard-iclb:         NOTRUN -> [SKIP][15] ([fdo#109283])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb8/igt@gem_exec_params@no-bsd.html

  * igt@gem_exec_params@secure-non-master:
    - shard-tglb:         NOTRUN -> [SKIP][16] ([fdo#112283])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb1/igt@gem_exec_params@secure-non-master.html
    - shard-iclb:         NOTRUN -> [SKIP][17] ([fdo#112283])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb6/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-apl:          NOTRUN -> [FAIL][18] ([i915#2389]) +3 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-apl2/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#2190])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-apl8/igt@gem_huc_copy@huc-copy.html

  * igt@gem_media_vme:
    - shard-tglb:         NOTRUN -> [SKIP][20] ([i915#284])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb6/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy:
    - shard-apl:          [PASS][21] -> [INCOMPLETE][22] ([i915#3468])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-apl2/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-apl2/igt@gem_mmap_gtt@cpuset-basic-small-copy.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-snb:          NOTRUN -> [INCOMPLETE][23] ([i915#2055] / [i915#3468])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-snb7/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - shard-glk:          NOTRUN -> [INCOMPLETE][24] ([i915#3468])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-glk2/igt@gem_mmap_gtt@fault-concurrent-y.html

  * igt@gem_pread@exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][25] ([i915#2658]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb6/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][26] ([i915#2658]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-glk3/igt@gem_pread@exhaustion.html
    - shard-apl:          NOTRUN -> [WARN][27] ([i915#2658]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-apl2/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][28] ([i915#2658]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb8/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][29] ([i915#2658]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-snb7/igt@gem_pwrite@basic-exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][30] ([i915#2658])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-kbl4/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][31] ([fdo#109271]) +211 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-kbl4/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#768]) +6 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb8/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#109312])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb7/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-iclb:         NOTRUN -> [SKIP][34] ([fdo#109312])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb3/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-apl:          NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#3323])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-apl2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#3297]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb3/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#3297]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb8/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#112306]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb6/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#112306]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb6/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#3288])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb8/igt@i915_pm_dc@dc9-dpms.html
    - shard-iclb:         NOTRUN -> [FAIL][41] ([i915#3343])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb5/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#109289] / [fdo#111719])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109293] / [fdo#109506])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#109506] / [i915#2411])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#109303])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb5/igt@i915_query@query-topology-known-pci-ids.html
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109303])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb6/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_selftest@live@execlists:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][47] ([i915#3462])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb5/igt@i915_selftest@live@execlists.html
    - shard-glk:          NOTRUN -> [DMESG-FAIL][48] ([i915#3462])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-glk7/igt@i915_selftest@live@execlists.html
    - shard-iclb:         NOTRUN -> [DMESG-FAIL][49] ([i915#3462])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb6/igt@i915_selftest@live@execlists.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][50] ([i915#2782] / [i915#3462] / [i915#794])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-kbl3/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_lrc:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][51] ([i915#2373])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb5/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][52] ([i915#1759] / [i915#2291])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb5/igt@i915_selftest@live@gt_pm.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([i915#1769]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
    - shard-tglb:         NOTRUN -> [SKIP][54] ([i915#1769])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90 (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#111614]) +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270 (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#110725] / [fdo#111614]) +3 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb8/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270 (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#110723])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb8/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_big_joiner@basic:
    - shard-apl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#2705])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-apl7/igt@kms_big_joiner@basic.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([i915#2705])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb1/igt@kms_big_joiner@invalid-modeset.html
    - shard-kbl:          NOTRUN -> [SKIP][60] ([fdo#109271] / [i915#2705])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-kbl7/igt@kms_big_joiner@invalid-modeset.html
    - shard-glk:          NOTRUN -> [SKIP][61] ([fdo#109271] / [i915#2705])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-glk5/igt@kms_big_joiner@invalid-modeset.html
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#2705])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb1/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_chamelium@dp-hpd-storm:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109284] / [fdo#111827]) +17 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb6/igt@kms_chamelium@dp-hpd-storm.html

  * igt@kms_chamelium@hdmi-aspect-ratio:
    - shard-glk:          NOTRUN -> [SKIP][64] ([fdo#109271] / [fdo#111827]) +17 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-glk5/igt@kms_chamelium@hdmi-aspect-ratio.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [fdo#111827]) +22 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-apl7/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@hdmi-mode-timings:
    - shard-snb:          NOTRUN -> [SKIP][66] ([fdo#109271] / [fdo#111827]) +29 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-snb5/igt@kms_chamelium@hdmi-mode-timings.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-kbl:          NOTRUN -> [SKIP][67] ([fdo#109271] / [fdo#111827]) +27 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-kbl7/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color@pipe-c-degamma:
    - shard-iclb:         NOTRUN -> [FAIL][68] ([i915#1149])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb8/igt@kms_color@pipe-c-degamma.html
    - shard-tglb:         NOTRUN -> [FAIL][69] ([i915#1149])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb8/igt@kms_color@pipe-c-degamma.html

  * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html

  * igt@kms_color_chamelium@pipe-d-ctm-max:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#109284] / [fdo#111827]) +16 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb5/igt@kms_color_chamelium@pipe-d-ctm-max.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          NOTRUN -> [TIMEOUT][72] ([i915#1319]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-apl3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content_type_change:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109300] / [fdo#111066]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb6/igt@kms_content_protection@content_type_change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([i915#3116])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb3/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-tglb:         NOTRUN -> [SKIP][75] ([i915#3116])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          NOTRUN -> [FAIL][76] ([i915#2105])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-kbl2/igt@kms_content_protection@uevent.html
    - shard-tglb:         NOTRUN -> [SKIP][77] ([fdo#111828])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([fdo#109279] / [i915#3359]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109278] / [fdo#109279]) +3 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#3359]) +8 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109278]) +35 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_58

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/index.html

--===============4409813326193772605==
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
<tr><td><b>Series:</b></td><td>tests/kms_setmode: Fix mode selection for Nx tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/90525/">https://patchwork.freedesktop.org/series/90525/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10130_full -&gt; IGTPW_5847_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/index.html</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10130_full and IGTPW_5847_full:</p>
<h3>New IGT tests (117)</h3>
<ul>
<li>
<p>igt@gem_exec_balancer@hog:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@sliced:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.61] s</li>
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
<li>Exec time: [0.00] s</li>
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
<li>Statuses : 1 pass(s)</li>
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
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [5.39, 5.47] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
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
<p>igt@gem_exec_schedule@preempt-engines@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-engines@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.09, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-engines@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-engines@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-engines@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.25] s</li>
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
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-early-slice@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-early-slice@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.03, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-early-slice@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-early-slice@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-golden-slice:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-golden-slice@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-golden-slice@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-golden-slice@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-golden-slice@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-golden-slice@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
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
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-late-slice@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-late-slice@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-late-slice@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-late-slice@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@i915_pciid:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.04, 0.21] s</li>
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
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_query@engine-info:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_query@engine-info-invalid:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.71, 5.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.71, 4.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.05, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.03, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.75, 5.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.74, 7.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.01, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.03, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.13, 9.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.12, 11.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.06, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.18, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.33, 28.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.04, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.01, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-addfb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.58, 4.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-180:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.52, 4.49] s</li>
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
<li>Exec time: [0.02, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.69, 29.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.67, 6.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.03, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [3.03, 8.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.06, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.06, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.37, 3.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.33, 3.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.02, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.02, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
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
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.04, 2.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.97, 6.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 6.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.98, 5.44] s</li>
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
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 30.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.11, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.29, 28.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.29, 3.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.05, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
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
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 28.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 5.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 28.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 5.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 6.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 6.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 5.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
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
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5847_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-snb5/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-snb6/igt@gem_ctx_persistence@legacy-engines-mixed.html">SKIP</a> ([fdo#109271] / [i915#1099]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb3/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-apl8/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb6/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb5/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-glk6/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-glk7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-glk6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-kbl2/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-bsd:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb8/igt@gem_exec_params@no-bsd.html">SKIP</a> ([fdo#109283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb1/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb6/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([fdo#112283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-apl2/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-apl8/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb6/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10130/shard-apl2/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-apl2/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">INCOMPLETE</a> ([i915#3468])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-snb7/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">INCOMPLETE</a> ([i915#2055] / [i915#3468])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-y:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-glk2/igt@gem_mmap_gtt@fault-concurrent-y.html">INCOMPLETE</a> ([i915#3468])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb6/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-glk3/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-apl2/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb8/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-snb7/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-kbl4/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-kbl4/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([fdo#109271]) +211 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb8/igt@gem_render_copy@y-tiled-to-vebox-linear.html">SKIP</a> ([i915#768]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb7/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb3/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-apl2/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb3/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb8/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb6/igt@gen9_exec_parse@bb-secure.html">SKIP</a> ([fdo#112306]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb6/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> ([fdo#112306]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb8/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([i915#3288])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb5/igt@i915_pm_dc@dc9-dpms.html">FAIL</a> ([i915#3343])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> ([fdo#109289] / [fdo#111719])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109293] / [fdo#109506])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109506] / [i915#2411])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb5/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb6/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb5/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> ([i915#3462])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-glk7/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> ([i915#3462])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb6/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> ([i915#3462])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-kbl3/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> ([i915#2782] / [i915#3462] / [i915#794])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb5/igt@i915_selftest@live@gt_lrc.html">DMESG-FAIL</a> ([i915#2373])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb5/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> ([i915#1759] / [i915#2291])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> ([i915#1769]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> ([i915#1769])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90 (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270 (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb8/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270 (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb8/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-apl7/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109271] / [i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-kbl7/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-glk5/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb6/igt@kms_chamelium@dp-hpd-storm.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-aspect-ratio:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-glk5/igt@kms_chamelium@hdmi-aspect-ratio.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-apl7/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-mode-timings:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-snb5/igt@kms_chamelium@hdmi-mode-timings.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-kbl7/igt@kms_chamelium@vga-hpd-without-ddc.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-degamma:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb8/igt@kms_color@pipe-c-degamma.html">FAIL</a> ([i915#1149])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb8/igt@kms_color@pipe-c-degamma.html">FAIL</a> ([i915#1149])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-green-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-max:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb5/igt@kms_color_chamelium@pipe-d-ctm-max.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-apl3/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content_type_change:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb6/igt@kms_content_protection@content_type_change.html">SKIP</a> ([fdo#109300] / [fdo#111066]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb3/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-kbl2/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb3/igt@kms_content_protection@uevent.html">SKIP</a> ([fdo#111828])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html">SKIP</a> ([fdo#109279] / [i915#3359]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5847/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen.html">SKIP</a> ([i915#3359]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_58">SKIP</a> ([fdo#109278]) +35 similar issues</li>
</ul>
</li>
</ul>

</body>
</html>

--===============4409813326193772605==--

--===============1854041424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1854041424==--
