Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D95AC3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 05:30:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44F710E049;
	Thu, 27 Mar 2025 05:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Flf3QZ5X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC1610E049
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 05:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743053419; x=1774589419;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YFYR0w5X+DA8xTJuHGEa2b/cvTuv8Bwd9h+lmfykGqQ=;
 b=Flf3QZ5XyZiB2a0wq4ldx7BO4cHza+csIPbO/AehUYY+fEIBmyBcO3vO
 xd3iLBEZPsNJDlWAdT/geyA8S6Vd52+zv+n1IQo46bBcv463nVP24HY3b
 YOXB1Sq0kacfQZcJbRW2Tzcl7NjQkT+OLjqnD6bh7As91D724QIfrbjCy
 g5YyNkJYUbqcMTdqCOv4E3CuoHZl5cofHq1tD35qQ1fNxP0txsprQr6cQ
 gGRyFtb8T73ZlCiA9HjuX66Ag2VPf16sBsYnav1YO4gCF2huYP6efSbsl
 ed1kmKR+sSVKT7KmpfJjNoU6CjVkSQTqh3g9jQs0sBFOIE/qMFJUlNXYP Q==;
X-CSE-ConnectionGUID: rJdm54CKTPiW+rFjj5BrbA==
X-CSE-MsgGUID: 8j0RwBGpTMKVnGOfgVhkAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48155549"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="48155549"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 22:30:19 -0700
X-CSE-ConnectionGUID: WkqqfpvSTqi+5UxlvYU43A==
X-CSE-MsgGUID: F1z+JA3wT6mvutPEBDO4eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="124825428"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2025 22:30:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Mar 2025 22:30:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Mar 2025 22:30:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 22:30:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qybn+E4PdC6TzTG/fM6kGAgqcde7M+5Yy6F3J/Y2VtFa66jQg/Ldv4LoQ6TdDIA/S/51enhvHdy+gDirLaFxr8/91+yZpwqrjCGL+kawlowyJtDScLDntZ/st4xhvSIFFv6uYkuSm38+mx/4LW4kD3ERMHn7aOnRwzNwDYOTCFlk50DSyRQnlolbcTeyCsjuIf/zoU2W/i3gAyNNuhI1Ewm57Dn5u5uUUObNTzK9bZembpTs2HfslCSluCU21mGo9Xy/vZQXzUouY7YkoPGwCr4nBRglE9YRaIJl73Um+wYvpJzXSZctXlmOGGvu+9kq/jUn9/wAdA9AaEf9/Cn5CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZsxtuKdM/hGV8pu5rXOLBCUBfHH+9PV55UtLMJyTEpY=;
 b=wTXNdO1oGPppuNuGwZonlu2YpmmlpUX9o1puHaqVGynT/RiRpGKzyoUSc43yKdDn/F+vTZzDLegi9SNyHcdXtV9zXbW+cBpbkj7+F8/CJQ1PDzedju8ToxidI8eLTe+oNLIXGQQg6Eaw0yIqG7jl4Z9ZlVUyn8VSzjT+JYBhXaNR6Kos2JKqqBcKnsXA0ejnsQBIjWQxUaKZwmMjZnwjBKHu6iNZsfP8oh3LK0PmcAgFXzrwQu1lIp3T9sLi3QVUFrc4DOHkOO4FANKyGnjPXHlXMH3PthZFoENHoZtgY82QEfE7aN8/7WkAR7pReyPK4j1CxRYo0ByZfyxv2omQFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CH0PR11MB8142.namprd11.prod.outlook.com (2603:10b6:610:18c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 05:30:15 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 05:30:15 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t 3/3] tests/chamelium/kms_chamelium_color: Set
 rgb_full to 1.0
Thread-Topic: [PATCH i-g-t 3/3] tests/chamelium/kms_chamelium_color: Set
 rgb_full to 1.0
Thread-Index: AQHbnJvO7e4aqcBVPUusvbrt/cQmRrOGeLDw
Date: Thu, 27 Mar 2025 05:30:15 +0000
Message-ID: <SJ1PR11MB61291F5C807B02197236476AB9A12@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250324090949.614233-1-swati2.sharma@intel.com>
 <20250324090949.614233-4-swati2.sharma@intel.com>
In-Reply-To: <20250324090949.614233-4-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|CH0PR11MB8142:EE_
x-ms-office365-filtering-correlation-id: e09ef6fc-716c-4f61-3010-08dd6cf07439
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ebDnqw9x7ASz0m6hqOr+YBG0jvG5ZiKdKm15qYEZQXa6+qFK4XTlFACGHOqz?=
 =?us-ascii?Q?ubgEloLK1djeC10r4a9JrV2J2QrundYUz/d5h8l//wPM0lBbuwejqJryT8wL?=
 =?us-ascii?Q?CmzA59oqBACZUCVtYUYwQNbO7mnF+wjfjbK3AShTke9kGolNcaJGPCqaE+FV?=
 =?us-ascii?Q?hltZZIoO5NDZ42f3waMBpcmm469YswP0DrQSjv1A/d/4bN4UzxPheWxPuJ2c?=
 =?us-ascii?Q?aYnKbrQjI7hrYW193QQILrzymrEFfakWtuk9ccwRSRCnJYPXZ4bZZNGw0grT?=
 =?us-ascii?Q?bI3QlKdEbtqaEpoZ0uSJWbmTecOHsOGmw7WEugC+OjpCrpBiHKTQFtm0CHyb?=
 =?us-ascii?Q?CBT/xNofHYiZCZLVEh+ZuJ4j8vcQ78KUgs9BSS6ORN2zndIddu7abEoLM1qp?=
 =?us-ascii?Q?BGuE5cj7RolKIqUnKnffetHcfdjOxt+VUOK4dxmYQ2QtgykE2phCPkuTFJba?=
 =?us-ascii?Q?YciWf7YF5v+f/Wn4Aph3JlnkQoSwleWlBslNF+t20Oiq4+Yq30ABmT0+HIvB?=
 =?us-ascii?Q?r073/8U0HnjStibE4WvXtvGTwS271ZtjdJBCGhO8PvuWkTTItSK1cVraz/IC?=
 =?us-ascii?Q?4oMvb/Q/s35Mnh4At+EX3Tx2TV0b/7juTi8+0jQW82trEw4jc1uhAxjxmERe?=
 =?us-ascii?Q?+ajamkNjUrvzgpv9AMOeTEn2lWh1eyYj4xpIrcn8FgMl78FLiEdJZE8uOuhR?=
 =?us-ascii?Q?OTROGvxdc/p15zC6NWw/QNxaSb0mGA4QS40XP+Dz4FCqKwC3DEhJWIE/ikZf?=
 =?us-ascii?Q?AHmFQehbnnUpDt50bEgZoLg/9kHAofHPNN1Zgpe5//44XkyRFfbMpPjAd9iR?=
 =?us-ascii?Q?+/p2QWwmnjWO4wrn9rq9OQ4k1/X+6aAM/RTy1lQx6+XNuoPpyc+8wng4vtlI?=
 =?us-ascii?Q?mb6an2ugHXY/uRg5vTCqQ68KCdoDgFffgWFfyRcJMHwtubOikQqNaRIXDw4y?=
 =?us-ascii?Q?kodpUzHq5arLsyEHVT0wH/+mVEHisbX+OpKG2PEGedQSGPccWlHE4xi3kpE1?=
 =?us-ascii?Q?d3pioCKzByNXGjXCwoSOCgvFIiyHEEF6xcehwOHxYSHoTOZbpS65hXv/xT2R?=
 =?us-ascii?Q?88sUpqUmb8lfOZ5cD4dxLj7eMDPq2EnqxP8MLFPeN5V5o9teJYX51TILqwAR?=
 =?us-ascii?Q?Z4Ul5yCgV6v0p9X5xa/nNGk8C6J7RdH4qbs64ylVuBgL0uCnOtQnoMU12Wym?=
 =?us-ascii?Q?2B1nnCHEmfyCgJYX3yqXxCSF9UMQy7lxYFWRw85932CGZ/Gq29CvmpnmRdMz?=
 =?us-ascii?Q?UvYRKkrBKi/L/PQGpS5sa/4khKpRfkDH/N3HpRb2e7+1eUiwMGykK/Bl+lIU?=
 =?us-ascii?Q?sOkR/RgSe/lHxfoUzsPppkLu2LilqZqs1vmTs+A9K2ECBdi528ePMsLFe+lz?=
 =?us-ascii?Q?Gi9f/RAc67n3Ip4oYzKkEPJM/nPgVujZjYkcjgFezIOmCuREckOUrp8ux10z?=
 =?us-ascii?Q?PQAf3ut6bc7j1ATfI8h0Mxx8KDXLG61t?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AoreO5H0WGPTZV6OOa1VyumtqlkB8al/UClIlr/qkMxCeeBtfvGNQWPJPINP?=
 =?us-ascii?Q?zp/HRPPX+FYltLXcXtkKQVl3aD38jZEoRCCU5UxXUsodJ/ItqW0a8IVmtHZN?=
 =?us-ascii?Q?OmwcbFWJBk1c0QdasyrcNK2xsXOEQ/WxoGHz3ahlILC+2D2EWVIxoO5ZVHg4?=
 =?us-ascii?Q?GJdEXNEBy9Au6IWFGtp82yCCT/GzZ6MIe+rhHLVQxBuqJwKHHmExfar28AWT?=
 =?us-ascii?Q?aMU/XBa2qdfosDOe1YjjdQywZ4x1sO1X2fS0TliKKZpmjjrSlid2wJsMqmiv?=
 =?us-ascii?Q?JoGXAFGMIHgLp4gYrmv7fgmaQxnysgIzyXmnEEKVJ0kO4bS1Ea7sSlQwfVN0?=
 =?us-ascii?Q?RmU+tPxHYLudmp/iMgSk0QtirRUjercwBnboqPq4PRc01s6jsq7ufzDEaKnP?=
 =?us-ascii?Q?rBGwvVKlCye4amVT+f4trU579y+5lr3fnBDoxLL9S/7/gSMKMqi0XnGHz80v?=
 =?us-ascii?Q?zugE0EqoXHqCxNssiMpzYHtpgtRCDgxq5EF9WK/h6rHw+yp4idhPeWGLEbGb?=
 =?us-ascii?Q?AEzAVef9lzkhcN7bCcKWkJOG+8S6MnClyveimgBjnvbOvNPaneBzxMcCC1jA?=
 =?us-ascii?Q?PuCQQE4Nkqb5SoYnQuyws/aAqS9riRlPcbl+Y3t47+/KojWRze1FI6QIro7e?=
 =?us-ascii?Q?+LCMuBjV+72Xazbe3zc78YWDpzjKpf2fmOK4U8S5pa2VWTsD0So9BFsUjctS?=
 =?us-ascii?Q?Xqyryo8QZCA50skw3TxI0TXJuFUJhqTz36Q7syNwcyNXqCg80XhqoyR4/VqK?=
 =?us-ascii?Q?kh9nE5wk3tWMDafysg7jHMnhcrUMBcDpahBWDt+e/xYYC9j4aaCPP5yMLxBh?=
 =?us-ascii?Q?cE939EziIXNVEyj97IsWeGEj6eSXXuzsycopVdj5HWj9U4oq5fHdOE+k8paB?=
 =?us-ascii?Q?XTT14AkX7rTogUfzTQGavIymUstAyUaEb10LJ/AWq1zoVRPfcQZ7HWOYL7x3?=
 =?us-ascii?Q?WIMqC2Hzy/h4yzjOQrHe7OQTZCEH1wJ/ScL2sDCTHZxzIKPpqAfIN5Iex+if?=
 =?us-ascii?Q?7C+OXYfntpTL1FQUEORmhSK33swckSRhXqXuukqrTiM5iK1uvmD13Wu3BU0b?=
 =?us-ascii?Q?0O99nsExpSelfw/46rDIzc2hRpmtQJUbQsrq3lAsbUV6e7OnRHZLNrL/F/V5?=
 =?us-ascii?Q?7x5gFHYUyhlL1dk7zLqdAMxhG3QqTZUk6zH7Um9v2SSArHuc1Vihl4b120eN?=
 =?us-ascii?Q?vqFz0Rh/6dhbHR2BcFc8oVvHmB9O2AhlPGbq4tGnaGgVyaZFfRxl2NbFrb6O?=
 =?us-ascii?Q?G5e4HVdB3iHYUEqyww6tbKkRw18lQOmgNa1QgQHuwOEo2t41Gp0NnPjaKR9u?=
 =?us-ascii?Q?Y+vOP9R78uo2SP28gsesJrEO9aeeOmOLm4LLR8c5tNlfFwmvl3K8qIFtOPji?=
 =?us-ascii?Q?fb1AZfBN5hNRNj8lZb7Q3qagIqdicTaVI21ySwsmytuQNTOWl56BjATzZAsm?=
 =?us-ascii?Q?Y6I8G86kHeSyCMiThcle9un/SV/zwtB6it2p6QP7/oZxe7SowRvAIWwQFhth?=
 =?us-ascii?Q?nYcY663dMR3BSh8Bz8D7P+VTZ3DaQND/erc6TJN0nVW6iclEBog1cQ2BFKKi?=
 =?us-ascii?Q?I7xVJy79nO6/rohL9lC6bBogpcec4b1FybHYLZaWwAVeOKvWPFkct42vzlHn?=
 =?us-ascii?Q?HQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e09ef6fc-716c-4f61-3010-08dd6cf07439
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 05:30:15.3802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RAE7LlDn+vNrdn12FzrJqXAvNrbWgnHM9NKYOJmbP88dQII8gJ/TXst3juBTB1u+mWi0TgVp6u0kcYLLdSqQ8x4Y1GqFfhifnO1UCbLFajA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8142
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: Monday, March 24, 2025 2:40 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t 3/3] tests/chamelium/kms_chamelium_color: Set
> rgb_full to 1.0
>=20
> Set red_green_blue_full[] to 1.0 instead of 0.5
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/chamelium/kms_chamelium_color.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/chamelium/kms_chamelium_color.c
> b/tests/chamelium/kms_chamelium_color.c
> index 355047ed6..4088e2eb7 100644
> --- a/tests/chamelium/kms_chamelium_color.c
> +++ b/tests/chamelium/kms_chamelium_color.c
> @@ -342,9 +342,9 @@ static bool test_pipe_limited_range_ctm(data_t
> *data,
>  		{ 0.0, 0.0, limited_result }
>  	};
>  	color_t red_green_blue_full[] =3D {
> -		{ 0.5, 0.0, 0.0 },
> -		{ 0.0, 0.5, 0.0 },
> -		{ 0.0, 0.0, 0.5 }
> +		{ 1.0, 0.0, 0.0 },
> +		{ 0.0, 1.0, 0.0 },
> +		{ 0.0, 0.0, 1.0 }

This looks good but I think it also makes sense to convert the 0s in the li=
mited  range matrix to 16/255.
That should represent actual limited range of 16-235.

Also perhaps this should be part of the previous patch? Because it is impor=
tant for the test to actually work.

Regards

Chaitanya

>  	};
>  	double ctm[] =3D { 1.0, 0.0, 0.0,
>  			0.0, 1.0, 0.0,
> --
> 2.25.1

