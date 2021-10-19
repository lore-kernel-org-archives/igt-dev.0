Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8075881424534687698=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 19 Oct 2021 16:38:59 -0000
Message-ID: <163466153977.5185.5394956197958378442@emeril.freedesktop.org>
References: <20211019122042.1699646-1-apoorva1.singh@intel.com>
In-Reply-To: <20211019122042.1699646-1-apoorva1.singh@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fcreate=3A_Add_support_for_local_memory_=28rev2=29?=
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
To: apoorva1.singh@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============8075881424534687698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_exec_create: Add support for local memory (rev2)
URL   : https://patchwork.freedesktop.org/series/95411/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10759_full -> IGTPW_6332_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6332_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6332_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6332_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vblank@pipe-b-wait-forked:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-iclb5/igt@kms_vblank@pipe-b-wait-forked.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb4/igt@kms_vblank@pipe-b-wait-forked.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10759_full and IGTPW_6332_full:

### New IGT tests (4) ###

  * igt@gem_exec_create@basic@smem:
    - Statuses : 5 pass(s)
    - Exec time: [2.04, 2.07] s

  * igt@gem_exec_create@forked@smem:
    - Statuses : 2 pass(s)
    - Exec time: [20.07, 20.08] s

  * igt@gem_exec_create@legacy@smem:
    - Statuses : 6 pass(s)
    - Exec time: [2.04, 2.06] s

  * igt@gem_exec_create@madvise@smem:
    - Statuses : 4 pass(s)
    - Exec time: [20.17, 20.51] s

  

Known issues
------------

  Here are the changes found in IGTPW_6332_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@vcs1:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][3] ([i915#180])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs1.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#1099]) +4 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed-process.html

  * igt@gem_ctx_persistence@many-contexts:
    - shard-tglb:         NOTRUN -> [FAIL][5] ([i915#2410])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb1/igt@gem_ctx_persistence@many-contexts.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglb:         NOTRUN -> [SKIP][6] ([i915#280])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb2/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][7] -> [TIMEOUT][8] ([i915#2369] / [i915#3063] / [i915#3648])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-tglb7/igt@gem_eio@unwedge-stress.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb5/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][9] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-kbl:          [PASS][10] -> [FAIL][11] ([i915#2842])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-kbl6/igt@gem_exec_fair@basic-none-share@rcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-kbl1/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][12] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-glk3/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][13] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#2842]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-apl:          NOTRUN -> [DMESG-WARN][16] ([i915#180])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl3/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#2190])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][18] ([i915#2658])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-snb7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-iclb:         NOTRUN -> [SKIP][19] ([i915#4270])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb6/igt@gem_pxp@reject-modify-context-protection-off-3.html
    - shard-tglb:         NOTRUN -> [SKIP][20] ([i915#4270])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb5/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][21] ([i915#768])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb4/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([i915#3297])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb8/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gen3_mixed_blits:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([fdo#109289])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb1/igt@gen3_mixed_blits.html
    - shard-tglb:         NOTRUN -> [SKIP][24] ([fdo#109289])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb3/igt@gen3_mixed_blits.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][25] ([i915#2856]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb7/igt@gen9_exec_parse@bb-start-cmd.html
    - shard-iclb:         NOTRUN -> [SKIP][26] ([i915#2856]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb1/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#4281])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb5/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#110892])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglb:         NOTRUN -> [SKIP][29] ([fdo#109288])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb1/igt@i915_pm_sseu@full-enable.html
    - shard-iclb:         NOTRUN -> [SKIP][30] ([fdo#109288])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb8/igt@i915_pm_sseu@full-enable.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          [PASS][31] -> [INCOMPLETE][32] ([i915#3921])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-snb6/igt@i915_selftest@live@hangcheck.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-snb7/igt@i915_selftest@live@hangcheck.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb5/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#111614])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb1/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-glk:          [PASS][35] -> [DMESG-WARN][36] ([i915#118]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-glk2/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-glk7/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-apl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#3777]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#111615]) +4 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb8/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-kbl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#3777])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-kbl6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-apl:          NOTRUN -> [SKIP][40] ([fdo#109271]) +244 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-apl:          NOTRUN -> [DMESG-FAIL][41] ([i915#4298]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl7/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-iclb:         NOTRUN -> [DMESG-FAIL][42] ([i915#4298])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
    - shard-kbl:          NOTRUN -> [DMESG-FAIL][43] ([i915#4298])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-kbl3/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-snb:          NOTRUN -> [FAIL][44] ([i915#4299])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-snb6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-tglb:         NOTRUN -> [FAIL][45] ([i915#1385]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb1/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][46] ([fdo#109271] / [i915#3886]) +8 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-kbl4/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#3886]) +10 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl7/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#3689] / [i915#3886]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb3/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109278] / [i915#3886]) +6 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb5/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][50] ([fdo#109271] / [i915#3886]) +6 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-glk2/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#3689]) +7 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb8/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109278]) +18 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb1/igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][53] ([fdo#109271]) +50 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-glk4/igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_chamelium@vga-hpd-after-suspend:
    - shard-glk:          NOTRUN -> [SKIP][54] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-glk2/igt@kms_chamelium@vga-hpd-after-suspend.html

  * igt@kms_chamelium@vga-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-kbl1/igt@kms_chamelium@vga-hpd-for-each-pipe.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109278] / [i915#1149])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb6/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-snb:          NOTRUN -> [SKIP][57] ([fdo#109271] / [fdo#111827]) +19 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-snb2/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb5/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#109284] / [fdo#111827]) +10 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb6/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html

  * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
    - shard-apl:          NOTRUN -> [SKIP][61] ([fdo#109271] / [fdo#111827]) +23 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl7/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#3116])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb3/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#111828])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb3/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109278] / [fdo#109279]) +4 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([i915#3319]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#3359]) +4 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-tglb:         [PASS][67] -> [INCOMPLETE][68] ([i915#2411] / [i915#456])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([fdo#109279] / [i915#3359]) +4 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109274] / [fdo#109278])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#3788])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb8/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html

  * igt@kms_dsc@basic-dsc-enable:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([i915#3840])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb5/igt@kms_dsc@basic-dsc-enable.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][73] -> [DMESG-WARN][74] ([i915#180]) +7 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:
    - shard-iclb:         [PASS][75] -> [SKIP][76] ([i915#3701])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
    - shard-snb:          NOTRUN -> [SKIP][77] ([fdo#109271]) +409 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-snb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([fdo#111825]) +32 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109280]) +19 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][80] ([i915#2411] / [i915#456])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb7/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([i915#4278])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb1/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#533])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - shard-kbl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#533])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-kbl1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-tglb:         [PASS][84] -> [INCOMPLETE][85] ([i915#2828] / [i915#456])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-tglb2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][86] ([fdo#108145] / [i915#265])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-glk3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
    - shard-kbl:          NOTRUN -> [FAIL][87] ([fdo#108145] / [i915#265])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][88] ([fdo#108145] / [i915#265]) +2 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][89] ([i915#265])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_lowres@pipe-a-tiling-none:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([i915#3536]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb5/igt@kms_plane_lowres@pipe-a-tiling-none.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([i915#3536])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb2/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([fdo#112054])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-iclb:         NOTRUN -> [SKIP][93] ([fdo#109274]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
    - shard-apl:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#2733])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl7/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-kbl:          NOTRUN -> [SKIP][95] ([fdo#109271] / [i915#658]) +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-kbl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([i915#658]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html
    - shard-tglb:         NOTRUN -> [SKIP][97] ([i915#2920]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-glk:          NOTRUN -> [SKIP][98] ([fdo#109271] / [i915#658]) +3 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-glk7/igt@kms_psr2_su@frontbuffer.html
    - shard-iclb:         NOTRUN -> [SKIP][99] ([fdo#109642] / [fdo#111068] / [i915#658])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb5/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr2_su@page_flip:
    - shard-apl:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#658]) +2 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl1/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([fdo#109441])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb6/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-tglb:         NOTRUN -> [FAIL][102] ([i915#132] / [i915#3467]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb7/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][103] -> [SKIP][104] ([fdo#109441]) +4 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][105] ([fdo#109271]) +121 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-kbl2/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-tglb:         [PASS][106] -> [INCOMPLETE][107] ([i915#2828])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-tglb1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-glk:          NOTRUN -> [SKIP][108] ([fdo#109271] / [i915#533])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-glk3/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_vrr@flip-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][109] ([fdo#109502])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb2/igt@kms_vrr@flip-dpms.html
    - shard-tglb:         NOTRUN -> [SKIP][110] ([fdo#109502])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb7/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-apl:          NOTRUN -> [SKIP][111] ([fdo#109271] / [i915#2437])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl7/igt@kms_writeback@writeback-fb-id.html

  * igt@nouveau_crc@pipe-a-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][112] ([i915#2530]) +2 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb6/igt@nouveau_crc@pipe-a-source-rg.html

  * igt@nouveau_crc@pipe-b-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][113] ([i915#2530]) +2 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb6/igt@nouveau_crc@pipe-b-ctx-flip-detection.html

  * igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:
    - shard-tglb:         NOTRUN -> [SKIP][114] ([fdo#109291]) +4 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb8/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html
    - shard-iclb:         NOTRUN -> [SKIP][115] ([fdo#109291])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb8/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html

  * igt@sysfs_clients@fair-7:
    - shard-tglb:         NOTRUN -> [SKIP][116] ([i915#2994]) +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb1/igt@sysfs_clients@fair-7.html

  * igt@sysfs_clients@recycle:
    - shard-kbl:          NOTRUN -> [SKIP][117] ([fdo#109271] / [i915#2994]) +2 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-kbl3/igt@sysfs_clients@recycle.html

  * igt@sysfs_clients@recycle-many:
    - shard-apl:          NOTRUN -> [SKIP][118] ([fdo#109271] / [i915#2994]) +2 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl8/igt@sysfs_clients@recycle-many.html
    - shard-iclb:         NOTRUN -> [SKIP][119] ([i915#2994])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb4/igt@sysfs_clients@recycle-many.html
    - shard-glk:          NOTRUN -> [SKIP][120] ([fdo#109271] / [i915#2994]) +1 similar issue
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-glk4/igt@sysfs_clients@recycle-many.html

  
#### Possible fixes ####

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [TIMEOUT][121] ([i915#2369] / [i915#2481] / [i915#3070]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-iclb6/igt@gem_eio@unwedge-stress.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb6/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          [FAIL][123] ([i915#2842]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-kbl7/igt@gem_exec_fair@basic-none@vcs1.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-tglb:         [FAIL][125] ([i915#2842]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-tglb6/igt@gem_exec_fair@basic-pace@rcs0.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb8/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          [SKIP][127] ([fdo#109271]) -> [PASS][128] +1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/index.html

--===============8075881424534687698==
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
<tr><td><b>Series:</b></td><td>i915/gem_exec_create: Add support for local memory (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/95411/">https://patchwork.freedesktop.org/series/95411/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10759_full -&gt; IGTPW_6332_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6332_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6332_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6332_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_vblank@pipe-b-wait-forked:<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-iclb5/igt@kms_vblank@pipe-b-wait-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb4/igt@kms_vblank@pipe-b-wait-forked.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10759_full and IGTPW_6332_full:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@gem_exec_create@basic@smem:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.04, 2.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_create@forked@smem:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [20.07, 20.08] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_create@legacy@smem:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.04, 2.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_create@madvise@smem:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [20.17, 20.51] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6332_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs1.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed-process.html">SKIP</a> ([fdo#109271] / [i915#1099]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@many-contexts:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb1/igt@gem_ctx_persistence@many-contexts.html">FAIL</a> ([i915#2410])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb2/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-tglb7/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb5/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#3063] / [i915#3648])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-kbl6/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-kbl1/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-glk3/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl3/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-snb7/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb6/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> ([i915#4270])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb5/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> ([i915#4270])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb4/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb8/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen3_mixed_blits:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb1/igt@gen3_mixed_blits.html">SKIP</a> ([fdo#109289])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb3/igt@gen3_mixed_blits.html">SKIP</a> ([fdo#109289])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb7/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2856]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb1/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2856]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb5/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([i915#4281])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([fdo#110892])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb1/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([fdo#109288])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb8/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([fdo#109288])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-snb6/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-snb7/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> ([i915#3921])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb5/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb1/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-glk2/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-glk7/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#118]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb8/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#111615]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-kbl6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([fdo#109271]) +244 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl7/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">DMESG-FAIL</a> ([i915#4298]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">DMESG-FAIL</a> ([i915#4298])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-kbl3/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">DMESG-FAIL</a> ([i915#4298])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-snb6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">FAIL</a> ([i915#4299])</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb1/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">FAIL</a> ([i915#1385]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-kbl4/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl7/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb3/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb5/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-glk2/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb8/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html">SKIP</a> ([i915#3689]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb1/igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs.html">SKIP</a> ([fdo#109278]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-glk4/igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271]) +50 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-after-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-glk2/igt@kms_chamelium@vga-hpd-after-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-kbl1/igt@kms_chamelium@vga-hpd-for-each-pipe.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb6/igt@kms_color@pipe-d-ctm-0-25.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-snb2/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +19 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb5/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-0-5.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-green-to-red:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb6/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-limited-range:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl7/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb3/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb3/igt@kms_content_protection@srm.html">SKIP</a> ([fdo#111828])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen.html">SKIP</a> ([i915#3319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen.html">SKIP</a> ([i915#3359]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">INCOMPLETE</a> ([i915#2411] / [i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109279] / [i915#3359]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb8/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html">SKIP</a> ([i915#3788])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@basic-dsc-enable:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb5/igt@kms_dsc@basic-dsc-enable.html">SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html">SKIP</a> ([i915#3701])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-snb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> ([fdo#109271]) +409 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#111825]) +32 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> ([fdo#109280]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb7/igt@kms_frontbuffer_tracking@psr-suspend.html">INCOMPLETE</a> ([i915#2411] / [i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb1/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> ([i915#4278])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-kbl1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-tglb2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">INCOMPLETE</a> ([i915#2828] / [i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-glk3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-none:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb5/igt@kms_plane_lowres@pipe-a-tiling-none.html">SKIP</a> ([i915#3536]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-y:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb2/igt@kms_plane_lowres@pipe-a-tiling-y.html">SKIP</a> ([i915#3536])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html">SKIP</a> ([fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> ([fdo#109274]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl7/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html">SKIP</a> ([fdo#109271] / [i915#2733])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-kbl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html">SKIP</a> ([i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html">SKIP</a> ([i915#2920]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-glk7/igt@kms_psr2_su@frontbuffer.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb5/igt@kms_psr2_su@frontbuffer.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl1/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb6/igt@kms_psr@psr2_cursor_render.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb7/igt@kms_psr@psr2_primary_mmap_gtt.html">FAIL</a> ([i915#132] / [i915#3467]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([fdo#109441]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-kbl2/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html">SKIP</a> ([fdo#109271]) +121 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-tglb1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">INCOMPLETE</a> ([i915#2828])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-glk3/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb2/igt@kms_vrr@flip-dpms.html">SKIP</a> ([fdo#109502])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb7/igt@kms_vrr@flip-dpms.html">SKIP</a> ([fdo#109502])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl7/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-rg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb6/igt@nouveau_crc@pipe-a-source-rg.html">SKIP</a> ([i915#2530]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-detection:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb6/igt@nouveau_crc@pipe-b-ctx-flip-detection.html">SKIP</a> ([i915#2530]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb8/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html">SKIP</a> ([fdo#109291]) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb8/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html">SKIP</a> ([fdo#109291])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-7:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb1/igt@sysfs_clients@fair-7.html">SKIP</a> ([i915#2994]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-kbl3/igt@sysfs_clients@recycle.html">SKIP</a> ([fdo#109271] / [i915#2994]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-apl8/igt@sysfs_clients@recycle-many.html">SKIP</a> ([fdo#109271] / [i915#2994]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb4/igt@sysfs_clients@recycle-many.html">SKIP</a> ([i915#2994])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-glk4/igt@sysfs_clients@recycle-many.html">SKIP</a> ([fdo#109271] / [i915#2994]) +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-iclb6/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#2481] / [i915#3070]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-iclb6/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-kbl7/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10759/shard-tglb6/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/shard-tglb8/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          [SKIP][127] ([fdo#109271]) -&gt; [PASS][128] +1</li>
</ul>
</li>
</ul>

</body>
</html>

--===============8075881424534687698==--
