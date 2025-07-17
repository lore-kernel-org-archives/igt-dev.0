Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04EBC83F1A
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 04:24:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DF010E2E5;
	Thu, 17 Jul 2025 04:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AqwlIgCw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F89310E2E5
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 04:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752726296; x=1784262296;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aWv+St/YTpBF79u9YoiJMyFOu8QvhiZKeTxyFf/25eM=;
 b=AqwlIgCwYy+P6AH8WZKcWBD7/SIdsuz0P1xdDlO4WONWuhtn5hR3hFvk
 E6lPLEnhIcwhZ9DOc+n0yK5sXumdDxlL8hcwUEYIQd3RNvefP5YXltLNQ
 OEZBA9X7pHAe/6nrR8XCYC5C7BapeGcJJcSU0KbfI1LN+HhjxLPQXbgT1
 9y4oO8zib5I02VR1UT5VYB2jXh7Lzskdws6cb+RTWbUMJIX84eHXGw8Gz
 +ygoIInfrBZMPkLA65jcEi8GS7m1PbAma/gX5ZHH+OOae/VBv627Cs47M
 Lbm+TC7t4ND7WxTAxgYxayek2vteL1QXuVbmErT1aALkjOO64Up9o9MPa A==;
X-CSE-ConnectionGUID: ssMeIMa6TiGANHdAdbZdSQ==
X-CSE-MsgGUID: kHmLG4fxQp2sTwfzHzLXTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65681424"
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; d="scan'208";a="65681424"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 21:24:55 -0700
X-CSE-ConnectionGUID: SMDZpxBIRrGYEyclwiTOug==
X-CSE-MsgGUID: +kHfQJ9rQFWbdLvN3bcX8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; d="scan'208";a="157757594"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 21:24:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 21:24:54 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 16 Jul 2025 21:24:54 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.71) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 21:24:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z4ofObGLyz62chlL+SwpR/N1cP3qF3misA2AuhZtgyY38OtcwOK/YYwY2hFF0FvowYbkCaKbJHxPF0yKoEIfRQFjBi87zihM9KCWtEkU8AX5+w9QYjtStD7En694ENctSGi3QwEdGOafIgplK0eSNougFWL92t85sf473UYF1+t8UqJ+lA1dJREHNn6rp3CAbLeL734OHJGiPQZT8KFUxvToGJMHlvDcsy5TswOqIj5SHFAZ8L1Cxj1+4mOQxVRmHQsX1GOXv5FEWIOCxSht6ok691hY6txvQVkdEdDgkvUwVn3uo/E9IFwrzEKO3JIPYI4fEvZvEZH5LBD7d6X/pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooRjed9zUBN15Xk9caAqtl/IZnlbrh7JFQskk8542xs=;
 b=te4VrFI7LHnSIIUHU0/4bfcrlw01ad8MOGtWOHcXCe1fCTum/HMEUVMfByDE0ltlJjXSoPa1+MLddA3mEssaZ36x+U9LZGNzPOoE7KmMF6inyrI7W7JlI6IeJWjlXCsLo9HLP03sCKUUvWxddh6VP3Lx9DWaKqbCzHBWZAGppiRxyTxeLlOdTpsDneDQkqqBoNS2RRScpr4eZUgudrVsBEQwFf3223P5YaQ32xzrfzsKc8OP102DWFh/Yg7hbffBmaU5OHrzPq1BxzUO+Hb25c1YXsKYIZmm8ktiKxyWZFHhHrwBXv0YmgaWBYQeExEMWacAlH0FWpIUSv598CSzPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.36; Thu, 17 Jul
 2025 04:24:51 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 04:24:51 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/kms_async_flips: Replace hard coded
 modifiers with async modifiers
Thread-Topic: [PATCH i-g-t v2] tests/kms_async_flips: Replace hard coded
 modifiers with async modifiers
Thread-Index: AQHb9myQitQy+J2S5UqixM2VzgdotbQ1t7Sg
Date: Thu, 17 Jul 2025 04:24:51 +0000
Message-ID: <IA0PR11MB7307E2B609981E658DF1F188BA51A@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250716161231.410389-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250716161231.410389-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DS0PR11MB6375:EE_
x-ms-office365-filtering-correlation-id: 682f4315-8044-4eec-6d0a-08ddc4e9df96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?dYucuiSeHOZciF3D6HC5wbpT+zLKqb3KJUGWKfyetr/A54IA5R442BfDkJB1?=
 =?us-ascii?Q?KKCJ5ce0LNfghbp8YwelbwOTeQDtqBWh4LrhbKec1FpQ+YyPDfWcX8XFtz06?=
 =?us-ascii?Q?7uL++7il30t8TMvPj6MlqUexIbL+2GaHYiwEGIMCeTBrjb+6Z2nS7q8uNsmc?=
 =?us-ascii?Q?pKujBkMXcQq9whvzJ28+YDh8CbSHbt+boRnrPdSXnDHqR2UIaifs3WsrBClt?=
 =?us-ascii?Q?dwQ1PkIunrcDRvwJwY7vuSWHyDXYKZniJQU+MVX00B31G+MoVIJdnjrixKZc?=
 =?us-ascii?Q?W3Vn7WwtZOPNf/jWK9ongq152looecRLBKUNHbhqIyVSmHK3t+WwXPW3+k5Z?=
 =?us-ascii?Q?UZcju9MxsbcYK2MoihfC3Kd0hGbo5mDy87xSc6u7xsU+rsNUv4z04pOgFvjE?=
 =?us-ascii?Q?qcxuTiA10yor5hpgtbfUjVu0dvjhg2rMthx4k2ouHe2RG/cg5nLiRrfGCcqP?=
 =?us-ascii?Q?KwbAQp7JEZUKB8fpR3zeuxZqfnAt/vzqRkSZ8o3DZqLxSScx7JEKW1ot0QgF?=
 =?us-ascii?Q?TIVc78OEFhs61DL0H9T98T54iazPqeUg+efPHhwOyC3Wnr8pY2gIeK9Y3jKU?=
 =?us-ascii?Q?sCyWM4PhV3FvJqDV4RNCP8CMBIcpI+sQcPtyWDChMViNA7083tDIhbWo9zyy?=
 =?us-ascii?Q?FN2CkZXZ9eVxkQkouWCleQdJk7+/+/4rFst883mdvhSUOXlMLV4HjoJeezq8?=
 =?us-ascii?Q?GEDPYAKwJ7FjWtGgnR96L5kG5vnWTuAWQlxZAc6F26Ms9OhmoZ8b8xj1kFIw?=
 =?us-ascii?Q?1h7s8xbWFHFHhWSZivReH5EAUBx5IRQVu2Ad2NpdEJWpztMadZMzhk0ZzQXr?=
 =?us-ascii?Q?HWMjLuYYH4G6MhG7fVT0319jLKUE/02cg86pcgExieegRUnO/5Koc0JpHNh+?=
 =?us-ascii?Q?ybQ0g/MGhnVKhmXOjKkXnwhwXBjA8s9NFtC22Qh2cytlMiWC+xtJwd8Gyfmm?=
 =?us-ascii?Q?L2DqD95wY7/3v1fegp8vR6oDtlpwg/oymtkCTLTY1s2WzYVL0ngMoN4aA2wh?=
 =?us-ascii?Q?jPZ3b6N6/OxMEul7w0dvqYcRjueiISSu7y66M2olJpJQkYNCSqMzir2W7WXB?=
 =?us-ascii?Q?jOlHuKiV3J06M/RTRjLbD3R4A5IyPceLjvEJgB8NZLbR++9yZjU8MbiB2QGB?=
 =?us-ascii?Q?8cqzpej3Js/VuLL1e5tSEBm1VbnaGCqXgx5anI5MiK/dbTaVbM8gScBUBsr5?=
 =?us-ascii?Q?4CzTyZsKdiwFi3B0SP1VFt1O2IRl5IDKoKSCo1q4ZbFhv2L61JR8XuaJOyGP?=
 =?us-ascii?Q?V0752/lsO7C0ZXiCdvC6WzPS6DaKskKPfwKXkOZCzwgZwsPPEODzPcsVNbr8?=
 =?us-ascii?Q?eY1PQDTXOXY69ZV/NkWbw+JWCUybGJZQ4s2iC4NayDOWMALZYQKdm2MXOX2g?=
 =?us-ascii?Q?wjXWvFkPalM4wW1qR8uW8c945tlT/lmLfNo5JPRu0RUD050ApPICiavqBbgD?=
 =?us-ascii?Q?5TribPeHD6U=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Mhg7AMzvS4ypItchoq7Q+79UEMvYNL/NZPaVt8s0oCUZLCVOeYNgM9YDrEoT?=
 =?us-ascii?Q?Uj98tvU+VAlyjKP6IkqIOVPSvbVJBHzmIVBskgZY8YYkXqeo1Rfyxr0TTaPf?=
 =?us-ascii?Q?h+baukUQCl9zSpvYHPS3qEO9yKvKbZch9bAsCr653Zk/YtYNdmXLoeI71XlC?=
 =?us-ascii?Q?Gb96Z1vWOs9QHozq4bkHJZ1SwI/N/jv86QpN3f1yV4MMc2lYixzLowE8wEkL?=
 =?us-ascii?Q?WWR0m1Z0DnSsC8zDICYejahEvh/SFS2dSWLAdeZIY4B78ZjGVEiOmrIwsgy2?=
 =?us-ascii?Q?TdX05L+SpnCxR6jyr9ZmDAiRnlb/AzzgM+9PtxLATVaXf/m9Xko7YXKqaxpC?=
 =?us-ascii?Q?baK7iY9vGFBnebbPk07/Kti8XqEhWmGPbPYOYXBacwjneslEDQA4BXrJlIIm?=
 =?us-ascii?Q?EAI4a+kr3tuJLn6V+BhQ5rnAJfgsNTw7Uimvrd+MiCJEzi2YIYgUdY5domfL?=
 =?us-ascii?Q?bce/Tx9EyWADR4LWq1IHUGv3ev0qwG9YGss/LHu63Fef33zoQiav4VKFF54J?=
 =?us-ascii?Q?BVeqCsixx/tZtdhWJLqinwreN8+zl9OWypCr1vcHFsT5AKBhymRlczpI3iHr?=
 =?us-ascii?Q?JeHwedAE+qU9MTvIx899StN4UckefmHhZKuBhu8T/saX1I8rKyvMCLIj1Vf7?=
 =?us-ascii?Q?Hk+2Q+WD8U+cKdz5CdBhTPdJFHcqCPLjFxNwWMKFid4JNJ1/D/eJl1BvG7Rn?=
 =?us-ascii?Q?96EWLM2WNmQMhRqxnSoB3Gm77VzTq0bjBma8etcBHvFsnNEEQpeAcKr/+153?=
 =?us-ascii?Q?4iHgUGtff4m6HtmfKuWiPVyWS2wW5tHq+q5+kBwcsWHKIVVo4EMGb8x2EEvD?=
 =?us-ascii?Q?/s4zSLhtnUWGcyBprMzQlw+tG5T8vAzOyx+Mt/bgdvoKOkCL2ztBdBE8XWTp?=
 =?us-ascii?Q?lxvHorDsTXDBkGBDuNLTVPAtngr4WEYBUUhJ6oPFdvbXW3MKtAYYkUDtXteW?=
 =?us-ascii?Q?uxfxvbsQod/02JSPJX4BmNas6t8wCjVMX/+mhBtuf4XsKEWBrClaMN/eEiP4?=
 =?us-ascii?Q?KF0TzS9xwzhJlMa/LvhQxWrsc8dbIFP03vI7I9w7x9qsS2+CkD6R+LbrNhMX?=
 =?us-ascii?Q?OKyGndOmdRvwYmgSko4uTQUG1/doCYzy1KIPBA2RcYnkhWIH/1ZRP1WZOgVq?=
 =?us-ascii?Q?TGAqdW/pH75igrBUiVXrUreUL8HSNEn+7m+o2FWytYWuV/RBtNNc5w2EQK0p?=
 =?us-ascii?Q?FFGHH87qKvpZ7LGTkUTu+dmqMCpCTEIKsSYYn0VRFZcf6URdIC4iOQDwsgRK?=
 =?us-ascii?Q?kE8CyjdZ1zP/MB6a1JEmHUcWj3pFk7LAxCyNBLXxNUakHd2HaD4GAVnUMuHr?=
 =?us-ascii?Q?uyglZsRaqcnGK5Q1K1+bkCJFvJlNlcqZpC36CVDfnUEGi9ycAcxiwNNsZ63B?=
 =?us-ascii?Q?7WcwoJy9ilFZ/LeTJ1TAOTvxAh++irKKDztDLWYLenRCvDXn5yAQKHyYeL0h?=
 =?us-ascii?Q?LK9cjtPnSrPAgqPfwqJLkLVOk+Jgk+k1oJ9dI8gTBoWItzt5/J/bsMxWRbOX?=
 =?us-ascii?Q?cvhas1PpEKDgZ7GOcQWDfScu9H+pXfGqTydjgPT+suzy10sh0TtRKW4ixQsD?=
 =?us-ascii?Q?gAmB7MmXTNfFg3AB43/1PdY9CBgXRd2FRGba4+Ca697tp8+rHrtWjgUn50cE?=
 =?us-ascii?Q?FAwi4C1J0Fvz1HpWLAVGbRiR/4jNkBib9CFYXWv74nDM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 682f4315-8044-4eec-6d0a-08ddc4e9df96
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 04:24:51.3839 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tflPdD97RYsd4MZls6WV0xXKDIRd3TP8vYtN1fVLQIMmZ4fNUCGjjMQJjqPEiJyec+il+bJP9iMbrwgFdlgpvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6375
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
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Wednesday, July 16, 2025 9:43 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v2] tests/kms_async_flips: Replace hard coded modif=
iers
> with async modifiers
>=20
> Use the IN_FORMATS_ASYNC uAPI to get the list of async supported modifier=
s.
> select the 2 unique modifiers from this list to test invalid async test, =
removing
> the hard coded dependency across platforms.
>=20
> v2: Use first and last modifier from the async supported format list for =
invalid
> subtest.
>=20
> closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3768
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_async_flips.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>=20
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> ddac904ce..1d4684c51 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -598,6 +598,7 @@ static void test_invalid(data_t *data)
>  	struct igt_fb fb[2];
>  	drmModeModeInfo *mode;
>  	int flags;
> +	uint64_t mod1, mod2;
>=20
>  	igt_display_commit2(&data->display, data->display.is_atomic ?
> COMMIT_ATOMIC : COMMIT_LEGACY);
>=20
> @@ -607,10 +608,16 @@ static void test_invalid(data_t *data)
>=20
>  	flags =3D DRM_MODE_PAGE_FLIP_ASYNC |
> DRM_MODE_PAGE_FLIP_EVENT;
>=20
> +	mod1 =3D data->plane->async_modifiers[0];
> +	mod2 =3D
> +data->plane->async_modifiers[(data->plane->async_format_mod_count) -
> +1];
I think we need to check for IN_FORMATS_ASYNC and then assign. There are ot=
her vendors who are still not using this IN_FORMATS_ASYNC so for them data-=
>plane->async_modifiers will be NULL. So in case on NULL use the existing s=
tatic modifiers.

Thanks and Regards,
Arun R Murthy
--------------------
> +
> +	igt_info("using modifier1 %s and modifier2 %s\n",
> +		 igt_fb_modifier_name(mod1), igt_fb_modifier_name(mod2));
> +
>  	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
> -		      I915_FORMAT_MOD_X_TILED, &fb[0]);
> +		      mod1, &fb[0]);
>  	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
> -		      I915_FORMAT_MOD_Y_TILED, &fb[1]);
> +		      mod2, &fb[1]);
>=20
>  	igt_plane_set_fb(data->plane, &fb[0]);
>  	igt_display_commit2(&data->display, data->display.is_atomic ?
> COMMIT_ATOMIC : COMMIT_LEGACY); @@ -1113,11 +1120,6 @@ igt_main
>  		test_init_ops(&data);
>  		/* TODO: support more vendors */
>  		igt_require(is_intel_device(data.drm_fd));
> -		igt_require(igt_display_has_format_mod(&data.display,
> DRM_FORMAT_XRGB8888,
> -
> I915_FORMAT_MOD_X_TILED));
> -		igt_require(igt_display_has_format_mod(&data.display,
> DRM_FORMAT_XRGB8888,
> -
> I915_FORMAT_MOD_Y_TILED));
> -
>  		run_test(&data, test_invalid);
>  	}
>=20
> --
> 2.34.1

