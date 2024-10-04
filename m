Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D58CF8849
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 15:42:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A4010E027;
	Fri,  4 Oct 2024 15:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JDafBd3L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B31910E027
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 15:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728056547; x=1759592547;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=buNJCr7jnnpAD+8sUr7nNi3V1FT0JBK81sZXr5B//H4=;
 b=JDafBd3LMeR6TVGsTtIpqjDnj04Kvng5za0NfBPlafCvF/vg7nU8z4PX
 tPF59/u0GHGWENIuFFa9bxmWOoU3oAQRCn3v9Dj4eHk464e7SPiifMEsI
 MYlJmhDFaStc0yhFL5Qdm07pZA1FWv9xkGzy1uper4L2WdxpxxG4ffNws
 cO1yfGF/cZ4T+tjbIT4I7mQZfrcUv/ItIXIgOG+bDwSJY527mwypEZ4k8
 c+BT2UDuHYb2/iT++IQe/EU6cI+YgiilxoIMOX06Wfb+EaT5M9cWQvnIM
 TPdnIyiR7+hkhfEsehaQzGLjp9sOMrem4DTVu22mnfRSL+/RjxQcf2NCq Q==;
X-CSE-ConnectionGUID: cNlTC07bQEaGLgvhmFMxWw==
X-CSE-MsgGUID: BZaHk5VrTyaQ858PYtohAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27164734"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="27164734"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 08:42:26 -0700
X-CSE-ConnectionGUID: wx1pC0AwTWuogRUoldjeDQ==
X-CSE-MsgGUID: USDTjIUaRpGfO/D2Fgk2Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="79312128"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2024 08:42:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 08:42:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 4 Oct 2024 08:42:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 4 Oct 2024 08:42:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nj7qL94KGw61yH5KyHbLbWuoVuTmRfawLI8BXGxXlXxaCB45xISX29eIkvWNCUq1np3VHzu/4y2Cs3Nl3PyjSscWpIkvObua4EwHkl+HKRdGGGKBGJUCeqtvLbcZ63qNsT39Z2UMSLT6gv4A4ED4V0+uZAxxIozEgBfr1xvDWV2wsCww7l1PPHKv9Xk/ev8LjDbJLkqzem/cvMfa4L8Uf7h7ojEAstRypqYtm4jAnJKO+MlAZNJ+BrbSJogYruAnc2SHhLZSxv1iWxeIQWkOiAk2YvEmkm3PB5+cFVaxRgeyJNhDXIsGauFRDtjYcmqh82NODAzGe5iaQjQi3pVpgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdCibEkUlCo+5jfBk9jqQJqz6kJhG0f6BcAAKXxz0Sk=;
 b=EDQA6t36neNGVhfqkaWQvTi3iJvWQ8Gh+mrp6UHlhGIxpQJYc4AYxtrFThZhe95e1nPyPnYLFd3yarWCVzzNHKdebj4REbm0YSQ9NBSSkhZueyGow1i0O4xcDOFzI5KHzkHDBecSgQQrFejpH+G0s/eez+HJpaewCk5JO4uU5XPwK/P9mBKVRCy4GjSnWD243d1ZBfQ74QWWV/aAJEpvrpuSfh4uz714zRIqH+F9csk4ECxpAZqrZTeWJhEUb4CR43wEN6FK+F01t8q/A4oqIlYbF7q6TgQiLoWIIhxiTM6pUC7+GIH7UKjgf5E29cnKYDi7/LF5EGV+DYbxvV561w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CO1PR11MB5185.namprd11.prod.outlook.com (2603:10b6:303:6e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.19; Fri, 4 Oct
 2024 15:42:22 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8026.014; Fri, 4 Oct 2024
 15:42:22 +0000
Message-ID: <2e5801ad-b3b5-4649-b547-8660745b369d@intel.com>
Date: Fri, 4 Oct 2024 21:12:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 v2] tests/core_setmaster: simplify device handling
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Emil Velikov <emil.velikov@collabora.com>, Kamil Konieczny
 <kamil.konieczny@intel.com>
References: <20241004150133.14477-1-krishnaiah.bommu@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241004150133.14477-1-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::8) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CO1PR11MB5185:EE_
X-MS-Office365-Filtering-Correlation-Id: 28f3c367-538e-4a92-1c5b-08dce48b235d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWo4azk0NW5laENVQUVYQzdjR25USnVERXZoMU02RDN6MmUrRjdYNVRDZWpY?=
 =?utf-8?B?RjdsVVhBRkJjYmc2N1NNNW9uUUpSSS8wc0VGQ1dkV0VEYThSOU5ZZXdFUEFI?=
 =?utf-8?B?ZDk4YnZNWFJPRGtDdVFHT1Fjd29sMlcxM1J5dW5vUmZxcGlLVHg5N1Z4SGhH?=
 =?utf-8?B?dVZmZW1tUlVkUjBmNG9Yb2ljRjRUcjcyMm5xamNQWWp6dWtpK1JrOXF2eHlj?=
 =?utf-8?B?RHdMLzBXL0ZpTTc2TjZNazc2YWtFemNmb3lrY0V5M0pZR1VHeEVma1RwSUxT?=
 =?utf-8?B?bUNOSjJtSW83WEtuUEtndnNvclI0eFNhR1lxTFhnUTVtaWF3dEp3dWJUOVJN?=
 =?utf-8?B?dkhvcW9EOWRuUWRmelBVNFFYbUV0RTNZZkVXMXVvQm1ISHpoTEdrdmRBK3ZD?=
 =?utf-8?B?Nmt3MEl4MlF3OXJDbjlYYXFZY0VNVS9TWEtteHdFOHZVcVV0SGZHSysxTVh6?=
 =?utf-8?B?aDVhVWd2bDRVUXM4S0RsYzZ5NVNnUUp6UG1HK1NqbkZ1YWxJMHNRQ2RBY2tW?=
 =?utf-8?B?bjU2L0piMzZMbURvNU1YckRrS0NSMk1DNDlkQzdRd213TmVONnM5L3FMQ3lC?=
 =?utf-8?B?S05hVjMxeHpLNVhBNlM1THdIU040TW1MOWo2OTkwZVA0NUFVRVJUOGsrdDB1?=
 =?utf-8?B?MktCWWdwbmlLdHY1dkYzZStoQm8vNG01OUpHcTFudDFpdzN3b1lvZ3I5VW9G?=
 =?utf-8?B?LzFEMUxkT2wycDBSNnV1N3BSaDNmVWNUZG1qc0lhb1o5Q3VOWkRDWWdHTVUz?=
 =?utf-8?B?S1Q1T0MyL2ZVaVA1dUFwVXlFN2N4MmlPN1lzV3pUQ0FmZXNFSGZDUVg2WnBh?=
 =?utf-8?B?VkhXL212cWFxTVpNdm13VDFBRDFJZ2hPeXJ2NzdORGJVbG5GVWNpU1lvRHEw?=
 =?utf-8?B?M2preEx3anNzUW1jOW1qc3YrYW1GUmxCU3NoOVh5ejNXUUFMUCsyUXlCRG5W?=
 =?utf-8?B?Vy9veHYvQzhsUlIwMTJNdmQxSnFENEErOWRoNXYzdkMzOENUUm9OWHRra0Zz?=
 =?utf-8?B?QUdFNFpOc0xGVzZJelF3YXhva0RTU2hMeGNFSTFtd21lVVR6cURuRFVUT3Fp?=
 =?utf-8?B?RnBFQWN6ZG16c2FtR29ROUNFc3Y5dFNQVXpVckppQWlodWM5VGJURDlqSi9r?=
 =?utf-8?B?NTdVbG1GY3JiaGNiTTVEL3QzSU5GTytHZEtSQnBOc1RJN3V6K0lJRzlkcDZY?=
 =?utf-8?B?ODArVlpvdVJDUW0zSEVDYVRhRmY1TkpwOGFhR1pKMzRYbFVaejZJeFhPeElk?=
 =?utf-8?B?SmdmZCs3VGJXbTh5VGNPL0JtQU4xMCtDblgvWU5zd3FWU3ZMYk9meThGMDAr?=
 =?utf-8?B?a0N1ZVdjcitabWxQN01qbU1UV0N5czFCekhweVF5SWs1YlQ3V29RYWl3bXFV?=
 =?utf-8?B?dlV5U2NJcFdyVFVVM3IvR3p3aTh2Q0t1K1gybnFTV1l4N0o3TU80WW1LSnNH?=
 =?utf-8?B?LzVQS0oyRG5Ud2FlajhmdVNDLzJZeFYwa2lrS3A1VzkrRjJwcUpxQm9ybXA0?=
 =?utf-8?B?Rjdsc3lnNmdGS3o3ZUNzRUdQZ014MnpzckwxdnhvalpvUDZGNWRtbzdvZVlj?=
 =?utf-8?B?MDNhbWtxKzEvU084QXkzZVRweGE4WlpLeThidnZRa2FZb08wNHZxVWdBb3FY?=
 =?utf-8?B?Vk9VTCtvK1dmd0ZENmxrMk9xSzlBZStwREFvYkxRWXZ4d2k2dVdwK2Rvc1h3?=
 =?utf-8?B?elppVDBKUTJpdzVXMnNpOE9SKzRkbjF6eUFNaTk5S0trMUY2TUZjN3ZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGQ2cEo5dENrbmhadEZHYjZmcnZYbEpnOGUrVDBoNVFSeWN6ZVdmdUJJV0xV?=
 =?utf-8?B?M0dmRnhud3RLdnNENFk2OHQxbmROZnQ0cVBvVENqYzNIbmJNNU1QbTJsNm5w?=
 =?utf-8?B?V3V4bng3S2VDV3cvQjFpeExnSTBBMDBScXRVSThQUC90bnhsU3NyR1paNUhr?=
 =?utf-8?B?UEVvcDVzUXRacDh0SGpnckFta0dzN3VaUGlEdTd4YzR2NGRKdTZRRmhSaGcr?=
 =?utf-8?B?VWFPb0JDSjZxNWxQMy81R1FpMEMrWE1nZ2FkbXgxcnZ4RHpBRUl6cGl6ZDVS?=
 =?utf-8?B?UHNWMW9PQ0VUbmFKdmlnMURGaU5keVA3SUVFRG9kZWh6bjIyT2lNN0dnd0Qv?=
 =?utf-8?B?eTcrMWlLN0ZuM1JPdDZ2YkxkMWJKd0xsbzlReFNUekJxWEcxUjc5eE1SeEVO?=
 =?utf-8?B?NkdpcjE2N2xWVFk2SC8zRkV2M1k1WUtHeTZqNnZBaDhIMGloVU0xM0lzaDA1?=
 =?utf-8?B?ZTU5emJSdEhhNEZORCtPdElNMWNHZ2M1SzYrL0ZkWkFVcWZmRDk0bkx4dmVi?=
 =?utf-8?B?RG1jQXdNZm9uNEVZb0ZHb1VOSStPWGNBQWtRbGN2UEtKU0w2dFFkUzBCTlVR?=
 =?utf-8?B?eDFrQmg0c2I2c3pJemFwcEdPSHBzQnozOTNwT1RudnNhd09IMHZLZ0ZMaEE0?=
 =?utf-8?B?d29BaFJrSXgvSC96cG92Rmw2N0lpUU1uWGJiZWpvRlRRUmdhMkVQcmxYZVVn?=
 =?utf-8?B?WlZsZVZhNnV5TklabUhQeXBuY0xHZVQ4YzN3eHppaXREeGZtV2MydDdrM0lL?=
 =?utf-8?B?dWplVTN5L3JSY2RKUVE0UG1QdEdBR1VFZ1M4M2g3MDJlcGoxeTZTVXdRVTJK?=
 =?utf-8?B?QzdHMStseU9wb2ljVUJBVjFTam1INWp5MGh6S3g5aFJ3aVdpZnRacTNTeEtH?=
 =?utf-8?B?bUhUOVFIWldIcDRtRnpaNisvRzkvVC9Xa2k2VG45LzdVamc2V3BBTWhpQ0Vn?=
 =?utf-8?B?c2lyUVFleEhBb285NnJ2NzlqWDRzY09ORGRqMHFWdE1xekpsRTZ2ZC9WQUpw?=
 =?utf-8?B?eEM1TWJaKzJnMjh2cWd4dVZWN09xU2ZTZDBWMmYyRXhKWldSSldJVDVGRmhQ?=
 =?utf-8?B?bTByTWU0YzVQeHZGMzBHL1AyT1dzeHlJQzhMbmg0V3BvWk1ZWlJvcmxKRXYx?=
 =?utf-8?B?c0RhM3g2Q2xFeHVpQ3N1ZGV3d0ZSb3BDU0VzRkNGK1JBN05JUEIvNUE3Z1F0?=
 =?utf-8?B?TC9ZcWZDQ2NxZm53NTNodTRIS29zUW96dTZPQVR6U1djMnFuN1RCc1lNcjBz?=
 =?utf-8?B?UUFMKzlFMHNLaTZFN3ZiQmNlSWpvOVJRZEtRcHJ6MVlUNUVxUDNmUEc2dVJP?=
 =?utf-8?B?ZzNoOUM5SG5GR3ZLTnIrL2tjblVqOEhmSjlqNlBwVHRaVmFIVXNhZWhTOGxG?=
 =?utf-8?B?WE1Gd2V6UWp1eE81aUdEMnE0SjlFZGJIajNXMzBFbmJqZVk2MEtDU2ZwQm81?=
 =?utf-8?B?NnAybXc2RXBJUGsramErb3g3RWFQa05QbFRlRFM1aVFodC9hcXkwZUFVdUcw?=
 =?utf-8?B?bjFMTjJQbk5HbEVZT2VtQnZ1Z2JTMHo5bm1ablZRY1RGSE1ibFF2d3loVS9T?=
 =?utf-8?B?a3F0UFZmTWJpbHYyNGhpaklxdi9iYThId1lGdFQxNysxNjRPNW1uMXc3Q2pk?=
 =?utf-8?B?N2wzYVNKSGhjZlZRd2RINm9CcFdwZ1lVVUFPVmJiSGV2V2Y4Nll6bnZIYnpv?=
 =?utf-8?B?M0dlWnU0TU9JSVowd25tSSsyVm5qWjRvek1USm1xbUF6VnM0eFR2OW1pTjA4?=
 =?utf-8?B?WVFHQ1BQdy9iMXlaaWZZdjlxZGo3bkVsVVRDbmhMcDNsQTZmYkRVN2pRZFB3?=
 =?utf-8?B?TEtDQWJYRlppVk9YckllU0ZWN2xNVWNpQTRBQlUwZDhpNWdaWktqakZWTVpU?=
 =?utf-8?B?MlduM2JOREhJUW1WQUdDb2tDbEtPV1NzMGJ0SnN5VnJpV3RLZzg5bjhXNTR3?=
 =?utf-8?B?MVJyQllFMGVUUk9ablBUUzBzQ0VUaURoalZTaXhmL29uaW5IYXRjbkJUNnBH?=
 =?utf-8?B?MFFqUXUvaFNHSzAyckFWNjg0MFhab3pBaVhlVi9Zd3hTNXNlWmRvOFVEODdw?=
 =?utf-8?B?ZXJSQmtya3krb3JRYmJrZGliTUhwUkdXajZOMWVsVkx6RVhNVjB2YjIwNkZl?=
 =?utf-8?B?eVRxUTJTbVFETDVCaWpXZnc4ajh2ZkNZeWMvbXVXVkxMQTRQd1gzaWYwSldm?=
 =?utf-8?Q?Tr6NXLFDFEy9Je2r3to2HFs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f3c367-538e-4a92-1c5b-08dce48b235d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 15:42:22.7457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /uro8A5Lk5jHvGsUc9kHhWNpn4pohocWsROZbRrwZ6RlGmQAWSrzfJKmmiyR9FCuBZM+eQrIHHpJN16DYuCURFyhQJ/kLGnO5kUe9kLTxu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5185
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



On 04-10-2024 20:31, Bommu Krishnaiah wrote:
> Refactored test setup to dynamically determine the correct drm card
> for testing. Instead of changing permissions for all cards,
> change only one that will be tested.
> 
> Problem Description:
> The test fails after running the `core_hotunplug@hot*` subtest, where
> Card0 is populated as card1, This leads to a failure in the subsequent
> `master-drop-set-user` test.
> 
> Command sequence for reproducing the issue:
> - Check available cards: `ls /dev/dri/`
>          - Output: by-path  card0  renderD128
> - Run the test: `# ./core_hotunplug --r hotrebind-lateclose`
> - Check again: ‘ls /dev/dri/’
>          - Output after core_hotunplug : by-path  card1  renderD129
> - Run the test: `# ./core_setmaster --r master-drop-set-user`
>          - Output: gta@core_setmaster@master-drop-set-user failure
> 
> This failures on both XE and i915 for above sequence.
> 
> v2: Currented the e-mail address

/s/currented/corrected/

> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Emil Velikov <emil.velikov@collabora.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@intel.com>
> ---
>   tests/core_setmaster.c | 82 ++++++++++++++++++++++++------------------
>   1 file changed, 47 insertions(+), 35 deletions(-)
> 
> diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
> index 9c2083f66..fe9993515 100644
> --- a/tests/core_setmaster.c
> +++ b/tests/core_setmaster.c
> @@ -107,40 +107,31 @@ static void check_drop_set(void)
>   	drm_close_driver(master);
>   }
>   
> -static unsigned tweak_perm(uint8_t *saved_perm, unsigned max_perm, bool save)
> +static void tweak_perm(uint8_t *saved_perm, char *path, bool save)
>   {
> -	char path[256];
>   	struct stat st;
> -	unsigned i;
> -
> -	for (i = 0; i < max_perm; i++) {
> -		snprintf(path, sizeof(path), "/dev/dri/card%u", i);
> -
> -		/* Existing userspace assumes there's no gaps, do the same. */
> -		if (stat(path, &st) != 0)
> -			break;
> -
> -		if (save) {
> -			/* Save and toggle */
> -			saved_perm[i] = st.st_mode & (S_IROTH | S_IWOTH);
> -			st.st_mode |= S_IROTH | S_IWOTH;
> -		} else {
> -			/* Clear and restore */
> -			st.st_mode &= ~(S_IROTH | S_IWOTH);
> -			st.st_mode |= saved_perm[i];
> -		}
> -
> -		/* There's only one way for chmod to fail - race vs rmmod.
> -		 * In that case, do _not_ error/skip, since:
> -		 * - we need to restore the [correct] permissions
> -		 * - __drm_open_driver() can open another device, aka the
> -		 * failure may be irrelevant.
> -		 */
> -		chmod(path, st.st_mode);
> +	int ret;
> +
> +	if (path[0] == 0)
> +		return;
> +
> +	ret = stat(path, &st);
> +	igt_assert_f(!ret, "stat failed with %d path=%s\n", errno, path);
> +
> +	if (save) {
> +		/* Save and toggle */
> +		*saved_perm = st.st_mode & (S_IROTH | S_IWOTH);
> +		st.st_mode |= S_IROTH | S_IWOTH;
> +	} else {
> +		/* Clear and restore */
> +		st.st_mode &= ~(S_IROTH | S_IWOTH);
> +		st.st_mode |= *saved_perm;
>   	}
> -	return i;
> -}
>   
> +	/* There's only one way for chmod to fail - race vs rmmod. */
> +	ret = chmod(path, st.st_mode);
> +	igt_assert_f(!ret, "chmod failed with %d path=%s\n", errno, path);
> +}
>   
>   igt_main
>   {
> @@ -160,8 +151,8 @@ igt_main
>   
>   
>   	igt_subtest_group {
> -		uint8_t saved_perm[255];
> -		unsigned num;
> +		uint8_t saved_perm;
> +		char buf[255];
>   
>   		/* Upon dropping root we end up as random user, which
>   		 * a) is not in the video group, and
> @@ -176,8 +167,29 @@ igt_main
>   		 * restored on skip or failure.
>   		 */
>   		igt_fixture {
> -			num = tweak_perm(saved_perm, ARRAY_SIZE(saved_perm),
> -					 true);
> +			char path[255];
> +			int len;
> +			int fd;
> +
> +			memset(buf, 0, sizeof(buf));
> +			saved_perm = 0;
> +
> +			fd = __drm_open_driver(DRIVER_ANY);
> +			igt_assert_fd(fd);
> +
> +			snprintf(path, sizeof(path), "/proc/self/fd/%d", fd);
> +
> +			len = readlink(path, buf, sizeof(buf) - 1);
> +			igt_assert_f(len > 0, "readlink failed with %d path=%s\n", errno, path);
> +
> +			buf[len] = '\0';
> +			if (!(strstr(buf, "/dev/dri/card") == buf ||
> +					strstr(buf, "/dev/dri/renderD") == buf))
> +				igt_assert_f(0, "Not a card nor render, path=%s\n", buf);
> +
> +			igt_assert_eq(__drm_close_driver(fd), 0);
> +
> +			tweak_perm(&saved_perm, buf, true);
>   		}
>   
>   		igt_describe("Ensure first normal user can Set/DropMaster");
> @@ -191,7 +203,7 @@ igt_main
>   
>   		/* Restore the original permissions */
>   		igt_fixture {
> -			tweak_perm(saved_perm, num, false);
> +			tweak_perm(&saved_perm, buf, false);


>   		}
>   	}
>   

