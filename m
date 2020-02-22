Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 22 Feb 2020 02:42:11 -0000
Message-ID: <158233933193.32578.1061095993740087762@emeril.freedesktop.org>
References: <20200220013336.1979-1-gabrielabittencourt00@gmail.com>
In-Reply-To: <20200220013336.1979-1-gabrielabittencourt00@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Ffb=3A_Elimine_repetitive_verification?=
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
To: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_fb: Elimine repetitive verification
URL   : https://patchwork.freedesktop.org/series/73687/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7968_full -> IGTPW_4189_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4189_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4189_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4189_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane@pixel-format-pipe-a-planes:
    - shard-iclb:         [PASS][1] -> [FAIL][2] +7 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb3/igt@kms_plane@pixel-format-pipe-a-planes.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-iclb2/igt@kms_plane@pixel-format-pipe-a-planes.html

  * igt@kms_plane@pixel-format-pipe-b-planes:
    - shard-kbl:          [PASS][3] -> [FAIL][4] +7 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-kbl6/igt@kms_plane@pixel-format-pipe-b-planes.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-kbl4/igt@kms_plane@pixel-format-pipe-b-planes.html

  * igt@kms_plane@pixel-format-pipe-c-planes:
    - shard-glk:          [PASS][5] -> [FAIL][6] +8 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-glk6/igt@kms_plane@pixel-format-pipe-c-planes.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-glk8/igt@kms_plane@pixel-format-pipe-c-planes.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
    - shard-apl:          [PASS][7] -> [FAIL][8] +5 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-apl1/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-apl4/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html

  
Known issues
------------

  Here are the changes found in IGTPW_4189_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-kbl3/igt@gem_eio@in-flight-suspend.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-kbl3/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_async@concurrent-writes-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146]) +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb6/igt@gem_exec_async@concurrent-writes-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-iclb1/igt@gem_exec_async@concurrent-writes-bsd.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#110854])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb1/igt@gem_exec_balancer@smoke.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-iclb3/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_reloc@basic-gtt-read-active:
    - shard-snb:          [PASS][15] -> [DMESG-WARN][16] ([i915#478])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-snb4/igt@gem_exec_reloc@basic-gtt-read-active.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-snb4/igt@gem_exec_reloc@basic-gtt-read-active.html

  * igt@gem_exec_schedule@pi-common-bsd1:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#109276]) +18 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-iclb7/igt@gem_exec_schedule@pi-common-bsd1.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([i915#677])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb7/igt@gem_exec_schedule@pi-userfault-bsd.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-iclb4/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-hsw:          [PASS][21] -> [FAIL][22] ([i915#694])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-hsw7/igt@gem_partial_pwrite_pread@write.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-hsw8/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#644])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#644])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-apl3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#644])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-kbl3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-kbl2/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-apl6/igt@gem_workarounds@suspend-resume-context.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-apl4/igt@gem_workarounds@suspend-resume-context.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#79])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk:          [PASS][33] -> [INCOMPLETE][34] ([i915#58] / [k.org#198133])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-glk5/igt@kms_flip@2x-flip-vs-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-glk7/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-panning-vs-hang-interruptible:
    - shard-tglb:         [PASS][35] -> [TIMEOUT][36] ([fdo#112271] / [i915#561])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-tglb1/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-tglb3/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html
    - shard-glk:          [PASS][37] -> [TIMEOUT][38] ([fdo#112271])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-glk7/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-glk4/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html

  * igt@kms_plane@pixel-format-pipe-c-planes-source-clamping:
    - shard-iclb:         [PASS][39] -> [FAIL][40] ([i915#576])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb5/igt@kms_plane@pixel-format-pipe-c-planes-source-clamping.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-iclb1/igt@kms_plane@pixel-format-pipe-c-planes-source-clamping.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][41] -> [FAIL][42] ([i915#899]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_plane_lowres@pipe-a-tiling-yf:
    - shard-iclb:         [PASS][43] -> [FAIL][44] ([i915#899]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb6/igt@kms_plane_lowres@pipe-a-tiling-yf.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-iclb6/igt@kms_plane_lowres@pipe-a-tiling-yf.html
    - shard-apl:          [PASS][45] -> [FAIL][46] ([i915#899]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-apl7/igt@kms_plane_lowres@pipe-a-tiling-yf.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-apl7/igt@kms_plane_lowres@pipe-a-tiling-yf.html

  * igt@kms_plane_lowres@pipe-c-tiling-yf:
    - shard-kbl:          [PASS][47] -> [FAIL][48] ([i915#899]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-kbl1/igt@kms_plane_lowres@pipe-c-tiling-yf.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-yf.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([fdo#109642] / [fdo#111068])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-iclb6/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#109441]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-apl:          [PASS][53] -> [FAIL][54] ([i915#1041]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-apl2/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-apl2/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
    - shard-glk:          [PASS][55] -> [FAIL][56] ([i915#1041]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-glk1/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-glk8/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-kbl:          [PASS][57] -> [FAIL][58] ([i915#1041]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-kbl6/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-kbl7/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
    - shard-iclb:         [PASS][59] -> [FAIL][60] ([i915#199]) +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb6/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-iclb3/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-iclb:         [PASS][61] -> [FAIL][62] ([i915#65]) +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-iclb3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][63] -> [SKIP][64] ([fdo#112080]) +12 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb2/igt@perf_pmu@busy-vcs1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-iclb3/igt@perf_pmu@busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vecs0-s3:
    - shard-glk:          [INCOMPLETE][65] ([i915#58] / [k.org#198133]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-glk4/igt@gem_ctx_isolation@vecs0-s3.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-glk5/igt@gem_ctx_isolation@vecs0-s3.html

  * igt@gem_exec_reuse@baggage:
    - shard-apl:          [TIMEOUT][67] ([fdo#112271]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-apl2/igt@gem_exec_reuse@baggage.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-apl4/igt@gem_exec_reuse@baggage.html

  * {igt@gem_exec_schedule@implicit-write-read-bsd1}:
    - shard-iclb:         [SKIP][69] ([fdo#109276] / [i915#677]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb8/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-iclb1/igt@gem_exec_schedule@implicit-write-read-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][71] ([i915#677]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][73] ([fdo#112146]) -> [PASS][74] +7 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-iclb7/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-hsw:          [FAIL][75] ([i915#694]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-hsw8/igt@gem_partial_pwrite_pread@reads-uncached.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-hsw6/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][77] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-snb4/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-iclb:         [FAIL][79] ([i915#370]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb7/igt@i915_pm_rps@min-max-config-loaded.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-iclb4/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@kms_flip@flip-vs-dpms-interruptible:
    - shard-apl:          [DMESG-WARN][81] -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-apl7/igt@kms_flip@flip-vs-dpms-interruptible.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-apl2/igt@kms_flip@flip-vs-dpms-interruptible.html
    - shard-kbl:          [DMESG-WARN][83] -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-kbl7/igt@kms_flip@flip-vs-dpms-interruptible.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-kbl2/igt@kms_flip@flip-vs-dpms-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-apl:          [FAIL][85] ([i915#79]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-modeset-vs-hang:
    - shard-tglb:         [TIMEOUT][87] ([fdo#112271] / [i915#561]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-tglb6/igt@kms_flip@flip-vs-modeset-vs-hang.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-tglb2/igt@kms_flip@flip-vs-modeset-vs-hang.html

  * igt@kms_frontbuffer_tracking@fbc-tilingchange:
    - shard-apl:          [FAIL][89] ([i915#49]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-apl2/igt@kms_frontbuffer_tracking@fbc-tilingchange.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-apl3/igt@kms_frontbuffer_tracking@fbc-tilingchange.html
    - shard-kbl:          [FAIL][91] ([i915#49]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-tilingchange.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-tilingchange.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][93] ([i915#180]) -> [PASS][94] +3 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][95] ([i915#899]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][97] ([fdo#109441]) -> [PASS][98] +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb6/igt@kms_psr@psr2_basic.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-glk:          [TIMEOUT][99] ([fdo#112271]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-glk8/igt@kms_rotation_crc@primary-rotation-270.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-glk4/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][101] ([i915#31]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-apl2/igt@kms_setmode@basic.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-apl4/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][103] ([i915#180]) -> [PASS][104] +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][105] ([fdo#112080]) -> [PASS][106] +15 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb3/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-hsw:          [INCOMPLETE][107] ([i915#1176] / [i915#61]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-hsw5/igt@perf_pmu@cpu-hotplug.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-hsw1/igt@perf_pmu@cpu-hotplug.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][109] ([fdo#109276]) -> [PASS][110] +24 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb7/igt@prime_busy@hang-bsd2.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-iclb2/igt@prime_busy@hang-bsd2.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][111] ([i915#831]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-hsw6/igt@prime_mmap_coherency@ioctl-errors.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-hsw7/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][113] ([IGT#28]) -> [SKIP][114] ([fdo#112080]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][115] ([i915#454]) -> [SKIP][116] ([i915#468])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1041]: https://gitlab.freedesktop.org/drm/intel/issues/1041
  [i915#1120]: https://gitlab.freedesktop.org/drm/intel/issues/1120
  [i915#1176]: https://gitlab.freedesktop.org/drm/intel/issues/1176
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#199]: https://gitlab.freedesktop.org/drm/intel/issues/199
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#370]: https://gitlab.freedesktop.org/drm/intel/issues/370
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#561]: https://gitlab.freedesktop.org/drm/intel/issues/561
  [i915#576]: https://gitlab.freedesktop.org/drm/intel/issues/576
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5452 -> IGTPW_4189
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7968: fbfd614e946dc8ba097ea684179eee70fb6e53ed @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4189: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/index.html
  IGT_5452: c05dc6cd816feb1cc518ce777ab3fd6c81893113 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4189/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
