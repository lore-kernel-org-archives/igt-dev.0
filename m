Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E41B6E9C4
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2020 17:26:59 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Wed, 11 Mar 2020 17:26:55 +0000
Message-ID: <951ff0446086d459dcf1d695feeae7c516e5ca34.camel@intel.com>
References: <20200311004235.138072-1-jose.souza@intel.com>
 <158390487186.13951.5692218179213545289@emeril.freedesktop.org>
In-Reply-To: <158390487186.13951.5692218179213545289@emeril.freedesktop.org>
Content-Language: en-US
Content-ID: <21FABCDA0AD809438254296FCA319197@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_failure_for_s?=
 =?utf-8?q?eries_starting_with_=5Bv2=2C1/4=5D_tests/kms=5Ffrontbuffer=5Ftr?=
 =?utf-8?q?acking=3A_Add_tiling_to_test=5Fmode?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 2020-03-11 at 05:34 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [v2,1/4] tests/kms_frontbuffer_tracking:
> Add tiling to test_mode
> URL   : https://patchwork.freedesktop.org/series/74549/
> State : failure
> 
> == Summary ==
> 
> ERROR! This series introduces new undocumented tests:
> 
> kms_frontbuffer_tracking@fbc-tiling-linear
> kms_frontbuffer_tracking@fbc-tiling-y
> kms_frontbuffer_tracking@fbcdrrs-tiling-linear
> kms_frontbuffer_tracking@fbcdrrs-tiling-y
> kms_frontbuffer_tracking@fbcpsr-tiling-linear
> kms_frontbuffer_tracking@fbcpsr-tiling-y
> kms_frontbuffer_tracking@fbcpsrdrrs-tiling-linear
> kms_frontbuffer_tracking@fbcpsrdrrs-tiling-y
> 

Forgot that
Will be adding:
igt_describe("Test the tiling formats, if the
tiling format supports FBC do the basic drawing test if not set the
mode and test if FBC is disabled");

> Can you document them as per the requirement in the
> [CONTRIBUTING.md]?
> 
> [Documentation] has more details on how to do this.
> 
> Here are few examples:
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/0316695d03aa46108296b27f3982ec93200c7a6e
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/443cc658e1e6b492ee17bf4f4d891029eb7a205d
> 
> Thanks in advance!
> 
> [CONTRIBUTING.md]: 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/blob/master/CONTRIBUTING.md#L19
> [Documentation]: 
> https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe
> 
> Other than that, pipeline status: SUCCESS.
> 
> see 
> https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/118421
> for the overview.
> 
> == Logs ==
> 
> For more details see: 
> https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/118421
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
