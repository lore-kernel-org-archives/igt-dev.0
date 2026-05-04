Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEC1FF885A
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 09:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB25910E5F3;
	Mon,  4 May 2026 09:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQZpBfpE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3797110E3C9
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 09:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777887445; x=1809423445;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YMdHjIuWR3NN6iioxLyXMneOs3qJhnIeLSlJD4AC5Gs=;
 b=IQZpBfpEVKQhFy9ep7m+DOaLwBzvptZNQXficfLU0gGKAPQBUkOWaSvn
 p0dRl84amPFcCO5AoDdR4VsmYtlFy9fB28m+j/bU3ib4XFGO05+mAD71G
 +EV6ghWh3mq0mcezafqdV5to30g27r0mu0aguJZcijh+Eel9+vdAsJqjv
 mG/s9V5TnBLVavOzdVMytnpkMKHtq3bxV22hOJ8Fwz9RUIRuwWgwb6Hkk
 LPaCZV6QFRj45DsD+/DexS4zAUmSnha9G2o1f2GlmDBVgv5ci1pAAZKqO
 6FDwMJ0slhXtd/Y4zi9nJMln4CpYkaGt1xq3Mw9B4Ck3ibxhto8nJDB2F g==;
X-CSE-ConnectionGUID: YLZLsrZJT1iKzx8b6g6phQ==
X-CSE-MsgGUID: Kqd0rFImTW2kYpX6ZJ9fYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78792445"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="78792445"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 02:37:25 -0700
X-CSE-ConnectionGUID: mwAp9gHXT0matNCYA2ajkg==
X-CSE-MsgGUID: zcJmeXRCSy+xM2HPNXU1TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="235724238"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 02:37:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 02:37:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 02:37:24 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 02:37:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4D5x7Fee93RgTuGMdc9OS6IYzaIHHEpDPBBayrToozBkrf6wkyABkQElxOXEN03XWwooABgR7oFBSTQUcUfbanTDPqGKgha1em035DLDjxRVgJXQKmlgF0i98uANgsUdp7GZzCun3XMwngE/8cEygRsvZkjV3Z5MiI5iMRu22wzCjXXbzn1rgmOxPHZndTwOLp1doFnTujUowP8WjC4ZVnIx1afnWi6VrIthoA0Dzzjow00XhWeSV573EYwXHhObpBsRw+BbFOdLWG6cm0ky7JiGI3jEUs3/e9CdbNaQWn1dQR2HiFsRD9vlBynoRlxmzyk2kr8vqhc28B0oox8lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNfWK84xdYjjEBVTPXDd/FBIsfXHa2MVdglVXIjcjLQ=;
 b=fsTE3AzuHoVdWX8jkwiMhGPJ/X5rgQiLCqtGfgPkBKARg7yYGysvxb20Kf/Gs3CxYUMlMGEDq7rG7oh9AMrl7Gy1LAZobxbqoHkdvDYpn3g468NOFrkCFtPoSPM91Uk404HNx6Pg21YCjGp0ecrk0rVT3nHQCs8nwraQotncm4Nb1FyeKHoxtTT1HfVt88aZCHpLjcodi4AWQZvzcKyk/5nd5HV0ZJLDKX90zzU72f+sbiZYdeZWO6qTXDp9xrmkmNQmoZlSavRz5aXyjS15pUH0IP2L4oIzPp9vHs8tJZ2tPZyypMiq6eX7XUyY2Xqwwvz4VN5Vws6yMTaIR24A9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS0PR11MB7649.namprd11.prod.outlook.com (2603:10b6:8:146::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 09:37:22 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 09:37:22 +0000
Message-ID: <f20108cb-2e3f-4901-a48f-2fbe37aa87de@intel.com>
Date: Mon, 4 May 2026 15:07:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] tests/kms_hdr: Move framebuffer into data_t for
 centralized cleanup
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <sameer.lattannavar@intel.com>
References: <20260429093955.3726263-1-pranay.samala@intel.com>
 <20260429093955.3726263-2-pranay.samala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260429093955.3726263-2-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0191.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::7) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS0PR11MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ebbb396-600b-420b-0c07-08dea9c0bdb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|42112799006|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: KgfeFiaq0uPPL2pJzPoIFbU/W9PXP18see+jy1IJVrYAwgoKb7i2HK9IlWTC+YtxQMfNUYGS7K0+ZNAIEHzsxYq2eWc7DaoyS8486sb2Gj+cY2862VWEBN1n5tqE2epLJIEdoGJW+J31jonH0WqftoTwnZTwPmttZkIRrY5wwDkFjZAAwJURgXt2+1id9DsFdqj118jxBmgK0E8/typdckEDTGfMZTpQJzG9LEDL6q8e8kUV1wMuFYRbu1fdY/keJu7qDAqXD61LutmswXhGyDF7mSyIL+etOTRQscGohVDBJM+ulpg9oDs3Q0nZpnsQTKB9g7p+T5bUE0hKb/gRWNJ2bVKjx7KQZUU5cvrRzScC2WPpG7dnOXLDMaKx4oBeSQJQwG+COAh0IUs6zYmM2ug6u752GmofUDMqoK/BuoFsCQqPwwycpSI8qg9gSkLFtojXWb17ve/c5viIG4Bx0aS5sE/4hEo1sX7rtPB/aeDYUQdBg0N9YZP4FoPWLP9nNieZ/X8eYYmiHEuHkmM6S+AshmxYQLcqgEY3RcjAVJTcevLdlhTaFCl2sNp12Ugg/BJP9naML1B+KFdYl44n/igFbfbsKyFk8Fj9MjBtciNGSFgsWmRTNC533T7qLmf3iknfYhnJwRh6IcvSFLKAxBj7ydFNRdzxa3VLf/O3xQHWsOnA5NKHdLNwNP5l2CM8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(42112799006)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDRpU0FoYjB0UGRUUk1ZRFZHVk5iRXZFTk9YL2VicURrM01UU3pQeUpqUWJD?=
 =?utf-8?B?U1BjL3p4TXNaSDQ3T1ZYcEo2Qmx5bFkxM0hyamJ4R3ZNQzgvQi9LdkRUc2xn?=
 =?utf-8?B?SGcxNzgzWE5NY2JaOVBaWVp4R2NvWStlWVN5VEJSbnZOd3ptL3pkb0pxN1J4?=
 =?utf-8?B?WlhaWHFMZUdqdzd4S2hPRm5tMHArNUdGWEdkc2szTVJ1N3N6ODlBY3Q2OWd2?=
 =?utf-8?B?dGVJK3VoOVBvR3ozQ0RLNVRkOGh2U25tYkN0a0RZd3NHUVN4emVMR0lTTUNK?=
 =?utf-8?B?ZFNqcC9HR01HeG5NNWpWOExScUtHTmhrcCtDU2M4ZGprQ0xRaDg2UkNmVmRy?=
 =?utf-8?B?N1UwNzBWcjRMYS95cW5kWUFicFNXWmN5cWw5VFBtR0VKSVo0RWNNeTNpcElj?=
 =?utf-8?B?UGJSN2YrRDdtZ3kxaEorS1NBWmJBTTViUFN3VzNrNkc1Zk8weEl3SEdRSm5Y?=
 =?utf-8?B?YjJMRCtuM2wxekNhWG9WNjlLbFRxcmhOTk1nR2dJcW9JNTB3M2lwV1VrOUlQ?=
 =?utf-8?B?TVlaeWZiRDZrb2xRSnkwV0RNOFFCZUNpdGw3a1JNclQwQ1gwaUJjeTRDQjlZ?=
 =?utf-8?B?cEVLYW5KMWZRZVZhSTNnaW5FMXkvUWNyWWJQSGpXWWFZN1VxY2pESGF1aE0r?=
 =?utf-8?B?NG9FdWprYmxDVzZxMjZRaENwM2o4OFl4SnNwWTJDSkR5Q0VIU29VdmtSeXZj?=
 =?utf-8?B?Sk9PVkhBYWVMdmtZdVRydVdBU2JybFQydURoZmZBYXZld1ZuN3NHWWxFTTBi?=
 =?utf-8?B?eDE5bTQxY0dyZ0NZdWN5dEIwc2pLT3dqMVMyeDFCLzRVQTVYY3haSkYwU0Mv?=
 =?utf-8?B?czBMQ25CakQwTkw2V2lPSC9OTmZRM25mMExpSGhPc1RLZ0h1UG5sR2ErTU5F?=
 =?utf-8?B?enkyMXNucnNPOC8xN2Urd1haejM0WjQxdnhUdGtKcXhCMDVFaHREUGhEckI1?=
 =?utf-8?B?cFh1cy9tRGhBdmdkN2FRb0dpWW5yTE1va2g0VUdqWXVwcWVVR2VqaEJETWtn?=
 =?utf-8?B?LzVqelAzTXFNNkR6U0Z1bHExNVpQMWgzOFJ1OHZZU2JhUUFHZDY3amJ1RVJS?=
 =?utf-8?B?WmgxUGs2NDdWREp2N1hjQkF5ZkRQVjdRNm4xbXRjeU9rR3lxYzNzemQxNk16?=
 =?utf-8?B?dEg2REgwSmdBeHA4ektidDZSQjMxd2hWcjJObnJKRDdjTkxaeXlkNjkzQndT?=
 =?utf-8?B?aEw1RndIdXdnVXRGUjFuS2FxUS96NHFTZ3lNNlpNZGVzQ2FYTlRRaGZsaU5a?=
 =?utf-8?B?bnYzZjRmRTVxU2dWWkFCandVMGw2ZWUzNlVheHFwZGExaFdVdGdhbTc4QTlG?=
 =?utf-8?B?aHhyT3kvUGFQNTBKOVY3Z29FZXJhQzNQNWQ3V3JyeG1kRk5lTWJIQ3VMdDBw?=
 =?utf-8?B?ak1tUEplcE1BMmpUVkludWtjcUMvYVZJRmJQTDczN3F4Q3dFTENrUVExYmcw?=
 =?utf-8?B?VXhkSVpkK3ZTNDhLUEp6a1hpS0pqSEh2NlhMQldLM2YwVG9aQ256Z1Rod3lk?=
 =?utf-8?B?QW4xZWhZY3pmNnZnOGRCZUNmTUJVa2grY0I1ekRKNjhxQWNMQUFMOWRJaksw?=
 =?utf-8?B?S1JHczR1VGV2U1pWRVNDWjEvb3AvekJDTW52bktTSlkzcEptb2NZR1dibWRG?=
 =?utf-8?B?MkMzSmc1TlNLNGlncTBrM095a2xVQjZLZVh0ZXdZLzZTZE55b2dDNUxiNWRZ?=
 =?utf-8?B?aXBNb0xZTXU5ckRYZmQ0dC9WbjFRbjd2YW04L1BlNVFtUHhxNnVmSUJrR29Y?=
 =?utf-8?B?ZngxQkxaSlgvTklMY1VVT2c1d3g4YkZGR2sxcVY0NUN3dFNEVFZwWWdtbnk3?=
 =?utf-8?B?QUlKcDUycWYvUXgwMGJjc2ROZ1Evek9ibExwcjdsYUFxWnJ6REwwRGZ4YlZo?=
 =?utf-8?B?cUVCVWpURzF4dmNOaDM1SDYxSzhIT1lUd3phT1BJWS9WZjFaRGNZQU9ZVnFh?=
 =?utf-8?B?ZkpjSzhORU53NDBoOVFmamJWbi9rRmVEcThMMWJYMVZMblV6SG9jM25DNGMr?=
 =?utf-8?B?MEs4TlhlSlMyUlRSS3NpcTN1ZlU2SFlqZmQ2ek1CaGxQQURvbk1DTHVSTzBp?=
 =?utf-8?B?emlZbDRzMjZLalhRckpzWmhlNjJ5VUVWVmdyTndCVmtYSSs5TXlIM2tMMHVJ?=
 =?utf-8?B?TUpLMU9lbG1JamNhc09rVUE1QzE1WU45UnBiR2JwSlEvVGgyNm1XZEdnSGhn?=
 =?utf-8?B?TFhGVm1tZTc3cE5pallLSWFKMnZzRW5jV0lFaFVBRTMxMVE3ZmNsVlFxQmlL?=
 =?utf-8?B?TVYxZDlhNFpCa09STlhKbCtNVksyNThGdEtWcjdROVFTT29NOEdqN2xiOFV1?=
 =?utf-8?B?TjFVaWx0RVVTcE16d2dDZVJ2NnVOSzU0L21mRHhVcVRpN3ZUckFnUT09?=
X-Exchange-RoutingPolicyChecked: bgnGs++e/YYI7Advkj6n+5etDOxKMD7pFXIofiIQVcJ7DEqnT6k7tAVh/1BYzZke0ZcUkvNxGycPLCa8D1q/MdpNBZwtw0Augh5EfmCNpK+/x8JQg8WjO9rut5Get4QSqF8QH2QZM3y8WnqaeetK0Yr3iLqp2m5zTxb19tWrZIM5xRPdgQtxYsgopFRfkJOj0fyQG0crtgkcTmS3IdsUmwEWR9ksZSSB9uD2jRAErZ49ipr6MBtZJuaL6htAX+HD/r7xiiE5ztR87eSuvRrDg1zh1NqQBweUAyxNUe6AFUqAfppqTmp7SSuAiTaalgKsNEdvBHSrfPczmUfnHtjMew==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ebbb396-600b-420b-0c07-08dea9c0bdb2
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 09:37:22.2988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ITx6UsRbgj2ErbAaoZkDhRfSRFSoRMUcMosZBffqkB8ixov0h3MxYK2/tq76z/Rt/aaZikYmI4i06LoDvK3BYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7649
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

Hi Pranay,

On 4/29/2026 3:09 PM, Pranay Samala wrote:
> Move igt_fb_t afb from local variable in test functions into the
> shared data_t struct. Add igt_remove_fb() to test_fini() so the
> framebuffer is always freed during cleanup, even when a test exits
> early.

This commit message can be improved. Currently the two sentences seem 
disjoint, may be ",and add igt_remove_fb()"?

With this updated, patch LGTM.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_hdr.c | 30 +++++++++++++-----------------
>   1 file changed, 13 insertions(+), 17 deletions(-)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index b215b0e6c..c4680298a 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -123,12 +123,14 @@ typedef struct data {
>   	int fd;
>   	int w;
>   	int h;
> +	igt_fb_t afb;
>   } data_t;
>   
>   /* Common test cleanup. */
>   static void test_fini(data_t *data)
>   {
>   	igt_pipe_crc_free(data->pipe_crc);
> +	igt_remove_fb(data->fd, &data->afb);
>   	igt_display_reset(&data->display);
>   }
>   
> @@ -244,20 +246,19 @@ static void test_bpc_switch_on_output(data_t *data, igt_crtc_t *crtc,
>   {
>   	igt_display_t *display = &data->display;
>   	igt_crc_t ref_crc, new_crc;
> -	igt_fb_t afb;
>   	int afb_id, ret;
>   
>   	/* 10-bit formats are slow, so limit the size. */
>   	afb_id = igt_create_fb(data->fd, 512, 512,
> -			       format, DRM_FORMAT_MOD_LINEAR, &afb);
> +			       format, DRM_FORMAT_MOD_LINEAR, &data->afb);
>   	igt_assert(afb_id);
>   
> -	draw_hdr_pattern(&afb);
> +	draw_hdr_pattern(&data->afb);
>   
>   	/* Plane may be required to fit fullscreen. Check it here and allow
>   	 * smaller plane size in following tests.
>   	 */
> -	igt_plane_set_fb(data->primary, &afb);
> +	igt_plane_set_fb(data->primary, &data->afb);
>   	if (igt_crtc_num_scalers(crtc) >= 1)
>   		igt_plane_set_size(data->primary, data->w, data->h);
>   	else
> @@ -265,8 +266,8 @@ static void test_bpc_switch_on_output(data_t *data, igt_crtc_t *crtc,
>   
>   	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
>   	if (!ret) {
> -		data->w = afb.width;
> -		data->h = afb.height;
> +		data->w = data->afb.width;
> +		data->h = data->afb.height;
>   	}
>   
>   	/* Start in 8bpc. */
> @@ -305,7 +306,6 @@ static void test_bpc_switch_on_output(data_t *data, igt_crtc_t *crtc,
>   	igt_assert_crc_equal(&ref_crc, &new_crc);
>   
>   	test_fini(data);
> -	igt_remove_fb(data->fd, &afb);
>   }
>   
>   /* Returns true if an output supports max bpc property. */
> @@ -490,20 +490,19 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
>   	igt_display_t *display = &data->display;
>   	struct hdr_output_metadata hdr;
>   	igt_crc_t ref_crc, new_crc;
> -	igt_fb_t afb;
>   	int afb_id;
>   
>   	/* 10-bit formats are slow, so limit the size. */
>   	afb_id = igt_create_fb(data->fd, 512, 512,
> -			       format, DRM_FORMAT_MOD_LINEAR, &afb);
> +			       format, DRM_FORMAT_MOD_LINEAR, &data->afb);
>   	igt_assert(afb_id);
>   
> -	draw_hdr_pattern(&afb);
> +	draw_hdr_pattern(&data->afb);
>   
>   	fill_hdr_output_metadata_st2084(&hdr);
>   
>   	/* Start with no metadata. */
> -	igt_plane_set_fb(data->primary, &afb);
> +	igt_plane_set_fb(data->primary, &data->afb);
>   	igt_plane_set_size(data->primary, data->w, data->h);
>   	set_hdr_output_metadata(data, NULL);
>   	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
> @@ -566,7 +565,6 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
>   
>   cleanup:
>   	test_fini(data);
> -	igt_remove_fb(data->fd, &afb);
>   }
>   
>   /* Fills some test values for HDR metadata targeting SDR. */
> @@ -605,19 +603,18 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
>   {
>   	igt_display_t *display = &data->display;
>   	igt_crc_t ref_crc, new_crc;
> -	igt_fb_t afb;
>   	int afb_id;
>   	struct hdr_output_metadata hdr;
>   
>   	/* 10-bit formats are slow, so limit the size. */
>   	afb_id = igt_create_fb(data->fd, 512, 512,
> -			       format, DRM_FORMAT_MOD_LINEAR, &afb);
> +			       format, DRM_FORMAT_MOD_LINEAR, &data->afb);
>   	igt_assert(afb_id);
>   
> -	draw_hdr_pattern(&afb);
> +	draw_hdr_pattern(&data->afb);
>   
>   	/* Start in SDR. */
> -	igt_plane_set_fb(data->primary, &afb);
> +	igt_plane_set_fb(data->primary, &data->afb);
>   	igt_plane_set_size(data->primary, data->w, data->h);
>   	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
>   
> @@ -690,7 +687,6 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
>   	}
>   
>   	test_fini(data);
> -	igt_remove_fb(data->fd, &afb);
>   }
>   
>   static void test_invalid_metadata_sizes(data_t *data, igt_output_t *output)
