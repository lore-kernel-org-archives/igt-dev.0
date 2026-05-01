Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8151CCFA13
	for <igt-dev@archiver.kernel.org>; Fri,  1 May 2026 20:57:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5527310E214;
	Fri,  1 May 2026 20:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ld73QN+1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C820D10E214
 for <igt-dev@lists.freedesktop.org>; Fri,  1 May 2026 20:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777669042; x=1809205042;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vdbCboWXDNTUuXdGVCTexGfDYNyRZFhkTIZdNXJXpNU=;
 b=Ld73QN+1/md33b6ffjJefqjNxzb7OcyTs+wAsTGNoQjETmLHwgCxRhBI
 Iu/thYDxhFwPGF8EojaBEq2eRZX4r9ylsfwbHQXdeyIwhLgsvPHx56WrS
 Q+nX4xdnH3OFeM87xsvcxDHF9qYxhA/e7SfZuXGd/Q8O3x1+8KUtnnACu
 lrMuBACBSL5k0D8nrnAjgpEBVzSSJMZkZKnaLjkcrKa925yVrn6p5KEK3
 pHLly63YLgkZmL358ngi/ra2480EpMGj7zK0l37+++Jza61352dsYsdl1
 pMHghdx+JxyCis3xNFNh/P1wzu8oiv5UkMtCtas9d5TgtWFBPS77JnNje A==;
X-CSE-ConnectionGUID: zgZ0HGE/RYuDYCnoqhGMuQ==
X-CSE-MsgGUID: ah5WXlh9TWO50tQmN9cqgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="90091770"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="90091770"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 13:57:22 -0700
X-CSE-ConnectionGUID: zvZaiqpkSj+f9ecJVrz9SQ==
X-CSE-MsgGUID: TodI0jGFSRCArKIcVfDQ4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="233929057"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 13:57:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 1 May 2026 13:57:20 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 1 May 2026 13:57:20 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.10)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 1 May 2026 13:57:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YY2SM4QA0W0O4g9D8mPVx+DVOS5yyGE8nt3KosjhAowM8jmo4Fv/pKBsHJiWPVu05MQiTEMRIyMW+EpBMCUMCLx9xn6zK17aM7Ry33X2PYP228d/REr/b639Pm7H3EmN01L3Lr+7MXgQyTawjz8gftddsls/+jkmRVOcmv4JE96y8+1p0ePjBBO8MLM19d/U+ViHWWol1WR2oUGjbpkmxV7CnAIAfxnDOCJfgORRz8rb1sFiFfUvSeM1atP0le/8wOa9A7oyLn1BoFpWr0VUEvgiroy6AE6TqZcWifChPGh5pRUSylMbWQ5Ts75efG8SFTsNNZmBIFD8MlvTD4bPxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scF8uPjXC//jQLKzDVx7CiKXTkRsHE2AzAbLcF2KfdA=;
 b=iN/stwBIDgeoxqUKmgRqZ646Ltxk//JJSfuIe4EcSezdsx13nwejBvr3dBrToFwN0qFR4OikC5NeadwAFVSgE2bQTlKD+6nBhNuBFrP+t4vTBjC9ssYtbJCym3B4ID2VSshOHXSEz2u1FA40R9iRZrX5L5IVNBOX5ty+cBq9t/E+j9NdXHTMlii9sxg6ZXz3eVHubBDXkzENPH56zdoNs8lRS4tcjo4Ko96PmNpfTlTn+LeudWjPEp1n7mwHMVYCXtE2Q//snyWdQ8Xq3KBobkruSBu2g6BQLdCyrB+K71+vhTHOocX85X0ltL1May7ZsQ2C8FyWqKdta1u2Y6x7PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Fri, 1 May
 2026 20:57:18 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9870.022; Fri, 1 May 2026
 20:57:18 +0000
Message-ID: <771f8e2d-a0e1-4d33-ad71-90c0e67cf60b@intel.com>
Date: Fri, 1 May 2026 13:57:15 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] tests/intel/xe_exec_multi_queue: replace sleep
 with barrier queue
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <stuart.summers@intel.com>
References: <20260430041055.1901126-4-niranjana.vishwanathapura@intel.com>
 <20260430041055.1901126-6-niranjana.vishwanathapura@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260430041055.1901126-6-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0067.namprd03.prod.outlook.com
 (2603:10b6:a03:331::12) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|IA1PR11MB6467:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b686c21-ab23-431e-24f7-08dea7c43b1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|42112799006|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: FQKE9t/i1It4rtTtuIjwGwmR0igj6YmNC8BJ925jkOjrdrWteLoWWs+dxbmO0I2TpascTw2HG9rPfXXjfOdWd0CFRd6zcfx5ypZ98cUJ7vEwl3erT27voZxFjxtecCpY2YuKPnlwbG+HP1Yf1r0fTfUkPu46lWeQCkRxNSo0FPOLVbuDGt/KOztfmfpcGG5gzdPkiOoYitsxXjvFJDhW1+iieXXukJQsDcXsZRFPE/7KQEmyIfuyDA9jR0Hn+fcFAgFyuq19aEcD1cWz/KGRRGM4lOIROyg7Caz/ot5ihoAFDn5Om4lnQOXcVKwNBQfuHPElh6FLtO+//hCqkNZzRIDkD8dJu26edPqvXIF7opz+n0SoUogyD1QzOZEVoqYtpBJ9PaYKvXWjiVGCGCAwGsxGXdAmEwT3JtIAVGAiXPqlFsXnNQRoCXC4H7H48tmf65v/Co72HyWKjFUDf3QDscIJPuUNC2G6G85U7VBRR48S/12MIB9EEGUzuXkMqmX2XDdyxcSIr7fSasqPiUoD4WrWUJyFxkjyaYNeQOVr+qi/AzXVTHu7/Ncx3JNZu0wyOoGT2duWmAKscpxj4E7uIf6vMVdeSbba8HrQK+aU7az+T1cT1KoxXWtgpytcIeVeKVcAGVHm/tJiT1ZVm3llC7k7SS8YJFnQBZBWiZsP+9bAjGjU6YhiqULkkJR6fdiY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHZ2cFlYdm5FeUt0eUp0RlM4SjZKaEZMTE5GUjZpZG0zbWVRRTFaNHVDOGJo?=
 =?utf-8?B?SWlsSEpzK0NVWmRWdkgwdEJTYzVFaysySUVMamtwSnZiTlh4dDlRMzFXbUR1?=
 =?utf-8?B?U1owZ21WQjFoUlNML2F4Sy9HUkQzVUlyN0FQT3p3MHpJTEJqQ1dUSFpXMndo?=
 =?utf-8?B?alNPRlU1Ump5dzU1M29wMUozUFBlYnNuZHNDSlFCREJiMmg1b1U1RjZnOURQ?=
 =?utf-8?B?V2NZajh4aWp5OEg1UHk2LzlYTmxqR0FiWW5BR3dJcE8wcWY2Mnd0WTY3RDJa?=
 =?utf-8?B?NU54NWpGbE5RbC9zU1luaDJYUzZNOEgvbVZVa29JZk9PNEFyb0d2VVpKSTlV?=
 =?utf-8?B?QWxncE05QnBxOFpVdmpEVlNHbkplbS9kTy9Iay9DUkRuTStjaFBrWGkyS1Z4?=
 =?utf-8?B?cTBCeHlCY0h0UkhRMUwxRWRDYzQvd2d3Wlg2eDEwOTNJMFBRWlNtcmcrSlRU?=
 =?utf-8?B?eGx6bmc4Wkl3YVN4YXBaa1orTUM1MFJyWFMyNUxJOEI5WjZnbjlJU1ZnMnVB?=
 =?utf-8?B?NGFaeUdDeGk3YTlpT0xGaDN5aFVSWk5LZWVCbU1rZ3dVZkdVeEpETmpwWER2?=
 =?utf-8?B?d2toczIrSlAzc0ZlaW8ySThWeWhGYUhWMWdoN0YvVUJ6WjJGL0xDUytuc1Uz?=
 =?utf-8?B?VkllcVNveWZYT1k4QkV1a0dHN0dZOExDellzbFpmVmt5R2p3WXBtRW1NRktO?=
 =?utf-8?B?UDYzaEMwZGVMazdXb25pQ210cmNZejhQT3ZjVS84bjBxcWc1K2lORUw2Rk9m?=
 =?utf-8?B?elhJc0xjYWJxMzFTMjBDU2p2M05Pd3dhNnA1Z283ZVBHQ2hDS2MxUStWV0NV?=
 =?utf-8?B?M05ybWZEekd3bFY5bDljRDd5Vmx2d3h6b09DaUpucHplcHVxMDl2cVphVnB2?=
 =?utf-8?B?VFVPNzVUOHFZSHhJcmE5V3EvSEhMZWFkZXFPZzFZdXBQQ280VzhtWWNLMlFp?=
 =?utf-8?B?cU1zak9WZ2pqR0Fxb3dDYVhGS2NDQnh5eitMS0VwWC92dkRYb0NDS0QvMEdt?=
 =?utf-8?B?WlZYYVlNVlJrUlNxdzZ4aHRXOW00WUxaV2tXWU9oNVN4U2Q0Q1ZMeG1CR0cv?=
 =?utf-8?B?QUZlZjdGcGlyeDBscklNSk5EUW1CSUZaWGlkOVhhRVY4M0VHVDlzTytod1kz?=
 =?utf-8?B?RHlPenIrTW0ycXNjc1EvTndhbkRnaGQ5VmdhQ3BjSmJiUnZNK0VYRzU4NkhG?=
 =?utf-8?B?QUpPZ096Q0R5bzVOd1VyUGJwV3MwNjU4THNCNUExRGQ1T082THhpRTJNdE9j?=
 =?utf-8?B?TGJLT2ZCWUo1VWtHT0R5MkZycjhKS3M1YUhJdGtZNkNFUTRZTnpSM0JGVmF2?=
 =?utf-8?B?Snh5VEFTdVhXeTlORGNCeTlsTTNYckVCK3dVbGlYR2V6ayt4ZWJTUS9rbGpP?=
 =?utf-8?B?WmszTC9HeW9EdWNlekRxVzFVRlQ2WmlTanVDVHVYWENuSStLRFJnT1lUWUtD?=
 =?utf-8?B?bFdEdEZZUlVuR0lsbjQ5STVjS0M3VlAwSmpoMEJyYXN1ZjFEYXdNbDBsTDZT?=
 =?utf-8?B?cnlzRHIxNjRtREpUMGxxVjJJUk82dEdIMVNsYTVMNC9QVmxNZEFtcmY0OFA2?=
 =?utf-8?B?eVFhVzFlZ21FMEV0K29pK25jTC82M0hhUVBKWTZKUWkzcndZSVF6aCtNdGp3?=
 =?utf-8?B?NDJ4YXAyTGVhck5SM2dMcDNQci9KWWlxeHM3VTVXOU5lTUxiRmZYb2JMZ01a?=
 =?utf-8?B?RlRGR0Y1SHNFVExWTU1sMXJkZ1pVUmtISmhHRUtBdmJVVm9MUk9ua0w5R0Jo?=
 =?utf-8?B?RDRDSVU2dWdKQnhNeTlSb3IwelUvb2w5eGVpQXhJNDZWdjRBMy9QZDZDekxx?=
 =?utf-8?B?dXhhTGpuQkpPUjM3dEdUZ2FaWU9hVlNvQzQrVnlHNjhhS0hMeVpvUWJSdjRO?=
 =?utf-8?B?OFdSa0tNR3I2NjVtYU9WVGpxdGk2RDBoelFVbktTMW01b085UWN3YXFHbE5t?=
 =?utf-8?B?Mk1pMkJCN2RHbHVTN2ltd25kc1psWUpiRENxanJtcEIxUHJzblNXWVJ6RTFj?=
 =?utf-8?B?UXdiNzRWVTAyR3NoR0pvN1lHa054SW01am5sUzY3M250dlVDazhLMzJNVEpO?=
 =?utf-8?B?Wi8weldjbElselVReUFRSW9KSVNlUjRldkxsNFVlKzVXMGxrU2I2SGZMb2tz?=
 =?utf-8?B?QWlFTjFiVmdMSTlwWGVrc3lrUVAzSlFUQlVVdnpVNDZJY1hRS05lRWdKRzdN?=
 =?utf-8?B?NjVzVEl0RUtRejVaR1JTQjhrSnhvOEtxOUNESEhScU4rVGpjalpHNlhTOEtt?=
 =?utf-8?B?SGlseHFWNkJwaXVEVEg1UUNGT2IvL1pISERqN0kvelB5dVZ4TWZHT1JwY3lP?=
 =?utf-8?B?bGVURDBzNGZ6d1pmaFpXR1hCWmp4eE5uODVCcFpYTnZOdGhmNk5QQT09?=
X-Exchange-RoutingPolicyChecked: orgQLopqtxWbnqhWmQZNovD5VtEsD3Y03cNgprJnKPf4KQtHCMrLxivQrGR6gxIRq1Rz1WYGfecyRO86On4D5um+Y55xKKtzLz7UIecRMuFhImJoFUCyiK0a2YlixGJbPPivNQFJQmZcFeiclpIzGrc/S6N1jHeudHSJeMOxMHpKjpwQ5sguKjXghXVwSLiQ3Cti2gMFs7q9Gw52pF7rFliSq0xx6LzDOaTbDrcj7FJkJYLVX4QWRUzGHo2OaefKefXrt9GWQtEegoooLSFgA10wicMSWGYNY5tuXtlFssGeyn/0IoMvgXVtDIUIf3hcY913bnEZIMQUhiAVzZwujA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b686c21-ab23-431e-24f7-08dea7c43b1d
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 20:57:18.2222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oByphAD/6nrN/HakMVueLZuHymTqOs95YuF88maZz4wNXfkGVXZfOYjubiiZJPzqdtrRtYR41LCS8fMS2/p3WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6467
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



On 4/29/2026 21:10, Niranjana Vishwanathapura wrote:
> In __test_priority() DYN_PRIORITY case, replace sleep() with a
> deterministic barrier using an extra queue in the same multi-queue
> group. After assigning priorities, submit a spinner to the extra
> queue, end it immediately and wait for its user fence to signal.
> This guarantees a full scheduler round-trip confirming the priority
> updates have taken effect before releasing the other queues.
>
> Increase exec_queues[] and spin[] array sizes by 1 to accommodate
> the extra barrier queue slot at index num_queues.
>
> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   tests/intel/xe_exec_multi_queue.c | 37 +++++++++++++++++++++++++------
>   1 file changed, 30 insertions(+), 7 deletions(-)
>
> diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
> index 0b31dd7a3f..1799066942 100644
> --- a/tests/intel/xe_exec_multi_queue.c
> +++ b/tests/intel/xe_exec_multi_queue.c
> @@ -381,8 +381,8 @@ __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
>   		.syncs = to_user_pointer(&sync),
>   	};
>   	uint64_t vm_sync = 0, addr = BASE_ADDRESS;
> -	uint32_t exec_queues[XE_EXEC_QUEUE_PRIORITY_N];
> -	struct xe_spin *spin[XE_EXEC_QUEUE_PRIORITY_N];
> +	uint32_t exec_queues[XE_EXEC_QUEUE_PRIORITY_N + 1];
> +	struct xe_spin *spin[XE_EXEC_QUEUE_PRIORITY_N + 1];
>   	uint32_t vm, num_queues, num_queue_priorities, bo = 0;
>   	uint32_t start_order[XE_EXEC_QUEUE_PRIORITY_N] = { 0 };
>   	int64_t fence_timeout = NSEC_PER_SEC;
> @@ -403,7 +403,7 @@ __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
>   		.value = DRM_XE_MULTI_GROUP_CREATE,
>   	};
>   	uint64_t ext = to_user_pointer(&multi_queue);
> -	int i, j, sleep_duration = 1;
> +	int i, j;
>   	void *bo_map;
>   
>   	num_queue_priorities = XE_EXEC_QUEUE_NUM_PRIORITIES;
> @@ -415,12 +415,12 @@ __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
>   		 eci[0].engine_class, eci[0].engine_instance);
>   
>   	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> -	bo_size = xe_bb_size(fd, sizeof(*spin[0]) * num_queues);
> +	bo_size = xe_bb_size(fd, sizeof(*spin[0]) * (num_queues + 1));
>   
>   	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci[0].gt_id),
>   			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>   	bo_map = xe_bo_map(fd, bo, bo_size);
> -	for (i = 0; i < num_queues; i++)
> +	for (i = 0; i < num_queues + 1; i++)
>   		spin[i] = bo_map + i * sizeof(*spin[0]);
>   
>   	/* Use the default priority for Q0 because we are explicitly waiting for it below */
> @@ -430,6 +430,11 @@ __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
>   	if (flags & DYN_PRIORITY) {
>   		for (i = 1; i < num_queues; i++)
>   			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
> +		/*
> +		 * Create an extra queue in the same multi-queue group, used as
> +		 * a barrier to confirm priority updates have taken effect.
> +		 */
> +		exec_queues[num_queues] = xe_exec_queue_create(fd, vm, eci, ext);
>   	} else {
>   		struct drm_xe_ext_set_property mq_priority = {
>   			.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> @@ -474,14 +479,28 @@ __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
>   		while (!READ_ONCE(spin[i]->timestamp));
>   
>   	if (flags & DYN_PRIORITY) {
> +		uint64_t barrier_spin_addr = addr + num_queues * sizeof(struct xe_spin);
> +
>   		/* Assign increasing order of priority for secondary queues */
>   		for (i = 1; i < num_queues; i++)
>   			xe_exec_queue_set_property(fd, exec_queues[i],
>   						   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
>   						   i % num_queue_priorities);
>   
> -		/* Wait for priorities to take effect */
> -		sleep(sleep_duration);
> +		/*
> +		 * Submit a barrier job on the extra queue to ensure priority
> +		 * updates have taken effect before releasing the other queues.
> +		 */
> +		xe_spin_init_opts(spin[num_queues], .addr = barrier_spin_addr,
> +				  .preempt = true);
Looks like this line wasn't removed — we agreed to drop it in v1.
Other changes LGTM.

Reviewed-by: Xin Wang <x.wang@intel.com>
> +		sync.addr = barrier_spin_addr +
> +			((char *)&spin[num_queues]->exec_sync - (char *)spin[num_queues]);
> +		exec.exec_queue_id = exec_queues[num_queues];
> +		exec.address = barrier_spin_addr;
> +		xe_exec(fd, &exec);
> +		xe_spin_end(spin[num_queues]);
> +		xe_wait_ufence(fd, &spin[num_queues]->exec_sync, USER_FENCE_VALUE,
> +			       exec_queues[num_queues], fence_timeout);
>   	}
>   
>   	/*
> @@ -572,6 +591,10 @@ __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
>   	for (i = 0; i < num_queues; i++)
>   		xe_exec_queue_destroy(fd, exec_queues[i]);
>   
> +	/* Destroy the extra queue */
> +	if (flags & DYN_PRIORITY)
> +		xe_exec_queue_destroy(fd, exec_queues[num_queues]);
> +
>   	munmap(bo_map, bo_size);
>   	gem_close(fd, bo);
>   

