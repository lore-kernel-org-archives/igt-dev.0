Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00890D1266D
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 08:35:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A031710E10C;
	Wed,  3 Dec 2025 08:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z7oGSAhu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC5010E10C
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 08:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764750942; x=1796286942;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YdNvtPK0HzRlUo1btBW5/jm1SlR18jPBrJSey5cdBTc=;
 b=Z7oGSAhua6lDMyi+w969FG/xTQNAdB5vpJxWwjkaPqHby+vIVSLEROIL
 VweDbxGiwDipPBeMuJb2tlEuMn9NFQ1M9qkAnptUNnvGJdWzmEVK6XQVR
 mevsHEOmCp1ekyIHeY6AjK3SSbCyaQEK2iruRuE45T0X7Xsm0HQZYczXR
 CnRuifnkTLhzbyCwmJwJCMuw9OnnAYf8qYvmMts3G5ZVawXaalb7LPans
 gI7xFap/wRTAqropzjSiXhfd56+Amw75VAJ3RQ4cLMPoX9V/J2Df2ZfHj
 QhOYwCdT9RjC1mEZ5yg5RKmyY9MNOg9ZtlYO1DMPlgFBlSnoiHX9kUnku g==;
X-CSE-ConnectionGUID: rA/OFa1VQBijS6akW62xBg==
X-CSE-MsgGUID: 9NUScKAfQT+LNoK1C8Lf2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66627177"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="66627177"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 00:35:41 -0800
X-CSE-ConnectionGUID: wN86eTABT++Zyw6ypMXZBA==
X-CSE-MsgGUID: LBymhQrpT+GtPRZXu8Df4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="193696256"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 00:35:41 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 00:35:40 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 00:35:40 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 00:35:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZymgR8B2BGbHRtAqXM9T2X9vBqvxo+T1lp61dZ0wgHRNZdPldQBhoUYzGcDXxpbVD3cffMCzDHCFsYW0TC5r/TupN3i4oEKMR0oNXgNKGDBgLRmKKsLcrsxYhzYLYz2RB+6Alb+YvlwMtL16l6dSHVxhLFBVZy6/e6/fM0+2lpVY35fw4qoiKfOZrjYW6BZbN4z9b7j/dorHMXvQ3AZ8aQlZKkK9S7TWSteA5laloqr8jEc26Xe//yjXIzv4YUJCshtozxG7rdRVbVXHQ4I3NL1zI5ZpKK1vb3Rq2eMiTMtGrKwAEA5aEZZqA9W0VZpFRCwpFGyrrI6JFIQffIy0EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukaLlACX7Ahq/s+C2d0kbQfLdkkUwwifPdcfX6vhhFw=;
 b=CA5Hx7bL7uqJZJAgXcPc/BEdQQOXdrKY+NdPTEUh9/T+v2AQNYkmuocjLA/eaC5OW3nU8numdm8A27/lQjKtkNNfLGak8abe8hYrPsbe1tmkd9hsKaeeRs7FFrz4svtSiaJTa7k2PcHS61siIJjwMsSD1fo7MZApaRseOZOBg9JXhsodhTHNldTbB6xRtGb1Ap4EzQR9ywZOLg1Y4IxcEzZrWxwQjoOncmH+CGePTg4eQf6m0wg1ipjg7V2q0oyMFSEVEJFCEmmfj8ld+JLBiZREF7FzNJoeOWwR/BbHGtl6Rutb+p2XsLvmpzqjLD3mM6ov2ewXf0O82yCp/gPxVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SJ2PR11MB8586.namprd11.prod.outlook.com (2603:10b6:a03:56e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 08:35:35 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 08:35:35 +0000
Message-ID: <f2aac5cc-ca84-4d91-a0f4-1f009834799c@intel.com>
Date: Wed, 3 Dec 2025 14:05:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 2/3] intel-ci: Add symlinks for Xe lists
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Ryszard Knop <ryszard.knop@intel.com>
References: <20251202180851.148444-1-kamil.konieczny@linux.intel.com>
 <20251202180851.148444-3-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20251202180851.148444-3-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::10) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SJ2PR11MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: 01b09978-90af-460a-ece3-08de3246eda3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzZTTFRhcEMzYkQ5UzQvaFp3WUI3a3N2bm1TdVNURmF2TXJPNlpERW00RktM?=
 =?utf-8?B?aEpOWEtBRkdzbHNuS0xIQjVyOVN1dXdldmFHUkpHeVdSdWRNNVV0ZXJSOCs4?=
 =?utf-8?B?K1BYMmRyK0JCcVNxNHo2ZzdqK0V1a2ExVnQxREdyZTBCQjh3QkVhNFNRQlhn?=
 =?utf-8?B?MFNXNmZyK2pqTGJib2lxL2ZVLzhxV29FZFhIb0JFcjVGNFdMTDN1VzdheENB?=
 =?utf-8?B?cHBSenlCMG1Da204Y3lNaWpHZzVnVk9wclVlYnZOUWNvRzF0ejQ1djdEV0Ny?=
 =?utf-8?B?ZkE1U1gzTkFFdXIxRHNBUXFjcXBpOHpIMGJiYjZrUmpHSEx3ckFEN1R5NFJV?=
 =?utf-8?B?UG83dkQ2bjRoWjYyUENMLzFXV2M2ZExDZURzY2pXSjBSUGlTQjgvRm91ZFcx?=
 =?utf-8?B?cW5YOGFCKzY2S1BwN2dlNnpHcm9mYzFJcGZGek1qdjZzQXFnd0poSXhhelpi?=
 =?utf-8?B?OC8rK0w1Y2txUDNXeE1RWnQzM2lUME1Ddk1VN0JKbUxmY2hnMnlXMElPTDBR?=
 =?utf-8?B?QlNWZ2xXcHp2SXlLMW5Cdzk3NHhBZXNiVUxoYkdZb09UaGlqYkZ4NmNEdGVM?=
 =?utf-8?B?OWJqZEFMVDBlcFRFUUpOWjU5K1pqZksyOHgzU245SWVjVTF0Ym1CbDJHeVl0?=
 =?utf-8?B?eHlqLzU1c3I5bXJaSXV2ZU1YM3FUR1htdGpvL3ZvY2RjYzFobEIxZmFHRXk2?=
 =?utf-8?B?S3lZMzRmdFcvTWZvbGtCSnNZTlJHTnR4aXhJWVJKTDV0SGlwUlk3Y2h3VHRX?=
 =?utf-8?B?REZXRnp0QnFMOFp0Sm1JQVNSYlZzb1M5RkYwRS9za2hXaWErOGRRTldCUzNj?=
 =?utf-8?B?QURRMmxOL3ZHTklGSUM5SnVLN0Z2WmNsWVFsaVhleEVpWHk4UkE4YkU3ZWRj?=
 =?utf-8?B?dmV6bTNlUlJ0bmRuUSs1aHJmNjlDN3NFMkxpTXZyWnBwdC9JTjlGMm1CY1lH?=
 =?utf-8?B?WGY3ekoyTjM2cEM2SVVnSUs5aTc2UmlWcDcxOXVyVkIyZ2FRaG1PSC9weUti?=
 =?utf-8?B?NEVTSXNYQzNYZ01ZRlpjb2hQU21id0QwQm9NUkl4UlQ1Z21sSW00ZzErZE9O?=
 =?utf-8?B?Uy9iSTVQZnkybG92VHh2ekowMENkYWgwbVowb3dzVW9jeCtFVWd6ZkVaK2M3?=
 =?utf-8?B?aFRORGp0MnpvTkQvTmxnZnVYQS81SWRaRDREZGFJOTYvRkxzWVZaVVFoS3Br?=
 =?utf-8?B?dnVOWlBKeU5zL28vR0lNUFUxN2Z6cmFBRGYvSEtsQ3NOaFJoQjYzKy8rOG0w?=
 =?utf-8?B?WDFwMFRXUHlIVEZVZFdFWXNHVTJrT2NiMjhGSWpnYTRQZEhTWTFPVWtnTWto?=
 =?utf-8?B?WjBDQ1UzRDlDbWxya1d3WGxMdnpZTUxJYzRFWCtUZWk4UFZlbU8rSnE5Z281?=
 =?utf-8?B?aWNOdDBuQktZeUdmN3NxM0tZYWIzRit5WDcxS0J1VVVvUStxcmlJYzBGMnMx?=
 =?utf-8?B?Qk83NURWZTEycDV1QXVMOTBvTGFXNzhvQk1oTFJnYklZNTdSSm5kYTVXbDBl?=
 =?utf-8?B?a0lSNlFmV1ZSME84MjY1ZzlSci9UVjNmck82dTIzbkk4bjkwN2pUT0hndEli?=
 =?utf-8?B?bFExNEd0V3dNQUlUdUZVUVczOEVRZzRBdkl5QVdLdjZJM2FkaEdDK3BoOTFD?=
 =?utf-8?B?Z3dqRkY0bklhSWhBMWJwKys2WTVZZm5wVVNTTmRHOCtkaXNFZ2Q2dHpTZkxu?=
 =?utf-8?B?K2Z6cmNmNCs1N1Roc2s3SXFHUSs4Um5yQklOQXV4SHNMdzFDcFJ5NGRrNk5M?=
 =?utf-8?B?SWhZck9ORGYwckFVYlcyNitZOWY5b0t1TlRIOTA3cFhpT2E4eW9ndUpFMWZp?=
 =?utf-8?B?YXJmeUxiS0s4ZlJEdEt5UEREYWZMWGo2eks0YU5ISFJRemF4V3JiTDhUQVJp?=
 =?utf-8?B?eFVHZzQ5QmZlRzdaaWVjaklxdlB1dXVrVTJZVEJud1dEekdvdlUzUGZraE9a?=
 =?utf-8?Q?rkchcogY1dI6m7ATcg/PcGmPARciQbpp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGV5d0NLMDhiMU5YTEVXbnZhUEU3LzZqYUVVN1pqallsZ2FKVkdaQ1VrQWFD?=
 =?utf-8?B?eVUra043NVdlTWdzemljWFIrM2hsVzc1eCsyUVVBd2g3c3VRbXB0M2RDYVdu?=
 =?utf-8?B?Qm1DRU9VMlJDeUdXaTNIMGp6ZTc0YkFVNCtHWjB5MFRrYjFTakNGWXpiQlFO?=
 =?utf-8?B?QnpGNWFjMjBIUUU3czhTaGppMGx3UDlZRnFTS1RtalR3RjZSTzV0MGxuMWZy?=
 =?utf-8?B?SnpheW9YYVh3ZWhzbnVXTUJjSlhrbnJiV2NUeERVK1R3aE8vZ292czRnQXQ3?=
 =?utf-8?B?WkpzRTNYRGZvanh5NXIwaVdIY1VOWmN5U0xHUTFYY1lZTzA0NzcvZGRhN1Yy?=
 =?utf-8?B?QXFEZDB3R0JZK3NiKzZ1OWlqeEdUUW92VzBwREM0OFRSQTZ3SUo3Q2pBN1py?=
 =?utf-8?B?Q2ZSc1BtTEJVOGVCT3JPWXQrY2w1b05SSldkYTcyMmg2TDcxYk4zL0lHMGFo?=
 =?utf-8?B?Q1haSDlUSDFZaFZsclV6bXBNYmErVWVUTVRydDJuOERrZWdwQTB4TndBb2Ns?=
 =?utf-8?B?bE8vS3RyUW50UTZVUU9ZY2dvaUlKSlZTNkluVkxpQnVZVzgyaVY2OGRINUtn?=
 =?utf-8?B?RUhNMThlUHNlLytqWFRvaXZNUWdiUzdUTXNlZTRTVFJQNFdpR0R3cklzd1Nj?=
 =?utf-8?B?eXkvVkhTaHdJRFhhakRiWmJKdEZhN21HSXEvMUVXWVc5b1dOQWgxU2ZKWWxq?=
 =?utf-8?B?UC9nNStnMEoreU11OW5Rc1B6N0owSms0SDNlVnF2RnM1c2xtdlhGcUJ6d0Fi?=
 =?utf-8?B?akdzOW84Rm1ieGVqbnZmKzErQWVnclhlR3grSDZwcHIyOWNDci9VenVFL2Q3?=
 =?utf-8?B?R1hBc3RZWTZyWlZuZUo0M0lFOFRTeXhEc2VwaURjMkRTTXR2YmJDRFc1VkpV?=
 =?utf-8?B?OW1rY0lTb0xrcDVPbUVRTU15dWJ2bjE2Vng3a2I0ck8wQ2lWZ29QS2xjd1Uz?=
 =?utf-8?B?dmxxZ3dBYyswK3ZmTjhYQXBPbE5RRUhOZ2I5Zks3R0dsSjVSM3REVUJwQ1RQ?=
 =?utf-8?B?TVRMNnRrZ0tsazlIMDF2VHhRWjBSZHlURUE2Zm1qZHhBanRhaGhlbDZGK1Va?=
 =?utf-8?B?azhFZXlDbzdncHlkRDBTdUlMaWJmT2RTd1gvYUo3dWVlKzdXcEExaUx6NnZB?=
 =?utf-8?B?THJuOVp6akpHMlFGRlVQaTR2L3N0Tld6cCt1UG16WFdjWEdRWDJ0emxPNU5s?=
 =?utf-8?B?T20rRVhJVmpOcXNjNjNySVVha2tNcXVHR29USzdvakJneFZkU3E4YlQyYVhD?=
 =?utf-8?B?a2VFUTVWS2NKb3ZOZ3cxUVBTNzRVbFcyY2o0STgzNkxtMUg2RldQWU9GK2dV?=
 =?utf-8?B?bTNLbjdaYVlmTlN0ZVYvL290MmZueTI0MWpYSTlmYXE3eFJ1Yll1MFdYeHc1?=
 =?utf-8?B?bXBMbmVXdHpJNkNrd3M1TjIxMnQ2aU82OWtWVEszMm80QmhmbE04c0h2UVBt?=
 =?utf-8?B?UU55bW9jNzNkaWpWdUxGQTZ6bmZEeGdZc2NwcnI2UHlaU2FUamVCM3NBdXNI?=
 =?utf-8?B?MWc4Yk1JVk04RWN5VG41Q0dPaUJaRVVaQ2pNbVE2bHV2VndCRUp4d0lHWXJE?=
 =?utf-8?B?YmFrcWoyTGJPYk5YWW8yS01KMlVlaExkMDhHWDlTcmxlVUZrOXRpM1Vyazds?=
 =?utf-8?B?TWtyQ0R0M2djN3RJMk5obm55T0d1NFg1SnZ2clU1bG1FQ2RURGdsemZHalZp?=
 =?utf-8?B?NjJXaldNOVlncCthRUhMU2xQc3JuclhUa3Z5Z1p4bzlCZ25qa3ljeEh0enY1?=
 =?utf-8?B?ZjZMSTNVMEx3NUxYdEhkdXQzbWRadjRaMHBIOWVPVUcrNzhveGMyNXQyQS9p?=
 =?utf-8?B?Y2tQM0djUWVYVXVlbHkrM3pKKzVxOStHOXFIQThSWkl2d0l0MFdGU0ExZHRL?=
 =?utf-8?B?VFVsMVhETVkxSUFsYlEzZmt0SnN1UU5uZUJ6ZWdhL21kZ1I5eGFxQVRPWUFU?=
 =?utf-8?B?T0YyQzJMcG9yTElWNlVyK1FiMmlFQVdUYmtrcy9pT1hnaWZaa2xQU0NyeEwr?=
 =?utf-8?B?SDVFUmRoTDI3TWI2ZzkzQjV0UW8rZDBNUlBFRTFvNFlzeFBCdHZsSHpHOWVz?=
 =?utf-8?B?bXpQRDcvVnBVTXM4Q1JwaExJRjNiS2tFa3NqNTZEVkM2bm1WTGFoNUJqSE5o?=
 =?utf-8?B?QnRUSDZNWGpuTk9vcHA4NUZDR0srL0NOQU9SYjlHTlpFNndYTW4xWC9Xc3dl?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01b09978-90af-460a-ece3-08de3246eda3
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 08:35:35.4431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hSzcbrUmXfo/k0ty/4QJ9daNmdJlMHlNjdFQoZQe9e13stCgr73SLtZBxn+CvNYeQ/SziTMLu8HzA6x0GD54qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8586
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


On 12/2/2025 11:38 PM, Kamil Konieczny wrote:
> Add symlinks to recently removed Xe lists so Ci will have time
> for changing its flow.
>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/xe-fast-feedback-chamelium-only.testlist | 1 +
>   tests/intel-ci/xe-fast-feedback.testlist                | 1 +
>   tests/intel-ci/xe-sriov-vf.blocklist.txt                | 1 +
>   tests/intel-ci/xe-sriov-vm.blocklist.txt                | 1 +
>   4 files changed, 4 insertions(+)
>   create mode 120000 tests/intel-ci/xe-fast-feedback-chamelium-only.testlist
>   create mode 120000 tests/intel-ci/xe-fast-feedback.testlist
>   create mode 120000 tests/intel-ci/xe-sriov-vf.blocklist.txt
>   create mode 120000 tests/intel-ci/xe-sriov-vm.blocklist.txt
>
> diff --git a/tests/intel-ci/xe-fast-feedback-chamelium-only.testlist b/tests/intel-ci/xe-fast-feedback-chamelium-only.testlist
> new file mode 120000
> index 000000000..5590bb122
> --- /dev/null
> +++ b/tests/intel-ci/xe-fast-feedback-chamelium-only.testlist
> @@ -0,0 +1 @@
> +xe.fast-feedback-chamelium-only.testlist
> \ No newline at end of file
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> new file mode 120000
> index 000000000..18f0b3b89
> --- /dev/null
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -0,0 +1 @@
> +xe.fast-feedback.testlist
> \ No newline at end of file
> diff --git a/tests/intel-ci/xe-sriov-vf.blocklist.txt b/tests/intel-ci/xe-sriov-vf.blocklist.txt
> new file mode 120000
> index 000000000..207e941e7
> --- /dev/null
> +++ b/tests/intel-ci/xe-sriov-vf.blocklist.txt
> @@ -0,0 +1 @@
> +xe.sriov-vf.blocklist.txt
> \ No newline at end of file
> diff --git a/tests/intel-ci/xe-sriov-vm.blocklist.txt b/tests/intel-ci/xe-sriov-vm.blocklist.txt
> new file mode 120000
> index 000000000..d07d2b330
> --- /dev/null
> +++ b/tests/intel-ci/xe-sriov-vm.blocklist.txt
> @@ -0,0 +1 @@
> +xe.sriov-vm.blocklist.txt
> \ No newline at end of file
