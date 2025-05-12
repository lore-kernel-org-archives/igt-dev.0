Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D64CC3ABC3
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 23:27:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7EB210E048;
	Mon, 12 May 2025 23:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jPHwK7G+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD7D10E048
 for <igt-dev@lists.freedesktop.org>; Mon, 12 May 2025 23:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747092436; x=1778628436;
 h=message-id:date:from:subject:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XFwXvLxN7/UweVL75oSMinXSWCJwxdu9x9co4TLXNww=;
 b=jPHwK7G+DvTtvVcWXozB90ttlF83r+Xba7nnDw/J6PQUBYj3MMfgUfbr
 DnnP87D9ZZqHLQDf/GSc148hzJNLkdt/UUgAAdwYkEoP9f/o03cRo/fjd
 xvbesLhe0Y+XjSIe7gfnN4MaW9mpYFlhyoB1qVPoYLrcEM0/TvOpkYpsH
 MIolJ+/sOdvVpiMh+W7HhNgnt94f9IHax7txk2MHX0dogouWpccrCcxyN
 xETerXWecaQRmiHEz+/Wak69vK9KagPmCw3QWl9d3Zq2hD+0nN70yykpo
 zSnwboKUPptdJgEJcDGOD3BNnF3fWbPDeEyeb3K5brgnL+6pw3qU4NJnj Q==;
X-CSE-ConnectionGUID: qHs6VuPFRCmSSwhkdmhzjA==
X-CSE-MsgGUID: 7qADrYUcR4mJ0+hBgKYHdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="49034675"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="49034675"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 16:27:15 -0700
X-CSE-ConnectionGUID: IaLLPaBiRqilLzq6HVWC5A==
X-CSE-MsgGUID: baQIMmfvRF2P3n2vfFmr1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="137363581"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 16:27:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 16:27:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 16:27:14 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 16:27:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWgmCJiIdf4EdJG/gI9NZVg9uEK3WXt66CbnftU5+5WkGBFSUZHzGGIktkCSrvQKHL38HWe1d8DscCkTMnJ1ASaZVL4xcKZXV2SFO28VzQBHImsgbjaxGvMTJ2N6GbSSw2akYglIu1txzjF4JbAJ8pzRdsHDe0Ad4MSfuRenF+2lYzmAFWtE4jl9NLb+222/6i7tsPFfqesrPd4us+04Rxg/Bqzt1UN5xtd5WtdyREsSmveQMlsUgaXFkwh+pV9iJxHHHR4Dt64CPtCj64TjgdZUNM/WBaLR/Af6I3YTEV9TlQVZfvsFeXayK7zRxpFQ76vTsO3rjFaDWNbQnu40EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAoDAFyhJWEmQIT3ar+8TbZb04S/mFeEy1GhuOUC1Lc=;
 b=CrVz7TVDI1XztOC8TzlsC+tIaMPOSpTEhQmyT24QLUeututRMsYns0AuBA/Uyoen86y8ZNf/8ILV3ZqO91zcm4qXEYbX+lLTjpvDo4sACK3nw8KuQfUzZkrTQMt6EzRHQgXQrL9zNIoLJpM5Dey4w1nqyoFUQUO2V//Se3yKa69h9O8yXyxGoice+x1edlBWaaxKB69nrPoGKabWJZL4gb5LZK9h0IvOK6mENuw54OmQasnFxdeIzha251fAY0lBYdnSMNZNHqSSUnfoddJsGtO/1T1br2RQKXseuLU5Ln2qAdbN4aYLv4hnamZm1lP3N8CGAM3GRg2cVSxh9JyCgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8177.namprd11.prod.outlook.com (2603:10b6:8:17e::22)
 by SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 23:26:31 +0000
Received: from DM4PR11MB8177.namprd11.prod.outlook.com
 ([fe80::41ea:1e29:8372:c1c9]) by DM4PR11MB8177.namprd11.prod.outlook.com
 ([fe80::41ea:1e29:8372:c1c9%6]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 23:26:31 +0000
Message-ID: <8bd235f8-1f4d-4c65-9c34-ad34d1e93cb5@intel.com>
Date: Mon, 12 May 2025 19:26:28 -0400
User-Agent: Mozilla Thunderbird
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v2 i-g-t] lib/xe/xe_legacy: Move test_legacy_mode to lib/
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250417193032.329-1-peter.senna@linux.intel.com>
 <20250508101008.597138-1-peter.senna@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20250508101008.597138-1-peter.senna@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0093.namprd03.prod.outlook.com
 (2603:10b6:303:b7::8) To DM4PR11MB8177.namprd11.prod.outlook.com
 (2603:10b6:8:17e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8177:EE_|SJ1PR11MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: 31564fde-0c3a-4657-b1cc-08dd91ac6cf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TStPWXN6Tk1IWVpxNk9SS1hTNDdzUHFROVhBWERUOUJlMVdUVEJXeEpaUkxo?=
 =?utf-8?B?T0hhRVRaMURQaGRERWs3MFFCWVdDdXpZcUFiZTlDOVpIMjdBVzJ3VFQzSG5T?=
 =?utf-8?B?QkltSFR3VkZSd2Z1ZWUvOTdjblJtSm0rN1R5L3hNU21ObTc5RWdIYjJJclZ6?=
 =?utf-8?B?eXFKRlZHaFJ4bTJkcUZqeSs0ZFh2dkZ6YWRFMXhhMUJOUVdQTzhnUVkyT2RE?=
 =?utf-8?B?ZkVqdU94eFVnTnEvaEM4TUpZdGgyWjFuZjdHT1J2ZCs0dlVINXlzSG5ZMkhx?=
 =?utf-8?B?Y2RzdUd2UlRSVHQ4YlNGcE5McHNyMkRVeEhtZmxUaEVlQW1RcEN4eEVWVjNT?=
 =?utf-8?B?WC95QWErZTdraXlnTHFSRWxKcWh6MVZBajdybUV6dHBmNitrbjRRN0NKMDZm?=
 =?utf-8?B?NEt2SGdOc3ZDdG1Qd0l1V0NWNFdRTjVtK0xqT2JzdTV0RGFKbkVNNi9MUmw1?=
 =?utf-8?B?R3RDdnNOTDJzKy94ZUxaL3U3RnBrY1lzTTV1eWpwOXdRTlRuWWxGbGpySEpC?=
 =?utf-8?B?VERKVlhmRmdFNGtCZWxFNUZxcFUxYnhaUXBGdUxtVGdSeHZUZGtiTVdrY1M2?=
 =?utf-8?B?NDl4ckVQY2IrODlWWVBWZ2tHV01LOS93KzRITnVYT3d6ZWFIYVlLcG12SHFi?=
 =?utf-8?B?QnRqbkJGb2owb2lLSnZVSkpkL3ZEVWpzZUFoN2src25BeGtMcW5hTlNLV05s?=
 =?utf-8?B?UUpIQzZGRXhaSkg0alNtM2RCaVExT3lIZ2paSlF1VXd3Q1pDS3NyWEErbjJO?=
 =?utf-8?B?UVhneW1Da2VPQUYvdVM5QW5xRHV1VjR5eUtZYVo3Mkk2Vnczc1NPUEJiRnpj?=
 =?utf-8?B?dzRQaXVzM09teEdtelppbjZEZmRhd0NoVHF2cE1kSnprdldsbGt2aUtaQlVW?=
 =?utf-8?B?QmxIV1JIUEFJNnFQeDBZZlhuUm02bGE3NG5TbStGRFlsenEwMG5HUTgwYm9V?=
 =?utf-8?B?MzhTZVcvYXgyNWtZNVFzNmg1aGlXUStnbE5MUE9HeXIwMWF2TFBsdVFzMmIw?=
 =?utf-8?B?dU9rWTN6YVdGbC9DYkIwY3BSc1NsVkdtNFZLUDNoNExMV0Rpc3Y3NHJNM21O?=
 =?utf-8?B?Y01mNXY0bUVsM0licnl2RkhFckF5cU9OZnBpalM0eUo4M1ZzeXdSR3BsdVU5?=
 =?utf-8?B?bE5yanlpRVJiUDVCSmQ3L1lzRVVrcWRBNVQ3Y0dEMnFyeEpQb1FBYW5jVUhW?=
 =?utf-8?B?TjEzVEtZZ3E4Vk5LbTNFcGs1Z3dmSms5MFRub0YwNnU0bUFrb3JoL2l4SG1k?=
 =?utf-8?B?TXBTYWZIUGJValJCMkZQOUs3Z2tFOVo5Q2xCcHRwUUY5UllBREZUdFo1N2VH?=
 =?utf-8?B?dElxK2RmeUJ3ekNydDZ2L0Q1Umg2N2lkcFN2TmlBY3hhVnFuUDhJSGQzak5M?=
 =?utf-8?B?NnhUOWxTUkZUdWR0cUZsL2t1QkhMVElDTWdDVnBPeTMrVHRSOHZJZERJRi9P?=
 =?utf-8?B?by8zWWxZRDlIZHVINDJISTFqMzdkNEZuQk9iQTNuQ3FDOEFTeHp6MU83VjZs?=
 =?utf-8?B?OVhSYWVkS0VFekhzVjVIR2MyZGtoSzNNd3Z1VjJGbUtnWmJ5M1Z1T3BRd2NQ?=
 =?utf-8?B?QUVjNnlNdjJYU1EyWHVJWUJRYVFzUWllaDFhMGRxelBzdzdFd2NuZGE0L0dz?=
 =?utf-8?B?ckJLZ2RNclFWTU9DNE5RSWJ0N0FNVXJBd3JTY2x2d1NQYnYrR0JCWTZvNUlC?=
 =?utf-8?B?Q1UrOXZqWEZBSEpDK1VKZ01zYTNZTEJIVm82L1RpRERRdHY0ajd0U3hMeEpI?=
 =?utf-8?B?SklaYWVGU2JFOVJ2Zk5nMEppd3IzNGhqVkpvdDlISEJyckxkMzJSZFVCQUo4?=
 =?utf-8?B?WHF0ekhOOThEcENqSHJQa1ptbVlmZTMxWUsxeStpenFnYk83OTQ5V29aQmhm?=
 =?utf-8?B?aEFvMFdFNVhnYUZjTWRzTmZtWHNmT2NDZXFYaWZCazY3dHhlbUU0cWNSaTQw?=
 =?utf-8?Q?3hz0xCD+7w0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mjh2djFJYWVRdjFRUGNORUE4VEV3NmhVWTdqMEFPUkVIWDRKUGRTZW01a1px?=
 =?utf-8?B?Y2V6SElFTlprdXJ4VFJRUkJWY1FUZis5T3Q5WXVKcEFoUmRBZ2JrdzM4UEdR?=
 =?utf-8?B?a1lqZ3dnRTN4NDkzeG5ONUlXNURZZWh2T2RPazBjZUtiQmJUbFFiaW9aa2l2?=
 =?utf-8?B?enlFUVJleVhUWXRBUCtPdW9pZFFFUUswLzQ5dDdXaEN5Y1g0M1lrdnl4Tmtp?=
 =?utf-8?B?UlJ3N0F0S3JnRGdTMkVtbGUwN0VvSXMxSkZHaURIdnlhUE5CRWdlbnFWNlJT?=
 =?utf-8?B?a3JpdDE2akUrU2FraGpSd1dKbHZuWkhxUkJFMVJ4NExyWGhzNW12U3JieWxN?=
 =?utf-8?B?aFpwWFNvTEpwNzZPbVFralNOZDRzVVlqTyt5SDE5WFp0S3FURjBnT0JmWmFZ?=
 =?utf-8?B?SzJGbTB6WUpqU2g3eDJLMlVtbjlKSjlJUzhXR0Q2SEVGS29nTlpSYys2MG5z?=
 =?utf-8?B?bjlYZWZkN0VXbGVrSzNQRlFIdU81Q29rWGJHSmhiOTBwdkMrdUZzY1JVQ243?=
 =?utf-8?B?QVdqbjNsN1pKRWdzTG5qTzUrRXhiT3EzS1d1SS8raWc2dkNBVE1UeUNiQ2lZ?=
 =?utf-8?B?ZTI4RWl3M1NWY0pnb2ZGdGZUOG82cGdOVkNrSFArWk8zYW1WZDRIUThUdm9a?=
 =?utf-8?B?ajJQS0tuMGZzTGE5N0R2VkVrR1lLNWdvQ09TNGJGUG1CcGFYakNxR0pKQTl2?=
 =?utf-8?B?ZXBwV0ljajg5ZHFvQmRaYzhEWklJU3BaVHYweW5uanBOQ09KUHFYd290RXNW?=
 =?utf-8?B?N0hhSjI3OHhZeGhaK09vTzB2WWJYaGU1Rlk5NDlySTNHd244NFAxbWtTdjc3?=
 =?utf-8?B?bTFTbmxtcFlsOE1MREl5Z01TNmlrSEhldUN2L2UreUViWW83VjRqWVVXT0F3?=
 =?utf-8?B?NDczcTVESTNhaGI5akM4QUpINlUxdlNvdFpuL2pSSTVFbkhzb3czTVhkQnZt?=
 =?utf-8?B?eUNtQnpmcDNheEZJb0ZpR2l3a1huczNSY2t0RlpnT0cwY3NXcmN1eFVnMWtQ?=
 =?utf-8?B?TkhDMkVERjNCdzlmT3Z1eWJoczR1ZTBYQUxSWWRTUkszN1gwSmlkT3o5RW82?=
 =?utf-8?B?S0I4OCtmVkJDcitlR1dxVEMybmNJekwybXc3SjhRUVVYUzhUN28yY1VGNEt4?=
 =?utf-8?B?MUxKRWNJQk1yYzBWdXdWckZEUWdxRVJjcjZIVTlVQ1diM2lGMkhXUTJWMWwy?=
 =?utf-8?B?Y1kzVDRTc25mLzRDOFYxWk5JcS9wQU8rMElHUFlIZWpxVkV2ajVvMlRtNEZO?=
 =?utf-8?B?dnA1NUZzRUtMc1paYkcxd3JaeUxNUmtYYVlPOHB0am9Cd1pQS3NUaWtUTkxM?=
 =?utf-8?B?ZUVrZldoZDBHQTJXaW1TUzNPTXV6amJOWC9ZRHpoNEFWOTFRVUhIbEhXYmNZ?=
 =?utf-8?B?aWRoc3pndTZYSHgxcDBmMzR5dnEvcGd0WGFBR3ROQ2FUQUtjbU1vYnBtVmJG?=
 =?utf-8?B?UlovVmUzQXlVMTE3ZUZlWkt1N0orcXB5VnpZTUxaOHV3RUFPVEhsM1k1ZFFu?=
 =?utf-8?B?ZCtwQzdjRU1CTU1BK0hOQ1N2YWhPM2NUTHhsYmF1VGd6cnVhVDlDeUs4QkpG?=
 =?utf-8?B?U0MzMEx3eEs2cTBVTmc0a3JiRDFUV3FoWS8yTG9INGxkOStROVJjclFMSjB2?=
 =?utf-8?B?V1lBTGdGeHA1V29hcDZmUE5uVEdqQmpEWC9IVy9sOGpnRWowSm0yTXZVaUpn?=
 =?utf-8?B?eG1wSnF1Q2ZpVXpVU0l2SmdzWkZKOU5ERDBFMEJDazJaM3daZlpQRG85TVJ1?=
 =?utf-8?B?ZWo1UCtUN3pjTHR4TGw4MldnN1AxWU9aNDRaRk8yajBlLzNERWh6ZFRlelNq?=
 =?utf-8?B?V1JWbnV3OTdWRWtqRUM4OWhPZlg0eFkvTHZPSHYrbkpxUkdTc3grQUhQUlp3?=
 =?utf-8?B?MmQ4Rm85K0FycmM5Sis5L09Sa0lzU1ViWkR6dzNnYnZFS3dvSytOODhLVmVJ?=
 =?utf-8?B?a3c0SXlPakFpSzA4ZjliQm5maFhHczJRVWpBcUJqdmJqYnpGQktiL2pZZUh1?=
 =?utf-8?B?U0lvRnNnNVlDT012eHUxMmVIYWtMOS9HaWFoWGxQeFhQRVdmQmJzRDI5ZnBu?=
 =?utf-8?B?OFVIUVRNQ3VLQlo3bXdvdjFHZU05TE00TFcydG1sK01zVEhMZjZ6OHY2WHZZ?=
 =?utf-8?B?ZWNDTDhHUVNNVmVkd0RiZ0FWWU1MZTlQZXlFT2JkMmk4RUorZC9HZGZLT0E4?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31564fde-0c3a-4657-b1cc-08dd91ac6cf7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 23:26:30.8997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o9iS1aINjkpstPFC2hTCnvAPBhWvIouxdDvsMK7WZMPw60nfLFUgn7oNe86rZ1ahR+w1TPLniAGlJKdXtfAtaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6129
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

LGTM
Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>

Regards,
Zhanjun Dong

On 2025-05-08 6:10 a.m., Peter Senna Tschudin wrote:
> There were two similar implementations of test_legacy_mode(), located in
> tests/intel/xe_exec_capture and tests/intel/xe_exec_reset.  This patch
> consolidates them by moving the more complete version from xe_exec_reset
> to lib/xe/xe_legacy, and updates call sites on both tests to use the
> shared function.
> 
> The version from xe_exec_reset.c was chosen because it is more
> feature-complete and flexible, offering the following advantages:
>   - Supports CLOSE_FD
>   - Supports GT reset
>   - Waits for spinner start
>   - Checks batch buffer result
>   - Conditional bind call using xe_vm_bind_async() instead of
>     __xe_vm_bind_assert()
>   - Allows early return
> 
> To cover for a difference between the two function definitions, the
> shared function was extended with the use_capture_mode parameter to
> control whether to use __xe_vm_bind_assert (capture mode) or
> xe_vm_bind_async (legacy mode).
> 
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
> 
> v2:
>   - Fixed broken logic on setting base_addr (Thanks Zhanjun Dong)
> 
>   lib/meson.build               |   1 +
>   lib/xe/xe_legacy.c            | 170 ++++++++++++++++++++++++++++++++++
>   lib/xe/xe_legacy.h            |  15 +++
>   tests/intel/xe_exec_capture.c | 109 +---------------------
>   tests/intel/xe_exec_reset.c   | 153 +++---------------------------
>   5 files changed, 204 insertions(+), 244 deletions(-)
>   create mode 100644 lib/xe/xe_legacy.c
>   create mode 100644 lib/xe/xe_legacy.h
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index 8517cd540..454dcd244 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -114,6 +114,7 @@ lib_sources = [
>   	'igt_hook.c',
>   	'xe/xe_gt.c',
>   	'xe/xe_ioctl.c',
> +	'xe/xe_legacy.c',
>   	'xe/xe_mmio.c',
>   	'xe/xe_query.c',
>   	'xe/xe_spin.c',
> diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
> new file mode 100644
> index 000000000..a3ff5da03
> --- /dev/null
> +++ b/lib/xe/xe_legacy.c
> @@ -0,0 +1,170 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "lib/igt_syncobj.h"
> +#include "linux_scaffold.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_legacy.h"
> +#include "xe/xe_spin.h"
> +
> +/* Batch buffer element count, in number of dwords(u32) */
> +#define BATCH_DW_COUNT			16
> +#define CAT_ERROR			(0x1 << 5)
> +#define CLOSE_EXEC_QUEUES		(0x1 << 2)
> +#define CLOSE_FD			(0x1 << 1)
> +/* Batch buffer element count, in number of dwords(u32) */
> +#define GT_RESET			(0x1 << 0)
> +#define MAX_N_EXECQUEUES		16
> +
> +/**
> + * xe_legacy_test_mode:
> + * @fd: file descriptor
> + * @eci: engine class instance
> + * @n_exec_queues: number of exec queues
> + * @n_execs: number of execs
> + * @flags: flags for the test
> + * @addr: address for the test
> + * @use_capture_mode: use capture mode or not
> + *
> + * Returns: void
> + */
> +void
> +xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> +		    int n_exec_queues, int n_execs, unsigned int flags,
> +		    u64 addr, bool use_capture_mode)
> +{
> +	u32 vm;
> +	struct drm_xe_sync sync[2] = {
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 2,
> +		.syncs = to_user_pointer(sync),
> +	};
> +	u32 exec_queues[MAX_N_EXECQUEUES];
> +	u32 syncobjs[MAX_N_EXECQUEUES];
> +	size_t bo_size;
> +	u32 bo = 0;
> +	struct {
> +		struct xe_spin spin;
> +		u32 batch[BATCH_DW_COUNT];
> +		u64 pad;
> +		u32 data;
> +	} *data;
> +	struct xe_spin_opts spin_opts = { .preempt = false };
> +	int i, b;
> +
> +	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
> +
> +	if (flags & CLOSE_FD)
> +		fd = drm_open_driver(DRIVER_XE);
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	bo_size = sizeof(*data) * n_execs;
> +	bo_size = xe_bb_size(fd, bo_size);
> +
> +	bo = xe_bo_create(fd, vm, bo_size,
> +			  vram_if_possible(fd, eci->gt_id),
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	data = xe_bo_map(fd, bo, bo_size);
> +
> +	for (i = 0; i < n_exec_queues; i++) {
> +		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> +		syncobjs[i] = syncobj_create(fd, 0);
> +	}
> +
> +	sync[0].handle = syncobj_create(fd, 0);
> +
> +	/* Binding mechanism based on use_capture_mode */
> +	if (use_capture_mode) {
> +		__xe_vm_bind_assert(fd, vm, 0, bo, 0, addr, bo_size,
> +				    DRM_XE_VM_BIND_OP_MAP, flags, sync, 1, 0, 0);
> +	} else {
> +		xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
> +	}
> +
> +	for (i = 0; i < n_execs; i++) {
> +		u64 base_addr = (!use_capture_mode && (flags & CAT_ERROR) && !i)
> +			? (addr + bo_size * 128) : addr;
> +		u64 batch_offset = (char *)&data[i].batch - (char *)data;
> +		u64 batch_addr = base_addr + batch_offset;
> +		u64 spin_offset = (char *)&data[i].spin - (char *)data;
> +		u64 sdi_offset = (char *)&data[i].data - (char *)data;
> +		u64 sdi_addr = base_addr + sdi_offset;
> +		u64 exec_addr;
> +		int e = i % n_exec_queues;
> +
> +		if (!i) {
> +			spin_opts.addr = base_addr + spin_offset;
> +			xe_spin_init(&data[i].spin, &spin_opts);
> +			exec_addr = spin_opts.addr;
> +		} else {
> +			b = 0;
> +			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> +			data[i].batch[b++] = sdi_addr;
> +			data[i].batch[b++] = sdi_addr >> 32;
> +			data[i].batch[b++] = 0xc0ffee;
> +			data[i].batch[b++] = MI_BATCH_BUFFER_END;
> +			igt_assert(b <= ARRAY_SIZE(data[i].batch));
> +
> +			exec_addr = batch_addr;
> +		}
> +
> +		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> +		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> +		sync[1].handle = syncobjs[e];
> +
> +		exec.exec_queue_id = exec_queues[e];
> +		exec.address = exec_addr;
> +
> +		if (e != i)
> +			syncobj_reset(fd, &syncobjs[e], 1);
> +
> +		xe_exec(fd, &exec);
> +
> +		if (!i && !(flags & CAT_ERROR) && !use_capture_mode)
> +			xe_spin_wait_started(&data[i].spin);
> +	}
> +
> +	if (flags & GT_RESET)
> +		xe_force_gt_reset_async(fd, eci->gt_id);
> +
> +	if (flags & CLOSE_FD) {
> +		if (flags & CLOSE_EXEC_QUEUES) {
> +			for (i = 0; i < n_exec_queues; i++)
> +				xe_exec_queue_destroy(fd, exec_queues[i]);
> +		}
> +		drm_close_driver(fd);
> +		/* FIXME: wait for idle */
> +		usleep(150000);
> +		return;
> +	}
> +
> +	for (i = 0; i < n_exec_queues && n_execs; i++)
> +		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0, NULL));
> +
> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +
> +	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> +	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +
> +	if (!use_capture_mode && !(flags & GT_RESET)) {
> +		for (i = 1; i < n_execs; i++)
> +			igt_assert_eq(data[i].data, 0xc0ffee);
> +	}
> +
> +	syncobj_destroy(fd, sync[0].handle);
> +	for (i = 0; i < n_exec_queues; i++) {
> +		syncobj_destroy(fd, syncobjs[i]);
> +		xe_exec_queue_destroy(fd, exec_queues[i]);
> +	}
> +
> +	munmap(data, bo_size);
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
> +}
> diff --git a/lib/xe/xe_legacy.h b/lib/xe/xe_legacy.h
> new file mode 100644
> index 000000000..0afd8a76c
> --- /dev/null
> +++ b/lib/xe/xe_legacy.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef XE_LEGACY_H
> +#define XE_LEGACY_H
> +
> +#include "linux_scaffold.h"
> +
> +void
> +xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> +		    int n_exec_queues, int n_execs, unsigned int flags,
> +		    u64 addr, bool use_capture_mode);
> +
> +#endif /* XE_LEGACY_H */
> diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
> index fe1ae677e..92113cdb1 100644
> --- a/tests/intel/xe_exec_capture.c
> +++ b/tests/intel/xe_exec_capture.c
> @@ -27,6 +27,7 @@
>   #include "linux_scaffold.h"
>   #include "xe_drm.h"
>   #include "xe/xe_ioctl.h"
> +#include "xe/xe_legacy.h"
>   #include "xe/xe_query.h"
>   #include "xe/xe_spin.h"
>   
> @@ -135,110 +136,6 @@ static const char *xe_engine_class_name(u32 engine_class)
>   	}
>   }
>   
> -static void
> -test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int n_exec_queues, int n_execs,
> -		 unsigned int flags, u64 addr)
> -{
> -	u32 vm;
> -	struct drm_xe_sync sync[2] = {
> -		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> -		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> -	};
> -	struct drm_xe_exec exec = {
> -		.num_batch_buffer = 1,
> -		.num_syncs = 2,
> -		.syncs = to_user_pointer(sync),
> -	};
> -	u32 exec_queues[MAX_N_EXECQUEUES];
> -	u32 syncobjs[MAX_N_EXECQUEUES];
> -	size_t bo_size;
> -	u32 bo = 0;
> -	struct {
> -		struct xe_spin spin;
> -		u32 batch[BATCH_DW_COUNT];
> -		u64 pad;
> -		u32 data;
> -	} *data;
> -	struct xe_spin_opts spin_opts = { .preempt = false };
> -	int i, b;
> -
> -	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
> -
> -	vm = xe_vm_create(fd, 0, 0);
> -	bo_size = sizeof(*data) * n_execs;
> -	bo_size = xe_bb_size(fd, bo_size);
> -
> -	bo = xe_bo_create(fd, vm, bo_size,
> -			  vram_if_possible(fd, eci->gt_id),
> -			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -	data = xe_bo_map(fd, bo, bo_size);
> -
> -	for (i = 0; i < n_exec_queues; i++) {
> -		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> -		syncobjs[i] = syncobj_create(fd, 0);
> -	};
> -
> -	sync[0].handle = syncobj_create(fd, 0);
> -	__xe_vm_bind_assert(fd, vm, 0, bo, 0, addr, bo_size,
> -			    DRM_XE_VM_BIND_OP_MAP, flags, sync, 1, 0, 0);
> -
> -	for (i = 0; i < n_execs; i++) {
> -		u64 base_addr = addr;
> -		u64 batch_offset = (char *)&data[i].batch - (char *)data;
> -		u64 batch_addr = base_addr + batch_offset;
> -		u64 spin_offset = (char *)&data[i].spin - (char *)data;
> -		u64 sdi_offset = (char *)&data[i].data - (char *)data;
> -		u64 sdi_addr = base_addr + sdi_offset;
> -		u64 exec_addr;
> -		int e = i % n_exec_queues;
> -
> -		if (!i) {
> -			spin_opts.addr = base_addr + spin_offset;
> -			xe_spin_init(&data[i].spin, &spin_opts);
> -			exec_addr = spin_opts.addr;
> -		} else {
> -			b = 0;
> -			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> -			data[i].batch[b++] = sdi_addr;
> -			data[i].batch[b++] = sdi_addr >> 32;
> -			data[i].batch[b++] = 0xc0ffee;
> -			data[i].batch[b++] = MI_BATCH_BUFFER_END;
> -			igt_assert(b <= ARRAY_SIZE(data[i].batch));
> -
> -			exec_addr = batch_addr;
> -		}
> -
> -		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> -		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> -		sync[1].handle = syncobjs[e];
> -
> -		exec.exec_queue_id = exec_queues[e];
> -		exec.address = exec_addr;
> -		if (e != i)
> -			syncobj_reset(fd, &syncobjs[e], 1);
> -		xe_exec(fd, &exec);
> -	}
> -
> -	for (i = 0; i < n_exec_queues && n_execs; i++)
> -		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
> -					NULL));
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> -
> -	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> -	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> -
> -	syncobj_destroy(fd, sync[0].handle);
> -	for (i = 0; i < n_exec_queues; i++) {
> -		syncobj_destroy(fd, syncobjs[i]);
> -		xe_exec_queue_destroy(fd, exec_queues[i]);
> -	}
> -
> -	munmap(data, bo_size);
> -	gem_close(fd, bo);
> -	xe_vm_destroy(fd, vm);
> -}
> -
>   static char **alloc_lines_buffer(void)
>   {
>   	int i;
> @@ -460,7 +357,9 @@ static void test_card(int fd)
>   		igt_debug("Running on engine class: %x instance: %x\n", hwe->engine_class,
>   			  hwe->engine_instance);
>   
> -		test_legacy_mode(fd, hwe, 1, 1, DRM_XE_VM_BIND_FLAG_DUMPABLE, addr);
> +		xe_legacy_test_mode(fd, hwe, 1, 1, DRM_XE_VM_BIND_FLAG_DUMPABLE,
> +				    addr, true);
> +
>   		/* Wait 1 sec for devcoredump complete */
>   		sleep(1);
>   
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index e2557f345..67b7bb826 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -22,10 +22,12 @@
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_query.h"
>   #include "xe/xe_gt.h"
> +#include "xe/xe_legacy.h"
>   #include "xe/xe_spin.h"
>   #include <string.h>
>   
>   #define SYNC_OBJ_SIGNALED	(0x1 << 0)
> +#define LEGACY_MODE_ADDR	0x1a0000
>   
>   /**
>    * SUBTEST: spin
> @@ -304,139 +306,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>    *
>    * SUBTEST: close-execqueues-close-fd
>    * Description: Test close exec_queues close fd
> - */
> -
> -static void
> -test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
> -		 int n_exec_queues, int n_execs, unsigned int flags)
> -{
> -	uint32_t vm;
> -	uint64_t addr = 0x1a0000;
> -	struct drm_xe_sync sync[2] = {
> -		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> -		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> -	};
> -	struct drm_xe_exec exec = {
> -		.num_batch_buffer = 1,
> -		.num_syncs = 2,
> -		.syncs = to_user_pointer(sync),
> -	};
> -	uint32_t exec_queues[MAX_N_EXECQUEUES];
> -	uint32_t syncobjs[MAX_N_EXECQUEUES];
> -	size_t bo_size;
> -	uint32_t bo = 0;
> -	struct {
> -		struct xe_spin spin;
> -		uint32_t batch[16];
> -		uint64_t pad;
> -		uint32_t data;
> -	} *data;
> -	struct xe_spin_opts spin_opts = { .preempt = false };
> -	int i, b;
> -
> -	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
> -
> -	if (flags & CLOSE_FD)
> -		fd = drm_open_driver(DRIVER_XE);
> -
> -	vm = xe_vm_create(fd, 0, 0);
> -	bo_size = sizeof(*data) * n_execs;
> -	bo_size = xe_bb_size(fd, bo_size);
> -
> -	bo = xe_bo_create(fd, vm, bo_size,
> -			  vram_if_possible(fd, eci->gt_id),
> -			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -	data = xe_bo_map(fd, bo, bo_size);
> -
> -	for (i = 0; i < n_exec_queues; i++) {
> -		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> -		syncobjs[i] = syncobj_create(fd, 0);
> -	};
> -
> -	sync[0].handle = syncobj_create(fd, 0);
> -	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
> -
> -	for (i = 0; i < n_execs; i++) {
> -		uint64_t base_addr = flags & CAT_ERROR && !i ?
> -			addr + bo_size * 128 : addr;
> -		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> -		uint64_t batch_addr = base_addr + batch_offset;
> -		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
> -		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
> -		uint64_t sdi_addr = base_addr + sdi_offset;
> -		uint64_t exec_addr;
> -		int e = i % n_exec_queues;
> -
> -		if (!i) {
> -			spin_opts.addr = base_addr + spin_offset;
> -			xe_spin_init(&data[i].spin, &spin_opts);
> -			exec_addr = spin_opts.addr;
> -		} else {
> -			b = 0;
> -			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> -			data[i].batch[b++] = sdi_addr;
> -			data[i].batch[b++] = sdi_addr >> 32;
> -			data[i].batch[b++] = 0xc0ffee;
> -			data[i].batch[b++] = MI_BATCH_BUFFER_END;
> -			igt_assert(b <= ARRAY_SIZE(data[i].batch));
> -
> -			exec_addr = batch_addr;
> -		}
> -
> -		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> -		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> -		sync[1].handle = syncobjs[e];
> -
> -		exec.exec_queue_id = exec_queues[e];
> -		exec.address = exec_addr;
> -		if (e != i)
> -			 syncobj_reset(fd, &syncobjs[e], 1);
> -		xe_exec(fd, &exec);
> -
> -		if (!i && !(flags & CAT_ERROR))
> -			xe_spin_wait_started(&data[i].spin);
> -	}
> -
> -	if (flags & GT_RESET)
> -		xe_force_gt_reset_async(fd, eci->gt_id);
> -
> -	if (flags & CLOSE_FD) {
> -		if (flags & CLOSE_EXEC_QUEUES) {
> -			for (i = 0; i < n_exec_queues; i++)
> -				xe_exec_queue_destroy(fd, exec_queues[i]);
> -		}
> -		drm_close_driver(fd);
> -		/* FIXME: wait for idle */
> -		usleep(150000);
> -		return;
> -	}
> -
> -	for (i = 0; i < n_exec_queues && n_execs; i++)
> -		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
> -					NULL));
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> -
> -	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> -	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> -
> -	if (!(flags & GT_RESET)) {
> -		for (i = 1; i < n_execs; i++)
> -			igt_assert_eq(data[i].data, 0xc0ffee);
> -	}
> -
> -	syncobj_destroy(fd, sync[0].handle);
> -	for (i = 0; i < n_exec_queues; i++) {
> -		syncobj_destroy(fd, syncobjs[i]);
> -		xe_exec_queue_destroy(fd, exec_queues[i]);
> -	}
> -
> -	munmap(data, bo_size);
> -	gem_close(fd, bo);
> -	xe_vm_destroy(fd, vm);
> -}
> -
> -/**
> + *
>    * SUBTEST: cm-cat-error
>    * Description: Test compute mode cat-error
>    *
> @@ -783,24 +653,29 @@ igt_main
>   
>   	igt_subtest("cat-error")
>   		xe_for_each_engine(fd, hwe)
> -			test_legacy_mode(fd, hwe, 2, 2, CAT_ERROR);
> +			xe_legacy_test_mode(fd, hwe, 2, 2, CAT_ERROR,
> +					    LEGACY_MODE_ADDR, false);
>   
>   	igt_subtest("gt-reset")
>   		xe_for_each_engine(fd, hwe)
> -			test_legacy_mode(fd, hwe, 2, 2, GT_RESET);
> +			xe_legacy_test_mode(fd, hwe, 2, 2, GT_RESET,
> +					    LEGACY_MODE_ADDR, false);
>   
>   	igt_subtest("close-fd-no-exec")
>   		xe_for_each_engine(fd, hwe)
> -			test_legacy_mode(-1, hwe, 16, 0, CLOSE_FD);
> +			xe_legacy_test_mode(-1, hwe, 16, 0, CLOSE_FD,
> +					    LEGACY_MODE_ADDR, false);
>   
>   	igt_subtest("close-fd")
>   		xe_for_each_engine(fd, hwe)
> -			test_legacy_mode(-1, hwe, 16, 256, CLOSE_FD);
> +			xe_legacy_test_mode(-1, hwe, 16, 256, CLOSE_FD,
> +					    LEGACY_MODE_ADDR, false);
>   
>   	igt_subtest("close-execqueues-close-fd")
>   		xe_for_each_engine(fd, hwe)
> -			test_legacy_mode(-1, hwe, 16, 256, CLOSE_FD |
> -					 CLOSE_EXEC_QUEUES);
> +			xe_legacy_test_mode(-1, hwe, 16, 256, CLOSE_FD |
> +					    CLOSE_EXEC_QUEUES,
> +					    LEGACY_MODE_ADDR, false);
>   
>   	igt_subtest("cm-cat-error")
>   		xe_for_each_engine(fd, hwe)

