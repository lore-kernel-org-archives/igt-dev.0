Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2ADC6E104
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jul 2021 06:33:53 +0000 (UTC)
From: "Surendrakumar Upadhyay, TejaskumarX"
 <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Thu, 29 Jul 2021 06:33:48 +0000
Message-ID: <SN6PR11MB342187FE335D2DE0AE993540DFEB9@SN6PR11MB3421.namprd11.prod.outlook.com>
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
To: "Srinivas, Vidya" <vidya.srinivas@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Latvala, Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Vidya
> Srinivas
> Sent: 22 July 2021 20:37
> To: igt-dev@lists.freedesktop.org
> Cc: Latvala, Petri <petri.latvala@intel.com>
> Subject: [igt-dev] [PATCH i-g-t 0/2] Revert the wrong fix for coverage-
> premultiplied-constant
> 
> Subtest coverage-premultiplied-constant was failing due to buffer alignment
> issue. It was not due to 6bpc.
> Hence, we need to revert this patch which was wrongly submitted.
> 
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>

Reviewed-by : Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>

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
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
