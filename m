Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D630CA0FF2
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 10:47:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E941110E136;
	Wed,  3 Sep 2025 10:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PBbtfk4v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2737810E136
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 10:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756896445; x=1788432445;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=pW4mpUa022RUUo5QsmqHIbtLX7Sg1l3BFxWkvGe1Xp0=;
 b=PBbtfk4vy9qUUJxXknDG1tyBLIBpdrpdlZpND4ixfBPS2mVSmKrECkSl
 KG5uldnQk2JHp+03xx6Wtv80Ivb4nsFIonIKo8DeZQT5EvmFcHBXAgsm0
 0N/nIoUqLV105emqDa/6uwJlQ/DLAIpSTnFbqDxZOm3TAmOx25uURL8ea
 SIGURLFm1LpCp4jEexiMqbV3l3kb+It/W+vTBKO+OjdEjUZoTqx6t6VdQ
 mbivIODR0rnDLv4WjTjggacUfXnk457QDsjkSKtqo4myTdN9xjpoZWrAn
 yLwX7+qbVtVGNbUC1Isjie/4DrJGgq70sp5x/BTskCTqQyPsQipBhvYA3 w==;
X-CSE-ConnectionGUID: ZluEJgDMQrCV7lFB9sQSyQ==
X-CSE-MsgGUID: X+N+DUD4SiKPc9ddmXr/nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="70304295"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="70304295"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 03:47:24 -0700
X-CSE-ConnectionGUID: tk/0qnppTp+qmo4rQnHong==
X-CSE-MsgGUID: N15i46s7T2CZ31sFN9yo/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="171110484"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 03:47:24 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 03:47:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 03:47:23 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.53)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 03:47:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnVPcpcGaJjPGGAI9v9zx8YpJOUk5T7bOO/IPCK1ohl4Y1d0qgdZ4YefqKu9wUYwtE5MQkyJUCCbWrPtoA1Iw/yFrTE5blT+jOB3KiqUW1S69JtfX9m6oTm6LC18nzFp9KHBSC77qq7/2PtxoD5P06abStzpTeeaAm8iHzmFu3jWMqhp8ZlVmu5miX8zlQULBaJX4UWxHaWcdT2jw0o/xSxlLSU4ZzKRBCmSfQBXUX/1UbU2CmZ1JJAkwDTp7RPATeXMoAUC0xai6V7N2nMcDBKQ81rxaenRYoMnPVfbeF4Zrz3GleQZrqn0V48+dKI46Wen9EOElmHQHmdPGB6P0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCjXqgaxhlrCY6Ar9mLCxyr2FSIjED77p+J74+N9FKo=;
 b=JRswFr+OSYCoNPJIN8mBaETEoiZO0lusELoFzE5LnsevJvKU4Aha1SKlKODchxTXWVKCdqmmGpArn+kxyABOKySROsqepH0R/1fsVe4vlLluRXf1Uap9w8bM0FjVGLbJRjSxXSNN0D+3EmbXHvDNBCI+KlGxvI2v9U4MwESckN8sYueI588JfZ4KTCTDqppV/O8n1eDc1XOX97tuC+7Gsh8VTFTXIY3aSrbMcHn11lcWATzQ01xQPPzl5OKOLgkdqf4yRxG3E6e+qzX2w0ChxhC6N0n50k0GJvaKFintnXs7q1jZYq4zz5oxqh5rQrqoFt+HACET2+igPleZ7Ab9Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by BL1PR11MB5270.namprd11.prod.outlook.com (2603:10b6:208:313::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Wed, 3 Sep
 2025 10:47:21 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%4]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 10:47:21 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH i-g-t v9 5/5] tests/intel/xe_exec_system_allocator: Add
 atomic_batch test in IGT
Thread-Topic: [PATCH i-g-t v9 5/5] tests/intel/xe_exec_system_allocator: Add
 atomic_batch test in IGT
Thread-Index: AQHcHL7KAwRaQJEYLEmUv6eCp59ae7SBRoww
Date: Wed, 3 Sep 2025 10:47:20 +0000
Message-ID: <BL1PR11MB55252041690535D7A74DC63E8401A@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20250903103716.1780404-1-nishit.sharma@intel.com>
 <20250903103716.1780404-6-nishit.sharma@intel.com>
In-Reply-To: <20250903103716.1780404-6-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|BL1PR11MB5270:EE_
x-ms-office365-filtering-correlation-id: 26d96281-35c1-4a94-9dd5-08ddead7426e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?3fN9Z2Emp1TvMvvGpyfiT3fnhjMK7dYi3zppOjKxDGAH/WnUjZgJ5zsZD9S/?=
 =?us-ascii?Q?c8jSmN18oWFOMOPtKDfl1jMArY5wCnszwNYK+SyKY+dUotQuaIEmWtUHIQjl?=
 =?us-ascii?Q?KF4pH7V7B3bDQbgxFGxqty6UyQwEBhHUZIcK2GKTXeI0Pd6GyxM4eEB3ZjED?=
 =?us-ascii?Q?tVudvf4ZTBHJuC818cg5cyK3VhWw72dllkO0UIyrIDWlgHEzIX/8nvRhc60+?=
 =?us-ascii?Q?7Hqi7ihL6sYiayP5oZ3/vdBMHnW5TNs7v0kaoOakKFqpqpPcAELeKdQCz12M?=
 =?us-ascii?Q?keVpHG9kcBwZ/066aRb365B/3jH3VHGhDnbHmjlfnySSqNVmTrwKIpZ6Jqy0?=
 =?us-ascii?Q?QNZWHGB5NQrJbmGOcNzFthDB5fF84FOxBkIPY6Nsjim/tiu/QbKtg+m6Lp0j?=
 =?us-ascii?Q?lmdxdIrsu1C6/jgRtyrKEp7hpscbNALG3Y3CuC5K3VN7RnC+mcCLMdJ1RlS8?=
 =?us-ascii?Q?PlB6x0943f64tD2Ezw1RzcFGQllMYQnFNK4bttD4eHCkEqe7EaAQ9wHNwTKw?=
 =?us-ascii?Q?2TeZcTGq0J6FN1wlbCpDnQ8YnIaRxfCm/DHuXEEe3MN4CcImexk5HJbYbRsV?=
 =?us-ascii?Q?YLy0pUR6vVz/fB0quZ085lDN6iwDMPD2VsqBQ68EFHiHs+exsZ6OLKHv1q/3?=
 =?us-ascii?Q?v00dQEIuc3JDMQQ4FIRmR0x7jvIpX6BtYgtMtmnX3FWjlTDe7w9ow5RDR9WF?=
 =?us-ascii?Q?a3PoQIOcY9EaewJFRLX/mPs0Yhv02Jag3p7EXO3ncQqBw5BUaMuIdnWnYHXN?=
 =?us-ascii?Q?YTXa90vc24xjX/esti5828RFzy3tLJ4H2/4/Y6YREeYnbPBxNiHD0jPA6Mm9?=
 =?us-ascii?Q?ZQPwQcBo4qKQwsSqeiI9Hzya0IbywDRwwhYLB9oesXlKqbBtLnnqnS430dEC?=
 =?us-ascii?Q?XWXHgUeyv5bZIT6edoIDKURip9DCDGniTsOzepJpDoUHRge+7UZWRiXUstSg?=
 =?us-ascii?Q?3FTBka5MWRjifCgpjIx9lwDBiBWEJ9bvfbcieSw92cU+lFPVyjWxLhomZll8?=
 =?us-ascii?Q?HGNvkFidRB0dfC6bPGysxSrztNemgGFdL1mIJYYRlUd2euEwXnhDIU00vFjP?=
 =?us-ascii?Q?GX43MNLfPljP4tKkc3XbJ+fItm+gPTqb2SYch87t6CFRI6/DKFhvZeT3ntZC?=
 =?us-ascii?Q?TbJEJQyWdS6hHQUcvg08ygv8FeunLd2kzWXpn0oSyWY3UQvevO5aZWwVWXQ+?=
 =?us-ascii?Q?kN5dOFdB265Jxk5PUIhGfzOs95rLABnMZvY4ysRz7crQk+dJMkRAhPM2ezoZ?=
 =?us-ascii?Q?/amgQ3kMNXEVsrBf+ddRDPnOpdvE6ZPU+eUigWCuB3raqHON1i60dgsZsJm0?=
 =?us-ascii?Q?3xCt1lepExGzsbWhSOmm1HbqiU+2uMLe02+2S927Pi8x2eP1Rr0fbeCTUhYt?=
 =?us-ascii?Q?X163Dk/WcKxZKxR1hb46rafh0+3tseFk3M8gcDeK8hY+y+GaWeEPQrece6ov?=
 =?us-ascii?Q?gvop2Ox3Ciy/6G72+KePKrvJ4JjS+wT9TGGzF8nx/apKliXBAEp13G023xyn?=
 =?us-ascii?Q?7PLvOT9EpIYCkDM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?i9NHyoysU3YN7/HiseAl4athMNdaQZMfKA7+XOa3lbJaW89t4bso0YZItG+X?=
 =?us-ascii?Q?SNzwaLUnxVOA7TJ7C6Y7u3seHwWY/PIphdpNSXcRIsfE33dprhbQrnLeaVBS?=
 =?us-ascii?Q?EA4aonsfl3wRw8KO1t5xuS0Tcml4I1yX22gjRxEFDK8BoDTDSlC2AqiWZIXV?=
 =?us-ascii?Q?gG24p9qNOmPDaBSozFq0Ny7L1dRgGmLmOSdiwrDliGmOJxYhNZHgMw/vx3T1?=
 =?us-ascii?Q?TiWY2QWpKuM/ENFTmLqy9Fi85qYN9dM5JiJTNEArSrvimpsgodWz1GEvSKOa?=
 =?us-ascii?Q?z8uJ0N1wK3BwqsIt2o+DLXiLMeIGLkIDidzwIT3/xFIdMMR8n3haddJ4fZ5s?=
 =?us-ascii?Q?h0NiiLwrZtZ/Nxzbb6yu/OJOqnNChE+ltcHYRWvS70u9UPJAUmWo5OnQR1xW?=
 =?us-ascii?Q?t5wJUWK6c6k97L7o/dGI832zi+4wIsdCaTk21WJ34nsbbCUmSOuiq5k0WJyQ?=
 =?us-ascii?Q?3sf8os9d6VuPRNi4hwV/Uqf21gNsUGb4weJN5O/vPv8KqGqRcCU7kHSV8n2w?=
 =?us-ascii?Q?/y/HGc0yWuFJFoLwDkM2TBafK9sKmJRCGC5mkx4bzv5AB2M4iDtvCXQO/stU?=
 =?us-ascii?Q?agMSKGzKvMoLxaXzKf2MxOoKKV+GcXdC6UtrgrOjA1W21nIxs/WKnQmcT5PX?=
 =?us-ascii?Q?JNiC7axyrvxoyLYykrYzjPyB/naYz1VfZSGuIFFZfYjSxd6YXftePUHe5wcT?=
 =?us-ascii?Q?iDgQWnVXk/9mNvhampdqI0vQ5BN0IclTrhwSiMn035SsGfdmYbZwIgLOOMcr?=
 =?us-ascii?Q?E6BFlIs3fYGDyoOgntNXygXwqW4woxeTH4BOPQKEjViiJ0a8sxh8kADIdFIY?=
 =?us-ascii?Q?ZXbZt+CaM0krsugv4UGOzlk+942g5x+9ag76BNOBRzBm2ZLVoGdLh62kvcG/?=
 =?us-ascii?Q?Vnox/4ATinnLQkQ3fwVoAd+XuVUnH1URmTc85gPnrivrFEMtey2L2/1Uxs4s?=
 =?us-ascii?Q?tk4fnanV2wURZvBNr01xbyqBHcO2C3o88oOCuF6SqkYqAtKN0mdaCnaCvBwa?=
 =?us-ascii?Q?XAuOQfVEwtic3EG+qe9qEpuNZTb/Zp4c1LxEjw/DBdXC2OLlVwqX3PP5TgG3?=
 =?us-ascii?Q?wS5LNXUZSm1H3XM6Atdu40cOl5e8y2gP+WmkWLxUELvB8cqkBdG15WmFToVQ?=
 =?us-ascii?Q?yPd4lCECvVBNzTJ2drS1V7NgKHr9OSXPmGLRYMR5Tjhv716Vys3GPVJakOwM?=
 =?us-ascii?Q?yo1B6P06rPV6BQbuMibmfyqs0qIM3PVGu8cOH4vaQrVUxjfeN6d2nu0lfIh6?=
 =?us-ascii?Q?HY7QtuDe3rtbmpOtdGpR+0DyAUfBebdnVm6Ff3e99z7C8G/v5j0q+xNVaXJP?=
 =?us-ascii?Q?khykE6Yx1oAH9XST+o185aQCQVwwFEGCJkETF8lipu45FwjaCGzbgZ7POn3k?=
 =?us-ascii?Q?jEBrWXoKD2MKBO2kyGedCaLxDVAwkHusj1vS2awdMaGLriAe0lPIbMQBErdy?=
 =?us-ascii?Q?j/7F43lqBc/76oKDPmXrxcU1Z8eREuZ0ry8Allww81OeizhIZg2GZ8nNoW6d?=
 =?us-ascii?Q?4hUq4LIUNl+XLzqjkdqhsvmgfB1kZj2DDPQ8Yw6BpcY7cQVw3hVqCy+k7lC8?=
 =?us-ascii?Q?CU96w/b5+a2aO3oaFVGbhCJ/sXEt6s1omHh8j0AtZLKFmggnD0AHqyCPCgSY?=
 =?us-ascii?Q?/g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d96281-35c1-4a94-9dd5-08ddead7426e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 10:47:20.9808 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KGhYR2VTEkn94bVyH3nb+v0z33rSW3QP1DjPeSo1sIM/KDoY2S+GOfCx5TAzHMxvuT/dhXsBPoj4UmklqthE7bv7P8BgUQR56ujxq4s7PG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5270
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
> Sent: Wednesday, September 3, 2025 4:07 PM
> To: igt-dev@lists.freedesktop.org; Gurram, Pravalika
> <pravalika.gurram@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> Subject: [PATCH i-g-t v9 5/5] tests/intel/xe_exec_system_allocator: Add
> atomic_batch test in IGT
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> ATOMIC_BATCH flag is introduced when true MI_ATOMIC | MI_ATOMIC_INC
> operation will be called. This will avoid writing another function which =
performs
> atomic increment operations. ATOMIC_BATCH flag is passed as argument in
> write_dword() if true then value will be written on passed address and
> incremented by ATOMIC_INC operation. For all memory operations this flag =
will
> be used to verify if ATOMIC operation is working or not.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 403 ++++++++++++++++++++++---
>  1 file changed, 366 insertions(+), 37 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_system_allocator.c
> b/tests/intel/xe_exec_system_allocator.c
> index 4a208f6d8..4d0c1047a 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -17,6 +17,7 @@
>  #include <time.h>
>=20
>  #include "igt.h"
> +#include "intel_pat.h"
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_compute.h"
>  #include "lib/intel_reg.h"
> @@ -31,6 +32,15 @@
>  #define QUARTER_SEC		(NSEC_PER_SEC / 4)
>  #define FIVE_SEC		(5LL * NSEC_PER_SEC)
>=20
> +struct test_exec_data {
> +	uint32_t batch[32];
> +	uint64_t pad;
> +	uint64_t vm_sync;
> +	uint64_t exec_sync;
> +	uint32_t data;
> +	uint32_t expected_data;
> +};
> +
>  struct batch_data {
>  	uint32_t batch[16];
>  	uint64_t pad;
> @@ -38,6 +48,7 @@ struct batch_data {
>  	uint32_t expected_data;
>  };
>=20
> +#define VAL_ATOMIC_EXPECTED  56
>  #define WRITE_VALUE(data__, i__)	({			\
>  	if (!(data__)->expected_data)				\
>  		(data__)->expected_data =3D rand() << 12 | (i__);	\
> @@ -54,10 +65,19 @@ static void __write_dword(uint32_t *batch, uint64_t
> sdi_addr, uint32_t wdata,
>  	batch[(*idx)++] =3D wdata;
>  }
>=20
> -static void write_dword(uint32_t *batch, uint64_t sdi_addr, uint32_t wda=
ta,
> -			int *idx)
> +static void write_dword(struct test_exec_data *data, uint64_t sdi_addr,
> uint32_t wdata,
> +			int *idx, bool atomic)
>  {
> -	__write_dword(batch, sdi_addr, wdata, idx);
> +	uint32_t *batch =3D data->batch;
> +
> +	if (atomic) {
> +		data->data =3D 55;
> +		batch[(*idx)++] =3D MI_ATOMIC | MI_ATOMIC_INC;
> +		batch[(*idx)++] =3D sdi_addr;
> +		batch[(*idx)++] =3D sdi_addr >> 32;
> +	} else
> +		__write_dword(batch, sdi_addr, wdata, idx);
> +
>  	batch[(*idx)++] =3D MI_BATCH_BUFFER_END;  }
>=20
> @@ -304,7 +324,7 @@ static void touch_all_pages(int fd, uint32_t exec_que=
ue,
> void *ptr,
>  		uint64_t sdi_addr =3D addr + sdi_offset;
>  		int b =3D 0;
>=20
> -		write_dword(data->batch, sdi_addr, WRITE_VALUE(data, i),
> &b);
> +		write_dword((struct test_exec_data *)data, sdi_addr,
> +WRITE_VALUE(data, i), &b, false);
>  		igt_assert(b <=3D ARRAY_SIZE(data->batch));
>  	}
>=20
> @@ -447,6 +467,54 @@ static void __aligned_partial_free(struct
> aligned_alloc_type  *aligned_alloc_typ
>   * SUBTEST: processes-evict-malloc-mix-bo
>   * Description: multi-process trigger eviction of VRAM allocated via mal=
loc and
> BO create
>   * Test category: stress test
> + *
> + * SUBTEST: madvise-multi-vma
> + * Description: performs multiple madvise operations on multiple
> + virtual memory area using atomic device attributes
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-split-vma
> + * Description: perform madvise operations on multiple type VMAs (BO
> + and CPU VMAs)
> + * Test category: perform madvise operations on multiple type VMAs (BO
> + and CPU VMAs)
> + *
> + * SUBTEST: madvise-atomic-vma
> + * Description: perform madvise atomic operations on BO in VRAM/SMEM if
> + atomic ATTR global/device
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-split-vma-with-mapping
> + * Description: performs prefetch and page migration
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-preffered-loc-atomic-vram
> + * Description: performs both atomic and preferred loc madvise
> + operations atomic device attributes set
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-preffered-loc-atomic-gl
> + * Description: performs both atomic and preferred loc madvise
> + operations with atomic global attributes set
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-preffered-loc-atomic-cpu
> + * Description: performs both atomic and preferred loc madvise
> + operations with atomic cpu attributes set
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-preffered-loc-sram-migrate-pages
> + * Description: performs preferred loc madvise operations and migrating
> + all pages in smem
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-no-range-invalidate-same-attr
> + * Description: performs atomic global madvise operation, prefetch and
> + again madvise operation with same atomic attribute
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-range-invalidate-change-attr
> + * Description: performs atomic global madvise operation, prefetch and
> + again madvise operation with different atomic attribute
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-preffered-loc-atomic-und
> + * Description: Tests madvise with preferred location set for atomic
> + operations, but with an undefined
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-atomic-inc
> + * Description: Tests madvise atomic operations
> + * Test category: functionality test
>   */
>=20
>  static void
> @@ -701,7 +769,8 @@ partial(int fd, struct drm_xe_engine_class_instance *=
eci,
> unsigned int flags)
>  		uint64_t sdi_addr =3D addr + sdi_offset;
>  		int b =3D 0;
>=20
> -		write_dword(data[i].batch, sdi_addr, WRITE_VALUE(&data[i],
> i), &b);
> +		write_dword((struct test_exec_data *)&data[i], sdi_addr,
> WRITE_VALUE(&data[i], i),
> +			     &b, false);
>  		igt_assert(b <=3D ARRAY_SIZE(data[i].batch));
>=20
>  		if (!i)
> @@ -778,6 +847,20 @@ partial(int fd, struct drm_xe_engine_class_instance
> *eci, unsigned int flags)
>  #define PREFETCH_BENCHMARK	(0x1 << 25)
>  #define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
>  #define MADVISE_SWIZZLE			(0x1 << 27)
> +#define MADVISE_OP			(0x1 << 28)
> +#define ATOMIC_BATCH			(0x1 << 29)
> +#define MIGRATE_ALL_PAGES		(0x1 << 30)
> +#define PREFERRED_LOC_ATOMIC_DEVICE	(0x1ull << 31)
> +#define PREFERRED_LOC_ATOMIC_GL		(0x1ull << 32)
> +#define PREFERRED_LOC_ATOMIC_CPU	(0x1ull << 33)
> +#define MADVISE_MULTI_VMA		(0x1ull << 34)
> +#define MADVISE_SPLIT_VMA		(0x1ull << 35)
> +#define MADVISE_ATOMIC_VMA		(0x1ull << 36)
> +#define PREFETCH_SPLIT_VMA		(0x1ull << 37)
> +#define PREFETCH_CHANGE_ATTR		(0x1ull << 38)
> +#define PREFETCH_SAME_ATTR		(0x1ull << 39)
> +#define PREFERRED_LOC_ATOMIC_UND	(0x1ull << 40)
> +#define MADVISE_ATOMIC_DEVICE		(0x1ull << 41)
>=20
>  #define N_MULTI_FAULT		4
>=20
> @@ -886,7 +969,7 @@ partial(int fd, struct drm_xe_engine_class_instance *=
eci,
> unsigned int flags)
>   * arg[1]:
>   *
>   * @malloc:				malloc single buffer for all execs, issue
> a command which will trigger multiple faults
> - * @malloc-madvise:			malloc single buffer for all execs, issue
> a command which will trigger multiple faults, perfoems madvise operation
> + * @malloc-madvise:			malloc single buffer for all execs, issue
> a command which will trigger multiple faults, performs madvise operation
>   * @malloc-prefetch:			malloc single buffer for all execs,
> prefetch buffer before each exec
>   * @malloc-prefetch-madvise:		malloc single buffer for all execs,
> prefetch buffer before each exec, performs madvise operation
>   * @malloc-multi-fault:			malloc single buffer for all execs
> @@ -987,16 +1070,6 @@ partial(int fd, struct drm_xe_engine_class_instance
> *eci, unsigned int flags)
>   * Description: Create multiple threads with a faults on different hardw=
are
> engines to same addresses, racing between CPU and GPU access
>   * Test category: stress test
>   */
> -
> -struct test_exec_data {
> -	uint32_t batch[32];
> -	uint64_t pad;
> -	uint64_t vm_sync;
> -	uint64_t exec_sync;
> -	uint32_t data;
> -	uint32_t expected_data;
> -};
> -
>  static void igt_require_hugepages(void)  {
>  	igt_skip_on_f(!igt_get_meminfo("HugePages_Total"),
> @@ -1022,11 +1095,184 @@ madvise_swizzle_op_exec(int fd, uint32_t vm,
> struct test_exec_data *data,
>  			0);
>  }
>=20
> +static void
> +xe_vm_madvixe_pat_attr(int fd, uint32_t vm, uint64_t addr, uint64_t rang=
e,
> +		int pat_index)
> +{
> +	xe_vm_madvise(fd, vm, addr, range, 0,
> +			DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0); }
> +
> +static void
> +xe_vm_madvise_atomic_attr(int fd, uint32_t vm, uint64_t addr, uint64_t
> range,
> +		int mem_attr)
> +{
> +	xe_vm_madvise(fd, vm, addr, range, 0,
> +			DRM_XE_MEM_RANGE_ATTR_ATOMIC,
> +			mem_attr, 0);
> +}
> +
> +static void
> +xe_vm_madvise_migrate_pages(int fd, uint32_t vm, uint64_t addr,
> +uint64_t range) {
> +	xe_vm_madvise(fd, vm, addr, range, 0,
> +			DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +			DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM,
> +			DRM_XE_MIGRATE_ALL_PAGES);
> +}
> +
> +static void
> +xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data
> *data,
> +		size_t bo_size, struct drm_xe_engine_class_instance *eci,
> +		uint64_t addr, unsigned long long flags,
> +		struct drm_xe_sync *sync)
> +{
> +	uint32_t bo_flags, bo =3D 0;
> +
> +
> +	if (flags & MADVISE_ATOMIC_DEVICE)
> +		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data),
> bo_size,
> +				DRM_XE_ATOMIC_DEVICE);
> +
> +	if (flags & PREFERRED_LOC_ATOMIC_UND) {
> +		xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data),
> bo_size);
> +
> +		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data),
> bo_size,
> +				DRM_XE_ATOMIC_UNDEFINED);
> +	}
> +
> +	if (flags & PREFERRED_LOC_ATOMIC_DEVICE) {
> +		xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data),
> bo_size);
> +
> +		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data),
> bo_size,
> +				DRM_XE_ATOMIC_DEVICE);
> +	}
> +
> +	if (flags & PREFERRED_LOC_ATOMIC_GL) {
> +		xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data),
> bo_size);
> +
> +		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data),
> bo_size,
> +				DRM_XE_ATOMIC_GLOBAL);
> +	}
> +
> +	if (flags & PREFERRED_LOC_ATOMIC_CPU) {
> +		xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data),
> bo_size);
> +
> +		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data),
> bo_size,
> +				DRM_XE_ATOMIC_CPU);
> +	}
> +
> +	if (flags & MADVISE_MULTI_VMA) {
> +		if (bo_size)
> +			bo_size =3D ALIGN(bo_size, SZ_4K);
> +		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data) +
> bo_size/2,
> +				bo_size/2, DRM_XE_ATOMIC_DEVICE);
> +
> +		xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data) +
> bo_size/2, bo_size/2,
> +				intel_get_pat_idx_wb(fd));
> +
> +		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data) +
> bo_size,
> +				bo_size, DRM_XE_ATOMIC_DEVICE);
> +
> +		xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data),
> bo_size,
> +				intel_get_pat_idx_wb(fd));
> +	}
> +
> +	if (flags & MADVISE_SPLIT_VMA) {
> +		if (bo_size)
> +			bo_size =3D ALIGN(bo_size, SZ_4K);
> +
> +		bo_flags =3D
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> +		bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci-
> >gt_id),
> +				bo_flags);
> +		xe_vm_bind_async(fd, vm, 0, bo, 0, to_user_pointer(data) +
> bo_size/2,
> +				bo_size/2, 0, 0);
> +
> +		__xe_vm_bind_assert(fd, vm, 0, 0, 0, to_user_pointer(data) +
> bo_size/2,
> +				bo_size/2, DRM_XE_VM_BIND_OP_MAP,
> +
> 	DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR, sync,
> +				1, 0, 0);
> +		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
> FIVE_SEC);
> +		data[0].vm_sync =3D 0;
> +		gem_close(fd, bo);
> +		bo =3D 0;
> +
> +
> +		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data),
> bo_size/2,
> +				DRM_XE_ATOMIC_GLOBAL);
> +	}
> +}
> +
> +static void
> +madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
> +		unsigned long long flags, struct test_exec_data *data) {
> +	uint32_t val;
> +
> +	if (flags & PREFETCH_SPLIT_VMA) {
> +		bo_size =3D ALIGN(bo_size, SZ_4K);
> +
> +		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0, 0);
> +
> +		val =3D xe_vm_print_mem_attr_values_in_range(fd, vm, addr,
> bo_size);
> +
> +		igt_debug("num_vmas before madvise =3D %d\n", val);
> +
> +		xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data),
> +bo_size/2);
> +
> +		val =3D xe_vm_print_mem_attr_values_in_range(fd, vm, addr,
> bo_size);
> +
> +		igt_debug("num_vmas after madvise=3D %d\n", val);
> +	} else if (flags & PREFETCH_SAME_ATTR) {
> +		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data),
> bo_size,
> +				DRM_XE_ATOMIC_GLOBAL);
> +		val =3D xe_vm_print_mem_attr_values_in_range(fd, vm, addr,
> bo_size);
> +
> +		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0,
> +				DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
> +
> +		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data),
> bo_size/2,
> +				DRM_XE_ATOMIC_GLOBAL);
> +	} else if (flags & PREFETCH_CHANGE_ATTR) {
> +		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data),
> bo_size,
> +				DRM_XE_ATOMIC_GLOBAL);
> +
> +		val =3D xe_vm_print_mem_attr_values_in_range(fd, vm, addr,
> bo_size);
> +
> +		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0,
> +				DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
> +
> +		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data),
> bo_size,
> +				DRM_XE_ATOMIC_DEVICE);
> +
> +		val =3D xe_vm_print_mem_attr_values_in_range(fd, vm, addr,
> bo_size);
> +	}
> +}
> +
> +static void
> +madvise_vma_addr_map(uint64_t addr, int i, int idx, size_t bo_size,
> +		     struct test_exec_data *data,
> +		     uint64_t *batch_offset,
> +		     uint64_t *batch_addr, uint64_t *sdi_offset,
> +		     uint64_t *sdi_addr,
> +		     unsigned long long flags,
> +		     uint64_t *split_vma_offset)
> +{
> +	if (flags & MADVISE_MULTI_VMA) {
> +		addr =3D addr + i * bo_size;
> +		data =3D from_user_pointer(addr);
> +		*batch_offset =3D (size_t)((char *)&(data[idx].batch) - (char
> *)data);
> +		*batch_addr =3D addr + *batch_offset;
> +		*sdi_offset =3D (size_t)((char *)&(data[idx].data) - (char *)data);
> +		*sdi_addr =3D addr + *sdi_offset;
> +	}
> +}
> +
>  static void
>  test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	  int n_exec_queues, int n_execs, size_t bo_size,
>  	  size_t stride, uint32_t vm, void *alloc, pthread_barrier_t *barrier,
> -	  unsigned int flags)
> +	  unsigned long long flags)
>  {
>  	uint64_t addr;
>  	struct drm_xe_sync sync[1] =3D {
> @@ -1039,7 +1285,7 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  		.syncs =3D to_user_pointer(sync),
>  	};
>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> -	struct test_exec_data *data, *next_data =3D NULL;
> +	struct test_exec_data *data, *next_data =3D NULL, *original_data =3D
> NULL;
>  	uint32_t bo_flags;
>  	uint32_t bo =3D 0, bind_sync =3D 0;
>  	void **pending_free;
> @@ -1157,6 +1403,9 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>=20
>  	addr =3D to_user_pointer(data);
>=20
> +	if (flags & MADVISE_OP)
> +		xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr,
> flags,
> +sync);
> +
>  	if (flags & BO_UNMAP) {
>  		bo_flags =3D
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>  		bo =3D xe_bo_create(fd, vm, bo_size,
> @@ -1230,42 +1479,61 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  		bool fault_inject =3D (FAULT & flags) && i =3D=3D n_execs / 2;
>  		bool fault_injected =3D (FAULT & flags) && i > n_execs;
>=20
> +		uint64_t split_vma_offset;
> +
>  		if (barrier)
>  			pthread_barrier_wait(barrier);
>=20
>  		if (flags & MADVISE_SWIZZLE)
>  			madvise_swizzle_op_exec(fd, vm, data, bo_size, addr,
> i);
>=20
> +		if (flags & MADVISE_OP) {
> +			if (flags & MADVISE_MULTI_VMA)
> +				original_data =3D data;
> +
> +			madvise_vma_addr_map(addr, i, idx, bo_size, data,
> &batch_offset,
> +					      &batch_addr, &sdi_offset,
> &sdi_addr, flags,
> +					      &split_vma_offset);
> +		}
> +
>  		if (flags & MULTI_FAULT) {
>  			b =3D 0;
>  			for (j =3D 0; j < N_MULTI_FAULT - 1; ++j)
>  				__write_dword(data[idx].batch,
>  					      sdi_addr + j * orig_size,
>  					      WRITE_VALUE(&data[idx], idx),
> &b);
> -			write_dword(data[idx].batch, sdi_addr + j * orig_size,
> -				    WRITE_VALUE(&data[idx], idx), &b);
> +			write_dword(&data[idx], sdi_addr + j * orig_size,
> +				    WRITE_VALUE(&data[idx], idx), &b,
> +				    flags & ATOMIC_BATCH ? true : false);
>  			igt_assert(b <=3D ARRAY_SIZE(data[idx].batch));
>  		} else if (!(flags & EVERY_OTHER_CHECK)) {
>  			b =3D 0;
> -			write_dword(data[idx].batch, sdi_addr,
> -				    WRITE_VALUE(&data[idx], idx), &b);
> +			write_dword(&data[idx], sdi_addr,
> +					WRITE_VALUE(&data[idx], idx), &b,
> +					flags & ATOMIC_BATCH ? true : false);
>  			igt_assert(b <=3D ARRAY_SIZE(data[idx].batch));
> +			if (flags & PREFETCH)
> +				madvise_prefetch_op(fd, vm, addr, bo_size,
> flags, data);
>  		} else if (flags & EVERY_OTHER_CHECK && !odd(i)) {
>  			b =3D 0;
> -			write_dword(data[idx].batch, sdi_addr,
> -				    WRITE_VALUE(&data[idx], idx), &b);
> +			write_dword(&data[idx], sdi_addr,
> +				    WRITE_VALUE(&data[idx], idx), &b,
> +				    flags & ATOMIC_BATCH ? true : false);
>  			igt_assert(b <=3D ARRAY_SIZE(data[idx].batch));
>=20
>  			aligned_alloc_type =3D __aligned_alloc(aligned_size,
> bo_size);
>  			next_data =3D aligned_alloc_type.ptr;
>  			igt_assert(next_data);
> +
> +			xe_vm_parse_execute_madvise(fd, vm, data, bo_size,
> eci, addr, flags,
> +sync);
>  			__aligned_partial_free(&aligned_alloc_type);
>=20
>  			b =3D 0;
> -			write_dword(data[next_idx].batch,
> +			write_dword(&data[next_idx],
>  				    to_user_pointer(next_data) +
>  				    (char *)&data[next_idx].data - (char *)data,
> -				    WRITE_VALUE(&data[next_idx], next_idx),
> &b);
> +				    WRITE_VALUE(&data[next_idx], next_idx),
> &b,
> +				    flags & ATOMIC_BATCH ? true : false);
>  			igt_assert(b <=3D ARRAY_SIZE(data[next_idx].batch));
>  		}
>=20
> @@ -1299,7 +1567,6 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  			exec.address =3D batch_addr * 2;
>  		else
>  			exec.address =3D batch_addr;
> -
>  		if (fault_injected) {
>  			err =3D __xe_exec(fd, &exec);
>  			igt_assert(err =3D=3D -ENOENT);
> @@ -1319,9 +1586,19 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  					       exec_queues[e], &timeout);
>  			igt_assert(err =3D=3D -ETIME || err =3D=3D -EIO);
>  		} else {
> -			xe_wait_ufence(fd, exec_ufence ? exec_ufence :
> -				       &data[idx].exec_sync,
> USER_FENCE_VALUE,
> -				       exec_queues[e], FIVE_SEC);
> +			if (flags & PREFERRED_LOC_ATOMIC_CPU || flags &
> PREFERRED_LOC_ATOMIC_UND) {
> +				int64_t timeout =3D QUARTER_SEC;
> +
> +				err =3D __xe_wait_ufence(fd, exec_ufence ?
> exec_ufence :
> +						       &data[idx].exec_sync,
> +						       USER_FENCE_VALUE,
> +						       exec_queues[e],
> &timeout);
> +				if (err)
> +					goto cleanup;
> +			} else
> +				xe_wait_ufence(fd, exec_ufence ? exec_ufence
> :
> +					       &data[idx].exec_sync,
> USER_FENCE_VALUE,
> +					       exec_queues[e], FIVE_SEC);
>  			if (flags & LOCK && !i)
>  				munlock(data, bo_size);
>=20
> @@ -1371,17 +1648,25 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  				if (flags & FORK_READ) {
>  					igt_fork(child, 1)
>  						igt_assert_eq(data[idx].data,
> -
> READ_VALUE(&data[idx]));
> +							      flags &
> ATOMIC_BATCH
> +							      ?
> VAL_ATOMIC_EXPECTED
> +							      :
> READ_VALUE(&data[idx]));
>  					if (!(flags & FORK_READ_AFTER))
>  						igt_assert_eq(data[idx].data,
> -
> READ_VALUE(&data[idx]));
> +							      flags &
> ATOMIC_BATCH
> +							      ?
> VAL_ATOMIC_EXPECTED
> +							      :
> READ_VALUE(&data[idx]));
>  					igt_waitchildren();
>  					if (flags & FORK_READ_AFTER)
>  						igt_assert_eq(data[idx].data,
> -
> READ_VALUE(&data[idx]));
> +							      flags &
> ATOMIC_BATCH
> +							      ?
> VAL_ATOMIC_EXPECTED
> +							      :
> READ_VALUE(&data[idx]));
>  				} else {
>  					igt_assert_eq(data[idx].data,
> -						      READ_VALUE(&data[idx]));
> +						      flags & ATOMIC_BATCH
> +						      ? VAL_ATOMIC_EXPECTED
> +						      :
> READ_VALUE(&data[idx]));
>  					if (flags &
> PREFETCH_SYS_BENCHMARK) {
>  						struct timespec tv =3D {};
>  						u64 start, end;
> @@ -1408,13 +1693,17 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  								((void *)data)
> + j * orig_size;
>=20
>=20
> 	igt_assert_eq(__data[idx].data,
> -
> READ_VALUE(&data[idx]));
> +								      flags &
> ATOMIC_BATCH
> +								      ?
> VAL_ATOMIC_EXPECTED
> +								      :
> READ_VALUE(&data[idx]));
>  						}
>  					}
>  				}
>  				if (flags & EVERY_OTHER_CHECK)
>  					igt_assert_eq(data[prev_idx].data,
> -
> READ_VALUE(&data[prev_idx]));
> +						      flags & ATOMIC_BATCH
> +						      ? VAL_ATOMIC_EXPECTED
> +						      :
> READ_VALUE(&data[prev_idx]));
>  			}
>  		}
>=20
> @@ -1435,6 +1724,11 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  			gem_close(fd, bo);
>  		}
>=20
> +		if (flags & MADVISE_MULTI_VMA) {
> +			data =3D original_data;
> +			original_data =3D NULL;
> +		}
> +
>  		if (flags & NEW) {
>  			if (flags & MMAP) {
>  				if (flags & FREE)
> @@ -1513,6 +1807,7 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  				 pf_count, pf_count_after);
>  	}
>=20
> +cleanup:
>  	if (bo) {
>  		sync[0].addr =3D to_user_pointer(bind_ufence);
>  		__xe_vm_bind_assert(fd, vm, 0,
> @@ -1808,7 +2103,7 @@ test_compute(int fd, struct
> drm_xe_engine_class_instance *eci, size_t size)
>=20
>  struct section {
>  	const char *name;
> -	unsigned int flags;
> +	unsigned long long flags;
>  };
>=20
>  igt_main
> @@ -1914,6 +2209,32 @@ igt_main
>  		{ "malloc-mix-bo", MIX_BO_ALLOC },
>  		{ NULL },
>  	};
> +	const struct section msections[] =3D {
> +		{ "atomic-inc", MADVISE_OP | MADVISE_ATOMIC_DEVICE |
> ATOMIC_BATCH },
> +		{ "preffered-loc-sram-migrate-pages",
> +		  MADVISE_OP | MADVISE_SWIZZLE | MIGRATE_ALL_PAGES |
> ATOMIC_BATCH },
> +		{ "preffered-loc-atomic-vram",
> +		  MADVISE_OP | PREFERRED_LOC_ATOMIC_DEVICE |
> ATOMIC_BATCH },
> +		{ "preffered-loc-atomic-gl",
> +		  MADVISE_OP | PREFERRED_LOC_ATOMIC_GL |
> ATOMIC_BATCH },
> +		{ "preffered-loc-atomic-cpu",
> +		  MADVISE_OP | PREFERRED_LOC_ATOMIC_CPU |
> ATOMIC_BATCH },
> +		{ "preffered-loc-atomic-und",
> +		  MADVISE_OP | PREFERRED_LOC_ATOMIC_UND |
> ATOMIC_BATCH },
> +		{ "multi-vma",
> +		  MADVISE_OP | MADVISE_MULTI_VMA | ATOMIC_BATCH },
> +		{ "split-vma",
> +		  MADVISE_OP | MADVISE_SPLIT_VMA | ATOMIC_BATCH },
> +		{ "atomic-vma",
> +		  MADVISE_OP | MADVISE_ATOMIC_VMA | ATOMIC_BATCH },
> +		{ "split-vma-with-mapping",
> +		  MADVISE_OP | PREFETCH | PREFETCH_SPLIT_VMA |
> ATOMIC_BATCH },
> +		{ "range-invalidate-change-attr",
> +		  MADVISE_OP | PREFETCH | PREFETCH_CHANGE_ATTR |
> ATOMIC_BATCH },
> +		{ "no-range-invalidate-same-attr",
> +		  MADVISE_OP | PREFETCH | PREFETCH_SAME_ATTR |
> ATOMIC_BATCH },
> +		{ NULL },
> +	};
>  	int fd;
>=20
>  	igt_fixture {
> @@ -2110,6 +2431,14 @@ igt_main
>  			processes_evict(fd, SZ_8M, SZ_1M, s->flags);
>  	}
>=20
> +	for (const struct section *s =3D msections; s->name; s++) {
> +		igt_subtest_f("madvise-%s", s->name) {
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 1, 1, SZ_64K, 0, 0, NULL,
> +					  NULL, s->flags);
> +		}
> +	}
> +
Looks good to me, I let others to comment=20
--Pravalika
>  	igt_subtest("compute")
>  		xe_for_each_engine(fd, hwe)
>  			test_compute(fd, hwe, SZ_2M);
> --
> 2.43.0

