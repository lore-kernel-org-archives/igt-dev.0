Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682526ECA7
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Feb 2021 22:00:51 +0000 (UTC)
Received: by mail-qv1-f69.google.com with SMTP id d19so3314344qvm.9
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Feb 2021 14:00:46 -0800 (PST)
Received: from xps13 ([2605:a601:a63a:4d01:c3c1:7008:ba35:96])
 by smtp.gmail.com with ESMTPSA id r17sm6328363qta.78.2021.02.19.14.00.44
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 14:00:44 -0800 (PST)
Date: Fri, 19 Feb 2021 17:00:43 -0500
From: Jeremy Cline <jcline@redhat.com>
Message-ID: <YDA1C8Quzlc0+VaX@xps13>
References: <20210219172738.263820-1-jcline@redhat.com>
 <161376335340.700.3877839035574685136@emeril.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <161376335340.700.3877839035574685136@emeril.freedesktop.org>
Content-Disposition: inline
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fhdr=3A_Fix_bpc-switch_tests_on_AMD_hardware?=
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On Fri, Feb 19, 2021 at 07:35:53PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_hdr: Fix bpc-switch tests on AMD hardware
> URL   : https://patchwork.freedesktop.org/series/87232/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_9790_full -> IGTPW_5540_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_5540_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_5540_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5540/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_5540_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_hdr@bpc-switch:
>     - shard-hsw:          NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5540/shard-hsw2/igt@kms_hdr@bpc-switch.html
> 
>   * igt@kms_hdr@bpc-switch-dpms:
>     - shard-hsw:          [PASS][2] -> [FAIL][3] +1 similar issue
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9790/shard-hsw1/igt@kms_hdr@bpc-switch-dpms.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5540/shard-hsw4/igt@kms_hdr@bpc-switch-dpms.html
> 

Is it valuable to run the HDR tests on this hardware? As far as I can
tell the tests are failing because the plane scaling is invalid, but
from my interpretation of the test matrix it's fine on newer hardware
which support HDR.

I'm not sure whether to add something to just skip the tests for
older[0] hardware entirely, or to fiddle with the test so this hardware
is happy again.

[0] https://www.intel.com/content/dam/support/us/en/documents/graphics/HDR_Intel_Graphics_TechWhitePaper.pdf

Thanks,
Jeremy

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
