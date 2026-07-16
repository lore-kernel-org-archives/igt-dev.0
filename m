Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E87C4450A
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 07:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB8510E2B4;
	Thu, 16 Jul 2026 07:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TmQ5t0aj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC82E10E2B4
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 07:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784188618; x=1815724618;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fIfJaC2SZnWx98VlASg/bSicTlmEaTX1pz0KFk13U+g=;
 b=TmQ5t0aj8Itc+9UPCqChsQ3nwr3krCDUNXF58UK/zaStJjUQhSo4xyVu
 /+V+b1tDwUNY7zmd7bHiRpWauv9Y6JQmnuMoOnOzGWRZP2b9xQKCyq6ZE
 adBwBX1Jzb41WQ4EJgGKnMI/YjDzLCMejqNrK5QBF64UET4RBoPLr/gF+
 P3JATMQimm29zBalcq5zjChm8cNRYoe9wIS1jgv/anwMNkYU3k2xvJlEc
 My73Je9NLT0m/eJmUw1qZLwHIHs9KnlWFJpE9gxK70bAdNzMZ8BMi2ZI+
 nJNKbCJkxna2ggQkuPeMjEPo97H/UKZzCM+4nhRdR3mSwoE8+n3fLMUyY A==;
X-CSE-ConnectionGUID: gThJcManQUWZCsbOCfCypg==
X-CSE-MsgGUID: SSKTdLCUTPefzHfVMevnnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84868383"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="84868383"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 00:56:46 -0700
X-CSE-ConnectionGUID: Et48JjD7SfyTXbZ4JNxqVA==
X-CSE-MsgGUID: xMtXhRH5THSgSYJi+W+pUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="250060981"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 00:56:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 00:56:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 00:56:44 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 00:56:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0ZiU9BPTBt7A9mMLgc41tTzuKwnke5DqkE1Ybmt4jOeV5PPqLH8WoMgKBfZ1I9II6gVf9sP/hP24ILY9zQ7yDDNbgW54/Peo1zXXWbChCPkZ1HQ+xF1kDo6NOPJrpQj1TxKfzlxxHCeyQx8fUnssnSR6sAkUeML2YFlFL23lhIPIcXCzcmTWtUQL/GQLzEzUWOe0GDxeq3/77YLF9C1Pn5uYovwhc14AT0Jjb09V0t8jcux7rdfk6rY5dDDrR6YQcssos2j21TQ8M269952DOlmxknpw0nwMaH3PUgOcc4xWa3ids2KnZ27fTr3hPSxmKoiTY6MeDQgOEXv0rffQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kot1ihalOFbFvvHNj7Tl9N62Pe2/iTlXYCQDOKRePkc=;
 b=OMeDTpPDwkFHnqYepgvJZFhpoUpY0kNoFqKJKSq4MFyUK0hb54WisTM+fBeZv/PJUFoX1XHu4exhO95BM8PQiR+TK1duqtKHhXb5ZtwksQmY38KLAcPopkr1asqvGRo8xMTiOX0EA5Cqx4oX1GeTiYk2K4mm8TFDF5GwXykc1PSeJ5/8eTBv8KGwoM98X67TarHxEntEXFTG/dG0/h4QN5i9aLbOyPMKyyB3TgljJavYRpvRBcLhxiGuzgRuzZE/uycAozmbMvitiOYw6hHxCsQ1SMSZQIx+3av/z6M6axWJKtoLtxZJhQsK/2Aapi0+2CXOnsElDENue83/cATwJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by BY1PR11MB8005.namprd11.prod.outlook.com (2603:10b6:a03:523::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 07:56:38 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 07:56:38 +0000
Date: Thu, 16 Jul 2026 07:56:27 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 09/31] lib/igt_halffloat: introduce static
 sub-library for tools
Message-ID: <c77z7y7xc54ygzhledsy22ixwac6o2pnezrtucecslvnqypszu@hpxoac3i22xq>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <616163c9262da8da429f8d59ad570058d809f7f3.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <616163c9262da8da429f8d59ad570058d809f7f3.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TLZP290CA0013.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::6)
 To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|BY1PR11MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d8683d9-5fc7-4ffa-c8bd-08dee30fc3ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|11063799006|4143699003|56012099006|6133799003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: 69MmCq8ukHtWuwYc6j9uOsmokWvsS0RCZb7i0lmfd237Z0n2dR3Lz+fawKryRc9JfzM9LqFxctTt65iWHl0lDEFOj0b8MsxSu3IU5k0fJBfFVJsfozCBs6gHgSXHjJjBbfMcWCa8NccKu54mWHeTspERmTdzU36qTEiTo/hXUDvf7yL5X0htkT7J5wM8euPuOEK2OhdRjsnfr35zM6ao8ofPZ2Pp0XiEOa4Xgq2q9RuBscfiMtq6KB4szPP1gOLu70uTuKCbcNLtarAGbv51qFNH8GdYG4iNg7pmp7bY8LHLlupsJIDhVvlPQcn6LhPT7YYXTapapzYhnrBhTbkZ13TUeH8G7+tbtlvTHoySgY3OX7YmihZXQkxZmPMAxrQ58fvHUugBOZPZQrLJ3HBp4fTs1I+pj8FPg3CwBQbny/fWv05g1cYY3Lhoyymh7t2VwzlURB4BU67VFhXAU6UYkYeTe/jiYUwLuh+89IG95JMntSuGzs/IPtNn6Vg5QahWxZXu5on5+AR+je7voPk8q+7Zqf5XzN5WOeA+I4QhBg7UoWdTN5EU+a25tmdt6ETdCxc3JQWjo2qMyB8tcZMYU0f6VSu6aw2gWuRBt42La2fgbeJKOUORA1fJRQ9s6YocSwkVhj1ATXrbBfZ8O3Ld6E8YReqa/4qG7ofuOK9g5HA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(11063799006)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWxuRUcrUXZra09odVZiVGQvYk1JNEdBUGRGYng2YlhqK1NFMjR6empxTWg5?=
 =?utf-8?B?c0c2NW9PZm9pSHJQMDgvdlVCbU9PYmV6VnhPaFJHcVJVa0JHeWJVNnVveUh3?=
 =?utf-8?B?dzdhODNiUW1GNzJmOEhaWGJWNEwvMkJQWVJOSmkybk9qNFM4SDluL0tEZTJm?=
 =?utf-8?B?S2l4emxUeXlsQnIvSkJ2SktjUmZsSGdmYUJGaFArU0o2SlVJMDhBcCtDcDNw?=
 =?utf-8?B?VFV5RHo2UDV3M3NHQmdwd0hIZkpLV2J5RGgwUDczVEludTJ6akVoYW5BTGJH?=
 =?utf-8?B?UnlvWEdxQ0h6Y05VaGtiOXpWZzJjZnhNUCt5T2VOQ3h3RE1ZbCtCb3dDb1Jh?=
 =?utf-8?B?VXlhc3hHN3dSb0JXYWFSWjROQ09sTitjaGU4TW1GcEtFMzZ3TDVhWXpLQkpK?=
 =?utf-8?B?S00zMnhFTVFMbFBpMU9WWDZZYU9tNXRKS2k4dTlqdVZ5UGoxQTVXelA1ZStH?=
 =?utf-8?B?c0hzRHl1L0lrUklpSFQ5TlhUZmN1a09EeEFqTGxKNzlnUUs4cGZyNk00VTQx?=
 =?utf-8?B?enBZRzBYYlBKNTdCS1BPd3N1emNKM2RMOWFHZk5xNzI3OFFFOVJFYXBjd25k?=
 =?utf-8?B?WE1SVVRjTG01THhzZFlidzBRUXNjcG1IV1YwOFFJYStIQnpsQXIxSXVPRmU5?=
 =?utf-8?B?eXFiN3kxUWJaYkxYQ21zMHBtanUyOGVkTHFmWWVMUXkzTHNzZ0xkZEhlNkRS?=
 =?utf-8?B?T1h2dklQY0pFeDBFTlVVZWE1RHBYbTFsKytRdW00OUd6UmFzTStWNktZU1o5?=
 =?utf-8?B?NmNZT2VsTlFEb0RaaFhoSzY5QVczWWFpQzdtMHdYdGNqbExVa1dBUFdtRVNG?=
 =?utf-8?B?WHlKbDEzYVo2WTlwdXhaRVlhSXorQ0pvZkJPUXdCNjc0LzhvNTJIUWhva2lY?=
 =?utf-8?B?WnJKVS9kTXpndTVncTI3bGRoUzU0VFZqck9IdWZrdHpGSnEyYklNZ1dHbUQy?=
 =?utf-8?B?MHNDWDZ6MTNVRGJkQjRRd2FCUDYrOE5JQWwzdStMMzEwKzFGNnA0MU41b2tR?=
 =?utf-8?B?L3hJRzl3U3ZNOHBneENrR2lRQ09PeWEzUXBCMzg0VjFnMnVQWXE5K3JBNUIx?=
 =?utf-8?B?VGpuMjVvRjJUbE1VR3cycE5LTDIyd2FqcUY3cStUQjFTN2hZN2xsWXYxWE55?=
 =?utf-8?B?UkRzOTdsWlBPR3J6aFMvV2VYOE10dGJvdDgxb2ZDY2s5ZUtVQi9wTllQWmVH?=
 =?utf-8?B?c1dSQTFRZ0RpcndtdDV1MWVYWmsyR01uZ1dFeWdDTW5JaVU4Rlp5YUsvR2Ir?=
 =?utf-8?B?N2lzeG54d0Rwdlh2R04vUThlQlRLcTM2aXFGSmNxMkdqRDJ3WFdFZGpmM1Vp?=
 =?utf-8?B?OEZvQmY2Q0RiSGpRejl5Q2NNcUtxS1ZpWHBXSkdRUVhVVG1lcnBIcTM5ZTRl?=
 =?utf-8?B?NjJWemYyZ0pIRFQvbG43ZnB2cWhQVkFCR0tEVmQ5am4wTmRiL0wxdkp0S0lV?=
 =?utf-8?B?dlBMMHJrMjBNN29vOWpHbFlGZ2pWSDBRZEM1b3dscU85emJ0UGRnbXBNVVF4?=
 =?utf-8?B?eDlTZC9MeWVTUVpCSjJDeTkrUG9PSVVNTTdPc3NQdXE5Z2lhZkpwbWdCaS9w?=
 =?utf-8?B?WXp0UkVRMVpISnZlSVNxV1M5dXFtcVkzT1V6WUJBell4U1dQQXlMTDg2M2NS?=
 =?utf-8?B?Y2tmMGY0U3VRbkJiQit4cGI5Y2t3aXRqTlIvNkQ4WEM4dExXRC84YVJvK1J2?=
 =?utf-8?B?Y2R0KzROdmRaMSthalRhUUlXck5lcUVibGo4czZETk5HL1lFbEtKbFRMc1NX?=
 =?utf-8?B?THRnclYyTjNwQkNxRkpDZmRxcGJKcGFPTkVsYW1wUnB1dDR6K25YRlJ6Qzdp?=
 =?utf-8?B?UlJLb2ZsdDgrdTdBaXM4akM4UUhhU0htZWc2dXBSYk1IM3QvcW5raGU5ZkVO?=
 =?utf-8?B?VlhuWmFtQ2s3cklIS0hlMmdnQ0NZYzhqRmZld0syRTEvN3hrZ2tabzZrK3JZ?=
 =?utf-8?B?bklGVkFBc2RNclVpZW1MbTVSaWh6T1lsb3Qwd2dwSGFOeWhWVkROY25QTVhM?=
 =?utf-8?B?UjA3bE5rWTRLRFgzTlNHTUJXbEhyMUo3THJzUldNMldQeTdkL3Vob2ZNTklu?=
 =?utf-8?B?SW5HQ3hvNHNjaUhCTm5GbWJwM2JaRmI0c2ZWQkcrWERBRFNDQS80UzJhUWd0?=
 =?utf-8?B?eThIcTVsTU53b2Y2QTlUdU84K1NTQXZvNGIyOVRQTWpUakF5dTM5c3hmbzVh?=
 =?utf-8?B?aVlSajRsYWhiMkFYazcrNmhlSVFsemU3M3d6bG1oRnA0M2FKWmJOR2JXMDRw?=
 =?utf-8?B?T0x4eG1sdWNZNFdibVN4S3c3d2IrVGNOZXR6NzdrRnlsYzZDY0JyUitiUGZB?=
 =?utf-8?B?UnZKNndYMXlRU0RFN01PSnVBamhGeUZyWHdUQ2RrNnFtNkZlTFl2b1JlTk04?=
 =?utf-8?Q?dhyqeao04PGLtmsg=3D?=
X-Exchange-RoutingPolicyChecked: otRxp+Lki5m2IuPdL2+wWzVpV0c2Wco6Ui0fwpLxh+e/v+qNEb3toI8ttb5H5pjuNnW1YOwhV/JPNj9/6EmsvfY8ENcHdumk5Fg69KsZCP530pHN9NKTf+FpPslm3vBq69FTNi/LUZmQJT5Ti0rVpvVV4ut29wgcEH+cfBMQKkysz+8QWkxEisEiRlImQ7bAHD0pdheUq5yHGDBRdNHzJ8TbsgYPyp0Y+Di3P3cmIL/jlA84tHVPRywCaVOhwJ5TGxJ3iblQtIo3ol82ifwT9WUrX8WQmc6AyPc96QBMaJ55JpBB1g/AaAvOHT/MDcoMG9y6rHabHwJq9jbEr0v+qw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8683d9-5fc7-4ffa-c8bd-08dee30fc3ef
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 07:56:38.5428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QeEhI82J5GndU+QiVDDkd868XAhb7MebWExxxvJeOlgAUGJCdWLKIc/O20CaFLmZk3wjlhLbZrEVvTV6ody5ziuBF/yyBaJO7gRFLTrGU4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8005
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

On 2026-07-15 at 14:15:19 +0200, Sebastian Brzezinka wrote:
> Add lib_igt_halffloat backed by igt_halffloat.c with a math dependency.
> Tools that use half-float conversion (e.g. intel_vbt_decode) can link
> this minimal library instead of the full libigt.so.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  lib/meson.build | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index 2c1fbcd43..93db217f8 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -415,6 +415,14 @@ lib_igt_stats_build = static_library('igt_stats_tools',
>  lib_igt_stats = declare_dependency(link_with : lib_igt_stats_build,
>  				   include_directories : inc)
>  
> +lib_igt_halffloat_build = static_library('igt_halffloat',
> +	['igt_halffloat.c'],
> +	include_directories : inc)
> +
> +lib_igt_halffloat = declare_dependency(link_with : lib_igt_halffloat_build,
> +				       dependencies : [math],
> +				       include_directories : inc)
> +
>  i915_perf_files = [
>    'igt_list.c',
>    'i915/perf.c',
> -- 
> 2.53.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
