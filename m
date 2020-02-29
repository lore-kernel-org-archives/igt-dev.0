Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 29 Feb 2020 23:32:29 -0000
Message-ID: <158301914961.19636.11233202629262118735@emeril.freedesktop.org>
References: <20200228101236.2707161-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200228101236.2707161-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fsoftpin=3A_Limit_the_noreloc_test_runtime?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_softpin: Limit the noreloc test runtime
URL   : https://patchwork.freedesktop.org/series/74071/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8026_full -> IGTPW_4237_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4237_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4237_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4237_full:

### IGT changes ###

#### Warnings ####

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][1], [FAIL][2], [FAIL][3], [FAIL][4], [FAIL][5], [FAIL][6], [FAIL][7], [FAIL][8]) ([fdo#111870]) -> ([FAIL][9], [FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15]) ([fdo#111870] / [i915#226])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-hsw6/igt@runner@aborted.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-hsw6/igt@runner@aborted.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-hsw7/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-hsw1/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-hsw1/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-hsw1/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-hsw4/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-hsw4/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-hsw5/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-hsw6/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-hsw6/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-hsw7/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-hsw5/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-hsw6/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-hsw1/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8026_full and IGTPW_4237_full:

### New IGT tests (2) ###

  * igt@i915_selftest@mock:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@perf:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_4237_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#112080]) +11 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-iclb1/igt@gem_busy@busy-vcs1.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-iclb7/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd:
    - shard-apl:          [PASS][18] -> [FAIL][19] ([i915#679])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-apl7/igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-apl6/igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd1:
    - shard-apl:          [PASS][20] -> [INCOMPLETE][21] ([fdo#103927] / [i915#1239])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-apl7/igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd1.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-apl6/igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd1.html

  * igt@gem_exec_schedule@implicit-write-read-bsd1:
    - shard-iclb:         [PASS][22] -> [SKIP][23] ([fdo#109276] / [i915#677]) +3 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-iclb1/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-iclb3/igt@gem_exec_schedule@implicit-write-read-bsd1.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][24] -> [SKIP][25] ([i915#677]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-iclb3/igt@gem_exec_schedule@pi-common-bsd.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][26] -> [SKIP][27] ([fdo#112146]) +3 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-iclb5/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-hsw:          [PASS][28] -> [DMESG-WARN][29] ([fdo#111870])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-hsw5/igt@gem_userptr_blits@sync-unmap-after-close.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-hsw5/igt@gem_userptr_blits@sync-unmap-after-close.html
    - shard-snb:          [PASS][30] -> [DMESG-WARN][31] ([fdo#111870] / [i915#478])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-snb2/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][32] -> [FAIL][33] ([i915#447])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-iclb1/igt@i915_pm_dc@dc5-dpms.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][34] -> [FAIL][35] ([i915#413])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-iclb2/igt@i915_pm_rps@waitboost.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-iclb6/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][36] -> [DMESG-WARN][37] ([i915#180]) +4 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][38] -> [DMESG-WARN][39] ([i915#180]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-tglb:         [PASS][40] -> [FAIL][41] ([i915#488])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-tglb2/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-tglb3/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-apl:          [PASS][42] -> [DMESG-WARN][43] ([i915#1297])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-apl3/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-apl1/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
    - shard-kbl:          [PASS][44] -> [DMESG-WARN][45] ([i915#1297])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-kbl6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-kbl7/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][46] -> [SKIP][47] ([i915#433])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][48] -> [SKIP][49] ([fdo#109642] / [fdo#111068])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-iclb1/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][50] -> [SKIP][51] ([fdo#109441]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][52] -> [SKIP][53] ([fdo#109276]) +23 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-iclb3/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [SKIP][54] ([fdo#109276] / [i915#677]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-iclb7/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [SKIP][56] ([i915#677]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-iclb1/igt@gem_exec_schedule@pi-userfault-bsd.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-iclb6/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [SKIP][58] ([fdo#112146]) -> [PASS][59] +6 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-iclb7/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-iclb:         [INCOMPLETE][60] -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-iclb5/igt@gem_exec_whisper@basic-fds-all.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-iclb2/igt@gem_exec_whisper@basic-fds-all.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-iclb:         [FAIL][62] ([i915#644]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-iclb4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-iclb4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-hsw:          [DMESG-WARN][64] ([fdo#111870]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-hsw1/igt@gem_userptr_blits@dmabuf-unsync.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-hsw6/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-snb:          [DMESG-WARN][66] ([fdo#111870] / [i915#478]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-snb2/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:
    - shard-apl:          [FAIL][68] ([i915#54]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
    - shard-kbl:          [FAIL][70] ([i915#54]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-kbl:          [DMESG-WARN][72] ([i915#1297]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-kbl1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-kbl1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
    - shard-apl:          [DMESG-WARN][74] ([i915#1297]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-apl4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [DMESG-WARN][76] ([i915#180]) -> [PASS][77] +3 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-apl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-tglb:         [SKIP][78] ([i915#668]) -> [PASS][79] +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [SKIP][80] ([fdo#109441]) -> [PASS][81] +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-iclb5/igt@kms_psr@psr2_primary_render.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-iclb2/igt@kms_psr@psr2_primary_render.html

  * igt@kms_vblank@pipe-a-query-forked-hang:
    - shard-snb:          [SKIP][82] ([fdo#109271]) -> [PASS][83] +4 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-snb2/igt@kms_vblank@pipe-a-query-forked-hang.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-snb2/igt@kms_vblank@pipe-a-query-forked-hang.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][84] ([i915#180]) -> [PASS][85] +3 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][86] ([fdo#112080]) -> [PASS][87] +14 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-iclb3/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][88] ([fdo#109276]) -> [PASS][89] +13 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-iclb6/igt@prime_busy@hang-bsd2.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-iclb4/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][90] ([fdo#112080]) -> [FAIL][91] ([IGT#28]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][92] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][93] ([fdo#110789] / [fdo#111870] / [i915#478])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
    - shard-hsw:          [DMESG-WARN][94] ([fdo#111870]) -> [DMESG-WARN][95] ([fdo#110789] / [fdo#111870])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-hsw7/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-snb:          [INCOMPLETE][96] ([i915#82]) -> [SKIP][97] ([fdo#109271])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8026/shard-snb6/igt@i915_pm_dc@dc5-psr.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/shard-snb5/igt@i915_pm_dc@dc5-psr.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1239]: https://gitlab.freedesktop.org/drm/intel/issues/1239
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#226]: https://gitlab.freedesktop.org/drm/intel/issues/226
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#488]: https://gitlab.freedesktop.org/drm/intel/issues/488
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5474 -> IGTPW_4237
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8026: 6ce18c241dde9ee20b19ff42f8198552a57ab259 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4237: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/index.html
  IGT_5474: 1be610f852de155cd915e7cda65cb2737adf04d4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4237/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
