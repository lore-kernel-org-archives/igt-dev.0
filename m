Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 10 Sep 2020 12:26:47 -0000
Message-ID: <159974080718.26638.1028283503903241817@emeril.freedesktop.org>
References: <20200910101532.167045-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200910101532.167045-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2k5?=
 =?utf-8?q?15/perf=3A_rework_perf_counters_equations?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0783955843=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0783955843==
Content-Type: multipart/alternative;
 boundary="===============3358598614489293044=="

--===============3358598614489293044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/i915/perf: rework perf counters equations
URL   : https://patchwork.freedesktop.org/series/81547/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8993_full -> IGTPW_4970_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/index.html

Known issues
------------

  Here are the changes found in IGTPW_4970_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@render:
    - shard-iclb:         [PASS][1] -> [FAIL][2] ([i915#2374])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb4/igt@gem_ctx_persistence@legacy-engines-mixed-process@render.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb6/igt@gem_ctx_persistence@legacy-engines-mixed-process@render.html

  * igt@gem_exec_reloc@basic-gtt-read-active:
    - shard-apl:          [PASS][3] -> [INCOMPLETE][4] ([i915#1635] / [i915#2439]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl4/igt@gem_exec_reloc@basic-gtt-read-active.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl6/igt@gem_exec_reloc@basic-gtt-read-active.html
    - shard-tglb:         [PASS][5] -> [INCOMPLETE][6] ([i915#2439]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb8/igt@gem_exec_reloc@basic-gtt-read-active.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb7/igt@gem_exec_reloc@basic-gtt-read-active.html

  * igt@gem_exec_reloc@basic-write-cpu-active:
    - shard-snb:          [PASS][7] -> [INCOMPLETE][8] ([i915#2439] / [i915#82]) +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-snb5/igt@gem_exec_reloc@basic-write-cpu-active.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-snb2/igt@gem_exec_reloc@basic-write-cpu-active.html

  * igt@gem_exec_whisper@basic-forked:
    - shard-kbl:          [PASS][9] -> [INCOMPLETE][10] ([i915#2439]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl1/igt@gem_exec_whisper@basic-forked.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl1/igt@gem_exec_whisper@basic-forked.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [PASS][11] -> [INCOMPLETE][12] ([i915#2439]) +5 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-glk5/igt@gem_exec_whisper@basic-queues-forked-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-glk6/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge:
    - shard-glk:          [PASS][13] -> [DMESG-WARN][14] ([i915#1982])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#79])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#109441])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb2/igt@kms_psr@psr2_primary_blt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb7/igt@kms_psr@psr2_primary_blt.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-apl:          [INCOMPLETE][19] ([i915#1635] / [i915#2439]) -> [PASS][20] +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl6/igt@gem_exec_reloc@basic-gtt-cpu-active.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl8/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_reloc@basic-spin@vecs0:
    - shard-iclb:         [INCOMPLETE][21] ([i915#2439]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb2/igt@gem_exec_reloc@basic-spin@vecs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb5/igt@gem_exec_reloc@basic-spin@vecs0.html

  * igt@gem_exec_reloc@basic-wc-active:
    - shard-kbl:          [INCOMPLETE][23] ([i915#2439]) -> [PASS][24] +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl6/igt@gem_exec_reloc@basic-wc-active.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl3/igt@gem_exec_reloc@basic-wc-active.html

  * igt@gem_exec_reloc@basic-wc-read-active:
    - shard-snb:          [INCOMPLETE][25] ([i915#2439] / [i915#82]) -> [PASS][26] +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-snb1/igt@gem_exec_reloc@basic-wc-read-active.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-snb4/igt@gem_exec_reloc@basic-wc-read-active.html

  * igt@gem_exec_reloc@basic-write-cpu-active:
    - shard-tglb:         [INCOMPLETE][27] ([i915#2439]) -> [PASS][28] +4 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb5/igt@gem_exec_reloc@basic-write-cpu-active.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb7/igt@gem_exec_reloc@basic-write-cpu-active.html

  * igt@gem_exec_whisper@basic-normal:
    - shard-glk:          [INCOMPLETE][29] ([i915#2439]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-glk5/igt@gem_exec_whisper@basic-normal.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-glk7/igt@gem_exec_whisper@basic-normal.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding:
    - shard-kbl:          [FAIL][31] ([i915#54]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-vga1:
    - shard-snb:          [DMESG-WARN][33] ([i915#42]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-snb1/igt@kms_flip@flip-vs-suspend-interruptible@b-vga1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-snb7/igt@kms_flip@flip-vs-suspend-interruptible@b-vga1.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][35] ([fdo#109441]) -> [PASS][36] +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][37], [FAIL][38], [FAIL][39], [FAIL][40], [FAIL][41], [FAIL][42], [FAIL][43], [FAIL][44], [FAIL][45], [FAIL][46], [FAIL][47], [FAIL][48], [FAIL][49], [FAIL][50], [FAIL][51], [FAIL][52], [FAIL][53], [FAIL][54], [FAIL][55], [FAIL][56], [FAIL][57], [FAIL][58]) ([i915#1611] / [i915#1784] / [i915#2263] / [i915#2268] / [i915#2439]) -> ([FAIL][59], [FAIL][60], [FAIL][61], [FAIL][62], [FAIL][63], [FAIL][64], [FAIL][65], [FAIL][66], [FAIL][67], [FAIL][68], [FAIL][69], [FAIL][70], [FAIL][71], [FAIL][72], [FAIL][73], [FAIL][74], [FAIL][75], [FAIL][76], [FAIL][77], [FAIL][78], [FAIL][79], [FAIL][80], [FAIL][81], [FAIL][82]) ([i915#1611] / [i915#1784] / [i915#2263] / [i915#2268] / [i915#2398] / [i915#2439])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl2/igt@runner@aborted.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl6/igt@runner@aborted.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl3/igt@runner@aborted.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl7/igt@runner@aborted.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl7/igt@runner@aborted.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl4/igt@runner@aborted.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl4/igt@runner@aborted.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl6/igt@runner@aborted.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl6/igt@runner@aborted.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl1/igt@runner@aborted.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl3/igt@runner@aborted.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl7/igt@runner@aborted.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl7/igt@runner@aborted.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl6/igt@runner@aborted.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl2/igt@runner@aborted.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl4/igt@runner@aborted.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl4/igt@runner@aborted.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl1/igt@runner@aborted.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl3/igt@runner@aborted.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl1/igt@runner@aborted.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl2/igt@runner@aborted.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl7/igt@runner@aborted.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl6/igt@runner@aborted.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl7/igt@runner@aborted.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl7/igt@runner@aborted.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl3/igt@runner@aborted.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl2/igt@runner@aborted.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl3/igt@runner@aborted.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl4/igt@runner@aborted.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl4/igt@runner@aborted.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl2/igt@runner@aborted.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl6/igt@runner@aborted.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl1/igt@runner@aborted.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl1/igt@runner@aborted.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl6/igt@runner@aborted.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl7/igt@runner@aborted.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl1/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl3/igt@runner@aborted.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl6/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl2/igt@runner@aborted.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl2/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl1/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl7/igt@runner@aborted.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl4/igt@runner@aborted.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl2/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl1/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][83], [FAIL][84], [FAIL][85], [FAIL][86], [FAIL][87], [FAIL][88], [FAIL][89], [FAIL][90], [FAIL][91], [FAIL][92], [FAIL][93], [FAIL][94], [FAIL][95], [FAIL][96], [FAIL][97], [FAIL][98], [FAIL][99], [FAIL][100], [FAIL][101], [FAIL][102], [FAIL][103], [FAIL][104], [FAIL][105], [FAIL][106]) ([i915#1684] / [i915#2439]) -> ([FAIL][107], [FAIL][108], [FAIL][109], [FAIL][110], [FAIL][111], [FAIL][112], [FAIL][113], [FAIL][114], [FAIL][115], [FAIL][116], [FAIL][117], [FAIL][118], [FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125], [FAIL][126], [FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130]) ([i915#1186] / [i915#2398] / [i915#2439])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb6/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb1/igt@runner@aborted.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb1/igt@runner@aborted.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb3/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb7/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb4/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb7/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb5/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb6/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb5/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb2/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb8/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb3/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb6/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb3/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb2/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb4/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb8/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb7/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb6/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb2/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb5/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb3/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb8/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb8/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb1/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb3/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb6/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb8/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb8/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb7/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb6/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb4/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb5/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb2/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb2/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb1/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb4/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb3/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb6/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb3/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb4/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb2/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb4/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb5/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb5/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb5/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb1/igt@runner@aborted.html
    - shard-apl:          ([FAIL][131], [FAIL][132], [FAIL][133], [FAIL][134], [FAIL][135], [FAIL][136], [FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147], [FAIL][148], [FAIL][149], [FAIL][150], [FAIL][151], [FAIL][152], [FAIL][153]) ([i915#1610] / [i915#1611] / [i915#1635] / [i915#2263] / [i915#2268] / [i915#2439] / [i915#337] / [i915#637]) -> ([FAIL][154], [FAIL][155], [FAIL][156], [FAIL][157], [FAIL][158], [FAIL][159], [FAIL][160], [FAIL][161], [FAIL][162], [FAIL][163], [FAIL][164], [FAIL][165], [FAIL][166], [FAIL][167], [FAIL][168], [FAIL][169], [FAIL][170], [FAIL][171], [FAIL][172], [FAIL][173], [FAIL][174], [FAIL][175]) ([i915#1186] / [i915#1610] / [i915#1611] / [i915#1635] / [i915#2263] / [i915#2268] / [i915#2398] / [i915#2439] / [i915#337] / [i915#637])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl7/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl4/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl2/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl6/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl3/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl1/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl2/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl6/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl7/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl6/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl6/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl7/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl2/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl8/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl3/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl4/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl3/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl7/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl4/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl3/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl6/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl8/igt@runner@aborted.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl3/igt@runner@aborted.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl8/igt@runner@aborted.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl3/igt@runner@aborted.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl4/igt@runner@aborted.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl7/igt@runner@aborted.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl7/igt@runner@aborted.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl1/igt@runner@aborted.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl3/igt@runner@aborted.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl7/igt@runner@aborted.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl6/igt@runner@aborted.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl2/igt@runner@aborted.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl2/igt@runner@aborted.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl4/igt@runner@aborted.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl3/igt@runner@aborted.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl1/igt@runner@aborted.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl2/igt@runner@aborted.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl4/igt@runner@aborted.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl1/igt@runner@aborted.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl7/igt@runner@aborted.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl1/igt@runner@aborted.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl1/igt@runner@aborted.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl4/igt@runner@aborted.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl7/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][176], [FAIL][177], [FAIL][178], [FAIL][179], [FAIL][180], [FAIL][181], [FAIL][182], [FAIL][183], [FAIL][184], [FAIL][185], [FAIL][186], [FAIL][187], [FAIL][188], [FAIL][189], [FAIL][190], [FAIL][191], [FAIL][192], [FAIL][193], [FAIL][194], [FAIL][195], [FAIL][196], [FAIL][197], [FAIL][198], [FAIL][199]) ([i915#1764] / [i915#2045] / [i915#2263] / [i915#2268] / [i915#2439]) -> ([FAIL][200], [FAIL][201], [FAIL][202], [FAIL][203], [FAIL][204], [FAIL][205], [FAIL][206], [FAIL][207], [FAIL][208], [FAIL][209], [FAIL][210], [FAIL][211], [FAIL][212], [FAIL][213], [FAIL][214], [FAIL][215], [FAIL][216], [FAIL][217], [FAIL][218], [FAIL][219], [FAIL][220], [FAIL][221], [FAIL][222]) ([i915#1186] / [i915#1764] / [i915#2263] / [i915#2268] / [i915#2398] / [i915#2439])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb3/igt@runner@aborted.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb3/igt@runner@aborted.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb8/igt@runner@aborted.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb7/igt@runner@aborted.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb3/igt@runner@aborted.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb8/igt@runner@aborted.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb7/igt@runner@aborted.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb5/igt@runner@aborted.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb5/igt@runner@aborted.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb2/igt@runner@aborted.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb7/igt@runner@aborted.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb2/igt@runner@aborted.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb8/igt@runner@aborted.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb5/igt@runner@aborted.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb5/igt@runner@aborted.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb7/igt@runner@aborted.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb1/igt@runner@aborted.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb2/igt@runner@aborted.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb6/igt@runner@aborted.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb6/igt@runner@aborted.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb1/igt@runner@aborted.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb1/igt@runner@aborted.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb1/igt@runner@aborted.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb6/igt@runner@aborted.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb8/igt@runner@aborted.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb3/igt@runner@aborted.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb1/igt@runner@aborted.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb1/igt@runner@aborted.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb3/igt@runner@aborted.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb7/igt@runner@aborted.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb1/igt@runner@aborted.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb5/igt@runner@aborted.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb7/igt@runner@aborted.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb2/igt@runner@aborted.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb3/igt@runner@aborted.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb5/igt@runner@aborted.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb5/igt@runner@aborted.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb6/igt@runner@aborted.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb3/igt@runner@aborted.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb2/igt@runner@aborted.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb3/igt@runner@aborted.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb8/igt@runner@aborted.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb8/igt@runner@aborted.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb2/igt@runner@aborted.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb5/igt@runner@aborted.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb6/igt@runner@aborted.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb8/igt@runner@aborted.html

  
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1186]: https://gitlab.freedesktop.org/drm/intel/issues/1186
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1684]: https://gitlab.freedesktop.org/drm/intel/issues/1684
  [i915#1764]: https://gitlab.freedesktop.org/drm/intel/issues/1764
  [i915#1784]: https://gitlab.freedesktop.org/drm/intel/issues/1784
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2045]: https://gitlab.freedesktop.org/drm/intel/issues/2045
  [i915#2263]: https://gitlab.freedesktop.org/drm/intel/issues/2263
  [i915#2268]: https://gitlab.freedesktop.org/drm/intel/issues/2268
  [i915#2374]: https://gitlab.freedesktop.org/drm/intel/issues/2374
  [i915#2398]: https://gitlab.freedesktop.org/drm/intel/issues/2398
  [i915#2439]: https://gitlab.freedesktop.org/drm/intel/issues/2439
  [i915#337]: https://gitlab.freedesktop.org/drm/intel/issues/337
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#637]: https://gitlab.freedesktop.org/drm/intel/issues/637
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5780 -> IGTPW_

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/index.html

--===============3358598614489293044==
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
<tr><td><b>Series:</b></td><td>lib/i915/perf: rework perf counters equation=
s</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/81547/">https://patchwork.freedesktop.org/series/81547/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_4970/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_4970/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8993_full -&gt; IGTPW_4970_full</h=
1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/index.=
html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4970_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process@render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8993/shard-iclb4/igt@gem_ctx_persistence@legacy-engines-mixed-proce=
ss@render.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_4970/shard-iclb6/igt@gem_ctx_persistence@legacy-engines-mixed=
-process@render.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2374">i915#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read-active:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8993/shard-apl4/igt@gem_exec_reloc@basic-gtt-read-active.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/sh=
ard-apl6/igt@gem_exec_reloc@basic-gtt-read-active.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#24=
39</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8993/shard-tglb8/igt@gem_exec_reloc@basic-gtt-read-active.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/s=
hard-tglb7/igt@gem_exec_reloc@basic-gtt-read-active.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</=
a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu-active:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8993/shard-snb5/igt@gem_exec_reloc@basic-write-cpu-active.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/=
shard-snb2/igt@gem_exec_reloc@basic-write-cpu-active.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/82">i915#8=
2</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8993/shard-kbl1/igt@gem_exec_whisper@basic-forked.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kb=
l1/igt@gem_exec_whisper@basic-forked.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) +1 similar =
issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8993/shard-glk5/igt@gem_exec_whisper@basic-queues-forked-all.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_49=
70/shard-glk6/igt@gem_exec_whisper@basic-queues-forked-all.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915=
#2439</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8993/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_4970/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8993/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptibl=
e@bc-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_4970/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible@bc-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8993/shard-iclb2/igt@kms_psr@psr2_primary_blt.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb7/=
igt@kms_psr@psr2_primary_blt.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8993/shard-apl6/igt@gem_exec_reloc@basic-gtt-cpu-active.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635"=
>i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2439">i915#2439</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_4970/shard-apl8/igt@gem_exec_reloc@basic-gtt-cpu-active.html">PA=
SS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-spin@vecs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8993/shard-iclb2/igt@gem_exec_reloc@basic-spin@vecs0.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i9=
15#2439</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_4970/shard-iclb5/igt@gem_exec_reloc@basic-spin@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-active:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8993/shard-kbl6/igt@gem_exec_reloc@basic-wc-active.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915=
#2439</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
4970/shard-kbl3/igt@gem_exec_reloc@basic-wc-active.html">PASS</a> +3 simila=
r issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read-active:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8993/shard-snb1/igt@gem_exec_reloc@basic-wc-read-active.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439"=
>i915#2439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/82">i915#82</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_4970/shard-snb4/igt@gem_exec_reloc@basic-wc-read-active.html">PASS</=
a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu-active:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8993/shard-tglb5/igt@gem_exec_reloc@basic-write-cpu-active.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/24=
39">i915#2439</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_4970/shard-tglb7/igt@gem_exec_reloc@basic-write-cpu-active.html">PA=
SS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-normal:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8993/shard-glk5/igt@gem_exec_whisper@basic-normal.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#=
2439</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4=
970/shard-glk7/igt@gem_exec_whisper@basic-normal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8993/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54=
">i915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_4970/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-vga1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8993/shard-snb1/igt@kms_flip@flip-vs-suspend-interruptible@b-vga1.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/42">i915#42</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_4970/shard-snb7/igt@kms_flip@flip-vs-suspend-interruptible@b-vga=
1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8993/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#1094=
41</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_497=
0/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> +1 similar =
issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8993/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl6/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_8993/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl7/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_89=
93/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl4/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/sh=
ard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl6/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-k=
bl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_8993/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl3/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/CI_DRM_8993/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl7/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_8993/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl2/igt@runner@=
aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8993/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl4/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_8993/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl3/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_89=
93/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-kbl2/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/sh=
ard-kbl7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/1784">i915#1784</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/2263">i915#2263</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/2268">i915#2268</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-=
kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_4970/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl7/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_4970/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl2/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_4970/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl4/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_4970/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl2/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970=
/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl1/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-=
kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_4970/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl7/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_4970/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl3/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_4970/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl2/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_4970/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl1/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970=
/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_4970/shard-kbl4/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-=
kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_4970/shard-kbl1/igt@runner@aborted.html">FAIL</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1611">i915#1611<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1784">i915=
#1784</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2263=
">i915#2263</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2268">i915#2268</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2398">i915#2398</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2439">i915#2439</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8993/shard-iclb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb1/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_8993/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb3/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_8993/shard-iclb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb4/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8=
993/shard-iclb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb5/igt@runner@aborted.html=
">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993=
/shard-iclb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb5/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/sh=
ard-iclb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb8/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard=
-iclb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_8993/shard-iclb6/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-ic=
lb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_8993/shard-iclb2/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb4=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_8993/shard-iclb8/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb7/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/CI_DRM_8993/shard-iclb6/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb2/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/CI_DRM_8993/shard-iclb5/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-iclb3/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_8993/shard-iclb8/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1684">i915#1684</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/s=
hard-iclb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb1/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-=
iclb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_4970/shard-iclb6/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb8=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_4970/shard-iclb8/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb7/igt@=
runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_4970/shard-iclb6/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb4/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_4970/shard-iclb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb2/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_4970/shard-iclb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb1/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_4970/shard-iclb4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb3/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970=
/shard-iclb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb3/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shar=
d-iclb4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_4970/shard-iclb2/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-icl=
b4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_4970/shard-iclb5/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb5/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_4970/shard-iclb5/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-iclb1/igt@run=
ner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1186">i915#1186</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2398">i915#2398</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2439">i915#2439</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8993/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl4/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_8993/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl6/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_89=
93/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl1/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/sh=
ard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/CI_DRM_8993/shard-apl6/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-a=
pl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_8993/shard-apl6/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl6/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/CI_DRM_8993/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl2/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_8993/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl3/igt@runner@=
aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8993/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl3/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_8993/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl4/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_89=
93/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-apl6/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/sh=
ard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/CI_DRM_8993/shard-apl3/igt@runner@aborted.html">FAIL</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1610">i915#=
1610</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1611"=
>i915#1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2263">i915#2263</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2268">i915#2268</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2439">i915#2439</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/337">i915#337</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/637">i915#637</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl8/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_497=
0/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl4/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard=
-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_4970/shard-apl7/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl1/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_4970/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl7/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_4970/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl2/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_4970/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl4/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970=
/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl1/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-=
apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_4970/shard-apl4/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl1/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_4970/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl1/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_4970/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-apl4/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_4970/shard-apl7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1186">i915#1186</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2263">i915#=
2263</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2268"=
>i915#2268</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2398">i915#2398</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2439">i915#2439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/337">i915#337</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/637">i915#637</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8993/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb3/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_8993/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb7/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_8993/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb8/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8=
993/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb5/igt@runner@aborted.html=
">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993=
/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb2/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/sh=
ard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb2/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard=
-tglb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_8993/shard-tglb5/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tg=
lb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_8993/shard-tglb7/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb1=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_8993/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb6/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/CI_DRM_8993/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb1/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/CI_DRM_8993/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8993/shard-tglb1/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_8993/shard-tglb6/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1764">i915#1764</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2045">i915#2045</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2263">i915#=
2263</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2268"=
>i915#2268</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2439">i915#2439</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_4970/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb3/igt@runner@=
aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_4970/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb1/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_4970/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb7/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_497=
0/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb5/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/sha=
rd-tglb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_4970/shard-tglb2/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tg=
lb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_4970/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb5/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_4970/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb3/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_4970/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb3/igt@runner@=
aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_4970/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb8/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_4970/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb5/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_497=
0/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_4970/shard-tglb8/igt@runner@aborted.html">F=
AIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1186">=
i915#1186</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1764">i915#1764</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2263">i915#2263</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2268">i915#2268</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2398">i915#2398</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2439">i915#2439</a>)</p>
</li>
</ul>
</li>
</ul>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5780 -&gt; IGTPW_</li>
</ul>

</body>
</html>

--===============3358598614489293044==--

--===============0783955843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0783955843==--
