Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BFEC7EE30
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 10:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668E810E0E2;
	Wed, 25 Jun 2025 10:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HULzWnA9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD6E10E0E2
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 10:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750847286; x=1782383286;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MCkXYJiLCVKiOEv7tM1UWM7w+zmpNKFDKCTHrZdrVzA=;
 b=HULzWnA943+MiBR5OP8O+wRpkGX8vN4ZQ8nST1TfvOkYxFUoBxpnscvL
 fSPNtEnAETFGMgw69XTUXfg5EinQNP1EZbt5U1fxOQwsurNV3t50B1xdr
 CYoYbQ2v3HuUNS4IgDoTaeGgsJOt8iS4QaM875HwMYBTg3SxZdffNvlwI
 lAce6m/2qR7TjlWQAN4xRyuvTikOgSH5rlknvkCvsOUMlBxdmMMlbAdVc
 fMFg2wvdX8MZsVXvmVvck6EnfmzxthGva5U9t5oI8glyQO3RnG1T8YhcG
 SaOaqfUP9lG2QL6KhIwZvr68gC3nS70gx34I9DmEz4Cf/E9c2MdcNst8h w==;
X-CSE-ConnectionGUID: S9A3MNBTTOSuydv70/VBAw==
X-CSE-MsgGUID: ALqMIg/2S7+UlkkJCPsrrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52975412"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="52975412"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 03:28:06 -0700
X-CSE-ConnectionGUID: cYRsExccSIq0q1hzh3jcXQ==
X-CSE-MsgGUID: U6EI49V/TIm73GjHHZgmmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="152313034"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 03:28:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 03:28:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 03:28:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.81)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 03:28:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8ngC/5GpWHwerISaEoajwKoJOuCRhyu+sW9D3zQf1yAzx+skdDk3i1mLMnRamtvxez4J7jNOmLENVGaN7U9BEGudH9NbL/q/1fBo9LKTsknuKOgaXZ3XOUoXoAijiT3I86JoZHb9yNKzbqZbzMFLN3cQ3/92mxC9FhAGEvabnCk8Tx2p97wtLurcIlZx2p9GDNGt+W31JMjNq34osZTFpJXTL3KNZ97hvrNBfPdBVF8dqY0Av627Bik5906GIdQrFACXJFqCATN0x/UYtbtzoAMHbvmTn+rsNlpv23jFsTtgHTPNA+J15YILlW0dMKRDPPd1tzOWVqaMZBeV0za6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PlfNqkgeToW+bPsTD71Om7uUcDO76PEjrp3nJZ2DxJs=;
 b=qcLQfv1WQGGICaXzkb7ojM9Sdd20ff7VSBw7gto6U5EK3o/wsXptQ/32pT9J9j107udeBU1vq462m5PoMSv7i+d28mA38KMtMWCFpm08SsiGMzQf7ESLW4d6qdVuYfnsYEAZmxNAxFigezssTsyaYE9mhZrq0qvS+aij38XqjF4JBzyax2V8/GRDJT4JkbfyqmTb+Y6DJzP81AqytR62urqSYeQ7Asw2ZEgNvg++y3F8C6aW5Ah1BmIauuO4MSlYNcxtczeuKbMC7nsEo/DtSr4gIpLk7WGMhE0aTEb+Ap/l0xP9pfEidMng5p13P9ZUYeuNRYuUDlYUSu3BFq9lEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DS0PR11MB6397.namprd11.prod.outlook.com (2603:10b6:8:ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 10:28:02 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 10:28:02 +0000
Message-ID: <d59df2cc-dcce-473e-ad6c-073511c17655@intel.com>
Date: Wed, 25 Jun 2025 15:57:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v5,
 2/2] tests/kms_flip: Track and report unexpected events
 with pass rate metric
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <uma.shankar@intel.com>
References: <20250619200549.66329-3-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <20250619200549.66329-3-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::15) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|DS0PR11MB6397:EE_
X-MS-Office365-Filtering-Correlation-Id: f087ce9e-b955-4177-2253-08ddb3d2f69a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REpWNkVpNjlNbXg3c2lnb1RUNUhzTFBRQ0FMSUN3b2NhOHdlVWRZMWJVY2Jk?=
 =?utf-8?B?TEFhZVdUYm1JWUhDUHB4c09ya0VFU1Z1RjNTRzVSemZHd2V0dXg2c3h5ZnFG?=
 =?utf-8?B?STZ5azN3NDg1enc5UFcwZEVyanR5UE5zaHZrRFk1Q3REMXJSTHNOMlFzbXlT?=
 =?utf-8?B?S281NWhKd1dOeW55OU1CMDZUOEdheXRYSm4vTG1OSnJpTkx2UytpQm1PTkFH?=
 =?utf-8?B?T3gwbFhCT05TSmhlTWpJVjdPSmpSaExpemtLb1Uxc0NMZ0xydXdOQVNlUnpF?=
 =?utf-8?B?NWFWdkhESlI2R3NldHp5Q2JFcW5jSlkzZnpINjVHYlVCdVVkQ1l1ZlpoSC9w?=
 =?utf-8?B?RGZvVTRoRE8wN0hpN05lTmdqdmRmbEluRENGWEJ4NmRFdVNUU0lnU0FVYTMv?=
 =?utf-8?B?d2NTYUdMVTVqM2x2TVVpWEdISktaUUF1RmhwdmhiRXNmSExoSDdoU1lydDFV?=
 =?utf-8?B?L24xRy9JdDlCQWtHYW5memtxMzJZaTQ0eGdOU0RhUVhHTXE0Z0VHOWpBeUZ1?=
 =?utf-8?B?cVBqNzBQTVpDQy9vQm1HSkRpclZZVDFDUzQ5TDhIQ0NqSC9yK3JLWW5jSnpS?=
 =?utf-8?B?MzEwbFc5ZXNkRUxwNzhQMUs5cVg0cGEyUmFNQTNsNzI0SWFDTDRBN21IR0F4?=
 =?utf-8?B?dExwZWlqNXZxUjJ5QW41elNGZTE0bG5mT3N2ZDQvNFJwS0ZGSWxFZFlLekY4?=
 =?utf-8?B?Nlg5c3VEdTdicVFXY1ptd3l2ZU1XM2pQTkwxNDJxWTNJQnBybnJZNURoZFZi?=
 =?utf-8?B?TDM3OUJ3Z2s4VjhLQ2lVLzBmdVoralJ0QlhvUEtyR092N0loOVpoSzJFdDdO?=
 =?utf-8?B?bEZ5aVpEWFdFYzRDa3duYUllbzJsRE4vT0dpeUpoQzBYUjI1aDMvL3RaQkF0?=
 =?utf-8?B?SFV1WllIVDZIWlp6aVQ1NG44VmdpSEgzYndBUGFVZ3lvS1RJaGlLSFhZT1lw?=
 =?utf-8?B?b1YyNzgvTzZxdVEzUmpOaUVTSzVubDhxeWZoUlBOOFJDVERMSVk1VVBBWVhZ?=
 =?utf-8?B?T1BuNmNaUlZpZjNvR3pJaHkzVnZMTWkwVFJ1WDFnTkNJTXFPdE02YmpOOEhM?=
 =?utf-8?B?NWdodGxGRDQwVXJueVpLVFRuZkJpV0thRGhUZDUycU9XY0p1SGZ5aEw3dElM?=
 =?utf-8?B?ZmhHQ0ZxV21CdUxhVGhHc0gyM3JSOGQ5aEVDWVJ0SU9YdFd0eXd5Szk4TVhC?=
 =?utf-8?B?cGxOSnU4a0xSM2J3WTMvUXZFMlhzSk5uSGFxa3VuS1dYbHNSQlZKekZLU0ls?=
 =?utf-8?B?d09mTmtzR0RUYlUwOVdOZk5MS011cDM2VkdLT1B4QWNwWlNUYVBMMDF2aE0v?=
 =?utf-8?B?dTdSNE9yNmswMlA2cmJEeFg0MGd0QlBNbHFNZ2JGN2hmOERpZDBRaWc5SjY2?=
 =?utf-8?B?enNtYnBKaERFS3hKcXBHb05SZTdBNy9rTFNNK2JISzNmRVRBSmlYQUVucXlD?=
 =?utf-8?B?MWI1T01LWFpKYU8zQlV6Y3piSE1LYkhBdGFrL3JhdVp3UW9Kclh0TXRqeTE5?=
 =?utf-8?B?dWdxenA0czhhSmhBTUtlNFRnSUpKTzVZWC9oTWZzWVdBQllXREhwVEY1dHdk?=
 =?utf-8?B?Ykh2ZU1FV21GWExiWFVUSnM2blBDeHp4bXkzSUpQb0M5a2dyRlpPd3pGMGtJ?=
 =?utf-8?B?UGJKenRRWEhKdDIySGlNQmRrTFpMRU1LOHdscTNMZm9IOXNYSlpUQkRialFw?=
 =?utf-8?B?eFA2T3JZQjlwNkNSblhVZFUwUlpVZ1EvSWxrMEp5ODlNaUFXb0djbTRiWndv?=
 =?utf-8?B?amZXb1ZYOU9nRjZzLzVkQWl3d2J3U2NDSGxRTTBZMHlCYTdidWQyQ1Q5dlZt?=
 =?utf-8?B?SDIwbXl3cFVoTWpNcFRpREthajF6a3E4ampNQUhqUVFUcnJPL3RhL0JlN0Ux?=
 =?utf-8?B?VFJrS2RPMXliVzVOblRjNk83K212V0hNVWk0a2JpWkdUTWUzaEFTWDBtUEg0?=
 =?utf-8?Q?M3NGZ8lDltw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXNLS0drS0ZtaWVwb20weXJ5bENsVWNyMDJWa0Z2aDBMZ2hBNXExdVhEejZ0?=
 =?utf-8?B?akgxVnZLTWNjbUI4S2JUczM3a2NQdTBrdTIxd25SRjhNU0JWeFBsK2tTeThC?=
 =?utf-8?B?NFpibUhyZWJGSWwxMWFTdE5FNXd2eHUzb2tiV1lqYUViR3J1MGc0czBxazZC?=
 =?utf-8?B?Q053ZHhYaFVxa1ZaM2JlSGNSL2thbXl0cC9RNS8zbHo1NVJFMGFMNjFaTng2?=
 =?utf-8?B?TTQ3bUdtZzRKaCtqQ0N6TVgwdEdwb1huWU5zTExiL1hCc1NpME5GVW5sK0xB?=
 =?utf-8?B?Q1J0R2kyZzVoOVA2eklXUThXbFdLZEpmZGYybnN3T3g3dmFyQlhnOWF2bURy?=
 =?utf-8?B?SzYzU1hwb1hhNEc5QkthQm5IaU1GS1NRcnMxVGMxWGEvaEpwazlSTnRhTDdD?=
 =?utf-8?B?MzU1TlhuMlV4VXZoTHg0cnlBa3BjcmFjbE1OOUFrSXlTeW5TUUlPUGIzSmtu?=
 =?utf-8?B?blBReXNTd0ErRkhJVkladHhOUUVSRVlrU0pvV0w0ZHRPOUo4aFFGdHJWTnhI?=
 =?utf-8?B?N3hUUG1LOVFKS1Q1eGlLWjlISG1KakJlSXpFaVcvdzR1cStvOHcrb0cyMTV2?=
 =?utf-8?B?Wmk4ZjhPeEVrZmdMTS9mYmNTM3hUVVhqcTA2QkJnUEQzcS9XZDlFNXpBTERG?=
 =?utf-8?B?TXlEc3V0RHZQeG9kdjRHN2Y2anN1T0NOTTlJOFBuUEZkNHVHQ2haaUxoODV3?=
 =?utf-8?B?QWc4OUxaZkRUWmlMR2pVMmpCbEo4VVFJb3ZHK0I0VnBZeVUxMlFtWk5nSkNu?=
 =?utf-8?B?TUhOc2ZDT2IyTWNVb3NjM2NUR21ZQmQwb1ZPQkYyTEV5TGZJY1BWbHZWaWE1?=
 =?utf-8?B?SWV6dGFPYU1KZzhEcmR1RStUVXl0Q29iWGlHTG1mUWtUR0JTTnhCOUpiTTVt?=
 =?utf-8?B?cllTZnpOWjRnQWdyZzU2LzdKdzczUDI4ODkya0NaaDU3Q3l2bm9uM3NLRDVm?=
 =?utf-8?B?cXdxT1kraWtBRFgzUGFiNDlUWmlHTGZsMjRIUXk5dTNYUW1OUGdUdUh2ZFVW?=
 =?utf-8?B?M25VWURkSnU1RDNVRjVhWnVaN2Zyc1BITDdqOG9hTzBTclZRRHNOM3VmaVdV?=
 =?utf-8?B?b0tjbnNJZjdMMHQ4ek0xWGtOc2ZWZWhoMExOMFpKWjJSMXFQMHZvbnFLZGtV?=
 =?utf-8?B?aFRPTkpRZ3FaVC9yTWFrU1ZCWHpyd2VhaHlqOGZpZVd5U0JVNlhtWTYzL3Vl?=
 =?utf-8?B?dEZhdlJBcDg4b094Q3VSUUdQckdqQlZsNDRLNllMS2lKVlpvMUdNSllCRmtm?=
 =?utf-8?B?MGlMaFNRYmxSNWJua1RQNUNyRXNlSUF4SFBZSy9LNm1hS1hLZEhUbklZVUlF?=
 =?utf-8?B?QktXTCtqZklBcU1xM29CMEV6SVh1QkNWVDN2YWRsKzg1TEhldjRVU2l5TllO?=
 =?utf-8?B?d2RZU1k0RHhNSm1Ldk1XQ25ZLzNjeGdJZ1dvR2ducE0vQVpGR05vbTNFRHdn?=
 =?utf-8?B?RHpqcW1NRzlRT0IxRFM0RHlOcTc1WEwrYTRaMy81VDFERW4raXdYNFVoUytL?=
 =?utf-8?B?dUdScEdDcnIzb1A1WWlWWDdPMnltVm9JWThMYnNueklhL1pNZEpuVnFJSTAy?=
 =?utf-8?B?R3paT280ZjR5UUNla2UzL2ZDbFNaNzBhTGdnOG1pbTQyNzNOWHlxTUkzS05q?=
 =?utf-8?B?Y0oyaGRCQlNneWJoS3lDZzlmYlFTeHVCQXUycW1mcnNPM0xLUjNta21PdzRK?=
 =?utf-8?B?c1ZTejB4aVkrTi9MNitxNlJaZkJucFIwRXNRS1VVT2VMWXZOVUU2bXVwNENx?=
 =?utf-8?B?eThFUzVoYStTSVhSZ0lNQTFEVlg3cGk2WEFqVU1kSW9KbkxNWEZZcXhFTlFM?=
 =?utf-8?B?SEwxbHAxVGV4QmtJdTlXV2lmYTE2a0FyVlZPWCtMMmJ0aGo2anVMS3loUmFG?=
 =?utf-8?B?QWtwcnhFd3J6bjFsTHJscEpXY1RxbnhWOWdCZWZiRDhhMW9kMnN5Vlp4ZkZ1?=
 =?utf-8?B?LzRHSmd4R2U3YVdzcmdhcFBBa0VLR0xXVHJqdXZuYWVMK2txNC91YkQxbTAz?=
 =?utf-8?B?dTliaEJ0MjhLeEFuY2Z3NHlLclMzcmRPYU43SmVJT1JLbVlueTgvUUF0VmVW?=
 =?utf-8?B?YW9XT2FjQmZWVGJXTHVTeUJDMUhRRHp3OFdZUFRoaURYSEdCT0dkdGo0V2hQ?=
 =?utf-8?Q?W4M6Wqwyk5c3kjhZrlkSSpp4Y?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f087ce9e-b955-4177-2253-08ddb3d2f69a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 10:28:01.9652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +J+Hb+4vyiODeUMTqDKeUSts6FoLJ5zIQ0rPU7hAjpQaj9wdieqt+8gqPlOcZeMqNt+0O4myQsMNmRuR5IflcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6397
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

On 20-06-2025 01:35, Naladala Ramanaidu wrote:
> At higher refresh rates, there is a possibility of flips being
> submitted during the evasion window, which can result in one extra
> frame and cause the test to fail. To address this, the test has
> been modified to calculate a pass rate based on the number of
> expected versus erroneous frames. A threshold of 85% is enforced
> to determine test success.
>
> v1: Patch #2 and #4 merge into single patch. (Karthik)
> v2: Address the regression failures.
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_flip.c | 31 ++++++++++++++++---------------
>   1 file changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index ca31ef7dd..94a414ba7 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -309,6 +309,7 @@ struct event_state {
>   	unsigned int current_seq;		/* kernel reported seq. num */
>   
>   	int count;				/* # of events of this type */
> +	int err_frames;				/* # of unexpected events */
>   
>   	/* Step between the current and next 'target' sequence number. */
>   	int seq_step;
> @@ -677,7 +678,7 @@ static void vblank_handler(int fd, unsigned int frame, unsigned int sec,
>   	fixup_premature_vblank_ts(o, &o->vblank_state);
>   }
>   
> -static bool check_state(const struct test_output *o, const struct event_state *es)
> +static bool check_state(const struct test_output *o, struct event_state *es)
>   {
>   	struct timeval diff;
>   
> @@ -706,7 +707,8 @@ static bool check_state(const struct test_output *o, const struct event_state *e
>   	    es->current_seq - (es->last_seq + o->seq_step) > 1UL << 23) {
>   		igt_debug("unexpected %s seq %u, should be >= %u\n",
>   			  es->name, es->current_seq, es->last_seq + o->seq_step);
> -		return false;
> +		es->err_frames++;
> +		return true;
>   	}
>   
>   	if (o->flags & TEST_CHECK_TS) {
> @@ -727,16 +729,16 @@ static bool check_state(const struct test_output *o, const struct event_state *e
>   				  es->name, timeval_float(&es->last_ts), es->last_seq,
>   				  timeval_float(&es->current_ts), es->current_seq,
>   				  elapsed, expected);
> -
> -			return false;
> +			es->err_frames++;
> +			return true;
>   		}
>   
>   		if (es->current_seq != es->last_seq + o->seq_step) {
>   			igt_debug("unexpected %s seq %u, expected %u\n",
>   				  es->name, es->current_seq,
>   				  es->last_seq + o->seq_step);
> -
> -			return false;
> +			es->err_frames++;
> +			return true;
>   		}
>   	}
>   
> @@ -1233,17 +1235,16 @@ static bool check_final_state(const struct test_output *o,
>   	 * those use some funny fake timings behind userspace's back. */
>   	if (o->flags & TEST_CHECK_TS) {
>   		int count = es->count * o->seq_step;
> -		unsigned int min = actual_frame_time(o) * (count - 1);
> -		unsigned int max = actual_frame_time(o) * (count + 1);
> +		int error_count = es->err_frames * o->seq_step;
> +		int expected = elapsed / actual_frame_time(o);
> +		float pass_rate = ((float)(count - error_count) / count) * 100;
>   
> -		igt_debug("expected %d, counted %d, encoder type %d\n",
> -			  (int)(elapsed / actual_frame_time(o)), count,
> -			  o->kencoder[0]->encoder_type);
> -		if (elapsed < min || elapsed > max) {
> -			igt_debug("dropped frames, expected %d, counted %d, encoder type %d\n",
> -				  (int)(elapsed / actual_frame_time(o)), count,
> -				  o->kencoder[0]->encoder_type);
> +		igt_info("Event %s: expected %d, counted %d, passrate = %.2f%%, encoder type %d\n",
> +			 es->name, expected, count, pass_rate, o->kencoder[0]->encoder_type);
>   
> +		if (pass_rate < 85) {

For now this magic number 85 should be fine.
But we need a justification for this magic number or calculate the 
frames close to the evasion time and exclude them in our calculation.
Adding a Re-visit/TODO would help in keeping an eye on this.

Reviewed-by: Arun R Murthy

Thanks and Regards,
Arun R Murthy
--------------------

> +			igt_debug("dropped frames, expected %d, counted %d, passrate = %.2f%%, encoder type %d\n",
> +				  expected, count, pass_rate, o->kencoder[0]->encoder_type);
>   			return false;
>   		}
>   	}
