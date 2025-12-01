Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D41BD116F1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 13:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1EF10E3DB;
	Mon,  1 Dec 2025 13:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b/OOUvRG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE5D10E3DB
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 13:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764595060; x=1796131060;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oxVYWCnflSkutRepMBEGUNoCOzthjOa+Pd2jCAGVCBU=;
 b=b/OOUvRGpGrZKUs7KaDba4txe1oMIMLfZNy2xeKpukUqMKh/UfbWMQrs
 hk18OqhU6gg7DYbZL70KfR5fTSBzpkmvvlq7TTl3On+wmWeShnurLSZtc
 pVWkUagaR+1zLNVxVjtqy+SKxf45mPiBPIbovp8md/qdaNMFnVctb8X/O
 JiYDRUDnLKX3PT0nbyV3WqeBAeFJmohfWP1vlbGt7yfap3GkHyuLNGd3j
 wc7ZGtdGYpjn+MPv4/1KjO08nz+AvpcmdyNqZgTH0s7seCmzAIephdoB2
 FsiYiePMY6vRgIhrPv4XjHjIMOAtvZuRzF+8MRdZ5fAMGeQUow+RZwSrI w==;
X-CSE-ConnectionGUID: 4bSb8zLYQQeue9wCqZEEgw==
X-CSE-MsgGUID: YCgXfuByTrOYCNCvCVag+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66565192"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66565192"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 05:17:39 -0800
X-CSE-ConnectionGUID: 01FEuxBDQdGyC/p29Tbk8A==
X-CSE-MsgGUID: +TnHQ85eTAGktEYySwF4xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="217432880"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 05:17:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 05:17:38 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 05:17:38 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 05:17:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QSZIToN5WFmq126rq7KqSrVb/sOB5XMyxO265H7I6uKxt/Y6dLkdQVtUzNDmSg8iCLaPO8ZTU3IryE+C/h7va/ACXF9XpGW423UuDgs5b+zq9c/1NWICWwxohVZtH+UzmiMJcfBIeSXrP0jtmIYTMPDB4eONc/6TjkFZw+3oa2h54dh4tV4YYHOfwhOSd0ifgfTGNzRRGYC3ZoaLZ1D5f+S1yuJuNl8p3amZVTG9Pm5M8DM3ryCPHUar9aFS1vvmsmQggZygk+ztpC+7lvYnTJZvtebWlWszrhU/UkUwh0UNMT7DGbRWUoBG7hJZl2dEgGhhvtgiyTM1nQCsvFPAjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z12s3f0VRzdz8vZb3c1e4A/op4nI2PX9MczTgjq+IEk=;
 b=FDSr6X2/lQOkrb7KkfvELNzInyBNa8tRxa2d6lF5k2RuntXP/MhD07//fLtDm5pY/BBIxdFmxz+dd9ervGxNsZQiyMGNxhNwi5i5O3fY67//drdONi/7Hmr6Xou2JlUMgXoRaHCyq+F8DeyUtoKS7sZVijXBvDinK7TgR3oApXGu50XRr0XKxfF4MP1riUZQVL/uw3Fij39J63CMXkCVylIxX0WXR69kz695+HrFJvQYeZt+QmFw3PJBdCQl0QxW6w6xrm8zwlsNvix73VYxG8503QW7rp3JmHcEhstio7JzG6H3+PVtaVZR1ghngzHbCnVjPiF9RM/jDB2AfNJuMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH8PR11MB8260.namprd11.prod.outlook.com (2603:10b6:510:1c3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:17:36 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 13:17:36 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v9 06/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU performance test
Thread-Topic: [PATCH i-g-t v9 06/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU performance test
Thread-Index: AQHcYqFvmzjyeBYxZkW//Bvj8TutT7UMxGag
Date: Mon, 1 Dec 2025 13:17:36 +0000
Message-ID: <BL1PR11MB5525DF2FEB2BB7E4F39502EF84DBA@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20251201090349.326673-1-nishit.sharma@intel.com>
 <20251201090349.326673-7-nishit.sharma@intel.com>
In-Reply-To: <20251201090349.326673-7-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH8PR11MB8260:EE_
x-ms-office365-filtering-correlation-id: 401e2d44-cecb-4440-f0fb-08de30dbfefd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?HiGnHFKhaWPZPQ3Ca4xmq0+PmfThhsysWRdpBBXy8n31WRGdGEF8zzcDemjN?=
 =?us-ascii?Q?v40tWwyyMooAzMrOKKLvK9iEoz1XTj+KiQjQVux+4sCgYf/3fVUOJ5A0hsCO?=
 =?us-ascii?Q?2+zM85D8+Nv8saMQCvup+p7IPSzyl/vTsDkiwJt9GsgW9SGfCRKdoHO6vMk9?=
 =?us-ascii?Q?IjHKTCSFKBOc/h6I61B/FdhiAZ/LN027Fvlle76I2cX9pdgtxOgt3NoK4E9a?=
 =?us-ascii?Q?ggBJ42Jc8xOg719y5W4QfHHJV++QYPwja1RM/jyOuDicqVZOCgNMrmQg8QrR?=
 =?us-ascii?Q?C5y9v4b9kUm/5GiUZVmVG3Dd22iXmRBFXF4ffWBIyO5tTAoCQ5Y8dJrHIqYC?=
 =?us-ascii?Q?TTrHJwhwT8xdqg/HuvdBXmVK5rte8SzHmiAFTYN1TFUoPwZhNDzeYfOg+vjj?=
 =?us-ascii?Q?5wuFS/FzpJ4pwx2S8hKmrz48WKf23AnVAYcgMgSEHiow9tsP1nR/MB7iSNNT?=
 =?us-ascii?Q?Qzw5X/lSBQTGIqTX59uCE6IYFymWAzPZMVYXOtAdJ5IsdROTuFjTkRNxDSo6?=
 =?us-ascii?Q?9sOGqmAGCauTC75BpyXwZwuhphA3rYZP+UKYbIQTHxgq0BYbnVUvXvjRvyHW?=
 =?us-ascii?Q?Dcrv/JkDcT2goR2dH54sQrBV0FOYqCkqetRWYUtHl4POLqiaaz5jZkL5JnyS?=
 =?us-ascii?Q?1TGTAcZ08AMgGdPjmwa2RecOjoE/P2EZaA0T7r163Z98YDzH0JzglEN4yRfz?=
 =?us-ascii?Q?kTNevsgBhrtQXl7u12kEw3QT9ezU4bCVHbbxxkguLE7842qISpEMKY6mJy2i?=
 =?us-ascii?Q?D8Ly+B2LIPAUphIW/tFHRmLwIxcm+SH9KhMn/nZOcfZx+Mk8abvUxp7TgcRz?=
 =?us-ascii?Q?iUSSmCJArfmRKlxwbDlTRx2HXJFllxed/PZKYfslJBf/mUgdO7BG+BeHhLOB?=
 =?us-ascii?Q?IBgpWjZwFGSiKXFqUUFruonklPezfh2zoPjcRCy5lhk53y9+MTQxjKodtnr9?=
 =?us-ascii?Q?k2WeCulv6XftlYwEEToLO9srkQR4A7T21nIZR0tt43nlZ5T5zYlUJK11wG6d?=
 =?us-ascii?Q?Ow1NAmlNYwnusoYsbccmwc6Z1q0NsAebzRcx6LAMpvy1fAZufjIEMbmIPY99?=
 =?us-ascii?Q?iK6OsvqcgV51d5mWK//b0ivHipgQt48KtsPr06jNsg0aWpclVanmupzkzgNR?=
 =?us-ascii?Q?W2vd+vxId2gMT6WCU2wTCkTN+wONowrCLXr9g5m8gHNhiHFth766MF0VSLnG?=
 =?us-ascii?Q?NCLMh+i2SKbS+D+rTHRIxsCiHb57xCYf/OkzoqUp93i7ehQu2bf6OJY+45Ct?=
 =?us-ascii?Q?1pxM8DQ7t5Sa7sejXFo5m/Z14OAGcJ7PeF68EZRDtQ5MkYD7c0D5K1z0fAXZ?=
 =?us-ascii?Q?mdAqGP5aYLbW1btpSAYW+axDGIbhDCgqrn9uo/Xcy4TEL/wSzrQWcBaV1Gp7?=
 =?us-ascii?Q?MIMnnCmQ1YaPVxsV/JQ0kpCc8RVVHKfm2QrCWYoGRDpXE1F4W3WaY+OfYvWM?=
 =?us-ascii?Q?Dp5B9mw2zeg9TcZ04AVV0w+26qGN8rap2NHy0pusI9rT8AG3sT9KC/Jjunqv?=
 =?us-ascii?Q?8c1Je09TXs/UXEoY9OtpVEMsdEoIbW4dEOOB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1bB1BdXoMGM4MC4jwBbfbWtqBVxWlr6tc4UJSpMASsGjOyYtiT6MYF+3Dz7u?=
 =?us-ascii?Q?bavw+4Kyz059fdmjWLxuIB2u8sMNYSXT40rWwOFOYVnbJbro4FMc+NZctAEe?=
 =?us-ascii?Q?+2hc/rXrx+79jcqLNGulBku9jyRLi+XGI3wopHvkj94PaX7YsuWyBiGi3Yul?=
 =?us-ascii?Q?K5pjym7jLAoIoeljdD5PWdpFapApLS/OwJy8mFnQ70+sVAl43pQpEuus6l+2?=
 =?us-ascii?Q?5G4x7Qxly7+rLcKaJI1NHl75dWIr0K5MhlHADKB7hTArtkyrYSwC1dfQ+Ks4?=
 =?us-ascii?Q?Q+dGzt60i59uz09jQ6FDHQyNes5RCxvvVxQ9jnZBQwSG38tGM7IvnPdpacOk?=
 =?us-ascii?Q?90u5qp5pPDo06AoLBAm0Q84fl8o6F/s0G+9Tm2+NOFwhkwb2J0cRiw09KUnS?=
 =?us-ascii?Q?LhDn0zw/6xm/ix5lYLsNixTDRY5KsD65FnvwuYNBS/tXEqJq2SxZS2nWBcPu?=
 =?us-ascii?Q?X6FibHchdeJjMwBWh2NeHUNm25+Z167cDd/whX8hmSQevyznlMR2TNiShzAB?=
 =?us-ascii?Q?kBMfbZpS31uoy9KFEjviMBqUIGbYCtA8SxcvNNMNCZVaT63sLq9wdlhWDE1n?=
 =?us-ascii?Q?1+BHpFygPLi4VCJPrD5lNTESDLaosMczgjnt5/KcWUXD7ZlvBB7tlDJDHum+?=
 =?us-ascii?Q?Vl35MY13IOlr18vMLvmiiX3GWCfqvMYgWwa86yr782KiumMhUbpazGCmlLaN?=
 =?us-ascii?Q?26ZqAuSU0Cdac3v+ARXnEWVM5aACwkZNtdYQ0NZs3FVZpbk7nxfj6F+ccIfy?=
 =?us-ascii?Q?5BbGa99DGx+maac86Koxnzy0whFcdcsbxS4OGwsRAxXx1vh+t35jTjI4vyd3?=
 =?us-ascii?Q?djQmjvHi37hLBRJLD0cdne6eopucgYR/d9BO2Lc9+qpx+RE72rwQiaepNM0v?=
 =?us-ascii?Q?KE0QxNcPRyUT3v97HfTw0ACxLXBiGagE1kk+WkwEnFOyffTLGqF3cqyo1jJs?=
 =?us-ascii?Q?kGLIakIpSOwoAJiyzDJmI2PrIp4hY5rr9U1hFPXxM0osk7YMfmsEe0OKdptd?=
 =?us-ascii?Q?JSkquagyCNVS53C+7y68yv8MZ3qgq9Ha+6FopntnfKPtx9Ry1J/Ahsi1StOm?=
 =?us-ascii?Q?ojkzHLYVlRaMugbdCdgVNgCWljuktKz7+Z1zcekvQ8PMnoD9CpzyUd+9R1sq?=
 =?us-ascii?Q?8+blZ8EJnU9BXP1PYzzVV9FefY5ZPvJFpsh4Uc97c9yi9SaMs/Hd/I9Fin9O?=
 =?us-ascii?Q?Gk6SXPgvEcqdY2d8q32sUP25lptpVEEau5PzHDipWa0fhkdkn6RDbRs0ei/S?=
 =?us-ascii?Q?LbuGBydQFgvf3PmOi5eNgwGMWXPzol9kf0ioXUbsdYESuiz09lrEEuWj+B5f?=
 =?us-ascii?Q?rW5OtxI259Z9zYCxhQVzm/3SWxPZj3W74nyAH4M0E/sNWK+KjEP8YShCHbi8?=
 =?us-ascii?Q?DixyrHs1kKkrqOG/eKwAGqPbXJKEzQBNySMGl6szkeouS25fDAWpux+Ff5Su?=
 =?us-ascii?Q?+Eagsn7I5U80oiYkeyAcTZFqRc7ZK1paVlez14yMw+QEzODvQBl7yEq8h6i3?=
 =?us-ascii?Q?MX9XqpzOGTU3gdu4Y666ntun1A5wl5+YB4swgO+s7bYidlE2WtZuUJDqdrB+?=
 =?us-ascii?Q?Ynjebg6xgoNRonYKF3MyxYTD9jRBc40f0GPW/ov+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 401e2d44-cecb-4440-f0fb-08de30dbfefd
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 13:17:36.7181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rbpGzcPHXnJoJQK4MAkkiQEjaqwH6pI7ZKEalAIq0wI0AQBOe9DjhP3+14SBQUxNmspxiQJjlpZI2++2fUWm4ETH6HCQY8LTdtDbuMee/x4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8260
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
> From: Sharma, Nishit <nishit.sharma@intel.com>
> Sent: Monday, December 1, 2025 2:34 PM
> To: igt-dev@lists.freedesktop.org; Sharma, Nishit
> <nishit.sharma@intel.com>; Gurram, Pravalika
> <pravalika.gurram@intel.com>
> Subject: [PATCH i-g-t v9 06/10] tests/intel/xe_multi_gpusvm: Add SVM
> multi-GPU performance test
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> This test measures latency and bandwidth for buffer access from each GPU
> and the CPU in a multi-GPU SVM environment. It compares performance for
> local versus remote access using madvise and prefetch to control buffer
> placement
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_multi_gpusvm.c | 244
> +++++++++++++++++++++++++++++++++-
>  1 file changed, 243 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.=
c
> index 6166795b3..efe3db099 100644
> --- a/tests/intel/xe_multi_gpusvm.c
> +++ b/tests/intel/xe_multi_gpusvm.c
> @@ -13,6 +13,8 @@
>  #include "intel_mocs.h"
>  #include "intel_reg.h"
>=20
> +#include "time.h"
> +
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  #include "xe/xe_util.h"
> @@ -64,6 +66,26 @@
>   *	Test concurrent write race conditions with prefetch to verify
> coherency
>   *	behavior and memory migration when multiple GPUs compete for
> same location
>   *
> + * SUBTEST: mgpu-latency-basic
> + * Description:
> + *	Measure basic cross-GPU memory access latency where one GPU
> writes
> + *	and another GPU reads without prefetch to evaluate remote access
> overhead
> + *
> + * SUBTEST: mgpu-latency-prefetch
> + * Description:
> + *	Measure cross-GPU memory access latency with explicit prefetch to
> + *	evaluate memory migration overhead and local access performance
> + *
> + * SUBTEST: mgpu-latency-copy-basic
> + * Description:
> + *	Measure latency of cross-GPU memory copy operations where one
> GPU
> + *	copies data from another GPU's memory without prefetch
> + *
> + * SUBTEST: mgpu-latency-copy-prefetch
> + * Description:
> + *	Measure latency of cross-GPU memory copy operations with
> prefetch
> + *	to evaluate copy performance with memory migration to local VRAM
> + *
>   */
>=20
>  #define MAX_XE_REGIONS	8
> @@ -81,12 +103,16 @@
>  #define MULTIGPU_ATOMIC_OP		BIT(3)
>  #define MULTIGPU_COH_OP			BIT(4)
>  #define MULTIGPU_COH_FAIL		BIT(5)
> +#define MULTIGPU_PERF_OP		BIT(6)
> +#define MULTIGPU_PERF_REM_COPY		BIT(7)
>=20
>  #define INIT	2
>  #define STORE	3
>  #define ATOMIC	4
>  #define DWORD	5
>=20
> +struct timespec t_start, t_end;
> +
>  struct xe_svm_gpu_info {
>  	bool supports_faults;
>  	int vram_regions[MAX_XE_REGIONS];
> @@ -131,6 +157,11 @@ static void gpu_coherecy_test_wrapper(struct
> xe_svm_gpu_info *src,
>  				      struct drm_xe_engine_class_instance
> *eci,
>  				      unsigned int flags);
>=20
> +static void gpu_latency_test_wrapper(struct xe_svm_gpu_info *src,
> +				     struct xe_svm_gpu_info *dst,
> +				     struct drm_xe_engine_class_instance *eci,
> +				     unsigned int flags);
> +
>  static void
>  create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct
> drm_xe_engine_class_instance *eci,
>  		    uint32_t *vm, uint32_t *exec_queue) @@ -220,6 +251,11
> @@ static void for_each_gpu_pair(int num_gpus, struct xe_svm_gpu_info
> *gpus,
>=20
>  static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
>=20
> +static double time_diff(struct timespec *start, struct timespec *end) {
> +	return (end->tv_sec - start->tv_sec) + (end->tv_nsec - start-
> >tv_nsec)
> +/ 1e9; }
> +
>  static void
>  atomic_batch_init(int fd, uint32_t vm, uint64_t src_addr,
>  		  uint32_t *bo, uint64_t *addr)
> @@ -370,6 +406,39 @@ mgpu_check_fault_support(struct
> xe_svm_gpu_info *gpu1,
>  	return ret;
>  }
>=20
> +static void
> +store_dword_batch_init_4k(int fd, uint32_t vm, uint64_t src_addr,
> +			  uint32_t *bo, uint64_t *addr, int value) {
> +	int max_cmds =3D (4096 - sizeof(uint32_t)) / 16;
> +	uint32_t batch_bo_size =3D BATCH_SIZE(fd);
> +	uint32_t batch_bo;
> +	uint64_t batch_addr;
> +	void *batch;
> +	uint32_t *cmd;
> +	int i =3D 0;
> +
> +	batch_bo =3D xe_bo_create(fd, vm, batch_bo_size,
> vram_if_possible(fd, 0), 0);
> +	batch =3D xe_bo_map(fd, batch_bo, batch_bo_size);
> +	cmd =3D (uint32_t *)batch;
> +
> +	for (int j =3D 0; j < max_cmds; j++) {
> +		uint64_t offset =3D src_addr + j * 4;
> +
> +		cmd[i++] =3D MI_STORE_DWORD_IMM_GEN4;
> +		cmd[i++] =3D offset;
> +		cmd[i++] =3D offset >> 32;
> +		cmd[i++] =3D value;
> +	}
> +	cmd[i++] =3D MI_BATCH_BUFFER_END;
> +
> +	batch_addr =3D to_user_pointer(batch);
> +
> +	xe_vm_bind_lr_sync(fd, vm, batch_bo, 0, batch_addr,
> batch_bo_size, 0);
> +	*bo =3D batch_bo;
> +	*addr =3D batch_addr;
> +}
> +
>  static void
>  gpu_madvise_sync(struct xe_svm_gpu_info *gpu, uint32_t vm, uint32_t
> exec_queue,
>  		 uint64_t dst_addr, uint64_t *batch_addr, unsigned int flags)
> @@ -391,10 +460,16 @@ gpu_madvise_sync(struct xe_svm_gpu_info *gpu,
> uint32_t vm, uint32_t exec_queue,
>  	sync.timeline_value =3D EXEC_SYNC_VAL;
>  	WRITE_ONCE(*sync_addr, 0);
>=20
> +	if (flags & MULTIGPU_PERF_OP)
> +		clock_gettime(CLOCK_MONOTONIC, &t_start);
> +
>  	xe_exec_sync(gpu->fd, exec_queue, *batch_addr, &sync, 1);
>  	if (READ_ONCE(*sync_addr) !=3D EXEC_SYNC_VAL)
>  		xe_wait_ufence(gpu->fd, (uint64_t *)sync_addr,
> EXEC_SYNC_VAL, exec_queue,
>  			       NSEC_PER_SEC * 10);
> +
> +	if (flags & MULTIGPU_PERF_OP)
> +		clock_gettime(CLOCK_MONOTONIC, &t_end);
>  }
>=20
>  static void
> @@ -411,7 +486,12 @@ gpu_batch_create(struct xe_svm_gpu_info *gpu,
> uint32_t vm, uint32_t exec_queue,
>  		batch_init(gpu->fd, vm, src_addr, dst_addr, SZ_4K,
> batch_bo, batch_addr);
>  		break;
>  	case DWORD:
> -		store_dword_batch_init(gpu->fd, vm, src_addr, batch_bo,
> batch_addr, BATCH_VALUE);
> +		if (flags & MULTIGPU_PERF_OP)
> +			store_dword_batch_init_4k(gpu->fd, vm, src_addr,
> batch_bo,
> +						  batch_addr,BATCH_VALUE);
> +		else
> +			store_dword_batch_init(gpu->fd, vm, src_addr,
> batch_bo,
> +					       batch_addr, BATCH_VALUE);
>  		break;
>  	default:
>  		igt_assert(!"Unknown batch op_type"); @@ -701,6 +781,148
> @@ coherency_test_multigpu(struct xe_svm_gpu_info *gpu1,
>  	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]);  }
>=20
> +static void
> +latency_test_multigpu(struct xe_svm_gpu_info *gpu1,
> +		      struct xe_svm_gpu_info *gpu2,
> +		      struct drm_xe_engine_class_instance *eci,
> +		      unsigned int flags)
> +{
> +	uint64_t addr;
> +	uint32_t vm[2];
> +	uint32_t exec_queue[2];
> +	uint32_t batch_bo[2];
> +	uint8_t *copy_dst;
> +	uint64_t batch_addr[2];
> +	struct test_exec_data *data;
> +	double gpu1_latency, gpu2_latency;
> +	double gpu1_bw, gpu2_bw;
> +	uint32_t final_value;
> +
> +	/* Skip if either GPU doesn't support faults */
> +	if (mgpu_check_fault_support(gpu1, gpu2))
> +		return;
> +
> +	create_vm_and_queue(gpu1, eci, &vm[0], &exec_queue[0]);
> +	create_vm_and_queue(gpu2, eci, &vm[1], &exec_queue[1]);
> +
> +	data =3D aligned_alloc(SZ_2M, SZ_4K);
> +	igt_assert(data);
> +	data[0].vm_sync =3D 0;
> +	addr =3D to_user_pointer(data);
> +
> +	copy_dst =3D aligned_alloc(SZ_2M, SZ_4K);
> +	igt_assert(copy_dst);
> +
> +	/* GPU1: Creating batch with predefined value */
> +	gpu_batch_create(gpu1, vm[0], exec_queue[0], addr, 0,
> +			 &batch_bo[0], &batch_addr[0], flags, DWORD);
> +
> +	/*GPU1: Madvise and Prefetch Ops */
> +	gpu_madvise_sync(gpu1, vm[0], exec_queue[0], addr,
> &batch_addr[0],
> +flags);
> +
> +	gpu1_latency =3D time_diff(&t_start, &t_end);
> +	gpu1_bw =3D (SZ_4K / (gpu1_latency / 1e9)) / (1024.0 * 1024.0);
> +//Written in 4K buffer
> +
> +	igt_info("GPU1 write with %s: Latency %.3f us, Bandwidth %.2f
> MB/s\n",
> +		 (flags & MULTIGPU_PREFETCH) ? "prefetch" : "noprefetch",
> +		 gpu1_latency / 1000.0, gpu1_bw);
> +
> +	/* Validate GPU1 performance */
> +	if (flags & MULTIGPU_PREFETCH) {
> +		if (gpu1_latency / 1000.0 > 5.0)
> +			igt_warn("GPU1 write with prefetch slower than
> expected (%.3f us > 5us)\n",
> +				 gpu1_latency / 1000.0);
> +	}
> +
> +	if (flags & MULTIGPU_PERF_REM_COPY) {
> +		/*GPU2: Copy data from addr (written by GPU1) to its own
> buffer (copy_dst) */
> +		gpu_batch_create(gpu2, vm[1], exec_queue[1], addr,
> to_user_pointer(copy_dst),
> +				 &batch_bo[1], &batch_addr[1], flags, INIT);
> +
> +		/*GPU2: Madvise and Prefetch Ops */
> +		gpu_madvise_sync(gpu2, vm[1], exec_queue[1],
> to_user_pointer(copy_dst),
> +				 &batch_addr[1], flags);
> +
> +		gpu2_latency =3D time_diff(&t_start, &t_end);
> +		gpu2_bw =3D (SZ_4K / (gpu2_latency / 1e9)) / (1024.0 * 1024.0);
> +		final_value =3D *(uint32_t *)copy_dst;
> +		igt_assert_eq(final_value, BATCH_VALUE);
> +	} else {
> +		/* GPU1 --> Creating batch with value and executing STORE
> op */
> +		gpu_batch_create(gpu1, vm[0], exec_queue[0], addr, 0,
> +				 &batch_bo[0], &batch_addr[0], flags,
> DWORD);
> +
> +		/*GPU1: Madvise and Prefetch Ops */
> +		gpu_madvise_sync(gpu1, vm[0], exec_queue[0], addr,
> &batch_addr[0],
> +flags);
> +
> +		gpu2_latency =3D time_diff(&t_start, &t_end);
> +
> +		/*GPU2: Copy data from addr (written by GPU1) to its own
> buffer (copy_dst) */
> +		gpu_batch_create(gpu2, vm[1], exec_queue[1], addr,
> to_user_pointer(copy_dst),
> +				 &batch_bo[1], &batch_addr[1], flags, INIT);
> +
> +		/*GPU2: Madvise and Prefetch Ops */
> +		gpu_madvise_sync(gpu2, vm[1], exec_queue[1],
> to_user_pointer(copy_dst),
> +				 &batch_addr[1], flags);
> +
> +		gpu2_latency +=3D time_diff(&t_start, &t_end);
> +		gpu2_bw =3D (SZ_4K / (gpu2_latency / 1e9)) / (1024.0 * 1024.0);
> +		final_value =3D READ_ONCE(*(uint32_t *)copy_dst);
> +		igt_assert_eq(final_value, BATCH_VALUE);
> +	}
> +
> +	igt_info("GPU2 %s copy: Latency %.3f us, Bandwidth %.2f MB/s\n",
> +		 (flags & MULTIGPU_PERF_REM_COPY) ? "remote" : "local",
> +		 gpu2_latency / 1000.0, gpu2_bw);
> +
> +	/* Validate GPU2 performance based on scenario */
> +	if (flags & MULTIGPU_PERF_REM_COPY) {
> +		if (flags & MULTIGPU_PREFETCH) {
> +			/* Remote copy with prefetch: expect 0.2-1us */
> +			if (gpu2_latency / 1000.0 > 1.0)
> +				igt_warn("GPU2 remote copy with prefetch
> slower than expected (%.3f us > 1us)\n",
> +					 gpu2_latency / 1000.0);
> +		} else {
> +			/* Remote copy without prefetch: expect 1-4us */
> +			if (gpu2_latency / 1000.0 > 10.0)
> +				igt_warn("GPU2 P2P remote copy is very
> slow (%.3f us > 10us)\n",
> +					 gpu2_latency / 1000.0);
> +		}
> +	} else {
> +		if (flags & MULTIGPU_PREFETCH) {
> +			/* Local write with prefetch: expect 0.1-0.5us */
> +			if (gpu2_latency / 1000.0 > 1.0)
> +				igt_warn("GPU2 local write with prefetch
> slower than expected (%.3f us > 1us)\n",
> +					 gpu2_latency / 1000.0);
> +		}
> +	}
> +
> +	/* Bandwidth comparison */
> +	if (gpu2_bw > gpu1_bw)
> +		igt_info("GPU2 has %.2fx better bandwidth than GPU1\n",
> gpu2_bw / gpu1_bw);
> +	else
> +		igt_info("GPU1 has %.2fx better bandwidth than GPU2\n",
> gpu1_bw /
> +gpu2_bw);
> +
> +	/* Overall prefetch effectiveness check */
> +	if (flags & MULTIGPU_PREFETCH) {
> +		if ((gpu1_latency / 1000.0) < 5.0 && (gpu2_latency / 1000.0) <
> 5.0)
> +			igt_info("Prefetch providing expected performance
> benefit\n");
> +		else
> +			igt_warn("Prefetch not providing expected
> performance benefit\n");
> +	}
> +
> +	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
> +	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
> +
> +	batch_fini(gpu1->fd, vm[0], batch_bo[0], batch_addr[0]);
> +	batch_fini(gpu2->fd, vm[1], batch_bo[1], batch_addr[1]);
> +	free(data);
> +	free(copy_dst);
> +
> +	cleanup_vm_and_queue(gpu1, vm[0], exec_queue[0]);
> +	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]); }
> +
>  static void
>  gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
>  		       struct xe_svm_gpu_info *dst,
> @@ -737,6 +959,18 @@ gpu_coherecy_test_wrapper(struct
> xe_svm_gpu_info *src,
>  	coherency_test_multigpu(src, dst, eci, flags);  }
>=20
> +static void
> +gpu_latency_test_wrapper(struct xe_svm_gpu_info *src,
> +			 struct xe_svm_gpu_info *dst,
> +			 struct drm_xe_engine_class_instance *eci,
> +			 unsigned int flags)
> +{
> +	igt_assert(src);
> +	igt_assert(dst);
> +
> +	latency_test_multigpu(src, dst, eci, flags); }
> +
>  static void
>  test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
>  	       struct drm_xe_engine_class_instance *eci, @@ -748,6 +982,8
> @@ test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
>  		for_each_gpu_pair(gpu_cnt, gpus, eci,
> gpu_atomic_inc_wrapper, flags);
>  	if (flags & MULTIGPU_COH_OP)
>  		for_each_gpu_pair(gpu_cnt, gpus, eci,
> gpu_coherecy_test_wrapper, flags);
> +	if (flags & MULTIGPU_PERF_OP)
> +		for_each_gpu_pair(gpu_cnt, gpus, eci,
> gpu_latency_test_wrapper,
> +flags);
>  }
>=20
>  struct section {
> @@ -775,6 +1011,12 @@ igt_main
>  		{ "coherency-prefetch", MULTIGPU_PREFETCH |
> MULTIGPU_COH_OP },
>  		{ "coherency-fail-prefetch",
>  		  MULTIGPU_PREFETCH | MULTIGPU_COH_OP |
> MULTIGPU_COH_FAIL},
> +		{ "latency-basic", MULTIGPU_PERF_OP },
> +		{ "latency-copy-basic",
> +		  MULTIGPU_PERF_OP | MULTIGPU_PERF_REM_COPY },
> +		{ "latency-prefetch", MULTIGPU_PREFETCH |
> MULTIGPU_PERF_OP },
> +		{ "latency-copy-prefetch",
> +		  MULTIGPU_PREFETCH | MULTIGPU_PERF_OP |
> MULTIGPU_PERF_REM_COPY },
>  		{ NULL },
>  	};
>=20
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
> --
> 2.48.1

