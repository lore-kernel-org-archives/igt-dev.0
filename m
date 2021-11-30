Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0847695015875263007=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 30 Nov 2021 03:21:48 -0000
Message-ID: <163824250818.20410.3272128903967292502@emeril.freedesktop.org>
References: <20211126140911.1556205-1-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20211126140911.1556205-1-Rodrigo.Siqueira@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?amdgpu=3A_Introduces_DP_DSC_test?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0847695015875263007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu: Introduces DP DSC test
URL   : https://patchwork.freedesktop.org/series/97325/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6293_full -> IGTPW_6442_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6442_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6442_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/index.html

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6442_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-iclb:         [PASS][1] -> [FAIL][2] +803 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_plane@plane-panning-bottom-right:
    - shard-iclb:         NOTRUN -> [FAIL][3] +159 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb3/igt@kms_plane@plane-panning-bottom-right.html

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-iclb:         [PASS][4] -> [CRASH][5] +4 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb1/igt@kms_prime@basic-crc@second-to-first.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb3/igt@kms_prime@basic-crc@second-to-first.html

  
#### Warnings ####

  * igt@feature_discovery@chamelium:
    - shard-iclb:         [SKIP][6] ([fdo#111827]) -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb5/igt@feature_discovery@chamelium.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb8/igt@feature_discovery@chamelium.html

  * igt@feature_discovery@display-3x:
    - shard-iclb:         [SKIP][8] ([i915#1839]) -> [FAIL][9] +3 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb1/igt@feature_discovery@display-3x.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb1/igt@feature_discovery@display-3x.html

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-iclb:         [SKIP][10] ([i915#1902]) -> [FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb7/igt@i915_pm_lpsp@screens-disabled.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb2/igt@i915_pm_lpsp@screens-disabled.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         [SKIP][12] ([fdo#109293] / [fdo#109506]) -> [FAIL][13] +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-iclb:         [SKIP][14] ([fdo#110892]) -> [FAIL][15] +4 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb4/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-iclb:         [SKIP][16] ([i915#404]) -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-iclb:         [SKIP][18] ([i915#1769]) -> [FAIL][19] +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-iclb:         [SKIP][20] ([fdo#110725] / [fdo#111614]) -> [FAIL][21] +14 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb7/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb2/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-iclb:         [SKIP][22] ([fdo#110723]) -> [FAIL][23] +12 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb3/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-iclb:         [SKIP][24] ([i915#2705]) -> [FAIL][25] +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb3/igt@kms_big_joiner@2x-modeset.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb2/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         [SKIP][26] ([fdo#109278] / [i915#3886]) -> [FAIL][27] +43 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb7/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb2/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - shard-iclb:         [SKIP][28] ([fdo#109284] / [fdo#111827]) -> [FAIL][29] +67 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb4/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb2/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-d-ctm-max:
    - shard-iclb:         [SKIP][30] ([fdo#109278] / [fdo#109284] / [fdo#111827]) -> [FAIL][31] +4 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-max.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb1/igt@kms_color_chamelium@pipe-d-ctm-max.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-iclb:         [SKIP][32] ([i915#3116]) -> [FAIL][33] +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb3/igt@kms_content_protection@dp-mst-lic-type-0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb6/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-iclb:         [SKIP][34] ([fdo#109300] / [fdo#111066]) -> [FAIL][35] +7 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb1/igt@kms_content_protection@legacy.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb8/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
    - shard-iclb:         [SKIP][36] ([fdo#109278] / [fdo#109279]) -> [FAIL][37] +16 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb6/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge:
    - shard-iclb:         [SKIP][38] ([fdo#109278]) -> [FAIL][39] +218 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb1/igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb5/igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-iclb:         [SKIP][40] ([fdo#109274] / [fdo#109278]) -> [FAIL][41] +23 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-iclb:         [SKIP][42] ([i915#426]) -> [FAIL][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb1/igt@kms_dp_tiled_display@basic-test-pattern.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb4/igt@kms_dp_tiled_display@basic-test-pattern.html

  * igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
    - shard-iclb:         [SKIP][44] ([i915#3528]) -> [FAIL][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb4/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb8/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_dsc@basic-dsc-enable:
    - shard-iclb:         [SKIP][46] ([i915#3840]) -> [FAIL][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb4/igt@kms_dsc@basic-dsc-enable.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb7/igt@kms_dsc@basic-dsc-enable.html

  * igt@kms_dsc@xrgb8888-dsc-compression:
    - shard-iclb:         [SKIP][48] ([i915#3828]) -> [FAIL][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb8/igt@kms_dsc@xrgb8888-dsc-compression.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb2/igt@kms_dsc@xrgb8888-dsc-compression.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - shard-iclb:         [SKIP][50] ([i915#2587]) -> [FAIL][51] +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
    - shard-iclb:         [SKIP][52] ([fdo#109280]) -> [FAIL][53] +186 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_hdr@static-toggle:
    - shard-iclb:         [SKIP][54] ([i915#1187]) -> [FAIL][55] +3 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb1/igt@kms_hdr@static-toggle.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb2/igt@kms_hdr@static-toggle.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-iclb:         [SKIP][56] ([i915#4278]) -> [FAIL][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb2/igt@kms_invalid_mode@clock-too-high.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb6/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_plane_lowres@pipe-c-tiling-none:
    - shard-iclb:         [SKIP][58] ([i915#3536]) -> [FAIL][59] +7 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb6/igt@kms_plane_lowres@pipe-c-tiling-none.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb8/igt@kms_plane_lowres@pipe-c-tiling-none.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
    - shard-iclb:         [SKIP][60] ([i915#2920]) -> [FAIL][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:
    - shard-iclb:         [SKIP][62] ([i915#658]) -> [FAIL][63] +3 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][64] ([fdo#109441]) -> [FAIL][65] +17 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vrr@flip-dpms:
    - shard-iclb:         [SKIP][66] ([fdo#109502]) -> [FAIL][67] +3 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb7/igt@kms_vrr@flip-dpms.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb7/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-check-output:
    - shard-iclb:         [SKIP][68] ([i915#2437]) -> [FAIL][69] +3 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb3/igt@kms_writeback@writeback-check-output.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb3/igt@kms_writeback@writeback-check-output.html

  
Known issues
------------

  Here are the changes found in IGTPW_6442_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-noreloc-purge-cache-random:
    - shard-snb:          NOTRUN -> [SKIP][70] ([fdo#109271]) +64 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-snb5/igt@api_intel_bb@blit-noreloc-purge-cache-random.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-iclb:         [PASS][71] -> [DMESG-WARN][72] ([i915#1602])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb5/igt@core_hotunplug@unbind-rebind.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb7/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_ctx_persistence@many-contexts:
    - shard-tglb:         [PASS][73] -> [FAIL][74] ([i915#2410])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-tglb2/igt@gem_ctx_persistence@many-contexts.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb5/igt@gem_ctx_persistence@many-contexts.html

  * igt@gem_exec_balancer@parallel:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([i915#4525]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb8/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#4525])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb5/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_capture@pi@bcs0:
    - shard-iclb:         [PASS][77] -> [INCOMPLETE][78] ([i915#3371])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb6/igt@gem_exec_capture@pi@bcs0.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb8/igt@gem_exec_capture@pi@bcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-kbl:          [PASS][79] -> [FAIL][80] ([i915#2842])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-kbl7/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-kbl4/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][81] ([i915#2842])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-glk2/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          NOTRUN -> [FAIL][82] ([i915#2842])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][83] ([i915#2842]) +5 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb3/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-iclb:         [PASS][84] -> [FAIL][85] ([i915#2842]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb7/igt@gem_exec_fair@basic-pace@rcs0.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb1/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][86] ([i915#2842]) +4 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html
    - shard-tglb:         [PASS][87] -> [FAIL][88] ([i915#2842])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-tglb2/igt@gem_exec_fair@basic-pace@vcs1.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb5/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-glk:          [PASS][89] -> [FAIL][90] ([i915#2842]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-glk4/igt@gem_exec_fair@basic-pace@vecs0.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-glk9/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_params@secure-non-master:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([fdo#112283])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb5/igt@gem_exec_params@secure-non-master.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-kbl:          NOTRUN -> [SKIP][92] ([fdo#109271] / [i915#4613]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-kbl4/igt@gem_lmem_swapping@parallel-random-verify.html
    - shard-iclb:         NOTRUN -> [SKIP][93] ([i915#4613]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb3/igt@gem_lmem_swapping@parallel-random-verify.html
    - shard-tglb:         NOTRUN -> [SKIP][94] ([i915#4613])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb8/igt@gem_lmem_swapping@parallel-random-verify.html
    - shard-glk:          NOTRUN -> [SKIP][95] ([fdo#109271] / [i915#4613])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-glk9/igt@gem_lmem_swapping@parallel-random-verify.html
    - shard-apl:          NOTRUN -> [SKIP][96] ([fdo#109271] / [i915#4613])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-apl7/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-apl:          NOTRUN -> [WARN][97] ([i915#2658])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-apl3/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([i915#4270]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb3/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-iclb:         NOTRUN -> [SKIP][99] ([i915#768]) +3 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb2/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-iclb:         NOTRUN -> [SKIP][100] ([i915#3297]) +2 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb1/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-apl:          NOTRUN -> [FAIL][101] ([i915#3318])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-apl3/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-iclb:         NOTRUN -> [SKIP][102] ([fdo#109289]) +2 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb4/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglb:         NOTRUN -> [SKIP][103] ([i915#2856])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb8/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][104] ([i915#454])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][105] ([fdo#109271] / [i915#1937])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-kbl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-tglb:         NOTRUN -> [SKIP][106] ([fdo#109289] / [fdo#111719])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@basic-rte:
    - shard-tglb:         NOTRUN -> [CRASH][107] ([i915#4598] / [i915#4638])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb1/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@i2c:
    - shard-tglb:         [PASS][108] -> [FAIL][109] ([i915#4598] / [i915#4638]) +24 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-tglb6/igt@i915_pm_rpm@i2c.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb8/igt@i915_pm_rpm@i2c.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-tglb:         NOTRUN -> [FAIL][110] ([i915#4598] / [i915#4638]) +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb2/igt@i915_pm_rpm@pm-tiling.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][111] ([i915#180] / [i915#636])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-kbl1/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-glk:          [PASS][112] -> [DMESG-WARN][113] ([i915#118]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-glk9/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-glk1/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-apl:          NOTRUN -> [SKIP][114] ([fdo#109271] / [i915#3777])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-apl7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][115] ([fdo#109271] / [i915#3886]) +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-apl4/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][116] ([fdo#109271] / [i915#3886]) +2 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-kbl6/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][117] ([fdo#109271] / [i915#3886]) +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-glk7/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][118] ([fdo#109271]) +139 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-kbl3/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglb:         NOTRUN -> [SKIP][119] ([i915#3742])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb3/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-snb:          NOTRUN -> [SKIP][120] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-snb6/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-kbl:          NOTRUN -> [SKIP][121] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-kbl2/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color@pipe-b-gamma:
    - shard-iclb:         [PASS][122] -> [FAIL][123] ([i915#1149]) +25 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb4/igt@kms_color@pipe-b-gamma.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb5/igt@kms_color@pipe-b-gamma.html

  * igt@kms_color@pipe-c-ctm-0-75:
    - shard-tglb:         [PASS][124] -> [FAIL][125] ([i915#1149] / [i915#4638]) +38 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-tglb1/igt@kms_color@pipe-c-ctm-0-75.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb6/igt@kms_color@pipe-c-ctm-0-75.html

  * igt@kms_color@pipe-d-ctm-max:
    - shard-iclb:         NOTRUN -> [FAIL][126] ([i915#1149])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb3/igt@kms_color@pipe-d-ctm-max.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-25:
    - shard-glk:          NOTRUN -> [SKIP][127] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-glk9/igt@kms_color_chamelium@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
    - shard-apl:          NOTRUN -> [SKIP][128] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-apl7/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html

  * igt@kms_content_protection@legacy:
    - shard-kbl:          NOTRUN -> [TIMEOUT][129] ([i915#1319])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-kbl6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][130] ([i915#1319])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-apl2/igt@kms_content_protection@lic.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge:
    - shard-tglb:         [PASS][131] -> [FAIL][132] ([i915#4638]) +938 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-tglb1/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb8/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html

  * igt@kms_cursor_legacy@pipe-d-single-bo:
    - shard-glk:          NOTRUN -> [SKIP][133] ([fdo#109271] / [i915#533])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-glk8/igt@kms_cursor_legacy@pipe-d-single-bo.html
    - shard-kbl:          NOTRUN -> [SKIP][134] ([fdo#109271] / [i915#533])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-kbl2/igt@kms_cursor_legacy@pipe-d-single-bo.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][135] ([fdo#111825]) +1 similar issue
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb2/igt@kms_flip@2x-nonexisting-fb-interruptible.html
    - shard-iclb:         NOTRUN -> [SKIP][136] ([fdo#109274]) +2 similar issues
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb4/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:
    - shard-apl:          [PASS][137] -> [FAIL][138] ([i915#79])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-apl4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][139] -> [DMESG-WARN][140] ([i915#180]) +7 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-tglb:         [PASS][141] -> [CRASH][142] ([i915#4638]) +3 similar issues
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-tglb1/igt@kms_force_connector_basic@force-connector-state.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
    - shard-glk:          [PASS][143] -> [FAIL][144] ([i915#1888] / [i915#2546])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-glk7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-glk8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-apl:          NOTRUN -> [SKIP][145] ([fdo#109271]) +136 similar issues
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-apl4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> [SKIP][146] ([fdo#109271]) +33 similar issues
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/index.html

--===============0847695015875263007==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu: Introduces DP DSC test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/97325/">https://patchwork.freedesktop.org/series/97325/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6293_full -&gt; IGTPW_6442_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6442_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6442_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/index.html</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6442_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">FAIL</a> +803 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb3/igt@kms_plane@plane-panning-bottom-right.html">FAIL</a> +159 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@second-to-first:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb1/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb3/igt@kms_prime@basic-crc@second-to-first.html">CRASH</a> +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb5/igt@feature_discovery@chamelium.html">SKIP</a> ([fdo#111827]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb8/igt@feature_discovery@chamelium.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb1/igt@feature_discovery@display-3x.html">SKIP</a> ([i915#1839]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb1/igt@feature_discovery@display-3x.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb7/igt@i915_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#1902]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb2/igt@i915_pm_lpsp@screens-disabled.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109293] / [fdo#109506]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([fdo#110892]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb4/igt@i915_pm_rpm@modeset-non-lpsp.html">FAIL</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#404]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> ([i915#1769]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb7/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb2/igt@kms_big_fb@linear-16bpp-rotate-90.html">FAIL</a> +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#110723]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb3/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">FAIL</a> +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb3/igt@kms_big_joiner@2x-modeset.html">SKIP</a> ([i915#2705]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb2/igt@kms_big_joiner@2x-modeset.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb7/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109278] / [i915#3886]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb2/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html">FAIL</a> +43 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb4/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb2/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html">FAIL</a> +67 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-max:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-max.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb1/igt@kms_color_chamelium@pipe-d-ctm-max.html">FAIL</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb3/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb6/igt@kms_content_protection@dp-mst-lic-type-0.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb1/igt@kms_content_protection@legacy.html">SKIP</a> ([fdo#109300] / [fdo#111066]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb8/igt@kms_content_protection@legacy.html">FAIL</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb6/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html">FAIL</a> +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb1/igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge.html">SKIP</a> ([fdo#109278]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb5/igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge.html">FAIL</a> +218 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> ([fdo#109274] / [fdo#109278]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">FAIL</a> +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb1/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb4/igt@kms_dp_tiled_display@basic-test-pattern.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb4/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#3528]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb8/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@basic-dsc-enable:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb4/igt@kms_dsc@basic-dsc-enable.html">SKIP</a> ([i915#3840]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb7/igt@kms_dsc@basic-dsc-enable.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@xrgb8888-dsc-compression:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb8/igt@kms_dsc@xrgb8888-dsc-compression.html">SKIP</a> ([i915#3828]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb2/igt@kms_dsc@xrgb8888-dsc-compression.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> ([i915#2587]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> ([fdo#109280]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html">FAIL</a> +186 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb1/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#1187]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb2/igt@kms_hdr@static-toggle.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb2/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> ([i915#4278]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb6/igt@kms_invalid_mode@clock-too-high.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-none:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb6/igt@kms_plane_lowres@pipe-c-tiling-none.html">SKIP</a> ([i915#3536]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb8/igt@kms_plane_lowres@pipe-c-tiling-none.html">FAIL</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html">SKIP</a> ([i915#2920]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">FAIL</a> +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb7/igt@kms_vrr@flip-dpms.html">SKIP</a> ([fdo#109502]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb7/igt@kms_vrr@flip-dpms.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb3/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb3/igt@kms_writeback@writeback-check-output.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6442_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-noreloc-purge-cache-random:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-snb5/igt@api_intel_bb@blit-noreloc-purge-cache-random.html">SKIP</a> ([fdo#109271]) +64 similar issues</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb5/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#1602])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@many-contexts:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-tglb2/igt@gem_ctx_persistence@many-contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb5/igt@gem_ctx_persistence@many-contexts.html">FAIL</a> ([i915#2410])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb8/igt@gem_exec_balancer@parallel.html">SKIP</a> ([i915#4525]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb5/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@bcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb6/igt@gem_exec_capture@pi@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb8/igt@gem_exec_capture@pi@bcs0.html">INCOMPLETE</a> ([i915#3371])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-kbl7/igt@gem_exec_fair@basic-none-vip@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-kbl4/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-glk2/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb3/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb7/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb1/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842]) +4 similar issues</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-tglb2/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb5/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-glk4/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-glk9/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb5/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-kbl4/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb3/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> ([i915#4613]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb8/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> ([i915#4613])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-glk9/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> ([fdo#109271] / [i915#4613])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-apl7/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> ([fdo#109271] / [i915#4613])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-apl3/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb3/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">SKIP</a> ([i915#4270]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb2/igt@gem_render_copy@y-tiled-to-vebox-linear.html">SKIP</a> ([i915#768]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb1/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-apl3/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb4/igt@gen7_exec_parse@chained-batch.html">SKIP</a> ([fdo#109289]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb8/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-kbl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> ([fdo#109289] / [fdo#111719])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb1/igt@i915_pm_rpm@basic-rte.html">CRASH</a> ([i915#4598] / [i915#4638])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@i2c:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-tglb6/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb8/igt@i915_pm_rpm@i2c.html">FAIL</a> ([i915#4598] / [i915#4638]) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-tiling:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb2/igt@i915_pm_rpm@pm-tiling.html">FAIL</a> ([i915#4598] / [i915#4638]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-kbl1/igt@i915_suspend@forcewake.html">INCOMPLETE</a> ([i915#180] / [i915#636])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-glk9/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-glk1/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">DMESG-WARN</a> ([i915#118]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-apl7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-apl4/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-kbl6/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-glk7/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-kbl3/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271]) +139 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb3/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-snb6/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-kbl2/igt@kms_chamelium@vga-hpd-without-ddc.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-gamma:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-iclb4/igt@kms_color@pipe-b-gamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb5/igt@kms_color@pipe-b-gamma.html">FAIL</a> ([i915#1149]) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-ctm-0-75:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-tglb1/igt@kms_color@pipe-c-ctm-0-75.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb6/igt@kms_color@pipe-c-ctm-0-75.html">FAIL</a> ([i915#1149] / [i915#4638]) +38 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb3/igt@kms_color@pipe-d-ctm-max.html">FAIL</a> ([i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-glk9/igt@kms_color_chamelium@pipe-d-ctm-0-25.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-limited-range:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-apl7/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-kbl6/igt@kms_content_protection@legacy.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-apl2/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-tglb1/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb8/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html">FAIL</a> ([i915#4638]) +938 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-bo:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-glk8/igt@kms_cursor_legacy@pipe-d-single-bo.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-kbl2/igt@kms_cursor_legacy@pipe-d-single-bo.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb2/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> ([fdo#111825]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb4/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> ([fdo#109274]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-apl4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-tglb1/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-tglb2/igt@kms_force_connector_basic@force-connector-state.html">CRASH</a> ([i915#4638]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/shard-glk7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-glk8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html">FAIL</a> ([i915#1888] / [i915#2546])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-apl4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> ([fdo#109271]) +136 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_">SKIP</a> ([fdo#109271]) +33 similar issues</li>
</ul>
</li>
</ul>

</body>
</html>

--===============0847695015875263007==--
