Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A88D3B7E2
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 02:49:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D6F10E1AA;
	Tue,  9 Dec 2025 02:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GixH0kKy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F52510E1AA
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 02:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765248553; x=1796784553;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lvKsOAsWyJWtD9xbQ2u8BFZ0Dhh8R+yT/TklXizd3K0=;
 b=GixH0kKykytkxyJy2bmeAQ003F8iCw+8MS5b/Xgc5b4G7hSLPxQTYIic
 acQ29iFUYQbpprjktO3lgl0VkyFaeGr3B1NxSxsOaFnD2bVURRClzJ/O9
 0jova49UQ90caLJb+xOtuyQYbxwXYSuD3bvrPhwNEeuLTcgqR14ESql5e
 zqZultbAg/dKAt+ueMsb3wvvMA/q2uqioE1xJteJlgl0pDlkB6R4+WwgU
 rTnDFluminiUfoxmMPMyE4u482MAybNChNwaNksg8VedX12nJwKzihxQT
 iEQZlQMvIpp5QCely24/fvqZt07cEljOgsCA/kba/IGPC+TvWrDQ2u/gj Q==;
X-CSE-ConnectionGUID: Y5OrtuwbQo+1687oheAzlQ==
X-CSE-MsgGUID: 660dfFIuSM+g2l4Fmgf14w==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="66384708"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="66384708"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 18:49:12 -0800
X-CSE-ConnectionGUID: i+Y33PfVRUaAcVpeI1pfjA==
X-CSE-MsgGUID: ZrVYrrsRTh++EXiwsXZCwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="200548077"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 18:49:12 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 18:49:11 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 18:49:11 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 18:49:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dTvk9xP0Qjw1xB38ObCV8Id8wtCC8w1lmGvh6xoVfpXNyVI/ehMTVdQXiAaZubFYUdr/SyP8Bv9yPocHapD5+STibTrFyGiXumEic3R9dNI6U0lSKKFYAjbaQyqqIyh/iz0Jv759eQUcgo2KK4czTvEFw7DokOZKvokPx7OUpzvRTkDPDFW6S5RdgS/L0yfA2ViIliKiOWpIE+Gi82j+ipgZ+ibbf81Q2YnX4/zAYa83wPhl8SZEOozKfkIzm66C7c0iI2Oi/lyt2NURZk+4hd16AZGDz7Ow5jtxjrs9y0NR233E5H4zLg+Dp8pRSHM9Ne8gGhLrsGZsI3Am0TTQ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdddsVcI05tNhJ4Z/vIStPsic9sdh61xciXtHiBcVSg=;
 b=ueFOqjoZVxpUtr0T31P3Uhc21crxSvPHaIb4UkvmnTMcHeosryvqlIpx8LJzONcSe8+abvBNwM7mXxHEQlxnYowf6dCwjHG11N14Cm0bamfDgupPt8ibh/uonlfyAl8i+eMCB2dCdTrqfXsyS/FH9KezeGDJhc6e1kXmV8vWZougUN+f5/DmUrdq8qs6pVOa15O4VLlenP7PyJbAQ/6OPNEM3gLKYnlOugNoRrjHYlP93WGcTKDXncJ5nZPAVNYnAaOlmk4zl353QWaeS5FPn6dckyL4mjb3Ioi7prF1fFuqTw48NnxN+3LMQP6BFPZhsFLNyfQCz1XKnRjfwKWc2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MN6PR11MB8196.namprd11.prod.outlook.com (2603:10b6:208:47b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 02:49:09 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 02:49:09 +0000
Message-ID: <a881e9d2-0b81-4530-9e53-fd59f3e1d043@intel.com>
Date: Tue, 9 Dec 2025 08:19:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci: Blocklist kms_colorop tests on i915/xe
 due to missing writeback support
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <chaitanya.kumar.borrah@intel.com>
References: <20251208113243.1242127-1-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20251208113243.1242127-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::13) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MN6PR11MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: d4680c6e-7508-47d0-b5f3-08de36cd8681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|42112799006|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUpFVElhK2V3cGZvcjFZZkR3N1ZwOUpBN3ZBVWV6K3ptV1VPL1YreWJZeFJO?=
 =?utf-8?B?UzMycUV4NWludTY1dFltM1Mrd3FhOUZHcE42dWw2ckxuTG1lRE42ZmN4aVZz?=
 =?utf-8?B?UG9zdExEQktJMmFEeno2MlBuYlpiVUNMbnpTNW02TmNyTmlXbGJNVXNPbDdp?=
 =?utf-8?B?dXBUbllBVVZqTW1hZlk0bHM5T3VPL2pwa0kyb3QwTlJ1UDVvZDY4YWUxYU9n?=
 =?utf-8?B?Nk5rTTZFMlFBSnlpSkF3K1NUL1RvM1F5OVhoMGtJOHNwNzd5c2d4TENERTcy?=
 =?utf-8?B?cTZtdUhRc05KSzloNzlTQktEV3JFVDExYjdmTXlzU3VpZDdobHcrQ1FVWGhz?=
 =?utf-8?B?ZE00dVUyRU5IZy9iZzZETy9HclQ5d3VzWnN1NnpoTWIwcnhKVE1NM245OFEr?=
 =?utf-8?B?d2U0b0Y1ekVaQ2R2MGMxRDdEZ2c0Y1R4K2Y1YTRYejl1Z0ZNdm9pcHlSNnhJ?=
 =?utf-8?B?TE55empSdUMzTm1zL2hjMWNxSXZjQ2Y4TlZGVTZ3M2VwMHJESTliTDFnYVNv?=
 =?utf-8?B?cHBIQURLWXYzV2s0OFRmNHUycmQ1a2cwUHhzUVVCelg4ZXJjakZJUVpUcDZF?=
 =?utf-8?B?NmpvczhKL2FvbUtmcERRZ1Z2VHlyMGlGbU4wczloSHRTU3VhaGdNSnlieHVG?=
 =?utf-8?B?SmNqdkY0Y3VBcHNjZThMVFRtSzhGVXFKSFhjODZTVnJQNWxTa0FLbHVNM0JF?=
 =?utf-8?B?Z0xpZ0M4WklaRnptRVFYK2ptMm9NWVhKcWt4dkxadVVJMjJveFdiZE9RVjV2?=
 =?utf-8?B?TXpzbzZJYWNKcmZEYzVsTnhUT3FFUytHUXpuWDZpWjJodGlnRWZwbVpTUUpW?=
 =?utf-8?B?RzFyV3FhOXNja2tmUlQwU2FDdU1NU3BLelU3ZDMrT1MrZHExZTJwSWY1eUQ5?=
 =?utf-8?B?K0l1d2dEcXZQbDFOZEg1T1pyK0Y1YUJITmZRQkxWdW1XT21UOUlHN09CZ29G?=
 =?utf-8?B?cjBIV2pVMUdxQ1U1bUFPNEtXT3BjTVB3OWt6cTlCaHRGRnY2WG5QWjhpSHBV?=
 =?utf-8?B?RmV1OUIybzBZRnVSZGVYUzJZM2hCRkxlTzFVR0tJZ08yTGpxSHFmQ2preVlL?=
 =?utf-8?B?NEw4eVk5OG1KRCsvaFJVamxmWkFiQzRZY1JsUTZQaitzRW5OcXc3RTFaaGN6?=
 =?utf-8?B?ZWZOQk5Wa1JTb25yY3dZb25lWmpoUjQ0VWE3bUZSM3hYS1VSMVVIclV3Ukd3?=
 =?utf-8?B?cG51OFozdDBTdXdyTHpNOGtFdHRCUDVqTUpMQUk3MlYxbTNDV04yUzVDbExN?=
 =?utf-8?B?UklubVBpZ0ZhTmEwdEl0NDEydTFiK0daNnZkODNZOCt5ekZLVDd3cEZiWTJy?=
 =?utf-8?B?cElnV0JzeGNpNkFVd3U3Vm9USGhWOXczZ296cFRxK2ZxdG14UWMwdzB0eUxN?=
 =?utf-8?B?eFd0bWZCa0JOdmpsL2JpRVNESTUxems4c0JmSU4rQVRjbFVlazdaeUlMN1RP?=
 =?utf-8?B?Zlc2K05rd2xmcElWWTc2TmtHOFNYMEV3T0JKVTNpd09SdG9sQTVuUTZRcjB3?=
 =?utf-8?B?S0hGQlFTSm9GdEZ4VThqRDdYenZmdGtLOVNKN0JqU1RrbFNqMTAvRHZmeTFl?=
 =?utf-8?B?Q0tLYnNmbFYvRFFndnNMaDRXcjRWYzBvSmhaN2R4WUZidzdYVktuSzh1TlFs?=
 =?utf-8?B?ZU5rbkhMUEtDYnBvWW1SVjlBbFRJSkF3KzZ2SGhmVEI3aVo1cks5bGUyeHhK?=
 =?utf-8?B?ZlVtRmZ3WGFBMUt3eDJaMzl0bUxiWVVzZTBrY3l2d1RrcWRpRSsxZXJ5anlh?=
 =?utf-8?B?dGt2S3NYSXMraWtFTFpzc3dHOXVWbHpKOXIvalFqRzRPSThrdWhwL3FNV0lV?=
 =?utf-8?B?eDRVRGtLc3Y4emhtaWIxWndNVGxKMEo3K08xcnA3SXcvWW12TTVjMUgxNVdO?=
 =?utf-8?B?QW92NEZId29YYzRFY1FlR2dNSmJTSWNDVXA2ZDEySG9JbjcvR1BpOVlFSGN1?=
 =?utf-8?Q?43ToIp/VkBcwfex6jxT5b2DC2EesJGbf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(42112799006)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDlmVnZHTnlldVhHWTg2WnltRzZEMW96K1lzNVNUaFAxWHhRR3FSbVBHaU9p?=
 =?utf-8?B?Qk0zV1FSczVwRHgwbHQ4cCt4T3lJQnFLTWdzN3pCMHBFVU14S2V2M0lJU0Vy?=
 =?utf-8?B?WENuN1Y1NEFhUUVZeWV6bEdibGxRV05QcFRwSEU5Nmwxa2d2OW53cnExeTQ1?=
 =?utf-8?B?bzdkbWkwbkRjSmxZZVJRWktLTFhjUHRkWnlSM1MvbjhuSW5rLzFER0kzVFlU?=
 =?utf-8?B?TC9mZ1BCejM0eTlkQUcvUU5kYWVpcVUzK204bi9TUjBlYUl4dEJiY0RkN09v?=
 =?utf-8?B?NnJrK0NtU3RHcm8rSVRpNm5WWThFN2V5SjFDUlVhNDY5ckJVQTZKWExsTm90?=
 =?utf-8?B?VVo1aUNvYjMvZ0NSOFN2a3h3OVpaNzN6ajJCbjF0M096K1pDemN3Ky96T3Ew?=
 =?utf-8?B?YkZQdHZDTDllTFFia1FxSXluSFpLM2Z0NitGOHFjN3ZpVXZuNFduc0xhMWdv?=
 =?utf-8?B?MEZsWk9DV0VkRVRoY2F0aUpTRUJXbXpiejhJbjB1d0MrQ0s2KzNXYWVFa1Nw?=
 =?utf-8?B?YlZoMjhuY3M3ZmFZWjBvaHB2cHB5QXQxSjZEbGM1bVYvdjhKYUJzUkptS3I4?=
 =?utf-8?B?QWpUTkp2ZFhmRFJ3ajBwZ0trYjlINms2VUVTQnArQlZqZEwrbWp1ZjNvaUtn?=
 =?utf-8?B?K0RWK0QxS0toa28rRTJ5Y1l6MkgreTNjL3dFN2dqeG00RHdBdyt5dnBnU0tY?=
 =?utf-8?B?TUlZeEUvMUhOWnhnRENJM2xWUXlHWG9vdWYyWEtqSk1UQ0wvS1QyWnFIaUtj?=
 =?utf-8?B?OUhoR0ZBaithWG9hT2lFSnBucW1RZ0Y1ZUNMU25qUE9nRm1XMTRqcEZvcUdG?=
 =?utf-8?B?cVNrQTY0ZHNSRWhCaHdyMGxwc0xnbmVwRXhUTHdSYWd5MC9mdUE0UWdUL0Vk?=
 =?utf-8?B?bHUwSHRxOWl1NW83MHFnem1tdmVzS2lGV2NQZ0hnSGlCNmZYb1BjczlzTGJT?=
 =?utf-8?B?b0RGSDF1dFQraWU0cXdmaEZacFVjTkFzSnp4SDk4N2NueWNidG5PckZpMkpw?=
 =?utf-8?B?RHdrQmluWjQzb1dmYmcySGQ3OEJQUXNEWVNlclZYb3JwMkFBTHl2Q0M4ZmtO?=
 =?utf-8?B?MHd5dmRFejZ2c00rVHlLT2RiOHFFbGRZQXhEN0hkS012UVlRM0hlWnlETUxS?=
 =?utf-8?B?Q3I1UTZ2UWdHelFJZmFvUWV0Y3FBNXo3RWFOUlRHZ09vZDQvQjNDeUR0Y3Vy?=
 =?utf-8?B?QWYvblZLTy9LRGt4TXp4SVl1VzNqdXU5VTZKbVVDckgxWU11L08vcXJremdr?=
 =?utf-8?B?alFvU3JLMHQrSDJtUitMWVBvOTJrUjMrVGVsQ0cyZkFaM0JXN0FORndvbFFO?=
 =?utf-8?B?Y3N1dWpVM3ZjMEdxUklKNGJKbldpWnA1NXVCSkY1ZmVWZlFWUkhxZ29yamIv?=
 =?utf-8?B?dEFrdW5Ta09ZUGROejExK2k3M3BlNkpNUWEwZWZZQUZYQkJjTWR5MlgwY3pa?=
 =?utf-8?B?VEF4bkJiSTZpME9xcGQwdkpHYlZid2U4THRxbTJxMExLSzk1ZzB3cWg4VXMr?=
 =?utf-8?B?MWh0RTJuRDdIUlQ3QSt1WGRvWURERGYvMDVnL0MrUytyeDEzMncxeXZrL3Fm?=
 =?utf-8?B?eVA2QlB6RTlZbXVDUjJsUWI4cENBTjN0Sjk5YkVPK0FQdkdXWXBGdTNrY1NE?=
 =?utf-8?B?ZWZVRlhDME1EWFFZTExYSHNaUUpWVkl4ZHFTcG5XaUdsU3RnTDZNNGtrSHpp?=
 =?utf-8?B?OU9oQzJPaWp1cEUvT2JwbldWSUtmT214dmRIK1ArcGYreG9GS0YyK3RlYktT?=
 =?utf-8?B?RXNvTmNZOExHMDZubGpLaUQwMk9aaS82L0gwTDB3dXJCWlJHckt5ckJnNDAr?=
 =?utf-8?B?RlRaZ2tPd2J2eE5sYTdvS0JkMThBTWVuemJVU0Fvc0gyQmlHQmpTdVR4OXVH?=
 =?utf-8?B?VW9VeWRXUE01a3pxdzUzRU1aSWxqb0g1a0F6ZVQxY3MwTjU3MEU1SUdkQmdV?=
 =?utf-8?B?dWdtL1dZUHVuandJdlY5aE82YllBa09zd09UcEh5N3BVQ3dBUHhlQnpod2pt?=
 =?utf-8?B?NXlpMllnOU0vOVhFcExuYWxacllXSTQ3alFnMHcycS9RWGt3MGt5RWhzWTBl?=
 =?utf-8?B?d25la2tJYUtLSmtBcGlISksxS3lEa3dOZDJRREdHd3dxZ0pxOStYWVBjOERK?=
 =?utf-8?Q?r63kXmJvxzS6H3o0xanGtA0ft?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4680c6e-7508-47d0-b5f3-08de36cd8681
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 02:49:08.9668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WsWzrS5/HAN2B/PnPZSKlfdZVonyr9gUp3J7RIO8BoqUepqYcRNJBCNnB3ZO7vz24m4lJWzHHOxWSAJP3EV/Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8196
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

Hi Swati,

Nit: Subject line could be little shorter, may be just have 'Blocklist 
kms_colorop tests on i915/xe', as the details are captured in the commit 
message.

With this patch LGTM,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

On 12/8/2025 5:02 PM, Swati Sharma wrote:
> Colorop tests rely on KMS writeback functionality, which is not yet supported
> on i915/xe. Add the relevant kms_colorop entries to the blocklists alongside
> existing writeback exclusions.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel-ci/i915.blocklist.txt | 6 ++++++
>   tests/intel-ci/xe.blocklist.txt   | 1 +
>   2 files changed, 7 insertions(+)
>
> diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
> index 96d69ca79..dffe464dc 100644
> --- a/tests/intel-ci/i915.blocklist.txt
> +++ b/tests/intel-ci/i915.blocklist.txt
> @@ -192,3 +192,9 @@ igt@kms_sysfs_edid_timing
>   # boards (which support 4K @ 60Hz) are available in the test environment.
>   ##################################################################
>   igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
> +##################################################################
> +# KMS: Yet to add/missing i915 support
> +##################################################################
> +igt@kms_writeback@writeback.*
> +igt@kms_colorop@.*
> +##################################################################
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 63f969416..bd08aa594 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -89,6 +89,7 @@ igt@kms_plane_scaling@.*downscale-factor-0-25.*
>   igt@kms_prime@.*
>   igt@kms_scaling_modes@scaling-mode-none
>   igt@kms_writeback@writeback.*
> +igt@kms_colorop@.*
>   ##################################################################
>   # KMS: Test was written with the idea that edid read shouldn't take an
>   # unreasonable amount of time. The timeout is an arbitrary value
