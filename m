Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8855FC43458
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jul 2026 13:25:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376A010E65E;
	Tue, 14 Jul 2026 13:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HkY8WR3G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B3A10E65E
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jul 2026 13:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784035520; x=1815571520;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uH/zjoEHhD+RfrEqT/Xx53PmAVIAM1BJ2bThwFft/Kk=;
 b=HkY8WR3GTVjdSq8lLODPb4oikrXJ4R/B9iS684UJdtAlqbGjDV42g9SQ
 7xkjGlhC8OPIckPQeEFXBCarPnxYGxLDVF8xTOyL/fGicpqkBzHv2l2E1
 /qIx7Q050cmu9z1nxs47J5/5r4CRPUEB4GvBMp/mka85CAHzZ9f+z/fI3
 wkGHGxadQPLLWbk6Bn64brw62f1lGzC7upkkmO1/GwfiPcYtcfzhirTdF
 bIQ9z1OOIwwqZ597Pn2PGkkO4JZqT4t4xB8AxZOVEEpWI0/ZsBb8LpCq+
 gMtxj0RmvOoxnZIJfgbuqzrBvVjMdytFOeBaDI6zETNzOpiAsSHeRkL7R A==;
X-CSE-ConnectionGUID: xe3NWdfvT4eD6oSEbtSHmA==
X-CSE-MsgGUID: aygkWiZ9Q3qzPCcrawFT1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="107449249"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="107449249"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 06:25:19 -0700
X-CSE-ConnectionGUID: TPDObG8WQ0SwsfnFoU78Fg==
X-CSE-MsgGUID: 68eKsiEYTrKY9afVvPL1Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="259703300"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 06:25:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 06:25:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 06:25:18 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 06:25:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5fIWNLA9jJXV6erVUIyMU9hYphZVOK4JoVaIQ7U/ehLCui6a7kwJxXmFrc61KThWEYuG5Zt/F9ktqcriGsv3KZgvzRF9Ub5CzvcZe1kXvoXEzq8KmsW8VOY+Xfg1F1VY7IJELxNmFcbw4koAKEKt3T+1DdNm21y/q++gAC0nYVz7RfUacSa2tepviu1CcMEZAS/I0CSuq9/T152JB28i51BX0jW9LeVeSGhtEtjSUEghfIPLLlzBkCxhHqTVA88v45TafYEtKJWxM4Ab3i0diOUTtLg4FYxoixTro8jAccIrovvpsingaHPcIJHLSfpj3HaQMvcSMAbd/eW0qpUWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTmuyRgab40lGcQ4giYqcxUEXIB2okamhEvT8TLe1zI=;
 b=fXIen6SXv+goXRZLvsPZlKQDrAyaYfriPz3bjKtpETn+haUuhc/6z/iwAruFvh6V2bPGAF6siZtX9G7tkXN1NcFb+RSwfxijUKucjIMmlSjFbkEfyKuRQG9/wMKDo2WTV/Egs0k3yrjIF0IONKMDnlrCG/GH00yGXRsfk/ADxIOtt7MWJEhiDcx75Rs8b6s/uflJET20nTNn+piMB3lFb5Xir+74tJc9IaJL67/fd85S+zBEYZ5qkFg+SNIgg2rOmqfDrLowQmkBhHcqWpuiX0BSlrE9WmeNRsF7WMlADHDaAx3wnTHmUjE56fbnvqCFsqxsRJDaxyguAejB9FIDsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9304.namprd11.prod.outlook.com (2603:10b6:208:57d::5)
 by DS3PR11MB9647.namprd11.prod.outlook.com (2603:10b6:8:38e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 14 Jul
 2026 13:25:17 +0000
Received: from IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::6349:cd26:d23c:4ece]) by IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::6349:cd26:d23c:4ece%4]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 13:25:17 +0000
Message-ID: <dd4d6e2e-a816-46c8-b2fb-4eb4c9a1d8db@intel.com>
Date: Tue, 14 Jul 2026 15:25:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci: Block EUdebug-related tests on
 VF/VM runs
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>, Lukasz Laguna
 <lukasz.laguna@intel.com>, VijayaKumar Nallamothu
 <vijayakumar.nallamothu@intel.com>, Piotr Rudnicki <piotr.rudnicki@intel.com>
References: <20260713165312.413941-1-jakub1.kolakowski@intel.com>
 <6373280c-ac15-4bbb-88e1-e35dd820b610@intel.com>
Content-Language: pl
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
In-Reply-To: <6373280c-ac15-4bbb-88e1-e35dd820b610@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0078.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::31) To IA3PR11MB9304.namprd11.prod.outlook.com
 (2603:10b6:208:57d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9304:EE_|DS3PR11MB9647:EE_
X-MS-Office365-Filtering-Correlation-Id: 182d21d4-35e2-45bf-2174-08dee1ab5821
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|4143699003|6133799003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: qJy40iHegv7z53WmX6u8R5kzqLAP0kQTHMWp/sE5XGrLUGpt1dtEvol4/QqQovCIffLOAbNLHB4woETZDD4/u+ZID+x4zNW4AAMmo+noPq8lWeXuwn26VpS/FO4fN66Fvwy4zcTbMj5e1qPfVd+tUecQoDMBVRdvmnIPhxVufh4L/fSJZ3hxs2h/qBfIwPe3yn5YfqIgYbrbjCBBTLvRiT1k6xbNSFeRwmG4tjE5eW0FSvTzclfUYsU0HUK+PX0eML8I3Snsempk65slMVuiJhmZiJobxQ3Ve4r4vPyI4i230IK10wcM9MyD6QC1RY80cSExyrFR6/k5jGkmMsgx5qVa0LrTJho2z4OAzozW0bpEFVBT9LLDC9gvPwXlFkWQ3r8nT4LF77d9Bz6IViqc8er3deWWB+ZwLQbEULss3vNkrO4OFoiZ+MaopIBS117S6lyn8dj4LTQ415Gr9nSG0qhuaPDDbDiQlAsHaYYUaC1irLLxYuUdJpn9o9o9oIBiDojjDEgWJ5iyUhNvw9El5cvVJyV0+Os2tZoZZ2kY1iGVblYac/nOniEBAGfpR+dbuEK6VOgqVGfnWDULS7HKSzb03+GcV5USjg9k7Wt+iEqrc/ZXVw5UrQRkb8bIddOu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9304.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3h6ZG10OHVDVjZJTVR1NzdjbGpvbGFqMTJRbVI4YXZLQ1lNZldpVzdVR2JN?=
 =?utf-8?B?cFEyKzBqSkVWT3JuUjVxU3pmWnh0cXEvWkNUMlRrQk5DclRPZmlUd21DcTY4?=
 =?utf-8?B?OUZ6SjJlaks2V0R0eUR2TXVGVkptL1NxckRNQ05BZHlYaGlMQjdBQ1JZandt?=
 =?utf-8?B?WFNBeHBDcnZzYzhmaHBDWE16QmNGS1lSOG4waHAwaTFBM0ZqbE8rVWRGYWtw?=
 =?utf-8?B?VzFBNUtGbmdXSzdjN3dCZ1FZSWVpUHZEejVEcFZKSDUxaWtoNjhEbnJCTW9s?=
 =?utf-8?B?bzRWbnpxcjdHR3doZldodEFXWGVLM3pBNUc3OWtrL082QkFaaHQxZFFzMmZE?=
 =?utf-8?B?TEU5RUFWRXVXNFFORHdiT2wxSnovYWVVYkoreThKWVJwR05YSHRLU09HN1gr?=
 =?utf-8?B?dUt6ajZ6ZGR0eWFaNTUvb0tKTGFkbURQL29XTkcxVXZ1c211bHljNEZaRUt4?=
 =?utf-8?B?aUN1dXRPdW9LamVWZEV1dXR5WXBBbU5zWFBVOWZuQlJzMEtLSThqQjF2OVV6?=
 =?utf-8?B?KzZjU0pMT3RKWHVIand5amgwSVVpRXBVaVFQbzc5UGFSRDU1Y25yd1NLL21Q?=
 =?utf-8?B?MnVoc1RVSWVRaEFCQktBcGx5UE9HNENHMnpIQ25oWFlCcGgyQXBYOWxrVUM2?=
 =?utf-8?B?Uklnblh4VWJhZ044M25mUlVDalRzVC9tZVNGWTFRd0lPSGs3dVlEOHFuSklm?=
 =?utf-8?B?NGlXQ1h0UXY3NC9CRjg4aTVOMkppbzZleVIvaE5XNzZsUDVERG5YK0YrR0RX?=
 =?utf-8?B?Y3YrNG5jencvZTFaMTY2Z3VQS3lPamxDQUM4TjRmN3U0cDFjVm9ScWhRNksz?=
 =?utf-8?B?cWtrZkswaHZzQkFkMDVtR1Q5Q1ZJMFhYM2pKZW1IYUJ4cFdTbjg5NXY5bjBX?=
 =?utf-8?B?eSszc05Kc2Z6d1lVMG13S2ZUVHZYemRNY1BpNElkYzdBME9ObXZaQlphdVll?=
 =?utf-8?B?OEVPdHJ2bDdwRjlnYzFURWQyWmI2ZkVKeHh6YnpZclZkZUpyRzJVbjFML2JP?=
 =?utf-8?B?dU9rVnVvTFh6bUs1UlpoM3poalJSTlBIZmtlK2lQcUNOd2pSYlA5ODBXS3Rp?=
 =?utf-8?B?UVpSQncwblJqL2J3dHpLZkhsWTg1MVdZbk5yVFRRS0dtdmNXKy9aWVh3aU1B?=
 =?utf-8?B?ZkVueTZTU3ZZSjEvSVFXSVkrTUZzZmNrZXVmemZSOVVSZVRtcjF5dnBHSkt3?=
 =?utf-8?B?cjR5RTdsWWo5SDRzQmkwVkt3YSsyMzZTY0NpWDZyNlpJbk94UWFWb1VBU1NC?=
 =?utf-8?B?dVhoTnNQM250KzYraE1OQkR0ZXQyMU8wZ0xlckhVY05VdVBaQmxLQW8xTVBW?=
 =?utf-8?B?ZENaakdBWWs5Y2g1NTdjNVJkNUxTc3h2NU9POVlVQXo2NmpvODFVK1VvY1Zr?=
 =?utf-8?B?THNBcGIvSExlWkd4a2syY3Z4Wm5zem12MC9PTERiamJTaEpvUU5zanM1bk5a?=
 =?utf-8?B?YnlRQmNOYVpQbXk2TFk5bzA3TFZ0RFhIVDVhWXl2dXdvR1diSWdPd2VBR0pJ?=
 =?utf-8?B?bVFQZ09aNG5mNkhtWUpqenBtVVpwb0gyU3RibEo5cW80Z2Q5a0czdHR3MzRk?=
 =?utf-8?B?aGlPQjB4V05tR3p0ZnErWFh5RXQ1bUM2OUMxcEg5NG9xWWVyWWc0QWpQSWJV?=
 =?utf-8?B?TGJGdHRQRmVQNzAyeTFqcDhHS0tNS0d5RERiRkZsN0xlQ1VQOUZhSmMzUGtP?=
 =?utf-8?B?Wnd2clF6VE1BMXpjRWZ3OHZaT2lnQ3lrMlFwZUFQWlI5MG55bTcrOVNkVkov?=
 =?utf-8?B?OHRDQ0FpY2l1ZXR3UWVtdnBSbzhNdHJ1NG1vSE5KdUdFdVdtbEpsdjBBTEVW?=
 =?utf-8?B?dTlSaXJsZGlSWllOY3cyMHQ0V1QzZGFKSWNjcGlydGNESS9ZcUxoaEo4enhI?=
 =?utf-8?B?V1JHcVlKT21KdjFBZGowTG1xMmVjMFA5djg0RjhER3hualNRRHkxejAwbVpn?=
 =?utf-8?B?ME1SL1NvcVRkUVUxTkh5bHlxcXViR2lGblhzUnVKOTJ5Nzh3T0E4ZHAyR0JN?=
 =?utf-8?B?d1dIV3BFUSt1dTVkblBuNjVSTHRzblgzRTFkZDlKTElhWVFXa3FxSVBrc0xO?=
 =?utf-8?B?YTNrd2lzOGJ6Mk9UU3RaUnlBZ3J6ZGJaOEpPajZRYTRDRVdabWZpOVdpeGJv?=
 =?utf-8?B?N3prT3djZVV0SjIwQzYwakJhNTN6NVZTT3V5aDd2MW95ekJtVjByZXpid1U5?=
 =?utf-8?B?TG1KUUlCU245UEthMXpqMk9venMwOERWdHFBV1h3bXFXYUhKb0xFbTFYVGRX?=
 =?utf-8?B?ZXhXYkErOFZMQUJZTGY5WE1vclZFcmluZHJHd250MG1uc0tsVkFpL05zWWJH?=
 =?utf-8?B?RG01MkF3VGg4TlVadk9VSEdPamVDQ0ZHQ3M3NGtodC9ma3VGRkhlTGNzenZz?=
 =?utf-8?Q?zPurqoQt3eXFTDS0=3D?=
X-Exchange-RoutingPolicyChecked: lOWfpl0KhGxRG9JgH+CsFKQa4aSXo7osnPbgZgtRfTrk1VF+XaDhbuEs5/mF3p6cpNYWJD2HbpZ6bxxmcpOgqBmL8cQXQvnRF5Chm6ihIjar2sHTzQn3kfq5Hi/3CwTCPsmcW5layq8DwL0JiAoWwEa1LEtS9Op14v9oLXePMSQo7JaV05b3YUfJY5bcG3v4/weKTN/ReXu+8B+1iQ4wQf0C3++DQtJ+YkOobrhTbjPQfFqBDYQ8k/nYCyGiehAX1xTKVW2yLJeqjNct4nPwkshX3lw5PA4XGI6YZn3/XfgSdpckEevo9SeiNiFdrAw2U/z6ddwP7Xafa2iB3FzEUw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 182d21d4-35e2-45bf-2174-08dee1ab5821
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 13:25:17.0258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkFrISTfl9e85jpsmABDvLenFz6NXJc5z4pmwyeCNgEc0J+vIGiY1KxQvCcdPPRLlBSb2q/Fhvg0Ru66A3QMWOuxE/L3wUydMr9ut4+WecU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9647
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


On 7/13/2026 9:27 PM, Michal Wajdeczko wrote:
>
> On 7/13/2026 6:53 PM, Jakub Kolakowski wrote:
>> SR-IOV and EUdebug are mutually exclusive features.
>> Block EUdebug tests on SR-IOV VF/VM runs since they will
>> inevitably skip.
>>
>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> Cc: VijayaKumar Nallamothu <vijayakumar.nallamothu@intel.com>
>> Cc: Piotr Rudnicki <piotr.rudnicki@intel.com>
>> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> ---
>>   tests/intel-ci/xe.sriov-vf.blocklist.txt | 8 ++++++--
>>   tests/intel-ci/xe.sriov-vm.blocklist.txt | 9 +++++++--
>>   2 files changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/intel-ci/xe.sriov-vf.blocklist.txt b/tests/intel-ci/xe.sriov-vf.blocklist.txt
>> index 4a19aa943..7b5bd2165 100644
>> --- a/tests/intel-ci/xe.sriov-vf.blocklist.txt
>> +++ b/tests/intel-ci/xe.sriov-vf.blocklist.txt
>> @@ -9,7 +9,6 @@ igt@xe_module_load@.*
>>   # tests applicable for PF only
>>   #
>>   igt@sriov_basic.*
>> -igt@xe_eudebug_sriov.*
>>   igt@xe_pmu@.*fn-engine-activity.*
>>   igt@xe_sriov.*
>>   #
>> @@ -60,4 +59,9 @@ igt@xe_query@.*cs-cycles
>>   #
>>   # Tests that need to be executed in VM instead.
>>   #
>> -igt@xe_live_ktest.*
>> \ No newline at end of file
>> +igt@xe_live_ktest.*
>> +#
>> +# Tests related to EUdebug
>> +#
>> +igt@xe_eudebug.*
>> +igt@xe_exec_sip_eudebug@.*
>> diff --git a/tests/intel-ci/xe.sriov-vm.blocklist.txt b/tests/intel-ci/xe.sriov-vm.blocklist.txt
>> index 6271b1a70..0a02abaa8 100644
>> --- a/tests/intel-ci/xe.sriov-vm.blocklist.txt
>> +++ b/tests/intel-ci/xe.sriov-vm.blocklist.txt
>> @@ -10,7 +10,6 @@ igt@xe_ccs@suspend-resume
>>   # tests applicable for PF only
>>   #
>>   igt@sriov_basic.*
>> -igt@xe_eudebug_sriov.*
>>   igt@xe_pmu@.*fn-engine-activity.*
>>   igt@xe_sriov.*
>>   #
>> @@ -57,4 +56,10 @@ igt@xe_pmu@gt-frequency
>>   #
>>   # The feature query_cs_cycles is not supported on VF
>>   #
>> -igt@xe_query@.*cs-cycles
>> \ No newline at end of file
>> +igt@xe_query@.*cs-cycles
>> +#
>> +# Tests related to EUdebug
>> +#
>> +igt@xe_eudebug.*
> are you sure you need this?
> it looks that we don't build this test anymore [1]
>
> [1] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/ba8c03812b2593752b1d7ab31c104bec63ca21ec
EUdebug support may be added to the kernel in the future along with the 
tests for it in the IGT, this patch will ensure that once it's added 
testing won't be triggered on VMs (or VFs).
>> +igt@xe_exec_sip_eudebug@.*
>> +igt@xe_live_ktest@xe_eudebug
