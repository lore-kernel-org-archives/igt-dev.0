Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D225510E699
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 13:46:04 +0000 (UTC)
Date: Fri, 25 Aug 2023 15:45:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230825134559.6iawulojedbvwq4v@kamilkon-desk.igk.intel.com>
References: <20230825054659.1320824-1-riana.tauro@intel.com>
 <169295109659.10952.11540105153178647195@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <169295109659.10952.11540105153178647195@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Toggle_G?=
 =?utf-8?q?T_C_States_and_validate_power_=28rev2=29?=
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

On 2023-08-25 at 08:11:36 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Toggle GT C States and validate power (rev2)
> URL   : https://patchwork.freedesktop.org/series/122552/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7452_BAT -> XEIGTPW_9656_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_9656_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_9656_BAT, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_9656_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] +1 similar issue
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7452/bat-adlp-7/igt@kms_pipe_crc_basic@suspend-read-crc.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9656/bat-adlp-7/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 

This is unrelated to chenge in igt_power and a test,
please supress and respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_9656_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
>     - bat-adlp-7:         [PASS][3] -> [FAIL][4] ([Intel XE#400]) +1 similar issue
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7452/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9656/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
> 
>   * igt@xe_exec_threads@threads-mixed-fd-basic:
>     - bat-dg2-oem2:       [PASS][5] -> [TIMEOUT][6] ([Intel XE#280] / [Intel XE#474])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7452/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9656/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_force_connector_basic@force-connector-state:
>     - bat-atsm-2:         [SKIP][7] ([Intel XE#277]) -> [SKIP][8] ([Intel XE#277] / [Intel XE#540]) +2 similar issues
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7452/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9656/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#277]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/277
>   [Intel XE#280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/280
>   [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
>   [Intel XE#474]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/474
>   [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
>   [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7452 -> IGTPW_9656
> 
>   IGTPW_9656: 9656
>   IGT_7452: 7452
>   xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5: c77796cf84361b4716839141f2e48de2bf7f4bd5
> 
> 
