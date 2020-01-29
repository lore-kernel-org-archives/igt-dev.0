Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 29 Jan 2020 20:37:16 -0000
Message-ID: <158033023649.5462.13197070944320705336@emeril.freedesktop.org>
References: <20200128112549.172135-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20200128112549.172135-1-daniel.vetter@ffwll.ch>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=5D_tests/kms=5Ffbcon=5Ffbt=3A_Che?=
 =?utf-8?q?ck_for_psr_before_keeling_over?=
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/3] tests/kms_fbcon_fbt: Check for psr before keeling over
URL   : https://patchwork.freedesktop.org/series/72654/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7831_full -> IGTPW_4015_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/index.html

Known issues
------------

  Here are the changes found in IGTPW_4015_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-kbl7/igt@gem_ctx_isolation@rcs0-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_exec_capture@capture-bsd2:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276]) +8 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-iclb4/igt@gem_exec_capture@capture-bsd2.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-iclb7/igt@gem_exec_capture@capture-bsd2.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#677])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-iclb8/igt@gem_exec_schedule@pi-userfault-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-iclb4/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +5 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_store@cachelines-vcs1:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112080]) +6 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-iclb1/igt@gem_exec_store@cachelines-vcs1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-iclb5/igt@gem_exec_store@cachelines-vcs1.html

  * igt@gem_exec_whisper@normal:
    - shard-glk:          [PASS][11] -> [DMESG-WARN][12] ([i915#118] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-glk2/igt@gem_exec_whisper@normal.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-glk2/igt@gem_exec_whisper@normal.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-hsw:          [PASS][13] -> [FAIL][14] ([i915#694])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-hsw5/igt@gem_partial_pwrite_pread@reads-snoop.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-hsw4/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@i915_pm_rps@reset:
    - shard-tglb:         [PASS][15] -> [FAIL][16] ([i915#413])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-tglb8/igt@i915_pm_rps@reset.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-tglb2/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live_gtt:
    - shard-kbl:          [PASS][17] -> [TIMEOUT][18] ([fdo#112271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-kbl7/igt@i915_selftest@live_gtt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-kbl3/igt@i915_selftest@live_gtt.html

  * igt@kms_cursor_crc@pipe-c-cursor-dpms:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#54])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#54])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-dpms.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [PASS][25] -> [INCOMPLETE][26] ([i915#61])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-hsw2/igt@kms_flip@flip-vs-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-hsw5/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#49])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#49])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#49])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-tglb:         [PASS][33] -> [SKIP][34] ([i915#668]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_plane@pixel-format-pipe-a-planes:
    - shard-snb:          [PASS][35] -> [SKIP][36] ([fdo#109271]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-snb5/igt@kms_plane@pixel-format-pipe-a-planes.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-snb4/igt@kms_plane@pixel-format-pipe-a-planes.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-iclb5/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][39] -> [INCOMPLETE][40] ([fdo#103665])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][41] ([fdo#112080]) -> [PASS][42] +8 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-iclb8/igt@gem_busy@busy-vcs1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-iclb1/igt@gem_busy@busy-vcs1.html

  * {igt@gem_ctx_persistence@hang}:
    - shard-apl:          [FAIL][43] ([i915#1074]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-apl1/igt@gem_ctx_persistence@hang.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-apl1/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [SKIP][45] ([fdo#109276] / [fdo#112080]) -> [PASS][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-iclb8/igt@gem_ctx_persistence@vcs1-queued.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-iclb2/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_exec_schedule@pi-shared-iova-vebox:
    - shard-kbl:          [FAIL][47] -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-kbl3/igt@gem_exec_schedule@pi-shared-iova-vebox.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-kbl6/igt@gem_exec_schedule@pi-shared-iova-vebox.html
    - shard-apl:          [FAIL][49] ([i915#859]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-apl1/igt@gem_exec_schedule@pi-shared-iova-vebox.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-apl6/igt@gem_exec_schedule@pi-shared-iova-vebox.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-render:
    - shard-apl:          [FAIL][51] ([fdo#112118]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-apl1/igt@gem_exec_schedule@preempt-queue-contexts-chain-render.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-apl7/igt@gem_exec_schedule@preempt-queue-contexts-chain-render.html
    - shard-kbl:          [FAIL][53] ([fdo#112118]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-kbl3/igt@gem_exec_schedule@preempt-queue-contexts-chain-render.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-kbl1/igt@gem_exec_schedule@preempt-queue-contexts-chain-render.html

  * igt@gem_exec_schedule@preempt-self-bsd:
    - shard-iclb:         [SKIP][55] ([fdo#112146]) -> [PASS][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-iclb2/igt@gem_exec_schedule@preempt-self-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-iclb6/igt@gem_exec_schedule@preempt-self-bsd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-hsw:          [FAIL][57] -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-hsw8/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-hsw4/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pread@bench:
    - shard-apl:          [INCOMPLETE][59] ([CI#80] / [fdo#103927]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-apl8/igt@gem_pread@bench.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-apl6/igt@gem_pread@bench.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-apl8/igt@gem_softpin@noreloc-s3.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-apl1/igt@gem_softpin@noreloc-s3.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [INCOMPLETE][63] ([i915#58] / [k.org#198133]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-glk7/igt@gen9_exec_parse@allowed-all.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-glk6/igt@gen9_exec_parse@allowed-all.html
    - shard-kbl:          [INCOMPLETE][65] ([fdo#103665]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-kbl2/igt@gen9_exec_parse@allowed-all.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-kbl3/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][67] ([i915#447]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-iclb2/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [INCOMPLETE][69] ([fdo#103665] / [i915#435]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-kbl4/igt@i915_suspend@sysfs-reader.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-kbl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_busy@extended-modeset-hang-oldfb-with-reset-render-pipe-a:
    - shard-apl:          [SKIP][71] ([fdo#109271]) -> [PASS][72] +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-apl1/igt@kms_busy@extended-modeset-hang-oldfb-with-reset-render-pipe-a.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-apl1/igt@kms_busy@extended-modeset-hang-oldfb-with-reset-render-pipe-a.html
    - shard-kbl:          [SKIP][73] ([fdo#109271]) -> [PASS][74] +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-kbl3/igt@kms_busy@extended-modeset-hang-oldfb-with-reset-render-pipe-a.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-kbl7/igt@kms_busy@extended-modeset-hang-oldfb-with-reset-render-pipe-a.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][75] ([i915#72]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-glk:          [SKIP][77] ([fdo#109271]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-glk5/igt@kms_fbcon_fbt@fbc.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-glk9/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-snb:          [SKIP][79] ([fdo#109271]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-snb4/igt@kms_fbcon_fbt@fbc-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-snb2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-hsw:          [INCOMPLETE][81] ([i915#61]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-hsw5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-hsw7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][83] ([i915#180]) -> [PASS][84] +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][85] ([fdo#109441]) -> [PASS][86] +4 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-iclb:         [INCOMPLETE][87] -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-iclb3/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-iclb3/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][89] ([fdo#109276]) -> [PASS][90] +17 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-iclb8/igt@prime_busy@hang-bsd2.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-iclb1/igt@prime_busy@hang-bsd2.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][91] ([i915#831]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-hsw4/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Warnings ####

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-hsw:          [FAIL][93] ([i915#1045]) -> [DMESG-FAIL][94] ([i915#1045])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-hsw1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-hsw2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][95] ([i915#818]) -> [FAIL][96] ([i915#694])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-hsw6/igt@gem_tiled_blits@interruptible.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-hsw5/igt@gem_tiled_blits@interruptible.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][97] ([i915#694]) -> [FAIL][98] ([i915#818])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-hsw1/igt@gem_tiled_blits@normal.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-hsw2/igt@gem_tiled_blits@normal.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][99] ([i915#468]) -> [FAIL][100] ([i915#454])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-tglb4/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_color@pipe-c-ctm-0-75:
    - shard-tglb:         [FAIL][101] ([i915#315]) -> [INCOMPLETE][102] ([i915#472] / [i915#517])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-tglb6/igt@kms_color@pipe-c-ctm-0-75.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-tglb4/igt@kms_color@pipe-c-ctm-0-75.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][103] ([fdo#107724]) -> [SKIP][104] ([fdo#109349])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7831/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112118]: https://bugs.freedesktop.org/show_bug.cgi?id=112118
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1045]: https://gitlab.freedesktop.org/drm/intel/issues/1045
  [i915#1074]: https://gitlab.freedesktop.org/drm/intel/issues/1074
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#517]: https://gitlab.freedesktop.org/drm/intel/issues/517
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#859]: https://gitlab.freedesktop.org/drm/intel/issues/859
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5393 -> IGTPW_4015
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7831: c40c8f70d19e5b27cffb4bb4609b1bc76fd1a58a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4015: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/index.html
  IGT_5393: 9b8b789ef15f8b5abdfbe2684cae234164254cda @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4015/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
