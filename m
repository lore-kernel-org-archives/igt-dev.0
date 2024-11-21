Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD221D6ED0D
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 17:30:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644A410E145;
	Thu, 21 Nov 2024 17:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hKEssPeX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E02410E145
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 17:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732210218; x=1763746218;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OFgVEeOEiw1gx20zp9EaUv6dCX2JoeJQa5TrYWtJkuQ=;
 b=hKEssPeXsFD0H4Twpyxh08zd0GaO5c1zwinIygrSr7b6BrNB3b9FElWA
 Dtc/yZAR6Nd+3WvTEZ6hpML+gGBGU4eeAgDbJssl+uxPIoBJsWsYc1K9D
 HED5TY8fVoepZnuPSTCOUY8WUDvDYfBwiF9y9tQLcCn1R2v3DS5KF1fb7
 AvXD8Tg6AMQhj3sYZ5GpnL+JZ/ZZvGJMkLzIEKEnmRzSsyS/xmt/VWzx/
 SbZ8Mne90UmPOnbKTioixxOr5GkhPNct68TbifK6+CK19VLhQXNOLi5u3
 RHZPEpHLksWeQEG1VQcmWhWqQJj3DZpV11aDnVlVpg7uk0x3mYX7Ir2Za A==;
X-CSE-ConnectionGUID: U20gjeUfS06mVN+/yrMWOg==
X-CSE-MsgGUID: uCRAbZazRb6bW+ySqhWUcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32270882"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32270882"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 09:30:18 -0800
X-CSE-ConnectionGUID: VU5rL7wiQb6o9SQ1p3d8AA==
X-CSE-MsgGUID: 1ujCUKAvT0WDqEkrf2xOcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="95402774"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 09:30:15 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 09:30:14 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 09:30:14 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 09:30:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhOC2rluQOuGJ3ySHlBxPw9QWcRrNI3UBUUhz/zvtVNd1OMgg+54na2zXZeZT5YTpn4BCtFiG12b0Un+q89k2Ox+hEDDdTfTG24grsxBPdIyVJvAOFIFImbZrSLvKsVqc8eAa8RoLJywqXcXmcAUo68Z9N59r2XYLmnqQFAH2DvwFSgMZ6llA13+4P5Y0fy2hFjU1+vtgJEXtfsBiuKh3G/JGuR7bvw8Kl8O8x2vi+HsuWfmCjbnyPmlVk8HpNrQUQ/3VtimtvVFiGOQPGyt7XyygFZiGZ4m1+BHfytu7PFBQnnPD0k2nCoSzr+RLf9tN57WEhg58loqKKKXQMP7oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8xaZxbOzg+VA2vmE0GcP00DXTmLf8nfYKxVcbeefx8=;
 b=UTv8kBG7+9O9aM8U1W4OgeFdtAGy3QfpGuYD4tP9IeGjKjO5j99zc91EzuolPrTEaZh9lSpW8LPV6Q5vl2RB+JSxnfSiNWg8Zx3tLrrwJdNcro/kEWFIxdCm6ZBDS6uz8b/f7276OA7pYfOlC8xP5l+C7KZNWvonLLGFuSwSQAMAkHVNQ58QhjW3mgxTPK6xhFwOLMuIcRzlInM+HfAWNHqZAvcC0ijgBec2Tg6KKflcWxrGNcZPa82qLkRdGfPVFgjQuEIs4wSSrcgls/S4wd6PmkMZC8LEDcLmE3JBZyhi+hdxRIxxeEsj2VTUkLWdY1uCvcNbYvCwzYlB+3g8QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by CH3PR11MB7894.namprd11.prod.outlook.com (2603:10b6:610:12c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Thu, 21 Nov
 2024 17:30:02 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%7]) with mapi id 15.20.8182.014; Thu, 21 Nov 2024
 17:30:02 +0000
Message-ID: <7ecb4fbf-c61f-41e4-9e76-e195b84d25d9@intel.com>
Date: Thu, 21 Nov 2024 22:59:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] tests/kms_async_flips: subtests to validate async
 flips on atomic path
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>
References: <20241121115451.2917187-1-santhosh.reddy.guddati@intel.com>
 <20241121115451.2917187-2-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241121115451.2917187-2-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::19) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|CH3PR11MB7894:EE_
X-MS-Office365-Filtering-Correlation-Id: 280cfbbb-65f7-4af6-7871-08dd0a52216f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDgwY1pPczY4ZHRiRHA0NzZrV2hxTzdvb3VuL25RTlhrUWFLY0FhNjhob0tL?=
 =?utf-8?B?bURqaUk2L1hjRzVWMTFNQ3hJbmQxSEh5bUJ6V0JIZjBoS3ozUDJ5cEZMMVRu?=
 =?utf-8?B?RVlFTndJSmpFYk5zeUk3MDNBWmhsTlp3MEZOelIxOGFFbVYrUmtnbzd2ekdH?=
 =?utf-8?B?SVc5K21VQ1ArbjRQbUJnRjRTL1NYSWdSR0k4VSszTVB2bUVoaE5mM2hkaE5s?=
 =?utf-8?B?WSsyalFMS000c0kzSnp0eXJJUHZmOUl6cktaZ1VDa3B0WVBxbGZhb3pSRThZ?=
 =?utf-8?B?RHljOEErNFN6Vk04N3NuVXlTNm1xd1J0U1FVd25tQkNrZnNCb2NuSllxMnl1?=
 =?utf-8?B?eURMaGJZZVl1OUw3ZllWWFVaeTlMTG5BUzlncnBSeWUvOVR3enZnYzVHRU9E?=
 =?utf-8?B?WkFFbjFybE1IczVlbXovK3VqTzVPN2gzL3Y1TVlzU1MxdnpIMjBmRk91T0ha?=
 =?utf-8?B?Q2k4Q1pOLzM1bnliOHR2UlRsYTIrTTBER2FydFc3OUowVUR6SVhsZXhUa2lp?=
 =?utf-8?B?RVhZd1EzRTE2M05BVVJMbUZtZSt3VzFTTnErYzl6YldGdnFHYVJGQlNDYTVJ?=
 =?utf-8?B?dFQ4NUlhSWtGVGhsMlUvdmJ3T05KUk0rSll4QjlqTU9IN1QrNmgrM25sUFVW?=
 =?utf-8?B?blBYNmtQN3ZTUmNIVTRnT2VkMng4MDh2dkVYQVU5c2NkcTRFaXJEMVVlN09W?=
 =?utf-8?B?ZnlRZzlFaGIyQ29BT2RPN3RiWjRtcnNkbm1VeUdLVHhTR2o2a2M2a1BTdmlH?=
 =?utf-8?B?d3AwTDJHcTFURzcwWklvZXpuYU5KTzQzSHl4a3FsSGtnUGVHbi82VEFIZERh?=
 =?utf-8?B?dmpPR01JdWJmMm1EelJZcS9XaHlDeTl2Y0NIYWxEWXpQWk1pNTZUaFAzNExp?=
 =?utf-8?B?ZCs1K28rd2paUXRNT0JPSW9PODJnbnB5SnVXaFdPTVU4N3pId0lKM1NOczhn?=
 =?utf-8?B?STEyKzNkSmx4QzZUZ01vL1RVZmVoT3RBMkdOcWFUZjBGeGdXU2x3MjY1VTRt?=
 =?utf-8?B?S0J5MDRYcmdXUXdUYkxFWFgweWJ6RDh5NmozZ3l2R1dLRE5SazdyLzFwMldy?=
 =?utf-8?B?SjhDNllVUnNhUXgxMUxVaVV3UmFZSkxGdlVYQjFkbHM2Q2d5WHNZR3lieGUz?=
 =?utf-8?B?M2JRUFFYQW9GKy8vMkkrSDBwUVVUTnFyeStvNXpVNXdKNE5YNGtBUXYwMmNQ?=
 =?utf-8?B?RXd0ampKWFlCeFRYaGJPckFEeXFidUFxcUF6NVI5NWVZa0djMHFBRDUrSFZ0?=
 =?utf-8?B?OFV1ek9vZEVOS09IOWlpRFlncDlLcFVaZi9JbnBJSEVVSzVTdXByUUQ4ZnBI?=
 =?utf-8?B?MmVtcGVqbllFMkc3am9Mby83clJNeE01ckFHdC92THJmVzNxYUZmZmVNVFo2?=
 =?utf-8?B?RjY4QXE5dnFyOXVwMUtOc1lMZEZ5TWtYQ2xmQ0NCNC8vY3pTdE4rU2Yyb3Jn?=
 =?utf-8?B?a2hSMlVVTExta1QxcE5jOVF2YTB3SXZIcFBYN2RsVHNaVWV1QWZ0RktPRDNC?=
 =?utf-8?B?d1ZOWi9Dc1NpVDVVWVJqTjNPM3JTMk51blJFMEtyWk9veVIraGswZldNYjQ2?=
 =?utf-8?B?N1JqU2luc1lXOHlUMzd1eWtlOXBITWVvRGp2ZXlIR2JVU1NPbnM5eTZNS3FH?=
 =?utf-8?B?emVXQkF6Z3RFVGVNVFREU2xNWFpJNFlxdU56TXpqN3Fma3oxM29FK1J2T25G?=
 =?utf-8?B?eEdKUWZJaDlvaDRKak4vV1RNNE5EZW9ndjNlaHYyQ2tHZElhdndTL3BzNjRx?=
 =?utf-8?Q?AUTm5ft+S4JA71Zx5mrzBm8oe2QrunDsyL3OhPp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEFwWUE4d2FRem9HOVJ2M29HNzhOZ21HVmxqZ29zZGFFQVFZWHU1M0FHZmUv?=
 =?utf-8?B?bUU4WTRBWVlFaTBBQ0RMb1pTbFBWTVRFWDg0Ukc4L0hNRE5pMmxZNjVPYmNS?=
 =?utf-8?B?N1pRUHhNMmt3TnpYZUl2Y1dOUTA1dGc0dXJRVjBRUVc3MDNZUzBOLy8zbjY3?=
 =?utf-8?B?dFBSVjlBTmwyK0pTUWQzMm9nM2k1ejMxRUpaNVhqa0g2aGJhZCsyMHBzQk1h?=
 =?utf-8?B?QWpxL2k3NlpwbEdBd3lpNDV4YklHV09YTWRZMGFhU1BIS01sTFNVd001WkNB?=
 =?utf-8?B?WjFhRDZHdVNnMks4UHkxbEFNQVlBU3JjZm01c1hRSHBvMnJuMW5KWjRiYmZq?=
 =?utf-8?B?L05vYlZjR3dkNkp6S1hNdm80MnVlcmxlWE5HOTNUNEJ6SVQ0Wk1wWW5ocmtu?=
 =?utf-8?B?aElMSFlxbVBTTzBpRTVEeENZZFNsNnRrU1kvMXludjRpWVVYc3NTOVVMOVlk?=
 =?utf-8?B?a2VjakdiRDdFQUIvTGJXNHNOUFdibW1GYWMwUk9QY2hOYWRlZFErbkFkaXkr?=
 =?utf-8?B?ZnRBQTI1ZytYQjIraENUZFFqVUxzMnVWTzRncVVzKzNmUHVlUzNZSkJ0aWx6?=
 =?utf-8?B?eWtLQWJSQXFrTGJBa1RyR3B5WndFaHZXdzF5bmZxNStHR0FWS1kvWjZiNjNM?=
 =?utf-8?B?WTVhNnNQbU5wem9xalNvOG05OU5MbURXdk1UNGR6ajIvS3ZQUHFtZWdmeFRM?=
 =?utf-8?B?cjBSK3Ftd1Q1clZWOU5BVlQ1OE81emZ6Z0wreHVjVTlBZXA0Nk1reEtFbVdR?=
 =?utf-8?B?aXg1YjVIaC9WODBEUXJpeGZCOVl6SmhSa0pwMlk3M3B1cGxQY2F4VU1jRHVp?=
 =?utf-8?B?VFY1VmVvQXFGb2EzTDk2czZiZFN5eTlrNjJ5RnEyY2tNbGltdkZWelNZTkxk?=
 =?utf-8?B?aDJJYURFZzVJUU9jZWNwUGUvdHVqTTJqNUlXU0tvdkFCRzhJQnNjUlV5UzIx?=
 =?utf-8?B?RENPZVIrelhyQlBaRUp1NXZaTGJ2Z1N6QjcrQTdDbG5tTElwVjU0b2lUTDNL?=
 =?utf-8?B?V2UxQkRvNlk0UGVzaGYzOW9zcUJUV0s2K2x5bzJabXBXSEpBVHV6eVlBQ1dW?=
 =?utf-8?B?MG0zemZOWjJHL0pWT2J6S2JQS05rNU5iZWFOKzgrWk5nUjY1RjRjVkFZd1BY?=
 =?utf-8?B?VVBocUk5Q0V3UnFoY2dHOTh4d2o5b3pHVU9HMW9SdTNXWmJnbGVwVnhBYWVU?=
 =?utf-8?B?K3BzTXRvU2N0RVNrUnE0eFZBcXVTVHdWelppS3RMYmZTWmJVWVA2SE9sN1FV?=
 =?utf-8?B?WjR4WlJWSjROczZ3c3h0U3dhM1E2K1d1VndRODFkUGMyME83V1hJQS9SWER6?=
 =?utf-8?B?UGozYjVHSFF5RFplTm5jdHJTbUE2RVRGVDU3SnEzZ3BQUDVXYUp1UVRPVm9o?=
 =?utf-8?B?VC8zVWwrVjJSTGRrWGZVVjFHbktBempoRWlINWV3akFkUDlWaXBwVi9TMW9z?=
 =?utf-8?B?RlhSODFid3RjbHBHUmxlaGxIdzE1aVRQUnJDcW5uaUkveFBINFlWdWFsb2VO?=
 =?utf-8?B?Y0tFU3k5M0o4SWxwTlYwQ1dWSkRaVXdnSEJGdWI2RmhEN3VBTUpCbkZuY0k0?=
 =?utf-8?B?NHdQNUpucnIvcDdJbjIzQ1pNOFZmNjhWZDF3N0RFNEg4c2t1bWZPR3NqZXVp?=
 =?utf-8?B?Y0ZzZHhwT0pPamRkYWoreE93cTZrb0xacXkrUXBwNkdGelo2ZGZZOHdCN3VH?=
 =?utf-8?B?bFMwVGRzK2JKcHpJazBqdWRUeTl2QXFRcjdFTHY0Tk90R0FNS2duZkYrZFNa?=
 =?utf-8?B?ai8xMzJ0M2xoK21BRE5wVURvQjlrRWxTYWxHTUFEK0JMZitCSU92aEZYQzhE?=
 =?utf-8?B?elB2bGY4b0J0SnJMREd6SDM3Z0M4RGh6NWhaZXBKc0dqa1lCTWNmc2FiZVlj?=
 =?utf-8?B?N3dvUWNsYm40dnI1WmVuZ0pWQkZQSy9sNHUzbVZrVlYxLy9iOGVsUlg3WjJS?=
 =?utf-8?B?ZkE2UW15bzBDVlVNamVXVW9SM29OajBRb0pLejJTbEMySVFqbWxpVktKMUh3?=
 =?utf-8?B?MWFseFBVNjZBZld4QTE1dERGazAyNDYwQmcxTDRSajVOd1kwVVlqOFRyaDNa?=
 =?utf-8?B?bi9ubDE1czlTWWQ4c1pZNTZtMHhaQWtPRC9nckJ5OFRNZEJjQXo5ZFowWkMw?=
 =?utf-8?B?V1pTN0pOYzNpVDQ0SHlxT085ZlM5bHNOZlNzS0llMHBNTHBqYlBWdkpwYjlN?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 280cfbbb-65f7-4af6-7871-08dd0a52216f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 17:30:02.4261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: coyQWygWjOz2yGB5TLrl+2w/ff3fGQJzbKaEyOgZF9EOhPFP09NGc183IrtOm9oIyHDD1URqGkDY6VP77+NkGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7894
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

Hi Santosh,

Please fix the subject.Subject should be in imperative mood.

Something like "Add subtests to validate async flips on atomic path"

On 21-11-2024 05:24 pm, Santhosh Reddy Guddati wrote:
> subtest to validate async flips with atomic commit
>
> v2: refactor repeated code to function (Karthik).
> explicitly set atomic_path to false in legacy tests (Karthik).
>
> v3: fix test_crc and test_invalid subtests.
>
> v4: Add note for invalid_test for not using perform_flip (Karthik).
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_async_flips.c | 173 ++++++++++++++++++++++++++++++++++------
>   1 file changed, 147 insertions(+), 26 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 5dec71291..6e00be3de 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -67,6 +67,26 @@
>    * SUBTEST: invalid-async-flip
>    * Description: Negative case to verify if changes in fb are rejected from kernel as expected
>    *
> + * SUBTEST: alternate-sync-async-flip-atomic
> + * Description: Verify the async flip functionality and the fps during async flips using atomic path
> + *
> + * SUBTEST: async-flip-with-page-flip-events-atomic
> + * Description: Wait for page flip events in between successive asynchronous flips using atomic path
> + *
> + * SUBTEST: test-time-stamp-atomic
> + * Description: Verify that the async flip timestamp does not coincide with either previous
> + *              or next vblank when async flip is done using atomic path
> + *
> + * SUBTEST: test-cursor-atomic
> + * Description: Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip with atomic commit
> + *
> + * SUBTEST: invalid-async-flip-atomic
> + * Description: Negative case to verify if changes in fb are rejected from kernel
> + *              as expected when async flip is done using atomic path
> + *
> + * SUBTEST: crc-atomic
> + * Description: Use CRC to verify async flip scans out the correct framebuffer with atomic commit
> + *
>    * SUBTEST: async-flip-suspend-resume
>    * Description: Verify the async flip functionality with suspend and resume cycle
>    */
> @@ -105,6 +125,7 @@ typedef struct {
>   	bool suspend_resume;
>   	bool allow_fail;
>   	struct buf_ops *bops;
> +	bool atomic_path;
>   } data_t;
>   
>   static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
> @@ -259,6 +280,21 @@ static bool async_flip_needs_extra_frame(data_t *data)
>   	return intel_display_ver(devid) >= 9 || IS_BROADWELL(devid);
>   }
>   
> +static int perform_flip(data_t *data, int frame, int flags)
> +{
> +	int ret;
> +
> +	if (!data->atomic_path) {
> +		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
> +				      data->bufs[frame % NUM_FBS].fb_id, flags, data);
> +	} else {
> +		igt_plane_set_fb(data->plane, &data->bufs[frame % NUM_FBS]);
> +		ret = igt_display_try_commit_atomic(&data->display, flags, data);
> +	}
> +
> +	return ret;
> +}
> +
>   static void test_async_flip(data_t *data)
>   {
>   	int ret, frame;
> @@ -276,9 +312,7 @@ static void test_async_flip(data_t *data)
>   		if (data->alternate_sync_async) {
>   			flags &= ~DRM_MODE_PAGE_FLIP_ASYNC;
>   
> -			ret = drmModePageFlip(data->drm_fd, data->crtc_id,
> -					      data->bufs[frame % NUM_FBS].fb_id,
> -					      flags, data);
> +			ret = perform_flip(data, frame, flags);
>   
>   			igt_assert_eq(ret, 0);
>   
> @@ -287,19 +321,16 @@ static void test_async_flip(data_t *data)
>   			flags |= DRM_MODE_PAGE_FLIP_ASYNC;
>   
>   			if (async_flip_needs_extra_frame(data)) {
> -				ret = drmModePageFlip(data->drm_fd, data->crtc_id,
> -						      data->bufs[frame % NUM_FBS].fb_id,
> -						      flags, data);
>   
> +				ret = perform_flip(data, frame, flags);
>   				igt_assert_eq(ret, 0);
>   
>   				wait_flip_event(data);
>   			}
>   		}
>   
> -		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
> -				      data->bufs[frame % NUM_FBS].fb_id,
> -				      flags, data);
> +		ret = perform_flip(data, frame, flags);
> +
>   		if (frame == 1 && data->allow_fail)
>   			igt_skip_on(ret == -EINVAL);
>   		else
> @@ -428,9 +459,7 @@ static void test_cursor(data_t *data)
>   
>   	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_CURSOR, &cur);
>   
> -	ret = drmModePageFlip(data->drm_fd, data->crtc_id,
> -			      data->bufs[0].fb_id,
> -			      flags, data);
> +	ret = perform_flip(data, 0, flags);
>   
>   	igt_assert_eq(ret, 0);
>   
> @@ -450,6 +479,7 @@ static void test_invalid(data_t *data)
>   	int ret, width, height;
>   	struct igt_fb fb[2];
>   	drmModeModeInfo *mode;
> +	int flags;
>   
>   	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
> @@ -457,6 +487,8 @@ static void test_invalid(data_t *data)
>   	width = mode->hdisplay;
>   	height = mode->vdisplay;
>   
> +	flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
> +
>   	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
>   		      I915_FORMAT_MOD_X_TILED, &fb[0]);
>   	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
> @@ -465,16 +497,30 @@ static void test_invalid(data_t *data)
>   	igt_plane_set_fb(data->plane, &fb[0]);
>   	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
> -	/* first async flip is expected to allow modifier changes */
> -	ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[1].fb_id,
> -			      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
> -	igt_assert_eq(ret, 0);
> -	wait_flip_event(data);
> +	/* Note: Not using perform_flips here as this subtest passes
> +	 * the fb_id parameter differently.
> +	 */
> +	if (!data->atomic_path) {
> +		/* first async flip is expected to allow modifier changes */
> +		ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[1].fb_id, flags, data);
> +		igt_assert_eq(ret, 0);
>   
> -	/* subsequent async flips should reject modifier changes */
> -	ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[0].fb_id,
> -			      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
> -	igt_assert(ret == -EINVAL);
> +		wait_flip_event(data);
> +
> +		/* subsequent async flips should reject modifier changes */
> +		ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[0].fb_id, flags, data);
> +		igt_assert(ret == -EINVAL);
> +	} else {
> +		igt_plane_set_fb(data->plane, &fb[1]);
> +		ret = igt_display_try_commit_atomic(&data->display, flags, data);
> +		igt_assert_eq(ret, 0);
> +
> +		wait_flip_event(data);
> +
> +		igt_plane_set_fb(data->plane, &fb[0]);
> +		ret = igt_display_try_commit_atomic(&data->display, flags, data);
> +		igt_assert(ret == -EINVAL);
> +	}
>   
>   	/* TODO: Add verification for changes in stride, pixel format */
>   
> @@ -588,6 +634,8 @@ static void test_crc(data_t *data)
>   	int ret, width, height;
>   	drmModeModeInfoPtr mode;
>   
> +	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +
>   	/* make things faster by using a smallish mode */
>   	mode = &data->output->config.connector->modes[0];
>   	width = mode->hdisplay;
> @@ -620,8 +668,9 @@ static void test_crc(data_t *data)
>   		paint_fb(data, &data->bufs[frame], 1, height, 0xff0000ff);
>   
>   		data->flip_pending = true;
> -		ret = drmModePageFlip(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id,
> -				      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
> +
> +		ret = perform_flip(data, frame, DRM_MODE_PAGE_FLIP_ASYNC |
> +				   DRM_MODE_PAGE_FLIP_EVENT);
>   		igt_assert_eq(ret, 0);
>   
>   		wait_events_crc(data);
> @@ -708,6 +757,18 @@ igt_main
>   		igt_describe("Wait for page flip events in between successive asynchronous flips");
>   		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
>   			data.alternate_sync_async = false;
> +			data.atomic_path = false;
> +			if (is_intel_device(data.drm_fd))
> +				run_test_with_modifiers(&data, test_async_flip);
> +			else
> +				run_test(&data, test_async_flip);
> +		}
> +
> +		igt_describe("Wait for page flip events in between successive "
> +			     "asynchronous flips using atomic path");
> +		igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic") {
> +			data.alternate_sync_async = false;
> +			data.atomic_path = true;
>   			if (is_intel_device(data.drm_fd))
>   				run_test_with_modifiers(&data, test_async_flip);
>   			else
> @@ -717,12 +778,30 @@ igt_main
>   		igt_describe("Alternate between sync and async flips");
>   		igt_subtest_with_dynamic("alternate-sync-async-flip") {
>   			data.alternate_sync_async = true;
> +			data.atomic_path = false;
> +			run_test(&data, test_async_flip);
> +		}
> +
> +		igt_describe("Alternate between sync and async flips using atomic path");
> +		igt_subtest_with_dynamic("alternate-sync-async-flip-atomic") {
> +			data.alternate_sync_async = true;
> +			data.atomic_path = true;
>   			run_test(&data, test_async_flip);
>   		}
>   
> -		igt_describe("Verify that the async flip timestamp does not coincide with either previous or next vblank");
> -		igt_subtest_with_dynamic("test-time-stamp")
> +		igt_describe("Verify that the async flip timestamp does not "
> +			     "coincide with either previous or next vblank");
> +		igt_subtest_with_dynamic("test-time-stamp") {
> +			data.atomic_path = false;
>   			run_test(&data, test_timestamp);
> +		}
> +
> +		igt_describe("Verify that the async flip timestamp does not coincide "
> +			     "with either previous or next vblank with atomic path");
> +		igt_subtest_with_dynamic("test-time-stamp-atomic") {
> +			data.atomic_path = true;
> +			run_test(&data, test_timestamp);
> +		}
>   	}
>   
>   	igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip");
> @@ -733,9 +812,25 @@ igt_main
>   		 * supported in cursor plane.
>   		 */
>   		igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_fd, NULL),
> -			      "PSR2 sel fetch causes cursor to be added to primary plane " \
> +			      "PSR2 sel fetch causes cursor to be added to primary plane "
>   			      "pages flips and async flip is not supported in cursor\n");
>   
> +		data.atomic_path = false;
> +		run_test(&data, test_cursor);
> +	}
> +
> +	igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after "
> +		     "async flip with atomic commit");
> +	igt_subtest_with_dynamic("test-cursor-atomic") {
> +		/*
> +		 * Intel's PSR2 selective fetch adds other planes to state when
> +		 * necessary, causing the async flip to fail because async flip is not
> +		 * supported in cursor plane.
> +		 */
> +		igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_fd, NULL),
> +			      "PSR2 sel fetch causes cursor to be added to primary plane "
> +			      "pages flips and async flip is not supported in cursor\n");
> +		data.atomic_path = true;
>   		run_test(&data, test_cursor);
>   	}
>   
> @@ -748,6 +843,21 @@ igt_main
>   		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
>   						       I915_FORMAT_MOD_Y_TILED));
>   
> +		data.atomic_path = false;
> +		run_test(&data, test_invalid);
> +	}
> +
> +	igt_describe("Negative case to verify if changes in fb are rejected "
> +		     "from kernel as expected when async flip is done using atomic path");
> +	igt_subtest_with_dynamic("invalid-async-flip-atomic") {
> +		data.atomic_path = true;
> +		/* TODO: support more vendors */
> +		igt_require(is_intel_device(data.drm_fd));
> +		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
> +						       I915_FORMAT_MOD_X_TILED));
> +		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
> +						       I915_FORMAT_MOD_Y_TILED));
> +
>   		run_test(&data, test_invalid);
>   	}
>   
> @@ -756,6 +866,17 @@ igt_main
>   		/* Devices without CRC can't run this test */
>   		igt_require_pipe_crc(data.drm_fd);
>   
> +		data.atomic_path = false;
> +		run_test(&data, test_crc);
> +	}
> +
> +	igt_describe("Use CRC to verify async flip scans out the correct framebuffer "
> +		     "with atomic commit");
> +	igt_subtest_with_dynamic("crc-atomic") {
> +		/* Devices without CRC can't run this test */
> +		igt_require_pipe_crc(data.drm_fd);
> +
> +		data.atomic_path = true;
>   		run_test(&data, test_crc);
>   	}
>   
