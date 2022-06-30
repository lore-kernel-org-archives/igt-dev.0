Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3309046823285099449=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Date: Thu, 30 Jun 2022 05:00:01 -0000
Message-ID: <165656520170.26514.3983994133696867617@emeril.freedesktop.org>
References: <20220628133554.37768-1-mohammed.thasleem@intel.com>
In-Reply-To: <20220628133554.37768-1-mohammed.thasleem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/kms=5Fmmap=5Fwrite=5Fcrc=3A_IGT_test_Cleanup_=28rev3=29?=
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

--===============3309046823285099449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/kms_mmap_write_crc: IGT test Cleanup (rev3)
URL   : https://patchwork.freedesktop.org/series/105241/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11820_full -> IGTPW_7425_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/index.html

Participating hosts (10 -> 10)
------------------------------

  Additional (3): shard-rkl shard-dg1 shard-tglu 
  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7425_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - {shard-tglu}:       NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rpm@gem-execbuf@lmem0:
    - {shard-dg1}:        NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-dg1-18/igt@i915_pm_rpm@gem-execbuf@lmem0.html

  * igt@kms_mmap_write_crc@main:
    - {shard-rkl}:        NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-rkl-2/igt@kms_mmap_write_crc@main.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11820_full and IGTPW_7425_full:

### New IGT tests (8) ###

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_mmap_write_crc@main@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [5.72, 6.90] s

  * igt@kms_mmap_write_crc@main@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [13.30, 15.27] s

  * igt@kms_mmap_write_crc@main@hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [5.81, 7.08] s

  * igt@kms_mmap_write_crc@main@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [4.26] s

  

Known issues
------------

  Here are the changes found in IGTPW_7425_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-4x:
    - shard-iclb:         NOTRUN -> [SKIP][4] ([i915#1839])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb2/igt@feature_discovery@display-4x.html
    - shard-tglb:         NOTRUN -> [SKIP][5] ([i915#1839])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb5/igt@feature_discovery@display-4x.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglb:         [PASS][6] -> [FAIL][7] ([i915#6268])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-tglb1/igt@gem_ctx_exec@basic-nohangcheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb3/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-apl:          [PASS][8] -> [DMESG-WARN][9] ([i915#180]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl8/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-apl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_persistence@hang:
    - shard-snb:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#1099]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-snb4/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglb:         NOTRUN -> [SKIP][11] ([i915#280])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb1/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglb:         NOTRUN -> [FAIL][12] ([i915#6117])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb2/igt@gem_exec_balancer@parallel-ordering.html
    - shard-kbl:          NOTRUN -> [FAIL][13] ([i915#6117])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-kbl1/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#2842])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-glk6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-iclb:         [PASS][16] -> [FAIL][17] ([i915#2842])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb8/igt@gem_exec_fair@basic-pace@bcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb4/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][18] ([i915#2842])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_params@no-bsd:
    - shard-iclb:         NOTRUN -> [SKIP][19] ([fdo#109283])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb5/igt@gem_exec_params@no-bsd.html
    - shard-tglb:         NOTRUN -> [SKIP][20] ([fdo#109283])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb7/igt@gem_exec_params@no-bsd.html

  * igt@gem_exec_params@secure-non-root:
    - shard-iclb:         NOTRUN -> [SKIP][21] ([fdo#112283])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb2/igt@gem_exec_params@secure-non-root.html
    - shard-tglb:         NOTRUN -> [SKIP][22] ([fdo#112283])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb5/igt@gem_exec_params@secure-non-root.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#4613])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb5/igt@gem_lmem_swapping@parallel-random-engines.html
    - shard-tglb:         NOTRUN -> [SKIP][24] ([i915#4613])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb1/igt@gem_lmem_swapping@parallel-random-engines.html
    - shard-glk:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#4613])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-glk1/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-apl:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#4613]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-apl3/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][27] ([i915#2658])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-apl4/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][28] ([i915#2658])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-snb5/igt@gem_pread@exhaustion.html
    - shard-tglb:         NOTRUN -> [WARN][29] ([i915#2658])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb3/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][30] ([i915#2658])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-glk6/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][31] ([i915#2658])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb8/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][32] ([i915#2658])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-kbl4/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@display-protected-crc:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([i915#4270])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb7/igt@gem_pxp@display-protected-crc.html
    - shard-iclb:         NOTRUN -> [SKIP][34] ([i915#4270])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb5/igt@gem_pxp@display-protected-crc.html

  * igt@gem_userptr_blits@access-control:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([i915#3297])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb6/igt@gem_userptr_blits@access-control.html
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#3297])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb5/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-apl:          NOTRUN -> [FAIL][37] ([i915#3318])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-apl1/igt@gem_userptr_blits@vma-merge.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [PASS][38] -> [DMESG-WARN][39] ([i915#5566] / [i915#716])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl2/igt@gen9_exec_parse@allowed-single.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-apl3/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#2527] / [i915#2856]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb3/igt@gen9_exec_parse@basic-rejected.html
    - shard-iclb:         NOTRUN -> [SKIP][41] ([i915#2856])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb3/igt@gen9_exec_parse@basic-rejected.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglb:         [PASS][42] -> [TIMEOUT][43] ([i915#3953])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-tglb6/igt@i915_module_load@reload-with-fault-injection.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         NOTRUN -> [FAIL][44] ([i915#454])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb7/igt@i915_pm_dc@dc6-dpms.html
    - shard-kbl:          NOTRUN -> [FAIL][45] ([i915#454])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-kbl6/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#109289]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb7/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@cursor:
    - shard-apl:          NOTRUN -> [DMESG-WARN][47] ([i915#62]) +4 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-apl8/igt@i915_pm_rpm@cursor.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([fdo#109506] / [i915#2411])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_query@hwconfig_table:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([i915#6245])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb1/igt@i915_query@hwconfig_table.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1:
    - shard-tglb:         [PASS][50] -> [FAIL][51] ([i915#2521]) +3 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-tglb2/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#1769])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([i915#5286]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb4/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([i915#5286]) +3 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#110725] / [fdo#111614])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb7/igt@kms_big_fb@linear-64bpp-rotate-270.html
    - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#111614])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb5/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglb:         [PASS][57] -> [FAIL][58] ([i915#3743]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-tglb3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-tglb:         NOTRUN -> [FAIL][59] ([i915#3743])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#111615]) +4 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#110723]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#6095])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb3/igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][63] ([fdo#109271] / [i915#3886]) +6 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-kbl7/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271]) +166 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-apl1/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#111615] / [i915#3689]) +4 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb7/igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#3689] / [i915#6095]) +4 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb1/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][67] ([fdo#109271] / [i915#3886]) +7 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-apl4/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][68] ([fdo#109271] / [i915#3886]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-glk7/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109278] / [i915#3886]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb5/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109278]) +9 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb2/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#3689]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb1/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_ccs.html

  * igt@kms_chamelium@hdmi-audio-edid:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb2/igt@kms_chamelium@hdmi-audio-edid.html

  * igt@kms_chamelium@hdmi-crc-multiple:
    - shard-glk:          NOTRUN -> [SKIP][73] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-glk5/igt@kms_chamelium@hdmi-crc-multiple.html
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb7/igt@kms_chamelium@hdmi-crc-multiple.html

  * igt@kms_color_chamelium@pipe-a-gamma:
    - shard-kbl:          NOTRUN -> [SKIP][75] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-kbl3/igt@kms_color_chamelium@pipe-a-gamma.html

  * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
    - shard-snb:          NOTRUN -> [SKIP][76] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-snb4/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - shard-apl:          NOTRUN -> [SKIP][77] ([fdo#109271] / [fdo#111827]) +17 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-apl1/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-d-degamma:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb7/igt@kms_color_chamelium@pipe-d-degamma.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          NOTRUN -> [TIMEOUT][79] ([i915#1319])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-apl2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#109274]) +3 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb5/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([i915#3528])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb2/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-iclb:         NOTRUN -> [SKIP][82] ([i915#3528])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb7/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([i915#5287])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          NOTRUN -> [FAIL][84] ([i915#4767])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-plain-flip:
    - shard-tglb:         NOTRUN -> [SKIP][85] ([fdo#109274] / [fdo#111825]) +4 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb3/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-dp1:
    - shard-apl:          [PASS][86] -> [DMESG-WARN][87] ([i915#62]) +39 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl8/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-dp1.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-apl8/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-dp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1:
    - shard-tglb:         [PASS][88] -> [FAIL][89] ([i915#79])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-kbl:          [PASS][90] -> [DMESG-WARN][91] ([i915#180]) +10 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl7/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-kbl6/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-glk:          [PASS][92] -> [FAIL][93] ([i915#4911]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-glk5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-iclb:         NOTRUN -> [SKIP][94] ([i915#2587])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-iclb:         [PASS][95] -> [SKIP][96] ([i915#3701])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-kbl:          NOTRUN -> [SKIP][97] ([fdo#109271]) +113 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:
    - shard-glk:          NOTRUN -> [SKIP][98] ([fdo#109271]) +73 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([fdo#109280] / [fdo#111825]) +14 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][100] ([fdo#109280]) +9 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-1:
    - shard-kbl:          [PASS][101] -> [FAIL][102] ([i915#1188])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl4/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-kbl6/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][103] ([fdo#108145] / [i915#265])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
    - shard-glk:          NOTRUN -> [FAIL][104] ([fdo#108145] / [i915#265])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-glk8/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
    - shard-kbl:          NOTRUN -> [FAIL][105] ([fdo#108145] / [i915#265])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][106] ([i915#265])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_lowres@tiling-yf@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][107] -> [DMESG-FAIL][108] ([i915#118] / [i915#1888])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-glk8/igt@kms_plane_lowres@tiling-yf@pipe-a-hdmi-a-1.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-glk3/igt@kms_plane_lowres@tiling-yf@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-yf@pipe-c-hdmi-a-1:
    - shard-glk:          [PASS][109] -> [FAIL][110] ([i915#1888]) +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-glk8/igt@kms_plane_lowres@tiling-yf@pipe-c-hdmi-a-1.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-glk3/igt@kms_plane_lowres@tiling-yf@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-edp-1:
    - shard-iclb:         [PASS][111] -> [SKIP][112] ([i915#5176]) +2 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb5/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-edp-1.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb2/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][113] ([i915#5176]) +7 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb1/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-edp-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][114] ([i915#5176]) +5 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-edp-1.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-tglb:         NOTRUN -> [SKIP][115] ([i915#2920]) +2 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
    - shard-glk:          NOTRUN -> [SKIP][116] ([fdo#109271] / [i915#658]) +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-glk9/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
    - shard-iclb:         NOTRUN -> [SKIP][117] ([fdo#111068] / [i915#658]) +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
    - shard-kbl:          NOTRUN -> [SKIP][118] ([fdo#109271] / [i915#658])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-kbl4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-apl:          NOTRUN -> [SKIP][119] ([fdo#109271] / [i915#658]) +4 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-apl2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-iclb:         [PASS][120] -> [SKIP][121] ([fdo#109642] / [fdo#111068] / [i915#658])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb5/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][122] ([fdo#109441])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html
    - shard-tglb:         NOTRUN -> [FAIL][123] ([i915#132] / [i915#3467])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-iclb:         NOTRUN -> [SKIP][124] ([i915#3555]) +2 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb8/igt@kms_setmode@basic-clone-single-crtc.html
    - shard-tglb:         NOTRUN -> [SKIP][125] ([i915#3555]) +3 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb3/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-apl:          NOTRUN -> [SKIP][126] ([fdo#109271] / [i915#2437])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-apl7/igt@kms_writeback@writeback-fb-id.html

  * igt@perf@polling-parameterized:
    - shard-iclb:         [PASS][127] -> [FAIL][128] ([i915#5639])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb1/igt@perf@polling-parameterized.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb5/igt@perf@polling-parameterized.html

  * igt@prime_nv_api@i915_nv_import_twice:
    - shard-tglb:         NOTRUN -> [SKIP][129] ([fdo#109291]) +2 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb1/igt@prime_nv_api@i915_nv_import_twice.html

  * igt@prime_nv_pcopy@test3_5:
    - shard-snb:          NOTRUN -> [SKIP][130] ([fdo#109271]) +102 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-snb6/igt@prime_nv_pcopy@test3_5.html

  * igt@prime_nv_test@i915_import_pread_pwrite:
    - shard-iclb:         NOTRUN -> [SKIP][131] ([fdo#109291]) +1 similar issue
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb1/igt@prime_nv_test@i915_import_pread_pwrite.html

  * igt@prime_vgem@coherency-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][132] ([fdo#109292] / [fdo#109295])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb8/igt@prime_vgem@coherency-gtt.html
    - shard-tglb:         NOTRUN -> [SKIP][133] ([fdo#109295] / [fdo#111656])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb3/igt@prime_vgem@coherency-gtt.html

  * igt@sysfs_clients@create:
    - shard-kbl:          NOTRUN -> [SKIP][134] ([fdo#109271] / [i915#2994])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-kbl3/igt@sysfs_clients@create.html
    - shard-tglb:         NOTRUN -> [SKIP][135] ([i915#2994])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb5/igt@sysfs_clients@create.html

  * igt@sysfs_clients@recycle:
    - shard-apl:          NOTRUN -> [SKIP][136] ([fdo#109271] / [i915#2994]) +2 similar issues
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-apl2/igt@sysfs_clients@recycle.html

  * igt@sysfs_clients@sema-25:
    - shard-glk:          NOTRUN -> [SKIP][137] ([fdo#109271] / [i915#2994])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-glk7/igt@sysfs_clients@sema-25.html

  * igt@sysfs_heartbeat_interval@nopreempt@vcs0:
    - shard-tglb:         [PASS][138] -> [FAIL][139] ([i915#6015]) +4 similar issues
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-tglb5/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb1/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@smoketest:
    - shard-glk:          [INCOMPLETE][140] ([i915#6310]) -> [PASS][141] +1 similar issue
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-glk3/igt@gem_ctx_persistence@smoketest.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-glk2/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         [SKIP][142] ([i915#4525]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb6/igt@gem_exec_balancer@parallel-contexts.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb2/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-kbl:          [FAIL][144] ([i915#2842]) -> [PASS][145] +2 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl4/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-kbl3/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][146] ([i915#2842]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [FAIL][148] ([i915#2842]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][150] ([i915#2849]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [DMESG-WARN][152] ([i915#180]) -> [PASS][153] +3 similar issues
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl4/igt@gem_workarounds@suspend-resume-context.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-apl7/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][154] ([i915#454]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb5/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-glk:          [FAIL][156] ([i915#3743]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-glk6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-glk2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][158] ([i915#79]) -> [PASS][159] +1 similar issue
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
    - shard-kbl:          [FAIL][160] ([i915#1188]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl3/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1:
    - shard-iclb:         [SKIP][162] ([i915#5235]) -> [PASS][163] +2 similar issues
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][164] ([fdo#109441]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglb:         [SKIP][166] ([i915#5519]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-tglb1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-snb:          [SKIP][168] ([fdo#109271]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-snb6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-snb7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [FAIL][170] ([i915#6117]) -> [SKIP][171] ([i915#4525])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb7/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-tglb:         [FAIL][172] ([i915#2842]) -> [SKIP][173] ([i915#2848]) +1 similar issue
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-tglb1/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-tglb1/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][174] ([i915#658]) -> [SKIP][175] ([i915#588])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb5/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
    - shard-apl:          [FAIL][176] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][177] ([fdo#108145] / [i915#62])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-iclb:         [SKIP][178] ([i915#2920]) -> [SKIP][179] ([fdo#111068] / [i915#658])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb5/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-iclb:         [SKIP][180] ([i915#658]) -> [SKIP][181] ([i915#2920])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb3/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-iclb:         [SKIP][182] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [FAIL][183] ([i915#5939])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb8/igt@kms_psr2_su@page_flip-nv12.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][184], [FAIL][185], [FAIL][186]) ([fdo#109271] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#716]) -> ([FAIL][187], [FAIL][188], [FAIL][189], [FAIL][190], [FAIL][191], [FAIL][192], [FAIL][193], [FAIL][194]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#716])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl3/igt@runner@aborted.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl4/igt@runner@aborted.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl4/igt@runner@aborted.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-kbl1/igt@runner@aborted.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-kbl4/igt@runner@aborted.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-kbl7/igt@runner@aborted.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-kbl1/igt@runner@aborted.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-kbl7/igt@runner@aborted.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-kbl6/igt@runner@aborted.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-kbl7/igt@runner@aborted.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-kbl6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
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
  [fdo#109292]: https://bugs.freedesktop.org/show_bug.cgi?id=109292
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
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
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2435]: https://gitlab.freedesktop.org/drm/intel/issues/2435
  [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2848]: https://gitlab.freedesktop.org/drm/intel/issues/2848
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3639]: https://gitlab.freedesktop.org/drm/intel/issues/3639
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3953]: https://gitlab.freedesktop.org/drm/intel/issues/3953
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4032]: https://gitlab.freedesktop.org/drm/intel/issues/4032
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4462]: https://gitlab.freedesktop.org/drm/intel/issues/4462
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4874]: https://gitlab.freedesktop.org/drm/intel/issues/4874
  [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4884]: https://gitlab.freedesktop.org/drm/intel/issues/4884
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4904]: https://gitlab.freedesktop.org/drm/intel/issues/4904
  [i915#4911]: https://gitlab.freedesktop.org/drm/intel/issues/4911
  [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
  [i915#4941]: https://gitlab.freedesktop.org/drm/intel/issues/4941
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5264]: https://gitlab.freedesktop.org/drm/intel/issues/5264
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5639]: https://gitlab.freedesktop.org/drm/intel/issues/5639
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#6015]: https://gitlab.freedesktop.org/drm/intel/issues/6015
  [i915#6076]: https://gitlab.freedesktop.org/drm/intel/issues/6076
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6140]: https://gitlab.freedesktop.org/drm/intel/issues/6140
  [i915#6141]: https://gitlab.freedesktop.org/drm/intel/issues/6141
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6251]: https://gitlab.freedesktop.org/drm/intel/issues/6251
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6259]: https://gitlab.freedesktop.org/drm/intel/issues/6259
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6310]: https://gitlab.freedesktop.org/drm/intel/issues/6310
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6549 -> IGTPW_7425
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11820: 8f4a9176de36698b5b3ba72c4f68f1cf7a15c0c9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7425: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/index.html
  IGT_6549: 9b9371c8da32533022ad700a7c023b4c3a085fbc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/index.html

--===============3309046823285099449==
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
<tr><td><b>Series:</b></td><td>tests/i915/kms_mmap_write_crc: IGT test Clea=
nup (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/105241/">https://patchwork.freedesktop.org/series/105241/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7425/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11820_full -&gt; IGTPW_7425_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/index.=
html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>Additional (3): shard-rkl shard-dg1 shard-tglu <br />
  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7425=
_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-idle@rc=
s0.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf@lmem0:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-dg1-18/igt@i915_pm_rpm@gem-execbuf@lmem0.htm=
l">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_mmap_write_crc@main:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-rkl-2/igt@kms_mmap_write_crc@main.html">SKIP=
</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11820_full and IGTPW_7425_=
full:</p>
<h3>New IGT tests (8)</h3>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_mmap_write_crc@main@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.72, 6.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_mmap_write_crc@main@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [13.30, 15.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_mmap_write_crc@main@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.81, 7.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_mmap_write_crc@main@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.26] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7425_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-iclb2/igt@feature_discovery@display-4x.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839">=
i915#1839</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-tglb5/igt@feature_discovery@display-4x.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839">=
i915#1839</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-tglb1/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard=
-tglb3/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-apl8/igt@gem_ctx_isolation@preservation-s3@bcs0.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_742=
5/shard-apl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180=
</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-snb4/igt@gem_ctx_persistence@hang.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/10=
99">i915#1099</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-tglb1/igt@gem_ctx_sseu@invalid-sseu.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/280">i91=
5#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-tglb2/igt@gem_exec_balancer@parallel-ordering=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/6117">i915#6117</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-kbl1/igt@gem_exec_balancer@parallel-ordering.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
6117">i915#6117</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-glk6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/sh=
ard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb8/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-=
iclb4/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-bsd:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-iclb5/igt@gem_exec_params@no-bsd.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo#1=
09283</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-tglb7/igt@gem_exec_params@no-bsd.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo#1=
09283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-iclb2/igt@gem_exec_params@secure-non-root.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1122=
83">fdo#112283</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-tglb5/igt@gem_exec_params@secure-non-root.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1122=
83">fdo#112283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-iclb5/igt@gem_lmem_swapping@parallel-random-e=
ngines.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-tglb1/igt@gem_lmem_swapping@parallel-random-e=
ngines.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-glk1/igt@gem_lmem_swapping@parallel-random-en=
gines.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-apl3/igt@gem_lmem_swapping@parallel-random-v=
erify-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-apl4/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-snb5/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-tglb3/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-glk6/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-iclb8/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-kbl4/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-tglb7/igt@gem_pxp@display-protected-crc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4270"=
>i915#4270</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-iclb5/igt@gem_pxp@display-protected-crc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4270"=
>i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-iclb6/igt@gem_userptr_blits@access-control.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/32=
97">i915#3297</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-tglb5/igt@gem_userptr_blits@access-control.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/32=
97">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-apl1/igt@gem_userptr_blits@vma-merge.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3318">i=
915#3318</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-apl2/igt@gen9_exec_parse@allowed-single.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-=
apl3/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-tglb3/igt@gen9_exec_parse@basic-rejected.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527=
">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2856">i915#2856</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-iclb3/igt@gen9_exec_parse@basic-rejected.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856=
">i915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-tglb6/igt@i915_module_load@reload-with-fault-injection.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7425/shard-tglb5/igt@i915_module_load@reload-with-fault-injection.html"=
>TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/39=
53">i915#3953</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-tglb7/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</=
a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-kbl6/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a=
>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-tglb7/igt@i915_pm_rc6_residency@media-rc6-ac=
curacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109289">fdo#109289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-apl8/igt@i915_pm_rpm@cursor.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/62">i915#6=
2</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-tglb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109506">fdo#109506</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-tglb1/igt@i915_query@hwconfig_table.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6245">i9=
15#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-tglb2/igt@kms_async_flips@alternate-sync-async-flip@pip=
e-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7425/shard-tglb1/igt@kms_async_flips@alternate-sync-async-fli=
p@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2521">i915#2521</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-tglb5/igt@kms_atomic_transition@plane-all-mo=
deset-transition-fencing.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-iclb4/igt@kms_big_fb@4-tiled-addfb-size-over=
flow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/5286">i915#5286</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-tglb5/igt@kms_big_fb@4-tiled-max-hw-stride-6=
4bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5286">i915#5286</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-iclb7/igt@kms_big_fb@linear-64bpp-rotate-270.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
10725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111614">fdo#111614</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-tglb5/igt@kms_big_fb@linear-64bpp-rotate-270.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-tglb3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate=
-0-hflip-async-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7425/shard-tglb1/igt@kms_big_fb@x-tiled-max-hw-stri=
de-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-tglb1/igt@kms_big_fb@y-tiled-max-hw-stride-6=
4bpp-rotate-180-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3743">i915#3743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D111615">fdo#111615</a>) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-iclb1/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D110723">fdo#110723</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-tglb3/igt@kms_ccs@pipe-a-bad-rotation-90-4_t=
iled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-kbl7/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_=
tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3886">i915#3886</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-apl1/igt@kms_ccs@pipe-a-crc-primary-rotation=
-180-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +166 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-tglb7/igt@kms_ccs@pipe-b-bad-aux-stride-yf_t=
iled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3689">i915#3689</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-tglb1/igt@kms_ccs@pipe-b-bad-pixel-format-4_=
tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/6095">i915#6095</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-apl4/igt@kms_ccs@pipe-c-bad-aux-stride-y_til=
ed_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3886">i915#3886</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-glk7/igt@kms_ccs@pipe-c-bad-pixel-format-y_ti=
led_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-iclb5/igt@kms_ccs@pipe-c-bad-pixel-format-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-iclb2/igt@kms_ccs@pipe-c-crc-sprite-planes-b=
asic-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109278">fdo#109278</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-tglb1/igt@kms_ccs@pipe-c-random-ccs-data-y_t=
iled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3689">i915#3689</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio-edid:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-tglb2/igt@kms_chamelium@hdmi-audio-edid.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10928=
4">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-multiple:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-glk5/igt@kms_chamelium@hdmi-crc-multiple.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +9 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-iclb7/igt@kms_chamelium@hdmi-crc-multiple.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
84">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111827">fdo#111827</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-gamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-kbl3/igt@kms_color_chamelium@pipe-a-gamma.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111827">fdo#111827</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-limited-range:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-snb4/igt@kms_color_chamelium@pipe-b-ctm-limi=
ted-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111827">fdo#111827</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-apl1/igt@kms_color_chamelium@pipe-b-ctm-red-=
to-blue.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-degamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-iclb7/igt@kms_color_chamelium@pipe-d-degamma=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-apl2/igt@kms_content_protection@atomic-dpms.=
html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1319">i915#1319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-iclb5/igt@kms_cursor_legacy@2x-cursor-vs-fli=
p-atomic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109274">fdo#109274</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-tglb2/igt@kms_dp_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3528">i915#3528</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-iclb7/igt@kms_dp_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3528">i915#3528</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb8888-=
render-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5287">i915#5287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4767">i91=
5#4767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-tglb3/igt@kms_flip@2x-plain-flip.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">fdo#=
109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1118=
25">fdo#111825</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-apl8/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interrupt=
ible@b-dp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7425/shard-apl8/igt@kms_flip@flip-vs-dpms-off-vs-modeset-int=
erruptible@b-dp1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/62">i915#62</a>) +39 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank-interruptible=
@d-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7425/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@d-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-kbl7/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-=
kbl6/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +10 simila=
r issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-glk5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-=
ytileccs-upscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7425/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/4911">i915#4911</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp=
-ytile-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7425/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3701">i915#3701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-2p-pri=
mscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +113 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsr-1p-=
offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +73 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-tglb3/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +14 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-kbl4/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-=
kbl6/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-b=
asic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-glk8/igt@kms_plane_alpha_blend@pipe-b-alpha-b=
asic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-b=
asic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-=
transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-glk8/igt@kms_plane_lowres@tiling-yf@pipe-a-hdmi-a-1.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7425/shard-glk3/igt@kms_plane_lowres@tiling-yf@pipe-a-hdmi-a-1.html">DMESG=
-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">=
i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-glk8/igt@kms_plane_lowres@tiling-yf@pipe-c-hdmi-a-1.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7425/shard-glk3/igt@kms_plane_lowres@tiling-yf@pipe-c-hdmi-a-1.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#=
1888</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-=
b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb5/igt@kms_plane_scaling@plane-downscale-with-pixel-=
format-factor-0-5@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb2/igt@kms_plane_scaling@p=
lane-downscale-with-pixel-format-factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a=
>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-e=
dp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-tglb1/igt@kms_plane_scaling@plane-downscale-=
with-rotation-factor-0-25@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +7 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
c-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-iclb5/igt@kms_plane_scaling@plane-scaler-wit=
h-clipping-clamping-rotation@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +5 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-tglb3/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2920">i915#2920</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-glk9/igt@kms_psr2_sf@overlay-primary-update-s=
f-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-iclb1/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-kbl4/igt@kms_psr2_sf@overlay-primary-update-s=
f-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-apl2/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/658">i915#658</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard=
-iclb5/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441=
">fdo#109441</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-tglb2/igt@kms_psr@psr2_primary_mmap_cpu.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132">=
i915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
467">i915#3467</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-iclb8/igt@kms_setmode@basic-clone-single-crtc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/3555">i915#3555</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-tglb3/igt@kms_setmode@basic-clone-single-crtc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/3555">i915#3555</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-apl7/igt@kms_writeback@writeback-fb-id.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb1/igt@perf@polling-parameterized.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-icl=
b5/igt@perf@polling-parameterized.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/5639">i915#5639</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-tglb1/igt@prime_nv_api@i915_nv_import_twice.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09291">fdo#109291</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_5:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-snb6/igt@prime_nv_pcopy@test3_5.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a>) +102 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_import_pread_pwrite:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-iclb1/igt@prime_nv_test@i915_import_pread_pw=
rite.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109291">fdo#109291</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-iclb8/igt@prime_vgem@coherency-gtt.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109292">fdo=
#109292</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
295">fdo#109295</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-tglb3/igt@prime_vgem@coherency-gtt.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">fdo=
#109295</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
656">fdo#111656</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@create:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-kbl3/igt@sysfs_clients@create.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7425/shard-tglb5/igt@sysfs_clients@create.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#299=
4</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-apl2/igt@sysfs_clients@recycle.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7425/shard-glk7/igt@sysfs_clients@sema-25.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@vcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-tglb5/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
425/shard-tglb1/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6015">i915#6015=
</a>) +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-glk3/igt@gem_ctx_persistence@smoketest.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6310">i915=
#6310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7425/shard-glk2/igt@gem_ctx_persistence@smoketest.html">PASS</a> +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb6/igt@gem_exec_balancer@parallel-contexts.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7425/shard-iclb2/igt@gem_exec_balancer@parallel-contexts.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-kbl4/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
425/shard-kbl3/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a> +2 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7425/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-apl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
425/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2849">i915#=
2849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
425/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-apl4/igt@gem_workarounds@suspend-resume-context.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7425/shard-apl7/igt@gem_workarounds@suspend-resume-context.html">PAS=
S</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb3/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb5/i=
gt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-glk6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-=
0-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/3743">i915#3743</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7425/shard-glk2/igt@kms_big_fb@y-tiled-max-hw-stride=
-64bpp-rotate-0-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-=
hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/79">i915#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7425/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdm=
i-a1-hdmi-a2.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-kbl3/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915=
#1188</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7425/shard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-e=
dp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb2/igt@kms_plane_scaling@planes-unity-scaling-downsc=
ale-factor-0-5@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/5235">i915#5235</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-iclb7/igt@kms_plane_scalin=
g@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html">PASS</a> +2 =
similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a hr=
ef=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shar=
d-iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-tglb1/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5519">i915#5519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7425/shard-tglb5/igt@kms_psr_stress_test@flip-primary-inva=
lidate-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-snb6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7425/shard-snb7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html"=
>PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6117">i91=
5#6117</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7425/shard-iclb7/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</=
a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-tglb1/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7425/shard-tglb1/igt@gem_exec_fair@basic-none-solo@rcs0.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2848">i915#2848</a>=
) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb5/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/=
shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.h=
tml">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
8145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/265">i915#265</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7425/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-opaqu=
e-fb.html">DMESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/62">i915#62</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920">i915=
#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7425/shard-iclb5/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#6=
58</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb3/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7425/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb8/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642<=
/a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo=
#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
8">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7425/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/5939">i915#5939</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11820/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl4/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11820/shard-kbl4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#=
5257</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">=
i915#716</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7425/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-kbl4/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_742=
5/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7425/shard-kbl1/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard=
-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7425/shard-kbl6/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/shard-kbl7/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7425/shard-kbl6/igt@runner@aborted.html">FAIL</a>) (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915=
#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312=
">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/5257">i915#5257</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/716">i915#716</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6549 -&gt; IGTPW_7425</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11820: 8f4a9176de36698b5b3ba72c4f68f1cf7a15c0c9 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7425: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7425/index.htm=
l<br />
  IGT_6549: 9b9371c8da32533022ad700a7c023b4c3a085fbc @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============3309046823285099449==--
