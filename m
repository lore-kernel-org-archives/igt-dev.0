Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF3F6E1E0
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jul 2020 10:08:18 +0000 (UTC)
Date: Wed, 8 Jul 2020 13:08:11 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20200708100811.GA29214@ideak-desk.fi.intel.com>
References: <20200707131814.17540-1-imre.deak@intel.com>
 <159412930654.7661.13405204772458835437@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159412930654.7661.13405204772458835437@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=5D__lib/igt=5Fchamelium=3A_Saniti?=
 =?utf-8?q?ze_the_init_error_and_deinit_path?=
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
To: igt-dev@lists.freedesktop.org, Kunal Joshi <kunal1.joshi@intel.com>, Lyude Paul <lyude@redhat.com>, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jul 07, 2020 at 01:41:46PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,1/3] lib/igt_chamelium: Sanitize the init error and deinit path
> URL   : https://patchwork.freedesktop.org/series/79192/
> State : success

Patchset is pushed, thanks for the reviews.

The full test results had the following:

>   * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
>     - shard-glk:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

but it's unrelated, since no chamelium tests were running on this
machine.

> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8709 -> IGTPW_4744
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/index.html
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_4744 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_render_linear_blits@basic:
>     - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([i915#402]) +1 similar issue
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/fi-tgl-y/igt@gem_render_linear_blits@basic.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/fi-tgl-y/igt@gem_render_linear_blits@basic.html
> 
>   * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
>     - fi-tgl-u2:          [PASS][3] -> [DMESG-WARN][4] ([i915#402])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/fi-tgl-u2/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/fi-tgl-u2/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_flink_basic@double-flink:
>     - fi-tgl-y:           [DMESG-WARN][5] ([i915#402]) -> [PASS][6] +1 similar issue
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/fi-tgl-y/igt@gem_flink_basic@double-flink.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/fi-tgl-y/igt@gem_flink_basic@double-flink.html
> 
>   * igt@i915_pm_rpm@module-reload:
>     - fi-glk-dsi:         [DMESG-WARN][7] ([i915#1982]) -> [PASS][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/fi-glk-dsi/igt@i915_pm_rpm@module-reload.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/fi-glk-dsi/igt@i915_pm_rpm@module-reload.html
> 
>   * igt@i915_selftest@live@gt_lrc:
>     - fi-tgl-u2:          [DMESG-FAIL][9] ([i915#1233]) -> [PASS][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/fi-tgl-u2/igt@i915_selftest@live@gt_lrc.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/fi-tgl-u2/igt@i915_selftest@live@gt_lrc.html
> 
>   * igt@kms_busy@basic@flip:
>     - fi-kbl-x1275:       [DMESG-WARN][11] ([i915#62] / [i915#92] / [i915#95]) -> [PASS][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/fi-kbl-x1275/igt@kms_busy@basic@flip.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/fi-kbl-x1275/igt@kms_busy@basic@flip.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - {fi-kbl-7560u}:     [DMESG-WARN][13] ([i915#1982]) -> [PASS][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/fi-kbl-7560u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/fi-kbl-7560u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_flip@basic-plain-flip@a-dp1:
>     - fi-kbl-x1275:       [DMESG-WARN][15] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][16] ([i915#62] / [i915#92]) +1 similar issue
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/fi-kbl-x1275/igt@kms_flip@basic-plain-flip@a-dp1.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/fi-kbl-x1275/igt@kms_flip@basic-plain-flip@a-dp1.html
> 
>   * igt@kms_force_connector_basic@force-edid:
>     - fi-kbl-x1275:       [DMESG-WARN][17] ([i915#62] / [i915#92]) -> [DMESG-WARN][18] ([i915#62] / [i915#92] / [i915#95]) +4 similar issues
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
>   [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
>   [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
>   [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
> 
> 
> Participating hosts (42 -> 36)
> ------------------------------
> 
>   Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5726 -> IGTPW_4744
> 
>   CI-20190529: 20190529
>   CI_DRM_8709: b04f40402fb90e1be9f683434a9821a656be0952 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_4744: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/index.html
>   IGT_5726: 5da80efbc7a2d5bd7b30c0f9eb4b5d001c99b558 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
