Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 03 Dec 2020 16:10:09 -0000
Message-ID: <160701180914.31153.18025790603714634819@emeril.freedesktop.org>
References: <20201203095726.1427559-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201203095726.1427559-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fctx=5Fexec=3A_Exercise_execution_along_context_while_closi?=
 =?utf-8?q?ng_it_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0100792661=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0100792661==
Content-Type: multipart/alternative;
 boundary="===============2503930790826047289=="

--===============2503930790826047289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_ctx_exec: Exercise execution along context while closing it (rev2)
URL   : https://patchwork.freedesktop.org/series/84530/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9432_full -> IGTPW_5247_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5247_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5247_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5247_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_ctx_exec@basic-close-race} (NEW):
    - shard-tglb:         NOTRUN -> [TIMEOUT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-tglb3/igt@gem_ctx_exec@basic-close-race.html
    - shard-glk:          NOTRUN -> [TIMEOUT][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-glk9/igt@gem_ctx_exec@basic-close-race.html
    - shard-apl:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-apl3/igt@gem_ctx_exec@basic-close-race.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-kbl1/igt@gem_ctx_exec@basic-close-race.html
    - shard-iclb:         NOTRUN -> [TIMEOUT][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-iclb1/igt@gem_ctx_exec@basic-close-race.html
    - shard-hsw:          NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-hsw6/igt@gem_ctx_exec@basic-close-race.html
    - shard-snb:          NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-snb6/igt@gem_ctx_exec@basic-close-race.html

  * igt@gem_userptr_blits@stress-mm:
    - shard-hsw:          [PASS][8] -> [INCOMPLETE][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-hsw6/igt@gem_userptr_blits@stress-mm.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-hsw7/igt@gem_userptr_blits@stress-mm.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9432_full and IGTPW_5247_full:

### New IGT tests (1) ###

  * igt@gem_ctx_exec@basic-close-race:
    - Statuses : 3 fail(s) 4 timeout(s)
    - Exec time: [5.43, 120.96] s

  

Known issues
------------

  Here are the changes found in IGTPW_5247_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-glk:          [PASS][10] -> [DMESG-WARN][11] ([i915#118] / [i915#95]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-glk1/igt@gem_exec_whisper@basic-queues-all.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-glk4/igt@gem_exec_whisper@basic-queues-all.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
    - shard-tglb:         [PASS][12] -> [FAIL][13] ([i915#2122])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-tglb2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-tglb2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:
    - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#79])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [PASS][16] -> [INCOMPLETE][17] ([i915#2635])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-apl7/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-apl6/igt@kms_flip@flip-vs-suspend@a-dp1.html
    - shard-kbl:          [PASS][18] -> [INCOMPLETE][19] ([i915#155])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-kbl6/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-kbl2/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@a-edp1:
    - shard-tglb:         [PASS][20] -> [DMESG-WARN][21] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-tglb3/igt@kms_flip@flip-vs-suspend@a-edp1.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-tglb5/igt@kms_flip@flip-vs-suspend@a-edp1.html
    - shard-iclb:         [PASS][22] -> [INCOMPLETE][23] ([i915#2483])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-iclb3/igt@kms_flip@flip-vs-suspend@a-edp1.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-iclb5/igt@kms_flip@flip-vs-suspend@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          [PASS][24] -> [INCOMPLETE][25] ([i915#1982] / [i915#2635])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-glk8/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-glk5/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@a-vga1:
    - shard-hsw:          [PASS][26] -> [INCOMPLETE][27] ([i915#2055] / [i915#2637])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-hsw6/igt@kms_flip@flip-vs-suspend@a-vga1.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-hsw2/igt@kms_flip@flip-vs-suspend@a-vga1.html

  * igt@kms_flip@flip-vs-suspend@b-edp1:
    - shard-tglb:         [PASS][28] -> [INCOMPLETE][29] ([i915#1436] / [i915#1798] / [i915#1982])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-tglb3/igt@kms_flip@flip-vs-suspend@b-edp1.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-tglb5/igt@kms_flip@flip-vs-suspend@b-edp1.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][30] -> [SKIP][31] ([fdo#109441])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-iclb4/igt@kms_psr@psr2_cursor_blt.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-hsw:          [FAIL][32] ([i915#2389]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-hsw7/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-iclb:         [SKIP][34] ([i915#579]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-iclb6/igt@i915_pm_rpm@system-suspend-execbuf.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-iclb2/igt@i915_pm_rpm@system-suspend-execbuf.html
    - shard-kbl:          [SKIP][36] ([fdo#109271]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-kbl4/igt@i915_pm_rpm@system-suspend-execbuf.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-kbl3/igt@i915_pm_rpm@system-suspend-execbuf.html
    - shard-apl:          [SKIP][38] ([fdo#109271]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-apl4/igt@i915_pm_rpm@system-suspend-execbuf.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-apl4/igt@i915_pm_rpm@system-suspend-execbuf.html
    - shard-tglb:         [SKIP][40] ([i915#579]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-tglb2/igt@i915_pm_rpm@system-suspend-execbuf.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-tglb7/igt@i915_pm_rpm@system-suspend-execbuf.html
    - shard-glk:          [SKIP][42] ([fdo#109271]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-glk3/igt@i915_pm_rpm@system-suspend-execbuf.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-glk3/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-iclb:         [INCOMPLETE][44] ([i915#1185]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-iclb6/igt@kms_fbcon_fbt@fbc-suspend.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-iclb1/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-apl:          [INCOMPLETE][46] ([i915#2635]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-glk:          [INCOMPLETE][48] ([i915#2635]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-glk3/igt@kms_fbcon_fbt@fbc-suspend.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-glk1/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-tglb:         [INCOMPLETE][50] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411] / [i915#456]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-tglb2/igt@kms_fbcon_fbt@fbc-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-tglb5/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [INCOMPLETE][52] ([i915#155]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [FAIL][54] ([i915#2598]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-panning@b-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][56] -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-hsw6/igt@kms_flip@flip-vs-panning@b-hdmi-a1.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-hsw6/igt@kms_flip@flip-vs-panning@b-hdmi-a1.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][58] ([fdo#109441]) -> [PASS][59] +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-iclb7/igt@kms_psr@psr2_suspend.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:
    - shard-hsw:          [SKIP][60] ([fdo#109271]) -> [PASS][61] +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-hsw7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][62] ([i915#658]) -> [SKIP][63] ([i915#588])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][64] ([i915#2681] / [i915#2684]) -> [WARN][65] ([i915#2684])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_cursor_edge_walk@pipe-d-64x64-top-edge:
    - shard-hsw:          [INCOMPLETE][66] -> [SKIP][67] ([fdo#109271])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-hsw6/igt@kms_cursor_edge_walk@pipe-d-64x64-top-edge.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-hsw2/igt@kms_cursor_edge_walk@pipe-d-64x64-top-edge.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][68] ([i915#2295] / [i915#2722]) -> ([FAIL][69], [FAIL][70]) ([i915#2295] / [i915#2722] / [i915#483])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-kbl7/igt@runner@aborted.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-kbl2/igt@runner@aborted.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-kbl3/igt@runner@aborted.html
    - shard-glk:          ([FAIL][71], [FAIL][72]) ([i915#2295] / [i915#2722] / [i915#483] / [k.org#202321]) -> ([FAIL][73], [FAIL][74]) ([i915#2295] / [i915#2722] / [k.org#202321])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-glk8/igt@runner@aborted.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-glk3/igt@runner@aborted.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-glk5/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-glk9/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][75], [FAIL][76]) ([i915#1602] / [i915#2295] / [i915#2722]) -> ([FAIL][77], [FAIL][78]) ([i915#2295] / [i915#2722])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-tglb2/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-tglb1/igt@runner@aborted.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-tglb7/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-tglb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2483]: https://gitlab.freedesktop.org/drm/intel/issues/2483
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5878 -> IGTPW_5247
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9432: a7ed9b96ea3d9e89190a0cd08feb99e6b3e701a9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5247: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/index.html
  IGT_5878: e96c0d8e6952d892bcbbcdf004999880a4dfb42e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/index.html

--===============2503930790826047289==
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
<tr><td><b>Series:</b></td><td>i915/gem_ctx_exec: Exercise execution along =
context while closing it (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84530/">https://patchwork.freedesktop.org/series/84530/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5247/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5247/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9432_full -&gt; IGTPW_5247_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5247_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5247_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5247=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_ctx_exec@basic-close-race} (NEW):</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5247/shard-tglb3/igt@gem_ctx_exec@basic-close-race.html"=
>TIMEOUT</a></p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5247/shard-glk9/igt@gem_ctx_exec@basic-close-race.html">=
TIMEOUT</a></p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5247/shard-apl3/igt@gem_ctx_exec@basic-close-race.html">=
FAIL</a></p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5247/shard-kbl1/igt@gem_ctx_exec@basic-close-race.html">=
TIMEOUT</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5247/shard-iclb1/igt@gem_ctx_exec@basic-close-race.html"=
>TIMEOUT</a></p>
</li>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5247/shard-hsw6/igt@gem_ctx_exec@basic-close-race.html">=
FAIL</a></p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5247/shard-snb6/igt@gem_ctx_exec@basic-close-race.html">=
FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@stress-mm:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9432/shard-hsw6/igt@gem_userptr_blits@stress-mm.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-hsw7=
/igt@gem_userptr_blits@stress-mm.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9432_full and IGTPW_5247_f=
ull:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@gem_ctx_exec@basic-close-race:<ul>
<li>Statuses : 3 fail(s) 4 timeout(s)</li>
<li>Exec time: [5.43, 120.96] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5247_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-queues-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9432/shard-glk1/igt@gem_exec_whisper@basic-queues-all.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shar=
d-glk4/igt@gem_exec_whisper@basic-queues-all.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9432/shard-tglb2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5247/shard-tglb2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2122">i915=
#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9432/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible@b=
-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5247/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@b-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9432/shard-apl7/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-ap=
l6/igt@kms_flip@flip-vs-suspend@a-dp1.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9432/shard-kbl6/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-kb=
l2/igt@kms_flip@flip-vs-suspend@a-dp1.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-edp1:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9432/shard-tglb3/igt@kms_flip@flip-vs-suspend@a-edp1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-=
tglb5/igt@kms_flip@flip-vs-suspend@a-edp1.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1887">i915#1887=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i91=
5#2411</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9432/shard-iclb3/igt@kms_flip@flip-vs-suspend@a-edp1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-=
iclb5/igt@kms_flip@flip-vs-suspend@a-edp1.html">INCOMPLETE</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2483">i915#2483</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9432/shard-glk8/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/sha=
rd-glk5/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-vga1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9432/shard-hsw6/igt@kms_flip@flip-vs-suspend@a-vga1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-=
hsw2/igt@kms_flip@flip-vs-suspend@a-vga1.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9432/shard-tglb3/igt@kms_flip@flip-vs-suspend@b-edp1.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard=
-tglb5/igt@kms_flip@flip-vs-suspend@b-edp1.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1798">i915#1798</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#198=
2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9432/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-iclb4/i=
gt@kms_psr@psr2_cursor_blt.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9432/shard-hsw7/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i91=
5#2389</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5247/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9432/shard-iclb6/igt@i915_pm_rpm@system-suspend-execbuf.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#57=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247=
/shard-iclb2/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9432/shard-kbl4/igt@i915_pm_rpm@system-suspend-execbuf.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
247/shard-kbl3/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9432/shard-apl4/igt@i915_pm_rpm@system-suspend-execbuf.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
247/shard-apl4/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9432/shard-tglb2/igt@i915_pm_rpm@system-suspend-execbuf.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#57=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247=
/shard-tglb7/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9432/shard-glk3/igt@i915_pm_rpm@system-suspend-execbuf.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
247/shard-glk3/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9432/shard-iclb6/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/=
shard-iclb1/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9432/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/s=
hard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9432/shard-glk3/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/s=
hard-glk1/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9432/shard-tglb2/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i91=
5#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/188=
7">i915#1887</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2411">i915#2411</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/456">i915#456</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5247/shard-tglb5/igt@kms_fbcon_fbt@fbc-suspend.html">PASS<=
/a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9432/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/sha=
rd-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9432/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2598">i915#2598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5247/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank-inter=
ruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@b-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9432/shard-hsw6/igt@kms_flip@flip-vs-panning@b-hdmi-a1.html">INCOMP=
LETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
47/shard-hsw6/igt@kms_flip@flip-vs-panning@b-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9432/shard-iclb7/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-=
iclb2/igt@kms_psr@psr2_suspend.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9432/shard-hsw7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5247/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-modeset-rp=
m.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9432/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/s=
hard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9432/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#268=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i9=
15#2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5247/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-64x64-top-edge:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9432/shard-hsw6/igt@kms_cursor_edge_walk@pipe-d-64x64-top-edge.html=
">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5247/shard-hsw2/igt@kms_cursor_edge_walk@pipe-d-64x64-top-edge.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9432/shard-kbl7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-kbl2/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5247/shard-kbl3/igt@runner@aborted.html">FAIL</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915=
#483</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9432/shard-glk8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-glk3/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/483">i915#483</a> / <a href=3D"https://bugzilla.kernel.org/=
show_bug.cgi?id=3D202321">k.org#202321</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-glk5/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/sh=
ard-glk9/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https:/=
/bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9432/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9432/shard-tglb1/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2722">i915#2722</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5247/shard-tglb7/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/shard-=
tglb5/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2722">i915#2722</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5878 -&gt; IGTPW_5247</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9432: a7ed9b96ea3d9e89190a0cd08feb99e6b3e701a9 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5247: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5247/index.htm=
l<br />
  IGT_5878: e96c0d8e6952d892bcbbcdf004999880a4dfb42e @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============2503930790826047289==--

--===============0100792661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0100792661==--
