Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB7F1120F8
 for <igt-dev@lists.freedesktop.org>; Tue, 17 May 2022 13:47:15 +0000 (UTC)
Message-ID: <1193d67a-13d7-b258-1526-0c6a1720440d@intel.com>
Date: Tue, 17 May 2022 19:16:56 +0530
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>, <lakshminarayana.vudum@intel.com>
References: <20220517120245.3521494-1-bhanuprakash.modem@intel.com>
 <165279476110.31033.10996524083031429017@emeril.freedesktop.org>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <165279476110.31033.10996524083031429017@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=3A_IGT_test_cleanup_=28rev3=29?=
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

On Tue-17-05-2022 07:09 pm, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/kms: IGT test cleanup (rev3)
> *URL:*	https://patchwork.freedesktop.org/series/104029/ 
> <https://patchwork.freedesktop.org/series/104029/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_11664 -> IGTPW_7120
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_7120 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7120, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/index.html
> 
> 
>     Participating hosts (41 -> 42)
> 
> Additional (1): bat-dg2-8
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_7120:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a2:
> 
>       o fi-skl-guc: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11664/fi-skl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a2.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-skl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a2.html>
>         +3 similar issues

These failures are not related to this patch series.

>   *
> 
>     {igt@kms_pipe_crc_basic@hang-read-crc} (NEW):
> 
>       o bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/bat-dg1-5/igt@kms_pipe_crc_basic@hang-read-crc.html>
>         +1 similar issue

As we introduced dynamic subtests, these Skips are expected on "No 
display" configs.

Can you please re-report this false positive?

- Bhanu
> 
> 
