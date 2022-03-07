Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCE210E99F
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Mar 2022 04:52:07 +0000 (UTC)
Message-ID: <d2757457-c135-26fa-75d8-f1fa8258becd@intel.com>
Date: Mon, 7 Mar 2022 10:21:51 +0530
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>, <lakshminarayana.vudum@intel.com>
References: <20220301164330.156289-1-bhanuprakash.modem@intel.com>
 <164645108017.21681.5420223495832452688@emeril.freedesktop.org>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <164645108017.21681.5420223495832452688@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fsetmode=3A_Fix_stealing_test_=28rev2=29?=
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

Hi Lakshmi,

On Sat-05-03-2022 09:01 am, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/kms_setmode: Fix stealing test (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/100893/ 
> <https://patchwork.freedesktop.org/series/100893/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_11330 -> IGTPW_6741
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_6741 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_6741, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/index.html
> 
> 
>     Participating hosts (48 -> 34)
> 
> Additional (1): fi-glk-dsi
> Missing (15): fi-kbl-soraka fi-bdw-samus shard-tglu bat-dg1-6 bat-dg1-5 
> shard-rkl fi-icl-u2 bat-dg2-9 bat-adlp-6 fi-bsw-cyan fi-pnv-d510 
> bat-rpls-2 shard-dg1 bat-jsl-2 bat-jsl-1
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_6741:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>       o fi-rkl-guc: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11330/fi-rkl-guc/igt@kms_setmode@basic-clone-single-crtc.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6741/fi-rkl-guc/igt@kms_setmode@basic-clone-single-crtc.html>

Due to the introduction of dynamic subtests by Patch[1/3] in this 
series, these Skips are expected. Please help to re-report.

- Bhanu
