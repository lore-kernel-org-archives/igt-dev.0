Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC6810E00C
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Oct 2022 15:00:04 +0000 (UTC)
Message-ID: <fb7a8bd8-6996-011e-281f-c3d4ee4bf445@intel.com>
Date: Mon, 31 Oct 2022 15:00:00 +0000
MIME-Version: 1.0
Content-Language: en-GB
To: igt-dev@lists.freedesktop.org,
 "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
References: <20221031121730.32056-1-matthew.auld@intel.com>
 <166722818072.2019.10629308295456666949@emeril.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <166722818072.2019.10629308295456666949@emeril.freedesktop.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/query=3A_use_48B=5FADDRESS_in_upload?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 31/10/2022 14:56, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/i915/query: use 48B_ADDRESS in upload
> *URL:*	https://patchwork.freedesktop.org/series/110319/ 
> <https://patchwork.freedesktop.org/series/110319/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_12324 -> IGTPW_8015
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_8015 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_8015, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/index.html
> 
> 
>     Participating hosts (41 -> 40)
> 
> Missing (1): fi-rkl-11600
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_8015:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:
>       o fi-cml-u2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12324/fi-cml-u2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/fi-cml-u2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1.html>
> 
> 

For sure looks unrelated.


>     Known issues
> 
> Here are the changes found in IGTPW_8015 that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@i915_selftest@live@hangcheck:
> 
>       o fi-hsw-4770: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12324/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html> (i915#4785 <https://gitlab.freedesktop.org/drm/intel/issues/4785>)
>   *
> 
>     igt@runner@aborted:
> 
>       o fi-hsw-4770: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/fi-hsw-4770/igt@runner@aborted.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312> / i915#5594 <https://gitlab.freedesktop.org/drm/intel/issues/5594>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@fbdev@read:
> 
>       o {bat-rpls-2}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12324/bat-rpls-2/igt@fbdev@read.html> (i915#2582 <https://gitlab.freedesktop.org/drm/intel/issues/2582>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/bat-rpls-2/igt@fbdev@read.html> +4 similar issues
>   *
> 
>     igt@gem_exec_suspend@basic-s0@smem:
> 
>       o {bat-adlm-1}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12324/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html> (i915#2867 <https://gitlab.freedesktop.org/drm/intel/issues/2867>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html> +1 similar issue
>   *
> 
>     igt@gem_exec_suspend@basic-s3@smem:
> 
>       o {bat-rpls-1}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12324/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html> (i915#6687 <https://gitlab.freedesktop.org/drm/intel/issues/6687>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html>
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7031 -> IGTPW_8015
> 
> CI-20190529: 20190529
> CI_DRM_12324: 486919adf4f568444937aae1ff6a1ffee1361a93 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_8015: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8015/index.html
> IGT_7031: 54abd9445f732b55556d4e612d24f50803515904 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
