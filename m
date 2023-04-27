Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77B810E196
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Apr 2023 16:42:25 +0000 (UTC)
Date: Thu, 27 Apr 2023 18:42:21 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230427164221.fvfdkikbux5sopgt@kamilkon-desk1>
References: <20230426162207.36995-1-kamil.konieczny@linux.intel.com>
 <168252852059.17154.9980920348288469304@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <168252852059.17154.9980920348288469304@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgVXNlIG5l?=
 =?utf-8?q?w_library_libproc2_=28rev2=29?=
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

this is unrelated to change in libproc used by igt_aux,
these needs ubuntu 23.04 to be tested.

Regards,
Kamil

On 2023-04-26 at 17:02:00 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Use new library libproc2 (rev2)
> URL   : https://patchwork.freedesktop.org/series/116896/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13063 -> IGTPW_8868
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_8868 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_8868, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8868/index.html
> 
> Participating hosts (38 -> 40)
> ------------------------------
> 
>   Additional (3): fi-kbl-soraka bat-mtlp-8 bat-mtlp-6 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_8868:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_suspend@basic-s3@smem:
>     - bat-rpls-1:         NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8868/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@i915_pm_rpm@basic-rte:
>     - {bat-mtlp-8}:       NOTRUN -> [ABORT][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8868/bat-mtlp-8/igt@i915_pm_rpm@basic-rte.html
> 
>   * igt@i915_selftest@live@migrate:
>     - {bat-mtlp-6}:       NOTRUN -> [FAIL][3] +1 similar issue
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8868/bat-mtlp-6/igt@i915_selftest@live@migrate.html
> 
>   * igt@kms_flip@basic-flip-vs-dpms:
>     - {bat-mtlp-6}:       NOTRUN -> [SKIP][4] +30 similar issues
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8868/bat-mtlp-6/igt@kms_flip@basic-flip-vs-dpms.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_8868 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#2190])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8868/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#4613]) +3 similar issues
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8868/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html
> 
>   * igt@i915_selftest@live@gt_pm:
>     - fi-kbl-soraka:      NOTRUN -> [FAIL][7] ([i915#7913] / [i915#8383])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8868/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html
> 
>   * igt@i915_selftest@live@migrate:
>     - bat-rpls-2:         NOTRUN -> [FAIL][8] ([i915#7913])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8868/bat-rpls-2/igt@i915_selftest@live@migrate.html
> 
>   * igt@i915_selftest@live@slpc:
>     - bat-rpls-2:         NOTRUN -> [FAIL][9] ([i915#6997] / [i915#7913])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8868/bat-rpls-2/igt@i915_selftest@live@slpc.html
>     - bat-rpls-1:         NOTRUN -> [FAIL][10] ([i915#6997])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8868/bat-rpls-1/igt@i915_selftest@live@slpc.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-fast:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][11] ([fdo#109271]) +16 similar issues
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8868/fi-kbl-soraka/igt@kms_chamelium_frames@hdmi-crc-fast.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - bat-rpls-2:         NOTRUN -> [SKIP][12] ([i915#7828])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8868/bat-rpls-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>     - bat-dg2-11:         NOTRUN -> [SKIP][13] ([i915#1845] / [i915#5354]) +1 similar issue
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8868/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> 
>   * igt@kms_pipe_crc_basic@read-crc:
>     - bat-adlp-9:         NOTRUN -> [SKIP][14] ([i915#3546]) +1 similar issue
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8868/bat-adlp-9/igt@kms_pipe_crc_basic@read-crc.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - bat-rpls-2:         NOTRUN -> [SKIP][15] ([i915#1845])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8868/bat-rpls-2/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@requests:
>     - bat-rpls-2:         [ABORT][16] ([i915#7913]) -> [PASS][17]
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13063/bat-rpls-2/igt@i915_selftest@live@requests.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8868/bat-rpls-2/igt@i915_selftest@live@requests.html
> 
>   * igt@i915_selftest@live@reset:
>     - bat-rpls-1:         [ABORT][18] ([i915#8384]) -> [PASS][19]
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13063/bat-rpls-1/igt@i915_selftest@live@reset.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8868/bat-rpls-1/igt@i915_selftest@live@reset.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-3:
>     - bat-dg2-9:          [FAIL][20] ([fdo#103375]) -> [PASS][21] +2 similar issues
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13063/bat-dg2-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-3.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8868/bat-dg2-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-3.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-3:
>     - bat-dg2-9:          [FAIL][22] ([fdo#103375] / [i915#7932]) -> [PASS][23]
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13063/bat-dg2-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-3.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8868/bat-dg2-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-3.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - fi-tgl-1115g4:      [INCOMPLETE][24] ([i915#8102]) -> [INCOMPLETE][25] ([i915#7443] / [i915#8102])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13063/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8868/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#3595]: https://gitlab.freedesktop.org/drm/intel/issues/3595
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
>   [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
>   [i915#7443]: https://gitlab.freedesktop.org/drm/intel/issues/7443
>   [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
>   [i915#7810]: https://gitlab.freedesktop.org/drm/intel/issues/7810
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
>   [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
>   [i915#8102]: https://gitlab.freedesktop.org/drm/intel/issues/8102
>   [i915#8346]: https://gitlab.freedesktop.org/drm/intel/issues/8346
>   [i915#8368]: https://gitlab.freedesktop.org/drm/intel/issues/8368
>   [i915#8383]: https://gitlab.freedesktop.org/drm/intel/issues/8383
>   [i915#8384]: https://gitlab.freedesktop.org/drm/intel/issues/8384
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7271 -> IGTPW_8868
> 
>   CI-20190529: 20190529
>   CI_DRM_13063: d56dad364b19dce932190540edc2f30000c92760 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_8868: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8868/index.html
>   IGT_7271: d12d7eb92226e14745a80e6bdd95384913a43548 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
> Testlist changes
> ----------------
> 
> +igt@kms_plane_scaling@i915-max-src-size
> -igt@kms_plane_scaling@intel-max-src-size
> -igt@xe_gpgpu_fill@basic
> -igt@xe_intel_bb@add-remove-objects
> -igt@xe_intel_bb@bb-with-allocator
> -igt@xe_intel_bb@blit-reloc
> -igt@xe_intel_bb@blit-simple
> -igt@xe_intel_bb@create-in-region
> -igt@xe_intel_bb@delta-check
> -igt@xe_intel_bb@destroy-bb
> -igt@xe_intel_bb@full-batch
> -igt@xe_intel_bb@intel-bb-blit-none
> -igt@xe_intel_bb@intel-bb-blit-x
> -igt@xe_intel_bb@intel-bb-blit-y
> -igt@xe_intel_bb@lot-of-buffers
> -igt@xe_intel_bb@offset-control
> -igt@xe_intel_bb@purge-bb
> -igt@xe_intel_bb@render
> -igt@xe_intel_bb@reset-bb
> -igt@xe_intel_bb@simple-bb
> -igt@xe_intel_bb@simple-bb-ctx
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8868/index.html
