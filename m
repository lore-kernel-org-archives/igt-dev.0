Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C6110E2FC
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Mar 2022 14:34:13 +0000 (UTC)
Message-ID: <19549fe2-216c-213b-730f-7220d75729ed@intel.com>
Date: Wed, 2 Mar 2022 16:33:58 +0200
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>, Patchwork
 <patchwork@emeril.freedesktop.org>, =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?=
 <zbigniew.kempczynski@intel.com>
References: <20220302080629.11562-1-zbigniew.kempczynski@intel.com>
 <164621110222.11316.4619549116482056881@emeril.freedesktop.org>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <164621110222.11316.4619549116482056881@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgVXNlIHN1?=
 =?utf-8?q?pported_dma-buf_regions_in_prime=5Fmmap*_=28rev3=29?=
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

If this patch of the kernel 
(https://patchwork.freedesktop.org/series/100737/) is applied along with 
this patch series, the igt@prime_mmap_coherency CI test results will be 
shown as "Success" on dg1.

On 3/2/22 10:51 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	Use supported dma-buf regions in prime_mmap* (rev3)
> *URL:*	https://patchwork.freedesktop.org/series/100819/ 
> <https://patchwork.freedesktop.org/series/100819/>
> *State:*	success
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6728/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6728/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_11308 -> IGTPW_6728
> 
> 
>     Summary
> 
> *SUCCESS*
> 
> No regressions found.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6728/index.html
> 
> 
>     Participating hosts (51 -> 43)
> 
> Additional (1): fi-pnv-d510
> Missing (9): fi-cml-u2 shard-tglu fi-hsw-4200u fi-icl-u2 fi-bsw-cyan 
> fi-ctg-p8600 shard-rkl shard-dg1 fi-bdw-samus
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_6728 that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o fi-pnv-d510: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6728/fi-pnv-d510/igt@gem_huc_copy@huc-copy.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +57
>         similar issues
>   *
> 
>     igt@i915_selftest@live@hangcheck:
> 
>       o fi-bdw-5557u: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6728/fi-bdw-5557u/igt@i915_selftest@live@hangcheck.html>
>         (i915#3921 <https://gitlab.freedesktop.org/drm/intel/issues/3921>)
>   *
> 
>     igt@kms_chamelium@vga-edid-read:
> 
>       o fi-bdw-5557u: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6728/fi-bdw-5557u/igt@kms_chamelium@vga-edid-read.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>         similar issues
>   *
> 
>     igt@kms_psr@cursor_plane_move:
> 
>       o fi-bdw-5557u: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6728/fi-bdw-5557u/igt@kms_psr@cursor_plane_move.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +13
>         similar issues
>   *
> 
>     igt@prime_vgem@basic-userptr:
> 
>       o fi-skl-6600u: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6728/fi-skl-6600u/igt@prime_vgem@basic-userptr.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +18
>         similar issues
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_busy@basic@flip:
> 
>       o {bat-adlp-6}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11308/bat-adlp-6/igt@kms_busy@basic@flip.html>
>         (i915#3576
>         <https://gitlab.freedesktop.org/drm/intel/issues/3576>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6728/bat-adlp-6/igt@kms_busy@basic@flip.html>
>   *
> 
>     igt@kms_psr@primary_page_flip:
> 
>       o fi-skl-6600u: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11308/fi-skl-6600u/igt@kms_psr@primary_page_flip.html>
>         (i915#4547
>         <https://gitlab.freedesktop.org/drm/intel/issues/4547>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6728/fi-skl-6600u/igt@kms_psr@primary_page_flip.html>
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6361 -> IGTPW_6728
> 
> CI-20190529: 20190529
> CI_DRM_11308: e1345b708d76052ef668aaba362ef8ad81ed0b9b @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_6728: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6728/index.html
> IGT_6361: 2372a4beb6a33c5f0799a4a8ccbb93794f52dbca @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
