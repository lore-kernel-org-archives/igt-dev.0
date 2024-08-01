Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E93C3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 09:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F3E10E8C5;
	Thu,  1 Aug 2024 09:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WAIWiOnD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6EA10E8C5
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 09:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722503357; x=1754039357;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=shw4aqVzmYOojcXOQNKsjqK9WmGQy+qXN4rKe1i2i+Y=;
 b=WAIWiOnDoVrZ55rbgZ5LN/mJiyJeiDbIp/UKcYpdP059ry2ip7hVrV2F
 CxWFZeTlMOwyRcrsdJNsTOYNXb7I37yrK19sbrbOKwSbD69IHB1DT92B4
 Fdeuoq3vwlXaF9c9eLVrZsiYqLHkDn3HvyPmOGjetespvDBzDL2/Sr0JJ
 tWqqgmALFjC2ycrBY3UrTWCL41R4B9kw9BWFHUYezjp4nixEPrurLSgNk
 HPblYkET+mUc+GzTfenGUZQ32JS3cc8tT3nhSv8zVVy4dgmsYwIxEmgs1
 RSvOmp+oqbbdoTrxukR/8DiuR5jwstF1+Mjt6Eii8QqHsb1J8+sjl5hhi w==;
X-CSE-ConnectionGUID: 7Uu5/evBSf2LBXqz0Z7Ozw==
X-CSE-MsgGUID: uFBvNdokQM2SlGEaQfR2ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20383184"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20383184"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:09:16 -0700
X-CSE-ConnectionGUID: KWI4L+y7RSuCat22UXw9UQ==
X-CSE-MsgGUID: Ju2fYK9zTbqv13qSRaaScA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="59784901"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 02:09:16 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 02:09:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 02:09:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 02:09:14 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 02:09:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZRkDm3LhCMfCNLvekwhn2bO5OGCcgzROr6MPGYSG5IivbgMCdYXleBs8EDU/hlPm3MyP0XPOwQcNcxnDR0JAerfV6PEF5k+5z7gWjgyw9qoaeSWqC4dpNaDPZmC0VMIWMboD2ebuhTjbDtc3AwCigiLRUD0hn03EWgvLmozjYEj6Iq9RMJYvl55I65o8LozCCZT8T9dQiGwS/u5c4pXdbAEyfUutcyrPa3VMtyMjMYIVEjzMt2VxdU7w60hj+I0t/PJs5/wcQ/XhdPHwK0YyFooc5goT9BfmZzsv6qk6xilCL9u3NbKETKx1Kylcaz16FomTScKqojuLQspin2psg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shw4aqVzmYOojcXOQNKsjqK9WmGQy+qXN4rKe1i2i+Y=;
 b=RDg2+X5hRqKQR8AAn15EFgh074LJ7MzZdIpMkHNRpfEH1zuiWzvsgMj3v0gyWfM8ve2RmaCS+yUDq4pRI28c2LtoHTLpNdsK3GMUa9VD82oJPuwYzlFTo9WXVOo57kxL4IURboOFNZISK5uCQcIyNMrFktkWx+P8DC9w8f0QDGUnk0rDRzoW7nrFE9N7USmujWhtNrZZkSoi7469eF6fg6g1X712oD0/XXiup6ZZQbOnqCFE+BA1hKQJlLdGNtgVbNZ1Trm0LW+GP6z3jrPTxjIe/O6ANzH+kwgZUzl8AOR8hlrHFQ6/c6IRVIBDsVCr7iuNlzMGd7QhFIJ9JwzcoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 PH7PR11MB5765.namprd11.prod.outlook.com (2603:10b6:510:139::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7807.29; Thu, 1 Aug 2024 09:09:11 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 09:09:11 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Grzegorzek, Dominik"
 <dominik.grzegorzek@intel.com>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Subject: RE: [PATCH i-g-t v2 63/66] tests/xe_eudebug_online: Add subtests w/o
 long running mode
Thread-Topic: [PATCH i-g-t v2 63/66] tests/xe_eudebug_online: Add subtests w/o
 long running mode
Thread-Index: AQHa4nabjPEihRlIRk+pGcV4aJS8N7ISH9mg
Date: Thu, 1 Aug 2024 09:09:11 +0000
Message-ID: <DS0PR11MB7264826B4F6668EA870E31A4D9B22@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-64-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-64-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|PH7PR11MB5765:EE_
x-ms-office365-filtering-correlation-id: 49e0545d-febd-40f9-35cb-08dcb2099b67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RWRmZnFZUC9UNFhvNU0xQnZBT3VuVzk4WTRGRkFJYVkydGd6THBrK0xlQlRs?=
 =?utf-8?B?RmFMRWJSOEVDaUt6MEw2NnNBVFQ0QjRUeFlBR1YrZ0VoK3Q1Y042U2taL3c3?=
 =?utf-8?B?SWxEa1g5STZBRHpOWmhOcElvZzRDaFZKSWxGLzRrNnIwK3JhOUovK1F2SHNU?=
 =?utf-8?B?SE9zbGlmeTFURmkwYW9aQXIxTitLSWwvRWw5aGJUdmpGMWlZNFc1TytkZXY2?=
 =?utf-8?B?c00wYXJ0NXdYR3BObjFkbGpzQ3hzakY2dG5Sb0t3Y1NkaFRkNEFLNnJ6Zmdp?=
 =?utf-8?B?V0hCblJ1R2p5aTI4MThBTmRMa28rc0lackVIRyswL1YzL25HN2t1anZwNnV2?=
 =?utf-8?B?ck9MOG1ScEt1UmlJQy9mKzhibW96bmEvYWx3aDdOV01aeHEyYzBnTVAxaDFO?=
 =?utf-8?B?cFhPM0VFZE1HSG9YU202bWdJTG44L2dzSG9Nb2Y1VXRLU3NUVWlZc3JNeTlP?=
 =?utf-8?B?VEsrMXh1V3NuSTZUVndrb2tLYlYrVFB5Z2dxd1A2VkdYczNZRVJkUUJJK2tF?=
 =?utf-8?B?QkVKeU5MUzBMVlFYM1hhSUF0b3dLS1k3ZFJLWlpXaGxsV1h4YWUxTkRBVlJt?=
 =?utf-8?B?alVLQ25oQzVhckNZUDNYYnViNXF0a1dYVHk0SVpTMGRyTzZHQVlVWEtKZ1JB?=
 =?utf-8?B?dTZrT3NSUzE3U0toOThVMERiSUF2ODVqUkMyZ2N0dVJnRzNXSlFPRFZsK3NM?=
 =?utf-8?B?THFuU1lsM3hKRndibDMwcDB4VG9wdytCYk5XUzRBbk83by9aRzRyM09QQ2tO?=
 =?utf-8?B?NFZpbTFQbENJczBwYkhvMEtMTTE0SjgxTThUaVVUVXE5cGdKSlBsc0JCZVhw?=
 =?utf-8?B?bXhIVWlqTitxMmNVSUxKNHlaSmRyMFhOalhYcVlKQThJMy8xdi9WU1VpeTY1?=
 =?utf-8?B?Tk9tU3B5SnVhSFR1WXJGSzlCcUVLc2tVbWx6WmJDNzVuSVZMcXpqaHprcXRB?=
 =?utf-8?B?aWErbitlODJHSlFZd1VYNWJBMmswNWVXN0luNjRha0xabWF6REl5VTVqdUNY?=
 =?utf-8?B?YzFIZlVyOC92ZGFyZ2Vyemw0ZnZVWE9QcXoxSDZtL0lpYjB2UDU5anNNdUVs?=
 =?utf-8?B?OTFzanRhdU5FNUpIUUJkK2VKUmIrV2xLb3dVYW9IMHlaZzU2UzFvR1FxaDRp?=
 =?utf-8?B?QzIwRmoxNng4eW44eVFpVFZOeTNZRXlPQ0RjdmhqZHBmaDdTaC9LdlpKTEZS?=
 =?utf-8?B?U3NucEFqMVVCeW10dExSY3h4UitjWENBRDhzL3R6RndON01RRWswVi8xRy81?=
 =?utf-8?B?aXRCZ0JSS0ZyL0FPZVJKNk92QzhHK0JuSnp2M0ZoalRkYlk0ZTZ4MjBtMktN?=
 =?utf-8?B?bENEQ3ZrUnhkWkQ5bjhLUEpVcERYMk5ZSHNqNE8rY04wZDcyazF5aGlQejJk?=
 =?utf-8?B?VXYwZG02MkhXUHBpWWtZNkdrV2c5SUdtM01POU5CbWlHS1UxTGVFRFZKTGVB?=
 =?utf-8?B?TzNFSXVwcmpTK1FOQ25kanlNdkQvNXUwNm05cXNKdVFReGZxMXM1dno3a3Vx?=
 =?utf-8?B?NFdCd1hvenkwODZKbEFGWHVhS2tud3BiRDgrTUhlNFJSQ2tVOXd6bjczLytz?=
 =?utf-8?B?ZkVScnZMd2Z5Z2ppYmZXNmxWeEQ5UzFyelp5c2k4RW9NN243YTJKT0RVaWkr?=
 =?utf-8?B?YjlIdCtTblMzditPbThwV0pDYUg0NXZJdnJHS0ZIb3FZdUlaVC91TTFlNmhE?=
 =?utf-8?B?emFMZlByU1FTTGJkcHpibkprb2IrQXVUckdVOUtyQ3haeVozT1ErWWNQdVAy?=
 =?utf-8?B?Y0RUU2w4N2R3UHdjNnNsUGcyWFkyZjJybFBoWFJJSEY1dUg5TDJQemg4cm04?=
 =?utf-8?B?V1RtbFhYelE1dWpacGlIUjVpOERiZ0hUVTJOTWdML1YwNk11MzNyanlIdnox?=
 =?utf-8?B?TTFYQVBHOGpVc3RTUExIUGZhd1lFN2FvcDh4aEdCK2EvUXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vzk4K3hpM3F1NEdqZmJMZ2krMzRiNitQV0grWXNhd2hMckZuZ0xWd05sUmhP?=
 =?utf-8?B?c1RMb2tNTXFTb2w2OEVPSTlWNlFIc21iSzRVUWhPU0lMeGJWaVFQY0lpMzln?=
 =?utf-8?B?NWVBYnBoV3gyUTFoSmtHRE8xOVJabEdXL2E3ZTFNMmJHelFGNEdPTUpLeGJW?=
 =?utf-8?B?blJ4b0x4SUY2UG5BVWNIYUM1Tm9JaTlEeVlDeWFTbWNPQjRPNE80TG9CMFR4?=
 =?utf-8?B?dWpBRmhtWUtDbmxTaTdvckZsSEIwb1I2NkV2NkpYY2RnM2V0eTdMcWVCOWZz?=
 =?utf-8?B?L2VwbTVMMGViV2FlZ05JRkRPYy9UTlpmK3djMFM1dW81RlM2cHRmRmxwYm1O?=
 =?utf-8?B?YXkzaGlsUnVhcUllSkQwOTB4ZmVMMUZ6M2lXcW41cUx4bGdBKzZMREtlSHRp?=
 =?utf-8?B?K3FPSHlreklEVUxOV2I2WU8xMjJYTzhaMThRd2Fzb080V3luYk0yQ1p3NTJW?=
 =?utf-8?B?NGljSXVqbU91S0orckZKaUJIUmVsQmZnRXpBcmphbGlPWmpLOW5jKzRLNjNt?=
 =?utf-8?B?cFB4OWxOMlVmU1FZT0dFOTQ2NUFqaGxVVHQ2ODV6MXdYSG80dHVhYTZvck1l?=
 =?utf-8?B?aU42OU9ZeFFjYjBRcUdFMGxQbGlPQmtCd2kvUjRSWmEzMnd2eTdiUXlmZURx?=
 =?utf-8?B?MU9XNktSMlRKUVRqMGN5ZUQrSnBTd0dmK29oWUFkazhzVVJBMm95ejlleXR0?=
 =?utf-8?B?NVFPZk1NbVpDeU5HSmNBdVRWM1lwWHlvOWdsc2QyMDlIZlNYMDhWTVlLOVRl?=
 =?utf-8?B?SHk3c0pYWDlxcXVTbVpBb0t4RmpRajVTUFphaGhFM25xVGE5UG80Si96UFpU?=
 =?utf-8?B?MHRqUFovMXh6SlpXQUM0b2lmaGpZeWxqQXk0N1NqLzl3YUQ3VVY5dCtpdkRR?=
 =?utf-8?B?VlE3anBWV3FCMURkVTZCNFdkaXJUMklCTG00aVVRR3F1Z1ZLaEJyTGcvUDNo?=
 =?utf-8?B?ejZWdFZEb1h2c2NZSWJvRTFXSHptdHAvMDZtbjR6aEtIdllMSVFZQ2lXcEFr?=
 =?utf-8?B?T2d4bllOQkZnaFQzSHFOK0xVV0d1dUYvRC9jQ284UGdsU3d6UDhmeXQ1ZEpL?=
 =?utf-8?B?V21jRFY3N1ZvcGNoR1lVZ0hOeVp5ckd0WkJUclNzWVRwZ3dJU2hZdWlHRDZ2?=
 =?utf-8?B?eU5EWmlMcnpmdlQ5M0Q3VFFPYXIrU1QzYVhldkNSU0pLUFBSSWNiWDdPaGJ1?=
 =?utf-8?B?M2FKK05GcTM3MkZzbkJEUHkxK1c1RzNkcmFoSXpTaFdpNFhMd2RCS0EzNyt6?=
 =?utf-8?B?c29SdkNBSUEwWVJLazBlRnVIUGFWdW5xSHlnQm5scWVjekFzQkNqbzZDSjVJ?=
 =?utf-8?B?QlZtcEoyWHhLMWVQK2paTU92VTZZb2xZQjhzd29ueEpEbTdqYkFJLzgxYlhP?=
 =?utf-8?B?RnBTbkdPbCtPUE1FNlBFeU01VWFwRy9pdUFNZ1dCOHBHbklLcTNmbWlvYi81?=
 =?utf-8?B?YjE3NmtmUXZyWHZ4dyt3UGtheWI2SU1XSkdpV0k0M0NDdEcwdndwdmlTR2Nu?=
 =?utf-8?B?blZKTVdCRTl5NjVGNk5XYUZpdU1SeitqZjhWbENZcDJ6VUZXK0R3U2lpcU02?=
 =?utf-8?B?SXN0RXlUZG1oeEcrdW4wVWFlQUlsZ2VOcGNvakJ5Vjdxb0QybFZyK2V4TytP?=
 =?utf-8?B?aUdSMGF5L1FjbTNoTDFycDMzUFpBamdKazU3dUJvQ1ZnZFRvNVM2WWF2cG0w?=
 =?utf-8?B?ZDF5THlJZkFjUnhsMFF3allTVnlSVXFVWnhJYjh1dkFhcnVFMVpJQmI4UXNi?=
 =?utf-8?B?cTdCdzU4bTMyV2R5QnNuclg0NEYrSkw3SERldG5nOTlJWVNWc3RQNHhZVnAr?=
 =?utf-8?B?aW9YeGg3amQ3S2lFditUczVFS1RWRzVZem1kakdUZDVMcitVVDVGZGtlQzRz?=
 =?utf-8?B?eWF2c204aElueE1DYm4rYVcyNjA2dVRlalVucUNxSnpTZkdTUDVYZ2tBVDVa?=
 =?utf-8?B?eTFFSWRwMnRpVUJLczlSaDdHRDdhYVZmUUV6dE9KUDNtL29EVDlvRHRBYmZL?=
 =?utf-8?B?NHRic2ZpSTVEZ0lGVVRYUkhBVkwyUkhHdzBLalk3akJZVDJXM1Znc0VFY1Yy?=
 =?utf-8?B?bTBST3dkMHhnbUxXbHIyNzRTVGV1MThTSmRKK05FdE9lZTB3RDdBY2ZYRk4z?=
 =?utf-8?B?Y3R2cGVYNzdRVGsyVG9LTGk5VDdta0lTeFdnWnJ2TGlUOEYxaGFFTXhsSXE2?=
 =?utf-8?B?WWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e0545d-febd-40f9-35cb-08dcb2099b67
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 09:09:11.0895 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7SpnAve4RfgpVKxJgFFx3J5Cua4kyqoyWAzlhYB03vawvXDKVagSllhbAg2TqZL7wn4vMq6sdB3pxVIwaFamZuIuMDpkOE0NZEMkgyVMcKnH1pYsjSz1ihoHaZi/ylUb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5765
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

UmV2aWV3ZWQtYnk6IERvbWluaWsgS2Fyb2wgUGnEhXRrb3dza2kgPGRvbWluaWsua2Fyb2wucGlh
dGtvd3NraUBpbnRlbC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogTWFuc3pld3NraSwgQ2hyaXN0b3BoIDxjaHJpc3RvcGgubWFuc3pld3NraUBpbnRlbC5jb20+
DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bHkgMzAsIDIwMjQgMTo0NSBQTQ0KPiBUbzogaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEtlbXBjenluc2tpLCBaYmlnbmlldyA8emJpZ25p
ZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPjsgS2FtaWwNCj4gS29uaWVjem55IDxrYW1pbC5rb25p
ZWN6bnlAbGludXguaW50ZWwuY29tPjsgR3J6ZWdvcnplaywgRG9taW5paw0KPiA8ZG9taW5pay5n
cnplZ29yemVrQGludGVsLmNvbT47IFBhdGVsY3p5aywgTWFjaWVqDQo+IDxtYWNpZWoucGF0ZWxj
enlrQGludGVsLmNvbT47IFBpYXRrb3dza2ksIERvbWluaWsgS2Fyb2wNCj4gPGRvbWluaWsua2Fy
b2wucGlhdGtvd3NraUBpbnRlbC5jb20+OyBTaWtvcmEsIFBhd2VsDQo+IDxwYXdlbC5zaWtvcmFA
aW50ZWwuY29tPjsgSGFqZGEsIEFuZHJ6ZWogPGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tPjsNCj4g
S29sYW51cGFrYSBOYXZlZW5hIDxrb2xhbnVwYWthLm5hdmVlbmFAaW50ZWwuY29tPjsgS3VvcHBh
bGEsIE1pa2ENCj4gPG1pa2Eua3VvcHBhbGFAaW50ZWwuY29tPjsgTXVuLCBHd2FuLWd5ZW9uZyA8
Z3dhbi0NCj4gZ3llb25nLm11bkBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCB2
MiA2My82Nl0gdGVzdHMveGVfZXVkZWJ1Z19vbmxpbmU6IEFkZCBzdWJ0ZXN0cyB3L28NCj4gbG9u
ZyBydW5uaW5nIG1vZGUNCj4gDQo+IEN1cnJlbnRseSBhbGwgb3VyIG9ubGluZSB0ZXN0cyB1c2Ug
dm1zIGluIGxvbmcgcnVubmluZyBtb2RlLiBBZGQgMyBzdWJ0ZXN0cw0KPiB3aXRob3V0IGl0IHRv
IGhhdmUgc29tZSBjb3ZlcmFnZSBmb3Igbm9uLWxyIG1vZGUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGggTWFuc3pld3NraSA8Y2hyaXN0b3BoLm1hbnN6ZXdza2lAaW50ZWwuY29tPg0K
PiBDYzogRG9taW5payBLYXJvbCBQacSFdGtvd3NraSA8ZG9taW5pay5rYXJvbC5waWF0a293c2tp
QGludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC94ZV9ldWRlYnVnX29ubGluZS5jIHwg
MzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDI5
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMv
aW50ZWwveGVfZXVkZWJ1Z19vbmxpbmUuYyBiL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWdfb25saW5l
LmMNCj4gaW5kZXggOTYxMjljMDZhLi44NjQ1OTFhMzQgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2lu
dGVsL3hlX2V1ZGVidWdfb25saW5lLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwveGVfZXVkZWJ1Z19v
bmxpbmUuYw0KPiBAQCAtMjgsNiArMjgsNyBAQA0KPiAgI2RlZmluZSBTSEFERVJfTl9OT09QX0JS
RUFLUE9JTlQJKDEgPDwgNSkNCj4gICNkZWZpbmUgU0hBREVSX0NBQ0hJTkdfU1JBTQkJKDEgPDwg
NikNCj4gICNkZWZpbmUgU0hBREVSX0NBQ0hJTkdfVlJBTQkJKDEgPDwgNykNCj4gKyNkZWZpbmUg
RElTQUJMRV9MT05HX1JVTk5JTkdfTU9ERQkoMSA8PCA4KQ0KPiAgI2RlZmluZSBUUklHR0VSX1JF
U1VNRV9TSU5HTEVfV0FMSwkoMSA8PCAyNSkNCj4gICNkZWZpbmUgVFJJR0dFUl9SRVNVTUVfUEFS
QUxMRUxfV0FMSwkoMSA8PCAyNikNCj4gICNkZWZpbmUgVFJJR0dFUl9SRUNPTk5FQ1QJCSgxIDw8
IDI3KQ0KPiBAQCAtMTAwMywxMiArMTAwNCwxNiBAQCBzdGF0aWMgdm9pZCBydW5fb25saW5lX2Ns
aWVudChzdHJ1Y3QNCj4geGVfZXVkZWJ1Z19jbGllbnQgKmMpDQo+IA0KPiBEUk1fWEVfREVCVUdf
TUVUQURBVEFfUFJPR1JBTV9NT0RVTEUsDQo+ICAJCQkJCQkJICAgMiAqDQo+IHNpemVvZigqbWV0
YWRhdGEpLCBtZXRhZGF0YVsxXSk7DQo+IA0KPiAtCWNyZWF0ZS52bV9pZCA9IHhlX2V1ZGVidWdf
Y2xpZW50X3ZtX2NyZWF0ZShjLCBmZCwNCj4gRFJNX1hFX1ZNX0NSRUFURV9GTEFHX0xSX01PREUs
IDApOw0KPiArCWlmIChjLT5mbGFncyAmIERJU0FCTEVfTE9OR19SVU5OSU5HX01PREUpDQo+ICsJ
CWNyZWF0ZS52bV9pZCA9IHhlX2V1ZGVidWdfY2xpZW50X3ZtX2NyZWF0ZShjLCBmZCwgMCwgMCk7
DQo+ICsJZWxzZQ0KPiArCQljcmVhdGUudm1faWQgPSB4ZV9ldWRlYnVnX2NsaWVudF92bV9jcmVh
dGUoYywgZmQsDQo+ICtEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfTFJfTU9ERSwgMCk7DQo+ICsNCj4g
IAl4ZV9ldWRlYnVnX2NsaWVudF9leGVjX3F1ZXVlX2NyZWF0ZShjLCBmZCwgJmNyZWF0ZSk7DQo+
IA0KPiAgCWliYiA9IHhlX2JiX2NyZWF0ZV9vbl9vZmZzZXQoZmQsIGNyZWF0ZS5leGVjX3F1ZXVl
X2lkLCBjcmVhdGUudm1faWQsDQo+ICAJCQkJICAgICBiYl9vZmZzZXQsIGJiX3NpemUpOw0KPiAt
CWludGVsX2JiX3NldF9scl9tb2RlKGliYiwgdHJ1ZSk7DQo+ICsJaW50ZWxfYmJfc2V0X2xyX21v
ZGUoaWJiLCAhKGMtPmZsYWdzICYNCj4gRElTQUJMRV9MT05HX1JVTk5JTkdfTU9ERSkpOw0KPiAN
Cj4gIAlzaXAgPSBnZXRfc2lwKGZkLCBjLT5mbGFncyk7DQo+ICAJc2hhZGVyID0gZ2V0X3NoYWRl
cihmZCwgYy0+ZmxhZ3MpOw0KPiBAQCAtMTI1MSw2ICsxMjU2LDEwIEBAIHN0YXRpYyB2b2lkIHVm
ZW5jZV9hY2tfdHJpZ2dlcihzdHJ1Y3QNCj4geGVfZXVkZWJ1Z19kZWJ1Z2dlciAqZCwNCj4gICAq
CUNoZWNrIHdoZXRoZXIgS01EIHNlbmRzIGF0dGVudGlvbiBldmVudHMNCj4gICAqCWZvciB3b3Jr
bG9hZCBpbiBkZWJ1ZyBtb2RlIHN0b3BwZWQgb24gYnJlYWtwb2ludC4NCj4gICAqDQo+ICsgKiBT
VUJURVNUOiBiYXNpYy1icmVha3BvaW50LW5vLWxyDQo+ICsgKiBEZXNjcmlwdGlvbjoNCj4gKyAq
CVNhbWUgYXMgYmFzaWMtYnJlYWtwb2ludCBidXQgd2l0aG91dCB2bSBpbiBsb25nIHJ1bm5pbmcg
bW9kZS4NCj4gKyAqDQo+ICAgKiBTVUJURVNUOiBicmVha3BvaW50LW5vdC1pbi1kZWJ1Zy1tb2Rl
DQo+ICAgKiBEZXNjcmlwdGlvbjoNCj4gICAqCUNoZWNrIHdoZXRoZXIgS01EIHJlc2V0cyB0aGUg
R1BVIHdoZW4gaXQgc3BvdHMgYW4gYXR0ZW50aW9uDQo+IEBAIC0xMzM3LDYgKzEzNDYsMTAgQEAg
c3RhdGljIHZvaWQgdGVzdF9yZXNldF93aXRoX2F0dGVudGlvbl9vbmxpbmUoaW50DQo+IGZkLCBz
dHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc18NCj4gICAqCWludGVycnVwdHMgYWxsIHRocmVhZHMs
IGNoZWNrcyB3aGV0aGVyIGF0dGVudGlvbiBldmVudCBjYW1lLCBhbmQNCj4gICAqCXJlc3VtZXMg
c3RvcHBlZCB0aHJlYWRzIGJhY2suDQo+ICAgKg0KPiArICogU1VCVEVTVDogaW50ZXJydXB0LWFs
bC1uby1scg0KPiArICogRGVzY3JpcHRpb246DQo+ICsgKglTYW1lIGFzIGludGVycnVwdC1hbGwg
YnV0IHdpdGhvdXQgdm0gaW4gbG9uZyBydW5uaW5nIG1vZGUuDQo+ICsgKg0KPiAgICogU1VCVEVT
VDogaW50ZXJydXB0LWFsbC1zZXQtYnJlYWtwb2ludA0KPiAgICogRGVzY3JpcHRpb246DQo+ICAg
KglTY2hlZHVsZXMgRVUgd29ya2xvYWQgd2hpY2ggc2hvdWxkIGxhc3QgYWJvdXQgYSBmZXcgc2Vj
b25kcywgdGhlbg0KPiBAQCAtMTU1Nyw2ICsxNTcwLDEwIEBAIHN0YXRpYyB2b2lkDQo+IGV1X2F0
dGVudGlvbl9kZWJ1Z2dlcl9kZXRhY2hfdHJpZ2dlcihzdHJ1Y3QgeGVfZXVkZWJ1Z19kZWJ1Z2dl
ciAqZCwNCj4gICAqCWludGVycnVwdHMgYWxsIHRocmVhZHMgYW5kIGRldGFjaGVzIGRlYnVnZ2Vy
IHdoZW4gYXR0ZW50aW9uIGlzDQo+ICAgKglyYWlzZWQuIFRoZSB0ZXN0IGNoZWNrcyBpZiBLTUQg
cmVzZXRzIHRoZSB3b3JrbG9hZCB3aGVuIHRoZXJlJ3MNCj4gICAqCW5vIGRlYnVnZ2VyIGF0dGFj
aGVkIGFuZCBkb2VzIHRoZSBldmVudCBwbGF5YmFjayBvbiBkaXNjb3ZlcnkuDQo+ICsgKg0KPiAr
ICogU1VCVEVTVDogaW50ZXJydXB0LXJlY29ubmVjdC1uby1scg0KPiArICogRGVzY3JpcHRpb246
DQo+ICsgKglTYW1lIGFzIGludGVycnVwdC1yZWNvbm5lY3QgYnV0IHdpdGhvdXQgdm0gaW4gbG9u
ZyBydW5uaW5nIG1vZGUuDQo+ICAgKi8NCj4gIHN0YXRpYyB2b2lkIHRlc3RfaW50ZXJydXB0X3Jl
Y29ubmVjdChpbnQgZmQsIHN0cnVjdA0KPiBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICpo
d2UsIGludCBmbGFncykgIHsgQEAgLTE3OTIsNiArMTgwOSw5IEBADQo+IGlndF9tYWluDQo+ICAJ
dGVzdF9ndF9yZW5kZXJfb3JfY29tcHV0ZSgiYmFzaWMtYnJlYWtwb2ludCIsIGZkLCBod2UpDQo+
ICAJCXRlc3RfYmFzaWNfb25saW5lKGZkLCBod2UsIFNIQURFUl9CUkVBS1BPSU5UKTsNCj4gDQo+
ICsJdGVzdF9ndF9yZW5kZXJfb3JfY29tcHV0ZSgiYmFzaWMtYnJlYWtwb2ludC1uby1sciIsIGZk
LCBod2UpDQo+ICsJCXRlc3RfYmFzaWNfb25saW5lKGZkLCBod2UsIFNIQURFUl9CUkVBS1BPSU5U
IHwNCj4gK0RJU0FCTEVfTE9OR19SVU5OSU5HX01PREUpOw0KPiArDQo+ICAJdGVzdF9ndF9yZW5k
ZXJfb3JfY29tcHV0ZSgiYnJlYWtwb2ludC1ub3QtaW4tZGVidWctbW9kZSIsIGZkLA0KPiBod2Up
DQo+ICAJCXRlc3RfYmFzaWNfb25saW5lKGZkLCBod2UsIFNIQURFUl9CUkVBS1BPSU5UIHwNCj4g
RElTQUJMRV9ERUJVR19NT0RFKTsNCj4gDQo+IEBAIC0xODA3LDYgKzE4MjcsOSBAQCBpZ3RfbWFp
bg0KPiAgCXRlc3RfZ3RfcmVuZGVyX29yX2NvbXB1dGUoImludGVycnVwdC1hbGwiLCBmZCwgaHdl
KQ0KPiAgCQl0ZXN0X2ludGVycnVwdF9hbGwoZmQsIGh3ZSwgU0hBREVSX0xPT1ApOw0KPiANCj4g
Kwl0ZXN0X2d0X3JlbmRlcl9vcl9jb21wdXRlKCJpbnRlcnJ1cHQtYWxsLW5vLWxyIiwgZmQsIGh3
ZSkNCj4gKwkJdGVzdF9pbnRlcnJ1cHRfYWxsKGZkLCBod2UsIFNIQURFUl9MT09QIHwNCj4gRElT
QUJMRV9MT05HX1JVTk5JTkdfTU9ERSk7DQo+ICsNCj4gIAl0ZXN0X2d0X3JlbmRlcl9vcl9jb21w
dXRlKCJpbnRlcnJ1cHQtYWxsLXNldC1icmVha3BvaW50IiwgZmQsIGh3ZSkNCj4gIAkJdGVzdF9p
bnRlcnJ1cHRfYWxsKGZkLCBod2UsIFNIQURFUl9MT09QIHwNCj4gVFJJR0dFUl9SRVNVTUVfU0VU
X0JQKTsNCj4gDQo+IEBAIC0xODE5LDYgKzE4NDIsMTAgQEAgaWd0X21haW4NCj4gIAl0ZXN0X2d0
X3JlbmRlcl9vcl9jb21wdXRlKCJpbnRlcnJ1cHQtcmVjb25uZWN0IiwgZmQsIGh3ZSkNCj4gIAkJ
dGVzdF9pbnRlcnJ1cHRfcmVjb25uZWN0KGZkLCBod2UsIFNIQURFUl9MT09QIHwNCj4gVFJJR0dF
Ul9SRUNPTk5FQ1QpOw0KPiANCj4gKwl0ZXN0X2d0X3JlbmRlcl9vcl9jb21wdXRlKCJpbnRlcnJ1
cHQtcmVjb25uZWN0LW5vLWxyIiwgZmQsIGh3ZSkNCj4gKwkJdGVzdF9pbnRlcnJ1cHRfcmVjb25u
ZWN0KGZkLCBod2UsIFNIQURFUl9MT09QIHwNCj4gVFJJR0dFUl9SRUNPTk5FQ1QgfA0KPiArCQkJ
CQkgRElTQUJMRV9MT05HX1JVTk5JTkdfTU9ERSk7DQo+ICsNCj4gIAl0ZXN0X2d0X3JlbmRlcl9v
cl9jb21wdXRlKCJzaW5nbGUtc3RlcCIsIGZkLCBod2UpDQo+ICAJCXRlc3Rfc2luZ2xlX3N0ZXAo
ZmQsIGh3ZSwgU0hBREVSX1NJTkdMRV9TVEVQIHwNCj4gU0lQX1NJTkdMRV9TVEVQIHwNCj4gIAkJ
CQkgVFJJR0dFUl9SRVNVTUVfUEFSQUxMRUxfV0FMSyk7DQo+IC0tDQo+IDIuMzQuMQ0KDQo=
