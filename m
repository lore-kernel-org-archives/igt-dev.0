Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32487FF8873
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 12:54:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9702310E442;
	Thu, 30 Apr 2026 12:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y91P6QKv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0BB010E442
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 12:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777553649; x=1809089649;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uV4GUhcG3DaqdbGgdtfr/mTWmdOyns+Trdj0mLwIJzk=;
 b=Y91P6QKvfsJdbT2kbcIcqX7mK8Ig/bMSNj7WxNGpOWebYMhHRcNSxshx
 bYZQNVrvuPSP+ullA7OLAlnhSlg+Q7YdRTcv5H8DkUdgsc7HJPETGiIRh
 SQwzhlALpZrKLSTGsHvX7waWsdXeAhbW9FU1DdJfpKY6EfqGcWitIUGVD
 OxlPVG75DX6BVQPqMv9Fqol4np7oZPlYeO46801uvPMV9NbUG8Ygt0Qqh
 7lv2qeP+bSz1oKmZXY0BwPMhBtAC2OWrwnizopJqCPlHcDEDV8/J+hIMX
 4cXFFXHE/fCuBUdA80jV525sre/MB6/05eZMIZqSZ4qqeTBBfkZ3U6MHs A==;
X-CSE-ConnectionGUID: zUyIVZMUTiCmHS6PBSkhmQ==
X-CSE-MsgGUID: SA9xl/UZRsawVr1Kq1L99w==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="95921233"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="95921233"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 05:54:09 -0700
X-CSE-ConnectionGUID: 7ZSrHjdVQumDYMoHjBCp0A==
X-CSE-MsgGUID: 2+YBjCITQieQUUQc/bFY9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="230226498"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 05:54:08 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 05:54:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 05:54:07 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 05:54:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6AmTh8Ex2HugTE9Qqv9Y6NnqrTo7G1pboX0t2ri62kj/lZOhUwpMzoNMfCaDOTSNFqSPgI/9txGPsCShGl+GzFw55wKJ6R+VPIpn1sZo0DsYrCgsmYjidz9pOaxOSwpG9pZysAetdpdvJg4nIAjPYYsMcTdLRCZP1xwzQRWJSPuHab+ph+gCPgqzM6Dn3Zb3vhrgbU3ix2JnjqslQmFtIEagy9FH+/634anGoY0ioIBH3CtC/p76523eBjmoC4OJb+1Uc/QsFpdUX2KI40fcvpQtf1epk6i4YYPy6gTxxjw4GlZCSO9fTDu4IMR9x+qIyGXMwZ8kDD7BSyCjr6/MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdK63TJiz8cLpwUOtTnf/Wd4B2L95tivbS5x91ClAwQ=;
 b=WZvm0ZR9CAjWZjESXak116WU8TV/hmcl4/MJ31C1EIJHBgFT3Y6yaIj2hQMeLGX9O292CkadB6My0xUOHWuKZ96XpxJWgrI+sgqNmhRP/zyEKH2gdITMLLOBieTgp++JIoQNrrSkCqo4IBC7vkY7MmIZqvLsdDMpbpDa5O7dAd7suk+v/rDdACQJvChYKAjJ73bd7uBakTnrhMZO9EpJvZHLYOGlHhIA1JUmCO3h8S9aqzG2QSMdly/HTFV94XOycerBQYpY5EcNlHNpicaZGYCU33uBm1va0sK5G6LkLRGCCKjClv7Nie6FqmUY36jU6KaTFaQSbjNDeJwoAlnCiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by SN7PR11MB7665.namprd11.prod.outlook.com (2603:10b6:806:340::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 12:54:04 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 12:54:04 +0000
Message-ID: <1b3a275e-0276-4cd2-9f48-c42b24e3f480@intel.com>
Date: Thu, 30 Apr 2026 18:23:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tests/intel/xe_pmu: Add check for the other drm
 clients using the device
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>,
 <kamil.konieczny@intel.com>, <vinay.belgaumkar@intel.com>
CC: <anshuman.gupta@intel.com>
References: <20260402130026.2687520-1-soham.purkait@intel.com>
 <20260402130026.2687520-3-soham.purkait@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20260402130026.2687520-3-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::16) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|SN7PR11MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: e98bbe18-b9bb-4a35-9d12-08dea6b78ee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: EDFBypbtfRwIuRD+wmXrqVrpuCSY9W9sBAp7LVO9DX+QVuFzHBgWhRSDzowUmi+5SD0x0acSqWD1Ko8XR6Xpq4ElEhrHrkrsWOBNfgAtF6IwmnIjdvBxN84M4KT93vwrrLlla/rxnzGPbdOJpljbGyVzvzj1gxzI/wvQSdx9NzDYhnHxp43cJQJaUCsIjvU1evvWTUIaydUX1j915SXhXPYOpkBuA5F7AGpvaNyWeyiG2e0NiVZGHRJnZ5j0BVqRlCxjM87MM4anliGr9pMwM1UwhNhoFNquFeF/xcftNVTvr8BtBZHZd+48nqzkuK4ATOMzpPhxsXWrc75fjbLGVNTR+yGrNwO2K/Ha3LvYj5T/JwRbE/qf4GjVYH+BcDvVicQHl+NpmQxGudaPcnDhoEefHGxEe9aZ1I0X1SQ5u2XdSDtlWCWBmMMOf8riFO4lY/2aQnk/IinMsxPMJI0DbdGdbxtctALPoiXo/t8/jfIKyQD5QImaE4VKehwOZB+tGsuGGrKgjp0z5aH+xe8YY4N1IPxFTmDycQhn6BWhRYrp4RRFXNgTPlvcKcgDeVyNZ+XqxSH+rxE9er5WQkbW9/RsYgb4z3S83AflRM+M6LEP8k6enm+PKGS2BU86Rk3fr3YRjyYx6zu3MakT3FOObJM3qK1wnWPfl6iRoN2AN/bXSKThGk+fRdo3TfO5McItJscMC3qgJEY9bySt4SWG58j0Ff1wpbegRo2Y3+W+seQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDFPZnhUZnBOLzdNblBjVUFxZW9iM2lrc2VJSkx5UDdrMDF2c2VrWVJDRWVh?=
 =?utf-8?B?U2tmT1NGMThOQ1hTdEg2NXkwS256dnE4TUlMWm55eTkrUWJrY2lwK1dISHo4?=
 =?utf-8?B?RWorblFMZlB2UklqZENEa2hnUkNNWU41OVQ4UUxSM3BKZ0hIWHZiOXFmbi9Y?=
 =?utf-8?B?Vm1vVlJXOTUrbVFDYjYwT3EwMGNXMmhvbXhPQzRyeGl4N2ZueERFczNyYzNz?=
 =?utf-8?B?TmNMcHNYNTY4R1l1QjlwNUV0MTBoU0lROHM5T2lxamlKblpWQWR6QkVjQXJT?=
 =?utf-8?B?MDRWZ0tpdzNNZHExUVE0OXlyYjAvK3lsVFFsOS83aWhkTklCcjhyeWFYeEUv?=
 =?utf-8?B?VWVObU1lNkNKVHNqVHFUTXE3d1ZBRDcxcnRNdTU2U1V6L3VqZUcweXFYYlEr?=
 =?utf-8?B?L0FHbWt2TkJuK2l4UHZEY0lUcUkxZDlsZ2pFY2djd3ZZVlVFRVI1bE02Ry9Q?=
 =?utf-8?B?ZElzWWpiSzFDc1BZeEJtN3JSQjBaQThLZjZNamhudEs3ZnZncWwrUmNrTmkv?=
 =?utf-8?B?SmVHMnVyVGo3WjNnLzFGbU5VdDhxQi9FMmtCU1laM21WRkp4MEVOMXoxalFw?=
 =?utf-8?B?ODdJaWdVS3lPKzNsMnlkTTJGNnJ0RWhXZUMxaFk5MWVoOGxkcThNeWNTem9H?=
 =?utf-8?B?bnFubUN6Z0RUSC93SUNOVURHdy8zalZXNUMxYUQ3SlNrUUhLQWkzV3Q2b1dU?=
 =?utf-8?B?Y0syTWc0RWdFaXZOSU9OTFpRbXVCdXBLTjRwVjFUSmtXTlNoNnpQWHhMT1hy?=
 =?utf-8?B?N2N1NUdsQlk1T2xRRUVaQ25xTjg3WHN0SFdYbHZNK0JOUTFsTkE1ZVZZa0t1?=
 =?utf-8?B?ck4vaHNIbi9Ca3g3ZEJGTWdlV21QNVVNTlVTTmRrb3BNL2ZwSFR3YzQ2U1c0?=
 =?utf-8?B?MmxDUzcraVUzMVFFSkM3QlBrc1dnU3JId0xNSkltL3FSdUMrZWIyRE9QZk9o?=
 =?utf-8?B?NThKaHBLRHd2M2p2N1ZSM3NVVzZrU0M1cnUvSiswZE9zQXVybmY4N1dYYU85?=
 =?utf-8?B?RFlvS3lyNU5MTDJQYzBtQWN4eURoOXo2RVF3QXduTDA5aHpsT0M2clNUVVhy?=
 =?utf-8?B?YkNWWkRDU0VXT1R3V3llMk1sZ1VIalVxekV0VS9YczNYU1E1UVhGdWVjTC9m?=
 =?utf-8?B?eVdDSVRJaHhFNnpnSzBuZDdQZVExc0lSNHJDQlhsV3JMNnRrQ2FkTGlwdzY1?=
 =?utf-8?B?RVg1cUhXSmVhdm1KQk8wcVFkbkUrZzVvNk5JKzhneTRybHd4cHdPeUFtS2dL?=
 =?utf-8?B?T3RTYXNOT0ZtRjUyRW5wOHcyQmJEalpGQVdrSFp6eHArQVBxNHlEOGl0Y2Vp?=
 =?utf-8?B?bUJlYVBPVFhrOGxkSm9FUmF1MTNUelNGUmhwOENrZ2Qxd1ltZGJqZWRBRWNr?=
 =?utf-8?B?bElIMHlJdXFscGl2bGFDeFdqaTVpN20vQmY5RDRMN2F1ZGt5OHA1LzMrSnZ1?=
 =?utf-8?B?Si82VmVBOWJQdEVOeVBDc2pIQkhMWFp2SGpQR1M3YXhWaVZUZVQ2N1V3ZlE3?=
 =?utf-8?B?c2NwUW9PVC9ycUtNQkovSmZQYmlyc3R1MzRrS1ZISHMyc05GdGhWSFJoSEpZ?=
 =?utf-8?B?bWJEeUVsR3BUN1BMUzB4d3FRQzRYMW9ZbHhQSXpzMzJvdjF3UmIxeW5YT2tp?=
 =?utf-8?B?d2NKSkZ4SUJXV3JJTWtVMUZPTmlZd2YyWEcwQ2xBdngvaWE0YzJjS2JQVmFH?=
 =?utf-8?B?S0tWMnNxMUZOeGRBU3NoM3dXRTJuNWowSC9VN0lnL0RsWDdFeTUzZk9HSG5C?=
 =?utf-8?B?TXhyWS9HVTE3M3lNTXVucmFOeklEdFREZDNDQ01hVGV3LzlrUG4vcVBzd1JQ?=
 =?utf-8?B?Q0VMM3pUanZWSWVkR1dLRFNjQlJjVTh4SkJrRGRqSVBPbDI5UDZmbkhLTyty?=
 =?utf-8?B?TG5xeWdmL2Rxb0tRa3c0c0g0UW5nWmhHWnlSOUVBK3M5eitRUjloVVNFNVd5?=
 =?utf-8?B?TExKZ3BvRFVUb1lpT3JYdHhUU21JSTJXb21zenBnNXdzdHA4QkREOTBmYUUy?=
 =?utf-8?B?VndHMkNUTXVNM3pUNzlTTnhCN2t2VlNOWVRVbjNJZTdWRkNjUEppRnI1alJj?=
 =?utf-8?B?OXA0cWdUZGdUNHVJcEFGK0RPQW9IZGFpNTRKZXR2WitBQ0FHWldJRnh5Vzdr?=
 =?utf-8?B?WE91bUdVcWJoaHo3NkJiaVJ0dS9HRTZ4djZZenN6QU1vSFlIV2p5VjVtQWk1?=
 =?utf-8?B?d0hJMG1ldEY1NzJ1Ny9ySTNMR2lIeVkweERZZm9FbW9oNFF6cXdwMmFzcFdH?=
 =?utf-8?B?ZGhhMnVPczAvV05qUnNpdUpnTXNsRnM2TWtYa0JOVFVKSnhHVFpVQ3lheEM5?=
 =?utf-8?B?aFNaVUpaVHlQc05YUGNPZ29UZ3YweDZ6Y2lRNThTaE9iNkMyOWxEQT09?=
X-Exchange-RoutingPolicyChecked: Ec66YVxgz4dBs6v3zVc8xsXiuPAVWRSso16WomOy6T247szR/kLqGFqPC1xGpMJs65r9adlcT/34yR/I9e5BPEYx9MNIBEiq5+RyU/CcIQ3uUQtmAzM/uGU1qkhj7y8q6wKdhjNN7mTzzkmjqSuijSuUMZMlOsbb2C2DSq8YRYGk+UHZAIl7hun397MS/AoinFKTX08yVehFuhdb2ZJ8SZq/20gV6U1d2lP+5GGzPj1DGzEplE9Hi6eBaQaScZCeo7EQgq8Cqgu2gjD2UZ3qrRSar7dt1AwV05hGT3abJbn0jQavLfKQzDnn7+IGP7x+wJfcaa3xvS6F1gI1QgR/UA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e98bbe18-b9bb-4a35-9d12-08dea6b78ee4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 12:54:04.4585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3xBvdXN2K6E1sipt6IYYFNKoKqpnNGtcSQzmMo0H4XMFt5Js1SZCcBPZfPI/TxEOLnnuAQnlmZQR/RGopgQWtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7665
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

Hi Soham,

On 02-04-2026 06:30 pm, Soham Purkait wrote:
> If other processes are using the DRM device while idle residency test
> is running, GPU engines may be in use, and idle residency might be lower
> than expected leading to false positives.
> To help identify this issue, a check for the DRM clients, except the very
> test, is used and a warning message is printed if any such processes
> are found and the test is skipped.
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   tests/intel/xe_pmu.c | 27 +++++++++++++++++++++++++--
>   tests/meson.build    |  1 +
>   2 files changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index fb4b871e7..c907b6207 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -100,6 +100,7 @@
>   #include "igt_sysfs.h"
>   
>   #include "xe/xe_gt.h"
> +#include "igt_drm_clients.h"
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_spin.h"
>   #include "xe/xe_sriov_admin.h"
> @@ -865,17 +866,39 @@ static void engine_activity_multi_client(int fd, struct drm_xe_engine_class_inst
>   
>   static void test_gt_c6_idle(int xe, unsigned int gt)
>   {
> -	int pmu_fd;
> +	int pmu_fd, num_clients = 0;
>   	uint64_t pmu_config;
>   	uint64_t ts[2];
> -	unsigned long slept, start, end;
> +	unsigned long slept, start, end, wait = 100000;
>   	uint64_t val;
> +	struct igt_drm_client_proc *procs = NULL;
>   
>   	/* Get the PMU config for the gt-c6 event */
>   	pmu_config = get_event_config(gt, NULL, "gt-c6-residency");
>   
>   	pmu_fd = open_pmu(xe, pmu_config);
>   
> +	/* Wait for other processes using the DRM device ends */
> +	for (int pass = 0; pass < 50; pass++) {
> +		if (!igt_drm_get_client_procs(xe, getpid(), NULL))
> +			break;
> +		usleep(wait);
> +	}
IMO there is no need of waiting here again as we will be checking the C6 
state multiple times later on.
> +
> +	num_clients = igt_drm_get_client_procs(xe, getpid(), &procs);
> +
> +	/* Check if any process is still using the DRM device */
> +	if (num_clients) {
> +		for (unsigned int i = 0; i < num_clients; i++) {
> +			igt_warn("%s (pid=%u client=%lu) is using DRM device.\n",
> +				 procs[i].print_name, procs[i].pid, procs[i].id);
> +		}
> +		free(procs);
> +		procs = NULL;
> +		igt_skip("As other processes are using the DRM device, "
> +			 "measured idle_residency may be lower than expected.\n");
> +	}
It will better if you accommodate the functionality in a single 
function, so that we can simply call it whenever

the below line of code fails for all the C6 related tests.


Thanks,

Anirban

> +
>   	igt_require_f(igt_wait(xe_gt_is_in_c6(xe, gt), 1000, 10), "GT %d should be in C6\n", gt);
>   
>   	/* While idle check full RC6. */
> diff --git a/tests/meson.build b/tests/meson.build
> index 26d9345ec..e682ed9dd 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -425,6 +425,7 @@ extra_dependencies = {
>   	'sw_sync': [ libatomic ],
>   	'xe_fault_injection': [ lib_igt_xe_oa ],
>   	'xe_oa': [ lib_igt_xe_oa ],
> +	'xe_pmu': [ lib_igt_drm_clients ],
>           'xe_compute': [ igt_deps,lib_igt_perf,lib_igt_profiling,math ],
>   }
>   
