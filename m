Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4BDEB1054
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 14:13:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C0110E173;
	Tue, 10 Mar 2026 14:13:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kl+Yg4dZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79D910E173
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 14:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773152019; x=1804688019;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=QAMObPuIIIxjhQzNr3Js9qYJ7F6YOiHEV4JUqx4qszo=;
 b=Kl+Yg4dZ/3pqDn5sYF+bth2oQKTL+pmXgaj15aNf8J2DT1099dGcVgZO
 D5IviIkfvisMrt/WYjO9nZ2HrOwC5U5/tSeqRJyJmLmXaa5xCFNvievT2
 ZSJLGL5hvjiQN177G3Vl40qKlpy5n1vrLAvvq2Ad8z8QuUEqmjxTF0i/6
 iUm8jug6rCk2pPCVIHOHb5aQcszoFQqYsMhHZ4n38A2gHZp/kTJwJdByP
 ntALfXZa/Mhvux5sUA53WUOfFlg1+xA069rYGeDb7kghFEWJ3/4J75XbT
 D6EBWVnxmGLz8G7EbfcEXg2ICJNkM6NaM9ZjPrXhIF6GErXYL14aNoYEc g==;
X-CSE-ConnectionGUID: eUYX42g3Ta+grEWBk0PoXA==
X-CSE-MsgGUID: VuHfAS5hSJGfhcexAUj0IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85289273"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208,217";a="85289273"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 07:13:39 -0700
X-CSE-ConnectionGUID: WxkFjDe4Q0OnZ36pUbWqvw==
X-CSE-MsgGUID: JGHk3DwfSMqpqrv5SQ9JSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
 d="scan'208,217";a="225070785"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 07:13:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 07:13:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 07:13:39 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 07:13:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mv3XOawbDX0JJAC4/RhfAMVx3AmAUP3Yr42C4RwZc09jf4IdRCvk4Cht4rx9UhRSidzZ2ht5DGBIPsqNmT3zAmtx2+vK6B/DNCsRZ5RWkE67z6/IydPacQUeT7mWdi9EedHryuCGYGXcTmjhDCagzvOLgKtpnxc5xwiZVBuBiaveN9LxbwQhmCMFjZXE6mpo0/7g+hVQTUmb9enklztQKtp8SADsrbKX/XTjvTxSkFTmco+cAF/n7b3UUOF0rrjV1MUkpSUFkI8/I1j2v0tNgS9KvHmTEPppVjoCkddQkcTCYLKfPudWvHeYjBDFu+HniaP9EXDn5yPq4SQkMh5IeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1fKRuxgqg/ZiuXmIWdQ7pCaQHPKZXIsf6gmBce+zBM=;
 b=zA3vgcDKu5Cg/fl5BT8iEOi+FwwsoXOrcYb+YePEs73VMszzqsG85Dg+AvNl+zdBZp5mYCjBaZpHV/PAzLITa5ZsEAUAKM0dG++jHYv89QatFc5u5i22uB7fqXtQqCmLhrqdm/F+KMx3nkqnICBd8dOW2N9MkTf2sdHb8/VBEGVUqjSC8Y3XXl6eaSJ5V+tCDFs4PgthMRM+9eho27ljJYrJ3MAwdL0RfOLlxbTgLVJAf3vo0adRjHtm+WUI8+OwI9xhzcPxCgXrvdudWQLkoOacC0X1ZEKWEToUzeR3+AyDtxHhyoeytgO7Siq2kY0WJDjvEyDD9gNB4L6+fawTUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30)
 by PH7PR11MB7961.namprd11.prod.outlook.com (2603:10b6:510:244::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 14:13:34 +0000
Received: from BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737]) by BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 14:13:34 +0000
Content-Type: multipart/alternative;
 boundary="------------0gbCSCjFflqzkjkKakooZ5Xk"
Message-ID: <4c31d910-f897-4331-a3a9-1b6be7c9cdb8@intel.com>
Date: Tue, 10 Mar 2026 19:43:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_async_flips: Do not skip any tests due
 to Selective Fetch
To: <igt-dev@lists.freedesktop.org>
References: <20260310085757.1314235-1-jouni.hogander@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260310085757.1314235-1-jouni.hogander@intel.com>
X-ClientProxiedBy: MA0PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::17) To BY5PR11MB4260.namprd11.prod.outlook.com
 (2603:10b6:a03:1ba::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:EE_|PH7PR11MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: 38bc1c32-8e21-4328-bf3d-08de7eaf3701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: gGDH8XYP7tzXXIMOQS10BUrLQ7aBR1QfykhH8dyVFA1Ke9hi80pW8B1cthGqeu/e6By0IyVQgg3DC6Fh0vd9n15k+otcVW2FaTUvGkanglx7XW3yIk+5SH7rhW7nLs5FrLd8jdWrab6h7unHgENpNP3n4edsxkUVbY5VY2uPDBIiNGceK/zvSXwbqUr/2F9aFB4uFhyHEhgODBld2qW7RJtTv5uTmLunYVG2Ko2b6oP77aLCm0zYpi+6qUGPk+HADXoJPRy6EpxQsiFHKMmIpTlT/ByKNauV1IEnuJGzKINKnqT59vvzvRecq9HSErZhbPF3G+CgTQ1WFB9NE09ye3vqi1slGwWMOtLsVIErqLrbsdkZa/eKfg6LVQRefKEiUBM6GXKip0+GxhBmkZ6o0IBiPXKRpNZ9J7qpQcqj8kvDP7dguZIuMZSweZv2pZWi9Wb4JSR3pBF4t91hCLzyZenJwtEsvhiTDgYtR6Yh7Ic7w+Mbu9iqZudYBK+XFxc4atMHFHz0LUlhJoekMH+BGl8RXFgIWANH5IbR8LAPuSbXOHU6A2BR8YrdeiSHFpfgsPi6idwdflGHFvp/JlOBCbJ5n4r4RRzoz4ZCtqKPvsnBF/NKhYSs5bmO9QKpIyg9xDx9EYdmk2+bSCWC4VZVBb+JmvII4ceY59dqYyr71LlY+nEJX5uDRhdFAdgufe3d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4260.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003)(8096899003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFBpRUQ1cTEydXZWLzYvTUhoMCsxNjdwUXhhZkMxY3l1bzNGS3pacEVSM2xO?=
 =?utf-8?B?TjZqdWd0bVpNNGlEM2pDdnZOaTdCR0l5azU0NVNGSUU1Rlk3VGE3U3lvN3hp?=
 =?utf-8?B?eUU4UmVnVm1RMy8yVjBkcVJBRXF0MU9HSFFsR2dEVUtkZVpJMXF0Tjd4djJB?=
 =?utf-8?B?OENaYVZsTkMxblkxVmV0UUZ2NlU3S0U5QUsrdEd6MnBWRWQxZG1HdFBtMno0?=
 =?utf-8?B?alhoajFwbk9XdFdSUlZuVGNWUy9BV1N0VHI0WkZGV3FtTm1BcW9hV0N0UHE4?=
 =?utf-8?B?bTlSNldhL2JJQjlhckV5bGhvUUVvSHlYTW84UlN5WGZaUlpVUjFuRGFHQlRO?=
 =?utf-8?B?UW5MZTl4dDBkWXVDYnpLQUhRNWRnV04yNDh5ay95TStBemlFKys1OWwzUHBs?=
 =?utf-8?B?MFBOZjhiREtvbVVma2tzbjVxUEZkeXJtaVhOd0N5dmhFRm9xM1p5NUY4RmE2?=
 =?utf-8?B?NUVTV3ZXdDJ4L1R5Z1FmbGhKc1pzdjE2SSt5ZEVaWUNLOXFKRWRQUnl1NjNZ?=
 =?utf-8?B?bSswTVhGUDNWSGt6QUJnRDRUUldDOTZBRUFCZXZZNWc0alJRTXJYdWo1VUJG?=
 =?utf-8?B?NzhzeWRLQUExTXU1TVdtS1g5K0ZXUllpamRGRG5TdDJ1WXBnRml1VjU5WW00?=
 =?utf-8?B?TG9VSDhvVndwRDlhSzB2ZjBDYUs1OHpOeXU4d2h3VkpGakYxVHBGeGw5V3BJ?=
 =?utf-8?B?c09LSWkwV2U1VUtDQVd2dzY4cG80cUEwdDh3T3pZYnhMNzFTcHZta2xHLy9V?=
 =?utf-8?B?NncxYUJwVjRDUzAzenZGUDdFRDJYOHJxMnpnTEd2Z20xQkZEU3RZTnk3czRD?=
 =?utf-8?B?T1ZEOUU0MmFkOE93TW12NkJrL2pCM1JnSXA4K0NIdDMvSndEUmduTkZwdDNS?=
 =?utf-8?B?RHZ0Q2piTmRHMS8zdnEyYzBqajFPc0g0aytRSS91a3NtZktzWEo2eHgvdmN5?=
 =?utf-8?B?T1phNkJiU1d2bDhhSGF2Zkh2VERrekhFVDJiN0RIQTdVa3o5T1RVK040ZHFr?=
 =?utf-8?B?aUFobXBtNTUyZzhjQllGQXdjTDdSeUdtR1Bma0cwL1JkR0FBRkRWdTNPTUR5?=
 =?utf-8?B?cFE1cklkaUo3Nk4rSmpwS1V6Lzh5TU1BNDgxWHhGK05IaU5JMVZmUHJhcm1G?=
 =?utf-8?B?M1FLdVNSQW0wNUVzd3FqSEc5T3Fpbis0SGoxbTZneWl5MVovZUM4Nzl6ZnF1?=
 =?utf-8?B?NUw4VjBRYVVzYy9uT2xudXh2QkZGNmxqbjJFaEtwVnllWVBsRHpma0VsbXFZ?=
 =?utf-8?B?QXlNcldCVU55bGphUlk3elJobjROcEM2L0N5MGJ5Vjg4NGFydjRGV21DMHhx?=
 =?utf-8?B?UnBybWZ6OXRjUU9pUXI3Sk0rSVJsOGtjTEtDei9LSHRoQ1FBajZFZVh1ZVk5?=
 =?utf-8?B?VE92RDJZcEhyTzdNN2JKRTJodFZad1p4RStzcHVDdFFJSnZLQnRJSTRkdnEv?=
 =?utf-8?B?K3BWcnJMQW1kMDFzY05JTVVVNGcydlpzTWVicUxLYmx1UllqVmFqU29vZzNx?=
 =?utf-8?B?cnkyeHRHdE5JRE5VellQNmNoNnoyZEFlK1hxTGlleDRLVGVzUmt1WDc4NXli?=
 =?utf-8?B?Y3huTGJJVjlmeWVJaUZWTklWUUw5YmlEZndKOGNyUExGTTFpQWQyai9jRC9E?=
 =?utf-8?B?MmRPY0JZaXYvbkdDaFoxbE1ZbFIxQlhWb0lvWVV5WENXbXBpMmx5THBMdTNr?=
 =?utf-8?B?R1FuNWZyMzBUM2dQREVYUUtyUURsNXdhOXoybDdINXk0UzVWclNFcXFoa2Y2?=
 =?utf-8?B?VlUzK0EvV3B0ZWhVUkxzbWx3Vm9Db0lUZXVTNEpycDM2K0dKa2E0WDJKUHc4?=
 =?utf-8?B?dFBUNjNnNFJBOXAwdEVJVUtxRFR6OTlZaE5lVDZZeGRTSkwvR3RXSlhjU3BU?=
 =?utf-8?B?ZnNDaGJKWDZqcUhqSllJVUljeGlhMGFsQnpGUFpkMUN5djhFSENJczlLdVNN?=
 =?utf-8?B?SCs3WVlSUjVjUTR4WmR4Zk42NnhIbndwNFNsR0ZBVlEwOFY3d215UFRXSUMw?=
 =?utf-8?B?ZG1XRnBWS0crcHpTZHRucmNUSWM1RGdyZmtYWnI3MmhGaDI2UEpYQU9QZmhW?=
 =?utf-8?B?TVQvM3BObk5rOW5yZHM3eGoweEpDZlU5Q1lISWlIYTFZUWtjcUhBbFlBVzFx?=
 =?utf-8?B?MXBpMlFFSnBPZEttYVlKTTVId3NGZ2lnbjI4UnFMQWNtUmQxN0N5cEI0ZXFj?=
 =?utf-8?B?S2V3aDVDSGNvdnp2cStEVlF5U0VaN1o1S0xwcU01eWFFanp0ZTZXSFlwSmU3?=
 =?utf-8?B?QWx3NGk4TUlmYi83bXhCSkJxZ25JUFJ3aTM5SUtjaTRtZmowdnd5Ui9wWXBL?=
 =?utf-8?B?cjhpdG5hQTQyMC9STFRUeUhiRWQyakM3c3hJQSthblY3dmNGcG82WUh6cUZw?=
 =?utf-8?Q?6tRBdrzoQHaASySA=3D?=
X-Exchange-RoutingPolicyChecked: hG4BoZn3gEkr942C8oZFEcHibqzzYuWPORoVx3S55jUmRvHqBbpZDkI8CXECEcnCenUhKeZxetyjUgwXwJvRQ6J1k7NX7KrZEuZERl5JQeXbEtli3wdX+0ehokxcjAjEdnK0sDSP55F4/FrUio4b9fuoEfQSSyTkxSjRpnt20uhgSJFzCaKB3HfiMlBJ//lAxbGdMTWCvpaN/Y/JZm0SxuzKVmkah5rXCayfrcvM/fZsX1UiJjDPDSCvC5cQUzGvsSpbbbOETp0kP6NrRyPk6+xeTwXIywEPAUmtaVuJnowk1kv++WywlIPNhALBDJRbNmvKYrmp/ODTPWYZgLa09A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 38bc1c32-8e21-4328-bf3d-08de7eaf3701
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4260.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 14:13:34.3095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HhBMRrAKGr0hX/u4HRy4+EXlkPW/m3crI44llbYG5s++jUoZjw3R0IRAmZyCkjYbm+nZJj5+b9hi5AA3+YnZijGzbxxu2Nk+mYGFeRXJxb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7961
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

--------------0gbCSCjFflqzkjkKakooZ5Xk
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jouni,

On 3/10/2026 2:27 PM, Jouni Högander wrote:
> There are recent changes in driver fixing async flip handling when
> selective fetch is enabled. There is no need to skip any async flip tests
> due to Selective Fetch anymore. Remove checking Selective Fetch.
>
> v2:
>    - dropped unused psr header
>    - dropped unused debugfs_fd local variable
>    - rebased
>
> Closes:https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15791
Add a Link: tag to the reference driver patch for traceability.
> Signed-off-by: Jouni Högander<jouni.hogander@intel.com>
> ---
>   tests/kms_async_flips.c | 17 +----------------
>   1 file changed, 1 insertion(+), 16 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index a42407363..4a2930968 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -35,7 +35,6 @@
>   
>   #include "igt.h"
>   #include "igt_aux.h"
> -#include "igt_psr.h"
>   #include "igt_vec.h"
>   #include <sys/ioctl.h>
>   #include <sys/time.h>
> @@ -612,27 +611,13 @@ static void test_timestamp(data_t *data)
>   static void test_cursor(data_t *data)
>   {
>   	int flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
> -	int ret, debugfs_fd;
> +	int ret;
>   	uint64_t width, height;
>   	struct igt_fb cursor_fb;
>   	struct drm_mode_cursor cur;
>   
>   	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
> -	/*
> -	 * Intel's PSR2 selective fetch adds other planes to state when
> -	 * necessary, causing the async flip to fail because async flip is not
> -	 * supported in cursor plane.
> -	 */
> -	if (is_intel_device(data->drm_fd)) {
> -		debugfs_fd = igt_debugfs_dir(data->drm_fd);
> -		igt_skip_on_f(psr_sink_support(data->drm_fd, debugfs_fd,
> -					       PSR_MODE_2_SEL_FETCH, data->output),
> -			      "PSR2 selective fetch adds cursor to primary plane flips,"
> -			      "breaking async flip support\n");
> -		close(debugfs_fd);
> -	}
> -
>   	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &width));
>   	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &height));
>   

With above change looks good to me.

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

--------------0gbCSCjFflqzkjkKakooZ5Xk
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Jouni,</p>
    <div class="moz-cite-prefix">On 3/10/2026 2:27 PM, Jouni Högander
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260310085757.1314235-1-jouni.hogander@intel.com">
      <pre wrap="" class="moz-quote-pre">There are recent changes in driver fixing async flip handling when
selective fetch is enabled. There is no need to skip any async flip tests
due to Selective Fetch anymore. Remove checking Selective Fetch.

v2:
  - dropped unused psr header
  - dropped unused debugfs_fd local variable
  - rebased

Closes: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15791">https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15791</a></pre>
    </blockquote>
    Add a Link: tag to the reference driver patch for traceability.
    <blockquote type="cite" cite="mid:20260310085757.1314235-1-jouni.hogander@intel.com">
      <pre wrap="" class="moz-quote-pre">
Signed-off-by: Jouni Högander <a class="moz-txt-link-rfc2396E" href="mailto:jouni.hogander@intel.com">&lt;jouni.hogander@intel.com&gt;</a>
---
 tests/kms_async_flips.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index a42407363..4a2930968 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -35,7 +35,6 @@
 
 #include &quot;igt.h&quot;
 #include &quot;igt_aux.h&quot;
-#include &quot;igt_psr.h&quot;
 #include &quot;igt_vec.h&quot;
 #include &lt;sys/ioctl.h&gt;
 #include &lt;sys/time.h&gt;
@@ -612,27 +611,13 @@ static void test_timestamp(data_t *data)
 static void test_cursor(data_t *data)
 {
 	int flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
-	int ret, debugfs_fd;
+	int ret;
 	uint64_t width, height;
 	struct igt_fb cursor_fb;
 	struct drm_mode_cursor cur;
 
 	igt_display_commit2(&amp;data-&gt;display, data-&gt;display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	/*
-	 * Intel's PSR2 selective fetch adds other planes to state when
-	 * necessary, causing the async flip to fail because async flip is not
-	 * supported in cursor plane.
-	 */
-	if (is_intel_device(data-&gt;drm_fd)) {
-		debugfs_fd = igt_debugfs_dir(data-&gt;drm_fd);
-		igt_skip_on_f(psr_sink_support(data-&gt;drm_fd, debugfs_fd,
-					       PSR_MODE_2_SEL_FETCH, data-&gt;output),
-			      &quot;PSR2 selective fetch adds cursor to primary plane flips,&quot;
-			      &quot;breaking async flip support\n&quot;);
-		close(debugfs_fd);
-	}
-
 	do_or_die(drmGetCap(data-&gt;drm_fd, DRM_CAP_CURSOR_WIDTH, &amp;width));
 	do_or_die(drmGetCap(data-&gt;drm_fd, DRM_CAP_CURSOR_WIDTH, &amp;height));
 </pre>
    </blockquote>
    <p>With above change looks good to me.</p>
    <p>
    </p>
    <p style="margin:0in;font-family:Menlo;font-size:9.75pt;color:#333333"><span style="background:white">Reviewed-by: Naladala Ramanaidu
        <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:20260310085757.1314235-1-jouni.hogander@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------0gbCSCjFflqzkjkKakooZ5Xk--
