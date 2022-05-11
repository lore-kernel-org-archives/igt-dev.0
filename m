Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A482210EF84
 for <igt-dev@lists.freedesktop.org>; Wed, 11 May 2022 04:31:06 +0000 (UTC)
Message-ID: <3aea40fc-b252-8724-7ea1-632b3dfa9fb3@intel.com>
Date: Wed, 11 May 2022 10:00:54 +0530
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>, <lakshminarayana.vudum@intel.com>
References: <20220510080203.3319182-1-bhanuprakash.modem@intel.com>
 <165223803269.2700.4009194685344894298@emeril.freedesktop.org>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <165223803269.2700.4009194685344894298@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQ29udmVy?=
 =?utf-8?q?t_subtests_to_dynamic_=28rev5=29?=
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

On Wed-11-05-2022 08:30 am, Patchwork wrote:
> *Patch Details*
> *Series:*	Convert subtests to dynamic (rev5)
> *URL:*	https://patchwork.freedesktop.org/series/103734/ 
> <https://patchwork.freedesktop.org/series/103734/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_11631 -> IGTPW_7076
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_7076 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7076, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/index.html
> 
> 
>     Participating hosts (43 -> 39)
> 
> Additional (2): fi-kbl-soraka fi-rkl-11600
> Missing (6): fi-bdw-5557u bat-dg1-5 fi-bsw-cyan bat-dg2-9 fi-ctg-p8600 
> fi-kbl-x1275
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_7076:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     {igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c} (NEW):
> 
>       o {bat-dg2-8}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/bat-dg2-8/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c.html>
>         +13 similar issues

These skips are expected on No-display setups.

>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o fi-kbl-soraka: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/fi-kbl-soraka/igt@kms_setmode@basic-clone-single-crtc.html>

These failures are not related to this patch series.

Please help to re-run.

- Bhanu
