Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087F0E7491B
	for <igt-dev@archiver.kernel.org>; Wed, 24 Dec 2025 06:35:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74C410E340;
	Wed, 24 Dec 2025 06:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/S1YVFS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A77E10E340
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Dec 2025 06:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766558102; x=1798094102;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=L7Jw5vLchj/bQ8/A71xymqPd3iSfbRbLm2ObRi2wp0A=;
 b=R/S1YVFSnj/v98sQwT9lwmR2/j2e+3mftN/q/bFvgh+BBfSuzTXH9dSN
 ij6LePNv7uvII99Ro6dQtFY5t+Yi/lS63dEWwtNOzSK5hBXBL1eHqY/6W
 GuZdtz0knAndpyyVoU8rzg2WzIgRLiW8w7ZQ/gvngHKBTCtwNtiIjMqcz
 LM9y+TjDBsWTMZgJwu9jDUUZeudyYh2msHHeTfYolPoG161jQ/oTQZ5ef
 fKH1uEgF1OwyXnr6lfbTJu/CWDgy1CUKVwPwL/ZHbrArjSYu/Rw1PlQ+B
 /z8u87ihyBUnfMrYg7v35L+ZDDc8MRhwEfyic46GnbS7mEploMmj5fRrL A==;
X-CSE-ConnectionGUID: x6Ffh3wOSDKUm4VNYz4k+A==
X-CSE-MsgGUID: r7a7z4IgTECBNCWTiKYiUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68283079"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; d="scan'208,217";a="68283079"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 22:35:01 -0800
X-CSE-ConnectionGUID: dJXmq9tfQnqhUoW+DcBKuQ==
X-CSE-MsgGUID: pklKv6bjRIiEElkf2iQ2zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
 d="scan'208,217";a="204879893"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 22:35:01 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 22:35:01 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 23 Dec 2025 22:35:01 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 22:34:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zhu1hcJNYxWVljSAeHY0knPJssfgQRuECqKMn1I9xQAIs78yrBLHwUddzqxMix5BRCBvlLUyX5oleJx9keSfEFvfyjoK2dKo8wubWrObUiQydEJ83Gklxq3X5ovj1fALDlb6ujJw+HnbjNKxuAOl7I84ab2qes1CPs+mQpkQ/IpBiaxM8M2+wMt+SLtwVNp4iZr+IxxuLESFEokOq7KxZBthJmNaSON/GBIO13MPP3zSvuWkf1J/moMplCKNu7Srm5XJNwpTymNhHMAzx1wvqV4us0BIRgMjGlI2ahfsw3B3isjNPuVeCHBNKCjYNIePgnSAxlEViFiJWT4oHayZ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnjzo2JoRQPh/BrQ0RzaqTeexCS+rBGk2++AY5FiuZk=;
 b=Wrtg5J3nE659/da2JIsHSYqwc23yd6LYE9dxZpI+KUeYv62GdnpZNRDHGXI3XN2HQ+fuzOZoQy3p/kzyXR46+0oLomN3Isxc6Jj7U3aEyhngwjgpRg7xZWuD7vYmSV8HbvgjjsAdb44aPnya0v0cvYFIyLe8KqKUYwskoRTGdLVT8Pw9JiOv9ENaYUdCj4GZ3VXDjUILzSHMSKILdKLD7yglwPihHCwtVQKLtCnAfYku1SOxtFam5r6BDvg1anesee7opbcfZ8yQvSg8k71SJvwkaaN5emGSxB9/uP0TcZCollbtSQSmuc47cWYJEKxWGefv4my355kLYIp2vQZi4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by BL1PR11MB5320.namprd11.prod.outlook.com (2603:10b6:208:316::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Wed, 24 Dec
 2025 06:34:33 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%5]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 06:34:33 +0000
Content-Type: multipart/alternative;
 boundary="------------pY40y2a3x6V74IQyJMEazqNC"
Message-ID: <e0f45783-59be-4345-adc4-e0a96bbee737@intel.com>
Date: Wed, 24 Dec 2025 12:04:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] tools/gputop/gputop: Enable support for
 multiple GPUs and instances
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <badal.nilawar@intel.com>, <kamil.konieczny@intel.com>,
 <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>
References: <20251217093109.4096902-1-soham.purkait@intel.com>
 <20251217093109.4096902-3-soham.purkait@intel.com>
 <20251222190257.tnoobh7kijzurxok@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20251222190257.tnoobh7kijzurxok@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: MA5P287CA0202.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::8) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|BL1PR11MB5320:EE_
X-MS-Office365-Filtering-Correlation-Id: d73549a1-07ea-4af7-f4dc-08de42b67ff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|8096899003|13003099007|7142099003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dy9CN0d2S04zcVhDb3VnWXZyeVBFQ01vNHcrMGU3QkphTUNJdVpFcG5wOUNY?=
 =?utf-8?B?WFI4VmpGUjBLUXF0ZFFyZktLYmJBR2k3dGxJQ0NRUmdlRU9VZnoybVJnQ1du?=
 =?utf-8?B?SDRIYVArUk9ua1Q3RFB3ZDhsaGgzQWlIYkVHUWc4eVk5eWN1WFlBREJvMktK?=
 =?utf-8?B?Q2ZJUDhIQXZkYlo4ZjdocXNlbjFXeDdlVVFmUXBhYW5RY3lZeGcxM3YxS3Zt?=
 =?utf-8?B?QlNOdUVHajJybkNCV0p5VWZJKzR3eEhOVnJ3OVJDSllwMW9yZGY5QnZxMjhj?=
 =?utf-8?B?TjF2K0toa1ZIZ1ZjRDUrblBxSi9LYjJSc3ZKSmlPWFlHYzNXZVRRVUJHS00y?=
 =?utf-8?B?eWRLZTdUc0xidW0rZWNkWDRleXFJZWVrYlkydTBXYmRwRWhGUGxOSmVuNEFS?=
 =?utf-8?B?QkFXUnJ4a1YxZEx4YVQvZkJQdGt1aEJ6ZTZDUmdxSDNWU0MweXVKbEVhUmdv?=
 =?utf-8?B?MkhrUGY5Z3BqeEJyeXpLYSs3QWpVMzRVUFBTbFZ1Z2pzeUd4bm5wZEpzNHJV?=
 =?utf-8?B?WWtyUlI0dUZYY3V0Nmk1d2psVjg3Q3VZYUcyWmV2NkRidDN1eGR6c3RKcUdm?=
 =?utf-8?B?aE1YbC9YaWNCSUd1R2dEZ1BndWpGRFdZSVVnMXlhOGhZUkJOek0wTzE4b2Fx?=
 =?utf-8?B?MEdUNmtmUlJWcFlxd1ArVFF2U2tYcmFnT05qc2p5L0JRR29lREJZeG5Ic2l4?=
 =?utf-8?B?Ulc4SWpZRlY2THNrck90RytiWmZZOU1KV1pqd0hNY0ltR2VYSytuQmFWWlFN?=
 =?utf-8?B?NjhNTi9TL1FzQ1pQYnd6cWJBNlBxU1pYVlI5Umd2bFlYcmtyaUhZNjFMYlJt?=
 =?utf-8?B?VHRMS0E4RHdjYTd1ZWlpWE9PYnE0NTRPWFNBQWxhQTMxdVRCSlFNN0pCY0ZC?=
 =?utf-8?B?MHBHSkNycWNpMUFFOExwWWFMNDdVeWpONHlYWURjRnRoLzhiNXYvdVV5R2w2?=
 =?utf-8?B?eEN3RjhQTW9iL0xBR1BOWWpDZ2QwbUp2MGtUK05XY0YyaERkb2xUZ0hFQzd1?=
 =?utf-8?B?TE5CbHc2RTA3VldWeVI4THBkbm5Oc0NCMGRzc1pnL3lUZHg1TnpoRDJGbW9J?=
 =?utf-8?B?RG55MmFxcllHdFoxK2cwa21zdjlFeFFNVnZ0Mlgza2NFOXlVdmRJeGRSNFd0?=
 =?utf-8?B?UTM5OGsxZlFNK2dzSEw4V3VSbjFIay9lcUVHbzROZEp5NGpkS1JVb1F2Rk5T?=
 =?utf-8?B?Z1lHSE1zWDNSUlZkMUtOcXkxT01wRUg1Y05zckhTUFR2SEEwbTg4anRDd3pj?=
 =?utf-8?B?RjBMZFUxZ3pZMTRqdHd4bHJoV05UbzZ6REIrcW9kZHpiRkhad3JTYXkvV3JN?=
 =?utf-8?B?SERxUzErVVQxMjdGU2FncEpJcjJTNzRYM1dtbk5XaVZuNGN3RVVTMGdxYk9Q?=
 =?utf-8?B?bVVTWXJoeE5RR3VUVmE5M09JQTY1eW1LcXg5WnJIcVZidTBnNTdFZG1zUTJP?=
 =?utf-8?B?QmlHWitZNmtpS3lPa1MxYVIrUUpyaHJFNDl2b3RBYWlxNjFVVVRaTXpuQmND?=
 =?utf-8?B?MVIxM0t5YzdBcVNrd3FQOHVnV3gxN3BsM2l1QWk5YlphY21HVFFJeDdzQVc2?=
 =?utf-8?B?OVVyd3hrZWptcmpYMkl1K1NWTC9FOEhuUkY0cklzOGw2amQ2VVlydmFmTnJQ?=
 =?utf-8?B?bUtOSEM0TGsydjRLQ3hHZ3hvdTBHd2h0SVU5OHhMazBoS1hNK3QxRG8rdEVK?=
 =?utf-8?B?TE14NWc0azNUQzMxbHJ4djZpVXhWTjJmUjRJQWpUNkZ2cm1tNGxBQ1dhZXFN?=
 =?utf-8?B?L0U5VVZxOXlCNWpYS1pFZXZHL2ZmUkZIbkdDbWJQb2Z0V3pmT1RuTFp4Y29j?=
 =?utf-8?B?VVRrYnlOV3d0SzJOTUxFdEV4WVM3RWNpRnJoQnpFUmpsZkZhWUV2MG5hSUpo?=
 =?utf-8?B?WVhmbm9OOFFtb3JhZk96QktSTDJScGRjM2VTSlg4YWY4S1FvVVgzUW0xNU5j?=
 =?utf-8?B?ckc0cFY1ZUVWMVVGQkg5YTV5MFZTNk9FbW02K1ZPSUtmRHdYZUQwV0kvcTh0?=
 =?utf-8?B?a3RaOTgvMnF3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(13003099007)(7142099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFNBWndRL0E4bmZIT05mZERiZ08vMkRPYS81NW1HZ3RMTy8yYy92YWgxSE1q?=
 =?utf-8?B?cUdUamcxYmNrRGE1aVhrZFdsdzN4YkQwaFFEeXV5Y1g3cHVUWFM5QXNvamhN?=
 =?utf-8?B?Nk9VaU9DWklGZWh4bVFVRitFaXlQWFlvamRWUlB1cnVidVFYeHNsWWRnWlo5?=
 =?utf-8?B?Y3c0RkdFRGR4YTFlYWt0Q0JmQ0RQVXVNdEJiQlE4dmI0Ny9zbHh4RzVWbkc5?=
 =?utf-8?B?ci9LM3Eya0RBVmRxWVhMMFJ4TDhNbEthTUhpcDd2VXB4SXZ2akgvZWZuYUFH?=
 =?utf-8?B?SDVtTTdhVVVaMkltdEkxanVUZW4zeFcvSWZIQ3hDWWNZaG01UEVWZWhJMnl6?=
 =?utf-8?B?bXU1aVJHMG9kVERNYUM1SmxsYjhXUGFoK0h2Y1NqRlB2SGlzRlo4M3FTUVJl?=
 =?utf-8?B?MjJCelVtVGIyeHAvRVVUemU4MDV5US84bDMvYVFEUkVoM0U4ZTBWNmtjeUdG?=
 =?utf-8?B?WUlPZkIyTHFrZkpBM2JkRm9EWVpVZTVsTVQzL2VHVlNZOXYreHR1ajE5bm0z?=
 =?utf-8?B?VGJiMjZrcmR4MHEzOGxEdDhmTkt3bTRsTEttQU5nRUg5VXM4Y21tcDdubkZ3?=
 =?utf-8?B?RkdjWHBvUEVoY24rOWQzREdCUENqMTJDUXlBRWRmUU55bWZ5Y2VjcG9kOFJN?=
 =?utf-8?B?NzhhYWE3Unh3K3VFQVc3VlFscGgyUllvS1IzRlZLN2NsZm5OeVNhVjlQWlNq?=
 =?utf-8?B?dEZzYWFvVEQxa1hiVmhZbFBHc3lLb2ZVY2RScE1VRmk3bkN0TGdOb3BDV0Va?=
 =?utf-8?B?MUt1a2xSZGxNcy9aZHlGWGlNK3JMQUl0ZzdSQTdvQUs2akI4THU5dll0cllQ?=
 =?utf-8?B?MjVqVWNwVUVDOUUreHFGOTRFMTl4UVlrL0puQmZVT0ZQalhyTXNIdW00N2Vn?=
 =?utf-8?B?bkM0T1ZhS3VEc0MzeDA5NXhBWU56elZjbmQvaTBHT2EzY2VIa2E0UUY3U00r?=
 =?utf-8?B?dlZhdDUxYzVCZTd1NUFidnJXMFlpdEdXLzU3SDhVQmxpQzVtVk0rOGliN3hK?=
 =?utf-8?B?a210Tk0rVHpPTFZlNTZtRW1zY3J1TzFxdk1kQklnTDByMnFvWEkvTVZ5WTQ0?=
 =?utf-8?B?aWhqU3BUblJadTRyVTNPOFdGZkVHbVRXbWtKQnBwZlpBWlEwc2VNN3BmSXAv?=
 =?utf-8?B?VklEZmF2K2VHM1FuKzVnVUpJU05kVmtYL3dVV0NObWowTCtESi9iaDdoSDA0?=
 =?utf-8?B?YmF4WGdRNVdiZ3MxdUJSWEx5SzJRL1JKUTg5Q21Jd3lwYkw5SzJwYWQ2TnNC?=
 =?utf-8?B?KzEwZFVKamZLdHRGQXlGc0pJTENiclEvVWwvaEpFUzZZQUcyZFk3Vk1NOWZL?=
 =?utf-8?B?MHVkU1BRd0JlYk1QSVg1YzhBMGFjU1JWRTBXdktBeE5IN0xOUHA0cm1SUUdC?=
 =?utf-8?B?ckRWSTVCTHZ1akRxeVY1TkhDQkJnS1Uza0daSjJRZFNScFZIRDNYWjR6THJ5?=
 =?utf-8?B?dE40YlkwNW1HREVaM05USzk2QmZoT3p2b1NqUmkzaUUydlFZbVV0Si9ZVGtX?=
 =?utf-8?B?eHNXR1FWbVVKK25JVXVvYXp0cGtZZkprVTZSbXYvaG9xVWFxOWlTZTR4V0pr?=
 =?utf-8?B?eDdSMC9sNFNVYVVKcG1zb3dtempaUHBrK05Wcis5OUZFaUt6aU9hQTloc0w1?=
 =?utf-8?B?OTIvSHg3TmJwemZoejhERytrdGQvVzhuK0w5TzU1RzhsQk1QSS9VRUV2eVhl?=
 =?utf-8?B?R2hPNjg2TU53d2pkUzdBYTFrbnlibjhGbU5ySlFlOVdEV2MyVGZvTFB4M25y?=
 =?utf-8?B?QjBFdHA0TXQ4cFhPZkpsSlQzZS95bFQ3Y0EvQzFYc2E4UDE2NTZqVmRDMmow?=
 =?utf-8?B?b1NUYWRuSW1UOUlONVc4SUxBRmJlbzR1eFd6Y1diTklpQmF2YlZTUVlXcTBE?=
 =?utf-8?B?TnNLNE1zQTkyOWhOUEJCN3RmNDErWm5kcmgvNEhOdEZ3K2VrengzcG51YzFw?=
 =?utf-8?B?WmlJeVJSekdNdXRJa3ByRmRZN2RIalBwRDdYazhaeXBrV3FjRUNQbUcxd0xp?=
 =?utf-8?B?U1RLTTdBZlQveWFLSS9PK2NRU2ZFM0tVb3RydERyOUxkOVlSVmxZSWcvb2Fs?=
 =?utf-8?B?RnpIblpxeW1XdDBMeDZib0Z5Nk9vbVRTQlY3OGdSWmhPS1l5ai9RWk1RSVZG?=
 =?utf-8?B?QzhUTmtzVkpSN3hiSlJZcTduNkxXeVBiTGs3QWZ2bWVucGdHREpKU3FqS2Ro?=
 =?utf-8?B?aFIrT1ZJU2d2S1hVRjdPZWdEM3RkNVZUUGhFN0lQLy9KWDZxTmh4Nk1WSXNU?=
 =?utf-8?B?NEkrdDllU1ZOTk1ncGp3WUI2Qkl0czBsZDczNit4MDd0ZEtEMStybTFySzlp?=
 =?utf-8?B?bWVxb0Y2WUsvaGNKUVBqc01nOHRFaUZESHBOMG5UTmJxZERJTDgwMjNPbDRT?=
 =?utf-8?Q?xwT+o5QwGL/jq1Bs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d73549a1-07ea-4af7-f4dc-08de42b67ff6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 06:34:33.5218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E79i3wRQFc9TpN9IIuBEMfwx1mrHs/XMcSERmcOdT/XtZNqYPB6XvkgDTD2iOY8+TqEE5gt/Dv2Xdayw34Io8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5320
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

--------------pY40y2a3x6V74IQyJMEazqNC
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Kamil,

On 23-12-2025 00:32, Kamil Konieczny wrote:
> Hi Soham,
> On 2025-12-17 at 15:01:09 +0530, Soham Purkait wrote:
>> Introduce vendor-agnostic support for handling multiple GPUs and instances
>> in gputop. Improve the tool's adaptability to various GPU configurations.
>>
>> v1:
>>   - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
>> v2:
>>   - Add device filter to populate the array of cards for
>>     all supported drivers. (Zbigniew)
>> v3:
>>   - Cosmetic changes. (Riana)
>>   - Avoid three level indentation. (Riana)
>> v4:
>>   - Add user message for running without root privileges. (Kamil)
>> v5:
>>   - Add support for GPU client-only busyness on unsupported
>>     drivers as a fallback mechanism. (Kamil)
>>
> This looks much better now, fallback works on i915.
> Also tests works, for example core_setmaster.
>
>> Signed-off-by: Soham Purkait<soham.purkait@intel.com>
>> ---
>>   tools/{ => gputop}/gputop.c | 299 +++++++++++++++++++++++++++++++-----
>>   tools/gputop/meson.build    |   6 +
> Btw could you change folder into tools/gputop.src/
> and compile it into tools/gputop?
> Now it is not convinient to call build/tools/gputop/gputop
>
>>   tools/meson.build           |   6 +-
>>   3 files changed, 266 insertions(+), 45 deletions(-)
>>   rename tools/{ => gputop}/gputop.c (58%)
>>   create mode 100644 tools/gputop/meson.build
>>
>> diff --git a/tools/gputop.c b/tools/gputop/gputop.c
>> similarity index 58%
>> rename from tools/gputop.c
>> rename to tools/gputop/gputop.c
>> index f577a1750..8ac67c975 100644
>> --- a/tools/gputop.c
>> +++ b/tools/gputop/gputop.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: MIT
>>   /*
>> - * Copyright © 2023 Intel Corporation
>> + * Copyright © 2023-2025 Intel Corporation
>>    */
>>   
>>   #include <assert.h>
>> @@ -14,66 +14,148 @@
>>   #include <math.h>
>>   #include <poll.h>
>>   #include <signal.h>
>> +#include <stdbool.h>
>>   #include <stdint.h>
>>   #include <stdio.h>
>>   #include <stdlib.h>
>>   #include <string.h>
>>   #include <sys/ioctl.h>
>>   #include <sys/stat.h>
>> +#include <sys/sysmacros.h>
>>   #include <sys/types.h>
>> -#include <unistd.h>
>>   #include <termios.h>
>> -#include <sys/sysmacros.h>
>> -#include <stdbool.h>
>> +#include <unistd.h>
>>   
>>   #include "igt_core.h"
>>   #include "igt_drm_clients.h"
>>   #include "igt_drm_fdinfo.h"
>> +#include "igt_perf.h"
>>   #include "igt_profiling.h"
>> -#include "drmtest.h"
> This is good.
>
>> +#include "xe_gputop.h"
>> +#include "xe/xe_query.h"
> This is not so good, all lib/xe/* are desined for testing
> and have many igt_assert/igt_require, so these libs are not
> suitable for linking into tools.

For xe related device access "xe_query.h" is required other wise the 
entire library needed to be rewritten for xe, which will lead to code 
redundancy. This is used only once at the initialization Not throughout 
the execution.

Thanks, Soham

>
>> +
>> +/**
>> + * Supported Drivers
>> + *
>> + * Adhere to the following requirements when implementing support for the
>> + * new driver:
>> + * @drivers: Update drivers[] with driver string.
>> + * @sizeof_gputop_obj: Update this function as per new driver support included.
>> + * @operations: Update the respective operations of the new driver:
>> + * gputop_init,
>> + * discover_engines,
>> + * pmu_init,
>> + * pmu_sample,
>> + * print_engines,
>> + * clean_up
>> + * @per_driver_contexts: Update per_driver_contexts[] array of type "struct gputop_driver" with the
>> + * initial values.
>> + */
>> +static const char * const drivers[] = {
>> +	"xe",
>> +    /* Keep the last one as NULL */
>> +	NULL
>> +};
>> +
>> +static size_t sizeof_gputop_obj(int driver_num)
>> +{
>> +	switch (driver_num) {
>> +	case 0:
>> +		return sizeof(struct xe_gputop);
>> +	default:
>> +		fprintf(stderr,
>> +			"Driver number does not exist.\n");
>> +		exit(EXIT_FAILURE);
>> +	}
>> +}
>> +
>> +/**
>> + * Supported operations on driver instances. Update the ops[] array for
>> + * each individual driver specific function. Maintain the sequence as per
>> + * drivers[] array.
>> + */
>> +struct device_operations ops[] = {
>> +	{
>> +		xe_gputop_init,
>> +		xe_populate_engines,
>> +		xe_pmu_init,
>> +		xe_pmu_sample,
>> +		xe_print_engines,
>> +		xe_clean_up
>> +	}
>> +};
>> +
>> +/*
>> + * per_driver_contexts[] array of type struct gputop_driver which keeps track of the devices
>> + * and related info discovered per driver.
>> + */
>> +struct gputop_driver per_driver_contexts[] = {
>> +	{false, 0, NULL}
>> +};
>>   
>>   enum utilization_type {
>>   	UTILIZATION_TYPE_ENGINE_TIME,
>>   	UTILIZATION_TYPE_TOTAL_CYCLES,
>>   };
>>   
>> -static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
>> -
>> -#define ANSI_HEADER "\033[7m"
>> -#define ANSI_RESET "\033[0m"
>> -
>> -static void n_spaces(const unsigned int n)
>> +static void gputop_clean_up(void)
>>   {
>> -	unsigned int i;
>> -
>> -	for (i = 0; i < n; i++)
>> -		putchar(' ');
>> +	for (int i = 0; drivers[i]; i++) {
>> +		ops[i].clean_up(per_driver_contexts[i].instances, per_driver_contexts[i].len);
>> +		free(per_driver_contexts[i].instances);
>> +		per_driver_contexts[i].device_present = false;
>> +		per_driver_contexts[i].len = 0;
>> +	}
>>   }
>>   
>> -static void print_percentage_bar(double percent, int max_len)
>> +static int find_driver(struct igt_device_card *card)
>>   {
>> -	int bar_len, i, len = max_len - 1;
>> -	const int w = 8;
>> -
>> -	len -= printf("|%5.1f%% ", percent);
>> -
>> -	/* no space left for bars, do what we can */
>> -	if (len < 0)
>> -		len = 0;
>> -
>> -	bar_len = ceil(w * percent * len / 100.0);
>> -	if (bar_len > w * len)
>> -		bar_len = w * len;
>> +	for (int i = 0; drivers[i]; i++) {
>> +		if (strcmp(drivers[i], card->driver) == 0)
>> +			return i;
>> +	}
>> +	return -1;
>> +}
>>   
>> -	for (i = bar_len; i >= w; i -= w)
>> -		printf("%s", bars[w]);
>> -	if (i)
>> -		printf("%s", bars[i]);
>> +static int populate_device_instances(const char *filter)
>> +{
>> +	struct igt_device_card *cards = NULL;
>> +	struct igt_device_card *card_inplace = NULL;
>> +	struct gputop_driver *driver_entry =  NULL;
>> +	int driver_no;
>> +	int count, final_count = 0;
>> +
>> +	count = igt_device_card_match_all(filter, &cards);
>> +	for (int j = 0; j < count; j++) {
>> +		if (strcmp(cards[j].subsystem, "pci") != 0)
>> +			continue;
>>   
>> -	len -= (bar_len + (w - 1)) / w;
>> -	n_spaces(len);
>> +		driver_no = find_driver(&cards[j]);
>> +		if (driver_no < 0)
>> +			continue;
>>   
>> -	putchar('|');
>> +		driver_entry = &per_driver_contexts[driver_no];
>> +		if (!driver_entry->device_present)
>> +			driver_entry->device_present = true;
>> +		driver_entry->len++;
>> +		driver_entry->instances = realloc(driver_entry->instances,
>> +						  driver_entry->len * sizeof_gputop_obj(driver_no));
>> +		if (!driver_entry->instances) {
>> +			fprintf(stderr,
>> +				"Device instance realloc failed (%s)\n",
>> +				strerror(errno));
>> +			exit(EXIT_FAILURE);
>> +		}
>> +		card_inplace = (struct igt_device_card *)
>> +				calloc(1, sizeof(struct igt_device_card));
>> +		memcpy(card_inplace, &cards[j], sizeof(struct igt_device_card));
>> +		ops[driver_no].gputop_init(driver_entry->instances, (driver_entry->len - 1),
>> +			card_inplace);
>> +		final_count++;
>> +	}
>> +	if (count)
>> +		free(cards);
>> +	return final_count;
>>   }
>>   
>>   static int
>> @@ -333,8 +415,31 @@ static void clrscr(void)
>>   struct gputop_args {
>>   	long n_iter;
>>   	unsigned long delay_usec;
>> +	char *device;
>>   };
>>   
>> +static bool should_continue(const char *question)
>> +{
>> +	char c;
>> +	int attempt = 0;
>> +
>> +	while (attempt++ < 3) {
>> +		printf("%s (y = yes, q = quit): ", question);
>> +		fflush(stdout);
>> +
>> +		if (scanf(" %c", &c) != 1)
>> +			continue;
>> +		else if (c == 'y' || c == 'Y')
>> +			return true;
>> +		else if (c == 'q' || c == 'Q')
>> +			return false;
>> +		printf("Invalid input. Try again.\n");
>> +	}
>> +
>> +	printf("Too many invalid attempts. Quitting.\n");
>> +	return false;
>> +}
>> +
>>   static void help(char *full_path)
>>   {
>>   	const char *short_program_name = strrchr(full_path, '/');
>> @@ -350,16 +455,18 @@ static void help(char *full_path)
>>   	       "\t-h, --help                show this help\n"
>>   	       "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n"
>>   	       "\t-n, --iterations =NUMBER  number of executions\n"
>> +	       "\t-D, --device              Device filter\n"
>>   	       , short_program_name);
>>   }
>>   
>>   static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>>   {
>> -	static const char cmdopts_s[] = "hn:d:";
>> +	static const char cmdopts_s[] = "hn:d:D:";
>>   	static const struct option cmdopts[] = {
>>   	       {"help", no_argument, 0, 'h'},
>>   	       {"delay", required_argument, 0, 'd'},
>>   	       {"iterations", required_argument, 0, 'n'},
>> +	       {"device", required_argument, 0, 'D'},
>>   	       { }
>>   	};
>>   
>> @@ -367,6 +474,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>>   	memset(args, 0, sizeof(*args));
>>   	args->n_iter = -1;
>>   	args->delay_usec = 2 * USEC_PER_SEC;
>> +	args->device = NULL;
>>   
>>   	for (;;) {
>>   		int c, idx = 0;
>> @@ -390,6 +498,9 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>>   				return -1;
>>   			}
>>   			break;
>> +		case 'D':
>> +			args->device = optarg;
>> +			break;
> Please split adding new option into separate patch.
>
>>   		case 'h':
>>   			help(argv[0]);
>>   			return 0;
>> @@ -417,9 +528,12 @@ int main(int argc, char **argv)
>>   	struct igt_profiled_device *profiled_devices = NULL;
>>   	struct igt_drm_clients *clients = NULL;
>>   	int con_w = -1, con_h = -1;
>> +	bool is_root;
>>   	int ret;
>>   	long n;
>>   
>> +	is_root = (geteuid() == 0);
>> +
>>   	ret = parse_args(argc, argv, &args);
>>   	if (ret < 0)
>>   		return EXIT_FAILURE;
>> @@ -428,6 +542,91 @@ int main(int argc, char **argv)
>>   
>>   	n = args.n_iter;
>>   	period_us = args.delay_usec;
>> +	populate_device_instances(args.device ? args.device
>> +				  : "device:subsystem=pci,card=all");
>> +
>> +	for (int i = 0; drivers[i]; i++) {
>> +		if (!per_driver_contexts[i].device_present)
>> +			continue;
>> +
>> +		for (int j = 0; j < per_driver_contexts[i].len; j++) {
>> +			if (!ops[i].init_engines(per_driver_contexts[i].instances, j)) {
>> +				fprintf(stderr,
>> +					"Failed to initialize engines! (%s)\n",
>> +					strerror(errno));
>> +					gputop_clean_up();
>> +				return EXIT_FAILURE;
>> +			}
>> +			ret = ops[i].pmu_init(per_driver_contexts[i].instances, j);
>> +
>> +			if (ret) {
>> +				if (errno == EACCES && !is_root) {
>> +					fprintf(stderr,
>> +						"\n"
>> +						"When running as a normal user, "
>> +						"CAP_PERFMON or perf_event_paranoid\n"
>> +						"is required to access engine performance "
>> +						"monitoring.\n"
>> +						"\n"
>> +						ANSI_HEADER "Steps to enable engine busyness"
> Why do you print this here? Could you print this in --help?
> Imho default should be to inform user once, wait few seconds
> and use fallback.
>
> Regards,
> Kamil
>
>> +						" to run without root (using CAP_PERFMON):"
>> +						ANSI_RESET "\n"
>> +						"cd /path/to/igt-gpu-tools/\n"
>> +						"sudo setcap cap_perfmon=+ep $(pwd)/"
>> +						"build/tools/gputop/gputop\n"
>> +						"sudo sh -c \"echo $(pwd)/build/lib >"
>> +						" /etc/ld.so.conf.d/lib-igt.conf\"\n"
>> +						"sudo ldconfig\n"
>> +						ANSI_HEADER "Steps to revert once done:"
>> +						ANSI_RESET "\n"
>> +						"sudo setcap cap_perfmon=-ep $(pwd)/"
>> +						"build/tools/gputop/gputop\n"
>> +						"sudo rm /etc/ld.so.conf.d/lib-igt.conf\n"
>> +						"sudo ldconfig\n"
>> +						"\n"
>> +						ANSI_HEADER "Steps to enable engine busyness"
>> +						" to run without root "
>> +						"(using perf_event_paranoid):"
>> +						ANSI_RESET "\n"
>> +						"# Save current value\n"
>> +						"orig_val=$(sysctl -n "
>> +						"kernel.perf_event_paranoid)\n"
>> +						"# Set the value to allow running"
>> +						" GPUTOP without root privileges\n"
>> +						"sudo sysctl -w kernel.perf_event_paranoid=-1\n"
>> +						ANSI_HEADER "Steps to revert once done:"
>> +						ANSI_RESET "\n"
>> +						"sudo sysctl -w kernel."
>> +						"perf_event_paranoid=$orig_val\n"
>> +						"\n"
>> +						"For details, see 'Perf events and "
>> +						"tool security':\n"
>> +						"https://www.kernel.org/doc/html/"
>> +						"latest/admin-guide/perf-security.html\n\n");
>> +					igt_devices_free();
>> +					gputop_clean_up();
>> +
>> +					if (!should_continue("Do you want to continue with only "
>> +							   "gpu client busyness ?"))
>> +						return EXIT_SUCCESS;
>> +				} else {
>> +					fprintf(stderr,
>> +						"Failed to initialize PMU! (%s)\n",
>> +						strerror(errno));
>> +					igt_devices_free();
>> +					gputop_clean_up();
>> +					return EXIT_FAILURE;
>> +				}
>> +			}
>> +		}
>> +	}
>> +
>> +	for (int i = 0; drivers[i]; i++) {
>> +		for (int j = 0;
>> +		     per_driver_contexts[i].device_present && j < per_driver_contexts[i].len;
>> +		     j++)
>> +			ops[i].pmu_sample(per_driver_contexts[i].instances, j);
>> +	}
>>   
>>   	clients = igt_drm_clients_init(NULL);
>>   	if (!clients)
>> @@ -449,22 +648,42 @@ int main(int argc, char **argv)
>>   
>>   	while ((n != 0) && !stop_top) {
>>   		struct igt_drm_client *c, *prevc = NULL;
>> -		int i, engine_w = 0, lines = 0;
>> +		int k, engine_w = 0, lines = 0;
>>   
>>   		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
>> +
>> +		for (int i = 0; drivers[i]; i++) {
>> +			for (int j = 0;
>> +			     per_driver_contexts[i].device_present &&
>> +			     j < per_driver_contexts[i].len;
>> +			     j++)
>> +				ops[i].pmu_sample(per_driver_contexts[i].instances, j);
>> +		}
>> +
>>   		igt_drm_clients_sort(clients, client_cmp);
>>   
>>   		update_console_size(&con_w, &con_h);
>>   		clrscr();
>>   
>> +		for (int i = 0; drivers[i]; i++) {
>> +			for (int j = 0;
>> +			     per_driver_contexts[i].device_present &&
>> +			     j < per_driver_contexts[i].len;
>> +			     j++) {
>> +				lines = ops[i].print_engines(per_driver_contexts[i].instances, j,
>> +							 lines, con_w, con_h);
>> +			}
>> +		}
>> +
>>   		if (!clients->num_clients) {
>> -			const char *msg = " (No GPU clients yet. Start workload to see stats)";
>> +			const char *msg;
>>   
>> +			msg = " (No GPU clients yet. Start workload to see stats)";
>>   			printf(ANSI_HEADER "%-*s" ANSI_RESET "\n",
>>   			       (int)(con_w - strlen(msg) - 1), msg);
>>   		}
>>   
>> -		igt_for_each_drm_client(clients, c, i) {
>> +		igt_for_each_drm_client(clients, c, k) {
>>   			assert(c->status != IGT_DRM_CLIENT_PROBE);
>>   			if (c->status != IGT_DRM_CLIENT_ALIVE)
>>   				break; /* Active clients are first in the array. */
>> @@ -488,11 +707,11 @@ int main(int argc, char **argv)
>>   	}
>>   
>>   	igt_drm_clients_free(clients);
>> +	gputop_clean_up();
>>   
>>   	if (profiled_devices != NULL) {
>>   		igt_devices_configure_profiling(profiled_devices, false);
>>   		igt_devices_free_profiling(profiled_devices);
>>   	}
>> -
>>   	return 0;
>>   }
>> diff --git a/tools/gputop/meson.build b/tools/gputop/meson.build
>> new file mode 100644
>> index 000000000..4766d8496
>> --- /dev/null
>> +++ b/tools/gputop/meson.build
>> @@ -0,0 +1,6 @@
>> +gputop_src = [ 'gputop.c', 'utils.c', 'xe_gputop.c']
>> +executable('gputop', sources : gputop_src,
>> +           install : true,
>> +           install_rpath : bindir_rpathdir,
>> +           dependencies : [igt_deps,lib_igt_perf,lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],
>> +	   install: true)
>> diff --git a/tools/meson.build b/tools/meson.build
>> index 8185ba160..99a732942 100644
>> --- a/tools/meson.build
>> +++ b/tools/meson.build
>> @@ -70,11 +70,6 @@ if libudev.found()
>>   		   install : true)
>>   endif
>>   
>> -executable('gputop', 'gputop.c',
>> -           install : true,
>> -           install_rpath : bindir_rpathdir,
>> -           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
>> -
>>   intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
>>   executable('intel_l3_parity', sources : intel_l3_parity_src,
>>   	   dependencies : tool_deps,
>> @@ -123,3 +118,4 @@ endif
>>   subdir('i915-perf')
>>   subdir('xe-perf')
>>   subdir('null_state_gen')
>> +subdir('gputop')
>> -- 
>> 2.34.1
>>
--------------pY40y2a3x6V74IQyJMEazqNC
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Kamil,</p>
    <div class="moz-cite-prefix">On 23-12-2025 00:32, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251222190257.tnoobh7kijzurxok@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">Hi Soham,
On 2025-12-17 at 15:01:09 +0530, Soham Purkait wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Introduce vendor-agnostic support for handling multiple GPUs and instances
in gputop. Improve the tool's adaptability to various GPU configurations.

v1:
 - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
v2:
 - Add device filter to populate the array of cards for
   all supported drivers. (Zbigniew)
v3:
 - Cosmetic changes. (Riana)
 - Avoid three level indentation. (Riana)
v4:
 - Add user message for running without root privileges. (Kamil)
v5:
 - Add support for GPU client-only busyness on unsupported
   drivers as a fallback mechanism. (Kamil)

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This looks much better now, fallback works on i915.
Also tests works, for example core_setmaster.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Signed-off-by: Soham Purkait <a class="moz-txt-link-rfc2396E" href="mailto:soham.purkait@intel.com">&lt;soham.purkait@intel.com&gt;</a>
---
 tools/{ =&gt; gputop}/gputop.c | 299 +++++++++++++++++++++++++++++++-----
 tools/gputop/meson.build    |   6 +
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Btw could you change folder into tools/gputop.src/
and compile it into tools/gputop?
Now it is not convinient to call build/tools/gputop/gputop

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> tools/meson.build           |   6 +-
 3 files changed, 266 insertions(+), 45 deletions(-)
 rename tools/{ =&gt; gputop}/gputop.c (58%)
 create mode 100644 tools/gputop/meson.build

diff --git a/tools/gputop.c b/tools/gputop/gputop.c
similarity index 58%
rename from tools/gputop.c
rename to tools/gputop/gputop.c
index f577a1750..8ac67c975 100644
--- a/tools/gputop.c
+++ b/tools/gputop/gputop.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright © 2023 Intel Corporation
+ * Copyright © 2023-2025 Intel Corporation
  */
 
 #include &lt;assert.h&gt;
@@ -14,66 +14,148 @@
 #include &lt;math.h&gt;
 #include &lt;poll.h&gt;
 #include &lt;signal.h&gt;
+#include &lt;stdbool.h&gt;
 #include &lt;stdint.h&gt;
 #include &lt;stdio.h&gt;
 #include &lt;stdlib.h&gt;
 #include &lt;string.h&gt;
 #include &lt;sys/ioctl.h&gt;
 #include &lt;sys/stat.h&gt;
+#include &lt;sys/sysmacros.h&gt;
 #include &lt;sys/types.h&gt;
-#include &lt;unistd.h&gt;
 #include &lt;termios.h&gt;
-#include &lt;sys/sysmacros.h&gt;
-#include &lt;stdbool.h&gt;
+#include &lt;unistd.h&gt;
 
 #include &quot;igt_core.h&quot;
 #include &quot;igt_drm_clients.h&quot;
 #include &quot;igt_drm_fdinfo.h&quot;
+#include &quot;igt_perf.h&quot;
 #include &quot;igt_profiling.h&quot;
-#include &quot;drmtest.h&quot;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This is good.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#include &quot;xe_gputop.h&quot;
+#include &quot;xe/xe_query.h&quot;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This is not so good, all lib/xe/* are desined for testing
and have many igt_assert/igt_require, so these libs are not
suitable for linking into tools.</pre>
    </blockquote>
    <p>For xe related device access&nbsp;<span style="white-space: pre-wrap">&quot;xe_query.h&quot; is required other wise the entire library needed to be rewritten</span>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style><span style="white-space: pre-wrap"> for xe, which will lead to code redundancy. This is used only once at the initialization Not throughout the execution.</span></p>
    <p><span style="white-space: pre-wrap">Thanks,
Soham</span></p>
    <p><span style="white-space: pre-wrap"></span></p>
    <span style="white-space: pre-wrap">
</span>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <blockquote type="cite" cite="mid:20251222190257.tnoobh7kijzurxok@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+/**
+ * Supported Drivers
+ *
+ * Adhere to the following requirements when implementing support for the
+ * new driver:
+ * @drivers: Update drivers[] with driver string.
+ * @sizeof_gputop_obj: Update this function as per new driver support included.
+ * @operations: Update the respective operations of the new driver:
+ * gputop_init,
+ * discover_engines,
+ * pmu_init,
+ * pmu_sample,
+ * print_engines,
+ * clean_up
+ * @per_driver_contexts: Update per_driver_contexts[] array of type &quot;struct gputop_driver&quot; with the
+ * initial values.
+ */
+static const char * const drivers[] = {
+	&quot;xe&quot;,
+    /* Keep the last one as NULL */
+	NULL
+};
+
+static size_t sizeof_gputop_obj(int driver_num)
+{
+	switch (driver_num) {
+	case 0:
+		return sizeof(struct xe_gputop);
+	default:
+		fprintf(stderr,
+			&quot;Driver number does not exist.\n&quot;);
+		exit(EXIT_FAILURE);
+	}
+}
+
+/**
+ * Supported operations on driver instances. Update the ops[] array for
+ * each individual driver specific function. Maintain the sequence as per
+ * drivers[] array.
+ */
+struct device_operations ops[] = {
+	{
+		xe_gputop_init,
+		xe_populate_engines,
+		xe_pmu_init,
+		xe_pmu_sample,
+		xe_print_engines,
+		xe_clean_up
+	}
+};
+
+/*
+ * per_driver_contexts[] array of type struct gputop_driver which keeps track of the devices
+ * and related info discovered per driver.
+ */
+struct gputop_driver per_driver_contexts[] = {
+	{false, 0, NULL}
+};
 
 enum utilization_type {
 	UTILIZATION_TYPE_ENGINE_TIME,
 	UTILIZATION_TYPE_TOTAL_CYCLES,
 };
 
-static const char *bars[] = { &quot; &quot;, &quot;▏&quot;, &quot;▎&quot;, &quot;▍&quot;, &quot;▌&quot;, &quot;▋&quot;, &quot;▊&quot;, &quot;▉&quot;, &quot;█&quot; };
-
-#define ANSI_HEADER &quot;\033[7m&quot;
-#define ANSI_RESET &quot;\033[0m&quot;
-
-static void n_spaces(const unsigned int n)
+static void gputop_clean_up(void)
 {
-	unsigned int i;
-
-	for (i = 0; i &lt; n; i++)
-		putchar(' ');
+	for (int i = 0; drivers[i]; i++) {
+		ops[i].clean_up(per_driver_contexts[i].instances, per_driver_contexts[i].len);
+		free(per_driver_contexts[i].instances);
+		per_driver_contexts[i].device_present = false;
+		per_driver_contexts[i].len = 0;
+	}
 }
 
-static void print_percentage_bar(double percent, int max_len)
+static int find_driver(struct igt_device_card *card)
 {
-	int bar_len, i, len = max_len - 1;
-	const int w = 8;
-
-	len -= printf(&quot;|%5.1f%% &quot;, percent);
-
-	/* no space left for bars, do what we can */
-	if (len &lt; 0)
-		len = 0;
-
-	bar_len = ceil(w * percent * len / 100.0);
-	if (bar_len &gt; w * len)
-		bar_len = w * len;
+	for (int i = 0; drivers[i]; i++) {
+		if (strcmp(drivers[i], card-&gt;driver) == 0)
+			return i;
+	}
+	return -1;
+}
 
-	for (i = bar_len; i &gt;= w; i -= w)
-		printf(&quot;%s&quot;, bars[w]);
-	if (i)
-		printf(&quot;%s&quot;, bars[i]);
+static int populate_device_instances(const char *filter)
+{
+	struct igt_device_card *cards = NULL;
+	struct igt_device_card *card_inplace = NULL;
+	struct gputop_driver *driver_entry =  NULL;
+	int driver_no;
+	int count, final_count = 0;
+
+	count = igt_device_card_match_all(filter, &amp;cards);
+	for (int j = 0; j &lt; count; j++) {
+		if (strcmp(cards[j].subsystem, &quot;pci&quot;) != 0)
+			continue;
 
-	len -= (bar_len + (w - 1)) / w;
-	n_spaces(len);
+		driver_no = find_driver(&amp;cards[j]);
+		if (driver_no &lt; 0)
+			continue;
 
-	putchar('|');
+		driver_entry = &amp;per_driver_contexts[driver_no];
+		if (!driver_entry-&gt;device_present)
+			driver_entry-&gt;device_present = true;
+		driver_entry-&gt;len++;
+		driver_entry-&gt;instances = realloc(driver_entry-&gt;instances,
+						  driver_entry-&gt;len * sizeof_gputop_obj(driver_no));
+		if (!driver_entry-&gt;instances) {
+			fprintf(stderr,
+				&quot;Device instance realloc failed (%s)\n&quot;,
+				strerror(errno));
+			exit(EXIT_FAILURE);
+		}
+		card_inplace = (struct igt_device_card *)
+				calloc(1, sizeof(struct igt_device_card));
+		memcpy(card_inplace, &amp;cards[j], sizeof(struct igt_device_card));
+		ops[driver_no].gputop_init(driver_entry-&gt;instances, (driver_entry-&gt;len - 1),
+			card_inplace);
+		final_count++;
+	}
+	if (count)
+		free(cards);
+	return final_count;
 }
 
 static int
@@ -333,8 +415,31 @@ static void clrscr(void)
 struct gputop_args {
 	long n_iter;
 	unsigned long delay_usec;
+	char *device;
 };
 
+static bool should_continue(const char *question)
+{
+	char c;
+	int attempt = 0;
+
+	while (attempt++ &lt; 3) {
+		printf(&quot;%s (y = yes, q = quit): &quot;, question);
+		fflush(stdout);
+
+		if (scanf(&quot; %c&quot;, &amp;c) != 1)
+			continue;
+		else if (c == 'y' || c == 'Y')
+			return true;
+		else if (c == 'q' || c == 'Q')
+			return false;
+		printf(&quot;Invalid input. Try again.\n&quot;);
+	}
+
+	printf(&quot;Too many invalid attempts. Quitting.\n&quot;);
+	return false;
+}
+
 static void help(char *full_path)
 {
 	const char *short_program_name = strrchr(full_path, '/');
@@ -350,16 +455,18 @@ static void help(char *full_path)
 	       &quot;\t-h, --help                show this help\n&quot;
 	       &quot;\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n&quot;
 	       &quot;\t-n, --iterations =NUMBER  number of executions\n&quot;
+	       &quot;\t-D, --device              Device filter\n&quot;
 	       , short_program_name);
 }
 
 static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 {
-	static const char cmdopts_s[] = &quot;hn:d:&quot;;
+	static const char cmdopts_s[] = &quot;hn:d:D:&quot;;
 	static const struct option cmdopts[] = {
 	       {&quot;help&quot;, no_argument, 0, 'h'},
 	       {&quot;delay&quot;, required_argument, 0, 'd'},
 	       {&quot;iterations&quot;, required_argument, 0, 'n'},
+	       {&quot;device&quot;, required_argument, 0, 'D'},
 	       { }
 	};
 
@@ -367,6 +474,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 	memset(args, 0, sizeof(*args));
 	args-&gt;n_iter = -1;
 	args-&gt;delay_usec = 2 * USEC_PER_SEC;
+	args-&gt;device = NULL;
 
 	for (;;) {
 		int c, idx = 0;
@@ -390,6 +498,9 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 				return -1;
 			}
 			break;
+		case 'D':
+			args-&gt;device = optarg;
+			break;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Please split adding new option into separate patch.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 		case 'h':
 			help(argv[0]);
 			return 0;
@@ -417,9 +528,12 @@ int main(int argc, char **argv)
 	struct igt_profiled_device *profiled_devices = NULL;
 	struct igt_drm_clients *clients = NULL;
 	int con_w = -1, con_h = -1;
+	bool is_root;
 	int ret;
 	long n;
 
+	is_root = (geteuid() == 0);
+
 	ret = parse_args(argc, argv, &amp;args);
 	if (ret &lt; 0)
 		return EXIT_FAILURE;
@@ -428,6 +542,91 @@ int main(int argc, char **argv)
 
 	n = args.n_iter;
 	period_us = args.delay_usec;
+	populate_device_instances(args.device ? args.device
+				  : &quot;device:subsystem=pci,card=all&quot;);
+
+	for (int i = 0; drivers[i]; i++) {
+		if (!per_driver_contexts[i].device_present)
+			continue;
+
+		for (int j = 0; j &lt; per_driver_contexts[i].len; j++) {
+			if (!ops[i].init_engines(per_driver_contexts[i].instances, j)) {
+				fprintf(stderr,
+					&quot;Failed to initialize engines! (%s)\n&quot;,
+					strerror(errno));
+					gputop_clean_up();
+				return EXIT_FAILURE;
+			}
+			ret = ops[i].pmu_init(per_driver_contexts[i].instances, j);
+
+			if (ret) {
+				if (errno == EACCES &amp;&amp; !is_root) {
+					fprintf(stderr,
+						&quot;\n&quot;
+						&quot;When running as a normal user, &quot;
+						&quot;CAP_PERFMON or perf_event_paranoid\n&quot;
+						&quot;is required to access engine performance &quot;
+						&quot;monitoring.\n&quot;
+						&quot;\n&quot;
+						ANSI_HEADER &quot;Steps to enable engine busyness&quot;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why do you print this here? Could you print this in --help?
Imho default should be to inform user once, wait few seconds
and use fallback.

Regards,
Kamil

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+						&quot; to run without root (using CAP_PERFMON):&quot;
+						ANSI_RESET &quot;\n&quot;
+						&quot;cd /path/to/igt-gpu-tools/\n&quot;
+						&quot;sudo setcap cap_perfmon=+ep $(pwd)/&quot;
+						&quot;build/tools/gputop/gputop\n&quot;
+						&quot;sudo sh -c \&quot;echo $(pwd)/build/lib &gt;&quot;
+						&quot; /etc/ld.so.conf.d/lib-igt.conf\&quot;\n&quot;
+						&quot;sudo ldconfig\n&quot;
+						ANSI_HEADER &quot;Steps to revert once done:&quot;
+						ANSI_RESET &quot;\n&quot;
+						&quot;sudo setcap cap_perfmon=-ep $(pwd)/&quot;
+						&quot;build/tools/gputop/gputop\n&quot;
+						&quot;sudo rm /etc/ld.so.conf.d/lib-igt.conf\n&quot;
+						&quot;sudo ldconfig\n&quot;
+						&quot;\n&quot;
+						ANSI_HEADER &quot;Steps to enable engine busyness&quot;
+						&quot; to run without root &quot;
+						&quot;(using perf_event_paranoid):&quot;
+						ANSI_RESET &quot;\n&quot;
+						&quot;# Save current value\n&quot;
+						&quot;orig_val=$(sysctl -n &quot;
+						&quot;kernel.perf_event_paranoid)\n&quot;
+						&quot;# Set the value to allow running&quot;
+						&quot; GPUTOP without root privileges\n&quot;
+						&quot;sudo sysctl -w kernel.perf_event_paranoid=-1\n&quot;
+						ANSI_HEADER &quot;Steps to revert once done:&quot;
+						ANSI_RESET &quot;\n&quot;
+						&quot;sudo sysctl -w kernel.&quot;
+						&quot;perf_event_paranoid=$orig_val\n&quot;
+						&quot;\n&quot;
+						&quot;For details, see 'Perf events and &quot;
+						&quot;tool security':\n&quot;
+						<a class="moz-txt-link-rfc2396E" href="https://www.kernel.org/doc/html/">&quot;https://www.kernel.org/doc/html/&quot;</a>
+						&quot;latest/admin-guide/perf-security.html\n\n&quot;);
+					igt_devices_free();
+					gputop_clean_up();
+
+					if (!should_continue(&quot;Do you want to continue with only &quot;
+							   &quot;gpu client busyness ?&quot;))
+						return EXIT_SUCCESS;
+				} else {
+					fprintf(stderr,
+						&quot;Failed to initialize PMU! (%s)\n&quot;,
+						strerror(errno));
+					igt_devices_free();
+					gputop_clean_up();
+					return EXIT_FAILURE;
+				}
+			}
+		}
+	}
+
+	for (int i = 0; drivers[i]; i++) {
+		for (int j = 0;
+		     per_driver_contexts[i].device_present &amp;&amp; j &lt; per_driver_contexts[i].len;
+		     j++)
+			ops[i].pmu_sample(per_driver_contexts[i].instances, j);
+	}
 
 	clients = igt_drm_clients_init(NULL);
 	if (!clients)
@@ -449,22 +648,42 @@ int main(int argc, char **argv)
 
 	while ((n != 0) &amp;&amp; !stop_top) {
 		struct igt_drm_client *c, *prevc = NULL;
-		int i, engine_w = 0, lines = 0;
+		int k, engine_w = 0, lines = 0;
 
 		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
+
+		for (int i = 0; drivers[i]; i++) {
+			for (int j = 0;
+			     per_driver_contexts[i].device_present &amp;&amp;
+			     j &lt; per_driver_contexts[i].len;
+			     j++)
+				ops[i].pmu_sample(per_driver_contexts[i].instances, j);
+		}
+
 		igt_drm_clients_sort(clients, client_cmp);
 
 		update_console_size(&amp;con_w, &amp;con_h);
 		clrscr();
 
+		for (int i = 0; drivers[i]; i++) {
+			for (int j = 0;
+			     per_driver_contexts[i].device_present &amp;&amp;
+			     j &lt; per_driver_contexts[i].len;
+			     j++) {
+				lines = ops[i].print_engines(per_driver_contexts[i].instances, j,
+							 lines, con_w, con_h);
+			}
+		}
+
 		if (!clients-&gt;num_clients) {
-			const char *msg = &quot; (No GPU clients yet. Start workload to see stats)&quot;;
+			const char *msg;
 
+			msg = &quot; (No GPU clients yet. Start workload to see stats)&quot;;
 			printf(ANSI_HEADER &quot;%-*s&quot; ANSI_RESET &quot;\n&quot;,
 			       (int)(con_w - strlen(msg) - 1), msg);
 		}
 
-		igt_for_each_drm_client(clients, c, i) {
+		igt_for_each_drm_client(clients, c, k) {
 			assert(c-&gt;status != IGT_DRM_CLIENT_PROBE);
 			if (c-&gt;status != IGT_DRM_CLIENT_ALIVE)
 				break; /* Active clients are first in the array. */
@@ -488,11 +707,11 @@ int main(int argc, char **argv)
 	}
 
 	igt_drm_clients_free(clients);
+	gputop_clean_up();
 
 	if (profiled_devices != NULL) {
 		igt_devices_configure_profiling(profiled_devices, false);
 		igt_devices_free_profiling(profiled_devices);
 	}
-
 	return 0;
 }
diff --git a/tools/gputop/meson.build b/tools/gputop/meson.build
new file mode 100644
index 000000000..4766d8496
--- /dev/null
+++ b/tools/gputop/meson.build
@@ -0,0 +1,6 @@
+gputop_src = [ 'gputop.c', 'utils.c', 'xe_gputop.c']
+executable('gputop', sources : gputop_src,
+           install : true,
+           install_rpath : bindir_rpathdir,
+           dependencies : [igt_deps,lib_igt_perf,lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],
+	   install: true)
diff --git a/tools/meson.build b/tools/meson.build
index 8185ba160..99a732942 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -70,11 +70,6 @@ if libudev.found()
 		   install : true)
 endif
 
-executable('gputop', 'gputop.c',
-           install : true,
-           install_rpath : bindir_rpathdir,
-           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
-
 intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
 executable('intel_l3_parity', sources : intel_l3_parity_src,
 	   dependencies : tool_deps,
@@ -123,3 +118,4 @@ endif
 subdir('i915-perf')
 subdir('xe-perf')
 subdir('null_state_gen')
+subdir('gputop')
-- 
2.34.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------pY40y2a3x6V74IQyJMEazqNC--
