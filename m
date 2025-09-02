Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2502ACA1005
	for <igt-dev@archiver.kernel.org>; Tue,  2 Sep 2025 19:43:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC3010E829;
	Tue,  2 Sep 2025 19:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AfpQmndO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E972410E829
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Sep 2025 19:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756842194; x=1788378194;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=h/RZpRx6Bp6GkJ7pUJy0M85lqZ7SDAydSNyihC/0Rjw=;
 b=AfpQmndOO7JHmxaheJ73HAMSTA7eaJUIZ6dQYWvIkpN0i4cmZYV5xBtL
 mPFTh07MzTyX5HIEv6US3dVYMUFgeAMr86Mvs5tFu61H/fNNIszpbXVn/
 JsczEbMhSEa0G8OgCqA0/fTafwD48p+XndPjGVVf97m+UtHgHgBIrG7Bo
 6QBWgB42k5YQ57ljS8zGZavUDerdok2XhRm1uu8f1FOy+VIWpSEo0Pi0C
 yJ7oQagSmk8fmDCJvOKCbYmKPIRMVUcgqb80gKL5YFK3a4LjiGregpWBy
 PZqawtf8bjD8oDwBe/mG/JrOyDc9oLEASuTGhSOVByV8dX+YeFTntfm1j A==;
X-CSE-ConnectionGUID: 1zHhtX1cRnSX+ah3PLklbg==
X-CSE-MsgGUID: QnBp3GB2RVK4C2i9C3vfxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="69837724"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="69837724"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 12:43:14 -0700
X-CSE-ConnectionGUID: eKNc7ZV1T7CsbiXTgV8T3g==
X-CSE-MsgGUID: YvtqLtmwTSiGsNLKi6PrJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="172201408"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 12:43:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 12:43:13 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 12:43:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.56)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 12:43:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJzlRP6z08P2VHbxB6GgsfkVinZnZQiSLFnLHecrhSmLv2q5FkTXV9PZt02vH+Ogvs06Obk8UFGsacOXRcMCXNYm/PWSLwOTFowc2jakw/8DAqcnjmJBPo/vJrmJL1cmxX9IRsv8Hcd3knnkjaIzMpqqUsPlmQKbKcrMQypkQudvOvOoBLCKvcu+opEQn10RAv70bUdPh8f/bZANsFtzC/dYMw0OE4YUcl2o5P1bKMdy0oVHrOng41wWPcEcgd5RsR60fx8LP5LEJUjZAkOkCYebKUcEoninXTKTPptTn0nd7DoTIIE15H6OYOFHBfx/iywrdnqlCFpDnNvmGwQRJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7718VG1t0PAOdj11Y+nB1eOo2LaM417K2W2lV7190QA=;
 b=GfAHfjQKqfDg6mXKL7aPr708pQIbHebjTjCYEwCVKfqDZWt55Bu2p6/fBk5uuY4EacsbyJFzEuP4oFPvoKRR/3WIl0hzKWx8lG/ZS+u/vRR5mpboXEWHg3VmlQNBgJzDvD5OyD2hKTjIymePC7AZpqNqKfZVLsNsPGDajPIP0/L/VQ9R54P2XV9dF2Id2Pf83WrX9EKfSbcdZm5aAyhT2cYQbDLBKXm5Ce5fdSkcrpl1EOqiRT/+zyTrFwJikta6OoUfwjOj3DeIonkt+hzbpiBcNV8gCp5PaKuN6XQhgc9hYA31ULrB8YPL1DyY5roUIi2XqLEYS0eQia7D6LrHxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA1PR11MB7247.namprd11.prod.outlook.com (2603:10b6:208:42d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 19:43:09 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 19:43:09 +0000
Message-ID: <607416d0-acc0-4723-a717-c587625b5980@intel.com>
Date: Wed, 3 Sep 2025 01:13:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 2/2] tests/kms_cursor_legacy: Improve timing
 accuracy in legacy cursor test
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250818214431.1331399-1-ramanaidu.naladala@intel.com>
 <20250818214431.1331399-3-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250818214431.1331399-3-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::32) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA1PR11MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: 5620b305-bc60-42fd-860a-08ddea58f1de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDZlSlllU2NWQ2h2N29GMmVoVXlPelM5U0pUQ000dm1PaEwxOFJHZUY2ZDFK?=
 =?utf-8?B?UHM0ZmdWVFF3cFBPai80TlR3Y3lBWUdQM1MvYWlCV21naUtFOXRCSlA4b2JQ?=
 =?utf-8?B?N3NqZTJOU3VNRWZVekZCZHozTEpmcDNWRmVmc0tGOEI2N2g1RkR4UGVyNHFD?=
 =?utf-8?B?a0F6TXN5SVhhenlLMDFlbDl0SU1yUWxDMnp6dU9KWW03UkM2NkRJcXBTUGdq?=
 =?utf-8?B?UitvcjVYNEh4Y1l5WGlVOC9SRy9RRGRzcitqK2ZxaDdIbi96SmsrUmNjOHQ2?=
 =?utf-8?B?VC9KcVpWR1ZkYThUQ2Fhd1RqM1lOZ3UvQlFkSlVFbXdpblVsdlpiQStHK0to?=
 =?utf-8?B?aDV1RS9WSFMrbUc2OUtsN0FlZTRmdCtkNnJiQnNqTTNvSkJaRFJ5QXAydXRE?=
 =?utf-8?B?MTkwUTdFTGtBL3UwNEUyT1hnaUZUYVBxT05vOVpLVm4xdlVhWjA0bWVseVlQ?=
 =?utf-8?B?Y3VnbGRlSFlnd0lvdG0weUdvL3VTSUswVGl6Umh1eEtvMnpxTWZ0aDhEM1BE?=
 =?utf-8?B?NW5veGw5MlF1RXQ4azIySlVidXBjUGxhWGpvMVNGVk9Pa0ZMVVE1L0RkNVd5?=
 =?utf-8?B?Zi9LVUNvTWZENkEzU2txL2t5elBPZitXVXBYQzE1MmxUbHJzTmJtWkVRMFZV?=
 =?utf-8?B?U2dBZURKSjZqeXRlL3JOZUJqODk2OWszN2FBSGZjaUZwNHZEdTA3Q3BKc3Jq?=
 =?utf-8?B?S1FVcFphYVBDSjhRZm4vaXRuSG5jQ0s5QlFnU3N6LzhxOE1lVTVQZzFrYTE3?=
 =?utf-8?B?aWNla2czM0xiWHJKVzQ3eFRUUmg3ek1MSUY3WG5wajhNZEtlaFNlNTZTUjg4?=
 =?utf-8?B?UktIR0gxQWdJOGZTQVR5by9sOGJrL3B5T0gzWmxBYUVaVEJzYlNCM1ZvRVhI?=
 =?utf-8?B?amt4aGxZck9Lajlja3JTSnp5ZG14YWtwRGdxK3VqL0oyZlRPeGEyZ0MrUHh0?=
 =?utf-8?B?WGYrdDJ4U2dGeXZ3ZkJ6bWFSY3V3V0Zoa1RBMXdpczJNSEVKVGFnaG1CcjZ2?=
 =?utf-8?B?RnNUbU1yUVNNMldhUm1kZVBhMXRMWDZpLzBIY2VlY1cwRzM4QTZWWitLZkpi?=
 =?utf-8?B?NnhNMmdPNXA1SlBUb1R1YU1FaVI1RGo3U3NtbEZDRk9MZmlSaVBTTkZrMkhm?=
 =?utf-8?B?S2JJOEF1bisrU0NqNEE4UE5QdG1hbEpPdjFUTXN5S2RuS0pXd0Jibzc1aUF3?=
 =?utf-8?B?U0FmRTVTbktmaFhNb2NybjhYK01XZFJiQ3hZeUZlVDJnSVN2OFhmMS9oZHFl?=
 =?utf-8?B?MDRXajJMWXNFRnFzUDZ5bW1sR2x6TTJVazlUczZFSGR4aVZ0SFFIWmpCbk5W?=
 =?utf-8?B?UVBEOG9JSTF3cHE4cElOVU5Pa1lQV0dURFZKL01CZXozV3VxcEdRYTg1UDEv?=
 =?utf-8?B?cnk2OFprcmIwcEVrdzVvSHo5WGozM1ZkVE0rT3ROMXdqYm9HMGo2bDlqVyta?=
 =?utf-8?B?ZlFqNkRKQ09QejJiRENkamZuZTBlMHU0ZklObDlKZkNodGZBWm13MDZyRk41?=
 =?utf-8?B?Q3VDV256MnFmNzVMYzlJbklJOCtMMEZFZFQ2NXViMGhrazhudUtKUEx0cXlv?=
 =?utf-8?B?SXMrRE92SjVBQjR1cGVjWDRVTWpHd1p3aGdqakpHU2hQb25zV3VnMFNscGFz?=
 =?utf-8?B?amd6aFI1UnN0QVEzRVRkT2E0THFyUUZsN2V2R2dvdFRyV3A1Y2lpVzhLNEF4?=
 =?utf-8?B?WHE0QmV1TDZoOUpQT0dGK3huc1R0amR6Y3lwMHlMOG1oWDlwYU14bmRzME92?=
 =?utf-8?B?WFFOa3V3TXZuaG4zNERORjQyMXE1MEV5a3ZtYURjcjBybHgrM0VPS2RKdnZP?=
 =?utf-8?B?ak8zcnhZR21XanlCMnE5TXhneG9YOWVaSExvRGgyR05hLzFHNSthOThqMHcv?=
 =?utf-8?B?S1pua210a3NweEV1ZWFWdTh0WnlJRjVHTm5xcW5IZDBqWkczK3k2MzlXNTFY?=
 =?utf-8?Q?LYFT3uwmQ4o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHRvUW9ndXh3RzRReEFaU1ZjUUVkMG5jMnloZ3FoREFkQ0t1M3ZmUjRuUDlu?=
 =?utf-8?B?S3grTTBPa1RrRTZnbG9paFduQ2ltU0I2a29OcWE1TzcxUTl1dnVIUldqejJP?=
 =?utf-8?B?OTRZSmNoV2FkRFk1Mi9VOHlhOFh4M080enA1VTVXeHVUSW1tSnMwaUtiN0NZ?=
 =?utf-8?B?b1IyWG5kaDNHRmpmT01oSWIyUzYzakhLNytuYUNhbkY1SGQxWWhzc09pTkM1?=
 =?utf-8?B?Y1JMcXEvVnRIOG9vV2JZdFZEVmF2S1dNYUwyM2pGS2FCTFhaMnJBQVN3UjFB?=
 =?utf-8?B?VW9rYzh0UnB4cisvdHFiQUwwbE9kL2xha3VpMXFlU1FRbDdOM0lTdkEzMStu?=
 =?utf-8?B?ZFB0c2N0aXJTVUl6MStjaXVsS200U2M0bTZ0c3JiOWUrUDdjdFhUcjA0d3dU?=
 =?utf-8?B?MHBKaXprSjdzTy9sSW9DN0F2TnhWN2dBQjJML0ZHNGdNLzBnb3d5TTZ1bHRn?=
 =?utf-8?B?bXBIcDlRZGY2Z0JOcGFvN2ptVFVFa0M2ZFdOc0sxbWh1ZWhLcEhsY282ZTg4?=
 =?utf-8?B?djRJTVQzWmxTREVVeE9oaFFxWEFuc3NzRjdLSEFLdENmY1JZby9sR1hLSWUw?=
 =?utf-8?B?WHA3c21IZlRSOXdtZXpNaDBmYkJhKzBKblNUQlRtZ1ArV2VJMENtUnB2eTRD?=
 =?utf-8?B?UE1ocVRnMFlNTzQ5cU5FcTZ5MVZBVThGZzlWQ3hmaXdlYjhBbEFHTzRUbHNn?=
 =?utf-8?B?K0dscFdWS1NINkVNc3U1THBFUUo2VUVLdHVKSnJNa2k0YWJQSDZIL1BnajJa?=
 =?utf-8?B?N2FNOUVqdTVFS016NmR5SWFOS0gwdXNqRkNad3RGSTdqaEFUOEN3SEEvbDFV?=
 =?utf-8?B?RVE0NFg5aEpkUDZzQVRlY0VEelZ2WHh6R3BkTy9HcnRZRjdDc3lxanQ5TlJI?=
 =?utf-8?B?SmxuNnd0QkdjZ2lzYXFMZ2owcDY4Ym5VNXZ6RVRhck13U0U1Y0U5Zm5CaVdC?=
 =?utf-8?B?dVQ2cmhONVA4UGFDVWFzR3NzRHFhaFViZmNhOUFlNWlEY3BiVXJLR3JEUVht?=
 =?utf-8?B?enAvWmRyaUZSNFI5VnJ2ekVaaENlblc3R3FNWGdZU0E5U25oY080OVVKTGRs?=
 =?utf-8?B?MzVIU24ydnFhSHVGWDJrSUZSUHRJUmZiNk1idnplTzIvZ3EvQmZOS1B6dkpX?=
 =?utf-8?B?eFdZQm5IVG50b2wxZmNWM3ZHYmJaMGtJQnBTYVc2Ri8wU1lQMFQ3OUgxUjE2?=
 =?utf-8?B?eVBVd3U0N1ZwQ2hTT1p5dEtPV3pPMHdHbXN3RkNPZUwvZmRYUW1RUmhZeTR6?=
 =?utf-8?B?UGwxNGk3OGIzYWRYRmVSS0JGbUpqb0RZZ2hSSENTRk9HbFZoZjZod28wSERK?=
 =?utf-8?B?TzhDT1c5SEN4U1dmVW4xTFFTcXBxbUFiYmFMWGlsQ3AyNG4vcERieWxaS1FY?=
 =?utf-8?B?aStqYkpKekxUaXBac2tlVjlGSUx2aURvUjAvVTVUQXlSTEIxZkFvLzhVZjVn?=
 =?utf-8?B?N08rbVlWN1hzY3J3SzU1SkFVc3BUWmtxWTVrYzhXdTVPN3B0dmcyUW1XVjEr?=
 =?utf-8?B?Vk1WK3ErT2lFUXJpVWJpcm91dUVEZXlOS0hndmFqNXdqcUhMd2ZZVzBZNTZC?=
 =?utf-8?B?anZESzFGRWdPNWdaYkQyTGJjVm12SThDUW9lb3M3QzJCQXdkUkZPak5rYi9y?=
 =?utf-8?B?MkVWb3M1cjNFcEJWMHBVVEcvQXhzcjcwTmc5dmhPZVh1NmxnclZnUUNkc2wy?=
 =?utf-8?B?Vy9YZkJvbWRQa21uT1F4NnhhdnpYZjJBN2RuVWo2OUhHUno2N3hFaHlvaWM0?=
 =?utf-8?B?NUFsTlB6Y0d4NG93SUhMZVFPdHplQzEvWVNoL3JXVnMxVkxwU3hkc1RCU2p2?=
 =?utf-8?B?TWZ5a0I4ODNNamgxRXRKNHVPbTBCdFUzUSszbDN0VlpNWHo5b3ZIa0NNSTlC?=
 =?utf-8?B?bjV3NnI4cklBb3l0L0drTDZjaVA5cVU5UUN3QlJzWnFvYUl1UXExZ0MrL2w5?=
 =?utf-8?B?MzQwOVRWVkdobmlLODJFTjF3d0pKLzVkMkdSRlAxa3pBSmFCMmVPTkdYTFZB?=
 =?utf-8?B?c251VWEreXNqbVlsUVYrNXZtVllNSGZRenRObU02bkV5bzdpQXVFdFNsRmIx?=
 =?utf-8?B?b3AxMXk5TE1SQXZDUjgzVnptUjg4RG9qZVRzdFdtcGFZQmhoV0F5d095ZUJp?=
 =?utf-8?B?Uk9hOWxwZmlXNHk4MWd5WmRPbEZpTGtFS3JkWmdheTZhZTJMQnBJYmtabXhQ?=
 =?utf-8?B?cnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5620b305-bc60-42fd-860a-08ddea58f1de
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 19:43:09.5988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEc/ShqLTfHryObUV68cqwIsNQaNQ4GuXZxM3ooFkdbMTN5bUBe4RXKE4bZ6e6d6mtduBK+7svKIm1j3Le5usw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7247
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

Hi Ramanaidu,

Please find review comments below.

On 19-08-2025 03:14 am, Naladala Ramanaidu wrote:
> This measured time is then used to estimate the number of frames
> delayed, which is factored into the validation of expected display
> behavior. The adjustment accounts for timing tolerances and helps
> reduce false negatives in simulation environments.
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_cursor_legacy.c | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 9f6e644e1..7fda490ea 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -238,6 +238,7 @@
>   IGT_TEST_DESCRIPTION("Stress legacy cursor ioctl");
>   
>   igt_pipe_crc_t *pipe_crc;
> +uint32_t vblank_tolerance;
Why have we declared vblank_tolerance as global var? Do we have plans to 
use this in other functions?
If not, declare locally in flip_vs_cursor_crc().
Also, vblank_tolerance is misleading..rename it to vblank_increment or 
vblank_step?
>   
>   static int try_commit(igt_display_t *display)
>   {
> @@ -1587,6 +1588,10 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
>   	igt_crc_t crcs[3];
>   	igt_output_t *output;
>   	igt_plane_t *cursor;
> +	struct timespec start, end;
> +	double frame_time;
> +	double elapsed_time_ms;
> +	int delay_frames;
>   
>   	if (atomic)
>   		igt_require(display->is_atomic);
> @@ -1594,6 +1599,9 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
>   	pipe = find_connected_pipe(display, false, &output);
>   	igt_require(output);
>   
> +	vblank_tolerance = get_vblank_seq_diff(display->drm_fd, pipe);
> +	frame_time = (1.0 / (double)igt_output_get_mode(output)->vrefresh) * 1000;
> +
>   	igt_info("Using pipe %s & %s\n",
>   		 kmstest_pipe_name(pipe), igt_output_name(output));
>   
> @@ -1628,10 +1636,18 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
>   		igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start);
>   
>   		igt_set_timeout(1, "Stuck page flip");
> +		clock_gettime(CLOCK_MONOTONIC, &start);
>   		igt_ignore_warn(read(display->drm_fd, &vbl, sizeof(vbl)));
> +		clock_gettime(CLOCK_MONOTONIC, &end);
>   		igt_reset_timeout();
>   
> -		igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start + 1);
> +		elapsed_time_ms = ((end.tv_sec - start.tv_sec) * 1e3) +
> +				   ((end.tv_nsec - start.tv_nsec) / 1e6);
> +		delay_frames = (elapsed_time_ms / frame_time) - 1;
Why are we subtracting 1? Can you add a comment here?
Since, elapsed_time_ms and frame_time are double, cast to int. Also, use 
round() which might help to avoid off-by-one errors on boundary cases.

delay_frames = (int)round(elapsed_time_ms / frame_time) - 1;

> +
> +		igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0),
> +			      vblank_start + (1 * vblank_tolerance) +
> +			      (delay_frames * vblank_tolerance));
Can we write helper for this expected_vblank too?
Something like this
unsigned int
kmstest_get_expected_vblank(int fd, enum pipe pipe, unsigned int start, 
unsigned int frames)
{
     return start + frames * get_vblank_seq_diff(fd, pipe);
}

Then assert will be more cleaner
igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0),
               get_expected_vblank(display->drm_fd, pipe, vblank_start, 
1 + delay_frames));
>   
>   		igt_pipe_crc_collect_crc(pipe_crc, &crcs[2]);
>   

