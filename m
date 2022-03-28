Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7775208044683946465=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maxime Ripard" <maxime@cerno.tech>
Date: Mon, 28 Mar 2022 19:08:42 -0000
Message-ID: <164849452241.2846.12744785311234377100@emeril.freedesktop.org>
References: <20220328145509.2331195-1-maxime@cerno.tech>
In-Reply-To: <20220328145509.2331195-1-maxime@cerno.tech>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgV3JpdGVi?=
 =?utf-8?q?ack_fixes_and_improvements_=28rev2=29?=
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

--===============7775208044683946465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Writeback fixes and improvements (rev2)
URL   : https://patchwork.freedesktop.org/series/101159/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11412_full -> IGTPW_6839_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6839_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6839_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/index.html

Participating hosts (11 -> 7)
------------------------------

  Missing    (4): pig-skl-6260u shard-skl pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6839_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_create@create-clear:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb7/igt@gem_create@create-clear.html

  
Known issues
------------

  Here are the changes found in IGTPW_6839_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-snb:          NOTRUN -> [INCOMPLETE][2] ([i915#5441]) +7 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-snb5/igt@core_hotunplug@unbind-rebind.html
    - shard-apl:          NOTRUN -> [INCOMPLETE][3] ([i915#1373] / [i915#1982] / [i915#5441])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl8/igt@core_hotunplug@unbind-rebind.html

  * igt@feature_discovery@chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][4] ([fdo#111827])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb5/igt@feature_discovery@chamelium.html

  * igt@feature_discovery@display-3x:
    - shard-iclb:         NOTRUN -> [SKIP][5] ([i915#1839])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb8/igt@feature_discovery@display-3x.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglb:         NOTRUN -> [SKIP][6] ([i915#3555] / [i915#5325])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb1/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-iclb:         NOTRUN -> [SKIP][7] ([i915#5327]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb8/igt@gem_ccs@suspend-resume.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#1099]) +7 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-snb2/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_exec_balancer@parallel:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][9] ([i915#5076]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-kbl1/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][10] ([i915#5076])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         NOTRUN -> [SKIP][11] ([i915#4525])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb8/igt@gem_exec_balancer@parallel-keep-submit-fence.html
    - shard-tglb:         NOTRUN -> [DMESG-WARN][12] ([i915#5076])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb1/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          NOTRUN -> [FAIL][13] ([i915#2846])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-glk8/igt@gem_exec_fair@basic-deadline.html
    - shard-apl:          NOTRUN -> [FAIL][14] ([i915#2846])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl3/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][15] ([i915#2842]) +6 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb6/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][16] ([i915#2842]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-kbl:          NOTRUN -> [FAIL][17] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-kbl4/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][18] ([i915#2842]) +3 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb2/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-apl:          NOTRUN -> [FAIL][19] ([i915#2842])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl7/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_params@no-vebox:
    - shard-iclb:         NOTRUN -> [SKIP][20] ([fdo#109283])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb8/igt@gem_exec_params@no-vebox.html

  * igt@gem_lmem_swapping@basic:
    - shard-iclb:         NOTRUN -> [SKIP][21] ([i915#4613]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb5/igt@gem_lmem_swapping@basic.html
    - shard-tglb:         NOTRUN -> [SKIP][22] ([i915#4613]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb5/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-apl:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#4613]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl6/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-glk:          NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#4613]) +3 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-glk4/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-kbl:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#4613]) +5 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-kbl3/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_ppgtt@blt-vs-render-ctx0:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][26] ([i915#5441])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb7/igt@gem_ppgtt@blt-vs-render-ctx0.html

  * igt@gem_pread@exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][27] ([i915#2658])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb6/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][28] ([i915#2658])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-snb4/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-tglb:         NOTRUN -> [SKIP][29] ([i915#4270]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb6/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([i915#4270]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb5/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#768]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb5/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-glk:          NOTRUN -> [SKIP][32] ([fdo#109271]) +216 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-glk7/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][33] ([i915#5441]) +12 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb6/igt@gem_tiled_partial_pwrite_pread@writes.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][34] ([i915#5441]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-glk6/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-apl:          NOTRUN -> [INCOMPLETE][35] ([i915#5441]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl1/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([i915#3297])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb2/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#3297]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb7/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen3_render_linear_blits:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#109289]) +7 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb1/igt@gen3_render_linear_blits.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109289]) +5 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb4/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([i915#2856]) +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb4/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#2527] / [i915#2856]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb5/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_hangman@engine-engine-hang:
    - shard-snb:          NOTRUN -> [SKIP][42] ([fdo#109271]) +673 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-snb5/igt@i915_hangman@engine-engine-hang.html

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([i915#1902])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb7/igt@i915_pm_lpsp@screens-disabled.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglb:         NOTRUN -> [WARN][44] ([i915#2681] / [i915#2684])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb2/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#111644] / [i915#1397] / [i915#2411]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb5/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#110892]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          NOTRUN -> [INCOMPLETE][47] ([i915#3921])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-snb5/igt@i915_selftest@live@hangcheck.html

  * igt@kms_atomic@atomic_plane_damage:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([i915#4765])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb8/igt@kms_atomic@atomic_plane_damage.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([i915#5286]) +9 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([i915#5286]) +4 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#111614]) +8 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb2/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:
    - shard-iclb:         [PASS][52] -> [INCOMPLETE][53] ([i915#5441]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11412/shard-iclb3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb2/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-180:
    - shard-snb:          [PASS][54] -> [INCOMPLETE][55] ([i915#5441])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11412/shard-snb5/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-snb4/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
    - shard-iclb:         NOTRUN -> [INCOMPLETE][56] ([i915#1373] / [i915#5441])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb2/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#110725] / [fdo#111614]) +5 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb3/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][58] ([i915#5441]) +12 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb1/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-kbl:          [PASS][59] -> [INCOMPLETE][60] ([i915#5441])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11412/shard-kbl7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-kbl3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][61] ([i915#5441] / [i915#794])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-kbl6/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([fdo#111615]) +15 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb5/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][63] ([i915#5441]) +10 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-kbl1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#3777]) +4 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-glk:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#3777]) +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-glk9/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-kbl:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#3777]) +3 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-kbl3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-apl:          NOTRUN -> [SKIP][67] ([fdo#109271]) +245 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#110723]) +3 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_joiner@basic:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#2705]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb3/igt@kms_big_joiner@basic.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#3689] / [i915#3886]) +3 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb1/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][71] ([fdo#109271] / [i915#3886]) +14 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-glk8/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
    - shard-apl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#3886]) +13 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl3/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#3689]) +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb5/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_ccs.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#3886]) +16 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-kbl3/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109278] / [i915#3886]) +7 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb2/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#111615] / [i915#3689]) +8 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb3/igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][77] ([fdo#109271] / [fdo#111827]) +19 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl3/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@hdmi-mode-timings:
    - shard-snb:          NOTRUN -> [SKIP][78] ([fdo#109271] / [fdo#111827]) +28 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-snb2/igt@kms_chamelium@hdmi-mode-timings.html
    - shard-kbl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [fdo#111827]) +22 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-kbl3/igt@kms_chamelium@hdmi-mode-timings.html

  * igt@kms_chamelium@vga-hpd-with-enabled-mode:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#109284] / [fdo#111827]) +12 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb3/igt@kms_chamelium@vga-hpd-with-enabled-mode.html

  * igt@kms_color@pipe-c-deep-color:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([i915#3555]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb2/igt@kms_color@pipe-c-deep-color.html
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109278] / [i915#3555])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb5/igt@kms_color@pipe-c-deep-color.html

  * igt@kms_color@pipe-d-ctm-negative:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109278] / [i915#1149]) +4 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb6/igt@kms_color@pipe-d-ctm-negative.html

  * igt@kms_color_chamelium@pipe-d-ctm-negative:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb4/igt@kms_color_chamelium@pipe-d-ctm-negative.html

  * igt@kms_color_chamelium@pipe-d-degamma:
    - shard-glk:          NOTRUN -> [SKIP][85] ([fdo#109271] / [fdo#111827]) +22 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-glk5/igt@kms_color_chamelium@pipe-d-degamma.html
    - shard-tglb:         NOTRUN -> [SKIP][86] ([fdo#109284] / [fdo#111827]) +20 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb5/igt@kms_color_chamelium@pipe-d-degamma.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          NOTRUN -> [TIMEOUT][87] ([i915#1319]) +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-kbl7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([i915#3116] / [i915#3299]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb5/igt@kms_content_protection@dp-mst-type-0.html
    - shard-iclb:         NOTRUN -> [SKIP][89] ([i915#3116])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb5/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([fdo#109300] / [fdo#111066]) +3 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb8/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][91] ([i915#1319]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl8/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          NOTRUN -> [FAIL][92] ([i915#2105])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-kbl1/igt@kms_content_protection@uevent.html
    - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#1063]) +2 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb3/igt@kms_content_protection@uevent.html
    - shard-apl:          NOTRUN -> [FAIL][94] ([i915#2105])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-snb:          NOTRUN -> [DMESG-WARN][95] ([i915#5090])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-snb2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
    - shard-apl:          NOTRUN -> [DMESG-WARN][96] ([i915#180])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][97] ([i915#3319])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-32x32-rapid-movement.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([fdo#109278] / [fdo#109279]) +5 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([fdo#109279] / [i915#3359]) +9 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][100] ([fdo#109278]) +60 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb6/igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][101] ([i915#3359]) +12 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-suspend:
    - shard-kbl:          NOTRUN -> [SKIP][102] ([fdo#109271]) +345 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-kbl3/igt@kms_cursor_crc@pipe-d-cursor-suspend.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#109274] / [fdo#109278]) +5 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-kbl:          NOTRUN -> [SKIP][104] ([fdo#109271] / [i915#533]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-kbl1/igt@kms_cursor_legacy@pipe-d-torture-bo.html
    - shard-apl:          NOTRUN -> [SKIP][105] ([fdo#109271] / [i915#533])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl7/igt@kms_cursor_legacy@pipe-d-torture-bo.html
    - shard-glk:          NOTRUN -> [SKIP][106] ([fdo#109271] / [i915#533])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-glk3/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglb:         NOTRUN -> [SKIP][107] ([i915#4103]) +3 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][108] ([i915#3528])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb5/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][109] ([i915#5287]) +7 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled:
    - shard-iclb:         NOTRUN -> [SKIP][110] ([i915#5287]) +4 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb4/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-tglb:         NOTRUN -> [SKIP][111] ([fdo#109274] / [fdo#111825] / [i915#3966])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb7/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][112] -> [FAIL][113] ([i915#79])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11412/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][114] ([fdo#109274]) +11 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-tglb:         NOTRUN -> [SKIP][115] ([fdo#109274] / [fdo#111825]) +20 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb6/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp1:
    - shard-apl:          [PASS][116] -> [FAIL][117] ([i915#79])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11412/shard-apl6/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl2/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-tglb:         NOTRUN -> [SKIP][118] ([i915#2587]) +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-iclb:         NOTRUN -> [SKIP][119] ([i915#2587]) +2 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-iclb:         NOTRUN -> [SKIP][120] ([i915#5438])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][121] ([fdo#109280]) +35 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
    - shard-tglb:         NOTRUN -> [SKIP][122] ([fdo#109280] / [fdo#111825]) +47 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-chec

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/index.html

--===============7775208044683946465==
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
<tr><td><b>Series:</b></td><td>Writeback fixes and improvements (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/101159/">https://patchwork.freedesktop.org/series/101159/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11412_full -&gt; IGTPW_6839_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6839_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6839_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/index.html</p>
<h2>Participating hosts (11 -&gt; 7)</h2>
<p>Missing    (4): pig-skl-6260u shard-skl pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6839_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_create@create-clear:<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb7/igt@gem_create@create-clear.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6839_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-snb5/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> ([i915#5441]) +7 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl8/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> ([i915#1373] / [i915#1982] / [i915#5441])</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb5/igt@feature_discovery@chamelium.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb8/igt@feature_discovery@display-3x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb1/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> ([i915#3555] / [i915#5325])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb8/igt@gem_ccs@suspend-resume.html">SKIP</a> ([i915#5327]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-snb2/igt@gem_ctx_persistence@legacy-engines-mixed.html">SKIP</a> ([fdo#109271] / [i915#1099]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-kbl1/igt@gem_exec_balancer@parallel.html">DMESG-WARN</a> ([i915#5076]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html">DMESG-WARN</a> ([i915#5076])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb8/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> ([i915#4525])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb1/igt@gem_exec_balancer@parallel-keep-submit-fence.html">DMESG-WARN</a> ([i915#5076])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-glk8/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl3/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb6/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842]) +6 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842]) +3 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-kbl4/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb2/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl7/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb8/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb5/igt@gem_lmem_swapping@basic.html">SKIP</a> ([i915#4613]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb5/igt@gem_lmem_swapping@basic.html">SKIP</a> ([i915#4613]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl6/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> ([fdo#109271] / [i915#4613]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-glk4/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> ([fdo#109271] / [i915#4613]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-kbl3/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> ([fdo#109271] / [i915#4613]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctx0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb7/igt@gem_ppgtt@blt-vs-render-ctx0.html">DMESG-FAIL</a> ([i915#5441])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb6/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-snb4/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb6/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html">SKIP</a> ([i915#4270]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb5/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> ([i915#4270]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb5/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([i915#768]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-glk7/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([fdo#109271]) +216 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb6/igt@gem_tiled_partial_pwrite_pread@writes.html">INCOMPLETE</a> ([i915#5441]) +12 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-glk6/igt@gem_tiled_partial_pwrite_pread@writes.html">INCOMPLETE</a> ([i915#5441]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl1/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html">INCOMPLETE</a> ([i915#5441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb2/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb7/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb1/igt@gen3_render_linear_blits.html">SKIP</a> ([fdo#109289]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb4/igt@gen7_exec_parse@bitmasks.html">SKIP</a> ([fdo#109289]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb4/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([i915#2856]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb5/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2527] / [i915#2856]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-snb5/igt@i915_hangman@engine-engine-hang.html">SKIP</a> ([fdo#109271]) +673 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb7/igt@i915_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#1902])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb2/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2681] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb5/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([fdo#110892]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-snb5/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> ([i915#3921])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic_plane_damage:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb8/igt@kms_atomic@atomic_plane_damage.html">SKIP</a> ([i915#4765])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> ([i915#5286]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> ([i915#5286]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb2/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11412/shard-iclb3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb2/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html">INCOMPLETE</a> ([i915#5441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-180:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11412/shard-snb5/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-snb4/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">INCOMPLETE</a> ([i915#5441])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb2/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">INCOMPLETE</a> ([i915#1373] / [i915#5441])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb3/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb1/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html">INCOMPLETE</a> ([i915#5441]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11412/shard-kbl7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-kbl3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">INCOMPLETE</a> ([i915#5441])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-kbl6/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">INCOMPLETE</a> ([i915#5441] / [i915#794])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb5/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#111615]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-kbl1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">INCOMPLETE</a> ([i915#5441]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +4 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-glk9/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-kbl3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([fdo#109271]) +245 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([fdo#110723]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb3/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb1/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-glk8/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +14 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl3/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +13 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb5/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-kbl3/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb2/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb3/igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl3/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-mode-timings:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-snb2/igt@kms_chamelium@hdmi-mode-timings.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +28 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-kbl3/igt@kms_chamelium@hdmi-mode-timings.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +22 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb3/igt@kms_chamelium@vga-hpd-with-enabled-mode.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-deep-color:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb2/igt@kms_color@pipe-c-deep-color.html">SKIP</a> ([i915#3555]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb5/igt@kms_color@pipe-c-deep-color.html">SKIP</a> ([fdo#109278] / [i915#3555])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-negative:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb6/igt@kms_color@pipe-d-ctm-negative.html">SKIP</a> ([fdo#109278] / [i915#1149]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-negative:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb4/igt@kms_color_chamelium@pipe-d-ctm-negative.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-degamma:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-glk5/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +22 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb5/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +20 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-kbl7/igt@kms_content_protection@atomic.html">TIMEOUT</a> ([i915#1319]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb5/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3116] / [i915#3299]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb5/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3116])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb8/igt@kms_content_protection@legacy.html">SKIP</a> ([fdo#109300] / [fdo#111066]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl8/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-kbl1/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb3/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#1063]) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl3/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-snb2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> ([i915#5090])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> ([i915#180])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-32x32-rapid-movement.html">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html">SKIP</a> ([fdo#109279] / [i915#3359]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb6/igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen.html">SKIP</a> ([fdo#109278]) +60 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html">SKIP</a> ([i915#3359]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-kbl3/igt@kms_cursor_crc@pipe-d-cursor-suspend.html">SKIP</a> ([fdo#109271]) +345 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-kbl1/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl7/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-glk3/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb5/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#3528])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled.html">SKIP</a> ([i915#5287]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb4/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled.html">SKIP</a> ([i915#5287]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb7/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> ([fdo#109274] / [fdo#111825] / [i915#3966])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11412/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> ([fdo#109274]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb6/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> ([fdo#109274] / [fdo#111825]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11412/shard-apl6/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-apl2/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> ([i915#2587]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> ([i915#2587]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> ([i915#5438])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#109280]) +35 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html">SKIP</a> ([fdo#109280] / [fdo#111825]) +47 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-chec</p>
</li>
</ul>

</body>
</html>

--===============7775208044683946465==--
