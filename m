Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA48CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 17:31:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B37010E857;
	Wed, 27 May 2026 17:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n8a5yvGt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8D210E857
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 17:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779903084; x=1811439084;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZlpA6w2IaST5HwPB6vISWbmMVdU0vEbJkM2vTd/yDIg=;
 b=n8a5yvGte0kMnb+sLzoOgsz2bTUP080C3MMp8DibJUiLUhTa4+ap2DWE
 lYLmCFn4kbYxm7Kj5eB44BbV3X4raYOYP9pEaGiGLlbs8CFFEH7UE4aoY
 QQRs/IFX4htQxC1T1txikxLgh8Xuub2SVzWTRvtnbR0sn4pYoN2wNileQ
 oC4njdtw9MgSX0gso3uTcomxE0wl/sBmi/11SZe2MoPapVC9aXV2Zf5o0
 5wMEO+wcXEdfqWrebZsXQc5kllZF7BHk+mpmPSKhB/jks734UltBSj3R/
 UdT0HQY6Y00sWeNyIBeO2CjTYCekItDl+EWHxL5twCB2ob6SeaOT52Rd7 A==;
X-CSE-ConnectionGUID: eBFjFl6bQ7u2OhW7U5Ugbw==
X-CSE-MsgGUID: wYhfKmm7Tcyw2c/5ZMpQSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="79891957"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="79891957"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 10:31:16 -0700
X-CSE-ConnectionGUID: j5f5RdpGQw2FndOB04dD2w==
X-CSE-MsgGUID: 8HWe2VjMT/q30PnrYEf31g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="247255434"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 10:31:16 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 10:31:15 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 10:31:15 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 10:31:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkHOnncTmktWYZ3tuAAbQOHX/thAPNjwIf0COHsg9/mXw0pVxGerHhyc+vVib38Z4DOFBrI4vxIRubsLEMyvbtwJH9mL9MCxzGQQ+TuaEfxM3YTeli2fSRZV2AGimMlSk7jd/53grsxrBQZoOR5ngKSha65PyJxrdFe0W8cfc3+1tm+RL1OhfB46rnEFBiq2/Hr392rga0ziH1HA1mlsNc1lqDoVcdWoy0tiNIm/S3ITjDchRidmw1sgzcYqmsXr4ARyLQVtxpt0m22sHu3VsBqD4lr66PKgs4J1hoo3fJW1p6cWq/2QbY+vIOGaayRtkTUwUrw/63Rs9N8aWGIeXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocEThW1MUJOHZz7C8M5CLQexSkqFbGxucWrqjjUAVM8=;
 b=ycBGysOz2bygUqe62maeq/p18gR9NZE/sXxkOt+3GTk9NuKmlk1Bv9KaZB3NMB/2O3y2mMR2e+fUBBY8bEmUsLRD2FRHbOgptD1bhI0r2TOlo4P5kP5MNy/IMG8nR8KhUbow38RIEWRbzIZMu99ROT4dL0g/e4VtJ+WkZxCysHSkJOBg3tROqchJtUGVmre024RZwhwK6TA+injURdRC4F+4pqnRVWAJ0oa0pUyWLQy+6eCgpmKfCd1Y9g2Nt5EOw8uKZpDFG+BmNsIIj4XKYy7ov9NiOp6664qDBZQYUBXaAhEWJ19Sq7Qzp7fti15ujCKbXeN180ZMJ5Kpfqo3Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6678.namprd11.prod.outlook.com (2603:10b6:806:26a::20)
 by CH0PR11MB8085.namprd11.prod.outlook.com (2603:10b6:610:183::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Wed, 27 May
 2026 17:31:13 +0000
Received: from SN7PR11MB6678.namprd11.prod.outlook.com
 ([fe80::30df:f39d:e75c:da99]) by SN7PR11MB6678.namprd11.prod.outlook.com
 ([fe80::30df:f39d:e75c:da99%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 17:31:13 +0000
Message-ID: <79fe8838-4428-4b23-ba39-f8ea7c70a3f5@intel.com>
Date: Wed, 27 May 2026 10:31:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] tests/intel/xe_pat: Add dynamic PAT index
 selection for pat-index-auto
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <jia.yao@intel.com>, <x.wang@intel.com>
References: <20260511233622.2074382-1-zongyao.bai@intel.com>
 <20260526223655.81924-1-zongyao.bai@intel.com>
 <20260526223655.81924-4-zongyao.bai@intel.com>
 <20260527161028.bvdctzar4dco3g6n@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Bai, Zongyao" <zongyao.bai@intel.com>
In-Reply-To: <20260527161028.bvdctzar4dco3g6n@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0048.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::23) To SN7PR11MB6678.namprd11.prod.outlook.com
 (2603:10b6:806:26a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6678:EE_|CH0PR11MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: c51cc58c-02e0-416a-5a4e-08debc15c01b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|10086099003|56012099006|18002099003|22082099003|11063799006|6133799003|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info: DcME1GEHUIDJGHtDdGRgtSnSqE7FiFXlLVQu87ZGDE+XGOCmPWjUMtcnf19e062tWk/IJKDnviyU3Vsq83kcHQPJykQQKNnSz68/DDDZkFQU4W3YbK+qwK9J4sU/qhCWgX8BelEhfebggYOPiO1NSowlLyKthvul165PpVPA3/H5XQdyohZIwWA4clQFuzulEo/ggp5/R7Z0lSQlN+BiTozbjInsyqnIkhVIImwK5HHg+N6rNPjtANDa98Qz+FYbhjLqFqbapn8bD0vc5xrJjFQJbxLxTJ3RELPE6iKh4EMh2P9jBijx8t2ouW6ES82GsIzaNHjOrqLKtuGWWa0vlFSYKiKs3Rjy8HNE0bPf/lPG68A+tPPEJlkbyDB1unRiT8bZeMojzDwXi2lZzWitPHgPv6Y9yFEemBL9I28cl/vD4SOR+JbUNFkNAhDrwTV9ip/AmFzrjCDVMEtRRnVXcgCg2+NQNO7ZkISHJ8eMUZTetz4mWVHOOiw1THLAK4zi6IK3UEuD8oqTDAFcUR1GwY7DrDMfd9/v1tgeI3r6BgHzfHqkCTPPMYuURsY1LAfxBJreHMRvuAOLL8GQWyMvmIMcBCUfMa+Yjk+H+XKBRODGjwo2ezicuq3XxkrhIZAuZoPzTaFUFXRTqBSu+JeTlSMV97vl6/uEsJrhkjZfLwAKCQ6CtbWBKRuTlBP8JkMy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6678.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10086099003)(56012099006)(18002099003)(22082099003)(11063799006)(6133799003)(3023799007)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTJGSTBCbGFvTkJVTENIYnpJV0txNVg1Q2JsbkZTa3JTL05yWHBjVUxPZmVz?=
 =?utf-8?B?Nkx3eWVSTFZZaGlXQU5RTnBBeDVoeDF3V0ZxcWM3N09BZHpZcXFjeDV5ZnMw?=
 =?utf-8?B?MEZnMmtXN2pQeTdCTVc2VTczOEwwMjBDQWFmVzRyUDZIZVI3YXJxOXdvUE1M?=
 =?utf-8?B?cFQ5Sk1OUEJLVHFyRkw1cUhVOTV1cWdZalN1V1c1MjFRcGNMSnNGamIwZTYy?=
 =?utf-8?B?L1QzaGhQN3NWcXQ4bUt4VUlPZEVZUWxmTG84T0F1RmRFamVBOVNQc2EzSjRl?=
 =?utf-8?B?VHRQOVhGS2tBSVB4M0dDcFVmdjBsdGJkRStSNG5xUFFsdmVhazFJVXg3eFhU?=
 =?utf-8?B?aHhHUU1WU3Nwa002UCt2a2NCRHhDVjM3ZERYakxaVTl0Ri9wK1FsY1NwRjIy?=
 =?utf-8?B?WVBEcnBDWHZTb2dLNjZoQUpLeE9oeVpsdVVHZmUyZWFRZnZoMTJoSDdvb2Fa?=
 =?utf-8?B?Y1M1VlpZQkFJa3pEWkdaYUM4SE00YkhXZkY1ZnY5dnU2OC9GNEQvVGk3U1o1?=
 =?utf-8?B?am5BVG90bDNkZExudWVmaHQ4S0tDUHFZcUwwb2RNUEtwYkxZaGxHREc3S0xS?=
 =?utf-8?B?b1N5WnJnTzgweVNRUXVSeUs1NjRrSm0xbFAyQlM0T1YxKzBNU2MvRGhiRUFH?=
 =?utf-8?B?M2s1ZXd6YmJwWitlSVcreDhnTVVreTB4cndnSW5xcEVXMlVnL0d5eC8rMDhF?=
 =?utf-8?B?K0VOVWxzODBGUm1sYld6UTJHMEpybGxBTWlYSzFKWHVIVmducWlLbXlzTHRr?=
 =?utf-8?B?R3p3STNSVmZkVEdlT3hUTzJrdWlmbnVIclZzcEMrdHM1L2NLdTlNcUoyTnhq?=
 =?utf-8?B?WTJ2ektOOHFzakhuM0JZZ0d0R3h0WHZzcFhNQytBTGxUZUdXalNsOXJRSnB6?=
 =?utf-8?B?OFIxQkhKNjlPc0RUcm0xMzJ0aHR2WFJZYUdwRVZNM3V0U2Nhejlha3BLdXZx?=
 =?utf-8?B?bkNUSUxGQlpMMzJhOHZpVVlFVnZZVjg1QmVuTHFYLy9UcHFvbUVGVk85YXhH?=
 =?utf-8?B?WDg4d0t2OXNvVVZlMkZtV1RjRDlRQWNsU01pT0ltSUc4WnBKMmZSay91L1RL?=
 =?utf-8?B?UXR5SWQxaDB6cEJ0Z09QTEloYllOZ3VaYURqd0JqTzJ6RUsrYVZqM0RudkNU?=
 =?utf-8?B?ZGp0UHFhRThMS05VYjFJL0Izdm9iclhSM2gyOUt2bEY0TFFvNzU4ZnRUaHdl?=
 =?utf-8?B?WUtMRWJLNWVObXNLanB4N09UeXk5cmhnYWNaeEdSeE9oTEFzbnF5UXJ1Vys4?=
 =?utf-8?B?UGVaTHk1NU9iTFpzeFVlSS83MnZWS2RsUEExbklDMDhCMUgzejF6WDY3STA5?=
 =?utf-8?B?eU5BSGROc2FHRzBkLzd6Um9lN2JObk9rRmVUcVZnU1lOSjlCamJRWWo3UTVH?=
 =?utf-8?B?dmw0aFE1b3RtT1ByblFqZ1FERTVINC9jTXpaZ0gxMW9jYUkwMFFWL09URERa?=
 =?utf-8?B?dXNUam1YWUZiZCtMK1Q1YkNLMStDWktjUHh4RlpINTZPN0NUbm9BbW9KclVj?=
 =?utf-8?B?d3oyTHdna1RYSzRYMTZSWDBiZmxPRWNtcDBkVlgxbjRieWVGaVJVNWN0YldY?=
 =?utf-8?B?NjhnQTlaZFJUVGlkWVc1TzJDZGlneGhsQ0JvaXlNOUl2dWQ1YjV5cXZkaXlB?=
 =?utf-8?B?NXZnQzdhVzRTME1WUGRQa0pmOTh1Mm05aWNrKzVybmozRG1IT3NWaS9kS21x?=
 =?utf-8?B?SEZ6Z3FaRFZWQVAwenNhN2paTGtjdzFrV1JQZnUzcnhJYTZDUDVjeElhSFJ6?=
 =?utf-8?B?TDI0MlYxZDJaRXhZMEpSOFh0dlFwbUs5UlhwQkhsOWNzRFUvK0UxVXJrcyt3?=
 =?utf-8?B?U25lUDJOQzZuT1ZHVlFqS1ZmVCt4b3ZBSkhBK2dhdWZESlp6emJvMFBKTzMv?=
 =?utf-8?B?MEZHeFZWeWkyei9xRTNtQUpORE9NOVJaRldDRlh1Uy84ZEpCUUhTUTlRS3l1?=
 =?utf-8?B?UFoxeXJ3T3BKSXJRZ0M5UG9oa0p1cjFwNGR0Z3hzYlVJN3VUV1NwNnRwS21h?=
 =?utf-8?B?bEhRR1dtTGV2eHBnOVVKd0wvSlAzaVd0MnVrQ1dPTzBqSG1LOVNHTjhoVUF3?=
 =?utf-8?B?UjVTNE9CVU1ISHJMcXZZTUZnSDNFbE96WDcrQ1NxbHNYSThaaWhBTk1xb3pD?=
 =?utf-8?B?S09SaFRHU0xqZkh0WEhhTlgxc3lTUTZaRFJORWxaVW1GMVJ6ZDRIL1NJMmNv?=
 =?utf-8?B?YTJEQ1FFYW1tczdNZjhobFFHT0lYajdQN0tnY0dBSnlLN2VXd1RhVU52OUhG?=
 =?utf-8?B?elZVbDg4ZnYvZlBsUG5kOStEV2gzbytLWjZRZ1czNzNNai82Ukt4L2JTdUdw?=
 =?utf-8?B?aUFiTkgraHlRNk4yd0RicUJQaThveW5jVWkvVnduYXZkQ0JCYkxkUT09?=
X-Exchange-RoutingPolicyChecked: JhNsmKjvvadgtEYbW6QP+WarP/QxBaq+r49goX6JS1VKh6Uo8ZZdKPSOxcrurRxAd0fv9pntC0LonjX9bxqXfWSxyjvdHhCx3QSU3IRmQn3MLVZCg1PZ4nbwKlRu3ZTHhSZWYE8VkR0UvPOvPwr39NmRwPh1vmAvKkAkdBZuo43ENa0Do+MGsaaL2g2ls0xnl7kdr1440R8xmmyoHil1LydcDreVFWcMNKaP2gjWpAzW5HKFhkuzjKF4inNc39ZSbmQHlburGo5uUco+gMR8eqVt+G4BNIlxrIEbcAF9nOglmw0oRIJiqtEi76VVX7wqYnfYQWSfhgsvNIibCFIJjA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c51cc58c-02e0-416a-5a4e-08debc15c01b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6678.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 17:31:13.7747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3lJ1b9e+n9V0jdVEjc1mlU7KwzJgWqnymV52wT6WTBTVhKMtuBem2XvtCCKqgmA+KlQUvSQ564qGKEwXWrGVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8085
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


On 5/27/2026 9:10 AM, Kamil Konieczny wrote:
> Hi Zongyao,
> On 2026-05-26 at 22:36:54 +0000, Zongyao Bai wrote:
>> Introduce the `pat-index-auto` dynamic subtest to iteratively test
>> PAT indices based on the hardware configuration, improving test
>> coverage beyond hardcoded arrays.
>>
>> Build the test mode set by:
>>      selecting a small common set first (WT, coherent, non-coherent)
>>      adding all remaining valid entries (shuffled)
>>
>> Add pat-index-auto to xe.fast-feedback.testlist.
>>
>> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
>> ---
>>   tests/intel-ci/xe.fast-feedback.testlist |   1 +
>>   tests/intel/xe_pat.c                     | 159 ++++++++++++++++++++++-
>>   2 files changed, 159 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
>> index acff025fa..6851c1f49 100644
>> --- a/tests/intel-ci/xe.fast-feedback.testlist
>> +++ b/tests/intel-ci/xe.fast-feedback.testlist
> We usually separete CI changes from test ones. Could you split
> this into
>
> intel-ci: Add pat-index-auto to Xe BAT testlist
>
> Regards,
> Kamil

Got it, will split and send separately.

>
>> @@ -211,6 +211,7 @@ igt@xe_pat@pat-index-xelp
>>   igt@xe_pat@pat-index-xehpc
>>   igt@xe_pat@pat-index-xelpg
>>   igt@xe_pat@pat-index-xe2
>> +igt@xe_pat@pat-index-auto
>>   igt@xe_waitfence@abstime
>>   igt@xe_waitfence@engine
>>   igt@xe_waitfence@reltime
>> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
>> index 79f9a87aa..cff40d6b6 100644
>> --- a/tests/intel/xe_pat.c
>> +++ b/tests/intel/xe_pat.c
>> @@ -35,6 +35,7 @@
>>   
>>   #define XE_COH_NONE          1
>>   #define XE_COH_AT_LEAST_1WAY 2
>> +#define PAT_NAME_MAX_LEN     64
>>   
>>   /*
>>    * PAT index 18: XA (eXclusive Access) + UC (Uncached).
>> @@ -113,6 +114,7 @@ static void userptr_coh_none(int fd)
>>   
>>   #define L3_CACHE_POLICY_WB	0
>>   #define L3_CACHE_POLICY_XD	1
>> +#define L3_CACHE_POLICY_XA	2
>>   #define L3_CACHE_POLICY_UC	3
>>   
>>   #define L4_CACHE_POLICY_WB	0
>> @@ -448,7 +450,7 @@ static void xe2_blt_decompress_dst(int fd,
>>   	memcpy(&blt->src, &blt->dst, sizeof(blt->dst));
>>   	blt_set_object(&blt->dst, alias_handle, size, 0,
>>   		       intel_get_uc_mocs_index(fd),
>> -		       intel_get_pat_idx_uc(fd), /* compression disabled */
>> +		       intel_get_pat_idx_wb(fd), /* compression disabled */
>>   		       T_LINEAR, 0, 0);
>>   	blt_fast_copy(fd, ctx, NULL, ahnd, blt);
>>   	memcpy(&blt->dst, &blt->src, sizeof(blt->dst));
>> @@ -1345,6 +1347,146 @@ const struct pat_index_entry bmg_g21_pat_index_modes[] = {
>>   	{ NULL, 27, false, "c2-2way",     XE_COH_AT_LEAST_1WAY       },
>>   };
>>   
>> +static void add_pat_mode(struct pat_index_entry *modes_arr, int idx,
>> +			 uint32_t pat, bool has_comp_en, int pat_idx, bool cpu_wc)
>> +{
>> +	modes_arr[idx].get_pat_index = NULL;
>> +	modes_arr[idx].pat_index = pat_idx;
>> +	modes_arr[idx].compressed = has_comp_en && !!(pat & XE2_COMP_EN);
>> +	modes_arr[idx].name = NULL;
>> +	modes_arr[idx].coh_mode = REG_FIELD_GET(XE2_COH_MODE, pat) >= COH_MODE_1WAY ?
>> +				  XE_COH_AT_LEAST_1WAY : XE_COH_NONE;
>> +	modes_arr[idx].force_cpu_wc = cpu_wc;
>> +}
>> +
>> +/*
>> + * Build pat_index_modes[] test table dynamically from hardware PAT table:
>> + * 1. Read PAT entries from hardware
>> + * 2. Pick common modes first (WT, Coherent, Non-coherent)
>> + * 3. Pick random modes (shuffled remaining entries)
>> + * 4. Return the modes array and count through output parameters
>> + */
>> +static int init_pat_index_modes(int fd, struct pat_index_entry **modes)
>> +{
>> +	const int TEST_COMMON_MODE_MAX = 4;
>> +
>> +	/* Static storage for results - persists after function returns */
>> +	static struct pat_index_entry pat_index_modes[XE_PAT_MAX_ENTRIES * 2];
>> +	static struct intel_pat_cache pat_sw_config;
>> +	static char name_storage[XE_PAT_MAX_ENTRIES * 2][PAT_NAME_MAX_LEN];
>> +
>> +	int n_entries;
>> +	bool has_comp_en;
>> +
>> +	int test_cnt = igt_run_in_simulation() ? 5 : 16;
>> +	struct pat_index_entry common_modes[TEST_COMMON_MODE_MAX];
>> +	struct pat_index_entry random_modes[XE_PAT_MAX_ENTRIES * 2];
>> +	struct pat_index_entry tmp;
>> +	int n_common = 0;
>> +	int n_random = 0;
>> +	int n_picked = 0;
>> +	int i, j;
>> +
>> +	bool ensure_picked_wt = true;
>> +	bool ensure_picked_coh = true;
>> +	bool ensure_picked_noncoh = true;
>> +
>> +	/* Fetch PAT config from hardware */
>> +	n_entries = xe_fetch_pat_sw_config(fd, &pat_sw_config);
>> +	has_comp_en = HAS_FLATCCS(intel_get_drm_devid(fd));
>> +
>> +	igt_assert(n_entries > 0);
>> +
>> +	/* Step 1: Split entries into common_modes and random_modes */
>> +	for (i = 0; i < n_entries; i++) {
>> +		uint32_t pat = pat_sw_config.entries[i].pat;
>> +		uint8_t pat_clos = REG_FIELD_GET(XE2_L3_CLOS, pat);
>> +		uint8_t l3_policy = REG_FIELD_GET(XE2_L3_POLICY, pat);
>> +		uint8_t l4_policy = REG_FIELD_GET(XE2_L4_POLICY, pat);
>> +		uint8_t coh_mode = REG_FIELD_GET(XE2_COH_MODE, pat);
>> +
>> +		if (pat_sw_config.entries[i].rsvd)
>> +			continue;
>> +
>> +		/* Common pat index type 1: WT mode (l3=xd, l4=wt, coh=0) */
>> +		if (ensure_picked_wt &&
>> +		    pat_clos == 0 &&
>> +		    l3_policy == L3_CACHE_POLICY_XD &&
>> +		    l4_policy == L4_CACHE_POLICY_WT &&
>> +		    coh_mode == 0) {
>> +			add_pat_mode(common_modes, n_common, pat, has_comp_en, i, false);
>> +			n_common++;
>> +			ensure_picked_wt = false;
>> +			continue;
>> +		}
>> +		/* Common pat index type 2: Coherent mode (l3=wb, l4=uc, coh>=1way) */
>> +		if (ensure_picked_coh &&
>> +		    pat_clos == 0 &&
>> +		    l3_policy == L3_CACHE_POLICY_WB &&
>> +		    l4_policy == L4_CACHE_POLICY_UC &&
>> +		    coh_mode >= COH_MODE_1WAY) {
>> +			add_pat_mode(common_modes, n_common, pat, has_comp_en, i, false);
>> +			n_common++;
>> +			add_pat_mode(common_modes, n_common, pat, has_comp_en, i, true);
>> +			n_common++;
>> +			ensure_picked_coh = false;
>> +			continue;
>> +		}
>> +		/* Common pat index type 3: Non-coherent mode (l3=uc, l4=uc, coh=0) */
>> +		if (ensure_picked_noncoh &&
>> +		    pat_clos == 0 &&
>> +		    l3_policy == L3_CACHE_POLICY_UC &&
>> +		    l4_policy == L4_CACHE_POLICY_UC &&
>> +		    coh_mode == 0) {
>> +			add_pat_mode(common_modes, n_common, pat, has_comp_en, i, false);
>> +			n_common++;
>> +			ensure_picked_noncoh = false;
>> +			continue;
>> +		}
>> +
>> +		/* Add to random_modes */
>> +		add_pat_mode(random_modes, n_random, pat, has_comp_en, i, false);
>> +		n_random++;
>> +		if (coh_mode >= COH_MODE_1WAY) {
>> +			add_pat_mode(random_modes, n_random, pat, has_comp_en, i, true);
>> +			n_random++;
>> +		}
>> +	}
>> +	igt_assert(n_common + n_random > 0);
>> +
>> +	/* Step 2: Fisher-Yates shuffle on random_modes */
>> +	for (i = n_random - 1; i > 0; i--) {
>> +		j = random() % (i + 1);
>> +		tmp = random_modes[i];
>> +		random_modes[i] = random_modes[j];
>> +		random_modes[j] = tmp;
>> +	}
>> +
>> +	/* Step 3: Merge common_modes and random_modes into pat_index_modes (up to test_cnt) */
>> +	for (i = 0; i < n_common && n_picked < test_cnt; i++)
>> +		pat_index_modes[n_picked++] = common_modes[i];
>> +	for (i = 0; i < n_random && n_picked < test_cnt; i++)
>> +		pat_index_modes[n_picked++] = random_modes[i];
>> +
>> +	/* Step 4: Assign simple numeric names and print debug info */
>> +	for (i = 0; i < n_picked; i++) {
>> +		snprintf(name_storage[i], PAT_NAME_MAX_LEN, "PAT_INDEX_%u%s",
>> +			 pat_index_modes[i].pat_index,
>> +			 pat_index_modes[i].force_cpu_wc ? "-force_cpu_wc" : "");
>> +
>> +		pat_index_modes[i].name = name_storage[i];
>> +
>> +		igt_debug("  [%d] idx=%2u comp=%d coh=%u cpu_wc=%d name=%s%s\n",
>> +			  i, pat_index_modes[i].pat_index, pat_index_modes[i].compressed,
>> +			  pat_index_modes[i].coh_mode, pat_index_modes[i].force_cpu_wc,
>> +			  pat_index_modes[i].name,
>> +			  (i < n_common) ? " (common)" : " (random)");
>> +	}
>> +
>> +	*modes = pat_index_modes;
>> +	return n_picked;
>> +}
>> +
>>   const struct pat_index_entry xe3p_lpg_coherency_pat_index_modes[] = {
>>   	{ NULL, 18, false, "xa-l3-uc",	 XE_COH_NONE          },
>>   	{ NULL, 19, false, "xa-l3-1way", XE_COH_AT_LEAST_1WAY },
>> @@ -1414,6 +1556,12 @@ static uint32_t create_object(int fd, int r, int size, uint16_t coh_mode,
>>    * Description: Check some of the xe2 pat_index modes.
>>    */
>>   
>> +/**
>> + * SUBTEST: pat-index-auto
>> + * Test category: functionality test
>> + * Description: Dynamically generate and test PAT index modes from platform PAT configuration.
>> + */
>> +
>>   /**
>>    * SUBTEST: xa-app-transient-media-off
>>    * Test category: functionality test
>> @@ -2275,6 +2423,15 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
>>   							     ARRAY_SIZE(xe2_pat_index_modes));
>>   	}
>>   
>> +	igt_subtest_with_dynamic("pat-index-auto") {
>> +		struct pat_index_entry *modes;
>> +		int n_modes;
>> +
>> +		igt_require(intel_graphics_ver(dev_id) >= IP_VER(20, 0));
>> +		n_modes = init_pat_index_modes(fd, &modes);
>> +		subtest_pat_index_modes_with_regions(fd, modes, n_modes);
>> +	}
>> +
>>   	igt_subtest("display-vs-wb-transient")
>>   		display_vs_wb_transient(fd);
>>   
>> -- 
>> 2.43.0
>>
