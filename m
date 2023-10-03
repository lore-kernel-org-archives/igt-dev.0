Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 03 Oct 2023 14:07:39 +0200
Message-ID: <2298859.ElGaqSPkdT@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <169632954821.4383.8893621095534790285@emeril.freedesktop.org>
References: <20231003091044.407965-11-janusz.krzysztofik@linux.intel.com>
 <169632954821.4383.8893621095534790285@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev]
 =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Kunit_fi?=
 =?utf-8?q?xes_and_improvements?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tuesday, 3 October 2023 12:39:08 CEST Patchwork wrote:
> == Series Details ==
> 
> Series: Kunit fixes and improvements
> URL   : https://patchwork.freedesktop.org/series/124554/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7508_BAT -> XEIGTPW_9910_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_9910_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_9910_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_9910_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_live_ktest@bo:
>     - bat-dg2-oem2:       [PASS][1] -> [SKIP][2] +2 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7508/bat-dg2-oem2/igt@xe_live_ktest@bo.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9910/bat-dg2-oem2/igt@xe_live_ktest@bo.html

These IGT side changes require kunit on the kernel side to be built as a 
module, while CI Xe specific kconfig makes it built into the kernel.  I've 
asked CI support what we should do to fix that.

Thanks,
Janusz

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_9910_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>     - bat-dg2-oem2:       [FAIL][3] ([Intel XE#480]) -> [PASS][4] +1 other test pass
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7508/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9910/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
> 
>   * {igt@xe_create@create-execqueues-noleak}:
>     - bat-adlp-7:         [FAIL][5] ([Intel XE#524]) -> [PASS][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7508/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9910/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
>   [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7508 -> IGTPW_9910
>   * Linux: xe-404-22fcf2404f56a8e7aea6734298e0b2b265136313 -> xe-410-02ab43e36623665d8644d46162bd4ec5eeb68489
> 
>   IGTPW_9910: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9910/index.html
>   IGT_7508: f366406b05ca6b3d16eaa734a91e0833bd159f54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-404-22fcf2404f56a8e7aea6734298e0b2b265136313: 22fcf2404f56a8e7aea6734298e0b2b265136313
>   xe-410-02ab43e36623665d8644d46162bd4ec5eeb68489: 02ab43e36623665d8644d46162bd4ec5eeb68489
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9910/index.html
> 



