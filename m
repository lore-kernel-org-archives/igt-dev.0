Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006ABCA5FED
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 06:13:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBD110E312;
	Tue,  6 Oct 2026 06:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O/IzZMFP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D38810E312
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2026 06:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791267147; x=1822803147;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HKF+LRvPX4mt6EiCukRWZATb25sVn3EPQ/WIRbp8Xuc=;
 b=O/IzZMFP0yaSTRD1DfUjlOCx7JQzBlgXLcN4A4ZVZtmiI0CkLgkyyeIz
 fwalyclQSjEAFBzFJ3RoTp5haBvW2ClrKbyDJIG/unvVRtqp3kZC16wBt
 /r+xi8CtPcQu8U3+/4aqlzZiu+5zx8yBinJFPl3XYF+DN/sFmoiPzNLC2
 gUPIkd77YzJdKsABn2IN1nM/CUKBJRq5tFgN0tytLgdeUeUwRdh4QQnV3
 +DVkAG9XNwPJa9Q2HR8o9qtsu9keOtwyyWwvhkCVaaULMk9LN1m8Lt8JH
 Up6oW4lr8HmW8a6rCkskTb9xeQIdObjhXZ5XgMcMpIibEKlClYRVSFdjh Q==;
X-CSE-ConnectionGUID: GuHKHdbIRwGfB4+GIAsrsg==
X-CSE-MsgGUID: JFToKUyIQ6S/6YnXdtUHfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="101267639"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="101267639"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 23:12:27 -0700
X-CSE-ConnectionGUID: +nCDgPCSSg2So2T0bGNSYg==
X-CSE-MsgGUID: ecejDBCTSGC/Pr7FTR7wkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="303328319"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 23:12:26 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 23:12:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 23:12:25 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.30) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 23:12:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ml7BFM6PpJelRA+Zjp5zjFnISST04RMfAggQ8qunRGWHLzGvsRRaqQoO15XArXBTQRypXUFMw7Rkxlh3OkzrswTKSJKAFVxqvx/6yY+BPZtr3Wv59H6rfS54QqTP9oOovB/d6PyPQgRqSFE4v7jog4h9GUvFWmpsOANdReU52nYUzfsLVBaw4LIWRMnx5bpX3E8fHaJu7cOUm2fU4/VUIzqsc0NZhet7IxgkZaiIV0UZt/LKzt74boNH2xyfSMihJOrTz5y06tcxznc0BkhK2PGp1oKQqEo+LYzeaGd4GXeq6GFDOA7UEOLLLJ4EuODs9RJzrO84/r7oDY6mYuslJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wk2lDhBEgcShE8qBpaNGxHbQQAJPFPPdsmODlQ3IN+U=;
 b=fSu7K9tycLJsjr2AIiwITcEO+ECWN8MYJgi014SaZllQO5SIbxgLGQAaAZVcw9D2XLDsC+JCe8sMjmdPL9BBsDaYr2ffOMWodxcFIT4Jhh0pzAem5ybQTjRQI5sV6g2YvaOVYzdVBMtqzR3BawdATdYWX7KuQH2uL+6opsld6M3ERkYzsiFV4Wt5nG/js/PDx39bTLwlfIn4UlLfDqyud2Z3qc2q+tmLA+deDmJDBTAAk8EWMHu2LhmFlCqC1b4irO1hZZZstGy5RArg9PRdTOeSPoVtKLallnJyA5X5lrYBR+U4ufOHDcTHlZAe5MQZtZo3hN/47AYanM50hjSM4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by PH9PR11MB937099.namprd11.prod.outlook.com (2603:10b6:510:419::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 06:11:52 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0472.015; Tue, 6 Oct 2026
 06:11:52 +0000
Date: Tue, 6 Oct 2026 06:11:41 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t v2 1/8] tools/gputop/xe_gputop: fix struct layout
 and PMU read
Message-ID: <sid4eksljbyh45zdsbx7nyplcmarpr7ax3jqqc2a5tfqzbnhgf@74ynvpb4m537>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1790853076.git.sebastian.brzezinka@intel.com>
 <8abb54c9df9b7c9087da25fdb8e1b996af76d38b.1790853076.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <8abb54c9df9b7c9087da25fdb8e1b996af76d38b.1790853076.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DB9PR02CA0029.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::34) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|PH9PR11MB937099:EE_
X-MS-Office365-Filtering-Correlation-Id: 18bcf612-1547-4a21-abdf-08df2370b6e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|22082099003|18002099003|10067099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: RvOXmL8jijpFAnhkazeOWkyhrSDOHC8blVgPBbmI3md+WvqO6H5trClJH+E9Ko1eiF/GY9jFzaNYGEyfaRLDnn4oXAULGTCOCc606ykrvbTHFNQXBRuUppGHN+tP5l6Kz37ihMm1p+IHwy14RvZxS+csTW1gFqATQ7s80i0lVjYko0PpHQ9d7WNV1fPgbNc2Qcgiz/QkDfLyRHwkvZYwl81vivpEKe6DvhYMbCd6RxnwRqYFsXSCWde8P4fiBUyH5dHihj+sfulD2N2kuGsq8Un7GfpqnihiVwekOQVeFMN5RWWIM4+N9a2o59DARQj8qSG/Lbm40yRuq9lA7FslrwInNPdNJjkybAfXuqkKpfLDve3NEToYkjZMxYrP0q5tH4ZJqCV3Uw98MjdfQPj7ywLnZaCO6TJ3hnhgzms0wza04ARJnZ+kKywEkmQzfNfyLuFG2Uvq8R+Z9MMGF7EbpDP7DibEmKzmocGc87pI56f4tAjuBdQko9i0ikap6I+PSPu1g6CWEUFQvP4CRzszG4UtWJTRPnqqfpHMiSbEFyy/eaGRxNMkZ+RN6r9y8eDnwsCHgy0YnNjsvAOKKmQG32LJiU5nWcoXrGxTUU2r2Dn+btpox5YCChwdfRMfcR4cqcV4gmJNWKOZUtLMOvRmRNIZFrQgy2Qq6jzgzH+Oln8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(10067099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDFGbWYxeWtidk5EQ3ZkZDRlWElsaTBwWlZraUNBbGJOQ0R3aEVWMlNjKzJ6?=
 =?utf-8?B?ckkvK3B2VHVMaG1jdlN4WVU1WG9aZElTTzIwUFB0bWJ5T0J6a3hBNGkvSml3?=
 =?utf-8?B?N3VuOFZXVnJjZ1E4SHRFTFV1RHdVMEp6dmF4MEdrZFpFdWdMaGtFaXp3dFE5?=
 =?utf-8?B?WXNwZGQvR3cvYXFWdlZMWjdJc2hyb0pQZGpYRUNvOFd2YUhadllodkVlZ2o1?=
 =?utf-8?B?ODhEYnd1YTAxaTF1NFlUMjhmc0w1aTRTb3BCQnhzSTU2T0NxTWdGeXZEaE9E?=
 =?utf-8?B?VW9NeDRrRmRXbG1iT2g0VU95V1RWZnh2aVhubGI1Q0JINW9Hb2dNeTVLR1JH?=
 =?utf-8?B?ZXFsZTFVQmtwdkNCdlowNHlLTVI0RzlNUllCbEgvUGQrRG92bGwyWnJmaHBM?=
 =?utf-8?B?am5xc0xiUkk4M2hTZjdyZmhrY3dIenJnc0JrSkxMSGphQ01GNzJ2ZEhMc2Mv?=
 =?utf-8?B?d0ZBQ3B1SUFiWFBIWXg0OHJ4eDI5dzhnMkVuV1Bxd1NhNVhjd3BlVEVseFow?=
 =?utf-8?B?NGkxV0ZjN3Z2bTlPTVBLN0ZXYXN5SEtQc0ZhVXNFWGVTMk1VRDZYa3dYWHAv?=
 =?utf-8?B?c1V3cU05L29qb0lteFdMSXFWWVUvMDdJdVorUk9mNldHcnhhR0hPc2o0YUg5?=
 =?utf-8?B?SDJYMWVSMnRnTC9RVnBQT1NNeVpta3UzM2VQQW93WEdEd0FRdEVjbVR4eXVM?=
 =?utf-8?B?ZlJPRG40Rzh5OGZVRHh4Nlh6VEtYYzVQV0p5Mmt3Rmh4Y3YxWEthR0gyRGt4?=
 =?utf-8?B?QXMvOW9BVUNvYTZEcHlOenJTMjBmaWlVTkdRdk11OURzM3Q2amYxU3l2L05p?=
 =?utf-8?B?YS83SWN5UE1mZ1o5d2E0U1dpSlV5elNsL01LcU91NFF0NWhRMk5JREdXUHMr?=
 =?utf-8?B?VFFNY0hjMCtVUjNMTHNQZWt1YThUSGVuRUlJbHNNNjI5a2c2R0trdEdnaW9P?=
 =?utf-8?B?OWZtOStSamhUSHUxaHBFVVZNdW8xUkw0VnZuYTN6NENsNVA0SHd6dFBsS1Rv?=
 =?utf-8?B?ZVRuR2d4cDQ2djN2Y3p5b1c1TVM4YXo3OFhEMGRUMUF2elp0YzhBMmhYTEl1?=
 =?utf-8?B?c3V6dFBOSVVacVU5MnpwWm1IQ0s0a3VSVVBycVJHei81ZXJWTUVmMnc1TWlP?=
 =?utf-8?B?VmhlblBkRWFPUEZqWUpTdHA3RFNmb01nRHBPQ0krOEJBZmwxd25XdFFMTm5J?=
 =?utf-8?B?YkJrdVZpSVdPaXZLMmdoZUo5MlBvdENYUUN1ampZZWNmQWNjY0FEdnZWYkFS?=
 =?utf-8?B?TUpUZmxiMmpJd1VlbHA2Lys1QVNxUW90czdSNllaYmgyaUh3cGhDVGhaL09j?=
 =?utf-8?B?V3pRTGdFYXROVGhlVDA2VUtQTEs3N2FxVlNORkhpYjRlRW9oN2IydXd2M09U?=
 =?utf-8?B?SHpLaE1FVi9qcTZVWWNEQUV4MnVONG9lUUdBbkE3MHpGZHRGcU0vYWVXUzJu?=
 =?utf-8?B?alJLYzQrNGV6WmJhVGNkTGt4NTR2aUhTa3NLbFQ3dnZsRnNoK3p5Qk5TZU5i?=
 =?utf-8?B?TXJjekQrY29aSjdpWGRDZE1VSGpjWGVDb0xDVWdWcTZYT1cvWGNaSkFGeUJ1?=
 =?utf-8?B?azJmTzBtNU5UUU0vZk1IWXhIU2ZvVGRaS1owaEtwT1U3N2F5akY4M1AvdUt2?=
 =?utf-8?B?UmQrYVdGMTdVV0dNSG9FSG5QV2wvd0FOVWtwOTlHMm13Z0NyS1B2Z01ORE81?=
 =?utf-8?B?Q3FFb01XeWRsSmtvN3NEUmptMDIrSmNEa1FXUmtZSFl4WjEyQm9JWXlZZnA1?=
 =?utf-8?B?aVlMRUR2bE01N0pVUWlySDltb0p6MC9pWWxGcUxRVFphVnlQRFltKzI3WERq?=
 =?utf-8?B?U3RvalJPNzJvTHZoR3p6cUkrQkQ0bTNWMXVQQ3hIMi81RUtuQVpTdzlaZ0FX?=
 =?utf-8?B?UmhhUm5zZGRLazFEczRRU2pXR0FXOUZ5VTNCTXErUGRZVFhBYithdDRwTzZM?=
 =?utf-8?B?M2pTN0MzNldMbHlGYlQ5RlFFL0p3OFIwN0gveWxCSGJjdXYrQkhpWk9KdkE2?=
 =?utf-8?B?SHZFVGN1MlAzT0hGWnJ2QkF2cVN3aVFseXB6dWVRcXRKMndUbjhHbVAwTW9r?=
 =?utf-8?B?RDM0NzNZOGRmcEk1Q1poVmJzR3pZN3kyRVU4QlBtUHlnNHBLUVNCS3I2bWg4?=
 =?utf-8?B?dWNFMUpCUDUvdHp2eTdQcGs3L1lnTFp4Vkh3V1RhYkdvbjRHVm1lM1MrVlY0?=
 =?utf-8?B?alJlZ0VSZEJza0RkSmk3bENrRUFDZmR4YkZVcWdDaGlXQ2JkMWE5T2hpbjgx?=
 =?utf-8?B?d1c2RXdtSW5ZWWdnSmFaTTJaLzdZTkJ4NHhQeGpRcEdBTXRSek4rOXZTdXdo?=
 =?utf-8?B?em5nMnM0cmdEWm9yMEZVNmFhTFgyNVpvYnN4N041Y1Z6emFHRmJWTlRjUitW?=
 =?utf-8?Q?hx2WvKpkdw03hLRo=3D?=
X-Exchange-RoutingPolicyChecked: G9Ldm7H3eWaKJvTsD4CSCPope6zgSu0cUfW+Ki6Fqql+/7Fas/msqQ4ZpIh0z428JsReug7l9l6mvb2Oe+mQe9Az6vPx4KQ4h73WdH4IsNK1D4QsWgLTA1mdq0Z+unAdscDi5Yqf6T9ogND0fqmLt/ik4eFvGn2e66E0muiYMOSxJEov1y8LoUQQY+FJbE4h2ULZInTvMQ4ITOtl0VZAdvE2kuwdLFD1WgiRw8K+ap6Piy9XJmEARmxRAb9yQHygfB/2MqvbFVR7fCuQ+OL5Z2aIYa6CxTj1L2d90sbL5eGClmcJt3sCaFb+ynNdn/2sqVj2ZZeOQsDI6pZ/9ZcTMQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 18bcf612-1547-4a21-abdf-08df2370b6e4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 06:11:52.2881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3aX2ga2kFfygUETdZiJgGMfVh3cdF9gggO32uJ5VIa2X5AtMOaWEQKibsQRneyNazlX+sZa6u9dcuXpd44wdzk+Hqroz9LEc6JWpBkjGk+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB937099
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

Hi Sebastian,

On 2026-10-01 at 13:13:54 +0200, Sebastian Brzezinka wrote:
> struct xe_pmu_device ended with a plain 'struct xe_engine engine' member,
> but xe_populate_engines() reallocs the struct to hold multiple engines
> beyond that member, which is undefined behaviour. It is replaced with a
> proper C99 flexible array member (engine[]), and engine_ptr() is updated
> to use [] indexing accordingly.
> 
> pmu_read_multi() and xe_pmu_sample() also used VLAs (uint64_t buf[2+num],
> val[2+num_val]) which are forbidden by -Wvla in IGT builds, so both are
> replaced with heap allocated buffers.
> 
> pmu_read_multi() aborted the process via assert() whenever the perf
> read returned an unexpected length. Since a monitoring tool should never
> crash on a I/O error, the assert is replaced with an error message and
> a graceful return. Its return value (a perf group timestamp) is unused
> by xe_pmu_sample(), since xe's activity percentage is derived purely
> from the ratio of two PMU tick counters and never needs elapsed time,
> so the function is void.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  tools/gputop/xe_gputop.c | 35 +++++++++++++++++++++++++----------
>  tools/gputop/xe_gputop.h |  2 +-
>  2 files changed, 26 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
> index bb2caa6ea..49d08536a 100644
> --- a/tools/gputop/xe_gputop.c
> +++ b/tools/gputop/xe_gputop.c
> @@ -5,7 +5,7 @@
>  
>  #include "xe_gputop.h"
>  
> -#define engine_ptr(pmu_device, n) (&(pmu_device)->engine + (n))
> +#define engine_ptr(pmu_device, n) (&(pmu_device)->engine[(n)])
>  
>  static void __update_sample(struct xe_pmu_counter *counter, uint64_t val)
>  {
> @@ -210,31 +210,44 @@ void *xe_populate_engines(const void *obj, int index)
>  	return engines;
>  }
>  
> -static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
> +static void pmu_read_multi(int fd, unsigned int num, uint64_t *val)
>  {
> -	uint64_t buf[2 + num];
> +	const size_t buf_size = (2 + num) * sizeof(uint64_t);
> +	uint64_t *buf;
>  	unsigned int i;
>  	ssize_t len;
>  
> -	memset(buf, 0, sizeof(buf));
> -
> -	len = read(fd, buf, sizeof(buf));
> -	assert(len == sizeof(buf));
> +	buf = malloc(buf_size);
> +	if (!buf)
> +		return;
> +
> +	memset(buf, 0, buf_size);
> +	len = read(fd, buf, buf_size);
> +	if (len != (ssize_t)buf_size) {
> +		fprintf(stderr, "xe: PMU read error: expected %zu bytes, got %zd\n",
> +			buf_size, len);
> +		free(buf);
> +		return;
> +	}
>  
>  	for (i = 0; i < num; i++)
>  		val[i] = buf[2 + i];
>  
> -	return buf[1];
> +	free(buf);
>  }
>  
>  void xe_pmu_sample(const void *obj, int index)
>  {
>  	struct xe_gputop *ptr = ((struct xe_gputop *)obj) + index;
>  	struct xe_pmu_device *engines = ptr->pmu_device_obj;
> -	const int num_val = engines->num_counters;
> -	uint64_t val[2 + num_val];
> +	const unsigned int num_val = engines->num_counters;
> +	uint64_t *val;
>  	unsigned int i;
>  
> +	val = calloc(num_val, sizeof(*val));
> +	if (!val)
> +		return;
> +
>  	pmu_read_multi(engines->fd, num_val, val);
>  
>  	for (i = 0; i < engines->num_engines; i++) {
> @@ -243,6 +256,8 @@ void xe_pmu_sample(const void *obj, int index)
>  		update_sample(&engine->engine_active_ticks, val);
>  		update_sample(&engine->engine_total_ticks, val);
>  	}
> +
> +	free(val);
>  }
>  
>  int xe_pmu_init(const void *obj, int index)
> diff --git a/tools/gputop/xe_gputop.h b/tools/gputop/xe_gputop.h
> index 1e3856071..c26db0e7e 100644
> --- a/tools/gputop/xe_gputop.h
> +++ b/tools/gputop/xe_gputop.h
> @@ -41,7 +41,7 @@ struct xe_pmu_device {
>  	unsigned int num_counters;
>  	int fd;
>  	char *device;
> -	struct xe_engine engine;
> +	struct xe_engine engine[];
>  };
>  
>  struct xe_gputop {
> -- 
> 2.55.0
> 

LGTM now:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>h

-- 
Best Regards,
Krzysztof
