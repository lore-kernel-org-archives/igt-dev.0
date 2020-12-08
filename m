Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 08 Dec 2020 17:39:12 -0000
Message-ID: <160744915242.9600.16222809076413861534@emeril.freedesktop.org>
References: <20201204195007.10215-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20201204195007.10215-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Don=27t_kill_a_test_on_taint_if_watching_timeouts_=28rev2?=
 =?utf-8?q?=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0832753687=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0832753687==
Content-Type: multipart/alternative;
 boundary="===============1969551715877339792=="

--===============1969551715877339792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: runner: Don't kill a test on taint if watching timeouts (rev2)
URL   : https://patchwork.freedesktop.org/series/84577/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9444_full -> IGTPW_5250_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/index.html

Known issues
------------

  Here are the changes found in IGTPW_5250_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-hostile-preempt:
    - shard-hsw:          NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#1099])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-hsw1/igt@gem_ctx_persistence@engines-hostile-preempt.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-tglb:         NOTRUN -> [SKIP][2] ([fdo#109283])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb5/igt@gem_exec_params@rsvd2-dirt.html
    - shard-iclb:         NOTRUN -> [SKIP][3] ([fdo#109283])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb8/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][4] ([i915#2389])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_exec_whisper@basic-queues:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#118] / [i915#95]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-glk1/igt@gem_exec_whisper@basic-queues.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk3/igt@gem_exec_whisper@basic-queues.html

  * igt@gem_softpin@evict-snoop:
    - shard-iclb:         NOTRUN -> [SKIP][7] ([fdo#109312])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb5/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-idle@gtt:
    - shard-tglb:         NOTRUN -> [SKIP][8] ([i915#1317]) +3 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb6/igt@gem_userptr_blits@mmap-offset-invalidate-idle@gtt.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-tglb:         NOTRUN -> [SKIP][9] ([fdo#112306])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb5/igt@gen9_exec_parse@bb-start-out.html
    - shard-iclb:         NOTRUN -> [SKIP][10] ([fdo#112306])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb3/igt@gen9_exec_parse@bb-start-out.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp:
    - shard-iclb:         [PASS][11] -> [FAIL][12] ([i915#2768])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-iclb7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html
    - shard-tglb:         [PASS][13] -> [FAIL][14] ([i915#2768])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-tglb5/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html

  * igt@i915_pm_rpm@debugfs-forcewake-user:
    - shard-hsw:          [PASS][15] -> [SKIP][16] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-hsw1/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-hsw1/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-kbl:          [PASS][17] -> [SKIP][18] ([fdo#109271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-kbl2/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-kbl3/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([i915#579])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-iclb6/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb5/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-tglb:         [PASS][21] -> [SKIP][22] ([i915#579])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-tglb2/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb8/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-apl:          [PASS][23] -> [SKIP][24] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-apl4/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-apl8/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-glk:          [PASS][25] -> [SKIP][26] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-glk7/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk3/igt@i915_pm_rpm@debugfs-forcewake-user.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([fdo#111644] / [i915#1397] / [i915#2411])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [PASS][28] -> [FAIL][29] ([i915#2574])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-tglb2/igt@kms_async_flips@test-time-stamp.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb1/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_atomic_transition@5x-modeset-transitions:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([fdo#112025])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb6/igt@kms_atomic_transition@5x-modeset-transitions.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#110725] / [fdo#111614]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-apl:          NOTRUN -> [SKIP][32] ([fdo#109271]) +44 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-apl3/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#111614]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb1/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_chamelium@dp-mode-timings:
    - shard-apl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-apl7/igt@kms_chamelium@dp-mode-timings.html
    - shard-glk:          NOTRUN -> [SKIP][35] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk1/igt@kms_chamelium@dp-mode-timings.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#109284] / [fdo#111827]) +6 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb7/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium@hdmi-mode-timings:
    - shard-kbl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-kbl2/igt@kms_chamelium@hdmi-mode-timings.html
    - shard-hsw:          NOTRUN -> [SKIP][38] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-hsw2/igt@kms_chamelium@hdmi-mode-timings.html

  * igt@kms_chamelium@vga-hpd-fast:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#109284] / [fdo#111827]) +7 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb7/igt@kms_chamelium@vga-hpd-fast.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding:
    - shard-kbl:          NOTRUN -> [SKIP][40] ([fdo#109271]) +44 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding.html
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#109278] / [fdo#109279])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb4/igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x85-random:
    - shard-glk:          NOTRUN -> [SKIP][42] ([fdo#109271]) +54 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk3/igt@kms_cursor_crc@pipe-d-cursor-256x85-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-random:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#109279]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x170-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x64-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109278]) +7 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb5/igt@kms_cursor_crc@pipe-d-cursor-64x64-rapid-movement.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109274] / [fdo#109278])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb3/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [PASS][46] -> [FAIL][47] ([i915#96])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109274]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb5/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:
    - shard-apl:          NOTRUN -> [FAIL][49] ([i915#2641])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-apl1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html
    - shard-kbl:          NOTRUN -> [FAIL][50] ([i915#2641])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-kbl7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-glk:          [PASS][51] -> [FAIL][52] ([i915#49])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109280]) +9 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#111825]) +21 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#1187])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb8/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][56] ([fdo#109271] / [i915#533])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-kbl4/igt@kms_pipe_crc_basic@read-crc-pipe-d.html
    - shard-glk:          NOTRUN -> [SKIP][57] ([fdo#109271] / [i915#533])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk5/igt@kms_pipe_crc_basic@read-crc-pipe-d.html
    - shard-apl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#533])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-apl6/igt@kms_pipe_crc_basic@read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
    - shard-apl:          NOTRUN -> [FAIL][59] ([fdo#108145] / [i915#265])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html
    - shard-kbl:          NOTRUN -> [FAIL][60] ([fdo#108145] / [i915#265])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#112054])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][62] -> [SKIP][63] ([fdo#109441])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb8/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109441])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb4/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#109309])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb5/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:
    - shard-tglb:         [PASS][66] -> [INCOMPLETE][67] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#1982] / [i915#2411])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-tglb2/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb8/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html

  * igt@kms_writeback@writeback-check-output:
    - shard-apl:          NOTRUN -> [SKIP][68] ([fdo#109271] / [i915#2437])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-apl2/igt@kms_writeback@writeback-check-output.html
    - shard-iclb:         NOTRUN -> [SKIP][69] ([i915#2437])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb7/igt@kms_writeback@writeback-check-output.html
    - shard-kbl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#2437])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-kbl1/igt@kms_writeback@writeback-check-output.html
    - shard-glk:          NOTRUN -> [SKIP][71] ([fdo#109271] / [i915#2437])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk6/igt@kms_writeback@writeback-check-output.html

  * igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([i915#2530]) +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb1/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html

  * igt@nouveau_crc@pipe-b-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([i915#2530]) +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb2/igt@nouveau_crc@pipe-b-source-rg.html

  * igt@nouveau_crc@pipe-c-source-rg:
    - shard-hsw:          NOTRUN -> [SKIP][74] ([fdo#109271]) +47 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-hsw2/igt@nouveau_crc@pipe-c-source-rg.html

  * igt@perf@polling-parameterized:
    - shard-glk:          [PASS][75] -> [FAIL][76] ([i915#1542])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-glk8/igt@perf@polling-parameterized.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk5/igt@perf@polling-parameterized.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109289])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb6/igt@perf@unprivileged-single-ctx-counters.html
    - shard-tglb:         NOTRUN -> [SKIP][78] ([fdo#109289])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb1/igt@perf@unprivileged-single-ctx-counters.html

  * igt@prime_nv_api@i915_self_import:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#109291]) +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb1/igt@prime_nv_api@i915_self_import.html
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#109291]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb4/igt@prime_nv_api@i915_self_import.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-apl:          [INCOMPLETE][81] ([i915#1602] / [i915#2635]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-apl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-apl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html
    - shard-kbl:          [INCOMPLETE][83] ([i915#1602] / [i915#794]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@rcs0.html
    - shard-iclb:         [INCOMPLETE][85] ([i915#1373] / [i915#1602]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-iclb1/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb1/igt@gem_ctx_isolation@preservation-s3@rcs0.html
    - shard-tglb:         [INCOMPLETE][87] ([i915#1373] / [i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-tglb8/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb5/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][89] ([i915#2389]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          [INCOMPLETE][91] ([i915#2199] / [i915#2405]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-glk6/igt@gem_softpin@noreloc-s3.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk8/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][93] ([i915#2745]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-iclb7/igt@i915_pm_dc@dc5-dpms.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
    - shard-glk:          [FAIL][95] ([i915#2745]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-glk2/igt@i915_pm_dc@dc5-dpms.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk4/igt@i915_pm_dc@dc5-dpms.html
    - shard-apl:          [FAIL][97] ([i915#2745]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-apl1/igt@i915_pm_dc@dc5-dpms.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-apl1/igt@i915_pm_dc@dc5-dpms.html
    - shard-kbl:          [FAIL][99] ([i915#545]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-kbl6/igt@i915_pm_dc@dc5-dpms.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-kbl7/igt@i915_pm_dc@dc5-dpms.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [FAIL][101] ([i915#96]) -> [PASS][102] +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][103] ([i915#2055] / [i915#2295]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-hsw2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-hsw6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-glk:          [FAIL][105] ([i915#49]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_plane_lowres@pipe-b-tiling-yf:
    - shard-kbl:          [DMESG-WARN][107] ([i915#165] / [i915#180] / [i915#78]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-kbl2/igt@kms_plane_lowres@pipe-b-tiling-yf.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-kbl6/igt@kms_plane_lowres@pipe-b-tiling-yf.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][109] ([fdo#109441]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-iclb7/igt@kms_psr@psr2_cursor_render.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-hsw:          [INCOMPLETE][111] ([i915#2637]) -> [PASS][112] +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-hsw6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-hsw2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
    - shard-kbl:          [INCOMPLETE][113] ([i915#155]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
    - shard-iclb:         [INCOMPLETE][115] ([i915#1185]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-iclb7/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
    - shard-apl:          [DMESG-WARN][117] ([i915#2635]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-apl6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
    - shard-glk:          [INCOMPLETE][119] ([i915#2635]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-glk2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk3/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-tglb:         [DMESG-WARN][121] ([i915#1602] / [i915#2411]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-tglb1/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][123] ([i915#588]) -> [SKIP][124] ([i915#658])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][125] ([i915#2681] / [i915#2684]) -> [WARN][126] ([i915#1804] / [i915#2684])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [FAIL][127] ([i915#2680]) -> [WARN][128] ([i915#1804] / [i915#2684])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][129], [FAIL][130], [FAIL][131]) ([i915#1436] / [i915#1814] / [i915#2295] / [i915#2722] / [i915#483] / [i915#602]) -> [FAIL][132] ([i915#2295] / [i915#2722] / [i915#483])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-kbl2/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-kbl6/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-kbl2/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-kbl1/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][133], [FAIL][134], [FAIL][135]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483]) -> [FAIL][136] ([i915#2295] / [i915#2722])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-iclb7/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-iclb7/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-iclb1/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb3/igt@runner@aborted.html
    - shard-apl:          ([FAIL][137], [FAIL][138], [FAIL][139]) ([i915#1814] / [i915#2295] / [i915#2722]) -> [FAIL][140] ([i915#2295] / [i915#2722])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-apl1/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-apl3/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-apl8/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-apl2/igt@runner@aborted.html
    - shard-glk:          ([FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483] / [k.org#202321]) -> ([FAIL][145], [FAIL][146]) ([i915#2295] / [i915#2722] / [k.org#202321])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-glk2/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-glk7/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-glk3/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-glk5/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk9/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk2/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][147], [FAIL][148], [FAIL][149]) ([i915#1602] / [i915#2295] / [i915#2722] / [i915#402]) -> ([FAIL][150], [FAIL][151]) ([i915#1602] / [i915#2295] / [i915#2722])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-tglb1/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-tglb8/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-tglb2/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb8/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb1/igt@runner@aborted.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112025]: https://bugs.freedesktop.org/show_bug.cgi?id=112025
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112306]: https://bugs.freedesktop.org/show_bug.cgi?id=112306
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.o

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/index.html

--===============1969551715877339792==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>runner: Don&#39;t kill a test on taint if watching timeouts (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84577/">https://patchwork.freedesktop.org/series/84577/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9444_full -&gt; IGTPW_5250_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5250_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-hostile-preempt:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-hsw1/igt@gem_ctx_persistence@engines-hostile-preempt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb5/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109283">fdo#109283</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb8/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109283">fdo#109283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-glk1/igt@gem_exec_whisper@basic-queues.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk3/igt@gem_exec_whisper@basic-queues.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.o">i915#118</a> / [i915#95]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb5/igt@gem_softpin@evict-snoop.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109312">fdo#109312</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-idle@gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb6/igt@gem_userptr_blits@mmap-offset-invalidate-idle@gtt.html">SKIP</a> ([i915#1317]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb5/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112306">fdo#112306</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb3/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112306">fdo#112306</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-iclb7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html">FAIL</a> ([i915#2768])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-tglb5/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html">FAIL</a> ([i915#2768])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@debugfs-forcewake-user:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-hsw1/igt@i915_pm_rpm@debugfs-forcewake-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-hsw1/igt@i915_pm_rpm@debugfs-forcewake-user.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-kbl2/igt@i915_pm_rpm@debugfs-forcewake-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-kbl3/igt@i915_pm_rpm@debugfs-forcewake-user.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-iclb6/igt@i915_pm_rpm@debugfs-forcewake-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb5/igt@i915_pm_rpm@debugfs-forcewake-user.html">SKIP</a> ([i915#579])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-tglb2/igt@i915_pm_rpm@debugfs-forcewake-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb8/igt@i915_pm_rpm@debugfs-forcewake-user.html">SKIP</a> ([i915#579])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-apl4/igt@i915_pm_rpm@debugfs-forcewake-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-apl8/igt@i915_pm_rpm@debugfs-forcewake-user.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-glk7/igt@i915_pm_rpm@debugfs-forcewake-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk3/igt@i915_pm_rpm@debugfs-forcewake-user.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111644">fdo#111644</a> / [i915#1397] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-tglb2/igt@kms_async_flips@test-time-stamp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb1/igt@kms_async_flips@test-time-stamp.html">FAIL</a> ([i915#2574])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@5x-modeset-transitions:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb6/igt@kms_atomic_transition@5x-modeset-transitions.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112025">fdo#112025</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110725">fdo#110725</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-apl3/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +44 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb1/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-mode-timings:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-apl7/igt@kms_chamelium@dp-mode-timings.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +6 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk1/igt@kms_chamelium@dp-mode-timings.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb7/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-mode-timings:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-kbl2/igt@kms_chamelium@hdmi-mode-timings.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +6 similar issues</p>
</li>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-hsw2/igt@kms_chamelium@hdmi-mode-timings.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-fast:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb7/igt@kms_chamelium@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +44 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb4/igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x85-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk3/igt@kms_cursor_crc@pipe-d-cursor-256x85-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +54 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x170-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x64-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb5/igt@kms_cursor_crc@pipe-d-cursor-64x64-rapid-movement.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb3/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">FAIL</a> ([i915#96])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb5/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-apl1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html">FAIL</a> ([i915#2641])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-kbl7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html">FAIL</a> ([i915#2641])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">FAIL</a> ([i915#49])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb8/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#1187])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-kbl4/igt@kms_pipe_crc_basic@read-crc-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#533])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk5/igt@kms_pipe_crc_basic@read-crc-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#533])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-apl6/igt@kms_pipe_crc_basic@read-crc-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / [i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112054">fdo#112054</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb8/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb4/igt@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109309">fdo#109309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-tglb2/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb8/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html">INCOMPLETE</a> ([i915#1436] / [i915#1602] / [i915#1887] / [i915#1982] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-apl2/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#2437])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb7/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-kbl1/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#2437])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk6/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb1/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html">SKIP</a> ([i915#2530]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-rg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb2/igt@nouveau_crc@pipe-b-source-rg.html">SKIP</a> ([i915#2530]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-rg:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-hsw2/igt@nouveau_crc@pipe-c-source-rg.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +47 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-glk8/igt@perf@polling-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk5/igt@perf@polling-parameterized.html">FAIL</a> ([i915#1542])</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb6/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb1/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_self_import:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb1/igt@prime_nv_api@i915_self_import.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb4/igt@prime_nv_api@i915_self_import.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>) +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-apl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html">INCOMPLETE</a> ([i915#1602] / [i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-apl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@rcs0.html">INCOMPLETE</a> ([i915#1602] / [i915#794]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-iclb1/igt@gem_ctx_isolation@preservation-s3@rcs0.html">INCOMPLETE</a> ([i915#1373] / [i915#1602]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb1/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-tglb8/igt@gem_ctx_isolation@preservation-s3@rcs0.html">INCOMPLETE</a> ([i915#1373] / [i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb5/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-glk6/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> ([i915#2199] / [i915#2405]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk8/igt@gem_softpin@noreloc-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-dpms:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-iclb7/igt@i915_pm_dc@dc5-dpms.html">FAIL</a> ([i915#2745]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-glk2/igt@i915_pm_dc@dc5-dpms.html">FAIL</a> ([i915#2745]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk4/igt@i915_pm_dc@dc5-dpms.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-apl1/igt@i915_pm_dc@dc5-dpms.html">FAIL</a> ([i915#2745]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-apl1/igt@i915_pm_dc@dc5-dpms.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-kbl6/igt@i915_pm_dc@dc5-dpms.html">FAIL</a> ([i915#545]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-kbl7/igt@i915_pm_dc@dc5-dpms.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">FAIL</a> ([i915#96]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-hsw2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">INCOMPLETE</a> ([i915#2055] / [i915#2295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-hsw6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">FAIL</a> ([i915#49]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-yf:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-kbl2/igt@kms_plane_lowres@pipe-b-tiling-yf.html">DMESG-WARN</a> ([i915#165] / [i915#180] / [i915#78]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-kbl6/igt@kms_plane_lowres@pipe-b-tiling-yf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-iclb7/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-hsw6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html">INCOMPLETE</a> ([i915#2637]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-hsw2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html">INCOMPLETE</a> ([i915#155]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-iclb7/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html">INCOMPLETE</a> ([i915#1185]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html">DMESG-WARN</a> ([i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-apl6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-glk2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html">INCOMPLETE</a> ([i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk3/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-tglb1/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">DMESG-WARN</a> ([i915#1602] / [i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#588]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a> ([i915#2680]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-kbl2/igt@runner@aborted.html">FAIL</a>) ([i915#1436] / [i915#1814] / [i915#2295] / [i915#2722] / [i915#483] / [i915#602]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-kbl1/igt@runner@aborted.html">FAIL</a> ([i915#2295] / [i915#2722] / [i915#483])</p>
</li>
<li>
<p>shard-iclb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-iclb7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-iclb7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-iclb1/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-iclb3/igt@runner@aborted.html">FAIL</a> ([i915#2295] / [i915#2722])</p>
</li>
<li>
<p>shard-apl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-apl8/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2722]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-apl2/igt@runner@aborted.html">FAIL</a> ([i915#2295] / [i915#2722])</p>
</li>
<li>
<p>shard-glk:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-glk2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-glk7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-glk3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-glk5/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483] / [k.org#202321]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk9/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-glk2/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2722] / [k.org#202321])</p>
</li>
<li>
<p>shard-tglb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9444/shard-tglb2/igt@runner@aborted.html">FAIL</a>) ([i915#1602] / [i915#2295] / [i915#2722] / [i915#402]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5250/shard-tglb1/igt@runner@aborted.html">FAIL</a>) ([i915#1602] / [i915#2295] / [i915#2722])</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============1969551715877339792==--

--===============0832753687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0832753687==--
