Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFC4C87FD3
	for <igt-dev@archiver.kernel.org>; Mon,  4 Aug 2025 07:09:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B5610E143;
	Mon,  4 Aug 2025 07:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ngfOpGFA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92BB10E143
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Aug 2025 07:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754291393; x=1785827393;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=CWUKU5Hgcwk2Lou/ts1LYPKXZ/BPbiu4WR4QJdZ6o1s=;
 b=ngfOpGFAJZCWWkB3oD9EDKGSuHZCoiPZJQCfSeSp07ZZZ1yvY+VrNUH/
 przHDFvoeMvVdIomOYcxMUUA3iv39eDuQZYABqo6FFAh6HYxOQ2CvLhNL
 8lV6VaRLlPL9ntPqEzg0YrHAvtSiwU7R2HaUsc1iaOV/NC2wxJoPvmZcu
 o3kCUOkVqSyBXuRWoBco7OF7A+w3LGFtSGkjXH21lP4VayuMiigGHgdQp
 Ji+qBBku1dyM6ycQ9Ze3zrdY27zn3cfIp8GLI4Ow+9y5hwHRcDAyTf2Q1
 abp64K+67Ck4+l7GC5zNwQWIX/UOGRh1QukSm7RiArZCoDSSwwtSk6Q6C g==;
X-CSE-ConnectionGUID: EhNFDmMcTNSNApODq6ozWg==
X-CSE-MsgGUID: /eFO5A+5QOKVkv4Wu0Tswg==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="67914976"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="67914976"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 00:09:52 -0700
X-CSE-ConnectionGUID: 8YRG7anQRT6zJ0Ginc3YOw==
X-CSE-MsgGUID: 79AjEqNvTAmxWMBEuQvW1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="187782890"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 00:09:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 00:09:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 00:09:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.45)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 00:09:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrXYQ1dXdIe1aShvEY6nYCkM6xebi6v1atametxI7N8/YLM0bHpXRaNw9VX5+jY4u+K1UZekA9ggseRPKjVUNzJLOZVKbe2nFoLqqhdytWU7suF7HRwXdLsMEn7RR5G35XBu59AVfPKoNGpICFRKWW2YErcaFTbxJFyfIUgxjwfd/Tl0H+7OgA9HOwFcBPASaMwfV4kVOyC4/yEuFeQYW6bpddTaPKcXNzB93FDUACK/KhUzgNywldAiwFjofjrrXI9d5fHoMk4J1D/Hve8k6aXD6tcU6ULM3DL/lhNQVEYGjHN+SZGCqeuIEuTBVo+YYH+L7alAcGGvNsVWlybwVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOFgV4yihjLL3CwnOCJBOaxfwa3n9bOuOL8ZCrxRe+I=;
 b=KJMAXyrauPitq7bkGH9ZdRJ76zKREDr14+lGg3GocWT7sJQ3QAcyFeKJjgi7+5miuipg6JWMvJsRpU4groSQFI7SMCAnkrCFCBVRAJeF2QML9bQ5VaXbY6pOSCqkNeESbHob5qOMYEh26VcwC0VjxgCV/7ybWI3/c5xPCDV9j4uju7zpd2jfFO0k6FZTPci13mrgUdK7ISqtXeNhL+lOENbfLhuAuApBi9YjV2fqdKYk2VRw+0Se8Vk+G2jf/9I+0kfbA8LmAgwQEIgg8aYTMRVwe8Yc3JueotR3PFlxSBU44BkK608hMDixnAszKFsJORGlnndvuT5EV6kMihScLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DM4PR11MB7376.namprd11.prod.outlook.com
 (2603:10b6:8:100::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 07:09:19 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e%7]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 07:09:19 +0000
Message-ID: <305af4b9-26a4-4719-b0b7-c2e8a07ec963@intel.com>
Date: Mon, 4 Aug 2025 12:39:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] tests/intel/xe_exec_system_allocator: Set data to
 non-zero value
To: Matthew Brost <matthew.brost@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250714170309.2949211-1-matthew.brost@intel.com>
 <20250714170309.2949211-5-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250714170309.2949211-5-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0177.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::9) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DM4PR11MB7376:EE_
X-MS-Office365-Filtering-Correlation-Id: e815983a-b74c-498f-c9a2-08ddd325d483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDVGQ3RaTWEyL1ZxdVQwSVRTRGFqR1dnUWFDWkZSbjNuV2lWNVd2TnRQc3JI?=
 =?utf-8?B?LzlDVWJVcnNSeVdNSkxOUXgrY3ExRDdyQTQ0b2dzd25GWGNqRWk3SDhUcjhh?=
 =?utf-8?B?a0JENmRGeTZpSCtIeGk1VWc1SGgxN0ppcGZyaGpsQ3M5dmw0Vm9SZ1V5OU1P?=
 =?utf-8?B?aDNzZElhbmw1WlZUem5wOWlJUDVDUHowY2hZUlNhZldPMS9EK1dWbnN6K0ZR?=
 =?utf-8?B?eXN4R1RNUEZKRFNmajJ0OXJpNk9wUGJacWNCN0pMTDV2MTlyV2ZPTzZEU2dh?=
 =?utf-8?B?K1Z5VWkvV1RVYXlRaHhNRHBWTzJkRENjVTFJSlpZMWlFVlJIVWJPSjFxQkpj?=
 =?utf-8?B?T0RYMlRFOGFldXc4Njd5SThGQ0JVUWFsVGVCd2VCNkxvSXJTL0xJenpza042?=
 =?utf-8?B?QU9OSzlBS1U2RjN1eWp4MVJJaFNlN0pvSHlNZE9XdTJTV3hKckh4WVhENTZh?=
 =?utf-8?B?M0M1L1ZuME11REVSOGZPYkt6RnR5WGYxM3o3RW4waTQ3OEc4bWhCMmMrMHpy?=
 =?utf-8?B?SGdGWjF4NnNzU1V4U3Y0d2grRGMya1Y1OXlqWFMrRDhtWVhUZmY0NUJHWVlW?=
 =?utf-8?B?eFYxN3kvbTJTcTAwaFJqUCtsR3Rmb3FkWmZ2ay9PSEVWZUZ3UEsxbVZtZE1a?=
 =?utf-8?B?dURmYmJ0eTdTZmFCVTdxdzR0QnZmdGl1Rktva0N0WExVMXJ4TTBvM3JmT0Vm?=
 =?utf-8?B?Wjk3ZjVkVDF3Tld5Q0h1TlVLSHpaMW5KNDF3bW91MnIwSCtMZlNQa3VIaERr?=
 =?utf-8?B?cE1kZkR3VXJkak05eDZaSEZtcXJNU3hPbHFmNDdxRXg0Um5YdnV1ZS9Zb2x5?=
 =?utf-8?B?UERKbUErMStmSHgrKzE1emlHVVpqVnNaRU4vdUtJcDN3TzIvMHQvRTFIbklo?=
 =?utf-8?B?NmlmTE8zV1FuYTVQV1Y0THRBenA2WE1NbUZPc2pzMERvVlVISWNvdGFJU2Jy?=
 =?utf-8?B?ZlN2RlBObTN0cEZUbmEvU0JqQTJnZ1lyd1hOTVVkcnk1UjdkWk1ITEErVStD?=
 =?utf-8?B?M2pFMDFuc1lOekZTN3FLc09NRUFDeFg1c2wzMEdKaEFNS3RhM1lwaTlDT0do?=
 =?utf-8?B?b0hFNk1Lbk9OTldpS3ZkN01tNEZFeE9ZQlRYcDBvQW1OTDFDV3dOSWV1bjI5?=
 =?utf-8?B?R3NKRUpPRVNoTVZnTWN2WWJYbWllWFQ3cTBXa1BUVHFRR2lXV1dlSkpLWDRs?=
 =?utf-8?B?QnFvVFpRU1NweWMvRmhEMyt6dHN5YjNOcHRxbzNiMGFiUW1ETSthZ1VhUGJW?=
 =?utf-8?B?THM5a3VmbGFzcW9qUm95V2RiQllzWGJIVVVoSXFVT0RhUndUSk5uTTBkeDFw?=
 =?utf-8?B?WWdhY1VuWmZPOWliWGw1UVdkd2NtOWh1WTNNcXZ4NU00Z3VQQ3dzNDhoUDJm?=
 =?utf-8?B?dTBaVkY2N3l5bDNCdytFeU9vMStoenhXaEZ5ZDI5NWZMVFEwUHRndExmOWRX?=
 =?utf-8?B?a1hNbmIxK1NLbXRrOVZPcWFBU3FZb2pTdjhwTDEweFh6RDJ3bjg1MjNxUVpB?=
 =?utf-8?B?aXdoMEdHaTlXK2hGdXlwTEJoQWFXdzVmbE1TUnBORklCYW5TemZWVm9kZENu?=
 =?utf-8?B?YXFIWHBIS2RMeGtpQXFKTUJQOGJqYmpLYnkxK3Q1VGpOaGxtNkwzVnhHeERo?=
 =?utf-8?B?OVptcmhvVFRrOHd6MUg4V0tFT0xONlBtaDFadlZvcTd1azNmQnA2Q3NlM25Y?=
 =?utf-8?B?UnBFWk9iUzZBeFptUzJvSjBlajlHS09lT3BHdWlORzJldHFrY1hqd3N5WWRa?=
 =?utf-8?B?aGdIdm5CdFJ6dE5oM2p1RkhPSG90RDAxeG1kdG9XblRkTm5TbTRXekpoZ1ZE?=
 =?utf-8?B?c0FRNVMrVFdCRlFrZkRHcndaVzhGNzNrNVBVcGhPWFVhaUdhUWdzaGE5cXpV?=
 =?utf-8?B?U0Nrejk1OWc0ZDZXbkdaUWtiMXBIWE1ybkdtaXdjcWZGNlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzVwcUpIenNUUjU4MXZYeHBkT0l5ekttV3ZZYm1iYmM2clUyMEJwZGZwS3dp?=
 =?utf-8?B?N0owTGgwL3E2aUhON29kdGFyL0NWNlhKc2xpaTh1SGtOelBha3VnTng0eFBI?=
 =?utf-8?B?Vjk0SzFVWEc5K1AyWDdVcTJKMmhFU0haTTQrOGprVXdPZHhzaFBWek1EeVNX?=
 =?utf-8?B?MGk1VU9GTjZvWG4zVzdmYThwV0VxdnlLVWpNMlhYUTBJWWthbVZ3YXZJdXZa?=
 =?utf-8?B?a3dia0FIWG5wWHp1SHRLUkpnekk0VUlJMjl2WHBOdDlxVVY0VEkyczh2bDZV?=
 =?utf-8?B?SkNtTE5xQU92SENDcnFPRlZoZmoxNzJ5ZDhObUc5SFRQVm5YQnVZZmdmWTBj?=
 =?utf-8?B?WXcvZDF0QndqWGJJRTgwU0d3SmErK1FtenM3c28xNElCS1FpYVVvMiszbG9C?=
 =?utf-8?B?VGRublBsMXFSZ3NUcHRDZ0hpQWQwblVpMUg5RlhZaGRhYVFGaEQveWF2WW5y?=
 =?utf-8?B?R3pHaGxzY0Z5RlFYYUdrZjE5eDc4VHFITjdONnJBVE1xYUFVVjR5ZXVlWGJx?=
 =?utf-8?B?UWlydEdDOWFCY0ZRY2Q5UGxpemdvMm1oTGpWSklYbDE3RFVSd0tHY0NMbXVu?=
 =?utf-8?B?TEo0RVlaejRwUWJVUVpCVUVYS0VHbDhNQzVHOUcrcy9NdnZyZHJSTUhPbTNx?=
 =?utf-8?B?Rkd2YXJlTEk4Q01uK01Bdllka2RPcm5zSWc0SW96dVIzZFRjS0YrLy9rMXFO?=
 =?utf-8?B?ZzJma0t5RjZEUncxUTlnOEFMcEdESFdtUk5US2dKdWRSWW5kb050U1h4Ukp3?=
 =?utf-8?B?TTlic0ZOc2xBR1FxMC9xM3J3endKb3ord3ExNVdYKzdVMTBEbDZuTGFjSWgw?=
 =?utf-8?B?MGxlWXNvekhMeElrTVZ3Vmt3ckY3VS9nNjVXc3pVRmNUTlFkakovd1F4dzBE?=
 =?utf-8?B?WXMydjVKQy9mdFJ4MUdlZVJFQXEweS9oMU9RNVU1TkdlSDRDUTVxSWlRNXV5?=
 =?utf-8?B?VTNSNGpCWUVnUjRTLzZLNWNjaGhVNStSVUdHNHBoUUJsVWxjT09UbkdNanVB?=
 =?utf-8?B?SGExUG1RTUY0YmV3ZkRObWw2RGh3TnBoYmtxMjIrZ0tzcjFUQWE1WVZRNjRj?=
 =?utf-8?B?cnhtY1Z1Yzc5NWpGQjB0QzRneHp0dVpLbktQZlFZdFFtNTJ1U2FkaGNLVUQ1?=
 =?utf-8?B?NHJiOVhqUm03eHpQeURFQmJCNDJtVDlGV3ZZQmhIbkJjMUFGZlg0VFR3aG9C?=
 =?utf-8?B?M2V1T2NtbCt2UU5DWTV0TXhZNDJCcUxCRDRoYnJJQ3JSVG9FM3VuaFcvbHFk?=
 =?utf-8?B?MXBPRGJBV2t5VEI2UGluWTRpaUExRlZINFVxODNWTm1wZ2tJeTlUNkNKVWMx?=
 =?utf-8?B?QkZOUXhXR2Q0MEU3ZjlNVzlaV3dHZjJYb2JFTnBxT1hTTFI4ZVo2SDYzMEUw?=
 =?utf-8?B?VjROSy9iN1RVTjdlQlAxNlhUVURqaUVpa2Mwd2RSdGpNMG4vN0hPeVdPYjda?=
 =?utf-8?B?djY1RzdHWDNIYkFwSGlZdG15RWRYZkhiVW5yRUZxbWN3cW9HRThZc2ZJZnM4?=
 =?utf-8?B?cXRrVW9Uenh4b3VkS011R2lnVnVkNTVuZ0FwQXhtQzhCQU8xdWQvVGtMbTJV?=
 =?utf-8?B?SDQ0cy8yTGVUaUgrOHUvYitCTEFEREJFQk5CYnpGZkNHb09xTkdkN1g3RlhF?=
 =?utf-8?B?UFlUZ2ZFcExTeGYwK21INlpZdTFkZnp5ZUxya3NSMjFxQ1lOdzdyU25COUxz?=
 =?utf-8?B?OG9TYXI2aFM2ck1QQmREKzV5Zk5aVUd2U0VUZFk1Nit5M2JuMVBJSTNFcWxI?=
 =?utf-8?B?TDdVMEs5aDNucWFOQ2JqSnhUQmdpcG1oRTZ5L2g2Qm54L041YTZjV0FQelJ2?=
 =?utf-8?B?Ynl0Vm5BOTV3TDlUMFdjM2xQWTAvbEJZRlpUOXJVemNkVk5HZHZadUhIL01G?=
 =?utf-8?B?am93Ykd3TkdtemNFL0dYQzFDWG91ZG5lU2N2SFJLTjNHODIyK2I3SkMvdFR2?=
 =?utf-8?B?eWdhdEpDUnlvNytjZlJya2NxNUV0M0UvS0Q1M3Zvbm16bklZclM4VnZmcjV6?=
 =?utf-8?B?K2lubGE4RXFmTzNxdXhCZDVVUHhIZW1iOCtFMTZBaXVkbTI1Tm1XTktaUUJE?=
 =?utf-8?B?Z2FqRnpheWdsVE54Z2xEaXA5ZWJYT2x1UDVIanplcVp4VTFXWWc0enFKZGd4?=
 =?utf-8?B?VmRrdGR1ekZraFREMlBoYUdNSldRTmNjL0FnSHYxVG1ldlhHL1hjQzNpaHlr?=
 =?utf-8?Q?7OUN2GLeWg/op3nDC1ysxL4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e815983a-b74c-498f-c9a2-08ddd325d483
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 07:09:19.0754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1z2AEgsAFoV4YRruE6lDIv2gpA4bG4R1JxVx3j6LtzXrifN8bEVsiJVd1pz/7GFjLarZN9OFfObkzwxDxYJtxogUpQQC1o87JWSJncZBn/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7376
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



On 14-07-2025 22:33, Matthew Brost wrote:
> The compiler seems to optimize out memset of value 0, set to non-zero
> value to fault in the pages.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   tests/intel/xe_exec_system_allocator.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 006a3dc920..dd5303855d 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -294,7 +294,7 @@ static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
>   			   PROT_WRITE, MAP_SHARED |
>   			   MAP_ANONYMOUS, -1, 0);
>   	igt_assert(exec_ufence != MAP_FAILED);
> -	memset(exec_ufence, 0, SZ_4K);
> +	memset(exec_ufence, 5, SZ_4K);
>   	sync[0].addr = to_user_pointer(exec_ufence);
>   
>   	for (i = 0; i < n_writes; ++i, addr += stride) {
> @@ -678,7 +678,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   	data = mmap(alloc.ptr, bo_size, PROT_READ | PROT_WRITE,
>   		    MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0);
>   	igt_assert(data != MAP_FAILED);
> -	memset(data, 0, bo_size);
> +	memset(data, 5, bo_size);
>   	old = data;
>   
>   	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> @@ -692,7 +692,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   			   PROT_WRITE, MAP_SHARED |
>   			   MAP_ANONYMOUS, -1, 0);
>   	igt_assert(exec_ufence != MAP_FAILED);
> -	memset(exec_ufence, 0, SZ_4K);
> +	memset(exec_ufence, 5, SZ_4K);
>   
>   	for (i = 0; i < 2; i++) {
>   		uint64_t addr = to_user_pointer(data);
> @@ -1109,7 +1109,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   			igt_assert(data);
>   		}
>   		if (!(flags & SKIP_MEMSET))
> -			memset(data, 0, bo_size);
> +			memset(data, 5, bo_size);
>   		if (flags & LOCK) {
>   			igt_assert(!(flags & NEW));
>   			mlock(data, bo_size);
> @@ -1151,7 +1151,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   				   PROT_WRITE, MAP_SHARED |
>   				   MAP_ANONYMOUS, -1, 0);
>   		igt_assert(exec_ufence != MAP_FAILED);
> -		memset(exec_ufence, 0, SZ_4K);
> +		memset(exec_ufence, 5, SZ_4K);
>   	}
>   
>   	aligned_alloc_type = __aligned_alloc(SZ_4K, SZ_4K);
> @@ -1351,7 +1351,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   					igt_assert_eq(data[idx].data,
>   						      READ_VALUE(&data[idx]));
>   					if (flags & PREFETCH_BENCHMARK)
> -						memset(data, 0, bo_size);
> +						memset(data, 5, bo_size);
>   
>   					if (flags & MULTI_FAULT) {
>   						for (j = 1; j < N_MULTI_FAULT; ++j) {
> @@ -1432,7 +1432,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   			}
>   			addr = to_user_pointer(data);
>   			if (!(flags & SKIP_MEMSET))
> -				memset(data, 0, bo_size);
> +				memset(data, 5, bo_size);
>   		}
>   
>   		prev_idx = idx;
> @@ -1586,7 +1586,7 @@ threads(int fd, int n_exec_queues, int n_execs, size_t bo_size,
>   		alloc = aligned_alloc(SZ_2M, alloc_size);
>   		igt_assert(alloc);
>   
> -		memset(alloc, 0, alloc_size);
> +		memset(alloc, 5, alloc_size);

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>   		flags &= ~SHARED_ALLOC;
>   	}
>   

