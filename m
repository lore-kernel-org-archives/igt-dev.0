Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4C4D3B7EA
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 10:30:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B9D10E4F2;
	Tue,  9 Dec 2025 10:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RwgAHLDQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2331010E4F2
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 10:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765276229; x=1796812229;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ceoObWNynOH2d+habJD7SrjGSMFEHKNQ5/4dCLeZcOs=;
 b=RwgAHLDQsvDekB/OkyrX+v6+yFSsT8Au7HtzNn2dlKyRdoV+pPdi0PJm
 a2KN/jZp4arb4yl9uEzB8Id9vxxlq9luhKG07eVkRKEadeYQ8vWfFJWEU
 a850aRTgFeJBvtMVW+zwkmrgf1wGu3p+D8yFPM6KxUdKzOHxwyOCGM8B4
 7kp2RYKGK9/h8BySwR2051qR0RzP6zCwFyHD4u+CctKv5ncZJR7U+vuid
 LQeXHbpktSllWvSbm7GMcUtXUDkF3FMslYMc59owkt2+P5bODN0QjN2fR
 3dt8s3oMiy80qzi7XrYBPnHQAJQNLwwIUR92Dapa0CIQ8hvH0381KgVGs g==;
X-CSE-ConnectionGUID: eQWOm6QsQzqsmtREBwx6cw==
X-CSE-MsgGUID: ORz3B+TMTey+Yg1pjg4OVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="66236508"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="66236508"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 02:30:28 -0800
X-CSE-ConnectionGUID: 3njU1REyQeatdW165R57EQ==
X-CSE-MsgGUID: Uno8f29tToaz+J/ipbx/2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="195961138"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 02:30:28 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 02:30:27 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 02:30:27 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 02:30:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwQk0YiPQKW5kzfhQ4DBDjbSXYldAEK91R8L/Me+/ZF/Fs6V44qHA+7gEVDj4Nh4OzRwC/FySsKSxwrNjyTolqqpxkXiWDk+jRPREJd1wy0B2Wieh18Ovk7yD3JsbufDK32rYmVLUnJA2R2wHHJV4XMHJC3GVCCela/cJM5aFVygSGVJ1GMkRnRSZjDkpGRHdpEPKvWYTrF3CgsskTOf5xM9XfAbUKZy7mqN3KHPtOU3RLQstLLH4TqFL2v1PjkjQ+/QkvbKN+Fq4uzdT03PxcFS2iKPaPm+sLKFkQiAJr9IiNRkUPA5tQqCPbAizVTHO7kDA5adKJd51f/X70UCtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZ3ow3fGzPrpo5k02I0+WJovzSej9+lCtUUqjvs1ngI=;
 b=MVyB3kmIm+6uhmxPg0hx3pf68poAvgB7jofEyjrLLg1L5MzypB6/QWciCueDyzQIl3LE070ahYxyBdAfn0YxIlJF2cRMn/ZlBlSO7seNOVYu6v5iWEkbCX1FQLOikfwY02KpUM38YeoP6KJZCs0++clDf9nWisy4Q+E+k7uNJ+MmrnzZHOMmMzaQ6bu5zGHr4yJ8Sk51cYHxyJSODIQTrIslbAMfGDcec1PWt/wSP2hbi3ITiV8qHfDihIpQFjyxaQIzZq32w5AR6dKFKfobf57MbslJujKTWO9TOS/rpt5EqoEng1Dnd9JrpHI6LpTi5YEX+7T3V6fUsfVz5yNsAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CH3PR11MB8657.namprd11.prod.outlook.com (2603:10b6:610:1ca::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 10:30:25 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 10:30:25 +0000
Message-ID: <e6843a63-6208-47a5-90d9-081a3463d71f@intel.com>
Date: Tue, 9 Dec 2025 16:00:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v5 10/13] tests/kms_color: Add Intel plane pipeline
 tests with LUT1D and CTM
Content-Language: en-GB
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>,
 <alex.hung@amd.com>
References: <20251205195312.1234330-1-swati2.sharma@intel.com>
 <20251205195312.1234330-11-swati2.sharma@intel.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251205195312.1234330-11-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::10) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CH3PR11MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cb0a69f-a2a6-4f8c-4063-08de370df73e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eERleTJwczFTUWRsVGNLcStKM1hyZVYrVXJaSi9JWnMyRVEzRmRoSFlsSGVG?=
 =?utf-8?B?YlFLeVBleVhUaCtLbHd2eWFoMlg5WE5hdFdRaTREUFlJQWtpeXB2UEtlMU1P?=
 =?utf-8?B?d3ZLOG4vc1hvWmlXTjdCVUxoalNHa0NHeGtjaWRuZXVLZlB2NXhkdEFoN0hq?=
 =?utf-8?B?S1czeU1UdGk0a2tRR2xYb3kzOFhqQW1ycFB3U2tkNm9jNGg4NGh1VVF5Wldn?=
 =?utf-8?B?d3RndDBDQ2l6VGlpMzQ3NVZJdGZOUzJhczRldEduU242dlpueHJtY0QvVXIy?=
 =?utf-8?B?RmMwVU8yV0s3WFBlcmZhMHd2OWJZRVprQnBQU1Z2UnA2aERNeEI3VGM5S25N?=
 =?utf-8?B?dHRhNzFjNjlYNGh0VTl2U0ZEMFBVQjBrUEVQRmdLVnJyVTZMSnRRL09ld0JR?=
 =?utf-8?B?N2NoWTNBa1h4SE5aRFhrY2F1M0U5YmZYSUVkcWdvUDhKaXNQWVhucHdMWE1j?=
 =?utf-8?B?bDJNWDJlYXNsUVRyeWx1ZnJSTTJEVG1xL0FERkNmb2R1MkdKeGxlSG1sKzRQ?=
 =?utf-8?B?ODdvN2twbXJQekl3TGpJWUlzZ1lMUTN3Q0FkZjFnVlZacFR0NitoOUlGeDd2?=
 =?utf-8?B?K0MwUTZOUk94MnIzeUNpK05rSFQ5elJxbGEwUzUySVY2YTFjSVhadWszLzVL?=
 =?utf-8?B?cnNWY2wrNnFwTGtBaUVCRm9la3RtdmFtNXdMeWVTeXg1WCtFN0FqNklUbkFk?=
 =?utf-8?B?MngxcU4yZE1uQUdWc2NLK3Z1K1ppM0JLOXEwY2dxaHVWS2xUNUMxNEdKc0hJ?=
 =?utf-8?B?TWpXYlFsRnNZQmRtQ1hFcThyclBDRTFnd1N1V0xVTWlKU1FYQzFyUHI3L2FT?=
 =?utf-8?B?dHFta1ExK1hXZWhHTE9yUXA1emdRY0I1VDdlMzduK3NvNjFTalRKM3hoWDRa?=
 =?utf-8?B?MmQ1RVdmWkxHdXpLRk4wY29VK09pODhyU2laS0FrN29DVFAzOTh6d3BSclNY?=
 =?utf-8?B?ZVJpOUJiZVhpOWpZZnY4QWk0STlOak92TjZSSGhpUjhqeWcwR0hvZExyeFQ4?=
 =?utf-8?B?Rm1SOS9jeEFXUjJXSzEralNxYjRoV1pjZStNQjBVdFh6NjBiTWhMT3U4UUtI?=
 =?utf-8?B?OHJidTJESjZLcHhsNk1ZMnhjZ3V6ZFRUa1orSGsyN1V2YjJvZDluU2Zra0s0?=
 =?utf-8?B?R3VBNUZSMHAwdUpJSFVhbmVJSGk2Rk9iY0FQWUdQYVk2Zmd1SWgzSVpVbUpr?=
 =?utf-8?B?a3MyTkdMQWk0QjA4NVhoZkZBNGxXOUtqWEdUcmF6bFlrcWlYeDdWZHdKS1Bs?=
 =?utf-8?B?clpESGZ4ZDMrbVFtWVVPeEtoWUkwYVlMRUh0VnY4OVpwNktQQTM4NURiQzNG?=
 =?utf-8?B?d0RZR2puLzRBbU03VnhpY1ExMFNKajZPSTlHZ0w0YlQ0QkhCUVpmL0JmV3Y4?=
 =?utf-8?B?WUh6MFhyOVhyUzZId0dqclVhTlBDa3hLT2ZqeUJyL0l5SEl4b1FDMEVKdi8w?=
 =?utf-8?B?Rk4rVUxVYmt1cVVxakt6UFlza0VSNHh5ai8xRHRuQmYvMFloTTlmTGt5M09v?=
 =?utf-8?B?bnhBRzZuZjN3OE5GeEIvdkhnNDY3bHJVam9SSGdSaGNKVVh2Qjh3M3F6OFdo?=
 =?utf-8?B?TmVIc0ROY09RQ3Q3WHpoTTNmZTJHZUt2SWFaSUJrbjNCTnNjejdwUCtIeTZF?=
 =?utf-8?B?VE1DY0sxR3grMkNHZHZPdEJaMTJLNVJLY1grdjVvMWQwWGgwWkJEOGZVYXJS?=
 =?utf-8?B?dU55dzRzaDgwY2hjbm9EMG1ncVNJdjR4cCtBOHRlK1g2Z0g0QTV0YlF4RXhl?=
 =?utf-8?B?amM5UjN5alI5aGIvWWloM0MwdURhSHhiYXBMQTZvU002RDg1OW50OFF5SDhG?=
 =?utf-8?B?VVo5V0llb0N4YWlaK0FxR2l4NFZXWlAwclRmalVnZ3pGNUEzOW5OUkxpUThH?=
 =?utf-8?B?NTgzRzZSMUNwN1EzUm9KN09wSzE0ZTV6QWVzMjRwWmdYUlFEb3p5Tk4ydllD?=
 =?utf-8?Q?6gEQZ/fq0K8/GabOodnRdxR52zwAVRw5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cThMeGx6ZVVBVVhpd0lCV0xjT1U2aFpRdHNqUHp2a3l0M0hvZW81WDRPWnVL?=
 =?utf-8?B?eS9GbXd2aUNKLytiK05Bcmw3Znc0U2xNUXY0VENvaEVGN2NYa3BWQWNZRzls?=
 =?utf-8?B?aXdwcFA5Q0p5dlQrSzlmbUh4dmtxUkQ2cE5JNUNzT2NlZWlzbU54dzB5QUpK?=
 =?utf-8?B?Y2hIT1Y1N0R5Zk5QVmprN3VTWW0ybVZrdDVvaE5WcnI1ZUdWMTgvNHlUbXk1?=
 =?utf-8?B?OXJ3b0FGUTZ6TEMwc0ZrTktSVHdiNWpBMkZ0akRZRkFpSXR3MVF6WWRJbXRh?=
 =?utf-8?B?OVlERnBOSjl5WUxjZnFKQ1EwZHUvTVpuVEVKR3RJYlFrM0hmK2IyMlRKM0d0?=
 =?utf-8?B?UlRUNmZ6cWhEN1FVRlZvY0s4YndPdDlySmdBcC9PbHFESDhic3k0cy9JdzEz?=
 =?utf-8?B?RmU2Vnh3TVBtd1oxaDlNQWRrYzJEK3pIRndqSWJnZUhXdzhNYWYvN1kyRTdE?=
 =?utf-8?B?a0N2TFh2MXNnUWJsa3RUeWVpcmlpVmM3NGdCMzE5MnFyWGZBVkNjZjJ6NWEr?=
 =?utf-8?B?NHRzWitiR0ZIamdnUUs1bXBJbHFkakFQYUxNNnpVMVZLM0Vnc3E4emZ1TENN?=
 =?utf-8?B?a1JuU3Uya3ovVkhHZUNvZmdxYWhvdUk0clNXQnRGeXBHVHFMZ2tDZEIzRVMz?=
 =?utf-8?B?SStCczNjYzNnUmhHUTAzR1oxTUYxMUtTeWx4RFJ4amR6a3k5dXVIajdOdC9i?=
 =?utf-8?B?dzlBNXE3dHVpRllxTTl4cGtzdHliOWZuVzBTVXhEK0R1TFRKN1J2eE5mQ0Vw?=
 =?utf-8?B?bU5ORnhnYnVLSi9YeW9Jc3ZhNEdhcGxDa2U4YWRZTC9GQnRXR1Rod3FkSW9s?=
 =?utf-8?B?ZEZGRFluNG4wcEp0OHY0WG5HS0NiS1FPNVNCZlVPTWtzYVFmc0tpTlpULysy?=
 =?utf-8?B?UjdUbVhwNFNtR1RMTStlakFvTDh3ckhCZW9DZVlEeTFlMjlpN3pQS013em1l?=
 =?utf-8?B?UjJMOSszUDd3Wkt2S3VENjdLWmxxT29xRkNRcGF5eEtLL1hycVEwQ0FPdy92?=
 =?utf-8?B?TnhzK3REeUx0OStsalo2UnkvenVJeWViU1h0Y1h5OTdteFRJQ0VxWUxEUFBM?=
 =?utf-8?B?OUt4YmxwNUY5V0hyekhibnJDUUVLSlNPaExqRHBpcDhCRkx6T1V6Z3BCNFR6?=
 =?utf-8?B?R1pRUHdPNlpqeUgvbnprK1UwbzRzT29KeCtZandMRUpQN1ZYQmhpUmc3ZGR1?=
 =?utf-8?B?SDBrbmdsdU0xRE5UKy9CenJ1RmNjdmI3VW9Ud2ZmOEZsczRWeGlvdmwyTmkv?=
 =?utf-8?B?VVozTDl3WmErNHo0VmpxNzhsTlRPZG5yNVdXZVVFbS9qWEU5ZUNKWEZhMWoy?=
 =?utf-8?B?bHNHdU1mclhtUy9sdFM2N3g5Y2lWN2hwNXBmdklkMUVrTFN6U2FySG5wRTFG?=
 =?utf-8?B?MDMzMjFhdDZrTUwxNzhkV3hxNlN3cFZ4cFBXelNMY1ZzZ1ZqV0VFODhIdmoz?=
 =?utf-8?B?Uk4yTTBXb3FmS081SEQ4S2JrZDZ0d1BKYkwyVlRHd3RHZkJEWHZ3N0VBSnlP?=
 =?utf-8?B?M1hJaUlLZnJqeFkxakVsamltQnAzc0lVSk1PWHFlYWtEUEVNNEpXQkppUGRo?=
 =?utf-8?B?ZkhDbVlSemdDUVl4VWhWdkV5dVBhZ0Z0Z2oyMzQwM3pheWxFM0dRQTRsbzVh?=
 =?utf-8?B?MlNjbW0wbWg4RmcwMGJZOEQ5R01qcEdhdldtTDN0N0MvRUVzSHVNQjBLTEZq?=
 =?utf-8?B?eXJIbDd1NjlINUEvYllFYWVTM1hkUnFBcnV1eVZmaXBrdWVjT1grWUNCcEo5?=
 =?utf-8?B?aG83RGJ6NXV1WjNucFE5bWQzSkZ5V2hYY256aXJaVkRyN0lwdWRvaUVhZCtQ?=
 =?utf-8?B?aHpJVHpUR282S01yTTB1VUVKZnp6TlBCZ1dlYkYydkZMYmludHRZcXhPcTda?=
 =?utf-8?B?MnpJdVN4WWFhRFl5MitXKzhhYVByTEl5TldyWnR5dWpkL0lnWWxucm94TERE?=
 =?utf-8?B?YkswbG1yM1FvVUFld0tIZVZxMENMbURnSEYwOExUZm56MjRRTTdVSVVCd1FP?=
 =?utf-8?B?NjU0dmh1aU1WV2tHajE5cWdUYkFmdGtjK1VVVnBobDlobFREZ2VLL2xpRG12?=
 =?utf-8?B?NWxvc2xxelNRTCtKb09kM2RFZGhTS0tNeTZjWnFPVTVWN0FDamdrbm5PTlpI?=
 =?utf-8?B?VVltUmQrZWNsZlZ4QU9IUFdqTE1Ba29zMXd4TlVNbVRhcGlaZndtbTJyLzdl?=
 =?utf-8?Q?FjUhz+J+Zk0hWgP7estxp5Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb0a69f-a2a6-4f8c-4063-08de370df73e
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 10:30:25.6521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iioTgDgsFeCgVRm/23L2SJ0JIHCNJR+IWmnvMprmJSemMOJAqLpCqnAabVzFPfVPvdsFEtY7z9u1LrM4FyUKDGKnCUg6EMNjAMtrPZkW3tI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8657
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



On 12/6/2025 1:23 AM, Swati Sharma wrote:
> For now, Intel plane color pipeline contains 3 colorops:
> Pre-csc gamma (1D LUT) --> CTM 3x4 --> Post-csc gamma (1D LUT)
> 
> Create subtests to cover different combinations of available
> colorops:
>    igt@kms_color@plane-lut1d
>    igt@kms_color@plane-lut1d-ctm3x4
>    igt@kms_color@plane-ctm3x4-lut1d
>    igt@kms_color@plane-lut1d-lut1d
>    igt@kms_color@plane-lut1d-ctm3x4-lut1d

A description of the general flow of the tests would be nice here.

> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_color.c | 127 +++++++++++++++++++++++++++++++++++++++++-----
>   tests/meson.build |   2 +-
>   2 files changed, 114 insertions(+), 15 deletions(-)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index a47c71f33..258a78a58 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -32,6 +32,8 @@
>   
>   #include "kms_color_helper.h"
>   
> +#define MAX_COLOROPS	5
> +
>   /**
>    * SUBTEST: degamma
>    * Description: Verify that degamma LUT transformation works correctly
> @@ -76,7 +78,21 @@
>    * @gamma-lut:          Gamma LUT
>    */
>   
> -IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
> +/**
> + * SUBTEST: plane-%s
> + * Description: Test plane color pipeline with colorops: %arg[1].
> + *
> + * arg[1]:
> + *
> + * @lut1d:			1D LUT
> + * @ctm3x4:			3X4 CTM
> + * @lut1d-ctm3x4:		1D LUT --> 3X4 CTM
> + * @ctm3x4-lut1d:		3X4 CTM --> 1D LUT
> + * @lut1d-lut1d:		1D LUT --> 1D LUT
> + * @lut1d-ctm3x4-lut1d:		1D LUT --> 3X4 CTM --> 1D LUT
> + */
> +
> +IGT_TEST_DESCRIPTION("Test Color Features at Pipe and Plane level");
>   
>   static bool test_pipe_degamma(data_t *data,
>   			      igt_plane_t *primary)
> @@ -724,7 +740,6 @@ static void test_pipe_limited_range_ctm(data_t *data,
>   }
>   #endif
>   
> -__maybe_unused
>   static void clear_lut_data(kms_colorop_t *colorops[])
>   {
>   	int i;
> @@ -735,7 +750,6 @@ static void clear_lut_data(kms_colorop_t *colorops[])
>   	}
>   }
>   
> -__maybe_unused
>   static void prepare_lut_data(data_t *data, kms_colorop_t *colorops[])
>   {
>   	int i;
> @@ -773,7 +787,6 @@ static void prepare_lut_data(data_t *data, kms_colorop_t *colorops[])
>   	}
>   }
>   
> -__maybe_unused
>   static bool ctm_colorop_only(kms_colorop_t *colorops[])
>   {
>   	int i;
> @@ -784,7 +797,6 @@ static bool ctm_colorop_only(kms_colorop_t *colorops[])
>   	return true;
>   }
>   
> -__maybe_unused
>   static bool test_plane_colorops(data_t *data,
>   				const color_t *fb_colors,
>   				const color_t *exp_colors,
> @@ -988,7 +1000,6 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
>   	test_cleanup(data);
>   }
>   
> -__maybe_unused
>   static void run_plane_color_tests(data_t *data,
>   				  const color_t *fb_colors,
>   				  const color_t *exp_colors,
> @@ -1327,16 +1338,104 @@ run_tests_for_pipe(data_t *data)
>   		}
>   	}
>   
> -	igt_fixture
> -		igt_require(data->display.is_atomic);
> +	igt_subtest_group {
> +		static const color_t colors_red_to_blue[] = {
> +			{ 0.0, 0.0, 1.0 },
> +			{ 0.0, 1.0, 0.0 },
> +			{ 0.0, 0.0, 1.0 },
> +		};
> +		const igt_matrix_3x4_t ctm_red_to_blue = { {
> +			0.0, 0.0, 0.0, 0.0,
> +			0.0, 1.0, 0.0, 0.0,
> +			1.0, 0.0, 1.0, 0.0,
> +		} };
> +		kms_colorop_t lut1d_linear = {
> +			.type = KMS_COLOROP_CUSTOM_LUT1D,
> +			.name = "Pre/Post CSC GAMMA (linear LUT)",
> +			.lut_type = KMS_COLOROP_LUT1D_LINEAR,
> +		};
> +		kms_colorop_t lut1d_max = {
> +			.type = KMS_COLOROP_CUSTOM_LUT1D,
> +			.name = "Pre/Post CSC GAMMA (max LUT)",
> +			.lut_type = KMS_COLOROP_LUT1D_MAX,
> +		};
> +		kms_colorop_t ctm_3x4 = {
> +			.type = KMS_COLOROP_CTM_3X4,
> +			.name = "CTM 3X4 (red to blue)",
> +			.matrix_3x4 = &ctm_red_to_blue,
> +		};
> +		struct {
> +			const char *name;
> +			const color_t *fb_colors;
> +			const color_t *exp_colors;
> +			kms_colorop_t *colorops[MAX_COLOROPS];
> +		} plane_colorops_tests[] = {
> +			{ .name = "lut1d",
> +			  .fb_colors = colors_rgb,
> +			  .exp_colors = colors_rgb,
> +			  .colorops = { &lut1d_max, NULL },
> +			},

To work around the disadvantage of not able to test the post-csc LUT in 
isolation, I think we can add some more subtests.

  { .name = "lut1d-pre-ctm",
    .fb_colors = colors_rgb,
    .exp_colors = colors_red_to_blue,
    .colorops = { &lut1d_max, &ctm_3x4_linear, NULL
  },

  { .name = "lut1d-post-ctm",
    .fb_colors = colors_rgb,
    .exp_colors = colors_red_to_blue,
    .colorops = { &ctm_3x4_linear, &lut1d_max, NULL
  },

where

  kms_colorop_t ctm_3x4_linear = {
	.type = KMS_COLOROP_CTM_3X4,
	.name = "CTM 3X4 (linear)",
	.matrix_3x4 = &ctm_linear,
  };

const igt_matrix_3x4_t ctm_linear = { {
	1.0, 0.0, 0.0, 0.0,
	0.0, 1.0, 0.0, 0.0,
	0.0, 0.0, 1.0, 0.0,
} };

We are still not setting only the post-csc LUT but alteast we will be 
testing it's functionality.

Another way would be to loop over all the 1DLUT in the pipeline but that 
would need re-working the test_plane_colorops() or come up with a 
totally different function.

> +			{ .name = "ctm3x4",
> +			  .fb_colors = colors_rgb,
> +			  .exp_colors = colors_red_to_blue,
> +			  .colorops = { &ctm_3x4, NULL },
> +			},
> +			{ .name = "lut1d-ctm3x4",
> +			  .fb_colors = colors_rgb,
> +			  .exp_colors = colors_red_to_blue,
> +			  .colorops = { &lut1d_max, &ctm_3x4, NULL },
> +			},
> +			{ .name = "ctm3x4-lut1d",
> +			  .fb_colors = colors_rgb,
> +			  .exp_colors = colors_red_to_blue,
> +			  .colorops = { &ctm_3x4, &lut1d_max, NULL },
> +			},
> +			{ .name = "lut1d-lut1d",
> +			  .fb_colors = colors_rgb,
> +			  .exp_colors = colors_rgb,
> +			  .colorops = { &lut1d_linear, &lut1d_max, NULL },
> +			},
> +			{ .name = "lut1d-ctm3x4-lut1d",
> +			  .fb_colors = colors_rgb,
> +			  .exp_colors = colors_red_to_blue,
> +			  .colorops = { &lut1d_linear, &ctm_3x4, &lut1d_max, NULL },
> +			},
> +		};
>   
> -	igt_describe("Verify that deep color works correctly");
> -	igt_subtest_with_dynamic("deep-color") {
> -		for_each_pipe(&data->display, pipe) {
> -			run_deep_color_tests_for_pipe(data, pipe);
> +		igt_fixture {
> +			if (drmSetClientCap(data->display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
> +				data->display.is_atomic = 1;
>   
> -			if (igt_run_in_simulation())
> -				break;
> +			igt_display_require(&data->display, data->display.drm_fd);
> +			if (drmSetClientCap(data->display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
> +				data->display.has_plane_color_pipeline = 1;
> +
> +			kmstest_set_vt_graphics_mode();

Do we need this? It is already part of the fixture in igt_main

> +
> +			igt_display_require(&data->display, data->display.drm_fd);
> +			if (drmSetClientCap(data->display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
> +				data->display.has_plane_color_pipeline = 1;

duplicate?

> +
> +			igt_require(data->display.is_atomic);
> +		}

We should move this fixture below deep-color tests as we don't need to 
set up plane color pipeline cap for it.

We might not even need igt_require(data->display.is_atomic) for deep-color.

As I understand it was added by the commit 96ea2615f21f 
("tests/kms_color: Skip if current & requested BPC doesn't match") which 
added helpers that used atomic commits explicitly. It was later removed 
by the commit a37df4b538ae ("tests/kms: Fix to use max_bpc constraint 
helper") which as far as I can see does not have this requirement.
Atleast running deep-color on an LNL without the fixture worked for me.

> +
> +		for (i = 0; i < ARRAY_SIZE(plane_colorops_tests); i++) {
> +			igt_describe_f("Test plane color pipeline with colorops: %s", plane_colorops_tests[i].name);
> +			igt_subtest_with_dynamic_f("plane-%s", plane_colorops_tests[i].name)
> +				run_plane_color_tests(data,
> +						      plane_colorops_tests[i].fb_colors,
> +						      plane_colorops_tests[i].exp_colors,
> +						      plane_colorops_tests[i].colorops);
> +		}

We should eventually move this out to it's own igt_subtest_group. Not a 
deal breaker fot this series though.

==
Chaitanya

> +
> +		igt_describe("Verify that deep color works correctly");
> +		igt_subtest_with_dynamic("deep-color") {
> +			for_each_pipe(&data->display, pipe) {
> +				run_deep_color_tests_for_pipe(data, pipe);
> +
> +				if (igt_run_in_simulation())
> +					break;
> +			}
>   		}
>   	}
>   }
> diff --git a/tests/meson.build b/tests/meson.build
> index e0411bbc3..972b7b520 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -377,7 +377,7 @@ extra_sources = {
>   	'core_hotunplug': [ 'core_hotunplug.c' ],
>   	'dumb_buffer': ['dumb_buffer.c' ],
>   	'testdisplay': [ 'testdisplay_hotplug.c' ],
> -	'kms_color':  [ 'kms_color_helper.c' ],
> +	'kms_color':  [ 'kms_color_helper.c','kms_colorop_helper.c' ],
>   	'kms_colorop':  [ 'kms_colorop_helper.c' ],
>   	'kms_chamelium_audio': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_color':  [ 'kms_color_helper.c', join_paths ('chamelium', 'kms_chamelium_helper.c') ],

