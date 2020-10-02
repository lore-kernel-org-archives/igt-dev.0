Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 02 Oct 2020 14:29:06 -0000
Message-ID: <160164894652.3606.14722441361039945145@emeril.freedesktop.org>
References: <20201002105937.12114-1-dominik.grzegorzek@intel.com>
In-Reply-To: <20201002105937.12114-1-dominik.grzegorzek@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdG9vbHM6?=
 =?utf-8?q?_Remove_libdrm_dependency?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2095840454=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2095840454==
Content-Type: multipart/alternative;
 boundary="===============7781013405772658478=="

--===============7781013405772658478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools: Remove libdrm dependency
URL   : https://patchwork.freedesktop.org/series/82331/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5797_full -> IGTPW_5037_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5037_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5037_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5037_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_schedule@preempt-other@bcs0:
    - shard-iclb:         [PASS][1] -> [FAIL][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-iclb8/igt@gem_exec_schedule@preempt-other@bcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-iclb1/igt@gem_exec_schedule@preempt-other@bcs0.html

  * igt@gem_exec_schedule@preempt-other@vecs0:
    - shard-iclb:         [PASS][3] -> [DMESG-WARN][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-iclb8/igt@gem_exec_schedule@preempt-other@vecs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-iclb1/igt@gem_exec_schedule@preempt-other@vecs0.html

  * igt@kms_vblank@pipe-c-wait-busy:
    - shard-iclb:         [PASS][5] -> [TIMEOUT][6] +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-iclb8/igt@kms_vblank@pipe-c-wait-busy.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-iclb1/igt@kms_vblank@pipe-c-wait-busy.html

  
#### Warnings ####

  * igt@kms_chamelium@hdmi-frame-dump:
    - shard-iclb:         [SKIP][7] ([fdo#109284] / [fdo#111827]) -> [TIMEOUT][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-iclb4/igt@kms_chamelium@hdmi-frame-dump.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-iclb1/igt@kms_chamelium@hdmi-frame-dump.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-iclb:         [SKIP][9] ([fdo#109280]) -> [TIMEOUT][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  
Known issues
------------

  Here are the changes found in IGTPW_5037_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@vecs0:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#2389]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-glk3/igt@gem_exec_reloc@basic-many-active@vecs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-glk8/igt@gem_exec_reloc@basic-many-active@vecs0.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-glk:          [PASS][13] -> [DMESG-WARN][14] ([i915#118] / [i915#95]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-glk5/igt@gem_exec_whisper@basic-fds-forked.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-glk7/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#454])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#1635] / [i915#1982]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-apl2/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-apl8/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#1982]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-glk3/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-glk4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x256-random:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#1635] / [i915#54])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-256x256-random.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-256x256-random.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#72])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-tglb:         [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +4 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-tglb6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-tglb5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:
    - shard-iclb:         [PASS][27] -> [FAIL][28] ([i915#49])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][29] -> [SKIP][30] ([i915#433])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-iclb6/igt@kms_psr@psr2_cursor_plane_move.html

  
#### Possible fixes ####

  * igt@gem_mmap_offset@blt-coherency:
    - shard-apl:          [FAIL][33] ([i915#1635]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-apl3/igt@gem_mmap_offset@blt-coherency.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-apl1/igt@gem_mmap_offset@blt-coherency.html

  * igt@kms_atomic_transition@2x-modeset-transitions-nonblocking:
    - shard-hsw:          [INCOMPLETE][35] -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-hsw1/igt@kms_atomic_transition@2x-modeset-transitions-nonblocking.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-hsw7/igt@kms_atomic_transition@2x-modeset-transitions-nonblocking.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [FAIL][37] ([i915#54]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
    - shard-apl:          [FAIL][39] ([i915#1635] / [i915#54]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [FAIL][41] ([i915#96]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][43] ([i915#1982]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-hsw6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-vga1-hdmi-a1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-hsw1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:
    - shard-glk:          [FAIL][45] ([i915#79]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-glk:          [FAIL][47] ([i915#49]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [DMESG-WARN][49] ([i915#1982]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][51] ([fdo#109441]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-iclb5/igt@kms_psr@psr2_primary_page_flip.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][53] ([i915#1635] / [i915#31]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-apl4/igt@kms_setmode@basic.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-apl3/igt@kms_setmode@basic.html

  * igt@prime_vgem@sync@bcs0:
    - shard-tglb:         [INCOMPLETE][55] ([i915#409]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-tglb6/igt@prime_vgem@sync@bcs0.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-tglb7/igt@prime_vgem@sync@bcs0.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][57] ([i915#1904]) -> [DMESG-WARN][58] ([i915#2411])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
    - shard-iclb:         [SKIP][59] ([i915#658]) -> [SKIP][60] ([i915#588])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-iclb:         [SKIP][61] ([fdo#109293] / [fdo#109506]) -> [SKIP][62] ([i915#579])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-iclb2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-iclb1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [TIMEOUT][63] ([i915#1319] / [i915#1635]) -> [FAIL][64] ([fdo#110321] / [fdo#110336] / [i915#1635])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-apl7/igt@kms_content_protection@legacy.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-apl1/igt@kms_content_protection@legacy.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-apl:          [DMESG-FAIL][65] ([fdo#108145] / [i915#1635] / [i915#1982]) -> [FAIL][66] ([fdo#108145] / [i915#1635] / [i915#265])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#409]: https://gitlab.freedesktop.org/drm/intel/issues/409
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5797 -> IGTPW_5037

  CI-20190529: 20190529
  CI_DRM_9091: 1e20b6560332c04881daeeac61536a9ae9a4d539 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5037: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/index.html
  IGT_5797: 1a7ef7eb5e99c9a8f4ffbc13cdae399a01a9aa12 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/index.html

--===============7781013405772658478==
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
<tr><td><b>Series:</b></td><td>tools: Remove libdrm dependency</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82331/">https://patchwork.freedesktop.org/series/82331/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5797_full -&gt; IGTPW_5037_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5037_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5037_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5037_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_schedule@preempt-other@bcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-iclb8/igt@gem_exec_schedule@preempt-other@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-iclb1/igt@gem_exec_schedule@preempt-other@bcs0.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-other@vecs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-iclb8/igt@gem_exec_schedule@preempt-other@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-iclb1/igt@gem_exec_schedule@preempt-other@vecs0.html">DMESG-WARN</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-busy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-iclb8/igt@kms_vblank@pipe-c-wait-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-iclb1/igt@kms_vblank@pipe-c-wait-busy.html">TIMEOUT</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_chamelium@hdmi-frame-dump:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-iclb4/igt@kms_chamelium@hdmi-frame-dump.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-iclb1/igt@kms_chamelium@hdmi-frame-dump.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5037_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-glk3/igt@gem_exec_reloc@basic-many-active@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-glk8/igt@gem_exec_reloc@basic-many-active@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-glk5/igt@gem_exec_whisper@basic-fds-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-glk7/igt@gem_exec_whisper@basic-fds-forked.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-iclb2/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-apl2/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-apl8/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-glk3/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-glk4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-256x256-random:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-256x256-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-256x256-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/72">i915#72</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-tglb6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-tglb5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-iclb6/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_mmap_offset@blt-coherency:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-apl3/igt@gem_mmap_offset@blt-coherency.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-apl1/igt@gem_mmap_offset@blt-coherency.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@2x-modeset-transitions-nonblocking:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-hsw1/igt@kms_atomic_transition@2x-modeset-transitions-nonblocking.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-hsw7/igt@kms_atomic_transition@2x-modeset-transitions-nonblocking.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/96">i915#96</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-hsw6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-hsw1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-stridechange.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-stridechange.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-iclb5/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-apl4/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-apl3/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@sync@bcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-tglb6/igt@prime_vgem@sync@bcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/409">i915#409</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-tglb7/igt@prime_vgem@sync@bcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1904">i915#1904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-iclb2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109293">fdo#109293</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109506">fdo#109506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-iclb1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-apl7/igt@kms_content_protection@legacy.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-apl1/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=110336">fdo#110336</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5797/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5797 -&gt; IGTPW_5037</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9091: 1e20b6560332c04881daeeac61536a9ae9a4d539 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5037: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5037/index.html<br />
  IGT_5797: 1a7ef7eb5e99c9a8f4ffbc13cdae399a01a9aa12 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============7781013405772658478==--

--===============2095840454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2095840454==--
