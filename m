Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 19 Mar 2020 20:35:08 -0000
Message-ID: <158465010869.17935.13035449570640847314@emeril.freedesktop.org>
References: <20200318004914.236815-1-lyude@redhat.com>
In-Reply-To: <20200318004914.236815-1-lyude@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Fpipe=5Fcrc=5Fbasic?=
 =?utf-8?b?OiBVc2UgaWd0X2Rpc3BsYXlfcmVxdWlyZV9vdXRwdXRfb25fcGlwZSgpIChy?=
 =?utf-8?q?ev2=29?=
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
To: Lyude Paul <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_pipe_crc_basic: Use igt_display_require_output_on_pipe() (rev2)
URL   : https://patchwork.freedesktop.org/series/74808/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8160_full -> IGTPW_4327_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4327_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4327_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4327_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-tglb8/igt@kms_hdr@static-toggle-dpms.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8160_full and IGTPW_4327_full:

### New IGT tests (4) ###

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a:
    - Statuses : 5 pass(s)
    - Exec time: [0.46, 1.45] s

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b:
    - Statuses : 7 pass(s)
    - Exec time: [0.39, 3.02] s

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.05] s

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 2.47] s

  

Known issues
------------

  Here are the changes found in IGTPW_4327_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][2] -> [DMESG-WARN][3] ([i915#180]) +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [PASS][4] -> [INCOMPLETE][5] ([i915#1402])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-tglb5/igt@gem_ctx_persistence@close-replace-race.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-tglb1/igt@gem_ctx_persistence@close-replace-race.html
    - shard-kbl:          [PASS][6] -> [INCOMPLETE][7] ([i915#1402])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-kbl7/igt@gem_ctx_persistence@close-replace-race.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-kbl6/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([fdo#112080]) +12 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-iclb7/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([i915#677])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb6/igt@gem_exec_schedule@implicit-both-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@implicit-read-write-bsd2:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#109276] / [i915#677])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd2.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-iclb7/igt@gem_exec_schedule@implicit-read-write-bsd2.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([fdo#109276]) +8 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb1/igt@gem_exec_schedule@out-order-bsd2.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-iclb3/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#112146]) +5 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-iclb:         [PASS][18] -> [FAIL][19] ([i915#644])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-iclb7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [PASS][20] -> [DMESG-WARN][21] ([fdo#111870] / [i915#478])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-snb2/igt@gem_userptr_blits@sync-unmap-after-close.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-snb4/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][22] -> [FAIL][23] ([i915#413]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb6/igt@i915_pm_rps@reset.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-iclb8/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live@execlists:
    - shard-apl:          [PASS][24] -> [INCOMPLETE][25] ([fdo#103927] / [i915#656])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-apl3/igt@i915_selftest@live@execlists.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-apl2/igt@i915_selftest@live@execlists.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][26] -> [DMESG-WARN][27] ([i915#180]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen:
    - shard-glk:          [PASS][28] -> [FAIL][29] ([i915#54])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding:
    - shard-apl:          [PASS][30] -> [FAIL][31] ([i915#54]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html
    - shard-kbl:          [PASS][32] -> [FAIL][33] ([i915#54]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][34] -> [FAIL][35] ([i915#57])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled:
    - shard-hsw:          [PASS][36] -> [DMESG-WARN][37] ([i915#478])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-hsw2/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-hsw4/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [PASS][38] -> [FAIL][39] ([i915#46])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-glk2/igt@kms_flip@flip-vs-expired-vblank.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-glk5/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][40] -> [FAIL][41] ([i915#79])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible:
    - shard-apl:          [PASS][42] -> [INCOMPLETE][43] ([fdo#103927] / [i915#1297])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-apl3/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-apl7/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
    - shard-kbl:          [PASS][44] -> [INCOMPLETE][45] ([i915#1297])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-kbl7/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-kbl1/igt@kms_flip@modeset-vs-vblank-race-interruptible.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][46] -> [SKIP][47] ([fdo#109441]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-iclb3/igt@kms_psr@psr2_primary_page_flip.html

  * igt@perf@short-reads:
    - shard-glk:          [PASS][48] -> [FAIL][49] ([i915#51])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-glk5/igt@perf@short-reads.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-glk1/igt@perf@short-reads.html

  * igt@perf@whitelisted-registers-userspace-config:
    - shard-tglb:         [PASS][50] -> [SKIP][51] ([i915#405])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-tglb3/igt@perf@whitelisted-registers-userspace-config.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-tglb8/igt@perf@whitelisted-registers-userspace-config.html
    - shard-hsw:          [PASS][52] -> [SKIP][53] ([fdo#109271])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-hsw6/igt@perf@whitelisted-registers-userspace-config.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-hsw4/igt@perf@whitelisted-registers-userspace-config.html
    - shard-glk:          [PASS][54] -> [SKIP][55] ([fdo#109271])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-glk4/igt@perf@whitelisted-registers-userspace-config.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-glk6/igt@perf@whitelisted-registers-userspace-config.html
    - shard-iclb:         [PASS][56] -> [SKIP][57] ([i915#405])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb5/igt@perf@whitelisted-registers-userspace-config.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-iclb5/igt@perf@whitelisted-registers-userspace-config.html

  * igt@prime_busy@wait-hang-render:
    - shard-hsw:          [PASS][58] -> [INCOMPLETE][59] ([i915#61]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-hsw1/igt@prime_busy@wait-hang-render.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-hsw7/igt@prime_busy@wait-hang-render.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][60] ([fdo#112080]) -> [PASS][61] +14 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb6/igt@gem_busy@busy-vcs1.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-iclb2/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@engines-mixed-process@bcs0:
    - shard-iclb:         [FAIL][62] ([i915#679]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb4/igt@gem_ctx_persistence@engines-mixed-process@bcs0.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-iclb2/igt@gem_ctx_persistence@engines-mixed-process@bcs0.html

  * igt@gem_ctx_persistence@engines-mixed-process@vcs0:
    - shard-iclb:         [INCOMPLETE][64] ([i915#1239]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb4/igt@gem_ctx_persistence@engines-mixed-process@vcs0.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-iclb2/igt@gem_ctx_persistence@engines-mixed-process@vcs0.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@blt:
    - shard-tglb:         [FAIL][66] ([i915#679]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-tglb2/igt@gem_ctx_persistence@legacy-engines-mixed-process@blt.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-tglb8/igt@gem_ctx_persistence@legacy-engines-mixed-process@blt.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox:
    - shard-tglb:         [INCOMPLETE][68] ([i915#1239]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-tglb2/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-tglb8/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html

  * igt@gem_exec_schedule@implicit-write-read-bsd1:
    - shard-iclb:         [SKIP][70] ([fdo#109276] / [i915#677]) -> [PASS][71] +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb3/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-iclb4/igt@gem_exec_schedule@implicit-write-read-bsd1.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][72] ([i915#677]) -> [PASS][73] +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-iclb7/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][74] ([fdo#112146]) -> [PASS][75] +3 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-iclb7/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][76] ([i915#180]) -> [PASS][77] +5 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-kbl4/igt@gem_exec_suspend@basic-s3.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-kbl4/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-tglb:         [INCOMPLETE][78] ([i915#1318] / [i915#1401]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-tglb1/igt@gem_exec_whisper@basic-fds-forked.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-tglb5/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-iclb:         [SKIP][80] ([i915#1316]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb1/igt@i915_pm_rpm@gem-execbuf.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-iclb4/igt@i915_pm_rpm@gem-execbuf.html
    - shard-glk:          [SKIP][82] ([fdo#109271]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-glk3/igt@i915_pm_rpm@gem-execbuf.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-glk4/igt@i915_pm_rpm@gem-execbuf.html
    - shard-tglb:         [SKIP][84] ([i915#1316]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-tglb2/igt@i915_pm_rpm@gem-execbuf.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-tglb3/igt@i915_pm_rpm@gem-execbuf.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-glk:          [FAIL][86] ([i915#34]) -> [PASS][87] +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-glk4/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-glk9/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack:
    - shard-glk:          [FAIL][88] ([i915#49]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [DMESG-WARN][90] ([i915#180]) -> [PASS][91] +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [SKIP][92] ([fdo#109441]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb8/igt@kms_psr@psr2_primary_blt.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-iclb2/igt@kms_psr@psr2_primary_blt.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [FAIL][94] ([i915#1085]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-tglb3/igt@perf@gen12-mi-rpc.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-tglb5/igt@perf@gen12-mi-rpc.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][96] ([fdo#109276]) -> [PASS][97] +15 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb6/igt@prime_busy@hang-bsd2.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-iclb1/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
    - shard-iclb:         [SKIP][98] ([fdo#109278] / [fdo#112010]) -> [SKIP][99] ([fdo#109278]) +4 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb4/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-iclb4/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][100], [FAIL][101], [FAIL][102], [FAIL][103], [FAIL][104], [FAIL][105]) ([fdo#111870] / [i915#1485]) -> ([FAIL][106], [FAIL][107], [FAIL][108], [FAIL][109], [FAIL][110], [FAIL][111], [FAIL][112], [FAIL][113]) ([fdo#111870] / [i915#1485] / [i915#478])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-hsw1/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-hsw2/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-hsw1/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-hsw1/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-hsw2/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-hsw5/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-hsw2/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-hsw2/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-hsw5/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-hsw1/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-hsw4/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-hsw4/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-hsw5/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-hsw6/igt@runner@aborted.html
    - shard-kbl:          [FAIL][114] ([i915#92]) -> ([FAIL][115], [FAIL][116]) ([i915#1389] / [i915#1402] / [i915#92])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-kbl6/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-kbl6/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-kbl2/igt@runner@aborted.html
    - shard-apl:          ([FAIL][117], [FAIL][118]) ([fdo#103927] / [i915#1402]) -> ([FAIL][119], [FAIL][120], [FAIL][121]) ([fdo#103927] / [i915#1402] / [i915#529])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-apl4/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-apl1/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-apl2/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-apl8/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-apl1/igt@runner@aborted.html
    - shard-tglb:         [FAIL][122] ([i915#1318]) -> [FAIL][123] ([i915#1389])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-tglb1/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/shard-tglb1/igt@runner@aborted.html

  
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112010]: https://bugs.freedesktop.org/show_bug.cgi?id=112010
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1239]: https://gitlab.freedesktop.org/drm/intel/issues/1239
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1318]: https://gitlab.freedesktop.org/drm/intel/issues/1318
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1401]: https://gitlab.freedesktop.org/drm/intel/issues/1401
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#1485]: https://gitlab.freedesktop.org/drm/intel/issues/1485
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#46]: https://gitlab.freedesktop.org/drm/intel/issues/46
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#51]: https://gitlab.freedesktop.org/drm/intel/issues/51
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5523 -> IGTPW_4327
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8160: 6ba1729e5025761ab74914f6b8aa3288f493e9c7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4327: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/index.html
  IGT_5523: cf6d524007ac51a7d5a48503ea3dd5f01fd4ebab @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
