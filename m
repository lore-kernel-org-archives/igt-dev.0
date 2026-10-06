Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB002CA5FED
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 06:14:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6626B10E312;
	Tue,  6 Oct 2026 06:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jp70t/zy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072FC10E312
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2026 06:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791267217; x=1822803217;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=byLCV8jMTTaIM02zAEJuTcS7UYaXX0tHM6aBR+JmVbc=;
 b=Jp70t/zyqeaU2eaRKqwnUfpu7OEB1tZgUjZ2kuUscRM6G13HtxUMeQv/
 yddH/Eb5WkS+FRNtR/qKD8qHXGsZ1ajyWHaAXwZlMVv7rMdb//jI7FF1I
 daOsgnWUvUitFXRbDGX0hzCthbkv5t1mH503q9xAPNHpwjy+27tgG89Nr
 MMFBVDR0LtM1rQ15pzzas5fYau68K6+SvZNYjahDgqeFpMpd001noMUvo
 DK+yyaVyVAuVS22axscCHc03+VeyijM9hMZ07CTva/K+fAxkPTbWL8wxw
 pXpSWuLupihkny9SZoc/yEr50kSipq4BgHxwCJppFGDQ43vTp1moI7NIi A==;
X-CSE-ConnectionGUID: C8q/vDR2RoWabgcmemyaGQ==
X-CSE-MsgGUID: NzyjY7xZQwuevQjwxYI/hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102616949"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="102616949"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 23:13:36 -0700
X-CSE-ConnectionGUID: L2H2OFrHQSeiaz2tJNO8EQ==
X-CSE-MsgGUID: SLNIT4/lTr6BB3Ft+Hi9Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="304993524"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 23:13:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 23:13:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 23:13:36 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 23:13:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8BH/zF9RxijnXAIeDYr0A9NMzZvUePL0S5BzmUnmjCWJcdFb+gf7bQdbLO3VKz/zs5uGGM6b+oPYH7TTRhe7p6tQAH2N9cTlRk6hR1Kg0il60mxgW4h6BJusY7BnyV+J0EJZpv4RQgIWTTxpF+zGgvoYimYia1WKxYMndORH/MOSI6K7Gvm4WNEqxFSxwtBcsm2DAWx+qNIq4zvPnS7vGfmShrpUc8nUQLiNaasN0AnmkLaLjoX3jsni0mOoazPSlbSYi6x2BTNLKsIJkQgOEZYhD1ebTGPifVW0B5psBUzfPfn20Vf0y8iD8jaNvzttMrK4VWj7vps6n7lAJAe2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUgLGMEBDKDoZ9g5LkmJGEjP940rltz1YJZrBcAh0Zk=;
 b=rwgKk5JprjKio/tSvxEVZGXm2XVlR/2LVhN1S8Yb85VYWmzb5A5B8UnmTWieWjZ1757y2nzmTphexCoRO8vqha/XHcHofXZ0hII+8ahSnysqBAjRzgnINbkaHnM7Gk4D6Are7mk+MIJuVNS2fPDy3Dffw6Nv/qPn8rSgarVWJ30qKKLyJQ4BiK8oFgZZHpBx2PRd8yNaj/pcLSX3xOORqlSNf91AoqmXVIPBHkbyZr/4ch+7UXOeSu4fwvb1t/NrWIcbLuPDlkYhYDYB94ZwedQs/Lp0l5hlM9aLl/hKGbNlIa2O2sDZclSst0DLTaukzmNcY+M2QqCv/+a7RKj28g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by PH9PR11MB937099.namprd11.prod.outlook.com (2603:10b6:510:419::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 06:13:34 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0472.015; Tue, 6 Oct 2026
 06:13:34 +0000
Date: Tue, 6 Oct 2026 06:13:24 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t v2 2/8] tools/gputop/xe_gputop: fix missing
 igt_aux.h include for clamp()
Message-ID: <sfo7dg4dzovgldbqellvscex5ucy7gqtcypzbgzpwpg5xb6axn@n3tulfbrhwk2>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1790853076.git.sebastian.brzezinka@intel.com>
 <088e1a883b8d88a27a16000d6616d43d0858cff8.1790853076.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <088e1a883b8d88a27a16000d6616d43d0858cff8.1790853076.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DUZPR01CA0055.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::19) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|PH9PR11MB937099:EE_
X-MS-Office365-Filtering-Correlation-Id: 549e7878-f7eb-4561-7365-08df2370f39a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|22082099003|18002099003|10067099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: RQJOHAEKTHlyp7eRtPWfNmae1fExzWsDogJf1q1eT8e1bLdBuWBMhCSdoaBSikiJBevZHLkusza/DQneoPJ9NOW9v2RmC1KkgOgEaCZbV37KavQoESjwBiL25TjIUPcZjZ00T3lYfthr9z0HSiRU7N0jOuebjd/7Kg4KgU9FN+SO1xBc1cAUPpXMo9WCG8EoBWo7ZZhoT/KEapVCkCqV4lol7Pi/sZPboRv784/qDLEEquUCrYW9ClyEkggW9FjEGrXdLi50fhgN3UqfgHS1D/pM3FP8WcoBe/MsfTi0hGUmzQ0QM6LHbHLzrKPsc9EmvuJVhPZBOHUby4zg/RCJpdFs9tr9zjFvBriVCTwZP0htjvGuWLescaxCaycxYl57VQ8+WNurfAqC2/gpRQHbdmRKmTWw8ywKj0PsupA/H9SWhHyP03ZiwOHEMb5Mb6PEiDkNiqLNER15uy30W8VgUyPVMr0IdBZOQJ9Yn3nYwCAgUdbkTfnqr69evdnxr3m0JM+Zn+nU9KrMjNfJkZWiQnMZa+DVw4G7Pgy7ml5uG26G1h6gaKM4GrttW1Nj9AlstogmTUPApQUAETD5ZMIWwxLNJM/LgDuB7jJoojJ+waSpm29/CGbnLnCUayaHcxBWVfQX4Bl++NUmdDfYDICPMgYENgaeehQjjQSSNJDIERg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(10067099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGttcElpa2VFNko1cy9qVGpDYUs1ZndIVEc2WUk0SjIzaVlwZEs2NjAyZSt2?=
 =?utf-8?B?cGtMM3NFZnZMQ0s2Q3ZNc3dVZGJUVElZUTNvWlZSblk5cGxVMUxBOWhVc1lo?=
 =?utf-8?B?RXVLVjZiakxoYTQ3T09oRzR4emFhcWFDNGgxTStwTDlxZWpFQjRkODlyWHNK?=
 =?utf-8?B?VDdaZllrd1JXR3RhbFNxYmh0ZHQ5NGFqT2RwSzFoRjJ4ckcvaFZiZU9NZmlH?=
 =?utf-8?B?aytudlVTUGhUMW4rMkEwelpRejJDQlJrdmNCTUlCQUZzR01MZWdCdi8yNjlr?=
 =?utf-8?B?MDd5bVRPZjhPVmEwSjNJMnpoTThtM0F5bkVnOEtjL2szQURabVV5SnF1eFJn?=
 =?utf-8?B?cFhRcll5Q1c5MEQraGFsUDBsZDc4eEtVKytCV3JPSHhTMnF6VkJsUDdGdDhp?=
 =?utf-8?B?ekFrYmM0UE45L2d4Uktqc1pOU2t2dHFXZzZNMHJaMzNQSnVoY3I0eHZZSGtO?=
 =?utf-8?B?SExPVERVcU5DV1pObGNyM0JNRkcxbHZYVXB0WmhXVUZhQ2krUmd2ZG41aWxu?=
 =?utf-8?B?WTVTdmk3VkVZeW8wVFNXSjNiVTcwdElpRk40Rzd4QlRpclFWNnFFSnFydVRG?=
 =?utf-8?B?bEZISVl3WE9IWlJGQnlpUnA0cnJGdzI0amxvVVZaSmRNOHh2RUJYcjgvOVl3?=
 =?utf-8?B?Lzg3MTZnci8zeHNTbHJldmtSSjRQd2dIa1pxdkVMeTJONlNoNVBpSDRaWVZY?=
 =?utf-8?B?WUtsU1Y3TVBGbVlHeDllaTZlRHVzMEU5L3dyQkhQRmkwYWZLWThPb2U1clMx?=
 =?utf-8?B?WmVnZ1JkSDc1MmNjaGNQTU4rWWJoR2xDaFVxODZTWDNQSkQyQTNaYnhKUTBx?=
 =?utf-8?B?cmZLRkpQMGxUOWRPUWpBb0ptRzZNdTJrb1Z3Vjl4bzI5OFd4VnZUMmpHOXF1?=
 =?utf-8?B?ckI5L2RBNm53SGlOT2lBSC9WTm4rR2tVclo2YlRkS0J4ZWQybUVSZDRvUWNi?=
 =?utf-8?B?UjNRUTJWSU9uZzJhcDloRzQzUm1XRG1lQU5EUWM1NFZjd2FidEIzSTlVcUtj?=
 =?utf-8?B?L0lwNEtXeTRZTDlnZXlVc1NBSUFpN3A2aC82TXI0clEzQW5tYnJ6c084dEha?=
 =?utf-8?B?cEdXRGwwdVEvQVpHZ2JFQVJUMG0zZkQ5K1Rsd1JBK2RkS2RiN1ROVFF3b0Vy?=
 =?utf-8?B?VUlJZkFhaXZod0VrMDB0RDdjU1hCRXlmRWxNYjhFMURGNmtjcEZ4OVJwQUFG?=
 =?utf-8?B?ZFgxN0NQeHV2STV1TTU4UFBHelJtVXM3SWNEeENYK1RsTEJvQnRIRkJ5cUNu?=
 =?utf-8?B?czQzRUxPenc1VGZXaVQyZTJxa2Jrcy9zQUo2QlBxM2hvSEhlVWMydlJqZW9F?=
 =?utf-8?B?U1JyZm10UnBJRVZqQ1FVOUFJVEJGZHRPOWZtSHVRTkNNYlpGdlhTdjY5ak9s?=
 =?utf-8?B?bzRxOHBuNVUrMG1xVnRQNFVPdmVMUisyL3FHVHk4YXZuZmF3Zm1SVFBUQ2F5?=
 =?utf-8?B?cS9SODZDak1CUksrTXQ3UVlzZVZLR0dTMm9aYm0rME1IbDhqTXRLK1piL3RV?=
 =?utf-8?B?SHlCc2J1bElxSU5hRThjRHIvZkFSK0xzZjB1ekR5R0hMUkp0T0tYSnB2M1Zn?=
 =?utf-8?B?ZDR6L2FPOU5wTjFnNTdEZmlETkw1VzhBYW9GTFBLdVFabS9BSVNnenMwbEdm?=
 =?utf-8?B?dVdiMDFQUyt2Z1pvTHdCL1k1MHordjNVMlo4VFo2eHU0VGVTVmUyVUcwczNY?=
 =?utf-8?B?WXpSZ0V0SEFMUmJzUEdqRVZ0c2NCOVg2anZYcUlhNVYwUlBDdElkN1lGQ1U3?=
 =?utf-8?B?MzQxUDFqVXhubG8zS3grb01GUDlZNS82QkxqVlE3UVd0MjA4cis5bVBQZURs?=
 =?utf-8?B?QmtTM2N4K0pZQ0djSmYwNXRhS3g4T0syNGU5THZZRzFnZE5UZGY3VGthSG43?=
 =?utf-8?B?eWRzbU5ZMlJPcHQrb2c0MTV1UExFd2NJY3FzR09VTC9VVExRWEVpT200MTE2?=
 =?utf-8?B?b2pXaE9uQ0lSWW9HQTlpemNxallwVzc4VlZkbFpkSXVUeXZQQm9jczlKQXJm?=
 =?utf-8?B?Unl5Q3pBbzJaTXJHdDZwSC9tdnRSeTdKQVRpTndyMUtqWXpxTU1zSUQwNlE3?=
 =?utf-8?B?dlRTWnhOcUlUaUlaRVJKTFd5MTBUWkpCa1g3ZHFFckQvVGdlMDcrYXpRY1FE?=
 =?utf-8?B?YlY3d3A0T2hTSGVmUDB3QnIxZ3BmakFuSldJbGtTZVVCWFhMQ05PZWx0ajBU?=
 =?utf-8?B?T2p2TzdKTWcxZnBxb1UwWVU5Qy9PWmpDRmpiMjhSMy9GTU1jNXM0S2JPNU00?=
 =?utf-8?B?QW5ESUIxM1ZGRi93M1lBUGhsenlEdVU4ZFFmcG93WXljZ2pGTHBCWnhQZTBv?=
 =?utf-8?B?bm40dVpuRlQzaTN0K2RtV0pFaVRoMVM1alFreEFhOXd0WXVtL3RoNTQxN3kv?=
 =?utf-8?Q?ulmYwLJ20/uOGs1w=3D?=
X-Exchange-RoutingPolicyChecked: sRFeelkaRCxjKCOVWmmJiWEcUXQlfy0RJvjzmpQxIcvi4wOV7223pGiTCHONO6pKs9D5APDDm5hZHECC8QPqLd/kHXk9XPi0by3x3Bw7LKrN1n8F7/+pDmbo98+/qlIjTE5D5WHof1ORBg1/ATVZDK7Nj9e013fp5c8ikTcuWrwOkm4HKbtJ3dY2GWvRsyMwHh9DidFpGNxmvzOaMMJ8ZZA6C9O5dXURWSgZR21Z3R2hx0TQPGmCgY0FmnKvdsLckZk14N/J1mN+zDr/aODzP2WaXb19JpnbDysPrS1Vd7cnSJtrGyPs3W8U+w27thh/0+64GLa7rIA8s/KMvB/+EQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 549e7878-f7eb-4561-7365-08df2370f39a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 06:13:34.1601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +TXbVLd8pxO8ggJ8gDS9ORhMvViRZCIAd+HfC/VaRtIbmFt3mzGKYN/K3FC74vWTZONxsK00YGLmeUsBTzd8ykdy3KJwvU54qzAaDZgFYf0=
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

On 2026-10-01 at 13:13:55 +0200, Sebastian Brzezinka wrote:
> pmu_active_percentage() uses clamp() from igt_aux.h, but the header
> isn't included, so the file fails to build standalone. Add the
> missing #include "igt_aux.h".
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  tools/gputop/xe_gputop.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
> index 49d08536a..46d29419c 100644
> --- a/tools/gputop/xe_gputop.c
> +++ b/tools/gputop/xe_gputop.c
> @@ -3,6 +3,7 @@
>   * Copyright © 2025 Intel Corporation
>   */
>  
> +#include "igt_aux.h"
>  #include "xe_gputop.h"
>  
>  #define engine_ptr(pmu_device, n) (&(pmu_device)->engine[(n)])
> -- 
> 2.55.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
