Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 07 Apr 2020 16:38:15 -0000
Message-ID: <158627749545.26327.16234590257733061910@emeril.freedesktop.org>
References: <20200407083105.1692124-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200407083105.1692124-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Show_why_we_dump_the_task_state_=28rev3=29?=
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

Series: runner: Show why we dump the task state (rev3)
URL   : https://patchwork.freedesktop.org/series/75599/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8264_full -> IGTPW_4422_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/index.html

Known issues
------------

  Here are the changes found in IGTPW_4422_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][1] -> [DMESG-WARN][2] ([i915#716])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-glk6/igt@gen9_exec_parse@allowed-all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-glk1/igt@gen9_exec_parse@allowed-all.html
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#716])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-kbl2/igt@gen9_exec_parse@allowed-all.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-kbl1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@fences-dpms:
    - shard-hsw:          [PASS][5] -> [SKIP][6] ([fdo#109271])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-hsw7/igt@i915_pm_rpm@fences-dpms.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-hsw1/igt@i915_pm_rpm@fences-dpms.html
    - shard-glk:          [PASS][7] -> [SKIP][8] ([fdo#109271])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-glk1/igt@i915_pm_rpm@fences-dpms.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-glk8/igt@i915_pm_rpm@fences-dpms.html
    - shard-tglb:         [PASS][9] -> [SKIP][10] ([i915#1316] / [i915#579])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-tglb3/igt@i915_pm_rpm@fences-dpms.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-tglb7/igt@i915_pm_rpm@fences-dpms.html
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#1316] / [i915#579])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-iclb6/igt@i915_pm_rpm@fences-dpms.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-iclb7/igt@i915_pm_rpm@fences-dpms.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#1119] / [i915#93] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-kbl2/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-kbl2/igt@kms_big_fb@linear-32bpp-rotate-0.html
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#1119] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#54] / [i915#93] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][19] -> [INCOMPLETE][20] ([i915#155])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][23] -> [FAIL][24] ([i915#57])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#1566] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#52] / [i915#54]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-kbl:          [PASS][31] -> [INCOMPLETE][32] ([i915#1297] / [i915#600])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-kbl4/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-kbl6/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
    - shard-apl:          [PASS][33] -> [INCOMPLETE][34] ([i915#1297])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-apl2/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-apl7/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling.html
    - shard-kbl:          [PASS][37] -> [FAIL][38] ([i915#699] / [i915#93] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [PASS][41] -> [FAIL][42] ([fdo#108145] / [i915#265] / [i915#95])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][43] -> [FAIL][44] ([i915#899])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_prime@basic-crc:
    - shard-apl:          [PASS][45] -> [FAIL][46] ([i915#1031] / [i915#95])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-apl7/igt@kms_prime@basic-crc.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-apl8/igt@kms_prime@basic-crc.html
    - shard-kbl:          [PASS][47] -> [FAIL][48] ([i915#1031] / [i915#93] / [i915#95])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-kbl4/igt@kms_prime@basic-crc.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-kbl4/igt@kms_prime@basic-crc.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([fdo#109441]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@rcs0}:
    - shard-apl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52] +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-apl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-apl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [FAIL][53] ([i915#1277]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-tglb6/igt@gem_exec_balancer@hang.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-tglb8/igt@gem_exec_balancer@hang.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [FAIL][55] ([i915#1516]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_selftest@live@blt:
    - shard-snb:          [DMESG-FAIL][57] ([i915#1409]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-snb4/igt@i915_selftest@live@blt.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-snb1/igt@i915_selftest@live@blt.html

  * igt@kms_color@pipe-a-ctm-green-to-red:
    - shard-kbl:          [FAIL][59] ([i915#129]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-kbl4/igt@kms_color@pipe-a-ctm-green-to-red.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-kbl3/igt@kms_color@pipe-a-ctm-green-to-red.html
    - shard-apl:          [FAIL][61] ([i915#129]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-apl2/igt@kms_color@pipe-a-ctm-green-to-red.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-apl4/igt@kms_color@pipe-a-ctm-green-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [FAIL][63] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][65] ([fdo#109349]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [FAIL][67] ([i915#52] / [i915#54]) -> [PASS][68] +5 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][69] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-glk:          [FAIL][71] ([i915#34]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-glk5/igt@kms_flip@2x-plain-flip-ts-check.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-glk1/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-apl:          [FAIL][73] ([i915#79]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-apl4/igt@kms_flip@flip-vs-expired-vblank.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-apl2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76] +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [FAIL][77] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [FAIL][79] ([i915#53] / [i915#95]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-snb:          [DMESG-WARN][81] ([i915#42]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-snb6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-snb4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-none:
    - shard-kbl:          [DMESG-WARN][83] ([i915#165] / [i915#78]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-kbl2/igt@kms_plane_lowres@pipe-a-tiling-none.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-kbl1/igt@kms_plane_lowres@pipe-a-tiling-none.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][85] ([fdo#109441]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][87] ([i915#31]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-hsw8/igt@kms_setmode@basic.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-hsw6/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [INCOMPLETE][89] ([i915#155]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][91] ([i915#1542]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-iclb8/igt@perf@blocking-parameterized.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-iclb1/igt@perf@blocking-parameterized.html
    - shard-hsw:          [FAIL][93] ([i915#1542]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-hsw6/igt@perf@blocking-parameterized.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-hsw4/igt@perf@blocking-parameterized.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [FAIL][95] ([i915#1085]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-tglb7/igt@perf@gen12-mi-rpc.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-tglb3/igt@perf@gen12-mi-rpc.html

  
#### Warnings ####

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-apl:          [FAIL][97] ([fdo#108145] / [i915#265]) -> [FAIL][98] ([fdo#108145] / [i915#265] / [i915#95]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
    - shard-kbl:          [FAIL][99] ([fdo#108145] / [i915#265]) -> [FAIL][100] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][101] ([i915#1423] / [i915#92]) -> ([FAIL][102], [FAIL][103]) ([i915#1423] / [i915#716] / [i915#92])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8264/shard-kbl3/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-kbl1/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/shard-kbl7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1031]: https://gitlab.freedesktop.org/drm/intel/issues/1031
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1409]: https://gitlab.freedesktop.org/drm/intel/issues/1409
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1516]: https://gitlab.freedesktop.org/drm/intel/issues/1516
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#600]: https://gitlab.freedesktop.org/drm/intel/issues/600
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5573 -> IGTPW_4422
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8264: e0104585f880a64d4a9b40803cf4fb51ab499f7c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4422: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/index.html
  IGT_5573: 9c582425d6b4fc1de9fc2ffc8015cc6f0a0d3e98 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4422/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
