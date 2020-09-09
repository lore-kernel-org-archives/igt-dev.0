Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 09 Sep 2020 09:44:53 -0000
Message-ID: <159964469312.8835.7996789100308346401@emeril.freedesktop.org>
References: <20200908090436.1344-1-sowmyax.kaparthi@intel.com>
In-Reply-To: <20200908090436.1344-1-sowmyax.kaparthi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fscaling=3A_set_minimum_height_and_width_to_20_=28?=
 =?utf-8?q?rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0707527303=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matt Atwood <matthew.s.atwood@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0707527303==
Content-Type: multipart/alternative;
 boundary="===============8188240075849510073=="

--===============8188240075849510073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_scaling: set minimum height and width to 20 (rev3)
URL   : https://patchwork.freedesktop.org/series/78536/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8989_full -> IGTPW_4969_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4969_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4969_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4969_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane@plane-position-hole-dpms-pipe-c-planes:
    - shard-kbl:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl4/igt@kms_plane@plane-position-hole-dpms-pipe-c-planes.html

  
Known issues
------------

  Here are the changes found in IGTPW_4969_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-cpu-read-active:
    - shard-glk:          [PASS][2] -> [INCOMPLETE][3] ([i915#2439]) +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-glk6/igt@gem_exec_reloc@basic-cpu-read-active.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-glk7/igt@gem_exec_reloc@basic-cpu-read-active.html
    - shard-kbl:          [PASS][4] -> [INCOMPLETE][5] ([i915#2439]) +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl3/igt@gem_exec_reloc@basic-cpu-read-active.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl3/igt@gem_exec_reloc@basic-cpu-read-active.html

  * igt@gem_exec_reloc@basic-gtt-wc-active:
    - shard-glk:          [PASS][6] -> [DMESG-FAIL][7] ([i915#2439])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-glk2/igt@gem_exec_reloc@basic-gtt-wc-active.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-glk1/igt@gem_exec_reloc@basic-gtt-wc-active.html

  * igt@gem_exec_reloc@basic-wc-cpu-active:
    - shard-snb:          [PASS][8] -> [INCOMPLETE][9] ([i915#2439] / [i915#82]) +3 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-snb2/igt@gem_exec_reloc@basic-wc-cpu-active.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-snb4/igt@gem_exec_reloc@basic-wc-cpu-active.html

  * igt@gem_exec_reloc@basic-write-wc-active:
    - shard-apl:          [PASS][10] -> [INCOMPLETE][11] ([i915#1635] / [i915#2439])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-apl3/igt@gem_exec_reloc@basic-write-wc-active.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-apl7/igt@gem_exec_reloc@basic-write-wc-active.html

  * igt@gem_exec_schedule@deep@rcs0:
    - shard-tglb:         [PASS][12] -> [INCOMPLETE][13] ([i915#2439]) +4 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb2/igt@gem_exec_schedule@deep@rcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb5/igt@gem_exec_schedule@deep@rcs0.html

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-iclb:         [PASS][14] -> [INCOMPLETE][15] ([i915#2439]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-iclb6/igt@gem_exec_whisper@basic-queues-all.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-iclb8/igt@gem_exec_whisper@basic-queues-all.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:
    - shard-tglb:         [PASS][16] -> [DMESG-WARN][17] ([i915#1982])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@c-hdmi-a2:
    - shard-glk:          [PASS][18] -> [FAIL][19] ([i915#407]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-glk1/igt@kms_flip@modeset-vs-vblank-race-interruptible@c-hdmi-a2.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-glk8/igt@kms_flip@modeset-vs-vblank-race-interruptible@c-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite:
    - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#49])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_vblank@pipe-b-query-forked-busy:
    - shard-apl:          [PASS][22] -> [DMESG-WARN][23] ([i915#1635] / [i915#1982]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-apl2/igt@kms_vblank@pipe-b-query-forked-busy.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-apl8/igt@kms_vblank@pipe-b-query-forked-busy.html

  
#### Possible fixes ####

  * {igt@gem_exec_fence@syncobj-backward-timeline-chain-engines}:
    - shard-glk:          [INCOMPLETE][24] ([i915#2439]) -> [PASS][25] +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-glk7/igt@gem_exec_fence@syncobj-backward-timeline-chain-engines.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-glk5/igt@gem_exec_fence@syncobj-backward-timeline-chain-engines.html

  * igt@gem_exec_reloc@basic-gtt-wc-active:
    - shard-iclb:         [INCOMPLETE][26] ([i915#2439]) -> [PASS][27] +3 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-iclb7/igt@gem_exec_reloc@basic-gtt-wc-active.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-iclb5/igt@gem_exec_reloc@basic-gtt-wc-active.html

  * igt@gem_exec_reloc@basic-write-cpu-active:
    - shard-tglb:         [INCOMPLETE][28] ([i915#2439]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb5/igt@gem_exec_reloc@basic-write-cpu-active.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb6/igt@gem_exec_reloc@basic-write-cpu-active.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-snb:          [INCOMPLETE][30] ([i915#2439] / [i915#82]) -> [PASS][31] +5 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-snb5/igt@gem_exec_reloc@basic-write-gtt-active.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-snb1/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][32] ([i915#180]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl1/igt@gem_exec_suspend@basic-s3.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl7/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_whisper@basic-forked:
    - shard-kbl:          [INCOMPLETE][34] ([i915#2439]) -> [PASS][35] +5 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl2/igt@gem_exec_whisper@basic-forked.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl6/igt@gem_exec_whisper@basic-forked.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-kbl:          [DMESG-WARN][36] ([i915#1982]) -> [PASS][37] +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl3/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled:
    - shard-snb:          [SKIP][38] ([fdo#109271]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-snb6/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-snb1/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:
    - shard-tglb:         [DMESG-WARN][40] ([i915#1982]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_plane_scaling@pipe-c-scaler-with-rotation:
    - shard-iclb:         [FAIL][42] ([fdo#109052]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-iclb2/igt@kms_plane_scaling@pipe-c-scaler-with-rotation.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-iclb1/igt@kms_plane_scaling@pipe-c-scaler-with-rotation.html

  * igt@kms_plane_scaling@pipe-d-scaler-with-pixel-format:
    - shard-tglb:         [FAIL][44] ([i915#1214]) -> [PASS][45] +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb5/igt@kms_plane_scaling@pipe-d-scaler-with-pixel-format.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb1/igt@kms_plane_scaling@pipe-d-scaler-with-pixel-format.html

  
#### Warnings ####

  * igt@gem_exec_parallel@engines@basic:
    - shard-glk:          [INCOMPLETE][46] ([i915#2439]) -> [INCOMPLETE][47] ([i915#2439] / [i915#95])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-glk5/igt@gem_exec_parallel@engines@basic.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-glk6/igt@gem_exec_parallel@engines@basic.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][48], [FAIL][49], [FAIL][50], [FAIL][51], [FAIL][52], [FAIL][53], [FAIL][54], [FAIL][55], [FAIL][56], [FAIL][57], [FAIL][58], [FAIL][59], [FAIL][60], [FAIL][61], [FAIL][62], [FAIL][63], [FAIL][64], [FAIL][65], [FAIL][66], [FAIL][67], [FAIL][68], [FAIL][69], [FAIL][70]) ([i915#1611] / [i915#1784] / [i915#2263] / [i915#2398] / [i915#2439]) -> ([FAIL][71], [FAIL][72], [FAIL][73], [FAIL][74], [FAIL][75], [FAIL][76], [FAIL][77], [FAIL][78], [FAIL][79], [FAIL][80], [FAIL][81], [FAIL][82], [FAIL][83], [FAIL][84], [FAIL][85], [FAIL][86], [FAIL][87], [FAIL][88], [FAIL][89], [FAIL][90]) ([i915#1186] / [i915#1611] / [i915#1784] / [i915#2263] / [i915#2398] / [i915#2439])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl4/igt@runner@aborted.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl2/igt@runner@aborted.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl4/igt@runner@aborted.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl3/igt@runner@aborted.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl1/igt@runner@aborted.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl4/igt@runner@aborted.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl2/igt@runner@aborted.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl3/igt@runner@aborted.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl1/igt@runner@aborted.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl2/igt@runner@aborted.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl4/igt@runner@aborted.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl3/igt@runner@aborted.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl1/igt@runner@aborted.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl2/igt@runner@aborted.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl4/igt@runner@aborted.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl6/igt@runner@aborted.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl6/igt@runner@aborted.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl7/igt@runner@aborted.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl6/igt@runner@aborted.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl6/igt@runner@aborted.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl7/igt@runner@aborted.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl6/igt@runner@aborted.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl6/igt@runner@aborted.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl3/igt@runner@aborted.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl7/igt@runner@aborted.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl7/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl4/igt@runner@aborted.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl2/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl3/igt@runner@aborted.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl2/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl6/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl3/igt@runner@aborted.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl4/igt@runner@aborted.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl1/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl2/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl3/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl7/igt@runner@aborted.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl7/igt@runner@aborted.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl7/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl4/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl3/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl4/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl1/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][91], [FAIL][92], [FAIL][93], [FAIL][94], [FAIL][95], [FAIL][96], [FAIL][97], [FAIL][98], [FAIL][99], [FAIL][100], [FAIL][101], [FAIL][102], [FAIL][103], [FAIL][104], [FAIL][105], [FAIL][106], [FAIL][107], [FAIL][108], [FAIL][109], [FAIL][110], [FAIL][111]) ([i915#2263] / [i915#2398] / [i915#2439]) -> ([FAIL][112], [FAIL][113], [FAIL][114], [FAIL][115], [FAIL][116], [FAIL][117], [FAIL][118], [FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125], [FAIL][126], [FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130], [FAIL][131], [FAIL][132], [FAIL][133], [FAIL][134]) ([i915#1764] / [i915#2045] / [i915#2263] / [i915#2398] / [i915#2439])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb3/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb8/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb6/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb2/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb3/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb7/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb5/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb6/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb1/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb5/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb1/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb3/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb6/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb8/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb5/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb7/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb5/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb2/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb5/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb8/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb1/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb1/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb5/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb3/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb2/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb8/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb2/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb1/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb1/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb2/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb8/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb3/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb7/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb5/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb7/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb6/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb5/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb1/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb2/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb5/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb3/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb2/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb5/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109052]: https://bugs.freedesktop.org/show_bug.cgi?id=109052
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1186]: https://gitlab.freedesktop.org/drm/intel/issues/1186
  [i915#1214]: https://gitlab.freedesktop.org/drm/intel/issues/1214
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1764]: https://gitlab.freedesktop.org/drm/intel/issues/1764
  [i915#1784]: https://gitlab.freedesktop.org/drm/intel/issues/1784
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2045]: https://gitlab.freedesktop.org/drm/intel/issues/2045
  [i915#2263]: https://gitlab.freedesktop.org/drm/intel/issues/2263
  [i915#2398]: https://gitlab.freedesktop.org/drm/intel/issues/2398
  [i915#2439]: https://gitlab.freedesktop.org/drm/intel/issues/2439
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (12 -> 8)
------------------------------

  Missing    (4): pig-snb-2600 pig-glk-j5005 pig-skl-6260u pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5779 -> IGTPW_4969
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8989: f38d31de4aa327d89646ad8c49e2f5cc68d3916a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4969: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/index.html
  IGT_5779: f52bf19b5f02d52fc3e201c6467ec3f511227fba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/index.html

--===============8188240075849510073==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_scaling: set minimum height =
and width to 20 (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/78536/">https://patchwork.freedesktop.org/series/78536/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_4969/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_4969/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8989_full -&gt; IGTPW_4969_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4969_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_4969_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4969=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_plane@plane-position-hole-dpms-pipe-c-planes:<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_4969/shard-kbl4/igt@kms_plane@plane-position-hole-dpms-=
pipe-c-planes.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4969_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-cpu-read-active:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8989/shard-glk6/igt@gem_exec_reloc@basic-cpu-read-active.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/sh=
ard-glk7/igt@gem_exec_reloc@basic-cpu-read-active.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>=
) +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8989/shard-kbl3/igt@gem_exec_reloc@basic-cpu-read-active.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/sh=
ard-kbl3/igt@gem_exec_reloc@basic-cpu-read-active.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>=
) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-active:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8989/shard-glk2/igt@gem_exec_reloc@basic-gtt-wc-active.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/sha=
rd-glk1/igt@gem_exec_reloc@basic-gtt-wc-active.html">DMESG-FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu-active:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8989/shard-snb2/igt@gem_exec_reloc@basic-wc-cpu-active.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/sha=
rd-snb4/igt@gem_exec_reloc@basic-wc-cpu-active.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>)=
 +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc-active:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8989/shard-apl3/igt@gem_exec_reloc@basic-write-wc-active.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/s=
hard-apl7/igt@gem_exec_reloc@basic-write-wc-active.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2=
439</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@deep@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8989/shard-tglb2/igt@gem_exec_schedule@deep@rcs0.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tgl=
b5/igt@gem_exec_schedule@deep@rcs0.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) +4 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-all:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8989/shard-iclb6/igt@gem_exec_whisper@basic-queues-all.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/sha=
rd-iclb8/igt@gem_exec_whisper@basic-queues-all.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) +=
1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8989/shard-tglb7/igt@kms_flip@flip-vs-absolute-wf_vblank-interrupti=
ble@b-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_4969/shard-tglb8/igt@kms_flip@flip-vs-absolute-wf_vblank-int=
erruptible@b-edp1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@c-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8989/shard-glk1/igt@kms_flip@modeset-vs-vblank-race-interruptible@c=
-hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_4969/shard-glk8/igt@kms_flip@modeset-vs-vblank-race-interrupti=
ble@c-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/407">i915#407</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8989/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-in=
dfb-draw-pwrite.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_4969/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-off=
scren-pri-indfb-draw-pwrite.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-query-forked-busy:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8989/shard-apl2/igt@kms_vblank@pipe-b-query-forked-busy.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/sh=
ard-apl8/igt@kms_vblank@pipe-b-query-forked-busy.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#198=
2</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@gem_exec_fence@syncobj-backward-timeline-chain-engines}:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8989/shard-glk7/igt@gem_exec_fence@syncobj-backward-timeline-chain-=
engines.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2439">i915#2439</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_4969/shard-glk5/igt@gem_exec_fence@syncobj-backward=
-timeline-chain-engines.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-active:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8989/shard-iclb7/igt@gem_exec_reloc@basic-gtt-wc-active.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439"=
>i915#2439</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_4969/shard-iclb5/igt@gem_exec_reloc@basic-gtt-wc-active.html">PASS</a>=
 +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu-active:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8989/shard-tglb5/igt@gem_exec_reloc@basic-write-cpu-active.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/24=
39">i915#2439</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_4969/shard-tglb6/igt@gem_exec_reloc@basic-write-cpu-active.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt-active:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8989/shard-snb5/igt@gem_exec_reloc@basic-write-gtt-active.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/243=
9">i915#2439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/82">i915#82</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_4969/shard-snb1/igt@gem_exec_reloc@basic-write-gtt-active.html">PA=
SS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8989/shard-kbl1/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/sh=
ard-kbl7/igt@gem_exec_suspend@basic-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8989/shard-kbl2/igt@gem_exec_whisper@basic-forked.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#=
2439</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4=
969/shard-kbl6/igt@gem_exec_whisper@basic-forked.html">PASS</a> +5 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8989/shard-kbl3/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_4969/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomi=
c.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8989/shard-snb6/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_4969/shard-snb1/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-x=
tiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8989/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-i=
ndfb-draw-blt.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb2/igt@kms_frontbuffer_tracking=
@fbc-1p-offscren-pri-indfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@pipe-c-scaler-with-rotation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8989/shard-iclb2/igt@kms_plane_scaling@pipe-c-scaler-with-rotation.=
html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09052">fdo#109052</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_4969/shard-iclb1/igt@kms_plane_scaling@pipe-c-scaler-with-rotat=
ion.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@pipe-d-scaler-with-pixel-format:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8989/shard-tglb5/igt@kms_plane_scaling@pipe-d-scaler-with-pixel-for=
mat.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1214">i915#1214</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_4969/shard-tglb1/igt@kms_plane_scaling@pipe-d-scaler-with-pix=
el-format.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@basic:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8989/shard-glk5/igt@gem_exec_parallel@engines@basic.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i91=
5#2439</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_4969/shard-glk6/igt@gem_exec_parallel@engines@basic.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915#9=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8989/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl2/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_8989/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl3/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_89=
89/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl4/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/sh=
ard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl3/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-k=
bl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_8989/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl4/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/CI_DRM_8989/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl1/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_8989/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl4/igt@runner@=
aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8989/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl6/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_8989/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl6/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_89=
89/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl7/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/sh=
ard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/CI_DRM_8989/shard-kbl6/igt@runner@aborted.html">FAIL</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1611">i915#=
1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1784"=
>i915#1784</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2263">i915#2263</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2398">i915#2398</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2439">i915#2439</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_4969/shard-kbl3/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl7/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_4969/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl4/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_4969/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl3/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_4969/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl6/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969=
/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl4/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-=
kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_4969/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl3/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_4969/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl7/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_4969/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl4/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_4969/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-kbl4/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969=
/shard-kbl1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/1186">i915#1186</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/1784">i915#1784</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2263">i915#2263</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2398">i915#2398</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#=
2439</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8989/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb8/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_8989/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb2/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_8989/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb7/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8=
989/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb6/igt@runner@aborted.html=
">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989=
/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb5/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/sh=
ard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb3/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard=
-tglb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_8989/shard-tglb8/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tg=
lb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_8989/shard-tglb7/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb5=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_8989/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb5/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/CI_DRM_8989/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/shard-tglb1/igt@r=
unner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2263">i915#2263</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/2398">i915#2398</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb1/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_49=
69/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb3/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/sh=
ard-tglb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_4969/shard-tglb8/igt@runner@aborted.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-t=
glb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_4969/shard-tglb1/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb1/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_4969/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb8/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_4969/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb7/igt@runner=
@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_4969/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb7/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_4969/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb5/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_49=
69/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb2/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/sh=
ard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_4969/shard-tglb3/igt@runner@aborted.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-t=
glb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_4969/shard-tglb5/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/shard-tglb6/=
igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1764">i915#1764</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2045">i915#2045</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2263">i915#2263</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2398">i915#2398</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (12 -&gt; 8)</h2>
<p>Missing    (4): pig-snb-2600 pig-glk-j5005 pig-skl-6260u pig-icl-1065g7 =
</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5779 -&gt; IGTPW_4969</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8989: f38d31de4aa327d89646ad8c49e2f5cc68d3916a @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_4969: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/index.htm=
l<br />
  IGT_5779: f52bf19b5f02d52fc3e201c6467ec3f511227fba @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============8188240075849510073==--

--===============0707527303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0707527303==--
