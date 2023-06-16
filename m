Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1579A10E151
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jun 2023 09:39:33 +0000 (UTC)
Date: Fri, 16 Jun 2023 11:39:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230616093928.4gck26f2f7hpcpmu@kamilkon-desk1>
References: <20230616063817.1391126-1-janga.rahul.kumar@intel.com>
 <168690210762.9828.7518749812341706093@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <168690210762.9828.7518749812341706093@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSAgZm9yIHRlc3Rz?=
 =?utf-8?q?/intel-ci/xe=3A_Unblock_unbind_rebind_test_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 SanjuX Marikkar <sanjux.marikkar@intel.com>,
 RavitejaX Veesam <ravitejax.veesam@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

this is unrelated to change in Xe testlist,
no need for respin.

Regards,
Kamil

On 2023-06-16 at 07:55:07 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel-ci/xe: Unblock unbind rebind test (rev2)
> URL   : https://patchwork.freedesktop.org/series/119331/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7333 -> IGTPW_9193
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9193 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9193, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9193/index.html
> 
> Participating hosts (43 -> 42)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9193:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_rpm@basic-rte:
>     - bat-mtlp-8:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7333/bat-mtlp-8/igt@i915_pm_rpm@basic-rte.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9193/bat-mtlp-8/igt@i915_pm_rpm@basic-rte.html
> 
>   * igt@kms_addfb_basic@addfb25-bad-modifier:
>     - fi-kbl-soraka:      [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7333/fi-kbl-soraka/igt@kms_addfb_basic@addfb25-bad-modifier.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9193/fi-kbl-soraka/igt@kms_addfb_basic@addfb25-bad-modifier.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9193 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_suspend@basic-s0@smem:
>     - bat-jsl-3:          [PASS][5] -> [ABORT][6] ([i915#5122])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7333/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9193/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html
> 
>   * igt@i915_pm_backlight@basic-brightness@edp-1:
>     - bat-rplp-1:         NOTRUN -> [ABORT][7] ([i915#7077])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9193/bat-rplp-1/igt@i915_pm_backlight@basic-brightness@edp-1.html
> 
>   * igt@i915_selftest@live@guc:
>     - bat-rpls-2:         NOTRUN -> [DMESG-WARN][8] ([i915#7852])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9193/bat-rpls-2/igt@i915_selftest@live@guc.html
> 
>   * igt@i915_selftest@live@slpc:
>     - bat-rpls-2:         NOTRUN -> [DMESG-WARN][9] ([i915#6367])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9193/bat-rpls-2/igt@i915_selftest@live@slpc.html
> 
>   * igt@i915_suspend@basic-s2idle-without-i915:
>     - bat-rpls-2:         NOTRUN -> [ABORT][10] ([i915#6687] / [i915#8668])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9193/bat-rpls-2/igt@i915_suspend@basic-s2idle-without-i915.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - bat-jsl-3:          [PASS][11] -> [FAIL][12] ([fdo#103375])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7333/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9193/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - bat-dg2-11:         NOTRUN -> [SKIP][13] ([i915#7828])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9193/bat-dg2-11/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
>     - fi-hsw-4770:        NOTRUN -> [SKIP][14] ([fdo#109271])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9193/fi-hsw-4770/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:
>     - bat-dg2-8:          [PASS][15] -> [FAIL][16] ([i915#7932])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7333/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9193/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_exec_suspend@basic-s3@smem:
>     - fi-hsw-4770:        [ABORT][17] -> [PASS][18]
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7333/fi-hsw-4770/igt@gem_exec_suspend@basic-s3@smem.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9193/fi-hsw-4770/igt@gem_exec_suspend@basic-s3@smem.html
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>     - fi-kbl-soraka:      [DMESG-FAIL][19] ([i915#5334] / [i915#7872]) -> [PASS][20]
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7333/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9193/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-dg2-11:         [ABORT][21] ([i915#7913] / [i915#7979]) -> [PASS][22]
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7333/bat-dg2-11/igt@i915_selftest@live@hangcheck.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9193/bat-dg2-11/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@i915_selftest@live@reset:
>     - bat-rpls-2:         [ABORT][23] ([i915#4983] / [i915#7461] / [i915#7913] / [i915#7981] / [i915#8347]) -> [PASS][24]
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7333/bat-rpls-2/igt@i915_selftest@live@reset.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9193/bat-rpls-2/igt@i915_selftest@live@reset.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-rplp-1:         [ABORT][25] ([i915#4579] / [i915#8260]) -> [SKIP][26] ([i915#3555] / [i915#4579])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7333/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9193/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
>   [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
>   [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
>   [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
>   [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
>   [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
>   [i915#7077]: https://gitlab.freedesktop.org/drm/intel/issues/7077
>   [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7852]: https://gitlab.freedesktop.org/drm/intel/issues/7852
>   [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872
>   [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
>   [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
>   [i915#7979]: https://gitlab.freedesktop.org/drm/intel/issues/7979
>   [i915#7981]: https://gitlab.freedesktop.org/drm/intel/issues/7981
>   [i915#8260]: https://gitlab.freedesktop.org/drm/intel/issues/8260
>   [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
>   [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7333 -> IGTPW_9193
> 
>   CI-20190529: 20190529
>   CI_DRM_13277: 0746134e3453e38027b217dba18f922fba7966cd @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9193: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9193/index.html
>   IGT_7333: 828572e921c8e424464401280827ddbd88427452 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9193/index.html
