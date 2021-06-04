Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1636EB60
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jun 2021 05:01:22 +0000 (UTC)
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Fri, 4 Jun 2021 05:01:17 +0000
Message-ID: <CO6PR11MB55691A8FB70D6EA5233CA46F8D3B9@CO6PR11MB5569.namprd11.prod.outlook.com>
References: <20210603144022.28176-1-venkata.sai.patnana@intel.com>
 <20210603144022.28176-14-venkata.sai.patnana@intel.com>
In-Reply-To: <20210603144022.28176-14-venkata.sai.patnana@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 i-g-t 14/23] tests/kms_color_chamelium:
 Optimize plane ctm test
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
To: "Patnana, Venkata Sai" <venkata.sai.patnana@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Joshi, Kunal1" <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

> From: Patnana, Venkata Sai <venkata.sai.patnana@intel.com>
> Sent: Thursday, June 3, 2021 8:10 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Patnana, Venkata Sai <venkata.sai.patnana@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>; Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [PATCH v2 i-g-t 14/23] tests/kms_color_chamelium: Optimize plane ctm
> test
> 
> From: Kunal Joshi <kunal1.joshi@intel.com>
> 
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/kms_color_chamelium.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
> index 38c7169737..52eef8a66f 100644
> --- a/tests/kms_color_chamelium.c
> +++ b/tests/kms_color_chamelium.c
> @@ -1265,6 +1265,8 @@ static void run_plane_ctm_test(data_t *data,
>  			result |= test_plane_ctm(data, plane,
>  					red_green_blue,	expected,
>  					ctm);
> +			if (result)
> +				break;

I think we need to squash this commit to 
[v2,i-g-t] tests/kms_color: New subtests for Plane CTM
and add Kunal's Signed-off-by

Acked-by: Bhanuprakash Modem <Bhanuprakash.modem@intel.com>

>  		}
> 
>  		igt_assert(result);
> --
> 2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
