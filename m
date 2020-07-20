Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 20 Jul 2020 14:27:34 -0000
Message-ID: <159525525448.13117.8952978507934809330@emeril.freedesktop.org>
References: <20200720114856.31432-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200720114856.31432-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fkms=3A_Add_support_for_display_with_=28rev9=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1762920703=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1762920703==
Content-Type: multipart/alternative;
 boundary="===============4939576818882211675=="

--===============4939576818882211675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_kms: Add support for display with (rev9)
URL   : https://patchwork.freedesktop.org/series/78482/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8766_full -> IGTPW_4779_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4779_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4779_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4779_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@all-pipes-torture-move:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-hsw6/igt@kms_cursor_legacy@all-pipes-torture-move.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-hsw1/igt@kms_cursor_legacy@all-pipes-torture-move.html

  * igt@kms_lease@simple_lease:
    - shard-iclb:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-iclb2/igt@kms_lease@simple_lease.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-iclb5/igt@kms_lease@simple_lease.html
    - shard-glk:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-glk4/igt@kms_lease@simple_lease.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-glk2/igt@kms_lease@simple_lease.html
    - shard-hsw:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-hsw8/igt@kms_lease@simple_lease.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-hsw6/igt@kms_lease@simple_lease.html
    - shard-kbl:          [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-kbl2/igt@kms_lease@simple_lease.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-kbl3/igt@kms_lease@simple_lease.html
    - shard-snb:          [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-snb6/igt@kms_lease@simple_lease.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-snb5/igt@kms_lease@simple_lease.html
    - shard-tglb:         [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-tglb6/igt@kms_lease@simple_lease.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-tglb1/igt@kms_lease@simple_lease.html

  
Known issues
------------

  Here are the changes found in IGTPW_4779_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#1930])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-glk2/igt@gem_exec_reloc@basic-concurrent0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-glk5/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-hsw:          [PASS][17] -> [DMESG-WARN][18] ([i915#1982])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-hsw8/igt@gem_exec_reloc@basic-gtt-cpu-active.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-hsw6/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_schedule@smoketest-all:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#118] / [i915#95]) +4 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-glk3/igt@gem_exec_schedule@smoketest-all.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-glk3/igt@gem_exec_schedule@smoketest-all.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +5 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_module_load@reload:
    - shard-iclb:         [PASS][23] -> [DMESG-WARN][24] ([i915#1982])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-iclb4/igt@i915_module_load@reload.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-iclb6/igt@i915_module_load@reload.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglb:         [PASS][25] -> [DMESG-WARN][26] ([i915#402]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-tglb6/igt@i915_module_load@reload-with-fault-injection.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-tglb3/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@mock@requests:
    - shard-apl:          [PASS][27] -> [INCOMPLETE][28] ([i915#1635] / [i915#2110])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-apl3/igt@i915_selftest@mock@requests.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-apl4/igt@i915_selftest@mock@requests.html
    - shard-snb:          [PASS][29] -> [INCOMPLETE][30] ([i915#2110] / [i915#82])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-snb6/igt@i915_selftest@mock@requests.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-snb6/igt@i915_selftest@mock@requests.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x42-offscreen:
    - shard-hsw:          [PASS][31] -> [TIMEOUT][32] ([i915#1958] / [i915#2119])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-hsw4/igt@kms_cursor_crc@pipe-c-cursor-128x42-offscreen.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-hsw2/igt@kms_cursor_crc@pipe-c-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-random:
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#54])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#1635] / [i915#54])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html

  * igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge:
    - shard-glk:          [PASS][37] -> [DMESG-WARN][38] ([i915#1982])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-glk4/igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-glk7/igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-tglb:         [PASS][39] -> [DMESG-FAIL][40] ([i915#402])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-tglb1/igt@kms_fbcon_fbt@fbc-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-tglb2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-badstride:
    - shard-tglb:         [PASS][41] -> [DMESG-WARN][42] ([i915#1982]) +4 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-badstride.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-badstride.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][43] -> [SKIP][44] ([i915#433])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_lease@simple_lease:
    - shard-apl:          [PASS][45] -> [FAIL][46] ([i915#1635])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-apl4/igt@kms_lease@simple_lease.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-apl7/igt@kms_lease@simple_lease.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109441]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][49] -> [FAIL][50] ([i915#31])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-kbl1/igt@kms_setmode@basic.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-kbl3/igt@kms_setmode@basic.html

  * igt@syncobj_wait@wait-any-snapshot:
    - shard-snb:          [PASS][51] -> [TIMEOUT][52] ([i915#1958] / [i915#2119])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-snb1/igt@syncobj_wait@wait-any-snapshot.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-snb4/igt@syncobj_wait@wait-any-snapshot.html

  
#### Possible fixes ####

  * igt@gem_exec_params@sol-reset-not-gen7:
    - shard-snb:          [TIMEOUT][53] ([i915#1958] / [i915#2119]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-snb4/igt@gem_exec_params@sol-reset-not-gen7.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-snb1/igt@gem_exec_params@sol-reset-not-gen7.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][55] ([i915#454]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-iclb5/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][59] ([i915#72]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-hsw:          [FAIL][61] ([i915#57]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][63] ([i915#2055]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-tglb:         [DMESG-WARN][65] ([i915#402]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-glk:          [FAIL][67] ([i915#49]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence:
    - shard-tglb:         [DMESG-WARN][69] ([i915#1982]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-tglb1/igt@kms_frontbuffer_tracking@psr-farfromfence.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-tglb8/igt@kms_frontbuffer_tracking@psr-farfromfence.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][71] ([fdo#109441]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-iclb6/igt@kms_psr@psr2_cursor_plane_onoff.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_vblank@pipe-c-wait-idle:
    - shard-apl:          [DMESG-WARN][73] ([i915#1635] / [i915#1982]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-apl7/igt@kms_vblank@pipe-c-wait-idle.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-apl4/igt@kms_vblank@pipe-c-wait-idle.html

  * igt@perf@polling-parameterized:
    - shard-tglb:         [FAIL][75] ([i915#1542]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-tglb7/igt@perf@polling-parameterized.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-tglb6/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@gem_exec_params@sol-reset-not-gen7:
    - shard-hsw:          [TIMEOUT][77] ([i915#1958] / [i915#2119]) -> [SKIP][78] ([fdo#109271]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-hsw2/igt@gem_exec_params@sol-reset-not-gen7.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-hsw6/igt@gem_exec_params@sol-reset-not-gen7.html

  * igt@gem_exec_reloc@basic-spin-others@vcs0:
    - shard-snb:          [WARN][79] ([i915#2036]) -> [WARN][80] ([i915#2021])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-snb5/igt@gem_exec_reloc@basic-spin-others@vcs0.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-snb1/igt@gem_exec_reloc@basic-spin-others@vcs0.html

  * igt@kms_chamelium@hdmi-aspect-ratio:
    - shard-hsw:          [SKIP][81] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][82] ([i915#1958] / [i915#2119])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-hsw8/igt@kms_chamelium@hdmi-aspect-ratio.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-hsw2/igt@kms_chamelium@hdmi-aspect-ratio.html
    - shard-snb:          [SKIP][83] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][84] ([i915#1958] / [i915#2119])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-snb2/igt@kms_chamelium@hdmi-aspect-ratio.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-snb4/igt@kms_chamelium@hdmi-aspect-ratio.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         [SKIP][85] ([fdo#109278] / [fdo#112010] / [i915#1149]) -> [SKIP][86] ([fdo#109278] / [i915#1149]) +9 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-iclb2/igt@kms_color@pipe-d-ctm-0-25.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-iclb5/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-kbl:          [TIMEOUT][87] ([i915#1319] / [i915#2119]) -> [TIMEOUT][88] ([i915#1319] / [i915#1958] / [i915#2119])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-kbl2/igt@kms_content_protection@atomic-dpms.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-kbl4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding:
    - shard-iclb:         [SKIP][89] ([fdo#109279]) -> [SKIP][90] ([fdo#109278] / [fdo#109279]) +23 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-iclb6/igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x42-offscreen:
    - shard-snb:          [SKIP][91] ([fdo#109271]) -> [TIMEOUT][92] ([i915#1958] / [i915#2119]) +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-snb4/igt@kms_cursor_crc@pipe-c-cursor-128x42-offscreen.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-snb4/igt@kms_cursor_crc@pipe-c-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
    - shard-iclb:         [SKIP][93] ([fdo#109278] / [fdo#112010] / [i915#508]) -> [SKIP][94] ([fdo#109278])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-iclb4/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-iclb6/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-iclb:         [SKIP][95] ([fdo#109274]) -> [SKIP][96] ([fdo#109274] / [fdo#109278]) +22 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-iclb5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-iclb5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@pipe-d-single-move:
    - shard-iclb:         [SKIP][97] ([fdo#109278] / [fdo#112010]) -> [SKIP][98] ([fdo#109278]) +72 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-iclb6/igt@kms_cursor_legacy@pipe-d-single-move.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-iclb5/igt@kms_cursor_legacy@pipe-d-single-move.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][99] ([i915#1226]) -> [SKIP][100] ([fdo#109349])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-snb:          [TIMEOUT][101] ([i915#1958] / [i915#2119]) -> [SKIP][102] ([fdo#109271]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-snb4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-snb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-hsw:          [SKIP][103] ([fdo#109271]) -> [TIMEOUT][104] ([i915#1958] / [i915#2119]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-hsw8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-hsw2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-tglb:         [SKIP][105] ([fdo#112025] / [fdo#112054]) -> [SKIP][106] ([fdo#112054])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-tglb1/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-tglb:         [SKIP][107] ([fdo#111825] / [fdo#112015]) -> [SKIP][108] ([fdo#111825])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-tglb3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-tglb3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@runner@aborted:
    - shard-apl:          [FAIL][109] ([i915#1610] / [i915#1635] / [i915#2110]) -> [FAIL][110] ([i915#1635] / [i915#2110])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-apl6/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-apl4/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][111], [FAIL][112]) ([i915#2110]) -> [FAIL][113] ([i915#1764] / [i915#2110])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-tglb8/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-tglb5/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-tglb3/igt@runner@aborted.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
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
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1764]: https://gitlab.freedesktop.org/drm/intel/issues/1764
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2021]: https://gitlab.freedesktop.org/drm/intel/issues/2021
  [i915#2036]: https://gitlab.freedesktop.org/drm/intel/issues/2036
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#508]: https://gitlab.freedesktop.org/drm/intel/issues/508
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5740 -> IGTPW_4779
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8766: 947ce595ea05b4baaea060a7e018cc3f49eaf413 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4779: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/index.html
  IGT_5740: 6663e3ab5f77add7077711c2b649caf2bd7903c4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/index.html

--===============4939576818882211675==
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
<tr><td><b>Series:</b></td><td>lib/igt_kms: Add support for display with (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/78482/">https://patchwork.freedesktop.org/series/78482/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8766_full -&gt; IGTPW_4779_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4779_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4779_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4779_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@all-pipes-torture-move:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-hsw6/igt@kms_cursor_legacy@all-pipes-torture-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-hsw1/igt@kms_cursor_legacy@all-pipes-torture-move.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple_lease:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-iclb2/igt@kms_lease@simple_lease.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-iclb5/igt@kms_lease@simple_lease.html">FAIL</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-glk4/igt@kms_lease@simple_lease.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-glk2/igt@kms_lease@simple_lease.html">FAIL</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-hsw8/igt@kms_lease@simple_lease.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-hsw6/igt@kms_lease@simple_lease.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-kbl2/igt@kms_lease@simple_lease.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-kbl3/igt@kms_lease@simple_lease.html">FAIL</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-snb6/igt@kms_lease@simple_lease.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-snb5/igt@kms_lease@simple_lease.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-tglb6/igt@kms_lease@simple_lease.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-tglb1/igt@kms_lease@simple_lease.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4779_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-glk2/igt@gem_exec_reloc@basic-concurrent0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-glk5/igt@gem_exec_reloc@basic-concurrent0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1930">i915#1930</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-hsw8/igt@gem_exec_reloc@basic-gtt-cpu-active.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-hsw6/igt@gem_exec_reloc@basic-gtt-cpu-active.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@smoketest-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-glk3/igt@gem_exec_schedule@smoketest-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-glk3/igt@gem_exec_schedule@smoketest-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-iclb4/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-iclb6/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-tglb6/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-tglb3/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@requests:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-apl3/igt@i915_selftest@mock@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-apl4/igt@i915_selftest@mock@requests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-snb6/igt@i915_selftest@mock@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-snb6/igt@i915_selftest@mock@requests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-128x42-offscreen:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-hsw4/igt@kms_cursor_crc@pipe-c-cursor-128x42-offscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-hsw2/igt@kms_cursor_crc@pipe-c-cursor-128x42-offscreen.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-64x64-random:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-glk4/igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-glk7/igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-tglb1/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-tglb2/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-badstride:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-badstride.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-badstride.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple_lease:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-apl4/igt@kms_lease@simple_lease.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-apl7/igt@kms_lease@simple_lease.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-kbl1/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-kbl3/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>)</li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@wait-any-snapshot:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-snb1/igt@syncobj_wait@wait-any-snapshot.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-snb4/igt@syncobj_wait@wait-any-snapshot.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_params@sol-reset-not-gen7:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-snb4/igt@gem_exec_params@sol-reset-not-gen7.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-snb1/igt@gem_exec_params@sol-reset-not-gen7.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-iclb5/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/72">i915#72</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/57">i915#57</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-farfromfence:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-tglb1/igt@kms_frontbuffer_tracking@psr-farfromfence.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-tglb8/igt@kms_frontbuffer_tracking@psr-farfromfence.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-iclb6/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-idle:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-apl7/igt@kms_vblank@pipe-c-wait-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-apl4/igt@kms_vblank@pipe-c-wait-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-tglb7/igt@perf@polling-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-tglb6/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_params@sol-reset-not-gen7:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-hsw2/igt@gem_exec_params@sol-reset-not-gen7.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-hsw6/igt@gem_exec_params@sol-reset-not-gen7.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-spin-others@vcs0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-snb5/igt@gem_exec_reloc@basic-spin-others@vcs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2036">i915#2036</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-snb1/igt@gem_exec_reloc@basic-spin-others@vcs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2021">i915#2021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-aspect-ratio:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-hsw8/igt@kms_chamelium@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-hsw2/igt@kms_chamelium@hdmi-aspect-ratio.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-snb2/igt@kms_chamelium@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-snb4/igt@kms_chamelium@hdmi-aspect-ratio.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-iclb2/igt@kms_color@pipe-d-ctm-0-25.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=112010">fdo#112010</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-iclb5/igt@kms_color@pipe-d-ctm-0-25.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-kbl2/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-kbl4/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-iclb6/igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a>) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-128x42-offscreen:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-snb4/igt@kms_cursor_crc@pipe-c-cursor-128x42-offscreen.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-snb4/igt@kms_cursor_crc@pipe-c-cursor-128x42-offscreen.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-iclb4/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=112010">fdo#112010</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/508">i915#508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-iclb6/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-iclb5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-iclb5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-iclb6/igt@kms_cursor_legacy@pipe-d-single-move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=112010">fdo#112010</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-iclb5/igt@kms_cursor_legacy@pipe-d-single-move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +72 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109349">fdo#109349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-snb4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-snb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-hsw8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-hsw2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112025">fdo#112025</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=112054">fdo#112054</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-tglb1/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112054">fdo#112054</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-tglb3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=112015">fdo#112015</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-tglb3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-apl6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-apl4/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-tglb5/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-tglb3/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1764">i915#1764</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>)</p>
</li>
</ul>
</li>
</ul>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5740 -&gt; IGTPW_4779</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8766: 947ce595ea05b4baaea060a7e018cc3f49eaf413 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4779: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/index.html<br />
  IGT_5740: 6663e3ab5f77add7077711c2b649caf2bd7903c4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============4939576818882211675==--

--===============1762920703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1762920703==--
