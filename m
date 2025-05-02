Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E8CC3ABAA
	for <igt-dev@archiver.kernel.org>; Fri,  2 May 2025 21:58:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D989710E969;
	Fri,  2 May 2025 21:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PaAXxh+s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC5510E969
 for <igt-dev@lists.freedesktop.org>; Fri,  2 May 2025 21:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746223121; x=1777759121;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VPXzntTPTVJ+0B93/h6kaw4DzLj5LtvaBiNzutCIzaU=;
 b=PaAXxh+s3JWu1FZkRte/SU5Cbkwd1HC7NdRgkvNEXsML95eUZgrHN3Dj
 slr3iROn0TJcA5U0NJhIysHrdroxidJynzd9G2/mjYWK75CUJqTzu4tg8
 eAYEKSDgA31MEknakmxDA88HNqAfjAsqmixY+iVsD4phm3bIIBQxnEh9V
 SCrv1wJX7Kxk2P1kmKETOaKsYECR7ffOeSKSK793K2ER/aFHunMn6jXza
 fWjJ1ngyvcYu2sOEhRPyh5zIbY71Le7iPAxYgi9ovE+9rNOPRo8z2oWLV
 vtwuxX2jtWfy/0bcbAsvNm5fzctw41QP5IN5nksdV+WC7MLhkLeMSgtzO w==;
X-CSE-ConnectionGUID: t8BPS8DFQ0+T/+hUJk8H8Q==
X-CSE-MsgGUID: jt3oTGglTjeDxosgESTxpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="48055804"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; d="scan'208";a="48055804"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 14:58:37 -0700
X-CSE-ConnectionGUID: uHDw9peMTBONaEp6qslVTw==
X-CSE-MsgGUID: UpUHX6SDRRi8eLdvAd2/Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; d="scan'208";a="135239945"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 14:58:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 2 May 2025 14:58:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 2 May 2025 14:58:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 2 May 2025 14:58:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWhFXSMy9lwHCqp+s3zvP01HMSnCKwfVN0FVzZAQ4bus8F7crmPNs8pFdJq5kNJcCAP+y2jyK9eOmZjtXy/RRi1hdVGA3WigOHbNDql0Rfv+6kSit6L5/ZwmU1wTh299ze+RMw/vLJgnYca+io8xqJH2NpmLm/hJGwh2JPEScjfopVHzztRkgMJkA+TD3QMvao58YVF6AkPWwZAJ2vcTvdTjQuWlWoejBeClHkksuoIi5GgR1qKmcDFyt5D9g8eOrdKs3ZIPSqjn1e3j/E84pNPXrY/jqkVQ7kXzYRuu5O4lERUDFv5mtBVrWSLTS4vsU2/hWi110yFbu1BvFIEvIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJR+bzWb9tA87gzl9dwHnzOxZYkhcKz+5QuXr01LZcc=;
 b=gbvxg88eA7BLkNS6jzFBSMFMGXDny3i8ARGCAj8WSbop1N7VcA11+915YJHIZkkW0+BNhp5fNJ6qsurSmYlFClImVXYaXY9kH6EIXBdxUgNDmSRp8SBSivYid0cJ8fMRhzkpwSu371yn9mcVz+OE+1sd8kKYJq6MlL33J0F+VKdfhr24MHJ2xZpe8QRIma8Mpeldq/CQf60uGi0Q0BtVri3QJqvaS3q8WJrAoW4kJFWeEPKTvzoWAVnsosnkAXfHith/I5Cbil83COnMTXcgnPmLaI56a3AWxUOxzbJj2/q7UIahzNmzZgBzujpjK0RVnyJ0zWdo9smlsIybZ+LGZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA1PR11MB6075.namprd11.prod.outlook.com (2603:10b6:208:3d5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Fri, 2 May
 2025 21:58:00 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8699.022; Fri, 2 May 2025
 21:57:59 +0000
Date: Fri, 2 May 2025 14:57:58 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_oa: Add a new mmio triggered test
Message-ID: <aBU_5mR_kfbpHagR@unerlige-desk.amr.corp.intel.com>
References: <20250430091655.603509-1-sai.teja.pottumuttu@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250430091655.603509-1-sai.teja.pottumuttu@intel.com>
X-ClientProxiedBy: MW4P223CA0016.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::21) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA1PR11MB6075:EE_
X-MS-Office365-Filtering-Correlation-Id: f52031a6-ae70-4641-2bbe-08dd89c46758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2pLSnFTUU1ON2JKUm51N1AyM0NTTkZYQVNaQ0Z4OFVOR3BmVzhaQmpjTE5P?=
 =?utf-8?B?bWpnVVVXZ0xmVnhHQ21lSVd0K29wb1JlVW9ma1poS3JvY3lJMHBOYVgzL012?=
 =?utf-8?B?dWJWZ3pRMVdzSHJzdnBzM3N1bE9JK1JsL0pvMXBPdFVIZG1pVXVUa1A5N21v?=
 =?utf-8?B?SEE3b0loQzV6VmpDR1NCY1ZTc0Q3MkV0cjEwVmNNRlpscTBSUEJJZkszSFpF?=
 =?utf-8?B?QU5uT0tZRWJDV3oxKytTb0ZTZFhFZ1Z6SkJieU9LNUllK3N4RTNSRXpURWsw?=
 =?utf-8?B?RWhkSUNEekFoMXZjc3N2emRIdUxrcVgzMXF5bGlMUm01c0xjNTVjSEt6YWFm?=
 =?utf-8?B?QXBlalBFL21jMjdPVlVjTThBWFprWW1RZ2ZBdUsvSVhubjdQTDllUlZMVHk1?=
 =?utf-8?B?SnhpNGlWNGpBMlhBWHA0MzFQREo3MlZycy9qU0dJTHNweHBrZzMwd29ZeTho?=
 =?utf-8?B?NUs2QkVFTVBMMkRLVHdVakhKUkd5Um9JTk1pZTY3RjZqL2tCZ3JVK1hTWTU1?=
 =?utf-8?B?ckNycUk2WWtJSU8xY1BaVk93dEhuZlVDWFFZa25hZENZcU9xemxrald1eFh1?=
 =?utf-8?B?cEp2ZUZuWU1nbEFvMDczQ0YyT1YrREgwQXJzbFRHQ1oyenduTXNwVUd0emFN?=
 =?utf-8?B?eUoyMnNZTU9JY3V1d1ladTZjOEc5bWEvV1hhYUs2Y0l6a045TGhzYXBKZjQw?=
 =?utf-8?B?WFJRcGNZdFp1YjM2UXhJcGpoU2lEdm5qZFM1VHhuR3NPbS9weFlPYzRPU0VE?=
 =?utf-8?B?SmNQSzZRTUZ4OUp1QTJRdWh5OTlBTzNEMWlKODVLSG5IZmluNVdNbTN5cVhz?=
 =?utf-8?B?RjZlSXNXUThGY2JyUEYzYUFLNUVnYndSeUtTbDlTT0dHYzJyWUtQMktBQ2Q0?=
 =?utf-8?B?dHJuU201N0pzd2tXWVRtd3F0Mmh3cXNWbkR0dlY3WnhpUjhpajl3U2NVMGkv?=
 =?utf-8?B?Y1VxVFk4Mlo5eklDVXpNbFoyRVdHUXZrMkNsSnB4UWN3VnpnSjZSd3RVQzYv?=
 =?utf-8?B?SyszbnZrV1BQVkxBZDljNldZY1hXN1VGZ0k5dkVmY0ZLQUIrdGdsa3pWYTla?=
 =?utf-8?B?eWJhSC94UUkzcmZscEVXcnk2MlJwQnBmSjBmZjBuQWtrTXlYWjltQmhmM3Nz?=
 =?utf-8?B?a21QbU5QVWVDam1sRXorL1ZUc0dkbXFhU2VQUmZoM3lsbHJaV0phd2dtMUF0?=
 =?utf-8?B?YkJCRGdiMVM5b3htZEYra0ZINkJ0TjBUSThaNjhKdXNqRGVtK3UvRmhQekdB?=
 =?utf-8?B?bU9HdW1ta0RBaWdrcjlqUkVqdlhqVzBQaTlmU2xDMXNXRnQvWVkzZVhpWWVh?=
 =?utf-8?B?NitwQTQ3ZHArMEYxMnc3eDJocytDdVZId0NXN2JSQmlNd002UTcxT2RtVXRJ?=
 =?utf-8?B?MlY0c1VTVVBGOVZOZjloci91UXRrOUhEUEYzTWtYV1A2WEI3SGNuVlMyWURv?=
 =?utf-8?B?dTdJZ0p2MW5uUFF3Z2dMYldmRjNRckNBNzBaSW9nTUNsTHlsZUhza2xWeVZH?=
 =?utf-8?B?eEk3Ykg2TXBySUF4MUxOWXhzN09oOVNTd1FBRm9sRmdFVStuTjhpTzltRzlL?=
 =?utf-8?B?blVpa2ZERGF5YmxxV2hiZUNaL3NpeEJwem1VUTk0TGVsdDBROXRwbk8wS0No?=
 =?utf-8?B?NjNEKzFYT3ZyVUh2Z3BMTnNiRCtVRy9vTmxHRjR3em51RGNVQkx4QlhxN2xz?=
 =?utf-8?B?ZzJNM203WTFDTUE0VnJDN1BTcUd4VUFFYmxQZ3FTeit0dGFlSTZIS1pOTm9T?=
 =?utf-8?B?emZvWTBjejlVY0M4VjRzZXphR2x2c0cvWGdIK1ZiZVB4ZEMyNFd0RWI4Q1g5?=
 =?utf-8?B?OHBZZEFxQklNVVZkSlFrYlRnVFFlKzY5bGhlNkdOb05yMEs2d0QxLytZVjBF?=
 =?utf-8?B?V2hLSjdibWhEWGREUmVxckJqQ0wydFMwT1preVg1K01wVmZUUktJUEZEUERp?=
 =?utf-8?Q?tBm3XDBJXZ4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTNuUWZtTjdSbXlRUi9ndHkvOVkyU3Nmc0pXalZjRk1VSGdnU21jQmZCTnlE?=
 =?utf-8?B?QnlKQjAwOHN1aHd3N0NCaGVML3hPUVZYRDRsL3RLd056SzJ2dEgxakwwejFk?=
 =?utf-8?B?a1llQTRhaVZiNXIzUW9KRlZkemJFOUNhU0xKWDMxMUUrTjIvWnYyOHVLcWND?=
 =?utf-8?B?SENRdE03cTErR0Ezc1Y4bnV1Mlc1V0JYZUREU29NZFN2T2prZUVZemtQUDg3?=
 =?utf-8?B?T2VLY1l0eDNVZmFDeE5SK1B5WFhlTi9NYkFjYVFpVTM5Y2ppQkQwU2tVOURU?=
 =?utf-8?B?RndNTG9kWE95RUlhTzV3ekRTQzVSUGJDMUYrdnFwT3lqOXd6cWZXUXAzdzJF?=
 =?utf-8?B?bmNpZkpzcW52TXBXdjYxU3RUYnJRY3lsYXptK24vUXVDWW41aTVWL1BKdEcw?=
 =?utf-8?B?N1MwT0pCT1NRWnY3Zjllb09vQ3lxbHlDVTBZRlM5clFxV3ptWTVvZW93RmlE?=
 =?utf-8?B?NXpZUXVjZG12SlYrcklsQmFkdjkwaUFiUC95VG0vYWp1VE9VSmgvTzBaUUs2?=
 =?utf-8?B?MDBnclozVlhFZXFKV0RtdWkvQ1kvTnozUU40TERSY2xkK0FQc3JiOTI2a3B0?=
 =?utf-8?B?TGh5eW5FQmRidXVqV2F3a1h0c2l2WVE1YTFxWHJ0RE96OWtweDh5Wk5qNis4?=
 =?utf-8?B?Z3RrejBGOUhPRjNmSDAxR2Yza1FNQjZ3MXpqd1dFdC9DVjcxemdlb3VyMk9m?=
 =?utf-8?B?RHVvdFhWTWpiL2RXNm1kUjdtRWJBTmZIOVU2eVgwRDIzU2pXRTRCNXB3Q3hv?=
 =?utf-8?B?RUhvOFZscW9VTFIzWGd4TVA4aUp0Z0tzRXVjNVUzZms0ODZ0ajdUeDJDSkdv?=
 =?utf-8?B?Q01JZE9ldzBOTElKYnJPWVhkS0pHK0hqUmFTME5XYVNhZmlZUFp1V3kvdVJO?=
 =?utf-8?B?VjNlSFpBM3FxK2NjeHFyRWtlb29FSHFOYXd3TDdDbXlzUjlmZlVXODB4citK?=
 =?utf-8?B?bG5PS1BOeHoyYTFFaVpXem9HaW5MN3cybjMra0NHV2swYVRyZTc2bFduczEv?=
 =?utf-8?B?NnBDdFc5N3U3ZnJ2VjVkYjNHb25pajdkdGlyc2hYbUR0RldRVVdRYTJTajFn?=
 =?utf-8?B?SlQvUFYzN1VQcVVPdHIyY1dSVVVpUGk0S3UyeXJjbEw2d3NzWkFqaVpjaDlY?=
 =?utf-8?B?NVUwRFA0d3RLQWJ5Y0I4dHZRTVgyU3ZNd3RxaU9yQzN3Si9rNFNkaU1oam1B?=
 =?utf-8?B?WE9hdTJRc1BSME51TEJLODNScWRrRmlMd2huendJdmd3emczazRqbWxRTDBE?=
 =?utf-8?B?M0lUZ0NPdDJHeDhMNVN2eDNHanJOS2o0TmpQUFhIVTAzNENTd0VTRjM1Wlp5?=
 =?utf-8?B?cWsxYjh1cnh0ai81RDZGWUEyY3dDZEg5cnRUZGpkSDY4WjVBSUZubnpHN1Fu?=
 =?utf-8?B?dEVUaXRMdjZVc0VMMVhtdlJtTWZQM2lVWmJKZEhyaUgyNmJ0TnJHV2dRUW9J?=
 =?utf-8?B?aTlTQkd1RzVOeE1TMjNZTklkZ0ZvNTE2UzM4QmJ4dVJnVUkrZzlEWFkzdy9r?=
 =?utf-8?B?QzRQOEI2K2pwTjR3UHJkY0NoNnBPZThheGh6MnNvK3hlbEJhd3g4cExZMkhM?=
 =?utf-8?B?VVIxWUMrUWErNm10cGJtUjVEak45a0RFYjV1L3hmdXA0QWRQWkV6aHNCR3d0?=
 =?utf-8?B?SmlzVGN2eGdadjhTVWZqZHI0TncvS3VQbS9Ia3QrcFh1VGtXUFB3bXdRNHNq?=
 =?utf-8?B?ZTZFb20wZnRUbmR4b2ErWjJUK2FBejJETDVYUmMxVkdUSVE2NG92bjg4ZHdO?=
 =?utf-8?B?T2tFS0Q4OHhrM2swN25DQ3FLTnp0eVVpb2t4cmYwSXNhcGtMRjFFMFBRTTVG?=
 =?utf-8?B?cW9VeHpsMWo3L20rcEtlOGZ1Slg3RXZtT1B6bHJ1elhvUnd2QVhaQkNZZE9W?=
 =?utf-8?B?VGoxT0djamlGbDl3d2JzV1NMYnh5RjdWcUFKSWp5Y0NIc2swcDNvSE5scmVT?=
 =?utf-8?B?R1pYQXN5WU95elFCS3hCdi9UODhHVEROR0piUU85TS96RE5MbXVjTmtlVHlh?=
 =?utf-8?B?NVVLWkx1MzhPZkR6YWdaTHdjeWtqY3lDNzhNQzJIV2t5L2R3eEZlYklmY3Br?=
 =?utf-8?B?T29VSC9KUGY5OHBFR3FaN0huaWw1dVFVYzFGS3ZWZS8xZ2J1dWs2cHNod3dz?=
 =?utf-8?B?SGJ4NCtVK1B3SzEvSkZCd00xYllFd0JPMExMdUk5QkRheFhkb0lYZUJMNmFz?=
 =?utf-8?Q?pRh3R314tDYrO4NsUuPVkxA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f52031a6-ae70-4641-2bbe-08dd89c46758
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 21:57:59.8566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXfk8ibpm6X3ln0AB9T9z8f3RzodGE1JCZOT15hUqN4oWTLILevksU5sIXQPi1hGhbypXN1bnFejpoaIPBi4NChrpeX/Clqz+uo8OQpQ7mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6075
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

On Wed, Apr 30, 2025 at 02:46:55PM +0530, Sai Teja Pottumuttu wrote:
>The current mmio-triggered-reports tests mmio triggered reports via a
>mmaped buffer. Add another test which uses 'read' system call to check for
>mmio triggered reports.
>
>v2:
>  - Add a check for len (Umesh)
>
>Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> tests/intel/xe_oa.c | 109 ++++++++++++++++++++++++++++++++++++++++++--
> 1 file changed, 106 insertions(+), 3 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 766f81a5e..90e863c8b 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -3959,12 +3959,106 @@ __test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
> 	__perf_close(stream_fd);
> }
>
>+static void
>+__test_mmio_triggered_reports_read(struct drm_xe_engine_class_instance *hwe)
>+{
>+	struct intel_xe_perf_metric_set *test_set = default_test_set;
>+	uint64_t properties[] = {
>+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
>+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
>+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
>+		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
>+	};
>+	struct intel_xe_oa_open_prop param = {
>+		.num_properties = sizeof(properties) / 16,
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+	size_t format_size = get_oa_format(test_set->perf_oa_format).size;
>+	struct intel_buf src, dst;
>+	uint32_t mmio_triggered_reports = 0;
>+	struct buf_ops *bops;
>+	struct intel_bb *ibb;
>+	uint32_t context, vm;
>+	uint8_t *buf = calloc(1, default_oa_buffer_size);
>+	int len, total_len = 0;
>+
>+	bops = buf_ops_create(drm_fd);
>+
>+	scratch_buf_init(bops, &src, rc_width, rc_height, 0xff0000ff);
>+	scratch_buf_init(bops, &dst, rc_width, rc_height, 0x00ff00ff);
>+
>+	vm = xe_vm_create(drm_fd, 0, 0);
>+	context = xe_exec_queue_create(drm_fd, vm, hwe, 0);
>+	igt_assert(context);
>+	ibb = intel_bb_create_with_context(drm_fd, context, vm, NULL, BATCH_SZ);
>+
>+	stream_fd = __perf_open(drm_fd, &param, false);
>+	set_fd_flags(stream_fd, O_CLOEXEC);
>+
>+	emit_mmio_triggered_report(ibb, 0xc0ffee11);
>+
>+	if (render_copy)
>+		render_copy(ibb,
>+			    &src, 0, 0, rc_width, rc_height,
>+			    &dst, 0, 0);
>+
>+	emit_mmio_triggered_report(ibb, 0xc0ffee22);
>+
>+	intel_bb_flush_render(ibb);
>+	intel_bb_sync(ibb);
>+
>+	while (total_len < default_oa_buffer_size && mmio_triggered_reports < 2 &&
>+		((len = read(stream_fd, &buf[total_len], format_size)) > 0 ||
>+		(len == -1 && (errno == EINTR || errno == EIO)))) {
>+		uint32_t *report = (void *)&buf[total_len];
>+
>+		if (len != format_size)
>+			continue;
>+
>+		if (!report_reason(report))
>+			mmio_triggered_reports++;
>+
>+		if (get_oa_format(test_set->perf_oa_format).report_hdr_64bit) {
>+			u64 *report64 = (u64 *)report;
>+
>+			igt_debug("hdr: %016"PRIx64" %016"PRIx64" %016"PRIx64" %016"PRIx64"\n",
>+				  report64[0], report64[1], report64[2], report64[3]);
>+			if (!report_reason(report))
>+				igt_assert(report64[2] == 0xc0ffee11 || report64[2] == 0xc0ffee22);
>+		} else {
>+			igt_debug("hdr: %08x %08x %08x %08x\n",
>+				  report[0], report[1], report[2], report[3]);
>+			if (!report_reason(report))
>+				igt_assert(report[2] == 0xc0ffee11 || report[2] == 0xc0ffee22);
>+		}
>+
>+		if (len > 0)
>+			total_len += len;
>+	}
>+
>+	igt_assert_eq(mmio_triggered_reports, 2);
>+
>+	intel_buf_close(bops, &src);
>+	intel_buf_close(bops, &dst);
>+	intel_bb_destroy(ibb);
>+	xe_exec_queue_destroy(drm_fd, context);
>+	xe_vm_destroy(drm_fd, vm);
>+	buf_ops_destroy(bops);
>+	free(buf);
>+	__perf_close(stream_fd);
>+}
>+
> /**
>  * SUBTEST: mmio-triggered-reports
>  * Description: Test MMIO trigger functionality
>+ *
>+ * SUBTEST: mmio-triggered-reports-read
>+ * Description: Test MMIO trigger functionality with read system call
>  */
> static void
>-test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
>+test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe,
>+			    bool with_read)
> {
> 	struct igt_helper_process child = {};
> 	int ret;
>@@ -3973,7 +4067,10 @@ test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
> 	igt_fork_helper(&child) {
> 		igt_drop_root();
>
>-		__test_mmio_triggered_reports(hwe);
>+		if (with_read)
>+			__test_mmio_triggered_reports_read(hwe);
>+		else
>+			__test_mmio_triggered_reports(hwe);
> 	}
> 	ret = igt_wait_helper(&child);
> 	write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
>@@ -4894,7 +4991,13 @@ igt_main
> 		igt_subtest_with_dynamic("mmio-triggered-reports") {
> 			igt_require(HAS_OA_MMIO_TRIGGER(devid));
> 			__for_one_hwe_in_oag(hwe)
>-				test_mmio_triggered_reports(hwe);
>+				test_mmio_triggered_reports(hwe, false);
>+		}
>+
>+		igt_subtest_with_dynamic("mmio-triggered-reports-read") {
>+			igt_require(HAS_OA_MMIO_TRIGGER(devid));
>+			__for_one_hwe_in_oag(hwe)
>+				test_mmio_triggered_reports(hwe, true);
> 		}
> 	}
>
>-- 
>2.34.1
>
