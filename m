Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 03 Dec 2020 12:26:04 -0000
Message-ID: <160699836459.31152.2585453098608337435@emeril.freedesktop.org>
References: <20201203083931.1370591-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201203083931.1370591-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9h?=
 =?utf-8?q?pi=5Fintel=5Fbb=3A_Only_assert_objects_are_unmoved_for_full-ppg?=
 =?utf-8?q?tt?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1437080771=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1437080771==
Content-Type: multipart/alternative;
 boundary="===============6375904180563401998=="

--===============6375904180563401998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/api_intel_bb: Only assert objects are unmoved for full-ppgtt
URL   : https://patchwork.freedesktop.org/series/84527/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9430_full -> IGTPW_5246_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5246_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5246_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5246_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@pipe-b-single-bo:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-hsw1/igt@kms_cursor_legacy@pipe-b-single-bo.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-hsw7/igt@kms_cursor_legacy@pipe-b-single-bo.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-kbl:          [SKIP][3] ([fdo#109271]) -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-kbl1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-kbl1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite.html

  
Known issues
------------

  Here are the changes found in IGTPW_5246_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#579])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-iclb2/igt@i915_pm_rpm@reg-read-ioctl.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-iclb6/igt@i915_pm_rpm@reg-read-ioctl.html
    - shard-hsw:          [PASS][7] -> [SKIP][8] ([fdo#109271])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-hsw1/igt@i915_pm_rpm@reg-read-ioctl.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-hsw2/igt@i915_pm_rpm@reg-read-ioctl.html
    - shard-tglb:         [PASS][9] -> [SKIP][10] ([i915#579])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-tglb5/igt@i915_pm_rpm@reg-read-ioctl.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-tglb1/igt@i915_pm_rpm@reg-read-ioctl.html
    - shard-kbl:          [PASS][11] -> [SKIP][12] ([fdo#109271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-kbl6/igt@i915_pm_rpm@reg-read-ioctl.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-kbl7/igt@i915_pm_rpm@reg-read-ioctl.html
    - shard-apl:          [PASS][13] -> [SKIP][14] ([fdo#109271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-apl6/igt@i915_pm_rpm@reg-read-ioctl.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-apl6/igt@i915_pm_rpm@reg-read-ioctl.html
    - shard-glk:          [PASS][15] -> [SKIP][16] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-glk2/igt@i915_pm_rpm@reg-read-ioctl.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-glk2/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][17] -> [INCOMPLETE][18] ([i915#155] / [i915#180] / [i915#2295])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
    - shard-tglb:         [PASS][19] -> [FAIL][20] ([i915#2122])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-tglb5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-tglb7/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [PASS][21] -> [FAIL][22] ([i915#2598])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][23] -> [INCOMPLETE][24] ([i915#155] / [i915#180])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-iclb:         [PASS][25] -> [INCOMPLETE][26] ([i915#1185] / [i915#250])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-iclb1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-iclb6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-apl:          [PASS][27] -> [INCOMPLETE][28] ([i915#2635])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-glk:          [PASS][29] -> [INCOMPLETE][30] ([i915#2635])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-glk3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-glk2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-hsw:          [PASS][31] -> [INCOMPLETE][32] ([i915#2055] / [i915#2637])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-hsw1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-hsw2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-tglb:         [PASS][33] -> [INCOMPLETE][34] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-tglb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-tglb1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-kbl:          [PASS][35] -> [INCOMPLETE][36] ([i915#155])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [FAIL][39] ([i915#2389]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-apl7/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-apl7/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-glk:          [FAIL][41] ([i915#2389]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-glk9/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-hsw:          [INCOMPLETE][43] ([i915#2055]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-hsw1/igt@gem_fenced_exec_thrash@no-spare-fences.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-hsw1/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-iclb:         [SKIP][45] ([i915#579]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-iclb8/igt@i915_pm_rpm@system-suspend-execbuf.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-iclb8/igt@i915_pm_rpm@system-suspend-execbuf.html
    - shard-kbl:          [SKIP][47] ([fdo#109271]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-kbl1/igt@i915_pm_rpm@system-suspend-execbuf.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-kbl4/igt@i915_pm_rpm@system-suspend-execbuf.html
    - shard-apl:          [SKIP][49] ([fdo#109271]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-apl1/igt@i915_pm_rpm@system-suspend-execbuf.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-apl2/igt@i915_pm_rpm@system-suspend-execbuf.html
    - shard-tglb:         [SKIP][51] ([i915#579]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-tglb5/igt@i915_pm_rpm@system-suspend-execbuf.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-tglb7/igt@i915_pm_rpm@system-suspend-execbuf.html
    - shard-glk:          [SKIP][53] ([fdo#109271]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-glk1/igt@i915_pm_rpm@system-suspend-execbuf.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-glk3/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@edp-1-pipe-d:
    - shard-tglb:         [INCOMPLETE][55] -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-tglb6/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@edp-1-pipe-d.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-tglb2/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@edp-1-pipe-d.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [FAIL][57] ([i915#2598]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_plane_lowres@pipe-c-tiling-y:
    - shard-kbl:          [DMESG-WARN][59] ([i915#165] / [i915#180] / [i915#78]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-y.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-kbl3/igt@kms_plane_lowres@pipe-c-tiling-y.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][61] ([fdo#109441]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-iclb7/igt@kms_psr@psr2_cursor_render.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:
    - shard-hsw:          [SKIP][63] ([fdo#109271]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-hsw2/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-hsw2/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][65] ([i915#1804] / [i915#2684]) -> [WARN][66] ([i915#2681] / [i915#2684])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][67] ([i915#2295] / [i915#2722]) -> ([FAIL][68], [FAIL][69], [FAIL][70], [FAIL][71], [FAIL][72]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483] / [i915#92])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-kbl7/igt@runner@aborted.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-kbl7/igt@runner@aborted.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-kbl4/igt@runner@aborted.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-kbl7/igt@runner@aborted.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-kbl4/igt@runner@aborted.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-kbl2/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][73], [FAIL][74]) ([i915#2295] / [i915#2722] / [i915#483]) -> ([FAIL][75], [FAIL][76], [FAIL][77]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-iclb8/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-iclb5/igt@runner@aborted.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-iclb6/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-iclb3/igt@runner@aborted.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-iclb2/igt@runner@aborted.html
    - shard-apl:          ([FAIL][78], [FAIL][79]) ([i915#2295] / [i915#2722]) -> ([FAIL][80], [FAIL][81], [FAIL][82]) ([i915#1814] / [i915#2295] / [i915#2722])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-apl1/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-apl1/igt@runner@aborted.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-apl8/igt@runner@aborted.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-apl6/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-apl4/igt@runner@aborted.html
    - shard-glk:          ([FAIL][83], [FAIL][84]) ([i915#2295] / [i915#2722] / [k.org#202321]) -> ([FAIL][85], [FAIL][86], [FAIL][87]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483] / [k.org#202321])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-glk1/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-glk1/igt@runner@aborted.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-glk2/igt@runner@aborted.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-glk7/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-glk2/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][88], [FAIL][89]) ([i915#1602] / [i915#2295] / [i915#2722]) -> ([FAIL][90], [FAIL][91], [FAIL][92]) ([i915#1602] / [i915#1814] / [i915#2295] / [i915#2722])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-tglb8/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-tglb5/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-tglb2/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-tglb1/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-tglb1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#250]: https://gitlab.freedesktop.org/drm/intel/issues/250
  [i915#2574]: https://gitlab.freedesktop.org/drm/intel/issues/2574
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5878 -> IGTPW_5246
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9430: 88c5c7135da4f61235fe3dbf4a67b2121b893fca @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5246: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/index.html
  IGT_5878: e96c0d8e6952d892bcbbcdf004999880a4dfb42e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/index.html

--===============6375904180563401998==
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
<tr><td><b>Series:</b></td><td>i915/api_intel_bb: Only assert objects are u=
nmoved for full-ppgtt</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84527/">https://patchwork.freedesktop.org/series/84527/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5246/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5246/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9430_full -&gt; IGTPW_5246_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5246_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5246_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5246=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_legacy@pipe-b-single-bo:<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-hsw1/igt@kms_cursor_legacy@pipe-b-single-bo.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/sha=
rd-hsw7/igt@kms_cursor_legacy@pipe-b-single-bo.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite:<=
ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-kbl1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur=
-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_5246/shard-kbl1/igt@kms_frontbuffer_tracking=
@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5246_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@reg-read-ioctl:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-iclb2/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-iclb6=
/igt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-hsw1/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-hsw2/i=
gt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-tglb5/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-tglb1=
/igt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-kbl6/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-kbl7/i=
gt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-apl6/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-apl6/i=
gt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-glk2/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-glk2/i=
gt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/s=
hard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915=
#2295</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-tglb5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5246/shard-tglb7/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2122">i915=
#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_524=
6/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2598">i915#2598</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5246/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/155">i=
915#155</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/18=
0">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-iclb1/igt@kms_plane@plane-panning-bottom-right-suspend-pi=
pe-b-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5246/shard-iclb6/igt@kms_plane@plane-panning-bottom-right-s=
uspend-pipe-b-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/1185">i915#1185</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/250">i915#250</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pip=
e-b-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5246/shard-apl6/igt@kms_plane@plane-panning-bottom-right-sus=
pend-pipe-b-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-glk3/igt@kms_plane@plane-panning-bottom-right-suspend-pip=
e-b-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5246/shard-glk2/igt@kms_plane@plane-panning-bottom-right-sus=
pend-pipe-b-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-hsw1/igt@kms_plane@plane-panning-bottom-right-suspend-pip=
e-b-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5246/shard-hsw2/igt@kms_plane@plane-panning-bottom-right-sus=
pend-pipe-b-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2055">i915#2055</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2637">i915#2637</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-tglb3/igt@kms_plane@plane-panning-bottom-right-suspend-pi=
pe-b-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5246/shard-tglb1/igt@kms_plane@plane-panning-bottom-right-s=
uspend-pipe-b-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/1798">i915#1798</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pip=
e-b-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5246/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-sus=
pend-pipe-b-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/155">i915#155</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-=
iclb7/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar =
issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-apl7/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915=
#2389</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5246/shard-apl7/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-glk9/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915=
#2389</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5246/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-hsw1/igt@gem_fenced_exec_thrash@no-spare-fences.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/20=
55">i915#2055</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5246/shard-hsw1/igt@gem_fenced_exec_thrash@no-spare-fences.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-iclb8/igt@i915_pm_rpm@system-suspend-execbuf.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#57=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246=
/shard-iclb8/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-kbl1/igt@i915_pm_rpm@system-suspend-execbuf.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
246/shard-kbl4/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-apl1/igt@i915_pm_rpm@system-suspend-execbuf.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
246/shard-apl2/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-tglb5/igt@i915_pm_rpm@system-suspend-execbuf.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#57=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246=
/shard-tglb7/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-glk1/igt@i915_pm_rpm@system-suspend-execbuf.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
246/shard-glk3/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@edp-1=
-pipe-d:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-tglb6/igt@kms_atomic_transition@plane-all-transition-non=
blocking-fencing@edp-1-pipe-d.html">INCOMPLETE</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-tglb2/igt@kms_atomic_tra=
nsition@plane-all-transition-nonblocking-fencing@edp-1-pipe-d.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2598">i915#2598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5246/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank-inter=
ruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-y:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-y.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/165">i91=
5#165</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180"=
>i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
78">i915#78</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5246/shard-kbl3/igt@kms_plane_lowres@pipe-c-tiling-y.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-iclb7/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/sh=
ard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-hsw2/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5246/shard-hsw2/igt@kms_vblank@pipe-c-ts-continuation-modeset-rp=
m.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i91=
5#2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5246/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-kbl7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-kbl7/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5246/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-kbl7/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5246/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-kbl2/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/483">i915#483</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/92">i915#92</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-iclb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-iclb5/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/483">i915#483</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5246/shard-iclb6/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-ic=
lb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5246/shard-iclb2/igt@runner@aborted.html">FAIL</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915=
#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722=
">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-apl1/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2722">i915#2722</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5246/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-apl6/igt@=
runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5246/shard-apl4/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#=
2722</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-glk1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-glk1/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2722">i915#2722</a> / <a href=3D"https://bugzilla.kernel.org/show=
_bug.cgi?id=3D202321">k.org#202321</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_5246/shard-glk2/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-=
glk7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5246/shard-glk2/igt@runner@aborted.html">FAIL</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915=
#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722=
">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/483">i915#483</a> / <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?i=
d=3D202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-tglb5/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2722">i915#2722</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5246/shard-tglb2/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/shard-=
tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5246/shard-tglb1/igt@runner@aborted.html">FAIL</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#160=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i9=
15#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/22=
95">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2722">i915#2722</a>)</p>
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
<li>IGT: IGT_5878 -&gt; IGTPW_5246</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9430: 88c5c7135da4f61235fe3dbf4a67b2121b893fca @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5246: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5246/index.htm=
l<br />
  IGT_5878: e96c0d8e6952d892bcbbcdf004999880a4dfb42e @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============6375904180563401998==--

--===============1437080771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1437080771==--
