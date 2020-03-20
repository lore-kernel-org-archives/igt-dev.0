Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 20 Mar 2020 21:13:28 -0000
Message-ID: <158473880847.11039.12737084340047878344@emeril.freedesktop.org>
References: <20200319140608.25405-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200319140608.25405-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fmultiple=3A_Avoid_CRC_buffer_overflows_=28rev3=29?=
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
To: "Kahola, Mika" <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_plane_multiple: Avoid CRC buffer overflows (rev3)
URL   : https://patchwork.freedesktop.org/series/74846/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8166_full -> IGTPW_4335_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/index.html

Known issues
------------

  Here are the changes found in IGTPW_4335_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +13 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb2/igt@gem_busy@busy-vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-iclb8/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [PASS][3] -> [INCOMPLETE][4] ([i915#1402])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-tglb8/igt@gem_ctx_persistence@close-replace-race.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-tglb7/igt@gem_ctx_persistence@close-replace-race.html
    - shard-apl:          [PASS][5] -> [INCOMPLETE][6] ([fdo#103927] / [i915#1402])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-apl7/igt@gem_ctx_persistence@close-replace-race.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-apl8/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110841])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb3/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-kbl6/igt@gem_eio@in-flight-suspend.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-kbl1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#110854])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb1/igt@gem_exec_balancer@smoke.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-iclb3/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#677]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb8/igt@gem_exec_schedule@implicit-both-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-iclb2/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@implicit-write-read-bsd2:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#109276] / [i915#677])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb4/igt@gem_exec_schedule@implicit-write-read-bsd2.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-iclb7/igt@gem_exec_schedule@implicit-write-read-bsd2.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#112146]) +4 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb8/igt@gem_exec_schedule@reorder-wide-bsd.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-iclb4/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [PASS][19] -> [DMESG-WARN][20] ([fdo#111870] / [i915#478])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-snb2/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-hsw:          [PASS][21] -> [DMESG-WARN][22] ([fdo#111870])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-hsw7/igt@gem_userptr_blits@dmabuf-sync.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-hsw5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-hsw:          [PASS][23] -> [DMESG-WARN][24] ([fdo#110789] / [fdo#111870])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-hsw4/igt@gem_userptr_blits@sync-unmap-cycles.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-hsw7/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][25] -> [INCOMPLETE][26] ([i915#155])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +4 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109642] / [fdo#111068])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-iclb8/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-iclb3/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109276]) +18 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb1/igt@prime_busy@hang-bsd2.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-iclb5/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][35] ([fdo#112080]) -> [PASS][36] +10 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb7/igt@gem_exec_parallel@vcs1-fds.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-iclb2/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@fifo-bsd1:
    - shard-iclb:         [SKIP][37] ([fdo#109276]) -> [PASS][38] +15 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb7/igt@gem_exec_schedule@fifo-bsd1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-iclb2/igt@gem_exec_schedule@fifo-bsd1.html

  * igt@gem_exec_schedule@preempt-hang-bsd:
    - shard-iclb:         [SKIP][39] ([fdo#112146]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb1/igt@gem_exec_schedule@preempt-hang-bsd.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-iclb7/igt@gem_exec_schedule@preempt-hang-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][41] ([i915#644]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-kbl:          [INCOMPLETE][43] ([i915#879]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-kbl7/igt@i915_module_load@reload-with-fault-injection.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-kbl7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-random:
    - shard-apl:          [FAIL][45] ([i915#54]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-kbl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [INCOMPLETE][51] ([i915#155]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][53] ([i915#899]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][55] ([fdo#109441]) -> [PASS][56] +4 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_sequence@queue-idle:
    - shard-glk:          [INCOMPLETE][57] ([i915#58] / [k.org#198133]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-glk9/igt@kms_sequence@queue-idle.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-glk9/igt@kms_sequence@queue-idle.html

  * igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm:
    - shard-tglb:         [SKIP][59] ([fdo#112015]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-tglb1/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-tglb2/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
    - shard-iclb:         [SKIP][61] ([fdo#109278]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb7/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-iclb5/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [FAIL][63] ([i915#1085]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-tglb5/igt@perf@gen12-mi-rpc.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-tglb6/igt@perf@gen12-mi-rpc.html

  * igt@prime_busy@hang-bsd2:
    - shard-tglb:         [INCOMPLETE][65] -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-tglb6/igt@prime_busy@hang-bsd2.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-tglb2/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt:
    - shard-hsw:          [DMESG-WARN][67] -> [DMESG-WARN][68] ([i915#478])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-hsw5/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][69] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][70] ([fdo#110789] / [fdo#111870] / [i915#478])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][71] ([i915#588]) -> [SKIP][72] ([i915#658])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-iclb5/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][73] ([i915#454]) -> [SKIP][74] ([i915#468])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-tglb8/igt@i915_pm_dc@dc6-dpms.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][75] ([i915#468]) -> [FAIL][76] ([i915#454])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-tglb3/igt@i915_pm_dc@dc6-psr.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][77], [FAIL][78], [FAIL][79], [FAIL][80], [FAIL][81], [FAIL][82], [FAIL][83], [FAIL][84]) ([fdo#109271] / [fdo#111870] / [i915#1485]) -> ([FAIL][85], [FAIL][86], [FAIL][87], [FAIL][88], [FAIL][89], [FAIL][90], [FAIL][91], [FAIL][92], [FAIL][93]) ([fdo#111870] / [i915#1485])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-hsw4/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-hsw4/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-hsw5/igt@runner@aborted.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-hsw7/igt@runner@aborted.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-hsw1/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-hsw7/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-hsw4/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-hsw5/igt@runner@aborted.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-hsw4/igt@runner@aborted.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-hsw7/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-hsw1/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-hsw7/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-hsw5/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-hsw8/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-hsw6/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-hsw7/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-hsw8/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][94], [FAIL][95]) ([i915#1389] / [i915#1402] / [i915#92]) -> ([FAIL][96], [FAIL][97]) ([fdo#109383] / [fdo#111012] / [i915#1389] / [i915#1402])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-kbl7/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-kbl2/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-kbl3/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-kbl6/igt@runner@aborted.html
    - shard-apl:          ([FAIL][98], [FAIL][99]) ([fdo#103927] / [i915#529]) -> ([FAIL][100], [FAIL][101]) ([fdo#103927] / [i915#1402])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-apl4/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8166/shard-apl1/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-apl8/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/shard-apl6/igt@runner@aborted.html

  
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109383]: https://bugs.freedesktop.org/show_bug.cgi?id=109383
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111012]: https://bugs.freedesktop.org/show_bug.cgi?id=111012
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#1485]: https://gitlab.freedesktop.org/drm/intel/issues/1485
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#879]: https://gitlab.freedesktop.org/drm/intel/issues/879
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5526 -> IGTPW_4335
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8166: 424db30dffb5504090c2b8ea4a387d6c358bbc50 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4335: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/index.html
  IGT_5526: f49ebeee9f54d6f23c60a842f75f65561d452ab0 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4335/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
