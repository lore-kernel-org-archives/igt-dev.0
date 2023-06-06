Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4C210E379
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jun 2023 16:22:55 +0000 (UTC)
Date: Tue, 6 Jun 2023 18:18:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230606161858.th7vmuboco66muj2@kamilkon-desk1>
References: <20230605154710.460104-1-swati2.sharma@intel.com>
 <168598721307.24737.11452579419606985955@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <168598721307.24737.11452579419606985955@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogIGZhaWx1cmUgZm9yIGxpYjog?=
 =?utf-8?q?fix_typo_in_clamp16=28=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 RavitejaX Veesam <ravitejax.veesam@intel.com>,
 SanjuX Marikkar <sanjux.marikkar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

below change is not related to change in kms lib lib/igt_fb.c,
could you supress them and respin tests ?

Regards,
Kamil

On 2023-06-05 at 17:46:53 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib: fix typo in clamp16()
> URL   : https://patchwork.freedesktop.org/series/118876/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13231 -> IGTPW_9104
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9104 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9104, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/index.html
> 
> Participating hosts (38 -> 36)
> ------------------------------
> 
>   Missing    (2): fi-kbl-soraka fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9104:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@dmabuf@all-tests@sanitycheck:
>     - fi-blb-e6850:       NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/fi-blb-e6850/igt@dmabuf@all-tests@sanitycheck.html
> 
>   * igt@i915_selftest@live@active:
>     - bat-dg1-5:          [PASS][2] -> [DMESG-FAIL][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13231/bat-dg1-5/igt@i915_selftest@live@active.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/bat-dg1-5/igt@i915_selftest@live@active.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9104 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@dmabuf@all-tests@dma_fence:
>     - fi-blb-e6850:       NOTRUN -> [DMESG-FAIL][4] ([i915#8189])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/fi-blb-e6850/igt@dmabuf@all-tests@dma_fence.html
> 
>   * igt@i915_pm_rpm@module-reload:
>     - fi-blb-e6850:       NOTRUN -> [SKIP][5] ([fdo#109271]) +36 similar issues
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html
> 
>   * igt@i915_selftest@live@mman:
>     - bat-rpls-2:         [PASS][6] -> [TIMEOUT][7] ([i915#6794] / [i915#7392])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13231/bat-rpls-2/igt@i915_selftest@live@mman.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/bat-rpls-2/igt@i915_selftest@live@mman.html
> 
>   * igt@i915_suspend@basic-s2idle-without-i915:
>     - bat-rpls-2:         NOTRUN -> [ABORT][8] ([i915#6687])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/bat-rpls-2/igt@i915_suspend@basic-s2idle-without-i915.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - bat-adls-5:         NOTRUN -> [SKIP][9] ([i915#7828])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/bat-adls-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>     - bat-adlp-9:         NOTRUN -> [SKIP][10] ([i915#3546]) +2 similar issues
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/bat-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - bat-adls-5:         NOTRUN -> [SKIP][11] ([i915#1845])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/bat-adls-5/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - fi-blb-e6850:       NOTRUN -> [SKIP][12] ([fdo#109271] / [i915#4579])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/fi-blb-e6850/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - bat-adls-5:         [ABORT][13] -> [PASS][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13231/bat-adls-5/igt@i915_suspend@basic-s3-without-i915.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/bat-adls-5/igt@i915_suspend@basic-s3-without-i915.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1:
>     - bat-adlp-6:         [ABORT][15] -> [ABORT][16] ([i915#8434])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13231/bat-adlp-6/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/bat-adlp-6/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
>   [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
>   [i915#6794]: https://gitlab.freedesktop.org/drm/intel/issues/6794
>   [i915#7392]: https://gitlab.freedesktop.org/drm/intel/issues/7392
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#8189]: https://gitlab.freedesktop.org/drm/intel/issues/8189
>   [i915#8434]: https://gitlab.freedesktop.org/drm/intel/issues/8434
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7319 -> IGTPW_9104
> 
>   CI-20190529: 20190529
>   CI_DRM_13231: 60f1f7c0a570a431f8ca8cc697f7fe8bc0badb83 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9104: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/index.html
>   IGT_7319: 2e1bcd49944452b5f9516eecee48e1fa3ae6a636 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9104/index.html
