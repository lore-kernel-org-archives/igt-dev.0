Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 20 Jul 2020 17:59:22 -0000
Message-ID: <159526796256.13114.11493583787507593074@emeril.freedesktop.org>
References: <20200720152045.10787-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200720152045.10787-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fkms=3A_Add_support_for_display_with_=28rev10=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0139776672=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0139776672==
Content-Type: multipart/alternative;
 boundary="===============1349207274751653008=="

--===============1349207274751653008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_kms: Add support for display with (rev10)
URL   : https://patchwork.freedesktop.org/series/78482/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5741_full -> IGTPW_4781_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4781_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4781_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4781_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge:
    - shard-iclb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-iclb1/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-iclb6/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html

  * igt@perf_pmu@enable-race@rcs0:
    - shard-tglb:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-tglb5/igt@perf_pmu@enable-race@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-tglb5/igt@perf_pmu@enable-race@rcs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_4781_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@throttle:
    - shard-hsw:          [PASS][5] -> [TIMEOUT][6] ([i915#1958] / [i915#2119]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-hsw6/igt@gem_eio@throttle.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-hsw4/igt@gem_eio@throttle.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#118] / [i915#95]) +5 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-glk4/igt@gem_exec_whisper@basic-queues-forked-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-glk5/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#1436] / [i915#1635] / [i915#716])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-apl4/igt@gen9_exec_parse@allowed-all.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-apl2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [PASS][11] -> [FAIL][12] ([i915#1899])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-iclb4/igt@i915_pm_dc@dc5-psr.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-iclb4/igt@i915_pm_dc@dc5-psr.html
    - shard-tglb:         [PASS][13] -> [FAIL][14] ([i915#1899])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-tglb3/igt@i915_pm_dc@dc5-psr.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-tglb8/igt@i915_pm_dc@dc5-psr.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#129])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-kbl1/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-kbl7/igt@kms_color@pipe-a-ctm-blue-to-red.html
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#129] / [i915#1635])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-apl2/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-apl6/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#1982])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-glk3/igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-toggle:
    - shard-iclb:         [PASS][21] -> [DMESG-WARN][22] ([i915#1226])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-iclb5/igt@kms_cursor_legacy@short-flip-after-cursor-toggle.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-iclb6/igt@kms_cursor_legacy@short-flip-after-cursor-toggle.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#52] / [i915#54]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-iclb6/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-iclb6/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#52] / [i915#54]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-glk4/igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-glk8/igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#79])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp1:
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#79])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-kbl7/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-kbl6/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [PASS][31] -> [INCOMPLETE][32] ([i915#2055])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-hsw7/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#49])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-tglb:         [PASS][35] -> [DMESG-WARN][36] ([i915#1982]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180]) +6 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][39] -> [FAIL][40] ([i915#173])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-iclb2/igt@kms_psr@no_drrs.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109441]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-iclb2/igt@kms_psr@psr2_basic.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-iclb7/igt@kms_psr@psr2_basic.html

  * igt@kms_vblank@pipe-c-query-busy:
    - shard-apl:          [PASS][43] -> [DMESG-WARN][44] ([i915#1635] / [i915#1982])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-apl7/igt@kms_vblank@pipe-c-query-busy.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-apl3/igt@kms_vblank@pipe-c-query-busy.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-tglb:         [PASS][45] -> [INCOMPLETE][46] ([i915#1602] / [i915#1887] / [i915#456])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-tglb5/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-tglb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [FAIL][47] ([i915#1930]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-glk6/igt@gem_exec_reloc@basic-concurrent0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-glk2/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_schedule@smoketest-all:
    - shard-glk:          [DMESG-WARN][49] ([i915#118] / [i915#95]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-glk5/igt@gem_exec_schedule@smoketest-all.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-glk3/igt@gem_exec_schedule@smoketest-all.html

  * igt@kms_addfb_basic@invalid-set-prop:
    - shard-tglb:         [DMESG-WARN][51] ([i915#402]) -> [PASS][52] +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-tglb2/igt@kms_addfb_basic@invalid-set-prop.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-tglb3/igt@kms_addfb_basic@invalid-set-prop.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-glk:          [DMESG-FAIL][53] ([i915#118] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-glk5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:
    - shard-apl:          [FAIL][55] ([i915#1635] / [i915#79]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-apl1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +7 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-tglb:         [DMESG-WARN][59] ([i915#1982]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_lease@multimaster-lease:
    - shard-hsw:          [TIMEOUT][61] ([i915#1958] / [i915#2119]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-hsw6/igt@kms_lease@multimaster-lease.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-hsw7/igt@kms_lease@multimaster-lease.html
    - shard-snb:          [TIMEOUT][63] ([i915#1958] / [i915#2119]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-snb4/igt@kms_lease@multimaster-lease.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-snb5/igt@kms_lease@multimaster-lease.html

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-x:
    - shard-hsw:          [INCOMPLETE][65] -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-hsw1/igt@kms_plane_multiple@atomic-pipe-c-tiling-x.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-hsw4/igt@kms_plane_multiple@atomic-pipe-c-tiling-x.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][67] ([fdo#109441]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [TIMEOUT][69] ([i915#1958] / [i915#2119]) -> [FAIL][70] ([i915#1930])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-snb4/igt@gem_exec_reloc@basic-concurrent16.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-snb4/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         [SKIP][71] ([fdo#109278] / [fdo#112010] / [i915#1149]) -> [SKIP][72] ([fdo#109278] / [i915#1149]) +7 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-iclb5/igt@kms_color@pipe-d-ctm-0-25.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-iclb2/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-a-gamma:
    - shard-hsw:          [SKIP][73] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][74] ([i915#1958] / [i915#2119])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-hsw2/igt@kms_color_chamelium@pipe-a-gamma.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-hsw4/igt@kms_color_chamelium@pipe-a-gamma.html

  * igt@kms_content_protection@uevent:
    - shard-hsw:          [SKIP][75] ([fdo#109271]) -> [TIMEOUT][76] ([i915#1958] / [i915#2119]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-hsw2/igt@kms_content_protection@uevent.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-hsw4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding:
    - shard-iclb:         [SKIP][77] ([fdo#109279]) -> [SKIP][78] ([fdo#109278] / [fdo#109279]) +24 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-iclb4/igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
    - shard-iclb:         [SKIP][79] ([fdo#109278] / [fdo#112010] / [i915#508]) -> [SKIP][80] ([fdo#109278])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-iclb4/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-iclb:         [SKIP][81] ([fdo#109274]) -> [SKIP][82] ([fdo#109274] / [fdo#109278]) +25 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-iclb4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-iclb6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@pipe-d-single-move:
    - shard-iclb:         [SKIP][83] ([fdo#109278] / [fdo#112010]) -> [SKIP][84] ([fdo#109278]) +83 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-iclb7/igt@kms_cursor_legacy@pipe-d-single-move.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-iclb1/igt@kms_cursor_legacy@pipe-d-single-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-snb:          [TIMEOUT][85] ([i915#1958] / [i915#2119]) -> [SKIP][86] ([fdo#109271])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-snb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-tglb:         [SKIP][87] ([fdo#112025] / [fdo#112054]) -> [SKIP][88] ([fdo#112054])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-tglb:         [SKIP][89] ([fdo#111825] / [fdo#112015]) -> [SKIP][90] ([fdo#111825])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-tglb2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-tglb7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][91], [FAIL][92], [FAIL][93]) ([i915#1784] / [i915#2110]) -> [FAIL][94] ([i915#1436] / [i915#1784] / [i915#2110])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-kbl6/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-kbl2/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-kbl3/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-kbl4/igt@runner@aborted.html
    - shard-apl:          ([FAIL][95], [FAIL][96], [FAIL][97]) ([i915#1610] / [i915#1635] / [i915#2110]) -> ([FAIL][98], [FAIL][99]) ([fdo#109271] / [i915#1635] / [i915#2110] / [i915#716])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-apl1/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-apl6/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-apl4/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-apl3/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-apl2/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][100], [FAIL][101], [FAIL][102], [FAIL][103]) ([i915#1764] / [i915#2110]) -> ([FAIL][104], [FAIL][105]) ([i915#1602] / [i915#2110])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-tglb7/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-tglb2/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-tglb8/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-tglb3/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-tglb1/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-tglb3/igt@runner@aborted.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112010]: https://bugs.freedesktop.org/show_bug.cgi?id=112010
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112025]: https://bugs.freedesktop.org/show_bug.cgi?id=112025
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#1764]: https://gitlab.freedesktop.org/drm/intel/issues/1764
  [i915#1784]: https://gitlab.freedesktop.org/drm/intel/issues/1784
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#508]: https://gitlab.freedesktop.org/drm/intel/issues/508
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5741 -> IGTPW_4781

  CI-20190529: 20190529
  CI_DRM_8766: 947ce595ea05b4baaea060a7e018cc3f49eaf413 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4781: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/index.html
  IGT_5741: 96a8c8c1371995b73916989880b29b01f5657ba3 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/index.html

--===============1349207274751653008==
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
<tr><td><b>Series:</b></td><td>lib/igt_kms: Add support for display with (r=
ev10)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/78482/">https://patchwork.freedesktop.org/series/78482/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_4781/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_4781/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5741_full -&gt; IGTPW_4781_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4781_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_4781_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4781=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-iclb1/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_4781/shard-iclb6/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.htm=
l">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@enable-race@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-tglb5/igt@perf_pmu@enable-race@rcs0.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-tglb5/ig=
t@perf_pmu@enable-race@rcs0.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4781_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_eio@throttle:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-hsw6/igt@gem_eio@throttle.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-hsw4/igt@gem_eio@t=
hrottle.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/1958">i915#1958</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2119">i915#2119</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-glk4/igt@gem_exec_whisper@basic-queues-forked-all.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/=
shard-glk5/igt@gem_exec_whisper@basic-queues-forked-all.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915#=
95</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-apl4/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-apl2/ig=
t@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5741/shard-iclb4/igt@i915_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-iclb4/igt@i915_p=
m_dc@dc5-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1899">i915#1899</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5741/shard-tglb3/igt@i915_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-tglb8/igt@i915_p=
m_dc@dc5-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1899">i915#1899</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5741/shard-kbl1/igt@kms_color@pipe-a-ctm-blue-to-red.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-kbl=
7/igt@kms_color@pipe-a-ctm-blue-to-red.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/129">i915#129</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5741/shard-apl2/igt@kms_color@pipe-a-ctm-blue-to-red.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-apl=
6/igt@kms_color@pipe-a-ctm-blue-to-red.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/129">i915#129</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-glk3/igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_4781/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-toggle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-iclb5/igt@kms_cursor_legacy@short-flip-after-cursor-toggle.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_4781/shard-iclb6/igt@kms_cursor_legacy@short-flip-after-cursor-toggle.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1226">i915#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-iclb6/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtile=
d.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_4781/shard-iclb6/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtil=
ed.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/52">i915#52</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/54">i915#54</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-glk4/igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4=
781/shard-glk8/igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/52">i915#52=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i915#=
54</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hd=
mi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_4781/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible=
@a-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-kbl7/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/sha=
rd-kbl6/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-=
hsw7/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb=
-draw-render.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_4781/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndsc=
rn-cur-indfb-draw-render.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_4781/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-kbl7/igt=
@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/180">i915#180</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-iclb2/igt@kms_psr@no_drrs.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-iclb1/igt@kms_psr@=
no_drrs.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/173">i915#173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-iclb2/igt@kms_psr@psr2_basic.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-iclb7/igt@kms=
_psr@psr2_basic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-query-busy:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-apl7/igt@kms_vblank@pipe-c-query-busy.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-apl3/i=
gt@kms_vblank@pipe-c-query-busy.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-tglb5/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_4781/shard-tglb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1887">i915#1887</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/456">i915#456</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-glk6/igt@gem_exec_reloc@basic-concurrent0.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1930">i915#1930</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/sh=
ard-glk2/igt@gem_exec_reloc@basic-concurrent0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@smoketest-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-glk5/igt@gem_exec_schedule@smoketest-all.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#11=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915=
#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_47=
81/shard-glk3/igt@gem_exec_schedule@smoketest-all.html">PASS</a> +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-tglb2/igt@kms_addfb_basic@invalid-set-prop.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/402">i915#=
402</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_47=
81/shard-tglb3/igt@kms_addfb_basic@invalid-set-prop.html">PASS</a> +3 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">DMESG-FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#=
118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i9=
15#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
4781/shard-glk5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp=
1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/79">i915#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_4781/shard-apl1/igt@kms_flip@flip-vs-expired-vblank-interrupt=
ible@b-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/=
shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> +7 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-=
wc.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_4781/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-rgb101=
010-draw-mmap-wc.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_lease@multimaster-lease:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5741/shard-hsw6/igt@kms_lease@multimaster-lease.html">TIMEOUT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#211=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781=
/shard-hsw7/igt@kms_lease@multimaster-lease.html">PASS</a> +2 similar issue=
s</p>
</li>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5741/shard-snb4/igt@kms_lease@multimaster-lease.html">TIMEOUT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#211=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781=
/shard-snb5/igt@kms_lease@multimaster-lease.html">PASS</a> +2 similar issue=
s</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-c-tiling-x:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-hsw1/igt@kms_plane_multiple@atomic-pipe-c-tiling-x.html">IN=
COMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_4781/shard-hsw4/igt@kms_plane_multiple@atomic-pipe-c-tiling-x.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/sha=
rd-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> +1 similar issue</=
li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-snb4/igt@gem_exec_reloc@basic-concurrent16.html">TIMEOUT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#19=
58</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">i=
915#2119</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_4781/shard-snb4/igt@gem_exec_reloc@basic-concurrent16.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1930">i915#1930</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-iclb5/igt@kms_color@pipe-d-ctm-0-25.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278">fdo#109278</a> /=
 <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112010">fdo#1120=
10</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i=
915#1149</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_4781/shard-iclb2/igt@kms_color@pipe-d-ctm-0-25.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278">fdo#109278</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149=
</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-gamma:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-hsw2/igt@kms_color_chamelium@pipe-a-gamma.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271=
</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">fd=
o#111827</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_4781/shard-hsw4/igt@kms_color_chamelium@pipe-a-gamma.html">TIMEOUT</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">i915=
#2119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-hsw2/igt@kms_content_protection@uevent.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/sha=
rd-hsw4/igt@kms_content_protection@uevent.html">TIMEOUT</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-iclb4/igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
9">fdo#109279</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_4781/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109279">fdo#109279</a>) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-iclb4/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278"=
>fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D112010">fdo#112010</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/508">i915#508</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_4781/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-64x21=
-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-iclb4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274"=
>fdo#109274</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_4781/shard-iclb6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274=
">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109278">fdo#109278</a>) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-iclb7/igt@kms_cursor_legacy@pipe-d-single-move.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278">fdo#1=
09278</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11201=
0">fdo#112010</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_4781/shard-iclb1/igt@kms_cursor_legacy@pipe-d-single-move.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278">fd=
o#109278</a>) +83 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-sh=
rfb-draw-blt.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1958">i915#1958</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-snb2/igt@kms_frontbuffer_trackin=
g@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112025"=
>fdo#112025</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D112054">fdo#112054</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_4781/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-d-tilin=
g-yf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D112054">fdo#112054</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-tglb2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo=
#111825</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112=
015">fdo#112015</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_4781/shard-tglb7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825=
">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-kbl2/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/s=
hard-kbl3/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1784">i915#1784</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-kbl4/igt@runner@ab=
orted.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1784">i915#1784</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2110">i915#2110</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-apl6/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/s=
hard-apl4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1610">i915#1610</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-apl3/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_4781/shard-apl2/igt@runner@aborted.html">FAIL</a>) (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#21=
10</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i9=
15#716</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5741/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_5741/shard-tglb2/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5741=
/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGT_5741/shard-tglb3/igt@runner@aborted.html">FAIL=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1764">i91=
5#1764</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/211=
0">i915#2110</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_4781/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/shard-tglb3/igt@runner@abor=
ted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2110">i915#2110</a>)</p>
</li>
</ul>
</li>
</ul>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5741 -&gt; IGTPW_4781</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8766: 947ce595ea05b4baaea060a7e018cc3f49eaf413 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_4781: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4781/index.htm=
l<br />
  IGT_5741: 96a8c8c1371995b73916989880b29b01f5657ba3 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============1349207274751653008==--

--===============0139776672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0139776672==--
