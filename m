Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 11 Dec 2023 13:32:08 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_benchmarks?=
 =?utf-8?B?L2dlbV93c2lt?= =?utf-8?Q?=3A?= Fix array index issue in xe_sync
 object referencing (rev2)
Message-ID: <20231211123208.nozeyibqqpvpnw6j@kamilkon-desk.igk.intel.com>
References: <20231208102438.12894-1-marcin.bernatowicz@linux.intel.com>
 <170203572276.7325.4812979580658943477@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170203572276.7325.4812979580658943477@emeril.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Marcin Bernatowicz <marcin.bernatowicz@intel.com>,
 lgci.bug.filing@intel.com, I915-ci-infra@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

this is unrelated to benchmark change,

Regards,
Kamil

On 2023-12-08 at 11:42:02 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: benchmarks/gem_wsim: Fix array index issue in xe_sync object referencing (rev2)
> URL   : https://patchwork.freedesktop.org/series/127512/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13998 -> IGTPW_10382
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10382 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10382, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/index.html
> 
> Participating hosts (35 -> 35)
> ------------------------------
> 
>   Additional (1): bat-dg2-8 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10382:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_busy@basic@flip:
>     - bat-adlp-11:        NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/bat-adlp-11/igt@kms_busy@basic@flip.html
>     - bat-dg2-8:          NOTRUN -> [INCOMPLETE][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/bat-dg2-8/igt@kms_busy@basic@flip.html
>     - bat-jsl-1:          NOTRUN -> [INCOMPLETE][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/bat-jsl-1/igt@kms_busy@basic@flip.html
> 
>   * igt@kms_force_connector_basic@force-connector-state:
>     - fi-kbl-guc:         NOTRUN -> [ABORT][4]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/fi-kbl-guc/igt@kms_force_connector_basic@force-connector-state.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10382 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@debugfs_test@basic-hwmon:
>     - bat-adlp-11:        NOTRUN -> [SKIP][5] ([i915#9318])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/bat-adlp-11/igt@debugfs_test@basic-hwmon.html
>     - bat-jsl-1:          NOTRUN -> [SKIP][6] ([i915#9318])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/bat-jsl-1/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@fbdev@info:
>     - fi-kbl-guc:         NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1849])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/fi-kbl-guc/igt@fbdev@info.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - bat-jsl-1:          NOTRUN -> [SKIP][8] ([i915#2190])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/bat-jsl-1/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_mmap@basic:
>     - bat-dg2-8:          NOTRUN -> [SKIP][9] ([i915#4083])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/bat-dg2-8/igt@gem_mmap@basic.html
> 
>   * igt@gem_mmap_gtt@basic:
>     - bat-dg2-8:          NOTRUN -> [SKIP][10] ([i915#4077]) +2 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/bat-dg2-8/igt@gem_mmap_gtt@basic.html
> 
>   * igt@gem_tiled_pread_basic:
>     - bat-dg2-8:          NOTRUN -> [SKIP][11] ([i915#4079]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/bat-dg2-8/igt@gem_tiled_pread_basic.html
>     - bat-adlp-11:        NOTRUN -> [SKIP][12] ([i915#3282])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/bat-adlp-11/igt@gem_tiled_pread_basic.html
> 
>   * igt@i915_module_load@load:
>     - bat-adlp-6:         [PASS][13] -> [DMESG-WARN][14] ([i915#8449])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13998/bat-adlp-6/igt@i915_module_load@load.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/bat-adlp-6/igt@i915_module_load@load.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - bat-dg2-8:          NOTRUN -> [SKIP][15] ([i915#5190])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - bat-dg2-8:          NOTRUN -> [SKIP][16] ([i915#4215] / [i915#5190])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
>     - bat-dg2-8:          NOTRUN -> [SKIP][17] ([i915#4212]) +6 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/bat-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
> 
>   * igt@kms_addfb_basic@tile-pitch-mismatch:
>     - bat-dg2-8:          NOTRUN -> [SKIP][18] ([i915#4212] / [i915#5608])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/bat-dg2-8/igt@kms_addfb_basic@tile-pitch-mismatch.html
> 
>   * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
>     - fi-kbl-guc:         NOTRUN -> [SKIP][19] ([fdo#109271]) +18 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
> 
>   
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
>   [i915#8449]: https://gitlab.freedesktop.org/drm/intel/issues/8449
>   [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7628 -> IGTPW_10382
> 
>   CI-20190529: 20190529
>   CI_DRM_13998: 25a1f5a87b8a320992918d224a548bb13a68c378 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10382: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/index.html
>   IGT_7628: 431c2d2dd5828b25fcbe1c82afbac865f4771aee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
> Testlist changes
> ----------------
> 
> -igt@xe_create@create-contexts
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10382/index.html
