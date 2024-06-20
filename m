Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022BFC2BA1A
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 18:12:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E3310E157;
	Thu, 20 Jun 2024 18:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GWotRinU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AD310E157
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 18:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718907157; x=1750443157;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tqNOrzVc744vfxCmFAC2l9iVRmzTB9T2zGjRYrIOLcc=;
 b=GWotRinU3ZGKU4zud+zvWSxSW1k7FekbfJrJcFapB5jJF7MEqclTV/c+
 IGDL3hx9u9EwQZhiu721xPqlsry2TE4ydhma/Ly6lVF+QDvMxokkgbz4+
 gdoQ3iHJVI0Fl9pJLjE+Pcp25gS6yWC/T0Cya4kSS3XMyiQc0ZskRtmFI
 u3tu70Cagkvk20+awfDjBn6htIF6uEwQQb/g6IaWbJGLoHB3JiEZCnLqp
 SXrDkvzgkVQebWwDSconnOd9TS9bb3GnRolbVv4CKud22fAHb2P0IZWLr
 sFrrrPtBHHFG9OVdxPatVVuZY8ent2N3xfIwebPCxwLEJr7Koow2PWqi5 w==;
X-CSE-ConnectionGUID: y94Ebb96QOe7AwyFhyu1jg==
X-CSE-MsgGUID: KVbk8AR5RsKXSfzBVKQj/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15788632"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="15788632"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 11:12:36 -0700
X-CSE-ConnectionGUID: IrzyCRhASimA6wuSAQy1qQ==
X-CSE-MsgGUID: GxvQbzgaToyyRyH02aSxJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="73536184"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 11:12:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 11:12:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 11:12:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 11:12:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKNQDcgvyrEfXRpHIIszT/jcBhQuKlCMAiKQBlxnRiqYOYmpQrPIVpX0P3W/rP6NxI+aqlyh36+b19thg1Knt1tnQiFgOi/79RiuVfrcgpPlGQtFrwYPTfbQOSrS2gWlQslqxpGWGoE9LsTcKrhWwYdIn+r/dso7jwj5iSfSF0aKO2PSeN2e6lnBOwLOux+SRSO9AgWelfshlPB8A0czdBLxRbWGK7QXSONul3PtrE3GKRed/HWVqN/Kx9yD/Nf9R7BqkPWfVCXsnwnP1iUhTiwWxgWiCUOJwegcWPB0ZQAzpnmQSWJpMN057xASp/9oA3FM1TGrUQSorlut1Mp/TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HC8JznDw33myJ/5oUj6ByqWRALqF7Aa9Hve8Kn3ezRc=;
 b=GQ+8AluAUPW9MzoaLvJZas21Ku2faqVGR6ULQtyEYtQC1/SCJqmJ9GVr1suWLRQ3Pf+0a4mnO8d4OYIa4NVrc+Sr+DgYPbLWRKWYSEFfZspHPCOLxu28ec8hlaRNTyd3xcav1rLPLy3YIYd/ksIJdfz3LmGHqY3FlYKIPhoyOxML4Djm+umpqI1NDBtGwMSdC4+Ik4JJHY17JlC/UShGtY7LSzDJ1uWZpBK/+Wn9MceEB3qKRgzGgWlsncdxodhtiU+71XBXebasKF+jgULhBts31FOaUh4HsMdFdSuhd0oGAwQIl3IeplE4ZT9ya4t/E/EgkdO7rPp3E3HVaPQdLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7755.namprd11.prod.outlook.com (2603:10b6:208:420::18)
 by PH0PR11MB5926.namprd11.prod.outlook.com (2603:10b6:510:14d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 18:12:27 +0000
Received: from IA1PR11MB7755.namprd11.prod.outlook.com
 ([fe80::8a57:c694:2dfa:e041]) by IA1PR11MB7755.namprd11.prod.outlook.com
 ([fe80::8a57:c694:2dfa:e041%5]) with mapi id 15.20.7677.030; Thu, 20 Jun 2024
 18:12:27 +0000
Message-ID: <ad4717f6-5bd4-4251-b63f-a611ae13c9c5@intel.com>
Date: Thu, 20 Jun 2024 11:12:16 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_gt_freq: Resolve freq_low_max test
To: Badal Nilawar <badal.nilawar@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>
References: <20240614173520.51631-1-badal.nilawar@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20240614173520.51631-1-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI1P293CA0008.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::11) To IA1PR11MB7755.namprd11.prod.outlook.com
 (2603:10b6:208:420::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7755:EE_|PH0PR11MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: d90ba731-7008-4123-4450-08dc91548b18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1NiUGYvRFdtT2RPVVRScUVjU28vNmhCaytTRTJrL04veElGMnFVTy9FOXYz?=
 =?utf-8?B?Y1FSemNtYU1zYkJIaGwzdDNIdkp2NHVWa1VmUk1QM2RXTnV2V0I2L29nT3No?=
 =?utf-8?B?VW5XR3E1anhLaHlXa3pnSVFhM3ExY0F0d2lsN2dudCs2TVpJWEFza3d4SjYr?=
 =?utf-8?B?ZnVPaU1VNGttZDVjaTNTSEpMVFhEdWxJN2JxVC9zdmRjV2tRT2dnRHZodGNn?=
 =?utf-8?B?SGJ3UTlCdUdTb1JIS1dHQjh6ZEJNV0N5S3NON1J2ZFdoUU5tUlRpVDJWa2JX?=
 =?utf-8?B?ZUlIRTU3Y0hGbEw0S3VrbE12MTBOWXJKT290SDF6R2dRWHB6Q05NaCsrN2E2?=
 =?utf-8?B?cjcrNXJrODVNTkswV0xla1M3NUJDZWM1NUNYTXUvQmRRRUtsUzRwaDhuWVRr?=
 =?utf-8?B?RVBYR09hT3BtMFhmNFN2ejdkR1kwVDFnNE1OZnBPYldIYTgxVFJXUG1Jem9z?=
 =?utf-8?B?Um9HTHB2SjZaVmhNR0I4WU1hWTNUTzdVVS9jRGVMaTFuYUNIR0ppTG1NWits?=
 =?utf-8?B?cGNISlVkdmhxYk5na3RqWGxhWS9KdCs2VTMvRzhNSmZybmpQb1QveGxIeUJw?=
 =?utf-8?B?QzFzWkptQW1xQVRPSmZ1N3pHN2FJZW1jamJIL3dOK3VPYjJLekd0SzE3bFUv?=
 =?utf-8?B?aUszOWFIcUNhT2tTR2tzVWdqbUVES0lIdnVXbWtEYk5OblVaNkRPWk9IN1RZ?=
 =?utf-8?B?WUdjUjJLQmtWdXNDN2JXdWtTMlhHNnpLMm1sbWU2dXY5cHJVSk5YNC9nRnBi?=
 =?utf-8?B?ZmtHOFpRV2JWRnZEUjJNWHNiTFBtQnBLbk1zK2FJeUFaQ0Y5aXRHL1FZRTZw?=
 =?utf-8?B?Q2tUSlhSQStnYlRxdXdTN3NTblJURGhYdWVoM1UrMlNrMTdqYUVveDc2aVlq?=
 =?utf-8?B?SjB1dmdRNWhDSEZyaXZzV2FYTExiVE5lVU9MSWFsVzdIdzUvaitmczZHT3Er?=
 =?utf-8?B?MmlpUCtBS29JZVhiUGd6ZEpyVVcrRzBKY1E4bEpUOWF2OVRXR1Z5VGtPTnVz?=
 =?utf-8?B?ZjhpVTZNMmJNYTJlOHNVVHFodkNlNm10YTdXc3B6eS9sQzhNc081S2FPbE9U?=
 =?utf-8?B?Q0poQ1hIYWxSTGdtYnZHYUtCVUt5Sm1yVGV2MEZ5NGVhQmFTcjlCWHhMSjFN?=
 =?utf-8?B?am02S1hHZ2d0Ky9rVlN4TkxwMTFFMlpNL0RDREx0aFVMT08yVzZ0SThkVC81?=
 =?utf-8?B?aVBWemwzME01bjM1bUFvOEpqL09hR0lHNGFKOTJ2WlRGb2VPWkZITXd3Wnl5?=
 =?utf-8?B?MGZpMFBKZkYySGdYSUxSWU9FNWVJcGtnK3Y5dklIWXdMYnY1UWhjZVpWM1ZF?=
 =?utf-8?B?RzV1YVdEYW90TkYwdi9BVHFSWVg2L0tPUkVFWExiWWtIUkR2SURVU3phdGRy?=
 =?utf-8?B?RDhJaTM3UlhZMUdVVTA0aVNWUDRkUDJYOVdjcXc5ZnlaWCtHRnNhNmFjZ29j?=
 =?utf-8?B?cE9ReDZNRUJVamY3bnNjTDdSYTVxOER3b2ZsT2lXOXMzTitHeEowT3R3Y2dL?=
 =?utf-8?B?eDlib3hnYlc3OHgvaWliWHJUL09DWUxqeUZxbWJZNWVXQnNNV2dxb2UrRHhK?=
 =?utf-8?B?N2ZLQXV0VEZTeDVLdDY2RHJoMlNnZXVjazUydmc2Zm4zR1ZraE1UK3RjZGQx?=
 =?utf-8?B?WkQ3dFhZcGllU3RXbHNXaTNJUVVkK2F5U1EzbnVld0t0dTFNSmtINU1udEhk?=
 =?utf-8?Q?RzW0V7CSoH8V6Mn2jm2m?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7755.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0tWTEwyS0pURm9wNlZRRFphK1JDOW8rQmR6NzJkMmlsdUZJOGphVklUcDF3?=
 =?utf-8?B?aUg2aVZibzMxREtLRGU3TjdsaVNrdkRaaE5ET1pwaVU5ak9yWkVnTzZkUXNu?=
 =?utf-8?B?cHFMUzdGajlrSnlmWW1SR0ZESkgyMjZ5aWk2aEtVNzRPMXNpSE56d2FJVTNM?=
 =?utf-8?B?bTJ4UWZGc3BqRndjR3BZMGd5cFRZdThkMENEVnNkY1VtS1dHTkpzbEg5Qnhw?=
 =?utf-8?B?WG5lSE0xRWVWWDZIeWFreUJ3RWUwb1d1N00yeW5JL2o0MXlVcUhVRjRvQUMz?=
 =?utf-8?B?ZWNuL3JDZUppTHlneTdMS1ovbVR4TndwWG9pUkF1YzhsVTV5NW8zWEJ1b0JR?=
 =?utf-8?B?L1BLckl1VDI2NFFDUlhPSDdPUWNESlVsV1piQWZnbjVmQmNpbUtmOG00Sitr?=
 =?utf-8?B?RjN1U1pTNGpteHdxWTYvV204TncwUUFhbnBzL2NwM1BTMkl2WUF5QUs1OUZH?=
 =?utf-8?B?VWJkdGpEaDRvN09DNVR5TUJlR083QWY4bEExWGdiNDA4dyttY2JXWnMxUm0y?=
 =?utf-8?B?aTluTUpVbGl4Z1R1ZGJ1T1lTeEtOeEM0YWpsOTcrQlo3YXl3MkpreVFhUU1w?=
 =?utf-8?B?aGg0UVBjZkxzdkJ1VEFqYVBUK3JDUXRIVU1hRjVmU2hKd2ZvY3FweDM1LzBy?=
 =?utf-8?B?UlBxTmM0c0VFc2JvbDJBMStTWllDcjdHMWtIREk1OVhpYjZ5dUFKSDdteXdj?=
 =?utf-8?B?L3R5S2RaMFUyZFdFbHBTZlA0aituRTBRQWU5d3JsVFYzUmFnaHJBMGRVL2p1?=
 =?utf-8?B?ay9PQ3RuNGVBSStzUFRNZWN4NElNTCtqbW1JV2R4RXdOb1J4WW4vS09kVno1?=
 =?utf-8?B?STloTHFDRFdCMVBmMm9YTlluVDlWaUIwVE9ZKzVjL3h0ZVJ4WDNOeHh6czdV?=
 =?utf-8?B?VzhjNXNNUW56dmpYZ3Bxb1FNNXVHTlJibVpUOG5KOVJIT1l3SDFFc0VKZ0k4?=
 =?utf-8?B?NGs2aHJsSzFIb3RUQTlEam4ydlZxZTRPQmc2WHhpWUdFRjhxL2RlL0JDQ2hN?=
 =?utf-8?B?c1FqOXFPbXFlRnVEcFpZUDNnemE3TlJuNEJjMkdyMkdSUnlFdU1qNGkramRw?=
 =?utf-8?B?MGhJZ1RTSnY2cDkxVFhFc25HOVFLZVV3YXpleFdHaFRWQjN5bG8yT0tCYVo4?=
 =?utf-8?B?RnMxai9rZS9mVU5wdVJ3OHcwY2Ewd2F0M0tmd2NnaTNsUXBKU1NGOWNsVTUy?=
 =?utf-8?B?QVNNRlUrVi90NHgySzJ0bzNZc1Q3aXZoa2didUdyRUV1bnhPNkpUNVVOREMv?=
 =?utf-8?B?aTdocG1TVVpzTnd0Q1JuVUFEYWxJU1RIc0gwWGJKVUozMzJuc1hqTWk0b3Nj?=
 =?utf-8?B?cUxOci9nYW16UGI1TlFMNG9ubGlwOVB6QVovUkRlVHBFK2hQdjY0Mm1TeWRr?=
 =?utf-8?B?TDhuWWhFc2R2VDdaQlRrUjZxSU1Cci9VcUU4QmpMRWdOQkphdnVtbDdyRTRh?=
 =?utf-8?B?LzRHbzc0VHkxL25waFFGcDhTZVd4MFlzQ2dteEFZWHdkcWVQdXN3ZzNlWDBP?=
 =?utf-8?B?TFFTRE5ERFdHMlZnVVVhUWx6Tm5XcjBEOFl4Y3B3ZEFwZzk1QWlsRm5yR01y?=
 =?utf-8?B?WWNjaWFvV09EQ0FhQU4xV3czVE95OXJKOWxoS0I0WFFoVkExSmZrZkoxSnBs?=
 =?utf-8?B?RzRvRjJMcHFnNWlnNjV2eEFja0NFMmtJcHF2dUFmemJVV09RUTRLeHNiUjFp?=
 =?utf-8?B?V1doRjNMenJGYmRmZ29QUzE1VVdPOG5zZ3RWUFU3d1ZXT3B0RHdZTzhBV0pa?=
 =?utf-8?B?UWtXTkJtcVMrRjZ5K1ZlNTZGUnVTaDlhamRVY3pUT014SmlYMEt2ZUdjTkxX?=
 =?utf-8?B?K1BFWlVJT1N5YmFCRXdsVHpXRndqMU1YQVVzcTJYYmRwY0NiV00wUVN5cUpl?=
 =?utf-8?B?Y3RFa1RSZ0pVNExlMDlKb1ZpMEJaNVhiYnYyZlNrL1ZsQWY0MlZHU1lJUE9h?=
 =?utf-8?B?KzJxTFRjLzNnUGhmZFMrZ3FLTDlOWXNsNGZUbkhEeXFuK2VGbWwyVlVZMHFs?=
 =?utf-8?B?NzQwWnZIVGRUN0N3bVA0SnRFQnFTUS85RUZGZ1I0M3VEM2VDM3pFd0hmSHZa?=
 =?utf-8?B?Wk9oZWxscGY1T09SZ05HZmkvMUhvcjNWSzJNalVzbzdlNjIyc053S1JHcUF2?=
 =?utf-8?B?UjJwdkNMQmoxZS9UbzlOMnI4Y0VWUFV6Z0d5TkVFemtjRVJzeE0xL1psZ1Fw?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d90ba731-7008-4123-4450-08dc91548b18
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7755.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 18:12:27.8004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g570mIH6ckqmSmbj3Z+rr/fBzySb9gzn+rHu2nUy9r8yCgqMKJTPaNRmGVJBTyCA5BLna1kiNDnFCqw3K770uNlAtObqFyQYc0hvgZLGkr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5926
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


On 6/14/2024 10:35 AM, Badal Nilawar wrote:
> In GUCPC flow when max freq is less than min freq and min freq is greater
> than rpe then cur will be set to min.
>
> By nature rpe is variable as pcode changes it as per its calculations.
> So for above scenario when rpe is greater than min then GUCPC will set cur
> to rpe.
>
> To validate GUCPC behaving as expected it is enough to check cur freq.
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1045
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1829
> Fixes: 1a1e668e774e ("tests/intel/xe_gt_freq: Fix freq_low_max test")
> Fixes: adcc68266b8e ("tests/intel/xe_gt_freq: Check for RPe freq updates")
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   tests/intel/xe_gt_freq.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index d2e4d1a09..664ea3f79 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -264,6 +264,7 @@ static void test_freq_low_max(int fd, int gt_id)
>   {
>   	uint32_t rpn = get_freq(fd, gt_id, "rpn");
>   	uint32_t rpe = get_freq(fd, gt_id, "rpe");
> +	uint32_t min;
>   
>   	/*
>   	 *  When max request < min request, max is ignored and min works like
> @@ -276,10 +277,16 @@ static void test_freq_low_max(int fd, int gt_id)
>   	/* Refresh value of rpe, pcode could have adjusted it */
>   	rpe = get_freq(fd, gt_id, "rpe");
>   
> -	igt_assert(get_freq(fd, gt_id, "cur") == rpe);
> +	min = get_freq(fd, gt_id, "min");
>   
> -	if (!xe_is_gt_in_c6(fd, gt_id))
> -		igt_assert(get_freq(fd, gt_id, "act") == rpe);

Another thing we can do to make this more precise is to get the latest 
rpe here instead of before the xe_gt_is_in_c6() check.

Thanks,

Vinay.

> +	/*
> +	 * Refreshed value of rpe can be lesser or greater than min (previous rpe).
> +	 * So when rpe < min then cur = min else cur = rpe
> +	 */
> +	if (rpe < min)
> +		igt_assert(get_freq(fd, gt_id, "cur") == min);
> +	else
> +		igt_assert(get_freq(fd, gt_id, "cur") == rpe);
>   }
>   
>   /**
