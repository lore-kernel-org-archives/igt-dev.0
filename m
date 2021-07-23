Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C2F6E936
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jul 2021 08:45:56 +0000 (UTC)
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Fri, 23 Jul 2021 08:45:53 +0000
Message-ID: <BY5PR11MB4372DC7CD6A6F7BF06ECEE0689E59@BY5PR11MB4372.namprd11.prod.outlook.com>
References: <20210722150700.18435-1-vidya.srinivas@intel.com>
In-Reply-To: <20210722150700.18435-1-vidya.srinivas@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] Revert the wrong fix for
 coverage-premultiplied-constant
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
Cc: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>, "Latvala,
 Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hello Lakshmi,

We need to revert this series. But there is a false positive.
Could you kindly help with re-run? Thank you so much.

https://patchwork.freedesktop.org/series/92898/ 

Regards
Vidya

> -----Original Message-----
> From: Srinivas, Vidya <vidya.srinivas@intel.com>
> Sent: Thursday, July 22, 2021 8:37 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Latvala, Petri <petri.latvala@intel.com>; Modem, Bhanuprakash
> <bhanuprakash.modem@intel.com>; Shankar, Uma
> <uma.shankar@intel.com>; Srinivas, Vidya <vidya.srinivas@intel.com>
> Subject: [PATCH i-g-t 0/2] Revert the wrong fix for coverage-premultiplied-
> constant
> 
> Subtest coverage-premultiplied-constant was failing due to buffer alignment
> issue. It was not due to 6bpc.
> Hence, we need to revert this patch which was wrongly submitted.
> 
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> 
> 
> Vidya Srinivas (2):
>   Revert "tests/kms_plane_alpha_blend: Fix a check in is_6bpc function"
>   Revert "tests/kms_plane_alpha_blend: Skip coverage-vs-premult-vs-none
>     for 6bpc panels"
> 
>  tests/kms_plane_alpha_blend.c | 36 -----------------------------------
>  1 file changed, 36 deletions(-)
> 
> --
> 2.32.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
