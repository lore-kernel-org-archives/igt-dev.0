Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD98FF885A
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 15:35:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7B110E3C5;
	Mon,  4 May 2026 15:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VyCU3ucm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4F510E3C5
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 15:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777908894; x=1809444894;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=i62ITgEyFVbaFEH/VG5074QxIXFtJce+o4LD9PryVaM=;
 b=VyCU3ucmrkKJ9iLZtjZhfq637okfLeFe+8apx4n09A98al+oLmg7Hk57
 qLBVn+iga6YpV9953NSeO/9fizoWqdFN4DMpQqH/eUT5/N5s15C1Mo/wx
 8Y2IRZPHhIl0Y1lL2BV6uwfd0Kw6tYIL2Uy3HX0lPZxNyU9V6M/JxpfBg
 XVVHPP3gH8/suy01uxC4deauxYSS/ZORCgC4uaCoh+Ez1aVKt8C9d8LZt
 58ZjjhqFlpGJjXXJUTq4out1FcHp9vvM/DtsYxFlN8ubHTFpfc4wwSy5z
 AehH/QQopQQjolrBM6EMh/RI72PcP5JjY1+Mf7QXcgXjdvxuJajz5OwwG Q==;
X-CSE-ConnectionGUID: 03oadKCCS5udEjF+HKaqXA==
X-CSE-MsgGUID: Wo17uJ5NRae51qS2fLN2kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78868761"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="78868761"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 08:34:53 -0700
X-CSE-ConnectionGUID: nbw2UrKRSjidpuDO8Nlk8Q==
X-CSE-MsgGUID: zLRMkxQ4R/W7RY4K3hLI1g==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 08:34:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 08:34:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 08:34:53 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.38) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 08:34:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LP7NpcClkVFNwjD2my0LUZh39UvkWrkTGJ39MosQTtYDWNqtKxsPkxZNB2VV5tulqKmjWOmXRSRyADP0+p8ONOHYIr0Qka3OKkHpTpNmImfAXFYAO08McpI1lEWyKahWUF7zpf1t6jms6qedgHUpNuTHjAJYrMyGLDyU43XorV37rIpIlTZ+oM6/nS/6dX2RDJGamk4kjfRwwOLdBpcwGGGlWzjMp20dqAMyU2fgxf44rHSmRXxEVLt5X5vgsNXS1qXVHUNHLzH7WFnjJY+6P1tIXudLg0afZ7uHKoqSlVMCtiBZJvWCMaU1l6IdhnbYCs3t6LXc4WdLimCsPRGtqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIQMvV6xVWgTrvgdeYcF70G9w+7WUyWoljydrATQwVA=;
 b=LFo2riPINnAnCI05ItgLulFXfdXqK4EwOidUvE9eJV5m+4aEfciuF99kPX3qkZqQEFJUYD9vkHQio0xQxxdS19XHJ+zOrxhqYsL/olokfbH4WcCYv65y/MoA055PtNG9BFDdtmqId/nBSxNTCdU3h0PWMDr5j96AiU6F2zlbmKwXnPzUZXuphZT/5jZ2/g3s2gdWXC30QZxGjGueOsHAm6ij/qbw8Ivnq0aAsazuUaJ4PSVV4Td7UmJjKldl1PoMTddlulDW0e0YnNxzgdD5MJZZWSw3FgogoWWG7VdJUXZhzGjL9D+qJAp8kpv4WogE0iQBEO8sQykRbds4RqfULQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6035.namprd11.prod.outlook.com (2603:10b6:208:376::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 15:34:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%7]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 15:34:50 +0000
Date: Mon, 4 May 2026 08:34:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Francois Dugast
 <francois.dugast@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_exec_system_allocator: Don't use NaN in
 an input buffer
Message-ID: <afi8khq4u8hbAXrl@gsse-cloud1.jf.intel.com>
References: <20260504152820.3825451-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260504152820.3825451-2-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: BY3PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: 48571115-bc43-4bd8-6a4e-08dea9f2ae0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: HDa4ECeXo5C/JaTshKN7CWkvUz/OsLfOGXqDXdsF9KlkdKE4U1Pi0lCm3U55e8jt60TFqTiImnO0hvXzJ6qSId1HPHjMvLE39olZcyMz7ORkjmulTPwlW1ZPKjaaA2p8A8wA8Rao1rEl9OsUlb24FSXndrad7FvHdu4aVX6FlEO8J+n39/l7rtA4FaZFE1+ekE+gtnwpPV6vl3FVUA7fdDya+VG3CpvdRJTbxcGtxAhwMJOeiAg5CYVH3+cMoSDdYh28TxKV+3OdWyUbocFLAUXlYovA3iRHbKf8AUFk5LBtIsyJzUNZUpqTYPz3HwKXtbf7ebxZ7Met8nm7gmFahgNrAFzZoFMpf6cbbZ+daLvF2EdsHMf6QXneBx9DgsfSklCEQGFV/EiJDIcMv71ysYEL26Rktxi0X+cWeBuC9RaHzBWqdocZuoZGgxqU8ifD2FpCKVRYeCZeUCQQ0PtpTRVXr6H+zAGijL7+EaLp3lBDo4OO5oGS+kS4gIhQabzQFNYAO73HqvMKBgjl4F1mqbRa8m4wa6JqKP8WkeP7OIEt42vXJapqDxXjqEAb5hzqFIHJokOO8NYK/jVUCbSp/KzqG+gnLJVz6W1CFXewJJ2w+DG/4aZIS7Hx/Ev6Dvd1oatb9BI/LmuR7eOJr/FsV23AXT1epnIuCbwrY5cT1wLe2sO0258CsIA+PI3iyGQo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1gvZ2cray95aDhkcmFvLzQ1R0NPNEN2RTkrT29UQnArV0E4MGZna0krRktQ?=
 =?utf-8?B?a0Vuczk2ZTFHUUFnVWs5bVZucTIwR3JVUzBTR2pselZSdExpM1V2SmlPMjJt?=
 =?utf-8?B?T3BrSU9TaUFWTHdNYUt6WW9ENkJjdnJ3LzcwS0pNVXBlVjhtK2lpdWlWUU5F?=
 =?utf-8?B?QmtuWU5JajAzZlJRR2tMLzdoYTJOckNFMmFHUWNTYjBLK08yMTNVNjJKUm82?=
 =?utf-8?B?ODBKNHMxMDRHcExCWXZLTXpVait6YUhBbUZwMkttOEdHN3VIWkhUT3k0TUhq?=
 =?utf-8?B?cm8rY0MyVnNENXlDQUVtVU1Ea3lncXhYWVhqeE91RE1Jeko3b1ZIOW9KdGZj?=
 =?utf-8?B?YVRTVXBkYktLd245Yk4xR2NzY3QzN296WHdYRDZwY3Awd2U0L1llRkZ3QnpW?=
 =?utf-8?B?QmRtSHBUVHBOYnNlekxFNWoyaFJ0QURlbzZXem05RnJEUFNNV1pZUVdubDNu?=
 =?utf-8?B?ZVBlUXZQNnNIWDMrZEhZYUZqWlB3ZnpSOW9yT2F2d3BiVGF3MWNlM2pjSzlq?=
 =?utf-8?B?OHJoMG1nbTQ2T2htUWZqSmh4VEoyVFNBeVk3M1hkZ0tWN3paaVV0K0Fudmps?=
 =?utf-8?B?YTZKWGZPSWQzQ0ovQzdTc0VRU2NJVnJtL1ZCVExyVGhqN3BXaXg0U1VlbHFF?=
 =?utf-8?B?UnJBY0xDeVVxUC9LWVVuajhhTE5YR2xJazhRVEFZWGlIaWhWdUtiUXNaSTdP?=
 =?utf-8?B?c1Z4UkJ5dVVBSHFmSi9XN2o2STRaWVVlUE5FL3Rib1VSbDZEMkFUMmZUNnh2?=
 =?utf-8?B?UWk2UVFvMTdmMFdDcldFTjJ5ODZNL3Z4T3RiM0tEUzdjWWJlbnRjLzNvMHlN?=
 =?utf-8?B?L1NxSU1uNUdXUnp0M3hJTGRVaGU0R0dIRzVFUk9HbzNQYTc3c2tXMG0wWno3?=
 =?utf-8?B?L3JLR0tMN202a3VEbmlEZVJodWJ4ZmNQd3QvWWJYYU9WcGFJRys3aVBIZFpL?=
 =?utf-8?B?N3ppclJmaU9NY2poTEpyR21Uc213Tm50TTByOUFpOG5KVXE3Nk1wbFV1WHZJ?=
 =?utf-8?B?anYxcGNBUHliV2NwMCthL2d5VUFBZUlRRCs4YWtaOVpTdHRDREdjTXZjbTRI?=
 =?utf-8?B?VFFLYjJhdCtLOHVIdjBMSjJNVVI4eTZraUVyOXduOWdjdDFvSXVQaWMwSWov?=
 =?utf-8?B?Tlg2NklqRjI0OTBBcnkvTysxL3VpWmlTNFFpOTN0K3NKVXZPUFpnaHFTcCtW?=
 =?utf-8?B?dkt6WjJxTGI5VkdTSkNLVTM3K0RMN1lBWHpJYy81RFFzdnpyZUVrMlpYU0Zz?=
 =?utf-8?B?bi81cWNFcnhjR011ek03UEJyZHFvZGtSYlNGc080VVRlNGxOU3NHVWwyd215?=
 =?utf-8?B?TVM2SXVYRWtEdmZkMGVoaEV2NjEwdWFMRXFrUlRZVWpIdW1uMjI5WFczRUVC?=
 =?utf-8?B?eEhraHFjYVF4akpNdGFvaExvSWNpeFJ6MG5NTkxBcGRSN0pyV0k2QXZGcHMv?=
 =?utf-8?B?eDFneXhYNWV4dFgzb0pSOHZCc1Y3d28rblkxV0JnYWdQa3RyOXlRdGpWbzdQ?=
 =?utf-8?B?VjlvT1VDRk1DUjlqTW5YMGhEVDkyUnVjanI1SFk0dkVpc1RlMzJ3Ly9seW93?=
 =?utf-8?B?Y3NERG8zc3JBRGtWOEZHeXBtdnZ5WGl1Q1Y5RkRLNWt1dzd4cXdaY2FnWUtv?=
 =?utf-8?B?RWJFVFBqUkNuVjhEQzRyU3NQeWMvTC9iamNZK2FjRG05VlNJOUw4T0Z5dlAw?=
 =?utf-8?B?VlhCV0NNQnV6SmVYUnEyNmpTVzkyc1phQnh1OVNQS0k5Z250eE40cTZVRFB5?=
 =?utf-8?B?UHF5QXhPSEh6Rzc5WEw4RnBST2JTMTFnQ2pLS0ZhWndVRk5MSHBiZ2thTFFh?=
 =?utf-8?B?TDc0a1NkaFREOVZyRTJ5UmhVMFFEcE1JK0JGVmZmeUxhS2p3cUh2WDFLNGJI?=
 =?utf-8?B?UXk1eDUyTTJwUlI0TFZUMFViU2pZQ3k3bjI1dk1BbFA3Wkluem5hcGNEOXl0?=
 =?utf-8?B?UFpHZjJRV3MrUUhQS3RVWGEzc09reUNzSjJuZ1U0ZHRZY1JwQ1JyMUoySndN?=
 =?utf-8?B?aU5rUFA3dU1TTTB3TnRJRUhZYTQrNklkL2pUUWRnaGVMdWlnYmRTcURqOXVI?=
 =?utf-8?B?NzV2TmJFbnFkT21ZUi9mUVBDRlNwSGtJU2dvazFCOHN2U2RNWFNNNTByVHBV?=
 =?utf-8?B?dHA3NmxuWk1GdU1XSk10VGtmU0hxY21OM3padnBmdjVXTzlESlQ4eE9taFhF?=
 =?utf-8?B?ZGw0QzgyaTVKU2hJdzgxb3VJNHVRNnliYUF1cVE5Q29zY2pIWEtsd09QTDJJ?=
 =?utf-8?B?ZllqeWxsdURSMlVEcmxiNGFhT1BVUTkwTU1RK0toNHpFVkRBY21QTHFaaDl6?=
 =?utf-8?B?MloxVmdGV2ppZVh3MWRFbHdqdGdYNm1uQkVUakdvZEwwOTZQeVovWmtaZUUx?=
 =?utf-8?Q?bssPg6E0oIA0a1Jo=3D?=
X-Exchange-RoutingPolicyChecked: oOmGKJbHrzzoyszdjLx2mP/wJh6yBZprlsA30+GVO5JWvzEKQKAJRfUCocASLQa/ItAre4LJKczry0up7jqm92SResqTsyfsVJPbK6JtxcBzsqznKWkuPjA09JzGyZroMx98AXFdAA27Jn7ILWIf8zItRDBZ8vj3bAB6eIDpBElYGKDPW7/x5SD3zbjqvbdGhysdjras2xGLYxhbRtqW1PMeb9FOYObmLWUEWKkW8zUUrJpdVxwZpTIRuQ7KRPZnGN9LnmiIQPMQdywIRH2tVf3pQ5alx2gwxrMBihi128z9oxoxX7Y2ReHSSdS/KlWdoW5d19w8hu7B6cv/xhi2LQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 48571115-bc43-4bd8-6a4e-08dea9f2ae0b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 15:34:50.1535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /jVV9RNn36P+ldChlSB8DsQY43q31Lox7Y8nInscX6UESYr7/Kj1s87B3hBrQTsiw4SzY7442sx59LSF7X/9pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6035
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

On Mon, May 04, 2026 at 05:28:21PM +0200, Zbigniew Kempczyński wrote:
> Setting input buffer memory to random byte (in this particular case
> 0xff) and then use it as a float causes doing compute square on NaN
> numbers. It's nothing wrong about this but comparing NaN in between
> returns false according to IEEE-754 rules. Buffer compare function
> does assertion if output is not equal to expected output so we hit
> this randomly in 'eu-fault*' tests.
> 
> Replace memset to loop which sets all input floats to real numbers
> thus avoiding NaN arithmetic and comparison.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 5580099f78..0f1d6ee9c7 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -2339,7 +2339,8 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
>  		igt_assert(compute_input);
>  		env.input_addr = to_user_pointer(compute_input);
>  
> -		memset(compute_input, rand() % 255 + 1, size);
> +		for (int j = 0; j < env.array_size; j++)
> +			compute_input[j] = rand() / (float)RAND_MAX;

This logic can still get 0xff or 0x0...

If you want to avoid 0xff or 0x0 I think this logic would work:

memset(compute_input, rand() % 254 + 1, size);

>  
>  		xe_run_intel_compute_kernel_on_engine(fd, eci, &env, EXECENV_PREF_SYSTEM);
>  
> -- 
> 2.43.0
> 
