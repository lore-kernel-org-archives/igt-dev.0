Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049D8CD13DA
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 07:03:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FEA10E034;
	Tue,  5 May 2026 07:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wo3BTCUQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8462710E94B
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 07:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777964589; x=1809500589;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8u5dgLwlBzFEhtHph4Sunj/42t6aWAYa12263F5P1fs=;
 b=Wo3BTCUQ2SqWJL2DGsPQJCSd9GWlmJQRdbIKiAqtML26f2iOMTxwD0+h
 M2JI8dNm4PfEXb6a5ob1qI4DFTgeOvRfwaa6lkNpDXA/rF0DEWTW5X624
 gyBZkE36CY64Jhsnu5m1dg7R4YbFBnJcYPSC7HGHj5aFpgJM2BhSaCZAm
 hC72RzM0PtQBv+YVnZVRewYjcQfS8kpdzeam32r6g6KZfFmUDFUpUNmZ9
 vUy+d/kAi6ata1lyiN9ap0VYybTdre44IIpSelSDgIIFx9v+S+p5Ef0A3
 HILOPzgzAa8KD7IyjQDKVEeLOh4MoD4v5Bjuqf3l1yTtTyxXHtLRYH77w A==;
X-CSE-ConnectionGUID: uBcjSc5FQh6oxSi4nzy2Rg==
X-CSE-MsgGUID: ajZvtVNBTUm7BBmI8yynAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="82440906"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="82440906"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 00:03:09 -0700
X-CSE-ConnectionGUID: 0GG45QMnRzmNUv8TE1dSig==
X-CSE-MsgGUID: xvJHybj1Q12B9sRPYQMZrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="237509870"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 00:03:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 00:03:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 00:03:07 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.40)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 00:03:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXAIjOmoQei3fomF/vG1imTclOtufm3IsJ4LQV8SkL4xOTCITbBGZMm0d43qv+5+pEFN4Kb43bG1RsauaW0ayVely5UgjbwHu3aW6fv7yizGdVS+onEP4Ft1zoRx7IPunkU+eWB4pS7nkw7HMGLsamOl84gUSOQ8xmGnjswL0hD2NXESeSjXeRzo0y5058ycGL6tTqRJ7Lwz8sgrN+C2D+rCYTRME+xi/RgB591sSurRUgMync2qTfQRinbSR1t0qOE3aEwW4ewiWA70/Kr0UKd/lPGp5/lblp5i/m0w2swzjJG/lS23N5HC5q2QhHLfL0uwejkORK7vpc5ElD1U4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ihuhJNLTY5BNah7NdEHJB5Fx7wYJ+/j76sg8dGo+UI=;
 b=Oex7bCXckoID2b8Bn7zK2R3VP//1N3i7YBfKQ7cHHuu5NXoUJ/MP2wjc+rSfbKm/q8Pek9/YdtMa6e60/Hn1b3k/xwkBYN4/X9c5fSVWTvgVgJEAWIyxELSPdfiZ6byBLE/3V7733/34Y8DDnhNQRb/jTcrSlTqCZONjMc01QExOnijZOUPoTKY20pieF8N3P7NOXzHDfDgs2bkmjA+zhc5aMjVU9BTvLPceHOenVuH6Q+QHgzwh3ER0DYeu+l3Xlc1Bht5xokQCIHCzVj0GwyG9FquQ+fA/K20EuhukSxVnrdnCIOJw19BA7TbpY9M5Sb2tOp/ZHcODHAHNFcGU0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by MW4PR11MB6811.namprd11.prod.outlook.com (2603:10b6:303:208::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 07:03:02 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 07:03:02 +0000
Date: Tue, 5 May 2026 07:02:52 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Karthik B S <karthik.b.s@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <pranay.samala@intel.com>, S Sebinraj
 <s.sebinraj@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_explicit_fence: Rescue pending IN_FENCE
 waits on test failures
Message-ID: <mr7gkggcgzc4h2ibqknle5btem46ijh2ioimc7zzm633k3qlkk@coy43ue5xnxb>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260504054512.2192437-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260504054512.2192437-1-karthik.b.s@intel.com>
X-ClientProxiedBy: DUZPR01CA0112.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::11) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|MW4PR11MB6811:EE_
X-MS-Office365-Filtering-Correlation-Id: c2849293-cf93-4184-fc0b-08deaa7458e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: LXuAwyiAhqskIgTP0vdFruej5qi4ZFBNrMcpAIiTle7v3FyQqk1knHRyB7Fvv9rnGoG8Nxtyw5bIRwN7D9anja8Z1C7cOHCAoibaz2F0D5WU/v88WyGwwpigjSKrVqIQ0n3GyHd5vEPiQ7842H2v0l9GUFSsY0+/WqfSZTnsxq4k+KE2SOHmzl5kLH5EGhEs/XK8Gs0FcAQXiOpLwsTXS+PVTmwzVMJOqOMVi9IJ9bOxqvgkS5XQUGMvumjSYXTp+Qifw7xdUD1OLDShrjeTMkLw6JNLu284tSCh/conV//J1dxguGNet7TnzfBDzGLeMSjb6v7KUEncuxy4JMmdK3rBPkkVfDeOr88951SZPue19UmVmGR5S+ZXBWVbQD1RkK6V6ZlR+HWVBDuZKTyCAWXO/8bL6nW2xnrE0JfT8aj/wClXtjvDYTvlPJm1vEOWE8OrPDktr5RdqW5WPXKTKOEWGapPVWJDDXiQ6DFL+gEtpYIoXRN3NooFCd06G2aTl12ypghUyiLMnRcQ1za7MZdOh5Bsm94MGx1nqZ66bI8rZd06IvG0CGNzmaw98cRlvHjluzWVIrX4GnTBBG9HGwGZGjqdFfIJ0pZuA6Qlm2An6Z5pBtwcv+Lt/VM3DxJWzLv/MdhyHmsjtOOl5hmnDh1HCnSCqfNUDUScZdI6S63r06Aehyi7SZ320996BX1A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2tPSEd6Z0ppT1Bva1N0RzhDUTZXWTNGM1Z3UFRkUThrZnlraitQd0FxbEw1?=
 =?utf-8?B?K2JoMzBMTS9zWmdSbTAyK2tCRWE1ZmZYaVlOOWFWbzF5UWRnQ1RUazRrYXc4?=
 =?utf-8?B?bFp3c2ROUjlzWXUxQWpBbER4c2xRelBkNUJpY2U3c0tQcnZDOTZ2WkNCME8w?=
 =?utf-8?B?YzZFNTVBNU1sRUlPOXJSNVBkVEs4MFpQdVgxMTV1aFErdGd5T3l3cU5PVTBj?=
 =?utf-8?B?SWh3RVpLRjZIeXJ1L3RHT0tNeVlhTVNmd2tCN2x0RHR2VFRSVnFiSWxBVkty?=
 =?utf-8?B?MXhCeGRwZUdoM0lVRDdyWERuTHlHZEQxVTFqbGhHQVhOQmZ0TTU2N3RMTE82?=
 =?utf-8?B?OHBuMld3WTdlNE5xdVNESjJoVXJxWFdLVGFaSThHRERDUzU5Zm1EWWh6cUQ3?=
 =?utf-8?B?UjJTbmxZMXFWblpyUEZXaGRuTlJyampkbDdoOGdZd3dOeGhyOTZwcWlxb2pM?=
 =?utf-8?B?N0ZCdHhSdGlxalBlQmwzcmJ1enUyVVR4WGhWd3p2OTYzYXZmMnZGZndTVy9B?=
 =?utf-8?B?eTliRmZsK0UybmtsR21lM3FUZURaM3liMHAzcllOSjZqTmxJY2pydnRINXQ1?=
 =?utf-8?B?aW5tYkdDb1NJbkJBUWgwTnVBTU1YSVJZQU93a1VtQ1d2WFNhUVF1UHVlZTF6?=
 =?utf-8?B?V3hYTE1OODlJZURTL0VBTmU2bzRMRjB5UExvbWl3YkxkL1RGeWJCMWw5VTBS?=
 =?utf-8?B?bUw5SnRKTk5zUFo1c1FCQWducXpFM1NsUGl4SHBoMko1VG9sWXFIVkZ4NFNQ?=
 =?utf-8?B?THoyNmh4YlAwdFBLeS9sU3grQXZZQmtkaFZobStmTmlxR3VFVFNpMFY2OEVi?=
 =?utf-8?B?M004TndEekxyMjFTZHVzNEhia2hwVTVKVG91bW1rYlpDeUczNjdlRzg1aE8y?=
 =?utf-8?B?RlFvbXk4ZTFSY2Y4TFp2eSs1cUVZTE8zZmdjMGNObVR1YmVRNmRuRUg0YzFl?=
 =?utf-8?B?ZkhYYURuZGp3Y3dWRWlDaDErUnpiR045V0Q0NXd4M0pmQUh1Y1doMVpKTTFB?=
 =?utf-8?B?SWFYN2c0UGd2dmdPeHFvOGI3ci9oZzVrTHRNUEkrT0VHNjI1TzZGalZQa0Mx?=
 =?utf-8?B?NFoyS2M3YmVTcXk3QWpRVkhMT0d3ditHRWl1VjJIMlpUSG9kOU94NUVDc1hN?=
 =?utf-8?B?em1ONUJZeWlXN2pSZndpL1JidG1qRXNRSC91RnUvbUJBeVE3VmlxN2F1YnZB?=
 =?utf-8?B?cFkvQ1BWZnBtRG5oMzZWZWlyUkZaNjVjNFo1MGh5Q013SXpZbk9GMDFiRExJ?=
 =?utf-8?B?SHUydjY4MmFTaUJrSFpHa2tyN1JoMEJwZDI3WEZsVUlpWjcwVGtzN1dmYnlu?=
 =?utf-8?B?VnBpSUdSS0V2K3lMQ3NaZGsxdkNFOWw4b0JZZzZTcmZtd3p1VjNQLzhtK0Fv?=
 =?utf-8?B?TVcvam1WM0NzeVZJRktTV080aVpmcU1yMmIza2lYMWJhcGI0bE1veDFmbnZL?=
 =?utf-8?B?bWRJWThnWW40SWlVUVV3SjV1MVFKZk1CNkIvdEpGNEZRZmVRTUdyaDIzY2ZE?=
 =?utf-8?B?Z095NW9sZ0luR1hVLzlPeFJJWk9Uc0ZKM1U4cVFXRmRSVXU3K1hOZVpGeDZq?=
 =?utf-8?B?aGdnOGl5UVYwYUxaNlJpZzVGUnNzMURCK2dnb2FmVUoweDJqcDFYOEpyTkNT?=
 =?utf-8?B?dGgzY3pIZjdMWWNNbE1oVzQwck1YK29rd0U0emtRWWVyeVZPQjBMVndNRFND?=
 =?utf-8?B?RC90VDhydXV4SjM2MHNPQUVNMDNjVFA2ZVRzdnduZ1k4MzZGVms4RStZWnpC?=
 =?utf-8?B?TExqMnFYUGFuVzlWejNEWHlHVjlKUmY1Q2NWSFYyV3NWUEZ6ZXZYaWlCaDFC?=
 =?utf-8?B?Sk5SM1pReGQ2NkNIemtERE1DamJ2L2ptT05nQ3JPUk9ZUUswdkVaZzZRMDNs?=
 =?utf-8?B?UExJanIvekRrbmFJNFNwN2Z4MGM2S1E0eTAvbXdnTi9PVGQ0Yk1NWk9MK2F0?=
 =?utf-8?B?K282YXR4MzdUeXQyRTRlajRCT0dzYlN6YkVoNmFGeERZOUxjM0NBakJ6dXZr?=
 =?utf-8?B?SzlubHBlS0FPcXhrUTdKeXJGSSsrNVNsb1U2TUtxMnBMOENwK0FUaHQyWHBM?=
 =?utf-8?B?K0MzL0l3NVl3SEpPQmJyT3JKOVM1L0ZxUXI1WUY1NWhGL3dndXpKT1pMTkda?=
 =?utf-8?B?d09kR2IzZm5CY1VIc3BhL0Q4dkJLRmhUb1RzbXdKb3FGRnZaSnk5aHJ3NU5y?=
 =?utf-8?B?MDBNRUFXajJSdHB4VkZWMjhyeDZUTU5TMythS29jTGZwSEZLbDNzNE1wTVZu?=
 =?utf-8?B?c1UxVVZZcGtNM2c2NFcyWlFKVmR1ZXpsRVhrdjJqbytVU0VaczRsejRtTnNG?=
 =?utf-8?B?U1dDZHBETnNLOWU4M0daRHpZYnV0U1UwRzZCcjgwK3NsKzBqWHp3OGR3V0xD?=
 =?utf-8?Q?thIEy+mRqEhXdF40=3D?=
X-Exchange-RoutingPolicyChecked: Mw9kUmNDziU6WJDFGFeI4IIq5FsmWiy26dCxMn0BRF7gthRwvtPl50w/5W7Jfp3YGAA5EgqDJtZ0NYOa0n7E45Kv1TdN80QbdGjV3Z64+z5uSDYVVbWCpw0zcLkenGUP0Rum3t3Xuf0oZUQ4TcgtIvDGUkpsi4g9LteSzuyl+SN6IPi2joIUTEEQBQPzadJCGs8K8Gpm9b8l94axQap6TpauNtG0PasWW+HinNFDZKRx9acj30udKSIQmHOY9gVls9dPkHuF5aYtiXc/2RLyZAVRTaRjaoVV9Ahe/E2SVXW9u3+XQwd4fVDJM/ej93LkPBsTSgLdewDko0YVk0lz2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: c2849293-cf93-4184-fc0b-08deaa7458e7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 07:03:02.4206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6jatXStgQff7elOXMy08tfzKK32le/B19HuxsNQYYeH4uonFLjgD0xhD9YdL4Rk9ZZasynH6LTxFQZMSg+xhhp9AeRN27nijFNdVE1Maa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6811
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

Hi Karthik,

[...]

> +static struct {
> +	int timelines[NUM_PLANES];
> +	bool needs_signal[NUM_PLANES];
> +	bool active;
I wonder if this flag is needed. See below.

> +} pending_fence_state = {
> +	.timelines = { -1, -1, -1 },
> +};
> +
> +static void signal_pending_fences(int sig)
> +{
> +	if (!pending_fence_state.active)
> +		return;
The information about not needing to signal could be derived
from the fact that no timeline has been assigned.

> +
> +	for (int i = 0; i < NUM_PLANES; i++) {
> +		if (pending_fence_state.timelines[i] < 0)
> +			continue;
> +
> +		if (pending_fence_state.needs_signal[i]) {
> +			/*
> +			 * Best-effort: advance the timeline so the kernel
> +			 * stops waiting on this IN_FENCE.
> +			 */
> +			sw_sync_timeline_inc(pending_fence_state.timelines[i], 1);
> +			pending_fence_state.needs_signal[i] = false;
> +		}
> +	}
> +
> +	pending_fence_state.active = false;
> +}
> +
>  static void setup_output(data_t *data)
>  {
>  	igt_display_t *display = &data->display;
> @@ -242,8 +278,14 @@ static void multiplane_atomic_fence_wait(data_t *data)
>  
>  		/* Attach IN_FENCE_FD to plane */
>  		igt_plane_set_fence_fd(planes[i], fences[i]);
> +
> +		pending_fence_state.timelines[i] = timelines[i];
> +		pending_fence_state.needs_signal[i] = !should_signal[i];
>  	}
>  
> +	/* Arm the exit handler before the NONBLOCK commit goes out. */
> +	pending_fence_state.active = true;
Can "signal_pending_fences()" be called mid initialization of
"struct pending_fence_state"? If not, then this is truly
redundant.

> +
>  	/* Swap overlay colors to detect scanout changes via CRC */
>  	igt_plane_set_fb(data->overlay1, &data->overlay2_fb);
>  	igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_POS_Y);
> @@ -299,6 +341,7 @@ static void multiplane_atomic_fence_wait(data_t *data)
>  	igt_assert_crc_equal(&crc_before, &crc_after);
>  
>  	/* Now signal the blocking fence (overlay2) */
> +	pending_fence_state.needs_signal[PLANE_OVERLAY2_IDX] = false;
>  	sw_sync_timeline_inc(timelines[PLANE_OVERLAY2_IDX], 1);
>  
>  	/* Wait for overlay2 fence to be signaled */
> @@ -311,6 +354,12 @@ static void multiplane_atomic_fence_wait(data_t *data)
>  	igt_assert_eq(ret, 0);
>  	igt_assert_eq(sync_fence_status(out_fence), 1);
>  
> +	/*
> +	 * The pending atomic commit has now completed, so the exit handler
> +	 * no longer needs to rescue it.
> +	 */
> +	pending_fence_state.active = false;
> +
>  	/* Verify display has now updated (CRC should differ from baseline) */
>  	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc_final);
>  
> @@ -353,6 +402,13 @@ int igt_main()
>  
>  		data.pipe_crc = igt_pipe_crc_new(data.drm_fd, data.crtc->crtc_index,
>  						 IGT_PIPE_CRC_SOURCE_AUTO);
> +
> +		/*
> +		 * Make sure that on any failure mid-test, any unsignaled
> +		 * IN_FENCE that the kernel is still waiting on gets
> +		 * signaled so cleanup can complete instead of hanging.
> +		 */
> +		igt_install_exit_handler(signal_pending_fences);
>  	}
>  
>  	igt_describe("Test atomic commit with 3 planes (1 primary, 2 overlay) "
> @@ -363,6 +419,8 @@ int igt_main()
>  		multiplane_atomic_fence_wait(&data);
>  
>  	igt_fixture() {
> +		signal_pending_fences(0);
> +
You could skip this extra line.

>  		reset_display_state(&data);
>  		igt_pipe_crc_free(data.pipe_crc);
>  		cleanup_crtc(&data);
> -- 
> 2.43.0
> 

-- 
Best Regards,
Krzysztof
