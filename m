Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22931C44521
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jul 2026 07:03:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BAD510E156;
	Mon, 20 Jul 2026 07:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LxHCC+1l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D2910E156
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2026 07:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784530968; x=1816066968;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vRDpliNuKmE8OV6Dzarz8vMgMiAVGA42IThZtKV/STE=;
 b=LxHCC+1lKdP+ui/6+OcE1P2VpxlxF9xJcPW4ejM6AttH6CEcnigrK2Hc
 0ShlyzyQAqWtcgDZ1+JOrEJOxQnYbes6uO27Z7UgayMU3B+x4k2D7k33Q
 IaRSAKSdk7EKUN/xeJPVBRGsqWkt65But2PjgL7X7Ou1En1ezVttfWJPE
 WDPJn7C6fmd2YPRinKTYTQHevU77Qy3z190BMIJINiPKEWaH4zI3pWVHM
 AayGWvQIob9tMBc4NkQj5p4fk1AFsn0rETXFpYvHwLT4i0LVn0/lwTkGM
 oXZ/N2I9lKu/9CGMNg2ssz43mASw0/lNseZQcMasHa+rpa7YmvhNukVBb g==;
X-CSE-ConnectionGUID: y9g7nEmZTXWuBWe5N7KwLQ==
X-CSE-MsgGUID: X0SuNNpSTBWUzOTWX8Q2nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="72639467"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="72639467"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 00:02:47 -0700
X-CSE-ConnectionGUID: xJMW+3X6QLO/Q7d+muyiSQ==
X-CSE-MsgGUID: 67x8g+q5T7Cy+s+t5XrjMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="259381143"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 00:02:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 00:02:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 00:02:46 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 00:02:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJiTwMUilvSHKoP/+UyrQehFWcdeTgBpVWLuepsPOx6mK9OGHStANHPYi9Xm7JkbvljOq6d1BUnLsmVGxQjofx2CAkk83oESWFzjJmvPk+QwvKD8+CX8kpU4PEMooNtVW8f69zn44UqemkBvFkvbKVqpytGt2O8dze6ukEEjwzdbD/2tD/8UQZUxc36hLAInTqI2I7/Ol0+g2uNGhBRDU3Wb/esDV4HArVEC+rHugZ5PpU3XK7+AXAQReZDsLP5GLYHEaX0PN3pJhNSuW5gRyl5G1UxtFqatTvXAxMcQwl/paR3upUmo1VkqN5fIdEpruQWAMVoMV0GxfjXPFVnkqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pY0CZtcWlzFyvHaHnAhYSYglm2e2CmMdFy+VLRHSmuE=;
 b=wu+TGb0vHi3MwGx8//7aoUMr0l6hmdRd49XBkoTvyeedWIHHarlDmVHeJynYOFfzDs6pc6Avj3nbDHxJ7JB5RVo+xQWGiaKa14k5SGh0+sf6p/SqXkkOcn6EX0d9aT3VTeAMY0iDfBitgNH7yMRSKEo52Zb2eQXuz68sYmDLyrc+agSgotsjC2BHhv3CRpvVYm5eToMDfSs4vBeSi5dHw+5VlIZr8CKgdXv34YM4/J6bC0wSQZv2IjAE2taHUv9X4XHgfGmrP+kvSKMbJsL3UCqJWg40fZoxowVDDI6SOLwHD771FGQbNFMZBn88RmQiLJhEF7qqApgpmhdCZ8ba3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by BL1PR11MB5287.namprd11.prod.outlook.com (2603:10b6:208:31b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 07:02:42 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.013; Mon, 20 Jul 2026
 07:02:42 +0000
Date: Mon, 20 Jul 2026 07:02:30 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 18/31] tools/intel_vbt_decode: link with minimal
 sub-libraries
Message-ID: <h6v4j3cka6bc6j4ihx3wxlhycbwbkx6mfww6kwb2jaadtafqs5@nnehp56jv6np>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <c138a478549e5f03500d69da61d17597601ef82c.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <c138a478549e5f03500d69da61d17597601ef82c.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TLZP290CA0004.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::15) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|BL1PR11MB5287:EE_
X-MS-Office365-Filtering-Correlation-Id: d74e145f-8881-4a8c-d11a-08dee62ce4e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|10067099003|4143699003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: MrA/uprz+UGSZzL+K8DHMYbS5oaSbV1pZX82pEf0ft4j5vkzOYIvNIpvKuw2Rs/HRvGN8PiPu7KJ4Jj6gJPx8yHu/cKNiqK3T6wqzQ3iySGpviobpKQbI45LA+W8i8Ml+Vvl+loUYctRYqHWy1iCIZi5fwCxIIAQiwYGQcePWa6Lv2IRaNrAfSvqsEf9vSkZhNp/fgwDkzVSwDVhUbS/n5g2CoAiB5K4enpf+qDgOLVBjCwnnppIT174Y/HlVNllHnJ8g6LPV/+B3kxosTNfe3kdcrknrQK1jN1J40Tb7FGNaWyJIqHmCXWP4GcTTExQ2OTNtsLK7vq2OOhq30e0Vkxhv4GiyNEfk8M7Mytrv0U/zML4Jya8+rcnOhtM72VBZXxfJWgZzDUbw6eGKnmf+mFQ7NhnHk7GxSWWz3T43Pzm0MkuNAgqkPUOIBFGyxsbA8Wp5LCAXjTzHf7fxqxLgyo5H88Z2Tqk0Uz3U0hJvZ3UZzLAz7zsuRRy6Qk/c9YQezCBU98eOzwjNxhN3wnuBNQCYZr8tV7vFMTpqVvqq//3PhjrP195H7FxS5Ik2RO8UestCZgpY2rm2nd4ixECfqrbgR9f37t/Ret3R0VjT5QfPk6Yla8TNGBvwKkqzGiBgFftPoSi7OHcrt8mChvAVSrJsZA0g2ZtKD8jZl0RMac=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3ZtZHVjWVFsQkZJam9FK3RidGFhaUl5UlQvSGNyc3RzRnQxQnJPS3M5Y1JI?=
 =?utf-8?B?VlB0elZEc29aemdXTlIxZ2piRytxZW9WZ0lTcmMySXY0WXF0eU1uMDBYM1Rq?=
 =?utf-8?B?d21nTEs3RnhOb0xGRXJGMVpZQzlnYVJrSTRNTE9jMjhBQklOWUdPQ0RGMlFq?=
 =?utf-8?B?R1VQL1hEQXFMQVhFTzdSeUNUTlh3czBMWlF3NXdzSUFrbFJTaDRmbXIyODR5?=
 =?utf-8?B?ZFNqQ0h2RGQ5WHVYbVU5RUpSMmN2VytNNStBSWxwR2NWd3ZPN0NkMVRvMnBD?=
 =?utf-8?B?d28rZkdFU1ozYkhLL21YM013cVVRbzl5bEpJNEpyallpd2l4VkQ5RlBZRkNy?=
 =?utf-8?B?WWVQNVY5Yi9lS0dMcE81S05rUTFSSDJzMHU3VmVWck9YT3hSTGZzclMzWXBm?=
 =?utf-8?B?YjFWSEUwV2JjT0wyZkttSUJzaGVtVXdsdVJRUXZ3Q1dpWXZmclBZVURuM3Ez?=
 =?utf-8?B?a0FEQys1THRoOFBMYXhqYXlNNVBSUDBrSmxKclg5M0VhRTYwV3A2TS9UME04?=
 =?utf-8?B?YTVFUGNNYWExM1R1ZVBzOVBpcUt2VS9DWk9KZ2lKUEJhMnMrYnBOT0g1T1FO?=
 =?utf-8?B?TCtaQzRPNURaRlRDNEpESzdXRm1sTFIwTExweVBHa2lSQVVpL2dDMWw4TlRh?=
 =?utf-8?B?Qmc0bVc4NWM3TjRJRGk4cmt5OUxuWWoyWHp1cVNsK3o2ZnErb0ZLVkNtSG9E?=
 =?utf-8?B?c3FaNzRJMitJR0kzY3Qxa2tsRHludExBZjlVelNKVlNoVytDcGVHdVIzRjJK?=
 =?utf-8?B?T1UwRm92UjY1Zkc3ME55RHAvOGw2STI1ejVRaXJROW1iTCtmc2FUd29haFVS?=
 =?utf-8?B?cTIweGg0dzljZFY0d2VDbGVHbkRmZlpYcGplcjh4NFlNWVl3MS9lNFRYRWJx?=
 =?utf-8?B?bnpJNWI3Z2gvM3g0TmdZTldBOW9NQys1R0dRUlQ1OEFvTHJxMzZDYzc0Rkht?=
 =?utf-8?B?MThXei9TK3RrclBTS3dHZGpmbWJ2T3BoZDV2QURvQkRKNFJhTkU5a1IrbXpS?=
 =?utf-8?B?ZlpKbzkrUmlLbUFsMENzcmhUMy9aQ2RLQ1dmUm1zT1NwRmJNazZ5Ry9lV3d1?=
 =?utf-8?B?TTQzTlVJZUFvNlZIVExXUEI3SGMyZFpWOWV1Q0RoZ082ck1Pc2ZvQS9DMjlX?=
 =?utf-8?B?ejBidjlMMzAwR2pZeEZkb0U0SjNRbm1ENUt4VWJPT2RmSm93N1FjdnBLYlFX?=
 =?utf-8?B?a01MVDk2b3ZXMXAwQ2JnVUFkUElFV2x2MkJhaUw2dnpFMzRsc085VGN2RGNp?=
 =?utf-8?B?VkhqT2RIVzVodWFYdnRQSGc0djhvbXpLYy90SnRRWkI4TXkwdWxtanlTSzZP?=
 =?utf-8?B?SFBBYWw0a1cyOUVZOUI4eEhEazNBckJXV0dQWkw4MytyakpBMXV6aDN1Ulh1?=
 =?utf-8?B?VzY4Sk9pSkE5WTJ3Mi92eHVpNmE2UWxLZnpQUWpsbVVJMjFnUmhmbmRIMFly?=
 =?utf-8?B?UFlNV0VFd21lT1g2UlIxL2JpeW0zMzFUdWdOVzJ5MHNBL2w5S256Q0pDNUVz?=
 =?utf-8?B?dkZLYklGSTdGclV6KzNvWW9YTWRnejdJU0FIU0VzeUNJRHc3OGdSeGlnWDhV?=
 =?utf-8?B?OG83NXFHdXVVRng3Q3B6YmFndkNTUm9KajEwTXM4Wk5MUjQ2SnkwRGNQQy9S?=
 =?utf-8?B?QnRWdlhHV01MdVFleHM0RXFSR1lPYnQ0WjNPMnNOZGpIb09QdngwQkFIS1lR?=
 =?utf-8?B?cW5Ub25vb082bisvUE1PQlk0YVB6K0pBYXFWRzJpbVZhN2ExcUZmRi9QSldG?=
 =?utf-8?B?cTFtQWxoUkJxMktsVlVnckJvcEN5T1JlNmtJd1l5dnNiKzMvWlR3ck5QRXFl?=
 =?utf-8?B?YTFnaGM5akV5RGZRcGh5L1h4Qkl1clAvQXFUSmNkSGJPdkQ4QjlwQ05URjFL?=
 =?utf-8?B?YlhoMnVRTEZISUltN0laMWtKMGM3QldVWUpMck12ZmxXeTZlUzNETkEwcTZB?=
 =?utf-8?B?TzNSWkp3bHpZWlZ4dlNFYldpQ3gxM3BMT1duQ0l2RVFjaW5WdkNjRXE3QVI1?=
 =?utf-8?B?amNGNUo3czg5WlNTMm1LYTAvTEpjbkdsdWROaGg2ajVJN05FNUNzQTJpRitO?=
 =?utf-8?B?TXlsbUpyRFdvL1Q3UjFxNFhWV1BJSDY1YzdJcndYR3R0ZE9QQUFNTWZXQXgw?=
 =?utf-8?B?WFhvL0pHZkV2UWVFZDlTMjM2VkVFRDllSERTQ0NmY0p2MWFZa2hrbXFiWXpo?=
 =?utf-8?B?TDZ6VERzUG1pa0lGNFdHL1p6WnNrQ2ttMWdQTGp5ekpvZ3FMNFNETm1rZkJH?=
 =?utf-8?B?cDBGUjN4NmIzMmFRTUhEbFRnRnJCaThqRjZYYmZHRFdUMVlQc3p1RlllMmM5?=
 =?utf-8?B?d0pqVnZaUENRaUM3UnE4NGcra2JPQ29vSmhsZW5GWlZpVnJ1YklGNG5pZXFZ?=
 =?utf-8?Q?tgEMzuF4ZTesLV04=3D?=
X-Exchange-RoutingPolicyChecked: oPeA3lqDpjUQmn47/okd5GbkhVc6kMk5ZcYExtnAmw5tMyvzjIe5QUTBN5u1eQRBPtn3feKKZhL6PhomhEHmnKbrwRn7Il51PvBbVgRSjZ88vxjzud3OS199ezbMOENK/XIV5SvQfLmNtZOTfWqAqfF8UnFwe00SHWLDihytONJ7iep3vzOg5lxRdD/KfnIRZAtqkeAKAkXr5dNvR/0hOZwhROtGf/Xt4zZ8bdtLyL7mycuWIFHGWKwvkSonxWA+s1msCAKx/5O6GaDM/G9/N1nK6EtlVLix8mEJmN37Q4lOaVE6kzhRatmyKpgtXNn0uvY+D6MlVGm4sIk64mQUDg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d74e145f-8881-4a8c-d11a-08dee62ce4e5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 07:02:42.7754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZao8GrSTS1IwqONjglCmF9CdBCP1GoXLb2BS7WoO6L4Oi3keo0WCxK+TJeqxkTFl9E1Pj5FOXMOqrxTPxBWuQqqZrvEZOIo3Q3JiCStNeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5287
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

Hi,

On 2026-07-15 at 14:15:28 +0200, Sebastian Brzezinka wrote:
> intel_vbt_decode only needs the chipset tables, half-float conversion
> helpers and the lightweight tool stubs used by those helpers.
> 
> Switch to linking against lib_igt_chipset, lib_igt_halffloat and
> lib_igt_tools_stub instead of the full libigt.so stack.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   4  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index b04754c5e..46cf1a717 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -34,7 +34,6 @@ tools_progs = [
>  	'intel_reg_checker',
>  	'intel_residency',
>  	'intel_tiling_detect',
> -	'intel_vbt_decode',
>  	'intel_watermark',
>  	'intel_gem_info',
>  	'intel_gvtg_test',
> @@ -88,6 +87,11 @@ executable('intel_error_decode', 'intel_error_decode.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_vbt_decode', 'intel_vbt_decode.c',
> +	   dependencies : [lib_igt_chipset, lib_igt_halffloat, lib_igt_tools_stub, pciaccess, libdrm, math],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 
> 2.53.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
