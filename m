Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6EA10F712
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Mar 2022 08:18:55 +0000 (UTC)
Date: Wed, 30 Mar 2022 10:18:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YkQSY8Uh8OksaxNT@kamilkon-DESK1>
References: <20220329141717.106131-1-kamil.konieczny@linux.intel.com>
 <164856822570.5796.16892958651096839791@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <164856822570.5796.16892958651096839791@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fconcurrent=5Fall=3A_Add_no-reloc_=28rev6=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi

imho this failure is not related to my change:

Aborting.
Previous test: nothing
Next test: core_auth (basic-auth)

Kernel badly tainted (0x200, 0x200) (check dmesg for details):
	TAINT_WARN: WARN_ON has happened.

Can you please help to check once and rerun ?

Thanks,
Kamil

Dnia 2022-03-29 at 15:37:05 -0000, Patchwork napisał(a):
> == Series Details ==
> 
> Series: i915/gem_concurrent_all: Add no-reloc (rev6)
> URL   : https://patchwork.freedesktop.org/series/100688/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_11416 -> IGTPW_6843
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_6843 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_6843, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/index.html
> 
> Participating hosts (42 -> 44)
> ------------------------------
> 
>   Additional (6): fi-tgl-u2 fi-skl-guc fi-icl-u2 fi-cfl-8700k bat-adlp-4 fi-ivb-3770 
>   Missing    (4): fi-bsw-cyan shard-tglu fi-bdw-samus fi-kbl-8809g 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_6843:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@runner@aborted:
>     - bat-adlp-4:         NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/bat-adlp-4/igt@runner@aborted.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_6843 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@amdgpu/amd_basic@cs-gfx:
>     - fi-hsw-4770:        NOTRUN -> [SKIP][2] ([fdo#109271] / [fdo#109315]) +17 similar issues
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-hsw-4770/igt@amdgpu/amd_basic@cs-gfx.html
> 
>   * igt@amdgpu/amd_basic@query-info:
>     - fi-bsw-kefka:       NOTRUN -> [SKIP][3] ([fdo#109271]) +17 similar issues
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-bsw-kefka/igt@amdgpu/amd_basic@query-info.html
> 
>   * igt@amdgpu/amd_cs_nop@fork-gfx0:
>     - fi-icl-u2:          NOTRUN -> [SKIP][4] ([fdo#109315]) +17 similar issues
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-icl-u2/igt@amdgpu/amd_cs_nop@fork-gfx0.html
> 
>   * igt@amdgpu/amd_cs_nop@sync-fork-gfx0:
>     - fi-cfl-8700k:       NOTRUN -> [SKIP][5] ([fdo#109271]) +29 similar issues
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-cfl-8700k/igt@amdgpu/amd_cs_nop@sync-fork-gfx0.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-tgl-u2:          NOTRUN -> [SKIP][6] ([i915#2190])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-tgl-u2/igt@gem_huc_copy@huc-copy.html
>     - fi-cfl-8700k:       NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#2190])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-cfl-8700k/igt@gem_huc_copy@huc-copy.html
>     - fi-icl-u2:          NOTRUN -> [SKIP][8] ([i915#2190])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-icl-u2/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - fi-skl-guc:         NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#4613]) +3 similar issues
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-skl-guc/igt@gem_lmem_swapping@basic.html
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - fi-icl-u2:          NOTRUN -> [SKIP][10] ([i915#4613]) +3 similar issues
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-icl-u2/igt@gem_lmem_swapping@parallel-random-engines.html
>     - fi-cfl-8700k:       NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#4613]) +3 similar issues
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-cfl-8700k/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@gem_lmem_swapping@random-engines:
>     - fi-ivb-3770:        NOTRUN -> [SKIP][12] ([fdo#109271]) +36 similar issues
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-ivb-3770/igt@gem_lmem_swapping@random-engines.html
> 
>   * igt@gem_lmem_swapping@verify-random:
>     - fi-tgl-u2:          NOTRUN -> [SKIP][13] ([i915#4613]) +3 similar issues
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-tgl-u2/igt@gem_lmem_swapping@verify-random.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - fi-snb-2600:        [PASS][14] -> [INCOMPLETE][15] ([i915#3921])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11416/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@kms_busy@basic@flip:
>     - fi-tgl-u2:          NOTRUN -> [DMESG-WARN][16] ([i915#402]) +2 similar issues
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-tgl-u2/igt@kms_busy@basic@flip.html
> 
>   * igt@kms_chamelium@dp-crc-fast:
>     - fi-skl-guc:         NOTRUN -> [SKIP][17] ([fdo#109271] / [fdo#111827]) +8 similar issues
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-skl-guc/igt@kms_chamelium@dp-crc-fast.html
> 
>   * igt@kms_chamelium@dp-hpd-fast:
>     - fi-ivb-3770:        NOTRUN -> [SKIP][18] ([fdo#109271] / [fdo#111827]) +8 similar issues
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-ivb-3770/igt@kms_chamelium@dp-hpd-fast.html
>     - fi-tgl-u2:          NOTRUN -> [SKIP][19] ([fdo#109284] / [fdo#111827]) +8 similar issues
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-tgl-u2/igt@kms_chamelium@dp-hpd-fast.html
> 
>   * igt@kms_chamelium@hdmi-hpd-fast:
>     - fi-icl-u2:          NOTRUN -> [SKIP][20] ([fdo#111827]) +8 similar issues
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
> 
>   * igt@kms_chamelium@vga-edid-read:
>     - fi-cfl-8700k:       NOTRUN -> [SKIP][21] ([fdo#109271] / [fdo#111827]) +8 similar issues
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-cfl-8700k/igt@kms_chamelium@vga-edid-read.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - fi-skl-guc:         NOTRUN -> [SKIP][22] ([fdo#109271]) +29 similar issues
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-skl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>     - fi-tgl-u2:          NOTRUN -> [SKIP][23] ([i915#4103]) +1 similar issue
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-tgl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - fi-icl-u2:          NOTRUN -> [SKIP][24] ([fdo#109278]) +2 similar issues
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - fi-tgl-u2:          NOTRUN -> [SKIP][25] ([fdo#109285])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-tgl-u2/igt@kms_force_connector_basic@force-load-detect.html
>     - fi-icl-u2:          NOTRUN -> [SKIP][26] ([fdo#109285])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
>     - fi-cfl-8700k:       NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#533])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-cfl-8700k/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
>     - fi-skl-guc:         NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#533])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-skl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
> 
>   * igt@kms_psr@primary_page_flip:
>     - fi-tgl-u2:          NOTRUN -> [SKIP][29] ([i915#668]) +3 similar issues
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-tgl-u2/igt@kms_psr@primary_page_flip.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - fi-icl-u2:          NOTRUN -> [SKIP][30] ([i915#3555])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-icl-u2/igt@kms_setmode@basic-clone-single-crtc.html
>     - fi-tgl-u2:          NOTRUN -> [SKIP][31] ([i915#3555])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-tgl-u2/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-userptr:
>     - fi-icl-u2:          NOTRUN -> [SKIP][32] ([i915#3301])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-icl-u2/igt@prime_vgem@basic-userptr.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_pm_rpm@module-reload:
>     - {bat-rpls-2}:       [FAIL][33] ([i915#5323]) -> [PASS][34]
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11416/bat-rpls-2/igt@i915_pm_rpm@module-reload.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/bat-rpls-2/igt@i915_pm_rpm@module-reload.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - {fi-jsl-1}:         [DMESG-WARN][35] -> [PASS][36]
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11416/fi-jsl-1/igt@i915_pm_rps@basic-api.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-jsl-1/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_selftest@live@execlists:
>     - fi-bsw-kefka:       [INCOMPLETE][37] ([i915#2940]) -> [PASS][38]
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11416/fi-bsw-kefka/igt@i915_selftest@live@execlists.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-bsw-kefka/igt@i915_selftest@live@execlists.html
> 
>   * igt@i915_selftest@live@gt_lrc:
>     - {bat-adlp-6}:       [INCOMPLETE][39] -> [PASS][40]
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11416/bat-adlp-6/igt@i915_selftest@live@gt_lrc.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/bat-adlp-6/igt@i915_selftest@live@gt_lrc.html
> 
>   * igt@i915_selftest@live@guc_multi_lrc:
>     - {bat-rpls-2}:       [DMESG-WARN][41] ([i915#4391]) -> [PASS][42] +1 similar issue
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11416/bat-rpls-2/igt@i915_selftest@live@guc_multi_lrc.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/bat-rpls-2/igt@i915_selftest@live@guc_multi_lrc.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - fi-hsw-4770:        [INCOMPLETE][43] ([i915#4785]) -> [PASS][44]
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11416/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
>     - {fi-ehl-2}:         [INCOMPLETE][45] -> [PASS][46]
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11416/fi-ehl-2/igt@i915_selftest@live@hangcheck.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/fi-ehl-2/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@i915_selftest@live@requests:
>     - {bat-rpls-2}:       [DMESG-FAIL][47] ([i915#5087]) -> [PASS][48]
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11416/bat-rpls-2/igt@i915_selftest@live@requests.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/bat-rpls-2/igt@i915_selftest@live@requests.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - {bat-adlp-6}:       [DMESG-WARN][49] ([i915#5068]) -> [PASS][50]
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11416/bat-adlp-6/igt@i915_selftest@live@workarounds.html
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/bat-adlp-6/igt@i915_selftest@live@workarounds.html
> 
>   * igt@kms_busy@basic@flip:
>     - {bat-dg2-9}:        [DMESG-WARN][51] ([i915#5291]) -> [PASS][52]
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11416/bat-dg2-9/igt@kms_busy@basic@flip.html
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/bat-dg2-9/igt@kms_busy@basic@flip.html
>     - {bat-adlp-6}:       [DMESG-WARN][53] ([i915#3576]) -> [PASS][54] +1 similar issue
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11416/bat-adlp-6/igt@kms_busy@basic@flip.html
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/bat-adlp-6/igt@kms_busy@basic@flip.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
>   [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
>   [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
>   [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
>   [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
>   [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
>   [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
>   [i915#4897]: https://gitlab.freedesktop.org/drm/intel/issues/4897
>   [i915#5068]: https://gitlab.freedesktop.org/drm/intel/issues/5068
>   [i915#5087]: https://gitlab.freedesktop.org/drm/intel/issues/5087
>   [i915#5127]: https://gitlab.freedesktop.org/drm/intel/issues/5127
>   [i915#5193]: https://gitlab.freedesktop.org/drm/intel/issues/5193
>   [i915#5270]: https://gitlab.freedesktop.org/drm/intel/issues/5270
>   [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
>   [i915#5275]: https://gitlab.freedesktop.org/drm/intel/issues/5275
>   [i915#5291]: https://gitlab.freedesktop.org/drm/intel/issues/5291
>   [i915#5323]: https://gitlab.freedesktop.org/drm/intel/issues/5323
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6399 -> IGTPW_6843
> 
>   CI-20190529: 20190529
>   CI_DRM_11416: 1dc2c6953e2689a0e5b7cca8450da14059d35f03 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_6843: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/index.html
>   IGT_6399: 9ba6cb16f04319226383b57975db203561c75781 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6843/index.html
