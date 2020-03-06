Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 06 Mar 2020 00:01:06 -0000
Message-ID: <158345286679.3080.12749942440973766067@emeril.freedesktop.org>
References: <1583379218-30115-1-git-send-email-kunal1.joshi@intel.com>
In-Reply-To: <1583379218-30115-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgVGVzdCBw?=
 =?utf-8?q?latform_supported_pixel_formats_through_chamelium=2E_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Test platform supported pixel formats through chamelium. (rev2)
URL   : https://patchwork.freedesktop.org/series/74317/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5493_full -> IGTPW_4262_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4262_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4262_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4262_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb7/igt@i915_pm_dc@dc5-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * {igt@kms_chamelium@hdmi-yuv-pixel-format} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-tglb6/igt@kms_chamelium@hdmi-yuv-pixel-format.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][4], [FAIL][5], [FAIL][6], [FAIL][7], [FAIL][8], [FAIL][9], [FAIL][10], [FAIL][11]) ([fdo#111870] / [i915#478]) -> ([FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17]) ([fdo#111870])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-hsw1/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-hsw2/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-hsw2/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-hsw8/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-hsw8/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-hsw6/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-hsw2/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-hsw6/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-hsw1/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-hsw4/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-hsw5/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-hsw8/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-hsw5/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-hsw6/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between IGT_5493_full and IGTPW_4262_full:

### New IGT tests (2) ###

  * igt@kms_chamelium@hdmi-rgb-pixel-format:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium@hdmi-yuv-pixel-format:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4262_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_shared@exec-shared-gtt-vebox:
    - shard-kbl:          [PASS][18] -> [FAIL][19] ([i915#616])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-kbl4/igt@gem_ctx_shared@exec-shared-gtt-vebox.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-kbl4/igt@gem_ctx_shared@exec-shared-gtt-vebox.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][20] -> [SKIP][21] ([fdo#110841])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][22] -> [SKIP][23] ([fdo#110854])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb4/igt@gem_exec_balancer@smoke.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-iclb7/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@implicit-write-read-bsd2:
    - shard-iclb:         [PASS][24] -> [SKIP][25] ([fdo#109276] / [i915#677])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb4/igt@gem_exec_schedule@implicit-write-read-bsd2.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-iclb5/igt@gem_exec_schedule@implicit-write-read-bsd2.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [PASS][26] -> [SKIP][27] ([fdo#109276]) +15 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb1/igt@gem_exec_schedule@promotion-bsd1.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-iclb3/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#112146]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb3/igt@gem_exec_schedule@wide-bsd.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-iclb2/igt@gem_exec_schedule@wide-bsd.html

  * igt@i915_pm_rpm@basic-rte:
    - shard-glk:          [PASS][30] -> [FAIL][31] ([i915#579])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-glk1/igt@i915_pm_rpm@basic-rte.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-glk2/igt@i915_pm_rpm@basic-rte.html
    - shard-iclb:         [PASS][32] -> [FAIL][33] ([i915#579])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb8/igt@i915_pm_rpm@basic-rte.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-iclb4/igt@i915_pm_rpm@basic-rte.html
    - shard-tglb:         [PASS][34] -> [FAIL][35] ([i915#579])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-tglb2/igt@i915_pm_rpm@basic-rte.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-tglb6/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@fences:
    - shard-tglb:         [PASS][36] -> [SKIP][37] ([i915#1316])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-tglb7/igt@i915_pm_rpm@fences.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-tglb6/igt@i915_pm_rpm@fences.html
    - shard-iclb:         [PASS][38] -> [SKIP][39] ([i915#1316])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb6/igt@i915_pm_rpm@fences.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-iclb4/igt@i915_pm_rpm@fences.html
    - shard-glk:          [PASS][40] -> [SKIP][41] ([fdo#109271])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-glk7/igt@i915_pm_rpm@fences.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-glk2/igt@i915_pm_rpm@fences.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][42] -> [DMESG-WARN][43] ([i915#180]) +3 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen:
    - shard-kbl:          [PASS][44] -> [FAIL][45] ([i915#54])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html
    - shard-apl:          [PASS][46] -> [FAIL][47] ([i915#54])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html
    - shard-glk:          [PASS][48] -> [FAIL][49] ([i915#54])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-glk9/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-glk7/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-tglb:         [PASS][50] -> [INCOMPLETE][51] ([i915#456] / [i915#460] / [i915#516])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-tglb5/igt@kms_flip@flip-vs-suspend-interruptible.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][52] -> [DMESG-WARN][53] ([i915#180])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][54] -> [SKIP][55] ([fdo#109441]) +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][56] -> [FAIL][57] ([i915#31])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-hsw6/igt@kms_setmode@basic.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-hsw4/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [PASS][58] -> [SKIP][59] ([fdo#112080]) +11 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb2/igt@perf_pmu@busy-check-all-vcs1.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-iclb6/igt@perf_pmu@busy-check-all-vcs1.html

  
#### Possible fixes ####

  * igt@gem_busy@close-race:
    - shard-tglb:         [INCOMPLETE][60] ([i915#977]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-tglb5/igt@gem_busy@close-race.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-tglb6/igt@gem_busy@close-race.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox:
    - shard-kbl:          [FAIL][62] ([i915#679]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-kbl6/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-kbl4/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html

  * igt@gem_ctx_shared@exec-shared-gtt-blt:
    - shard-tglb:         [FAIL][64] ([i915#616]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-tglb7/igt@gem_ctx_shared@exec-shared-gtt-blt.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-tglb5/igt@gem_ctx_shared@exec-shared-gtt-blt.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [FAIL][66] ([i915#1277]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-tglb7/igt@gem_exec_balancer@hang.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-tglb1/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@fifo-bsd1:
    - shard-iclb:         [SKIP][68] ([fdo#109276]) -> [PASS][69] +15 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb7/igt@gem_exec_schedule@fifo-bsd1.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-iclb1/igt@gem_exec_schedule@fifo-bsd1.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [SKIP][70] ([fdo#109276] / [i915#677]) -> [PASS][71] +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb6/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][72] ([i915#677]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-iclb7/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@pi-ringfull-bsd:
    - shard-iclb:         [SKIP][74] ([fdo#112146]) -> [PASS][75] +2 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb2/igt@gem_exec_schedule@pi-ringfull-bsd.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-iclb5/igt@gem_exec_schedule@pi-ringfull-bsd.html

  * igt@gem_mmap_offset@pf-nonblock:
    - shard-hsw:          [DMESG-WARN][76] ([i915#478]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-hsw6/igt@gem_mmap_offset@pf-nonblock.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-hsw2/igt@gem_mmap_offset@pf-nonblock.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][78] ([fdo#111870] / [i915#478]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
    - shard-hsw:          [DMESG-WARN][80] ([fdo#111870]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-hsw2/igt@gem_userptr_blits@sync-unmap-cycles.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-hsw5/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_rpm@gem-pread:
    - shard-tglb:         [SKIP][82] ([i915#1316]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-tglb1/igt@i915_pm_rpm@gem-pread.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-tglb8/igt@i915_pm_rpm@gem-pread.html
    - shard-iclb:         [SKIP][84] ([i915#1316]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb3/igt@i915_pm_rpm@gem-pread.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-iclb2/igt@i915_pm_rpm@gem-pread.html
    - shard-glk:          [SKIP][86] ([fdo#109271]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-glk2/igt@i915_pm_rpm@gem-pread.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-glk9/igt@i915_pm_rpm@gem-pread.html

  * igt@kms_cursor_crc@pipe-a-cursor-size-change:
    - shard-snb:          [SKIP][88] ([fdo#109271]) -> [PASS][89] +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-snb2/igt@kms_cursor_crc@pipe-a-cursor-size-change.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-snb2/igt@kms_cursor_crc@pipe-a-cursor-size-change.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][90] ([i915#180]) -> [PASS][91] +6 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-kbl:          [DMESG-WARN][92] ([i915#180]) -> [PASS][93] +2 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-snb:          [DMESG-WARN][94] ([i915#478]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-snb6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-snb6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][96] ([i915#899]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [SKIP][98] ([fdo#109441]) -> [PASS][99] +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb8/igt@kms_psr@psr2_dpms.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-iclb2/igt@kms_psr@psr2_dpms.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][100] ([fdo#112080]) -> [PASS][101] +9 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb6/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Warnings ####

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [INCOMPLETE][102] ([i915#1381]) -> [SKIP][103] ([i915#677])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb5/igt@gem_exec_schedule@pi-userfault-bsd.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-iclb2/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@pi-userfault-bsd2:
    - shard-iclb:         [SKIP][104] ([fdo#109276]) -> [INCOMPLETE][105] ([i915#1381])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb7/igt@gem_exec_schedule@pi-userfault-bsd2.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-iclb1/igt@gem_exec_schedule@pi-userfault-bsd2.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][106] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][107] ([fdo#111870] / [i915#478])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-snb4/igt@gem_userptr_blits@dmabuf-sync.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-hsw:          [DMESG-WARN][108] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][109] ([fdo#111870])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-hsw2/igt@gem_userptr_blits@dmabuf-sync.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-hsw6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][110], [FAIL][111], [FAIL][112], [FAIL][113], [FAIL][114], [FAIL][115], [FAIL][116], [FAIL][117]) ([fdo#111870] / [i915#1077] / [i915#698]) -> ([FAIL][118], [FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122], [FAIL][123]) ([fdo#111870] / [i915#1077])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-snb2/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-snb5/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-snb4/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-snb2/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-snb6/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-snb5/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-snb2/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-snb4/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-snb6/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-snb5/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-snb2/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-snb5/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-snb5/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/shard-snb4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1381]: https://gitlab.freedesktop.org/drm/intel/issues/1381
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#516]: https://gitlab.freedesktop.org/drm/intel/issues/516
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#616]: https://gitlab.freedesktop.org/drm/intel/issues/616
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#977]: https://gitlab.freedesktop.org/drm/intel/issues/977


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5493 -> IGTPW_4262

  CI-20190529: 20190529
  CI_DRM_8068: f8e69af5cca45947ebce78f677b75b0ecc4ba744 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4262: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/index.html
  IGT_5493: 41422f8384047e2ec4c4cb896f6955bf51490f53 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
