Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C058910E15C
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Oct 2023 16:58:55 +0000 (UTC)
Date: Mon, 9 Oct 2023 18:58:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231009165851.okotutzytonxtfel@kamilkon-desk.igk.intel.com>
References: <20231008222306.145122-1-helen.koike@collabora.com>
 <169680709225.31952.9280246750880146348@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <169680709225.31952.9280246750880146348@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/2=5D_lib/drmtest=3A_add_igt=5Fdebug_when_fo?=
 =?utf-8?q?rced_and_dev=5Fname_doesn=27t_match?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Helen Koike <helen.koike@collabora.com>,
 SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 RavitejaX Veesam <ravitejax.veesam@intel.com>,
 SanjuX Marikkar <sanjux.marikkar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

On 2023-10-08 at 23:18:12 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [1/2] lib/drmtest: add igt_debug when forced and dev_name doesn't match
> URL   : https://patchwork.freedesktop.org/series/124788/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13725 -> IGTPW_9947
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9947 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9947, please notify your bug team (lgci.bug.filing@intel.com) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9947/index.html
> 
> Participating hosts (39 -> 18)
> ------------------------------
> 
>   ERROR: It appears as if the changes made in IGTPW_9947 prevented too many machines from booting.
> 
>   Additional (1): fi-hsw-4770 
>   Missing    (22): bat-adls-5 fi-apl-guc fi-snb-2520m fi-pnv-d510 fi-blb-e6850 fi-skl-6600u bat-dg2-8 fi-ilk-650 bat-adln-1 fi-ivb-3770 fi-elk-e7500 fi-bsw-nick fi-kbl-7567u bat-adlp-9 fi-cfl-8700k bat-mtlp-8 bat-jsl-1 fi-tgl-1115g4 fi-kbl-guc fi-kbl-x1275 bat-dg2-14 bat-dg2-13 
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9947 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - fi-hsw-4770:        NOTRUN -> [SKIP][1] ([fdo#109271]) +13 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9947/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>     - bat-dg2-11:         NOTRUN -> [SKIP][2] ([i915#1845]) +2 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9947/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:
>     - fi-hsw-4770:        NOTRUN -> [DMESG-WARN][3] ([i915#8841]) +6 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9947/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html
> 
>   * igt@kms_psr@sprite_plane_onoff:
>     - fi-hsw-4770:        NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#1072]) +3 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9947/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html
> 

These are unrelated,

Regards,
Kamil

>   
> #### Possible fixes ####
> 
>   * igt@i915_module_load@load:
>     - bat-adlp-6:         [DMESG-WARN][5] ([i915#1982] / [i915#8449]) -> [PASS][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13725/bat-adlp-6/igt@i915_module_load@load.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9947/bat-adlp-6/igt@i915_module_load@load.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#8449]: https://gitlab.freedesktop.org/drm/intel/issues/8449
>   [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7519 -> IGTPW_9947
> 
>   CI-20190529: 20190529
>   CI_DRM_13725: fe09b9f4c1435d9ce59b4729994b86a856db852f @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9947: 9947
>   IGT_7519: d1db7333d9c5fbbb05e50b0804123950d9dc1c46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9947/index.html
