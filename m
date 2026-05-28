Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EE3CD5BD5
	for <igt-dev@archiver.kernel.org>; Thu, 28 May 2026 06:04:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2802410EC62;
	Thu, 28 May 2026 06:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="USLpktG5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8EA10EC6F
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2026 06:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779948255; x=1811484255;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=f3ua2mwrvC38S9oGIntiJhWLk99diVKNlJAWBjdU068=;
 b=USLpktG5//8zcoRo8fnlSfqUJ79zHh10d13y3ARQLvEid8imzPx6wCHb
 NJQW2Vf0UsvnFfNLPKpqcgahvG2FbmjGXeXaRItoyFPAhAFjVTx7Jngh3
 n6yJ4cpGd68+3Hdbe2JeoAHjJayZRAIGD30RETohQjf8phuyvD1huQ6aG
 FzzEQ0qlmaiT+dQET/60UWUoWdoG/ostKXVOy7BsXoTxm0I6x5zBLiE1V
 gJsxmHmJRHnJwsLfSczCiDrCzC8tr5okT49DtPDoPdxL64xYehRtGOy4g
 XY3RM3WysCYGrshzOAyCPzJBtklH3LeoJtEC8ddcuoUih+dGCsWGw7M2D g==;
X-CSE-ConnectionGUID: FV/QMgV4TK28xJuZ+Tl9nw==
X-CSE-MsgGUID: 9sD39DaYQ6WQdHxHarSR8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91896671"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="91896671"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 23:04:15 -0700
X-CSE-ConnectionGUID: N8aopeU3RduFQu7ZP91Btw==
X-CSE-MsgGUID: pL5TfcCVSGq9PJWbqaAjyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="239454140"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 23:04:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 23:04:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 23:04:13 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.42) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 23:04:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMHMAQMP74EimLaMk3x9E59IE9bEugDpInmxmk8cyd9cxLtfZNx0KDBHLgp/oYovCluX5Da5Y4nItWYqdD+ztKoaRmAUWiBv7xC35AdnZB2vZNb67JOZcz2iqZ3hdlL6G/5E8phMEU4JXJYuqBt3V4Z2ne+3gpgbe0/etW4a2qGUa4mxs6qxbEQuTpn6F4JnpyTs51TCf0hgI8Jc9Q1EB2HpZfG7pZZtFYee7lEU1NU+B+PUeTiiE24qDVQM42/c86JhFxcyXU9LMny/IU5T/kFIxogkDCGPejGGGEtzCxGwuF1rNwTnINa/nPKbVJ+rZmMUlxODU5yHFxBfTloxKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ag3PQ/rvF8oWZq9ir4ZWSYMUQFsPujurEl/wDqWQf+0=;
 b=tRlAo/eoGv+uHZjGOrDdoN7lg6DVexaRVztfmk0icEw+nfT0n3HzRlvpS8egX0dtVwo10tycSXgDQDQBAkLHUWK5Pj4qoQ4FEclf+b/5bAGSe6BsgrVOX8NIPcDJ00GbBXaaAFLTi+EuRoo3+Ru+DQTapCaNXjiNABdNRhXMQ3RjsqeAsGVKskp8MJ8mA5ceYAax4H28cWklfFMUbQegnSdZwrOzimA1UScPJiXgDH83QvHYBhvIZ8QqEuW+znOxrq5MFRw0Pp3YRhiMlQeGAI7uxCrB+EpLt/BctBBFf5octrfVadUpqmOIV4Gr5JWfGjHnlx7t9zjezAxDkY3zqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23) by BL3PR11MB6483.namprd11.prod.outlook.com
 (2603:10b6:208:3be::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Thu, 28 May
 2026 06:04:09 +0000
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::5a0d:e357:ce45:3963]) by DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::5a0d:e357:ce45:3963%8]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 06:04:09 +0000
Message-ID: <1b1a298c-0832-465d-b732-71cb3d3dbe57@intel.com>
Date: Wed, 27 May 2026 23:04:07 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/inte?=
 =?UTF-8?Q?l/xe=5Fpat=3A_dynamic_PAT_index_selection_for_pat-index-auto_=28r?=
 =?UTF-8?Q?ev2=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20260527210052.161768-1-zongyao.bai@intel.com>
 <177992851787.18056.3198946910717653902@6beec6c84f66>
Content-Language: en-US
From: "Bai, Zongyao" <zongyao.bai@intel.com>
In-Reply-To: <177992851787.18056.3198946910717653902@6beec6c84f66>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0028.namprd21.prod.outlook.com
 (2603:10b6:a03:114::38) To DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF46B98A11D:EE_|BL3PR11MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fa8bb54-64ab-46cc-118b-08debc7eeeda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|13003099007|5023799004|4143699003|11063799006|22082099003|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: vvWP7jXpuyo6hyICiUMJR0UCFuXM6QBqvbbViWjcozKxc3h98dzm5NkU1vhH/RBwG11lKvZOqvh/3FGbV4F4kprCQNE7fGpQ7FW0Tx7lGbPFPRbRW96ZHZAkjTlzVreyOOEWCcZ5Lw12Fvv4RSRGY6Xi/WBtZ5urYLAY/xMO/lsC+0OVqb66+ETEUgleJMi+6F6dAmFo8XsYdW8olqIgjhh6J7H1be9lkV4+FLDdizLH5XZlDNbV5QAUGTSA2LgfIFioTqiepTlpTDaI1rX93kZ6L5omLeqzTae4lAF8s2WctFoyyCXGbsBTolQlJsSw/2ybDCsBS70CUUzI3U/zK4DL0GUwnukOIWA88WDzVwJArcTwwFjAdkgMOJG4yvyoyEkXTUOHMahSu4uTRLP2MwdEcC1Coa6XQZKOYSY65o0vpKb41QVkbuHp3+fZCSlvdUsTJ+5AU6y5zRmZXMMh+mvXH8k8j7CN9dZyozAZEIQGf8UDPMlpXhXxy6Bi1fEcp35wLdoshJbMzU7W8bc133xThrAo8EgaXd2CMJsjcQvDbaK4v18uP0deEOSo+MO7jlodXiF+19OQlCwhwXmh+ACLSNTKT21D/gN+JpBSGvOd6eAhA5up31OYeoxMW37LrDzSOpPpwLVURMNzNRvrQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF46B98A11D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(5023799004)(4143699003)(11063799006)(22082099003)(18002099003)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFhlMCtUMVh2RzVVTVB4S09oczZnNm5Qb0IwQTU5NndYNHI2VnFBM0k3UU1o?=
 =?utf-8?B?RlVzZ25heFVvcXNTYmNGUXlmOVdPMVpSbjhrVHBQNWpSVVZQNTVsaEFoSFhq?=
 =?utf-8?B?eWZPR090Wnp2YUtaR0N2aTk2RXp1L2ZuV1ZUS0pxNzBRUkFaM3NIa0NqVTJi?=
 =?utf-8?B?UTMyQktTSkwwR21RM09RUEhCWUtwREwrWC9WNTYvSWJKYklzRUhCaW9EYWZk?=
 =?utf-8?B?NFErQzRPVUlkSmo0QzZFdTdHdmZrTElXS2xCNGpTSTkrS1dWR2tHV0hTdDI2?=
 =?utf-8?B?UUhzcG5Cc3B5ZWdUclVadk4yclNHNXFqcjF3aXVkS2FCYVVMbXBhKzV3NjNH?=
 =?utf-8?B?VnpDS3RNOE94MFRNdk5pSWFKSzRvb3ZsNTZRQnE4VDN6bWZhNjRnbEFsdGJP?=
 =?utf-8?B?UUdGQ1dWUVhVSTN2azljTXRTU1hWVTg2K216dm1kNWNDbzg3dExBbkswTGwr?=
 =?utf-8?B?VUpwSmlWamN0RWdyVHN4VzVWSTZITWIvbTBVL1NlRnZoZXhrOEFITzZGMytl?=
 =?utf-8?B?dEZFMXZocDAwUUtIaGxBek5vVFduSis5VHp2VHVqMjFRSnU0N09QQk1TZTFH?=
 =?utf-8?B?aGN0K2JCWkRFMmdBTVAzdXFsOHRrSTdDYlZuY1FKK2tBRlh2YmdNRHdqTVpW?=
 =?utf-8?B?SERTNlRHK3VwOUJKQnozS3BkWFFBUmNEOE1ySjlhbG1uajA2bW5ycjRmMmVL?=
 =?utf-8?B?emU1WTJVaWVSUnpZdVZOS25WS0lhdmR1dlVNaVl4MTZVZ2tqTVZHQlBubG9i?=
 =?utf-8?B?L2tEYUJsTWFFQ2pVdFZFWXdKZ1BpaFE4ZG9DaVB5TkhQMFh5RkFDb3lKd1ZM?=
 =?utf-8?B?RDE4ck9lZnBhb3Y3Rm42Q3F6MHA0VE1mUHNZNERRK3MwMDZ5ZXpBa2w2K1Nq?=
 =?utf-8?B?V2sxWjY5U1dDa1d5YjFRZ3BrajlnN0lRczdiNXFkdmpIVm9QVVVCdC83VTlH?=
 =?utf-8?B?eTFnV3NacW9sN3dnRmlKbk45SzJybjRNQnRvT0gvRHRmMlkxdDBqTzRjdDhV?=
 =?utf-8?B?bjFKUi9WN1RucHlsMjQxaWJxdGphSFJ0NEVCSWpyaURROWF0bGsrN0NJbmFW?=
 =?utf-8?B?OUpaekJwTjNuNnJRRTJrNWM4YXBKaG9hTnJCQ0JtT0JZK2NDdVdCeVFxbUw3?=
 =?utf-8?B?NU9WL2N6Nk1wbmMvQnFRRmZvbEpmbGlrWGRtQmp5NHYxV0NIQkNiYU9FY3k0?=
 =?utf-8?B?bFBnZSs3eVVjN0RxdkdldGg0cTloUldrb2E1RWJjS2tQb3h3MW4zYzlXcHQw?=
 =?utf-8?B?bWp6ZVZjNkJyODRNa3Z2amQ1NnJQWkxyLzBBNzZ4eWxGbkhWcWZSTE9qdjdv?=
 =?utf-8?B?YTZvUmFuUlB0akdFeGZkem1GaHlTSklZYm90aUdFWWdpTWRuY01QZkpranNx?=
 =?utf-8?B?RVhwalVtMWtkaVFlODg3cFZFaXJjcEtYM3F3MnVETDFlM0xqMkJidFN5Vkhu?=
 =?utf-8?B?d3VzSVd5czFrWDRMRmhRMllZZHdmSjNmQnkwOEV1N3FIRTBCRjROQ3V5cm43?=
 =?utf-8?B?eVZoU0FGVys4ZC9KYVNwK1VYcmxPWGJDS3VDYUZuL0hFMUFhYURNWlNSUWJ6?=
 =?utf-8?B?d3hCeHdMRzQrOWJseTdiZUNDd0RTM3VpdVJsaTg1RVNwQmhJZU44TUZUNGRY?=
 =?utf-8?B?M3RrVldINy9wYjdjd05GL3ZSamUvWC9ZQUFxWGNjZjZVbU1TUzMxR09jVEp5?=
 =?utf-8?B?KzBURk5XNjh2VVdGWmhtb0V3T25nTGhpQlpIS2wreHNPanI3aVFtOWR1azFk?=
 =?utf-8?B?VmlnTmYvMXQ2NXJWeWtnajVlUXNoSUFmdG9BSjhZclp4M0ZGbllvbHpwNW9T?=
 =?utf-8?B?cEJyWDhsQlJTV2pWVE5paHFxS0w0MUJBb3B0Q0M5Tm9icEF0SmpEQWord1l1?=
 =?utf-8?B?LytmWnJiVUtRcTA1ajRrUndEVGVYTm5vUGZ1bU51eHlyWUt1cjZaL2tBT2Rw?=
 =?utf-8?B?YzBjbkFyV3ZkdXRpeFNwMDRnSFRFUVZUa0dXSXdJSlJWajdSVSs4aDhnRkR1?=
 =?utf-8?B?RkI2MzhYL3BDR29abndzWlpHNWdBa0xHT2lnVEdranBwQVBJNStKeWFGckRL?=
 =?utf-8?B?aFA2QXorU09yZzY5U1Zla3AxbW5ZRE1EMERYZkpPMjdmS2dHYjI5SXRqN1Zh?=
 =?utf-8?B?bFFuanRhcDlZLzVpNE5vUm5GQlhTeG9hc0k0U2U1RWRHMTVVU013ZUk2ZVZi?=
 =?utf-8?B?Y1JwdFR0cVZDRHZaaXc0SmRxMTJsOFdva0RqdWlXbmpiMjhlZnVma2FpSVQ5?=
 =?utf-8?B?VmJ4UXZCdmlKbnhnbUE2aUxyMlp1dlJ2NDZIVUxUaHcxZlQvKzczamlWWmg4?=
 =?utf-8?B?Wk5aNlFBOGxvMDRsdW94Ni9xdHBMYW90UkVuc01FbldydTU0a1gxZz09?=
X-Exchange-RoutingPolicyChecked: IAI6W/F0wrLMO1AHSxTGow7UCZgahhVWwGgUIZ/XkzfnLdwnMxI8RL42NhHGssHnx9c0hvYWZYpLLOozqrJczWeJ5kEghf7zogjsfizbgd8aI04obkuThn5i1eVvR5aMSEmtxZjXpFwI+9JtKtAx0bJlJfl94+SDiH5SG2eORUD/WVxihwOJOn6l++o/NvrxQ/dJZrFrdrSgwIkT0w/sHEtkAXje13oKmJP0aWAaJu1z4paHxUqErnOnQp1KudhqsVcjkKzfIDAqoFrUps/tlReSobZQOQ/M4bxhfbgk4BXK+hk3AZSKq91N3vEw2pvsM91JAPM3ii03YPzlsiWShA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa8bb54-64ab-46cc-118b-08debc7eeeda
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF46B98A11D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 06:04:09.3264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T72PVgH2TECyXJZAmCkUNcve3vTzyubcEBUTmQ82C6X4Phw4UzI0PKfx5D0PIjeyOUdGOe6CLL2jIg74nVcYEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6483
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


On 5/27/2026 5:35 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/xe_pat: dynamic PAT index selection for 
> pat-index-auto (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/166367/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15266/index.html
>
>
>   CI Bug Log - changes from IGT_8939 -> IGTPW_15266
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_15266 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_15266, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15266/index.html
>
>
>     Participating hosts (41 -> 40)
>
> Additional (1): bat-adls-6
> Missing (2): bat-dg2-13 fi-snb-2520m
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_15266:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@i915_selftest@live:
>       o fi-bsw-n3050: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8939/fi-bsw-n3050/igt@i915_selftest@live.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15266/fi-bsw-n3050/igt@i915_selftest@live.html>
>         +1 other test dmesg-fail
>
This case fail is not related to the new igt case igt@xe_pat@pat-index-auto


>  *
>
>
>     Known issues
>
> Here are the changes found in IGTPW_15266 that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@dmabuf@all-tests:
>
>       o bat-adls-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15266/bat-adls-6/igt@dmabuf@all-tests.html>
>         (i915#15931
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931>)
>  *
>
>     igt@gem_lmem_swapping@parallel-random-engines:
>
>       o bat-adls-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15266/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +3 other tests skip
>  *
>
>     igt@gem_tiled_pread_basic@basic:
>
>       o bat-adls-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15266/bat-adls-6/igt@gem_tiled_pread_basic@basic.html>
>         (i915#15656
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656>)
>  *
>
>     igt@intel_hwmon@hwmon-read:
>
>       o bat-adls-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15266/bat-adls-6/igt@intel_hwmon@hwmon-read.html>
>         (i915#7707
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>
>       o bat-adls-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15266/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>         +1 other test skip
>  *
>
>     igt@kms_dsc@dsc-basic:
>
>       o bat-adls-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15266/bat-adls-6/igt@kms_dsc@dsc-basic.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>  *
>
>     igt@kms_force_connector_basic@force-load-detect:
>
>       o bat-adls-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15266/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html>
>  *
>
>     igt@kms_pm_backlight@basic-brightness:
>
>       o bat-adls-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15266/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>  *
>
>     igt@kms_psr@psr-primary-mmap-gtt:
>
>       o bat-adls-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15266/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +3 other tests skip
>  *
>
>     igt@kms_setmode@basic-clone-single-crtc:
>
>       o bat-adls-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15266/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@prime_vgem@basic-fence-read:
>
>       o bat-adls-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15266/bat-adls-6/igt@prime_vgem@basic-fence-read.html>
>         (i915#3291
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291>)
>         +2 other tests skip
>
>
>         Possible fixes
>
>  *
>
>     igt@i915_pm_rpm@module-reload:
>
>       o bat-adlp-6: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8939/bat-adlp-6/igt@i915_pm_rpm@module-reload.html>
>         (i915#15673
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15266/bat-adlp-6/igt@i915_pm_rpm@module-reload.html>
>         +78 other tests pass
>  *
>
>     igt@i915_selftest@live@sanitycheck:
>
>       o fi-kbl-7567u: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8939/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html>
>         (i915#13735
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15266/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html>
>         +79 other tests pass
>  *
>
>     igt@kms_busy@basic@flip:
>
>       o fi-kbl-7567u: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8939/fi-kbl-7567u/igt@kms_busy@basic@flip.html>
>         (i915#13735
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735>
>         / i915#180
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15266/fi-kbl-7567u/igt@kms_busy@basic@flip.html>
>  *
>
>     igt@kms_pm_rpm@basic-pci-d3-state:
>
>       o fi-kbl-7567u: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8939/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html>
>         (i915#13735
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735>
>         / i915#15673
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673>
>         / i915#180
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15266/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html>
>         +52 other tests pass
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8939 -> IGTPW_15266
>   * Linux: CI_DRM_18562 -> CI_DRM_18563
>
> CI-20190529: 20190529
> CI_DRM_18562: 11a8456527f00d86dc8b23035c324da194fbbadb @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> CI_DRM_18563: 7570b524ddecbe5db4af0c493a047e21bab6b3d6 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_15266: 02e26a03723e44ee1ab79b6477b993b35f681082 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8939: 8939
>
