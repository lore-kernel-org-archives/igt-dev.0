Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB84D70E16
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 03:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C6110E4A1;
	Fri, 29 Nov 2024 03:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YdPF+Vp5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519DC10E4A1
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Nov 2024 03:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732851913; x=1764387913;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wTBZ/L53Ul1O/OlYMfG5gH/vH1wh+rCZkQp91R+/L/o=;
 b=YdPF+Vp5F211vjPenzjpbAsuGkKrDsDR5hcKboH+3UwxuQnR3Sq+fRrg
 584bEU4GmasJr9kNx5V2ghn1XS7sd9s46EyDrTXp3LtsQxgHFdFhND/id
 D25zCkspcgtMUYUMiV9TsYDj89KKiBSiVdBqW2mD5NkZUMRP8mD+rxbQj
 ce8l93vF07u8ChM44lrux7+nJKEDl03+f64ivb1pKOSi/JRYmy9zsCLpQ
 aTcGFFSprD/LzlkP3rrx1eEb6PbhhiuxttnrZ0+212zzw67LXZGGyo+6h
 vWOLAqwWcF6J1kE0iKkdU9rZ0FnIMB3W6R0tAjhfUm3ieK+WZPBq/Bk/m g==;
X-CSE-ConnectionGUID: giRbEIXlSd2updQE8KThKw==
X-CSE-MsgGUID: 9sMqF8uMSXuJml3bDbVCOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="50605134"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="50605134"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 19:45:12 -0800
X-CSE-ConnectionGUID: l9LFUa2lR/WooBUViGVVeQ==
X-CSE-MsgGUID: r/qHZB+STQu5Pd4naYv0Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="92296129"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2024 19:45:11 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 28 Nov 2024 19:45:11 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 28 Nov 2024 19:45:11 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 28 Nov 2024 19:45:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wgHMaHJTyTW+v8ght3gAbWYuWU99gJyT4ZzkIGv76rkKpsY2g/567YRbhcyvg+m5zT6XjnOaIOY3T97o7R4HrmBfkesX3jD1IoOUv9G8QnpzZEuMqH4kgdNIJHEpNSL8Esg8X4roYkQ41Q/QWk3Hs5IXKr2mbPnvBLCudHv74BN7Yk4JSCBd347u4xAzYfVK0Yot6hbpqH5U2Nvx39grrF9HhP+C/PfeyFMfHjQvXhRDmrPyo9/WwL7CMVJefVM2VrR0+3IevNkfeQ9ZpYvmaI0QcQ3990ZaIFZGjCm1g6ZlmwC4S/YvG4jtex/OCXEbQ3X4bF0CsukCzSqPYQfNvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NoK8xtYc3KxIhMtkjVmzWkee5bfEYNZv8GiwPSLMEk=;
 b=Dbt4uonJG3nDYJl0Gd9KMZypfFjeCZv12u5Nbntd00bgkwZldiL9cVuZysmCKh6KrZkBIyY+3KoccgXCv89NX84SWrvUgpZawQUAcO0ndi3yl+bB6UypuDbxq80oqPZRveOe/+M6z3S/l4uUDg56V1vEg5UnFZ8cD/nztAEyPeunLl+90t1HFWcsNz/feRREjlHghG7rwkivmqn8SMlQbipAi9sChAXobEa7xqD1RnMoERNc1O3T/NQs9sPY+qJfTbKdlr/CgQXLUZdHMy023UD2YMzeHdVRK3OaGrOOeB186vNAkpjO9rlT/bv6XwD1sPfa9E4qM0h2Lmd+d1KoRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CH3PR11MB7675.namprd11.prod.outlook.com (2603:10b6:610:122::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Fri, 29 Nov
 2024 03:45:09 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8207.010; Fri, 29 Nov 2024
 03:45:08 +0000
Message-ID: <3982ab70-de35-485c-aca3-53c4296987ba@intel.com>
Date: Fri, 29 Nov 2024 09:15:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_invalid_mode: Attempt divide-by-zero in
 drm_mode_vrefresh()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20241127110012.13349-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241127110012.13349-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0195.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::23) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CH3PR11MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: e1ec4a3e-1f39-4b27-3c63-08dd1028386a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmEwMExtMVJESTBmZ3JKeEtwN2NnUmZEemc1anJSdHRWNVVHREk1VlBxYkp5?=
 =?utf-8?B?Z1F0WEV3ZmhCSXBKRzFvY09hWGVWZTdSNzVmaVZhMWhvWHhBMXZHZXE1Szh5?=
 =?utf-8?B?Z0dGbVlTejZ5eWpsdFF3OFlEWU9RUkxHM2hNdVVzUTJicmFUZUJrUmVRUjZv?=
 =?utf-8?B?dTNyMUJwWGhjQnQzNkcyTXZOaFBiM1kyMXAyaGVZbUhCM0hxS1hDQ1JxSCt6?=
 =?utf-8?B?VDBKeFVyVzczSzZ4RTNmczJDYmQzVWc0WlRzOVcybi9IakFIYmpZYU9CcmZ0?=
 =?utf-8?B?R1NyODRlbkpiQmZISzRQZnNnNTdEQXVPVC9kUlNUczZoUHJ6NytOamZWNEJX?=
 =?utf-8?B?L0tiT1d0YnFlNk1xRENOb1V0RFhWdCtJR0dDNkRBNXVrd05pclRlUkFOUkFp?=
 =?utf-8?B?Znd5cGJUMXUrOEI2cjJKVFFzNGlkWmtaMkdWLys4K1o2clhnemFLejUzMEFn?=
 =?utf-8?B?WTF1VnduRWFHWTRYNnZuRndBaXpjdm1aRFBHRjd4MDJuVDMzV1dMUXFOSTRq?=
 =?utf-8?B?WHZYN3o5QmpmbSsyTVNQamd0dVpYK1lTdHg1QmxkYzVLSTMrOXV0TEZ2YW1K?=
 =?utf-8?B?R0xMcXR6aE9hTkVsQ203ay9zVlMwRzNqb2h6SGx4aDZlOGNEa1ZrYS9mRTJG?=
 =?utf-8?B?bFR1Njdjb1ZwZ3NybzRKNFRmM0R4Ykh4ZzRpN3hLU2oxaWZocU9ZVkY2OEw3?=
 =?utf-8?B?K2ZZU21QTlBwcUZpN1ZmalZPUUJoUHdsbmNJTURRSUFFZ0t5a1FKWnJWYWNn?=
 =?utf-8?B?YmllN3MzdzdLbGtpYmdoTTZZZitNZUJicWdrbUplL1liTmQ4N2x4YmV6SGEz?=
 =?utf-8?B?cUt0bWdFWU45MWR0cGdOMC85Q3JHdGVOQmlzYzhEQ3o2RVVYRitxZEJ0KzNN?=
 =?utf-8?B?MlR3bW1aVENUeURZY3pzbXlveUFPazBvOGFESkZYanJic215cStaMWdQY2Fv?=
 =?utf-8?B?dU5IU2s4NXJMV1gzUnNMZWpBcGlBdDMzSkZhbCtYVmRGM2ZIOHh6SFU5K29a?=
 =?utf-8?B?aC9nb1EzRjlYR0E0bThZVGZZY1ZCWmlqbDJCaldkekh6TkNQOURUUWZPajlI?=
 =?utf-8?B?dzlYU0tHTVFTamIvbEhuKzV4REd4NElubEpUeHZ3WFJJTkFLVGQxV3VkMFIy?=
 =?utf-8?B?M3hxMWx1eHZNVWtqWDNDRmt3UTlybThBQWRKWnovSlNQM29ETUtTUHpzRS9N?=
 =?utf-8?B?QUR6Y0hZRjF2YVdUc0tWQkZiaFlxNnVxeHFET0d4blkwWkc0QlRTSjlQYmNx?=
 =?utf-8?B?SmIvclJjbys5NEg1djFZbjJoYnhpNVRvZnYwbi9GZUpWdS9IYklBbWxPRllD?=
 =?utf-8?B?dlZCMkJFdTRaZWVzRldyRzVDYThWLzQ1NmE5NStaWU95ek9ublJZMkNEQisr?=
 =?utf-8?B?cFZDeThTK1l4eG54WFdMeDA3VUMyaDZCbWJrdXU0bkdqMENCejZhbHZNVENx?=
 =?utf-8?B?SEF0TkcxQnF4aWpYYXhpencvUzAydjZiRnlHbjBqU3NVeTNwbTN4ZTJzdjBU?=
 =?utf-8?B?MTIrQnBzNjMrMWkyQmh1di9kUjZPWjZjQ3lQK1BJUGFXOThRYXZCdnprS1Zw?=
 =?utf-8?B?eEQwT1YxeFpFTDhMcytvb2F6aXZJZ2RuRUFwYXRCTGxYenBCYkxuMmNqY2g3?=
 =?utf-8?B?TXNWZGxvcVZUeXQxQnVZNlFOeE9YbWlLNmtRQ1YrK3JIUFlPY3R4SHFyS0Zl?=
 =?utf-8?B?RGEwbHFIbmxmdi9QTEdMVUNJRGRKa3NFSTcyZHhMd09Ud1dNUUppOHVPTkJ6?=
 =?utf-8?Q?R+zsYiizlD8axAPHwE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGVKN1M2QUtBaVRJRC9oRjJqL3BKbGdEOU1sR2JmaUdLRUNuaG1Pd1JFeERG?=
 =?utf-8?B?THV5amNjVm4vcFMxeHA3NzRUR1JHUzNjaEZMaHd3RkhwNjY5R3ZBOUs0MWFB?=
 =?utf-8?B?ZTVaamk0ZmtUeGdwb3BqU0wxeUdrcngvTEZnL2w4a1VSYlJpSDB6UzVyd0U4?=
 =?utf-8?B?Y1VwemFJcm5OVXVJT2lDc1hQK092enhuNk9GS042V2daUFg4MnlrUWlrb3Rj?=
 =?utf-8?B?VmhvNUlXTk9VQlRWUzBsOU0zdWdBNlpIMGZuc1Vlc3hiQ2t2SVE5YjNtZE1C?=
 =?utf-8?B?M1hYQUdGSmZLRmRxT2xtMStLbkd5dTZRNG5rQnFLQ1BGajd2SnNjOXA3eGlV?=
 =?utf-8?B?Q3VwS1pKWEM2TndXOFV6bWtmUi9VWVhJNklXcEwxZ3l6SDFUejBLWjBPSmdy?=
 =?utf-8?B?RTYzcW9UWmhVeldZdG9YUlNTS1BhS0JWNmcyOUZIVFVMNm5PVVBRVEFXY0Y4?=
 =?utf-8?B?RjJVMVpNRnhUYUwvbjhPVzJzK3JCcDhUSEJMQll0NEJWUVBtclYvaEEwOWpU?=
 =?utf-8?B?eTRzNENVam9PaFluelBpNDd5amZxZTNxbk4rK3FQeFVTVkZwMFZiTXRScWxo?=
 =?utf-8?B?MXIwbU1SeHVwU0xCYVY4SUoyZW9FeFVNTXdEeXExQXBjcXVsNGFPaGU2Uk1z?=
 =?utf-8?B?YVJtbEtrR1ZJQm90dUtaZ2VrdDJzTnZMc2lMQWZ6U25scFU0TjF2TklKaTdO?=
 =?utf-8?B?cXBSS3BuNGZrSDFrSW12NjZLZWVVbkhDSWpRdUJPaUpsY3ovSGI5KzF2SFBI?=
 =?utf-8?B?VzNmRS8yZ1FoelhOaFJKNTJKTWsrY3dzWmtDMnpUdXg2UjhWSWJLTnJNcW5M?=
 =?utf-8?B?cUlYYlVjZWdRaXlCQXJDbGtwVUs4Si9Bd0V6RU4xSkJycjhoMHpzRVFiQ3lu?=
 =?utf-8?B?TmkrUHlod1RPWGg3c1NsYlpObjFEV1VFMFc1dHl4c0V2c3VkV1FUZUlDK3U3?=
 =?utf-8?B?Z0VmSW5MUlB1M2N2RGJKU0lCNUlsRnF5ZENPcnN6VkJ1a0d3Y2dGZU9GRVk0?=
 =?utf-8?B?NTRxa0ZRbE15WUdUQnlQN3huQ1FwdTdWcU9wb3pWRHR6UGJsSUM5M1VvS3hE?=
 =?utf-8?B?dmt6dmR0M2pnYWpqeXZKZFVpaHRRUTlTNndka2FGZTJ1djZSdzBxVU5vS0to?=
 =?utf-8?B?NmpVS3VRVUhubGhULzBIRHVrZVlZTWN0eHJ1SGhOTVRUS2lHb0lISkdVQk16?=
 =?utf-8?B?MmdNSEFYTEJXMUtoUTh6OUtmdWh5ZFJ4a1Z4STJRQmQ1WUkwTzlCcEhEQkRS?=
 =?utf-8?B?b0RoanB5L3NRU0VGdzhiN0RyanVGQTJHalNoUkxiZnhyd2Nlcm9HNHFhREJR?=
 =?utf-8?B?Nk9IUk9tSERuNC93TElJbVpNUVhadnN6Zm9rK0djM2xjekQ0dFJmQm0vUCtJ?=
 =?utf-8?B?L01RRDlWWVhqeXIrZURFbEZzVkVBek1FOE9ORnJ5a3N0em8vd2xJWXhXc0Jj?=
 =?utf-8?B?MnJPMXpKRFRjYTlvUm1vanV2L3B0ZzRyNm1pTURqTzJxOVg5Q1N0YVJCUXNM?=
 =?utf-8?B?bGgvUHJUckNYQTJEZk1GbjdqSnk2VjVHaVFIcFQxME56aVRQbExjQ3B2NmtC?=
 =?utf-8?B?eDdjQ3hRUk9OTTlJdWNZaUZFN3RkRUxHTUZtMVdCUHhlMjFaVC90ZnkxM2Yr?=
 =?utf-8?B?Sjlma1hnZUVOR1ZMOWpSeWJabUtGUVJyQTdWNlAyQitYVTZRZUNUbDNRSWFI?=
 =?utf-8?B?ODhSc3Z1SUtmNFRSVitZV0pxM3pWTUtqWlZxL1g5UkFxN1JvdU1pcnJnQll2?=
 =?utf-8?B?RXl5b2JpV2tzSkZ2N1hpaHFGM2tPOUxCSytXZGdJSWhmTFFxZkxiUnlwMWdw?=
 =?utf-8?B?a1JQcC8zTFpFWldPMWZ6RFEzZXh5ZkVvdUMwbVgyeThxaVgrQkhBcXdlSUFX?=
 =?utf-8?B?dnhwMTEwaTBBT2pVT2hJQkQvaGxOazk1enNzcmZva1o4RFJNUTJxWHZLWVRy?=
 =?utf-8?B?SUlEK1BnQmJHMS8va2lwTG00YzV0WXRpdjQ1SWJwNFZ5U3hGdTl5enVuY0c4?=
 =?utf-8?B?U1psQWJEOWlzakRULy81SDQrNXcyVGp4NFhLM0lzdnc0RDJEV3VjWGk5U2dx?=
 =?utf-8?B?aHRFNk8xbWh0YlNMQ1ZJK3VQWEhyVFQrUnJKQzhENzZORjE2UVozZnNPakFV?=
 =?utf-8?B?Yk9yOWxqdkQwRHp1Q3k4cU1jb1VVWVVTSHlWcEV1WmtCQkVwTVVqdUlYb0Fz?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ec4a3e-1f39-4b27-3c63-08dd1028386a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 03:45:08.9048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UEhC+Eby1xr9GvMwVetJzTWeSFSRHKknAWJ9zzDgvC5+dBRaqhA5pXrEiulhjYJub4GTkcEN9o8d2F+hDis8lw9qni5Skw0UBeTov9Y/coY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7675
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


On 11/27/2024 4:30 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Add a new subtest which attempts to invoke a div-by-zero via
> an overflow in drm_mode_vrefresh() (found by syzbot).
>
> Link: https://syzkaller.appspot.com/bug?extid=622bba18029bcde672e1
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Catching the issue nicely: 
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-5/igt@kms_invalid_mode@overflow-vrefresh.html#dmesg-warnings177

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   tests/kms_invalid_mode.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> index 4fd644594ef9..5fa85338c799 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -210,6 +210,20 @@ adjust_mode_bad_vtotal(data_t *data, drmModeModeInfoPtr mode)
>   	return true;
>   }
>   
> +static bool
> +adjust_mode_overflow_vrefresh(data_t *data, drmModeModeInfoPtr mode)
> +{
> +	/*
> +	 * htotal * vtotal * vscan == 2^32
> +	 * overflow during vrefresh calculation
> +	 */
> +	mode->htotal = 32768;
> +	mode->vtotal = 32768;
> +	mode->vscan = 4;
> +
> +	return true;
> +}
> +
>   static void
>   test_output(data_t *data)
>   {
> @@ -285,6 +299,9 @@ static const struct {
>   	{ .name = "bad-vtotal",
>   	  .adjust_mode = adjust_mode_bad_vtotal,
>   	},
> +	{ .name = "overflow-vrefresh",
> +	  .adjust_mode = adjust_mode_overflow_vrefresh,
> +	},
>   };
>   
>   static data_t data;
