Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AF4E77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 14:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C74810EBB9;
	Wed, 18 Dec 2024 14:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="goMDVK3c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB6C10EBB9
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 14:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734533256; x=1766069256;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=mLkWeCamH7YC+7coHcPdP6Bb49qzbE9DVRyEJcFvx/U=;
 b=goMDVK3cCMwhOyXVE+oxFYPCg9E/8K6AiT7CVmzXXTdW/gA0TYox+SUm
 DbKwdoglqsRozFfxbKzka/RhTUh9P/P7sL9EAvvcAaXxJxCA6mjNntVhX
 d0uXA1DE13gm2QhbIbxwlpXpXxHU3PTZAtM+pf4s6dQ3nw0R6tDG7NvEJ
 JMfudmf8L0xFKBvPNghcQsgoyWDH9DsJsEDeJ8NzHQYPSRK5kruinVTBT
 U4YR4pThXIeCDK+C8spNTYDreQ48yPV0M4se314ZLpOkFXoNNZ99lNc2M
 8HgNkzOVcn5VLjzjHhNYEvLtzQvUNHNNfewWXvqtuNfwqhucFNuHJPgeX g==;
X-CSE-ConnectionGUID: H/Bd+S/QR0iYdkeq4S1Sug==
X-CSE-MsgGUID: tZ3SmeNESRm2LsdW4txBEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="22598717"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208,217";a="22598717"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 06:47:36 -0800
X-CSE-ConnectionGUID: OeyyG7AJTR2c5h33ZN3BkA==
X-CSE-MsgGUID: 19vkSbzqT7Kly8mEEC5KCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
 d="scan'208,217";a="102976002"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 06:47:36 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 06:47:35 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 06:47:35 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 06:47:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTmA4pWOMOa9UmNSciLIl8rIhu2VAX5Q1hrMvtcSWyFNqbuDtsmhjPkgDxfUsNRc2AzpTXCXuLFuBNGy7oTgyjhFdvbCIa7mGSmft4Smph6VbdVJQiwyEdhub6AVqkAQy75NrifjuORuF+Vzugjz/tbVNrhfTQakoHJy291hrrAuPO3V1yhh963Utwqv8rj642+geSLiijOtRSyiP5k+lo9pFdg8TI6FbM6o/unork5UCdBYs+sj0Xfowagh213Yh0IgiwsTZWBBvn2ROZu/+iuU4oPtRWwTw32xv6rnT/cqMfbJ/Xq/UuyJTVKqgUlM6MAvy3AlIs5ZO7luwZ5/hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIX3wIvxNGQqTfDD1I5kifIx3D1F1fdW/tFVyBYUHns=;
 b=U8o+h3NCfmMfLJhEptOgwzI+YDvL4LK6kX1x3OzapYdkn3B+RiWxTd3MEjNuK9UNZyNXxTCyiqSeVaPA93yN4omiRbysAsjUM4NY3WjxAofurCPdDjjCKbrWQNDgidzVMN63cT26TgPg7/sgNTIk2oMKqw5oT/Nwb3C1e7mAmvc4EVS+TjjK0UiQwIP1HXPF3BkqoucV7Lgo6Y3eqiTYNG/RT01I+SVttJA56ejlo6xUqJgHifdg8P20qWyOjqaiN0gYTbZuYnAFoW/SFlZgx9KD3/VQ/F9SiQLaTtsvZczmAfaTNm2KJatNPpuSFl+3ruytWzcP5NbJBSGSiJZBdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SN7PR11MB6653.namprd11.prod.outlook.com (2603:10b6:806:26f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 14:47:33 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 14:47:32 +0000
Content-Type: multipart/alternative;
 boundary="------------dwbF9m6niMJlhoDNXZBuda0o"
Message-ID: <417f3d6b-b4b1-40d8-bfc2-1660a1b816af@intel.com>
Date: Wed, 18 Dec 2024 15:47:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/5] lib/xe/xe_sriov_provisioning: Add shared
 resource provisionability check
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>
References: <20241218120056.779962-1-marcin.bernatowicz@linux.intel.com>
 <20241218120056.779962-4-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20241218120056.779962-4-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: VI1PR06CA0187.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::44) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SN7PR11MB6653:EE_
X-MS-Office365-Filtering-Correlation-Id: 010c712f-1d1a-4248-24c5-08dd1f72e778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|8096899003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejhzVTVwY0o4TmJDU1k4dFdhYmxOVmlpWDZGcE5jVHRPZGhmZmdzeTJLenlS?=
 =?utf-8?B?L2VIVWJGNGhiTTVoT1JjSUNlbWpOaTZPSHp1R1E3R0ZwZXQzMXhiNFBCQ05a?=
 =?utf-8?B?d3MyL3Q4bGtiaXAwVW9ZWU5VRHF1M2FHNkVQcTF2M1kvSzI2TTRVWEROZ291?=
 =?utf-8?B?eDJYb1lFWlY4NEorRUVCbjF4QnVhdVpGRGh0RmErK0F2eEYxR0dUYTdVeXZI?=
 =?utf-8?B?QzI3OU1MbGQ4Mkpsb0V4cHFaWCt0U0R6T3lITmpOaHZNcU01QmdKR3B4MW16?=
 =?utf-8?B?YnFrYnN0NTlnZEVpTDU5cEZFSis0REpVaFk1d0RNVjVoYmVTL1U5M1Evc1Bx?=
 =?utf-8?B?SHA3NjdTejliam9oZWpLSkQyQkNqbTJQL3lrOUk1dTJ4SkFRU1h6VjFSekZ6?=
 =?utf-8?B?SVVXdW5jQVViYU9RWElsYzhDTHNDVVJqTXVmdXFXQUliVXoxV0ZUeXJXb3hw?=
 =?utf-8?B?aVQzL0gybEJ5UkZKZ2lhdnFHNTJFUW5OUVVMY3UvK0pRcUppQmRkRUswWnVS?=
 =?utf-8?B?YUI3WEx4MVptcjR5M2MrKzAxbml0ekd0Zks3anI2ak5rbGkyMFQ5N0hrNmcr?=
 =?utf-8?B?dk1HeUpvdlVjZ1VDR1laYWRjb2pTNDdhd29EeGl6S2VMbVZTTTFrT1UzMEE0?=
 =?utf-8?B?OTRYYzNISWwreDJrcC9tcGhSSnlheTI5eGJrS1dyYzZxQlpzUDltQTM5UFl6?=
 =?utf-8?B?OEtUQXl0d3dqeHJydFhyS0tRcjF2ZjVRNlNmc1NrQ1Zia3hQZ3llVjFWSzY5?=
 =?utf-8?B?RkxHdXJsbFNNSjZHYmpRNFhNNmg4RENhYTRGZTJMZy9WdWdudlhKOTBlMVFG?=
 =?utf-8?B?U1B3SHJEMEU4OHVPSVJyTXViRFhHR1BlMURkS000VkJOZmsyZXlxdm5mWnpS?=
 =?utf-8?B?bkJPOGIxTjJVVTk0bWdOREZYYUN5bFEwamNQNG9yU3FyN2Z0c1JyWm84OFBI?=
 =?utf-8?B?eHZHSktmNDJXNVBIZXVNOWI5aExZRExrVWlVN1NKYjdCR2pTTzIzbXpPd0sr?=
 =?utf-8?B?M0c1Q0wwT0xqZjRlZ3VLUFVNUkNTSHBON0UrMjFtNUJRZFJSWkpiRXpuL29n?=
 =?utf-8?B?cXI4T1JpeVRJb0I0TE14MXcvRVRJQ1RIdjlTM21ncmJFZjc3bSttZTdCbHRh?=
 =?utf-8?B?YXhVWnl1MlNFSml0UEY2WnNYYmpITWZrQlZDVGYwdUoyQnJGUjk3c2ZhdlNw?=
 =?utf-8?B?dVFTc3JuV2I0STlHWCtoMnNPLzJzWFprb3RBbm45QWxhZVdkUkxGL2x2RHdL?=
 =?utf-8?B?QWhubGxiUmdpY0tyQ3kxUlRIb1ZqWGlPWHJKdFpZamprL3hIUXhaS1pXQkcz?=
 =?utf-8?B?SnlKNUdNeFFMcHRPY1h4cFhnMWNLZlBHajVwZWpjM0FFcklMZVlqZlk4VnE2?=
 =?utf-8?B?NUF5dnlJcElNbTM2Ui81VHE3Q2VJZHFSdEROWEtWZE5ZTHM1aXdRY2RobHl1?=
 =?utf-8?B?Lzg0QS9lSTVFeDZTTmZlYzh2ak5GTC93YUtUK292eUNNbXA5bm9NRHl1VVIy?=
 =?utf-8?B?TktvS0ZCV1AyV01DMUdxbWNWK3F2bTNqb1JSWTdhVHptelNHN25kNXBmeUQ2?=
 =?utf-8?B?OUovN1dqT2lhRnB2dUh2MmlMSFJKR25NYkc2MjIwWkx5UWF0Y3VJU2pzVjJV?=
 =?utf-8?B?SUZUbnVmeFJiNnhydEw1eXd1VlFRVFh3SSswVHltSFFLSU9oNWlLdVc5T3Q5?=
 =?utf-8?B?TTlZRXhSVEZuVkVGS2hlVmpFQzFiVmJHNjdLV3UyNXZLWmtKUFVVcGg0N2t5?=
 =?utf-8?B?cEc3L3FZWlBUWTJ0cmJmVEJGVFhHUkExbGExU2M0Y080d2gvdjhkZ0ltTHZQ?=
 =?utf-8?B?RXA5djNJRHJPY3ZOdVMxZWx5S3J1K3ZNSFFBTHFadXpjZ3dGMTA2bWh3Mm9v?=
 =?utf-8?Q?hyID1WvOM9EIU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGZ3My9RRDZKTG5SQTBKOVdhcDRCZnZaQjg4b2JnL2toZ3Y1cXp4ekJBTnk1?=
 =?utf-8?B?MFovck9DRStOQnN2bnpXbWZRLzdJY1FPaldnekJNSlQ4aytjVEluYnY0dHo1?=
 =?utf-8?B?UkVSNzUzZEdmSE9JUFUzRkNIeUZwNjhObS9rSXRSWFlyQnpCckJRRUphLzNI?=
 =?utf-8?B?eFBaK25MME1mbHJPMWxnSEI2Smh6SzJIZS9JRkxGcVlOcnEzTjZsTS9KWm9v?=
 =?utf-8?B?QXdGclM0SjZ3ZnJ5ckh6Zi92YVBMQnlPa3lLdThDa2E3TUZCdjVIZ2w3b1JY?=
 =?utf-8?B?VC9wKzJJZllKQ29wQmRDejF1YjNDbkowSExHN0hBbGR3Rno1cE9XVzBZOXdN?=
 =?utf-8?B?bTBlaExWY2JVS0lNNXIrc0N2Z2tRTG40MnFpc0NDZTMzVWRMSm1SQzVtMTFP?=
 =?utf-8?B?MXU4ay9WUkhVcWJoZ2xOemFJY21vM3hJNExvNlZWVnkxdEVvZWdSY1c3dDdL?=
 =?utf-8?B?K0p0eDJOcXh1dG1jMG1GVE9ITFRvTVNiRjlJdWhEekNjQ290QzlFcVc5eDBh?=
 =?utf-8?B?NVlKVGJ1M3A3OHpYSi9WQUpCbFNnWFB1b1hEN3hub043bTVtQThkZGJuczh5?=
 =?utf-8?B?SkZBL2tqV0VWZzNXNnlxbXdERTBobG9JSG5JUVoxZ0g1ejhOZjFYL3pwMjN4?=
 =?utf-8?B?NFdLTy9uN2dTMDdRcWR1eXRiNEdFdGM1YkNldWxONGtmNFdvWVhVemFvYzJH?=
 =?utf-8?B?b0N3ckkwNk5jVkZ1N1BZRHd4dWZwRDZJTWQrTkxDc2c0Qm1acVBIMWliTklJ?=
 =?utf-8?B?RURYbXQxWldqUG1uR1Bnd0pDcDhwN3VRZld3NkxicG4rVFNjRDkycXhBQTli?=
 =?utf-8?B?Z0llMWFoSGY1eTdoU2p2bkRSdk5rOFJOd3NENjdHVDBpdlNNLzUrQ09nTDcz?=
 =?utf-8?B?KzhRdHFON0E3NUJwajcrbGY5U2xGWS9CMDYxRFN3dnhGRlZXeFdOWWdXWThz?=
 =?utf-8?B?Uzk3OWdxQk5vdmF3WGxhT0dpa0QxWG1WeXV0T1h0STAzQkNRV2ZMRkdrWkVJ?=
 =?utf-8?B?a25VQ0hsY3ltK3B5ZUlDTjNRSzVoanJlYmVCYkhsdnErWU53Ui9OQy84aCta?=
 =?utf-8?B?UnVoVHFqMXdaUlpNQU5iZ1hFaVRTSDU2Zk9kcU83NHZaRHpoNGEzaVVCV2Ix?=
 =?utf-8?B?dzRaeEpTdVpLbUt4RlAyTEpmVFlGWnIxTHlvcE9Hand1U2dWd1JGUzNHcEhS?=
 =?utf-8?B?TmxlZlVxOGJ6MHpjQy9Raitqem16RzJLcFhFY0QwOWhOVCsvZlBka0xMc1Qx?=
 =?utf-8?B?d1l0cW9ibWZaSjl2TlI2RmRxQjZFUFhjc1FmRytrbmYyOW1wamViTnF0KzVQ?=
 =?utf-8?B?ODRTMGtyemkvNXI3di9GOE43TEtyd3FYeDM3bFpzaUxueTFNOGt5K2Y3UDNB?=
 =?utf-8?B?bjA4L3Ewdm9pVHE1M3NhbVc5L0FsY1I2Rng5NEg0WmR3OXovN0MxcEhrVWJH?=
 =?utf-8?B?MCtJTkNvcWZHQzdyYkFZR1A5TUhETms5WS9ERjFrUyt6RzZVb2YzUzRGeW5E?=
 =?utf-8?B?WklVa3dWWi9YMUtxMm1QaHU0V0M2R3IvMkxQREZvdk11ejBJQys2Y1JMU0F0?=
 =?utf-8?B?ZUozMkwwaDBPRjJybUV3YmNCVVRyeWV2Mjhselg4L3ltYUdkRWtDSVo0OXZT?=
 =?utf-8?B?RWYzZy9MUVY4Z3hCcWVmSkEzK2NGU29TNmdPOUdCZUVHcmhoK2toTW80SVpV?=
 =?utf-8?B?UTV6L3R4Mis1bVMzc2ppZDVPVDQ0c21XREZYRnowK3R5UTJ6VTJzY2U3THVY?=
 =?utf-8?B?ZnNZazJjMjZCMWw1b29VRnNISVZJZ2hJcnhVeTFFWnZRaVNJTXgwU0JnOUNm?=
 =?utf-8?B?RW5RVWZqWnBUYjl0bTEyVEJMNXZjMFVtMHg4Umt1MnRnbUo1a1gxa29IS3ZN?=
 =?utf-8?B?NFJvT1ZDUHRnakI1RGQxU1RnRW1KN1JqL1VSSmNEcmg3cUUvVVFKVDNuV0dq?=
 =?utf-8?B?RGNOaForbW9LbGtTRExKTHI2anpNSlZIakx4aFRrQkFIU3FRR2tnM2hwMnQw?=
 =?utf-8?B?V3ZxQ1hzZi9OUmE0bkVvY0tmTFI1V0VtTUNkZzBGd1V4YXRrUVZaMkJvRjY2?=
 =?utf-8?B?VmxlMHRoZTgvZ1ltYlBxWVoxRnlkaXRoWnMvNU9Pc0lvSy9nYjFIQml6Q1dM?=
 =?utf-8?B?UlBJMllNMTZhWFlmNkd3RkhEN2hMam5PS2VvdEZ6UEhuanZtaStDQTM5Vzhk?=
 =?utf-8?B?b0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 010c712f-1d1a-4248-24c5-08dd1f72e778
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 14:47:32.9215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8Oa+sX+fsS/eV4UwuZ64zNN40BO9u7VMBIFfncaHX91OMWBOw2XWCqkuMThkLTlsxvs5mNnGOkZoIWnoqJGAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6653
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

--------------dwbF9m6niMJlhoDNXZBuda0o
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 12/18/2024 13:00, Marcin Bernatowicz wrote:
> Introduce a helper `xe_sriov_is_shared_res_provisionable` to determine
> if a shared resource can be provisioned.
>
> Add macros `xe_sriov_for_each_shared_res` and
> `xe_sriov_for_each_provisionable_shared_res` to iterate over shared
> resources and provisionable shared resources, respectively.
>
> Signed-off-by: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak<adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski<jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna<lukasz.laguna@intel.com>
> Cc: Michał Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Michał Winiarski<michal.winiarski@intel.com>
> Cc: Narasimha C V<narasimha.c.v@intel.com>
> Cc: Piotr Piórkowski<piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis<tomasz.lis@intel.com>
> ---
>   lib/xe/xe_sriov_provisioning.c | 22 ++++++++++++++++++++++
>   lib/xe/xe_sriov_provisioning.h | 29 +++++++++++++++++++++++++++++
>   2 files changed, 51 insertions(+)
>
> diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
> index 536121931..22035ffd8 100644
> --- a/lib/xe/xe_sriov_provisioning.c
> +++ b/lib/xe/xe_sriov_provisioning.c
> @@ -9,6 +9,7 @@
>   #include "intel_chipset.h"
>   #include "linux_scaffold.h"
>   #include "xe/xe_mmio.h"
> +#include "xe/xe_query.h"
>   #include "xe/xe_sriov_debugfs.h"
>   #include "xe/xe_sriov_provisioning.h"
>   
> @@ -274,3 +275,24 @@ void xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
>   {
>   	igt_fail_on(__xe_sriov_pf_set_shared_res_attr(pf, res, vf_num, gt_num, value));
>   }
> +
> +/**
> + * xe_sriov_is_shared_res_provisionable - Check if a shared resource is provisionable
> + * @pf: PF device file descriptor
> + * @res: Shared resource type (see enum xe_sriov_shared_res)
> + * @gt_num: GT number
> + *
> + * Determines whether a specified shared resource can be provisioned.
> + *
> + * Return: true if the shared resource is provisionable, false otherwise.
> + */
> +bool xe_sriov_is_shared_res_provisionable(int pf, enum xe_sriov_shared_res res,
> +					  unsigned int gt_num)
> +{
> +	if (res == XE_SRIOV_SHARED_RES_LMEM)
> +		return xe_has_vram(pf) && !xe_is_media_gt(pf, gt_num);
> +	else if (res == XE_SRIOV_SHARED_RES_GGTT)
> +		return !xe_is_media_gt(pf, gt_num);
> +
> +	return true;
> +}
> diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
> index 168b50394..b4300ec2e 100644
> --- a/lib/xe/xe_sriov_provisioning.h
> +++ b/lib/xe/xe_sriov_provisioning.h
> @@ -27,6 +27,34 @@ enum xe_sriov_shared_res {
>   	XE_SRIOV_SHARED_RES_LMEM,
>   };
>   
> +/**
> + * XE_SRIOV_SHARED_RES_NUM - Number of shared resource types
> + */
> +#define XE_SRIOV_SHARED_RES_NUM (XE_SRIOV_SHARED_RES_LMEM + 1)
> +
> +/**
> + * xe_sriov_for_each_shared_res - Iterate over all shared resource types
> + * @res: Loop counter variable of type `enum xe_sriov_shared_res`
> + *
> + * Iterates over each shared resource type defined in the `enum xe_sriov_shared_res`.
> + */
> +#define xe_sriov_for_each_shared_res(res) \
> +	for ((res) = 0; (res) < XE_SRIOV_SHARED_RES_NUM; (res)++)
> +
> +/**
> + * xe_sriov_for_each_provisionable_shared_res - Iterate over provisionable shared
> + * resource types
> + * @res: Loop counter variable of type `enum xe_sriov_shared_res`
> + * @pf: PF device file descriptor of type int
> + * @gt: GT number of type unsigned int
> + *
> + * Iterates over each provisionable shared resource type for the given PF device
> + * and GT number.
> + */
> +#define xe_sriov_for_each_provisionable_shared_res(res, pf, gt) \
> +	for ((res) = 0; (res) < XE_SRIOV_SHARED_RES_NUM; (res)++) \
> +		for_if(xe_sriov_is_shared_res_provisionable((pf), (res), (gt)))
> +
>   /**
>    * struct xe_sriov_provisioned_range - Provisioned range for a Virtual Function (VF)
>    * @vf_id: The ID of the VF
> @@ -43,6 +71,7 @@ struct xe_sriov_provisioned_range {
>   };
>   
>   const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res);
> +bool xe_sriov_is_shared_res_provisionable(int pf, enum xe_sriov_shared_res res, unsigned int gt);
>   int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio *mmio,
>   					       struct xe_sriov_provisioned_range **ranges,
>   					       unsigned int *nr_ranges);

LGTM,
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

--------------dwbF9m6niMJlhoDNXZBuda0o
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 12/18/2024 13:00, Marcin Bernatowicz
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20241218120056.779962-4-marcin.bernatowicz@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">Introduce a helper `xe_sriov_is_shared_res_provisionable` to determine
if a shared resource can be provisioned.

Add macros `xe_sriov_for_each_shared_res` and
`xe_sriov_for_each_provisionable_shared_res` to iterate over shared
resources and provisionable shared resources, respectively.

Signed-off-by: Marcin Bernatowicz <a class="moz-txt-link-rfc2396E" href="mailto:marcin.bernatowicz@linux.intel.com">&lt;marcin.bernatowicz@linux.intel.com&gt;</a>
Cc: Adam Miszczak <a class="moz-txt-link-rfc2396E" href="mailto:adam.miszczak@linux.intel.com">&lt;adam.miszczak@linux.intel.com&gt;</a>
Cc: Jakub Kolakowski <a class="moz-txt-link-rfc2396E" href="mailto:jakub1.kolakowski@intel.com">&lt;jakub1.kolakowski@intel.com&gt;</a>
Cc: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a>
Cc: Michał Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Michał Winiarski <a class="moz-txt-link-rfc2396E" href="mailto:michal.winiarski@intel.com">&lt;michal.winiarski@intel.com&gt;</a>
Cc: Narasimha C V <a class="moz-txt-link-rfc2396E" href="mailto:narasimha.c.v@intel.com">&lt;narasimha.c.v@intel.com&gt;</a>
Cc: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
Cc: Satyanarayana K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
Cc: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 lib/xe/xe_sriov_provisioning.c | 22 ++++++++++++++++++++++
 lib/xe/xe_sriov_provisioning.h | 29 +++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index 536121931..22035ffd8 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -9,6 +9,7 @@
 #include &quot;intel_chipset.h&quot;
 #include &quot;linux_scaffold.h&quot;
 #include &quot;xe/xe_mmio.h&quot;
+#include &quot;xe/xe_query.h&quot;
 #include &quot;xe/xe_sriov_debugfs.h&quot;
 #include &quot;xe/xe_sriov_provisioning.h&quot;
 
@@ -274,3 +275,24 @@ void xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
 {
 	igt_fail_on(__xe_sriov_pf_set_shared_res_attr(pf, res, vf_num, gt_num, value));
 }
+
+/**
+ * xe_sriov_is_shared_res_provisionable - Check if a shared resource is provisionable
+ * @pf: PF device file descriptor
+ * @res: Shared resource type (see enum xe_sriov_shared_res)
+ * @gt_num: GT number
+ *
+ * Determines whether a specified shared resource can be provisioned.
+ *
+ * Return: true if the shared resource is provisionable, false otherwise.
+ */
+bool xe_sriov_is_shared_res_provisionable(int pf, enum xe_sriov_shared_res res,
+					  unsigned int gt_num)
+{
+	if (res == XE_SRIOV_SHARED_RES_LMEM)
+		return xe_has_vram(pf) &amp;&amp; !xe_is_media_gt(pf, gt_num);
+	else if (res == XE_SRIOV_SHARED_RES_GGTT)
+		return !xe_is_media_gt(pf, gt_num);
+
+	return true;
+}
diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
index 168b50394..b4300ec2e 100644
--- a/lib/xe/xe_sriov_provisioning.h
+++ b/lib/xe/xe_sriov_provisioning.h
@@ -27,6 +27,34 @@ enum xe_sriov_shared_res {
 	XE_SRIOV_SHARED_RES_LMEM,
 };
 
+/**
+ * XE_SRIOV_SHARED_RES_NUM - Number of shared resource types
+ */
+#define XE_SRIOV_SHARED_RES_NUM (XE_SRIOV_SHARED_RES_LMEM + 1)
+
+/**
+ * xe_sriov_for_each_shared_res - Iterate over all shared resource types
+ * @res: Loop counter variable of type `enum xe_sriov_shared_res`
+ *
+ * Iterates over each shared resource type defined in the `enum xe_sriov_shared_res`.
+ */
+#define xe_sriov_for_each_shared_res(res) \
+	for ((res) = 0; (res) &lt; XE_SRIOV_SHARED_RES_NUM; (res)++)
+
+/**
+ * xe_sriov_for_each_provisionable_shared_res - Iterate over provisionable shared
+ * resource types
+ * @res: Loop counter variable of type `enum xe_sriov_shared_res`
+ * @pf: PF device file descriptor of type int
+ * @gt: GT number of type unsigned int
+ *
+ * Iterates over each provisionable shared resource type for the given PF device
+ * and GT number.
+ */
+#define xe_sriov_for_each_provisionable_shared_res(res, pf, gt) \
+	for ((res) = 0; (res) &lt; XE_SRIOV_SHARED_RES_NUM; (res)++) \
+		for_if(xe_sriov_is_shared_res_provisionable((pf), (res), (gt)))
+
 /**
  * struct xe_sriov_provisioned_range - Provisioned range for a Virtual Function (VF)
  * @vf_id: The ID of the VF
@@ -43,6 +71,7 @@ struct xe_sriov_provisioned_range {
 };
 
 const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res);
+bool xe_sriov_is_shared_res_provisionable(int pf, enum xe_sriov_shared_res res, unsigned int gt);
 int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio *mmio,
 					       struct xe_sriov_provisioned_range **ranges,
 					       unsigned int *nr_ranges);</pre>
    </blockquote>
    <br>
    LGTM,<br>
    <span lang="en-US">Reviewed-by: </span><span lang="pl">L</span><span lang="en-US">ukasz </span><span lang="pl">L</span><span lang="en-US">aguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a><br>
      <br>
    </span><span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------dwbF9m6niMJlhoDNXZBuda0o--
