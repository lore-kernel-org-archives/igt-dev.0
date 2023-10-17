Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F23110E111
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Oct 2023 07:29:08 +0000 (UTC)
Date: Tue, 17 Oct 2023 09:28:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231017072849.5uwe5jq4qqgdmkmb@kamilkon-desk.igk.intel.com>
References: <20231016203750.156726-1-daniele.ceraolospurio@intel.com>
 <169749531989.13509.4136425708236108687@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <169749531989.13509.4136425708236108687@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogIGZhaWx1cmUgZm9yIHRlc3Rz?=
 =?utf-8?q?/xe=5Fhuc=5Fcopy=3A_Handle_multiple_GTs_=28rev3=29?=
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

below regressions are not related to xe_huc_copy,
could you supress them and respin tests ?

Regards,
Kamil

On 2023-10-16 at 22:28:39 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/xe_huc_copy: Handle multiple GTs (rev3)
> URL   : https://patchwork.freedesktop.org/series/124654/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13763 -> IGTPW_10009
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10009 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10009, please notify your bug team (lgci.bug.filing@intel.com) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10009/index.html
> 
> Participating hosts (33 -> 33)
> ------------------------------
> 
>   Additional (1): fi-kbl-guc 
>   Missing    (1): fi-kbl-soraka 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10009:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_close_race@basic-threads:
>     - bat-dg1-5:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13763/bat-dg1-5/igt@gem_close_race@basic-threads.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10009/bat-dg1-5/igt@gem_close_race@basic-threads.html
> 
>   * igt@gem_exec_gttfill@basic:
>     - bat-jsl-3:          NOTRUN -> [INCOMPLETE][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10009/bat-jsl-3/igt@gem_exec_gttfill@basic.html
> 
>   * igt@i915_selftest@live@execlists:
>     - fi-bsw-nick:        [PASS][4] -> [ABORT][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13763/fi-bsw-nick/igt@i915_selftest@live@execlists.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10009/fi-bsw-nick/igt@i915_selftest@live@execlists.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_13763 and IGTPW_10009:
> 
> ### New IGT tests (2) ###
> 
>   * igt@i915_module_load:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@prime_self:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10009 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@debugfs_test@basic-hwmon:
>     - bat-jsl-3:          NOTRUN -> [SKIP][6] ([i915#9318])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10009/bat-jsl-3/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@fbdev@info:
>     - fi-kbl-guc:         NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1849])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10009/fi-kbl-guc/igt@fbdev@info.html
> 
>   * igt@gem_exec_suspend@basic-s3@lmem0:
>     - bat-atsm-1:         NOTRUN -> [DMESG-WARN][8] ([i915#8841]) +4 other tests dmesg-warn
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10009/bat-atsm-1/igt@gem_exec_suspend@basic-s3@lmem0.html
> 
>   * igt@gem_exec_suspend@basic-s3@smem:
>     - bat-mtlp-8:         NOTRUN -> [ABORT][9] ([i915#8213] / [i915#9262])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10009/bat-mtlp-8/igt@gem_exec_suspend@basic-s3@smem.html
> 
>   * igt@gem_lmem_swapping@verify-random:
>     - fi-kbl-guc:         NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#4613]) +3 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10009/fi-kbl-guc/igt@gem_lmem_swapping@verify-random.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - bat-atsm-1:         NOTRUN -> [SKIP][11] ([i915#6645])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10009/bat-atsm-1/igt@i915_suspend@basic-s3-without-i915.html
>     - bat-mtlp-8:         NOTRUN -> [SKIP][12] ([i915#6645])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10009/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
>     - fi-kbl-guc:         NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#1845]) +8 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10009/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
> 
>   * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:
>     - bat-adlp-11:        [PASS][14] -> [ABORT][15] ([i915#8668] / [i915#9451])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13763/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10009/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html
> 
>   * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
>     - bat-rplp-1:         [PASS][16] -> [ABORT][17] ([i915#8668])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13763/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10009/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - fi-kbl-guc:         NOTRUN -> [SKIP][18] ([fdo#109271]) +25 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10009/fi-kbl-guc/igt@kms_pipe_crc_basic@suspend-read-crc.html
>     - bat-atsm-1:         NOTRUN -> [SKIP][19] ([i915#1836])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10009/bat-atsm-1/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_module_load@load:
>     - bat-jsl-3:          [INCOMPLETE][20] -> [PASS][21]
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13763/bat-jsl-3/igt@i915_module_load@load.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10009/bat-jsl-3/igt@i915_module_load@load.html
> 
>   * igt@i915_selftest@live@gt_lrc:
>     - bat-atsm-1:         [INCOMPLETE][22] -> [PASS][23]
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13763/bat-atsm-1/igt@i915_selftest@live@gt_lrc.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10009/bat-atsm-1/igt@i915_selftest@live@gt_lrc.html
> 
>   * igt@i915_selftest@live@requests:
>     - bat-mtlp-8:         [ABORT][24] ([i915#9414]) -> [PASS][25]
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13763/bat-mtlp-8/igt@i915_selftest@live@requests.html
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10009/bat-mtlp-8/igt@i915_selftest@live@requests.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - fi-bsw-nick:        [FAIL][26] ([i915#9276]) -> [PASS][27]
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13763/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10009/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5:
>     - bat-adlp-11:        [ABORT][28] ([i915#8668]) -> [PASS][29]
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13763/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10009/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
>   [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
>   [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
>   [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
>   [i915#9262]: https://gitlab.freedesktop.org/drm/intel/issues/9262
>   [i915#9276]: https://gitlab.freedesktop.org/drm/intel/issues/9276
>   [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
>   [i915#9414]: https://gitlab.freedesktop.org/drm/intel/issues/9414
>   [i915#9451]: https://gitlab.freedesktop.org/drm/intel/issues/9451
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7541 -> IGTPW_10009
> 
>   CI-20190529: 20190529
>   CI_DRM_13763: 67bce9faa651e4e14107ac8cc29e690d780685f6 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10009: 10009
>   IGT_7541: fcddb77c3f8a77020f7f3b2660a66cae27cfaa2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
> Testlist changes
> ----------------
> 
> -igt@xe_copy_basic@mem-copy-linear-0x3fff
> -igt@xe_copy_basic@mem-copy-linear-0x369
> -igt@xe_copy_basic@mem-copy-linear-0xfd
> -igt@xe_copy_basic@mem-copy-linear-0xfffe
> -igt@xe_copy_basic@mem-set-linear-0x3fff
> -igt@xe_copy_basic@mem-set-linear-0x369
> -igt@xe_copy_basic@mem-set-linear-0xfd
> -igt@xe_copy_basic@mem-set-linear-0xfffe
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10009/index.html
