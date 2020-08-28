Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 28 Aug 2020 11:53:08 -0000
Message-ID: <159861558801.4239.9465794510007938455@emeril.freedesktop.org>
References: <20200828075927.17061-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200828075927.17061-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?core=5Fhotunplug=3A_Fixes_and_enhancements_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1620888939=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1620888939==
Content-Type: multipart/alternative;
 boundary="===============2917573116214987857=="

--===============2917573116214987857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/core_hotunplug: Fixes and enhancements (rev5)
URL   : https://patchwork.freedesktop.org/series/79671/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5774_full -> IGTPW_4914_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4914_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4914_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4914_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@core_hotunplug@hotrebind-lateclose} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-snb2/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-iclb:         NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-iclb3/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-tglb:         NOTRUN -> [DMESG-WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-tglb7/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-glk:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-glk6/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-hsw:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-hsw2/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-kbl:          NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-kbl1/igt@core_hotunplug@hotrebind-lateclose.html

  * {igt@core_hotunplug@unbind-rebind} (NEW):
    - shard-hsw:          NOTRUN -> [WARN][7] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-hsw6/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_render_copy@linear:
    - shard-tglb:         [PASS][8] -> [FAIL][9] +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-tglb3/igt@gem_render_copy@linear.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-tglb7/igt@gem_render_copy@linear.html

  
New tests
---------

  New tests have been introduced between IGT_5774_full and IGTPW_4914_full:

### New IGT tests (3) ###

  * igt@core_hotunplug@hotrebind-lateclose:
    - Statuses : 1 dmesg-warn(s) 6 fail(s)
    - Exec time: [6.13, 17.39] s

  * igt@core_hotunplug@hotunbind-rebind:
    - Statuses : 6 pass(s) 1 warn(s)
    - Exec time: [0.39, 1.96] s

  * igt@core_hotunplug@unbind-rebind:
    - Statuses : 6 pass(s) 1 warn(s)
    - Exec time: [0.38, 1.91] s

  

Known issues
------------

  Here are the changes found in IGTPW_4914_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-tglb:         [PASS][10] -> [TIMEOUT][11] ([i915#1958])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-tglb8/igt@gem_exec_reloc@basic-concurrent0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-tglb1/igt@gem_exec_reloc@basic-concurrent0.html
    - shard-kbl:          [PASS][12] -> [TIMEOUT][13] ([i915#1958]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-kbl2/igt@gem_exec_reloc@basic-concurrent0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-kbl4/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-forked:
    - shard-iclb:         [PASS][14] -> [TIMEOUT][15] ([i915#1958])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-iclb8/igt@gem_exec_whisper@basic-forked.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-iclb5/igt@gem_exec_whisper@basic-forked.html

  * igt@gem_exec_whisper@basic-forked-all:
    - shard-glk:          [PASS][16] -> [DMESG-WARN][17] ([i915#118] / [i915#95])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-glk9/igt@gem_exec_whisper@basic-forked-all.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-glk6/igt@gem_exec_whisper@basic-forked-all.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [PASS][18] -> [TIMEOUT][19] ([i915#1958]) +4 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-glk3/igt@gem_exec_whisper@basic-queues-forked-all.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-glk9/igt@gem_exec_whisper@basic-queues-forked-all.html
    - shard-apl:          [PASS][20] -> [TIMEOUT][21] ([i915#1635] / [i915#1958]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-apl1/igt@gem_exec_whisper@basic-queues-forked-all.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-apl2/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][22] -> [DMESG-WARN][23] ([i915#1436] / [i915#1635] / [i915#716])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-apl2/igt@gen9_exec_parse@allowed-all.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-apl7/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][24] -> [FAIL][25] ([i915#1899])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-iclb3/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-kbl:          [PASS][26] -> [DMESG-WARN][27] ([i915#165])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-kbl4/igt@i915_pm_rpm@reg-read-ioctl.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-kbl2/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@i915_selftest@mock@contexts:
    - shard-hsw:          [PASS][28] -> [INCOMPLETE][29] ([i915#2278])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-hsw2/igt@i915_selftest@mock@contexts.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-hsw6/igt@i915_selftest@mock@contexts.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-tglb:         [PASS][30] -> [DMESG-WARN][31] ([i915#1982]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-glk:          [PASS][32] -> [FAIL][33] ([i915#49])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [PASS][34] -> [DMESG-WARN][35] ([i915#1982])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-glk8/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-glk1/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-kbl:          [PASS][36] -> [FAIL][37] ([i915#49])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
    - shard-apl:          [PASS][38] -> [FAIL][39] ([i915#1635] / [i915#49])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-apl1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-apl7/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][40] -> [SKIP][41] ([i915#433])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][42] -> [DMESG-WARN][43] ([i915#180])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][44] -> [SKIP][45] ([fdo#109642] / [fdo#111068])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-iclb1/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][46] -> [SKIP][47] ([fdo#109441]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
    - shard-kbl:          [PASS][48] -> [DMESG-WARN][49] ([i915#1982]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-kbl7/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-kbl4/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html

  * igt@kms_vblank@pipe-a-query-busy-hang:
    - shard-apl:          [PASS][50] -> [DMESG-WARN][51] ([i915#1635] / [i915#1982])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-apl4/igt@kms_vblank@pipe-a-query-busy-hang.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-apl1/igt@kms_vblank@pipe-a-query-busy-hang.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [FAIL][52] ([i915#1635] / [i915#2389]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-apl3/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-apl8/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-hsw:          [FAIL][54] ([i915#2389]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-hsw1/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-priority:
    - shard-apl:          [TIMEOUT][56] ([i915#1635] / [i915#1958]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-apl7/igt@gem_exec_whisper@basic-contexts-priority.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-apl8/igt@gem_exec_whisper@basic-contexts-priority.html

  * igt@gem_exec_whisper@basic-fds:
    - shard-iclb:         [TIMEOUT][58] ([i915#1958]) -> [PASS][59] +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-iclb1/igt@gem_exec_whisper@basic-fds.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-iclb6/igt@gem_exec_whisper@basic-fds.html

  * igt@gem_exec_whisper@basic-normal:
    - shard-glk:          [TIMEOUT][60] ([i915#1958]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-glk2/igt@gem_exec_whisper@basic-normal.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-glk3/igt@gem_exec_whisper@basic-normal.html

  * igt@i915_selftest@mock@contexts:
    - shard-apl:          [INCOMPLETE][62] ([i915#1635] / [i915#2278]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-apl6/igt@i915_selftest@mock@contexts.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-apl3/igt@i915_selftest@mock@contexts.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [INCOMPLETE][64] ([i915#155]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [DMESG-FAIL][66] ([i915#118] / [i915#95]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-glk6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:
    - shard-kbl:          [FAIL][68] ([i915#54]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
    - shard-apl:          [FAIL][70] ([i915#1635] / [i915#54]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
    - shard-glk:          [FAIL][72] ([i915#54]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-glk5/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-glk1/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][74] ([i915#1982]) -> [PASS][75] +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-hsw6/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-hsw2/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][76] ([i915#1982]) -> [PASS][77] +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-kbl4/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-dp1.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-kbl2/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:
    - shard-glk:          [FAIL][78] ([i915#79]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][80] ([i915#180]) -> [PASS][81] +12 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][82] ([fdo#109441]) -> [PASS][83] +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_universal_plane@universal-plane-pipe-c-sanity:
    - shard-tglb:         [DMESG-WARN][84] ([i915#1982]) -> [PASS][85] +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-tglb7/igt@kms_universal_plane@universal-plane-pipe-c-sanity.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-tglb3/igt@kms_universal_plane@universal-plane-pipe-c-sanity.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-hsw:          [FAIL][86] ([i915#2283]) -> ([FAIL][87], [FAIL][88]) ([i915#1436] / [i915#2283])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-hsw2/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-hsw2/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-hsw6/igt@runner@aborted.html
    - shard-apl:          [FAIL][89] ([i915#1635]) -> [FAIL][90] ([fdo#109271] / [i915#1635] / [i915#716])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-apl6/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-apl7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2278]: https://gitlab.freedesktop.org/drm/intel/issues/2278
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5774 -> IGTPW_4914

  CI-20190529: 20190529
  CI_DRM_8937: 78b090a913c972368c81f05352a532590200cc89 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4914: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/index.html
  IGT_5774: 2a5db9f60241383272aeec176e1b97b3f487209f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/index.html

--===============2917573116214987857==
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
<tr><td><b>Series:</b></td><td>tests/core_hotunplug: Fixes and enhancements (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/79671/">https://patchwork.freedesktop.org/series/79671/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5774_full -&gt; IGTPW_4914_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4914_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4914_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4914_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@core_hotunplug@hotrebind-lateclose} (NEW):</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-snb2/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-iclb3/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-tglb7/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-WARN</a></p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-glk6/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></p>
</li>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-hsw2/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-kbl1/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@core_hotunplug@unbind-rebind} (NEW):</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-hsw6/igt@core_hotunplug@unbind-rebind.html">WARN</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-tglb3/igt@gem_render_copy@linear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-tglb7/igt@gem_render_copy@linear.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_5774_full and IGTPW_4914_full:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 6 fail(s)</li>
<li>Exec time: [6.13, 17.39] s</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>Statuses : 6 pass(s) 1 warn(s)</li>
<li>Exec time: [0.39, 1.96] s</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>Statuses : 6 pass(s) 1 warn(s)</li>
<li>Exec time: [0.38, 1.91] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4914_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-tglb8/igt@gem_exec_reloc@basic-concurrent0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-tglb1/igt@gem_exec_reloc@basic-concurrent0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-kbl2/igt@gem_exec_reloc@basic-concurrent0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-kbl4/igt@gem_exec_reloc@basic-concurrent0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-iclb8/igt@gem_exec_whisper@basic-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-iclb5/igt@gem_exec_whisper@basic-forked.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-glk9/igt@gem_exec_whisper@basic-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-glk6/igt@gem_exec_whisper@basic-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-glk3/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-glk9/igt@gem_exec_whisper@basic-queues-forked-all.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +4 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-apl1/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-apl2/igt@gem_exec_whisper@basic-queues-forked-all.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-apl2/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-apl7/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-iclb2/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-iclb3/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1899">i915#1899</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@reg-read-ioctl:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-kbl4/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-kbl2/igt@i915_pm_rpm@reg-read-ioctl.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@contexts:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-hsw2/igt@i915_selftest@mock@contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-hsw6/igt@i915_selftest@mock@contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2278">i915#2278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-glk8/igt@kms_frontbuffer_tracking@fbc-badstride.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-glk1/igt@kms_frontbuffer_tracking@fbc-badstride.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-apl1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-apl7/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-iclb1/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-kbl7/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-kbl4/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-query-busy-hang:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-apl4/igt@kms_vblank@pipe-a-query-busy-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-apl1/igt@kms_vblank@pipe-a-query-busy-hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-apl3/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-apl8/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-hsw1/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-apl7/igt@gem_exec_whisper@basic-contexts-priority.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-apl8/igt@gem_exec_whisper@basic-contexts-priority.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-iclb1/igt@gem_exec_whisper@basic-fds.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-iclb6/igt@gem_exec_whisper@basic-fds.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-normal:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-glk2/igt@gem_exec_whisper@basic-normal.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-glk3/igt@gem_exec_whisper@basic-normal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@contexts:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-apl6/igt@i915_selftest@mock@contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2278">i915#2278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-apl3/igt@i915_selftest@mock@contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-glk6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-glk5/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-glk1/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-hsw6/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-hsw2/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-kbl4/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-kbl2/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-dp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-c-sanity:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-tglb7/igt@kms_universal_plane@universal-plane-pipe-c-sanity.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-tglb3/igt@kms_universal_plane@universal-plane-pipe-c-sanity.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-hsw2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-hsw2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-hsw6/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5774/shard-apl6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/shard-apl7/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5774 -&gt; IGTPW_4914</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8937: 78b090a913c972368c81f05352a532590200cc89 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4914: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4914/index.html<br />
  IGT_5774: 2a5db9f60241383272aeec176e1b97b3f487209f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============2917573116214987857==--

--===============1620888939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1620888939==--
