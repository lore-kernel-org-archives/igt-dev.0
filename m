Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC63EE68973
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 10:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D6310E856;
	Thu, 31 Oct 2024 10:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uc2Je0Pk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D86D10E28C;
 Thu, 31 Oct 2024 10:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730371518; x=1761907518;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GSeyGAXAYjh7ZiRBgFX6o/Zi/DpbdKxfVydU+hXL2P4=;
 b=Uc2Je0PkbM4Wh2SzZFNiNYBuwJmOo1izs014gWOMS/caDp+FN1QMwiJI
 Mf09UXvmoB1ZSjrPvtUBI4Qe0i+OP46AV4GUOoEyxhldVHAPrRNG4A0o/
 maHq38zzvWLlNueDSN7a2Zfrc9xqaQof+rq8Lk8dx95NOAu/RVt2aa9Zd
 YkSPqpSouQ0GoSbc4Va7v4qHSgrxlqbV6O495JipfHnt6/PUa3WX2VoeI
 eemJy7oho1CYFRM1F4p5GPIoM1+oPuqPgqnK459HVeyopXxlUKpwiFWdL
 YMPShoMscPGlZqajmkiNUYvnkZTLEzcflZqXqR98uWZCxZrCxc4T8WtI2 A==;
X-CSE-ConnectionGUID: N3sdke8QT+e8I0qmfsnULg==
X-CSE-MsgGUID: nwp9J6HKRPS7XV2WFB4t2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29960300"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29960300"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 03:45:18 -0700
X-CSE-ConnectionGUID: aitR320VTCyDQiPhmnqCdA==
X-CSE-MsgGUID: EqJTdAAcTYOUQOhhHYSeOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="87384739"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2024 03:45:18 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 31 Oct 2024 03:45:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 31 Oct 2024 03:45:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 31 Oct 2024 03:45:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uG089TP04XpUi75UuFHanPXL1KX5APiJU/Nmm8Lmegk56gwwNlxDfLPKe/Yb/Fw1YwxxAh6ITyMwPuu9zlVHJ0jAhpQLOIYTvtfRb99hnFk3fE3y/R8C5y4AlgLGaJ19f58EnWKlKjhkONlKcn+pN2LBO1UjVl3fDTCPVEsabV0FhRhGm2kYfpGOxm88tV5Xg520+l5e0sDCLFjT3ZOPgZHOW8farS192XLcB+KA5Hq1CO5D2/WmZUOZNy9K7+BimcIiik7tr1m0GDJTVoQ5LAXnn1K4z5wjDwI5/9WUkzZPGVSBNHPmRNInIB1RXjNu0eWd45HupllXGmDhJW6xDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSeyGAXAYjh7ZiRBgFX6o/Zi/DpbdKxfVydU+hXL2P4=;
 b=SQcrKq9dsSYlbeBgTRYCuhk5NKeBgBt46Ls4hhqvcJX+H0nvdr9tx0+cU6+UFsGENFNjy1B+hpbkwElVMHCHg021meS+4r068Qw5/5/qftjT7fLLqZ4MThmTyES36b6kk07zgTrTqZNd8s/NqIkWezcwMNoAW2zepI7WkXCzrXl/7iO06CjUUSvTD2FqfmWWSbGuKYMndS/JoZVHZAX/nl0QuQtO+ibYB1YcMTLgy64SUB4JvhfbrbRtbtttvC99b4pjILWe04y4C5heeTFkaluocFcjlyNS/wJPnUMMrfZj46nXe2c4ZGN07bzkYnjYlSrCWWfmJ8e/SvXlRZIOfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 SA1PR11MB7109.namprd11.prod.outlook.com (2603:10b6:806:2ba::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 10:45:09 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9%6]) with mapi id 15.20.8114.020; Thu, 31 Oct 2024
 10:45:09 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBGaS5DSS5CQVQ6IGZhaWx1cmUgZm9yIHRlc3RzL3hlX2V4ZWNf?=
 =?utf-8?Q?comput=5Fmode:_Use_valid_exec_queue_for_bind?=
Thread-Topic: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMveGVfZXhlY19jb21w?=
 =?utf-8?Q?ut=5Fmode:_Use_valid_exec_queue_for_bind?=
Thread-Index: AQHbK3cTkK63l2vIWk2hhVWCHm9nI7Kgn9wAgAANAvA=
Date: Thu, 31 Oct 2024 10:45:09 +0000
Message-ID: <DM8PR11MB5655FDEAC754F35569D27734E0552@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20241031073604.35976-1-zbigniew.kempczynski@intel.com>
 <173036681772.1365305.11372994320704010202@2413ebb6fbb6>
 <20241031095812.fg4zp3bur325bcs4@zkempczy-mobl2>
In-Reply-To: <20241031095812.fg4zp3bur325bcs4@zkempczy-mobl2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5655:EE_|SA1PR11MB7109:EE_
x-ms-office365-filtering-correlation-id: 8825ec80-42ae-4bef-6e16-08dcf9991746
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OEUzLzBKMys3ZlpRNUI0UmlkbjVZMjlOeDg3U0pEczd2N1hsYnBEeUpwNE1v?=
 =?utf-8?B?R0NCaC8vMnhUU2tuYlNOaHphV0pOd0Jyc2Ztd3kzaXNyK2oxM3NxaWlQTytT?=
 =?utf-8?B?aEh4NWNBVkZkRk8rY0M3U1lXUHRwb3VMK2VoRjhWd2dDZmhxaTVwRjNXbm5x?=
 =?utf-8?B?L29QSkhnVStaMFVFZlhFcTdkWnpCWmgyWGR0NndlcU1ETStVRE02QW5YQnpo?=
 =?utf-8?B?dHZuYjlOTjV6WCtUNHVoOUFSbFkxbDI4SzBGZXI5WDhWamlMc3FZTG9SSlQ3?=
 =?utf-8?B?dFhuM3ZhWjA0Vy95OEVoaURjNk94dlJrVGdlaHVUVml6cEdKL29VYUxKaWRa?=
 =?utf-8?B?SVpaZEIwZDNRZW9xSFdmOW5wbGY3SFd4bUhaaWU1a1BUZEo2SEJ5WmgzOU44?=
 =?utf-8?B?Sm1jZ0NGSnJ5amNHeURjdnRXODQ5aFhIZW1UbkZ0TTZUMisvTFhiUktpWGQx?=
 =?utf-8?B?MkJBeXM3cHZHMDA2ZWRqcVRWRXZoSkxNK0RaVVh6V0dyd1RVWTJtV2QrT0dl?=
 =?utf-8?B?OHcrVlpnaHFsODZNVXBYU0NkbmsyZjhYNVNzQlJuRjVjcVBYeFNVUDJ3WE55?=
 =?utf-8?B?MHA4Qks0TUMyT0NMV3gvcGZZN2xXblAyaEFGVld0a0kvWjN1NWFlYUFiYlpl?=
 =?utf-8?B?OGZGZVRFcXc3ZEFRTXo2c3hrMTUzWnpaL2NmaGp5b21BTE5pdUw2L3pGS2pU?=
 =?utf-8?B?b3BnRE9mZThQRnFHZDd2VVhYZDgzb0pQRDdzZzh3U2NJdlNOU3B4QmhXM294?=
 =?utf-8?B?c0lvQTM5ZXZmRnk5TFdvbTJDbjlZWUFTbHlqLzJSNUdsRlZ2Y2VOVk5UNHJj?=
 =?utf-8?B?dWxJKzMzemdRMUJxMGRsR1M5NDdpUjJySkorWEo2cEFNalhBRDVnVmdjUlBC?=
 =?utf-8?B?SGVJdjkwOVJiK1Nya1RRTXBxVzA5cGt6WVhIUHdNRlVYR1NiTUYxdkoyK2Zw?=
 =?utf-8?B?Snp2OElmYU1FWXgxTDAzcm42TVNFbWJrRDV3dWNsdThXeVJoSEE2UGVmbHlP?=
 =?utf-8?B?WE1USmtuMFR2RVVwOUlBWDU3WnYvRUxEWWN1MkZMTEJDSWtXSWlHQUQvRk1M?=
 =?utf-8?B?eXZJMHVzaHZselkzQi9mbk9EZ2hPc1ZVM0tJSko5b3ZNcHJtUExHUndldFo3?=
 =?utf-8?B?YktlR1JEemR6UmlwYUZMOTMwUlJBa0RISlgzOEZOdGhScC9GakJhTzNtak0w?=
 =?utf-8?B?ZTBhcm9seTVGMEc5QVNGdzlzQzRGeHJoKzloZXVnc1pWY0dxbkpJUlRYR1hQ?=
 =?utf-8?B?czVIa2E1RmMvNmQxNWQ4SkFxN1pQeXZNUVlhSHdKYnJKaFhrQzJDbmVkaFQ0?=
 =?utf-8?B?TDNqWDJxMU5YdFVxVWdHc3AvakZySnNqOHBndkdGLzZ6UUY5UXFYNnFNejY5?=
 =?utf-8?B?UUVaQzVKNlJuT01VOUVmaWM0VlZ6QUlHMzNQZXVEYnRzbGd3cU5rUTByUks0?=
 =?utf-8?B?K2o4c2VXcFhtSDFEVjYvc3B1SHcwanRneERkdUhBS3lGYzY4WDVIVnUrWDJy?=
 =?utf-8?B?R3ZYYUIyU3crYkxRV2RyRW9MVGoySW5uZXROUXJ0WmxYZCt5Mk5hSzJZUlBU?=
 =?utf-8?B?K1hzOXNJWGpVK1lETG5kYUlrczY0Y0NPL1o5aG1TYVRUUGZBY0pKazBLOUYw?=
 =?utf-8?B?eU5QTUJOanpwdERINlEvd2lWcFIwNU5qdXZhbTB0WWVVSkpTRjgxdnJyUXBN?=
 =?utf-8?B?a2ZmRllocVRvRjdmZWRsUkM2Q0RoNEhsUVlLNWl4RDZBNEVjem1DbS9UNVpP?=
 =?utf-8?Q?Afo5Y2P83i4ojMZeXNsOTh7F6n3l1Y3cAQEMYqu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5655.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1luOHBsQm5qWEY5TitiTnhkTXliKzYrclNyWGlaY2lFOTZxRXl2THZVamNy?=
 =?utf-8?B?VUNMcEtBelZrTU1kWTFES3luaXlVcDJtZGdLSGVLSzBmOGVxdEZnZHFnWWdv?=
 =?utf-8?B?RTZxbTVlemFhZmdqWTJpNm5FemFOVHFyeXRjQ3U2MmtTVVdXWE5EOVdUaEE3?=
 =?utf-8?B?b00xZkhWY0E3dGMzNUM4aVRFOG96UGxhZThVdXkwWVFwRDBJTGo5blRxNmY1?=
 =?utf-8?B?TURPUnV2MEsvbU9jT3ZVRG00YnB0UUJqVmNDN1lSSWxBbzdCbld6cjVxc1JI?=
 =?utf-8?B?UkpVVUI5NFdjWG5FUXI3V0U0UkNkSHB1YktKSlE4aWpkYjR1S2FUa081SlNN?=
 =?utf-8?B?dEhSa0pYRllQdnc2SzRhTzBmR3VDbTA2NlRBczhKNGQraDZqQ2J4dW45VEpX?=
 =?utf-8?B?M24vZkZadisrbDlMei9hNW9TZnlrYi9HdlA5OGhIVWdFT0lhMDFHQmJvMzgz?=
 =?utf-8?B?TFNzLzdjUm9CZkJ3dnluTnpKQXoya1MxR09nVlZ1aVZKVzFQUU84cE9XTi9I?=
 =?utf-8?B?TWZwS2d1cjFZMVovNHZVZEI2azAveUhKY0hjZVp6cXlrdmp6YjJ4QmViTFdL?=
 =?utf-8?B?U1FkUHJ1OC9sZmtYV21PVldiaGNtc2kra3pnWnlNbnRGa00zaG54VzdqOWwv?=
 =?utf-8?B?czg0MTBTZm1COVJrWE5sNTFpQmx2S2RQOTBxVldYT0J5NWVON3BOLytEWllQ?=
 =?utf-8?B?VDdTRTBaclJ3ZjMzYW5KUGtYSVRmZ2thV3Ixa3NHcEM0YjZWMGpkRE5NTDdX?=
 =?utf-8?B?UjhHZHdKME5mNnZ0TGFMVkJhQmZPTGxZSlR3MXo3YTZFZGVGdHEyb2VOOW5l?=
 =?utf-8?B?QkRFRE1iSmE4QzZGdGNrcmYvOHF0TEdYRURnUmIxb0dWQlhjMWwvd28raExz?=
 =?utf-8?B?cnlTU2c3emg3VHVhY1phYlRrZUp0MFVtcFdlTEdLd0V2WFdNczEwOG1hMHBW?=
 =?utf-8?B?a0RzcVBQTjZ5MHNaaUQ3U1V5bGpaM1FpWGw4NitVWHZjT1E4ZXJ0V1psYUFv?=
 =?utf-8?B?Wkk2ckluclI0ZjdydjNYWkdrRm4yZTdUSjVleWNWWTAybXoxTkFVNzBMdWtr?=
 =?utf-8?B?emllU2xZRHVNSXdvL1JXc0RTVCt0Unh0N2FwckdyNDNzY3NxLzVaVEFUMjFp?=
 =?utf-8?B?b2lIWmRRZ3R6WEViYWRsM29rYUhhUkZZR2IzK0hKaS9iNG9wU043cXdSUFh0?=
 =?utf-8?B?YVlVQVZHQ1FPYm4vRlppajlPOGtacGxlRkFFNEluS1NMcUcrcWdCUzZWN1E4?=
 =?utf-8?B?YUc1NnMyeWdHa1grNnVtSzh1cjBYVHd1b2haSE9zRVc4MnRrV3ZmRnJjd2JJ?=
 =?utf-8?B?N2VTbWFXYTBrZWRaWFFVSWJ0TFZYcGw2dDlQcGxNOUhwV1B0MTFnOHB6YVRV?=
 =?utf-8?B?VEdJdEFsNG02UlZjTnRDR3FGdUFSUTEzSW9oaWFmRHlKRjdrY2pjWXFWR0Ry?=
 =?utf-8?B?dTBYQkpPRkRQK1BEQWt1cDQ3VzYyZEppNHI3R2tQNzFaS0YyR0dHclJuOGpm?=
 =?utf-8?B?WmNDZGpBd1dZMTNUbjYwUWlZS0NCbkZmeGY0VDNkdzd6WTFBT0F2c3dDLy9T?=
 =?utf-8?B?b1k3enhSR0lGdXFqNFZkMEFTNUs2UkhsMnA3Z0E0Q2tkWjkxci9xTG1VUnEr?=
 =?utf-8?B?Ri92TjlaQkVVMWFjblJvSFRjM1lwUzROMFFWSFZQY3E5aTVVdjRKZlJwUzg0?=
 =?utf-8?B?Q0lxdHROR1VZNytoRzRSd2w4Y0xiaXJBWTN4QllIaDN2d1J1U0NRNkIzbHhT?=
 =?utf-8?B?ZTFlWEtpdnVqbWszc0F3MndyakZJNXdkYmpTZzRrRWxQNWwwZGRsbk5pRjcx?=
 =?utf-8?B?MSsvdThsbmdPdVFIMlM0cmg4YmN5ZlFMeEgvSWw4ZENBck9UcGNiUHdNNjJC?=
 =?utf-8?B?dngvUXZQM3lQenAvRVo3UXl5OGhuS1AyQlJxTHhrMTgyU0xUUmlRWnVJTHlE?=
 =?utf-8?B?WFdaSHpGM3NUTk5WYUI1MmJyRFZ4cGxQQ2pWaHNxaUpMUFo4LzQycnJmbDFr?=
 =?utf-8?B?cHcxVy9HdkNvdVRCRnZtYURRL1crSERiejlpQ3AyQ1FQQThPMlRHNVZLa3RE?=
 =?utf-8?B?TlNsVnlxdkJmTkpBN0JGU0ZNcTA1b2VaRStlNEt3VlB0aGV6ZC9LRHczeVhk?=
 =?utf-8?Q?CZZrCXSSX+FTNOQcN1fi1emQp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8825ec80-42ae-4bef-6e16-08dcf9991746
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2024 10:45:09.5469 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pm7a9CHAJN9QAtiQuYzFH7ZGxNuWbQhqxlBx4zAM3MIkd/UfkA1eHkWZAIJoUOqrUN937wbwRtUNrJw7PPqZaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7109
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

SGksIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGlndC1kZXYgPGln
dC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBaYmlnbmll
dw0KPiBLZW1wY3p5bnNraQ0KPiBTZW50OiBUaHVyc2RheSwgMzEgT2N0b2JlciAyMDI0IDExLjU4
DQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogSTkxNS1jaS1pbmZy
YUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IOKclyBGaS5DSS5CQVQ6IGZh
aWx1cmUgZm9yIHRlc3RzL3hlX2V4ZWNfY29tcHV0X21vZGU6IFVzZSB2YWxpZCBleGVjDQo+IHF1
ZXVlIGZvciBiaW5kDQo+IA0KPiBPbiBUaHUsIE9jdCAzMSwgMjAyNCBhdCAwOToyNjo1N0FNICsw
MDAwLCBQYXRjaHdvcmsgd3JvdGU6DQo+ID4gICAgUGF0Y2ggRGV0YWlscw0KPiA+DQo+ID4gICAg
U2VyaWVzOiAgdGVzdHMveGVfZXhlY19jb21wdXRfbW9kZTogVXNlIHZhbGlkIGV4ZWMgcXVldWUg
Zm9yIGJpbmQNCj4gPiAgICBVUkw6ICAgICBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5v
cmcvc2VyaWVzLzE0MDc1Mi8NCj4gPiAgICBTdGF0ZTogICBmYWlsdXJlDQo+ID4gICAgRGV0YWls
czogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjAxMi9p
bmRleC5odG1sDQo+ID4NCj4gPiAgICAgICAgICAgICAgICBDSSBCdWcgTG9nIC0gY2hhbmdlcyBm
cm9tIElHVF84MDkwIC0+IElHVFBXXzEyMDEyDQo+ID4NCj4gPiBTdW1tYXJ5DQo+ID4NCj4gPiAg
ICBGQUlMVVJFDQo+ID4NCj4gPiAgICBTZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21pbmcgd2l0
aCBJR1RQV18xMjAxMiBhYnNvbHV0ZWx5IG5lZWQgdG8gYmUNCj4gPiAgICB2ZXJpZmllZCBtYW51
YWxseS4NCj4gPg0KPiA+ICAgIElmIHlvdSB0aGluayB0aGUgcmVwb3J0ZWQgY2hhbmdlcyBoYXZl
IG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlcw0KPiA+ICAgIGludHJvZHVjZWQgaW4gSUdU
UFdfMTIwMTIsIHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbQ0KPiA+ICAgIChJOTE1LWNpLWlu
ZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhlbQ0KPiA+ICAgIHRvIGRvY3Vt
ZW50IHRoaXMgbmV3IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2UgcG9zaXRp
dmVzIGluDQo+ID4gICAgQ0kuDQo+ID4NCj4gPiAgICBFeHRlcm5hbCBVUkw6DQo+ID4gICAgaHR0
cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjAxMi9pbmRleC5o
dG1sDQo+ID4NCj4gPiBQYXJ0aWNpcGF0aW5nIGhvc3RzICg0NiAtPiA0NikNCj4gPg0KPiA+ICAg
IEFkZGl0aW9uYWwgKDEpOiBiYXQtZGcyLTEzDQo+ID4gICAgTWlzc2luZyAoMSk6IGZpLXNuYi0y
NTIwbQ0KPiA+DQo+ID4gUG9zc2libGUgbmV3IGlzc3Vlcw0KPiA+DQo+ID4gICAgSGVyZSBhcmUg
dGhlIHVua25vd24gY2hhbmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbg0KPiBJ
R1RQV18xMjAxMjoNCj4gPg0KPiA+ICAgSUdUIGNoYW5nZXMNCj4gPg0KPiA+ICAgICBQb3NzaWJs
ZSByZWdyZXNzaW9ucw0KPiA+DQo+ID4gICAgICAqIGlndEBrbXNfZmxpcEBiYXNpYy1mbGlwLXZz
LWRwbXNAYS1kcDE6DQo+ID4NCj4gPiAgICAgICAgICAgKiBmaS1jZmwtODEwOXU6IFBBU1MgLT4g
RE1FU0ctV0FSTiArMyBvdGhlciB0ZXN0cyBkbWVzZy13YXJuDQo+ID4gICAgICAqIGlndEBrbXNf
ZmxpcEBiYXNpYy1mbGlwLXZzLWRwbXNAYi1kcDE6DQo+ID4NCj4gPiAgICAgICAgICAgKiBmaS1j
ZmwtODEwOXU6IFBBU1MgLT4gSU5DT01QTEVURSArMSBvdGhlciB0ZXN0IGluY29tcGxldGUNCg0K
DQpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5MTUva2VybmVsLy0vaXNzdWVz
LzEyMzI4IA0KDQo+IA0KPiBVbnJlbGF0ZWQgdG8gdGhlIGNoYW5nZS4NCj4gDQo+IC0tDQo+IFpi
aWduaWV3DQo+IA0KPiA+DQo+ID4gS25vd24gaXNzdWVzDQo+ID4NCj4gPiAgICBIZXJlIGFyZSB0
aGUgY2hhbmdlcyBmb3VuZCBpbiBJR1RQV18xMjAxMiB0aGF0IGNvbWUgZnJvbSBrbm93biBpc3N1
ZXM6DQo+ID4NCj4gPiAgIElHVCBjaGFuZ2VzDQo+ID4NCj4gPiAgICAgSXNzdWVzIGhpdA0KPiA+
DQo+ID4gICAgICAqIGlndEBpOTE1X3NlbGZ0ZXN0QGxpdmU6DQo+ID4NCj4gPiAgICAgICAgICAg
KiBiYXQtbXRscC02OiBQQVNTIC0+IEFCT1JUIChpOTE1IzEyMTMzIC8gaTkxNSMxMjIxNikNCj4g
PiAgICAgICogaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZUB3b3JrYXJvdW5kczoNCj4gPg0KPiA+ICAg
ICAgICAgICAqIGJhdC1tdGxwLTY6IFBBU1MgLT4gQUJPUlQgKGk5MTUjMTIyMTYpDQo+ID4gICAg
ICAqIGlndEBrbXNfY2hhbWVsaXVtX2VkaWRAaGRtaS1lZGlkLXJlYWQ6DQo+ID4NCj4gPiAgICAg
ICAgICAgKiBiYXQtZGcyLTEzOiBOT1RSVU4gLT4gRE1FU0ctV0FSTiAoaTkxNSMxMjI1MykNCj4g
PiAgICAgICogaWd0QGttc19jaGFtZWxpdW1fZWRpZEB2Z2EtZWRpZC1yZWFkOg0KPiA+DQo+ID4g
ICAgICAgICAgICogYmF0LWRnMi0xMzogTk9UUlVOIC0+IFNLSVAgKEludGVsIFhFIzQ4NCAvIGk5
MTUjNDU1MCkgKzEgb3RoZXINCj4gPiAgICAgICAgICAgICB0ZXN0IHNraXANCj4gPg0KPiA+ICAg
ICBXYXJuaW5ncw0KPiA+DQo+ID4gICAgICAqIGlndEBpOTE1X3NlbGZ0ZXN0QGxpdmU6DQo+ID4g
ICAgICAgICAgICogYmF0LWFybGgtMzogQUJPUlQgKGk5MTUjMTIwNjEgLyBpOTE1IzEyMTMzKSAt
PiBBQk9SVCAoaTkxNSMxMjEzMykNCj4gPg0KPiA+IEJ1aWxkIGNoYW5nZXMNCj4gPg0KPiA+ICAg
ICAgKiBDSTogQ0ktMjAxOTA1MjkgLT4gTm9uZQ0KPiA+ICAgICAgKiBJR1Q6IElHVF84MDkwIC0+
IElHVFBXXzEyMDEyDQo+ID4gICAgICAqIExpbnV4OiBDSV9EUk1fMTU2MTUgLT4gQ0lfRFJNXzE1
NjE2DQo+ID4NCj4gPiAgICBDSS0yMDE5MDUyOTogMjAxOTA1MjkNCj4gPiAgICBDSV9EUk1fMTU2
MTU6IGMyNDU1NTcwMDdhZjBhMWMyM2RhMDBjNDc3MzJhZTFkYWRkYTdkZDMgQA0KPiA+ICAgIGdp
dDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2dmeC1jaS9saW51eA0KPiA+ICAgIENJX0RSTV8x
NTYxNjogYmFmMGY1NDkyZWU2NGQ5ZWRhYTRhOWFhZTQ3YzdkYzZkYzNlMmMzMSBADQo+ID4gICAg
Z2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZ2Z4LWNpL2xpbnV4DQo+ID4gICAgSUdUUFdf
MTIwMTI6IDEyMDEyDQo+ID4gICAgSUdUXzgwOTA6IGVmODE4ZmIzYTczZDZkNjlkMDlkNTczYzJh
NmQwNzFiMmM3ZGM4NGEgQA0KPiA+ICAgIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9k
cm0vaWd0LWdwdS10b29scy5naXQNCg==
