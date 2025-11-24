Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A37CFD31C
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 08:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA53F10E1E1;
	Mon, 24 Nov 2025 08:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iJsO0EiW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7370110E1E1
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 08:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763973309; x=1795509309;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kpKpHlFS7ntT1zunJ5oa0WVN0jWeWOHGj2TS8z9k7sA=;
 b=iJsO0EiWu5eRdm7ZQwT75yIVnDxrdeg4DYl0z5K+azZWCDczaXs+9Mqa
 ox1g7pu2Ou3Fi8beF/FTbFWzhyH+1vnhjQKtDuivHnJBm9qhLvsVEekdb
 31PwGIOCqQZG4mrhAn3veF5XBgsve3aKomau057QA6ALRg4tIKdLtPRbJ
 cBqRPUffNlXqKWk8TdS1qkz3N6S9oQFkjB0yEC0Uu704+dxIX7OJmIFJq
 K8+00/a99HpPf/6J7rQoa9Z4wLyH8FB/7CZXgrZB1uozla39sCi1edtHv
 Zmcc+9dZ5lxcLT5jHnCi+Z9jzAwk6CXjbjasQWJreeLgdZtx1xJe9fm8m A==;
X-CSE-ConnectionGUID: f47OjGOWToaQBlvhKit8UA==
X-CSE-MsgGUID: kBRJ2tN6Q8KJQhFFwOHnWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="69585198"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="69585198"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 00:35:08 -0800
X-CSE-ConnectionGUID: vVjWBilmRrK52G3vXQCcEw==
X-CSE-MsgGUID: 7Ln7UwTGQzqRE2AxduBKEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="197200675"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 00:35:08 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 00:35:07 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 00:35:07 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.30) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 00:35:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JfLZzcgKl7Cp6iHq92YlqG+/5hEAxYC0f2vBmlTFv95v405YX0qVZTDR0MquznJQFunU1fYDiIP2HQu67jLY691zSIYaXOOMbJPfAC6Z720H2MS1Z5xsbjNWy3tUW6u5jV619XmSd800auCquM4eETBTFx0LOQyH/jGnHVkEwz0OO65uXcpxNh4P1nBwlVY2GRCVJuAc9EtNAwxUgTdObA3BBbo6jIw43MVxbIBRNQw42erTIKQCeWEBbcDhI/R2IMLOinU8jl4/ZonTc/X5iQeGjXNg0vQCUcs3iCbn9lN1G4JU1EOpCelIG6jp+X6TXF87zppN/OT+CzhpVGgnNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHxjJS4hw3EHBWVhitklpL/WCVC3CYFVXSyCLLrJqts=;
 b=f+AvHXiOS+k//9r/ZDAXi5BqxabtoMlCnxE17wgPnYrUA2lZG+LytZzCQGgUD/sxGv+4jclnKl5rbGBNUHVF6Lz5aofA46R99rgRnB1VLbZmRPn2a5OiGugtppH3utv4rtfYdWKfV6DxlVTIRmA82CxjXvhLxIUaedml9DV67M+/nMHdXpm96rVjnAulAEGSuWPya8tbzqdDv81qdhZpXadg6SVkaP1lu6JVqVknsR/ShEE0K+wZh+clWD/juYmVYmx/01OO3fq/vE9U0GMvL3ChovuovozIgrEaNVKmfEeowGbG5F4DtAaCPOFAO6LA5Hz3S0stl8eBOF8mvDVJWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA1PR11MB8542.namprd11.prod.outlook.com (2603:10b6:806:3a7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Mon, 24 Nov
 2025 08:35:05 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 08:35:05 +0000
Message-ID: <9c95efb3-cdd4-4a85-b992-65bd32ed7002@intel.com>
Date: Mon, 24 Nov 2025 14:04:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/6] tests: Move kms_sharpness_filter to tests/intel/
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>
References: <20251121123134.1099006-1-swati2.sharma@intel.com>
 <20251121123134.1099006-4-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20251121123134.1099006-4-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0162.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::17) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA1PR11MB8542:EE_
X-MS-Office365-Filtering-Correlation-Id: 87423c34-0de6-46d4-05dc-08de2b345e2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|42112799006|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXJEUVQ1WUJLT1QyQkJjYlVNN3FmcGlGQkl1aGREUHBSMGRLR1NRVlVsZ3dI?=
 =?utf-8?B?eVRDdWV3d0V5TmRYYkNXN0xzU1VYeThBZCsrUGFXY2RFNCtPNEV1czhLTHdN?=
 =?utf-8?B?OFE5Ym54cjBaSGdkeEExVVNrMmJQUDM1MCtjejNuR2piajYyLzRHNUtBbXF3?=
 =?utf-8?B?TlRHaWEvR0REeU01SHBZTzF4UTlFZm15ME9heThuZ1V0SzRyR1JidEVHZGZq?=
 =?utf-8?B?MXpUZDU5cUdqcEd5UzJKc3NpdEhhdXhQMHE4S3N0NUlidGNKbWhNN29UL1dS?=
 =?utf-8?B?blRLSXBBa1JJWDdiVFZudVZFUEt5TEhkTkRrS3JKa3gvV05zb2p2K2NlcGYr?=
 =?utf-8?B?QUtoTjB4N2lzV2tGVDFGaTZQWTExd0xKdGx4c0t3aGdBTFFNVWFQUENDSGsx?=
 =?utf-8?B?NzVYVUsvUUFIc29QaGg2Y3JHUU10TG9hYzk5SXRDclFMYzAxa2F2ejJRa0I1?=
 =?utf-8?B?dHd6emFoVVdVN1JUWjZ6UGFLL0JwMTFKWkpKMGQ0OHNtaHNvTnFoVHJ5dGhF?=
 =?utf-8?B?VUVYZ2dkdXU1SUV2ZmpWdFRmeGxqVDRYUnJ2QXdvRnlEdDg0MVlBdjlDWlVI?=
 =?utf-8?B?VGdra05ZalBZa0dRNlJqejVRTENSWk9vdVNwUCtndnlIdGpjM0JWQm1BUGNF?=
 =?utf-8?B?VmcwSU5wS2xPVzdJSjQ3WWRHUHVOanNSV1o3cEkxMjczQkp1Y3R0VlN5cGEy?=
 =?utf-8?B?TTBVcFJJUlQyWXQwL25DZG5FV0x3aVpRd0pwTTcyZ2NHelh6VGdZcFh4czRv?=
 =?utf-8?B?bm9iSVRmbHQ5Q1lZQWlqQXN5NWlsb1BqY252SlpyeTFOYmNONTZaeWMwQ2pu?=
 =?utf-8?B?bkVSeUhWZ29iMFJ6UnJ5azRVdU5udk5yMGZrWERDeTV6UmUraUNqTmNVTkl5?=
 =?utf-8?B?UGxmZldmZ3dYMmVYV0p3b0FPWFBoenh2c09JMEs4UFlOekJ5NTlzQjlRaDB3?=
 =?utf-8?B?Z2phdko5YWc3V3ZJdWxnT3JUV2JvNnh3VWgxcFRGRFVtSXhkSFR5SGpHWmNM?=
 =?utf-8?B?YjIyeWtnd3FtcWRyZFhwV2VCZEswNHJJS0VmVGJpTFVSQzhERnZzZ2p4Rm9a?=
 =?utf-8?B?czVUZ0poVCtxeHQ5dlNna212U09yM3Y0RnRBNlJmUXlLaG9RdDMwZGJaZmlh?=
 =?utf-8?B?bjNlWHFFUnMxRkxleFM3cFFCVmZ6aVVuTFlFMHh6aGhmL05QSnpmNHJacFNn?=
 =?utf-8?B?ekNFT3YvSmRvMk42YzBKaE9WUVgvaUNNZXdPMEt0OEpPQW9HNDFFdkdsNjlr?=
 =?utf-8?B?Tk9SNnkyWUlLc2xid0l6WnZTT0MzR0llYzhqRlBMTVdGQkhHTU5oK29aY3Mx?=
 =?utf-8?B?RkZQMnhXL2xBYTk0Q1I3UExxak9ST2hkcGRsY05ranlUZEN3by9aOTMrTFJ2?=
 =?utf-8?B?WXB5RnVyZXVkSlhUaXZSbXFSRWxsOTJqWWJBaVdXVG1wZEhCcStFOHFHaWhG?=
 =?utf-8?B?TU4ra01LVzRmbTg4NTErVGVqRWVPMlVrUUFsYVBtbWpoaldlczhoL2JmZ0FR?=
 =?utf-8?B?T3NURTJrYWN6dGt0dkZ4cHcrM0R5ZWw2MEhwZnBYbDJoSEFZejlFMnBQY3cw?=
 =?utf-8?B?WUlteC9FL1JSZWxFSlJpc3E4MktkOGphWFNzam5ZZDVXY2VlUFF0MjQ1NkVM?=
 =?utf-8?B?d2xLOVNhTXd4OXJFQ2c5VmJ5TVVuZFUxMG8yUk95N29YTmFXSkNBVUtDbjZ3?=
 =?utf-8?B?OG94dGdBblMrOFJ2eFlYcEpSRytPeVMwaTIxK3JuOWxkRVY4YWkvY3RxK3BL?=
 =?utf-8?B?cmZvUldJS2kxVTFYK2RJR3JHbHVtMmtBWnpOSGt1UlQybEpLU29wNzJkMFlC?=
 =?utf-8?B?ZmRWSEZ4UDErVGRJY3FhWXpQU21aZ1R0eEJHNXdNZmdhQ3RRaXV6RkFNUkZ0?=
 =?utf-8?B?cHdIT0xLUmhWL2NleVM2bzZzSUYzbys5YWdoWEM4VGlQYVd0RFJQTC9RUFB5?=
 =?utf-8?Q?StvVFiWaCJ2vezCg5rV5LR8zYYl8mO0n?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2szOW91YnpjbXpWcGpLUUc2L09pK2t0bUxybWllTExGWkhpMVAvRktqWkJa?=
 =?utf-8?B?ZlBpNkVVVjFWZktHY01oNFFWUEIyWmk5cW4xdndZMTVUak1pdnBza1ZERUNV?=
 =?utf-8?B?NnJmWExoUXB0bHFUUU1pYVI2ajluL3BXclFsV3lUaXRLSkcveDkvTWh6UVJK?=
 =?utf-8?B?WFVUWWhmSytnYUllQ3VjUnc2TjlxNEFSa0FlQWtUWEpMK3JzRHY2MGdrUVJz?=
 =?utf-8?B?QktKTEFJRkd1bVpnYzFWeU5WaXBpQ0ZKTy9NZm12eVo3b2JHeWhTZHk5ZG9t?=
 =?utf-8?B?U3R3RUk5aW5rRVhqR3huU2h3Mnh2akxLc2kxbzArSlpBaXpZSTN3c1JOekhN?=
 =?utf-8?B?dTluQ0RZTm9EeXI5enR0bVZ6YzFSZ2dDNjVrdEdRZUVaemszTlpGUlRQNStI?=
 =?utf-8?B?K1JGbUpQZWc0RGVwM2dpaGwwWk80RGJJOStnZFlRZjR3UzFNSGwyREpGM0oy?=
 =?utf-8?B?M2tkOWRaY21QdXpCa3QxVjlDK0lMVm9uSDZEZ0VySHpwSFhXVkFORVpFVnhx?=
 =?utf-8?B?VWlKRkhSOTdvaGVBb2ZGVWNOcDVVcFhiTjJwUFR3N3ZOWXRRcGdKeW1WZGRp?=
 =?utf-8?B?QzliZGxNZk9HbzZVRlQ2SVRsUUdTOEsyamFkdVRNWG8rSzcvMVJ1MXc4cXI3?=
 =?utf-8?B?RVVjU1pKTlorVHlBZGgrUU10R0lJWDBrOEc3ZHQ3VWlockZ2dGdrak9MWjRs?=
 =?utf-8?B?V1A3bWg3bkJPUG1RRUlYM3EzSHlHQzEwa3M1RXBia3ZwaU5paURoeVE5QjV6?=
 =?utf-8?B?bHhEWGtNckt4dHpzS2JmemdmQW0yVHJUeEhqdnY0NFQxUjc3amgyaVl6anMx?=
 =?utf-8?B?SWFTWWhUOUd5QVZ5WWdoYnMyNnlFaWV6K1B1REdpZGk5bmhORU83d0xDR0FN?=
 =?utf-8?B?dTR1MmJlUXZVSE5HWitOM085U0FpSmZNR0dsbzZJWCtCMDlvbDA0dzVsekIv?=
 =?utf-8?B?SlFBZXZxUHpxdWMzRllVY1dBVzRmcGNnNTVuL1p0ZDNNS0JOUEUreldObm5M?=
 =?utf-8?B?aHRaWUR5QmdLSW9VbitoYWNlS3pBUUhiWDJrZFVLS0JKNmtqNkZ4SllNT1lo?=
 =?utf-8?B?YUxmNnlKR2k5ajRrMVdvdE1qWnlZQm4wd2FRUFRnbWRpKy9WZjYxQ25hWDMr?=
 =?utf-8?B?aUl2cDlaU2VpdTVkaDBzK0t2SzRvV2hBTEloa0ZxUCtTdXRZSGVGVWZaaXU2?=
 =?utf-8?B?WUpmSjJKTVNFaE04cC9lY2Z5Ry9kSU1wZUloWE1INWx2ai9IeTRac0NGbG1O?=
 =?utf-8?B?MEN1Qkhqb2NMUWdaUEtnQ2hOamxQaDRoRXF0cXJtaGo3NTFkRGVoUk5HSkFj?=
 =?utf-8?B?MnZ3cFpqN280bVZJQVVSLzZLb3I1M1c4andtcHRVWWorc0lSNWYvU1p3UG02?=
 =?utf-8?B?Z2tUdGhlUUJ5dTBmRksrdi9YbkZYeEpjNDZRb2x3TGpWRTlSVmJTU3UrNlp5?=
 =?utf-8?B?c2NpL2dWaEFCWkt2S21Rek9kc0NiZzBFVWVSY2gwNzNVVCtMOE5wN3FhYUdC?=
 =?utf-8?B?K2NtNW96dDViQWhPTTFhSFN4VlpRdlpUTXhBTlE2TFl3Y0F0Vm5LSFhvV05u?=
 =?utf-8?B?TitzYm1NZk9CVkdVaTg2WU1ycWt1S3NYVlNxQmlYbTVOU0NQQ1o0ZGdJNGpr?=
 =?utf-8?B?VGRQTlVObmpnWloxUVg5TE9tOUxXRTRJbDUrcGtvN1JwdFlpV2xrQ3pnNVpw?=
 =?utf-8?B?UksyQ2RreWw1MUpmZTAyNktUSVF5VXUxWkpDbWZ5NVZrOXJRaG9mRVVXMlZx?=
 =?utf-8?B?VkZYVDllWkhlZTJkYW4vOXI1QkttODNzMUpxbVRCUU9NZVpiUEVzS25vdVd3?=
 =?utf-8?B?cUlDZkRJcWpGK2xmZW5WOEhsRkxiUXZ0dGNnSmVITVU3RGRzdm5WaWRoenlT?=
 =?utf-8?B?VGJtd05vZjhwUldnVW9ETlFScU1sUWlkUEJvN0EvaWFMMFdBRURTS2RyWHd3?=
 =?utf-8?B?RkkveU4yMVpTejV3eTM1Y0Jxd1A1QTdxNVJBSW4wOHRPckdiQktDMFNRcFVv?=
 =?utf-8?B?WFRzRGxaVjdseDloTjM2TFkzelQ1VlhFbkFIMVlicytsbkdmUE9oeWVRQ2Nx?=
 =?utf-8?B?YVJXck5vNTF3VUFuYmdQY1RUQjMyRy94MVEwSjJhTENoMlBsZm44eHc0dCtR?=
 =?utf-8?Q?m0od4kih3wbZWLk2JMyaBAAGP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87423c34-0de6-46d4-05dc-08de2b345e2f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 08:35:05.5387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Ioeu/UPfwVfnhVtdQqFbElUMeDwQINfSaPZ4OBxSkYUkAciXirNEA05eYT6bcTzSVw86gQ0P+W8FaKZ9dGUxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8542
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

On 11/21/2025 6:01 PM, Swati Sharma wrote:
> The kms_sharpness_filter test is tightly coupled with Intel-specific
> scaler behavior. So relocate it from tests/ to tests/intel/.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/{ => intel}/kms_sharpness_filter.c | 0
>   tests/meson.build                        | 2 +-
>   2 files changed, 1 insertion(+), 1 deletion(-)
>   rename tests/{ => intel}/kms_sharpness_filter.c (100%)
>
> diff --git a/tests/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
> similarity index 100%
> rename from tests/kms_sharpness_filter.c
> rename to tests/intel/kms_sharpness_filter.c
> diff --git a/tests/meson.build b/tests/meson.build
> index ecc0f4c7f..da70c5014 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -62,7 +62,6 @@ test_progs = [
>   	'kms_sequence',
>   	'kms_setmode',
>   	'kms_sysfs_edid_timing',
> -	'kms_sharpness_filter',
>   	'kms_tiled_display',
>   	'kms_tv_load_detect',
>   	'kms_universal_plane',
> @@ -274,6 +273,7 @@ intel_kms_progs = [
>   	'kms_psr2_su',
>   	'kms_psr_stress_test',
>   	'kms_pwrite_crc',
> +	'kms_sharpness_filter',
>   ]
>   
>   intel_xe_progs = [
