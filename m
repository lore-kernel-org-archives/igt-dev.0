Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 07 Dec 2020 14:13:50 -0000
Message-ID: <160735043085.8722.1045025517432068073@emeril.freedesktop.org>
References: <20201207114446.268638-1-apoorva1.singh@intel.com>
In-Reply-To: <20201207114446.268638-1-apoorva1.singh@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fgpgpu=5Ffill=3A_Add_test_description_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1593729830=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1593729830==
Content-Type: multipart/alternative;
 boundary="===============4514514454278598020=="

--===============4514514454278598020==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_gpgpu_fill: Add test description (rev2)
URL   : https://patchwork.freedesktop.org/series/84615/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9453_full -> IGTPW_5254_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/index.html

Known issues
------------

  Here are the changes found in IGTPW_5254_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@kms:
    - shard-glk:          [PASS][1] -> [INCOMPLETE][2] ([i915#2244] / [i915#2502])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-glk1/igt@gem_eio@kms.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-glk5/igt@gem_eio@kms.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [PASS][3] -> [FAIL][4] ([i915#2389])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-glk9/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-glk9/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp:
    - shard-iclb:         [PASS][5] -> [FAIL][6] ([i915#2768])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-iclb1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-iclb6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html
    - shard-tglb:         [PASS][7] -> [FAIL][8] ([i915#2768])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-tglb6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-tglb5/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#579])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-iclb8/igt@i915_pm_rpm@system-suspend-devices.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-iclb6/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-kbl:          [PASS][11] -> [SKIP][12] ([fdo#109271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-kbl1/igt@i915_pm_rpm@system-suspend-devices.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-kbl6/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-hsw:          [PASS][13] -> [SKIP][14] ([fdo#109271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-hsw8/igt@i915_pm_rpm@system-suspend-devices.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-hsw1/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-tglb:         [PASS][15] -> [SKIP][16] ([i915#579])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-tglb7/igt@i915_pm_rpm@system-suspend-devices.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-tglb5/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-glk:          [PASS][17] -> [SKIP][18] ([fdo#109271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-glk5/igt@i915_pm_rpm@system-suspend-devices.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-glk7/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-apl:          [PASS][19] -> [SKIP][20] ([fdo#109271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-apl1/igt@i915_pm_rpm@system-suspend-devices.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-apl1/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#54])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#54])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#72])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [PASS][29] -> [FAIL][30] ([i915#2598])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:
    - shard-iclb:         [PASS][31] -> [FAIL][32] ([i915#49])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#49])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-glk5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-glk3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-iclb:         [PASS][35] -> [FAIL][36] ([i915#1036])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-iclb1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-iclb5/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#1036])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-glk8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-glk3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_properties@connector-properties-atomic:
    - shard-iclb:         [PASS][39] -> [DMESG-WARN][40] ([i915#1226])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-iclb7/igt@kms_properties@connector-properties-atomic.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-iclb5/igt@kms_properties@connector-properties-atomic.html
    - shard-glk:          [PASS][41] -> [DMESG-WARN][42] ([i915#118] / [i915#95])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-glk8/igt@kms_properties@connector-properties-atomic.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-glk3/igt@kms_properties@connector-properties-atomic.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109642] / [fdo#111068])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-iclb3/igt@kms_psr2_su@page_flip.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [PASS][45] -> [INCOMPLETE][46] ([i915#155])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@prime_vgem@sync@bcs0:
    - shard-tglb:         [PASS][47] -> [INCOMPLETE][48] ([i915#409])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-tglb8/igt@prime_vgem@sync@bcs0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-tglb6/igt@prime_vgem@sync@bcs0.html

  
#### Possible fixes ####

  * {igt@gem_ctx_exec@basic-close-race}:
    - shard-glk:          [INCOMPLETE][49] ([i915#2245]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-glk7/igt@gem_ctx_exec@basic-close-race.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-glk7/igt@gem_ctx_exec@basic-close-race.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-tglb:         [DMESG-WARN][51] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-tglb7/igt@gem_exec_suspend@basic-s0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-tglb2/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_whisper@basic-contexts-forked:
    - shard-glk:          [DMESG-WARN][53] ([i915#118] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-glk1/igt@gem_exec_whisper@basic-contexts-forked.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked.html

  * igt@gem_softpin@noreloc-s3:
    - shard-tglb:         [INCOMPLETE][55] ([i915#1373] / [i915#1436] / [i915#1602] / [i915#1887] / [i915#2411] / [i915#456]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-tglb1/igt@gem_softpin@noreloc-s3.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-tglb7/igt@gem_softpin@noreloc-s3.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [INCOMPLETE][57] ([i915#2295]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-apl4/igt@gem_workarounds@suspend-resume-context.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-apl8/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-kbl:          [SKIP][59] ([fdo#109271]) -> [PASS][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-kbl6/igt@i915_pm_rpm@system-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-kbl7/igt@i915_pm_rpm@system-suspend.html
    - shard-hsw:          [SKIP][61] ([fdo#109271]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-hsw7/igt@i915_pm_rpm@system-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-hsw5/igt@i915_pm_rpm@system-suspend.html
    - shard-tglb:         [SKIP][63] ([i915#579]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-tglb3/igt@i915_pm_rpm@system-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-tglb1/igt@i915_pm_rpm@system-suspend.html
    - shard-iclb:         [SKIP][65] ([i915#579]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-iclb6/igt@i915_pm_rpm@system-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-iclb4/igt@i915_pm_rpm@system-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-random:
    - shard-kbl:          [FAIL][67] ([i915#54]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html
    - shard-glk:          [FAIL][69] ([i915#54]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-glk2/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html
    - shard-apl:          [FAIL][71] ([i915#54]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html

  * igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][73] ([i915#2122]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-glk6/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-glk2/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [FAIL][75] ([i915#2598]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@b-edp1:
    - shard-iclb:         [INCOMPLETE][77] ([i915#1373]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-iclb3/igt@kms_flip@flip-vs-suspend@b-edp1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-iclb1/igt@kms_flip@flip-vs-suspend@b-edp1.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80] +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-iclb1/igt@kms_psr@psr2_cursor_blt.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm:
    - shard-tglb:         [SKIP][81] ([i915#2648]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-tglb3/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-tglb3/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-iclb:         [SKIP][83] ([fdo#109278]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-iclb6/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-iclb7/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-glk:          [SKIP][85] ([fdo#109271]) -> [PASS][86] +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-glk4/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-glk7/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-apl:          [SKIP][87] ([fdo#109271]) -> [PASS][88] +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-apl4/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][89] ([i915#2684]) -> [WARN][90] ([i915#1804] / [i915#2684])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglb:         [SKIP][91] ([i915#579]) -> [SKIP][92] ([fdo#111644] / [i915#1397] / [i915#2411])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-tglb7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-iclb:         [SKIP][93] ([i915#579]) -> [SKIP][94] ([fdo#110892])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-iclb6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][95] ([i915#1319]) -> [DMESG-FAIL][96] ([fdo#110321])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-apl6/igt@kms_content_protection@atomic.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-apl2/igt@kms_content_protection@atomic.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][97] ([i915#1226]) -> [SKIP][98] ([fdo#109349])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][99] ([i915#2295] / [i915#2722]) -> [FAIL][100] ([i915#2295] / [i915#2722] / [i915#483])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-kbl7/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-kbl2/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][101], [FAIL][102], [FAIL][103]) ([i915#1602] / [i915#2295] / [i915#2722]) -> ([FAIL][104], [FAIL][105]) ([i915#2295] / [i915#2426] / [i915#2722] / [i915#409])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-tglb7/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-tglb7/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-tglb1/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-tglb6/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-tglb7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [i915#1036]: https://gitlab.freedesktop.org/drm/intel/issues/1036
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1373]: https://gitlab.freedesktop.org/drm/intel/issues/1373
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2244]: https://gitlab.freedesktop.org/drm/intel/issues/2244
  [i915#2245]: https://gitlab.freedesktop.org/drm/intel/issues/2245
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2502]: https://gitlab.freedesktop.org/drm/intel/issues/2502
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2648]: https://gitlab.freedesktop.org/drm/intel/issues/2648
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#2768]: https://gitlab.freedesktop.org/drm/intel/issues/2768
  [i915#409]: https://gitlab.freedesktop.org/drm/intel/issues/409
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5883 -> IGTPW_5254
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9453: 52e2ca46b7e2aa62c0509bce0be189d2f5a7325f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5254: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/index.html
  IGT_5883: 02244f60c98b4e4106b1099ade3439b159ac848e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/index.html

--===============4514514454278598020==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>i915/gem_gpgpu_fill: Add test description (r=
ev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84615/">https://patchwork.freedesktop.org/series/84615/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5254/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5254/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9453_full -&gt; IGTPW_5254_full</h=
1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/index.=
html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5254_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9453/shard-glk1/igt@gem_eio@kms.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-glk5/igt@gem_eio@kms=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2244">i915#2244</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2502">i915#2502</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9453/shard-glk9/igt@gem_exec_reloc@basic-many-active@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/=
shard-glk9/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</=
li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-iclb1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/sha=
rd-iclb6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2768">i915#2768</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-tglb6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/sha=
rd-tglb5/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2768">i915#2768</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-devices:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-iclb8/igt@i915_pm_rpm@system-suspend-devices.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/sha=
rd-iclb6/igt@i915_pm_rpm@system-suspend-devices.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-kbl1/igt@i915_pm_rpm@system-suspend-devices.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shar=
d-kbl6/igt@i915_pm_rpm@system-suspend-devices.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-hsw8/igt@i915_pm_rpm@system-suspend-devices.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shar=
d-hsw1/igt@i915_pm_rpm@system-suspend-devices.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-tglb7/igt@i915_pm_rpm@system-suspend-devices.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/sha=
rd-tglb5/igt@i915_pm_rpm@system-suspend-devices.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-glk5/igt@i915_pm_rpm@system-suspend-devices.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shar=
d-glk7/igt@i915_pm_rpm@system-suspend-devices.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-apl1/igt@i915_pm_rpm@system-suspend-devices.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shar=
d-apl1/igt@i915_pm_rpm@system-suspend-devices.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5254/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i915#=
54</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5254/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i915#=
54</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5254/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i915#=
54</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9453/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5254/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/72=
">i915#72</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9453/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_525=
4/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2598">i915#2598</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5254/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4=
9">i915#49</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-glk5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5254/shard-glk3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/49"=
>i915#49</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-iclb1/igt@kms_plane@plane-panning-bottom-right-suspend-pi=
pe-c-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5254/shard-iclb5/igt@kms_plane@plane-panning-bottom-right-s=
uspend-pipe-c-planes.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/1036">i915#1036</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-glk8/igt@kms_plane@plane-panning-bottom-right-suspend-pip=
e-c-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5254/shard-glk3/igt@kms_plane@plane-panning-bottom-right-sus=
pend-pipe-c-planes.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/1036">i915#1036</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-iclb7/igt@kms_properties@connector-properties-atomic.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5254/shard-iclb5/igt@kms_properties@connector-properties-atomic.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1226"=
>i915#1226</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-glk8/igt@kms_properties@connector-properties-atomic.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
254/shard-glk3/igt@kms_properties@connector-properties-atomic.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i9=
15#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95"=
>i915#95</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9453/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-iclb3/igt=
@kms_psr2_su@page_flip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9453/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
254/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/155">i91=
5#155</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@sync@bcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9453/shard-tglb8/igt@prime_vgem@sync@bcs0.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-tglb6/igt@=
prime_vgem@sync@bcs0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/409">i915#409</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@gem_ctx_exec@basic-close-race}:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9453/shard-glk7/igt@gem_ctx_exec@basic-close-race.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2245">i915#=
2245</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
254/shard-glk7/igt@gem_ctx_exec@basic-close-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9453/shard-tglb7/igt@gem_exec_suspend@basic-s0.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#143=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i9=
15#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/18=
87">i915#1887</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5254/shard-tglb2/igt@gem_exec_suspend@basic-s0.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9453/shard-glk1/igt@gem_exec_whisper@basic-contexts-forked.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/11=
8">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5254/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9453/shard-tglb1/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1373">i915#1373</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#=
1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602"=
>i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1887">i915#1887</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2411">i915#2411</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/456">i915#456</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5254/shard-tglb7/igt@gem_softpin@noreloc-s3.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9453/shard-apl4/igt@gem_workarounds@suspend-resume-context.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/22=
95">i915#2295</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5254/shard-apl8/igt@gem_workarounds@suspend-resume-context.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-kbl6/igt@i915_pm_rpm@system-suspend.html">SKIP</a> (<a hr=
ef=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shar=
d-kbl7/igt@i915_pm_rpm@system-suspend.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-hsw7/igt@i915_pm_rpm@system-suspend.html">SKIP</a> (<a hr=
ef=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shar=
d-hsw5/igt@i915_pm_rpm@system-suspend.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-tglb3/igt@i915_pm_rpm@system-suspend.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-t=
glb1/igt@i915_pm_rpm@system-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-iclb6/igt@i915_pm_rpm@system-suspend.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-i=
clb4/igt@i915_pm_rpm@system-suspend.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-256x256-random:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">=
i915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5254/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html">PAS=
S</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-glk2/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">=
i915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5254/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html">PAS=
S</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">=
i915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5254/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html">PAS=
S</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9453/shard-glk6/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi=
-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2122">i915#2122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5254/shard-glk2/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a=
1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9453/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2598">i915#2598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5254/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank-inter=
ruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-edp1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9453/shard-iclb3/igt@kms_flip@flip-vs-suspend@b-edp1.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1373">i9=
15#1373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5254/shard-iclb1/igt@kms_flip@flip-vs-suspend@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9453/shard-iclb1/igt@kms_psr@psr2_cursor_blt.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard=
-iclb2/igt@kms_psr@psr2_cursor_blt.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-tglb3/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
648">i915#2648</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5254/shard-tglb3/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm=
.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-iclb6/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9278">fdo#109278</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5254/shard-iclb7/igt@kms_vblank@pipe-a-ts-continuation-modeset-r=
pm.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-glk4/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5254/shard-glk7/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm=
.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-apl4/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5254/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm=
.html">PASS</a> +2 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9453/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#268=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254=
/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)=
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579=
">i915#579</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5254/shard-tglb7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111644=
">fdo#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1397">i915#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2411">i915#2411</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-iclb6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579=
">i915#579</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5254/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110892=
">fdo#110892</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9453/shard-apl6/igt@kms_content_protection@atomic.html">TIMEOUT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#131=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254=
/shard-apl2/igt@kms_content_protection@atomic.html">DMESG-FAIL</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110321">fdo#110321</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9453/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1226">i9=
15#1226</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5254/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109349">fdo#109349</a=
>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9453/shard-kbl7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard-kbl2/i=
gt@runner@aborted.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9453/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9453/shard-tglb7/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_9453/shard-tglb1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/shard=
-tglb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5254/shard-tglb7/igt@runner@aborted.html">FAIL</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#22=
95</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2426">i=
915#2426</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/409">i915#409</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5883 -&gt; IGTPW_5254</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9453: 52e2ca46b7e2aa62c0509bce0be189d2f5a7325f @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5254: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5254/index.htm=
l<br />
  IGT_5883: 02244f60c98b4e4106b1099ade3439b159ac848e @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============4514514454278598020==--

--===============1593729830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1593729830==--
