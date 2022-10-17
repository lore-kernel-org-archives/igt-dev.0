Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5593360278118114058=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Date: Mon, 17 Oct 2022 22:33:53 -0000
Message-ID: <166604603333.13569.12957145068084667013@emeril.freedesktop.org>
References: <20221017053524.2538178-1-riana.tauro@intel.com>
In-Reply-To: <20221017053524.2538178-1-riana.tauro@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIGh3?=
 =?utf-8?q?mon_energy_support_for_dgfx_=28rev5=29?=
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

--===============5593360278118114058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add hwmon energy support for dgfx (rev5)
URL   : https://patchwork.freedesktop.org/series/108185/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12250_full -> IGTPW_7968_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7968_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7968_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/index.html

Participating hosts (9 -> 8)
------------------------------

  Additional (2): shard-rkl shard-dg1 
  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7968_full:

### IGT changes ###

#### Possible regressions ####

  * igt@api_intel_bb@object-noreloc-purge-cache-simple:
    - shard-tglb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12250/shard-tglb1/igt@api_intel_bb@object-noreloc-purge-cache-simple.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb2/igt@api_intel_bb@object-noreloc-purge-cache-simple.html
    - shard-apl:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-apl1/igt@api_intel_bb@object-noreloc-purge-cache-simple.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-tglb:         [PASS][4] -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12250/shard-tglb1/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb5/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          NOTRUN -> [INCOMPLETE][6] +7 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-apl2/igt@gem_workarounds@suspend-resume.html

  
#### Warnings ####

  * igt@gem_eio@in-flight-suspend:
    - shard-apl:          [INCOMPLETE][7] ([i915#7112]) -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12250/shard-apl2/igt@gem_eio@in-flight-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-apl7/igt@gem_eio@in-flight-suspend.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-apl:          [INCOMPLETE][9] ([i915#7227]) -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12250/shard-apl7/igt@gem_pwrite@basic-exhaustion.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-apl3/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglb:         [WARN][11] ([i915#2658]) -> [INCOMPLETE][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12250/shard-tglb2/igt@gem_pwrite@basic-exhaustion.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@gem_pwrite@basic-exhaustion.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-apl:          [INCOMPLETE][13] ([i915#4939]) -> [INCOMPLETE][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12250/shard-apl2/igt@i915_suspend@fence-restore-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-apl6/igt@i915_suspend@fence-restore-untiled.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@runner@aborted:
    - {shard-dg1}:        NOTRUN -> ([FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18], [FAIL][19], [FAIL][20], [FAIL][21], [FAIL][22], [FAIL][23], [FAIL][24], [FAIL][25], [FAIL][26], [FAIL][27], [FAIL][28], [FAIL][29], [FAIL][30], [FAIL][31], [FAIL][32], [FAIL][33], [FAIL][34], [FAIL][35])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-19/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-19/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-19/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-16/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-16/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-18/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-15/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-16/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-15/igt@runner@aborted.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-17/igt@runner@aborted.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-17/igt@runner@aborted.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-15/igt@runner@aborted.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-17/igt@runner@aborted.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-13/igt@runner@aborted.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-18/igt@runner@aborted.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-13/igt@runner@aborted.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-12/igt@runner@aborted.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-18/igt@runner@aborted.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-12/igt@runner@aborted.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-13/igt@runner@aborted.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-12/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_7968_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@drm_mm@all:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#6433])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb2/igt@drm_mm@all.html

  * igt@feature_discovery@display-2x:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#1839]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@feature_discovery@display-2x.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#3555] / [i915#5325])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#5325]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb2/igt@gem_ccs@suspend-resume.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#6335])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-massive:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][41] ([i915#4991])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb2/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@legacy-engines-cleanup:
    - shard-snb:          NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#1099]) +3 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-snb4/igt@gem_ctx_persistence@legacy-engines-cleanup.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][43] ([i915#2842]) +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_params@secure-non-master:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#112283])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@gem_exec_params@secure-non-master.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([i915#4613]) +7 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-apl:          NOTRUN -> [SKIP][46] ([fdo#109271] / [i915#4613]) +4 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-apl8/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#4270]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb2/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-apl:          NOTRUN -> [SKIP][48] ([fdo#109271]) +322 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-apl2/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#109312]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb2/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@input-checking:
    - shard-apl:          NOTRUN -> [DMESG-WARN][50] ([i915#4991])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-apl7/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#3297]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-apl:          NOTRUN -> [FAIL][52] ([i915#3318])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-apl3/igt@gem_userptr_blits@vma-merge.html
    - shard-tglb:         NOTRUN -> [FAIL][53] ([i915#3318])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109289]) +6 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#2527] / [i915#2856]) +6 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-apl:          NOTRUN -> [FAIL][56] ([i915#7036])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-apl2/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         NOTRUN -> [FAIL][57] ([i915#3989] / [i915#454]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#1902])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb2/igt@i915_pm_lpsp@screens-disabled.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#111644] / [i915#1397]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([i915#4387])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb5/igt@i915_pm_sseu@full-enable.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#1769])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#5286]) +8 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#111614]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#7206])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-apl7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#111615]) +8 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb2/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_joiner@basic:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#2705])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@kms_big_joiner@basic.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][67] ([fdo#109271] / [i915#3886]) +19 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-apl3/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([i915#3689] / [i915#6095]) +4 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#3689] / [i915#3886]) +7 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#6095]) +9 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb2/igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#111615] / [i915#3689]) +6 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_ccs@pipe-c-ccs-on-another-bo-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([i915#3689]) +14 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb2/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#3742])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium@hdmi-audio-edid:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([fdo#109284] / [fdo#111827]) +16 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb2/igt@kms_chamelium@hdmi-audio-edid.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-snb:          NOTRUN -> [SKIP][75] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-snb4/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@vga-hpd-after-suspend:
    - shard-apl:          NOTRUN -> [SKIP][76] ([fdo#109271] / [fdo#111827]) +19 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-apl2/igt@kms_chamelium@vga-hpd-after-suspend.html

  * igt@kms_color@ctm-0-25@pipe-c-edp-1:
    - shard-tglb:         NOTRUN -> [FAIL][77] ([i915#315] / [i915#6946]) +3 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_color@ctm-0-25@pipe-c-edp-1.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#7118]) +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb5/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@uevent@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [FAIL][79] ([i915#1339] / [i915#7144])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-apl1/igt@kms_content_protection@uevent@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#3359]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([fdo#109274] / [fdo#111825] / [i915#3637]) +6 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([i915#2587] / [i915#2672]) +4 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([fdo#109285])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb5/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-snb:          NOTRUN -> [FAIL][84] ([fdo#103375]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-snb7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-snb:          NOTRUN -> [SKIP][85] ([fdo#109271]) +184 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-snb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-tglb:         NOTRUN -> [SKIP][86] ([i915#6497]) +15 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([fdo#109280] / [fdo#111825]) +49 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][88] -> [SKIP][89] ([i915#433])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12250/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#3555]) +8 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([i915#6403]) +3 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d.html

  * igt@kms_plane_lowres@tiling-none@pipe-c-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([i915#3536]) +3 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb5/igt@kms_plane_lowres@tiling-none@pipe-c-edp-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([fdo#112054] / [i915#5288])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([fdo#109274] / [fdo#111825]) +11 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-b-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][95] ([i915#5176]) +19 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][96] ([i915#5235]) +3 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-apl:          NOTRUN -> [SKIP][97] ([fdo#109271] / [i915#658]) +3 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-apl1/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
    - shard-tglb:         NOTRUN -> [SKIP][98] ([i915#2920])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([i915#7037])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-tglb:         NOTRUN -> [FAIL][100] ([i915#132] / [i915#3467]) +4 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb5/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-tglb:         NOTRUN -> [SKIP][101] ([fdo#111615] / [i915#5289])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d:
    - shard-tglb:         NOTRUN -> [SKIP][102] ([i915#5030]) +3 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          NOTRUN -> [INCOMPLETE][103] ([i915#4939]) +2 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-apl7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-apl:          NOTRUN -> [SKIP][104] ([fdo#109271] / [i915#2437]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-apl6/igt@kms_writeback@writeback-pixel-formats.html
    - shard-tglb:         NOTRUN -> [SKIP][105] ([i915#2437])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb5/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sysfs_clients@fair-0:
    - shard-tglb:         NOTRUN -> [SKIP][106] ([i915#2994]) +3 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb2/igt@sysfs_clients@fair-0.html

  * igt@sysfs_clients@pidname:
    - shard-apl:          NOTRUN -> [SKIP][107] ([fdo#109271] / [i915#2994]) +5 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-apl8/igt@sysfs_clients@pidname.html

  
#### Possible fixes ####

  * igt@gem_eio@reset-stress:
    - shard-tglb:         [FAIL][108] ([i915#5784]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12250/shard-tglb2/igt@gem_eio@reset-stress.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb5/igt@gem_eio@reset-stress.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglb:         [FAIL][110] ([i915#3743]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12250/shard-tglb5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-tglb:         [FAIL][112] ([i915#7225]) -> [SKIP][113] ([fdo#109280] / [fdo#111825])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12250/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][114], [FAIL][115], [FAIL][116], [FAIL][117]) ([fdo#109271] / [i915#3002] / [i915#4312]) -> ([FAIL][118], [FAIL][119], [FAIL][120]) ([i915#3002] / [i915#4312])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12250/shard-apl1/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12250/shard-apl3/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12250/shard-apl3/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12250/shard-apl1/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-apl1/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-apl7/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-apl2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1339]: https://gitlab.freedesktop.org/drm/intel/issues/1339
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4939]: https://gitlab.freedesktop.org/drm/intel/issues/4939
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5030]: https://gitlab.freedesktop.org/drm/intel/issues/5030
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6403]: https://gitlab.freedesktop.org/drm/intel/issues/6403
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
  [i915#7036]: https://gitlab.freedesktop.org/drm/intel/issues/7036
  [i915#7037]: https://gitlab.freedesktop.org/drm/intel/issues/7037
  [i915#7112]: https://gitlab.freedesktop.org/drm/intel/issues/7112
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7144]: https://gitlab.freedesktop.org/drm/intel/issues/7144
  [i915#7206]: https://gitlab.freedesktop.org/drm/intel/issues/7206
  [i915#7220]: https://gitlab.freedesktop.org/drm/intel/issues/7220
  [i915#7225]: https://gitlab.freedesktop.org/drm/intel/issues/7225
  [i915#7227]: https://gitlab.freedesktop.org/drm/intel/issues/7227


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7016 -> IGTPW_7968
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12250: 9b84132c9b266a89e2865cbe8b586dd0b14cc2a4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7968: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/index.html
  IGT_7016: 642f4bf44e2b42791b4d1684936a1bfbe2d099ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/index.html

--===============5593360278118114058==
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
<tr><td><b>Series:</b></td><td>Add hwmon energy support for dgfx (rev5)</td=
></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/108185/">https://patchwork.freedesktop.org/series/108185/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7968/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7968/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12250_full -&gt; IGTPW_7968_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7968_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7968_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/index.=
html</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Additional (2): shard-rkl shard-dg1 <br />
  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7968=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-noreloc-purge-cache-simple:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12250/shard-tglb1/igt@api_intel_bb@object-noreloc-purge-cache-simple=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7968/shard-tglb2/igt@api_intel_bb@object-noreloc-purge-cache-simple.ht=
ml">FAIL</a></p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7968/shard-apl1/igt@api_intel_bb@object-noreloc-purge-ca=
che-simple.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12250/shard-tglb1/igt@gem_exec_whisper@basic-contexts-priority-all.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7968/shard-tglb5/igt@gem_exec_whisper@basic-contexts-priority-all.html"=
>INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-apl2/igt@gem_workarounds@suspend-resume.html=
">INCOMPLETE</a> +7 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12250/shard-apl2/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7112">i915#711=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968=
/shard-apl7/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12250/shard-apl7/igt@gem_pwrite@basic-exhaustion.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7227">i915#72=
27</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_796=
8/shard-apl3/igt@gem_pwrite@basic-exhaustion.html">INCOMPLETE</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12250/shard-tglb2/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/sha=
rd-tglb7/igt@gem_pwrite@basic-exhaustion.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12250/shard-apl2/igt@i915_suspend@fence-restore-untiled.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4939"=
>i915#4939</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7968/shard-apl6/igt@i915_suspend@fence-restore-untiled.html">INCOMPLET=
E</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>igt@runner@aborted:<ul>
<li>{shard-dg1}:        NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7968/shard-dg1-19/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-19/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7968/shard-dg1-19/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-16/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7968/shard-dg1-16/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-18/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7968/shard-dg1-15/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-16/igt@runne=
r@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7968/shard-dg1-15/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-17/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7968/shard-dg1-17/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-15/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7968/shard-dg1-17/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-13/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7968/shard-dg1-18/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-13/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_796=
8/shard-dg1-12/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-18/igt@runner@aborted.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/s=
hard-dg1-12/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7968/shard-dg1-13/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shar=
d-dg1-12/igt@runner@aborted.html">FAIL</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7968_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@drm_mm@all:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb2/igt@drm_mm@all.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/6433">i915#6433</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@feature_discovery@display-2x.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839"=
>i915#1839</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@gem_ccs@ctrl-surf-copy.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#=
3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5325"=
>i915#5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb2/igt@gem_ccs@suspend-resume.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#=
5325</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@gem_create@create-ext-cpu-access-s=
anity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb2/igt@gem_create@create-massive.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/49=
91">i915#4991</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-cleanup:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-snb4/igt@gem_ctx_persistence@legacy-engines-=
cleanup.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1099">i915#1099</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs=
0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2842">i915#2842</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@gem_exec_params@secure-non-master.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
12283">fdo#112283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@gem_lmem_swapping@heavy-random.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/461=
3">i915#4613</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-apl8/igt@gem_lmem_swapping@heavy-verify-rand=
om-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4613">i915#4613</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb2/igt@gem_pxp@protected-encrypted-src-co=
py-not-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/4270">i915#4270</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-apl2/igt@gem_render_copy@x-tiled-to-vebox-yf=
-tiled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a>) +322 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb2/igt@gem_softpin@evict-snoop.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109312">fdo=
#109312</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-apl7/igt@gem_userptr_blits@input-checking.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4991">i915#4991</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@gem_userptr_blits@unsync-unmap-cyc=
les.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/3297">i915#3297</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7968/shard-apl3/igt@gem_userptr_blits@vma-merge.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3318">i9=
15#3318</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7968/shard-tglb7/igt@gem_userptr_blits@vma-merge.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3318">i=
915#3318</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@gen7_exec_parse@load-register-reg.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09289">fdo#109289</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@gen9_exec_parse@basic-rejected-ctx=
-param.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2856">i915#2856</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-apl2/igt@i915_pipe_stress@stress-xrgb8888-yt=
iled.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/7036">i915#7036</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@i915_pm_dc@dc6-dpms.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3989">i915#398=
9</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i91=
5#454</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb2/igt@i915_pm_lpsp@screens-disabled.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1902=
">i915#1902</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb5/igt@i915_pm_rpm@dpms-mode-unset-non-lp=
sp.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111644">fdo#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1397">i915#1397</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb5/igt@i915_pm_sseu@full-enable.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4387">i91=
5#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_atomic_transition@plane-all-mo=
deset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_big_fb@4-tiled-max-hw-stride-6=
4bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5286">i915#5286</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_big_fb@x-tiled-32bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111614">fdo#111614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-apl7/igt@kms_big_fb@y-tiled-max-hw-stride-64=
bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/7206">i915#7206</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb2/igt@kms_big_fb@yf-tiled-8bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111615">fdo#111615</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@kms_big_joiner@basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#27=
05</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-apl3/igt@kms_ccs@pipe-a-crc-primary-rotation=
-180-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +19 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@kms_ccs@pipe-b-bad-pixel-format-4_=
tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/6095">i915#6095</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_ccs@pipe-b-bad-pixel-format-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb2/igt@kms_ccs@pipe-c-bad-pixel-format-4_=
tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/6095">i915#6095</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_ccs@pipe-c-ccs-on-another-bo-y=
f_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3689">i915#3689</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb2/igt@kms_ccs@pipe-d-bad-pixel-format-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3689">i915#3689</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_cdclk@mode-transition-all-outp=
uts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio-edid:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb2/igt@kms_chamelium@hdmi-audio-edid.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10928=
4">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-snb4/igt@kms_chamelium@hdmi-edid-change-duri=
ng-suspend.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-after-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-apl2/igt@kms_chamelium@vga-hpd-after-suspend=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_color@ctm-0-25@pipe-c-edp-1.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/31=
5">i915#315</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/6946">i915#6946</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb5/igt@kms_content_protection@atomic-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/7118">i915#7118</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-apl1/igt@kms_content_protection@uevent@pipe-=
a-dp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1339">i915#1339</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/7144">i915#7144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@kms_cursor_crc@cursor-rapid-moveme=
nt-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3359">i915#3359</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@kms_flip@2x-flip-vs-panning-interr=
uptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111825">fdo#111825</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3637">i915#3637</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb2/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</=
a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb5/igt@kms_force_connector_basic@force-lo=
ad-detect.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-snb7/igt@kms_frontbuffer_tracking@fbc-suspen=
d.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D103375">fdo#103375</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-snb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +184 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-in=
dfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/6497">i915#6497</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +49 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12250/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-t=
glb7/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_hdr@bpc-switch-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i=
915#3555</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@kms_invalid_mode@clock-too-high@ed=
p-1-pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/6403">i915#6403</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-c-edp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb5/igt@kms_plane_lowres@tiling-none@pipe-=
c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/3536">i915#3536</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_plane_lowres@tiling-yf.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112054">=
fdo#112054</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5288">i915#5288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb5/igt@kms_plane_scaling@2x-scaler-multi-=
pipe.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111825">fdo#111825</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-b-ed=
p-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@kms_plane_scaling@plane-scaler-wit=
h-rotation-unity-scaling@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +19 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-=
edp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb5/igt@kms_plane_scaling@planes-upscale-2=
0x20-downscale-factor-0-25@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7968/shard-apl1/igt@kms_psr2_sf@cursor-plane-move-contin=
uous-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/658">i915#658</a>) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2920">i915#2920</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_psr2_su@page_flip-xrgb8888.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/703=
7">i915#7037</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb5/igt@kms_psr@psr2_cursor_mmap_gtt.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132">=
i915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
467">i915#3467</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb5/igt@kms_rotation_crc@primary-yf-tiled-=
reflect-x-90.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@kms_scaling_modes@scaling-mode-non=
e@edp-1-pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/5030">i915#5030</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-apl7/igt@kms_vblank@pipe-b-ts-continuation-s=
uspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4939">i915#4939</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7968/shard-apl6/igt@kms_writeback@writeback-pixel-format=
s.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2437">i915#2437</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7968/shard-tglb5/igt@kms_writeback@writeback-pixel-forma=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2437">i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-tglb2/igt@sysfs_clients@fair-0.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#29=
94</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@pidname:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7968/shard-apl8/igt@sysfs_clients@pidname.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>) +5 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12250/shard-tglb2/igt@gem_eio@reset-stress.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tg=
lb5/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12250/shard-tglb5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate=
-180-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3743">i915#3743</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7968/shard-tglb1/igt@kms_big_fb@y-tiled-max-hw-st=
ride-32bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12250/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-p=
ri-indfb-draw-render.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/7225">i915#7225</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7968/shard-tglb7/igt@kms_frontbuffer_trackin=
g@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_12250/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12250/shard-apl3/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_12250/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12250/shard-apl1/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4312">i915#4312</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7968/shard-apl1/igt@runner@aborted.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/shard-a=
pl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7968/shard-apl2/igt@runner@aborted.html">FAIL</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#=
4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7016 -&gt; IGTPW_7968</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12250: 9b84132c9b266a89e2865cbe8b586dd0b14cc2a4 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7968: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/index.htm=
l<br />
  IGT_7016: 642f4bf44e2b42791b4d1684936a1bfbe2d099ee @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============5593360278118114058==--
