Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08517CCFA05
	for <igt-dev@archiver.kernel.org>; Mon,  3 Nov 2025 11:08:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E4E10E186;
	Mon,  3 Nov 2025 11:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bvpj3RGn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DDC10E3C3
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Nov 2025 11:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762168111; x=1793704111;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:mime-version;
 bh=Y3qHsdhl2GsZqYp46nVXwIggWisWfxVqknEqF/T2ub4=;
 b=Bvpj3RGnoVZGD/3GN7+STChlf1fPf4gMNOEdQQIoJiqQ8weERyU3mFiU
 BotxfD0TZ1poyB9ahtkM1Hhqj8LyLf7wS6qZl8ZnJ6Z4AjVLTeYhz22Iw
 PtSlwL7u8RSuO4bbqbIvcgleSNdJelW2TLb68WUUqWXpmjA/61LiO3mTO
 rjq4RzxpCwSvdQmYM/Ctw/bfFy5ez9+DjJiojNujQc/nvTawdiHlmjAXJ
 cYox/6JFmZhO+dZDzPmlJkPsbB55YmOZTkqFlUbZiGfOVCVCYCNADidl2
 tXI6VOyFqzC4ZoRdrcnTYLDNzdGZNsGS4xwTEiIACD1ynbH0bUHen7zne Q==;
X-CSE-ConnectionGUID: zAuWXI87QNm6NLepaIp0PA==
X-CSE-MsgGUID: beVpYzC3SsiyeRCWXpuG8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="64128031"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208,217";a="64128031"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 03:08:30 -0800
X-CSE-ConnectionGUID: i9wBYzMRRN2UzwFOEB12Og==
X-CSE-MsgGUID: Gt7zHOsTRlSriMV5qqRF3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
 d="scan'208,217";a="186130867"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 03:08:30 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 03:08:29 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 03:08:29 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 03:08:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dot9YDNna6dkERoajSJItYb9141KDgS8W9ooW73jX1gQxjVhozZo53eHDw0Don5J2XYCyyq2PNE/oBkyc/InJ1uGDRf17m/ArspIpTXYKAmeBruDKUaP3GnWlB4y4msR6cT+7I0EM8ankqTFwlMr/CG0A1yc/Qm5o2ZXjflloERJKyq6OaFUdIvSerbtHZeE6ad252vMi+P7ALlgYG/3mNZAzEpZpXPllEj+LgkJjUC1p2AjA56x5Pe4qlhMPh4RllrK9PCfIIED/SkC54RQqoFmVG4z2spbHVAZFidTBLiZfC1mtsR4YamnfR9VI2ZNtdXN7sOCFj8SZvdR/5pr3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HGKqO4nVJ8KPl4XkGtQ9u63/efZVnuOZMZJLfEL1qU=;
 b=xuI6AdsdPFUWg5KiSaifi+hhSWWisQ4A6jEoikb7mbJ9zC804zxB2YZHR+tBTv10xteyAhQMX5yySwvc6zm/r+7DrCztfiklQJDjZ5m5NS1SNluD12WSGIaqlvSj3X9k1gejxcHKFIhuIWqDoZiSzRXycWmPtvPS4AhN1GFTCiUpo0/9GoXFQAZ+V63NV0tiIZLdt8Eayg3CrKz4IPUJqFprPhOU2/tBI7pspW2sss609rPQ/ogwvanV2mHhqchIm60rBMDjZr8lIMf0OGtwuB9vkFjD//ReWFXu9Ouu/ztV+asZuSpH8YHaALUsFDg53FbdqNR5jHJAfRD2JqICfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by SA0PR11MB4749.namprd11.prod.outlook.com (2603:10b6:806:9a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 11:08:27 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%5]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 11:08:27 +0000
Content-Type: multipart/alternative;
 boundary="------------LOqbq5m0pxuNYLjB0RVW033d"
Message-ID: <d8b20e83-0a90-45ef-81c9-a3eef044345b@intel.com>
Date: Mon, 3 Nov 2025 16:38:23 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/?=
 =?UTF-8?Q?xe=5Fsurvivability=3A_Add_xe=5Fsurvivability_test_=28rev11=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20251103095921.3889090-5-sk.anirban@intel.com>
 <176216697308.11009.12738711797140029633@10055242dc62>
Content-Language: en-US
CC: Riana Tauro <riana.tauro@intel.com>
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <176216697308.11009.12738711797140029633@10055242dc62>
X-ClientProxiedBy: MA0PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::20) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|SA0PR11MB4749:EE_
X-MS-Office365-Filtering-Correlation-Id: 127e2fb5-a1a2-46cc-11f4-08de1ac95040
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFFxajZWK0VvUHlnaVB2RG15dW9CeUFZV1hEMEZpbHNnV0p6RHpvbGZSTVRv?=
 =?utf-8?B?M1dlQklmcnkwMEpUYml3V3JZdlJna3ZiNXpNcG9GTWVCMjNLOGNCYUxMTk9k?=
 =?utf-8?B?L1lKb0o4cE8wVkdMVU5pMzBaSUJmMEZObmVubHV2bWFzdlM1ZGRyNGlqa1Fn?=
 =?utf-8?B?dVFscnJ6Z05zbG1vWDMzMytmKzRlSWE4NlZGWHJ1QWhOU3BZNFVCemV4Vkd2?=
 =?utf-8?B?dlFMVnd1WVBERkFxNCswcE8xOXVNNlhsc3dpWS8xK0RHZWYrQjFDS0JDYVdw?=
 =?utf-8?B?WlVEMmNTNnB4NXZyVno4alRTQ1puLytWWkNOU2JsdkVwc2xCVTNlbC82d0c2?=
 =?utf-8?B?Qlp3V0NOVHB6YmN2VG5aSFhybWIzL04yTWxzL0N6aG0vaEUrQXFWeHNlSW83?=
 =?utf-8?B?d0tONGVCNXl1RVpVSW56UDlvRGdma1NrZW92Ym54b0twNE5yKytwNUhyRXNZ?=
 =?utf-8?B?K3hqOHVFS09waXAwUVpvS1dRVndkZzhaTUNUWHE3Uk96MXZ0NVQxSGhnclNh?=
 =?utf-8?B?dVZxa2h6V1ZZUm9ZUU5EV01oRk1CSEhlcG5LU1NjaXE1Y3NlazRnZFBoNTFy?=
 =?utf-8?B?dEhyOXFpWlpXbmZEa250SERHaTJRRmpmek1LUVM4T3pieHZWcE0xS1hDTjRj?=
 =?utf-8?B?N3B1K1Z2UXFxTnFZTmVBb3A0V1YwdnNSU1hDM3hWdkRLLzlIVlVXRUdxc2Np?=
 =?utf-8?B?VmtrQlZ4SHQzSk03KzlEY0lVZzQySXdXSlMzU2diTVV0N1Z6c29LVGR5Qmww?=
 =?utf-8?B?TENkb2VpK2ZQOU1KdmdzZGVQaE5ZTDkyaW94VDVYd21SM3E4NzFZWDVyTHhv?=
 =?utf-8?B?U3BxOWJXVnRKZUJabElLaWhvQko5R25hYi9adHB1SUxYdkgzY2RSUWNFNlkx?=
 =?utf-8?B?MVQxR3k2RVB4YUQrOStoaXdZdStKZmREdlRPb0pZYXBaaXJYbUE4K2htdTN0?=
 =?utf-8?B?WGFZL25yS2tRZEpqQzRJQ09jYkkwcTROaGVCWStjanFZcEFJOVFQZE5GeCtl?=
 =?utf-8?B?SHl5eTJqemhJMUsyaXhBR1UxMkRoSUk1RVJkMUtPc256b012OWdYaEpHbDg1?=
 =?utf-8?B?MUFXVDF6Q2JoQjJHeWVDbERZUldwNGZ3TzZ2Qnpxc1RsWjBkaG9wT1FMSnRO?=
 =?utf-8?B?SHpnV0U0TXNrSmVIdWFTOW1zSGZ0ZTV3K0txRHhhWFF6NTFYbnlMNFZ6Qnhq?=
 =?utf-8?B?TkNvRjlUZVRYRnlMYXhxMEdSdG1WMjlBUmxrT0gvNDVaekZ0OXdCeUNLUlFU?=
 =?utf-8?B?cG1ZbHROVG1pZXJhamVkb2ErYS9LZG9OWGxGV3ZJODhMNmQzQVl1a1p2QXBG?=
 =?utf-8?B?cUpjVjBBcDErK2MxNmZxek5weWljL2hqMGNpcmdYWDlzcU42d3dVaVVWTkd2?=
 =?utf-8?B?dlJUeUwxa0RzbkpmeUJXSnF6ZHhEQUlya0JRMk9URFdwZEVmelh3UkdwU0hK?=
 =?utf-8?B?VGtFSkxqVUdLTUxtNHlqQ3E0U3JJRHdIb0x0UDVVV1Uvek1wcGdQSHNMdFo2?=
 =?utf-8?B?a3UxRTZ5OUZsbm5RRlNFVEphY1pvdGlJditpaWkzWktuWXNRcGpOdllLS3la?=
 =?utf-8?B?bkdyZjZGR0hmZitOcnAvZkdJOUN2K3ZOOFpiUk93aGp5R3IwZ1NJUks3cjNY?=
 =?utf-8?B?ek1KQXBBMEdnUHVwVGJ4SUtBajViRDNXbmJYdW1CM2xQaUVwbFhmeXphWUhK?=
 =?utf-8?B?aVkwTFhnbGFQNjdtcTJVVFZ2dG1SOHRVOTBaaEZTWGlVWDJXNVhUTFZVUWdV?=
 =?utf-8?B?RjF0cENPQUMvVTJkcXdqSDVKT1R6c1Fxcm5IVDJvQWJHZ29ucVJpTW44MzJj?=
 =?utf-8?B?c3hPSjF5Q0JWY1crUWxaN29aZTZwblFETGM1SW53b0dCNWx4RXVFYVp5VjZh?=
 =?utf-8?B?aUtaNTRLVXRlRXpvUTBqclhCeWo1Tlo0TmJTTDVWQjhZM1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXpmS1dENmt6eTFaeEt2cWhQbTQwelpCZXRLYUhNUmNDdGFsOUFzZkZscElu?=
 =?utf-8?B?eUtQWkh4OGkwVXlYL1I2Z2pHd1Y1amJ3SS82NktycmJXZitKS0ZOaFZvb2Qw?=
 =?utf-8?B?bVYvNFVmdWQyYjVjdnNTWU9jSEdCaUo0YmtYQzJvV3JOQ1c3M3RvZnRNT0s0?=
 =?utf-8?B?dWR1VGpsK0toSVdWT0lhQk5tMkhJOHNhUWJxSGZwMXViTHBrQmlPQjk5N0li?=
 =?utf-8?B?dzdXUnd0TWxQaFYwU2NaZVQrRG5GSjVnb0lFOE5rOWJBTTJCUldUTnNhMGFp?=
 =?utf-8?B?U1Z6U2hZMU4wMHRoQkxZNnJqNktUbGJLSzNBRDNVQ25pL0h2YXhmdjN1YzAv?=
 =?utf-8?B?ODVrWkg4djRleEZGckV1Uk13UURLNllaUjNyU2VxQlFzOCtKbkZQUCs0TFhS?=
 =?utf-8?B?RWVScmJ3cEtISWg4UnN4L1UraXZRYkMrSlJGcGs1QU8zVzhNTXB3eHRWU212?=
 =?utf-8?B?bWd1MDYwSmgrNC82bTMzVGxJcWFCQ0pJcjR5ZXMxVWYzRkxreXlMVkNsSkVS?=
 =?utf-8?B?QUtkd011bWdFSk1hdGJzNUZkeVZCS3JMS0t2bm8xUWh4MnltbitYS3MzYWJl?=
 =?utf-8?B?VzJISWxSVlI4T3JwRElycFJpb3M2VmZJbmI4SGd3UXdXMlMwaWdvOUREM2xo?=
 =?utf-8?B?ZTFXOE1QVDcrQlZUSW5TdkI2dzgvOFBaVE9VM3RZa0VJczhKdnQvOWt1MDhW?=
 =?utf-8?B?Z2JxZ1grT3htdTM1RExnd2RIdU5USWtrZEFoUzBrSzZYelVDME1GeThabUhh?=
 =?utf-8?B?b1FkTFRuYXFmU2hUSy90WWFob0RVaUd1ODFnRjc4M3VGQ3pLNHQxTEUvVXRa?=
 =?utf-8?B?RlhwbUk3cjdkZTdBRXNVdXJ2RU9NL2VmYTRQSDMyd1c2OW9MaXJYQkFDQlNX?=
 =?utf-8?B?dVV3c0VycW54Q0RjTHlFZi9jVlpTRktDYTM0bjhPZmdNWmRwQ3M4elpvWk9P?=
 =?utf-8?B?UVhOTGFXOHViWnVSSWNtc2NoZERHL2lkM2tEVjZITUlsU01NR3FMaDI0L3c5?=
 =?utf-8?B?Z0lZM0FseFFnY1VKaTNkNlhmTnQvakxFakhDZkVsUFh6NTBvb3Y1TFFqRUdH?=
 =?utf-8?B?MzM1RUI0REgvcS9mdS82NGZrZVU5VTg4Q1lvR2ptTXVZV2RSN2J1RW9mek5x?=
 =?utf-8?B?SExKOHRzL3BIY1h4TlVqenF4Wm90V0drbnZ4WWg2WG02NWFBMVhPVHd4d2xo?=
 =?utf-8?B?STVRZ3B0RGtiN2IzZDU2aVdIcDNTQ256NER1SGdrQ1JSZlhpOHQ2ZW1KNHBZ?=
 =?utf-8?B?dnROemlMV1gzV3BnU09Gd09MQTlBYnZpa0hSTFI2cDZpb0Y5cEhRR2ZwNzBi?=
 =?utf-8?B?eE1KblBRdnhyWk9ncnUxU3dQRGgwbENjQ1o0YVdKRE5TT3RIUlMxajZIeXNh?=
 =?utf-8?B?ZEZaanV6MXNEMUw1bmtvUGMwaDQ3V1FZaWVKeGN2SFprenVISU9wSWNvN2ZQ?=
 =?utf-8?B?TzJDM2EyYk9VY0l0V0Q3ZTBkZ0tRN1VId0c3RE1CQlMvRnBuUGd0OGFrRzdB?=
 =?utf-8?B?cUdrL3RyK2U4czVQbXBmRmU2WWwwQnBEOGVOWnJncnNYK0o5STJKTVYzRkl0?=
 =?utf-8?B?SUNmQ3M1MW50ZmRHSjY3b0pwUlcyalNNbVdqRFZ0SmEwSVVPRDlINE1LNFpw?=
 =?utf-8?B?bEZMcnRoaW9TMm5DcmRpd042THo0c3R3R0RzMGxTb2N6M1VDK3dSWERZSkUv?=
 =?utf-8?B?QU9zZWVYdVFtS25VUUhUUDRxWFAyVFRWSGlzTlg3TkRRTU1VU3E2VitraHd4?=
 =?utf-8?B?MXFlZW9QbGdBOHJFbDZ6VXZYNGlYRVBTK1dLaXhoQWFTZGl4Wm5BRkduSVNz?=
 =?utf-8?B?SnAxNjJUaWQ5UjFDdGVsSGtnVmNWekRaMGpDMEVLQXJWT2xUdjl2eXpLTHoz?=
 =?utf-8?B?UEVsbFl0REc2UGpiMHVJbm8vWXBST3pManIrR1pxNytTUUsyRktVT0RaRkdF?=
 =?utf-8?B?VE9SVm5kRGVYbWEvSXFMNmpIblpwem5pOGUyS3JOM1ZxaS91TEZiVTlKcnpj?=
 =?utf-8?B?cXZoeU5WZzE3V1dVb3o2cHlHaDVjQ1Jpa0NmSzg3b0h6WGNpZHJ2V2QwNFVE?=
 =?utf-8?B?bTRFdVU0MGs2elBWT2VkQUxyUU1FRjVVYmN0YUJjeWlUbE90ZjkrdkdoV015?=
 =?utf-8?Q?y67/x59SWGq3ul32XuBMznDZ6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 127e2fb5-a1a2-46cc-11f4-08de1ac95040
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 11:08:27.4479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mDCzgsIVBaAxqbcsjzQDfTMCGyuMToYiXfUcpMUpZ+egEA3nMxal+1sJo59MkiK6LZhcY7fQ4je157B9QAfgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4749
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

--------------LOqbq5m0pxuNYLjB0RVW033d
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi
these bat failures are expected. Please re-report.

Thanks,
Anirban
On 03-11-2025 16:19, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/xe_survivability: Add xe_survivability test 
> (rev11)
> *URL:* 	https://patchwork.freedesktop.org/series/154342/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13978/index.html
>
>
>   CI Bug Log - changes from XEIGT_8605_BAT -> XEIGTPW_13978_BAT
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_13978_BAT absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_13978_BAT, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (12 -> 12)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_13978_BAT:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@xe_survivability@i2c-functionality (NEW):
>
>       o bat-lnl-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13978/bat-lnl-2/igt@xe_survivability@i2c-functionality.html>
>         +1 other test skip
>       o bat-ptl-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13978/bat-ptl-2/igt@xe_survivability@i2c-functionality.html>
>         +1 other test skip
>       o bat-dg2-oem2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13978/bat-dg2-oem2/igt@xe_survivability@i2c-functionality.html>
>         +1 other test skip
>       o bat-adlp-vm: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13978/bat-adlp-vm/igt@xe_survivability@i2c-functionality.html>
>         +1 other test skip
>  *
>
>     igt@xe_survivability@runtime-survivability (NEW):
>
>       o bat-adlp-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13978/bat-adlp-7/igt@xe_survivability@runtime-survivability.html>
>         +1 other test skip
>       o bat-atsm-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13978/bat-atsm-2/igt@xe_survivability@runtime-survivability.html>
>         +1 other test skip
>       o bat-ptl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13978/bat-ptl-1/igt@xe_survivability@runtime-survivability.html>
>         +1 other test skip
>       o bat-ptl-vm: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13978/bat-ptl-vm/igt@xe_survivability@runtime-survivability.html>
>         +1 other test skip
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13978/bat-lnl-1/igt@xe_survivability@runtime-survivability.html>
>         +1 other test skip
>
>
>     New tests
>
> New tests have been introduced between XEIGT_8605_BAT and 
> XEIGTPW_13978_BAT:
>
>
>       New IGT tests (2)
>
>  *
>
>     igt@xe_survivability@i2c-functionality:
>
>       o Statuses : 2 pass(s) 9 skip(s)
>       o Exec time: [0.0, 0.02] s
>  *
>
>     igt@xe_survivability@runtime-survivability:
>
>       o Statuses : 2 pass(s) 9 skip(s)
>       o Exec time: [0.0, 4.30] s
>
>
>     Build changes
>
>   * IGT: IGT_8605 -> IGTPW_13978
>   * Linux: xe-4026-203c9c05c014fd3a624e9cb07d86820b3ad63bf9 ->
>     xe-4031-2901e10c5a4844b6d9eb9001c60cd99f5c0f84c9
>
> IGTPW_13978: 13978
> IGT_8605: 8605
> xe-4026-203c9c05c014fd3a624e9cb07d86820b3ad63bf9: 
> 203c9c05c014fd3a624e9cb07d86820b3ad63bf9
> xe-4031-2901e10c5a4844b6d9eb9001c60cd99f5c0f84c9: 
> 2901e10c5a4844b6d9eb9001c60cd99f5c0f84c9
>

--------------LOqbq5m0pxuNYLjB0RVW033d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi<br>
    these bat failures are expected. Please re-report.<br>
    <br>
    Thanks,<br>
    Anirban
    <div class="moz-cite-prefix">On 03-11-2025 16:19, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:176216697308.11009.12738711797140029633@10055242dc62">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel/xe_survivability: Add xe_survivability test
              (rev11)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/154342/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/154342/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13978/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13978/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8605_BAT -&gt;
        XEIGTPW_13978_BAT</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_13978_BAT
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_13978_BAT, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (12 -&gt; 12)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_13978_BAT:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@xe_survivability@i2c-functionality (NEW):</p>
          <ul>
            <li>bat-lnl-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13978/bat-lnl-2/igt@xe_survivability@i2c-functionality.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
            <li>bat-ptl-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13978/bat-ptl-2/igt@xe_survivability@i2c-functionality.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
            <li>bat-dg2-oem2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13978/bat-dg2-oem2/igt@xe_survivability@i2c-functionality.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
            <li>bat-adlp-vm: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13978/bat-adlp-vm/igt@xe_survivability@i2c-functionality.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_survivability@runtime-survivability (NEW):</p>
          <ul>
            <li>bat-adlp-7: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13978/bat-adlp-7/igt@xe_survivability@runtime-survivability.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
            <li>bat-atsm-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13978/bat-atsm-2/igt@xe_survivability@runtime-survivability.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
            <li>bat-ptl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13978/bat-ptl-1/igt@xe_survivability@runtime-survivability.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
            <li>bat-ptl-vm: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13978/bat-ptl-vm/igt@xe_survivability@runtime-survivability.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13978/bat-lnl-1/igt@xe_survivability@runtime-survivability.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between XEIGT_8605_BAT and
        XEIGTPW_13978_BAT:</p>
      <h3>New IGT tests (2)</h3>
      <ul>
        <li>
          <p>igt@xe_survivability@i2c-functionality:</p>
          <ul>
            <li>Statuses : 2 pass(s) 9 skip(s)</li>
            <li>Exec time: [0.0, 0.02] s</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_survivability@runtime-survivability:</p>
          <ul>
            <li>Statuses : 2 pass(s) 9 skip(s)</li>
            <li>Exec time: [0.0, 4.30] s</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8605 -&gt; IGTPW_13978</li>
        <li>Linux: xe-4026-203c9c05c014fd3a624e9cb07d86820b3ad63bf9
          -&gt; xe-4031-2901e10c5a4844b6d9eb9001c60cd99f5c0f84c9</li>
      </ul>
      <p>IGTPW_13978: 13978<br>
        IGT_8605: 8605<br>
        xe-4026-203c9c05c014fd3a624e9cb07d86820b3ad63bf9:
        203c9c05c014fd3a624e9cb07d86820b3ad63bf9<br>
        xe-4031-2901e10c5a4844b6d9eb9001c60cd99f5c0f84c9:
        2901e10c5a4844b6d9eb9001c60cd99f5c0f84c9</p>
    </blockquote>
    <br>
  </body>
</html>

--------------LOqbq5m0pxuNYLjB0RVW033d--
