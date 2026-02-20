Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1800C55AB9
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 12:09:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB1610E355;
	Fri, 20 Feb 2026 12:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jH1KOwVT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C601310E355
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 12:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771589372; x=1803125372;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DZT1s1yZANcf7Utg+cShy9SEBLBRkFWdP84uTrQRXWg=;
 b=jH1KOwVTmtsxP+etYIeo1qfHyERo4HRmDv5g6ZTDSAL/5fbzBxeunlV3
 mxsn8NbZ8RSQnLoHOamIzC24rVOkNUKDZKHW5MWMP3ZTu/5hClapp9wJN
 kza2nBoG9JA5hcDocV1ZJooOkSAgsfzsiVKJfwMvJ1dQe/Nl6nlSf6pC8
 dcGkb6lItZn2SIXUpXIX6S6Dnam5aCn5Y8xVtJnL23nzdnDA3TmLTJHtH
 ncv6iOaab+aceCeAMH7mCSlS99vTaK+69BTy4vumtB7z4ZFVhZwwk1uXR
 YwL+hCVXHQ2K1/+ytR6uqouh88ko62R15JbJ04Z1DBfk2HBqvDQJwTpn1 g==;
X-CSE-ConnectionGUID: 5BBIDotiTUWxoZzgCU49AA==
X-CSE-MsgGUID: k52bD1PwQfemKSRvXI2PrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76543421"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="76543421"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 04:09:31 -0800
X-CSE-ConnectionGUID: e2ikUiatRreX5YwuE0tE4g==
X-CSE-MsgGUID: VzqORMO6ToyRuUE6UmZ/Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="243308724"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 04:09:31 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 04:09:31 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 04:09:31 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.12) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 04:09:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gta2lARUjwwyIv9FqGzaF/H4boMI/HhOn4GCR3HfXGNqT77uCtIjOvy/wRvgVctB/Scb9pRmWhB4K/hFWqw9KL98tAM42223ipe2K2Qo1bQj5aRWUe/gOE4XNS/aK1OpPxtNKYMmm7eBHj2AnnaKgrPEag2rbUSYhB8j7UcDy7/bYNPOeu6E0ZdxnNW7HRTDDytsmHJmlCCKRrBaMV4FBkeW2LZZC+jK2icfGUk+h17DfXGWGO+VE6He2fL1TMUuPowUtwLAFT79FhgeGyFikvaBkWtGsVv7KtyP2Ud5s5EATCk/9rI+zW9kNwkPCwHgdCFBKF4F/h8AI3KUgcE9MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fA1MX/RsY/mk1XfkdtYxG1yeCeB+1e0WsH9g10/ek0Q=;
 b=GYAAfdJ5wFB0xF2X83S0F1DklRhg1FpNuytMBQj/Xh+lpa6q/eQLtvBYcsmkP7rgEHVlobm2/58Ph6CtKK0gS1nQ2rwKaUa4oMfG87MxMZEmlo22H5I0+d+qGgqTeUleA2dvWrUAggNc+HHaAaRkrujskq3Qb8G1TdX3IzOMC1htWNqRvLPb5ieB9GNU3EPPR8a++pk8Ts2es0+J1MfdWC7Tqw7h6kOh24gXG6GRLnNxwxlIYFnMdOJq7D3gKMmFRvDYrlysunzPq6Zzn4wJvDEdTfR+MbK56hfqXLwvvSeL8hQL9LWt28TghHn4AU6uRmX14sTDTNuai4//i4cxCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 12:09:28 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9611.013; Fri, 20 Feb 2026
 12:09:28 +0000
Message-ID: <37dc23bc-8be4-4d83-beae-1e464530667d@intel.com>
Date: Fri, 20 Feb 2026 17:39:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_plane: Allow planar-pixel-format-settings
 to pass on VKMS
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Renjun Wang
 <renjunw0@foxmail.com>, <igt-dev@lists.freedesktop.org>, Karthik B S
 <karthik.b.s@intel.com>
References: <tencent_009881AF754F22143F3943B76A2645C05A0A@qq.com>
 <20260204122952.gl5jttuyhdmr2mm4@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260204122952.gl5jttuyhdmr2mm4@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::16) To DM4PR11MB5993.namprd11.prod.outlook.com
 (2603:10b6:8:5c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA0PR11MB7187:EE_
X-MS-Office365-Filtering-Correlation-Id: c7aa7f98-09aa-46ef-ed2e-08de7078e4ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDVTdnByREJReTNXVTFwZmIxTks1Tko2ckcvRzBEVEpTZjk2Mmd0SzhzbHdi?=
 =?utf-8?B?YTJhVFJDRGxYRC9kblNBTjdQMjAybmNUd0hnbmdOQVlSVnJGZzJZNTl2Vklq?=
 =?utf-8?B?OHpCbFFIMjBYVUwrek96cFFsMUZuU2dsZzZxUlhFMDd0YjBEeU9nME92Wk45?=
 =?utf-8?B?dmJWdUZaajJHancvOUh1M0Vhekd5MnlHRGNKZHlmc0FPeHp6SFlFbUthUmQz?=
 =?utf-8?B?OHRCTGRibUNmcmhZbFE1Q1JOOEM4L0dMaHJTL3htQ1h4RytRcThmZFRIYmRa?=
 =?utf-8?B?R2lXR3drRllkWHFjUndjb0FMcy9MU1pKUkltcXlidmZRWTVSZFRLYnhmVk5D?=
 =?utf-8?B?bGQxK0JCM3pBanlxZlJRMXdoaG1lZ3Z3S2N0UGkwelVmU1JpdUJBREJvdmNG?=
 =?utf-8?B?V2M0MDltV3JtL1lCYVU4UEJ5YUUxMUpvbE9POFlsY0dvM2ZDZmIrajJVS1Bx?=
 =?utf-8?B?SDRoNnRCMytJTEFZaldNdkRKS2NRUUk3TUNOUnFkUkRzTGpoK2grSm43bkgw?=
 =?utf-8?B?Qk5BUVZ6V2VlNnNsakgxMW1GRDNPOHZzR3QybFZOZjF5ektRVUoybkRlVzls?=
 =?utf-8?B?VEx2K3JER01MekhFSUVOcXhpV04ySGZrbjI1bHYvcU03UzRkeFlNZ3d3OTdh?=
 =?utf-8?B?V3RQMDk5K0htMUlxVE5nd0puYVdwOFhVQzRpOGg0ZUI1MGlBK29mZElGYmZh?=
 =?utf-8?B?cVJoTDRlY25iZGwyM2hHOWgrcy8xMWFleU8yWFJObEpTd0MzN0JOcGl4b0Vj?=
 =?utf-8?B?SW5UUXZtQmd0WlFIT1FHNDNRVzZma09odFNZbVVLQ1dseTJ3MGpzMHJHMk1P?=
 =?utf-8?B?U09jRWxIMnZ5YVpsRjg5dCsxajNPc2pLYTJXT3JKWjNqdUNXcjB2MEk5SUlk?=
 =?utf-8?B?ajNJNGJvTzdTbm1md3ZIMUZ4bytEaU1YVWRXRjBrZWpZR2duRDdzeElsZlFS?=
 =?utf-8?B?aXdGT1Brc3hmM1dNRHQzS054OUNDYmVNVlVEVy9XTXBldmR1NnFsL2JGcFZE?=
 =?utf-8?B?c0crVVhzQ016WndwWGd2Rm94Y3V2VTQ2SU9BcUpGK2RlRllaTThlcXRRaFVl?=
 =?utf-8?B?aXdhSVphcXNpemIzWkp6bG5GY1p5UllKMzM2YXZvNmUyUEQwU0tuV3B0anRJ?=
 =?utf-8?B?VGxxS3g2S1FNUU5xRlNBdFZabmJsczd4NFRLSXBCWVdaSEFKN0dCeWVweCtM?=
 =?utf-8?B?Sk1LU3NuOE5nTW5CdzBrZnZQcGhrQnFZVmlRV3B6OTAyZW84ZHA4bk51a3JF?=
 =?utf-8?B?RGd6bFNYa1p4QUZIbkNwOTArREZ1MlYvemFUV2YyYnljbzZsOFlKMENLeXF0?=
 =?utf-8?B?bnErUVN6VHFpZlE3T3ZIS3d4RnhhS2tXL2tZNkYxTFJZd3RWc2lPQ3U0RE0z?=
 =?utf-8?B?em1EZGd1YWJsQXpxZmpudWZ6UWxSSHhoZko5RjNUM2d1N0ltdFRYTXlmbTNz?=
 =?utf-8?B?U05EYlpVYWUxb2Q2bnFUSTZjLzZ5Y3JwTVpMOExnY3hkWHltUHRZTmxhOWht?=
 =?utf-8?B?UjJxd01IRDdLemFtWHVLUFN3Z29EWDdoUmZ2cE9aajEvTThhZ2VDRXdHM1Bq?=
 =?utf-8?B?d1RyZXptQit3SURIVGt1RVpTSFo2Qi9FREJBQjI5M0RkTTRPZU1sYzlyaDRE?=
 =?utf-8?B?b2tLeFQ3OC9JZU5Ua1NpSDFIbGpwaWc1SjNrZU5mNVhVUm13YnluT1VqR3c5?=
 =?utf-8?B?WW1OTWRTNjJBcVpPWlEycmdCMFpYbGQxNW1vdWdhRXJJZlQrVEs4TG5GcWpZ?=
 =?utf-8?B?VGNXekF6MmhTdzlTNDBnZVM4RWl2S29uUGN5QXpXbkE4ZXVPcGlVRDF5UjFJ?=
 =?utf-8?B?ekVsczlPY2sxSEhZV3ZSVXhXZXd1NGU5aWh6N2NlNVZQZWFpNE9JY2hBSHF1?=
 =?utf-8?B?WGxrdDRERWlkTFV6emxxdjdoRWRwelVlb3UrUU9RL3l1U3lkSVRMWWNpK3or?=
 =?utf-8?B?aUIvUGUwKzhHUUFWWE0xUGRPNkFDMlFPVGtxdTFoRjNFcjBnSk9ESHhVZE5Y?=
 =?utf-8?B?SW90blFkQXpja2ROY0djSG96TU5yL2lOVVlSYnBtUk43OE8wQTdXc0lzb09j?=
 =?utf-8?B?QmljRmZXL2txZlYxdTVSU3lObDlYb1RlT001dU96SGdvblRWVnphdlZPTGlR?=
 =?utf-8?Q?9dXiorCSydMhaBy7al8W7ia6X?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlJ6K2g5TUFqc291WWxHZ2JQRTI1ZmZJN0pucFloalVNaUh3TlkvL2tXczR5?=
 =?utf-8?B?RmFWTnlqSnBoTFRFaUdJZXhMOVBQK2R4YlV2V21yd3dqbXcyL0FoWWVweFlK?=
 =?utf-8?B?T2xkSWx1ZHUxYlBQd25XeisrNUgyd1ZqK0FyN0lqVlNKb3E1dzhoTmtIWFpH?=
 =?utf-8?B?TlQzR3dCaDVVa1VQeVgxY203eW9XalZyTjZ3OXR1Y3MxSkQ5V2lCM0p1ZHV2?=
 =?utf-8?B?eTEyUUhlbnhUVTJuY01CeHkwVjEzLzVVQkhjS1N2M0EzWkJjWlFXVWRibWdP?=
 =?utf-8?B?QjF4VzNGZFM1S0hyWS81VXNrc1VQbjF6WkJ6MWtkRDdRYUlBUFpmOFl3UzMw?=
 =?utf-8?B?cCtzRy85b2RCTHlldUdDRWdUYkNwRlJEYkdsYTRtYlFRZTgxcFFDVWw0S0Mz?=
 =?utf-8?B?cCs3Ykl2MFhGSEhpK3ZYd2dtZkpFOSt1dTNDMU9jQjA4cUROV0RoaXg2QUQ5?=
 =?utf-8?B?REVoajlVYUJRU0c1NVNGdTd4RU45REE1Q2tmMTFCUlpkT0VrK3ZDZ01SZDNQ?=
 =?utf-8?B?dkVWOWJqWGtlZFhuZy9Xb3hLcU5maVhNdUNEUmw5Zm00b3JyWnVYNnVxdjAw?=
 =?utf-8?B?Z3FXaDRNTVd4S3J1UmsyL2J4MkFuWGExamdhbm1wNDg4ckVsY01wSWFMNjM1?=
 =?utf-8?B?S0lNb0h2S1VJVEN5T3BtY2hDdkNTaGlIbWthbWl4VkFZaVpPY3NhS0RjS2JM?=
 =?utf-8?B?dXVLZmNrVG83b3R1TWxLb3lFN2sva1RJR1Nhb1Mybm9DSEpWRjE3MmJkWDVJ?=
 =?utf-8?B?bERVTkpBdDBkVWZCQmZ0dXFXdG4rVlFzRzN5cXdFZm40cm9uNnpyYUJ6Nm9i?=
 =?utf-8?B?ellmQVJLMGNVWThUNEFOaGhPdnVRRnVBTnJ5NmJybGhjNnd1OVBYaHVQUE0w?=
 =?utf-8?B?YmFNZ2ZFSVFwSGtqQi9VK05NbnMydC8vU0hKY2JNMzZqT3E1aHpUUnFvWGI4?=
 =?utf-8?B?SVk3TmtWRk1JbzduV2NIYW8ya3M5b1UvcjZNRXVTWXlCU1VXMzBEcjNPNm5m?=
 =?utf-8?B?c1JNai9ONCtnbFhSd3dqakt6RXo0UUVVbUFtQitsUlV2Z2JFaitDYldKN01o?=
 =?utf-8?B?dW5wMlp4T2ZVR1Y2ZVVtN3ZTR0U5SVg4ZUpjYUF4R2dLSFZrRlIxcmh6cHZl?=
 =?utf-8?B?SFpkbDJaK2R3V1B0U1Q2OUwxREVHd0gvUUFxakkxUmExYTRhZk9aeTE4VEo3?=
 =?utf-8?B?Vnl4d1VuL1p4OUVjeDNFRFJ6VU5GQUZJNzJrRkNFYTI1UXl1aUxoVXdUeGdY?=
 =?utf-8?B?UUdYSHl2bjF3QkNCQ0hmUmg3UnRkMnNIWFF2WEJLdXJUL2QzR3pEVEdDTHJY?=
 =?utf-8?B?OXlnS0ZLS2JxdS9UeWNyYk1PKzRvR3pUQktaTzJQTWdUSEpuRlVHakhYVkdj?=
 =?utf-8?B?NEtWSnllNjVKWEt1RHRyYlFNV201ZWwweGR5UnJjSmtuZ0tIT0VYaEh6SzBp?=
 =?utf-8?B?RXZjWkRwc1BNaWduK1lFVnptZFR2K1lBalAzZnJDSzk3b3dRYS9QMlNpNUlq?=
 =?utf-8?B?WUluWWtLcXVKWVlpVWNXSEVybXhWbVllUUFOb1lOMlArUTBzZ0tJYUVkUFNt?=
 =?utf-8?B?VklHclpVbUhaTStRb2dIQTlYbVhRMEN4SGZZaXQ5dGFzZ0kzbU9mTmFITVE4?=
 =?utf-8?B?MVI4TFhHM2syWEt5bWpIdytpc0dOOGdid0hVRFZGRG1uUlBiZTVzbkE3VWhV?=
 =?utf-8?B?d3RDdlVoaURGWUxweXdSeGZieU01OE1kYnVrWUZ4dXJLQ25yUXR1YVdnZk02?=
 =?utf-8?B?YmJyY3pJWk5Ha1NObmR6aDdaNHpaQ3ZIR3FudGd5M09GamY4RW1BdzF5cWFC?=
 =?utf-8?B?OENPeVVaVEVYanIrT0luU24zekNuakhDUFExQmE3Zk43alhTMFZGOUlnZkxN?=
 =?utf-8?B?RzlBazdwR1RIMmhwZjZGenBRR0pFY0hsakZocW5IaTZlU1dTbHBGaHVDT0RN?=
 =?utf-8?B?K1pqRFdCWVNvNmRIcmZtWVpNZDlMUEt5YzhSL1c3bUQ5WTNoZUdqNVYwNjIw?=
 =?utf-8?B?elFUTi9MSWpuRVlGSDhwZFlNZGNOZXhuRGRNVU93VnVzNklwQ0VNanhDQmgw?=
 =?utf-8?B?YUxUZmxOdS9NMGd1bTVpamcxR1Z0b1dGTU82VkFxUkQ0RzlNYjk1V0NPVEZE?=
 =?utf-8?B?WEh4OEdLRndyQjN3dWJMLytBcUJFMHZjZDZrQjBqcVpJVHNRazhobitkNHh5?=
 =?utf-8?B?aHdJZmZpV0M3ditVYmZZLzc0WkxnbDNKdm5LdHNkWFhUc1dvaytIM2o1ZlN3?=
 =?utf-8?B?T255TjRJMlFRM0lCNVdLcVg3c1BvdkZkNi90V2YwdWtPZzhuMGl6RXRjcFBa?=
 =?utf-8?B?T0V1N3pQQzhTN2NwUXJCNmhuT0d6OCtEdHN6OU9WZE1SVHBzY0x3Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7aa7f98-09aa-46ef-ed2e-08de7078e4ee
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5993.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 12:09:28.2228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1xgNoOR9e8RBYRxygluC5d6WgKhRxdKgm7MZDGNp61qxl72SLTpqIwklogRaKc9Z1K45gpNqCYaiQesTcJ0vlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7187
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

Hi Renjun,

On 04-02-2026 05:59 pm, Kamil Konieczny wrote:
> Hi Renjun,
> On 2026-02-01 at 14:11:43 +0800, Renjun Wang wrote:
>> Set expected_rval to 0 for planar-pixel-format-settings tests when
>> running on VKMS driver. VKMS currently accepts odd width/height for
>> NV12, odd horizontal panning for NV12, and odd vertical panning for
>> P016 formats.
>>
>> Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
>> ---
>>   tests/kms_plane.c | 25 +++++++++++++------------
>>   1 file changed, 13 insertions(+), 12 deletions(-)
>>
>> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
>> index 21d80847c..57adfe199 100644
>> --- a/tests/kms_plane.c
>> +++ b/tests/kms_plane.c
>> @@ -1313,11 +1313,9 @@ static void test_planar_settings(data_t *data)
>>   	int devid;
>>   	int display_ver = -1;
>>   	int rval;
>> +	bool is_intel = false;
>> +	bool is_vkms = false;
>>   
>> -	/*
>> -	 * If here is added non-intel tests below require will need to be
>> -	 * changed to if(..)
>> -	 */
>>   	igt_require_f(data->display.is_atomic, "Atomic mode-set not supported\n");
>>   	if (is_intel_device(data->drm_fd)) {
>>   		igt_require_intel(data->drm_fd);
>> @@ -1325,6 +1323,9 @@ static void test_planar_settings(data_t *data)
>>   		igt_require(intel_display_ver(devid) >= 9);
>>   		display_ver = intel_display_ver(devid);
>>   		igt_require(display_ver >= 9);
>> +		is_intel = true;
>> +	} else if (is_vkms_device(data->drm_fd)) {
>> +		is_vkms = true;
>>   	}
>>   
>>   	output = igt_get_single_output_for_pipe(&data->display, pipe);
>> @@ -1337,12 +1338,12 @@ static void test_planar_settings(data_t *data)
>>   				  DRM_MODE_ATOMIC_ALLOW_MODESET,
>>   				  NULL);
>>   
>> -	/* test against intel_plane_check_src_coordinates() in i915 */
> I am not sure if removing this is proper, maybe move it just below
> before 'if((is_intel...'
> Same concern below, when you remove other i915 comments.
>
> +cc Karthik and Swati
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
>
>> +	/* Test odd width for NV12 format */
> Do we need it here, when just below is DRM_FORMAT_NV12?
> Or is it 'odd width' that is worth pointing out?
> Same concern below.
>
> Overall looks good. Btw Karthik or Swati, please find someone
> from KMS team and send this for testing, I will ack it then.
>
> Regards,
> Kamil

Agree with Kamil, lets keep existing comments as it is. Please add your 
changes on top of those.

https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14559/shards-all.html?testfilter=planar-pixel-format-settings

https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14559/shards-all.html?testfilter=planar-pixel-format-settings

There isn't any regression on CI results, results are okay.

>
>>   	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>>   				     DRM_FORMAT_MOD_LINEAR)) {
>>   		int expected_rval = -EINVAL;
>>   
>> -		if (display_ver >= 20)
>> +		if ((is_intel && display_ver >= 20) || is_vkms)
>>   			expected_rval = 0;
>>   
>>   		igt_create_fb(data->drm_fd, 257, 256,
>> @@ -1358,12 +1359,12 @@ static void test_planar_settings(data_t *data)
>>   		igt_debug("Odd width NV12 framebuffer test skipped\n");
>>   	}
>>   
>> -	/* test against intel_plane_check_src_coordinates() in i915 */
>> +	/* Test odd height for NV12 format */
>>   	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>>   				     DRM_FORMAT_MOD_LINEAR)) {
>>   		int expected_rval = -EINVAL;
>>   
>> -		if (display_ver >= 20 && display_ver < 35)
>> +		if ((is_intel && display_ver >= 20 && display_ver < 35) || is_vkms)
>>   			expected_rval = 0;
>>   
>>   		igt_create_fb(data->drm_fd, 256, 257,
>> @@ -1378,13 +1379,12 @@ static void test_planar_settings(data_t *data)
>>   	} else {
>>   		igt_debug("Odd height NV12 framebuffer test skipped\n");
>>   	}
>> -
>> -	/* test against intel_plane_check_src_coordinates() in i915 */
>> +	/*Test odd horizontal panning for NV12 format */
>>   	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>>   				     DRM_FORMAT_MOD_LINEAR)) {
>>   		int expected_rval = -EINVAL;
>>   
>> -		if (display_ver >= 35)
>> +		if ((is_intel && display_ver >= 35) || is_vkms)
>>   			expected_rval = 0;
>>   
>>   		igt_create_fb(data->drm_fd, 810, 590,
>> @@ -1401,11 +1401,12 @@ static void test_planar_settings(data_t *data)
>>   		igt_debug("Odd horizontal pan NV12 framebuffer test skipped\n");
>>   	}
>>   
>> +	/* Test odd vertical panning for P016 format */
>>   	if (igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
>>   					    DRM_FORMAT_MOD_LINEAR)) {
>>   		int expected_rval = -EINVAL;
>>   
>> -		if (display_ver >= 20 && display_ver < 35)
>> +		if ((is_intel && display_ver >= 20 && display_ver < 35) || is_vkms)
>>   			expected_rval = 0;
>>   
>>   		igt_create_color_fb(data->drm_fd, 256, 260,
>> -- 
>> 2.47.3
>>
