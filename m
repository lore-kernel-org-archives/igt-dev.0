Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 06 Mar 2020 07:04:43 -0000
Message-ID: <158347828343.3081.9487866558664832012@emeril.freedesktop.org>
References: <1583396719-4200-1-git-send-email-kunal1.joshi@intel.com>
In-Reply-To: <1583396719-4200-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgVGVzdCBw?=
 =?utf-8?q?latform_supported_pixel_formats_through_chamelium?=
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

Series: Test platform supported pixel formats through chamelium
URL   : https://patchwork.freedesktop.org/series/74343/
State : success

== Summary ==

CI Bug Log - changes from IGT_5495_full -> IGTPW_4266_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4266_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4266_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4266_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_chamelium@hdmi-yuv-pixel-format} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-tglb1/igt@kms_chamelium@hdmi-yuv-pixel-format.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][2], [FAIL][3], [FAIL][4], [FAIL][5], [FAIL][6], [FAIL][7], [FAIL][8], [FAIL][9]) ([fdo#109271] / [fdo#111870] / [k.org#204565]) -> ([FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16]) ([fdo#111870])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-hsw4/igt@runner@aborted.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-hsw6/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-hsw2/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-hsw4/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-hsw2/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-hsw6/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-hsw2/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-hsw8/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-hsw2/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-hsw8/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-hsw8/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-hsw4/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-hsw4/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-hsw1/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-hsw2/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][17], [FAIL][18]) ([i915#92] / [k.org#204565]) -> ([FAIL][19], [FAIL][20]) ([i915#92])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-kbl2/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-kbl4/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-kbl7/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-kbl6/igt@runner@aborted.html
    - shard-apl:          ([FAIL][21], [FAIL][22]) ([fdo#103927] / [k.org#204565]) -> ([FAIL][23], [FAIL][24]) ([fdo#103927])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-apl2/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-apl8/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-apl6/igt@runner@aborted.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-apl7/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@i915_selftest@live}:
    - shard-snb:          NOTRUN -> [FAIL][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-snb5/igt@i915_selftest@live.html
    - shard-tglb:         NOTRUN -> [FAIL][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-tglb3/igt@i915_selftest@live.html
    - shard-kbl:          NOTRUN -> [FAIL][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-kbl6/igt@i915_selftest@live.html
    - shard-hsw:          NOTRUN -> [FAIL][28]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-hsw4/igt@i915_selftest@live.html
    - shard-glk:          NOTRUN -> [FAIL][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-glk1/igt@i915_selftest@live.html
    - shard-iclb:         NOTRUN -> [FAIL][30]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-iclb7/igt@i915_selftest@live.html
    - shard-apl:          NOTRUN -> [FAIL][31]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-apl7/igt@i915_selftest@live.html

  
New tests
---------

  New tests have been introduced between IGT_5495_full and IGTPW_4266_full:

### New IGT tests (6) ###

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt:
    - Statuses : 1 dmesg-warn(s) 5 pass(s)
    - Exec time: [0.47, 2.29] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@uc:
    - Statuses : 6 pass(s)
    - Exec time: [0.55, 2.48] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wb:
    - Statuses : 6 pass(s)
    - Exec time: [0.53, 2.40] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wc:
    - Statuses : 6 pass(s)
    - Exec time: [0.55, 2.49] s

  * igt@kms_chamelium@hdmi-rgb-pixel-format:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium@hdmi-yuv-pixel-format:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4266_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [PASS][32] -> [SKIP][33] ([fdo#112080]) +9 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-iclb2/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-iclb5/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_exec_schedule@implicit-both-bsd2:
    - shard-iclb:         [PASS][34] -> [SKIP][35] ([fdo#109276] / [i915#677]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd2.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-iclb8/igt@gem_exec_schedule@implicit-both-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][36] -> [SKIP][37] ([i915#677]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [PASS][38] -> [SKIP][39] ([fdo#112146]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-glk:          [PASS][40] -> [DMESG-WARN][41] ([i915#118] / [i915#95])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-glk8/igt@gem_exec_whisper@basic-queues-priority.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-glk3/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [PASS][42] -> [FAIL][43] ([i915#644])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-kbl3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-kbl1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-hsw:          [PASS][44] -> [DMESG-WARN][45] ([fdo#111870])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-hsw2/igt@gem_userptr_blits@sync-unmap.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-hsw4/igt@gem_userptr_blits@sync-unmap.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][46] -> [DMESG-WARN][47] ([i915#180])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][48] -> [FAIL][49] ([i915#79])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-snb:          [PASS][50] -> [DMESG-WARN][51] ([i915#42])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-snb2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-snb5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][52] -> [SKIP][53] ([fdo#109642] / [fdo#111068])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-iclb6/igt@kms_psr2_su@frontbuffer.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][54] -> [SKIP][55] ([fdo#109276]) +16 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-iclb1/igt@prime_busy@hang-bsd2.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-iclb5/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [SKIP][56] ([fdo#112080]) -> [PASS][57] +9 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-iclb8/igt@gem_busy@extended-parallel-vcs1.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-iclb4/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_ctx_isolation@bcs0-s3:
    - shard-iclb:         [INCOMPLETE][58] ([fdo#109100]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-iclb3/igt@gem_ctx_isolation@bcs0-s3.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-iclb8/igt@gem_ctx_isolation@bcs0-s3.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [SKIP][60] ([fdo#109276]) -> [PASS][61] +19 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-iclb8/igt@gem_exec_schedule@independent-bsd2.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-iclb1/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][62] ([i915#677]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][64] ([fdo#112146]) -> [PASS][65] +6 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [DMESG-WARN][66] ([fdo#111870] / [i915#478]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [INCOMPLETE][68] -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-tglb3/igt@i915_module_load@reload.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-tglb8/igt@i915_module_load@reload.html
    - shard-snb:          [INCOMPLETE][70] ([i915#82]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-snb5/igt@i915_module_load@reload.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-snb6/igt@i915_module_load@reload.html
    - shard-iclb:         [INCOMPLETE][72] ([i915#140]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-iclb5/igt@i915_module_load@reload.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-iclb6/igt@i915_module_load@reload.html
    - shard-kbl:          [INCOMPLETE][74] ([fdo#103665]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-kbl4/igt@i915_module_load@reload.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-kbl1/igt@i915_module_load@reload.html
    - shard-hsw:          [INCOMPLETE][76] ([i915#1312] / [i915#61]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-hsw6/igt@i915_module_load@reload.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-hsw8/igt@i915_module_load@reload.html
    - shard-glk:          [INCOMPLETE][78] ([i915#58] / [k.org#198133]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-glk2/igt@i915_module_load@reload.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-glk9/igt@i915_module_load@reload.html
    - shard-apl:          [INCOMPLETE][80] ([fdo#103927]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-apl8/igt@i915_module_load@reload.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-apl8/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-hsw:          [SKIP][82] ([fdo#109271]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-hsw8/igt@i915_pm_rpm@gem-evict-pwrite.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-hsw4/igt@i915_pm_rpm@gem-evict-pwrite.html
    - shard-tglb:         [SKIP][84] ([i915#1316]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-tglb6/igt@i915_pm_rpm@gem-evict-pwrite.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-tglb7/igt@i915_pm_rpm@gem-evict-pwrite.html
    - shard-iclb:         [SKIP][86] ([i915#1316]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-iclb4/igt@i915_pm_rpm@gem-evict-pwrite.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-iclb1/igt@i915_pm_rpm@gem-evict-pwrite.html
    - shard-glk:          [SKIP][88] ([fdo#109271]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-glk8/igt@i915_pm_rpm@gem-evict-pwrite.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-glk3/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][90] ([i915#72]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-apl:          [DMESG-WARN][92] ([i915#180]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-apl8/igt@kms_flip@flip-vs-suspend.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-apl2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][94] ([i915#899]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][96] ([fdo#109441]) -> [PASS][97] +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Warnings ####

  * igt@gem_exec_schedule@pi-userfault-bsd2:
    - shard-iclb:         [INCOMPLETE][98] ([i915#1381]) -> [SKIP][99] ([fdo#109276])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-iclb4/igt@gem_exec_schedule@pi-userfault-bsd2.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-iclb7/igt@gem_exec_schedule@pi-userfault-bsd2.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][100] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][101] ([fdo#111870] / [i915#478])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-iclb:         [SKIP][102] ([fdo#109293] / [fdo#109506]) -> [SKIP][103] ([i915#1316])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-iclb7/igt@i915_pm_rpm@pc8-residency.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-iclb2/igt@i915_pm_rpm@pc8-residency.html
    - shard-tglb:         [SKIP][104] ([fdo#109506]) -> [SKIP][105] ([i915#1316])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-tglb1/igt@i915_pm_rpm@pc8-residency.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-tglb6/igt@i915_pm_rpm@pc8-residency.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [FAIL][106] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][107] ([i915#1319])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-apl7/igt@kms_content_protection@legacy.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-apl3/igt@kms_content_protection@legacy.html

  * igt@runner@aborted:
    - shard-iclb:         [FAIL][108] ([fdo#111093] / [k.org#204565]) -> [FAIL][109] ([fdo#111093])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-iclb5/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-iclb7/igt@runner@aborted.html
    - shard-glk:          [FAIL][110] ([k.org#202321] / [k.org#204565]) -> [FAIL][111] ([k.org#202321])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-glk2/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-glk1/igt@runner@aborted.html
    - shard-tglb:         [FAIL][112] ([k.org#204565]) -> [FAIL][113] ([i915#1233])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-tglb3/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-tglb3/igt@runner@aborted.html
    - shard-snb:          ([FAIL][114], [FAIL][115], [FAIL][116], [FAIL][117], [FAIL][118], [FAIL][119], [FAIL][120], [FAIL][121]) ([fdo#111870] / [i915#1077] / [k.org#204565]) -> ([FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125], [FAIL][126], [FAIL][127], [FAIL][128]) ([fdo#111870] / [i915#1077])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-snb5/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-snb2/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-snb6/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-snb4/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-snb5/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-snb2/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-snb6/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/shard-snb6/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-snb2/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-snb6/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-snb6/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-snb5/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-snb5/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-snb6/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/shard-snb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109100]: https://bugs.freedesktop.org/show_bug.cgi?id=109100
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111093]: https://bugs.freedesktop.org/show_bug.cgi?id=111093
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#1312]: https://gitlab.freedesktop.org/drm/intel/issues/1312
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1381]: https://gitlab.freedesktop.org/drm/intel/issues/1381
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321
  [k.org#204565]: https://bugzilla.kernel.org/show_bug.cgi?id=204565


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5495 -> IGTPW_4266

  CI-20190529: 20190529
  CI_DRM_8069: c8673f18b2ca3b343206c2ba65d6f1020a93614c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4266: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/index.html
  IGT_5495: 22df72de8affcec22d9f354bb6148d77f60cc580 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
