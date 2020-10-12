Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73F56E5B0
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Oct 2020 19:57:37 +0000 (UTC)
Date: Mon, 12 Oct 2020 22:57:31 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20201012195731.GB2349678@ideak-desk.fi.intel.com>
References: <20201012175654.2422295-1-imre.deak@intel.com>
 <160252784113.31908.6134220359376064220@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160252784113.31908.6134220359376064220@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fdp=5Faux=5Fdev=3A_Handle_AUX_failures_on_disconnected_MST?=
 =?utf-8?q?_connectors?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi,

On Mon, Oct 12, 2020 at 06:37:21PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_dp_aux_dev: Handle AUX failures on disconnected MST connectors
> URL   : https://patchwork.freedesktop.org/series/82591/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_9130 -> IGTPW_5060
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_5060 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_5060, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5060/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_5060:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@blt:
>     - fi-snb-2520m:       [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9130/fi-snb-2520m/igt@i915_selftest@live@blt.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5060/fi-snb-2520m/igt@i915_selftest@live@blt.html

An unrelated issue on a non-MST platform, and without any DP monitor
attached or the test that this patch changes having been run.

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_5060 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_module_load@reload:
>     - fi-tgl-u2:          [PASS][3] -> [DMESG-WARN][4] ([i915#1982] / [k.org#205379])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9130/fi-tgl-u2/igt@i915_module_load@reload.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5060/fi-tgl-u2/igt@i915_module_load@reload.html
> 
>   * igt@kms_chamelium@hdmi-crc-fast:
>     - fi-kbl-7500u:       [PASS][5] -> [DMESG-WARN][6] ([i915#2203])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9130/fi-kbl-7500u/igt@kms_chamelium@hdmi-crc-fast.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5060/fi-kbl-7500u/igt@kms_chamelium@hdmi-crc-fast.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - fi-bsw-kefka:       [PASS][7] -> [DMESG-WARN][8] ([i915#1982])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9130/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5060/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
>     - fi-icl-u2:          [PASS][9] -> [DMESG-WARN][10] ([i915#1982])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9130/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5060/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
> 
>   * igt@vgem_basic@unload:
>     - fi-skl-guc:         [PASS][11] -> [DMESG-WARN][12] ([i915#2203])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9130/fi-skl-guc/igt@vgem_basic@unload.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5060/fi-skl-guc/igt@vgem_basic@unload.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@debugfs_test@read_all_entries:
>     - {fi-kbl-7560u}:     [INCOMPLETE][13] ([i915#2417]) -> [PASS][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9130/fi-kbl-7560u/igt@debugfs_test@read_all_entries.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5060/fi-kbl-7560u/igt@debugfs_test@read_all_entries.html
> 
>   * igt@gem_exec_suspend@basic-s0:
>     - fi-tgl-u2:          [FAIL][15] ([i915#1888]) -> [PASS][16]
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9130/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5060/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html
> 
>   * igt@i915_selftest@live@coherency:
>     - fi-gdg-551:         [DMESG-FAIL][17] ([i915#1748]) -> [PASS][18]
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9130/fi-gdg-551/igt@i915_selftest@live@coherency.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5060/fi-gdg-551/igt@i915_selftest@live@coherency.html
> 
>   * igt@kms_flip@basic-flip-vs-dpms@a-dsi1:
>     - {fi-tgl-dsi}:       [DMESG-WARN][19] ([i915#1982]) -> [PASS][20] +1 similar issue
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9130/fi-tgl-dsi/igt@kms_flip@basic-flip-vs-dpms@a-dsi1.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5060/fi-tgl-dsi/igt@kms_flip@basic-flip-vs-dpms@a-dsi1.html
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
>     - fi-icl-u2:          [DMESG-WARN][21] ([i915#1982]) -> [PASS][22] +1 similar issue
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9130/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5060/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#1748]: https://gitlab.freedesktop.org/drm/intel/issues/1748
>   [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2203]: https://gitlab.freedesktop.org/drm/intel/issues/2203
>   [i915#2417]: https://gitlab.freedesktop.org/drm/intel/issues/2417
>   [k.org#205379]: https://bugzilla.kernel.org/show_bug.cgi?id=205379
> 
> 
> Participating hosts (45 -> 41)
> ------------------------------
> 
>   Additional (3): fi-kbl-soraka fi-tgl-y fi-kbl-r 
>   Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5810 -> IGTPW_5060
> 
>   CI-20190529: 20190529
>   CI_DRM_9130: da13fb4f671901dbcf26437592f352579cc3b617 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_5060: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5060/index.html
>   IGT_5810: f78ce760920efb5015725c749f411c5724114bda @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5060/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
