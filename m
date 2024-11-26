Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27856D5A6D9
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 03:45:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F4210E782;
	Tue, 26 Nov 2024 03:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RSAQqT/+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2681E10E782
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 03:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732592741; x=1764128741;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RAExbtE/0DbB+QL2+HnEamxeCytQWSgXsIYFUKtosOU=;
 b=RSAQqT/+V8wb1rRJi0TlOOQAHlJOVEyrWMRgH3yjdToOquRvp3wV8dd4
 BOiPmYWkoZlcLe91JvCf495Lp1S/4v9xJz3hqU8r7AlCNfItV0OIMud1M
 e8GodrDhSemIr8lVIyL6LR4xwwZqGz1LxTT9bAVr1INTje6azuLfi6Ugk
 /VWuLikK9SZeCkl0S48kiGft6BrhG0ZLpK+hIsZgIupDFXZeuI2M76By+
 Pu7c+wdDX99pt5eK+Hrgo5C99uLwXEKotQgysJjONT/LocHfXhq8tvPWy
 Ijnm1q+/c6x8alezxK4whX9WW52MgwKebM7lzwFaHLWB0whgjnm8CYf0H Q==;
X-CSE-ConnectionGUID: xpxUUtWMS/2CsLq3CD1anA==
X-CSE-MsgGUID: aN5nwwnZR8W4JNxiwTGxkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32858631"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; d="scan'208";a="32858631"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 19:45:40 -0800
X-CSE-ConnectionGUID: hm62A9Y5QsC0JZ/FLWWbvQ==
X-CSE-MsgGUID: 9CxkYdJaTDS5AlvCIjhfVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; d="scan'208";a="122338679"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 19:45:41 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 19:45:40 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 19:45:40 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 19:45:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FacSvbb4aVv3QzDh+XajsdN3k8Lmm7jN3QR9KwQTUiMFltBd8/9558zmyvS+Hl2X0ixF2cPbi+CUkd/QL3KlPncuc1Fb5mcxiJdB7gW81QlhqagYEnrnoCXLwMl78e+9BKkL6rQDVJIBM6AYzgggNHfaXH+dsTMQoHGxAJkna25lM27JK1iN1jxxxE0uzohr2bQF4oEEF6qc4EmrJYxyNL6rxTVqwwYhZizccfUoGRSGStaSugaRZqIItg/nXukUkjWjjMoZw3Cw21c4ofjVYPtXqzW5rq+kMV6AZmpf27LHjapLRhaslPS6TVewuGRaYUWAKfnAWVaJP7w5NSnjTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRhRNnGQdYq4Ue8o5e+isHXivb0TIJjSkAnX9CslYY4=;
 b=maOKFQaximz+ubUeYjolEOV4LY+/76XcYarY01TPLJ8nFCg4cUukWhm+UoPHYYkf2z0TOWAAZi35gfjGcmHbrQARHaf2lutg4t8ymNuq03+Rc83omY+ctj7zLY0qYfKwD38nLl1z7JhhJGUjyUfrSadmOoUFmV1YtwaNm+4brKhDfSuTCoyYGhyv9RM6+g6l8qKYyQ2upizpaW/rDm5oWI95ap9GXS4S+gLCivUNC5ibNxN5+L+eF9tJi9NQ8c3FA7piNExITA3BkVl5tbdteiBR8RHJR4ThTp9zhha10vKv6SUWgeeavAg027y39wG1QBbD1ta2aLgABF9mX3Vs9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MN0PR11MB6088.namprd11.prod.outlook.com (2603:10b6:208:3cc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Tue, 26 Nov
 2024 03:45:34 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 03:45:34 +0000
Message-ID: <c80e5564-3885-4e4c-a1e2-b12c2e9a1ae5@intel.com>
Date: Tue, 26 Nov 2024 09:15:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_cdclk: Handle scenario where ref
 and new cdclk is same
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241121174659.1752109-1-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241121174659.1752109-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXP287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::19) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|MN0PR11MB6088:EE_
X-MS-Office365-Filtering-Correlation-Id: 2905ebd5-6aa6-4bb9-8019-08dd0dccc847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0tOWkJKekRSRjNIbm12bXhrVm1kdVdGRHVlOVliWXdVdzRDRTNuU1pZWjdK?=
 =?utf-8?B?NGt6L0JOQTNQQm96Z2FlM2FZd3JUelNiMEVlTjdLSjlOSW9vSW90cyt3NlhP?=
 =?utf-8?B?MkFjakNHcU1nZ1I5UE1waFlOUU4wMXg3UlFoK1lwV1JSeUpvRUFuZGhMcTdL?=
 =?utf-8?B?dGxUaWNiUVVZdmlHZVpqbDVxbnVaSWN2bkRzOUx1anFkSEs0M2ZpZ2FHSGxB?=
 =?utf-8?B?WTZ0eVBpZWcrb0ZjbjlQZzdpWHhXWFJOU0dWeTdkQXdHUUR3VzFaRVZUZmVh?=
 =?utf-8?B?WmEyMms0cTlPQ01nUEJWVERIMWJYVUcxOC9wMlNLd3JMbHUyUkN6eUxYNkhq?=
 =?utf-8?B?bWt4dUhJM05RQ2RMZVJDaEFJeTNjTVhWNGppRkJ1Rm5Qa2N6RXFaL1RaRWlU?=
 =?utf-8?B?RHY5a0VRSmxLSldJR3JlY1NpbDVzbzB2ckxJY1RUMUFLTEx1b2REY1R3cklr?=
 =?utf-8?B?Ukg2UDhic2tvMmNuVkkvbWJVaEJ2Mm1ocllKb0MrNnQ0bHpPWWJXT3k2b3dz?=
 =?utf-8?B?akhKNnZCeVRHa2hhdUhUNXpHOFN5QmlNL05DOWMwTEUrcjdoV0tLaUlNdHJo?=
 =?utf-8?B?L05nMjM4MnFiMmxLb3MvNG84Ry92dUxxNXhxeHUxTDI2dkY3SFpEYUI4NUZY?=
 =?utf-8?B?bVVrZWRISkp3SEk0dWpCdmwvbFBveU01eXNnQ2ZBSFRVUWtMQ0V5Sld1UW5C?=
 =?utf-8?B?M3lkV3FjR09FbjNxQzlZdC9aSG5SN3c4NVZKUjREVStGS1ZPYlZ1NU5JM01P?=
 =?utf-8?B?ZUxCNVlaSWlFSUkvYkpEcEV1THZUK0p1aUVRbE8rc0JoYWNrS0cvUHpNNFIy?=
 =?utf-8?B?UjNMRm16ZDVrYWFMUWViTWNCcVdNZ1UyQU9kUXBKbEYrSkV2NEsvZmdaVlow?=
 =?utf-8?B?dEczcmJqVkVXTVpkMjVlbDYzdzFVM2lkUlViZlNiZmF2bDBUZjYxT0N4WThX?=
 =?utf-8?B?Y2JkWkpzL3UzYVJDR3V3ZkM4TThnK2tqclh3KzFMRjdIS2dxL1IweG9ZdWhM?=
 =?utf-8?B?QXp2L05vOGowVUZiZzloUDRYQUxoSFZDUkhuaGpTUHhNdjAzWmlKS0VCbGwz?=
 =?utf-8?B?Q1c2Yys2RHRxNFR0SjJMemlxL3Q0QTdvampBSDJBUG9WVE8wSUhCUlhFaWZu?=
 =?utf-8?B?SkU3VXJkaFJzd211Z2JYcFRuRStvZ3VZZGVrRTYrVjc3SCtKcVFEa3JHb2tQ?=
 =?utf-8?B?QWFVUi9xYVNIUngrZ1lMZStuODdqS0VYWGVGWUdIb0tHcTI5SlBxYmdwZ2dQ?=
 =?utf-8?B?b0FLUlJBdm80TEUzRXR1QkNDTmswZHc3L3luVFdsNGZRRW9QcGZVditodlAy?=
 =?utf-8?B?WTFIQXZSTHFBV1pEOGE4RTI1TUpENzVIcEZiY1FoZUJlNGNHcDRIQjhoaHky?=
 =?utf-8?B?N1lrSTZ2WWhMZlNHVXpxZXIrc2JIRkJZVExONkhOT3NWSTRZVXBlZnBRdTg3?=
 =?utf-8?B?TVRoSWFCREozZTZZUTg0M0lHWnJyeExIMlE5ZEZrS2MrTGJkNi9UTzU3Y2tW?=
 =?utf-8?B?OFJ4aExGNGVTandqZ1M0Y2ZyQUM5eDFRUjdaWmRCdVAxL1Bqb1pQZ0czenh2?=
 =?utf-8?B?SHdUbmNMTitnN1ZET0lnNDJCRTZxeGtzYkhQRXN2NCswaXVXM0FaaWF4UU40?=
 =?utf-8?B?TEFVNGN3UGR1RVRmcWMwSEhDcU1seWZrWGpaK3VpcUZNWE9Pd0lUR3RQTk5a?=
 =?utf-8?B?Q3dkenhVREZnU3VSUzQ1L3BZTmUvSmIrWDVXTFNVZytkV2QwTVUwM1MxNVhp?=
 =?utf-8?Q?uIEKs51E951hdoHHJs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGN0aThob3AyQ3QyeFJOZnZCcndTSjRjQ21xMVlsbHhGUkVRZlpwdmIyWUd0?=
 =?utf-8?B?bzcyV1FwSndRNVJENFBtVUJURTVzWUc3YTBwWkJkcTRidWNTdXE2UnU4eUdo?=
 =?utf-8?B?cUFiWEw4SC9YbnVqZ2Q0VGRITm5EQytnTnhwbWN1YVFLRDIyRG5WWWMxU2dl?=
 =?utf-8?B?K3FVVng5UGhvUkFHOTRUUFJzZmNFV3ZuaHg1cTFlMWV3ZVZ5SXJTaUswa2pU?=
 =?utf-8?B?YmFzQldpU0hVRmVwS2p0ZmJMeGVBZzBSYk01Ylo2U0U1V3RjUXlUdWs2QjhT?=
 =?utf-8?B?U0ZmcFVsWGhzYXJxQ1NHQVFJczN2VGN0dTUrWTFHblEzM1JBUk5mdHVPb0VZ?=
 =?utf-8?B?MUxvWGxBZy9FeERRWHUvMlhtZmJLRGJoT3BoTUpoN1BVYXFRQmlqSVB0elVo?=
 =?utf-8?B?VktnOURNdVVNTm5GU3VmYkdNQWhTUVZxRjRlVXNjU21wZ3d0cVo1eFFYY21C?=
 =?utf-8?B?YUl4dk1ETlowVXdPbEZaSnRkeEMzVW5HMkc3K2kvdHp5UG9pMlRBaXVCY0hl?=
 =?utf-8?B?SHJsK08xd0gremcwYmpxUDdzSm8zOGU5ZHA2aG1WVnJxV1hCalFoVjZYL09O?=
 =?utf-8?B?TzA2VE1uQ3JBajhPbTJ4Zkl6TTlDRE5xalVsU2lNMllGZHphSTNMd1l4d25W?=
 =?utf-8?B?Z21NQXA0WDhuUWxpd3FycHd3Zy80K1Y0Y3NyelFINVN6UWZXMjFzYXUxMjBv?=
 =?utf-8?B?dW44enlvYkdKTytXR1lnRjY0RmZ6WkM3Y2c5Lzg1bHRxaTNsNTFQMVJzcnNh?=
 =?utf-8?B?ZXRzUFdMUkUvc0p1dWthc2ZlU0ZjVEl1VEdKRFAvVDRlT2NPSkRMZEIwZE1x?=
 =?utf-8?B?YnBBUVZnVEZlendPQlZEZmRFNzVHRmtlTjF2cnFQU3FkdXlRc0NicVlTQmh2?=
 =?utf-8?B?eVEzVHVTL2paVzFLQU1Ib0dMTXBxQjFBZzhuOFpUQXlNeWZ0dDAxakMxcWZk?=
 =?utf-8?B?U0ZaR3orR3VlcThhZVZucWtid0pRTGtxd0I0YVFSWWcxalgyYURya1dMYlBw?=
 =?utf-8?B?Um1kVFY5Ylc3aXBWRGp6SGl0ckh5dHQ2OEhUS0FLZVZkbFZ5M2t1VThiSm9U?=
 =?utf-8?B?MU1FdUFVd1gvZEJXVElHaEErOUxocDBwVWlhNU5WY0lWYUQyd2N4bkVVYWll?=
 =?utf-8?B?Q2FJTDNRVHRIaGZqUGtGYitCUGxKOHgwWFdKaEhRajBMeHFEKzNlOEVzY3VJ?=
 =?utf-8?B?dnUzeHdTdmVXalJGTU5RMG9TVmtCL2xONXVDakloMU9yOXRBRzVFRWJtV0Qy?=
 =?utf-8?B?cmpNaXJwbU9JYU44T3dYcmhXUEJVTEM2VDY1Tm8wTytiS2hRTU5MQkM0cWV1?=
 =?utf-8?B?NFQ5V05oQVFzd1VoTVlTRENVQkQwVnR2NmM1M0NTMEJ4UWh4dzZDdXZqa3Rm?=
 =?utf-8?B?SDBuVnBZdFJ3RTc3ZE15b0pkREg0SGhwbkJ4UVcvc0k5YkVLV0lWcTNYOVhz?=
 =?utf-8?B?cnArWG5VVnVQa3M0WEJZUGZNMFdSdGMwdEl3MWNYM1ZEcS9pSVlsT1JmajJY?=
 =?utf-8?B?cTJhSVp3Tmh4Tmw4OHVXLzJXeHJBMmRHbUIrK1VPOFM1b244QzFHdk9LeFZs?=
 =?utf-8?B?cVoxMHYzUmh6Q3ZrZ1d1aC9LYjQ4Q3YxMDBkZFJxd2FmTXVWN2c1MEZQb0Zp?=
 =?utf-8?B?T1IxNkllb1M0bzh1TnVodEt5MG9XeDVMeVNaOG5LMGllWVpWY0RIZ1d3TWFW?=
 =?utf-8?B?S1gvVFRFbHFVWWdDRUpHUkxzbmJRQVg0ZmFlZUVFUHZYbkhWS0dzaDdkU2hG?=
 =?utf-8?B?V2RHS2prcy8wdXRINmhjdlVabm5BKzAxbXJTRVd5YnZ4aDAzM0xkYkk2R2My?=
 =?utf-8?B?SEYrR3hFWUlQZW5vNy9mNmxBaTdrQVNWeERhVGFtZHNBS28vQ011UUxLQjll?=
 =?utf-8?B?QXhYZENDZHVmemd2bjRsTHJQeGUzYWwwWDQ0QzVUVlpqTWdCNFd4TzdHV0Nn?=
 =?utf-8?B?WmR3RlNubzBHbXNBcCt4d1V4K2VBQjVMcjluQXlyK1N2bmdKM0dvbXRDZmky?=
 =?utf-8?B?WnBZN0ltNVF0SGtONGRhTW8vOUJiNzgzcHlVOUtoYmxHREZ4S1pZUk5Qb3hU?=
 =?utf-8?B?bHVHRHhIMGVFaS9Bd0NXRUFjK3J6SWZ4ZFJ4SGtsM2N5eVFDejhSQWZQeTFy?=
 =?utf-8?B?SnJjYnNtVTF3Skx2RDA5b3NOUmgzSWxJaWQwN3J0QlRhQWlJTG5BMVUxZFdr?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2905ebd5-6aa6-4bb9-8019-08dd0dccc847
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 03:45:34.2335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wWhE9uTKpS+/kIKN3ieqRJ+hFMPf7CMnkgUou0zA50rAMN2BQGRNUPWnzbLUoujgNbXwT38pC64Nzl92FlE9/DnTZ9IWnNIgGDpCo57hEUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6088
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


On 11/21/2024 11:16 PM, Swati Sharma wrote:
> There are couple of issues with the mode-transition-all-outputs
> subtest. Firstly, test should execute only if we have minimun
> of 2 connected outputs. Secondly, if hdisplay and vdisplay of
> highest and lowest modes are same for an output, don't consider
> that output. Both these issues are addressed here.
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1887
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_cdclk.c | 67 +++++++++++++++++++++++++----------------
>   1 file changed, 41 insertions(+), 26 deletions(-)
>
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
> index 382b3e9d1..61d73c8c6 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -54,6 +54,7 @@ IGT_TEST_DESCRIPTION("Test cdclk features : crawling and squashing");
>   #define VDISPLAY_4K	2160
>   #define VREFRESH	60
>   #define MAX_CDCLK_4K	307200
> +#define DISPLAY_COUNT	2
>   
>   /* Test flags */
>   enum {
> @@ -274,83 +275,97 @@ static void test_mode_transition_on_all_outputs(data_t *data)
>   	igt_display_t *display = &data->display;
>   	int debugfs_fd = data->debugfs_fd;
>   	drmModeModeInfo *mode, *mode_hi, *mode_lo;
> +	igt_output_t *valid_outputs[IGT_MAX_PIPES];
>   	igt_output_t *output;
> -	int valid_outputs = 0;
> +	int count = 0;
>   	int cdclk_ref, cdclk_new;
>   	uint16_t width = 0, height = 0;
>   	struct igt_fb fb;
>   	igt_pipe_t *pipe;
>   	igt_plane_t *plane;
> -	int i = 0, j = 0;
> +	int i = 0, j = 0, k = 0;
>   
>   	do_cleanup_display(display);
>   	igt_display_reset(display);
>   
> -	for_each_connected_output(&data->display, output)
> -		valid_outputs++;
> -
> -	i = 0;
> -	for_each_connected_output(display, output) {
> +	for_each_connected_output(&data->display, output) {
>   		mode = igt_output_get_mode(output);
>   		igt_assert(mode);
>   
> +		mode_hi = get_highres_mode(output);
> +		igt_require(mode_hi != NULL);
> +
> +		mode_lo = get_lowres_mode(output);
> +
> +		if (mode_hi->hdisplay == mode_lo->hdisplay && mode_hi->vdisplay == mode_lo->vdisplay) {
> +		      igt_debug("Highest and lowest mode resolutions are same; no transition\n");
> +		      continue;
> +		}
> +
> +		valid_outputs[count++] = output;

I think we can store mode_hi and mode_low for valid_outputs, in an array 
to avoid calling get_low/high_res_mode again.


> +	}
> +
> +	igt_skip_on_f(count < DISPLAY_COUNT,
> +		      "Valid outputs (%d) should be equal or greater than %d\n", count, DISPLAY_COUNT);
> +
> +	for (i = 0; i < count; i++) {
> +		mode = igt_output_get_mode(valid_outputs[i]);
> +		igt_assert(mode);
> +
>   		width = max(width, mode->hdisplay);
>   		height = max(height, mode->vdisplay);
>   
> -		mode_hi = get_highres_mode(output);
> +		mode_hi = get_highres_mode(valid_outputs[i]);
>   		igt_require(mode_hi != NULL);
>   
> -		igt_output_set_pipe(output, i);
> -		igt_output_override_mode(output, mode_hi);
> -		i++;
> +		igt_output_set_pipe(valid_outputs[i], i);
> +		igt_output_override_mode(valid_outputs[i], mode_hi);
>   	}
> +
>   	igt_require(intel_pipe_output_combo_valid(display));
>   	igt_display_reset(display);
>   
>   	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
>   			      DRM_FORMAT_MOD_LINEAR, &fb);
> -	i = 0;
> -	for_each_connected_output(display, output) {
> -		pipe = &display->pipes[i];
> +
> +	for (k = 0; k < count; k++) {
> +		pipe = &display->pipes[k];
>   		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>   
>   		mode = NULL;
>   
> -		igt_output_set_pipe(output, i);
> -		mode = igt_output_get_mode(output);
> +		igt_output_set_pipe(valid_outputs[k], k);
> +		mode = igt_output_get_mode(valid_outputs[k]);

We dont seem to be using this.


>   		igt_assert(mode);
>   
> -		mode_lo = get_lowres_mode(output);
> +		mode_lo = get_lowres_mode(valid_outputs[k]);
>   
> -		igt_output_override_mode(output, mode_lo);
> +		igt_output_override_mode(valid_outputs[k], mode_lo);
>   		igt_plane_set_fb(plane, &fb);
>   		igt_fb_set_size(&fb, plane, mode_lo->hdisplay, mode_lo->vdisplay);
>   		igt_plane_set_size(plane, mode_lo->hdisplay, mode_lo->vdisplay);
> -		i++;

This whole thing is repeated, perhaps this can be separated into a 
function and then called for mode_hi and mode_lo.

I understand this was already there before this patch, so I guess it 
will be better to just optimize the existing thing in one patch and 
tackle the issues in a separate patch.

Regards,

Ankit

>   	}
>   
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   	cdclk_ref = get_current_cdclk_freq(debugfs_fd);
>   
> -	j = 0;
> -	for_each_connected_output(display, output) {
> +	for (j = 0; j < count; j++) {
>   		pipe = &display->pipes[j];
>   		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>   
>   		mode = NULL;
>   
> -		igt_output_set_pipe(output, j);
> -		mode = igt_output_get_mode(output);
> +		igt_output_set_pipe(valid_outputs[j], j);
> +		mode = igt_output_get_mode(valid_outputs[j]);
>   		igt_assert(mode);
>   
> -		mode_hi = get_highres_mode(output);
> +		mode_hi = get_highres_mode(valid_outputs[j]);
>   		igt_require(mode_hi != NULL);
>   
> -		igt_output_override_mode(output, mode_hi);
> +		igt_output_override_mode(valid_outputs[j], mode_hi);
>   		igt_plane_set_fb(plane, &fb);
>   		igt_fb_set_size(&fb, plane, mode_hi->hdisplay, mode_hi->vdisplay);
>   		igt_plane_set_size(plane, mode_hi->hdisplay, mode_hi->vdisplay);
> -		j++;
>   	}
>   
>   	igt_display_commit2(display, COMMIT_ATOMIC);
