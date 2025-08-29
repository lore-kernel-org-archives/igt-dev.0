Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9672CA0EED
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 04:51:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F31E10E052;
	Fri, 29 Aug 2025 04:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="agdVwneJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85CC10E052
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 04:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756443108; x=1787979108;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BKQlXf2Nbopk8ELbRkg1Z+YxyrTdvwmKaOq0t2TN488=;
 b=agdVwneJMvzYobOeu4VQEhkhjEwxNcLc5YFi31CtFnFsQB4kx//vrYeL
 v4JdhazDKOCzJfZnGNRcHbQy35yj011fQt02SkN7FVok9T3jZlzDZAL01
 sZfBjiYfONB0zNxiBTM0e93Y8HhjcEnQ+1bpqQ1crFaInnP5c/XQZUzmk
 Oq866vSve4SzZoG4lpScvqxZI1FEh06HA2E0ySCliUCcCMy+XW/Ym0Qhg
 UDk4oHcuA4UU4WjBAqS02ABuIyMSwb4flW1gif1CiFOuWHMP05PaKmW75
 OpgM+ehRFLvUmch7QJnLhEpiCyJg2ANslforpMcpdvwrwAClvs6Pn1gAV Q==;
X-CSE-ConnectionGUID: c9ZHwhE2QviSkhqSLvmgGQ==
X-CSE-MsgGUID: Qhm1VrE1QnOKHP2l8EWbPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="61359428"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="61359428"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 21:51:47 -0700
X-CSE-ConnectionGUID: Qrh0tUzIRDGxzvAjjYoF2w==
X-CSE-MsgGUID: 88RPyUqKRlqtgE3FUE0dMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="171085166"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 21:51:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 21:51:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 21:51:21 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.44)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 21:51:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gpSY5gwanPbQKK+VWpsPFPQubWC28dj9mCfBv9NtlRzANAh22FJZQ+youJpFGHm+gAsW24p/Y5OH6BvEZZAvy1WtSdOhNLzNXqkB8RgX83KTQ51YvnCsv+Wd78EBmTfWDgSuUbSdBce/WuohdDZkZJclKYiTYbQGzsfKZcSYKZy7XNhZtOeZ/cI553j4g4uZWc1WewXz5VQPWbCQpZPLhEArM3BnaT1n6dMm1+9hCeKCjvOXJlHul9SioUIOBc4vOZ4zcWga5W03nIKend23FDobiNnuMRHFVVtYZUCUqBSmGSHTR/wch9aLYoMGiAK2bozJO7auXTYHmCUudLw8Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WooWGIlfN8wFe4XaaR1ZrQi1OgvGFGHn9Is3eXHXWew=;
 b=nyg/6+V46J+dhFD3O2XiuTqc1LtAShGiKAdzJd+AFgdEFS56EMo6m4lcOS0wzZ815mBz/0r3TJWKbOSjOvyDl4H5sI/+8kbKWTZqWfgYIeIRjmHxjNOT+JwUMSFbQhL1preJCuG4p8DuQu6QU0AhG9KfqgMNq0yLGpgQnItecPVXwLDUC5Y3D7SRj2hRhnuKicMYoQ4NCSfbdUhVgxViyhO67vVw3NdlfJauOjwKOAc1EnEcva8J427j8bXbw3hc70qevbzEQwcq1uuqVRM0B7BuSEom0vyG6acokh8v9vnmrPeergfKyS+Il4sepP0GB+I8PJiCd+/P5h0VM3bbqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH0PR11MB4950.namprd11.prod.outlook.com (2603:10b6:510:33::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Fri, 29 Aug
 2025 04:51:14 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%4]) with mapi id 15.20.9073.016; Fri, 29 Aug 2025
 04:51:14 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>
CC: "Siddiqui, Ayaz A" <ayaz.siddiqui@intel.com>
Subject: RE: [PATCH i-g-t 2/5] lib/xe: Added xe_vm_madvise ioctl support
Thread-Topic: [PATCH i-g-t 2/5] lib/xe: Added xe_vm_madvise ioctl support
Thread-Index: AQHcFmVI8W9hpzXIo06KJXjHIpoa7bR4KOUAgAAhRYCAAMT+0IAAAitw
Date: Fri, 29 Aug 2025 04:51:14 +0000
Message-ID: <BL1PR11MB5525AEAA8D76E19BFE0CEC04843AA@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20250826084133.897768-1-nishit.sharma@intel.com>
 <20250826084133.897768-3-nishit.sharma@intel.com>
 <BL1PR11MB5525B2D062096D41912C21F5843BA@BL1PR11MB5525.namprd11.prod.outlook.com>
 <MW4PR11MB715145027D1B8271642E3C48E43BA@MW4PR11MB7151.namprd11.prod.outlook.com>
 <BL1PR11MB5525138A26E45ABC34E9FE14843AA@BL1PR11MB5525.namprd11.prod.outlook.com>
In-Reply-To: <BL1PR11MB5525138A26E45ABC34E9FE14843AA@BL1PR11MB5525.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH0PR11MB4950:EE_
x-ms-office365-filtering-correlation-id: 703bdeda-26d3-426a-ef42-08dde6b7af10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?q58lI0JiexazVtTdZeDwa81rmHATQKjsuN2z/DVGc3b/zZGAfpYzfgUeB+qR?=
 =?us-ascii?Q?8e77Cu6+iuGIqHhymvnBTIe3J/jPd3eyDAW4FH97EtxYOTHAOmCN0sKsaZhC?=
 =?us-ascii?Q?d1QVptI1qBbQbNUoWw2L0K6CCbLctsOc5kgYqTZjPPTecKDuc0vnJBOMkhwY?=
 =?us-ascii?Q?TegXYcTbrIovP/zLVZ5/kTVTNfkGRCuZwy195uxPz6yf7eBwn1LReC7M7vyh?=
 =?us-ascii?Q?oCKk9JujgjaGvOFmD8fAujNPRaBEafPwjr/Ih9pYsRH7I/3jfRH5Bwk4R8pe?=
 =?us-ascii?Q?T5hLIs1QiY62IWl6Il2sDGNDUUSPceXMDgNknVezrQ+1jBW8jYN+2EQAnxUE?=
 =?us-ascii?Q?ViUurPIfSS8G7EyqT2yncXOr/dHGW2LZ6SmyJvx+Gc6yiLX0KoxK0lCYXR41?=
 =?us-ascii?Q?4TZmZ5cvrmHIbkYW7YYry4Lx2Vuw5s0B5NI7JcZWax64EeJ9+GYLYrJ4ddKU?=
 =?us-ascii?Q?3NLFC1aRE9gtQPIhoHTGLkowMBxZmtaz2XPXMjKzBpQH1xnHAbTQwBoTKy5a?=
 =?us-ascii?Q?QGrdeBx+6El6yzDHgkcsRfbjb5YQCb2GXCCjM2wpoPdz0TdjxoRcosnYMCqY?=
 =?us-ascii?Q?H9Jm22deLbSlCcZmeZkXxZGX/01JdmFuu4GUMrshjNuot55won6wQJXESe1G?=
 =?us-ascii?Q?zVruWNfaQyO4RQpnnPS9VN6sOM9+BIyJRUH2/OCF20jzJi1yR04naLfqMpOV?=
 =?us-ascii?Q?xSqR73JgcCT92TkjmJKx+pUbHfzpmDMdTv6gctY7v1AVsbB5FWS32/vxKlU3?=
 =?us-ascii?Q?jYay6F2mksY5+4pXnnyEvoFe1V7USECt8WmLtW1hd5SQsxiHOBakwAX8hVAh?=
 =?us-ascii?Q?iC9XsQ0Jdd/egWicavoNAfB43SRyfTyGyDDhADv8w/I3qB7JCfnClPa9gxUe?=
 =?us-ascii?Q?VMdv9jfp7Tf+YUUluzNuCpdyxqtiuXH53dFft2NgxdzTwCMUqDTld+3w+u/+?=
 =?us-ascii?Q?t5L2eHrK1XQ9N9BpC3obXjTYRgGJdDHN2UG9ZyOGo9aMg6ggFPHEjofuosS8?=
 =?us-ascii?Q?MyijJvEiEpngQWfpT4VbROsOUY3mvzXVWs2bpjFMQ8gGhlehpnyKv4JQoj78?=
 =?us-ascii?Q?RveTofgToS3wsqb+ue7m3Uc++i120VTza9L01p6deZqElZq1U52snj8l2U8+?=
 =?us-ascii?Q?UzexYDMGlKdIV7kDL/F/kEm3iZXvl+tzbQIhOcI4iWd0x9XlMNQsx2Bps7Pt?=
 =?us-ascii?Q?rOVW/2Rr0dLZWfkaxSYDhzksK3iEihzgI4ThbL3hWgu+ZrrUmnoYcbL1iN27?=
 =?us-ascii?Q?hCkSKgzOMahwgGOx7/Mr+bAiGAY8VcMMJt7sbKMwlPi69roUEQPtBFJnzUCV?=
 =?us-ascii?Q?/VxhNIU1+gQcxUAawre9fg4SVHZdSKuQGiz/kDQduG5hO/JPAZkwjFr2xPoB?=
 =?us-ascii?Q?EDeEToe8/w2luYAUuwljYfwxHJi9xq8sQ4XdLZENSOiHYiG9s5KaH/Ax2c4J?=
 =?us-ascii?Q?WPbysCyRPVVP9+jX5d4iihByVnq+iBy69STG8H45qx/rGnCIzzjVVsVuIKXo?=
 =?us-ascii?Q?59Uy2U3S6Ed0oxQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?T4u23MO7VkcrCYIrXSnU6LIktxpecXXFPwGxegPoHR/XXKwWnVmjO1WpgUto?=
 =?us-ascii?Q?5y8B0jKm9/XVJMieAPLacROQuAl5dstX36khYuqa+4u25CXF6H8NVtA5Bas/?=
 =?us-ascii?Q?SzyxjF5YuDGvYZv0jUJLpfVdVMlFf75XQNxw0E75ZiURxDoiOUWpppNkyYP7?=
 =?us-ascii?Q?tNxWLrZ7SRLmtRkrpklN+xbPUAZTOOanHzC2PdBMeYM7raR5DOUeDY5pyu8y?=
 =?us-ascii?Q?Ax1GRfwczdadNaztlwHnIq06ONINXQZiF5wsJXhTbFrlzjVSdwhUOFQl8UQw?=
 =?us-ascii?Q?++XcKX2Jmr0Oi/jZo6fWNecqkyb09ADwCHw/YoNZzGSv5rnseNXsOtEqmZO1?=
 =?us-ascii?Q?3qiilcGbR4Rfx69Qj3Lf6slcsRKKS6qQHVPxYANI9KjKOHTdRotKcffMAHFO?=
 =?us-ascii?Q?Tl8AZaWqNRvpSMqK3GWpc/TGyfSAg1dCmtgP8+qJr0KZfZFJbPNtPNLoAnal?=
 =?us-ascii?Q?QJ7pDFLhZ0+v4qC0vmf07GufP0LJjZhHOwTGGetLYfMRt8KiFTEB6LiOYvYt?=
 =?us-ascii?Q?MRD09d45ZorB5hcjViY8eQrwDWESVlHs/VPbtyXUJF0Z2i3nEPGZ5n62OuEx?=
 =?us-ascii?Q?MJ7uX89hUspJ2OG7hUPuByH4iWRJUWhSKifVdehs/hjp1pau6YFjNJL2iU/h?=
 =?us-ascii?Q?bLgofWc78TOk97GtifF7LCejleZ76UvrtqdI2TZ6XiqiqsUkdvMTQXJZoruM?=
 =?us-ascii?Q?Q6y5iSSQTd325+Ql5FMWS/NuYpJR+KECq5rf1MWvHPHOtGabBtAkGSK0AzPD?=
 =?us-ascii?Q?EWmU+Xw94gWAagO295YDJV5hZ3PLTGjkWD0vW72wzDPICkf/tS+vlm7U7Psy?=
 =?us-ascii?Q?EbMrbGirOo0XUACyxLPlZ0CdZ1xxEqNDcjpiGK4BYeyQNSh7Jk3MfE8yZhZq?=
 =?us-ascii?Q?8BgJnihpO9rgVp50/9OHdXgeaWh36BDILoyovW5wv4qTTo+g5I+e4GEgoJdx?=
 =?us-ascii?Q?c2FwgyN0UkEKhNJjBRKkTjfFQi3tB5hFQqLBLcYSTlcyrdlmhD7EUQqylSXv?=
 =?us-ascii?Q?tjIfb1PVHMBXmnv2GSeXRor+M7zSgQXGG2qCEILAxT27jcQF9AmO+f1EYX1A?=
 =?us-ascii?Q?zlDGRi8v65K1JI2oeE9cJzByV5UnkXH338pgqLl4OUHasIAHsBJ6lZ2a8/If?=
 =?us-ascii?Q?eZc1bbfKTKmvN7TgqGPglYjriR+/KRu/enDgQqkdZnEdPhjRjz+EXf9p0XbS?=
 =?us-ascii?Q?ky466hEMoqTvVz7lc/DwdLfDEQyAc9QEIYP8jBPb8RmDmOibHHRm9BVer87D?=
 =?us-ascii?Q?elugevZayhDjPiaTCGnQ8liStqrWD9x3x03DRjXFibOoy3gvi/T7y7RCRbsa?=
 =?us-ascii?Q?9nqbVIOk95eeVNlZrpZPZkxBGWfP3AWCUwqI7w4CIh3zA3LqwOvwstUrPM7m?=
 =?us-ascii?Q?aZKeQmzDpXQl6jx8bh8SNPmhb87zdJqoGLQGZ1u8u2lpZT8M3WQSM1YNL8Zu?=
 =?us-ascii?Q?yHht8sdk2pfyuqiBNHWi+1b4VQNrbavUwZgaSOLJ/hSjVgrLjKPLE3ehKud2?=
 =?us-ascii?Q?8R5ASMjxUth/sJfJsgaaHrvLvm8UPyOS6Wjsm9rUj8qlumSNnyE+PwF4qtvt?=
 =?us-ascii?Q?+I0pVz6dmnu0ONqQcpioz7dHp8eVUiHvyC3O2JkA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 703bdeda-26d3-426a-ef42-08dde6b7af10
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 04:51:14.6764 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rRYUVAHvoq6s6rZim5B4Xep8mlVL66mBu1LgoYhYOlqoeLH9tvFe+op+Bf+q98hGh0DrY5f6ZsJT/5PYJtksJ4T7Yfo3rVTfM8H0wLfHYNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4950
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Gurram=
,
> Pravalika
> Sent: Friday, August 29, 2025 10:09 AM
> To: Sharma, Nishit <nishit.sharma@intel.com>; igt-dev@lists.freedesktop.o=
rg;
> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>
> Cc: Siddiqui, Ayaz A <ayaz.siddiqui@intel.com>
> Subject: RE: [PATCH i-g-t 2/5] lib/xe: Added xe_vm_madvise ioctl support
>=20
>=20
>=20
> > -----Original Message-----
> > From: Sharma, Nishit <nishit.sharma@intel.com>
> > Sent: Thursday, August 28, 2025 10:18 PM
> > To: Gurram, Pravalika <pravalika.gurram@intel.com>; igt-
> > dev@lists.freedesktop.org; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> > <matthew.brost@intel.com>
> > Cc: Siddiqui, Ayaz A <ayaz.siddiqui@intel.com>
> > Subject: RE: [PATCH i-g-t 2/5] lib/xe: Added xe_vm_madvise ioctl
> > support
> >
> >
> >
> > -----Original Message-----
> > From: Gurram, Pravalika <pravalika.gurram@intel.com>
> > Sent: Thursday, August 28, 2025 8:23 PM
> > To: Sharma, Nishit <nishit.sharma@intel.com>;
> > igt-dev@lists.freedesktop.org; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> > <matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> > Cc: Siddiqui, Ayaz A <ayaz.siddiqui@intel.com>
> > Subject: RE: [PATCH i-g-t 2/5] lib/xe: Added xe_vm_madvise ioctl
> > support
> >
> >
> >
> > > -----Original Message-----
> > > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > > nishit.sharma@intel.com
> > > Sent: Tuesday, August 26, 2025 2:12 PM
> > > To: igt-dev@lists.freedesktop.org; Ghimiray, Himal Prasad
> > > <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> > > <matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> > > Subject: [PATCH i-g-t 2/5] lib/xe: Added xe_vm_madvise ioctl support
> > >
> > Use ] lib/xe:  Add xe_vm_madvise ioctl
> >
> > > From: Nishit Sharma <nishit.sharma@intel.com>
> > >
> > > Added xe_vm_madvise() which issues madvise ioctl
> > > DRM_IOCTL_XE_MADVISE for VM region advising the driver about
> > > expected usage or memory policy for specified address range. MADVISE
> > > ioctl requires pointer to drm_xe_madvise structure as one of the
> > > inputs. Depending upon type of madvise operation like Atomic,
> > > Preferred LOC or PAT required members of drm_xe_madvise structure
> > > are initialized and passed in MADVISE ioctl.
> > >
> > > Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> > > ---
> > >  lib/xe/xe_ioctl.c | 56
> > > +++++++++++++++++++++++++++++++++++++++++++++++
> > >  lib/xe/xe_ioctl.h |  5 ++++-
> > >  2 files changed, 60 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c index
> > > 1e95af409..43bad8452
> > > 100644
> > > --- a/lib/xe/xe_ioctl.c
> > > +++ b/lib/xe/xe_ioctl.c
> > > @@ -585,3 +585,59 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr,
> > > uint64_t value,
> > >  	igt_assert_eq(__xe_wait_ufence(fd, addr, value, exec_queue,
> > > &timeout), 0);
> > >  	return timeout;
> > >  }
> > > +
> > > +int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t ran=
ge,
> > > +		    uint64_t ext, uint32_t type, uint32_t op_val, uint16_t
> > > policy) {
> > > +	struct drm_xe_madvise madvise =3D {};
> > > +
> > > +	madvise.extensions =3D ext;
> > > +	madvise.vm_id =3D vm;
> > > +	madvise.start =3D addr;
> > > +	madvise.range =3D range;
> > > +
> > > +	if (type =3D=3D DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
> > > +		madvise.type =3D DRM_XE_MEM_RANGE_ATTR_ATOMIC;
> > > +		madvise.atomic.val =3D op_val;
> > > +	} else if (type =3D=3D DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC) {
> > > +		madvise.type =3D
> > > DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC;
> > > +		madvise.preferred_mem_loc.devmem_fd =3D op_val;
> > > +		madvise.preferred_mem_loc.migration_policy =3D policy;
> > > +		igt_debug("madvise.preferred_mem_loc.devmem_fd =3D
> > > %d\n",
> > > +			  madvise.preferred_mem_loc.devmem_fd);
> > > +	} else if (type =3D=3D DRM_XE_MEM_RANGE_ATTR_PAT) {
> > > +		madvise.type =3D DRM_XE_MEM_RANGE_ATTR_PAT;
> > > +		madvise.pat_index.val =3D op_val;
> > > +	} else {
> > > +		igt_warn("Unknown attribute\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > Uses a switch for clarity and extensibility Initialize the struct with
> > designated initializers. "Please refer ___xe_vm_bind"
> > __xe_vm_bind initializes struct drm_xe_vm_bind and struct
> > drm_xe_vm_bind doesn't deal with different type of attributes The
> > struct drm_xe_madvise have different type of attributes like preferred
> > loc, atomic hence have different members. So structure Member
> > initialization is different in this case
>=20
> Please use space on replay to differentiate
>=20
> We can assign the remaining members like below, and type can be maintaine=
d in
> switch case.
> can you please check if this works
> -------------------------------------------------------------------------=
---------------
>     struct drm_xe_madvise madvise =3D {
>         .extensions =3D ext,
>         .vm_id =3D vm,
>         .start =3D addr,
>         .range =3D range,
>     };
>     switch (type) {
>     case DRM_XE_MEM_RANGE_ATTR_ATOMIC:
>         madvise.type =3D DRM_XE_MEM_RANGE_ATTR_ATOMIC;
>         madvise.atomic.val =3D op_val;
>         break;
> ............. add here rest of the cases -----------
> -------------------------------------------------------------------------=
-------------------
> Pravalika
>=20
> > > +	if (igt_ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise))
> > > +		return -errno;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * xe_vm_madvise:
> > > + * @fd: xe device fd
> > > + * @vm: vm_id of the virtual range
> > > + * @addr: start of the virtual address range
> > > + * @range: size of the virtual address range
> > > + * @ext: Pointer to the first extension struct, if any
> > > + * @type: type of attribute
> > > + * @op_val: fd/atomic value/pat index, depending upon type of
> > > +operation
> > > + * @policy: Page migration policy
> > > + *
> > > + * Function initializes different members of struct drm_xe_madvise
> > > +and calls
> > > + * MADVISE IOCTL .
> > > + *
> > > + * Returns 0 if success and asserts otherwise.
> > > + */
> > > +int xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range=
,
> > > +		  uint64_t ext, uint32_t type, uint32_t op_val, uint16_t policy)
> > > {
> > > +	igt_assert_eq(__xe_vm_madvise(fd, vm, addr, range, ext, type,
> > > op_val, policy), 0);
> > > +	return 0;
> > > +}
> > > diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h index
> > > 6302d1a7d..a5996cf65
> > > 100644
> > > --- a/lib/xe/xe_ioctl.h
> > > +++ b/lib/xe/xe_ioctl.h
> > > @@ -99,5 +99,8 @@ int __xe_wait_ufence(int fd, uint64_t *addr,
> > > uint64_t value,
> > >  		     uint32_t exec_queue, int64_t *timeout);  int64_t
> > > xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
> > >  		       uint32_t exec_queue, int64_t timeout);
> > > -
> > > +int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t
> > > +range,
> > > uint64_t ext,
> > > +		    uint32_t type, uint32_t op_val, uint16_t policy);
> >
> > Both functions currently use the same parameters. Are there plans to
> > modify __xe_vm_madvise in the future?
> > If not, is there a reason to maintain two separate functions with same
> > arguments?
> > Idea was to follow calling conventions as other function. E.g
> > xe_vm_bind_async() and also ioctl is called from different Function
> > for better readability.
> >
> > --Pravalika

Having two functions with the same signature (like __xe_vm_madvise and xe_v=
m_madvise) is usually done for below reason
The version with a leading underscore (__xe_vm_madvise) is used as a intern=
al helper,
and the non-underscored version (xe_vm_madvise) is the public API exposed t=
o other modules.
in vm_bind also we are adding extra arg, but i think we can maintain two he=
re in future if needed we can change underscore one which is internal helpe=
r
e.g :
-----------
void xe_vm_bind_async(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo=
, uint64_t offset, uint64_t addr, uint64_t size, struct drm_xe_sync *sync, =
uint32_t num_syncs)
void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t exec_queue, uint32_=
t bo, uint64_t offset, uint64_t addr, uint64_t size, uint32_t op, uint32_t =
flags, struct drm_xe_sync *sync, uint32_t num_syncs, uint32_t prefetch_regi=
on, uint64_t ext)
-------------
--Pravalika
> > int
> > > +xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
> > > +uint64_t
> > > ext,
> > > +		  uint32_t type, uint32_t op_val, uint16_t policy);
> > >  #endif /* XE_IOCTL_H */
> > > --
> > > 2.43.0

