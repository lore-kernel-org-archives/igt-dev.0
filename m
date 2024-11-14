Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3826BD65C58
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 08:20:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7D910E272;
	Thu, 14 Nov 2024 08:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fgACYdDB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0D310E272
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 08:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731572430; x=1763108430;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oj4w/chbGu5GUHZIXIht32wt5rS0PYoNHxtM7zp1uQo=;
 b=fgACYdDB7NDW7QuxXwIsgjaUVpL8RSljsHNHGsLAp/HJhag+1d/+lQtC
 mtMebzB8NIfvQS2UBmKnbtqWSGD+GuPvxEiljNMGKgRS6Ne3X1kyIu2Ex
 UFnLUzzye44zPxmAq91U92mscXe55+As0dvSMA6fCmi4pFEXfLz2fHBIg
 2djVs4CqooYLWcvelYdqkwuCVCGD7HB09wRkmpfmRp28t+0ULVWY5/KQZ
 pEdOUlnTeHey9D3SQo2xCE03gO0AFLSYKeCbGswT5uTS+PAnT/2nuNScC
 zoVlFiTILbEJeIeG/C308idCBzXyTZ3Szp0PfjyIWLlopV4H7PeAU+Y1y w==;
X-CSE-ConnectionGUID: ffK4DvqtQ2yJIAqEpZDhRA==
X-CSE-MsgGUID: UWIa7hY4S5msc0FZBuMO8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="30906210"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="30906210"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 00:20:30 -0800
X-CSE-ConnectionGUID: S7o3/MtkTCCqGrSS5jWrOA==
X-CSE-MsgGUID: 5E0GR2UORFOmEwrDF59Nxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="125629449"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 00:20:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 00:20:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 00:20:29 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 00:20:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mDct6i0r7wtgW3u1srP/LCNSJHcZevKtL8MKKfxFrga3V5iIMBS5EEDnc0Lbbu5rVp7vY55M27wKbYZkVkAJBJk3BAr2typJwN6WyYbgGcM+EOLSMgTV+R/xtx7uWVb/eLm1CkcitDTX7Ty7nGhQ6o//dd3TekwruRZDO+tDc3kfzEi2RCvBsqrfZ6q/PjCda7IOwtqjtCjsc1oDqCOq+BCG+77e0SglV1Zv3ZRaF3lEypQULNcaRSfNX3aSnIEYv47G1wfHCMjReiM4CcpT4UeBsN7V/Jzr0n4M19VO8QxIDCa28CTtJPSTiRkrrccZTVghkgJBNqSPXNVQOyMooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8KofbHNysc9sm075dQ6Jc+dUU3krMiV/JkH3b86L/8=;
 b=GcQ9iI0goQ51rEK6I/pyW2l61HbDZqxPBLACe8kGUEeHRVq+B2ZSFxK8b0MwtQkzF/WxvYUJlip7yKDqOKguoAhpg9zBhQfVi9RSGOaQ0VQI9h6KecTamlooPnaaU66LVDz0TSl/2/5VVodfI43+iw6/KuYNWHh/PF/tJRvxfv42MMOaMBuarCdI2ehIWUItjJvL8VQXX4uWHx0WYp9kOp6HZ68wHY1+6M2Loo6/NSE5OdWP33XAyywgfwlbRZlQuB8af75WBUmyW4yN42QINw2JC0Upe1pBZvPDEuSTWkjXYFYqo939u+FJwXZYuEh74TNXmhmDtaX6+b5q2SPwGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 CH3PR11MB8364.namprd11.prod.outlook.com (2603:10b6:610:174::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 08:20:26 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%5]) with mapi id 15.20.8158.017; Thu, 14 Nov 2024
 08:20:26 +0000
Message-ID: <89dcec89-6e93-4c61-977f-b3b62a0599d8@intel.com>
Date: Thu, 14 Nov 2024 13:50:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_color: fix data->output
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241112125602.1451660-1-swati2.sharma@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20241112125602.1451660-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0317.namprd04.prod.outlook.com
 (2603:10b6:303:82::22) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|CH3PR11MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b4388db-caed-4025-b90e-08dd0485319f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFZWVVFGM1Z6NC9RV2hZWVhYMFdLOFRlTFZpbnRVQytwVmIya2ZjTE1SWXVB?=
 =?utf-8?B?Z3Q5cVVZQkEwUmliVzFDVWVOWFJwZHVweVc5eGlud0xBcSs4VS9udFBaK2lR?=
 =?utf-8?B?eGdCZDY4enFhNzFmcy91SjRRUHlDYWdFMVQrZkxMaW1hbkViaUlKMlVkOUl6?=
 =?utf-8?B?ejZkL3lvTjd4dGdzVUVqWEZwWTFwTFUvZFprNTNlYnJJT1F2YVIraDUzMkVK?=
 =?utf-8?B?Zkl4aFJWL2UzSU5nb0o0eGZpbXpmQU5DUGFOT3Y2QlpmRFZBVzR6N2hMcGJL?=
 =?utf-8?B?d2dGQkRzNmV0cjVNUWJ3VnNJeXozaC85RUp0RWVTNnp6cVNqOUVTUTNscS9V?=
 =?utf-8?B?WHE3VTdjaXVMQURQcWtmZm5YempKVkJvUFNaYlQzZkhWY0RvRG1NVi9MdVRx?=
 =?utf-8?B?QUM0ZXZCOGJJV0ZHUVVyRmpBdXJxcW82WlVUZ1FZS09ybmZOVGduNitaZmdQ?=
 =?utf-8?B?WFBRQ1hFS3IxZ2c5RHRqSENlTVFFZ2ErbDhsSkJmL3pFRStsL1ZnMFhaYUVy?=
 =?utf-8?B?dk9BVVVmWUdIU2FvbFg5VTFvYjViQm83SUk4MVZNMjFsY2xWWkVaQXJTTEsw?=
 =?utf-8?B?K0VrTUw0d0k1L3h6VWFDMEczK1dUNTVOY2VPb0ZYZURrMmZablhSN3c2eGZ1?=
 =?utf-8?B?Z05Gd3VrcjgyMS92QytpaUx6dHN5S0thek1kYzNmUk4xdGtoamZwWEhJRGh5?=
 =?utf-8?B?dUpVeU9ybmlKbjJyT1NGOFVDazVaMDZCYUxFaEh1eTgwMWs3TFJSODJxTmta?=
 =?utf-8?B?dFMraVl3bUF3SGJ6bkZiWGJsUUl2ajBzaVdqL1o5aG5jcUdIZXlJZ3hteVY0?=
 =?utf-8?B?YW95dG5kWWY2NnRlYzhYK3FNM1FsNjYra3E0TStzUGpIRC9tclYvVGs1MzRm?=
 =?utf-8?B?Z29maE1tSHZYQVM1R1drUE55eVpTTUV3TWtCTTBZL2RiUlo2MWNKdlVuSHFn?=
 =?utf-8?B?NXhNMG5HODFVd3JrQm96Y2xsUE9YZW5NUHptNEpsaW80elJUdTErY2s5T29R?=
 =?utf-8?B?T1VNTExmZExZbVJuYTVSWUJZeHliK2h1dTdRRTB6K1hEbnVPRkhTd3VDN3k3?=
 =?utf-8?B?MUw4RXY0WmxQTlVvNlpHc2kzM2FBSWlPM1Q2VlBaS3ZaamVpbXk1cnFtbGhm?=
 =?utf-8?B?WjhLM3grMUptV1BvRlZwRDc2YTBQU0hUbTBjNEVaSmVJbUlIZG4yYm5VRVBM?=
 =?utf-8?B?cWRuZnhaUWhEN092ajU0b3Q4WmMzOFh0SGk3VC9Xekdqb2J1SHV6dEhjSlZO?=
 =?utf-8?B?ei9SY2t6Z29NT0R5K1Q1V0dCNGhHaEo1Y05aRVlnZXQ1eVlwQlkwNlhuTDNG?=
 =?utf-8?B?T2tLY290RkNtQ21hbTA1MVFRM0tockEvTTBjdVNBZXpNdng0clpDaHEybjVk?=
 =?utf-8?B?Y2ppd1VjcC96bG8ycnB5UWhlS3FCNUpTdkswQjJjVzlUM3IxR1hYSWR5Ly83?=
 =?utf-8?B?RGpPOFRtaGtUNys4M3pvNS9lSXRJdU1PWkN2N2Jvc0lja1FNVXFHWXZqeFN6?=
 =?utf-8?B?YklMKzQ0MXRzSnp3QzdzU0ZpamU0MkpyMWYrUHJhcWVTNFBKczRXQm45TVhR?=
 =?utf-8?B?OUtjeGVJYUgwUnNxR2diWkl0NCtJL1dSa1VXdENOZHdwZDZ0QklUdERqVnFO?=
 =?utf-8?B?aTJHamZtZytzeTJWa3BkcXhLS1J2QXZjLzgvWmpjbkZCcEpIV3paaTZPUkJC?=
 =?utf-8?Q?Q0xeGjw6hYDEgdY7wGgz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekZpa2crSW1taWszS1FGYWtNMEN5bUZ0cXFDd0NOTjBQSW13TnRMVFBZeE9G?=
 =?utf-8?B?RzZ3T0o2TGdKTzBsOTRWM1dZY0hRMERCeVhwM29CTUtFakY2cnFub3hIMUZR?=
 =?utf-8?B?Q2NNTHZ0cDZPMGZxaklqYkdxZUpVTHJYaDJHN0MwRzI4OXpiTURMVysvQ0lH?=
 =?utf-8?B?ZGgzYjd4NzU0a3dkMUFGVWZ2VnpaK0dEMURmM2dpN1pvb05tZWR1U1F1cnZB?=
 =?utf-8?B?R29FNlo1NjdaRnlaTkdZb2tHYjdwb0JEZU5ZYjhmVDBBTFdocTNDb2VndGlF?=
 =?utf-8?B?ZEdWVXM4UDFyN0wxOWVDMElwcklwenA0bkgrYkZiSnl0OWVNUFM0UldaSVVC?=
 =?utf-8?B?UnV1RmhIQUF0YlYzUUZraEhNN0dEcWxWVzZJcHdQT09USTMwWDdKcG83VWJ4?=
 =?utf-8?B?dldFVGdGano4Z1ljMFhmMG5zTnBxOUttd2VIWHptZStUNG5QNmd3S3Rnb2Y2?=
 =?utf-8?B?bmpWblBEQWQwR1l6TjJwVjQra2w4WmVxU0pQY3pGa3BsV3RHMm8rS2ZFMXg0?=
 =?utf-8?B?cHY4bmxXaU05cmRNc2hhTmd3eXpGUFF4dmJPUjVUdTR5Uk5XYnBSTmZxNkpj?=
 =?utf-8?B?UmNyR0x5K045NG5rb0NyMFlqc3o0WWdkQlphOWd2TlA2VDFiMjBQUFhsaHhs?=
 =?utf-8?B?Z3hoNStmaUZNWXV6QlNtYW10NlhLcWYzUVNaTElxSFpTbC8zMHhsbEZrM1V2?=
 =?utf-8?B?TmsrZ1BLZkdHYXRPaHVWNGdBbythZ1JsaGJGelhrMHFwY1RXV2NqZlBiNGc0?=
 =?utf-8?B?WGRCOEJzdlJISWR1bUk0OFRFdEJjY3FyM2h0amd1dXJ1MlMrQytSYlVVZXV1?=
 =?utf-8?B?d2o0dnFMaTA2NHVvRU9pVTJmdW8yNDNaR0Y5ZDQxL2JLTHZXTFRBR2pQMzZm?=
 =?utf-8?B?M1EwaHlBNTFQWVV4NDZjQ0JMa0pDZDBlVmlYRW82VXBiNU8yZmd4dEJ0V2pQ?=
 =?utf-8?B?Unh4VWExUlBXbDdySUEwTmk0MlZ2Ums4bkloTHc2S081NHE0bDYwSTQvYW9X?=
 =?utf-8?B?WU1JWDVOOVQwek5Ra1dVaWdVeisveGxCQUlNV3p6cTZYWXA1L1hETXpueDRF?=
 =?utf-8?B?cW9POTQyUDZnS0RNU2l3ZWQzWG50d2lMemE0eDFjc1daRUR0N3lqMUN0cExr?=
 =?utf-8?B?U0NVS0pzeTFhTVVVdnQrOVRRM0JXQW5odWRjMksySlljcyszelJEV21GVHJ0?=
 =?utf-8?B?M1FYeTNEM0MzYXlHUUxBT2ttVVp3MnFpOVVZbDI0d2tVdnl5Z2FsU04xV2Yy?=
 =?utf-8?B?eVBOZm85Q2hlQlFDdjBZVE5CYTNmelBHRTlsVS9kR2xHY2NFbi9WQ0ViU0po?=
 =?utf-8?B?MDNyYkIzSy92enhWT3pGQzA0emFVcEZ0d0ZNNEZwaEpKSGc1V2s3dHphVmRh?=
 =?utf-8?B?UmxmdEhMcWdtSldUQnVvaEVSTlVWcEVvazlCYnF3amd5OGxmSXVlQU04UDhw?=
 =?utf-8?B?a2F5dTdpcGhkNEFiVnpTdEcxSW13UVRQejdqSEtWMUJya0xuZW85cGs0Yjdr?=
 =?utf-8?B?Ukt4Rk52VXkvTTUwZTg3aU4ySVlMcVdSeVcrT0lDd1pQckc4SjVFVU1GdlIv?=
 =?utf-8?B?NEJkRnJNSU9MMUN2SXgzN1N0RkQ4YmFva2wwK1NkNFZvSFFuSTlyWEtSb2lF?=
 =?utf-8?B?b3EyTlAzZGhkV2UrRVg2R0FJZ2E5c2tJVEV5L0NWZjZFd0haQjAzdkpsa2Rk?=
 =?utf-8?B?L0NiS1E1Y1RmSU84TVF3SUVMK0lmUFFoYUdJYjkyN3ovOGZvRStTZkw0NmRn?=
 =?utf-8?B?THMwdEdKSmF4Q0p0ZXhLaldnbi9adElvTm9kNHFzSWZqVFBqa1lUcHJZa2Uy?=
 =?utf-8?B?NU1BWEttRXdlbTNZazFZMnNncXY2d2xFQ1owYml3eWg2ZWcwSmNxMlZNZk1J?=
 =?utf-8?B?cDNlVUFlMW9SRnFwekRyNGlUK3JjTkVYNEZDUG5yNmhKcFUyVCtWRXcxQ2Jh?=
 =?utf-8?B?WUJhSndhTFRISVlyV0ZKNDZPcmcweklqOGdkbmdIamN1bXVzbU1Ed0hLRWo4?=
 =?utf-8?B?RStkVkxIcTE3REFzRitCNU9hRjBwZHVjYlYwSDdKUFNicEtXSTkzcXRpMjg3?=
 =?utf-8?B?dGh3WkNqTXJZMWhpK3VmS2ZQckVvUkdMTzFqbDVWYnZUL1dld3ZaZkdVaGt2?=
 =?utf-8?B?ckZFNHBWYm1QdWJ0SXgreGtJSDVyckJLVW0xQVJLZ0tqcVFraU1vb3FtWFk3?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b4388db-caed-4025-b90e-08dd0485319f
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 08:20:26.7479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJT75yOX7racWZZhaVNOgAoqYmtPosTeF8gAR5DRzC3xZ4mZHQIB9ovYLS/TobPLsyWMJhW9z9hh2tVbIA0uD+XNU33ExjWIc/udNaJEwSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8364
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


On 12-11-2024 06:26 pm, Swati Sharma wrote:
> data->output at dynamic subtest is getting overwritten by some
> other output.
> 
> For ex:
>      Starting dynamic subtest: pipe-C-eDP-1
>      pipe-C-DP-1: (Max dot-clock: 1305600 KHz), force joiner: No
> 	7680x4320: 30 1030250 7680 7710 7720 7880 4320 4323 4328 4368 0x48 0x9
>      pipe-C: Last pipe couldn't be used as a Bigjoiner Primary.
>      Test requirement not met in function run_ctm_tests_for_pipe, file
>      ../tests/kms_color.c:827:
>      Test requirement: pipe_output_combo_valid(data, p)
>      Last errno: 2, No such file or directory
>      Dynamic subtest pipe-C-eDP-1: SKIP (0.001s)
> 
> Here, eDP-1 at dynamic subtest is getting overwritten by DP-1
> leading to false results.
> 
> Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3362
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

LGTM
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   tests/kms_color.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index d642f561d..4b71d3dd3 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -760,10 +760,6 @@ static void test_setup(data_t *data, enum pipe p)
>   					  data->primary->pipe->pipe,
>   					  IGT_PIPE_CRC_SOURCE_AUTO);
>   
> -	igt_display_require_output_on_pipe(&data->display, p);
> -	data->output = igt_get_single_output_for_pipe(&data->display, p);
> -	igt_require(data->output);
> -
>   	igt_display_reset(&data->display);
>   }
>   

