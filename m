Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281EFFF886F
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 04:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C9110E425;
	Thu, 30 Apr 2026 04:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gFqhI1wg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B36210E425
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 04:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777523735; x=1809059735;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BBNEZlK55GkMP58pDfGH2y3Fb2Mp/QE+uhig61joPzE=;
 b=gFqhI1wgrzgHAwXCabxLOonvanlIPp8l9orwpXo4HZeDDVenAdC/v4/k
 lZAZZRGnyY2i27tvU3NWqVwJNx9h1JW0FDK0+Oui8HfdXe4sNpvYQhTmY
 Xi+BFi2TM09FrHh50YqX5EgbANCPgaCMyKbkft1etAgQxkEZcdZNjSJEL
 c/MfnCrgquieU3KinCxHbtLf9sa68L2mtVsWnRmc6FTQ8722D7HlWQPxW
 Op6k0bFtuZeqWfZm7Lec6RWRR9fe4ublQBkTb3ryLfOXzp3oTFD/O9dLq
 873zX7zPCs91nHmd2ET3xkYPZFcBaBcQHkpqgIAUXTAEkxy94+3hCoIl3 Q==;
X-CSE-ConnectionGUID: rkY3hn0kQ4CYNvrFbk4gZw==
X-CSE-MsgGUID: QsaefO8MT8a01I6ZEYcsfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="88776760"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="88776760"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 21:35:35 -0700
X-CSE-ConnectionGUID: Jie3yNk1ShWKEDWQACWxQQ==
X-CSE-MsgGUID: hD09AzhQSUekCd7e51cYSA==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 21:35:34 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 21:35:34 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 21:35:34 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 21:35:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5PGVsMp7jlUT/pqAbQTdVs+ZUaeB3M+qvW42AjTmFvwBuh8TMZRqe8Z3O3kZW4emiOCIS7ZgIaouU9Jq+RT3ZGVKp1hJumMHU6rTAfx74GxVn3hgoJyKmRC1KpSEoXOYm39GiGmyTRrovHnSc5+SoCavjU1IyUoS5z1KvX6Bd1nFZllyFUnPMu55/qx3Cbkr2+IB/v86UUdlvlkdyGtWJJ9RQKDNq5XFah7I9KO7kAe3ea/TeWySEg5E60S8IL+yvsMBtksGwh8mmbtX8ticIOXZSGMeKbqOAPZIwPog2ul0w88ZTLpR3pTlq+xOq6NbkB7VQ0j6ogmWJFcGB+xUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNr7ftg3nNfDN8TadGYYrHZWuUg38GMyk9wA2yKXuUM=;
 b=UwC8zoTHZhXElJUzgxC5NHogfs/wrVQU4Ywm3R8PCvbZWn+XgudlssIRZ5+A1hkPklH0U2KoUucjh0wXoOTholFJVU5+Z4cfvYQL0ZTPP9mP6pveVwWojGrzN6Q/7ZbprVoJwbjbqMRpLA1/bSXVPCz1kzMS4grHcyYKRRu6I6QcPrvI457pkoiO/Mab6/qXf8g+ffQmVLcqcg1QzxTwfYqhQ1vuZAMDGXVJRVPpih/QCZXshaFOPFfiIyUBbRlhiNBDPef+kk2s4l3yizSgyQFGPW+dYOhbu/M8PtOWmSq7mkoU3il2fFb++kgMetjAMQErtYZ0UD3HgzXjwnBo6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 DS7PR11MB6128.namprd11.prod.outlook.com (2603:10b6:8:9c::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.20; Thu, 30 Apr 2026 04:35:31 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 04:35:31 +0000
Message-ID: <c8b97fc0-de77-47bb-85a4-984576bfd558@intel.com>
Date: Thu, 30 Apr 2026 10:05:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 04/11] tests/intel/kms_frontbuffer_tracking:
 consolidate fbc tests skip checks
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>, <jani.nikula@intel.com>
References: <20260416092559.88735-1-vinod.govindapillai@intel.com>
 <20260416092559.88735-5-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260416092559.88735-5-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0178.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::7) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|DS7PR11MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: da5f3685-b5b9-46e4-0ad5-08dea671e977
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: u70ncQoW4ZsA50ESMR/8OQWnJPFB68mHFkzu6vFlIsqXu209e53GtaG49PMcnNKnOsqhdrv8KhE+kg5wjqFP+1ruGjnwys5odOTi0tnSGOVquJ3mB15SBUnzq7KYO0MRzIECU40bWTPQHhfxD4uT3lkbRsLDqvxeQorPpv+Fi9xKHwRXpFldQh7Q1M4e5Jl50xL1cSbKq3R/wOHOuHcKgztIILXs5wK9Sju0vl3FxfJx5h6vpR9Qv6BdjiJa85SFOVPfV+Lq34m8Qk/9GnyQzbNTNSIaXZO1ZzjtFXqHw1fJvljCaG9dfPLJdqfAch3D9HCAGy9ul63i/83v6s+riGFJa5mm6hfqAwMfheZifDbsjAUZuXQHk2i6D6yDta153mm3SYlU9Lp2u7cJ9rU+XLfhExmx8i021N0rc6hUFBkJbYq3WQlnl5cgLFOfWyeAadM1QOBWavdlTzBIH8sp9pD6ZR+g0Sm+YpE417qA8MQl26bKJYJDUqO9e0STTsPez5UhZdpzYMp7jgWQqJz5pNce2pxIJkxzhQoJV0W+iIs5h0Ua6/RucNwU9x07OzyCDukhqYyjXCdO2xcPH+q6vYG46gkyCghp9UvVe+Cp51+nWfKx/t0KaaxQmfngFnYJDk2g9GVY4CdGOIbRVQf01Mp35cElGUMcVONFHf8fYS/LBTB0+rgoKnS5lLJMDJbgck1YjQGq5cpIZMzr/jljJ1rkKue35fYCY7EOEggvQcY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVJROGxleTdNbnB6OUJzTFZjWlhIbmcvY1ppZE85b2dJR2lxRmxyM0dRNFE5?=
 =?utf-8?B?aGVqSFllV0JvYjdCTmFLdW9QMmR0bnpkNjZmN0F4ajlrby82ZURmVmlvTFlm?=
 =?utf-8?B?ejFma055UmlpMDUyYy9QRjlkdHhHcGJWdmdNMkFMRHV4Z1V1V294Z0JBVjJt?=
 =?utf-8?B?R0xodDRhcEt6ak9YMVZkaVpSMWZsODU0K3A2QXAxeDNQQTM3ampCKzk4M1pB?=
 =?utf-8?B?NWozZ1BkeEttLzFabGgxdnFZckpJbzAwVi9LRExraVpXTzhxVFdqdW5NVFdM?=
 =?utf-8?B?VVBsbWU1NkxuS0lKMkJ3Sm1uYkhrMEt2RERmbExrTTRwQUpUVEdCdnBTRlR0?=
 =?utf-8?B?UVQrd2UvdDZGdDJUZ21KRnh2K3FidStnUjJiOEpia0N0ZndWVFhJb2lrd2FO?=
 =?utf-8?B?UmV2ZFlPSlFzMmtkQm04UWRGSERCSnhOUVBWTEhMRHRHMDVwR2hXZmZEejNQ?=
 =?utf-8?B?MFJmVEJjN1VMalBOd1VZTTZ2MUU2eisvem1GSUhQeU9NVFRKVnFGZVduc2NU?=
 =?utf-8?B?WmFWYjgvYi9BbVg0VDVsNFhIMXFieUpKRUNJOG1FV1BaVk1CcS9sTVpOTGUz?=
 =?utf-8?B?RlhEM1lXYml6azMydEhMaWVxVUxMWFR5bnhQZ2Nzdm9BcDZ0NHRkV1VtUUVV?=
 =?utf-8?B?TUtPVE9MM3pmTTVTcEROS0Y3NXNyQ09KWENtQmRMN2dDM0xGS2IxZVJLL2Zz?=
 =?utf-8?B?Z3ZCRVVocjM1dGV1VitYU0djNHFILzc1blZRNWsxRWxqRzB2Z0EyTmtQcjBZ?=
 =?utf-8?B?M2NYTS9NZmx3VVFNNFc0L2dYdXFKdTNGU3pwcTdnSjAydlVvRkNwQTJ1VU4z?=
 =?utf-8?B?OFBaNzNlZjJnc3FObzh2M2FCT2dhWm5VZGo4KzZidUNzZHNUQk9kc0ZuN3E5?=
 =?utf-8?B?aGZLQklOTEdCTmlGT0ZRU0pHbWx0RHpUa1B1WmV6UVdIKzd1VFltaXdwdkNQ?=
 =?utf-8?B?a0htS040R3l3OHR5R1RzUUF1eElVd29jbjlLM1R5ZVgxb1Z4alJiRTJVSXE4?=
 =?utf-8?B?c1ZSSXYxZTVCS29rQkJ1aFpyYVVNZXR5RGFHWlZrTEp3YnpIVTNQM2thN0R1?=
 =?utf-8?B?S3NWNFYzN29kNzFqT0hSWGUwWE16WWxpbERMK2xBSWEyZDBVbmJKc1lOM3Ry?=
 =?utf-8?B?dzdvRndEcm1MTGlSOFpyd09Hb2NkZzJwZ1NQV3dFcWdYSnhXOUIzckdzTnpU?=
 =?utf-8?B?L3lrMUlnc1Qwc3FPT0VteTd6dEMxcTQ2Rmc0Q1dpL1JtMjh5aEpXRkt1WXcx?=
 =?utf-8?B?VFZDUWIrZDArUDYvRGJlTXRCbUdyd2xJUnZkcjk2TUFtY3VFSXVEQ1lCZHZk?=
 =?utf-8?B?SU9zTWZxMTcvbDVJcG9ST3p5RzNUeFc1UHRtdnRQOW1xRlBGK0l6TzF3ZlNn?=
 =?utf-8?B?cmx2cFVyeVhuaXFHc3Bnc0xTZ0RrVGtLc0hJNitRR0FCSmsyS2ZDSXRUemwv?=
 =?utf-8?B?ZjVrdmYwSmtSaU5YR0JHTWRzZi8vZHdpUHY0b0xFdktuRHY2b2dxS2xoSUJW?=
 =?utf-8?B?WUUvNVBBeFVEWlFjTk1IK2FqRnZpTXorVDBPNnZTVXpzSWgvR1hLZ1MvYjJY?=
 =?utf-8?B?VDJValcrNjg4VW5Vb1QxSE53cnpPV2pReTA4R2ZvT0ZiUzNQdFNxWEkrWFJX?=
 =?utf-8?B?RWFFcW41cmtrNkQ0a1JEcURlMG1HaVlxTHh6dzltWkJaR3dPNHFDYlZsK3R1?=
 =?utf-8?B?UmsybThwcXZDVFVLWHJKK0JjZ1hwRzBkYTdEcG15WnhaeFpVNXEwWCtmRitS?=
 =?utf-8?B?SUdVOVFqQXVPaU1YQWtLYjJaMVMvbjVzZGl2aG52RldKNHhVZ3FOcjhMYXY4?=
 =?utf-8?B?RnRpaCtqemd0ZVNIV0h2bHB0OTlIZnRqbXkrb2NFMmphNTAwVFdhek4vK1lw?=
 =?utf-8?B?b1BzMzB0b1NmRFZYcnBZakdQaUozb1hPaDAwMURMUCtUcGpPYXFrd3dKNnNS?=
 =?utf-8?B?cGRQdGd4Tlhtejl3VVNtMUtFcXFSQVdCUEl1N0RpMXR5WXpqQjYranlCVXRM?=
 =?utf-8?B?OFBtekNWUHhwN2dLUUNQeGJ4UVZSY0ZpU25KUXpYZDUzeUdwUkx5dExrRG4w?=
 =?utf-8?B?amYvdEF2aUZ6OGN5aFUxLy9vU0pic1VERCsxUUphNUMwTUhWem1pK1JXSDlh?=
 =?utf-8?B?Uy8yRzR5RDlieUV0V2s0NGkxSUNadGswME1PZWJOL1lqRUczeFY1c3RVVXYv?=
 =?utf-8?B?L1l4eFFzVFZIdVpDTllTc21YeXZZbXQrUnE1MkFDYTRoTU5uVkZ2cVpUTHhL?=
 =?utf-8?B?T0NMV29CeTBjZmhpZWEzNVpHSzMwTFlOd3pjT28wMW9BdDhQMlhCNitlWDBt?=
 =?utf-8?B?azBDVHcrcW1vNGV6cFJ5TlNhWWhDM2pueDVORnVmRGxkaXc3dmNodW1JbHM1?=
 =?utf-8?Q?RC6/l62FiE4L7a8JdcA+3GaaoOuMAwg1YpSC8?=
X-Exchange-RoutingPolicyChecked: OZpp44FTifEsFEbg/wlAkzge0dh9CcakGNM1HAgLzGFuwtnVVDd1FX+OOtYmlQD+/Bd4za1IfmlcuQZkg2Y9lLAFKIKQJkD9u8k2q+ijeN1ARuE79jpVokMuxoGceFIxDucBJbDabOcrBCz57NXinG24r7JVa/fq7xMhJmCiHjRPv3UV/dy4xjhR2oLkidln5Ur1b0q8vRmGFrUEBKMpHWQ1apMTfEW/9KGUPl9kFARSkD48xOcMEnfWHp7V/qXTQLh6gQiImdEmuYJWUx0FPGs76ac6Q1wTHR6OS1ulj0h3E3UkPecjzwmiqJ7qZkVoXUeyolaMRBuITOK/qSldxQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: da5f3685-b5b9-46e4-0ad5-08dea671e977
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 04:35:31.2850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DBlVYJiEnQEMfUFWlnU3j90uMg3VqN+uaQnlDr+Skw6EEh9FDpKNGZPUQEKe4wPY2iOUQC/+UopApeA99z8vLu3cglAG7/x1gQNTIXsVnT7GVrAKRTSk0DwDU7vt9Vdb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6128
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

Hi Vinod,

On 16-04-2026 14:55, Vinod Govindapillai wrote:
> While looking for "no fbc reasons" and decide whether to skip any specific
> fbc related test, read the debugfs fbc status only once and look for any
> skip reasons. Move this as a library function so that other FBC specific
> tests could use the same library and all the skips reasons can be
> maintained in a single place.
> 
> Suggested-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>   lib/i915/intel_fbc.c                   | 37 +++++++++++++++
>   lib/i915/intel_fbc.h                   |  1 +
>   tests/intel/kms_frontbuffer_tracking.c | 63 ++++----------------------
>   3 files changed, 47 insertions(+), 54 deletions(-)
> 
> diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
> index 47f0e2fc1..e2fbe3680 100644
> --- a/lib/i915/intel_fbc.c
> +++ b/lib/i915/intel_fbc.c
> @@ -63,6 +63,43 @@ void intel_fbc_get_fbc_status(igt_crtc_t *crtc, char *fbc_status, int buf_size)
>   					    buf_size);
>   }
>   
> +/**
> + * intel_fbc_found_skip_reason
> + * @device: fd of the device
> + * @crtc_index: crtc index
> + *
> + * Read the debugfs entry for current fbc status of a crtc and check for any reasons
> + * why FBC cannot be enabled. This helps in skipping FBC test cases where FBC cannot
> + * be enabled. These no fbc reasons are defined by the driver.
> + *
> + * Returns:
> + * True if there is a reason that FBC cannot be enabled otherwise false.
> + */
> +bool intel_fbc_found_skip_reason(int device, int crtc_index)
> +{
> +	const char *const no_fbc_reasons[] = {
> +		"FBC disabled: not enough stolen memory",
> +		"FBC disabled: stride not supported",
> +		"FBC disabled: plane size too big",
> +		"FBC disabled: surface size too big",
> +		"FBC disabled: PSR1 enabled (Wa_14016291713)"
> +	};
> +	bool found_reason = false;
> +	char fbc_status[FBC_STATUS_BUF_LEN];
> +	int i;
> +
> +	intel_fbc_get_fbc_status_crtc_index(device, crtc_index, fbc_status,
> +					    sizeof(fbc_status));
> +
> +	if (strstr(fbc_status, "FBC Enabled\n"))

This should be "FBC enabled" as debugfs reports it as "enabled".

> +		return false;
> +
> +	for (i = 0; !found_reason && i < ARRAY_SIZE(no_fbc_reasons); i++)
> +		found_reason = strstr(fbc_status, no_fbc_reasons[i]);
> +
> +	return found_reason;
> +}
> +
>   /**
>    * intel_fbc_supported:
>    * @crtc: CRTC
> diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
> index f8a506f23..e4b9e5529 100644
> --- a/lib/i915/intel_fbc.h
> +++ b/lib/i915/intel_fbc.h
> @@ -20,5 +20,6 @@ bool intel_fbc_supported_for_psr_mode(igt_display_t *display, enum psr_mode mode
>   void intel_fbc_get_fbc_status_crtc_index(int device, int crtc_index,
>   					 char *fbc_status, int buf_size);
>   void intel_fbc_get_fbc_status(igt_crtc_t *crtc, char *fbc_status, int buf_size);
> +bool intel_fbc_found_skip_reason(int device, int crtc_index);
>   
>   #endif
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index 5bdfbd105..4fa185e76 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -1652,51 +1652,6 @@ static bool fbc_wait_for_compression(void)
>   	return igt_wait(fbc_is_compressing(), 2000, 1);
>   }
>   
> -static bool fbc_not_enough_stolen(void)
> -{
> -	char fbc_status[128];
> -
> -	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
> -
> -	return strstr(fbc_status, "FBC disabled: not enough stolen memory\n");
> -}
> -
> -static bool fbc_stride_not_supported(void)
> -{
> -	char fbc_status[128];
> -
> -	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
> -
> -	return strstr(fbc_status, "FBC disabled: stride not supported\n");
> -}
> -
> -static bool fbc_plane_size_too_big(void)
> -{
> -	char fbc_status[128];
> -
> -	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
> -
> -	return strstr(fbc_status, "FBC disabled: plane size too big\n");
> -}
> -
> -static bool fbc_surface_size_too_big(void)
> -{
> -	char fbc_status[128];
> -
> -	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
> -
> -	return strstr(fbc_status, "FBC disabled: surface size too big\n");
> -}
> -
> -static bool fbc_psr_not_possible(void)
> -{
> -	char fbc_status[128];
> -
> -	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
> -
> -	return strstr(fbc_status, "FBC disabled: PSR1 enabled (Wa_14016291713)");
> -}
> -
>   static bool fbc_enable_per_plane(int plane_index, igt_crtc_t *crtc)
>   {
>   	char fbc_status[PATH_MAX];
> @@ -2345,6 +2300,8 @@ static void do_crc_assertions(int flags)
>   
>   static void do_status_assertions(int flags)
>   {
> +	igt_crtc_t *crtc = prim_mode_params.crtc;
> +
>   	if (!opt.check_status) {
>   		/* Make sure we settle before continuing. */
>   		sleep(1);
> @@ -2362,27 +2319,25 @@ static void do_status_assertions(int flags)
>   			igt_assert_f(false, "DRRS LOW\n");
>   		}
>   	} else if (flags & ASSERT_DRRS_INACTIVE) {
> -		if (!intel_is_drrs_inactive(prim_mode_params.crtc)) {
> +		if (!intel_is_drrs_inactive(crtc)) {
>   			drrs_print_status();
>   			igt_assert_f(false, "DRRS INACTIVE\n");
>   		}
>   	}
>   
>   	if (flags & ASSERT_FBC_ENABLED) {
> -		igt_require(!fbc_not_enough_stolen());
> -		igt_require(!fbc_stride_not_supported());
> -		igt_require(!fbc_plane_size_too_big());
> -		igt_require(!fbc_surface_size_too_big());
> -		igt_require(!fbc_psr_not_possible());
> -		if (!intel_fbc_wait_until_enabled(prim_mode_params.crtc)) {
> -			igt_assert_f(intel_fbc_is_enabled(prim_mode_params.crtc, IGT_LOG_WARN),
> +		igt_require(!intel_fbc_found_skip_reason(crtc->display->drm_fd,
> +							 crtc->crtc_index));
> +
> +		if (!intel_fbc_wait_until_enabled(crtc)) {
> +			igt_assert_f(intel_fbc_is_enabled(crtc, IGT_LOG_WARN),
>   				     "FBC disabled\n");
>   		}
>   
>   		if (opt.fbc_check_compression)
>   			igt_assert(fbc_wait_for_compression());
>   	} else if (flags & ASSERT_FBC_DISABLED) {
> -		igt_assert(!intel_fbc_wait_until_enabled(prim_mode_params.crtc));
> +		igt_assert(!intel_fbc_wait_until_enabled(crtc));
>   	}
>   
>   	if (flags & ASSERT_PSR_ENABLED) {

