Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FA010E109
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Dec 2022 14:54:42 +0000 (UTC)
Date: Wed, 7 Dec 2022 16:55:11 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Sai Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>
Message-ID: <Y5CpT8rtDeBCLStu@platvala-desk.ger.corp.intel.com>
References: <20221130204526.3182975-1-markyacoub@chromium.org>
 <167037207774.14514.339332765006785212@emeril.freedesktop.org>
 <Y5COFwx1lb5n5z10@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5COFwx1lb5n5z10@kamilkon-desk1>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQ2hhbWVs?=
 =?utf-8?q?ium=3A_Split_kms=5Fchamelium_into_multiple_kms=5Fchamelium_test?=
 =?utf-8?q?s_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Dec 07, 2022 at 01:59:03PM +0100, Kamil Konieczny wrote:
> Hi Sai,
> 
> On 2022-12-07 at 00:14:37 -0000, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: Chamelium: Split kms_chamelium into multiple kms_chamelium tests (rev4)
> > URL   : https://patchwork.freedesktop.org/series/111501/
> > State : failure
> > 
> > == Summary ==
> > 
> > CI Bug Log - changes from CI_DRM_12475 -> IGTPW_8208
> > ====================================================
> > 
> > Summary
> > -------
> > 
> >   **FAILURE**
> > 
> >   Serious unknown changes coming with IGTPW_8208 absolutely need to be
> >   verified manually.
> >   
> >   If you think the reported changes have nothing to do with the changes
> >   introduced in IGTPW_8208, please notify your bug team to allow them
> >   to document this new failure mode, which will reduce false positives in CI.
> > 
> >   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/index.html
> > 
> > Participating hosts (30 -> 44)
> > ------------------------------
> > 
> >   Additional (15): fi-kbl-soraka bat-kbl-2 bat-adls-5 bat-dg1-6 bat-dg1-5 fi-bsw-n3050 bat-dg2-8 bat-adlp-9 bat-dg2-9 bat-adlp-6 bat-adlp-4 bat-atsm-1 bat-jsl-3 bat-dg2-11 fi-bsw-nick 
> >   Missing    (1): fi-cfl-8700k 
> > 
> > Possible new issues
> > -------------------
> > 
> >   Here are the unknown changes that may have been introduced in IGTPW_8208:
> > 
> > ### IGT changes ###
> > 
> > #### Possible regressions ####
> > 
> >   * igt@i915_selftest@live@late_gt_pm:
> >     - fi-kbl-soraka:      NOTRUN -> [INCOMPLETE][1]
> >    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-kbl-soraka/igt@i915_selftest@live@late_gt_pm.html
> > 
> 
> This i915_selftest is unrelated to changes in chamelium.
> 
> Below kms_chamelium_* tests should skip on all i915 HW.

For new tests filters can be added/modified when the results appear in
postmerge.

We have some chamelium hosts in BAT so it's not all i915 HW. But the
existing chamelium-skip filter is the one where these new test names
can be added.


-- 
Petri Latvala



> 
> Regards,
> Kamil
> 
> >   * {igt@kms_chamelium_edid@dp-edid-read} (NEW):
> >     - {bat-jsl-1}:        NOTRUN -> [SKIP][2] +8 similar issues
> >    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-jsl-1/igt@kms_chamelium_edid@dp-edid-read.html
> >     - {fi-jsl-1}:         NOTRUN -> [SKIP][3] +8 similar issues
> >    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-jsl-1/igt@kms_chamelium_edid@dp-edid-read.html
> > 
> >   * {igt@kms_chamelium_edid@hdmi-edid-read} (NEW):
> >     - fi-adl-ddr5:        NOTRUN -> [SKIP][4] +8 similar issues
> >    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-adl-ddr5/igt@kms_chamelium_edid@hdmi-edid-read.html
> >     - {fi-ehl-2}:         NOTRUN -> [SKIP][5] +8 similar issues
> >    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-ehl-2/igt@kms_chamelium_edid@hdmi-edid-read.html
> >     - {bat-rpls-2}:       NOTRUN -> [SKIP][6] +7 similar issues
> >    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-rpls-2/igt@kms_chamelium_edid@hdmi-edid-read.html
> >     - bat-dg1-6:          NOTRUN -> [SKIP][7] +8 similar issues
> >    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-6/igt@kms_chamelium_edid@hdmi-edid-read.html
> > 
> >   * {igt@kms_chamelium_frames@dp-crc-fast} (NEW):
> >     - {bat-rplp-1}:       NOTRUN -> [SKIP][8] +8 similar issues
> >    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-rplp-1/igt@kms_chamelium_frames@dp-crc-fast.html
> > 
> >   * {igt@kms_chamelium_frames@hdmi-crc-fast} (NEW):
> >     - {bat-adln-1}:       NOTRUN -> [SKIP][9] +8 similar issues
> >    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-adln-1/igt@kms_chamelium_frames@hdmi-crc-fast.html
> > 
> >   * {igt@kms_chamelium_hpd@common-hpd-after-suspend} (NEW):
> >     - {bat-adlp-9}:       NOTRUN -> [SKIP][10] +8 similar issues
> >    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-adlp-9/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> > 
> >   * {igt@kms_chamelium_hpd@dp-hpd-fast} (NEW):
> >     - fi-rkl-11600:       NOTRUN -> [SKIP][11] +7 similar issues
> >    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-rkl-11600/igt@kms_chamelium_hpd@dp-hpd-fast.html
> >     - {bat-adls-5}:       NOTRUN -> [SKIP][12] +7 similar issues
> >    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-adls-5/igt@kms_chamelium_hpd@dp-hpd-fast.html
> >     - bat-dg1-5:          NOTRUN -> [SKIP][13] +8 similar issues
> >    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-5/igt@kms_chamelium_hpd@dp-hpd-fast.html
> >     - {bat-dg1-7}:        NOTRUN -> [SKIP][14] +8 similar issues
> >    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-7/igt@kms_chamelium_hpd@dp-hpd-fast.html
> >     - {bat-dg2-9}:        NOTRUN -> [SKIP][15] +8 similar issues
> >    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg2-9/igt@kms_chamelium_hpd@dp-hpd-fast.html
> > 
> >   * {igt@kms_chamelium_hpd@hdmi-hpd-fast} (NEW):
> >     - {bat-adlp-6}:       NOTRUN -> [SKIP][16] +7 similar issues
> >    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-adlp-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
> > 
> >   * {igt@kms_chamelium_hpd@vga-hpd-fast} (NEW):
> >     - fi-icl-u2:          NOTRUN -> [SKIP][17] +8 similar issues
> >    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-icl-u2/igt@kms_chamelium_hpd@vga-hpd-fast.html
> >     - {bat-atsm-1}:       NOTRUN -> [SKIP][18] +7 similar issues
> >    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-atsm-1/igt@kms_chamelium_hpd@vga-hpd-fast.html
> >     - {bat-jsl-3}:        NOTRUN -> [SKIP][19] +8 similar issues
> >    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-jsl-3/igt@kms_chamelium_hpd@vga-hpd-fast.html
> >     - fi-rkl-guc:         NOTRUN -> [SKIP][20] +7 similar issues
> >    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-rkl-guc/igt@kms_chamelium_hpd@vga-hpd-fast.html
> >     - {bat-dg2-11}:       NOTRUN -> [SKIP][21] +8 similar issues
> >    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg2-11/igt@kms_chamelium_hpd@vga-hpd-fast.html
> >     - bat-adlp-4:         NOTRUN -> [SKIP][22] +8 similar issues
> >    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-adlp-4/igt@kms_chamelium_hpd@vga-hpd-fast.html
> >     - {bat-dg2-8}:        NOTRUN -> [SKIP][23] +8 similar issues
> >    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg2-8/igt@kms_chamelium_hpd@vga-hpd-fast.html
> >     - {bat-adlm-1}:       NOTRUN -> [SKIP][24] +8 similar issues
> >    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-adlm-1/igt@kms_chamelium_hpd@vga-hpd-fast.html
> > 
> >   
> > New tests
> > ---------
> > 
> >   New tests have been introduced between CI_DRM_12475 and IGTPW_8208:
> > 
> > ### New IGT tests (9) ###
> > 
> >   * igt@kms_chamelium_edid@dp-edid-read:
> >     - Statuses : 43 skip(s)
> >     - Exec time: [0.0] s
> > 
> >   * igt@kms_chamelium_edid@hdmi-edid-read:
> >     - Statuses : 1 pass(s) 42 skip(s)
> >     - Exec time: [0.0] s
> > 
> >   * igt@kms_chamelium_edid@vga-edid-read:
> >     - Statuses : 43 skip(s)
> >     - Exec time: [0.0] s
> > 
> >   * igt@kms_chamelium_frames@dp-crc-fast:
> >     - Statuses : 43 skip(s)
> >     - Exec time: [0.0] s
> > 
> >   * igt@kms_chamelium_frames@hdmi-crc-fast:
> >     - Statuses : 1 pass(s) 42 skip(s)
> >     - Exec time: [0.0] s
> > 
> >   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
> >     - Statuses : 1 pass(s) 33 skip(s)
> >     - Exec time: [0.0] s
> > 
> >   * igt@kms_chamelium_hpd@dp-hpd-fast:
> >     - Statuses : 43 skip(s)
> >     - Exec time: [0.0] s
> > 
> >   * igt@kms_chamelium_hpd@hdmi-hpd-fast:
> >     - Statuses : 1 pass(s) 42 skip(s)
> >     - Exec time: [0.0] s
> > 
> >   * igt@kms_chamelium_hpd@vga-hpd-fast:
> >     - Statuses : 43 skip(s)
> >     - Exec time: [0.0] s
> > 
> >   
> > 
> > Known issues
> > ------------
> > 
> >   Here are the changes found in IGTPW_8208 that come from known issues:
> > 
> > ### IGT changes ###
> > 
> > #### Issues hit ####
> > 
> >   * igt@debugfs_test@basic-hwmon:
> >     - bat-adlp-4:         NOTRUN -> [SKIP][25] ([i915#7456])
> >    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-adlp-4/igt@debugfs_test@basic-hwmon.html
> > 
> >   * igt@gem_exec_gttfill@basic:
> >     - fi-kbl-soraka:      NOTRUN -> [SKIP][26] ([fdo#109271]) +15 similar issues
> >    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-kbl-soraka/igt@gem_exec_gttfill@basic.html
> >     - fi-pnv-d510:        [PASS][27] -> [FAIL][28] ([i915#7229])
> >    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12475/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
> >    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
> > 
> >   * igt@gem_huc_copy@huc-copy:
> >     - fi-kbl-soraka:      NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#2190])
> >    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html
> > 
> >   * igt@gem_lmem_swapping@basic:
> >     - fi-kbl-soraka:      NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#4613]) +3 similar issues
> >    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html
> > 
> >   * igt@gem_lmem_swapping@parallel-random-engines:
> >     - fi-bsw-nick:        NOTRUN -> [SKIP][31] ([fdo#109271]) +48 similar issues
> >    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html
> >     - bat-adlp-4:         NOTRUN -> [SKIP][32] ([i915#4613]) +3 similar issues
> >    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-adlp-4/igt@gem_lmem_swapping@parallel-random-engines.html
> > 
> >   * igt@gem_mmap@basic:
> >     - bat-dg1-5:          NOTRUN -> [SKIP][33] ([i915#4083])
> >    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-5/igt@gem_mmap@basic.html
> >     - bat-dg1-6:          NOTRUN -> [SKIP][34] ([i915#4083])
> >    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-6/igt@gem_mmap@basic.html
> > 
> >   * igt@gem_render_tiled_blits@basic:
> >     - bat-dg1-6:          NOTRUN -> [SKIP][35] ([i915#4079]) +1 similar issue
> >    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-6/igt@gem_render_tiled_blits@basic.html
> > 
> >   * igt@gem_tiled_blits@basic:
> >     - bat-dg1-5:          NOTRUN -> [SKIP][36] ([i915#4077]) +2 similar issues
> >    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-5/igt@gem_tiled_blits@basic.html
> > 
> >   * igt@gem_tiled_fence_blits@basic:
> >     - bat-dg1-6:          NOTRUN -> [SKIP][37] ([i915#4077]) +2 similar issues
> >    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-6/igt@gem_tiled_fence_blits@basic.html
> > 
> >   * igt@gem_tiled_pread_basic:
> >     - bat-dg1-5:          NOTRUN -> [SKIP][38] ([i915#4079]) +1 similar issue
> >    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-5/igt@gem_tiled_pread_basic.html
> >     - bat-adlp-4:         NOTRUN -> [SKIP][39] ([i915#3282])
> >    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-adlp-4/igt@gem_tiled_pread_basic.html
> > 
> >   * igt@i915_module_load@load:
> >     - fi-bsw-n3050:       NOTRUN -> [DMESG-WARN][40] ([i915#7430])
> >    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-bsw-n3050/igt@i915_module_load@load.html
> > 
> >   * igt@i915_pm_backlight@basic-brightness:
> >     - bat-dg1-6:          NOTRUN -> [SKIP][41] ([i915#7561])
> >    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-6/igt@i915_pm_backlight@basic-brightness.html
> >     - bat-dg1-5:          NOTRUN -> [SKIP][42] ([i915#7561])
> >    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-5/igt@i915_pm_backlight@basic-brightness.html
> > 
> >   * igt@i915_pm_rps@basic-api:
> >     - bat-dg1-6:          NOTRUN -> [SKIP][43] ([i915#6621])
> >    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-6/igt@i915_pm_rps@basic-api.html
> >     - bat-adlp-4:         NOTRUN -> [SKIP][44] ([i915#6621])
> >    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-adlp-4/igt@i915_pm_rps@basic-api.html
> >     - bat-dg1-5:          NOTRUN -> [SKIP][45] ([i915#6621])
> >    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-5/igt@i915_pm_rps@basic-api.html
> > 
> >   * igt@i915_selftest@live@gt_heartbeat:
> >     - fi-glk-j4005:       [PASS][46] -> [DMESG-FAIL][47] ([i915#5334])
> >    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12475/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html
> >    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html
> > 
> >   * igt@i915_selftest@live@gt_mocs:
> >     - fi-rkl-guc:         [PASS][48] -> [INCOMPLETE][49] ([i915#4983])
> >    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12475/fi-rkl-guc/igt@i915_selftest@live@gt_mocs.html
> >    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-rkl-guc/igt@i915_selftest@live@gt_mocs.html
> > 
> >   * igt@i915_selftest@live@gt_pm:
> >     - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][50] ([i915#1886])
> >    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html
> > 
> >   * igt@kms_addfb_basic@basic-x-tiled-legacy:
> >     - bat-dg1-5:          NOTRUN -> [SKIP][51] ([i915#4212]) +7 similar issues
> >    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-5/igt@kms_addfb_basic@basic-x-tiled-legacy.html
> > 
> >   * igt@kms_addfb_basic@basic-y-tiled-legacy:
> >     - bat-dg1-5:          NOTRUN -> [SKIP][52] ([i915#4215])
> >    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-5/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> >     - bat-dg1-6:          NOTRUN -> [SKIP][53] ([i915#4215])
> >    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> > 
> >   * igt@kms_addfb_basic@tile-pitch-mismatch:
> >     - bat-dg1-6:          NOTRUN -> [SKIP][54] ([i915#4212]) +7 similar issues
> >    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-6/igt@kms_addfb_basic@tile-pitch-mismatch.html
> > 
> >   * {igt@kms_chamelium_edid@dp-edid-read} (NEW):
> >     - fi-pnv-d510:        NOTRUN -> [SKIP][55] ([fdo#109271]) +8 similar issues
> >    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-pnv-d510/igt@kms_chamelium_edid@dp-edid-read.html
> > 
> >   * {igt@kms_chamelium_edid@hdmi-edid-read} (NEW):
> >     - fi-cfl-guc:         NOTRUN -> [SKIP][56] ([fdo#109271]) +8 similar issues
> >    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-cfl-guc/igt@kms_chamelium_edid@hdmi-edid-read.html
> > 
> >   * {igt@kms_chamelium_frames@dp-crc-fast} (NEW):
> >     - fi-ilk-650:         NOTRUN -> [SKIP][57] ([fdo#109271]) +8 similar issues
> >    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-ilk-650/igt@kms_chamelium_frames@dp-crc-fast.html
> > 
> >   * {igt@kms_chamelium_frames@hdmi-crc-fast} (NEW):
> >     - fi-cfl-8109u:       NOTRUN -> [SKIP][58] ([fdo#109271]) +8 similar issues
> >    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-cfl-8109u/igt@kms_chamelium_frames@hdmi-crc-fast.html
> >     - fi-kbl-7567u:       NOTRUN -> [SKIP][59] ([fdo#109271]) +8 similar issues
> >    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-kbl-7567u/igt@kms_chamelium_frames@hdmi-crc-fast.html
> >     - fi-kbl-8809g:       NOTRUN -> [SKIP][60] ([fdo#109271]) +7 similar issues
> >    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-kbl-8809g/igt@kms_chamelium_frames@hdmi-crc-fast.html
> > 
> >   * {igt@kms_chamelium_hpd@common-hpd-after-suspend} (NEW):
> >     - fi-glk-j4005:       NOTRUN -> [SKIP][61] ([fdo#109271]) +8 similar issues
> >    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-glk-j4005/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> >     - fi-snb-2600:        NOTRUN -> [SKIP][62] ([fdo#109271]) +8 similar issues
> >    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-snb-2600/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> > 
> >   * {igt@kms_chamelium_hpd@dp-hpd-fast} (NEW):
> >     - fi-skl-6700k2:      NOTRUN -> [SKIP][63] ([fdo#109271]) +4 similar issues
> >    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-skl-6700k2/igt@kms_chamelium_hpd@dp-hpd-fast.html
> > 
> >   * {igt@kms_chamelium_hpd@hdmi-hpd-fast} (NEW):
> >     - fi-blb-e6850:       NOTRUN -> [SKIP][64] ([fdo#109271]) +8 similar issues
> >    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-blb-e6850/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
> >     - {bat-kbl-2}:        NOTRUN -> [SKIP][65] ([fdo#109271]) +8 similar issues
> >    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-kbl-2/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
> > 
> >   * {igt@kms_chamelium_hpd@vga-hpd-fast} (NEW):
> >     - fi-apl-guc:         NOTRUN -> [SKIP][66] ([fdo#109271]) +8 similar issues
> >    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-apl-guc/igt@kms_chamelium_hpd@vga-hpd-fast.html
> >     - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][67] ([fdo#109271]) +7 similar issues
> >    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-bdw-gvtdvm/igt@kms_chamelium_hpd@vga-hpd-fast.html
> >     - fi-bsw-kefka:       NOTRUN -> [SKIP][68] ([fdo#109271]) +8 similar issues
> >    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-bsw-kefka/igt@kms_chamelium_hpd@vga-hpd-fast.html
> >     - fi-skl-guc:         NOTRUN -> [SKIP][69] ([fdo#109271]) +8 similar issues
> >    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-skl-guc/igt@kms_chamelium_hpd@vga-hpd-fast.html
> >     - fi-hsw-4770:        NOTRUN -> [SKIP][70] ([fdo#109271]) +8 similar issues
> >    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-hsw-4770/igt@kms_chamelium_hpd@vga-hpd-fast.html
> >     - fi-ivb-3770:        NOTRUN -> [SKIP][71] ([fdo#109271]) +8 similar issues
> >    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-ivb-3770/igt@kms_chamelium_hpd@vga-hpd-fast.html
> >     - fi-elk-e7500:       NOTRUN -> [SKIP][72] ([fdo#109271]) +8 similar issues
> >    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-elk-e7500/igt@kms_chamelium_hpd@vga-hpd-fast.html
> > 
> >   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
> >     - bat-adlp-4:         NOTRUN -> [SKIP][73] ([i915#4103])
> >    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
> >     - bat-dg1-5:          NOTRUN -> [SKIP][74] ([i915#4103] / [i915#4213])
> >    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
> >     - bat-dg1-6:          NOTRUN -> [SKIP][75] ([i915#4103] / [i915#4213])
> >    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
> > 
> >   * igt@kms_force_connector_basic@force-load-detect:
> >     - bat-adlp-4:         NOTRUN -> [SKIP][76] ([i915#4093]) +3 similar issues
> >    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-adlp-4/igt@kms_force_connector_basic@force-load-detect.html
> >     - bat-dg1-5:          NOTRUN -> [SKIP][77] ([fdo#109285])
> >    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-5/igt@kms_force_connector_basic@force-load-detect.html
> >     - bat-dg1-6:          NOTRUN -> [SKIP][78] ([fdo#109285])
> >    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-6/igt@kms_force_connector_basic@force-load-detect.html
> > 
> >   * igt@kms_pipe_crc_basic@suspend-read-crc:
> >     - bat-adlp-4:         NOTRUN -> [SKIP][79] ([i915#3546])
> >    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc.html
> > 
> >   * igt@kms_psr@primary_page_flip:
> >     - bat-dg1-5:          NOTRUN -> [SKIP][80] ([i915#1072] / [i915#4078]) +3 similar issues
> >    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-5/igt@kms_psr@primary_page_flip.html
> > 
> >   * igt@kms_psr@sprite_plane_onoff:
> >     - bat-dg1-6:          NOTRUN -> [SKIP][81] ([i915#1072] / [i915#4078]) +3 similar issues
> >    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-6/igt@kms_psr@sprite_plane_onoff.html
> > 
> >   * igt@kms_setmode@basic-clone-single-crtc:
> >     - bat-dg1-5:          NOTRUN -> [SKIP][82] ([i915#3555])
> >    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html
> >     - bat-dg1-6:          NOTRUN -> [SKIP][83] ([i915#3555])
> >    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-6/igt@kms_setmode@basic-clone-single-crtc.html
> >     - bat-adlp-4:         NOTRUN -> [SKIP][84] ([i915#3555] / [i915#4579])
> >    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-adlp-4/igt@kms_setmode@basic-clone-single-crtc.html
> > 
> >   * igt@prime_vgem@basic-fence-read:
> >     - bat-dg1-5:          NOTRUN -> [SKIP][85] ([i915#3708]) +3 similar issues
> >    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-5/igt@prime_vgem@basic-fence-read.html
> > 
> >   * igt@prime_vgem@basic-gtt:
> >     - bat-dg1-6:          NOTRUN -> [SKIP][86] ([i915#3708] / [i915#4077]) +1 similar issue
> >    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-6/igt@prime_vgem@basic-gtt.html
> >     - bat-dg1-5:          NOTRUN -> [SKIP][87] ([i915#3708] / [i915#4077]) +1 similar issue
> >    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-5/igt@prime_vgem@basic-gtt.html
> > 
> >   * igt@prime_vgem@basic-userptr:
> >     - bat-dg1-6:          NOTRUN -> [SKIP][88] ([i915#3708] / [i915#4873])
> >    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-6/igt@prime_vgem@basic-userptr.html
> >     - bat-adlp-4:         NOTRUN -> [SKIP][89] ([fdo#109295] / [i915#3301] / [i915#3708])
> >    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-adlp-4/igt@prime_vgem@basic-userptr.html
> >     - bat-dg1-5:          NOTRUN -> [SKIP][90] ([i915#3708] / [i915#4873])
> >    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-5/igt@prime_vgem@basic-userptr.html
> > 
> >   * igt@prime_vgem@basic-write:
> >     - bat-dg1-6:          NOTRUN -> [SKIP][91] ([i915#3708]) +3 similar issues
> >    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-dg1-6/igt@prime_vgem@basic-write.html
> >     - bat-adlp-4:         NOTRUN -> [SKIP][92] ([fdo#109295] / [i915#3291] / [i915#3708]) +2 similar issues
> >    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-adlp-4/igt@prime_vgem@basic-write.html
> > 
> >   * igt@runner@aborted:
> >     - fi-bsw-n3050:       NOTRUN -> [FAIL][93] ([i915#4312])
> >    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/fi-bsw-n3050/igt@runner@aborted.html
> > 
> >   
> > #### Possible fixes ####
> > 
> >   * igt@gem_exec_suspend@basic-s3@smem:
> >     - {bat-rplp-1}:       [DMESG-WARN][94] ([i915#2867]) -> [PASS][95]
> >    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12475/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html
> >    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html
> > 
> >   
> >   {name}: This element is suppressed. This means it is ignored when computing
> >           the status of the difference (SUCCESS, WARNING, or FAILURE).
> > 
> >   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
> >   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
> >   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
> >   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
> >   [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
> >   [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
> >   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
> >   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
> >   [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
> >   [i915#3003]: https://gitlab.freedesktop.org/drm/intel/issues/3003
> >   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
> >   [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
> >   [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
> >   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
> >   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
> >   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
> >   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
> >   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
> >   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
> >   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
> >   [i915#4093]: https://gitlab.freedesktop.org/drm/intel/issues/4093
> >   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
> >   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
> >   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
> >   [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
> >   [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
> >   [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
> >   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
> >   [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
> >   [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
> >   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
> >   [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
> >   [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
> >   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
> >   [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
> >   [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
> >   [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
> >   [i915#6093]: https://gitlab.freedesktop.org/drm/intel/issues/6093
> >   [i915#6094]: https://gitlab.freedesktop.org/drm/intel/issues/6094
> >   [i915#6166]: https://gitlab.freedesktop.org/drm/intel/issues/6166
> >   [i915#6257]: https://gitlab.freedesktop.org/drm/intel/issues/6257
> >   [i915#6311]: https://gitlab.freedesktop.org/drm/intel/issues/6311
> >   [i915#6434]: https://gitlab.freedesktop.org/drm/intel/issues/6434
> >   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
> >   [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
> >   [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229
> >   [i915#7357]: https://gitlab.freedesktop.org/drm/intel/issues/7357
> >   [i915#7430]: https://gitlab.freedesktop.org/drm/intel/issues/7430
> >   [i915#7443]: https://gitlab.freedesktop.org/drm/intel/issues/7443
> >   [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
> >   [i915#7498]: https://gitlab.freedesktop.org/drm/intel/issues/7498
> >   [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
> > 
> > 
> > Build changes
> > -------------
> > 
> >   * CI: CI-20190529 -> None
> >   * IGT: IGT_7084 -> IGTPW_8208
> > 
> >   CI-20190529: 20190529
> >   CI_DRM_12475: ebea1ef56080671403683f4c09e89c3e7b7e28da @ git://anongit.freedesktop.org/gfx-ci/linux
> >   IGTPW_8208: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/index.html
> >   IGT_7084: ec81855d36887dfe81d5ff513ed6d512773da37e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> > 
> > == Logs ==
> > 
> > For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8208/index.html
