Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C12F10E3CD
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 16:28:07 +0000 (UTC)
Date: Tue, 13 Jun 2023 18:27:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230613162748.r3xqknjpslu3xgg4@kamilkon-desk1>
References: <20230613124647.37529-1-hersenxs.wu@amd.com>
 <168666533834.21696.3627880619098234458@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <168666533834.21696.3627880619098234458@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?amdgpu/amd=5Fvrr=5Frange=3A_fix_test_crash_when_n=5Fpipes_=3E_n?=
 =?utf-8?q?=5Foutputs?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 Hersen Wu <hersenxs.wu@amd.com>, SanjuX Marikkar <sanjux.marikkar@intel.com>,
 RavitejaX Veesam <ravitejax.veesam@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

below regression is unrelated to change in amdgpu test,
could you supress it ?

Regards,
Kamil

On 2023-06-13 at 14:08:58 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/amdgpu/amd_vrr_range: fix test crash when n_pipes > n_outputs
> URL   : https://patchwork.freedesktop.org/series/119276/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13265 -> IGTPW_9158
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9158 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9158, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9158/index.html
> 
> Participating hosts (39 -> 39)
> ------------------------------
> 
>   Additional (2): fi-kbl-soraka fi-bsw-n3050 
>   Missing    (2): bat-rpls-2 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9158:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_rpm@basic-rte:
>     - bat-mtlp-8:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13265/bat-mtlp-8/igt@i915_pm_rpm@basic-rte.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9158/bat-mtlp-8/igt@i915_pm_rpm@basic-rte.html
> 
>   * igt@kms_force_connector_basic@force-connector-state:
>     - fi-kbl-soraka:      NOTRUN -> [INCOMPLETE][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9158/fi-kbl-soraka/igt@kms_force_connector_basic@force-connector-state.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9158 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_auth@basic-auth:
>     - bat-adlp-11:        NOTRUN -> [ABORT][4] ([i915#8011])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9158/bat-adlp-11/igt@core_auth@basic-auth.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#2190])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9158/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#4613]) +3 similar issues
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9158/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html
> 
>   * igt@gem_lmem_swapping@random-engines:
>     - fi-bsw-n3050:       NOTRUN -> [SKIP][7] ([fdo#109271]) +25 similar issues
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9158/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>     - fi-glk-j4005:       [PASS][8] -> [DMESG-FAIL][9] ([i915#5334])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13265/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9158/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html
> 
>   * igt@i915_selftest@live@gt_pm:
>     - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][10] ([i915#1886] / [i915#7913])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9158/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html
> 
>   * igt@i915_selftest@live@requests:
>     - bat-mtlp-6:         [PASS][11] -> [DMESG-FAIL][12] ([i915#8497])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13265/bat-mtlp-6/igt@i915_selftest@live@requests.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9158/bat-mtlp-6/igt@i915_selftest@live@requests.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - bat-rpls-1:         NOTRUN -> [ABORT][13] ([i915#6687] / [i915#7978])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9158/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-fast:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][14] ([fdo#109271]) +14 similar issues
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9158/fi-kbl-soraka/igt@kms_chamelium_frames@hdmi-crc-fast.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - fi-pnv-d510:        NOTRUN -> [SKIP][15] ([fdo#109271])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9158/fi-pnv-d510/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-hdmi-a-2:
>     - fi-bsw-n3050:       NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#4579]) +1 similar issue
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9158/fi-bsw-n3050/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#4579])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9158/fi-kbl-soraka/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@dmabuf@all-tests@dma_fence:
>     - fi-pnv-d510:        [DMESG-FAIL][18] ([i915#8143]) -> [PASS][19]
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13265/fi-pnv-d510/igt@dmabuf@all-tests@dma_fence.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9158/fi-pnv-d510/igt@dmabuf@all-tests@dma_fence.html
> 
>   * igt@dmabuf@all-tests@sanitycheck:
>     - fi-pnv-d510:        [ABORT][20] ([i915#8143]) -> [PASS][21]
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13265/fi-pnv-d510/igt@dmabuf@all-tests@sanitycheck.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9158/fi-pnv-d510/igt@dmabuf@all-tests@sanitycheck.html
> 
>   * igt@i915_selftest@live@requests:
>     - bat-rpls-1:         [ABORT][22] ([i915#4983] / [i915#7911] / [i915#7920]) -> [PASS][23]
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13265/bat-rpls-1/igt@i915_selftest@live@requests.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9158/bat-rpls-1/igt@i915_selftest@live@requests.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1:
>     - bat-dg2-8:          [FAIL][24] ([i915#7932]) -> [PASS][25]
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13265/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1.html
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9158/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_module_load@load:
>     - bat-adlp-11:        [ABORT][26] ([i915#4423]) -> [DMESG-WARN][27] ([i915#4423])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13265/bat-adlp-11/igt@i915_module_load@load.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9158/bat-adlp-11/igt@i915_module_load@load.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
>   [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
>   [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
>   [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
>   [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
>   [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
>   [i915#7920]: https://gitlab.freedesktop.org/drm/intel/issues/7920
>   [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
>   [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
>   [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
>   [i915#8143]: https://gitlab.freedesktop.org/drm/intel/issues/8143
>   [i915#8497]: https://gitlab.freedesktop.org/drm/intel/issues/8497
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7326 -> IGTPW_9158
> 
>   CI-20190529: 20190529
>   CI_DRM_13265: 46ceea7e1f841890e7cb53f0df602a30c6b41d6a @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9158: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9158/index.html
>   IGT_7326: 02c2cf17628b6203d6105d4a91dfe8a101d482ce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
> Testlist changes
> ----------------
> 
> -igt@xe_spin_batch@spin-all
> -igt@xe_spin_batch@spin-basic
> -igt@xe_spin_batch@spin-basic-all
> -igt@xe_spin_batch@spin-batch
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9158/index.html
