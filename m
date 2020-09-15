Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 15 Sep 2020 20:23:55 -0000
Message-ID: <160020143523.30600.10659020413558362580@emeril.freedesktop.org>
References: <20200915154725.1195-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200915154725.1195-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/6=5D_tools/intel=5Fdisplay=5Fpoller?=
 =?utf-8?q?=3A_Fix_TILEOFF_vs=2E_LINOFF_for_skl+?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0213885317=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0213885317==
Content-Type: multipart/alternative;
 boundary="===============4375974522431328633=="

--===============4375974522431328633==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/6] tools/intel_display_poller: Fix TILEOFF vs. LINOFF for skl+
URL   : https://patchwork.freedesktop.org/series/81695/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9012_full -> IGTPW_4983_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4983_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4983_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4983_full:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-kbl:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-kbl3/igt@runner@aborted.html
    - shard-iclb:         NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-iclb3/igt@runner@aborted.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-tglb:         [FAIL][3] ([i915#2045] / [i915#2439]) -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-tglb6/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-tglb8/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@core_hotunplug@hotunbind-rebind}:
    - shard-glk:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-glk1/igt@core_hotunplug@hotunbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-glk6/igt@core_hotunplug@hotunbind-rebind.html
    - shard-iclb:         [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-iclb1/igt@core_hotunplug@hotunbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-iclb3/igt@core_hotunplug@hotunbind-rebind.html
    - shard-kbl:          [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-kbl3/igt@core_hotunplug@hotunbind-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-kbl3/igt@core_hotunplug@hotunbind-rebind.html

  
Known issues
------------

  Here are the changes found in IGTPW_4983_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@vcs0:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#2389]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-glk8/igt@gem_exec_reloc@basic-many-active@vcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-glk5/igt@gem_exec_reloc@basic-many-active@vcs0.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-snb:          [PASS][13] -> [INCOMPLETE][14] ([i915#82])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-snb7/igt@gem_fenced_exec_thrash@2-spare-fences.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-snb1/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_workarounds@suspend-resume:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([fdo#103375])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-iclb2/igt@gem_workarounds@suspend-resume.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-iclb8/igt@gem_workarounds@suspend-resume.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-kbl6/igt@i915_suspend@fence-restore-untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-kbl4/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#1635] / [i915#1982])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-apl7/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-apl2/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-hsw:          [PASS][21] -> [FAIL][22] ([i915#2370])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#79])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-kbl3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#1982])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-tglb:         [PASS][27] -> [DMESG-WARN][28] ([i915#1982]) +5 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_prime@basic-crc@first-to-second:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([i915#1836])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-iclb7/igt@kms_prime@basic-crc@first-to-second.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-iclb3/igt@kms_prime@basic-crc@first-to-second.html
    - shard-snb:          [PASS][31] -> [SKIP][32] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-snb7/igt@kms_prime@basic-crc@first-to-second.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-snb6/igt@kms_prime@basic-crc@first-to-second.html
    - shard-hsw:          [PASS][33] -> [SKIP][34] ([fdo#109271])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-hsw4/igt@kms_prime@basic-crc@first-to-second.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-hsw2/igt@kms_prime@basic-crc@first-to-second.html
    - shard-kbl:          [PASS][35] -> [SKIP][36] ([fdo#109271])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-kbl7/igt@kms_prime@basic-crc@first-to-second.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-kbl3/igt@kms_prime@basic-crc@first-to-second.html
    - shard-apl:          [PASS][37] -> [SKIP][38] ([fdo#109271] / [i915#1635])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-apl3/igt@kms_prime@basic-crc@first-to-second.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-apl2/igt@kms_prime@basic-crc@first-to-second.html
    - shard-glk:          [PASS][39] -> [SKIP][40] ([fdo#109271])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-glk9/igt@kms_prime@basic-crc@first-to-second.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-glk6/igt@kms_prime@basic-crc@first-to-second.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109441]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@perf_pmu@module-unload:
    - shard-iclb:         [PASS][43] -> [DMESG-WARN][44] ([i915#1982])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-iclb4/igt@perf_pmu@module-unload.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-iclb8/igt@perf_pmu@module-unload.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [INCOMPLETE][45] ([i915#155]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-kbl3/igt@gem_eio@in-flight-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-kbl6/igt@gem_eio@in-flight-suspend.html

  * igt@i915_selftest@live@execlists:
    - shard-tglb:         [INCOMPLETE][47] ([i915#2268]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-tglb6/igt@i915_selftest@live@execlists.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-tglb3/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@mock@contexts:
    - shard-apl:          [INCOMPLETE][49] ([i915#1635] / [i915#2278]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-apl6/igt@i915_selftest@mock@contexts.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-apl7/igt@i915_selftest@mock@contexts.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-glk:          [FAIL][51] ([i915#1119]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-glk6/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-glk9/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][53] ([i915#79]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@nonexisting-fb-interruptible@a-hdmi-a1:
    - shard-glk:          [DMESG-WARN][55] ([i915#1982]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-glk4/igt@kms_flip@nonexisting-fb-interruptible@a-hdmi-a1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-glk3/igt@kms_flip@nonexisting-fb-interruptible@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-tglb:         [DMESG-WARN][57] ([i915#1982]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-glk:          [FAIL][59] ([i915#49]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-iclb:         [FAIL][61] ([i915#83]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-iclb7/igt@kms_panel_fitting@atomic-fastset.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-apl:          [SKIP][63] ([fdo#109271] / [i915#1635]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-apl3/igt@kms_prime@basic-crc@second-to-first.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-apl2/igt@kms_prime@basic-crc@second-to-first.html
    - shard-kbl:          [SKIP][65] ([fdo#109271]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-kbl7/igt@kms_prime@basic-crc@second-to-first.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-kbl3/igt@kms_prime@basic-crc@second-to-first.html
    - shard-hsw:          [SKIP][67] ([fdo#109271]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-hsw4/igt@kms_prime@basic-crc@second-to-first.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-hsw2/igt@kms_prime@basic-crc@second-to-first.html
    - shard-iclb:         [SKIP][69] -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-iclb7/igt@kms_prime@basic-crc@second-to-first.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-iclb3/igt@kms_prime@basic-crc@second-to-first.html
    - shard-snb:          [SKIP][71] ([fdo#109271]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-snb7/igt@kms_prime@basic-crc@second-to-first.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-snb6/igt@kms_prime@basic-crc@second-to-first.html
    - shard-glk:          [SKIP][73] ([fdo#109271]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-glk9/igt@kms_prime@basic-crc@second-to-first.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-glk6/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][75] ([fdo#109441]) -> [PASS][76] +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-iclb4/igt@kms_psr@psr2_suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@kms_setmode@basic:
    - shard-glk:          [FAIL][77] ([i915#31]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-glk8/igt@kms_setmode@basic.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-glk4/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@universal-plane-pipe-a-functional:
    - shard-kbl:          [FAIL][79] ([i915#331]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-kbl1/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-kbl2/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
    - shard-apl:          [FAIL][81] ([i915#1635] / [i915#331]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-apl4/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-apl2/igt@kms_universal_plane@universal-plane-pipe-a-functional.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][83] ([fdo#110321] / [fdo#110336] / [i915#1635]) -> [TIMEOUT][84] ([i915#1319] / [i915#1635] / [i915#1958])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-apl2/igt@kms_content_protection@atomic-dpms.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-apl4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][85] ([i915#1319] / [i915#1635] / [i915#1958]) -> [FAIL][86] ([fdo#110321] / [i915#1635])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-apl7/igt@kms_content_protection@lic.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-apl6/igt@kms_content_protection@lic.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [DMESG-FAIL][87] ([fdo#108145] / [i915#1635] / [i915#1982]) -> [FAIL][88] ([fdo#108145] / [i915#1635] / [i915#265])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2045]: https://gitlab.freedesktop.org/drm/intel/issues/2045
  [i915#2268]: https://gitlab.freedesktop.org/drm/intel/issues/2268
  [i915#2278]: https://gitlab.freedesktop.org/drm/intel/issues/2278
  [i915#2370]: https://gitlab.freedesktop.org/drm/intel/issues/2370
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2439]: https://gitlab.freedesktop.org/drm/intel/issues/2439
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5785 -> IGTPW_4983
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9012: c6d96868b6c7dca0492e5e46382ea323aaf46fd9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4983: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/index.html
  IGT_5785: ee01acab0b6cee7be5cc4278e5d7527ec3e358ba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/index.html

--===============4375974522431328633==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/6] tools/intel_display_poller: Fix TILEOFF vs. LINOFF for skl+</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/81695/">https://patchwork.freedesktop.org/series/81695/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9012_full -&gt; IGTPW_4983_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4983_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4983_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4983_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-kbl3/igt@runner@aborted.html">FAIL</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-iclb3/igt@runner@aborted.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-tglb6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2045">i915#2045</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-tglb8/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@core_hotunplug@hotunbind-rebind}:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-glk1/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-glk6/igt@core_hotunplug@hotunbind-rebind.html">INCOMPLETE</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-iclb1/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-iclb3/igt@core_hotunplug@hotunbind-rebind.html">INCOMPLETE</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-kbl3/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-kbl3/igt@core_hotunplug@hotunbind-rebind.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4983_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-glk8/igt@gem_exec_reloc@basic-many-active@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-glk5/igt@gem_exec_reloc@basic-many-active@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-snb7/igt@gem_fenced_exec_thrash@2-spare-fences.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-snb1/igt@gem_fenced_exec_thrash@2-spare-fences.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-iclb2/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-iclb8/igt@gem_workarounds@suspend-resume.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-kbl6/igt@i915_suspend@fence-restore-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-kbl4/igt@i915_suspend@fence-restore-untiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-apl7/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-apl2/igt@kms_big_fb@linear-8bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2370">i915#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-kbl3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@first-to-second:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-iclb7/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-iclb3/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-snb7/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-snb6/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-hsw4/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-hsw2/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-kbl7/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-kbl3/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-apl3/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-apl2/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-glk9/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-glk6/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-iclb4/igt@perf_pmu@module-unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-iclb8/igt@perf_pmu@module-unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-kbl3/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-kbl6/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-tglb6/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2268">i915#2268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-tglb3/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@contexts:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-apl6/igt@i915_selftest@mock@contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2278">i915#2278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-apl7/igt@i915_selftest@mock@contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-glk6/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1119">i915#1119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-glk9/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-glk4/igt@kms_flip@nonexisting-fb-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-glk3/igt@kms_flip@nonexisting-fb-interruptible@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-iclb7/igt@kms_panel_fitting@atomic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/83">i915#83</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@second-to-first:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-apl3/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-apl2/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-kbl7/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-kbl3/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-hsw4/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-hsw2/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-iclb7/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-iclb3/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-snb7/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-snb6/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-glk9/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-glk6/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-iclb4/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-iclb2/igt@kms_psr@psr2_suspend.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-glk8/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-glk4/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-a-functional:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-kbl1/igt@kms_universal_plane@universal-plane-pipe-a-functional.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/331">i915#331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-kbl2/igt@kms_universal_plane@universal-plane-pipe-a-functional.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-apl4/igt@kms_universal_plane@universal-plane-pipe-a-functional.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/331">i915#331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-apl2/igt@kms_universal_plane@universal-plane-pipe-a-functional.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-apl2/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=110336">fdo#110336</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-apl4/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-apl7/igt@kms_content_protection@lic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-apl6/igt@kms_content_protection@lic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9012/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5785 -&gt; IGTPW_4983</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9012: c6d96868b6c7dca0492e5e46382ea323aaf46fd9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4983: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4983/index.html<br />
  IGT_5785: ee01acab0b6cee7be5cc4278e5d7527ec3e358ba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============4375974522431328633==--

--===============0213885317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0213885317==--
