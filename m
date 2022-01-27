Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8BD10E145
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jan 2022 04:54:27 +0000 (UTC)
Message-ID: <d11a1938-73f4-06bf-5580-68e7be3a1e7f@intel.com>
Date: Thu, 27 Jan 2022 10:24:10 +0530
Content-Language: en-US
References: <20220124112352.1970255-1-bhanuprakash.modem@intel.com>
 <164321881739.25400.12249328138951166761@emeril.freedesktop.org>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <164321881739.25400.12249328138951166761@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgTmV3IHN1?=
 =?utf-8?q?btests_for_deep_color_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, lakshminarayana.vudum@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi,

On Wed-26-01-2022 11:10 pm, Patchwork wrote:
> *Patch Details*
> *Series:*	New subtests for deep color (rev4)
> *URL:*	https://patchwork.freedesktop.org/series/99239/ 
> <https://patchwork.freedesktop.org/series/99239/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6582/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6582/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_11145 -> IGTPW_6582
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_6582 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_6582, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6582/index.html
> 
> 
>     Participating hosts (46 -> 43)
> 
> Additional (2): fi-icl-u2 fi-pnv-d510
> Missing (5): fi-bdw-5557u fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 
> fi-bdw-samus
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_6582:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@i915_selftest@live@hugepages:
> 
>       o bat-dg1-5: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11145/bat-dg1-5/igt@i915_selftest@live@hugepages.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6582/bat-dg1-5/igt@i915_selftest@live@hugepages.html>
>   *
> 
>     {igt@kms_color@pipe-a-deep-color} (NEW):
> 
>       o
> 
>         bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6582/bat-dg1-6/igt@kms_color@pipe-a-deep-color.html>
>         +3 similar issues
> 
>       o
> 
>         {bat-jsl-2}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6582/bat-jsl-2/igt@kms_color@pipe-a-deep-color.html>
>         +3 similar issues
> 
>       o
> 
>         {bat-jsl-1}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6582/bat-jsl-1/igt@kms_color@pipe-a-deep-color.html>
>         +3 similar issues

As this test is looking for valid connector which is deep color capable, 
these SKIPS are expected.

Can you please re-report this false positive?

- Bhanu

