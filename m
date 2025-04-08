Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56840C369A7
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 18:49:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17C910E171;
	Tue,  8 Apr 2025 18:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jn2F+UwL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A719910E171
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 18:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744138160; x=1775674160;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fWuXL/uXf3on6HwpSbZZ4KDhoAoBfnMv/ZaYREOduWo=;
 b=jn2F+UwLKLdv6prCqKwFiGafkfeJV+/QkTelRk6dRuIn5mFK2aYUIHkE
 dzLvwm6dfflf1s5jIZrwiRlgSpVrfCJJlW7g7DSOCc7fR6bltezfyGVtK
 002zFEEIuGS9NxxlueU+R0Mybr9/2cxSOfV/XLUkhPZmaGzTPIuH/57G+
 6U0acoIFvi9Zy70l+JWYtCvyw1kSS0EfHMc6x+G0hv78e+CiFvMDmNcUV
 evAY9CTnPatULwINKTMo8BwynfcM82a4I9ZEoFWdN0keyD1mxWgVBAUnX
 Y76+3ggVRR+T2dtoXUWi+M9+g/iAeYFmHCchn5t/dV/4L4VNCGwIJ7UtN w==;
X-CSE-ConnectionGUID: bonscG4CS7+nZB6swmBlYQ==
X-CSE-MsgGUID: VAswW3X3TNifPv0dUs2l2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49249531"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="49249531"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 11:49:19 -0700
X-CSE-ConnectionGUID: O5cSihzPS+6M/OHx9v/g/A==
X-CSE-MsgGUID: kOtZp1GAR7W7LkSnvD3sig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="151536507"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 11:49:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 8 Apr 2025 11:49:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 11:49:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 11:49:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVTdL5fif2l7jvHf/DXKKnw9IQhEBRnuOLmqyJJexP2TdNiZopnpaGybG1qiBQKnB/3UWShHScQnVCZ0EJmdW3oL+exNvNm1OKUnPWat0JemTn7Tk9R2pwubfq4xic1dfLtSOLwRhTeHgZDO63fjZPpvR/SrWZ8aUN1+kF54CMmpSZncaaSjuR3kiMCUIazGQV69TeNtj9h0d4j9qUIlXugFGS6xR/kTxfFT29N5J6AY04rZOFuiSDKY/qjtlaOYORmsdNN2jrKAuyKULua2mjjD/E2LpWePCuNY6noCjYJSlYMuYaay8ijAg/6Q9CPzW/nJjFUa8WgSEyGSGDUioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOecucPqlrCve9RqMsRE6ioL3Hxr4jE6h+vgkxEZcpI=;
 b=s1bNsWS3rCLXPi9n2dqyYY+kfJuEahfeUpYM6RXfpxrJwz4B6EIfOvgsFukKhY0HsLMMDuYGci1GN0pd5/gr1Fvau3My5T5rI0ozunnr1dmINzBZ3ye1NcFnJwj1Si4iHTiaCCFy7GUFsHp26uT3X+mEc4Te6HEvMQYQlTG3YyG99omcoj98rY9+9xTYhuHzj96HAwRlYdgnyeafbytiXkF6t/ln9qusW7GqgSrEHrz0OMx6cGmfca+MAhG5HATBq+tu/chtp+Kbe4oq3/Vw5FvzCIBwHTTvaHwHkibtT+dQLR1sBV4ZgQuIECceyTgjpyYi39Lwl+Nk/CHC2LbRMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by PH8PR11MB8064.namprd11.prod.outlook.com (2603:10b6:510:253::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Tue, 8 Apr
 2025 18:48:27 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%4]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 18:48:27 +0000
Message-ID: <57fb5855-e794-41b4-bd7b-6d4818dea2cf@intel.com>
Date: Wed, 9 Apr 2025 00:18:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 6/8] tools: Add new sharpness tool
To: <igt-dev@lists.freedesktop.org>
References: <20250110195100.150301-1-swati2.sharma@intel.com>
 <20250110195100.150301-7-swati2.sharma@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250110195100.150301-7-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::13) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|PH8PR11MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: c8f2135d-3480-42d0-1637-08dd76cdf308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjdaVzlYMG9mYWZDVU55N1VIbHBtRzZ4cCt5aDk5TWZEWHIrVG5ERmUxWXR1?=
 =?utf-8?B?MEg0TUx0eDFVRW9La29RalM2anZ4MXovbEo2Q2NXbjVhUmFHRzZlY3duUUZ2?=
 =?utf-8?B?Ym53Q3R0b3dwSXhQNGRXSkdCOXFpc3JrNGZKWVVMTm05MzhoT3N0ZUhoOUVw?=
 =?utf-8?B?M3Z4b01RTjl0bUkyKzZ3TG5vR1Z1VlVaZ0hWKzl4T2tRd3ZyeElpc2l5V1RM?=
 =?utf-8?B?T1dYYjd5UVowMkpLeXUrdHluTlpJNDl0VytFbGZQUWhBeXF3Q3phTlZMUmxo?=
 =?utf-8?B?cCsrR0Exc2VrN1JidW14UDRxdmxlUnhvR2NRM0RhU1FGamQ4L01NQ1g1R3NE?=
 =?utf-8?B?TlprKzF4MHNyVzBLWHZOTWlicFdlb0tOS0h6NnZMZlVFYlhjNFlDb2N2Qys4?=
 =?utf-8?B?bFJRalIwVXRXcTZZdjRHL0pEelhWRGFUZjdobUNYRHN0NFF2VVdNN1F2Smt0?=
 =?utf-8?B?NFdBMC9FenlkeEExQ1FrK0pBMVZCcDkxM05rTlVrelpnT0oreVJUWSswZCtz?=
 =?utf-8?B?dU4rbGQ5SkNIZEY1WFEzYnBVZEFORXlOZ2FoVXh6R1lSVTFiWFpkNTdHeUc2?=
 =?utf-8?B?NDA4WE12YlhvZEZQeXhVUC8wZWNSbWJlUm5JYVkvNFM1KzlNNEg3VFZpM3lk?=
 =?utf-8?B?YlN5Q1phM2xMSlY1QWdIN0t3cmNCUjhQOFBLZXZTaWdheVNLbUtHdklBYkNQ?=
 =?utf-8?B?ZndFdmN4cys1dG5ya1lxMGNNUGVtelFXSFB5YzArNzdFYkVCVThJWEZ6UGs0?=
 =?utf-8?B?b0s5VWY0Q3dBZjF5NjJPUWJtbVlGdi9oTFhteHQ0ZVU0R2hjd09rSG5TNVhM?=
 =?utf-8?B?L0IxdjJMVGNtbmtkVDFSTjJmK3JHZ1RLUUJUN0F2MmhqeXUxTXZ2YzEyWGFn?=
 =?utf-8?B?blZUM3RjL0hDZ0VqQk9uejZUZkdhek5KaldqZllvVk9WZnZlR09GYmxubkNE?=
 =?utf-8?B?aEdrWlRpZGxQcUt3OFV3aWtaYUs5Y0VzNzFOTWVKdEg3cGw3MFdGSWdsbTZW?=
 =?utf-8?B?RVhLMWpURngyOU52L0ZGQUMxVWVuamUzTHo1UXkxTm5ZQ09LU3pxZTR0QTVB?=
 =?utf-8?B?Nll6RGFrbC9lcXVDWURYaE1PWWIyRCtITGlJUDBFLzRiVGlDWk1Bb2xiREJn?=
 =?utf-8?B?bEpKN0FENUR3dDdsNFhUbkVvS25nSldZZmRPMFg3UkkzOEdMd0RnQUptWnNK?=
 =?utf-8?B?TXZTbHZBSXlWcFRHNkJTVmNuUkRDWTRNa21LeHl3L016MnQ2RmoxRG1oU1dQ?=
 =?utf-8?B?Z0o2c3dLcWtkcWhvdDQrdlJLbUZRdk9SQVBXYnZ1WnR2eGJkN1VjSnBJVnk1?=
 =?utf-8?B?MjF1OEl2ZDJxUzZPR0hCU0JnWksrTUhZamNsS0VoaElPcUNjVmtBVXZMUGta?=
 =?utf-8?B?SzJ2ZUUzeFRTeWdubWxqRUpBSHhralRVMEpNZGoxUGMvVzF2ZDl4ZE1jRVdO?=
 =?utf-8?B?WGZPa2s2RW1pU0hWSFRORFZJekRoV3Y5SmZjTzB2MjNkZmdnd1I3aHlqRng2?=
 =?utf-8?B?L3FpRWRWTHUwZXJ0R3RsZmE1dFR4K0VyOFRuZy9XM2dvTnp5TXlrbTFUQ0Ux?=
 =?utf-8?B?YkppcjlibzRoOCszMURhNjdxUTNHWFBqTUswYXNLekdFVC9xdVZhV3lHaStL?=
 =?utf-8?B?Y1ZHdXFnL0FxdFFUQ3AzWHM2VHorbFZEeTdwMTJkZWJFTmk3SDJvcTRRc3h5?=
 =?utf-8?B?NFRxODkwU2lXQzBreGRzNWhPUXoxSm1ZbnFaVU5yWk10OWM5N2VPZzc5bm5s?=
 =?utf-8?B?ZWZudGNRT1N5Sk9HQ0hEcUJkbG5OOGZLU01CMWdxd2lPcXU5eUU5OEdlQlo1?=
 =?utf-8?B?Qzk1ZjR4OExsY0JjZi9HMC9pOWl2WkhkT2dtUy8wOTloQTg1WUZWRlh2THNu?=
 =?utf-8?B?SE5wUnFSOVcxaFNzQVMxUytqZWVydmNEdkVXT2g1aDY3Wk5MRDVUMHU3VTVy?=
 =?utf-8?Q?vEHOuh4nyOU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?US9ubTdQOGlIWmJ6bFBPVnlwdjM4dkxzZ3RBdFNoL0FlRmVPdWViMmZ6T1VM?=
 =?utf-8?B?MlN4SEFGNlpnd2FlQThiZ3JJc2x6cW5CSFBGOWVxV2o0R0sxUGdHWjBsdExK?=
 =?utf-8?B?Zi9GY0lsdStuWW5uc3BwRHJubkMzOUdUcVYyWnZ4dXUxc1Y5RWxNclp6RGRj?=
 =?utf-8?B?UE5BcHJtY1FtZzRZc2xkcjJpclB1NllHTUorNDFqcU1PUUt5YjhHR2FENCsx?=
 =?utf-8?B?dE9GY2hmVUVwa3lTSEpRS1psQmVkNXpzMjUxL0VDUFBPaTZ2dHVyTExzN1Rs?=
 =?utf-8?B?YWFuUi80Ry8yS0pXbzZDR1lRYTB3Smh5bEM4dExQdGZuQUs2Ty84b1FLMkpz?=
 =?utf-8?B?d2hVQVBmNi9jOTVPdG9XU0gyMk5kRFpFVVpuQnRSQVJQMnB2b2JWMUxyMDN6?=
 =?utf-8?B?aHRmUTV0RWJZSmdzbWZuWlhPcmpCWWVaZytzTWFud0J2dXNRdlRrVWVHNVgx?=
 =?utf-8?B?MVNuV2JXSWg3QlZLeGsrVkswR3plZ2lVUjJpeVhNS0pQSWxIbklzK28wODhr?=
 =?utf-8?B?bWQrOFZSMFVFUFkvMXJ6UkFrZWExOTdkZGVXTURQcHdMaUlnZkdGY3IyODlW?=
 =?utf-8?B?OVU5Yjd3dzNQZmw2TjRRQmhOR21IcTl2S3ZyVmd0cVZkNDM3blZoVXhyOEJk?=
 =?utf-8?B?cTIrV1VjcjJGaHRweTRMZDFsUjlNSFU2cUlmeExjL2VHWlh2WmNHbUJhRmc4?=
 =?utf-8?B?MVVXQ3pKNEJOcS9jNmRXZC9UcjI5V3FoeVl2RDQ4S090cU5rd2JHYkV2K2Ez?=
 =?utf-8?B?Y016Y09OaC9rNUdibXUyMlk4SjdiRXpaN01Wa0hsVjR0ZkU3MXlDQWJOTUNG?=
 =?utf-8?B?TWdtVnJWWnk4d0I3eHRxSzVMbjZucjErdWxucTduUWhTNmp3NDhJV0djTU5O?=
 =?utf-8?B?RGwzbkZKYUtKTHE3amh0UW5IY0NyUFp5Vjh6TmMwL29wTnpQOGNQQXRPdklj?=
 =?utf-8?B?VE90OFZFU3VtT2J1aTlIZjJRY2YzTS8zUWR5UmlCSFNUSXAxOWtQTmVUWjM5?=
 =?utf-8?B?VGlIMVpxcFowa0pkSE1nWjhWVm5uT3E2ZXhXTE51dXp1djZIUFdESHhmS0oz?=
 =?utf-8?B?bFVHcE9Ub1hnQ1VXY0lYN1A3SzFsa1ZUUjNXczRSZXl5eW95dnNxRzJRN0ht?=
 =?utf-8?B?bHlJMXVyR0Vtb0Z0TEJOa1VUZ1A0d0g0Wi8zQzN5dXJQTW1GK0lCYXVNclps?=
 =?utf-8?B?LzI4ZFlFZ3F5dmc2OWdZeXpzWW9KVXhXNTQ0WmhaN2dxSm02N2JyYk1DWXds?=
 =?utf-8?B?SnhnUmR1bFZ1ODF0S3NjUk9pUUpjRDVURlJ2Uld3V1hXbE5CZW85UW9xZk4w?=
 =?utf-8?B?bXJXQ3RibTRoZzNNSzRPaktGNkZvTFRzZzhYRHNmZjdVOHo0RDgyYWxPbXJF?=
 =?utf-8?B?M2dSZm43enFoYzhUZDlmRHVINDg5NU0zU3d1UVAyOGFTekRFUEV3NVJYUmtl?=
 =?utf-8?B?cUx0OUdrYVhmMkVCZzBJY0J6dFBTa1dHRWo1KzBMZ3YwMWtYbmZ6UEVld3Nv?=
 =?utf-8?B?OHdYV1VVMEd0M2Rwd09lUkM4c3RPSVdJdUh6bUZkeis3MzZ3VXZYQTk5QnFh?=
 =?utf-8?B?M0grVFlrTTRHMjVXMnYzbW1ldk9oTXhRdWh1TURpYzZrd0Z2aFNsZ1k0MDBT?=
 =?utf-8?B?cy9XeFZpV1JIQ1ZpbFVqUFY0T1RubGs4b1k0OW5MQi94YThOUldHUzhjQml5?=
 =?utf-8?B?SDRtL1QxVFQ2SGgveHJFcjUzRU56eVAzSXZrMlpVdkZxZVk0VDZNRUNMTGp6?=
 =?utf-8?B?MGpqTlRIM0dJSmNBVXJ3bzVwVVdtYnJCeTd1WUtUUUNoYXQ4MlEveUFLV0hE?=
 =?utf-8?B?QXI5eE9nNy80SEtjcW9JNy8vZEpnN3FjTW9uUFlsNzNkSXoxdzBLR0U5bnMv?=
 =?utf-8?B?Rzk4WWdpamdCL0VQUGhlbXh1VDkvdHlOZHRrRk4rdjd2OEZWaWVqMEk5OHU5?=
 =?utf-8?B?ejViNm1kTXlTTkhOUHZSOWpDaXcvMjRTb0w3Y0hPTysrRTRvUVdkR2MwcDh0?=
 =?utf-8?B?dnBaZmg0QnllcEhYWjZjRGpBKy9VTlZJTUNjK1o2RkRKZ1ZSUVhNcGRDQVho?=
 =?utf-8?B?VnA2dTkrcW9pTnBNOXZSajM5d0RnZldTeWtPUlUvNVd2dmJJMCtzUVJWa0pO?=
 =?utf-8?B?UGhDWFhBK1lQVmRITWl1SUpaOEd2cjVyLzEvY0NCTHhPaUE3YXdtRzI0QUZu?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f2135d-3480-42d0-1637-08dd76cdf308
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 18:48:27.7748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c5pTmC6tGU9zPN14CuPEMTpaFMrfSC4xj435MaMQY8WEugyAQnnc8rXcNUVBmLA3Euj/bg/p6U9UJ7l/QZO0ISdnruhvXx8B+9T67+WzeqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8064
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

Hi,

Patch has style problems, Please check.

On 1/11/2025 1:20 AM, Swati Sharma wrote:
> New sharpness tool is introduced to validate basic functionality
> of content adaptive sharpness filter supported with intel LNL platform.
>
> Tool has following 2 main functions:
> 1. input user defined strength value (1-255)
> 2. input incr/decr factor for setting strength and use up/down
>     arrow keys to increase/decrease strength during run time
>
> To experiment with sharpness, HD 640x480 default image is used.
> Option is given to user to provide HD, FHD, 4K images as an
> input.
> NOTE: Image used as default is a stocked image.
>
> Tool has following options:
> -d <incr/decr_factor>:		increment/decrement factor for
> 				sharpness strength for HD resolution.
> 				Default image will be used.
> -D <strength>:			sharpness strength value for HD
> 				resolution. Default image will be used.
> -h <image> <incr/decr_factor>:	image file for HD resolution (640x480) and
> 				increment/decrement factor for sharpness strength.
> -H <image> <strength>:		image file for HD resolution
> 				(640x480) and sharpness strength value.
> -f <image> <incr/decr_factor>:	image file for Full HD resolution
> 				(1920x1080) and increment/decrement factor for sharpness strength.
> -F <image> <strength>:		image file for Full HD resolution
> 				(1920x1080) and sharpness strength value.
> -k <image> <incr/decr_factor>:	image file for 4K resolution
> 				(3840x2160) and increment/decrement factor for sharpness strength.
> -K <image> <strength>:		image file for 4K resolution
> 				(3840x2160) and sharpness strength value.
> -p:				prints this message
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   tools/intel_sharpness_tool.c | 370 +++++++++++++++++++++++++++++++++++
>   1 file changed, 370 insertions(+)
>   create mode 100644 tools/intel_sharpness_tool.c
>
> diff --git a/tools/intel_sharpness_tool.c b/tools/intel_sharpness_tool.c
> new file mode 100644
> index 000000000..89d307e32
> --- /dev/null
> +++ b/tools/intel_sharpness_tool.c
> @@ -0,0 +1,370 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include "igt.h"
> +#include "igt_kms.h"
> +#include <unistd.h>
> +
> +#define DISABLE_FILTER 0
> +#define MIN_VALUE 1
> +#define MAX_VALUE 255
> +#define UP_ARROW 65
> +#define DOWN_ARROW 66
> +
> +#define MAX(a, b) ((a) > (b) ? (a) : (b))
> +#define MIN(a, b) ((a) < (b) ? (a) : (b))
> +
> +typedef struct {
> +	int drm_fd;
> +	enum pipe pipe_id;
> +	struct igt_fb fb;
> +	igt_pipe_t *pipe;
> +	igt_display_t display;
> +	igt_output_t *output;
> +	igt_plane_t *plane;
> +	drmModeModeInfo *mode;
> +	int filter_strength;
> +	uint64_t modifier;
> +	uint32_t format;
> +	const char *png;
> +	int incr_value;
> +	int width;
> +	int height;
> +} data_t;
> +
> +typedef enum {
> +	NONE_SELECTED,
> +	SHARP_INCR_SELECTED,
> +	SHARP_USR_SELECTED,
> +} option;
> +
> +/* Sets the sharpness filter strength on the display pipe. */
> +static void set_filter_strength_on_pipe(data_t *data)
> +{
> +	igt_pipe_set_prop_value(&data->display, data->pipe_id,
> +				IGT_CRTC_SHARPNESS_STRENGTH,
> +				data->filter_strength);
> +}
> +
> +static void paint_image(data_t *data)
> +{
> +	cairo_t *cr = igt_get_cairo_ctx(data->drm_fd, &data->fb);
> +	int img_x, img_y, img_w, img_h;
> +
> +	img_x = img_y = 0;
> +	img_w = data->fb.width;
> +	img_h = data->fb.height;
> +
> +	igt_paint_image(cr, data->png, img_x, img_y, img_w, img_h);
> +
> +	igt_put_cairo_ctx(cr);
> +}
> +
> +static void setup_fb(data_t *data)
> +{
> +	int fb_id;
> +
> +	fb_id = igt_create_fb(data->drm_fd, data->width, data->height,
> +			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fb);
> +	igt_assert(fb_id);
> +
> +	paint_image(data);
> +}
> +
> +static void cleanup(data_t *data)
> +{
> +	igt_remove_fb(data->drm_fd, &data->fb);
> +
> +	igt_output_set_pipe(data->output, PIPE_NONE);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +/* Tests the sharpness filter by applying the filter strength and committing the changes. */
> +static void test_sharpness_filter(data_t *data)
> +{
> +	int ret;
> +
> +	igt_display_reset(&data->display);
> +	igt_output_set_pipe(data->output, data->pipe_id);
> +
> +	data->plane = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
> +
> +	setup_fb(data);
> +	igt_plane_set_fb(data->plane, &data->fb);
> +	igt_plane_set_size(data->plane, data->mode->hdisplay, data->mode->vdisplay);
> +
> +	/* Set filter strength property */
> +	set_filter_strength_on_pipe(data);
> +	igt_debug("Sharpened image should be observed for filter strength > 0\n");
> +
> +	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +	igt_assert_eq(ret, 0);
> +}
> +
> +/* Checks if the sharpness filter property is available on a given pipe. */
> +static bool has_sharpness_filter(igt_pipe_t *pipe)
> +{
> +	return igt_pipe_obj_has_prop(pipe, IGT_CRTC_SHARPNESS_STRENGTH);
> +}
> +
> +static void set_output(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_output_t *output;
> +	enum pipe pipe;
> +
> +	for_each_pipe_with_valid_output(display, pipe, output) {
> +		/* Restricting to pipe A */
> +		if (pipe != PIPE_A)
> +			continue;
> +
> +		data->output = output;
> +		data->pipe_id = pipe;
> +		data->pipe = &display->pipes[data->pipe_id];
> +		data->mode = igt_output_get_mode(data->output);
> +
> +		if (!has_sharpness_filter(data->pipe))
> +			continue;
> +
> +		igt_output_set_pipe(output, pipe);
> +	}
> +}
> +
> +/* Handles incrementing or decrementing the sharpness filter strength based on factor. */
> +static void do_sharpness_incr(data_t *data)
> +{
> +	char arrow;
> +	data->filter_strength = 0;
> +
> +	set_output(data);
> +
> +	/* Handle incrementing or decrementing based on arrow key input */
> +	while ((arrow = getchar()) != 'q') {
> +		if (arrow != UP_ARROW && arrow != DOWN_ARROW)
> +			continue;
> +
> +		if (arrow == UP_ARROW) {
> +			data->filter_strength = MIN(MAX_VALUE, data->filter_strength + data->incr_value);
> +		} else if (arrow == DOWN_ARROW) {
> +			data->filter_strength = MAX(MIN_VALUE, data->filter_strength - data->incr_value);
> +		}
> +
> +		igt_info("pipe-%s-%s-strength-%d \n", kmstest_pipe_name(data->pipe_id), data->output->name, data->filter_strength);
> +		test_sharpness_filter(data);
> +	}
> +
> +	/* Clear the input buffer */
> +	while (getchar() != '\n');
> +	cleanup(data);
> +}
> +
> +/* Allows the user to specify a sharpness filter strength value directly. */
> +static void do_sharpness_usr(data_t *data)
> +{
> +	// Check if the strength value is within the valid range
> +	if (data->filter_strength < MIN_VALUE || data->filter_strength > MAX_VALUE) {
> +		igt_warn("Invalid strength value. Please provide a value between %d and %d.\n", MIN_VALUE, MAX_VALUE);
> +		cleanup(data);
> +		return;
> +	}
> +
> +	set_output(data);
> +	igt_info("pipe-%s-%s-strength-%d \n", kmstest_pipe_name(data->pipe_id), data->output->name, data->filter_strength);
> +	test_sharpness_filter(data);
> +
> +	cleanup(data);
> +}
> +
> +static void print_usage(void)
> +{
> +	printf("Options:\n"
> +	       "  -d <incr/decr_factor>:          increment/decrement factor for sharpness strength for HD resolution. Default image will be used.\n"
> +	       "  -D <strength>:                  sharpness strength value for HD resolution. Default image will be used.\n"
> +
> +	       "  -h <image> <incr/decr_factor>:  image file for HD resolution (640x480) and increment/decrement factor for sharpness strength.\n"
> +	       "  -H <image> <strength>:          image file for HD resolution (640x480) and sharpness strength value.\n"
> +	       "  -d <incr/decr_factor>:          increment/decrement factor for sharpness strength for HD resolution. Default image will be used.\n"
> +	       "  -D <strength>:                  sharpness strength value for HD resolution. Default image will be used.\n"
> +	       "  -f <image> <incr/decr_factor>:  image file for Full HD resolution (1920x1080) and increment/decrement factor for sharpness strength.\n"
> +	       "  -F <image> <strength>:          image file for Full HD resolution (1920x1080) and sharpness strength value.\n"
> +	       "  -k <image> <incr/decr_factor>:  image file for 4K resolution (3840x2160) and increment/decrement factor for sharpness strength.\n"
> +	       "  -K <image> <strength>:          image file for 4K resolution (3840x2160) and sharpness strength value.\n"
> +	       "  -p:                             prints this message\n");
> +}
Add one more option to select the output for multi display config.
> +
> +int main(int argc, char *argv[])
> +{
> +	int opt;
> +	data_t data = {0};
> +	int ret = EXIT_SUCCESS;
> +	FILE *file = NULL;
> +
> +	option selected_option = NONE_SELECTED;
> +
> +	// Default image for -d and -D options
> +	const char *default_image = "default_hd_image.png";
> +
> +	if (argc <= 1) {
> +		print_usage();
> +		return EXIT_SUCCESS;
> +	}
> +
> +	data.drm_fd = drm_open_driver_master(DRIVER_XE);
> +	igt_require(data.drm_fd >= 0);
> +
> +	kmstest_set_vt_graphics_mode();
> +
> +	igt_display_require(&data.display, data.drm_fd);
> +	igt_require(data.display.is_atomic);
> +	igt_display_require_output(&data.display);
> +
> +	while ((opt = getopt(argc, argv, "h:H:d:D:f:k:F:K:p")) != -1) {
> +		switch (opt) {
> +		case 'p':
> +			print_usage();
> +			return EXIT_SUCCESS;
> +		case 'd':
> +			data.incr_value = atoi(optarg);
> +			data.png = default_image;
> +			data.width = 640;
> +			data.height = 480;
> +			selected_option = SHARP_INCR_SELECTED;
> +			break;
> +		case 'D':
> +			data.filter_strength = atoi(optarg);
> +			if (data.filter_strength < MIN_VALUE || data.filter_strength > MAX_VALUE) {
> +				igt_warn("Invalid strength value.\n");
> +				return EXIT_FAILURE;
> +			}
> +			data.png = default_image;
> +			data.width = 640;
> +			data.height = 480;
> +			selected_option = SHARP_USR_SELECTED;
> +			break;
> +		case 'h':
> +			if (optind < argc) {
> +				data.png = optarg;
> +				data.incr_value = atoi(argv[optind]);
> +				optind++;
> +			} else {
> +				igt_warn("Error: Option -h requires two arguments.\n");
> +				return EXIT_FAILURE;
> +			}
> +			data.width = 640;
> +			data.height = 480;
> +			selected_option = SHARP_INCR_SELECTED;
> +			break;
> +		case 'H':
> +			if (optind < argc) {
> +				data.png = optarg;
> +				data.filter_strength = atoi(argv[optind]);
> +				if (data.filter_strength < MIN_VALUE || data.filter_strength > MAX_VALUE) {
> +					igt_warn("Invalid strength value.\n");
> +					return EXIT_FAILURE;
> +				}
> +				optind++;
> +			} else {
> +				igt_warn("Error: Option -H requires two arguments.\n");
> +				return EXIT_FAILURE;
> +			}
> +			data.width = 640;
> +			data.height = 480;
> +			selected_option = SHARP_USR_SELECTED;
> +			break;
> +		case 'f':
> +			if (optind < argc) {
> +				data.png = optarg;
> +				data.incr_value = atoi(argv[optind]);
> +				optind++;
> +			} else {
> +				igt_warn("Error: Option -f requires two arguments.\n");
> +				return EXIT_FAILURE;
> +			}
> +			data.width = 1920;
> +			data.height = 1080;
> +			selected_option = SHARP_INCR_SELECTED;
> +			break;
> +		case 'F':
> +			if (optind < argc) {
> +				data.png = optarg;
> +				data.filter_strength = atoi(argv[optind]);
> +				if (data.filter_strength < MIN_VALUE || data.filter_strength > MAX_VALUE) {
> +					igt_warn("Invalid strength value.\n");
> +					return EXIT_FAILURE;
> +				}
> +				optind++;
> +			} else {
> +				igt_warn("Error: Option -F requires two arguments.\n");
> +				return EXIT_FAILURE;
> +			}
> +			data.width = 1920;
> +			data.height = 1080;
> +			selected_option = SHARP_USR_SELECTED;
> +			break;
> +		case 'k':
> +			if (optind < argc) {
> +				data.png = optarg;
> +				data.incr_value = atoi(argv[optind]);
> +				optind++;
> +			} else {
> +				igt_warn("Error: Option -k requires two arguments.\n");
> +				return EXIT_FAILURE;
> +			}
> +			data.width = 3840;
> +			data.height = 2160;
> +			selected_option = SHARP_INCR_SELECTED;
> +			break;
> +		case 'K':
> +			if (optind < argc) {
> +				data.png = optarg;
> +				data.filter_strength = atoi(argv[optind]);
> +				if (data.filter_strength < MIN_VALUE || data.filter_strength > MAX_VALUE) {
> +					igt_warn("Invalid strength value.\n");
> +					return EXIT_FAILURE;
> +				}
> +				optind++;
> +			} else {
> +				igt_warn("Error: Option -K requires two arguments.\n");
> +				return EXIT_FAILURE;
> +			}
> +			data.width = 3840;
> +			data.height = 2160;
> +			selected_option = SHARP_USR_SELECTED;
> +			break;
> +		default:
> +			igt_warn("Unknown option.\n");
> +			print_usage();
> +			return EXIT_FAILURE;
> +		}
> +	}
> +
> +	if (data.png) {
> +		file = igt_fopen_data(data.png);
> +		if (file == NULL) {
> +			igt_warn("Could not open data file \"%s\": No such file or directory\n", data.png);
> +			return EXIT_FAILURE;
> +		}
> +	}
We are exporting png data location using igt_runner. But for tool we 
need to find other way.
> +
> +	// Ensure valid arguments
> +	if (!data.png && data.filter_strength <= 0 && selected_option != NONE_SELECTED) {
> +		igt_warn("Error: No image file or strength value specified.\n");
> +		return EXIT_FAILURE;
> +	}
> +
> +	// Handle different options
> +	if (selected_option == SHARP_INCR_SELECTED) {
> +		do_sharpness_incr(&data);
> +	} else if (selected_option == SHARP_USR_SELECTED) {
> +		do_sharpness_usr(&data);
> +	}
> +
> +	fclose(file);
> +	igt_display_fini(&data.display);
> +	close(data.drm_fd);
> +
> +	return ret;
> +}
> +
