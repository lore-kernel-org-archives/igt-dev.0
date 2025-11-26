Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9ACD10F34
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 12:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8558810E5BD;
	Wed, 26 Nov 2025 12:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jYc8v94i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6227710E5BD
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 12:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764160643; x=1795696643;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=k88s6sKidRTsLXL2e6tIHVIRyS1GbrEiDcBKvCOKnys=;
 b=jYc8v94in3EWt+ZpD6Lwma5F610NPesld/i4L6kdXYsz1qW4aAbhUgMG
 WVMdf3Rrk7xKo1nl7sfH1+ZMwT9agV9DOpUU8yRD45e0h3+JR3EZ+zCzu
 lvGb/zIF3k1ajZgk730z2VAjfgbZnjiqZaIKo/UXinJaF2fqMEyv+UedT
 ahHbR7nuL8ffdPNyjxUdIDqWAWXeza5iR/C3PdAhqxm/JAkRnGuVoWDY1
 p/p3XL2q2j5hXWmdfgD9rNwTvsZWmQpqcxrqcF8E1J8Pxsu0isI6yEtmR
 aXXqx8730ofQ9NgdLp8Atoqmx3OVfXUV0KFvz9yznD3wfUK/yIsXGaeHU w==;
X-CSE-ConnectionGUID: YQJf4+zPTNmDdh8fokWQeg==
X-CSE-MsgGUID: M/F7mM7nQw2gzEn3uRXWpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66153907"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="66153907"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 04:37:23 -0800
X-CSE-ConnectionGUID: 1rntkMKpQwa1D3+F8/NEXw==
X-CSE-MsgGUID: 3xgT2A4KQDy2ApoqjjXM5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="230185063"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 04:37:22 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 04:37:22 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 04:37:22 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.21) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 04:37:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/H0oqKjQ9A5PYNLIZRnGQFAKfo00/6PPdSIkROLnacK6zur/zmAfWhKxAGZAR47adUYj9d+d9Zh935iaRer69UZMouiZJt/Oxj+aPS9aygAm/R7cEKsDZ5YCD6rO5b2nRhQDgexq0WyoBWnwwgUfSfOLTb6xPfr5rHpFfC2YXzPLddrhmoy5GAdPZPIwk/faoc097TsxAmmMn+F5kMdErmvnd0ecl0NZdFy3aZfqTjLWWGXP9DEt7/8r5i9Uaa3c+ZY/lJSiDiP37sAl/EBOeuLj/tsDdgZQBCqsV4U186XeHU7lqpOKnT8OQjlOrDUYR0jEaGe0oPAmGsD4SQnEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9mtmKTuYgMJxb3o0nk6/v2rpNg+LWJ6pWZsty6AAeI=;
 b=SwjGOXs4cirRYhf27smOw1M/dgjvYgVLjdL7PYt9lHFkOjI/XYRg8u+XuTSlv7J7cvuEg7vLS5Gw7heynPREbgphmQY8PHZ1gUNI1R7aaadTGcH5Ksv97w6LivXJkoy0hyvG6GIHyR2CqL1qwCE4ZBo5G5PvZppm8aEGRh7DW/BofyOXJXqHYdZJQveMSeEWQeSouCPu3dheNY65K+oGHAIYZ2KSNQeS6cM8Pv8CDm8J6QI4uWsP2+eWBMrZllf2AtvV5qh1R6lFrh9OZxcmyU1+RU6IN5EZRyOe+G5FtgtJadClH7sk2UQuxKv+yiPTGovSPXMjX16NOA+Zf1Tjeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SN7PR11MB6850.namprd11.prod.outlook.com (2603:10b6:806:2a2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 12:37:20 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%5]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 12:37:20 +0000
Message-ID: <e14bd887-e783-4d4d-9c11-e31e4b78ccc9@intel.com>
Date: Wed, 26 Nov 2025 13:37:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [v3,5/5] tests/intel-ci/xe-fast-feedback: Rename xe_debugfs
 subtests
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20251126102827.47844-6-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20251126102827.47844-6-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0025.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::6) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SN7PR11MB6850:EE_
X-MS-Office365-Filtering-Correlation-Id: 20cdad9e-11d9-4d14-03db-08de2ce88a65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmp1SFJ6a2N6SlNvZzNqcGF4bVM3NklPcmlJM1I5MWFvTDhIWmdZN1F2RHMz?=
 =?utf-8?B?OFpBTTJjT3ZoZCt4VDlRWDZKUW1MZTlNZnZoWm9BQkZuMkt5bEptaE1TWkhn?=
 =?utf-8?B?eVVzNGd1RGhmOUlQV2d0cDVIQVFFZitZOE40M3ZUSll4UFhaZFMxWVNmNkRp?=
 =?utf-8?B?WUV0NlROdWRMUWlSQStITUJwVXRJbUZzdC92STVBaFpxNDRzbDI3Vm1mdUR3?=
 =?utf-8?B?czVYUFdpSnM4ZVRIQXAxc1FZRDVjNUpoMmFaT2J3SHEyRmNmY3l0VGE4NSti?=
 =?utf-8?B?RHhjZmQ1ZGtoWEZYQThpT2ZZQVJXdGRWRTN0T1pEcVN4TkNkd1FEaHdyajR6?=
 =?utf-8?B?dlV2blJJQXJ5dDVLT0RRem56Tk8yZ3h0b0hPNGhyc1c5eWs4bURFTk55TzVk?=
 =?utf-8?B?MzYxeTB5dzg0bm9kbFdmb3NyMG9QcTZFUmFGUEJKbzlxSWFrK0g0czRTeW5s?=
 =?utf-8?B?QURXVm1vZGxoend1ekwyNDYyek9PU2tFL0llVWE4VnExcURnWFloUlpVRVN0?=
 =?utf-8?B?TXJNQkxKRFQ5RnN2SkFXcjV1T3JjclN6MGZZcGh1eFZDZjFuYmZneHBqb2Ev?=
 =?utf-8?B?U0V4NlJmYWc2c1dYbTA1eEcwTjZOb1RYNlJyZG53WW5nQkdBZFVOODVXRFJQ?=
 =?utf-8?B?RnNiMUMyQWt6NVgxb0R1b0ZJUERwbHBrR3hhSDV6WlQvaHJVdWN3KzZEVE5C?=
 =?utf-8?B?Q1VRYUdFRkNtSTJXVmtEQkYzeTlzS2x0WjBQZmhLVWZEOEMrK3FtNW00REZQ?=
 =?utf-8?B?cnljVUlTcUN5aGppM2d5UHk2YkFzYUVrQ1ZmZGcwMkF6WktXRGZ4ODlRb1FN?=
 =?utf-8?B?ZTR0UitUWlpqSjhPTFkwOGRmRE1TMDQrc21SeXR1QTFwRVJPWC9RSVB2YlVH?=
 =?utf-8?B?ZnRlZUhsZkdzeE5yK2NTeTM0WE9Nd3kzMTEzbnJxYjRIa2dXdllFaVU1RkZu?=
 =?utf-8?B?M2pFVWY3ZGVkeHhuYUJ4emg3RVdRVkIxSlg0Rlk3ZUNKeStnZzlDdG5uZHVC?=
 =?utf-8?B?K0hPV3ZYU1RoNW1oSm9QTDFHektKVXAwTVNtM0tzZlpTeUM3TnoyN3d1T1Vl?=
 =?utf-8?B?Y0E2akZFSngzZ3FBOUQ3NFBhLzJkcnBSMWt6Q3JVWWhML2dsdyt3QlNZMFA5?=
 =?utf-8?B?czcvdnVQeUtKc0NuNHVINUpOV2d3ZVBuWGVVdGJOM2cvUjA2bllVS3NwUEtY?=
 =?utf-8?B?SFo4Zi9oTjU3MFQ2cno5d2czSEkwUC9lZmZyQXNiWDVONyszeTFiT2xrR0dn?=
 =?utf-8?B?bExrRHpkNTUvdjR4LzZhVEFYb3J0cVNXVTJibndHYVd4OG4za09tNVZuSm55?=
 =?utf-8?B?dnU1M1R6SUpFTEdhUm1Ob2xjSlo0UVIrOTd6cW1UclU0ZVhMSUhHN2dUZm9t?=
 =?utf-8?B?TjUweXhUK1NBcXQyQ0Nzdm9nZFRPUWpkZ0xwejBxbzE4TWYyMkwxaVhPNzhE?=
 =?utf-8?B?enU0KzhNTWFyTFJnWmFRZE10c0VibW5USW04WDhtRmZmUHJGV1BNM1NDbmRL?=
 =?utf-8?B?NTJrck1ZODFYRGZUUC84NXdKOGUrYzRVNVBad0dqK0Y5ajJ6MUZKTVllL2k3?=
 =?utf-8?B?SUx2S0x4c3pVSFhNaHplL2N5ajk0V0xHQzg3bzJTdE1ERXcveFBGWjZ3Vm5S?=
 =?utf-8?B?MTNQOUZoQTM2cHltcTlZbDBhNWpGdGNFOXFVeVBNTk1kU2tubFpJOHAyOFlK?=
 =?utf-8?B?Y28zTjF3ckhvN2lqWWVOVTFSUUdBRm81ckZITGM4THI3WlkwUkV0bmdPR01q?=
 =?utf-8?B?WEgycnFEOENGOVRZTklzdUR3a2Y2Um5KQ2hQWEk3ZE9ZaHJBaGRyNnRhZnVj?=
 =?utf-8?B?TnpNOUoxYlFVYWtUdFFFenFON3IvOXNLUHgwWGtPYjFSNnhrd3ZVLzVaUVdV?=
 =?utf-8?B?cTVjamFROUFpaWhKakMvN2ZCMnJaVkZYVFBmZ29TeVhlaGc1SDZOeURMbHpk?=
 =?utf-8?Q?1B4RVeII3Oolq/lL3RyN743x4eodRSAW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajYzM01NSVNleXdUODVFZEhBMGFhejF5cGhrNzZiZXEvNUFKQVhFejVwaERs?=
 =?utf-8?B?d2FjVjYyMk5oRGlIQWR2SnQzeDQvRTYwVmZqYmxCY1NBaWVaMUZlaWN3WVVY?=
 =?utf-8?B?dENWUTlRbm42L2dOZXFRZUt2OXlVM3lWUHc1cVdWbTdrNi9ZbVdzT2ExcFR4?=
 =?utf-8?B?eEQ1cElTc3dOczdWNVRvTE91Si9FbVVKVjA3d0Q1c2F2UEUrM29LSWwrSTNy?=
 =?utf-8?B?SGU5dnJocDhDM2puanZZY0NxaXZ5U2FpRVYxZkFNeUFwam9CeGN2ek1RdU9R?=
 =?utf-8?B?bFc3M09rSlZtSHpvdkFEZnVQSzJXY1NCV0lpaitoaEcvakVrOUhoUzdXZGV1?=
 =?utf-8?B?NkcyVlNqaFdDbGl3R3hqK1VhNGJqZ2I5ZlBMZ2Z5ZG9RcklGc0JhR1BrMUZa?=
 =?utf-8?B?TlpQdlFHTEtXdGRXcU0zVjFnTUxBTFVmQ3k5TzZSK1RFcyt5aW92Sk95N29q?=
 =?utf-8?B?NDdZdWZpOEZ2L0RON1F3ck00dDV2T0xMRDBSWk5mUkZzTW9UZVdONUo4V0tP?=
 =?utf-8?B?WG9vUHkyRTk1K0dmdi95cXd2MlliL0Y5by96SGhxK3lwTHpUS2paRUx6NVFv?=
 =?utf-8?B?bWJuWkZzOGk2T25HYTg1L29xZTZCRGFQZFk5dTBwb2lISW1UNFVsVFN2MFBN?=
 =?utf-8?B?SVBId0ZxYkZ2dWp5aHNwWU5YSkZXcDR6a294ZmUwZ3dFTVBSMDRZZmxCMTdF?=
 =?utf-8?B?RXZ4eDE3M0dLUFNlY1dSMjJFcUZsWlh3QnMyTlYxTnI2STIxWXNVaGF4ODk4?=
 =?utf-8?B?VDlRYjBnSHFnZG95T0dHenlIOGk1RFV4RWFiTjJJSSs5MjNjSGIvR0VVMity?=
 =?utf-8?B?bWhFcTZVZkk0czE3bzBXQ0Z5cVF6VEVpUGwyYVBjeVdOOEVrQXdSaXRiWW5q?=
 =?utf-8?B?YWN4Rm1SWFgySHZuVENSbVRPMGtaTjIxdVRrN2VpN0RreWs4N2xQZ0JabWVH?=
 =?utf-8?B?QVYxZ3dDRlY1SWdDRGJtTlJZVk4rd2habWlUSk01ZUFRR1FiYVA3Vkk0dmZQ?=
 =?utf-8?B?N3k4SkV3WmtTQ3E5cTRSMjBjek14N0liUFl1cG1CVTdOMGtXWTdXOGxkN1Fs?=
 =?utf-8?B?SHBkU3RZSlhhOUNQNWxoRlRWMlQwUGRyb0dPRWFTbzAxTVVBMU5lem1Ob2xa?=
 =?utf-8?B?L2t2M29kNkJGbEpJTytMaDFWMktoK3hyUlNEWVZhSCs4bXJCRkM4RHpPQkFP?=
 =?utf-8?B?NFNTMld3eDAwZ0tOMHdxTldwMHU4YkkwdGhkM1hBd3h6RWYvL2JWOEg2ZUlH?=
 =?utf-8?B?dUdaYWZkNFVZN0FCc3U4Y0JKckF1alRSTXYwditjT2RHL0txLzZjelRtR0NF?=
 =?utf-8?B?WHpTNEU4MzFNbk9TckthejlacHp2bmxUam9PeS9TSGlJVTNzOHpJUzRvQ1B2?=
 =?utf-8?B?YmJYWWRVeGpSTXU0TTM5WHhNdEVYWkhYMC9TMWlkV21PamViWFdxWHRoLzhn?=
 =?utf-8?B?a3lraFIvWGdvc09SdjVFTlRaUnV1NjhxSUFmVzZha1AxVkQ0dXhTZy8vK0R5?=
 =?utf-8?B?WUcyMkNRalJVaDlHckhOTWNhSlB2bjE1WnJuMlhiVEVjOTlKSk1zTW5wT1ph?=
 =?utf-8?B?bmsxTWNFUlpCd2RvU0sxZ2JBcXFlNWVLcW1xeUEyNGVsVTZobUp1MHFEWVNu?=
 =?utf-8?B?QWNaV3g4RFIwMEZ6aXJCR1VFU2F2eHFtNkU3S1Y5Y2kzMS9jTmlOUG9kOU51?=
 =?utf-8?B?Y1ZYMTJlQUU2M05SbmVuS01CWE9iRVBLaTdQMUVVQkZNUDlROWZpdUNpN2ZL?=
 =?utf-8?B?b1IwNkoxU2gxQkpjaXVQdUN0MG5TTE01c2hVWm5NSWJqT0luOHdUZVg1QW0x?=
 =?utf-8?B?YWJMQXhyb29HSkluS0dNa0xGb2ZKdXN0ZEorWEhrNzliak5OMUFSdlRXKzI0?=
 =?utf-8?B?bWhJVHBTb0Y0YnlTZnl2a2c0WjhuVkVaeXVZdmF1bXY5R2ZzNjdHZWtDVDkz?=
 =?utf-8?B?M2RPVG56cCtiVUdOSzRvbkNMZ3FCQXBVQnltUGdjanQxcFRCc01PKzlBUTdW?=
 =?utf-8?B?THVoUFM0dmYyS0ZhdFVWbjErM0pnN3JkRmFOdGtubGczM3N1RXZtOGJGNWFm?=
 =?utf-8?B?cnYyb0FVYUo2THdveWFOU0JRNllKOTRwN3FHMEg0V3ZQYjVCZlNKZGtLWlpk?=
 =?utf-8?Q?OImRhe2koPtsrSoHRRWDUBuSr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20cdad9e-11d9-4d14-03db-08de2ce88a65
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 12:37:20.2132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/fjHk/W597h5ckHZRvQMLA0f0agTrBvqK13RjV+lL+KXrMatB0JFHiTKbIU/7TjL+0vUsRiNmpIOuSWBc/l3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6850
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


On 11/26/2025 11:28, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Replace old xe_debugfs subtests:
>    - igt@xe_debugfs@xe-base
>    - igt@xe_debugfs@xe-forcewake
>
> with the new ones:
>    - igt@xe_debugfs@root-dir
>    - igt@xe_debugfs@tile-dir
>    - igt@xe_debugfs@info-read
>
> The new tests cover the scope of the previous ones, extending it with
> debugfs verification at the tile level.
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>   tests/intel-ci/xe-fast-feedback.testlist | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index 017e3ba2a8..15fce6a42f 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -74,8 +74,9 @@ igt@xe_create@create-execqueues-noleak
>   igt@xe_create@create-execqueues-leak
>   igt@xe_create@create-invalid-mbz
>   igt@xe_create@create-massive-size
> -igt@xe_debugfs@xe-base
> -igt@xe_debugfs@xe-forcewake
> +igt@xe_debugfs@root-dir
> +igt@xe_debugfs@tile-dir
> +igt@xe_debugfs@info-read
>   igt@xe_dma_buf_sync@export-dma-buf-once-write-sync
>   igt@xe_dma_buf_sync@export-dma-buf-once-read-sync
>   igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync

LGTM,
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

