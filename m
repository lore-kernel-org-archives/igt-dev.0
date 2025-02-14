Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E24C02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 14:33:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC0910E14C;
	Fri, 14 Feb 2025 14:33:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IYe5JVGG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582E810E496
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 14:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739543603; x=1771079603;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AH6JYrxcw3TsPryQITuSQsm+UxiT6Qe5PQyJWlr1a6o=;
 b=IYe5JVGGRjY7WJPHxZLk2X2NnEAX2gzifBbt+HqS8hDOJeIJYg0OdhnT
 kqxTpovpkZkp5M3bRIaJuMfezAoj8zOTjosTTBuZjictVuSmA1yy6shWl
 M3UA7d8jJjSKn+sWaUvdJ1EjxD1Y5ZkXwOWge1GoVfAFEf1QgMIoAEa+d
 NbeuoLmFB9vCNvqEsugNzMAywuFkshLpRud/gnHh1vPFX1K9qt5w4bPGv
 EC67MJUOiatj8gIb1ZNZj0jd+fdFT0CWx7PzII3JBCVxZqMf6e4YMIUBg
 HEOS25Wn1M3jXU9b1xKWEJD9JfDCkJrPLvon10QzusMpmG36ZrYdfM6ul Q==;
X-CSE-ConnectionGUID: qCaTJJsuSxSHp+XFdu7k5g==
X-CSE-MsgGUID: vzj42znQT52iJTtGuTp2sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40327738"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="40327738"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 06:33:23 -0800
X-CSE-ConnectionGUID: PT50XtSRR2ezu9Dgz8s/wA==
X-CSE-MsgGUID: iNNiYnUASI2scLmzEFfxTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="118577384"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 06:33:22 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 06:33:22 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 06:33:22 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 06:33:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yCF9IOLOyqJwz4+DApEe5+5pWqsvdY2baQ7Av2vvN1+jgKeR02n0i0Yv9akWL/l3EtTObMz1VkPOfCBVijAH3kiF1rH/MejpVGQsP/UpD60clfAhYmR4oU9CxDylrIgUhcVvAvJhvHoH7YKbNztlrelCOZcx2WhMtHFbI9NNaXm8uc703EIv1PdnV7FpsfyuvGC5Z0QYDC6uj1lW5AfmYfnAddQ6keoLIDKIlkuGGyWM0Ako/5HiTI+FMwO0CBB6F524HmxTmG+/TjYUkplsOIsgAtxecIiReaTmlGdgtl3OpkvjrmsgLDwIQXXW1iczOMTVB6Gm4GdxWbVPVdj1qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQFxc9Rbin9pFEWz9z1z34kIXb41WNm6awpk/3izEh8=;
 b=Aha1SU9aPq8acc2gdoZ6P8m5gwsSEjfeg0ilWtr3vMN6oFIUz+wv/FKReqg3BGIJaOSkSAAJ/0mm4kxNZv19KzQhsrX9Zoi34VzkrSizKFf7P1JChHe1nxMXN12OcUfukHgYnXKISIzl8D+G1sag8nxV/+iWBSOsfuJDD4jYz2u4sW//zcijBKsr8CDdHSPWFempM4WeO/lPbTmRRSIIoD3BgInWSEq/f9vKUWI/IqjprgXOevtoWqNTgAUOBAUbkj65v18qnVk80Gp2FcB4L7VAv2ByTe0MG6fMealoT6Q+pUZ8es2xcwsRGBwLcCc3uvh6UVDrGun7OaTpuI1+lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SJ0PR11MB4958.namprd11.prod.outlook.com (2603:10b6:a03:2ae::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Fri, 14 Feb
 2025 14:33:19 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%6]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 14:33:19 +0000
Message-ID: <6f380bca-2fb8-424a-a5b0-3cc069ea0a37@intel.com>
Date: Fri, 14 Feb 2025 15:33:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 5/5] tests/xe_sriov_scheduling: Get job timeout
 from sysfs
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>
References: <20250212184757.586071-1-marcin.bernatowicz@linux.intel.com>
 <20250212184757.586071-6-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20250212184757.586071-6-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0019.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::31) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SJ0PR11MB4958:EE_
X-MS-Office365-Filtering-Correlation-Id: ea447aa9-5f32-4a25-2d19-08dd4d04859e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2Nrc1pDaFVGSC9GdVJkT0FoVVVaSzZoUVJvdFV0bkhkNFd2RS93WUFyaEEw?=
 =?utf-8?B?VCswVU1EOEppZy85VWg3MUx1Qjc5bUtuRjJLZnNzUnBLQXRRTHY3My80WVhm?=
 =?utf-8?B?OURwOVcxQUFEcklYdG51M1dxMmpjSFhKQTRyRmNLaUtuTEJtRUg4Z2NQWWtN?=
 =?utf-8?B?ODlnQjB1bTg0cGRYRzQ3V2Jnam54UXVhNmV4MFFVV2hIVkZZNDk2a2VFMXZz?=
 =?utf-8?B?Vk5tcGVLa1BVT2JIaWt5Z1FESHpwdzM2N2RmZm9WZjZ2bVdodzZrR0xCOU1y?=
 =?utf-8?B?bnd1bmxQR3Z4cmV0RU04U1BKWGE0eGZHMHlWdW5ha3RJa1B3NXowU1ZCczlI?=
 =?utf-8?B?VUtpbWFEOVdVd1NCa2FxM0srVjBtOXlpbUM5cXA4WUF3T09pbThmeHdteUZz?=
 =?utf-8?B?UXJIaWZwN05UWkd1NVNtTTFEbFd5RnJxckdGeUhQL3lFRWNJS211Zll6ZVFL?=
 =?utf-8?B?ZUJVOFpwS2lXL3VyZCsvZm02ZjFkbXduWXV3Q2NCMzI5VlFLMEdweTlTd2Rq?=
 =?utf-8?B?SUtYV2JocnhlaUsvaVBoZU5RWnBudG51Vlljais4bWU5TU1XNTVXc21JTU1y?=
 =?utf-8?B?emttY3FvdWFSRW9EYnFWN1NQdHh5a29UdVFIS1RRcStYMHVxZ00vc1g4Uytj?=
 =?utf-8?B?a0VtbnFPMzJZN0R0N0hBNnUwOTdBZzJHL25tSjhaaUhlZ29UVW42VDBkUUh5?=
 =?utf-8?B?TDBsdmhzOEhwYzRLOW5DQVpCcFhIcExOcGg1RzA3cEVVcCtGQjZJMkRYR0Ri?=
 =?utf-8?B?T3JMUGF3bklHQUlKenFsSUNadlV3ODJoYTlSaVZxVFowYVVjM09yZG1RMWdI?=
 =?utf-8?B?bHJSWGJGVzJGM1Q0cnRsSzBMVWpzOWxZYnd2dmV2OUxZTjJmREljYSsvVitM?=
 =?utf-8?B?ZnJqTU42Z1NaWmlRRW1SS2plVGxSNzZFS3dqZmZWa0h1Yy81UWc3bzlLcVEw?=
 =?utf-8?B?dzZtaVU2ZzNHTEw3Y3FtOXdQczZjVXJvMndLQUVsTVlWa0Q0TFpwYTJjcXRD?=
 =?utf-8?B?bkMwcWJUMmtpY0xWUE43ZVlUUFlHL2cxL0FsaUlEYkgyc2NzbzJqSUhOVnVq?=
 =?utf-8?B?YzZnR21nRXQyMy8rQXBsRXF5UmRCd0dpNEQ4OU5FdUJKSS9IOEVDbStybURZ?=
 =?utf-8?B?T2hXb0tEWEVPZzh2THNDdnUzblZIQUFJVzYrYlRaODZMdVhtaXMvQmsxcmJU?=
 =?utf-8?B?MG5mTk0yTVR5OGVDRS9vUkxzYWtBbTVCc2lBL0VERnpMRXBSOTFEbE9XcXNs?=
 =?utf-8?B?bkExY1ZJQXJqaXR6RnZkMEhmRmdNOWQxaHJJdTR1cU9mY0tOMGhJaTZ1aHZu?=
 =?utf-8?B?QVNydjVJWXNvenVhZ2lPaEtaT2xYL3BRMDBjV1g2UmJud1o0aUFPQnpYdTlp?=
 =?utf-8?B?YWZWSFBEejFiZ2t4MVowNi9UcFZ1NlpqSWRkTTZ1Rm1SMk94a1RLVExyQlZh?=
 =?utf-8?B?Z0pYczFSWXp0OGlWWWhYQjZMblY2dDc2OGNsczU2dHBha3hRekZnMjRoUG10?=
 =?utf-8?B?ZkZtb2xqbkJQeG0vTnd4c3lONi9IcCtmL0toR2M0UjkyaDNvTlNRQzJYelBJ?=
 =?utf-8?B?Q3ozZStRNHRGT3d3TndzTTFES1lUL3FZbzFXWnpENUZNV3pEY0FxTXBmVVgv?=
 =?utf-8?B?bDBDc1lzRHJMTVVnTjJQb1FSSWMyeGVQNGZleWJVKy9DMGxtMFBuRjBJUURo?=
 =?utf-8?B?d01uSXk0UitVZkhtTTVRV1h5Z1Y4T0FDSlplc20zeDk0cWxKZEVKOGl2Qitj?=
 =?utf-8?B?TTBrKzM2TjYyUUp5dDBmQmpYNmNjUk81SlNYTmlPTHZ4bjBwSFYrbnNRRDNX?=
 =?utf-8?B?djJWckVwY0JDY056Qm5icDBOWHgwR3ljQmV2T0hITThNSzlrck56dnFsY0Ev?=
 =?utf-8?Q?ayTns+AF8ls52?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDlTL2pKTk81cFdyMWNETHp5R3lmTGZ4VEEwYnFXaWIxZ1Zpd05pc1NqM2lt?=
 =?utf-8?B?K3docHRsYlY4Z2hJQVkrb0ZZNExhT0RmLzByMWpFZ0gzcHF4QktRSHVRb2Zr?=
 =?utf-8?B?RWNoUy9kT1RobTE4dkdSUkVWVFUvYkJwZWJHTDgzWm9xNTI4aUhjajRtdGM4?=
 =?utf-8?B?RWx5TlNUMC91eGxtbTNmOGU4dS9TQWhRdHl4RzJ1c0tjdnFUblVJMGlHeTFp?=
 =?utf-8?B?bUU5dkpjMEN2SUgza3JSVjlrUExNUnZqL2tBZmVmVlVKMkNlSVRZcjF6cVhr?=
 =?utf-8?B?U1pBTUpwU3gybVBLeTBjU3FIT0NrUG5PUHk4SENwaERXVTdNNWpIUy9DVjJy?=
 =?utf-8?B?S2JDTjNzaCs1c3M3Q2ZOaG1GS0w2dG9RYXhHckw2QUt3d3k3YmhQT2dyUmJO?=
 =?utf-8?B?MDhkVnZJenhnVzJrTUhIK1hXeVIyU3I5SlF6MFRMc0toTGR5OXNVZW80VExx?=
 =?utf-8?B?QUNGeFN0MFUrQlFjUzF3NC9ieEdFQlJpSXFNbk5rUkcrV3p5ZXN3c2pYZ2wz?=
 =?utf-8?B?UEJpemJ3QVZEZjNjZlUvekQvd0Nqek8wdkJxcjZVdEVSY21hdmEvWWNkY2dj?=
 =?utf-8?B?MTNtbmhVZnRUeTMwZ3VWaG5RT0xUbzBDOFVpL2sxK3lNaTZwTXVuYXdjeXRu?=
 =?utf-8?B?N2NiNzJLQ3pJbjlFVS9GdVNDVWdOdENVcy9tTnlLT2xmenJvNXErSFEwNHRC?=
 =?utf-8?B?bnVIc0pvWWVwNjNmZEt5L2RKbWNZZkRQbjNOVk5pMXRjTUpvTitWYnhyMzM5?=
 =?utf-8?B?aFlzSUhyS0Z6VXZNbUlWMHUrUGtqQm9YaE0zTkNCTU9KNEF2azJxaGV5QW9o?=
 =?utf-8?B?Q2lNWEIwOFU4MHljeHhNeGtzZE00SGV0cDNFM05FUUhzcTJqYXpUZ0VKUUdH?=
 =?utf-8?B?VVhKZ3JEMmg5eGJ3cXgxUmV2MkF2bHUxZnhQUEx4aXliL1Vkbm1RTUpNRGo2?=
 =?utf-8?B?bXcwa05KV05ZcHcxMjVVdE5rYkxlblU0OWgvWS9pQ0NOQVJ1WVU4NXBRcTRU?=
 =?utf-8?B?Q25uR2dYNXVWTHRTaDUyN09oR1JvNzh6WlJPRHR4TnBLell0L2ZiNmY2Z1E0?=
 =?utf-8?B?NW5lYUg0NGI1NVRDcmpPdnR5UGNoZkR3YkZNTXpSN3VZcG5KUTA3RFRHZ1Rl?=
 =?utf-8?B?c3RWcXJqZHNYdDR4T0pQVEU4OWpvbGhCN1Z4dkNUZXdWNERlT1hIbThmUlVY?=
 =?utf-8?B?V3MyZTFrblU5a2JiY3VvbWRxMmlhZkdpTUJldmU3ZCtvOWVDeS9Mek9BeFVL?=
 =?utf-8?B?Yngyejl6RlhKV0Zsdk1ocmZLSWtLN3ZTR1VYWmxNUExiYWg5UXdnR0pERVFD?=
 =?utf-8?B?TGRSWjJjYW4wSkhsM0ZPMjJoTDRIUnNWVk1UUzc3M29ONmJieDdIdWo2UkJX?=
 =?utf-8?B?VTVkaW05eDBNNWFQSGFMdkZ6WDJQc0hyWVE5MDU4dlhRS1Raek9vWmRmNXBD?=
 =?utf-8?B?M0hUMlc3aUJRTlQvNTJzS2c0dUUvZjMxZTNzNVIybFF4ZUFaSVdYK0lHSnI5?=
 =?utf-8?B?dHJrUDFQcTdsOWRyMXZtVUZSN1hMazhkR2dkQm1lNkhBS2w5Zm1VR0dKb0lx?=
 =?utf-8?B?VEJ5ZnhuWmR0WU02dGZqYzNkR05LSEQwUUZ0NERwdVh2Y3I2R0VjY3l4ZGE2?=
 =?utf-8?B?M2NydmxUbVRKL1AybGUxY05rQTBsT1p4VXBHaHl6T1lGTCtXY0EvRkRaeW14?=
 =?utf-8?B?czczU3pLM0pkOHEzY2oxTXluenBtQWJ5VU1pVU1TdEFNN1AzeTNrSXI0V3Fn?=
 =?utf-8?B?Qys1VFUzdEx1T2dydm9aK1RoT3dCZzJSVC9Mc1dmc242dUdISDYrSFhDbVNz?=
 =?utf-8?B?dG92STVPcjZTbktWYjNvRGZIRVY2YytEek1UcXRuS09kM2NCNllLTnJaOW1M?=
 =?utf-8?B?cHZZOE5uUUdlM01uZW9FODlYU2NlclBLOHZraFRmWDVZcHFPT0pTNWYrVVpV?=
 =?utf-8?B?U1NKL0RySUwxdVB1eWxKTWJ1anZ2SThjMVNCeHpzdFkyRTI3N1lqNnV4cFJm?=
 =?utf-8?B?RUphSlRPQXhKY09TazI3NlpsNTMvUlJtTWlORXdybnNsWFc5MTkxYlpsVnJY?=
 =?utf-8?B?T0JibFd3eEprWFdjaVp4MFhIb05SZGhpbVFyd1V2U29QUnpOQ08xYk5zb1d6?=
 =?utf-8?Q?M9TpOplrQwjHlkHzhPnyR4jN/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea447aa9-5f32-4a25-2d19-08dd4d04859e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 14:33:18.9916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: in7FP+M2Nb7LjrNii8Hqid/Y4vqw0uk6hBzWWyjMmBE5ukKVZFX1g9ZtHNChkWzkenWhabpJLJbokOc1p6tkDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4958
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


On 2/12/2025 19:47, Marcin Bernatowicz wrote:
> Replace hardcoded JOB_TIMEOUT_MS with sysfs_get_job_timeout_ms() to
> dynamically retrieve the value.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

LGTM,
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Narasimha C V <narasimha.c.v@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> ---
>   tests/intel/xe_sriov_scheduling.c | 30 ++++++++++++++++++++++--------
>   1 file changed, 22 insertions(+), 8 deletions(-)
>
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index fe037c1dc..82c525fe3 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -5,6 +5,7 @@
>   #include "igt.h"
>   #include "igt_sriov_device.h"
>   #include "igt_syncobj.h"
> +#include "igt_sysfs.h"
>   #include "xe_drm.h"
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_spin.h"
> @@ -423,7 +424,6 @@ static void log_sample_values(char *id, struct subm_stats *stats,
>   #define MIN_EXEC_QUANTUM_MS 8
>   #define MAX_EXEC_QUANTUM_MS 32
>   #define MIN_JOB_DURATION_MS 16
> -#define JOB_TIMEOUT_MS 5000
>   #define MAX_TOTAL_DURATION_MS 15000
>   #define PREFERRED_TOTAL_DURATION_MS 10000
>   #define MAX_PREFERRED_REPEATS 100
> @@ -434,6 +434,18 @@ struct job_sched_params {
>   	struct vf_sched_params sched_params;
>   };
>   
> +static uint32_t sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
> +{
> +	int engine_dir;
> +	uint32_t ret;
> +
> +	engine_dir = xe_sysfs_engine_open(fd, eci->gt_id, eci->engine_class);
> +	ret = igt_sysfs_get_u32(engine_dir, "job_timeout_ms");
> +	close(engine_dir);
> +
> +	return ret;
> +}
> +
>   static uint32_t derive_preempt_timeout_us(const uint32_t exec_quantum_ms)
>   {
>   	return exec_quantum_ms * 2 * USEC_PER_MSEC;
> @@ -539,15 +551,16 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
>   {
>   	struct subm_set set_ = {}, *set = &set_;
>   	uint8_t vf_ids[num_vfs + 1 /*PF*/];
> +	uint32_t job_timeout_ms = sysfs_get_job_timeout_ms(pf_fd, &xe_engine(pf_fd, 0)->instance);
>   	struct job_sched_params job_sched_params = prepare_job_sched_params(num_vfs + 1,
> -									    JOB_TIMEOUT_MS,
> +									    job_timeout_ms,
>   									    opts);
>   
> -	igt_info("eq=%ums pt=%uus duration=%ums repeats=%d num_vfs=%d\n",
> +	igt_info("eq=%ums pt=%uus duration=%ums repeats=%d num_vfs=%d job_timeout=%ums\n",
>   		 job_sched_params.sched_params.exec_quantum_ms,
>   		 job_sched_params.sched_params.preempt_timeout_us,
>   		 job_sched_params.duration_ms, job_sched_params.num_repeats,
> -		 num_vfs + 1);
> +		 num_vfs + 1, job_timeout_ms);
>   
>   	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
>   		    &(struct init_vf_ids_opts){ .shuffle = true,
> @@ -631,16 +644,17 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
>   				     const struct subm_opts *opts)
>   {
>   	struct subm_set set_ = {}, *set = &set_;
> +	uint32_t job_timeout_ms = sysfs_get_job_timeout_ms(pf_fd, &xe_engine(pf_fd, 0)->instance);
>   	struct vf_sched_params vf_sched_params = prepare_vf_sched_params(num_vfs, 1,
> -									 JOB_TIMEOUT_MS, opts);
> +									 job_timeout_ms, opts);
>   	uint64_t duration_ms = 2 * vf_sched_params.exec_quantum_ms +
>   			       vf_sched_params.preempt_timeout_us / USEC_PER_MSEC;
>   	int preemptible_end = 1;
>   	uint8_t vf_ids[num_vfs + 1 /*PF*/];
>   
> -	igt_info("eq=%ums pt=%uus duration=%lums num_vfs=%d\n",
> -		 vf_sched_params.exec_quantum_ms,
> -		 vf_sched_params.preempt_timeout_us, duration_ms, num_vfs);
> +	igt_info("eq=%ums pt=%uus duration=%lums num_vfs=%d job_timeout=%ums\n",
> +		 vf_sched_params.exec_quantum_ms, vf_sched_params.preempt_timeout_us,
> +		 duration_ms, num_vfs, job_timeout_ms);
>   
>   	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
>   		    &(struct init_vf_ids_opts){ .shuffle = true,
