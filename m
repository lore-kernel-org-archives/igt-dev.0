Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 20 Mar 2020 04:04:23 -0000
Message-ID: <158467706330.11039.14482213262936788812@emeril.freedesktop.org>
References: <20200320001319.6982-1-swathi.dhanavanthri@intel.com>
In-Reply-To: <20200320001319.6982-1-swathi.dhanavanthri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliOiBz?=
 =?utf-8?q?ync_i915=5Fpciids=2Eh_with_kernel_=28rev4=29?=
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
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib: sync i915_pciids.h with kernel (rev4)
URL   : https://patchwork.freedesktop.org/series/50957/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8161_full -> IGTPW_4333_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4333_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4333_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4333_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-tglb5/igt@kms_hdr@static-toggle-dpms.html

  
#### Warnings ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [INCOMPLETE][2] ([i915#1402]) -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-tglb1/igt@gem_ctx_persistence@close-replace-race.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-tglb3/igt@gem_ctx_persistence@close-replace-race.html

  
Known issues
------------

  Here are the changes found in IGTPW_4333_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox:
    - shard-tglb:         [PASS][4] -> [FAIL][5] ([i915#679])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-tglb2/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-tglb5/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#110841])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([fdo#109276] / [i915#677])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-iclb5/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([i915#677]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#112146]) +7 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][14] -> [FAIL][15] ([i915#644])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-apl3/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_ringfill@basic-default-hang:
    - shard-hsw:          [PASS][16] -> [INCOMPLETE][17] ([i915#61]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-hsw1/igt@gem_ringfill@basic-default-hang.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-hsw1/igt@gem_ringfill@basic-default-hang.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-hsw:          [PASS][18] -> [DMESG-WARN][19] ([fdo#111870])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-hsw1/igt@gem_userptr_blits@sync-unmap-after-close.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-hsw4/igt@gem_userptr_blits@sync-unmap-after-close.html
    - shard-snb:          [PASS][20] -> [DMESG-WARN][21] ([fdo#111870] / [i915#478])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][22] -> [FAIL][23] ([i915#447])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb2/igt@i915_pm_dc@dc5-dpms.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-hsw:          [PASS][24] -> [SKIP][25] ([fdo#109271])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-hsw6/igt@i915_pm_rpm@system-suspend.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-hsw7/igt@i915_pm_rpm@system-suspend.html
    - shard-tglb:         [PASS][26] -> [SKIP][27] ([i915#1316])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-tglb3/igt@i915_pm_rpm@system-suspend.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-tglb2/igt@i915_pm_rpm@system-suspend.html
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([i915#1316])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb7/igt@i915_pm_rpm@system-suspend.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-iclb3/igt@i915_pm_rpm@system-suspend.html
    - shard-glk:          [PASS][30] -> [SKIP][31] ([fdo#109271])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-glk2/igt@i915_pm_rpm@system-suspend.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-glk1/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_selftest@live@execlists:
    - shard-apl:          [PASS][32] -> [INCOMPLETE][33] ([fdo#103927] / [i915#656])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-apl3/igt@i915_selftest@live@execlists.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-apl6/igt@i915_selftest@live@execlists.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][34] -> [DMESG-WARN][35] ([i915#180]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-glk:          [PASS][36] -> [FAIL][37] ([i915#34])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-glk6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-glk7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][38] -> [DMESG-WARN][39] ([i915#180]) +5 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [PASS][40] -> [SKIP][41] ([fdo#109441]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb2/igt@kms_psr@psr2_primary_render.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-iclb4/igt@kms_psr@psr2_primary_render.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][42] -> [FAIL][43] ([i915#31])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-apl4/igt@kms_setmode@basic.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-apl2/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][44] -> [SKIP][45] ([fdo#112080]) +10 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb4/igt@perf_pmu@busy-vcs1.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-iclb5/igt@perf_pmu@busy-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][46] -> [SKIP][47] ([fdo#109276]) +21 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-iclb5/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][48] ([fdo#112080]) -> [PASS][49] +17 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb6/igt@gem_busy@busy-vcs1.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-iclb4/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-iclb:         [INCOMPLETE][50] ([i915#1402]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb8/igt@gem_ctx_persistence@close-replace-race.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-iclb3/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [SKIP][52] ([i915#677]) -> [PASS][53] +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-iclb7/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [SKIP][54] ([fdo#109276]) -> [PASS][55] +11 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb6/igt@gem_exec_schedule@promotion-bsd1.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-iclb2/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][56] ([fdo#112146]) -> [PASS][57] +4 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb1/igt@gem_exec_schedule@reorder-wide-bsd.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-iclb5/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-tglb:         [INCOMPLETE][58] ([i915#1401]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-tglb8/igt@gem_exec_whisper@basic-fds-all.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-tglb6/igt@gem_exec_whisper@basic-fds-all.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-tglb:         [INCOMPLETE][60] ([i915#1318] / [i915#1401]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-tglb7/igt@gem_exec_whisper@basic-fds-forked.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-tglb6/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-tglb:         [FAIL][62] ([i915#644]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-tglb2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-tglb1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-iclb:         [SKIP][64] ([i915#1316]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb8/igt@i915_pm_rpm@gem-execbuf.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-iclb5/igt@i915_pm_rpm@gem-execbuf.html
    - shard-glk:          [SKIP][66] ([fdo#109271]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-glk6/igt@i915_pm_rpm@gem-execbuf.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-glk2/igt@i915_pm_rpm@gem-execbuf.html
    - shard-tglb:         [SKIP][68] ([i915#1316]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-tglb2/igt@i915_pm_rpm@gem-execbuf.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-tglb8/igt@i915_pm_rpm@gem-execbuf.html

  * igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack:
    - shard-glk:          [FAIL][70] ([i915#49]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][72] ([i915#180]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][74] ([i915#173]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb1/igt@kms_psr@no_drrs.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-iclb8/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][76] ([fdo#109441]) -> [PASS][77] +2 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-iclb6/igt@kms_psr@psr2_cursor_render.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][78] ([i915#180]) -> [PASS][79] +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [INCOMPLETE][80] -> [INCOMPLETE][81] ([i915#1402])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-kbl7/igt@gem_ctx_persistence@close-replace-race.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-kbl1/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][82] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][83] ([fdo#110789] / [fdo#111870] / [i915#478])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-snb2/igt@gem_userptr_blits@sync-unmap.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-snb2/igt@gem_userptr_blits@sync-unmap.html
    - shard-hsw:          [DMESG-WARN][84] ([fdo#111870]) -> [DMESG-WARN][85] ([fdo#110789] / [fdo#111870])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-hsw5/igt@gem_userptr_blits@sync-unmap.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-hsw1/igt@gem_userptr_blits@sync-unmap.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][86], [FAIL][87]) ([i915#1389] / [i915#1402] / [i915#1485] / [i915#92]) -> ([FAIL][88], [FAIL][89]) ([i915#1389] / [i915#1402] / [i915#92])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-kbl2/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-kbl7/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-kbl1/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-kbl1/igt@runner@aborted.html
    - shard-apl:          ([FAIL][90], [FAIL][91]) ([fdo#103927] / [i915#1402]) -> ([FAIL][92], [FAIL][93], [FAIL][94]) ([fdo#103927] / [i915#1402] / [i915#529])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-apl8/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-apl2/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-apl6/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-apl6/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-apl8/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][95], [FAIL][96], [FAIL][97]) ([i915#1318] / [i915#1389] / [i915#1401]) -> [FAIL][98] ([i915#1389] / [i915#1485])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-tglb8/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-tglb7/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8161/shard-tglb1/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/shard-tglb3/igt@runner@aborted.html

  
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1318]: https://gitlab.freedesktop.org/drm/intel/issues/1318
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1401]: https://gitlab.freedesktop.org/drm/intel/issues/1401
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#1485]: https://gitlab.freedesktop.org/drm/intel/issues/1485
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5523 -> IGTPW_4333
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8161: b2b8d8634bf653904ef3268ca7ccedf51f6405af @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4333: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/index.html
  IGT_5523: cf6d524007ac51a7d5a48503ea3dd5f01fd4ebab @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4333/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
