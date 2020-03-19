Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 19 Mar 2020 17:28:31 -0000
Message-ID: <158463891185.17934.7669990244670264684@emeril.freedesktop.org>
References: <20200319144453.1131507-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200319144453.1131507-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fvm=5Fcreate=3A_Update_of_active_VM_disallowed?=
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

Series: i915/gem_vm_create: Update of active VM disallowed
URL   : https://patchwork.freedesktop.org/series/74878/
State : success

== Summary ==

CI Bug Log - changes from IGT_5523_full -> IGTPW_4326_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/index.html

Known issues
------------

  Here are the changes found in IGTPW_4326_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276] / [i915#677]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-iclb2/igt@gem_exec_schedule@implicit-both-bsd1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-iclb8/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([i915#677]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-iclb7/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276]) +15 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-iclb3/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-iclb8/igt@gem_exec_schedule@wide-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-iclb4/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_linear_blits@interruptible:
    - shard-apl:          [PASS][9] -> [FAIL][10] ([i915#1263])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-apl3/igt@gem_linear_blits@interruptible.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-apl2/igt@gem_linear_blits@interruptible.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-tglb:         [PASS][11] -> [FAIL][12] ([i915#644])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-tglb2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-tglb6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-hsw:          [PASS][13] -> [DMESG-WARN][14] ([fdo#111870])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-hsw7/igt@gem_userptr_blits@sync-unmap-after-close.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-hsw6/igt@gem_userptr_blits@sync-unmap-after-close.html
    - shard-snb:          [PASS][15] -> [DMESG-WARN][16] ([fdo#111870] / [i915#478])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][17] -> [DMESG-WARN][18] ([i915#716])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-glk1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_hangman@error-state-capture-vcs1:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#112080]) +11 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-iclb4/igt@i915_hangman@error-state-capture-vcs1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-iclb8/igt@i915_hangman@error-state-capture-vcs1.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-tglb:         [PASS][21] -> [SKIP][22] ([i915#1316]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-tglb8/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-tglb3/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([i915#1316]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-iclb6/igt@i915_pm_rpm@system-suspend-devices.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-iclb2/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-glk:          [PASS][25] -> [SKIP][26] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-glk5/igt@i915_pm_rpm@system-suspend-devices.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-glk7/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-kbl:          [PASS][27] -> [INCOMPLETE][28] ([i915#151] / [i915#155])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-kbl3/igt@i915_pm_rpm@system-suspend-modeset.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-kbl3/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_pm_rps@waitboost:
    - shard-tglb:         [PASS][29] -> [FAIL][30] ([i915#413])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-tglb5/igt@i915_pm_rps@waitboost.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-tglb1/igt@i915_pm_rps@waitboost.html

  * igt@kms_busy@basic-modeset-pipe-b:
    - shard-snb:          [PASS][31] -> [DMESG-WARN][32] ([i915#478])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-snb4/igt@kms_busy@basic-modeset-pipe-b.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-snb5/igt@kms_busy@basic-modeset-pipe-b.html
    - shard-hsw:          [PASS][33] -> [DMESG-WARN][34] ([i915#478])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-hsw2/igt@kms_busy@basic-modeset-pipe-b.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-hsw4/igt@kms_busy@basic-modeset-pipe-b.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding:
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#54])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-apl:          [PASS][39] -> [FAIL][40] ([i915#79])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][41] -> [DMESG-WARN][42] ([i915#180]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-apl8/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-iclb5/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_vblank@pipe-c-query-idle-hang:
    - shard-hsw:          [PASS][45] -> [INCOMPLETE][46] ([i915#61])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-hsw1/igt@kms_vblank@pipe-c-query-idle-hang.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-hsw1/igt@kms_vblank@pipe-c-query-idle-hang.html

  
#### Possible fixes ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [SKIP][47] ([fdo#112080]) -> [PASS][48] +8 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-iclb7/igt@gem_busy@extended-parallel-vcs1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-iclb4/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [SKIP][49] ([fdo#109276] / [i915#677]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-iclb3/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][51] ([i915#677]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][53] ([fdo#112146]) -> [PASS][54] +6 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-iclb7/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +5 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-kbl7/igt@gem_exec_suspend@basic-s3.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-kbl2/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][57] ([fdo#111870] / [i915#478]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html
    - shard-hsw:          [DMESG-WARN][59] ([fdo#111870]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-hsw4/igt@gem_userptr_blits@sync-unmap-cycles.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-hsw4/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][61] ([i915#454]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-iclb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-iclb:         [SKIP][63] ([i915#1316]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-iclb5/igt@i915_pm_rpm@gem-execbuf.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-iclb8/igt@i915_pm_rpm@gem-execbuf.html
    - shard-glk:          [SKIP][65] ([fdo#109271]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-glk3/igt@i915_pm_rpm@gem-execbuf.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-glk3/igt@i915_pm_rpm@gem-execbuf.html
    - shard-tglb:         [SKIP][67] ([i915#1316]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-tglb7/igt@i915_pm_rpm@gem-execbuf.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-tglb7/igt@i915_pm_rpm@gem-execbuf.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][69] ([i915#413]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-iclb5/igt@i915_pm_rps@waitboost.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-iclb7/igt@i915_pm_rps@waitboost.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-apl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [SKIP][73] ([fdo#109441]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][75] ([i915#31]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-apl6/igt@kms_setmode@basic.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-apl4/igt@kms_setmode@basic.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][77] ([fdo#109276]) -> [PASS][78] +22 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-iclb3/igt@prime_vgem@fence-wait-bsd2.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [INCOMPLETE][79] ([i915#1402]) -> [TIMEOUT][80] ([i915#1340])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-tglb7/igt@gem_ctx_persistence@close-replace-race.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-tglb6/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-hsw:          [DMESG-WARN][81] ([fdo#111870]) -> [DMESG-WARN][82] ([fdo#110789] / [fdo#111870])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-hsw7/igt@gem_userptr_blits@dmabuf-unsync.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-hsw4/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-snb:          [DMESG-WARN][83] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][84] ([fdo#110789] / [fdo#111870] / [i915#478])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-snb2/igt@gem_userptr_blits@dmabuf-unsync.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-snb4/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt:
    - shard-hsw:          [DMESG-WARN][85] ([fdo#110789] / [i915#478]) -> [DMESG-WARN][86] ([i915#478])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html
    - shard-snb:          [DMESG-WARN][87] ([fdo#110789] / [i915#478]) -> [DMESG-WARN][88] ([i915#478])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1263]: https://gitlab.freedesktop.org/drm/intel/issues/1263
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1340]: https://gitlab.freedesktop.org/drm/intel/issues/1340
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5523 -> IGTPW_4326

  CI-20190529: 20190529
  CI_DRM_8159: 00b2e0f1e7b3ea36379d68855f46a86400935411 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4326: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/index.html
  IGT_5523: cf6d524007ac51a7d5a48503ea3dd5f01fd4ebab @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
