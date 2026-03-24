Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91264F54AC0
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 14:14:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B1F10E0B0;
	Tue, 24 Mar 2026 14:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fOuF3ZcN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB2A710E0B0
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 14:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774361690; x=1805897690;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yv6D38N/ILW6NHy/MesBx3WBh3nvtQ8CVsdzx9an05c=;
 b=fOuF3ZcNmmYwvKAnXYSqd9WHFYyGSDQErm6npuC2Qoc5e/YE24RldBDN
 HimDouoB6u3I075i8JzF+VNAfHof1GNNEAc06YVYmueXPgrUUCJr4BfBQ
 WQXWU7qbCS5t0LVlQ6eTTuUjrXsF+hTIi9l+rulwhBlmqgp9M7cSDUakm
 NApJ4hK6Gxeus1pVL8XWxlRMF/7GrRSqTJMEJluVOSJmItADdxrU9Yf9Z
 +h0qW862qwe75b4uWbX7qBkUTpwy/lQMa6dqK5QhsjM1FWC0G/Wbvs+dt
 +s8luYqPJUBjz5N+l1JOSCdJN1y0mlJjp7sbbreSF29sPo9+ZpcgOTPBS A==;
X-CSE-ConnectionGUID: ll3+CNzST6eAgvsypW5Phw==
X-CSE-MsgGUID: 3CXCHcX5SxyjQw0iAhOVVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="85687579"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="85687579"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 07:14:50 -0700
X-CSE-ConnectionGUID: g6RFVrNgS6S46ybMfQeyUQ==
X-CSE-MsgGUID: o8uv/SErTa2YZn7oij48HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="223574866"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 07:14:49 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 07:14:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 07:14:48 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.57)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 07:14:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhTMm2Svogynr5sw2xLHDt0KpQPGYe+epc/PSub+MYTZxNK9UEIoMstd2RS7Od00NzJmNA0va+KJ1LzlJu3kOun1L5ICe62xLVPLlc0yQnziTpJmU0BeuPLqEfCOAiqCDwDNkrv+T3jfxXHrcZjPCqI4cvm4HNCVCqlk5vZf4G9P59MVGaP7HweEg++Zso2So/9DE6zOwMcRILH3Q1r2KXnWrn5hbYMUgAuBrvPtpMTCc3Tb9TOAIst0wyhO4ZHJ8znR0z5FjrjUlc/Qsd6yVxueW4cojeupcEOdq4leiBbrlZ5dBFUhdgI/KgAba+3Z3xaVp56KKIKvyV0WEJ6FhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqQGLnlbCjXJJpxUYXVU/RTVJNZZnOxMOjcROaiQpBM=;
 b=YW41wAGrLSQrUuqKOlU5aDv7H1sdL7vo+lHk3sYMwTCYWe2o0spMlp2NUfqikVqdtVoLGqE03E/pdkDxgn349p3U1np1lBmYyoUG6kuYSIQfswJ2Jr7LyElR1zyOFDllc7s7Q1Kb/rnBsAixNKQ3ngbEVLsnQ58s0rNgC7lhNXdZ1yzo+gB4uVctCaU1l26Gk2oDzMtAxjwiPxQSAc1xIdWzm6mfrUWFmAqnbZ1DiHylBzoYk/aJ+R7fUTvlq1J9CO4dSR+fHDwk2zt87yq16kR/BpeP34i+m4+1NnWIuxZVVA7FUrNvgBtGN7/tvTx3F69GyuI3OhRUlsH4Fypfzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by IA0PR11MB8304.namprd11.prod.outlook.com (2603:10b6:208:48b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Tue, 24 Mar
 2026 14:14:44 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%6]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 14:14:44 +0000
Message-ID: <1c217884-ad18-4731-a1f8-2f8b0f9efe7d@intel.com>
Date: Tue, 24 Mar 2026 15:14:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] tests/intel/xe_sriov_vfio: Add dynamic
 bind-unbind-vfs subtest
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <kamil.konieczny@linux.intel.com>
References: <20260318161447.961840-1-marcin.bernatowicz@linux.intel.com>
 <20260318161447.961840-3-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260318161447.961840-3-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0218.eurprd08.prod.outlook.com
 (2603:10a6:802:15::27) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|IA0PR11MB8304:EE_
X-MS-Office365-Filtering-Correlation-Id: b4bef042-761e-4fa6-1cdf-08de89afb284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info: wrlr7rQ03ST5CDUrOSXy5hU3bp7nJMer0PJeoivwdWF4wvf8zuBkNs5gSorEojZZgSAKSn29MKxMoFLMG3hSQy41Cq1IXTThlLtDjgykYvyVQHppoLJzBnSTub86EB80ezUdz/w2/yd58NDI8JbHh/i8WfCIZzxkjAmcsKx3IC2bfmU8axoMjTTf8inkAIARspDD+2Ngivu7NZDA50Ev7dzWELJHhckckMcUGbvbfjjxu/HWMLqNeAFQen/1WrFizQh0PSHPF/hAyK00G4PXEjSls02gBRFdv649/ZMRX0V9IzNOTG3A7lGu31oWvHDoHqrTjKGEU6giFWb6KC+u6ONE/3vQWigQOCWgDyZfWpTbNGdzDpxXcPZsis4fwje6ZP3msnD6pXi+esZvymwMzNLt+8qVI02SbfsYUpYjZRXFePmefRxSyiGPaPTOLhhGB1aRn7BLmtaBZYIf6jFtEop6XYhO0oTJHHaehqO0RXTqzP+zwF2SN9kaiPnnijuu+hl9uSi/1ovH7ururf0yJUD0+6pWH03/SMdSewmX1Q8aUeCHqR54HzZaE96IB6gOhapeviOlt5Jf2eDU2e8xRS45X/w/PuKpy+OzwD7vfLi7Xbbt28/JMQ1EHREX2tdl5BvzpTukt2kZw5+EDNHR6djquirBfbN58X5DPfOxdEIKsqARqo/nWvB4HWdUzC9UDj+M2Kdsc1CCny5gkv785jbvmruvBDCZVfsUcRmu1O4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnRVWStjYS9mNVUvbys3RnlOODhpWVFuQ3dZQ1pyVGFmODZjOGJhcFp3UzZr?=
 =?utf-8?B?ZktyMnZEUVcvb0w3SlZ1d2xkMGg0Y3ZKTG9UV3dDc1VlODIwWGdockVsOEsz?=
 =?utf-8?B?QWpWcGpkYmJkSTlqb0s0N0ptU1VzOGZBT25aWHdKWmRTNVZmdHcxbTVka2VL?=
 =?utf-8?B?a1lrQ0xrZ3JqTWgyQWd2aTVsY1FiWGtSUVJ2aUc4Y210UktPZGlqaXZRVjBC?=
 =?utf-8?B?YStFWFo2NGkvMXJzdGU1elgxMGlaRWswTUpSRHlrWUc1cU5hTGJiRnRoZnZv?=
 =?utf-8?B?ZEVSOEZIQ25QT3dSSm9EcHZxa2h4Sk9zdmpHL3AzN2p0cEFPRkcvRFp2NkRO?=
 =?utf-8?B?b254cVRNNHE4MnFkaXRMQ1RQK0xMMG45UGxmOVI5amdOV05LbU9oTEFBUEtY?=
 =?utf-8?B?RDh6NHdkRys5eVZXTHY2WVFaVGJXQTlPY0phdmg2UEVlNDR4dFQxbnF0eXJ1?=
 =?utf-8?B?Y0VTRzlzeUVEK08xNWx4amJReUJqNzIwalRHenBjZGdmRTdSQjNkOS9nTEZh?=
 =?utf-8?B?RFBCeG1TczdrM01ocTZINS92UkZFaTJGcExOUHlHS1dDVDkwWjczWVpkVHl1?=
 =?utf-8?B?K0E4anJQZDJmUCtRUWtLWWd4NmMvWTJWUEo4NGtPTmlTblZscGdlaE9iQVlZ?=
 =?utf-8?B?bkg1cnRHejZvWjdpZVhKRHBGR3QwQVBKemxmdk1vQVFNOHQrYU12QjlIbnQx?=
 =?utf-8?B?a1Vkd2RNK1NuS2pVTW1LRzVYS1hXa0xOR2FrSkxBdGpKYWlBM0hFSXJsNjN2?=
 =?utf-8?B?SDkxd2NRYXhhckh6c05CSmp2M1R4am5FeGpNc0Q0N2RBaGFQLzdrRmtRelhJ?=
 =?utf-8?B?b3RPL2tMRWVmd3RTUHVhNHhCelE0M1lRa2M2WDlsbStTc1daOUx1Y2MvZ3N3?=
 =?utf-8?B?WVVJaTI3VVlNUTNHNlhuSFVtdEF2L2xUOW55OThpRXMrUFBzbmdUeFdJdWdi?=
 =?utf-8?B?UFdXclk1NG1JVFduT29HK1BDeXJZOWN4MFZ3eWJ5UFFOTDAwZjliK2NvL1VU?=
 =?utf-8?B?c3orNzNWQy95ckpqVnlWL1VpdlJ0d2prejY1eHFYd3d3RXBtZGdadzNSQnFx?=
 =?utf-8?B?QTh5QkcySG9qUkVFV0d2UTVVZjBzVnNWR0w1MGdyWlhQMzV3NXY5Sm5DZGNP?=
 =?utf-8?B?UTJEOGVxYXk2VWZqNXZGeTZTcG9nbzR3bHpBZjB6cEhBbDVDMHFkaFV3VUdS?=
 =?utf-8?B?Nk9jUzkvaTk0SHJVVGZ0YUdMS2NpUGo2dGl3SjVuS2tLU0JiYXlhVmpGK09p?=
 =?utf-8?B?QXpHR3ZqOGhQVnZFT3BOamJIRjlieTZOOERwSFR4SmNoejc2d1N1TllaZ0Zo?=
 =?utf-8?B?M3VJN0p6aXpwSkxGNE1SRDhYT05VZ0tvSUtJQnNBWFVuVlFVZ2dteDVZSThT?=
 =?utf-8?B?cVpRZThod3ZvamJLSldia05ZS2hQWXpBUzVmVy9abVJYdE4vdGljTjE1a2Vr?=
 =?utf-8?B?NVNXZFl0cDNaUXlYZlgrTjFKQVlRZ2xlSkN0S2FpQ0t1R2ZzVmRRcVBSSTEr?=
 =?utf-8?B?b05QTGFjVkJaY2ZWeHNVTklzNk45SVJSaXFwc2FLYVg5dmg2VkVIWlNRUjVn?=
 =?utf-8?B?ZWJwUXNJclpHY2tzNkpWcGtaaWZvTng3Z3lRWlNTVUg0QmZzb2ExMEtNY1J1?=
 =?utf-8?B?SFFhVGtKRld5UzZndFhsUEsvNWd0MjdPUGNOSmQwYWxkZkE3T3ZKaFFLQTFO?=
 =?utf-8?B?RXlIa0lqajdoc2VCZ1MwYTBQbjVhRm5aWlQ4OVJTejk4TEZQNWNKS3pxdXUz?=
 =?utf-8?B?bjJTazlwbWw4bWJnemVWTUtTM25hd3pVdlZUQUdvTmo5WlVDOUVGMWI4NEk5?=
 =?utf-8?B?RDc3OU1xZjBzeDhYTENocTdJOWNpZVJKUGFuNVl5bndVQUcycnBlMlo3dzNo?=
 =?utf-8?B?ZE5xUUhHVXN5T05xR3VJMXFVYTd4WUFUYUlLNkJ5Uml1TkllNG9yWVpOdzlT?=
 =?utf-8?B?c1hFZ2l4NEVTYitKeUtpL2ljMDVNUDZGUHluSDRMLzY0S2VSb0lZa1N2Uncz?=
 =?utf-8?B?QVo0RCtyeXRHNUZ1RW9tV2U3Y0JjY2J4SG1iWS9jazNlYklYeXp6K2JKYTVI?=
 =?utf-8?B?bW1mdWlvSnpxS0YzL1hObG43Q2pkYW52di9CdHFnZWZuUk4vSkpxbTRyRjMx?=
 =?utf-8?B?K2o3eXY2SDJmb0djOXNSa0xlZStUazBxM2VPc3R2UkhmMU5nS3hJSld4eGhN?=
 =?utf-8?B?SjVFbGMvblp2TkNHWkdlUitRbEtKOWpOdUtIWGtsR0FsaFJXK1o4ZkNrektB?=
 =?utf-8?B?QW1udG5jSFcwdDNpVnVzMXVtaXpuMXVKajVQbHo0SEc3YmNhN3VpbmZtNEZO?=
 =?utf-8?B?WGRXeEJxb2V4S25qY1ZLelFOc00wUUlCRlpxMnRZUG9jclI0VHplQT09?=
X-Exchange-RoutingPolicyChecked: UPsikJUV6v9jEEcleerKwicO1dbqBzAnV2jsUvFkl/FWeB+TzLKoSXJNXkgNJpRId6FF2gLlpGnqSo2+Mz1pLEtWJ294i4EryVrzN8+e+ZHuvca8V+FgBkFG47/oz/TSuJ62NzOK7oD3aFCA7LOz4w/+6iWxnpJDgU4AhisbVUxjDQUNPcIqCpFCKYcEhEtWf6OM+Xv5XGNTgFWDNMqxIXzS2xCxSz1ki60D258WWSf2pzw4iF/cYZxo7h2sbSdUzqYn7McMigxUeDK3c+bZrEELtwZNQwufAdhRq4DbYQkpgmdUuZyfesUWOy/OnWWEycn9Y7WhnuzO8fYKiE+y0g==
X-MS-Exchange-CrossTenant-Network-Message-Id: b4bef042-761e-4fa6-1cdf-08de89afb284
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 14:14:44.1454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mMuapyBMUdzz4wj+t2Yb/Y+wUmZn3Cv4ofC6S9twAA0pOG4r8uG8exaQ7cBIrepelXX/tcCyuYcB4zUbn6Xgjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8304
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


On 3/18/2026 17:14, Marcin Bernatowicz wrote:
> For each supported numvfs-N configuration, enable N VFs and
> bind/unbind each VF to xe-vfio-pci through driver_override.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   tests/intel/xe_sriov_vfio.c | 169 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 169 insertions(+)
>
> diff --git a/tests/intel/xe_sriov_vfio.c b/tests/intel/xe_sriov_vfio.c
> index 2fe0137e1..a2b2959e2 100644
> --- a/tests/intel/xe_sriov_vfio.c
> +++ b/tests/intel/xe_sriov_vfio.c
> @@ -5,9 +5,13 @@
>   
>   #include <ctype.h>
>   #include <dirent.h>
> +#include <fcntl.h>
>   
> +#include "drmtest.h"
>   #include "igt_core.h"
>   #include "igt_kmod.h"
> +#include "igt_pci.h"
> +#include "igt_sriov_device.h"
>   
>   /**
>    * TEST: xe_sriov_vfio
> @@ -22,13 +26,23 @@
>    *
>    * SUBTEST: unload-xe-vfio-pci
>    * Description: Attempt to unload xe_vfio_pci module (skips if busy).
> + *
> + * SUBTEST: bind-unbind-vfs
> + * Description: Enable VFs and bind/unbind each one to xe-vfio-pci via driver_override.
>    */
>   
>   IGT_TEST_DESCRIPTION("Xe SR-IOV VFIO tests (xe-vfio-pci)");
>   
> +#define DRIVER_OVERRIDE_TIMEOUT_MS 200
> +
>   static const char *XE_VFIO_PCI_MOD = "xe_vfio_pci";
>   static const char *XE_VFIO_PCI_DRV = "xe-vfio-pci";
>   
> +static int pf_fd = -1;
> +static bool autoprobe;
> +static bool xe_vfio_loaded_initially;
> +static bool restore_xe_vfio_on_exit;
> +
>   static bool pci_driver_has_any_bound_devices(const char *driver)
>   {
>   	char path[PATH_MAX];
> @@ -54,8 +68,143 @@ static bool pci_driver_has_any_bound_devices(const char *driver)
>   	return false;
>   }
>   
> +static void assert_bound_driver_is(const char *pci_slot, const char *expected)

I think it would be better to have two helpers: assert_driver_bound() 
and assert_driver_unbound()

> +{
> +	char bound[64];
> +	int ret;
> +
> +	ret = igt_pci_get_bound_driver_name(pci_slot, bound, sizeof(bound));
> +	igt_assert_f(ret >= 0, "Failed to read bound driver for %s (%d)\n", pci_slot, ret);
> +
> +	if (!expected) {
> +		igt_assert_f(ret == 0, "Expected %s to be unbound, but is bound to %s\n",
> +			     pci_slot, bound);
> +		return;
> +	}
> +
> +	igt_assert_f(ret > 0, "Expected %s to be bound to %s, but it is unbound\n",
> +		     pci_slot, expected);
> +	igt_assert_f(!strcmp(bound, expected), "Expected %s to be bound to %s, got %s\n",
> +		     pci_slot, expected, bound);
> +}
> +
> +static char *vf_pci_slot_alloc(unsigned int vf_id)
> +{
> +	char *slot = igt_sriov_get_vf_pci_slot_alloc(pf_fd, vf_id);
> +
> +	igt_assert_f(slot, "Failed to get VF%u PCI slot\n", vf_id);
> +	return slot;
> +}
> +
> +static void vf_bind_override(unsigned int vf_id, const char *driver)
> +{
> +	char *slot = vf_pci_slot_alloc(vf_id);
> +	int ret;
> +
> +	ret = igt_pci_bind_driver_override(slot, driver, DRIVER_OVERRIDE_TIMEOUT_MS);
> +	igt_assert_f(ret == 0, "bind %s (VF%u) to %s failed (%d)\n", slot, vf_id, driver, ret);
> +	assert_bound_driver_is(slot, driver);
> +
> +	free(slot);
> +}
> +
> +static void vf_unbind_override(unsigned int vf_id)
> +{
> +	char *slot = vf_pci_slot_alloc(vf_id);
> +	int ret;
> +
> +	ret = igt_pci_unbind_driver_override(slot, DRIVER_OVERRIDE_TIMEOUT_MS);
> +	igt_assert_f(ret == 0, "unbind %s (VF%u) failed (%d)\n", slot, vf_id, ret);
> +	assert_bound_driver_is(slot, NULL);
> +
> +	free(slot);
> +}
> +
> +static void bind_unbind_vfs(unsigned int num_vfs)
> +{
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
> +
> +	igt_require_f(!igt_pci_system_reinit(), "Failed to refresh PCI state\n");
> +
> +	igt_sriov_enable_driver_autoprobe(pf_fd);
> +
> +	for (unsigned int vf_id = 1; vf_id <= num_vfs; vf_id++) {
> +		vf_unbind_override(vf_id);

Why unbind here?

> +		vf_bind_override(vf_id, XE_VFIO_PCI_DRV);
> +		vf_unbind_override(vf_id);
> +	}
> +
> +	igt_sriov_disable_vfs(pf_fd);
> +}
> +
> +static void open_pf(void)
> +{
> +	int fd;
> +
> +	if (pf_fd >= 0)
> +		return;
> +
> +	fd = drm_open_driver(DRIVER_XE);
> +	igt_assert_fd(fd);
> +
> +	if (!igt_sriov_is_pf(fd)) {
> +		drm_close_driver(fd);
> +		igt_skip("Xe device is not an SR-IOV PF\n");
> +	}
> +
> +	if (igt_sriov_get_enabled_vfs(fd) != 0) {
> +		drm_close_driver(fd);
> +		igt_skip("VFs must be disabled before running this test\n");
> +	}
> +
> +	autoprobe = igt_sriov_is_driver_autoprobe_enabled(fd);
> +	pf_fd = fd;
> +}
> +
> +static void cleanup_pf(void)
> +{
> +	if (pf_fd < 0)
> +		return;
> +
> +	igt_sriov_disable_vfs(pf_fd);
> +	igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)\n");
> +	autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
> +		   igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
> +		       "Failed to restore sriov_drivers_autoprobe value\n");
> +	drm_close_driver(pf_fd);
> +	pf_fd = -1;
> +}
> +
> +static void restore_xe_vfio_module(void)
> +{
> +	if (!restore_xe_vfio_on_exit)

If you go with one subtest (load-unload) approach, then I think we 
should always leave the environment in the original state, so this 
variable would not be needed.

> +		return;
> +
> +	if (xe_vfio_loaded_initially) {
> +		igt_abort_on_f(igt_kmod_load(XE_VFIO_PCI_MOD, NULL),
> +			       "Failed to restore %s load state\n",
> +			       XE_VFIO_PCI_MOD);
> +		igt_abort_on_f(!igt_kmod_is_loaded(XE_VFIO_PCI_MOD),
> +			       "%s should be loaded after cleanup\n",
> +			       XE_VFIO_PCI_MOD);
> +	} else if (igt_kmod_is_loaded(XE_VFIO_PCI_MOD)) {
> +		igt_abort_on_f(igt_kmod_unload(XE_VFIO_PCI_MOD),
> +			       "Failed to unload %s\n", XE_VFIO_PCI_MOD);

I think it should be consistent - "Failed to restore %s load state".

> +		igt_abort_on_f(igt_kmod_is_loaded(XE_VFIO_PCI_MOD),
> +			       "%s still loaded\n", XE_VFIO_PCI_MOD);

If it's an abort I would say something like "Failed to do sth" or "Can't 
do sth"

Maybe use err variable, and at the end use one igt_abort_on_f(err, 
"Failed to restore %s module load state") ?

> +	}
> +
> +	restore_xe_vfio_on_exit = false;
> +}
> +
>   int igt_main()
>   {
> +	igt_fixture() {
> +		xe_vfio_loaded_initially = igt_kmod_is_loaded(XE_VFIO_PCI_MOD);
> +	}
> +
>   	igt_describe("Attempt to load xe_vfio_pci module.");
>   	igt_subtest("load-xe-vfio-pci") {
>   		int ret;
> @@ -85,4 +234,24 @@ int igt_main()
>   		igt_assert_f(!igt_kmod_is_loaded(XE_VFIO_PCI_MOD), "%s still loaded\n",
>   			     XE_VFIO_PCI_MOD);
>   	}
> +
> +	igt_describe("Enable VFs and bind/unbind each one to xe-vfio-pci via driver_override.");
> +	igt_subtest_with_dynamic("bind-unbind-vfs") {
> +		igt_skip_on_f(igt_kmod_load(XE_VFIO_PCI_MOD, NULL),
> +			      "Failed to load %s\n", XE_VFIO_PCI_MOD);
> +		restore_xe_vfio_on_exit = true;
> +
> +		open_pf();
> +
> +		for_each_sriov_num_vfs(pf_fd, num_vfs) {
> +			igt_dynamic_f("numvfs-%u", num_vfs) {
> +				bind_unbind_vfs(num_vfs);
> +			}
> +		}
> +	}
> +
> +	igt_fixture() {
> +		cleanup_pf();
> +		restore_xe_vfio_module();
> +	}
>   }
