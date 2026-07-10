Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A24C43458
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 05:12:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2221B10E129;
	Fri, 10 Jul 2026 05:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fmexy0tV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8948A10E129
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2026 05:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783660291; x=1815196291;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RgPdcYBmcni+qdDt7ePsP2mwihXrpTcnl9lY77ogrNM=;
 b=fmexy0tVnxTLqt/hBwCaUPqS7zUePdH5NUKi8z/d11ayuzD2RlzH+qQv
 1sQYd4Vw3Eb6aSNbMxR1tR3p9dbaatuG0oxCjtMh9mJ9Yj7o6//4A3riV
 AKwItYdlqLOir4Tm7/WXcrRmgQcxF5VbgRgLIpsCbFy4CWG6hCCPw72wu
 ZiGHMnRX3Ad6Db15WGk2RQG+92GaDsBN0a+nsCBu6pKfEeympfL3z9DsP
 A3XL88XgH1xrPpKuCYpabYLiN/1Oc8Qu2qpTHPnGGWM8i/BBjQWt4qtmQ
 HgQY5mmnzDweQXbAbNbxH50SJkyYn9nwlFn28YQIZfJT/kAkTF/9jPkfS Q==;
X-CSE-ConnectionGUID: Cwd3dXWjRaC/+kCg+zZf+Q==
X-CSE-MsgGUID: K+YIzcgyRH+SezrhQ/rd+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="71880352"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="71880352"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 22:11:31 -0700
X-CSE-ConnectionGUID: L3TM4wjOSpCSHfMjbPOLFg==
X-CSE-MsgGUID: f5hwtES9QQ+ykOeu/nFzfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="278022901"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 22:11:31 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 22:11:30 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 22:11:30 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 22:11:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujGS3rC9oM7ZzqgyzGpFdhQ9lecY8qCWNcRhRQFuz2JRQMmeVPGrQCeDZE4xTVmpEAvZZRn4xCYm8psx0IzPPaaKki+tzP/LTZ3iYJ7biFpScGcW2YXtLe+hlshNWsTwj/RxZommdEBs6D2X5UL6vmzBCHHGUV5r25mw0p+BZmMJOngcX9DX5Tr581c+Oq98NDWOlW8xdn24jK4SsqYiweFueqc2Dz0i8oYTsrSjdNHci6p4MUJZ9uMcnglpRyn6rfFSqMlP2OBaW2pNL23WYOhAVi2585zKSM2i9dc0z/sddCehE7rhxe95lXMimTpSeR/chQ/KOtuh6MXiAw3gyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngSiv+2QOSOO0arFGfFznQFnA6XNlnWCqMPU+dIw91w=;
 b=q4Mt04wt/f718WXSGcNQu8x+QmFRFuAcHxoayoeomjF5IZfwcWGNqFeD99FxsEpAfDsvKSDrm6c4OhZVKWr9IRdq5fbMD1LWTXFBfvJF3f0YOMtYRR6F/f+7jlFp4qXKRzvgeCh0F6CYNxUg6XXM8Ik0S0zILojbfcXP2sGkChAbjeX3I4M8KweKaz8+JOUyhxN51u7henmhvKMWJdNmVb2gm8FbwoDmaEws63n2RXjwBO0L+iziWLbXmuSdRKWOlqLQY6bhuqhFhiYa4FL5fzsczNkuMGlJk+M7y1DGLYJKA2taU47esXChYl5rRXkNJtVZglU0Qr1/m8tqgiiM5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 PH0PR11MB4776.namprd11.prod.outlook.com (2603:10b6:510:30::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.17; Fri, 10 Jul 2026 05:11:23 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%5]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 05:11:23 +0000
Message-ID: <4f7d2896-1264-45ae-a085-304f9ee8330b@intel.com>
Date: Fri, 10 Jul 2026 10:41:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 02/12] tests/intel/kms_frontbuffer_tracking: use
 intel_fbc_get_status()
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20260601204407.39934-1-vinod.govindapillai@intel.com>
 <20260601204407.39934-3-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260601204407.39934-3-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0344.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::10) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|PH0PR11MB4776:EE_
X-MS-Office365-Filtering-Correlation-Id: 74b03f66-83ae-44fd-207e-08dede41afbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: e3FnPkFHfGtcwNwVGn5T7yyX4v3jU68C2pZTuKfx3SwApGdh+MjdSwtDUtbnEUYGzAr5c+znW0zmoAc7d4PUxPOnxeNqp+b3tahVa4HIh/OIkAatGLr+uGcDD1UAJamqcKUeS9BozevF9EpQL9LviKN7Sv53AdZd5T02h0GrNFkfsuaY4k8ZoMj9BTBnelxBI92yIX4idUAE5rvTNK999wbxmSRq5Ho/iWuHjrYht8QJIaPhmLvqqUunGb7aP6xSBXZkR8j9seKPuxkjAjmGaX87Ke8LDiPRmLlJe8kYJO3MPmZrAKTUuP1GAPxPT9NVrtSLck+LvNpkhApUj+slR4Qn1ZftySwmbHjI+8xtsdXi0ekQMIjVJMFCYc3wHpf52hRP88DzxnJGODQLFXvSWK2A2y7YzfC+IK24SBQ5mb8CRMDWl+V5VsTm1zo8j1dcCQlS9z2E8oXLNhTuUMp7XrJr8hKwRJHCe0xuXvSh4euZubl5NqpR/LCpWfhQu1rFznxwakqQjFInz6nurHBWQuwJgMe7T8MlSH1cBl2BJvrCXQoU6rKriCxIMRAmVMhEJZreDxAOARmtatUrq9yofeWLriKYIZwCdTYrJWfJ1uoxRr4zC6g9JeAFg8yqbwrDB1dqY+DRk4ES0PScSwHdQ4YLh8gh05yJgTTr9ymu8h4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGlzejZOT1d6SVkxNE1PV2pxMEN0WGdmeTFVTHpla3U5R0o5TGRJaEtKZXNY?=
 =?utf-8?B?cnFIU3ZHQnQ5bE13TVgrSEx5cUU4L0loeEhxaUxiSGRqek9NalVkVnFNNjJP?=
 =?utf-8?B?bXZNdXU0aisxZjFNOEQzMFZ3RXdFR24yeGlHc2Nyck1RNWhnV1pDbkgwOGgx?=
 =?utf-8?B?K3Fib29aVUNlUlFVdnpyajZoa1dUQzU2NzJ6NjNDeThzQTBTc3RhQ2ViQmZT?=
 =?utf-8?B?RG5HZGFtbWxOcDBmWVpvVFY3aGRWc0VxQ2V6Wm0rMXo0ZEZlYXlCSUIxNlNW?=
 =?utf-8?B?ZmV4RFlobUFzSGViU2ZEZnBZaEl6ZWNhWmV1MXRtV0FuV2ZmNW1Qbk43Uk16?=
 =?utf-8?B?K3VqM2dJQkZpVUFUUjhYL1d0am9GR3hQcWc4amxlaHNLWXBkVTJKQnd2OWor?=
 =?utf-8?B?cVE0QlhQK0VUaFgvM3RVZ0NBRHBYK2tHZFprNXJIZWljbmg3SHJHWUVKY0FS?=
 =?utf-8?B?VnJFSzdlWnd5K3o5bWZ1SWQ4aHhmQ2FIamFsTWxCSGJJeFdVWUEyOEMvNXgx?=
 =?utf-8?B?eHRpV2Fwb0FJcERvLzBVc2s4Smo2b2x2bm9tdzFyeUxNdlBiRTFZeXBLVG51?=
 =?utf-8?B?NGdjbkVsQnFuSHlkcjZyMkloQXVLV0s2VVdSRGdWNGNja3p5dUsxSHhVNlZD?=
 =?utf-8?B?eEJScnlySjM2dVB4QURSVU5tcks4aEcydi96K0srRmZNODZ5NWh2NnFsdlRv?=
 =?utf-8?B?ZFZPMVVpSDRhclBSTFFSV3hzNDVSQ0R2NmFxT3JUek5jVGkyTG54THMvWjhE?=
 =?utf-8?B?UGRibU1rYWc5am1UNFAxblFYR01JWXRBNXVIRHVEaHA4SFJSMXRQeFUvUnZs?=
 =?utf-8?B?WmxMb0F4MHB4RTJmWUR6NjFDN240S2d5TzhXc1I2K1RrMGYxSy9idWkwL0NW?=
 =?utf-8?B?dkc2T3lBbE1CdWtFVTJ2MGxIUU5NL2VHdUJueUN0L1JQTE1SaTlJTDIwVlhl?=
 =?utf-8?B?RCtLbDFCSlJqTWpOQzZqZWJra1RubW5rTmJKYktaZXNKVCtoUjk0eXAreUow?=
 =?utf-8?B?d29jT3lsZk5ucEdHcmx2Yklsc1dvTWtQb0thVFZ2cGx4eW5KaldhOFhsSm5I?=
 =?utf-8?B?dlRKLzRncDVWcDlyamZCMVVST1ZhRkdvZUk4MUpGTE1tTmwxclRMV1dzT01v?=
 =?utf-8?B?YVhEZFB3bFM3V3hMUXdwanpWejZ5SFdIZzFIWDJKNndPeGNyK0FyWmNSbXBv?=
 =?utf-8?B?UThZbGtSTWNQdFdjVG5oeldPNnN6N3NyT3F1NWJGWm1lY1FHaGwxQ0hvZzdo?=
 =?utf-8?B?WnNqSzdUeENCWTN1ME1WZFo1MU8yZ2lyTWRQb3VKN0pYeFRKWGZROWJiVU9t?=
 =?utf-8?B?MkdYZVNlekFmSVp4bUpJU3JUUjIrWUpXVmpSRlBnNWpTd0FMM1VNa3g1QmNk?=
 =?utf-8?B?c3hITnNBMnRTMFFsejd3YnhRUWsybk12UEllTTZJeDBvTEdjNXBGT3hEZnFN?=
 =?utf-8?B?dTJTcWxnWjNGeWUvdXFHZ2l6V2IvbUl6UUxGdzZqVzZQd0RLTzF5eERkV09X?=
 =?utf-8?B?d3crZ042cU1QcDhLOE1OLzg2Q1hUanJWSWlNR2ZNRU5zbytZWUxWaVRaWHhW?=
 =?utf-8?B?Y3B1Y25tMk11bXlmQjFNY2dLM2RpRFpKV3luMW13STZUUE4vMTFNdUptOVJ5?=
 =?utf-8?B?RnNPUTFnTWc1ZDZMUGVMSUZ0NkViWTZPdnV6UER4VlRFQVRqREttNFE2YlpF?=
 =?utf-8?B?dHR1RXYzVkROUDM5clU3aEt4VnZjTHl4SldWRi9qOUgzcDZldGhVYVdiaFZn?=
 =?utf-8?B?bHhIQjNHZXN5VUpZYzluN3IySU5CbHJiaWpRRWRTUmJsQStKRU1qTjRoRDBJ?=
 =?utf-8?B?R1MveG1XaGRqSzVRNDF4WVpYZXd5TXF4Q3k0SjNvMCt3ellmUHE2a2l1N05z?=
 =?utf-8?B?b0JtK0IvcnVNM0haMmNZK0ltREVYUGRqTHNhSDNFLzg1MXdkV01UQzdnUUlK?=
 =?utf-8?B?TzJocEQzYkVocnN6OWszYTlRVDQ0RnRpRUZNTnZaRHlhY3FOSENVMHc0TllV?=
 =?utf-8?B?TzNMcGNGamk0aFc2b2FHUlJQKy9GNXdxYmd2NmRvUXJ4KzZkTzJ6WmE1bklY?=
 =?utf-8?B?eThSWlAzck84U0ZwOGhkYlNSN04rb3gwT3VXQzUzQlZMeDV3eS9FdkI0WDFZ?=
 =?utf-8?B?Q2xXKy8wb0dPWFMzazRYY0dMU1czRllsaXMvWXpYdXJJR3JhWmxlbUwrNGlE?=
 =?utf-8?B?MmMvYzJSbzRUSVNiZjQ2RUlzbHVhWTkxUXhNNlFlVzdEZDdsbjNpU2duQ29r?=
 =?utf-8?B?WFBscjRZVjNOQTF0a3F2YW5sSGlwSUxaTUhvVXRlaXFGV3RhckFJemVtbDVk?=
 =?utf-8?B?ZWNXWFB1MmlrbjF3TDdsbFR2RHlEUVpVWTQ3MkdmUTZxQk1qWWlkSW9RbWpV?=
 =?utf-8?Q?q+EmilJdvsj3JjIY=3D?=
X-Exchange-RoutingPolicyChecked: C/1pqGBS62hhrX1W9v/Z5c0wABvRNhJHQxv+J6xSjGgeyMT1WsPprGhfjzPjXQckdaGbBV9lwpdkpBH5s57eUXlZqMDNJtyNbSCGGlC+nXbEBuht9TSv0nTygM6Ng0t5nyvkLrdpX/MuGLKFd6IkQQfJfbWgOblbWxDKLvhHIeUTFiYzZmrxAhNcTrQVmpu6rTh4J1WfImh5dL1urDIKrxvQSghY4ZLyg/OpY26T7R3tZuZTR83lKzANN0c7+0FIU5CmLuGBirqjGrsWeIhIC9fPj72vedfl9G0mgW4IJ8XbqJdFYly4UnTEuRrB4QSPiaa3V2I8xdCvEy8u7oN6Ow==
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b03f66-83ae-44fd-207e-08dede41afbd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 05:11:23.7058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NpQrn+7hpHuqz56uo3iP05T6RSkH1SJWhiBWrUMr8pJdqJa5or/AI0ghTxHF+sXcJA2EeXvmClNu3QFvflNPAyC5H89tlhVT48IvGpWn5OvFkkjGzSa3WcFs0FsTnn/+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4776
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



On 02-06-2026 02:13, Vinod Govindapillai wrote:
> Use the common intel_fbc_get_status() to get the fbc status
> 
> v2: intel_fbc_get_status() function name change
> 
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>

Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

> ---
>   tests/intel/kms_frontbuffer_tracking.c | 54 ++++++++++++++------------
>   1 file changed, 30 insertions(+), 24 deletions(-)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index 37706cab5..df8fbfa2c 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -1633,13 +1633,13 @@ static void drrs_print_status(void)
>   static struct timespec fbc_get_last_action(void)
>   {
>   	struct timespec ret = { 0, 0 };
> -	char buf[128];
> +	char fbc_status[128];
>   	char *action;
>   	ssize_t n_read;
>   
> +	intel_fbc_get_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
>   
> -	debugfs_read_crtc("i915_fbc_status", buf);
> -	action = strstr(buf, "\nLast action:");
> +	action = strstr(fbc_status, "\nLast action:");
>   	igt_assert(action);
>   
>   	n_read = sscanf(action, "Last action: %ld.%ld",
> @@ -1683,12 +1683,12 @@ static void fbc_update_last_action(void)
>   static void fbc_setup_last_action(void)
>   {
>   	ssize_t n_read;
> -	char buf[128];
> +	char fbc_status[128];
>   	char *action;
>   
> +	intel_fbc_get_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
>   
> -	debugfs_read_crtc("i915_fbc_status", buf);
> -	action = strstr(buf, "\nLast action:");
> +	action = strstr(fbc_status, "\nLast action:");
>   	if (!action) {
>   		igt_info("FBC last action not supported\n");
>   		return;
> @@ -1703,10 +1703,11 @@ static void fbc_setup_last_action(void)
>   
>   static bool fbc_is_compressing(void)
>   {
> -	char buf[128];
> +	char fbc_status[128];
>   
> -	debugfs_read_crtc("i915_fbc_status", buf);
> -	return strstr(buf, "\nCompressing: yes\n") != NULL;
> +	intel_fbc_get_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
> +
> +	return strstr(fbc_status, "\nCompressing: yes\n");
>   }
>   
>   static bool fbc_wait_for_compression(void)
> @@ -1716,45 +1717,50 @@ static bool fbc_wait_for_compression(void)
>   
>   static bool fbc_not_enough_stolen(void)
>   {
> -	char buf[128];
> +	char fbc_status[128];
> +
> +	intel_fbc_get_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
>   
> -	debugfs_read_crtc("i915_fbc_status", buf);
> -	return strstr(buf, "FBC disabled: not enough stolen memory\n");
> +	return strstr(fbc_status, "FBC disabled: not enough stolen memory\n");
>   }
>   
>   static bool fbc_stride_not_supported(void)
>   {
> -	char buf[128];
> +	char fbc_status[128];
> +
> +	intel_fbc_get_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
>   
> -	debugfs_read_crtc("i915_fbc_status", buf);
> -	return strstr(buf, "FBC disabled: framebuffer stride not supported\n");
> +	return strstr(fbc_status, "FBC disabled: framebuffer stride not supported\n");
>   }
>   
>   static bool fbc_mode_too_large(void)
>   {
> -	char buf[128];
> +	char fbc_status[128];
>   
> -	debugfs_read_crtc("i915_fbc_status", buf);
> -	return strstr(buf, "FBC disabled: mode too large for compression\n");
> +	intel_fbc_get_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
> +
> +	return strstr(fbc_status, "FBC disabled: mode too large for compression\n");
>   }
>   
>   static bool fbc_psr_not_possible(void)
>   {
> -	char buf[128];
> +	char fbc_status[128];
> +
> +	intel_fbc_get_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
>   
> -	debugfs_read_crtc("i915_fbc_status", buf);
> -	return strstr(buf, "FBC disabled: PSR1 enabled (Wa_14016291713)");
> +	return strstr(fbc_status, "FBC disabled: PSR1 enabled (Wa_14016291713)");
>   }
>   
>   static bool fbc_enable_per_plane(int plane_index, igt_crtc_t *crtc)
>   {
> -	char buf[PATH_MAX];
> +	char fbc_status[PATH_MAX];
>   	char buf_plane[128];
>   
>   	sprintf(buf_plane, "%d%s", plane_index, igt_crtc_name(crtc));
>   
> -	debugfs_read_crtc("i915_fbc_status", buf);
> -	return strstr(strstr(buf, "*"), buf_plane);
> +	intel_fbc_get_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
> +
> +	return strstr(strstr(fbc_status, "*"), buf_plane);
>   }
>   
>   static bool drrs_wait_until_rr_switch_to_low(void)

