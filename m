Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2420435394088108579=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Fri, 08 Apr 2022 17:52:45 -0000
Message-ID: <164944036505.22676.4540825793246675591@emeril.freedesktop.org>
References: <20220407051908.3390083-1-lucas.demarchi@intel.com>
In-Reply-To: <20220407051908.3390083-1-lucas.demarchi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?intel-ci/fast-feedback=3A_Move_gem=5Flmem=5Fswapping_further_?=
 =?utf-8?b?KHJldjMp?=
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

--===============2420435394088108579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel-ci/fast-feedback: Move gem_lmem_swapping further (rev3)
URL   : https://patchwork.freedesktop.org/series/102312/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11477_full -> IGTPW_6906_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6906_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6906_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/index.html

Participating hosts (11 -> 6)
------------------------------

  Missing    (5): shard-skl pig-kbl-iris shard-tglu pig-glk-j5005 pig-skl-6260u 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6906_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-kbl6/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         [SKIP][4] ([i915#4525]) -> [DMESG-WARN][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-iclb6/igt@gem_exec_balancer@parallel-contexts.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html

  
Known issues
------------

  Here are the changes found in IGTPW_6906_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-2x:
    - shard-tglb:         NOTRUN -> [SKIP][6] ([i915#1839])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb8/igt@feature_discovery@display-2x.html

  * igt@gem_create@create-massive:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][7] ([i915#4991])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-kbl6/igt@gem_create@create-massive.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][8] ([i915#4991])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-glk1/igt@gem_create@create-massive.html
    - shard-apl:          NOTRUN -> [DMESG-WARN][9] ([i915#4991])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-apl7/igt@gem_create@create-massive.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglb:         NOTRUN -> [SKIP][10] ([i915#280])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb1/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@kms:
    - shard-tglb:         NOTRUN -> [FAIL][11] ([i915#232])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb5/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-iclb:         NOTRUN -> [SKIP][12] ([i915#4525])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb6/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          NOTRUN -> [FAIL][13] ([i915#2842]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#2842]) +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][16] ([i915#2842])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-wb-ro-default:
    - shard-snb:          [PASS][17] -> [SKIP][18] ([fdo#109271]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-snb2/igt@gem_exec_flush@basic-wb-ro-default.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-snb6/igt@gem_exec_flush@basic-wb-ro-default.html

  * igt@gem_huc_copy@huc-copy:
    - shard-glk:          NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#2190])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-glk7/igt@gem_huc_copy@huc-copy.html
    - shard-iclb:         NOTRUN -> [SKIP][20] ([i915#2190])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb2/igt@gem_huc_copy@huc-copy.html
    - shard-kbl:          NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#2190])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-kbl3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-iclb:         NOTRUN -> [SKIP][22] ([i915#4613])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb8/igt@gem_lmem_swapping@random-engines.html
    - shard-tglb:         NOTRUN -> [SKIP][23] ([i915#4613])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb2/igt@gem_lmem_swapping@random-engines.html
    - shard-kbl:          NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#4613])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-kbl3/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][25] ([i915#2658])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-snb7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([i915#4270])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb1/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#4270]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb8/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#768]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb5/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][29] ([fdo#109312])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb2/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-iclb:         NOTRUN -> [SKIP][30] ([fdo#109312])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb1/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#3297])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb3/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([fdo#109289]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb4/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([i915#2527] / [i915#2856]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb3/igt@gen9_exec_parse@bb-start-cmd.html
    - shard-iclb:         NOTRUN -> [SKIP][34] ([i915#2856]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb6/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([i915#1902])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb1/igt@i915_pm_lpsp@screens-disabled.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglb:         NOTRUN -> [WARN][36] ([i915#2681] / [i915#2684])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb3/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-iclb:         NOTRUN -> [FAIL][37] ([i915#2680])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([fdo#109293] / [fdo#109506])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb2/igt@i915_pm_rpm@pc8-residency.html
    - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#109506] / [i915#2411])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb1/igt@i915_pm_rpm@pc8-residency.html

  * igt@i915_pm_sseu@full-enable:
    - shard-apl:          [PASS][40] -> [FAIL][41] ([i915#3524])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-apl3/igt@i915_pm_sseu@full-enable.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-apl3/igt@i915_pm_sseu@full-enable.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          NOTRUN -> [DMESG-WARN][42] ([i915#180])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-apl7/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][43] -> [DMESG-WARN][44] ([i915#180]) +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-apl4/igt@i915_suspend@sysfs-reader.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-apl4/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-glk:          NOTRUN -> [SKIP][45] ([fdo#109271]) +88 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-glk2/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#5286]) +4 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
    - shard-iclb:         NOTRUN -> [SKIP][47] ([i915#5286])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-apl:          NOTRUN -> [SKIP][48] ([fdo#109271]) +117 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-apl8/igt@kms_big_fb@linear-16bpp-rotate-90.html
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#110725] / [fdo#111614]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb4/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-glk:          [PASS][50] -> [FAIL][51] ([i915#1888] / [i915#5138])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-glk3/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-glk3/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([fdo#111614]) +4 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb3/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-glk:          NOTRUN -> [SKIP][53] ([fdo#109271] / [i915#3777])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-glk1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-apl:          NOTRUN -> [SKIP][54] ([fdo#109271] / [i915#3777]) +3 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-apl1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#110723])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb2/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-kbl:          NOTRUN -> [SKIP][56] ([fdo#109271] / [i915#3777]) +4 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-kbl6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#111615]) +5 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#3886]) +4 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-apl4/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([i915#3689] / [i915#3886]) +5 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb1/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][60] ([fdo#109271] / [i915#3886]) +5 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-glk7/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][61] ([fdo#109271] / [i915#3886]) +9 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-kbl3/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109278] / [i915#3886]) +6 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb8/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#111615] / [i915#3689]) +7 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb8/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#3689]) +8 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb2/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_ccs.html

  * igt@kms_chamelium@dp-hpd-fast:
    - shard-snb:          NOTRUN -> [SKIP][65] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-snb5/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_chamelium@hdmi-aspect-ratio:
    - shard-glk:          NOTRUN -> [SKIP][66] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-glk4/igt@kms_chamelium@hdmi-aspect-ratio.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb5/igt@kms_color_chamelium@pipe-a-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-kbl:          NOTRUN -> [SKIP][68] ([fdo#109271] / [fdo#111827]) +13 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-kbl7/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-25:
    - shard-apl:          NOTRUN -> [SKIP][69] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-apl8/igt@kms_color_chamelium@pipe-c-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#109284] / [fdo#111827]) +9 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb8/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([i915#1063]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb8/igt@kms_content_protection@atomic-dpms.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][73] ([i915#1319])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-kbl3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@mei_interface:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109300] / [fdo#111066]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb1/igt@kms_content_protection@mei_interface.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([i915#3359]) +6 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#3319]) +6 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([fdo#109279] / [i915#3359]) +11 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge:
    - shard-glk:          [PASS][79] -> [DMESG-WARN][80] ([i915#118] / [i915#1888])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-glk6/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-glk3/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html
    - shard-iclb:         [PASS][81] -> [DMESG-FAIL][82] ([i915#1888])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-iclb3/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb7/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html

  * igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109278]) +31 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb3/igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#109274] / [fdo#111825]) +10 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109274] / [fdo#109278]) +3 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([i915#426])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb5/igt@kms_dp_tiled_display@basic-test-pattern.html
    - shard-tglb:         NOTRUN -> [SKIP][87] ([i915#426])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb2/igt@kms_dp_tiled_display@basic-test-pattern.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([i915#5287]) +4 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb5/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled:
    - shard-iclb:         NOTRUN -> [SKIP][89] ([i915#5287]) +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb8/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([fdo#109274]) +4 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb7/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([i915#2587])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109285])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb6/igt@kms_force_connector_basic@force-load-detect.html
    - shard-tglb:         NOTRUN -> [SKIP][93] ([fdo#109285])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb8/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([fdo#109280] / [fdo#111825]) +24 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-glk:          [PASS][95] -> [FAIL][96] ([i915#1888] / [i915#2546])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:
    - shard-glk:          [PASS][97] -> [FAIL][98] ([i915#2546])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-iclb:         NOTRUN -> [SKIP][99] ([fdo#109280]) +19 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-kbl:          NOTRUN -> [SKIP][100] ([fdo#109271]) +203 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-kbl4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][101] -> [SKIP][102] ([i915#433])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-swap:
    - shard-tglb:         NOTRUN -> [SKIP][103] ([i915#3555])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb1/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-iclb:         NOTRUN -> [SKIP][104] ([i915#3555])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb8/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][105] ([fdo#108145] / [i915#265]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][106] ([fdo#108145] / [i915#265])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-glk2/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
    - shard-apl:          NOTRUN -> [FAIL][107] ([fdo#108145] / [i915#265])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-tglb:         NOTRUN -> [SKIP][108] ([i915#3536]) +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb7/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-iclb:         NOTRUN -> [SKIP][109] ([i915#3536])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb5/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-75@pipe-b-edp-1-downscale-with-pixel-format:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][110] ([i915#5293])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb2/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-75@pipe-b-edp-1-downscale-with-pixel-format.html

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-a-edp-1-downscale-with-rotation:
    - shard-iclb:         NOTRUN -> [SKIP][111] ([i915#5176]) +5 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb3/igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-a-edp-1-downscale-with-rotation.html

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-downscale-with-rotation:
    - shard-tglb:         NOTRUN -> [SKIP][112] ([i915#5176]) +11 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb1/igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-downscale-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale:
    - shard-tglb:         NOTRUN -> [SKIP][113] ([i915#5235]) +3 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb3/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale.html

  * igt@kms_prime@basic-crc@first-to-second:
    - shard-tglb:         NOTRUN -> [SKIP][114] ([i915#1836])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb8/igt@kms_prime@basic-crc@first-to-second.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][115] -> [SKIP][116] ([fdo#109441]) +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb8/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-tglb:         NOTRUN -> [FAIL][117] ([i915#132] / [i915#3467]) +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb6/igt@kms_psr@psr2_sprite_mmap_cpu.html
    - shard-iclb:         NOTRUN -> [SKIP][118] ([fdo#109441]) +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-tglb:         NOTRUN -> [SKIP][119] ([i915#5289])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
    - shard-iclb:         NOTRUN -> [SKIP][120] ([i915#5289])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:
    - shard-tglb:         NOTRUN -> [SKIP][121] ([i915#5030]) +3 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb5/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a.html

  * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c:
    - shard-iclb:         NOTRUN -> [SKIP][122] ([i915#5030]) +2 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb8/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][123] ([fdo#109309])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb2/igt@kms_tv_load_detect@load-detect.html
    - shard-iclb:         NOTRUN -> [SKIP][124] ([fdo#109309])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb4/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@pipe-d-query-forked-hang:
    - shard-snb:          NOTRUN -> [SKIP][125] ([fdo#109271]) +108 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-snb6/igt@kms_vblank@pipe-d-query-forked-hang.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-kbl:          NOTRUN -> [SKIP][126] ([fdo#109271] / [i915#533])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-kbl4/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-kbl:          NOTRUN -> [SKIP][127] ([fdo#109271] / [i915#2437])
   [127]: https://intel-gfx-ci.01.org/tree/drm-t

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/index.html

--===============2420435394088108579==
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
<tr><td><b>Series:</b></td><td>tests/intel-ci/fast-feedback: Move gem_lmem_swapping further (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/102312/">https://patchwork.freedesktop.org/series/102312/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11477_full -&gt; IGTPW_6906_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6906_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6906_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/index.html</p>
<h2>Participating hosts (11 -&gt; 6)</h2>
<p>Missing    (5): shard-skl pig-kbl-iris shard-tglu pig-glk-j5005 pig-skl-6260u </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6906_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-kbl6/igt@gem_exec_balancer@parallel-out-fence.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@gem_exec_balancer@parallel-contexts:<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-iclb6/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> ([i915#4525]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6906_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb8/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-kbl6/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#4991])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-glk1/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#4991])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-apl7/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#4991])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb1/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb5/igt@gem_eio@kms.html">FAIL</a> ([i915#232])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb6/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-default:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-snb2/igt@gem_exec_flush@basic-wb-ro-default.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-snb6/igt@gem_exec_flush@basic-wb-ro-default.html">SKIP</a> ([fdo#109271]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-glk7/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb2/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-kbl3/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb8/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([i915#4613])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb2/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([i915#4613])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-kbl3/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([fdo#109271] / [i915#4613])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-snb7/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb1/igt@gem_pxp@create-regular-context-2.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb8/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> ([i915#4270]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb5/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#768]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb2/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb1/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb3/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb4/igt@gen7_exec_parse@basic-rejected.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb3/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2527] / [i915#2856]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb6/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2856]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb1/igt@i915_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#1902])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb3/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2681] / [i915#2684])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a> ([i915#2680])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb2/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([fdo#109293] / [fdo#109506])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb1/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([fdo#109506] / [i915#2411])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-apl3/igt@i915_pm_sseu@full-enable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-apl3/igt@i915_pm_sseu@full-enable.html">FAIL</a> ([i915#3524])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-apl7/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-apl4/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-apl4/igt@i915_suspend@sysfs-reader.html">DMESG-WARN</a> ([i915#180]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-glk2/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#109271]) +88 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([i915#5286]) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([i915#5286])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-apl8/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#109271]) +117 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb4/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-glk3/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-glk3/igt@kms_big_fb@linear-8bpp-rotate-180.html">FAIL</a> ([i915#1888] / [i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb3/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-glk1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-apl1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb2/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-kbl6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +4 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#111615]) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-apl4/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb1/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-glk7/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-kbl3/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb8/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb8/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb2/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-snb5/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-aspect-ratio:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-glk4/igt@kms_chamelium@hdmi-aspect-ratio.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb5/igt@kms_color_chamelium@pipe-a-ctm-0-5.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-kbl7/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-25:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-apl8/igt@kms_color_chamelium@pipe-c-ctm-0-25.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-green-to-red:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb8/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +9 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb8/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#1063]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-kbl3/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> ([i915#1319])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb1/igt@kms_content_protection@mei_interface.html">SKIP</a> ([fdo#109300] / [fdo#111066]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html">SKIP</a> ([i915#3359]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html">SKIP</a> ([i915#3319]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109279] / [i915#3359]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-glk6/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-glk3/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html">DMESG-WARN</a> ([i915#118] / [i915#1888])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-iclb3/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb7/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html">DMESG-FAIL</a> ([i915#1888])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb3/igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge.html">SKIP</a> ([fdo#109278]) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> ([fdo#109274] / [fdo#111825]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb5/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb2/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb5/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled.html">SKIP</a> ([i915#5287]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb8/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled.html">SKIP</a> ([i915#5287]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb7/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> ([fdo#109274]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> ([i915#2587])</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> ([fdo#109285])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb8/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> ([fdo#109285])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> ([fdo#109280] / [fdo#111825]) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">FAIL</a> ([i915#1888] / [i915#2546])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html">FAIL</a> ([i915#2546])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109280]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-kbl4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +203 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb1/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb8/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-glk2/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-x:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb7/igt@kms_plane_lowres@pipe-a-tiling-x.html">SKIP</a> ([i915#3536]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-y:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb5/igt@kms_plane_lowres@pipe-a-tiling-y.html">SKIP</a> ([i915#3536])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-75@pipe-b-edp-1-downscale-with-pixel-format:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb2/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-75@pipe-b-edp-1-downscale-with-pixel-format.html">INCOMPLETE</a> ([i915#5293])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-a-edp-1-downscale-with-rotation:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb3/igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-a-edp-1-downscale-with-rotation.html">SKIP</a> ([i915#5176]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-downscale-with-rotation:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb1/igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-downscale-with-rotation.html">SKIP</a> ([i915#5176]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb3/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale.html">SKIP</a> ([i915#5235]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@first-to-second:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb8/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([i915#1836])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb8/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb6/igt@kms_psr@psr2_sprite_mmap_cpu.html">FAIL</a> ([i915#132] / [i915#3467]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> ([fdo#109441]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> ([i915#5289])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> ([i915#5289])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb5/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a.html">SKIP</a> ([i915#5030]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb8/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c.html">SKIP</a> ([i915#5030]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-tglb2/igt@kms_tv_load_detect@load-detect.html">SKIP</a> ([fdo#109309])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-iclb4/igt@kms_tv_load_detect@load-detect.html">SKIP</a> ([fdo#109309])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-query-forked-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-snb6/igt@kms_vblank@pipe-d-query-forked-hang.html">SKIP</a> ([fdo#109271]) +108 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6906/shard-kbl4/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-t">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2420435394088108579==--
