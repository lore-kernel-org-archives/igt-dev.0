Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F2910E612
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jun 2023 12:34:26 +0000 (UTC)
Date: Fri, 16 Jun 2023 14:34:21 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230616123421.janrlh7uavmksnts@kamilkon-desk1>
References: <20230615123654.1672601-1-nemesa.garg@intel.com>
 <168684556399.10725.6234221118716520840@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <168684556399.10725.6234221118716520840@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Flegacy=3A_Reducing_the__IOCTL=28drm=5Fmode=5Fcur?=
 =?utf-8?q?sor=5Fioctl=29_calls_by_reducing_the_timeout=2E?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>, "Garg,
 Nemesa" <nemesa.garg@intel.com>, SanjuX Marikkar <sanjux.marikkar@intel.com>,
 RavitejaX Veesam <ravitejax.veesam@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

On 2023-06-15 at 16:12:43 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_cursor_legacy: Reducing the IOCTL(drm_mode_cursor_ioctl) calls by reducing the timeout.
> URL   : https://patchwork.freedesktop.org/series/119387/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7332 -> IGTPW_9182
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9182 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9182, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/index.html
> 
> Participating hosts (42 -> 42)
> ------------------------------
> 
>   Additional (1): fi-kbl-soraka 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9182:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@dmabuf@all-tests@dma_fence:
>     - fi-kbl-guc:         [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/fi-kbl-guc/igt@dmabuf@all-tests@dma_fence.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/fi-kbl-guc/igt@dmabuf@all-tests@dma_fence.html
> 

This is unrelated to kms_cursor_legacy test, please supress
and respin.

Regards,
Kamil

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@xe_debugfs@forcewake:
>     - {bat-dg1-8}:        [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/bat-dg1-8/igt@xe_debugfs@forcewake.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/bat-dg1-8/igt@xe_debugfs@forcewake.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9182 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_auth@basic-auth:
>     - bat-adlp-11:        NOTRUN -> [ABORT][5] ([i915#8011])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/bat-adlp-11/igt@core_auth@basic-auth.html
> 
>   * igt@dmabuf@all-tests@sanitycheck:
>     - fi-kbl-guc:         [PASS][6] -> [ABORT][7] ([i915#8423])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/fi-kbl-guc/igt@dmabuf@all-tests@sanitycheck.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/fi-kbl-guc/igt@dmabuf@all-tests@sanitycheck.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#2190])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#4613]) +3 similar issues
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>     - fi-kbl-7567u:       [PASS][10] -> [DMESG-FAIL][11] ([i915#5334] / [i915#7872])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/fi-kbl-7567u/igt@i915_selftest@live@gt_heartbeat.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/fi-kbl-7567u/igt@i915_selftest@live@gt_heartbeat.html
> 
>   * igt@i915_selftest@live@gt_mocs:
>     - bat-mtlp-6:         [PASS][12] -> [DMESG-FAIL][13] ([i915#7059])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html
> 
>   * igt@i915_selftest@live@gt_pm:
>     - bat-rpls-2:         [PASS][14] -> [DMESG-FAIL][15] ([i915#4258] / [i915#7913])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/bat-rpls-2/igt@i915_selftest@live@gt_pm.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/bat-rpls-2/igt@i915_selftest@live@gt_pm.html
>     - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][16] ([i915#1886] / [i915#7913])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html
> 
>   * igt@i915_selftest@live@migrate:
>     - bat-mtlp-6:         [PASS][17] -> [DMESG-FAIL][18] ([i915#7699])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/bat-mtlp-6/igt@i915_selftest@live@migrate.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/bat-mtlp-6/igt@i915_selftest@live@migrate.html
>     - bat-dg2-11:         [PASS][19] -> [DMESG-WARN][20] ([i915#7699])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/bat-dg2-11/igt@i915_selftest@live@migrate.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/bat-dg2-11/igt@i915_selftest@live@migrate.html
>     - bat-mtlp-8:         [PASS][21] -> [DMESG-FAIL][22] ([i915#7699])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/bat-mtlp-8/igt@i915_selftest@live@migrate.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/bat-mtlp-8/igt@i915_selftest@live@migrate.html
> 
>   * igt@i915_selftest@live@requests:
>     - bat-mtlp-8:         [PASS][23] -> [DMESG-FAIL][24] ([i915#7269])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/bat-mtlp-8/igt@i915_selftest@live@requests.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/bat-mtlp-8/igt@i915_selftest@live@requests.html
>     - bat-mtlp-6:         [PASS][25] -> [DMESG-FAIL][26] ([i915#8497])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/bat-mtlp-6/igt@i915_selftest@live@requests.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/bat-mtlp-6/igt@i915_selftest@live@requests.html
> 
>   * igt@i915_selftest@live@reset:
>     - bat-rpls-1:         [PASS][27] -> [ABORT][28] ([i915#4983] / [i915#7461] / [i915#7981] / [i915#8347] / [i915#8384])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/bat-rpls-1/igt@i915_selftest@live@reset.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/bat-rpls-1/igt@i915_selftest@live@reset.html
>     - bat-rpls-2:         [PASS][29] -> [ABORT][30] ([i915#4983] / [i915#7461] / [i915#7913] / [i915#8347])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/bat-rpls-2/igt@i915_selftest@live@reset.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/bat-rpls-2/igt@i915_selftest@live@reset.html
> 
>   * igt@i915_selftest@live@slpc:
>     - bat-mtlp-6:         [PASS][31] -> [DMESG-WARN][32] ([i915#6367])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/bat-mtlp-6/igt@i915_selftest@live@slpc.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/bat-mtlp-6/igt@i915_selftest@live@slpc.html
>     - bat-mtlp-8:         [PASS][33] -> [DMESG-WARN][34] ([i915#6367])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/bat-mtlp-8/igt@i915_selftest@live@slpc.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/bat-mtlp-8/igt@i915_selftest@live@slpc.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - bat-dg2-11:         NOTRUN -> [SKIP][35] ([i915#7828])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/bat-dg2-11/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][36] ([fdo#109271]) +14 similar issues
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#4579])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/fi-kbl-soraka/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@gt_mocs:
>     - bat-rpls-2:         [DMESG-FAIL][38] ([i915#7059]) -> [PASS][39]
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/bat-rpls-2/igt@i915_selftest@live@gt_mocs.html
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/bat-rpls-2/igt@i915_selftest@live@gt_mocs.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-dg2-11:         [ABORT][40] ([i915#7913] / [i915#7979]) -> [PASS][41]
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/bat-dg2-11/igt@i915_selftest@live@hangcheck.html
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/bat-dg2-11/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-mtlp-6:         [DMESG-FAIL][42] ([i915#6763]) -> [PASS][43]
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1:
>     - bat-dg2-8:          [FAIL][44] ([i915#7932]) -> [PASS][45]
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1.html
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_module_load@load:
>     - bat-adlp-11:        [ABORT][46] ([i915#4423]) -> [DMESG-WARN][47] ([i915#4423])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/bat-adlp-11/igt@i915_module_load@load.html
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/bat-adlp-11/igt@i915_module_load@load.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
>   [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
>   [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
>   [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
>   [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
>   [i915#6763]: https://gitlab.freedesktop.org/drm/intel/issues/6763
>   [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
>   [i915#7269]: https://gitlab.freedesktop.org/drm/intel/issues/7269
>   [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
>   [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872
>   [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
>   [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
>   [i915#7979]: https://gitlab.freedesktop.org/drm/intel/issues/7979
>   [i915#7981]: https://gitlab.freedesktop.org/drm/intel/issues/7981
>   [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
>   [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
>   [i915#8384]: https://gitlab.freedesktop.org/drm/intel/issues/8384
>   [i915#8423]: https://gitlab.freedesktop.org/drm/intel/issues/8423
>   [i915#8497]: https://gitlab.freedesktop.org/drm/intel/issues/8497
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7332 -> IGTPW_9182
> 
>   CI-20190529: 20190529
>   CI_DRM_13274: 134d180cacae82fadbc5ee32f86014cc290f5e0c @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9182: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/index.html
>   IGT_7332: 2a25a6109e8af4b0a69a717cc8710dcafed4bb4c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9182/index.html
