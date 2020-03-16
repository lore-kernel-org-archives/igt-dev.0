Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 16 Mar 2020 13:43:46 -0000
Message-ID: <158436622676.18993.5693653489421460195@emeril.freedesktop.org>
References: <20200313152911.580802-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200313152911.580802-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/intel-ci/blacklist=3A_Bl?=
 =?utf-8?q?acklist_kms=5Fchamelium=40hdmi-*-planes-random?=
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/intel-ci/blacklist: Blacklist kms_chamelium@hdmi-*-planes-random
URL   : https://patchwork.freedesktop.org/series/74684/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8134_full -> IGTPW_4302_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4302_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4302_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4302_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@mock:
    - shard-glk:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-glk4/igt@i915_selftest@mock.html
    - shard-iclb:         NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-iclb1/igt@i915_selftest@mock.html
    - shard-kbl:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-kbl2/igt@i915_selftest@mock.html
    - shard-tglb:         NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-tglb7/igt@i915_selftest@mock.html
    - shard-apl:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-apl8/igt@i915_selftest@mock.html

  
Known issues
------------

  Here are the changes found in IGTPW_4302_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [PASS][6] -> [INCOMPLETE][7] ([i915#1402])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-kbl6/igt@gem_ctx_persistence@close-replace-race.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-kbl3/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([fdo#110854])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-iclb2/igt@gem_exec_balancer@smoke.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-iclb5/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([i915#677]) +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-iclb3/igt@gem_exec_schedule@pi-common-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-queue-chain-bsd:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#112146]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-iclb8/igt@gem_exec_schedule@preempt-queue-chain-bsd.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-iclb1/igt@gem_exec_schedule@preempt-queue-chain-bsd.html

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-tglb:         [PASS][14] -> [INCOMPLETE][15] ([i915#1401])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-tglb6/igt@gem_exec_whisper@basic-fds-all.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-tglb7/igt@gem_exec_whisper@basic-fds-all.html

  * igt@gem_mmap_gtt@basic-write-read-distinct:
    - shard-snb:          [PASS][16] -> [DMESG-WARN][17] ([i915#478])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-snb6/igt@gem_mmap_gtt@basic-write-read-distinct.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-snb5/igt@gem_mmap_gtt@basic-write-read-distinct.html
    - shard-hsw:          [PASS][18] -> [DMESG-WARN][19] ([i915#478])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-hsw7/igt@gem_mmap_gtt@basic-write-read-distinct.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-hsw5/igt@gem_mmap_gtt@basic-write-read-distinct.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][20] -> [FAIL][21] ([i915#644])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][22] -> [FAIL][23] ([i915#454])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-kbl:          [PASS][24] -> [INCOMPLETE][25] ([i915#151])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-kbl3/igt@i915_pm_rpm@system-suspend-execbuf.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-kbl2/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][26] -> [DMESG-WARN][27] ([i915#180]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_color@pipe-b-ctm-blue-to-red:
    - shard-apl:          [PASS][28] -> [FAIL][29] ([i915#129])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-apl3/igt@kms_color@pipe-b-ctm-blue-to-red.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-apl6/igt@kms_color@pipe-b-ctm-blue-to-red.html
    - shard-kbl:          [PASS][30] -> [FAIL][31] ([i915#129])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-kbl1/igt@kms_color@pipe-b-ctm-blue-to-red.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-kbl3/igt@kms_color@pipe-b-ctm-blue-to-red.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [PASS][32] -> [SKIP][33] ([fdo#109349])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-iclb3/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [PASS][34] -> [DMESG-WARN][35] ([i915#180]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][36] -> [FAIL][37] ([i915#173])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-iclb2/igt@kms_psr@no_drrs.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][38] -> [SKIP][39] ([fdo#109441]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][40] -> [FAIL][41] ([i915#31])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-apl1/igt@kms_setmode@basic.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-apl4/igt@kms_setmode@basic.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][42] -> [FAIL][43] ([i915#1085])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-tglb5/igt@perf@gen12-mi-rpc.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-tglb8/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][44] -> [SKIP][45] ([fdo#112080]) +8 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-iclb7/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][46] -> [SKIP][47] ([fdo#109276]) +19 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_shared@q-promotion-bsd2:
    - shard-iclb:         [SKIP][48] ([fdo#109276]) -> [PASS][49] +7 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-iclb8/igt@gem_ctx_shared@q-promotion-bsd2.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-iclb4/igt@gem_ctx_shared@q-promotion-bsd2.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [SKIP][50] ([fdo#109276] / [i915#677]) -> [PASS][51] +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-iclb3/igt@gem_exec_schedule@implicit-both-bsd1.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-iclb2/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [SKIP][52] ([i915#677]) -> [PASS][53] +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-iclb1/igt@gem_exec_schedule@pi-userfault-bsd.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-iclb6/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][54] ([fdo#112146]) -> [PASS][55] +3 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-iclb4/igt@gem_exec_schedule@reorder-wide-bsd.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-iclb7/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [FAIL][56] ([i915#644]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-kbl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-kbl7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-hsw:          [DMESG-WARN][58] ([fdo#111870]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-hsw6/igt@gem_userptr_blits@sync-unmap-after-close.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-hsw5/igt@gem_userptr_blits@sync-unmap-after-close.html
    - shard-snb:          [DMESG-WARN][60] ([fdo#111870] / [i915#478]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-snb4/igt@gem_userptr_blits@sync-unmap-after-close.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_selftest@live@execlists:
    - shard-apl:          [INCOMPLETE][62] ([fdo#103927] / [i915#656]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-apl7/igt@i915_selftest@live@execlists.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-apl4/igt@i915_selftest@live@execlists.html

  * igt@kms_color@pipe-b-degamma:
    - shard-kbl:          [FAIL][64] ([i915#71]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-kbl2/igt@kms_color@pipe-b-degamma.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-kbl6/igt@kms_color@pipe-b-degamma.html
    - shard-apl:          [FAIL][66] ([i915#71]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-apl3/igt@kms_color@pipe-b-degamma.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-apl7/igt@kms_color@pipe-b-degamma.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][68] ([i915#180]) -> [PASS][69] +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][70] ([i915#72]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [FAIL][72] ([i915#46]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          [INCOMPLETE][74] ([i915#155]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [DMESG-WARN][76] ([i915#180]) -> [PASS][77] +2 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][78] ([fdo#109441]) -> [PASS][79] +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-iclb1/igt@kms_psr@psr2_primary_page_flip.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [SKIP][80] ([fdo#112080]) -> [PASS][81] +13 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-iclb3/igt@perf_pmu@busy-check-all-vcs1.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-iclb2/igt@perf_pmu@busy-check-all-vcs1.html

  
#### Warnings ####

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][82] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][83] ([fdo#111870] / [i915#478])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-snb2/igt@gem_userptr_blits@dmabuf-sync.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-snb2/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-hsw:          [DMESG-WARN][84] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][85] ([fdo#111870])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-hsw2/igt@gem_userptr_blits@dmabuf-sync.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-hsw4/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][86] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][87] ([fdo#110789] / [fdo#111870] / [i915#478])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-snb2/igt@gem_userptr_blits@sync-unmap.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-snb6/igt@gem_userptr_blits@sync-unmap.html
    - shard-hsw:          [DMESG-WARN][88] ([fdo#111870]) -> [DMESG-WARN][89] ([fdo#110789] / [fdo#111870])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-hsw1/igt@gem_userptr_blits@sync-unmap.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-hsw1/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][90] ([i915#454]) -> [SKIP][91] ([i915#468]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-tglb6/igt@i915_pm_dc@dc6-psr.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-snb:          [SKIP][92] ([fdo#109271]) -> [INCOMPLETE][93] ([i915#82])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-snb4/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-snb5/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglb:         [SKIP][94] ([i915#1316]) -> [SKIP][95] ([fdo#109506])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-tglb2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-tglb2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-iclb:         [SKIP][96] ([i915#1316]) -> [SKIP][97] ([fdo#109293] / [fdo#109506])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-iclb5/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-iclb2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][98], [FAIL][99], [FAIL][100], [FAIL][101], [FAIL][102], [FAIL][103], [FAIL][104]) ([fdo#111870]) -> ([FAIL][105], [FAIL][106], [FAIL][107], [FAIL][108], [FAIL][109], [FAIL][110], [FAIL][111], [FAIL][112]) ([fdo#111870] / [i915#1454] / [i915#478])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-hsw2/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-hsw6/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-hsw7/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-hsw1/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-hsw2/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-hsw6/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-hsw6/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-hsw4/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-hsw1/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-hsw4/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-hsw6/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-hsw7/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-hsw7/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-hsw5/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-hsw6/igt@runner@aborted.html
    - shard-kbl:          [FAIL][113] ([i915#92]) -> ([FAIL][114], [FAIL][115], [FAIL][116]) ([i915#1389] / [i915#1402] / [i915#1455] / [i915#92])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-kbl3/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-kbl2/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-kbl2/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-kbl3/igt@runner@aborted.html
    - shard-apl:          ([FAIL][117], [FAIL][118], [FAIL][119]) ([fdo#103927] / [i915#1402] / [i915#529]) -> ([FAIL][120], [FAIL][121], [FAIL][122]) ([fdo#103927] / [i915#1402] / [i915#1455])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-apl6/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-apl2/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-apl7/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-apl1/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-apl6/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-apl8/igt@runner@aborted.html
    - shard-glk:          [FAIL][123] ([i915#1402] / [k.org#202321]) -> ([FAIL][124], [FAIL][125]) ([i915#1402] / [i915#1455] / [k.org#202321])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-glk4/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-glk4/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-glk2/igt@runner@aborted.html
    - shard-tglb:         [FAIL][126] ([i915#1389]) -> ([FAIL][127], [FAIL][128], [FAIL][129]) ([i915#1389] / [i915#1401] / [i915#1455])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8134/shard-tglb5/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-tglb7/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-tglb7/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/shard-tglb3/igt@runner@aborted.html

  
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1401]: https://gitlab.freedesktop.org/drm/intel/issues/1401
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#1454]: https://gitlab.freedesktop.org/drm/intel/issues/1454
  [i915#1455]: https://gitlab.freedesktop.org/drm/intel/issues/1455
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#46]: https://gitlab.freedesktop.org/drm/intel/issues/46
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5508 -> IGTPW_4302
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8134: 548cc21e9ca596cc12dfdb36575b0fedf28a3eb4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4302: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/index.html
  IGT_5508: 89d644600a1a9f08794cc7106b63758df40ce1d8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4302/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
