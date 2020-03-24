Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 24 Mar 2020 10:11:53 -0000
Message-ID: <158504471349.5748.18246058833320078594@emeril.freedesktop.org>
References: <20200324083848.1023708-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200324083848.1023708-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgY2hhbWVs?=
 =?utf-8?q?ium=3A_Retry_XMLRPC_call_when_chamelond_fails_talking_with_a_re?=
 =?utf-8?q?ceiver?=
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

Series: chamelium: Retry XMLRPC call when chamelond fails talking with a receiver
URL   : https://patchwork.freedesktop.org/series/74999/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5532_full -> IGTPW_4344_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4344_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4344_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4344_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-snb:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-snb1/igt@i915_pm_rc6_residency@rc6-idle.html

  
Known issues
------------

  Here are the changes found in IGTPW_4344_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [PASS][2] -> [SKIP][3] ([fdo#112080]) +10 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-iclb2/igt@gem_busy@extended-parallel-vcs1.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-iclb5/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([fdo#110841])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#110854])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-iclb2/igt@gem_exec_balancer@smoke.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-iclb7/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([fdo#109276] / [i915#677])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-iclb2/igt@gem_exec_schedule@implicit-both-bsd1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-iclb5/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#112146]) +9 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - shard-tglb:         [PASS][12] -> [SKIP][13] ([i915#1316])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-tglb5/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-tglb2/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([i915#1316])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-iclb3/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-iclb1/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_selftest@live@execlists:
    - shard-apl:          [PASS][16] -> [INCOMPLETE][17] ([fdo#103927] / [i915#656])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-apl3/igt@i915_selftest@live@execlists.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-apl6/igt@i915_selftest@live@execlists.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-kbl:          [PASS][18] -> [FAIL][19] ([i915#1119])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-kbl6/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-kbl2/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][20] -> [INCOMPLETE][21] ([i915#155])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][22] -> [FAIL][23] ([i915#96]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-hsw5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#79])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@dpms-off-confusion:
    - shard-kbl:          [PASS][26] -> [DMESG-WARN][27] ([i915#1297])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-kbl6/igt@kms_flip@dpms-off-confusion.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-kbl1/igt@kms_flip@dpms-off-confusion.html
    - shard-apl:          [PASS][28] -> [DMESG-WARN][29] ([i915#1297])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-apl4/igt@kms_flip@dpms-off-confusion.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-apl4/igt@kms_flip@dpms-off-confusion.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-glk:          [PASS][30] -> [FAIL][31] ([i915#49])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][32] -> [DMESG-WARN][33] ([i915#180]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][34] -> [DMESG-WARN][35] ([i915#180]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][36] -> [SKIP][37] ([fdo#109441]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-iclb4/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][38] -> [FAIL][39] ([i915#31])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-apl3/igt@kms_setmode@basic.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-apl8/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-query-busy:
    - shard-hsw:          [PASS][40] -> [INCOMPLETE][41] ([i915#61])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-hsw7/igt@kms_vblank@pipe-a-query-busy.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-hsw1/igt@kms_vblank@pipe-a-query-busy.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][42] -> [SKIP][43] ([fdo#109276]) +16 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-iclb2/igt@prime_busy@hang-bsd2.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-iclb6/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][44] ([fdo#112080]) -> [PASS][45] +16 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-iclb5/igt@gem_busy@busy-vcs1.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-iclb4/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@engines-mixed-process@vcs0:
    - shard-apl:          [FAIL][46] -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-apl7/igt@gem_ctx_persistence@engines-mixed-process@vcs0.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-apl8/igt@gem_ctx_persistence@engines-mixed-process@vcs0.html

  * igt@gem_ctx_persistence@engines-mixed-process@vecs0:
    - shard-apl:          [INCOMPLETE][48] ([fdo#103927] / [i915#1197] / [i915#1239]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-apl7/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-apl8/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html

  * igt@gem_exec_schedule@implicit-read-write-bsd2:
    - shard-iclb:         [SKIP][50] ([fdo#109276] / [i915#677]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-iclb7/igt@gem_exec_schedule@implicit-read-write-bsd2.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][52] ([i915#677]) -> [PASS][53] +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][54] ([fdo#112146]) -> [PASS][55] +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-iclb6/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [FAIL][56] -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-hsw6/igt@i915_pm_rc6_residency@rc6-idle.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-hsw7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-tglb:         [SKIP][58] ([i915#1316]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-tglb8/igt@i915_pm_rpm@modeset-lpsp.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-tglb5/igt@i915_pm_rpm@modeset-lpsp.html
    - shard-iclb:         [SKIP][60] ([i915#1316]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-iclb6/igt@i915_pm_rpm@modeset-lpsp.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-iclb7/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [FAIL][62] ([i915#54]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
    - shard-apl:          [FAIL][64] ([i915#54]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][66] ([i915#72]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][68] ([i915#180]) -> [PASS][69] +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [DMESG-WARN][70] ([i915#180]) -> [PASS][71] +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][72] ([fdo#109441]) -> [PASS][73] +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm:
    - shard-tglb:         [SKIP][74] ([fdo#112015]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-tglb8/igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-tglb7/igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [FAIL][76] ([i915#1085]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-tglb2/igt@perf@gen12-mi-rpc.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-tglb3/igt@perf@gen12-mi-rpc.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][78] ([fdo#109276]) -> [PASS][79] +20 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-hsw:          [DMESG-WARN][80] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][81] ([fdo#111870])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-hsw5/igt@gem_userptr_blits@dmabuf-sync.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-hsw8/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-hsw:          [DMESG-WARN][82] ([fdo#111870]) -> [DMESG-WARN][83] ([fdo#110789] / [fdo#111870])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-hsw6/igt@gem_userptr_blits@sync-unmap.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-hsw1/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][84] ([i915#468]) -> [FAIL][85] ([i915#454])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-tglb8/igt@i915_pm_dc@dc6-dpms.html

  * igt@runner@aborted:
    - shard-apl:          [FAIL][86] ([fdo#103927]) -> ([FAIL][87], [FAIL][88]) ([fdo#103927] / [i915#529])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/shard-apl6/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-apl7/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/shard-apl6/igt@runner@aborted.html

  
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1197]: https://gitlab.freedesktop.org/drm/intel/issues/1197
  [i915#1239]: https://gitlab.freedesktop.org/drm/intel/issues/1239
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5532 -> IGTPW_4344

  CI-20190529: 20190529
  CI_DRM_8182: e5245084567cd7f6f93b07baaebf8a2b4d914620 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4344: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/index.html
  IGT_5532: 6098e286e0999eb2ad9dcd1aa714468f1412a2ef @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
