Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A57C021B2
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 00:44:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331C410E02B;
	Fri, 21 Feb 2025 00:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e9xrt8Ds";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA86410E02B
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 00:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740098689; x=1771634689;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=R9owWnyyF7rwMXAuhpDzO1wZZSkYFowQ5YhJJhxXCQg=;
 b=e9xrt8Dseh0Qi65bAWINt5qNMpeBspz2K44FRAD5XrPp3ThQ1QYOvsmT
 D27BFcBrGAnnoE5VhTD9cI705uzueGRVNqJCTDcqc/ZYieegUYz+zaXfy
 Vnpxn0+8+aE565/gp/AH/NaJwhF05wT40ntJ71STjZ07JUrvuR1zoBsfA
 nwXJBDULmAUjcH2wzd2teNM2hVaIVuN/VVmLbvqkpoa8spECHW+GqS6+P
 Z4mBxGiKMTzCbrmLgxZ7zgtykgbH1z1wfTPRZACnVxtFLbgTbtAg6oMBF
 mtwpUbhERNhHa6TnWKSc8HkjpoPHEEIPDhwBmCTzs24CqDrUhkOxKcU8a g==;
X-CSE-ConnectionGUID: /oADYO/PScmtDSFpbGpyOQ==
X-CSE-MsgGUID: P7IUZB9oTjWOgmm/1EnceA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40916296"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="40916296"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 16:44:48 -0800
X-CSE-ConnectionGUID: yAb2N4eSTZSVc19k3/CDLw==
X-CSE-MsgGUID: AxAycjWqRDCjgkhpyiwPuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="120323174"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 16:44:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Feb 2025 16:44:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 16:44:28 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 16:44:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bq0HQBJeZEDL7p+V2wpBEXO0nA7p/DmyWOqdcbdU0pCXwkZw7gYRarniDC0ESpa2794b7PDr5gWsfjBWgeqCRvzrvFkfmidTXymWNSH9v5LY3IgdpxXGuFizQTNRAY3od3EkzpRRRXVk3khh4O/AYZDTpnTKbGDi2jKdFmVDaKPU/N9GIcRsIF/6RQMF0AUqiNFcdB4nNszQ0JACUz/h8TCLvP7iFiOiO0mEIg1Nb4ojXgJTNzpLNYuTsyhezv17CXsF2dzCHO9vvljXxh004MepjbB2O+EmuzKDglhZ1376obWuvlloZamwPJsLw7f43eyaBz3oYxr6DzaYIDffUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wJepTUa3GfmAkBhmetmBaLQjbKII83UmpB6J0a2jy8=;
 b=BTGXK4s7ciZbWoRCbd1agnJDLVzWbY/L0dqTxtrnf1iwRVmec1wI0mA7SonAAq1UB9KsPUzu5WSnwSrAYqdVJD0h0cQCkog4h13bn2q5DQhiJ84/OuJ7kaZsrORzA3m4krTOrS+Ruxc5qJfeSUWcaixfxOXcK4jFdn49hgtLjIjBbNIDONRa4/vbYsFLHjK4awWv/sIKqbAVgIkq2OC6GAWWua1a7TsZuLnivkmN/QNHd20gTCVcPYLXKaMORb9CKJUUIfw1V5QB26J/SLWKFBDseuQ9R6ByFhTm0Y1yJc+SSWAg2FgUamqJLOcSc1oC8JK7cOYC+t4IRN1sSsfAPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH0PR11MB4888.namprd11.prod.outlook.com (2603:10b6:510:32::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 21 Feb
 2025 00:44:12 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.8466.013; Fri, 21 Feb 2025
 00:44:12 +0000
Message-ID: <86720f95-f7fe-4a9f-bed8-8ba7b16866a6@intel.com>
Date: Thu, 20 Feb 2025 16:44:11 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 6/7] tests/intel/xe_pxp: Termination tests
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Alan Previn
 <alan.previn.teres.alexis@intel.com>
References: <20250213003904.2059770-1-daniele.ceraolospurio@intel.com>
 <20250213003904.2059770-7-daniele.ceraolospurio@intel.com>
 <20250214200754.epzvsyei2oas4wei@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250214200754.epzvsyei2oas4wei@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0065.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::42) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH0PR11MB4888:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a576aa3-e5d7-4a50-00fa-08dd5210dbe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NU5Wa0RDTmk3Rk40SGZWTGV6djJDdXUwM3MydStmNmJlVFFZWmh6WExNcjNw?=
 =?utf-8?B?M1M2UGRqdFpLWVJiZjN3MXg1U1J1SHY0VFRtT0dzSW5RWjVQZUVEb1k1bGYz?=
 =?utf-8?B?NGpCN0YydElreEZITEh6L3VHUU42SFdZWW5GNTRDK25pN2F5eU1QSnRMZnNG?=
 =?utf-8?B?K3JremFLZkxla0ZGYUFoemw0cXNzUWpnKzNCTy92L0krcGxmTWREcVJoaUlS?=
 =?utf-8?B?THloWHk2NURYMFZaVTg3bkVKZzdBYTNDTkhsZ01sZTFwM1Vtc0gvTlN1L0dP?=
 =?utf-8?B?VzNOMWRidlFVVGVxNTlFQnNIU3podzM3cThrYlF6RVZwTzUxbnFNT0ZBby9y?=
 =?utf-8?B?eTVXTHpmWU1SRjZhRHZtNmtrV3VuUTRTaERuV3pJb3VVRlAxNFoxdUVLOXY5?=
 =?utf-8?B?T3YwT2RTWHNNR21DcFp4K3NqUWwxVnJkT2xvcXN5THF6eCtkY2pOREdVVHlM?=
 =?utf-8?B?NlNoTnZVWlRWWFBCQmZBYnpycE1yVTAxcEZ1VWVOdXkwOWxBOUx0Z2FZclQ4?=
 =?utf-8?B?RGp6VXNGOUdVc0JNVVNyV1BLUVJIWmR1dGh0UmZRS3llVU1MUFdBM0o3cVlo?=
 =?utf-8?B?OHJvbkFRRnQ1QlJXTUQ0Vk9zRVkvZEs1WWpxdjMzMGtIU1pZaHV6RVlvNGNr?=
 =?utf-8?B?RnVlNGpPMEtoWmVQU3J0TmRmNVpnc0RnNTl6K2ZqbUdXTUdROXBtbUJKMHc1?=
 =?utf-8?B?aVhwSHBZU0dTS21sbjlKdTcwK0tWNWNKU0dZSE1oK0dmOUYvMENzLzZsSG5y?=
 =?utf-8?B?eWFuWW5uQWY0eS9qVGFDMkF1dTFzeSt2QzRJSS9iUU80SXFrQzd4ZHl1dGM2?=
 =?utf-8?B?dzNkNXArNC81dGlJR0MwMFFsdDRTaHFYOUE2U09kdG9OejFKZlBXS3Qvbjhn?=
 =?utf-8?B?bitUQlZ5T1NOcXYyeW5sNVRFMWR5V2lRcDVuS3YxYzVQY2xDUzhiWWUwSGNi?=
 =?utf-8?B?ZjF3UkNTZkRBc0lpMzVHTlZQcHArcC81TzBPT1RXdmU2Q01ZQS9FcnpiMk41?=
 =?utf-8?B?WjRzTjJyYnRtRmRZajYzR1hnOG9xbXo2SVdJMVUyeG1vSnUvNjJHRWFCd2VD?=
 =?utf-8?B?bXdyREI0M3FTWWQ2OFkyK0hKTk11emYycWowcUttNWlOYUMyRll4dnpFdkpP?=
 =?utf-8?B?WVFrMGhKVUhLeXRLcUxPekxhQ2xRVXNOUnowbXJlL1hCNGRIZzJqMzBmbVNH?=
 =?utf-8?B?NVI4aldXbTJYaXdVYW5jZERZTUQ0dXhvN21XckVOMWkvajg0QzdQcm05Z0tE?=
 =?utf-8?B?VEVpVVJiUlFnblZwY29IUW54WkJEeG54cVlkWUJMRXFCMmFQNWdxdStuZTc0?=
 =?utf-8?B?NWtXR2gzMVk0OG9GNHR3VWk0N3huMDJ3YWZlQ3FyRUltc1ZuLzFqTGVLREg2?=
 =?utf-8?B?TGUyK1hLREs5eTR2YzE0bHQ2YWdka2pJR2oyUGZGV1huNXJ3RmdXb2gwREEx?=
 =?utf-8?B?V0FFTkR2N1hYS1NSTGk0WnZPc3F5aFZzTVhrb21lL0dtU055ZjNqa0JBZmhB?=
 =?utf-8?B?Uko0RjFPVDFZeFB3K2krMmFGMUUwcHQwU2JRZXVQZTYyaVc2cjd4ZXpkTVIy?=
 =?utf-8?B?ck5GRWZZTTlmT200dXNqTndOakZwNUFpbXZIUjREbldnQkZhRExvaFhqbEJy?=
 =?utf-8?B?Sk5pUDVnZHcwZSs4bUUxNGw1UW1lTDJvU1pyS1cxNDlVM2t2bWlwTEdCUmxO?=
 =?utf-8?B?dnp6d1B3ZmJmbE1Pc2s4L3dPTW8zM1FyUHdaaTBubzRpT3NmNnpDUmNYRTVO?=
 =?utf-8?B?ZVdKT25BUThDcGF2MEtSWmMrZ0VhK2hvMTZjNTVXRUM1dGZ6dk5kRmE2Ymg3?=
 =?utf-8?B?QTExOWJ3VzRhTnFIdGowRGVxWEpYMUJBWjAzTzkzd3JseVhabmFvNThHbnkv?=
 =?utf-8?Q?NUM+arT09my6L?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1VEWDNxZ21lc2JOd3E2cnplb1NMbjJyNXdwYlJhQkcwVUhBVDRDaDByejgr?=
 =?utf-8?B?MTltQk9JYW8wcU1PSUFYQnZ5RGdTd0h0UzVzSFFoZ2dyTXhkR01CbGtVVjZS?=
 =?utf-8?B?NHdzL3d3NllJU1pLazQxSVY5M1JBSzB4MXVIcEhuL1hqRkdmczhKWFR0RzdN?=
 =?utf-8?B?OTlCcXVaQ2o1REtDVXBMMzhQQnkzTmwwOWYrbDZ3N1JvOEdFWFZUamJtYzE5?=
 =?utf-8?B?N21pV3VwVTNuUE45MmswSkdaMUtYOG1aT2FUUHRuY3BycExNNVZ6WnpxN21C?=
 =?utf-8?B?YittVkROVFQwU3FrNHZEMmZHY1FwWmI4RmtkQnBTUmQrWXZjcWRSUlgrQXJT?=
 =?utf-8?B?dnI5eDJvRDhVeVRQczVSS0U0dGpVTURhWStsTzVBeUZpL3Y5MzlGVHhpNVlI?=
 =?utf-8?B?dFRkV2R0d3hWZXlhRzFRa3JHYXFONWV5cS8ySkFlL3RFYW1MVjFCQ2tNaDBz?=
 =?utf-8?B?NU9SRWUxZmdYSVM0OTV5RU1DYlMzMVQzTHNaOStxcDB1b0oyRHEzQm1BMWdt?=
 =?utf-8?B?Mnh2RlpjTEM3cXdpK0ppSWdrdHMwV2NoZ0dFcHpOYXhCRmVZN2padUxzTElW?=
 =?utf-8?B?UmJkbXJNME1wQTFYa3RGRCtsMmV1bXEwd3p2bjViTDhxU3JWaCtMa2xMK3Fj?=
 =?utf-8?B?NDVuN2JKVXpuRW80cDE1M3dtS1ZVeVhta0F6SGlEb3RYcWJ0ZGxWNEs0YXQr?=
 =?utf-8?B?RVQ5SWUxdWVzZ1ZUZmtRNTVYVXN5NnNVVkU0UHRXV0I5VXc4U2N5Slg0U1Aw?=
 =?utf-8?B?ZmhDOHBsNVZzZG1sLzMvK2Rmam1xRDRBUXRuQzkwbW5aWmlpdzZaTU9PNldn?=
 =?utf-8?B?czFHWEdUNGR6bXFFOVVPTUVPQVJIWUlpYWtOVDRqZzdESm1Qa3MrdHJYSFU3?=
 =?utf-8?B?WDNxdUNZNFduaXgzSWVCL0hBc3Z5YWFOelJoTnF4aVhkMHdpNTZSRk9SYXdy?=
 =?utf-8?B?QWV3QTQya1ptb3B0NzkzK3ducUlqS2pwbm92dmVTaWRkMVdsYWQxaTA0TTF5?=
 =?utf-8?B?T3dlVHFiMXZHTGNpWnhEWW5xSE9RZUE5dXVGamFMb3dPblk5Tkg2ZE9lSCsz?=
 =?utf-8?B?NHc3ODVGNEVFcXpPNHpFR0hRMzhoQ2FxZnFOTEhkRE5iNnF3ZTg3NHlYRlhZ?=
 =?utf-8?B?dWhZZEJLakZLakVjSm8yOHJTenJHZTNpdk9IVkVlQnZMUjFMdEdRL3lwL2RI?=
 =?utf-8?B?QWtqc1lHSnlqSzlmTmd6ZkdNcDd2YUlHRDRyb09QUWx3V2dxaHFaanI4L0ov?=
 =?utf-8?B?SlFZdVFYc3NVYWFTUXpVQTU4dzFjV21WSzRwT1B2ZE1STUpxOEZZT3dnalZm?=
 =?utf-8?B?THhQbW9ZbEJNb0ZKdDNUOHI0L21yMy9PZTdjNXdsMUFPMkV3bVVkcGlRMFNi?=
 =?utf-8?B?LyttaUQ3ZnpqVThDN0VhemI2T01zMW9yNDZvVml0aXVIeFFyT21RRWVDaEpw?=
 =?utf-8?B?VUlvUHZVaE52dHhsVU0wRWR4SWJBUzNMZ3RCRHVmNExmY3Z0QkxqTGs2aTlN?=
 =?utf-8?B?SWRJZzQvRzFGaEZLMW9ySERYVnBkeEVUZGNhdktOMEVuWE5IV2hPK2s5UUxE?=
 =?utf-8?B?V01Zd1VjWTRtYkY2ek5iS3lQZzkzUWlyR2lUcGFsZGRNN1o3Ui9mYWdUdkFv?=
 =?utf-8?B?MmVIeTl1RjVHZkd1T2FGRGVkY0FiWlc4YTlqNXl6eUJtQjAxcHM5TXZpd0Qr?=
 =?utf-8?B?eVBGR1dEZGdhbDlnNzB2ZFUzN25Wckc4UmQ3Rm9SMWlFWlVJaldCbEFiTzF5?=
 =?utf-8?B?cXBpSlFPSTA0L2FkRHM5R2FjY28vd05qY09sYWdtRUgrc1pzQnZoZVhoMENq?=
 =?utf-8?B?TmFlUCsvaDdObkkxNFQwYTdIODAwQlgxbURRQy90QzBNSVZjMUN3dUdjVDAr?=
 =?utf-8?B?WTZVdmxMdmVPdzRmOEJiZ0pRTUJzMnZNS0NuYkVURHBrVCtpaEdMaUVnS0l4?=
 =?utf-8?B?S21ObUQyQ0xwaUdKTWdLTm8yelZQeWJrK0l2dlJaelpxaVY0QlZDSWRPbXJq?=
 =?utf-8?B?ejhmMW82OXdLU0hlSk1yejRNczRzWVZqVlhFRHhkak1RVDRTS1hicDVMcWlo?=
 =?utf-8?B?NzdBcU5VZnZjTXhYUEhMUnl5K2V4NFoyaDVQV1hmVS9lMTZwbzRQWmtZbGdH?=
 =?utf-8?B?N3NaWHJSS3AvN0JWYjdTcEF4bGJQNGtPSzRzV2ZIN2JpaG1hSmZlbGpUYmMx?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a576aa3-e5d7-4a50-00fa-08dd5210dbe3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 00:44:12.0758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ri9fL0lh3WV63/KN/25PHutf2eqIEDogeMGbLg7Vuyr4L50xVWoPgDIIdoG0jS6TIMGBUK3JFrPyTNlQvmXOBTg9TEoP/SU5S20u2tfSJFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4888
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



On 2/14/2025 12:07 PM, Kamil Konieczny wrote:
> Hi Daniele,
> On 2025-02-12 at 16:39:00 -0800, Daniele Ceraolo Spurio wrote:
>> There are several events that can cause the PXP key to be invalidated
>> and trigger a PXP termination (suspend, PXP termination irq). After a
>> termination, we expect the key to be different and the raw encrypted
>> data to change for the same source data.
>> Additionally, all PXP objects are invalidated during a termination and
>> can no longer be used in submission or kept mapped to VMs; we therefore
>> need to test both the execution and bind ioctls to make sure they work
>> as expected after a termination.
>>
>> v2: move igt_require calls inside the subtest
>> v3: block rpm for tests trying a different type of termination, rework
>> invalid bind test to try a new vm as well (Alan)
> I have few nits, one is from our CI fail:
>
> ../tests/intel/xe_pxp.c:1065:53: error: ‘O_RDONLY’ undeclared (first use in this function); did you mean ‘STA_RONLY’?
> fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
>                                                    ^~~~~~~~
> 						 STA_RONLY
> ../tests/intel/xe_pxp.c:1065:53: note: each undeclared identifier is reported only once for each function it appears in
>
> Please include a proper lib header in a first patch which uses O_RDONLY.

This builds fine for me locally, I guess I'm getting O_RDONLY from some 
system include. I'll fix it.

>
> Rest nits below.
>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> ---
>>   lib/intel_batchbuffer.c |   8 +-
>>   lib/intel_batchbuffer.h |   1 +
>>   lib/xe/xe_ioctl.c       |  12 +-
>>   lib/xe/xe_ioctl.h       |   2 +
>>   tests/intel/xe_pxp.c    | 455 +++++++++++++++++++++++++++++++++++++++-
>>   5 files changed, 465 insertions(+), 13 deletions(-)
>>
> [...]
>>   
>> +static void termination_tests(int fd, bool pxp_supported, uint32_t devid,
>> +			      enum termination_type type, const char *tag)
>> +{
>> +	int fw_handle;
>> +
>> +	if (type != PXP_TERMINATION_RPM) {
>> +		/* avoid rpm entry for non-rpm tests */
>> +		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> File or dir opens should happen in igt_fixture
>
>> +		igt_require(fw_handle >= 0);
> This should be in each subtest which needs this.
>
>> +	} else {
>> +		igt_setup_runtime_pm(fd);
> This should also be in fixture, consider creating xe_pxp_pm test.
>
>> +	}
>> +
>> +	igt_subtest_f("pxp-termination-key-update-post-%s", tag) {
>> +		require_pxp_render(pxp_supported, devid);
>> +		test_pxp_teardown_keychange(fd, type);
>> +	}
>> +	igt_subtest_f("pxp-stale-bo-bind-post-%s", tag) {
>> +		require_pxp(pxp_supported);
>> +		test_pxp_stale_bo_bind(fd, type);
>> +	}
>> +	igt_subtest_f("pxp-stale-bo-exec-post-%s", tag) {
>> +		require_pxp(pxp_supported);
>> +		test_pxp_stale_bo_exec(fd, type);
>> +	}
>> +
>> +	/* An active PXP queue holds an RPM ref, so we can't test RPM with it */
>> +	if (type != PXP_TERMINATION_RPM) {
>> +		igt_subtest_f("pxp-stale-queue-post-%s", tag) {
>> +			require_pxp(pxp_supported);
>> +			test_pxp_stale_queue_execution(fd, type);
>> +		}
>> +
>> +		close(fw_handle);
>> +	} else {
>> +		igt_restore_runtime_pm();
>> +	}
> Same here, both close() and ...restore...() should be done in
> igt_fixture { ... }
>
> To test if all is ok call your test with --show-testlist
> without sudo:
>
> ./xe_pxp --show-testlist

is it ok if I move everything inside igt_subtest, without using 
igt_fixture? it makes things much simpler in code and I'm getting no 
errors from --show-testlist when doing so.

Thanks,
Daniele

>
> Regards,
> Kamil
>
>> +}
>> +
>>   igt_main
>>   {
>>   	int xe_fd = -1;
>> @@ -470,6 +891,28 @@ igt_main
>>   		}
>>   	}
>>   
>> +	igt_subtest_group {
>> +		const struct mode {
>> +			enum termination_type type;
>> +			const char *tag;
>> +		} modes[] = {
>> +			{ PXP_TERMINATION_IRQ, "termination-irq" },
>> +			{ PXP_TERMINATION_SUSPEND, "suspend" },
>> +			{ PXP_TERMINATION_RPM, "rpm" },
>> +			{ 0, NULL }
>> +		};
>> +
>> +		igt_describe("Verify teardown management");
>> +
>> +		for (const struct mode *m = modes; m->tag; m++)
>> +			termination_tests(xe_fd, pxp_supported, devid, m->type, m->tag);
>> +
>> +		igt_subtest("pxp-optout") {
>> +			require_pxp(pxp_supported);
>> +			test_pxp_optout(xe_fd);
>> +		}
>> +	}
>> +
>>   	igt_fixture {
>>   		close(xe_fd);
>>   	}
>> -- 
>> 2.43.0
>>

