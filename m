Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D811C3271E
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jul 2024 03:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD23810E012;
	Mon,  8 Jul 2024 03:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lSHkjODh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E0810E012
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jul 2024 03:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720410067; x=1751946067;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ONBlL3Q0XMQvF3RPuwvsmCtoNJnCILl6WOfCPVIrBJs=;
 b=lSHkjODhBtOWVF1bLDVa4SeKmVuN2pbbdnv5VOGfd0ET5SysjFYGlFve
 dHUmnxCeWeq4lC3utA7kBtFVer23BYHVZANOvz2JQZEUVsWhINwaS/1A4
 lijcNrb06VCgX919XYVRbNJXYY9FykKFhzfoFEBhqDx6P4JfViV+iATm5
 LWZBOoAIB1JLT69pSr8+WhN3KxpjDfgMYdYgTHN5oUzAgQXxn8bbkaDQ9
 NAV54oFkPaU/swtjVb46K+dEfKQtnMF1h2k7m0q2aeoa7efPOuw0AOMuz
 v53l1v71wYHfQv4Mc+a2yIXmREkvRXRxdj5hYQAU94P1S0KTwW7afBqF1 g==;
X-CSE-ConnectionGUID: liRdylKsR/G28LfLeKDhqA==
X-CSE-MsgGUID: BiHqv8QQRWWt+8sZpjPB4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17726327"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="17726327"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2024 20:41:00 -0700
X-CSE-ConnectionGUID: oBwuv8GxSiKcONR+ISd4Ow==
X-CSE-MsgGUID: Ks7dN42YQaaGCZu2jbkZmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="48108462"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jul 2024 20:41:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 7 Jul 2024 20:40:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 7 Jul 2024 20:40:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 7 Jul 2024 20:40:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvnWIv0tNApcUlk2vjb1St4woXjUX3Gz6SRGQWBoYA9/TEz5z2JbcWY1JuUBmaNT8hcrc6/e28zhgeU5I/5o54b+qJvq0DH3ea4YCUKVmWoelKAm2eF77i8jKBIpowXmDE05trLJwPoJrt/0p8UX7jMBrDsJTF8Dh8xcnMIsjVt56YeU8ZXUbf1ectazAFIGsAKAzIQPfcYPkmWvaAAxOL9fcJnA9CJyIlFkrPfYPURMQl6UNe5lqEnSjZSOti6FP05Y7cAET8AIg/fHWGPhZqH7epoIZPuPLA0vt2I7K1lzh4REAsjoMf/gjCHOp+lNaaCb2PUUodZMgnIlEjn5zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Me9YuGJfKElMXD/fedZbdkk8K9j/cE+VhOFXQ0MMsz4=;
 b=L4zxAQkFxcPv/qyV8J11gkiL6HcLIi/+QgqjBgjQ68f2CjCsaIFV/RIelIBdqvbqFylSvtAowhuQWq2wZ2EAg1ghkVsCMQ6YZ1Gjdqv6VSjvoN3HvL5BrcgcUcRKl7KLC1A54Ui+u5hJEoBRItnQc6U8C15jxeRC31lEZoiecoRHqwL04kRu5uRNqHPgr/LS2cg0Z/JElUbhL2HJ0YMYcj2E4bcOr6+UCaspXUxXV0Qi4TXGuq85GsxP61Kk1OeXy5Va3PUUBcril6HGqntR9XzFsHXPYXCfQW2btpOC/SfSkA751XHDisuxVcHpP/QRHHEACGYQ/Gmd79wA3x2MWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB6548.namprd11.prod.outlook.com (2603:10b6:510:210::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 03:40:56 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%6]) with mapi id 15.20.7741.029; Mon, 8 Jul 2024
 03:40:56 +0000
Message-ID: <a9c5680a-7176-4364-b58d-bc99a4467efa@intel.com>
Date: Mon, 8 Jul 2024 09:10:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] tests/kms_sharpness_filter: Add adaptive sharpness
 filter test
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Swati Sharma <swati2.sharma@intel.com>
References: <20230328092838.147903-1-mohammed.thasleem@intel.com>
 <20230328092838.147903-3-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20230328092838.147903-3-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::8) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH7PR11MB6548:EE_
X-MS-Office365-Filtering-Correlation-Id: ba41a6dd-6790-4ab7-8980-08dc9effc5f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3MxZHJTeDM1NGsxNm55cGpTRmdsaEZMZEc1R2VteG9ZUTErSG9PcHdEK25a?=
 =?utf-8?B?MXMzR0NnSmZQeTJleHpibW50c25jb2dRdFlxZ0ZFQnVkamVqL21HdzBXU0Nv?=
 =?utf-8?B?bHlLSU55akpjNkY0elEyRGpyYytzRUhaSEN0UkVVcitTMEVhVmdBcVZXY1FI?=
 =?utf-8?B?cm96TU9tTnUzQUQ5bXJXdEV6VnpwVmNVTXdHYWFiaGM5VS9XVHVBV1Q0ZFVS?=
 =?utf-8?B?bDlYb3Fmb1R2SUNmdERsa0Z4bUVyUDlwTXZwZ3BnTm5ieDFGQ2c3b2dKeG9m?=
 =?utf-8?B?Wk1iUGszb3VhK0hTZFlTQ0tOai8rREI2SityTms0OEhHR25BVFRzS2xWV0hM?=
 =?utf-8?B?dEwydHRDdWdDZWU4cmJlUkJFNTFEMFNmQUVKbDlQL0M3LzdYRVYvbkg5QVc4?=
 =?utf-8?B?alhiQkRNU0p4aHJJc0pDTXN1cjZqOGduU2xkYStTVXgzZkZtVFZESVh3cm1x?=
 =?utf-8?B?VHVwY1JqbDRVQk84UDBvZEtSaktPcVpPd09MQkdsOUlMNWRSRzJBZ2JxazdR?=
 =?utf-8?B?MVBJbTAraXQzWGpXYlRMcDJpM3YrQXJqQXJrY2xVUS8xOXVoQUhIWnc2MmNH?=
 =?utf-8?B?cElzK0kzSVltc3NlWlZINVFzOFhlQ2did2tZMEZhZVVrcklHRHAxSDBZZXE4?=
 =?utf-8?B?Y2xuV3FYcU81V1VTUVU0bU5CUTl3cTRyelg4SERmVENTRHFGWUhwL1NKb3dC?=
 =?utf-8?B?NVVNTEdPQ1N0VE9SMzRYaDZqWVVCSFhRK1ZXeUNWdXlTYXdVajNQUUo4QWNB?=
 =?utf-8?B?N1czMTA5ZHJGU2ZVam1TQ1Eyb3VEVzgrd1habGNOYXg0Ty9iMDJKekk1cUMy?=
 =?utf-8?B?bnl5WGhCYi82M2cwWWFab05SRGpRSkVGQjNzTnpnT0R6UmVCWktvUDkza0xP?=
 =?utf-8?B?K2hqR0VhTi9KVkJlR0VJU2pLVWRVYWU3T2IySFpPcEJjd25NOFlTTzMwRzM2?=
 =?utf-8?B?RGs1T050VnlBMm4rTTg4c0JVYTBucm1kaFJ3c0NUQTIveTJmejZwVW5PU3NY?=
 =?utf-8?B?SitoMG4vV0dBcUtua1ZqQkFPcWRaU3R2SFAxcCtKT2ZmQlVOYXhyMFZJdEpo?=
 =?utf-8?B?cnBLWmh1NG1GclAwZFdpMGMzR1JIczdES3dVUS9uVGdKdlJYajFRb0hYVVgy?=
 =?utf-8?B?V3VFelFrU0F2QTdjQzlManhGR0Y1QkVkQzNvOG9YbEJaUm45eFlVeTROdUxq?=
 =?utf-8?B?UG11R0FOdUxrZUpZUEZMYzBybk03UTU0UmdNS2pGOWR5OHY3RFVmUXBBU3ox?=
 =?utf-8?B?eFUwQWJwbTRwTnpOK3dlSlpXMlhTNFVaaXZlUTNXUDdMNlFEUUZGY0ZIeExE?=
 =?utf-8?B?S0dJNkQ0VlU0NGJJYkkzbVcvU2ZiSnBaUDZDMGdtbXBkMUI4eGxJZEdOeVVz?=
 =?utf-8?B?NllTVXAvcXN0ZEdSSjVkdmNaQUFhby9EV1phdlNIZUNXSFl4MTg5S0xTb2NE?=
 =?utf-8?B?SWp3UXNBNzZnVXJDTm9Dc2tSNTRCL2xQeThaQk0rUTZINVNpQWNSUzQwU0h5?=
 =?utf-8?B?Ukg3bjVtT1ZPZW12YUNOeHJpRWJzTU5vSE90aG8wOUpIOWxtSmNrVUh5M0l4?=
 =?utf-8?B?c05QUTZ2b1k2YXVMOGdubjZSLzdYSEROU2dFRWI5QmRGekRwejVzajNxN050?=
 =?utf-8?B?T0FzUFV3OVY0TGYyRkJEM2hXS0g5NyttWmRyWktsYThiQmRONWVmVHZ1cE5S?=
 =?utf-8?B?aFhZc0YzOG5BVXZvblU2SUNsTVFncHVHQ1JGUERnTjRTZGgvaGpuVk5DenB3?=
 =?utf-8?B?Tit1ZGlZTUNxbFZwV1VNL1lvWEVXeDJldUhMVWYwOVkybm5JMlRZcG9palcv?=
 =?utf-8?B?WWU5aWVyUDkvakp4Y1F2UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEwxWlowSFdSSUxOa0F6Z0sydkFta2t6Y2praXVpbjk3WG8veFJkM0hxWExt?=
 =?utf-8?B?eS9uSi8zeFpWYWEyYTh5QVVydFpjRWI2RGplL3JMSkI2ZEp3a1RzQVE0Q2Fo?=
 =?utf-8?B?M0tkbzd1SDRsaDhDeXJhSXM0eXEwaVRsaXMxNElieUtoaEhHZXp4TCt5Tkpi?=
 =?utf-8?B?TnNLQU9wNDE0bVYwMnRQSUlxRjVJQzJ4VWxFY29uSEJCRDljOUxYRU82M2xB?=
 =?utf-8?B?NlZiUWVHcHNabE9WSEZJT1VMTlVxbFIrcmFIMERwdmFDZDgxM0tyNVl5RVJk?=
 =?utf-8?B?VVd0bGZxcHJaUXFHYUk2L2dyVEJlNVMrbVk5bndiVmMrTVNQNkJ6NC94Rmpz?=
 =?utf-8?B?M1dYUWxYeVBvRHN1eWN0cVVmdTdKeGV1R3JtZ2tjMHRzaTQycForRWduNGg4?=
 =?utf-8?B?MjJzM29zOEhKeHJKOVp1VGxrbTBHNkcySmJMbjJ6TE1Lb1E4a3NyQlZCM0Ft?=
 =?utf-8?B?aFRKREpzQTNVd3NsZWxpZGlLNDdjelFMdGRnMXc5UjR2WU1tY2RrV1BqMVh1?=
 =?utf-8?B?aW0xWFErUXRSd0p1ZU8rZ2o2QUsrcllGUXMrZTMyaUt2T091dzl6Z2dmVWdL?=
 =?utf-8?B?ZVV6bnlEZGpKaGI3Smh1eFBGTXZtT21ucGloOTRuRW56dTYrMzd6ODdBb2Rm?=
 =?utf-8?B?THJtM2M5OWdtNzh4TW9LMmtBSkdDNnc2RWRWM3pzaGlDY3lDMk9qRzUwQ2p3?=
 =?utf-8?B?bGc0cktFT1RCS2J2S2lwak9sSTJBSUtIWFVJbnk5RUNoVGx6WXJOODhpYXdr?=
 =?utf-8?B?Y0xtRFZhQmhsRVVDTUIvS2J6emlmNFpZRzYwS0J2OWFJeUxWWjdaVERlczdM?=
 =?utf-8?B?Rno0c0ViQVhWbmYzeEVTQmZDOWdPckNuUHc2SHZ3TkRtR3pFZE9NNEtzbkRx?=
 =?utf-8?B?V0JOemFIU1ZEL1V5TDFGK2hZYjVvS2NXa2dBT3hLaHdkYytML2hhdDZjM3k5?=
 =?utf-8?B?amFWR1ZGdUV6RENZMWxnS2pzb1dydTlTRnNXSXdNY0J2RForbml2eE9kajlM?=
 =?utf-8?B?eUhXZ3dTeHpnUmN3UkhZcnZIQ2lJU3ZPQ2VBS25LQWxVcGNxRldQRnpzcnNn?=
 =?utf-8?B?alNzWGptdUhVYUxCOUNvaHlsdFZNRU5rZHN4Nmw3ZW5BWjFIalo1blVLZlJE?=
 =?utf-8?B?Z1JQVWxGODNLRDZ2Y0cyc0gxUDJLTXprbFRyMzYzaE9oME1iem1uYktkbklx?=
 =?utf-8?B?MzZLbHhWNWZYSHd0V1JTMGREUkZ6WlREN0ljUjNKVVd1eEFtdytuTERtZ2R0?=
 =?utf-8?B?MFhMZTJkTlduSktYQmJ2UUZTdzZTTTFlUlJJMVZlRlNPdHlZbE5EcHdrNmRC?=
 =?utf-8?B?MmdDZm5uTDV0eGVrOFBEcFFHV0lielI0K0ZsWUwvYUVkSEJnb0dFVCs1alJv?=
 =?utf-8?B?dko5ZGxLZjFxTUl6RjFHZmVNVkdkVVMwUk1jeXZURy9wSGhUV2pvb2UxYkJJ?=
 =?utf-8?B?THNxOXhFbjg4ZGNmLzkwSU8wYkNqV1daWW12VTZVaHl2cndZb0JUU1hDeHFD?=
 =?utf-8?B?Z3BBc1lsMm4zN2MzWk1xTXh3QkNlVEtwZG9qVTZrYXpDc2xWNGRIY2toMGp5?=
 =?utf-8?B?eEhTMkovNVptS1JoR1ErQi8zeUd6QWhJUlVwSysvMW9TSlVIUHVkWm5MNjYv?=
 =?utf-8?B?QVZkckhwNXFxbkZZbnB5RDJlTm9MQ0p3c2xjQWdhSm9UWEg0L2F6c0NFQnBi?=
 =?utf-8?B?SWIyYzhmOWlVZUk2YVNGMHA3elM3cFdBTU1pbFR0NmJzRjdpR3pQZ25HYnRJ?=
 =?utf-8?B?MGFEVzV2eTFueEY0b1ljMFpnY1JReUxPbFJNamRwTHU5ZVRjQXNGeXo5OXNH?=
 =?utf-8?B?Sm10bWE4SmtRTWZMQklyNDZkSWJMRWUzM01aWjRLT3daVjNUbmdLaXpZVlBk?=
 =?utf-8?B?WCt3NE9vRFk2MXk4VFBhcG1JNGRYYmRadmQ4eUtlbC9SQVQvS1A2K1U2YklX?=
 =?utf-8?B?SDVxa2JNeHhPZTc2VlNxVlY4cEd5MWtDRTBUWTkrN0tvOVJtdG9teStWWlRC?=
 =?utf-8?B?S2xwaDJtM0k3RW5GbU1nSnRIU0FWMzlFUXJCQ2lySnRqY2RBZTV1QmNpYlE4?=
 =?utf-8?B?dXo2eWFWM0EwUXRnM2M5RDBqZnMvWUR5SGowQzdESmwzdUZjajZCVFQ5c3lz?=
 =?utf-8?B?NTE5Qk1BVWovK2NFRFhmTjdBRng3WU1PZ1FoQ2VHaUk2Y2NWVHZxVkxmSHU2?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba41a6dd-6790-4ab7-8980-08dc9effc5f1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 03:40:56.0529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VGDB474Xr3c5SspdRpgsxMKG2+aEBuG/q20CMp9mScvGIDEngxrs+wC/sl9QyNpdnaB8UtN1XnpwCI8eA4egtQQb/eYamUsIwiPi9pGRzAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6548
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


On 3/28/2023 2:58 PM, Mohammed Thasleem wrote:
> From: Swati Sharma <swati2.sharma@intel.com>
>
> New test is added to validate adaptive sharpness filter on
> LNL platform. Various testcases are added to validate this
> feature. These are non CRC based tests and manual verification
> is required.
>
> Pipe scaler is repurposed to perform a portion of this work.
> This means pipe scaling will be unavailable while the sharpening
> function is being used. The other scaler can be used for plane
> scaler.
>
> 14 subtests are added:
> 	-basic: verify basic functionality
> 	-toggle: switch between enable and disable
> 	-tap: verify different taps selected based on resolution
> 	-modifiers: verify casf with different modifiers
> 	-rotation: verify casf with different rotation
> 	-formats: verify casf with different formats
> 	-dpms: verify casf with dpms
> 	-suspend: verify casf with suspend
> 	-upscale: apply plane scaler and casf together
> 	-downscale: apply plane scaler and casf together
> 	-strength: vary strength and check difference in sharpness
> 	-invalid filter with scaler: enable scaler on 2 planes and attempt
> 				     is made to enable casf
> 	-invalid filter with plane: enable 2 NV12 planes and attempt
> 				    is made to enable casf
> 	-invalid plane with filter: enable 1 NV12 plane and casf and attempt
> 				    is made to enable 2nd NV12 plane
>
> TODO: -Enable casf with pipe scaler enabled
>        -Enable casf with varying output formats (YCBCR/RGB)
>
> v2: Update modifier type to uint64_t.
>      Replace IGT_CRTC_SHARPENESS_STRENGTH with IGT_CRTC_SHARPNESS_STRENGTH.
> v3: Update setup_fb with height and width.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/intel/kms_sharpness_filter.c | 668 +++++++++++++++++++++++++++++
>   tests/meson.build                  |   1 +
>   2 files changed, 669 insertions(+)
>   create mode 100644 tests/intel/kms_sharpness_filter.c
>
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
> new file mode 100644
> index 000000000..d592e9a2d
> --- /dev/null
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -0,0 +1,668 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include "igt.h"
> +#include "igt_kms.h"
> +
> +#define TAP_3				3
> +#define TAP_5				5
> +#define TAP_7				7
> +#define DISABLE_FILTER			0
> +#define MIN_FILTER_STRENGTH		1
> +#define MID_FILTER_STRENGTH		128
> +#define MAX_FILTER_STRENGTH		255
> +#define HDISPLAY_4K			3840
> +#define VDISPLAY_4K			2160
> +#define HDISPLAY_FHD			1920
> +#define VDISPLAY_FHD			1080
> +#define NROUNDS				10
> +
> +/**
> + * TEST: kms sharpness filter
> + * Category: Display
> + * Description: Test to validate content adaptive sharpness filter
> + * Driver requirement: xe
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + * Functionality: casf
> + *
> + * SUBTEST: filter-basic
> + * Description: Verify basic content adaptive sharpness filter.
> + *
> + * SUBTEST: filter-tap
> + * Description: Verify that following a resolution change, distict taps are selected.
> + *
> + * SUBTEST: filter-strength
> + * Description: Verify that varying strength (0-255), affects the degree of sharpeness applied.
> + *
> + * SUBTEST: filter-toggle
> + * Description: Verify toggling between enabling and disabling content adaptive sharpness filter.
> + *
> + * SUBTEST: filter-modifiers
> + * Description: Verify content adaptive sharpness filter with varying modifiers.
> + * Functionality: casf, tiling
> + *
> + * SUBTEST: filter-rotations
> + * Description: Verify content adaptive sharpness filter with varying rotations.
> + * Functionality: casf, rotation
> + *
> + * SUBTEST: filter-formats
> + * Description: Verify content adaptive sharpness filter with varying formats.
> + * Functionality: casf, pixel-format
> + *
> + * SUBTEST: filter-dpms
> + * Description: Verify content adaptive sharpness filter with DPMS.
> + * Functionality: casf, dpms
> + *
> + * SUBTEST: filter-suspend
> + * Description: Verify content adaptive sharpness filter with suspend.
> + * Functionality: casf, suspend
> + *
> + * SUBTEST: filter-scaler-upscale
> + * Description: Verify content adaptive sharpness filter with 1 plane scaler enabled.
> + * Functionality: casf, scaling
> + *
> + * SUBTEST: filter-scaler-downscale
> + * Description: Verify content adaptive sharpness filter with 1 plane scaler enabled.
> + * Functionality: casf, scaling
> + *
> + * SUBTEST: invalid-filter-with-scaler
> + * Description: Negative check for content adaptive sharpness filter
> + * 		when 2 plane scalers have already been enabled and
> + * 		attempt is made to enable sharpness filter.
> + * Functionality: casf, scaling
> + *
> + * SUBTEST: invalid-filter-with-plane
> + * Description: Negative check for content adaptive sharpness filter
> + * 		when 2 NV12 planes have already been enabled and attempt is
> + * 		made to enable the sharpness filter.
> + * Functionality: casf, plane
> + *
> + * SUBTEST: invalid-plane-with-filter
> + * Description: Negative check for content adaptive sharpness filter
> + * 		when 1 NV12 plane and sharpness filter have already been enabled
> + * 		and attempt is made to enable the second NV12 plane.
> + * Functionality: casf, plane
> + */

We need tests where pipe scaler is enabled and we try to enable sharpness.

Need to set the scaling_mode property and try to enable sharpness.


> +
> +IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
> +
> +/*
> + * Until the CRC support is added test needs to be invoked with
> + * --interactive|--i to manually verify if "sharpened" image
> + * is seen without corruption for each subtest.
> + */
> +
> +enum test_type {
> +	TEST_FILTER_TAP,
> +	TEST_FILTER_BASIC,
> +	TEST_FILTER_TOGGLE,
> +	TEST_FILTER_MODIFIERS,
> +	TEST_FILTER_ROTATION,
> +	TEST_FILTER_FORMATS,
> +	TEST_FILTER_DPMS,
> +	TEST_FILTER_SUSPEND,
> +	TEST_FILTER_UPSCALE,
> +	TEST_FILTER_DOWNSCALE,
> +	TEST_FILTER_STRENGTH,
> +	TEST_INVALID_FILTER_WITH_SCALER,
> +	TEST_INVALID_FILTER_WITH_PLANE,
> +	TEST_INVALID_PLANE_WITH_FILTER,
> +};
> +
> +const int filter_strength_list[] = {
> +	MIN_FILTER_STRENGTH,
> +	(MIN_FILTER_STRENGTH + MID_FILTER_STRENGTH) / 2,
> +	MID_FILTER_STRENGTH,
> +	(MID_FILTER_STRENGTH + MAX_FILTER_STRENGTH) / 2,
> +	MAX_FILTER_STRENGTH,
> +};
> +const int filter_tap_list[] = {
> +	TAP_3,
> +	TAP_5,
> +	TAP_7,
> +};
> +static const struct {
> +	uint64_t modifier;
> +	const char *name;
> +} modifiers[] = {
> +	{ DRM_FORMAT_MOD_LINEAR, "linear", },
> +	{ I915_FORMAT_MOD_X_TILED, "x-tiled", },
> +	{ I915_FORMAT_MOD_4_TILED, "4-tiled", },
> +};
> +static const int formats[] = {
> +	DRM_FORMAT_NV12,
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_XBGR16161616F,
> +};
> +static const igt_rotation_t rotations[] = {
> +	IGT_ROTATION_0,
> +	IGT_ROTATION_90,
> +	IGT_ROTATION_180,
> +	IGT_ROTATION_270,
> +};
> +
> +typedef struct {
> +	int drm_fd;
> +	bool limited;
> +	enum pipe pipe_id;
> +	struct igt_fb fb[4];
> +	igt_pipe_t *pipe;
> +	igt_display_t display;
> +	igt_output_t *output;
> +	igt_plane_t *plane[4];
> +	drmModeModeInfo *mode;
> +	int filter_strength;
> +	int filter_tap;
> +	uint64_t modifier;
> +	const char *modifier_name;
> +	uint32_t format;
> +	igt_rotation_t rotation;
> +} data_t;
> +
> +static void set_filter_strength_on_pipe(data_t *data)
> +{
> +	igt_pipe_set_prop_value(&data->display, data->pipe_id,
> +				IGT_CRTC_SHARPNESS_STRENGTH,
> +				data->filter_strength);
> +}
> +
> +static drmModeModeInfo *get_mode(igt_output_t *output, int tap)
> +{
> +	drmModeConnector *connector = output->config.connector;
> +	drmModeModeInfo *mode = NULL;
> +
> +	/*
> +	 * TAP 3: mode->hdisplay <= 1920 && mode->vdisplay <= 1080
> +	 * TAP 5: mode->hdisplay > 1920 && mode->vdisplay > 1080
> +	 * TAP 7: mode->hdisplay >= 3840 && mode->vdisplay >= 2160
> +	 */
> +	switch (tap) {
> +	case TAP_3:
> +		for (int i = 0; i < connector->count_modes; i++) {
> +			if (connector->modes[i].hdisplay <= HDISPLAY_FHD &&
> +			    connector->modes[i].vdisplay <= VDISPLAY_FHD) {
> +				mode = &connector->modes[i];
> +				break;
> +			}
> +		}
> +		break;
> +	case TAP_5:
> +		for (int i = 0; i < connector->count_modes; i++) {
> +			if (connector->modes[i].hdisplay > HDISPLAY_FHD &&
> +			    connector->modes[i].hdisplay < HDISPLAY_4K &&
> +			    connector->modes[i].vdisplay > VDISPLAY_FHD &&
> +			    connector->modes[i].vdisplay < VDISPLAY_4K) {
> +				mode = &connector->modes[i];
> +				break;
> +			}
> +		}
> +		break;
> +	case TAP_7:
> +		for (int i = 0; i < connector->count_modes; i++) {
> +			if (connector->modes[i].hdisplay >= HDISPLAY_4K &&
> +			    connector->modes[i].vdisplay >= VDISPLAY_4K) {
> +				mode = &connector->modes[i];
> +				break;
> +			}
> +		}
> +		break;
> +	default:
> +		igt_assert(0);
> +	}
> +
> +	return mode;
> +}
> +
> +static void paint_image(igt_fb_t *fb)
> +{
> +	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
> +	int img_x, img_y, img_w, img_h;
> +	const char *file = "1080p-left.png";
> +
> +	img_x = img_y = 0;
> +	img_w = fb->width;
> +	img_h = fb->height;
> +
> +	igt_paint_image(cr, file, img_x, img_y, img_w, img_h);
> +
> +	igt_put_cairo_ctx(cr);
> +}
> +
> +static void setup_fb(int fd, int width, int height, uint32_t format,
> +		     uint64_t modifier, struct igt_fb *fb)
> +{
> +	int fb_id;
> +
> +	fb_id = igt_create_fb(fd, width, height, format, modifier, fb);
> +	igt_assert(fb_id);
> +
> +	paint_image(fb);
> +}
> +
> +static void cleanup(data_t *data)
> +{
> +	for (int i = 0; i < ARRAY_SIZE(data->fb); i++)
> +		igt_remove_fb(data->drm_fd, &data->fb[i]);
> +
> +	igt_output_set_pipe(data->output, PIPE_NONE);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +static void set_planes(data_t *data, enum test_type type)
> +{
> +	drmModeModeInfo *mode = data->mode;
> +
> +	data->plane[1] = igt_output_get_plane(data->output, 1);
> +	data->plane[2] = igt_output_get_plane(data->output, 2);
> +
> +	if (type == TEST_FILTER_UPSCALE) {
> +		setup_fb(data->drm_fd, 20, 20, data->format, data->modifier, &data->fb[1]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +		igt_plane_set_size(data->plane[1], mode->hdisplay, mode->vdisplay);
> +	}
> +
> +	if (type == TEST_FILTER_DOWNSCALE) {
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +		igt_plane_set_size(data->plane[1], mode->hdisplay * 0.75, mode->vdisplay * 0.75);
> +	}
> +
> +	if (type == TEST_INVALID_FILTER_WITH_SCALER) {
> +		setup_fb(data->drm_fd, 20, 20, data->format, data->modifier, &data->fb[1]);
> +		setup_fb(data->drm_fd, 20, 20, data->format, data->modifier, &data->fb[2]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +		igt_plane_set_fb(data->plane[2], &data->fb[2]);
> +		igt_plane_set_size(data->plane[1], mode->hdisplay, mode->vdisplay);
> +		igt_plane_set_size(data->plane[2], mode->hdisplay, mode->vdisplay);
> +	}
> +
> +	if (type == TEST_INVALID_FILTER_WITH_PLANE) {
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[2]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +		igt_plane_set_fb(data->plane[2], &data->fb[2]);
> +	}
> +
> +	if (type == TEST_INVALID_PLANE_WITH_FILTER) {
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
> +		igt_plane_set_fb(data->plane[1], &data->fb[1]);
> +	}
> +}
> +
> +static void test_sharpness_filter(data_t *data,  enum test_type type)
> +{
> +	igt_output_t *output = data->output;
> +	drmModeModeInfo *mode = data->mode;
> +	int ret;
> +	int height = mode->hdisplay;
> +	int width =  mode->vdisplay;
> +
> +	igt_display_reset(&data->display);
> +	igt_output_set_pipe(output, data->pipe_id);
> +
> +	if (type == TEST_FILTER_TAP) {
> +		mode = get_mode(output, data->filter_tap);
> +		igt_require(mode != NULL);
> +		igt_output_override_mode(output, mode);
> +	}
> +
> +	data->plane[0] = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
> +	igt_skip_on_f(!igt_plane_has_format_mod(data->plane[0], data->format, data->modifier),
> +		      "No requested format/modifier on pipe %s\n", kmstest_pipe_name(data->pipe_id));
> +
> +	setup_fb(data->drm_fd, height, width, data->format, data->modifier, &data->fb[0]);
> +	igt_plane_set_fb(data->plane[0], &data->fb[0]);
> +
> +	if (igt_plane_has_rotation(data->plane[0], data->rotation))
> +		igt_plane_set_rotation(data->plane[0], data->rotation);
> +	else
> +		igt_skip("No requested rotation on pipe %s\n", kmstest_pipe_name(data->pipe_id));
> +
> +	if (type == TEST_FILTER_UPSCALE  ||
> +	    type == TEST_FILTER_DOWNSCALE ||
> +            type == TEST_INVALID_FILTER_WITH_SCALER ||
> +            type == TEST_INVALID_FILTER_WITH_PLANE) {

formatting looks off here.


> +		set_planes(data, type);
> +	}
> +
> +	/* Set filter strength property */
> +	set_filter_strength_on_pipe(data);
> +	igt_debug("Sharpened image should be observed for filter strength > 0\n");

This message should not be displayed for negative test.

Also for the case where we toggle sharpness, we do not expect for 
sharpened image.


Regards,

Ankit




> +	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	if (type == TEST_FILTER_DPMS) {
> +		kmstest_set_connector_dpms(data->drm_fd,
> +					   output->config.connector,
> +					   DRM_MODE_DPMS_OFF);
> +		kmstest_set_connector_dpms(data->drm_fd,
> +					   output->config.connector,
> +					   DRM_MODE_DPMS_ON);
> +	}
> +
> +	if (type == TEST_FILTER_SUSPEND)
> +		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +					      SUSPEND_TEST_NONE);
> +
> +	if (type == TEST_INVALID_PLANE_WITH_FILTER) {
> +		data->plane[3] = igt_output_get_plane(data->output, 3);
> +		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[3]);
> +		igt_plane_set_fb(data->plane[3], &data->fb[3]);
> +
> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +	}
> +
> +	if (type == TEST_INVALID_FILTER_WITH_SCALER ||
> +	    type == TEST_INVALID_FILTER_WITH_PLANE ||
> +	    type == TEST_INVALID_PLANE_WITH_FILTER) {
> +		igt_assert_eq(ret, -EINVAL);
> +		return;
> +	} else {
> +		igt_assert_eq(ret, 0);
> +	}
> +
> +	cleanup(data);
> +}
> +
> +static bool has_sharpness_filter(igt_pipe_t *pipe)
> +{
> +	return igt_pipe_obj_has_prop(pipe, IGT_CRTC_SHARPNESS_STRENGTH);
> +}
> +
> +static void
> +run_sharpness_filter_test(data_t *data, enum test_type type)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_output_t *output;
> +	enum pipe pipe;
> +	char name[40];
> +
> +	for_each_pipe_with_valid_output(display, pipe, output) {
> +		data->output = output;
> +		data->pipe_id = pipe;
> +		data->pipe = &display->pipes[data->pipe_id];
> +		data->mode = igt_output_get_mode(data->output);
> +
> +		if (!has_sharpness_filter(data->pipe))
> +			continue;
> +
> +		igt_output_set_pipe(output, pipe);
> +
> +		if (!intel_pipe_output_combo_valid(display)) {
> +			igt_output_set_pipe(output, PIPE_NONE);
> +			continue;
> +		}
> +
> +		switch (type) {
> +		case TEST_FILTER_BASIC:
> +			snprintf(name, sizeof(name), "-basic");
> +			break;
> +		case TEST_FILTER_TAP:
> +			snprintf(name, sizeof(name), "-tap-%d", data->filter_tap);
> +			break;
> +		case TEST_FILTER_TOGGLE:
> +			snprintf(name, sizeof(name), "-toggle");
> +			break;
> +		case TEST_FILTER_MODIFIERS:
> +			snprintf(name, sizeof(name), "-%s", data->modifier_name);
> +			break;
> +		case TEST_FILTER_ROTATION:
> +			snprintf(name, sizeof(name), "-%srot", igt_plane_rotation_name(data->rotation));
> +			break;
> +		case TEST_FILTER_FORMATS:
> +			snprintf(name, sizeof(name), "-%s", igt_format_str(data->format));
> +			break;
> +		case TEST_FILTER_DPMS:
> +			snprintf(name, sizeof(name), "-dpms");
> +			break;
> +		case TEST_FILTER_SUSPEND:
> +			snprintf(name, sizeof(name), "-suspend");
> +			break;
> +		case TEST_FILTER_UPSCALE:
> +			snprintf(name, sizeof(name), "-upscale");
> +			break;
> +		case TEST_FILTER_DOWNSCALE:
> +			snprintf(name, sizeof(name), "-downscale");
> +			break;
> +		case TEST_INVALID_FILTER_WITH_SCALER:
> +			snprintf(name, sizeof(name), "-invalid-filter-with-scaler");
> +			break;
> +		case TEST_INVALID_FILTER_WITH_PLANE:
> +			snprintf(name, sizeof(name), "-invalid-filter-with-plane");
> +			break;
> +		case TEST_INVALID_PLANE_WITH_FILTER:
> +			snprintf(name, sizeof(name), "-invalid-plane-with-filter");
> +			break;
> +		case TEST_FILTER_STRENGTH:
> +			snprintf(name, sizeof(name), "-strength-%d", data->filter_strength);
> +			break;
> +		default:
> +			igt_assert(0);
> +		}
> +
> +		igt_dynamic_f("pipe-%s-%s%s",  kmstest_pipe_name(data->pipe_id), data->output->name, name)
> +			test_sharpness_filter(data, type);
> +
> +		if (data->limited)
> +			break;
> +	}
> +}
> +
> +static int opt_handler(int opt, int opt_index, void *_data)
> +{
> +	data_t *data = _data;
> +
> +	switch (opt) {
> +	case 'l':
> +		data->limited = true;
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +static const char help_str[] =
> +	"  --limited|-l\t\tLimit execution to 1 valid pipe-output combo\n";
> +
> +data_t data = {};
> +
> +igt_main_args("l", NULL, help_str, opt_handler, &data)
> +{
> +	igt_fixture {
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +		igt_require(data.drm_fd >= 0);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_require(data.display.is_atomic);
> +		igt_display_require_output(&data.display);
> +	}
> +
> +	igt_describe("Verify basic content adaptive sharpness filter.");
> +	igt_subtest_with_dynamic("filter-basic") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_BASIC);
> +		}
> +
> +	igt_describe("Verify that following a resolution change, "
> +		     "distict taps are selected.");
> +	igt_subtest_with_dynamic("filter-tap") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +
> +		for (int k = 0; k < ARRAY_SIZE(filter_tap_list); k++) {
> +			data.filter_tap = filter_tap_list[k];
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_TAP);
> +		}
> +	}
> +
> +	igt_describe("Verify that varying strength(0-255), affects "
> +		     "the degree of sharpeness applied.");
> +	igt_subtest_with_dynamic("filter-strength") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +
> +		for (int k = 0; k < ARRAY_SIZE(filter_strength_list); k++) {
> +			data.filter_strength = filter_strength_list[k];
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_STRENGTH);
> +		}
> +	}
> +
> +	igt_describe("Verify toggling between enabling and disabling "
> +		     "content adaptive sharpness filter.");
> +	igt_subtest_with_dynamic("filter-toggle") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +
> +		for (int k = 0; k < NROUNDS; k++) {
> +			data.filter_strength = DISABLE_FILTER;
> +			run_sharpness_filter_test(&data, TEST_FILTER_TOGGLE);
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +			run_sharpness_filter_test(&data, TEST_FILTER_TOGGLE);
> +		}
> +	}
> +
> +	igt_describe("Verify content adaptive sharpness filter with "
> +		     "varying modifiers.");
> +	igt_subtest_with_dynamic("filter-modifiers") {
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +
> +		for (int k = 0; k < ARRAY_SIZE(modifiers); k++) {
> +			data.modifier = modifiers[k].modifier;
> +			data.modifier_name = modifiers[k].name;
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_MODIFIERS);
> +		}
> +	}
> +
> +	igt_describe("Verify content adaptive sharpness filter with "
> +		     "varying rotations.");
> +	igt_subtest_with_dynamic("filter-rotations") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +
> +		for (int k = 0; k < ARRAY_SIZE(rotations); k++) {
> +			data.rotation = rotations[k];
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_ROTATION);
> +		}
> +	}
> +
> +	igt_describe("Verify content adaptive sharpness filter with "
> +		     "varying formats.");
> +	igt_subtest_with_dynamic("filter-formats") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +
> +		for (int k = 0; k < ARRAY_SIZE(formats); k++) {
> +			data.format = formats[k];
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_FORMATS);
> +		}
> +	}
> +
> +	igt_describe("Verify content adaptive sharpness filter "
> +		     "with DPMS.");
> +	igt_subtest_with_dynamic("filter-dpms") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_DPMS);
> +		}
> +
> +	igt_describe("Verify content adaptive sharpness filter "
> +		     "with suspend.");
> +	igt_subtest_with_dynamic("filter-suspend") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_SUSPEND);
> +		}
> +
> +	igt_describe("Verify content adaptive sharpness filter "
> +		     "with 1 plane scaler enabled.");
> +	igt_subtest_with_dynamic("filter-scaler-upscale") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_UPSCALE);
> +		}
> +
> +	igt_describe("Verify content adaptive sharpness filter "
> +		     "with 1 plane scaler enabled.");
> +	igt_subtest_with_dynamic("filter-scaler-downscale") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_DOWNSCALE);
> +		}
> +
> +	igt_describe("Negative check for content adaptive sharpness filter "
> +		     "when 2 plane scalers have already been enabled and "
> +		     "attempt is made to enable sharpness filter.");
> +	igt_subtest_with_dynamic("invalid-filter-with-scaler") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_XRGB8888;
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_SCALER);
> +		}
> +
> +	igt_describe("Negative check for content adaptive sharpness filter "
> +		     "when 2 NV12 planes have already been enabled and attempt is "
> +		     "made to enable the sharpness filter.");
> +	igt_subtest_with_dynamic("invalid-filter-with-plane") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_NV12;
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_PLANE);
> +		}
> +
> +	igt_describe("Negative check for content adaptive sharpness filter "
> +		     "when 1 NV12 plane and sharpness filter have already been enabled "
> +		     "and attempt is made to enable the second NV12 plane.");
> +	igt_subtest_with_dynamic("invalid-plane-with-filter") {
> +			data.modifier = DRM_FORMAT_MOD_LINEAR;
> +			data.rotation = IGT_ROTATION_0;
> +			data.format = DRM_FORMAT_NV12;
> +			data.filter_strength = MAX_FILTER_STRENGTH;
> +
> +			run_sharpness_filter_test(&data, TEST_INVALID_PLANE_WITH_FILTER);
> +		}
> +
> +	igt_fixture {
> +		igt_display_fini(&data.display);
> +		close(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 758ae090c..744551bcb 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -271,6 +271,7 @@ intel_kms_progs = [
>   	'kms_psr2_su',
>   	'kms_psr_stress_test',
>   	'kms_pwrite_crc',
> +	'kms_sharpness_filter',
>   ]
>   
>   intel_xe_progs = [
