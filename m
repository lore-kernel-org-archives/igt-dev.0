Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022DF6EA83
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2020 10:28:39 +0000 (UTC)
Date: Tue, 25 Feb 2020 11:28:37 +0100
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20200225102837.GC23214@kdec5-desk.ger.corp.intel.com>
References: <20200218070930.18246-1-satyavathi.k@intel.com>
 <158204624858.31432.4716364936280480034@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158204624858.31432.4716364936280480034@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fringfill=3AAdded_=5F=5Ffor=5Feach=5Fphysical=5Fengin?=
 =?utf-8?q?e_to_utilize_all_available_engines=2E_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, satyavat <satyavathi.k@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Feb 18, 2020 at 05:17:28PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/i915/gem_ringfill:Added __for_each_physical_engine to utilize all available engines. (rev4)
> URL   : https://patchwork.freedesktop.org/series/73463/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_7960 -> IGTPW_4172
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
Please look at these failures - are related to your changes (possibly).
Code can be merged only after r-b and tests passed.
Kasia
> 
>   Serious unknown changes coming with IGTPW_4172 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4172, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4172:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_ringfill@basic-default-forked:
>     - fi-icl-u3:          [PASS][1] -> [SKIP][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-icl-u3/igt@gem_ringfill@basic-default-forked.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-icl-u3/igt@gem_ringfill@basic-default-forked.html
>     - fi-icl-y:           [PASS][3] -> [SKIP][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-icl-y/igt@gem_ringfill@basic-default-forked.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-icl-y/igt@gem_ringfill@basic-default-forked.html
>     - fi-icl-u2:          [PASS][5] -> [SKIP][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-icl-u2/igt@gem_ringfill@basic-default-forked.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-icl-u2/igt@gem_ringfill@basic-default-forked.html
>     - fi-cml-u2:          [PASS][7] -> [SKIP][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-cml-u2/igt@gem_ringfill@basic-default-forked.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-cml-u2/igt@gem_ringfill@basic-default-forked.html
>     - fi-icl-dsi:         [PASS][9] -> [SKIP][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-icl-dsi/igt@gem_ringfill@basic-default-forked.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-icl-dsi/igt@gem_ringfill@basic-default-forked.html
>     - fi-ilk-650:         [PASS][11] -> [FAIL][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-ilk-650/igt@gem_ringfill@basic-default-forked.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-ilk-650/igt@gem_ringfill@basic-default-forked.html
>     - fi-icl-guc:         [PASS][13] -> [SKIP][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-icl-guc/igt@gem_ringfill@basic-default-forked.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-icl-guc/igt@gem_ringfill@basic-default-forked.html
>     - fi-cml-s:           [PASS][15] -> [SKIP][16]
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-cml-s/igt@gem_ringfill@basic-default-forked.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-cml-s/igt@gem_ringfill@basic-default-forked.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@gem_ringfill@basic-default-forked:
>     - {fi-tgl-u}:         [PASS][17] -> [SKIP][18]
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-tgl-u/igt@gem_ringfill@basic-default-forked.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-tgl-u/igt@gem_ringfill@basic-default-forked.html
>     - {fi-tgl-dsi}:       [PASS][19] -> [SKIP][20]
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-tgl-dsi/igt@gem_ringfill@basic-default-forked.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-tgl-dsi/igt@gem_ringfill@basic-default-forked.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_4172 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_ringfill@basic-default-forked:
>     - fi-kbl-x1275:       [PASS][21] -> [SKIP][22] ([fdo#109271])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-kbl-x1275/igt@gem_ringfill@basic-default-forked.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-kbl-x1275/igt@gem_ringfill@basic-default-forked.html
>     - fi-kbl-7500u:       [PASS][23] -> [SKIP][24] ([fdo#109271])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-kbl-7500u/igt@gem_ringfill@basic-default-forked.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-kbl-7500u/igt@gem_ringfill@basic-default-forked.html
>     - fi-hsw-4770r:       [PASS][25] -> [SKIP][26] ([fdo#109271])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-hsw-4770r/igt@gem_ringfill@basic-default-forked.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-hsw-4770r/igt@gem_ringfill@basic-default-forked.html
>     - fi-kbl-guc:         [PASS][27] -> [SKIP][28] ([fdo#109271])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-kbl-guc/igt@gem_ringfill@basic-default-forked.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-kbl-guc/igt@gem_ringfill@basic-default-forked.html
>     - fi-bsw-kefka:       [PASS][29] -> [SKIP][30] ([fdo#109271])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-bsw-kefka/igt@gem_ringfill@basic-default-forked.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-bsw-kefka/igt@gem_ringfill@basic-default-forked.html
>     - fi-skl-guc:         [PASS][31] -> [SKIP][32] ([fdo#109271])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-skl-guc/igt@gem_ringfill@basic-default-forked.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-skl-guc/igt@gem_ringfill@basic-default-forked.html
>     - fi-kbl-r:           [PASS][33] -> [SKIP][34] ([fdo#109271])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-kbl-r/igt@gem_ringfill@basic-default-forked.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-kbl-r/igt@gem_ringfill@basic-default-forked.html
>     - fi-kbl-8809g:       [PASS][35] -> [SKIP][36] ([fdo#109271])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-kbl-8809g/igt@gem_ringfill@basic-default-forked.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-kbl-8809g/igt@gem_ringfill@basic-default-forked.html
>     - fi-blb-e6850:       [PASS][37] -> [SKIP][38] ([fdo#109271])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-blb-e6850/igt@gem_ringfill@basic-default-forked.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-blb-e6850/igt@gem_ringfill@basic-default-forked.html
>     - fi-bdw-5557u:       [PASS][39] -> [SKIP][40] ([fdo#109271])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-bdw-5557u/igt@gem_ringfill@basic-default-forked.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-bdw-5557u/igt@gem_ringfill@basic-default-forked.html
>     - fi-apl-guc:         [PASS][41] -> [SKIP][42] ([fdo#109271])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-apl-guc/igt@gem_ringfill@basic-default-forked.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-apl-guc/igt@gem_ringfill@basic-default-forked.html
>     - fi-cfl-8700k:       [PASS][43] -> [SKIP][44] ([fdo#109271])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-cfl-8700k/igt@gem_ringfill@basic-default-forked.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-cfl-8700k/igt@gem_ringfill@basic-default-forked.html
>     - fi-bxt-dsi:         [PASS][45] -> [SKIP][46] ([fdo#109271])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-bxt-dsi/igt@gem_ringfill@basic-default-forked.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-bxt-dsi/igt@gem_ringfill@basic-default-forked.html
>     - fi-skl-6600u:       [PASS][47] -> [SKIP][48] ([fdo#109271])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-skl-6600u/igt@gem_ringfill@basic-default-forked.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-skl-6600u/igt@gem_ringfill@basic-default-forked.html
>     - fi-pnv-d510:        [PASS][49] -> [SKIP][50] ([fdo#109271])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-pnv-d510/igt@gem_ringfill@basic-default-forked.html
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-pnv-d510/igt@gem_ringfill@basic-default-forked.html
>     - fi-bsw-n3050:       [PASS][51] -> [SKIP][52] ([fdo#109271])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-bsw-n3050/igt@gem_ringfill@basic-default-forked.html
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-bsw-n3050/igt@gem_ringfill@basic-default-forked.html
>     - fi-hsw-4770:        [PASS][53] -> [SKIP][54] ([fdo#109271])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-hsw-4770/igt@gem_ringfill@basic-default-forked.html
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-hsw-4770/igt@gem_ringfill@basic-default-forked.html
>     - fi-cfl-guc:         [PASS][55] -> [SKIP][56] ([fdo#109271])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-cfl-guc/igt@gem_ringfill@basic-default-forked.html
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-cfl-guc/igt@gem_ringfill@basic-default-forked.html
>     - fi-skl-6700k2:      [PASS][57] -> [SKIP][58] ([fdo#109271])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-skl-6700k2/igt@gem_ringfill@basic-default-forked.html
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-skl-6700k2/igt@gem_ringfill@basic-default-forked.html
>     - fi-skl-lmem:        [PASS][59] -> [SKIP][60] ([fdo#109271])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-skl-lmem/igt@gem_ringfill@basic-default-forked.html
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-skl-lmem/igt@gem_ringfill@basic-default-forked.html
>     - fi-glk-dsi:         [PASS][61] -> [SKIP][62] ([fdo#109271])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-glk-dsi/igt@gem_ringfill@basic-default-forked.html
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-glk-dsi/igt@gem_ringfill@basic-default-forked.html
>     - fi-ivb-3770:        [PASS][63] -> [SKIP][64] ([fdo#109271])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-ivb-3770/igt@gem_ringfill@basic-default-forked.html
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-ivb-3770/igt@gem_ringfill@basic-default-forked.html
>     - fi-snb-2600:        [PASS][65] -> [SKIP][66] ([fdo#109271])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-snb-2600/igt@gem_ringfill@basic-default-forked.html
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-snb-2600/igt@gem_ringfill@basic-default-forked.html
> 
>   * igt@i915_module_load@reload:
>     - fi-skl-6770hq:      [PASS][67] -> [DMESG-WARN][68] ([i915#92]) +1 similar issue
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-skl-6770hq/igt@i915_module_load@reload.html
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-skl-6770hq/igt@i915_module_load@reload.html
> 
>   * igt@i915_selftest@live_hangcheck:
>     - fi-icl-dsi:         [PASS][69] -> [INCOMPLETE][70] ([fdo#108569])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-icl-dsi/igt@i915_selftest@live_hangcheck.html
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-icl-dsi/igt@i915_selftest@live_hangcheck.html
> 
>   * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
>     - fi-skl-6770hq:      [PASS][71] -> [SKIP][72] ([fdo#109271]) +5 similar issues
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
> 
>   * igt@kms_pipe_crc_basic@read-crc-pipe-c:
>     - fi-skl-6770hq:      [PASS][73] -> [DMESG-WARN][74] ([i915#106])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-c.html
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-c.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live_blt:
>     - fi-hsw-4770r:       [DMESG-FAIL][75] ([i915#553] / [i915#725]) -> [PASS][76]
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/fi-hsw-4770r/igt@i915_selftest@live_blt.html
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/fi-hsw-4770r/igt@i915_selftest@live_blt.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [i915#106]: https://gitlab.freedesktop.org/drm/intel/issues/106
>   [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
>   [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
>   [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
>   [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
> 
> 
> Participating hosts (46 -> 45)
> ------------------------------
> 
>   Additional (5): fi-kbl-soraka fi-hsw-peppy fi-snb-2520m fi-gdg-551 fi-cfl-8109u 
>   Missing    (6): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5447 -> IGTPW_4172
> 
>   CI-20190529: 20190529
>   CI_DRM_7960: b86443a3c1d1b32a03f381c9198eed9243f06d18 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_4172: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/index.html
>   IGT_5447: 8d6b2500e44d3dc78b5eac8798f0de42f2ff9014 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> 
> 
> 
> == Testlist changes ==
> 
> +igt@gem_ringfill@basic-
> +igt@gem_ringfill@basic-fd
> +igt@gem_ringfill@basic-forked
> +igt@gem_ringfill@basic-hang
> +igt@gem_ringfill@basic-interruptible
> +igt@gem_ringfill@bomb
> +igt@gem_ringfill@child
> +igt@gem_ringfill@s3
> +igt@gem_ringfill@s4
> -igt@gem_ringfill@basic-default
> -igt@gem_ringfill@basic-default-fd
> -igt@gem_ringfill@basic-default-forked
> -igt@gem_ringfill@basic-default-hang
> -igt@gem_ringfill@basic-default-interruptible
> -igt@gem_ringfill@blt
> -igt@gem_ringfill@blt-bomb
> -igt@gem_ringfill@blt-child
> -igt@gem_ringfill@blt-fd
> -igt@gem_ringfill@blt-forked
> -igt@gem_ringfill@blt-hang
> -igt@gem_ringfill@blt-interruptible
> -igt@gem_ringfill@blt-s3
> -igt@gem_ringfill@blt-s4
> -igt@gem_ringfill@bsd
> -igt@gem_ringfill@bsd1
> -igt@gem_ringfill@bsd1-bomb
> -igt@gem_ringfill@bsd1-child
> -igt@gem_ringfill@bsd1-fd
> -igt@gem_ringfill@bsd1-forked
> -igt@gem_ringfill@bsd1-hang
> -igt@gem_ringfill@bsd1-interruptible
> -igt@gem_ringfill@bsd1-s3
> -igt@gem_ringfill@bsd1-s4
> -igt@gem_ringfill@bsd2
> -igt@gem_ringfill@bsd2-bomb
> -igt@gem_ringfill@bsd2-child
> -igt@gem_ringfill@bsd2-fd
> -igt@gem_ringfill@bsd2-forked
> -igt@gem_ringfill@bsd2-hang
> -igt@gem_ringfill@bsd2-interruptible
> -igt@gem_ringfill@bsd2-s3
> -igt@gem_ringfill@bsd2-s4
> -igt@gem_ringfill@bsd-bomb
> -igt@gem_ringfill@bsd-child
> -igt@gem_ringfill@bsd-fd
> -igt@gem_ringfill@bsd-forked
> -igt@gem_ringfill@bsd-hang
> -igt@gem_ringfill@bsd-interruptible
> -igt@gem_ringfill@bsd-s3
> -igt@gem_ringfill@bsd-s4
> -igt@gem_ringfill@default-bomb
> -igt@gem_ringfill@default-child
> -igt@gem_ringfill@default-s3
> -igt@gem_ringfill@default-s4
> -igt@gem_ringfill@render
> -igt@gem_ringfill@render-bomb
> -igt@gem_ringfill@render-child
> -igt@gem_ringfill@render-fd
> -igt@gem_ringfill@render-forked
> -igt@gem_ringfill@render-hang
> -igt@gem_ringfill@render-interruptible
> -igt@gem_ringfill@render-s3
> -igt@gem_ringfill@render-s4
> -igt@gem_ringfill@vebox
> -igt@gem_ringfill@vebox-bomb
> -igt@gem_ringfill@vebox-child
> -igt@gem_ringfill@vebox-fd
> -igt@gem_ringfill@vebox-forked
> -igt@gem_ringfill@vebox-hang
> -igt@gem_ringfill@vebox-interruptible
> -igt@gem_ringfill@vebox-s3
> -igt@gem_ringfill@vebox-s4
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4172/index.html
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
