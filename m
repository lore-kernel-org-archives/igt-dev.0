Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7479926505753837692=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sai.gowtham.ch@intel.com
Date: Thu, 07 Jul 2022 20:49:20 -0000
Message-ID: <165722696033.2211.10925266543134126964@emeril.freedesktop.org>
References: <20220707082820.25823-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20220707082820.25823-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Fcapture_=3A_Add_support_for_local_memory_=28r?=
 =?utf-8?q?ev7=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============7479926505753837692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_exec_capture : Add support for local memory (rev7)
URL   : https://patchwork.freedesktop.org/series/95707/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11856_full -> IGTPW_7475_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7475_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7475_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/index.html

Participating hosts (13 -> 10)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7475_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - shard-glk:          [PASS][1] -> [WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-glk2/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-glk1/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@kms_vblank@pipe-d-ts-continuation-modeset-hang:
    - shard-tglb:         [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-tglb1/igt@kms_vblank@pipe-d-ts-continuation-modeset-hang.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-tglb1/igt@kms_vblank@pipe-d-ts-continuation-modeset-hang.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_vblank@pipe-d-ts-continuation-modeset-hang:
    - {shard-dg1}:        NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-dg1-13/igt@kms_vblank@pipe-d-ts-continuation-modeset-hang.html
    - {shard-tglu}:       NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-tglu-3/igt@kms_vblank@pipe-d-ts-continuation-modeset-hang.html

  
Known issues
------------

  Here are the changes found in IGTPW_7475_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglb:         NOTRUN -> [SKIP][7] ([i915#3555] / [i915#5325])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-tglb3/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [PASS][8] -> [DMESG-WARN][9] ([i915#180]) +7 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_ctx_persistence@engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#1099])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-snb2/igt@gem_ctx_persistence@engines-mixed.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [PASS][11] -> [TIMEOUT][12] ([i915#3070])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-iclb1/igt@gem_eio@unwedge-stress.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-iclb:         NOTRUN -> [SKIP][13] ([i915#4525])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb6/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([i915#4525])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-iclb4/igt@gem_exec_balancer@parallel-keep-in-fence.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb5/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          NOTRUN -> [FAIL][16] ([i915#6141])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-kbl7/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [PASS][17] -> [FAIL][18] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][19] ([i915#2842])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html
    - shard-kbl:          [PASS][20] -> [FAIL][21] ([i915#2842]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([i915#4613])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-tglb5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-glk:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#4613])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-glk8/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][24] ([i915#4613])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-kbl:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#4613]) +4 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-kbl7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-apl:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#4613]) +3 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-apl1/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_userptr_blits@huge-split:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#3376])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-glk2/igt@gem_userptr_blits@huge-split.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-glk1/igt@gem_userptr_blits@huge-split.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#109289])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb6/igt@gen7_exec_parse@basic-rejected.html
    - shard-tglb:         NOTRUN -> [SKIP][30] ([fdo#109289])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-tglb7/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#5566] / [i915#716])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-apl4/igt@gen9_exec_parse@allowed-single.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-apl6/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([i915#2527] / [i915#2856])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-tglb3/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][34] -> [SKIP][35] ([fdo#109271])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-apl3/igt@i915_pm_dc@dc9-dpms.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-apl2/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          [PASS][36] -> [INCOMPLETE][37] ([i915#3921])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-snb7/igt@i915_selftest@live@hangcheck.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-snb6/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@debugfs-reader:
    - shard-apl:          [PASS][38] -> [DMESG-WARN][39] ([i915#180])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-apl2/igt@i915_suspend@debugfs-reader.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-apl1/igt@i915_suspend@debugfs-reader.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:
    - shard-iclb:         [PASS][40] -> [FAIL][41] ([i915#2521])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-iclb5/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb1/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#5286]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-tglb8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
    - shard-iclb:         NOTRUN -> [SKIP][43] ([i915#5286])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271]) +171 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-apl4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#111615])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-tglb3/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#111615] / [i915#3689]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-tglb5/igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109278]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb3/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [i915#3886]) +8 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-apl4/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
    - shard-glk:          NOTRUN -> [SKIP][49] ([fdo#109271] / [i915#3886]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-glk7/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#109278] / [i915#3886]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb4/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#3689] / [i915#3886])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-tglb3/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [i915#3886]) +10 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-kbl1/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-random-ccs-data-yf_tiled_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][53] ([fdo#109271]) +119 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-kbl1/igt@kms_ccs@pipe-c-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-snb:          NOTRUN -> [SKIP][54] ([fdo#109271]) +74 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-snb6/igt@kms_ccs@pipe-d-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-apl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +17 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-apl1/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_chamelium@hdmi-hpd-with-enabled-mode:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109284] / [fdo#111827])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb5/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html
    - shard-snb:          NOTRUN -> [SKIP][57] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-snb4/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html
    - shard-glk:          NOTRUN -> [SKIP][58] ([fdo#109271] / [fdo#111827])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-glk1/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html

  * igt@kms_color_chamelium@pipe-a-degamma:
    - shard-kbl:          NOTRUN -> [SKIP][59] ([fdo#109271] / [fdo#111827]) +20 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-kbl1/igt@kms_color_chamelium@pipe-a-degamma.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-25:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-tglb3/igt@kms_color_chamelium@pipe-d-ctm-0-25.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          NOTRUN -> [TIMEOUT][61] ([i915#1319]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-apl6/igt@kms_content_protection@atomic.html
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#1063]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-tglb1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          NOTRUN -> [TIMEOUT][63] ([i915#1319]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-kbl4/igt@kms_content_protection@srm.html

  * igt@kms_cursor_legacy@cursor-vs-flip@legacy:
    - shard-iclb:         [PASS][64] -> [FAIL][65] ([i915#5072])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-iclb1/igt@kms_cursor_legacy@cursor-vs-flip@legacy.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip@legacy.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#5287])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-tglb5/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([i915#3555])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([i915#2672]) +5 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([i915#2672] / [i915#3555])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109280]) +3 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#109280] / [fdo#111825]) +5 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-glk:          NOTRUN -> [SKIP][72] ([fdo#109271]) +7 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-1:
    - shard-kbl:          [PASS][73] -> [FAIL][74] ([i915#1188])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-kbl7/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-kbl4/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][75] ([fdo#108145] / [i915#265]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][76] ([i915#265])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
    - shard-apl:          NOTRUN -> [FAIL][77] ([i915#265])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1:
    - shard-iclb:         [PASS][78] -> [SKIP][79] ([i915#5176]) +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-iclb3/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb2/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-apl:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#658])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-apl8/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
    - shard-tglb:         NOTRUN -> [SKIP][81] ([i915#2920])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-tglb8/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-kbl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#658]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-kbl1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [PASS][83] -> [SKIP][84] ([fdo#109441]) +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb7/igt@kms_psr@psr2_sprite_blt.html

  * igt@prime_nv_test@i915_import_cpu_mmap:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109291])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb3/igt@prime_nv_test@i915_import_cpu_mmap.html
    - shard-tglb:         NOTRUN -> [SKIP][86] ([fdo#109291])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-tglb7/igt@prime_nv_test@i915_import_cpu_mmap.html

  * igt@prime_vgem@fence-read-hang:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([fdo#109295])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-tglb5/igt@prime_vgem@fence-read-hang.html

  * igt@sysfs_clients@fair-1:
    - shard-apl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#2994]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-apl8/igt@sysfs_clients@fair-1.html

  * igt@sysfs_clients@pidname:
    - shard-kbl:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#2994])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-kbl7/igt@sysfs_clients@pidname.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([fdo#109307])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-tglb2/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@api_intel_allocator@two-level-inception-interruptible:
    - shard-tglb:         [INCOMPLETE][91] -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-tglb8/igt@api_intel_allocator@two-level-inception-interruptible.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-tglb1/igt@api_intel_allocator@two-level-inception-interruptible.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - {shard-rkl}:        [SKIP][93] ([i915#3281]) -> [PASS][94] +6 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-rkl-6/igt@gem_bad_reloc@negative-reloc-lut.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-rkl-5/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_ctx_persistence@legacy-engines-hostile@vebox:
    - {shard-dg1}:        [FAIL][95] ([i915#4883]) -> [PASS][96] +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-dg1-16/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-dg1-19/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-tglb:         [TIMEOUT][97] ([i915#3063]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-tglb3/igt@gem_eio@in-flight-contexts-10ms.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-tglb3/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         [SKIP][99] ([i915#4525]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-iclb8/igt@gem_exec_balancer@parallel-bb-first.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [FAIL][101] ([i915#2842]) -> [PASS][102] +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-apl4/igt@gem_exec_fair@basic-none@vecs0.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][103] ([i915#2842]) -> [PASS][104] +3 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-kbl:          [FAIL][105] ([i915#2842]) -> [PASS][106] +3 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         [FAIL][107] ([i915#2842]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-tglb8/igt@gem_exec_fair@basic-pace@bcs0.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-iclb:         [FAIL][109] ([i915#2842]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-iclb8/igt@gem_exec_fair@basic-pace@vecs0.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb8/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fence@basic-busy@bcs0:
    - {shard-rkl}:        [SKIP][111] ([i915#6251]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-rkl-5/igt@gem_exec_fence@basic-busy@bcs0.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-rkl-4/igt@gem_exec_fence@basic-busy@bcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - {shard-rkl}:        [SKIP][113] ([fdo#109315]) -> [PASS][114] +7 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-rkl-5/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-rkl-6/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_mmap_gtt@coherency:
    - {shard-rkl}:        [SKIP][115] ([fdo#111656]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-rkl-6/igt@gem_mmap_gtt@coherency.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-rkl-5/igt@gem_mmap_gtt@coherency.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - {shard-rkl}:        [SKIP][117] ([i915#3282]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-rkl-2/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-rkl-5/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [DMESG-WARN][119] ([i915#180]) -> [PASS][120] +5 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-apl1/igt@gem_workarounds@suspend-resume-context.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-apl7/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-kbl:          [DMESG-WARN][121] ([i915#5566] / [i915#716]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-kbl4/igt@gen9_exec_parse@allowed-single.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-kbl1/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-secure:
    - {shard-rkl}:        [SKIP][123] ([i915#2527]) -> [PASS][124] +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-rkl-2/igt@gen9_exec_parse@bb-secure.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-rkl-5/igt@gen9_exec_parse@bb-secure.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [DMESG-WARN][125] ([i915#6201]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_backlight@basic-brightness:
    - {shard-rkl}:        [SKIP][127] ([i915#3012]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-rkl-1/igt@i915_pm_backlight@basic-brightness.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-rkl-6/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_dc@dc9-dpms:
    - {shard-tglu}:       [SKIP][129] ([i915#4281]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-tglu-6/igt@i915_pm_dc@dc9-dpms.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-tglu-4/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - {shard-rkl}:        [SKIP][131] ([i915#1397]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-rkl-5/igt@i915_pm_rpm@dpms-lpsp.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-rkl-6/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@gem-idle:
    - {shard-dg1}:        [SKIP][133] ([i915#5174]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-dg1-13/igt@i915_pm_rpm@gem-idle.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-dg1-15/igt@i915_pm_rpm@gem-idle.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [DMESG-WARN][135] ([i915#180]) -> [PASS][136] +5 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-kbl1/igt@i915_suspend@forcewake.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-kbl7/igt@i915_suspend@forcewake.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-glk:          [FAIL][137] ([i915#2521]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-glk9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-glk3/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - {shard-rkl}:        [SKIP][139] ([i915#1845] / [i915#4098]) -> [PASS][140] +16 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-rkl-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-rkl-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1:
    - shard-snb:          [SKIP][141] ([fdo#109271]) -> [PASS][142] +1 similar issue
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-snb6/igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-snb4/igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1.html

  * igt@kms_cursor_legacy@forked-bo@all-pipes:
    - {shard-rkl}:        [INCOMPLETE][143] -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-rkl-5/igt@kms_cursor_legacy@forked-bo@all-pipes.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-rkl-5/igt@kms_cursor_legacy@forked-bo@all-pipes.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - {shard-rkl}:        [SKIP][145] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][146] +4 similar issues
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-rkl-1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_flip@2x-modeset-vs-vblank-race@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][147] ([i915#407]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-glk3/igt@kms_flip@2x-modeset-vs-vblank-race@bc-hdmi-a1-hdmi-a2.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-glk7/igt@kms_flip@2x-modeset-vs-vblank-race@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - {shard-rkl}:        [SKIP][149] ([i915#1849] / [i915#4098]) -> [PASS][150] +17 similar issues
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_invalid_mode@bad-hsync-end:
    - {shard-rkl}:        [SKIP][151] ([i915#4278]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-rkl-1/igt@kms_invalid_mode@bad-hsync-end.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-rkl-6/igt@kms_invalid_mode@bad-hsync-end.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - {shard-rkl}:        [SKIP][153] ([i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-rkl-1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1:
    - shard-glk:          [DMESG-FAIL][155] ([i915#118] / [i915#1888]) -> [PASS][156] +1 similar issue
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-glk8/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-glk3/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-y@pipe-b-hdmi-a-1:
    - shard-glk:          [FAIL][157] ([i915#1888]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-glk8/igt@kms_plane_lowres@tiling-y@pipe-b-hdmi-a-1.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-glk3/igt@kms_plane_lowres@tiling-y@pipe-b-hdmi-a-1.html

  * igt@kms_psr@cursor_render:
    - {shard-rkl}:        [SKIP][159] ([i915#1072]) -> [PASS][160] +1 similar issue
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-rkl-1/igt@kms_psr@cursor_render.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-rkl-6/igt@kms_psr@cursor_render.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][161] ([fdo#109441]) -> [PASS][162] +1 similar issue
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-iclb8/igt@kms_psr@psr2_primary_page_flip.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_universal_plane@universal-plane-pipe-a-sanity:
    - {shard-rkl}:        [SKIP][163] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-rkl-1/igt@kms_universal_plane@universal-plane-pipe-a-sanity.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-rkl-6/igt@kms_universal_plane@universal-plane-pipe-a-sanity.html

  * igt@perf@gen12-mi-rpc:
    - {shard-rkl}:        [SKIP][165] ([fdo#109289]) -> [PASS][166] +1 similar issue
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-rkl-5/igt@perf@gen12-mi-rpc.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-rkl-2/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@interrupts-sync:
    - {shard-dg1}:        [SKIP][167] ([i915#5608]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-dg1-13/igt@perf_pmu@interrupts-sync.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-dg1-12/igt@perf_pmu@interrupts-sync.html

  * igt@perf_pmu@semaphore-busy@vcs1:
    - {shard-dg1}:        [FAIL][169] ([i915#4349]) -> [PASS][170] +2 similar issues
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-dg1-13/igt@perf_pmu@semaphore-busy@vcs1.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-dg1-15/igt@perf_pmu@semaphore-busy@vcs1.html

  * igt@prime_vgem@basic-fence-read:
    - {shard-rkl}:        [SKIP][171] ([fdo#109295] / [i915#3291] / [i915#3708]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-rkl-1/igt@prime_vgem@basic-fence-read.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-rkl-5/igt@prime_vgem@basic-fence-read.html

  * igt@syncobj_timeline@multi-wait-for-submit-available-submitted:
    - {shard-dg1}:        [SKIP][173] ([i915#2575]) -> [PASS][174] +20 similar issues
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-dg1-13/igt@syncobj_timeline@multi-wait-for-submit-available-submitted.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-dg1-19/igt@syncobj_timeline@multi-wait-for-submit-available-submitted.html

  * igt@syncobj_wait@invalid-reset-one-illegal-handle:
    - {shard-rkl}:        [SKIP][175] ([i915#2575]) -> [PASS][176] +1 similar issue
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-rkl-5/igt@syncobj_wait@invalid-reset-one-illegal-handle.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-rkl-2/igt@syncobj_wait@invalid-reset-one-illegal-handle.html

  
#### Warnings ####

  * igt@gem_eio@kms:
    - shard-tglb:         [TIMEOUT][177] ([i915#3063]) -> [FAIL][178] ([i915#5784])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-tglb3/igt@gem_eio@kms.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-tglb5/igt@gem_eio@kms.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         [FAIL][179] ([i915#2852]) -> [FAIL][180] ([i915#2842])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-iclb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - shard-iclb:         [FAIL][181] ([i915#2684]) -> [WARN][182] ([i915#2684])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [FAIL][183] ([i915#4767]) -> [INCOMPLETE][184] ([i915#180] / [i915#4939])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-iclb:         [SKIP][185] ([i915#2920]) -> [SKIP][186] ([i915#658])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb7/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-iclb:         [SKIP][187] ([i915#658]) -> [SKIP][188] ([i915#2920])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-iclb8/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][189], [FAIL][190], [FAIL][191], [FAIL][192], [FAIL][193], [FAIL][194], [FAIL][195], [FAIL][196]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#716]) -> ([FAIL][197], [FAIL][198], [FAIL][199], [FAIL][200], [FAIL][201]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#92])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-kbl1/igt@runner@aborted.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-kbl4/igt@runner@aborted.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-kbl1/igt@runner@aborted.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-kbl1/igt@runner@aborted.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-kbl1/igt@runner@aborted.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-kbl1/igt@runner@aborted.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-kbl1/igt@runner@aborted.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-kbl1/igt@runner@aborted.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-kbl7/igt@runner@aborted.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-kbl1/igt@runner@aborted.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-kbl1/igt@runner@aborted.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-kbl1/igt@runner@aborted.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-kbl1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2852]: https://gitlab.freedesktop.org/drm/intel/issues/2852
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3070]: https://gitlab.freedesktop.org/drm/intel/issues/3070
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3376]: https://gitlab.freedesktop.org/drm/intel/issues/3376
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4032]: https://gitlab.freedesktop.org/drm/intel/issues/4032
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4462]: https://gitlab.freedesktop.org/drm/intel/issues/4462
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4883]: https://gitlab.freedesktop.org/drm/intel/issues/4883
  [i915#4884]: https://gitlab.freedesktop.org/drm/intel/issues/4884
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4939]: https://gitlab.freedesktop.org/drm/intel/issues/4939
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5030]: https://gitlab.freedesktop.org/drm/intel/issues/5030
  [i915#5072]: https://gitlab.freedesktop.org/drm/intel/issues/5072
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5174]: https://gitlab.freedesktop.org/drm/intel/issues/5174
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5182]: https://gitlab.freedesktop.org/drm/intel/issues/5182
  [i915#5234]: https://gitlab.freedesktop.org/drm/intel/issues/5234
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6140]: https://gitlab.freedesktop.org/drm/intel/issues/6140
  [i915#6141]: https://gitlab.freedesktop.org/drm/intel/issues/6141
  [i915#6159]: https://gitlab.freedesktop.org/drm/intel/issues/6159
  [i915#6201]: https://gitlab.freedesktop.org/drm/intel/issues/6201
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6251]: https://gitlab.freedesktop.org/drm/intel/issues/6251
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6259]: https://gitlab.freedesktop.org/drm/intel/issues/6259
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/intel/issues/6344
  [i915#6355]: https://gitlab.freedesktop.org/drm/intel/issues/6355
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6561 -> IGTPW_7475
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11856: 66c315cd3820fc20418d5756ceed6e5a039e69c5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7475: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/index.html
  IGT_6561: 4b673211d1645eaafa9da32eece4c274d8cd6c41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/index.html

--===============7479926505753837692==
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
<tr><td><b>Series:</b></td><td>tests/i915/gem_exec_capture : Add support fo=
r local memory (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/95707/">https://patchwork.freedesktop.org/series/95707/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7475/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11856_full -&gt; IGTPW_7475_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7475_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7475_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/index.=
html</p>
<h2>Participating hosts (13 -&gt; 10)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7475=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-glk2/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/s=
hard-glk1/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-modeset-hang:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-tglb1/igt@kms_vblank@pipe-d-ts-continuation-modeset-han=
g.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7475/shard-tglb1/igt@kms_vblank@pipe-d-ts-continuation-modeset-hang.h=
tml">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-modeset-hang:</p>
<ul>
<li>
<p>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/shard-dg1-13/igt@kms_vblank@pipe-d-ts-continuation-=
modeset-hang.html">SKIP</a></p>
</li>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/shard-tglu-3/igt@kms_vblank@pipe-d-ts-continuation-=
modeset-hang.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7475_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-tglb3/igt@gem_ccs@block-copy-compressed.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555=
">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/5325">i915#5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_747=
5/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180=
</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-snb2/igt@gem_ctx_persistence@engines-mixed.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-iclb1/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb7/i=
gt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3070">i915#3070</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-iclb6/igt@gem_exec_balancer@parallel-balance=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-iclb4/igt@gem_exec_balancer@parallel-keep-in-fence.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7475/shard-iclb5/igt@gem_exec_balancer@parallel-keep-in-fence.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#45=
25</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6141">=
i915#6141</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/=
shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842"=
>i915#2842</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11856/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-kb=
l4/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue<=
/p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/shard-tglb5/igt@gem_lmem_swapping@heavy-verify-mult=
i-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/shard-glk8/igt@gem_lmem_swapping@heavy-verify-multi=
-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/shard-iclb1/igt@gem_lmem_swapping@heavy-verify-mult=
i-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/shard-kbl7/igt@gem_lmem_swapping@heavy-verify-multi=
-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4613">i915#4613</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-apl1/igt@gem_lmem_swapping@parallel-random.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@huge-split:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-glk2/igt@gem_userptr_blits@huge-split.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-gl=
k1/igt@gem_userptr_blits@huge-split.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/3376">i915#3376</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/shard-iclb6/igt@gen7_exec_parse@basic-rejected.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10928=
9">fdo#109289</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/shard-tglb7/igt@gen7_exec_parse@basic-rejected.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10928=
9">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-apl4/igt@gen9_exec_parse@allowed-single.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-=
apl6/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-tglb3/igt@gen9_exec_parse@valid-registers.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/25=
27">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-apl3/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-apl2/igt@i9=
15_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-snb7/igt@i915_selftest@live@hangcheck.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-sn=
b6/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-apl2/igt@i915_suspend@debugfs-reader.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-apl=
1/igt@i915_suspend@debugfs-reader.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-iclb5/igt@kms_async_flips@alternate-sync-async-flip@pip=
e-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7475/shard-iclb1/igt@kms_async_flips@alternate-sync-async-fli=
p@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2521">i915#2521</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/shard-tglb8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
5286">i915#5286</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/shard-iclb1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
5286">i915#5286</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-apl4/igt@kms_big_fb@x-tiled-max-hw-stride-64=
bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a>) +171 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-tglb3/igt@kms_big_fb@yf-tiled-16bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-tglb5/igt@kms_ccs@pipe-a-crc-primary-rotatio=
n-180-yf_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3689">i915#3689</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-iclb3/igt@kms_ccs@pipe-a-crc-sprite-planes-b=
asic-y_tiled_gen12_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109278">fdo#109278</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/shard-apl4/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_=
tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3886">i915#3886</a>) +8 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/shard-glk7/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_=
tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/shard-iclb4/igt@kms_ccs@pipe-a-missing-ccs-buffer-y=
_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-tglb3/igt@kms_ccs@pipe-c-bad-aux-stride-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-kbl1/igt@kms_ccs@pipe-c-bad-aux-stride-y_til=
ed_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-kbl1/igt@kms_ccs@pipe-c-random-ccs-data-yf_t=
iled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a>) +119 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-snb6/igt@kms_ccs@pipe-d-bad-rotation-90-y_ti=
led_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a>) +74 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-apl1/igt@kms_chamelium@hdmi-hpd-storm.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/shard-iclb5/igt@kms_chamelium@hdmi-hpd-with-enabled=
-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/shard-snb4/igt@kms_chamelium@hdmi-hpd-with-enabled-=
mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111827">fdo#111827</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/shard-glk1/igt@kms_chamelium@hdmi-hpd-with-enabled-=
mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-degamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-kbl1/igt@kms_color_chamelium@pipe-a-degamma.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-tglb3/igt@kms_color_chamelium@pipe-d-ctm-0-2=
5.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/shard-apl6/igt@kms_content_protection@atomic.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/131=
9">i915#1319</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/shard-tglb1/igt@kms_content_protection@atomic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1063"=
>i915#1063</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-kbl4/igt@kms_content_protection@srm.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319"=
>i915#1319</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip@legacy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-iclb1/igt@kms_cursor_legacy@cursor-vs-flip@legacy.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
475/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip@legacy.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5072">i915#5072=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-tglb5/igt@kms_draw_crc@draw-method-xrgb8888-=
mmap-wc-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/5287">i915#5287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-xti=
le-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-16bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +5=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#35=
55</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +5 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-kbl7/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-=
kbl4/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-=
basic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-t=
ransparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-t=
ransparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-=
a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-iclb3/igt@kms_plane_scaling@plane-downscale-with-pixel-=
format-factor-0-5@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb2/igt@kms_plane_scaling@p=
lane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a=
>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/shard-apl8/igt@kms_psr2_sf@overlay-plane-move-conti=
nuous-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/shard-tglb8/igt@kms_psr2_sf@overlay-plane-move-cont=
inuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2920">i915#2920</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-kbl1/igt@kms_psr2_su@page_flip-xrgb8888.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-iclb7/=
igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_import_cpu_mmap:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/shard-iclb3/igt@prime_nv_test@i915_import_cpu_mmap.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09291">fdo#109291</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/shard-tglb7/igt@prime_nv_test@i915_import_cpu_mmap.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09291">fdo#109291</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-tglb5/igt@prime_vgem@fence-read-hang.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">=
fdo#109295</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-apl8/igt@sysfs_clients@fair-1.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@pidname:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-kbl7/igt@sysfs_clients@pidname.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>)</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7475/shard-tglb2/igt@tools_test@sysfs_l3_parity.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109307">=
fdo#109307</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@api_intel_allocator@two-level-inception-interruptible:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-tglb8/igt@api_intel_allocator@two-level-inception-inter=
ruptible.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7475/shard-tglb1/igt@api_intel_allocator@two-level-incep=
tion-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-rkl-6/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3=
281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_74=
75/shard-rkl-5/igt@gem_bad_reloc@negative-reloc-lut.html">PASS</a> +6 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile@vebox:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-dg1-16/igt@gem_ctx_persistence@legacy-engines-hostile@v=
ebox.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4883">i915#4883</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7475/shard-dg1-19/igt@gem_ctx_persistence@legacy-engines-hos=
tile@vebox.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-tglb3/igt@gem_eio@in-flight-contexts-10ms.html">TIMEOUT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915=
#3063</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7475/shard-tglb3/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-iclb8/igt@gem_exec_balancer@parallel-bb-first.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7475/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-apl4/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/=
shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7475/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +3 s=
imilar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
475/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> +3 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-tglb8/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/=
shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-iclb8/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#284=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475=
/shard-iclb8/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-rkl-5/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6251">i915#625=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475=
/shard-rkl-4/igt@gem_exec_fence@basic-busy@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-rkl-5/igt@gem_exec_flush@basic-batch-kernel-default-wb.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09315">fdo#109315</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7475/shard-rkl-6/igt@gem_exec_flush@basic-batch-kernel-default-=
wb.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-rkl-6/igt@gem_mmap_gtt@coherency.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111656">fdo#111656</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard=
-rkl-5/igt@gem_mmap_gtt@coherency.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-rkl-2/igt@gem_tiled_partial_pwrite_pread@writes-after-r=
eads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7475/shard-rkl-5/igt@gem_tiled_partial_pwrite_pread@writes-a=
fter-reads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-apl1/igt@gem_workarounds@suspend-resume-context.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7475/shard-apl7/igt@gem_workarounds@suspend-resume-context.html">PAS=
S</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-kbl4/igt@gen9_exec_parse@allowed-single.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i91=
5#5566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716=
">i915#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7475/shard-kbl1/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-rkl-2/igt@gen9_exec_parse@bb-secure.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shar=
d-rkl-5/igt@gen9_exec_parse@bb-secure.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-snb2/igt@i915_module_load@reload-with-fault-injection.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/6201">i915#6201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7475/shard-snb4/igt@i915_module_load@reload-with-fault-injec=
tion.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-rkl-1/igt@i915_pm_backlight@basic-brightness.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3012">i915=
#3012</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7475/shard-rkl-6/igt@i915_pm_backlight@basic-brightness.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-tglu-6/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-tg=
lu-4/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-rkl-5/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-rk=
l-6/igt@i915_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-idle:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-dg1-13/igt@i915_pm_rpm@gem-idle.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5174">i915#5174</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-dg=
1-15/igt@i915_pm_rpm@gem-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-kbl1/igt@i915_suspend@forcewake.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shar=
d-kbl7/igt@i915_suspend@forcewake.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-glk9/igt@kms_async_flips@alternate-sync-async-flip@pipe=
-c-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2521">i915#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7475/shard-glk3/igt@kms_async_flips@alternate-sync-as=
ync-flip@pipe-c-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-rkl-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7475/shard-rkl-6/igt@kms_big_fb@y-tiled-addfb-size-offset-=
overflow.html">PASS</a> +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-snb6/igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7475/shard-snb4/igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1.htm=
l">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@all-pipes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-rkl-5/igt@kms_cursor_legacy@forked-bo@all-pipes.html">I=
NCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7475/shard-rkl-5/igt@kms_cursor_legacy@forked-bo@all-pipes.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-rkl-1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-unti=
led.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111314">fdo#111314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7475/shard-rkl-6/igt@kms_draw_crc@draw-method-x=
rgb8888-pwrite-untiled.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-glk3/igt@kms_flip@2x-modeset-vs-vblank-race@bc-hdmi-a1-=
hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/407">i915#407</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7475/shard-glk7/igt@kms_flip@2x-modeset-vs-vblank-race@bc-h=
dmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-=
indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-rkl-6/igt@kms_frontbuffer_tr=
acking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">PASS</a> +17 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-rkl-1/igt@kms_invalid_mode@bad-hsync-end.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4278">i915#427=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475=
/shard-rkl-6/igt@kms_invalid_mode@bad-hsync-end.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-rkl-1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7475/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-a-alp=
ha-opaque-fb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-glk8/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/118">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1888">i915#1888</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7475/shard-glk3/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a=
-1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-glk8/igt@kms_plane_lowres@tiling-y@pipe-b-hdmi-a-1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888=
">i915#1888</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7475/shard-glk3/igt@kms_plane_lowres@tiling-y@pipe-b-hdmi-a-1.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_render:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-rkl-1/igt@kms_psr@cursor_render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-rk=
l-6/igt@kms_psr@cursor_render.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-iclb8/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_74=
75/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-a-sanity:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-rkl-1/igt@kms_universal_plane@universal-plane-pipe-a-sa=
nity.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7475/shard-rkl-6/igt@kms_universal_plane@univers=
al-plane-pipe-a-sanity.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@gen12-mi-rpc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-rkl-5/igt@perf@gen12-mi-rpc.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo#109289</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-rkl-=
2/igt@perf@gen12-mi-rpc.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@interrupts-sync:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-dg1-13/igt@perf_pmu@interrupts-sync.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shar=
d-dg1-12/igt@perf_pmu@interrupts-sync.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@vcs1:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-dg1-13/igt@perf_pmu@semaphore-busy@vcs1.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/=
shard-dg1-15/igt@perf_pmu@semaphore-busy@vcs1.html">PASS</a> +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-rkl-1/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">fdo#109295=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3291">i91=
5#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/370=
8">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7475/shard-rkl-5/igt@prime_vgem@basic-fence-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@multi-wait-for-submit-available-submitted:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-dg1-13/igt@syncobj_timeline@multi-wait-for-submit-avail=
able-submitted.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7475/shard-dg1-19/igt@syncobj_timeline@multi-wait-=
for-submit-available-submitted.html">PASS</a> +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@invalid-reset-one-illegal-handle:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-rkl-5/igt@syncobj_wait@invalid-reset-one-illegal-handle=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7475/shard-rkl-2/igt@syncobj_wait@invalid-reset-one-illegal-hand=
le.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-tglb3/igt@gem_eio@kms.html">TIMEOUT</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-tglb5/igt=
@gem_eio@kms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-iclb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2852">i915=
#2852</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7475/shard-iclb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>=
)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i91=
5#2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7475/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/4767">i915#4767</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard=
-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/4939">i915#4939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exce=
ed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7475/shard-iclb7/igt@kms_psr2_sf@cursor-plane-move-co=
ntinuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11856/shard-iclb8/igt@kms_psr2_sf@overlay-plane-move-continuous-exc=
eed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7475/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-co=
ntinuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11856/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-kbl4/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11856/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-kbl1/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_11856/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-kbl1/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
11856/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/CI_DRM_11856/shard-kbl1/igt@runner@aborted.htm=
l">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/5257">i915#5257</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/716">i915#716</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-kbl7/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475=
/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7475/shard-kbl1/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/shard-=
kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7475/shard-kbl1/igt@runner@aborted.html">FAIL</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3=
002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">=
i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
5257">i915#5257</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/92">i915#92</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6561 -&gt; IGTPW_7475</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11856: 66c315cd3820fc20418d5756ceed6e5a039e69c5 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7475: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7475/index.htm=
l<br />
  IGT_6561: 4b673211d1645eaafa9da32eece4c274d8cd6c41 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============7479926505753837692==--
