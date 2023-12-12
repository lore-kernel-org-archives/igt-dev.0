Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <92c96290-783f-4ae0-9e72-855dac5bfbf4@linux.intel.com>
Date: Tue, 12 Dec 2023 13:35:59 +0100
MIME-Version: 1.0
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_benchmarks/g?=
 =?UTF-8?Q?em=5Fwsim=3A_Support_gens_without_relocations?=
Content-Language: en-US
To: igt-dev@lists.freedesktop.org
References: <20231212113449.26800-1-marcin.bernatowicz@linux.intel.com>
 <170238395645.31292.14094627134646999086@emeril.freedesktop.org>
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <170238395645.31292.14094627134646999086@emeril.freedesktop.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

this is unrelated to benchmark change,

Regards,
marcin

On 12/12/2023 1:25 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	benchmarks/gem_wsim: Support gens without relocations
> *URL:*	https://patchwork.freedesktop.org/series/127677/ 
> <https://patchwork.freedesktop.org/series/127677/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10403/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10403/index.html>
> 
> 
>   CI Bug Log - changes from IGT_7636 -> IGTPW_10403
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_10403 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_10403, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10403/index.html
> 
> 
>     Participating hosts (36 -> 34)
> 
> Additional (1): bat-kbl-2
> Missing (3): fi-skl-guc fi-snb-2520m fi-pnv-d510
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_10403:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
> 
>       o bat-adlp-11: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7636/bat-adlp-11/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10403/bat-adlp-11/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html> +5 other tests skip
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc:
> 
>       o bat-adlp-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10403/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc.html> +8 other tests skip
> 
> 
>         Warnings
> 
>   * igt@kms_dsc@dsc-basic:
>       o bat-adlp-11: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7636/bat-adlp-11/igt@kms_dsc@dsc-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/intel/issues/3840>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10403/bat-adlp-11/igt@kms_dsc@dsc-basic.html>
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_10403 that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@fbdev@info:
> 
>       o
> 
>         bat-adlp-11: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7636/bat-adlp-11/igt@fbdev@info.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10403/bat-adlp-11/igt@fbdev@info.html> (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849> / i915#2582 <https://gitlab.freedesktop.org/drm/intel/issues/2582>)
> 
>       o
> 
>         bat-kbl-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10403/bat-kbl-2/igt@fbdev@info.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849>)
> 
>   *
> 
>     igt@fbdev@nullptr:
> 
>       o bat-adlp-11: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7636/bat-adlp-11/igt@fbdev@nullptr.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10403/bat-adlp-11/igt@fbdev@nullptr.html> (i915#2582 <https://gitlab.freedesktop.org/drm/intel/issues/2582>) +3 other tests skip
>   *
> 
>     igt@gem_lmem_swapping@parallel-random-engines:
> 
>       o bat-kbl-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10403/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +36 other tests skip
>   *
> 
>     igt@gem_lmem_swapping@verify-random:
> 
>       o bat-adlp-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10403/bat-adlp-11/igt@gem_lmem_swapping@verify-random.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3 other tests skip
>   *
> 
>     igt@i915_pm_rps@basic-api:
> 
>       o bat-adlp-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10403/bat-adlp-11/igt@i915_pm_rps@basic-api.html> (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
>   *
> 
>     igt@kms_flip@basic-flip-vs-dpms:
> 
>       o bat-adlp-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10403/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms.html> (i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@basic:
> 
>       o bat-adlp-11: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7636/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10403/bat-adlp-11/igt@kms_frontbuffer_tracking@basic.html> (i915#4342 <https://gitlab.freedesktop.org/drm/intel/issues/4342> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>)
>   *
> 
>     igt@kms_pm_backlight@basic-brightness@edp-1:
> 
>       o bat-rplp-1: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10403/bat-rplp-1/igt@kms_pm_backlight@basic-brightness@edp-1.html> (i915#8668 <https://gitlab.freedesktop.org/drm/intel/issues/8668>)
>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o bat-adlp-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10403/bat-adlp-11/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>   *
> 
>     igt@prime_vgem@basic-fence-flip:
> 
>       o bat-adlp-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10403/bat-adlp-11/igt@prime_vgem@basic-fence-flip.html> (fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295> / i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
>   *
> 
>     igt@prime_vgem@basic-fence-read:
> 
>       o bat-adlp-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10403/bat-adlp-11/igt@prime_vgem@basic-fence-read.html> (fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295> / i915#3291 <https://gitlab.freedesktop.org/drm/intel/issues/3291> / i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +2 other tests skip
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_exec_suspend@basic-s0@lmem0:
> 
>       o bat-dg2-9: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7636/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html> (i915#9275 <https://gitlab.freedesktop.org/drm/intel/issues/9275>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10403/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html>
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
> 
>       o bat-rplp-1: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7636/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html> (i915#8668 <https://gitlab.freedesktop.org/drm/intel/issues/8668>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10403/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html>
>   *
> 
>     igt@kms_pm_rpm@basic-pci-d3-state:
> 
>       o bat-adlp-11: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7636/bat-adlp-11/igt@kms_pm_rpm@basic-pci-d3-state.html> (i915#8668 <https://gitlab.freedesktop.org/drm/intel/issues/8668>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10403/bat-adlp-11/igt@kms_pm_rpm@basic-pci-d3-state.html>
> 
> 
>         Warnings
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>       o bat-adlp-11: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7636/bat-adlp-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103> / i915#5608 <https://gitlab.freedesktop.org/drm/intel/issues/5608>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10403/bat-adlp-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#5608 <https://gitlab.freedesktop.org/drm/intel/issues/5608>) +1 other test skip
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7636 -> IGTPW_10403
> 
> CI-20190529: 20190529
> CI_DRM_14010: b4182ec1538e8cebf630083ec4296bed0061d594 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_10403: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10403/index.html
> IGT_7636: 7636
> 
