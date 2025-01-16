Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B23DE77188
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 05:16:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127C410E8AD;
	Thu, 16 Jan 2025 05:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N161zMgZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227A910E8AD
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 05:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737004589; x=1768540589;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ouOYM1HYKoHe9t/Y8qXsiMsoPxb8ijoJGY/LJGVYucU=;
 b=N161zMgZxK/uzUTB8bQ4aSk5MZB97k3XYMGL99oGxt51p8fbt3cZvFU2
 j3/XO3EUCrskzpM4zvfjTJc527S6MeyyhdYjGyNUruaFaCdf/GmIU55KF
 jD/tXDDMq5TTFxW8/GJ2YZYIfXFx/1mL/zDyP/YaZRca6YMKJtARUUxT3
 T+1i8vtWqKGd/mwxAfXMTmK5I1FOchR2on9W0jZ2lxky++VdNemGd7Tqz
 pbKwU3QYWPyHxX2UstcPTxsYzCKrF21qWvu65/9rCMj3JiSe1IqtM93o8
 h33gbx65I9EFHYaaTZ2MBLU+PQYEAdhvTlhY6qeVKrHT7Vw34okEeElzx w==;
X-CSE-ConnectionGUID: 6wCt/c+OSs+u3ngAL8cx0g==
X-CSE-MsgGUID: ufzlQqEFREOhKQqSG3GCvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="41308223"
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; d="scan'208";a="41308223"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 21:16:25 -0800
X-CSE-ConnectionGUID: rRExPIJ2S7i0gqfaEsZSCg==
X-CSE-MsgGUID: OSvc0ZpVQqSRCsXSXs40yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="136232989"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 21:16:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 21:16:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 21:16:23 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 21:16:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGBzdZyvng7m/TkIpKvrKdBT5SRLRrexJ0tDP+1L/ulVgCVWq2XehaNCGEtO4hMR3PaYV5eoPk/iAzkf0Qhy5QLYiPFWrSIPqhNZ6xw4YSN5tulcSuiPIdKpqn1NfL2cntAsBna2plKDmpZRUu77QxOzkN/FwHunxaexIOQL73dL6RIpnQEQk1Llz6FnfvdcirykTkwwCVQFQEDi5ILUupyz5EH5PxOJKLajfkNzJThE039zH8fMi8EKYdSvQzFuiWoFZIKa/vqcfRr9PU/TuMP1kTEVjSf1M5BkWddT3FMuhTs0RHsVIfrPM87GNCSJd50LkxD4Cwsaw2mJJkSObg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekbZuKFTzyP6nwmHq7qdUH+a1w51we+Vb2qhgnSOTKI=;
 b=PYGh1Dsx2rcF6Oroygq8ykMCOULMP0kwe+CJnCESoDirb/5wobD2vgnSmUihdo8Ghk8svBmRMq7YKHSw9KTC8vdGtYy90sRpjekhe3arTcDlOScaBXO079Z5lg3h7xia4C68ZISYiRtLhY0tG/ne1xWbOMuywvvn0+jyGjIzCY3QRQUpjcSImeKLS8arkPq1OEIw3yImgLVANMZ0iQ+GpaWjtHhiM/m1c03agrG25cqWWvVwhafW6CSpV3C8bPZVURk5KMrxJKKP4Dqrz+MmpobEuuwsIZ7Xv2Alf2+WI5V1V/Nnt3H5MynKQtYVSPc+sqynuT8jwl9at7IAXZcrng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH8PR11MB6927.namprd11.prod.outlook.com (2603:10b6:510:225::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Thu, 16 Jan
 2025 05:16:21 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%7]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 05:16:21 +0000
Message-ID: <1afa1f3f-2ed6-48a9-a054-0a5baab8de82@intel.com>
Date: Thu, 16 Jan 2025 10:46:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v8 2/2] lib/igt_kms.c: Enforce strict check for
 bigjoiner_possible
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250110042752.32846-1-santhosh.reddy.guddati@intel.com>
 <20250110042752.32846-3-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250110042752.32846-3-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::20) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH8PR11MB6927:EE_
X-MS-Office365-Filtering-Correlation-Id: 912300c7-2fa2-4910-da47-08dd35ecea22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnZrbG53eDZrcVlnVkhyb04vd080NEErN3RDdDA5VzhOZXM0NlJVcVBJVEhx?=
 =?utf-8?B?ZWNYTjFQSkJyeXNLOUpNeXpXbVJydGY5Q0J2MkhkTFVQYnlLd1BFRFI2cXlH?=
 =?utf-8?B?bjhjQmx3eEVHYnMwWGJ5cG03clFLTnFhVXprdXQrZG1JdldEZDNBMzAyS0pK?=
 =?utf-8?B?dmsrVE1mNmRvVEgyeFg4YStEZ0Fuak1tTVF2b0JkNkpVZmtUZmgzK09vN1Bj?=
 =?utf-8?B?dVg1anJwdk9Qdit3QkppdWdHTmQ1R1hwa294UU9CR3pybk1ONktLMStUOHNI?=
 =?utf-8?B?aE42SXNvL2Y4L0J1a1NVZ0lJQ0JmSXd6eGdWakxtRnNydmpqcnNCSjVReEkv?=
 =?utf-8?B?eVRCbmJkRUNqMGQ5RXBqVHZGYzQxQ1FLYXhNR2xndlZpbGNQczFocmZrWVha?=
 =?utf-8?B?enZXQmZYMU13YzRWUFQvVGhGSEJ3QUp1bkxZRFl3b1gvdXdWRnB1N2lrNFIw?=
 =?utf-8?B?YU1IY28yVTFIZFhVM3lDSS9KTUZ2VXVEYjRwR1Bnb0pTaloyVUhFbURURnRy?=
 =?utf-8?B?RUIzWGg4NmVRbWpMbnhOcUlJKzlSc3JTMnRxcUVQaENiRWJmSElLYmIwMVM4?=
 =?utf-8?B?MjBWMnF5Sk53b2xMRC80QlNRMFlzYkx4UHRYZXJ3dkRHZFVZNXBjZ2RZRHda?=
 =?utf-8?B?d05vMFBRRkNLcUZkRk8ra1RhWU04L2pSa25LY0dyOWYwaWM5SzR6d2pqMWYx?=
 =?utf-8?B?QkowTjRWZTQrZWRVczl5c3RvendoZEIwekdERk1ESTZ1LzUxSFZPVU9aWFF2?=
 =?utf-8?B?OFlPb2Vranc5VjllazhBK2NCd3VteUdteEpVeUc4dFRKYm8wM2N5ZnFEZkFp?=
 =?utf-8?B?MVFGSFVwRkRBNUl4eEpOVllGRVYrK2FzY3BNUTluL3VXcU44MWVsdkhCNGR4?=
 =?utf-8?B?Q0FNdThPZzBxZVZLdFFFZlpBeG5RT0c0VHg0YjVGeWRVUko3NkhJU0JoVEZI?=
 =?utf-8?B?SS85VG9WUEpVSm1iRSt1M2o3Ty83U1FxZEQ1RnVnckNpTnVwUjFtRlhadVlh?=
 =?utf-8?B?MVVBMEkvTTIvUDJJckVTZXk4czl5Q0VqWENSSjFTbmZUNWt3WjM5b1hGdkI5?=
 =?utf-8?B?WUhSekJESGE1MmZZVTZudDJKeUNqTmdkakRFakpuK054UytrQVdKdk9tVnNR?=
 =?utf-8?B?bW5ETGpoSEZiN0NoUGVIMjBrYnpVL1ZHKzZyQUhIclJZc0tTeEhpYUt3b0xY?=
 =?utf-8?B?ZWdJUnJiU2dLbjVTQU4vYWZsNUplZkFMdnZRU0tHT1RBcDdtQlRIa1R2eVAr?=
 =?utf-8?B?RlUvaHYyQ1JFa1poeVNIUEdnelQySGYvUGpXK1Z3V3VuRCswbjBTWm9yenYr?=
 =?utf-8?B?dENHYmJvTFdKTWJwUzBBSVJqdHp5L2Y1M0kyTi9uUlFPbzBVRDVteFc5c1o0?=
 =?utf-8?B?czNhdWRyMFJDMmxZNmNER3V4bzNkR1FzWFF5Mm9saWZtZkNQbllkbXplV3F5?=
 =?utf-8?B?ZCtIYnNOV0QwNU1QT1ZhZUtjN20wcHlLQTViNDNVdjZESGl2MG8yWFFkbHJn?=
 =?utf-8?B?dXp6RkpPSStUVHVOVFozZ0NQT3JNQkZpRU1RVEtZQVQ3Y09PeTB6VFZFS2lo?=
 =?utf-8?B?M2RYSjBEWklETDlydlZHbkZnSzlDN2VkQTdnd1Z6cmVTU1J6Zis4eFo4T01C?=
 =?utf-8?B?SkErTm5kTDVMQzcyN0JBbjFScUtsQlQ3aG0xWUlQZnNwQXA2L1BqZGg0Q05K?=
 =?utf-8?B?MXZSRWdXRjR6LzNiZENXZmF4Q2Y5Uzl5ekhZZUhFdU5yeVlKWVFVMUcrV0F1?=
 =?utf-8?B?U0x0aDdjM1grdXc2cmNQcTdQdmpZQXNhWGM1Z1NVdUpBenhoUFpLWFBCRHFI?=
 =?utf-8?B?MTBML1JrVnFHdG9FMmhYVVQ0MEFwcVFyenNEU1BnTDNvVGtrQU4zUWREQ0Rq?=
 =?utf-8?Q?ZXcc5xUUCBEbk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFRrZ3hnYnVYd3F5Y3JyVldIZ2pwaCsvQjJmMDRZaTl2OTFyOFN6RFNvVnQr?=
 =?utf-8?B?VHJ6Q1dWbnpNdkxUMzZ3aGp6aHZ2b0pMNXpucWZzc1VXSzdRcmorSGJGL0xs?=
 =?utf-8?B?SzJySFZnVG5ERGR1MnIzUWV3dmdram16K0k5Mzd6dWozNkRvK2pCNG5qbGZW?=
 =?utf-8?B?NnFnWmtKSzNWL0JWby90SXVXMzlXUjlqNmZDbGVLeERCS2NmRzNNSG9TMzA3?=
 =?utf-8?B?bEh1dUNuMVlOOStCMFRlNFVGV004Zlk3Q1dZZW1IQjNFbncvOWZuL3RMem5k?=
 =?utf-8?B?U3VOTXVGaVhDOC9lb0tHZW1MQ2xYd2dNTzFrbkNCVUZnbkczbUpTQWtpQkx4?=
 =?utf-8?B?U1ZjK2JtWlQ0VzR1QkNPaVZ1SlROSk9GdzdBYWFqK3UrcThQeWg5VGF4blRi?=
 =?utf-8?B?SXBSZHpodm1OSXNKYzROWm8yc0JHOVRVV2xpd04rSjNKUmZCVmludi83WHlJ?=
 =?utf-8?B?cmo3R2VNN0ZQTkVtNU4ydXZZNDVzS1pyL2VUOURPQmxwcVBxbVFUVC9JZVdu?=
 =?utf-8?B?L2pheDJna01hQktzN0ZMdm9FTDA2WkFYY0JRS1NMdGRwMG9JTW16RzBlMDhs?=
 =?utf-8?B?eVFWN2g4bEtUcGlOTGFKN2tNTU84VGZOZUs4ak0xQXllTWN1bFZnQUUwWU5G?=
 =?utf-8?B?N0VOaHNERWc2bnNVYzIrbXBiNkFQS1lzOXdpM1VHL2duR2xDOFFVeGRKUGZB?=
 =?utf-8?B?V01VZDR5M2lNOXFLVWprZCs5ZW5SV1BWM25NZUs1UmY4YXl1M0pDSStuSkF5?=
 =?utf-8?B?Wjc3K3JTKys1RVpQQWo2am1uMDVncE5QZEcyZmJzc3RLek5mRnRtTFZteWJQ?=
 =?utf-8?B?YnhkY1RMYWlRT1d2VFNXa0tSK2tSbzlHS3pCNlZPbGptbmJOYVJ1ditZYStk?=
 =?utf-8?B?U0U5THZEeGhINHV0UVpFZFJGT0tpZFYxRWpZRUxISWZsVHVrbldxMzBNOXcx?=
 =?utf-8?B?UlVoRm5PbmJWejhvNzZqWUlmMzB1UVBnUWZlaVBFb2IraW9JeU1kYnd3TkdU?=
 =?utf-8?B?MnFVZ3FLaFdmbXh2MnAyaVMweTFjQkRnKzBTOUVpV3N5L0trL2JvaUFOYldL?=
 =?utf-8?B?ZjE2cUpkZ25FRkNRaE5QMWhYajFrbmEwMzZZMWVXZUphYVpjWVlUT0dVNy8y?=
 =?utf-8?B?bzhrME00bFZrUlBBazdvdHR5NzRGZ1UveDQ1ZUhnY2N6cjJZd25tOGhBb3lM?=
 =?utf-8?B?K1kvNTArVytxUzRFT1F0dE41SW53WVRsck40dGxtU1pnQU9OSDZCc01pV0ht?=
 =?utf-8?B?dDN6Q3J1R2EwNG9KbkVnQTVGZzlQNWZHNDh0VDB4dGJubUpSV2J6NDFZQWVo?=
 =?utf-8?B?eUtxa2QrUFgxZlpBdDByVE5qd1l6czdnak8yMEhZM3ZJdVRUeThnK1A0U2pB?=
 =?utf-8?B?WEhYcFVVZGJLRnpwWDRodlZYemtoeFJ3RE1nN29XUmVrSTZKQ3JlRWYybVNq?=
 =?utf-8?B?cSs5L0g5ejVQdmtjTFo3QVZZMGNkaVM0QkJseHhyTkpLa1gyQXVPUVc5NFFJ?=
 =?utf-8?B?bmRTZW9xaklRclROem4yREtkZFdzRDAxV1BLYzJTYitvc3VldWJ6bFNERVhT?=
 =?utf-8?B?VGRmRE1kQTVSdjVqRG9lMjRwWUUzVkJNODJEWUlGSEM0V3R3MDBBRElnZCtx?=
 =?utf-8?B?ZlR1SGNYRkxrTWRmN2ozUFZkRGhkWTJZWFpJV1p0RityTFhtZmYrT2pLcEcr?=
 =?utf-8?B?ZjJtNmFlNU9hUWlSU2VHMjJ4NkN1bXNLdmM5TnJwZDhmTHBVS2lFRUpzdzdy?=
 =?utf-8?B?c3lBRlBBK1VFUjRlbWtDeEFqS3BRSXhQZGVzOUZpY3NxUkZUQTdicjJWRzQ3?=
 =?utf-8?B?SHFXRGQ3U25NSFdVZmdISjJjTE9TdHhWcjZWMEcxRjNsMytYMkJ4WkJCcUZW?=
 =?utf-8?B?b1d3V2QyVTZTQ0IvdTJtQmFxU3RvREZDUXh1R0pKTTNPMFZlekd4VllicitT?=
 =?utf-8?B?MmlLTWxGQVMzTlY0QkR2Y0NlcjBFakdRNW5mTFFVYU1WNTZnZmtoS25uRGdP?=
 =?utf-8?B?dkdER01LeE5QNFRLY3hOR3NOZGh3U1E0d2RRTzkvWTJCUlJ0RTF5VjVpTWNO?=
 =?utf-8?B?c2ozM2dscmFnTW9vZi9jSWk0Ulp5MEs5NjREbkVzQnVvTENGeWpJRzF0dTNS?=
 =?utf-8?B?OTZzcHUyMHoxTFpTeHV4dnlha0dYS2hicW5Hd29sSWZ1WWcyTnpNQ2YyUGF4?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 912300c7-2fa2-4910-da47-08dd35ecea22
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 05:16:21.6140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTbD4DqdBZA6Zb9U0LmKLRL+IfHkFKjfgCP3ULCE228f2W6ds2+GDHGFJl0dZEdcsxh3A1L9qh5lod4dmfwzLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6927
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


On 1/10/2025 9:57 AM, Santhosh Reddy Guddati wrote:
> update bigjoiner_mode_found to check for ultrajoiner possibility.
> This ensures that the mode is only set to bigjoiner if ultrajoiner
> is not possible.
Please rephrase the second sentence while merging. May be something 
like, "This ensures that the mode is truly supported by bigjoiner and 
doesn't require ultrajoiner.
>
> v8: rebase and check fot ultra joiner possibility.
Also please remove the "check for ultra joiner possibility" as there is 
no changes from previous version.
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

With the above mentioned updates in commit message,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> ---
>   lib/igt_kms.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 95e3059f7..1a0819ce2 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6419,7 +6419,8 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   	bool found = false;
>   
>   	for (int i=0; i< connector->count_modes; i++) {
> -		if (igt_bigjoiner_possible(drm_fd, &connector->modes[i], max_dotclock)) {
> +		if (igt_bigjoiner_possible(drm_fd, &connector->modes[i], max_dotclock) &&
> +		    !igt_ultrajoiner_possible(&connector->modes[i], max_dotclock)) {
>   			*mode = connector->modes[i];
>   			found = true;
>   			break;
