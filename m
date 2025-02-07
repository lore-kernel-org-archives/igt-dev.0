Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56877C02192
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 05:52:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1609E10E256;
	Fri,  7 Feb 2025 05:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uqj65Vg/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921DF10E256
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 05:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738907543; x=1770443543;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=FXIQRfx7WZD2zmVrCINnj7hbt2SbfnfmM4yuVpZHg/0=;
 b=Uqj65Vg/aSmKPkm5N36hcOeaciwF3ULDxBjb32cKeuC+ZLgDeGfndCvE
 3usIu9e1WALdW+BpbQiLdTwGzDldKK9xNfbTGVj9w4ViPLC4cBmLPlxXX
 3GzrZBFo/UZCtpTVPii9QLkRVDngbwDFduDFsJezybDVdSA1txm5snsWL
 uiO5IY/XjU5CbDwwZAOwC+IUdC2fH1wMUtQavN1tTfcJC0ZsP/gRF2P54
 EeZN8y+l6DG3KX7Xigiu7hprjUqZVMdZMITrwA1GF4z/ReIaKVe721u12
 Wnf14joYv1OCQ4A9a69Rk/WG6agX4RV3aXo7qw6V6/rANsYy5yI8FNKzb g==;
X-CSE-ConnectionGUID: 8WJd5iPsQKCzm6jhZAnoww==
X-CSE-MsgGUID: NayPsw2IQTeEjrOSqm9G6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39671121"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="39671121"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 21:52:23 -0800
X-CSE-ConnectionGUID: qjum97xPQd6ecCnYA5c3ag==
X-CSE-MsgGUID: hCDNFgRNSsyAPbLBEu0boQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="111404484"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 21:52:22 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 21:52:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 21:52:22 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 21:52:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8wFICkSJ0a6l4urGTq7wBn1uM7rbl5mPa8VdgnZXhNP5aL+lf9mUm7Gmm/3G0OC6O1oRa13qb52KO1vGlTFp2isi1s/MTtD9hfvy6o6Nic9JL0Myn2sMNul34Q+KXfc4ln09hZAmFNpdYjtc3zlHx8Eapu0lXHKR6RJ75gU0lcYctNl8TTmsTf4NhBoaVVqSc0Ogs2M+5VtcP9cjcIyOM00SOBJDj2NVhdkfvCHwyxSS+7PaSWE2O6be1603+Z4i2a6HRT2hKDTZDRbtSwiqFBMSet+I5MOhVusV7w+EJ8cSq+j1bj+pqoBUo4koqT64pmNRk7F7SD1UZEJ+07Oag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vR1w+MWKdGkMhnQs449c0yZhHyO3eFtANRqvfHCC3HE=;
 b=PWqt5bTzDWsqRUbFEbIk4Ky94eOXogGsKWzB0bJp6MEHWH6iOaDtBdxkmsug9vwpZziX+qS13s9FrwIdgPBZ34ZLTmpl1WMRLi/iulizzZNT+eOFNyVzY4qf7TLYIJDOWFEb82RNCe+DPwz3SB+pfz4qaantaYxgjBbp66eFWGkoVwlpyhsrGpOf3g3cjzpaXaKvk9eHRAeJ4Uul9Gp1OLWK24Oti6j+bMRgH2PhQHcZUfDZSdzay0ijlVnfFzOHHiLBjB5LzGG6IDUVPfgzjGOWpt2f0JgnTBBr5ojzXstDA8M8RQ40dculf0e2R1RGUkqc68ZHhNMx6s/oyDjSEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH7PR11MB8454.namprd11.prod.outlook.com (2603:10b6:510:30c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Fri, 7 Feb
 2025 05:52:05 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 05:52:04 +0000
Message-ID: <3fd0b917-c455-400b-99b4-1666847b7927@intel.com>
Date: Fri, 7 Feb 2025 11:21:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] lib/igt_kms: Add lib changes to check joiner is
 enabled
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250204182734.793645-1-jeevan.b@intel.com>
 <20250204182734.793645-2-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250204182734.793645-2-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0145.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::15) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH7PR11MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c2c2730-ab24-4346-0edd-08dd473b8c90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3lpVHF0ZGhBVjdCKzRadGdKb1Fha2ovVmJveTNNWmF6WjFPNTFiLzluOGg5?=
 =?utf-8?B?c2ZaejltQkJGcXp2aVFjaTJ3clNuRDdiYXkyT29WR05OYUt1aVRXTjFNSWVP?=
 =?utf-8?B?SldtMkU1WG9vUzFuVDB3bzgxZ3pCUkFUbE1xek1UMDhlZ1RocXdmZXRoR3p1?=
 =?utf-8?B?c20zQlVFYnJQczRiYUo0NHF3L1ljMjJENkxxL2NIZmpCU2pNOHViYkFrcVlq?=
 =?utf-8?B?NGxROHJpajB6TTZSWmZlTDg2SDRIcGFNWXFlVGRtUnQrUnBLK3pNdyt2aUJT?=
 =?utf-8?B?b0FmMldKdzUwVGFacDVmZ254RGVkSVBaa3o1cFhUUTVnZkxOWFlWeWNIYlZC?=
 =?utf-8?B?NXJwNExYdk92QWVxZC9xemJJdTAvMkRqWlFQVEJiRlRMb2p4MTlQbW9OazNo?=
 =?utf-8?B?Uy9lMzFKRW5BYiswc3lMM0xXSmtSQ1h5RGUyZHl6UDBEYnZyWlhndU1OSSsv?=
 =?utf-8?B?UDFpbjhHTGVpOUl2QkxRKzdScDJwd0o2R0dPMCtJRzg2UFdVa0ZjWEJSa3Yz?=
 =?utf-8?B?azZreUJvWWs3a3FreUxDOGNjSnJ6aXBZUGV2d0FONGtENWNGaVZnTHk5ZHM4?=
 =?utf-8?B?eTBlV0RjNytORDhJNGJnMXhXRjVnVjMrTXlGVm9sT2xpd2N3WWY3bjZsRWlR?=
 =?utf-8?B?YjhFaDd0ekE0WWhaYWphZGFFdW9TSkYxSkd3YmJGd05IR015eUY1aTZ3VVhu?=
 =?utf-8?B?RjZxUWV6czJaUGJFdXQzWTZHbk9PNVJIVldqSWhJMUlrZzNGak1POXB1LzNo?=
 =?utf-8?B?eFoxVmh2eFRqcm1ZTHQxdGhOOWhNRkY1NGdMTDVDcGRxTG42QjArQ3psNE9P?=
 =?utf-8?B?enFtY2drUUc2QU4wczI5ZW4xWWFZU2tqMFh4VnZvUHE1Y1QyUDVHNjNhYzFM?=
 =?utf-8?B?Wnc1akg4SjZ4S3MxNDdPc01FUGlhNUYxWmpHa0IrWkd3VFMzOGhqeTFOSmpj?=
 =?utf-8?B?MjgvWUlhMkJqSytWZXAzYUVNeUppclIyMVBjRmpYbWdab0x2THJsQ3BoZ21y?=
 =?utf-8?B?WTJLMUV2c1pQQVhoUHJ1UWttdWF3UmZuVk5RY21sR0NnSmlLQytnczF6Z0NB?=
 =?utf-8?B?ekQ3MlVBMGJuVW16akc3VlFZai9iVEtNeTF5MzBXNGk0aG5pTkhkYldNUTVJ?=
 =?utf-8?B?dTROTW0vK281disvRkFBcXQ2OXZqOE1lWTR2WHRvZFVGM2dvRTRQbVdnNDBn?=
 =?utf-8?B?ZmZRY0QvTm1XTUF3K2hiY2Z0V0pEeWt0ZWRGSCtsRHlCUnp6R2dzVVF3UlZo?=
 =?utf-8?B?ZG9tVTVwc0pnSmtSL3VWcGg3aE5xZ1Z4OE0rcE5EYmpuZUZnZTBqUThXMnFU?=
 =?utf-8?B?ZkJ1YTRMVkdvSWx0b0src2NYclpaQXlZOS9wcTRUUTUzOGtoSVBZK3JCR3Bz?=
 =?utf-8?B?eWZ6eGVGTTVGMWswTWI0YnYrd3JFUWNmUXRCRjA2bWdJMzdsazRuRVZmNWFL?=
 =?utf-8?B?bmJzMVA4RmRxUTNqVGl1d2lId0tsM0haWVdHZk9JbGhnVWczdU53Y09BeWR3?=
 =?utf-8?B?ZU8xc3dRK1ZLQXRLMWJVQjlhRUhjL2MxV2NwYndxVDNwUTAzSU1yZVBRNFNI?=
 =?utf-8?B?WlgzY1F0eDFRZWkxWFpab1NXNDBOY1EraTZYclJYaSs5OTcwMENWUWRlajFw?=
 =?utf-8?B?NnVEdEFOY2V2dThrNERQZUtTczZNZnd3UkFwTkpwM2I3blRNQ3FPQWg0Um9W?=
 =?utf-8?B?bXZqcVVFV2hXVG1DWVpFWDV3ekk1SW5yY2sxNWlmN2hIbC9ESCtZWDBHK2tj?=
 =?utf-8?B?Vml2dm5lK3lqdXFKR3c1RmlOQ0hUV2ZkK09mUlZGVU1QSFl3T0hCZTlIdEVJ?=
 =?utf-8?B?WEJoTmhZSm4rSjczWDFrUmdOZDBNUG8xZzZta3lUYlA3WEZ5SDRiaUhCbysr?=
 =?utf-8?Q?uzDdGEMUo1ot8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGNhZ2N2VXJOWG1pTXdpQzdGNCt0NDdWaE5jM1U5WHBpd0hzMTlIWXBqRUFG?=
 =?utf-8?B?bncxRWphbmhMQzVqcDFrK091bWdsRWJsdWlUY0ZHYU5yUnVRblV2VUl1UW9R?=
 =?utf-8?B?dm5oSVBNRlErek5OeW9hbmdWVWZTZ29sU2tCbmJhem9GbW9HeGJwUUJtR1Jv?=
 =?utf-8?B?SnBHeHVXQ3E1TE9IZUpNRVk5ajVlQklrN3ordk96NmlOQnZwM00rbWpzbzVI?=
 =?utf-8?B?L3l0MG9QdUhHQTJUcW0rNGY5bDlyZVB5cmUzb0M5TVRPZXY2aXlmSk9JZ3RK?=
 =?utf-8?B?SXhPcHNHMndUYkpMa1lvNWZxTWdHNjMreURjL251Qy91NWJJK0lPOENSMndV?=
 =?utf-8?B?UWpjQ2EwdVhUSzJnTEdSdVFiR2FxMnQxMXVPU2t1M255M3JScy9sUFA3QXBJ?=
 =?utf-8?B?ckpiNHlJR1dBT3Z0cHQxaFRFWmVubHNtQnZxZU5oMzQrd1QwUitVRzRQL1RU?=
 =?utf-8?B?VVdISmNoNk1GQ09xSVpTQW9QUTFoVndzY0REa1NhckdPQVlKYXAxOUdQQnV1?=
 =?utf-8?B?RTYrbFJHbVBYSjBVOHh3WS9OQnhmeU1wUTF3K1dhM05ibXZmcHNFeWRKZFVO?=
 =?utf-8?B?Tm9FNXhRcVJ6bFJZdGEvTFJEMzJyMWxIY3hsQmNwZ2NhRjNJVU11aWNXb3J5?=
 =?utf-8?B?VmFkMzUvYllQVFNOWURKbmQzSlFOTE9hRGdMWmNkK1lMbC82ZE10WkhiN2xu?=
 =?utf-8?B?NDZ2K2wybVFvc2xtTzI3dnpZWGgyeVpoRkFwV0dCNHNqVEptMTFjcEkvdnYz?=
 =?utf-8?B?STQ4U1NyUHhhenM0alg2V1ovVW9jeXIxWFpGZ2NkT1BobWVRV3Jha005Z3VU?=
 =?utf-8?B?YmFsWG1DQUxJYTBXemh1VitXNlJSRDE2b2JBQm1USExtckpZMUxFSUl3RW14?=
 =?utf-8?B?VHpGNjhnYjNUWDZ3VEVhamFmdFhQMGI1cG9vSzlzUy92UjF1eGxlT3AyYll2?=
 =?utf-8?B?dUlidGlvZ1Y1UHVGczFsV1JRSzBDNy8zeHFBZU05MW93SldTTW5iT2N4NGhT?=
 =?utf-8?B?UGtMbEVsTVBkR0dkQjBYVS9RZDMrQVZLU09LSFhkWEFScmpUVG5lYkd1ZmhR?=
 =?utf-8?B?RnE0THZlNWo4SGNhY2wyRlQzSGJQZU1MZmFXZVNSb3N2Qi9SM25adXVGNXZM?=
 =?utf-8?B?S0hzcWxKWnRONkpmeFpDaHZGT1MxUy8ybzIyVkNTVXNia3NnMzVFTW5zc2Ru?=
 =?utf-8?B?MmkxTWpTMStLRDJ2UEF3b1ZHSlVZZFk2MnRtK2hMYWNjOGFvRHVRblc1eTRu?=
 =?utf-8?B?djJ6NC9jRXc0bW54UlRaUU14eHNDNTk1MkU1K2d6ckw5dEQxOUZWV2pZWlA0?=
 =?utf-8?B?akxHVVBLWHdwaExyc2w2T0swcG1HMFpLSENTQ1Y5YVZmV1JqOEE0MWw4UGFa?=
 =?utf-8?B?S1Ayb1MzMmdoUjBQRTNGTWE3eHJwWUZlZVM5SXMzRkc1MUsvemsvdGtFQllx?=
 =?utf-8?B?NzB1NTg2V2V6b2lJZk42dkxwYldnRE1nNy85SS9ybTVqS2liT2haaXI2RmJq?=
 =?utf-8?B?RTRHN1BuSTV4L1orT2poaEhxejBLYUtST09JK2U1YnpZRVQzT3U2aEQ4NUxy?=
 =?utf-8?B?czZmdGRqdzZ4cStQdlZVQU9TZTU3RmJjT0NQOTkxTlR6VHU5Sml3QzhaVkov?=
 =?utf-8?B?aldtakI0WjBlYlRLTi9lbjJpeU9uWUFKSnJzVU5aT2dZNGtNMk9jTzdWeTRU?=
 =?utf-8?B?RzErQncrRmNueUhMbCsvVXd3S201RlJOVTQ1NzdNUnA4M1NzSmtCQ203UCtS?=
 =?utf-8?B?VmVsMVVlNDNndk4xTHFkZFhDY2xYNjBXbVFNdVIxQVFDQ3M0K2Q3VGV2dEJR?=
 =?utf-8?B?anJZR0NMeW0xVVdRb0gzcTRaS2hkTTAreDlFbkNLVEtLNVExYUFXb1JWMkZN?=
 =?utf-8?B?cFVkbnNDcHNZUlY3L0EvUE1CejFCY2EwNmg0anlIeUQrQjQzdTAzeHZET2wr?=
 =?utf-8?B?SlV3aERtVDJiOVdLc3pXenlOR0Uyak9KUStuc1MvQVplU1FMOUpvTFZWcGMz?=
 =?utf-8?B?SzFZaUZLQ01pdmVYRjhvUWJmaFlBTWlxYitqS091ckQrdWxLRmRhbGg3L0Rv?=
 =?utf-8?B?czlEL0EvZW9pUVFSQzFxU3VUREdKWVhVa0p6RVlHdlpZblRud3FhSExDdEpu?=
 =?utf-8?Q?77hBTb0hZMd5igAWiu6NQFmSs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c2c2730-ab24-4346-0edd-08dd473b8c90
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 05:52:04.8007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HOKHYTs16HfbTFgCkupmphdeuCCvtn9/fGd3aZI8DY785qfQgbAb7QAGKWQgpo8DY1xbRNidLyQ0zi4smCJ+vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8454
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

Hi,

On 2/4/2025 11:57 PM, Jeevan B wrote:
> Added a library change where we if joiner is enabled or not.
Please fix the commit message.
>
> v2: Update function name and logic to check joiner
>      enabled for exact pipe. (Karthik)
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   lib/igt_kms.c | 31 +++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  1 +
>   2 files changed, 32 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 90f44b4d3..d4980d2ac 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6406,6 +6406,37 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   	return found;
>   }
>   
> +/**
> + * igt_is_joiner_enabled:
> + * @drmfd: A drm file descriptor
> + * @pipe: display pipe
> + *
> + * Returns: True if joiner is enabled, false otherwise.
> + */
> +bool igt_is_joiner_enabled(int drmfd, enum pipe pipe)
igt_is_joiner_enabled -> igt_is_joiner_enabled_for_pipe
> +{
> +	char buf[16384], master_str[64], slave_str[64];
> +	int dir, res;
> +	int initial_number = 0b11;

I think this variable can be named better, may be pipe_mask or something 
similar to this?

Thanks,
Karthik.B.S

> +
> +
> +	dir = igt_debugfs_dir(drmfd);
> +	igt_assert(dir >= 0);
> +
> +	res = igt_debugfs_simple_read(dir, "i915_display_info",
> +					    buf, sizeof(buf));
> +	close(dir);
> +	igt_assert(res >= 0);
> +	initial_number <<= pipe;
> +
> +	snprintf(master_str, sizeof(master_str),
> +		 "Linked to 0x%X pipes as a master", initial_number);
> +	snprintf(slave_str, sizeof(slave_str),
> +		 "Linked to 0x%X pipes as a slave", initial_number);
> +
> +	return (strstr(buf, master_str) && strstr(buf, slave_str));
> +}
> +
>   /**
>    * igt_ultrajoiner_possible:
>    * @mode: libdrm mode
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 8810123fb..7df53ec9c 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1245,6 +1245,7 @@ int igt_get_max_dotclock(int fd);
>   bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock);
>   bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   			  int max_dotclock, drmModeModeInfo *mode);
> +bool igt_is_joiner_enabled(int drmfd, enum pipe pipe);
>   bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock);
>   bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   			  int max_dotclock, drmModeModeInfo *mode);
