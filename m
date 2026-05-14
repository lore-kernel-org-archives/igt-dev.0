Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530C4CD37AC
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 04:35:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9C410E35B;
	Thu, 14 May 2026 04:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jUqLEhoP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B4110E35B
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 04:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778733339; x=1810269339;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LFXyua/arVu+K6Are4pmH95eqyGLtIG552ZGoI0yaV0=;
 b=jUqLEhoPOGhZs22L39OQ5z7EZRnEK2TAGm2eLbvR1fSPrqRobs8FGugR
 0EAvffkVHvV9duTJKJiuplQA8aScQK9sIgU7PUy+a1txlYQ4/9MnqbaP2
 x85LgtECfR8qaAX5FBgJZYyo5viPwbY/b64ytfJ9uLLS8jhsGpdMI7QtT
 Tm13HgUwVNJoTMPmUC7haU4p+JYdF1kce3R0bKWB68gaFDANZsbr5Uz4h
 Q0VwdqOXmK1ASp+n3mXBY/UY/cNYNqAIY7eauQJj/vNE6Czzs0RBM3SVW
 /SyFbF3g2vQokRAwO3G7gOiKXb/j7uSYWqf7zxnWfLM39ILJJfY2hmWcH Q==;
X-CSE-ConnectionGUID: FhdtdgyRSLK+vy4sp8/7Vw==
X-CSE-MsgGUID: GjIHb0GUT06svup4bEjWWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="78693598"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="78693598"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 21:35:38 -0700
X-CSE-ConnectionGUID: iy0MVCpeRbeO1BXVFMkn4Q==
X-CSE-MsgGUID: ziwNGb8/R0exdy38odZu5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="242606979"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 21:35:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 21:35:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 21:35:37 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 21:35:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vu5+mP6thmNScgwyqdvntvgkIKv4oewxYGtwtr7yk9EZWL/R+7+MdQH3VJ5HyzQCHNV49TicAZXaJqiZzyjLsd55JdLL25IIqhfdJ8CqQy4chOqxrZwCkNNIE36soERZOe3o9S4lKfqzFHg9GPz3WuIXHkHpDN9VTvRAq2NFUA0AwVRDE4watBnl2pjMHXKUySEBrOsmE6h84SbLggH1x045cthBHiXq4ALBQ1mTSUIbIwjpPyA/14mZ9o1SPEWq5RSb2e7OEyjMOFZ8DSACaAWHuoku02jrCi4Dwk4HC0Kchra6Q1BaTjdAn9uUMA2ep4YkijGG+v4OwF/IsG4nhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTR45iMMcPdy6UjZeO/yrYZigpcNozzLbrsNUQHTCPE=;
 b=TZxg//x8YXQamwEvnM791XAOpg4uNL7obf2AWFgV4UAKuBouDFqm/8Cv6Z7fH6OtDxRGI614flf7g53GLghPwyv99iXuY2kxcH1ojL+Y3bdsV8m6p8D1ZyW4a5eLng3YMokE6c0T2aB1qizrwmrnm2JU0COcp8VrMJgj18QP8nNhLKC3KgJ2ANBE0tKHnsljwFevPLIy51FCHrO/GS9NSvmh33MCuBPbW0TTBEC7/3MLMufXLPATcCE6LkalypVaW8mN01oJoqX+u8WxiNQEwBi6C6UB2sojd0raY45wZ7SbVz6d0s34SCKv2FF5W+AzRlUtgSRrpepFpOb4Jf4SIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 DM3PPFD2F4A0090.namprd11.prod.outlook.com (2603:10b6:f:fc00::f50)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 04:35:33 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 04:35:33 +0000
Message-ID: <2c3ed615-07a0-4d29-ae25-9d8a0ca0aaf1@intel.com>
Date: Thu, 14 May 2026 10:05:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 13/25] lib/kms: Add display->format_mods_async
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
 <20260512122143.11013-14-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260512122143.11013-14-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::19) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|DM3PPFD2F4A0090:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc01804-1484-48dc-1b6d-08deb1723ca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|11063799003|4143699003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: QrTUVmxg0eWvubm0yG8uxvh2eZya2rRwB79K0YorHtmT2NXxhwcSQMSn5eC5NDrwhLBrunsewCCSI4qJJoHxOTPwxSObDfUjIK97NLPrlUZH0NQaY557otNqkToaE4O7b1BkMdr244+ipmQwHe0hD+PWgOvwrUE4Bp9w/pJIJfM8NYdnnwCvvbxNRqDECYvHCOzvL/Dw2oj2rlYhFyG23kClMNSuja9V/Ywo5bUcvVwnsedUowfG/6RSnl7wiNgcCGmC9mIKpMMv/ECs7Qrj9gEEIfirrGuJNIzsMosAYoQnQugDWvlN5cGjOXmKjRPoPTEBqkv0ClJNtazZghanhnBTP0UnOsJS4ChCYRwP0tLwuB6ZNkx4Eg+6KYW/pVK2M0/hVL81RoCsiP8nDCK3+18qGnG614QBq2wZXsXqrqrJUgCrIYC2Bih8E/aN+RsaCpUxtU0u7u5+KvtePacwsBV4bj4Jur9uEdQ/V7ydIIMROTE/V4HQLvzYEGRdSb3cf1re9js1ZXdEIGtp8a0iHIqltjTpV0LT6XWpPcuEgGKlAG9753Px8Kquk4TokC6n8/Ti0CTWBNGrYlZKkxht+V6VZJJe9ZFW1OhePK4T4iCQssg8Lc0bU4xVecisM197l492D5tKaQcD3CJ90pE5Wr8iazSlRlOFCenVw7IxopOT98622UhYh/zuh8xnXxA5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(11063799003)(4143699003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1pNQUdNVGx3RzFpTkxkVEVkcXUyL0hkQWdaK3k3cXFxYytIcXhxeHYya0Nu?=
 =?utf-8?B?ZW9FODQrL0QrRlh2UkFtdFhYK0xGQ29zVC8rUlNJNU01MEc5VWNEWXhocnJo?=
 =?utf-8?B?ekcxU2JJbGhUei9tZmpMQmdqTFNJU2J4UGV5UzZRZ1Myd0FYZmZRaTR5Z3R0?=
 =?utf-8?B?YXFSL3R0cUNSbnI3WG5pd1AwcGZ1R210RnlEZlN3TnVuemZxYU5TZ2U4T3BW?=
 =?utf-8?B?dTNVSGJvOVZiTlB1b1ZtS0hjcmNYcTlwT2grajhYU2sxbURzOElEcE9BQllr?=
 =?utf-8?B?Yk94SGUyQiszb2NQQ0FHT1NwdmxlVzZROWZRYXAvc2N3alJsdElPaElWNHJa?=
 =?utf-8?B?TklFNEg3ZWRqMkJibEVxdVYxcTdqSEFiWW1sa0Z4aWlQdW5idkhPdGg2aU5v?=
 =?utf-8?B?dVpSRCszdGNCZUcwODVRN09DMDlPV0oyL0dORzIwQ2V5bm1OYTY5MmtRdDlU?=
 =?utf-8?B?WE9kWVZOUDFrQ1FwTm9xLzg3R2R5NzIwSUdGeDJqakRpd0MzM3M1cFFLZGVU?=
 =?utf-8?B?a2daaUJqT0NVVy90c2szVlpjT2FTY0ZSakMya2dZSTR3dUVKcjc5a1RkdWhE?=
 =?utf-8?B?MVpCbHhmWi9RTW1jTzBNUnZ4eGhDbEp5ZWtBQnlrMTdpUzh1S2xFVnk3a2ti?=
 =?utf-8?B?WnhSZ2lpV1ZrdmVGK0RLbkcyanJKTjNPWmNMc3FibVk4TDJ2UXArRXYxVkFz?=
 =?utf-8?B?b091WTVNSFlpWG5aQkRGMjJ5VmZ1Qk13MlFnSzMrOFJtTEFDWDBSbUowRnda?=
 =?utf-8?B?Y3hOczFvWmp4MnBCR0JSWjhqS29sZThVWXNickl6cEtrdlRZOENMQVZ3TWdN?=
 =?utf-8?B?cjU1b2NhallsaW5DNVd0S1RhS3g4L3RmTXRHQ0RHZWQyd0hGUjNSa2drcng2?=
 =?utf-8?B?V0M3SWpZaEoyRjk1RFlnT1ZYeXBrTVAxb0xOeG1tUGVIUHNsSTBHdG5lYmRt?=
 =?utf-8?B?MnIzcmNISm1naVRaT2czUlBjZStVKzlQMTIvRjZETG1VSzAvV28xS1FuZFpM?=
 =?utf-8?B?RFpHUkNORjZBRnJMSlNoNkxxMVVQVjBJRkZTdTIvSUgxMi9KdGxXZ20xd0w3?=
 =?utf-8?B?YkRRbmR5UGtUOEpmZzRJSkZyNVVKeUtyamlFQVM1aXNDU2duR2l5UTVlcUlq?=
 =?utf-8?B?dU1ob3NlaUpOMzV1K1JRUGtFNGYxZnNwSDFnRFQwSzJkSU1NZHZON0lqb2JZ?=
 =?utf-8?B?N2o0RXVXQmJPaFBsV3Y3N2NUMWRrUE5ScEVJbGxyTEJVZXUrYWlMTUFabG1h?=
 =?utf-8?B?ZmZRRDNJZEtoYVFJZzloUE5iRDk3VkpJbHkwcXcwMWRnalVSZVo4Z3d1RjBo?=
 =?utf-8?B?QUJlS3hqRHl0aCt1R0hoZXE0NTMzazh6MjRRTFNjSWFwR2VVdWVsUC85ckRu?=
 =?utf-8?B?cUxObUdXM00yTjFzcWtKRnlxanRjZEpibHl4Y2lyR2t2RlVPcE9nVzhDb0xP?=
 =?utf-8?B?cW1ualJGZ0NxNGtuV0xvWkg3M0g2NlE5dGlmTDlyanhhSFBKd3Z6dVFBcm1l?=
 =?utf-8?B?NjV1ZkF6MWQwaFMzTitrbzkwcXlrZWhXTERPRW8vTC9LU3dRRVpuVGw4Si9G?=
 =?utf-8?B?WVRvaElFc1d3L1k2NktUSkRHektlNnpZNmMwREpHeVdHeklvS0pnNnNOeUdj?=
 =?utf-8?B?VUVtQk9BSkdEdHdBSDRwWXFwdUxpNjZ1amNqTWM4UHJ4SHFtNmY3WHRraytN?=
 =?utf-8?B?VHNlNU9UVDM3aEtyU3krQ01Hd0FqcjdPemd6R2xXSHRWM3ErbzdzRU9CQ0M1?=
 =?utf-8?B?dmpReCtveW43SGt1QjVyZWtSQUtNOCtSeTRGdmpmRUNldGp2dTgwY0tLZ1RG?=
 =?utf-8?B?NkxQL1hVb3BSa1YwWnV6RXZIZFBxZ2ZLd2hWMUtRZnQxZVpEaWtQa0JqWDVJ?=
 =?utf-8?B?dVp2eUtnWUhyRk9Ldmd3TVQyNjk5Tlhud1RtRXBxaXYxZmI3eVVVbGkzSG9Q?=
 =?utf-8?B?amFKMkNzdytDbnk5dFo1a0UvdnpESWI5aWNvWVdVN3FLTnpYT21iVHlKMlVW?=
 =?utf-8?B?Y2ZOLy8vcmdtZkM3ZU5aaStvN0FDOUYxNnhwZStaeHUvOUQzaHVHK3FHTDhY?=
 =?utf-8?B?c0JEbjNoSGc5OW1kNjFaYWxZc1cyTlJtVGJOMTcxMzhmRkNQcmQzU0doWEFC?=
 =?utf-8?B?cE5qRTlBVUFQTVRqWnFEU3FXNEs1RHFRUk9IWVJ6bVBCbWM1WmFsMnMzQWdy?=
 =?utf-8?B?WjJnblhXc2JlUTdsUVlramRzWGg5c2xEbUZ2WkVTck1CUHVJUkh3Y2tBemNo?=
 =?utf-8?B?Q3NMMEtTbVB2VWx5R2hEQi9Wblgwd29va1RlWVlGdnZJbGFUWXhIQ3BRc05C?=
 =?utf-8?B?TTRNTEZpYTJXcUFhNXRySkt1RGxrL1oycXloZFl4TkZvdG45R0N6YWJQYXZW?=
 =?utf-8?Q?RXKaLl71N19q2TU0j13UNHtDwKfrM6DaTAPvX?=
X-Exchange-RoutingPolicyChecked: MHr615CEcZmd0KJuAJkqe2aJTaBJum0ippB7evkUzGE/6TWb56P/C4bQqyGvqAq5nb298+T4GXFKCJCPBC5eRmraGPgumPG+MaFszyUI2xJZiII4YJRa0AkvcFZ9jtTSUxFxg1pjj7ch3CRTDvq6fCRkJEj+PFdQJFkwTkjTk+hppD/htF5vBIo0Qt+4MwAhV6sTn5TlWNH3FLVZm3Hp7j/+lLHGscm2oMlhLfheODAg3lj2IzMn9oO9h6kYyUjkoDaRZywcCgPeza21ZQBQiziz7Udq2fszb0CWqotcM/B/LWkfVAYp+XG2Vnd7EErBW76euqDkc4X3Z/qlvlN4qQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc01804-1484-48dc-1b6d-08deb1723ca5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 04:35:33.6630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YnGuY7QDSCEandAPMd2br5MWXzQ2hkLLzftXEOQwAznhLO1KV4jUDkp3TbveM+XnVNiq2smo+rhbbchhColqswKTVZNfiynYy7RVGYZWKDgWfeuG7mZ2I8Ypp/lfmQv6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFD2F4A0090
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

On 12-05-2026 17:51, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Create a display wide union of the planes' async format+modifier
> lists, just as we already have done for the sync format+modifiers.

LGTM
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

Regards,
Santhosh
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_kms.c | 6 ++++++
>   lib/igt_kms.h | 1 +
>   2 files changed, 7 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index dc3486a795a4..ebc13063dfb0 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6385,9 +6385,15 @@ static const struct igt_format_mods *plane_format_mods(igt_plane_t *plane)
>   	return &plane->format_mods;
>   }
>   
> +static const struct igt_format_mods *plane_format_mods_async(igt_plane_t *plane)
> +{
> +	return &plane->format_mods_async;
> +}
> +
>   static void igt_fill_display_format_mod(igt_display_t *display)
>   {
>   	display_format_mods_fill(display, &display->format_mods, plane_format_mods);
> +	display_format_mods_fill(display, &display->format_mods_async, plane_format_mods_async);
>   }
>   
>   /**
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 35923f94d7ff..e02c5dd25d16 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -535,6 +535,7 @@ struct _igt_display {
>   	bool first_commit;
>   
>   	struct igt_format_mods format_mods;
> +	struct igt_format_mods format_mods_async;
>   };
>   
>   typedef struct {

