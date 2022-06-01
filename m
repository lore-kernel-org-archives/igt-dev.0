Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6610509294330257081=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Wed, 01 Jun 2022 07:47:11 -0000
Message-ID: <165406963153.17295.17177649188134294663@emeril.freedesktop.org>
References: <20220531115805.3941871-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220531115805.3941871-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgU2tpcCBp?=
 =?utf-8?q?f_current_=26_requested_BPC_doesn=27t_match_=28rev8=29?=
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

--===============6610509294330257081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Skip if current & requested BPC doesn't match (rev8)
URL   : https://patchwork.freedesktop.org/series/104275/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11715_full -> IGTPW_7209_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7209_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7209_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/index.html

Participating hosts (13 -> 10)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7209_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_whisper@basic-contexts-priority:
    - shard-iclb:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb8/igt@gem_exec_whisper@basic-contexts-priority.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb6/igt@gem_exec_whisper@basic-contexts-priority.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-iclb:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb8/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb4/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
    - shard-kbl:          [PASS][5] -> [FAIL][6] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - {shard-rkl}:        NOTRUN -> [FAIL][7] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-edp-1:
    - {shard-rkl}:        NOTRUN -> [SKIP][8] +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-edp-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_7209_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-tglb:         [PASS][9] -> [TIMEOUT][10] ([i915#3063])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-tglb3/igt@gem_eio@in-flight-contexts-1us.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb3/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#4525]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb2/igt@gem_exec_balancer@parallel-contexts.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb5/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_endless@dispatch@bcs0:
    - shard-tglb:         [PASS][13] -> [INCOMPLETE][14] ([i915#3778])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-tglb1/igt@gem_exec_endless@dispatch@bcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb6/igt@gem_exec_endless@dispatch@bcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#2842]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl1/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#2842])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-apl8/igt@gem_exec_fair@basic-none@vecs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl3/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         NOTRUN -> [FAIL][21] ([i915#2842]) +4 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb1/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][22] ([i915#2842]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-glk7/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-iclb:         NOTRUN -> [FAIL][23] ([i915#2842]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb3/igt@gem_exec_fair@basic-pace@vecs0.html
    - shard-kbl:          NOTRUN -> [FAIL][24] ([i915#2842]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl3/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][25] -> [SKIP][26] ([i915#2190])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-tglb5/igt@gem_huc_copy@huc-copy.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@verify:
    - shard-glk:          NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#4613])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-glk5/igt@gem_lmem_swapping@verify.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-kbl:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#4613]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl6/igt@gem_lmem_swapping@verify-ccs.html
    - shard-apl:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#4613])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl3/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_mmap_wc@coherency:
    - shard-snb:          [PASS][30] -> [SKIP][31] ([fdo#109271]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-snb2/igt@gem_mmap_wc@coherency.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-snb6/igt@gem_mmap_wc@coherency.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#4270])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
    - shard-tglb:         NOTRUN -> [SKIP][33] ([i915#4270])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb6/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][34] -> [SKIP][35] ([fdo#109271])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-apl3/igt@i915_pm_dc@dc9-dpms.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl4/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-glk:          NOTRUN -> [SKIP][36] ([fdo#109271]) +73 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-glk5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-iclb:         NOTRUN -> [SKIP][37] ([fdo#109293] / [fdo#109506])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb7/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#109506] / [i915#2411])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#110892])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#111644] / [i915#1397] / [i915#2411])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-iclb:         [PASS][41] -> [FAIL][42] ([i915#3049])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb6/igt@i915_pm_rpm@pm-tiling.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb6/igt@i915_pm_rpm@pm-tiling.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][43] -> [DMESG-WARN][44] ([i915#180]) +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-kbl6/igt@i915_suspend@forcewake.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl7/igt@i915_suspend@forcewake.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][45] ([fdo#109271] / [i915#3886]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-glk2/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109278] / [i915#3886])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb2/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
    - shard-kbl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#3886]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl4/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#3689] / [i915#3886])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb7/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([i915#6095]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb6/igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [i915#3886]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl1/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#3689])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb5/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_ccs.html

  * igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([fdo#111615] / [i915#3689])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb1/igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_chamelium@dp-hpd-after-suspend:
    - shard-glk:          NOTRUN -> [SKIP][53] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-glk3/igt@kms_chamelium@dp-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-apl:          NOTRUN -> [SKIP][54] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl8/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-5:
    - shard-kbl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl3/igt@kms_color_chamelium@pipe-c-ctm-0-5.html
    - shard-snb:          NOTRUN -> [SKIP][56] ([fdo#109271] / [fdo#111827])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-snb6/igt@kms_color_chamelium@pipe-c-ctm-0-5.html
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#109284] / [fdo#111827])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb7/igt@kms_color_chamelium@pipe-c-ctm-0-5.html
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109284] / [fdo#111827])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb3/igt@kms_color_chamelium@pipe-c-ctm-0-5.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          [PASS][59] -> [DMESG-WARN][60] ([i915#180]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#3319])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-128x128-random:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109278]) +10 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb5/igt@kms_cursor_crc@pipe-d-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-128x42-sliding:
    - shard-kbl:          NOTRUN -> [SKIP][63] ([fdo#109271]) +122 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl7/igt@kms_cursor_crc@pipe-d-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#3359]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#109279] / [i915#3359])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x170-onscreen.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109274] / [fdo#109278])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#109274])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#109274] / [fdo#111825]) +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109274]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-glk:          [PASS][70] -> [FAIL][71] ([i915#4911])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-glk3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109280]) +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([fdo#109280] / [fdo#111825]) +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271]) +100 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][75] -> [SKIP][76] ([i915#433])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([i915#3555]) +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb3/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([i915#3555]) +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb7/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
    - shard-kbl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#533])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl7/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html
    - shard-apl:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#533])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][81] ([fdo#108145] / [i915#265])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-glk7/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][82] ([i915#265])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][83] ([i915#265])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-x:
    - shard-glk:          [PASS][84] -> [FAIL][85] ([i915#1888])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-glk9/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-glk4/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-glk:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#658]) +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-glk9/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-kbl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#658])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-iclb:         NOTRUN -> [SKIP][88] ([fdo#109642] / [fdo#111068] / [i915#658])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb6/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-apl:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#658]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl3/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#1911])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][91] -> [SKIP][92] ([fdo#109441]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb3/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_sysfs_edid_timing:
    - shard-kbl:          NOTRUN -> [FAIL][93] ([IGT#2])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl4/igt@kms_sysfs_edid_timing.html
    - shard-apl:          NOTRUN -> [FAIL][94] ([IGT#2])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl1/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          NOTRUN -> [DMESG-WARN][95] ([i915#180])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][96] ([i915#180])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@module-unload:
    - shard-iclb:         [PASS][97] -> [DMESG-WARN][98] ([i915#2867]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb4/igt@perf_pmu@module-unload.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb6/igt@perf_pmu@module-unload.html

  * igt@sw_sync@sync_multi_timeline_wait:
    - shard-kbl:          NOTRUN -> [FAIL][99] ([i915#6140])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl1/igt@sw_sync@sync_multi_timeline_wait.html
    - shard-apl:          NOTRUN -> [FAIL][100] ([i915#6140])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl1/igt@sw_sync@sync_multi_timeline_wait.html

  * igt@sysfs_clients@sema-50:
    - shard-snb:          NOTRUN -> [SKIP][101] ([fdo#109271]) +39 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-snb4/igt@sysfs_clients@sema-50.html
    - shard-apl:          NOTRUN -> [SKIP][102] ([fdo#109271] / [i915#2994]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl6/igt@sysfs_clients@sema-50.html
    - shard-tglb:         NOTRUN -> [SKIP][103] ([i915#2994])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb5/igt@sysfs_clients@sema-50.html
    - shard-glk:          NOTRUN -> [SKIP][104] ([fdo#109271] / [i915#2994])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-glk5/igt@sysfs_clients@sema-50.html
    - shard-iclb:         NOTRUN -> [SKIP][105] ([i915#2994])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb5/igt@sysfs_clients@sema-50.html

  * igt@sysfs_clients@split-10:
    - shard-kbl:          NOTRUN -> [SKIP][106] ([fdo#109271] / [i915#2994]) +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl4/igt@sysfs_clients@split-10.html

  
#### Possible fixes ####

  * igt@fbdev@eof:
    - {shard-rkl}:        ([SKIP][107], [SKIP][108]) ([i915#2582]) -> [PASS][109]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-4/igt@fbdev@eof.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-1/igt@fbdev@eof.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@fbdev@eof.html

  * igt@gem_eio@in-flight-immediate:
    - shard-tglb:         [TIMEOUT][110] ([i915#3063]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-tglb5/igt@gem_eio@in-flight-immediate.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb5/igt@gem_eio@in-flight-immediate.html

  * igt@gem_eio@kms:
    - shard-tglb:         [FAIL][112] ([i915#5784]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-tglb2/igt@gem_eio@kms.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb7/igt@gem_eio@kms.html

  * igt@gem_eio@suspend:
    - {shard-rkl}:        ([FAIL][114], [PASS][115]) ([i915#3736] / [i915#5115]) -> [PASS][116]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-4/igt@gem_eio@suspend.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-5/igt@gem_eio@suspend.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-1/igt@gem_eio@suspend.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [SKIP][117] ([i915#4525]) -> [PASS][118] +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb6/igt@gem_exec_balancer@parallel-out-fence.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb4/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_endless@dispatch@rcs0:
    - shard-apl:          [INCOMPLETE][119] ([i915#3778]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-apl1/igt@gem_exec_endless@dispatch@rcs0.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl6/igt@gem_exec_endless@dispatch@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [FAIL][121] ([i915#2842]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb6/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-kbl:          [FAIL][123] ([i915#2842]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-kbl4/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl1/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][125] ([i915#2842]) -> [PASS][126] +1 similar issue
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-snb:          [SKIP][127] ([fdo#109271]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-snb6/igt@gem_exec_flush@basic-wb-ro-before-default.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-snb2/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@i915_pm_dc@dc5-psr:
    - {shard-rkl}:        [SKIP][129] ([i915#658]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-1/igt@i915_pm_dc@dc5-psr.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][131] ([i915#454]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb1/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@cursor-dpms:
    - {shard-rkl}:        ([SKIP][133], [SKIP][134]) ([i915#1849]) -> [PASS][135]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-1/igt@i915_pm_rpm@cursor-dpms.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-4/igt@i915_pm_rpm@cursor-dpms.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@i915_pm_rpm@cursor-dpms.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-apl:          [DMESG-WARN][136] ([i915#180]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-apl6/igt@i915_suspend@fence-restore-untiled.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl1/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - {shard-rkl}:        [SKIP][138] ([i915#1845] / [i915#4098]) -> [PASS][139] +14 similar issues
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_color@pipe-b-ctm-0-25:
    - {shard-rkl}:        [SKIP][140] ([i915#1149] / [i915#4070] / [i915#4098]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-4/igt@kms_color@pipe-b-ctm-0-25.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_color@pipe-b-ctm-0-25.html

  * igt@kms_color@pipe-b-ctm-0-5:
    - {shard-rkl}:        ([SKIP][142], [SKIP][143]) ([i915#1149] / [i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][144]
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-1/igt@kms_color@pipe-b-ctm-0-5.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-4/igt@kms_color@pipe-b-ctm-0-5.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_color@pipe-b-ctm-0-5.html

  * igt@kms_color@pipe-b-ctm-negative:
    - {shard-rkl}:        [SKIP][145] ([i915#1149] / [i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-1/igt@kms_color@pipe-b-ctm-negative.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_color@pipe-b-ctm-negative.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen:
    - {shard-rkl}:        [SKIP][147] ([fdo#112022] / [i915#4070]) -> [PASS][148] +2 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-1/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][149] ([i915#180]) -> [PASS][150] +4 similar issues
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen:
    - {shard-dg1}:        [FAIL][151] -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-dg1-16/igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-dg1-12/igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-right-edge:
    - {shard-rkl}:        [SKIP][153] ([i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][154] +3 similar issues
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-1/igt@kms_cursor_edge_walk@pipe-b-256x256-right-edge.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_cursor_edge_walk@pipe-b-256x256-right-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-iclb:         [FAIL][155] ([i915#2346]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
    - {shard-rkl}:        [SKIP][157] ([fdo#111825] / [i915#4070]) -> [PASS][158] +2 similar issues
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-2/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html

  * igt@kms_cursor_legacy@pipe-c-forked-move:
    - {shard-rkl}:        [SKIP][159] ([i915#4070]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-1/igt@kms_cursor_legacy@pipe-c-forked-move.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-5/igt@kms_cursor_legacy@pipe-c-forked-move.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled:
    - {shard-rkl}:        ([SKIP][161], [SKIP][162]) ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][163] +1 similar issue
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-4/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - {shard-rkl}:        [SKIP][164] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][165] +2 similar issues
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-5/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-iclb:         [SKIP][166] ([i915#3701]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - {shard-rkl}:        ([SKIP][168], [SKIP][169]) ([i915#1849] / [i915#4098]) -> [PASS][170]
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
    - {shard-rkl}:        [SKIP][171] ([i915#1849] / [i915#4098]) -> [PASS][172] +8 similar issues
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_invalid_mode@int-max-clock:
    - {shard-rkl}:        [SKIP][173] ([i915#4278]) -> [PASS][174] +2 similar issues
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-5/igt@kms_invalid_mode@int-max-clock.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_invalid_mode@int-max-clock.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-planes:
    - {shard-rkl}:        [SKIP][175] ([i915#1849] / [i915#3558]) -> [PASS][176] +1 similar issue
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-2/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - {shard-rkl}:        ([SKIP][177], [SKIP][178]) ([i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][179]
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-2/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-4/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_lowres@pipe-d-tiling-x:
    - {shard-dg1}:        [FAIL][180] ([i915#5450]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-dg1-13/igt@kms_plane_lowres@pipe-d-tiling-x.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-dg1-12/igt@kms_plane_lowres@pipe-d-tiling-x.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][182] ([fdo#109441]) -> [PASS][183] +1 similar issue
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb3/igt@kms_psr@psr2_sprite_blt.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_psr@sprite_mmap_cpu:
    - {shard-rkl}:        [SKIP][184] ([i915#1072]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-2/igt@kms_psr@sprite_mmap_cpu.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_psr@sprite_mmap_cpu.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-iclb:         [SKIP][186] ([i915#5519]) -> [PASS][187] +1 similar issue
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-a:
    - {shard-rkl}:        [SKIP][188] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-2/igt@kms_universal_plane@disable-primary-vs-flip-pipe-a.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-a.html

  * igt@kms_vblank@pipe-c-query-idle-hang:
    - {shard-dg1}:        [INCOMPLETE][190] -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-dg1-19/igt@kms_vblank@pipe-c-query-idle-hang.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-dg1-15/igt@kms_vblank@pipe-c-query-idle-hang.html

  * igt@perf@polling-parameterized:
    - shard-glk:          [FAIL][192] ([i915#5639]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-glk3/igt@perf@polling-parameterized.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-glk9/igt@perf@polling-parameterized.html

  * igt@sysfs_timeslice_duration@timeout@vecs0:
    - shard-kbl:          [FAIL][194] ([i915#1755]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-kbl3/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl7/igt@sysfs_timeslice_duration@timeout@vecs0.html
    - shard-apl:          [FAIL][196] ([i915#1755]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-apl6/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl7/igt@sysfs_timeslice_duration@timeout@vecs0.html

  
#### Warnings ####

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-iclb:         [SKIP][198] ([i915#2920]) -> [SKIP][199] ([fdo#111068] / [i915#658])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-iclb:         [SKIP][200] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [FAIL][201] ([i915#5939])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb3/igt@kms_psr2_su@page_flip-p010.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
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
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112022]: https://bugs.freedesktop.org/show_bug.cgi?id=112022
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3049]: https://gitlab.freedesktop.org/drm/intel/issues/3049
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3376]: https://gitlab.freedesktop.org/drm/intel/issues/3376
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3736]: https://gitlab.freedesktop.org/drm/intel/issues/3736
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3778]: https://gitlab.freedesktop.org/drm/intel/issues/3778
  [i915#3810]: https://gitlab.freedesktop.org/drm/intel/issues/3810
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#4032]: https://gitlab.freedesktop.org/drm/intel/issues/4032
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4807]: https://gitlab.freedesktop.org/drm/intel/issues/4807
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4842]: https://gitlab.freedesktop.org/drm/intel/issues/4842
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4911]: https://gitlab.freedesktop.org/drm/intel/issues/4911
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5030]: https://gitlab.freedesktop.org/drm/intel/issues/5030
  [i915#5115]: https://gitlab.freedesktop.org/drm/intel/issues/5115
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5450]: https://gitlab.freedesktop.org/drm/intel/issues/5450
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5639]: https://gitlab.freedesktop.org/drm/intel/issues/5639
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6139]: https://gitlab.freedesktop.org/drm/intel/issues/6139
  [i915#6140]: https://gitlab.freedesktop.org/drm/intel/issues/6140
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6501 -> IGTPW_7209
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11715: 460840663a509ad38b53ae34b5a9f42e3fd4bf85 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7209: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/index.html
  IGT_6501: 5857938d4d3539deb43ecb03604b7c664b75e57d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/index.html

--===============6610509294330257081==
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
<tr><td><b>Series:</b></td><td>Skip if current &amp; requested BPC doesn&#39;t match (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/104275/">https://patchwork.freedesktop.org/series/104275/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11715_full -&gt; IGTPW_7209_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7209_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7209_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/index.html</p>
<h2>Participating hosts (13 -&gt; 10)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7209_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb8/igt@gem_exec_whisper@basic-contexts-priority.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb6/igt@gem_exec_whisper@basic-contexts-priority.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb8/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb4/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-edp-1:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-edp-1.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7209_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-contexts-1us:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-tglb3/igt@gem_eio@in-flight-contexts-1us.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb3/igt@gem_eio@in-flight-contexts-1us.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb2/igt@gem_exec_balancer@parallel-contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb5/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@bcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-tglb1/igt@gem_exec_endless@dispatch@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb6/igt@gem_exec_endless@dispatch@bcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3778">i915#3778</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl1/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-apl8/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl3/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb1/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-glk7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb3/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +3 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl3/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-tglb5/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb7/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-glk5/igt@gem_lmem_swapping@verify.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl6/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl3/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@coherency:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-snb2/igt@gem_mmap_wc@coherency.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-snb6/igt@gem_mmap_wc@coherency.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb6/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-apl3/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl4/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-glk5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +73 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb7/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109293">fdo#109293</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109506">fdo#109506</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109506">fdo#109506</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110892">fdo#110892</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111644">fdo#111644</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-tiling:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb6/igt@i915_pm_rpm@pm-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb6/igt@i915_pm_rpm@pm-tiling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3049">i915#3049</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-kbl6/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl7/igt@i915_suspend@forcewake.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-glk2/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb2/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl4/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb7/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb6/igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl1/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb5/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb1/igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-after-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-glk3/igt@kms_chamelium@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl8/igt@kms_chamelium@hdmi-hpd-storm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-5:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl3/igt@kms_color_chamelium@pipe-c-ctm-0-5.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +6 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-snb6/igt@kms_color_chamelium@pipe-c-ctm-0-5.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb7/igt@kms_color_chamelium@pipe-c-ctm-0-5.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb3/igt@kms_color_chamelium@pipe-c-ctm-0-5.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3319">i915#3319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-128x128-random:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb5/igt@kms_cursor_crc@pipe-d-cursor-128x128-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-128x42-sliding:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl7/igt@kms_cursor_crc@pipe-d-cursor-128x42-sliding.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +122 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x170-onscreen.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb5/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-glk3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4911">i915#4911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +100 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb3/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb7/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl7/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-glk7/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-x:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-glk9/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-glk4/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-glk9/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl1/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl3/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1911">i915#1911</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb3/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl4/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IGT#2</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl1/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IGT#2</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb4/igt@perf_pmu@module-unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb6/igt@perf_pmu@module-unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sw_sync@sync_multi_timeline_wait:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl1/igt@sw_sync@sync_multi_timeline_wait.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6140">i915#6140</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl1/igt@sw_sync@sync_multi_timeline_wait.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6140">i915#6140</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-50:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-snb4/igt@sysfs_clients@sema-50.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +39 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl6/igt@sysfs_clients@sema-50.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2994</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb5/igt@sysfs_clients@sema-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2994</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-glk5/igt@sysfs_clients@sema-50.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2994</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb5/igt@sysfs_clients@sema-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2994</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl4/igt@sysfs_clients@split-10.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2994</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>{shard-rkl}:        (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-4/igt@fbdev@eof.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-1/igt@fbdev@eof.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@fbdev@eof.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-immediate:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-tglb5/igt@gem_eio@in-flight-immediate.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb5/igt@gem_eio@in-flight-immediate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-tglb2/igt@gem_eio@kms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb7/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@suspend:</p>
<ul>
<li>{shard-rkl}:        (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-4/igt@gem_eio@suspend.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-5/igt@gem_eio@suspend.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3736">i915#3736</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5115">i915#5115</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-1/igt@gem_eio@suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb6/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb4/igt@gem_exec_balancer@parallel-out-fence.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-apl1/igt@gem_exec_endless@dispatch@rcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3778">i915#3778</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl6/igt@gem_exec_endless@dispatch@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-tglb6/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-kbl4/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl1/igt@gem_exec_fair@basic-none-vip@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-before-default:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-snb6/igt@gem_exec_flush@basic-wb-ro-before-default.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-snb2/igt@gem_exec_flush@basic-wb-ro-before-default.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-1/igt@i915_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@i915_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb2/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb1/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor-dpms:</p>
<ul>
<li>{shard-rkl}:        (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-1/igt@i915_pm_rpm@cursor-dpms.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-4/igt@i915_pm_rpm@cursor-dpms.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@i915_pm_rpm@cursor-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-apl6/igt@i915_suspend@fence-restore-untiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl1/igt@i915_suspend@fence-restore-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-0-25:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-4/igt@kms_color@pipe-b-ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_color@pipe-b-ctm-0-25.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-0-5:</p>
<ul>
<li>{shard-rkl}:        (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-1/igt@kms_color@pipe-b-ctm-0-5.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-4/igt@kms_color@pipe-b-ctm-0-5.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_color@pipe-b-ctm-0-5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-negative:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-1/igt@kms_color@pipe-b-ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_color@pipe-b-ctm-negative.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-1/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112022">fdo#112022</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-dg1-16/igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-dg1-12/igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-256x256-right-edge:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-1/igt@kms_cursor_edge_walk@pipe-b-256x256-right-edge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_cursor_edge_walk@pipe-b-256x256-right-edge.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-2/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-c-forked-move:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-1/igt@kms_cursor_legacy@pipe-c-forked-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-5/igt@kms_cursor_legacy@pipe-c-forked-move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled:</p>
<ul>
<li>{shard-rkl}:        (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-4/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html">SKIP</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111314">fdo#111314</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4369">i915#4369</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-5/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111314">fdo#111314</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4369">i915#4369</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3701">i915#3701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>{shard-rkl}:        (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-stridechange.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-stridechange.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-stridechange.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html">PASS</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-5/igt@kms_invalid_mode@int-max-clock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4278">i915#4278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_invalid_mode@int-max-clock.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-planes:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-2/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3558">i915#3558</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>{shard-rkl}:        (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-2/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-4/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-x:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-dg1-13/igt@kms_plane_lowres@pipe-d-tiling-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5450">i915#5450</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-dg1-12/igt@kms_plane_lowres@pipe-d-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb3/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_mmap_cpu:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-2/igt@kms_psr@sprite_mmap_cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_psr@sprite_mmap_cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5519">i915#5519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-a:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-rkl-2/igt@kms_universal_plane@disable-primary-vs-flip-pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-rkl-6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-query-idle-hang:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-dg1-19/igt@kms_vblank@pipe-c-query-idle-hang.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-dg1-15/igt@kms_vblank@pipe-c-query-idle-hang.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-glk3/igt@perf@polling-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5639">i915#5639</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-glk9/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout@vecs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-kbl3/igt@sysfs_timeslice_duration@timeout@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1755">i915#1755</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-kbl7/igt@sysfs_timeslice_duration@timeout@vecs0.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-apl6/igt@sysfs_timeslice_duration@timeout@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1755">i915#1755</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-apl7/igt@sysfs_timeslice_duration@timeout@vecs0.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#2920</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11715/shard-iclb3/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5939">i915#5939</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6501 -&gt; IGTPW_7209</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11715: 460840663a509ad38b53ae34b5a9f42e3fd4bf85 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7209: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7209/index.html<br />
  IGT_6501: 5857938d4d3539deb43ecb03604b7c664b75e57d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============6610509294330257081==--
