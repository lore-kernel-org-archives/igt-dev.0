Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45291CCF2C3
	for <igt-dev@archiver.kernel.org>; Fri, 16 Oct 2026 21:05:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FA310E07E;
	Fri, 16 Oct 2026 21:05:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD3E10E09A
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2026 21:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792184673; x=1823720673;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H5wyPLOQL/NCcBL36rBwC3y1vhmD0nLeqiZfF55aNvE=;
 b=PUTR22y7bFsIpPpug9O86+qEFmjE9EsjNDuYT1AxDQ3kysPqGg5qlK0J
 79gYUEYjRN5CG+LzMPGICfqrmcwhkpOC2rU0IPB1bSPWj503EBNVDIBZa
 lNJgF4rh4HT7S5sDi9Xc4VVoP1uUXhc9+sngoMsgLVEh74NKypY16ggsz
 tisOJK5lOQGggyaG0NTtw81WaLW6PP1M91XnDRyNMNRU6IY4nMCMYxhsT
 fcSrFvRPfZvgexR7XmaNbRujxBv2oSw6aIcQZHeqVpjo5cLTqchiT9z/F
 iSiwT2XiSXmDw4wvUiDdn3Py/yxqsZk1YtGSbt5XNUGvo0fSgBt9JTwfe A==;
X-CSE-ConnectionGUID: V5wiFHcwQmicNudqbISczg==
X-CSE-MsgGUID: HAflav9nRZ2jovez2C+WSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="985817"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="985817"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 14:04:33 -0700
X-CSE-ConnectionGUID: 5JNYhQcBQw61kPufhqp7aA==
X-CSE-MsgGUID: IM8UvDvvRS6HLwb7XfuB1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2108437"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 14:04:32 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 14:04:32 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 14:04:32 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 14:04:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbJnvwW/YLQKRHxhRI/FnKPN0aTXPM0pUbnOuM8B2scMXI33+2y4Yw72MPObYh3Qv8NNsOFqpje8GcGiVcD7rdnrsN74yJ5bwozQp1fvxIiK/HV+xlZQ2JkIjx8gus7otmXSPjJAvY/K8Xp/J71D9teZQXBDgrilYgF7T5pUM+YC5OoHl/gE9VHWWg8HxGIVx+3gl3YoiuP5WFbIWOUybxeB7XwZS7rRLka+0OvqjsNxDykHJru2iS5c2tJRUNd4QUDrlQoS8zmSeRyEapYMPy3d9SpTGU13F/VTZ2QfS0wqEGkcXQN4gqaudIoCZBEGV29t7//JFYMKq/e6tMzHsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDM178rsk3YIgY+fhHeXOVIUYVMwUMIS49dGc4YwG94=;
 b=K/WtiXCg3YMztMYkK184vYZk/70kFarsAV0wFylPqcQbhye2yFeU7l+XXTxdPsbpYYF4ea23ynOHU/DQyY28hm3uSakUd+UzwecJTA1E4U26zO85SEc+3RE7SMRUHqNM3tjNaqmN2hv7gTFUI00faU9Id+BpkVpnyQ9ZYb8LV1ssR2kUC0tLpmFV2bkeWY3qJr35eBY2kU76hMzml3TWUUF1z4HPUXdg6SIjZ71QWzwKeTn0gn531IYcSTwHQFVJvOlbzguZc4mJLHkobC7jd75QCA06NxFoJl/DuYEmy0TD6HUD7+vsvLyw8xhA+9WHmaRb4jdfP2zSHZ/H0rpAGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB5280.namprd11.prod.outlook.com (2603:10b6:5:38b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Fri, 16 Oct
 2026 21:04:23 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0472.015; Fri, 16 Oct 2026
 21:04:22 +0000
Date: Fri, 16 Oct 2026 14:04:20 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v1] tests/xe_oa: OAM has broken stream on Xe3+
Message-ID: <atKRVBpFmlsPy7gV@soc-5CG1426VCC.clients.intel.com>
References: <20261013044215.280639-1-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20261013044215.280639-1-shekhar.chauhan@intel.com>
X-ClientProxiedBy: MW4PR04CA0165.namprd04.prod.outlook.com
 (2603:10b6:303:85::20) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB5280:EE_
X-MS-Office365-Filtering-Correlation-Id: a1c3f045-55bf-4979-aa18-08df2bc90d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|11063799006|261009223027099003|18002099003|22082099003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: J+itbFGRhqJjNL22L7bm+e1u0Rnan3Qztcw+tO+V5NenoO3njVLVDfdoWV1TeE22bUfQnETbFfendYnYy1tJZ7hoL0bWdMHLq+DYbkKhXiTwp6aYychbBIfcQWi3VT/kVroPThwWCGAJXOpqfdaRI94x/iZ3E57eucIechQnMwfvChGg3ZAcGBereNcJpU0dDQDIheEknSLQmb1B+5Hb9W2Fvmb+iBs11Exkt5yb8reE1GU9ycHDYb+6X5PEd/b433qjzh88FndrFTSoWDT4LSQ8FR/sBU9KhQAb/oZZlDBqQBL6VzxrvYgX6Pe0tykL+k948L1eM+bv4D/ey+doIZop4GjffHDPDpuab5klVsWCswTS4J/A8RMVZQ0ui9j/DrDebYuNSXWGUrNns9nd4/Tix0qW2oO1/bjHx/lgy2lBIqtqcR8PIpzE4sTBTX2TjyDGotrkMbtOs2/dLGR99/teZLEv31PaCbelGCuCpw1RvvX9HKx26wV7FyUsenNpi6Dn9XNMnEXf0WfiZ5LqvMfkFXTgmd9hrAoEcNpaMUYn83D/VIgjmpW6tEs01NS4dKEWcodFO7L5hHeoVY7H48+EGaz1JlGVQnfyA+siheXyvf1vM9DpxN2Ch2GzSwtBgbrVZm9lmQ6auxx9o/nKbd+Qn4PlJ8US8aE0vszOl4o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(11063799006)(261009223027099003)(18002099003)(22082099003)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHRhb3RKbXdDejFwa0hFbjcyVmNYcnBnWk9TWlFVeU9Hdll1L083d0ZJS1Yz?=
 =?utf-8?B?ekovMUMxamZDcW9ML2IwdHdza2k5Q1R0cE9TcWpGemJlMGZTL1hhRE1ySWhC?=
 =?utf-8?B?RDFUOFcrRStXRTViUitKaDBBeVJWNDRWMmFrR0ZsdFlmdFdKRFNnSmRsZVFo?=
 =?utf-8?B?SmpLdWlhRDJ4ZkpncVBCbGw4TG1zZkRPQ3diM3hVSFRIbDliRHFKcU9JVWlB?=
 =?utf-8?B?ZzJ6WGx0YVJuRktTWEpEZVUvNGR4dHVSR1k4MXgzdDBDNVo2RkxOYS9zK1FX?=
 =?utf-8?B?V2dac0pkQnBER3RCemFQRlF4OElxZ1g0bForWGk1S29KOVYrSjUxUm1MalQ3?=
 =?utf-8?B?YWlRL0pNcXIwTXhSU3h3RDlrcjk5OUg0ZHZxcTEyWE5STFFDNlZRTHFvaTlS?=
 =?utf-8?B?ODg3Yld6cnl4RVg5YWpEYitmR3F3UnhOMVZQSnp1OTcxR1p2eU1mbnlyS3FS?=
 =?utf-8?B?R2Z5RExNOTZiNWhjd0hpUUhiZVhsSTlEb0tuUDkvWXlXZGFwWGVmdWxzMDVV?=
 =?utf-8?B?dVBqNkpucHV4L3pmNmdiOS9mWmFNNVVSd1VZaXkwRldZTjdvVy9zS1ZIR3dI?=
 =?utf-8?B?YWF5TDBWYTBNZ1cvTE5McjNabk96R0xQV0dFaGpucFo0cDA4cE1jUzhOWXJr?=
 =?utf-8?B?cnRzMWU3RS9XdTM0SGlEenFxdklUa2xQYmc1bGJXZm1pWmlXL1N5R3IwSFN0?=
 =?utf-8?B?SmNCaE55SXMwY1A2RGVVTnZRRHp2RzRaL0hvQTN0dFJwaTNaZHkxNFFqL0wv?=
 =?utf-8?B?WktsSUhIMExDcFlaTGltbWUvalk2ZEwxU0g1SFdvanE2aUV1cGhEb3BoUi9p?=
 =?utf-8?B?cCtOekFzdGwyS0Z5TWxUV3Q5UHRGcDFZanp3RVlma0g2bm9ycU5hQ1N3bCtG?=
 =?utf-8?B?amJucFJ1UC9XaTJjcm1JcVZzQ041T0txeTl6Zi9zQUZFczZXckl5WE1YbVNL?=
 =?utf-8?B?cU5MQVJzK2Z5bEJacUlIMWhTYWRUamN3Y1J5WEVlekxqVUNYRXhKVzdyNXMv?=
 =?utf-8?B?bjRWVFo2Q0ViTjhPWlVUYVBKRXdYZE1FclpOWGFpU0dqV2FpUTU5K2huYTcx?=
 =?utf-8?B?NzBjWWdrR09BVE9BR3BtS0ZhVFY0Sk5TaUpDME5OUEZ4WkxRZTFacU9JTGEz?=
 =?utf-8?B?VXVYS2c1WUNabFJ4cjJoTVBIOTNETUJ4ajhMYU1LQ2ZPc0xNQjllS05QTHdJ?=
 =?utf-8?B?L01pZVlGcVMxWDRaNWxsb2RSNGFJNlNId0UwM00rNkVPME1Vam1heGVJNktL?=
 =?utf-8?B?akErYzZORmJRT3hMVWFJZ0pZN1lpQ0cvMWNCUXR5cDBxd2RZdXgyK0xnclI0?=
 =?utf-8?B?b1lPN0VsbnovTFpwVWREZGpmMHBFNjNqUGNoYzcyaVNwMFozUVZkdWc0dk45?=
 =?utf-8?B?TFpQOFhJaUQxSFBXMXN1bExyY1dERVFPOEM5R1BjamxNMWlFaVJxa1hhWGJE?=
 =?utf-8?B?YmJIbGpURWsvU1hGbjJ1V1lvRTJQLy9JRG8wYU5XYTdubVdQeWw5Vk12MVpJ?=
 =?utf-8?B?SkMvVTRFTGFRd0NXeWNMa25CMjVCRWwyM1NkV01udWxLSFkrSkhPNzVoVUkz?=
 =?utf-8?B?ZjFDUXB4dFdTNFljbU92UFdBclpqTEIycFNWN0dGaEY3eHg1b3dYYUcxN3A4?=
 =?utf-8?B?NmtEcTU5UldRbHEzb3dQQjdPU2l0NVVYZUR3MjllTm9xUjhiV0YzbUM3bGI4?=
 =?utf-8?B?ZmE4Y1dLdm1LNTJFZW5ZVVZLVktWYkxVSW9hY2FZOU9Zdjg1N2xneDhKYjFm?=
 =?utf-8?B?Z29TRGxjSndYbG9xMVcwNmJnVnFURFpUSW5WM2ErOVBrNjlJWGdlZlJjRTRM?=
 =?utf-8?B?VElsaXBhcG0rTE9wbTVLUmM4anVvRzdlSFZnRXJkbHlCZDZmZzVCdHZKenVO?=
 =?utf-8?B?TWxqQmRjS1FMMXQ1ZkxTT2F4ZnhVQlM2RnBKN0xLTnpNTmJXRHdwVGRlRkFG?=
 =?utf-8?B?NmJjTzBVM0Z2VWJTdjZqYVd1WFUxcGNvd0h2YVIxd0JYbFhnMFRSa0lvOE9U?=
 =?utf-8?B?VDE4YVBpbTNBeWxGVjlxdnhxSlJsZjJnbGdSaVhnM1B4WVo2K2VtdXMxOXBU?=
 =?utf-8?B?QnhMcjNIdnQxT0FWWUZNOFNBUndRYkJUcFRDMG9QREgvVGIwT2ZocFNzbkcw?=
 =?utf-8?B?b3ZYYUcxN0ZHUmEvczBXSURWR1B1cTVMZnkrMVVqaDhMa0RaektFMHBZN1BL?=
 =?utf-8?B?WndwNStHeCttWVlpNHpHWC9OeVJMNGVaTVIwRC8yNTJtNmYva1RhZlBKdlJq?=
 =?utf-8?B?MmtzSGUrSC95b0l4T1gyMW5pMG1SM0h6bTVrZXFWdXc4QmpndThKK3RzOTZw?=
 =?utf-8?B?eXZQdG1MVVUwOTBab0N2RjM1d0JjK3FFWXM0cTJJeWo1RFBpOC9EMHNlL2hZ?=
 =?utf-8?Q?Tm5z6iMJneepj4wc=3D?=
X-Exchange-RoutingPolicyChecked: UkZ82C5PVZG7wl4P+JRkAMvxkxMWWwufTSgxOQpUJjCwIR6xQfaAg2vmbWex93Rnu+94Yj9Q92hPxbR1n0gshZAQDkATZZUdMhwYcu7DGBkiiLPf2qoEowE0Fp5YzIHQHoTqslXe7Ic1QquIRUa2tTaTqBITVKhnEWLD9ea7yIpcwbus8ABRt9dkheFuZEw3SNkacH2X0WzoFFUJXuv6AQOhDNdl53hsCc1UKTz/9KLLQf+H7RLJmDqNM5p3y2Dmun18aQsb1DWFOdRmKfAK/6AFV6+1t2w7Rt5pJX5ubUEKtMcwGkRsy0zBS50kVQK0RRNMkKF0+yM75AjaKC67Ng==
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c3f045-55bf-4979-aa18-08df2bc90d90
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 21:04:22.7452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7bJ2HYdjZPZUFok+or/pIpUM3fThuAYeR8GVy07EWEHqbzfp/djjxqxytnkvQmwbWkVNzfz5C93soTwP2aHDbkmiy504qr7znkJJ5rjhV/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5280
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

On Tue, Oct 13, 2026 at 10:12:15AM +0530, Shekhar Chauhan wrote:
>Extend tail-address-wrap to all OA units and force the 192B format on
>Xe3+ OAM to properly test it since other formats on OAM don't use 192B
>on Xe3+ platforms.
>
>Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>---
> tests/intel/xe_oa.c | 31 +++++++++++++++++++++++++++++--
> 1 file changed, 29 insertions(+), 2 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 9ebb18690..d6c3c4a6d 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -4516,6 +4516,29 @@ static void closed_fd_and_unmapped_access(const struct drm_xe_oa_unit *oau)
> 	try_invalid_access(vaddr);
> }
>
>+static bool oam_has_tail_address_wrap(const struct drm_xe_oa_unit *oau)
>+{
>+	const struct drm_xe_gt *gt;
>+
>+	if ((oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAM &&
>+	     oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAM_SAG) ||
>+	    !(oau->capabilities & DRM_XE_OA_CAPS_OA_UNIT_GT_ID))
>+		return false;
>+
>+	gt = drm_xe_get_gt(xe_device_get(drm_fd), oau->gt_id);
>+
>+	return gt && gt->ip_ver_major >= 30;
>+}
>+
>+static int tail_address_wrap_format(const struct drm_xe_oa_unit *oau)
>+{
>+	/* Default OAM metric sets use a power-of-2 report size */

I think the comment should instead be

	/* Pick a non-power-of-2 OAM format to verify tail address wrap */

>+	if (oam_has_tail_address_wrap(oau))
>+		return XE_OAM_FORMAT_MPEC8u64_B8_C8;
>+
>+	return oa_unit_metric_set(oau)->perf_oa_format;
>+}
>+
> /**
>  * SUBTEST: tail-address-wrap
>  * Description: Test tail address wrap on odd format sizes. Ensure that the
>@@ -4530,7 +4553,7 @@ test_tail_address_wrap(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
> 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
> 	u64 exponent = max_oa_exponent_for_period_lte(20000);
> 	u64 buffer_size = oa_buffer_size ?: buffer_fill_size;
>-	u64 fmt = test_set->perf_oa_format;
>+	u64 fmt = tail_address_wrap_format(oau);
> 	u64 properties[] = {
> 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
> 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>@@ -4879,6 +4902,10 @@ exit:
> 	for_each_oa_unit(oau) \
> 		igt_dynamic_f("%s-%d", oa_unit_name[oau->oa_unit_type], oau->oa_unit_id)
>
>+#define __for_each_oa_unit_with_arg(oau, str) \
>+	for_each_oa_unit(oau) \
>+		igt_dynamic_f("%s-%d-%s", oa_unit_name[oau->oa_unit_type], oau->oa_unit_id, str)
>+

Maybe I did not think this through when you asked me offline. I think we 
should still prevent the tail_address_wrap from running on platforms 
with OAMs that do not supports it. See LNL failure in CI. With this 
patch it runs the test on LNL OAM and then skips it because it chooses a 
power of 2 OAM format (so area_size is 0).

Otherwise we have the SKIP noise in CI that will need occasional 
addressing. Now it flags it as NOTRUN -> SKIP. Thoughts?

i.e. __for_each_oa_unit_with_tail_address_wrap()
...

Thanks,
Umesh

> static int opt_handler(int opt, int opt_index, void *data)
> {
> 	uint32_t tmp;
>@@ -5146,7 +5173,7 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
> 		long k = random() % num_buf_sizes;
>
> 		igt_require(oau0->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
>-		__for_oa_unit_by_type_w_arg(DRM_XE_OA_UNIT_TYPE_OAG, buf_sizes[k].name)
>+		__for_each_oa_unit_with_arg(oau, buf_sizes[k].name)
> 			test_tail_address_wrap(oau, buf_sizes[k].size);
> 	}
>
>-- 
>2.53.0
_
