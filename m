Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADE210E0E1
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 18:48:48 +0000 (UTC)
Date: Mon, 27 Mar 2023 20:48:44 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org,
 SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>
Message-ID: <20230327184844.ovjrf4dzn5ryzqhm@zkempczy-mobl2>
References: <20230327154359.91250-1-zbigniew.kempczynski@intel.com>
 <167994163856.32632.5442166340994911896@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <167994163856.32632.5442166340994911896@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2dw?=
 =?utf-8?q?gpu=5Ffill=3A_Implement_gpgpu=5Ffillfunc_for_XEPH?=
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

On Mon, Mar 27, 2023 at 06:27:18PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/gpgpu_fill: Implement gpgpu_fillfunc for XEPH              
>    URL:     https://patchwork.freedesktop.org/series/115672/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8688/index.html 
> 
>               CI Bug Log - changes from CI_DRM_12921 -> IGTPW_8688
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_8688 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_8688, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8688/index.html
> 
> Participating hosts (37 -> 36)
> 
>    Missing (1): fi-kbl-soraka
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_8688:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dp-1:
>           * bat-dg2-8: PASS -> FAIL

Unrelated to the change. May I ask for run shards for it?

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_8688 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@i915_selftest@live@execlists:
> 
>           * fi-bsw-n3050: PASS -> ABORT (i915#7911 / i915#7913)
>      * igt@i915_selftest@live@slpc:
> 
>           * bat-rpls-2: NOTRUN -> DMESG-FAIL (i915#6997 / i915#7913)
>      * igt@kms_chamelium_hpd@common-hpd-after-suspend:
> 
>           * bat-rpls-2: NOTRUN -> SKIP (i915#7828)
> 
>           * bat-rpls-1: NOTRUN -> SKIP (i915#7828)
> 
>      * igt@kms_pipe_crc_basic@suspend-read-crc:
> 
>           * bat-rpls-1: NOTRUN -> SKIP (i915#1845)
> 
>           * bat-rpls-2: NOTRUN -> SKIP (i915#1845)
> 
>      * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-3:
> 
>           * bat-dg2-11: PASS -> INCOMPLETE (i915#1982 / i915#7908)
> 
>     Possible fixes
> 
>      * igt@gem_exec_suspend@basic-s3@smem:
> 
>           * bat-rpls-1: ABORT (i915#6687 / i915#7978) -> PASS
>      * igt@i915_selftest@live@reset:
> 
>           * bat-rpls-2: ABORT (i915#4983 / i915#7913) -> PASS
> 
>     Warnings
> 
>      * igt@i915_selftest@live@slpc:
>           * bat-rpls-1: DMESG-FAIL (i915#6367) -> DMESG-FAIL (i915#6367 /
>             i915#7996)
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7221 -> IGTPW_8688
> 
>    CI-20190529: 20190529
>    CI_DRM_12921: 3de6040ce9900a94ec626662d5c6a227b37eeb1c @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_8688: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8688/index.html
>    IGT_7221: 4b77c6d85024d22ca521d510f8eee574128fe04f @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
