Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B108DC55174
	for <igt-dev@archiver.kernel.org>; Wed,  5 Aug 2026 10:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470EA10EDC0;
	Wed,  5 Aug 2026 10:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B4V4w3lN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E096110EDBE
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Aug 2026 10:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785924395; x=1817460395;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=usOxCl5JgUbbiQ2hceM5JTR09uC3kwappc1fzTEt4NM=;
 b=B4V4w3lNtAIG5gujcaP7j2SzheOPVu6EATvEgJCUccDoUsbuJULiRrL8
 iQ84ezb74FHfANCxG0d79NRVYaS3hiSMmESdvG2FSn7OEIMxV+V0wJpJz
 YShAhu2fsyFNg2W2EHCJs1wa31PMgCkjLZDouSvubnqVqkpzmgrTQ2/BG
 dVZWMRdnyY9Q1swfQEQkwUfAVF9lwf1wZtt6MtRoZ8kiNUbK1Q/qr+1ub
 6zNsCcvZvWotGGO+65SzMXwx5oqyS/ajtgMz4J/WNebEl9klfumlnz/Sz
 2l2BvL8Wh20xqcNhzK9LT3+6GenVuRVm5CvENN3FoYOlHhIB4YCVqj5mp A==;
X-CSE-ConnectionGUID: lrSS2hiTQ06BATkN1W54zQ==
X-CSE-MsgGUID: HivPeXxHSdaqJ8tiTcr0PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97088678"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="97088678"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 03:06:33 -0700
X-CSE-ConnectionGUID: RaI8Pm5xRVukCeZDdLc/fQ==
X-CSE-MsgGUID: ZTQ5hXNySgW7tDk34MXgEA==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 03:06:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 03:06:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 5 Aug 2026 03:06:33 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.34) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 03:06:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uF1svHv9/wP35B0pHpsBFCRvyJ8MaYWH7EDguND/qzJzWFFOg4sYOyCzKnVb1Sgei0mylIRUAw0DAoTUh06XooQNYn5Jt0pRUPD9CINZfKMSsHPwouu2k0O1kMmCeh7/biEYgs7xjcm7yv3EOagvQe5znChaqCLybiLpIdcpXtcGBoLgx0d2mEpy6ERdw8fI2wHt3ZLk5NdAI8HIN7pS4JCIR+B5v/H5HY5BHKedmJ/2cuW5FJREjvYTRtABzmOHq+SWZvp2TOCsjfcm5MTUwo8HafRp82zIqf0/1KvXG5CqqgnBi/UJ63AShWHtwjAxZfP/4Ua3bVw/j1iY8x6ToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKU5A23Ya4Gc7ixe+lgnhlu8I/9nMKlQLrHA0myxQZI=;
 b=NM0YOyL2EemQi6fhfiiNcX/IOH8TXG8cvXw0Mro/p2uL2AcME9phqpSvjhOLT+milkwT2XyMWv1tarNMPewgH4pj1rq0Idq9laINqNAAbmAm6n6PUcJW8h7Dzc+LPdPkWxEQjLfsJqn8RwjtSNaOgCc6hdxgPH5r3mwFoXRk8c1WR1RK31SVZ52mwWXs7diBMZkS52zgmNvkcS2I3O2H6DfjbwpX9F6eQzZBXQnzj9RoA3OZmeU1z6NFdnVa2Dlui4v4lLzHBNSm14XDcXNjvk85QUWhckx+eZ+/Dms5dd+1hmSa3WHujlQRHB+svAFvujUr757DDmXEKomzdwpfrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8483.namprd11.prod.outlook.com (2603:10b6:408:1b0::7)
 by DM4PR11MB5261.namprd11.prod.outlook.com (2603:10b6:5:388::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Wed, 5 Aug
 2026 10:06:30 +0000
Received: from LV3PR11MB8483.namprd11.prod.outlook.com
 ([fe80::1b9c:4b:c780:82bf]) by LV3PR11MB8483.namprd11.prod.outlook.com
 ([fe80::1b9c:4b:c780:82bf%3]) with mapi id 15.21.0270.017; Wed, 5 Aug 2026
 10:06:30 +0000
Message-ID: <62ee077f-c5bc-4e79-8270-97c47d657d5a@intel.com>
Date: Wed, 5 Aug 2026 15:36:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci: Add expected skips to VF/VM
 blocklists
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Lukasz Laguna
 <lukasz.laguna@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>
References: <20260804162019.628281-1-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "Muppidi, Venkateswara Rao" <venkateswara.rao.muppidi@intel.com>
In-Reply-To: <20260804162019.628281-1-jakub1.kolakowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0145.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::7) To LV3PR11MB8483.namprd11.prod.outlook.com
 (2603:10b6:408:1b0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8483:EE_|DM4PR11MB5261:EE_
X-MS-Office365-Filtering-Correlation-Id: 052a7b94-b0f6-4a06-f9c8-08def2d9383b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|56012099006|6133799003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: l4zyQ8P01gMUJP7KD0XiruIQEj7WIOsFUmDDyME8YrFaowq9Ij5zOEgd0I9HPxOVs8JajxxWgRTjt8GMqX4itSj1XC6oXmrdI/w4MlHO+xkW4IhO38W2qBbqmG5zGWStvD92mqjwuxXGLQPRIn4GFFqytyK/3fAljHe9qEaXjK9NEH2CyL0ypdkOoXZOj2GPzDwdEkbQaLKcthabl6k0ovdNeevVZxO55gcV6/x3quzL4bnMf6Njnc/LmDKLW0jdfQhWcTn/O9vKIuxla4PEW7Jn4a3l+isf5C7lMfCepJ8k7wP5sBkiJ+fjx/6errphmY7bU8Hg0SjoATelG6bBdI+dXWVjJJQfs+VPSyHICHRrGmq5G5QcpLSkvr7X2HZKUoVs03nVpsRusstnpeWNs7EkaTcMA22+mO7C2QHhuFYLt6/+l2BYhaoFC/Wi27CEb3I39epNGbF+jjvFgG833Nk3NOe2yHNYIvtLi88W9pnPEaQkRIbdNaR2P9TW4zfRHywXUDGq3OpX4fCJlVw38VKOWx2x1W6FPCDzfAC9URtyvctg4nL46jnWraSdwfFZHW+U7i56c4a9lk8hwxrewnun3sr3NQqR5shaK/jDX7FF5AodOjfEjfytwYfBv3ATdHDboJFYhMX0QrvsxhzYHAsOeNgdRz8IFW/dtDcxod4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8483.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnQ0RmZ6L0k3TDR2SkNudm1hVVFkWWpLU2pnbm9rOFlpWnBIZTFtYmJVUGMx?=
 =?utf-8?B?ekJndGFvVktkZXpZRjBsSm5DS05xZENlMnZQRHhvZmkxcGtucjFpN0dIanln?=
 =?utf-8?B?SFU3Y0tDeUV0TXREWFdSb2xVMUZxalJyZWdNVkNFZjVoaVladlZ3eWFMRWJY?=
 =?utf-8?B?MU5RZlpwbXhjOFZFYnE3U3BvbUtpUmVFa1RwQjY2K3l6bVVUL2VGNnFGSnN0?=
 =?utf-8?B?ZURFMVVkbWlEdTJyWUJrSi83c0ZZeUkyaUgrWXJGUjhRWjhnQ3I2TmFFRWR3?=
 =?utf-8?B?VVRjN2kxSUdXd3AyQXdlQWtsQS9icnNQenU0Sks3U09menBKVUp6RGg2SU4r?=
 =?utf-8?B?alhpN05pdXBhU1lqS0VBallUcW5lVXFpdGNzOTdvUmIweUR1ZElxbHZLNGJO?=
 =?utf-8?B?U1ZOdDVFZFdVbUM4N0x4S3NtS1lOcitzWHVUV3p5d0lzN2V3aFREb1c3eDF6?=
 =?utf-8?B?eDJObFZtOUcxMjhwOFFhQVBNM2d5bk9SNGsxdWh3RkVTa0tBMjYybCtlUlRh?=
 =?utf-8?B?cC9zV2p6Um83U0MrbS9NRTl3MXpPNjFEY0pBbDQraVpZV1pBYzJBN25jTXVx?=
 =?utf-8?B?N3F3N3BBK2doK1M3K3FlelZJbDFCQjFVU0tDQ3ZXbE9qZjB2UHdhWWlZNUY2?=
 =?utf-8?B?Y2xHVi85Uit2WWlIQ2hZVUNnMjErbDN4SFdKVEt3Kys4VVJha04wd0hqa21u?=
 =?utf-8?B?WVZMRm5RS3doUUhlY1dYMko1cXNRUmNnaWdtbVd6dzFlTlZPdGhIbzd4SS8y?=
 =?utf-8?B?TGwxQmUwSFg0cThUK3gyUGNhRmVyN01tMG1Sbm9nM0k2dFBwdWxDN3B0WkY5?=
 =?utf-8?B?STA2QmtKY2F1K3J3Wlg3Q0lHb1F1a2V4ck1YQkRVbFpEWGV2c0NOaDBXd0l4?=
 =?utf-8?B?L2dwZmVnOGd3UjNjVWVzQ2wweHBsaUt1Y2VtUWNnaWlQVU5xOEI0VEQzbG1R?=
 =?utf-8?B?eUhYdUU1WHQ1TjZ5d3RYeHNmRTh5Mnd5YUNTZnhncmx1b29iMndCWHZ2Y0JT?=
 =?utf-8?B?b3pSaVFYUm9UeWtzZGF0a2Y5UDFPTkxBUHpYcTlLZjVRU090RmZER3RKVmMv?=
 =?utf-8?B?S2EwaEFhRnN6eFpGbWdRUkJDUG9DVWg2N3FMYkpibXFBRkczbmtzdTBIcTVL?=
 =?utf-8?B?VFdCUXpkUzNUYW44RjkzbWtieXB0Ui8wOXlNTDVsK043UFpuc0VmQ0oxZ0NQ?=
 =?utf-8?B?VzczQW1RZysxc3lHZlNwQllmVlJvWExHdzlBa2dDRUY4dWZ3VzhEdUZ0bGJq?=
 =?utf-8?B?MDM5OFNVbFNDdDFHZ293VURYVGRnWnNwSzFUbStZOTk0NXFHTDg2b2JhWjZo?=
 =?utf-8?B?cGtxaEJ1d0QreFlhcWFqdWxzbnZaUjdETjBSbUZYTSs1YzNUbnhDcEZlaGZk?=
 =?utf-8?B?TEcxNHovaGNxV1BKQ3hhcEhoUXhiYVRNMk9sTW43RXF5ZVd5cXVQRDUwZy9S?=
 =?utf-8?B?Nmx2RnhUbXNoeUxkK0pBM2ZoU2ZSOVJSMi9Pc2l1eFZsQVdjdDVienBWTDhn?=
 =?utf-8?B?L1JtYlM5VlFmc3RaZitlSncvUyt2TXRJMzFWNXppa2x1aWdyWFVKQ1dJZy9k?=
 =?utf-8?B?UVJXcTFGbGNhdTJrWHR4NDhTRkpSRkJLMVUyVk5UWlF1R0hQM2JaZ1JVcHFJ?=
 =?utf-8?B?VVJFS0ZpZGk2SmNhQU1PMWloc0NTVVM4ZEJ6Z1lnUHhtZHZqUXdRUU12VUlW?=
 =?utf-8?B?YlBzWlhVV3JKQXI3SXlYMzY3MWNUaFBlZk9IbUNiRDNrUFhWLzcxRFBZalJy?=
 =?utf-8?B?ajBoL25LQk44aDc2OXZqS0NRNXAyMXZFWktocFVTQkx4VDlsL1M5RU84c0hZ?=
 =?utf-8?B?OWpjTDFLTXZJK0FNTjhuLzNObW1VKyszK0hHTnBGM3NVN3lZSTErN2prc29H?=
 =?utf-8?B?b0lmdldkU3gxRWJiM0ExQ3RBQXJNbXJ1RWxuVXdhNUJGb05zOWNYQkhmNzlR?=
 =?utf-8?B?dGN6SlRkakhKc2pDTDEwVlI3ak9hcld6K3RXOCsvcnRNQUE4eFlQanRTbjVs?=
 =?utf-8?B?U2VzbkN0dTRibUxleUw0NGJIbU1oTkVCRE9wV3NMd2lGNE9BVWVGYnpFbExw?=
 =?utf-8?B?RnJlaVhLcGE5WS9lR0s0WExLMmFZRkxzbGRrbDRQczBVN1hGTkxYWGhCQlV3?=
 =?utf-8?B?ckRsQk85QUgyUmI4QXVtUE1lTUJiVVh2MzgrcFQrR3ozQjRUYmc1bSs3L201?=
 =?utf-8?B?NUlEelljL0NQa1hRUlRjTGpHd2FTTTkvbTU1Y3RLK1BwMllwTUgzY3QyS3Bx?=
 =?utf-8?B?M1cxUzJuMW15dlc5ZlJJb0g1dTl5d1VqVGFUSVA3WlhId2g3amlUZjQrY1JD?=
 =?utf-8?B?a1p6Q3JqNDZTQ1Azd2NqbkxtdmdZM0lPbEIvZElHcGxMblUyUWdSdmxDU0xV?=
 =?utf-8?Q?Ck+0egVHXTAj0BEILRhqtama7h4k4YDMuczfN?=
X-Exchange-RoutingPolicyChecked: H7JLURi/kHda8G+QwFCt5o+LuHENhDXJ4ps05AO9VFN/MmfB5cl9Sm7HDU7RYVFNE2sU7dtwVD0hbypZ4XPhoOfKsV5NodwkRxEwvxGcYuCX8ZeRhMoQ1H7fvNDh37yKHBTXrlQdZt0WY1HZYS6VZ5rNgBVwpc4ZYQoI7QPsvud5pg2NztkOTN9O0bka4nJkz5RhUjluI1X8NrUiqxUnMHb6wjuxub88MPTTduSGlNZ/SzwjtFq/SglIUWUBg7bamZYVQ7yJmmce2G9vDTIC1qp8+F34SjTorn3PBMcP4gBAtPOjO8qrdzdJibteqIm9C66ZA8wGYutfFXEd9fvEcA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 052a7b94-b0f6-4a06-f9c8-08def2d9383b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8483.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 10:06:30.3525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hVwx+Mx/0DpgWohIQ72s43mk6kk3z4BhG7ku6bf9Mjfci8QUQSyeHSfb1x2P0isXaRSFGarnuSI7CNONuy//KrQbIPPtdoYrmZ4NQiMxN3V+OX2FaUcrBz7A0tD4XM7S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5261
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

hi All,

On 8/4/2026 9:50 PM, Jakub Kolakowski wrote:
> igt@xe_wedged@wedged-at-any-timeout, igt@xe_wedged@wedged-mode-toggle
> and igt@xe_pat@pat-sw-hw.* are expected skips in VF mode.
> Add those tests to VF and VM blocklists.
>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>   tests/intel-ci/xe.sriov-vf.blocklist.txt | 11 ++++++++++-
>   tests/intel-ci/xe.sriov-vm.blocklist.txt | 11 ++++++++++-
>   2 files changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel-ci/xe.sriov-vf.blocklist.txt b/tests/intel-ci/xe.sriov-vf.blocklist.txt
> index 4a19aa943..ea0f478f4 100644
> --- a/tests/intel-ci/xe.sriov-vf.blocklist.txt
> +++ b/tests/intel-ci/xe.sriov-vf.blocklist.txt
> @@ -60,4 +60,13 @@ igt@xe_query@.*cs-cycles
>   #
>   # Tests that need to be executed in VM instead.
>   #
> -igt@xe_live_ktest.*
> \ No newline at end of file
> +igt@xe_live_ktest.*
> +#
> +# driver rejects attempts to set wedged_mode=2 on a VF
> +#
> +igt@xe_wedged@wedged-at-any-timeout
> +igt@xe_wedged@wedged-mode-toggle
> +#
> +# On VF HW PAT may not be readable
> +#
> +igt@xe_pat@pat-sw-hw.*
Reviewed the change and it looks good.You are good to proceed with the 
changes.
> diff --git a/tests/intel-ci/xe.sriov-vm.blocklist.txt b/tests/intel-ci/xe.sriov-vm.blocklist.txt
> index 6271b1a70..09b3540aa 100644
> --- a/tests/intel-ci/xe.sriov-vm.blocklist.txt
> +++ b/tests/intel-ci/xe.sriov-vm.blocklist.txt
> @@ -57,4 +57,13 @@ igt@xe_pmu@gt-frequency
>   #
>   # The feature query_cs_cycles is not supported on VF
>   #
> -igt@xe_query@.*cs-cycles
> \ No newline at end of file
> +igt@xe_query@.*cs-cycles
> +#
> +# driver rejects attempts to set wedged_mode=2 on a VF
> +#
> +igt@xe_wedged@wedged-at-any-timeout
> +igt@xe_wedged@wedged-mode-toggle
> +#
> +# On VF HW PAT may not be readable
> +#
> +igt@xe_pat@pat-sw-hw.*
Reviewed the change and it looks good.You are good to proceed with the 
changes.
