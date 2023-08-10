Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A3D10E5EB
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 19:09:12 +0000 (UTC)
Date: Thu, 10 Aug 2023 21:09:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230810190905.72mbko3fvazd7xmg@kamilkon-desk1>
References: <20230810151303.1338975-1-mauro.chehab@linux.intel.com>
 <169168574279.4957.4306535564620066721@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <169168574279.4957.4306535564620066721@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSAgZm9yIFZhbGlk?=
 =?utf-8?q?ate_Xe_field_descriptions_at_build_time_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>, RavitejaX Veesam <ravitejax.veesam@intel.com>, SanjuX Marikkar <sanjux.marikkar@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

below issue is not related to Xe testlist,

Regards,
Kamil

On 2023-08-10 at 16:42:22 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Validate Xe field descriptions at build time (rev2)
> URL   : https://patchwork.freedesktop.org/series/122285/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7427 -> IGTPW_9571
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9571 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9571, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9571/index.html
> 
> Participating hosts (43 -> 42)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9571:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@reset:
>     - bat-rpls-1:         [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7427/bat-rpls-1/igt@i915_selftest@live@reset.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9571/bat-rpls-1/igt@i915_selftest@live@reset.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9571 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_pm_rpm@basic-pci-d3-state:
>     - bat-adlp-9:         [PASS][3] -> [FAIL][4] ([i915#7940])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7427/bat-adlp-9/igt@i915_pm_rpm@basic-pci-d3-state.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9571/bat-adlp-9/igt@i915_pm_rpm@basic-pci-d3-state.html
> 
>   * igt@i915_selftest@live@execlists:
>     - fi-bsw-nick:        [PASS][5] -> [ABORT][6] ([i915#7911] / [i915#7913])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7427/fi-bsw-nick/igt@i915_selftest@live@execlists.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9571/fi-bsw-nick/igt@i915_selftest@live@execlists.html
> 
>   * igt@i915_selftest@live@migrate:
>     - bat-dg2-11:         [PASS][7] -> [DMESG-WARN][8] ([i915#7699])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7427/bat-dg2-11/igt@i915_selftest@live@migrate.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9571/bat-dg2-11/igt@i915_selftest@live@migrate.html
> 
>   * igt@i915_selftest@live@reset:
>     - bat-rpls-2:         NOTRUN -> [ABORT][9] ([i915#4983] / [i915#7461] / [i915#7913] / [i915#8347])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9571/bat-rpls-2/igt@i915_selftest@live@reset.html
> 
>   * igt@i915_selftest@live@slpc:
>     - bat-mtlp-8:         NOTRUN -> [DMESG-WARN][10] ([i915#6367])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9571/bat-mtlp-8/igt@i915_selftest@live@slpc.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][11] ([i915#6645])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9571/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][12] ([i915#7828])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9571/bat-mtlp-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>     - bat-dg2-11:         NOTRUN -> [SKIP][13] ([i915#1845] / [i915#5354]) +2 similar issues
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9571/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> 
>   * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
>     - bat-rplp-1:         [PASS][14] -> [ABORT][15] ([i915#8442] / [i915#8668])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7427/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9571/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-1:
>     - bat-dg2-9:          [PASS][16] -> [FAIL][17] ([fdo#103375]) +2 similar issues
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7427/bat-dg2-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-1.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9571/bat-dg2-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-1.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_pm_rpm@basic-pci-d3-state:
>     - fi-tgl-1115g4:      [FAIL][18] ([i915#7940]) -> [PASS][19]
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7427/fi-tgl-1115g4/igt@i915_pm_rpm@basic-pci-d3-state.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9571/fi-tgl-1115g4/igt@i915_pm_rpm@basic-pci-d3-state.html
> 
>   * igt@i915_pm_rpm@basic-rte:
>     - fi-cfl-8109u:       [FAIL][20] ([i915#7940]) -> [PASS][21]
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7427/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9571/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html
>     - fi-skl-guc:         [FAIL][22] ([i915#7940]) -> [PASS][23]
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7427/fi-skl-guc/igt@i915_pm_rpm@basic-rte.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9571/fi-skl-guc/igt@i915_pm_rpm@basic-rte.html
> 
>   * igt@i915_selftest@live@requests:
>     - bat-mtlp-8:         [ABORT][24] ([i915#7982] / [i915#8865]) -> [PASS][25]
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7427/bat-mtlp-8/igt@i915_selftest@live@requests.html
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9571/bat-mtlp-8/igt@i915_selftest@live@requests.html
>     - bat-rpls-2:         [ABORT][26] ([i915#4983] / [i915#7913]) -> [PASS][27]
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7427/bat-rpls-2/igt@i915_selftest@live@requests.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9571/bat-rpls-2/igt@i915_selftest@live@requests.html
>     - bat-mtlp-6:         [DMESG-FAIL][28] ([i915#8497]) -> [PASS][29]
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7427/bat-mtlp-6/igt@i915_selftest@live@requests.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9571/bat-mtlp-6/igt@i915_selftest@live@requests.html
> 
>   * igt@i915_selftest@live@slpc:
>     - bat-mtlp-6:         [DMESG-WARN][30] ([i915#6367]) -> [PASS][31]
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7427/bat-mtlp-6/igt@i915_selftest@live@slpc.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9571/bat-mtlp-6/igt@i915_selftest@live@slpc.html
>     - bat-rpls-1:         [DMESG-WARN][32] ([i915#6367]) -> [PASS][33]
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7427/bat-rpls-1/igt@i915_selftest@live@slpc.html
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9571/bat-rpls-1/igt@i915_selftest@live@slpc.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_pm_rpm@basic-pci-d3-state:
>     - fi-skl-guc:         [FAIL][34] ([i915#7691]) -> [FAIL][35] ([i915#7940])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7427/fi-skl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9571/fi-skl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
>     - fi-kbl-guc:         [FAIL][36] ([i915#7691]) -> [SKIP][37] ([fdo#109271])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7427/fi-kbl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9571/fi-kbl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
> 
>   
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
>   [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
>   [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
>   [i915#7691]: https://gitlab.freedesktop.org/drm/intel/issues/7691
>   [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
>   [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
>   [i915#7940]: https://gitlab.freedesktop.org/drm/intel/issues/7940
>   [i915#7982]: https://gitlab.freedesktop.org/drm/intel/issues/7982
>   [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
>   [i915#8442]: https://gitlab.freedesktop.org/drm/intel/issues/8442
>   [i915#8497]: https://gitlab.freedesktop.org/drm/intel/issues/8497
>   [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
>   [i915#8865]: https://gitlab.freedesktop.org/drm/intel/issues/8865
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7427 -> IGTPW_9571
> 
>   CI-20190529: 20190529
>   CI_DRM_13500: 4be6c76008410cf6ada52b25cb4bc4280bc3a3ee @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9571: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9571/index.html
>   IGT_7427: 85557af77f06ffef7e909c6008788ac34a011b65 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9571/index.html

