Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5049FC3DA4A
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 11:27:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFBC10EA21;
	Thu, 11 Jul 2024 11:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DMOK3iy7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8C310EA21
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 11:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720697259; x=1752233259;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cVzbxg7yXG9sbOFiOv2LeliGYCkR6EqDD0P0y6rB2JM=;
 b=DMOK3iy7Y/813+HHytIY+rwfDmuk2QnbPuxPXhiWTatXe732wKyp7j3+
 kr55ZLSX6ZSZx1a6EvNVsSuHDGvdrqslIzSol6a6iHDAy6ti+33NfyWU5
 sNQdCnv/I9wl51qbjNUEUayGnbFWmKMuzKuw6TnZ0yAVCadeZGzqAdaqK
 6MYo13j9puH1VvipBsaFawL/Itdh+ExpDAYeKwX53O+XjMqTvvEnYaii3
 ULYHnAQpKHd1p9l1ru9EhRHHFfrXw3K1ARt6OxlN/iZVCNp5pwC+9wObb
 KJ/PWOBcMinxFC+ve4HfFCDgUcc2ObNxfLLKqmTXjVF1cMYltXMNXyZZ3 w==;
X-CSE-ConnectionGUID: 8JDXDI15QASNjNj+8UHZEg==
X-CSE-MsgGUID: 0akM09+gT9Sl/cbuYNe0dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17884511"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="17884511"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 04:27:39 -0700
X-CSE-ConnectionGUID: YssyrUcuRzSxRknGxtJdJA==
X-CSE-MsgGUID: IUDVeAzjRaOrE9I/M7i9YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="49282451"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 04:27:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 04:27:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 04:27:38 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 04:27:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w7t5Ltz18C59e3/07JFTmLODfenzh/SypyP19zsyz/WM+yzVyCh61hVh34s1C27sNxDe6aI6kfjNJCJARtAGB5VYGccsGopgx+SjUusNOvTawzq1TA4bBEHp5us/9s9Ob1l0WrsjjAw6daF+vx86FBg+Vd+LeEWPWjU0mhznzTxx5ij2pPkT2RKmQEWU8sCPJhEfX7FO687JUalCzGZiIpgHRuLQ79V6YfmRVZZTbUNMqEmBmix5+Ci3FvODRPpMbEMxCZJSjwrMkbQqG2XCpzp0+ELEIib99j8nfK3GaOKvoalMvzQfOlfV7/BaFymvdLm90a9E6UY/tlZ3NHqxJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYfNY43IQakpyhls4I2vU2Cacb5I4Xl6yuU5fODUH8A=;
 b=gwzcl1GqHsXJm1Lknu0G3SF6Jm6SGdBZ2MLQ0sxYAXiQjUjDFzWz4m8BEiLU/Xhgqio85pAhFm9ZzDrnNdPYV1ueGljK1RYKK8OxIPqfjYef92NDjYP8cq42Mf16QdFClT1V8W6ayVUme9fEDyFCgvSjnhAVd1KtOwROIFCY8wvCrSNggit8ZMlq+NlL0MYOe73tzJiu/B6hxoHxOGM4FrPEFLRUm3zpwQGzL0PwlAzGYL7Qz0y4s7D8ZvO1leW8YICGUpXBH+wC9KjtFQFy/Jd8xmBVle8vdKsRrzHzvKSrLUZcY3zZ1g6oCOfTQRtukZK9yXBiy2tVWLFLLkBz6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 IA0PR11MB7909.namprd11.prod.outlook.com (2603:10b6:208:407::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 11:27:30 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%4]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 11:27:30 +0000
Message-ID: <dc213714-f406-4db0-890e-bc6f32ff61c8@intel.com>
Date: Thu, 11 Jul 2024 16:57:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/2] lib/igt_sysfs: Implement dynamic adjustment
 of debug log level
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <kunal1.joshi@intel.com>,
 <sameer.lattannavar@intel.com>
References: <20240711101843.760796-1-pranay.samala@intel.com>
 <20240711101843.760796-2-pranay.samala@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240711101843.760796-2-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::11) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|IA0PR11MB7909:EE_
X-MS-Office365-Filtering-Correlation-Id: 424b41e2-8452-4c69-e607-08dca19c7393
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWVkb3JCUHdRTEhiU0pWdEozUFdSdGZaamZBNCtXQUw4T1hyTEM0cFpjOUIy?=
 =?utf-8?B?RUREZ25KNmxQQXprendFaHV3eEJ2SzYvUXpaM3MycGJ4SEs4V2Mya2dIbzJX?=
 =?utf-8?B?RUpFK0gySjN5MWIwOXpNd0pCSzE0ZlRJRGgvV2plcmp4YWRDR3JyU0I4VHNQ?=
 =?utf-8?B?RjJpOTlrcnBrbk1aYzAyWXRUSUo5SEFMRFNOVHV0cHFXZnRyUHFjTll5UzJs?=
 =?utf-8?B?dmNBTHRXS3VuOExZVW1GeXVJYndrOWpiK1lVdnNiOUE0aVVwN0V0Z1VBUnE1?=
 =?utf-8?B?TVM3bmFYUjFlVDN5bzZJcHM3OUVZS1lrYmUvT2h3ZHpWMHl3SjZ3UE5jWW51?=
 =?utf-8?B?Y1E0Q1lwbTJYbjZRbE43SEFrQ01tb2FYN0psVVhyNFFEaFBIRlJFc3p4RExF?=
 =?utf-8?B?S2Nxci9uU05CcUhwYkx4WEVzYlpKckdTQ0xlb0NINGIrTU9FNjJac0w2T3JU?=
 =?utf-8?B?SFRYRmxIemdEQzBBQk82SGg4a01yOUc2QkdIOUhQa1AxQk5sSHg0SGFWekR3?=
 =?utf-8?B?K1Z3SWRCMTQ2bW1Pc0Z5YkRqWFhDZWdKRGh6Zm1Ob3FhVnJlRjVEaUswUElj?=
 =?utf-8?B?YlR4M3BTekpicDZlL0dqc1cyN0JhZEZVRFNVa2w1RjMxQlBVSXJqU3R1Z2lJ?=
 =?utf-8?B?MS84WVZqWHpNQzA3WHdkUmdnd1VYU3IrQnh0ZU5XTEwrU0tQL3Q0blpjOE4w?=
 =?utf-8?B?V2l6STRQNjdNdndLSDlUK1JzQnpjeXFVUERUdFRwK2pYdm9abzJvVlB2M3Yw?=
 =?utf-8?B?UkhaemxDYnZPVGhWemk2L24yN1A0ZHA4eG5NTXo3cDVBdzZ4SW1Cc2lFKzdo?=
 =?utf-8?B?Nm5wbjNDQjFNTGVOS1hGZFg2L2pwRHZQN24rMXMrZFhhUXNFNndOODRkRVpt?=
 =?utf-8?B?MW5RRHFXeVV6OHhmYnEzZmNYQ05YYUllMzZDeTJXMjdkS1ZDZmlDUDI0d2Ni?=
 =?utf-8?B?QVNocWVpNnJmSldmNndjZjV3bEZaaXQrS2hsbitPM21pbDB6VnVwWG54VGll?=
 =?utf-8?B?UzkyOGNOWHYycHErYUJ4bUZvSEpEeGxJdklHSDFaS0svanFjMTI4bmtoUzh2?=
 =?utf-8?B?NC8rb2I4QzllMmFJNDBFZEhZNUhrdzJkQlkvem1kejNuT2ZtV1c4dDhKZ0pk?=
 =?utf-8?B?VThXTDNWeFhFT0VUMTBQSDE3anNZclcvVmVlUEdSMXh3RCtjSEk4REZ4RGRk?=
 =?utf-8?B?L0xzMGRGSklSVEUyY3E0Y1RBdHB2RmtRY3lUUzFRWlBjNXpDZ29xKzBiOUxJ?=
 =?utf-8?B?OVg1c2x2NDViTkdtYW5mbVAwR2QrVDFaLzhWN0RFdFQvUU5Od20zcFprdDdh?=
 =?utf-8?B?bE5yaERQdEJDNjYrL3BRYTltSjl3RmhTamtNZ2JzNkpKNnJsaXdzMDVlSHVh?=
 =?utf-8?B?czJzbGI5MlV4ZWE0ZjdsK1RBR0RvcUoySkNzZzhER282d0FqMmNDR2Jja2Q4?=
 =?utf-8?B?bGFYWW9QczZPblA1OXBKak11NmJSZHpkK0ludkUwNUhHNWcrWjNtVWx0UEZ4?=
 =?utf-8?B?eDlBSGFTSVBKdlF3c0lQWmpZU3dJYS8rWjkyY05UWGlaY3VteThRcXg4SWhk?=
 =?utf-8?B?K0FscjBaNEVVZ0owVmhCWjRQK1hqdklLTndNNjRaMFZ4bklTOXloRVJkbDlr?=
 =?utf-8?B?QWZFNEhzZFYzT3cwY2E5aHdXVTVLcmF5enl0VUxjRVAzVC9ndEtBVkJJZzhU?=
 =?utf-8?B?OXlad3dLREFOeU15S1JMRFRwcER6ZjJzQlpXZ3hmcTBRTHRVUGx3bVA3Qjl4?=
 =?utf-8?B?YUJNSlNRUytNaDBGV3h4N0pvM2VtcnBFTHZGTkRmOTg0TGJySWlJNHdNUHdP?=
 =?utf-8?B?bGhtOTdCQ0FRNURBdS9pZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnpiV1JNaEsrZUYrZE0xR200ZHVjQk9NSGMvcG1mSEJUUVA1eUdYampMK0lI?=
 =?utf-8?B?RDRObHNMdm5ScWl3bVJxK0tHeHBIZFFxYXYxdjhSa1RuVWVUb0xKa1ZNakVx?=
 =?utf-8?B?VTZORFp2MUxlS1BYK2dMb0pVQ1NhcFdjZTdmS29NV1pWa2hWK2VpSnF5Qisr?=
 =?utf-8?B?OFMrZlFKb2krWW9IS0pPS05jMTMwdFVrTFpVOWhsMjdnMEZIQ0RYYmdRSksz?=
 =?utf-8?B?aVo0TTVWa3JtajRRanJKYkhYQkpCNkFrSzhvQXpBeUp3emljK2FqZGNsZmth?=
 =?utf-8?B?bmNwL2xZcUk5YXlxL0pYU0xqTHhaYkRJdXZFbk0ySGkzS2x2Mis3bEV3OXJL?=
 =?utf-8?B?alFZbE85TVIzZ25Ta1NWZk0xS1pnU2E1MW1MTzhyRG4wb3NueUZqVHBteHQ4?=
 =?utf-8?B?eStrNzlORUdLdndaN2VJZUFyWUxXZ3JvR1AwTWlMNjdzRmYwRjcrU0RhZXBJ?=
 =?utf-8?B?YjdhNnR3bHRMR0NINDl1L2o5cllQRU9kUW1TdHZOZVRaR3R0dFBxMkY3WWdZ?=
 =?utf-8?B?UFpyTkFxOStaQ2duTVpnb3BIQmFkSEVBc1ljdENpNHVtRXNEVUNHT1gwclRz?=
 =?utf-8?B?dGhGR2xRTWJpZVdKMWtMMWdlTHVHc2w1Ui9IdUhER21UdU9mVWV2WkJSTitL?=
 =?utf-8?B?OE1IL3VxRWFab0dhSjBqSkd0WlhTcVN6dmdqT05NUS8vc3ZJQ1VYNUtpWTVF?=
 =?utf-8?B?K3UzNXlvMlpTSDlOZGN4UER6UzdKUHM0NXNXZ1RwOFY3OXBnR3NkeWxlVndB?=
 =?utf-8?B?YmhCeTh2a1FWVEFRZmRET2xHMHhXc1RTb3V1ZzdqWncwT0hlQnE2MDA4NkF0?=
 =?utf-8?B?WmNhNkRSOXA0TmNrbk1teE45T0EyZWczaFpDaXVxS0hMME9uVWhpYkxUMmFm?=
 =?utf-8?B?V3N6R1FyRDhXenRGMWV1bWZ5QjBHRjNzSUxtUUJSZHIyUkVGSU5GcWEvOFZ6?=
 =?utf-8?B?YThQZE1NaGs0a1VKSm9SNGYzOWNuNkJ1YVo4Tnl4bE5kcG5NQXhZOWRPVy9V?=
 =?utf-8?B?NE5XOExOZjhwSjVLQ2I5TTVLalhqdGROaGQvSDV1OUJBS0NBZjNUb0VUSDYw?=
 =?utf-8?B?djlPbVZkczE5T0ZMOXZ0QTNJTXU2eU9EcGFuVGZYNG5hUkp2bFFzUmNuV1Ex?=
 =?utf-8?B?M21ieXRRNEpUR1AzV0Voc0ljRkE2aE1SdlRRL1dkeEJ4Zzl6YWxOejdlREc1?=
 =?utf-8?B?cmNiV0pLZnptWE84ZWdqTEdlaTFFWVhlTEVxRUc5WHMwaS9PUnZneWgyNlpP?=
 =?utf-8?B?ZnhiUjc3OGRqRGp4RFZYYmpGUzdqRDAvQ09Vc0lZd3FTS3d6V2hsMzRjOUNW?=
 =?utf-8?B?WExUWmgwcnVUL21xOXlXMjAvUUZINFB3SmRGdVpUaldVSmtxSEp1OGRMcWx2?=
 =?utf-8?B?dWwyK2ozc0ViZ1hFcTZ6bEZCeVVxc1pzSGlDemRYVW1NQ3gwY0tkYWN5anNy?=
 =?utf-8?B?T0RGd0dBV3RzSjhkem1OcXErOUxqUGhsUTBIaUVFYmlRYjZEMm43SkRsVFh5?=
 =?utf-8?B?SUhIZWVBQkJyaFk4aHNuM3NPaUJYaXZaVWNmSTV0RmxWOW9FTFQzYXlBZS9X?=
 =?utf-8?B?dVI0R09Tb1FpSVFSQXdCNzllUDdoendEQzcrWHB0ZStENm41ZXYxdDE5WVAx?=
 =?utf-8?B?d3IxWVNuTGQyUlVPUDNFYjJhYWhRY0hLTzJQT3RjbU9hNkFEc0F4MGNNM1Nk?=
 =?utf-8?B?c1FzN1JDN0hNTTZtcEVNTWlYZDBBZ2xDNGlnWkVhU0lGWFNBdmw2SXlvZHdO?=
 =?utf-8?B?djJBa1k4VUtYV1JWQjN6K1M1Y1dWNjNNcHVnOE1mdE93aU05VkxZdXN3UytH?=
 =?utf-8?B?cExIK2lpMGJpTmw3ZlVibjBLbDQrb1dZMk5HVlVEY3Z6TitXbndJampNTWZY?=
 =?utf-8?B?MmZjaHh1Y1IwWG1JdmZ3Y2FpOFNwSlJsMVZEOTVXdnVxeXI5eEw4RlFQNExn?=
 =?utf-8?B?c0N1TjBIY0F3VEszYnlHOEtSNlZaVkMyUHQ4TGZLUFBTYlg0VHNrTjhTbXln?=
 =?utf-8?B?dGdLdFpKN3NpZ2g1UnFnU3ZQUXRoNHVGaHdsQWdCTkFZdGFjMnZZYVZkc1BP?=
 =?utf-8?B?TWxJZ2s5OExBbVNTZnpIaU4yeHYzMnNRU0U4RDYwaTFvSk9sbTNTaElFRzQv?=
 =?utf-8?B?NEJPV0dwOFRSWkowN1JxMTZzSWgrMXp5bTBCdThJYURkczJqOXE2d0tuZGl2?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 424b41e2-8452-4c69-e607-08dca19c7393
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 11:27:30.6820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZipumLM/ZWVOQGufjE2bfAwEg4ZT7OmgMSP8Pva/6hPWP2SOopP/gB3BbgdhK/nbfBuGeRHFSxCUTuh43PlYWNUWuU0xtQWOgyKju9hmv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7909
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

Hi Pranay,

On 11-07-2024 03:48 pm, Pranay Samala wrote:
> Adjust debug log levels dynamically to prevent machine
> disk overflow during excessive test debug logs.
> 
> Introduce function to modify log levels as needed,
> with an exit handler restoring default settings post-test.
> 
> v2:
> - Using proper function name to represent its
>    functionality (Bhanu)
> - Added Documentation for each functions (Bhanu)
> - Removed the magic number and instead reading the
>    default value first (Bhanu)
> - Using recommended apis for better handling (Bhanu)
> 
> v3:
> - Adding module drm_open_param function to open
>    the sysfs directory (Bhanu)
> - Reducing the current drm loglevel by step value
>    to make it more robust (Bhanu)
> 
> v4:
> - Remove all the extra new lines (Bhanu)
> - Remove the unused declaration (Bhanu)
> - Edit API to only update the requested drm debug
>    log value from the caller (Bhanu)
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   lib/igt_sysfs.c | 103 ++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_sysfs.h |   5 +++
>   2 files changed, 108 insertions(+)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index ffeec1ca2..84d6d8f9a 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -412,6 +412,109 @@ int igt_sysfs_get_num_gt(int device)
>   	return num_gts;
>   }
>   
> +/**
> + * igt_sysfs_drm_module_params_open:
> + *
> + * This opens the sysfs directory corresponding to drm module
> + * parameters.
> + *
> + * Returns:
> + * The directory fd, or -1 on failure.
> + */
> +int igt_sysfs_drm_module_params_open(void)
> +{
> +	char path[] = "/sys/module/drm/parameters";
> +
> +	if (access(path, F_OK))
> +		return -1;
> +
> +	return open(path, O_RDONLY);
> +}
> +
> +static int log_level = -1;
> +
> +/**
> + * igt_drm_debug_level_get:
> + *
> + * This reads the current debug log level of the machine on
> + * which the test is currently executing.
> + *
> + * Returns:
> + * The current log level, or -1 on error.
> + */
> +int igt_drm_debug_level_get(int dir)
> +{
> +	char buf[20];
> +
> +	if (log_level >= 0)
> +		return log_level;
> +
> +	if (igt_sysfs_read(dir, "debug", buf, sizeof(buf) - 1) < 0)
> +		return -1;
> +
> +	return atoi(buf);
> +}
> +
> +/**
> + * igt_drm_debug_level_reset:
> + *
> + * This modifies the current debug log level of the machine
> + * to the default value post-test.
> + *
> + */
> +void igt_drm_debug_level_reset(void)
> +{
> +	char buf[20];
> +	int dir;
> +
> +	if (log_level < 0)
> +		return;
> +
> +	dir = igt_sysfs_drm_module_params_open();
> +	if (dir < 0)
> +		return;
> +
> +	igt_debug("Resetting DRM debug level to %d\n", log_level);
> +	snprintf(buf, sizeof(buf), "%d", log_level);
> +	igt_assert(igt_sysfs_set(dir, "debug", buf));
> +
> +	close(dir);
> +}
> +
> +static void igt_drm_debug_level_reset_exit_handler(int sig)
> +{
> +	igt_drm_debug_level_reset();
> +}
> +
> +/**
> + * igt_drm_debug_level_update:
> + * @debug_level: new debug level to set
> + *
> + * This modifies the current drm debug log level to the new value.
> + */
> +void igt_drm_debug_level_update(unsigned int new_log_level)
> +{
> +	char buf[20];
> +	int dir;
> +
> +	dir = igt_sysfs_drm_module_params_open();
> +	if (dir < 0)
> +		return;
> +
> +	log_level = igt_drm_debug_level_get(dir);
> +	if (log_level < 0) {
> +		close(dir);
> +		return;
> +	}
> +
> +	igt_debug("Setting DRM debug level to %d\n", new_log_level);
> +	snprintf(buf, sizeof(buf), "%d", new_log_level);
> +	igt_assert(igt_sysfs_set(dir, "debug", buf));
> +
> +	close(dir);
> +	igt_install_exit_handler(igt_drm_debug_level_reset_exit_handler);

Multiple exit handlers will install if this API gets called multiple 
times. As of now this change is fair enough to merge, as we are using 
this API as single time.

But let's explore and fix this later, please add a TODO/FIXME for 
tracking purpose.

With this change, this patch is
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu

> +}
> +
>   /**
>    * igt_sysfs_write:
>    * @dir: sysfs directory
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index 6c604d939..5d050c786 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -138,6 +138,11 @@ void igt_sysfs_set_boolean(int dir, const char *attr, bool value);
>   void bind_fbcon(bool enable);
>   void fbcon_blink_enable(bool enable);
>   
> +void igt_drm_debug_level_update(unsigned int new_log_level);
> +void igt_drm_debug_level_reset(void);
> +int igt_drm_debug_level_get(int dir);
> +int igt_sysfs_drm_module_params_open(void);
> +
>   /**
>    * igt_sysfs_rw_attr:
>    * @dir: file descriptor for parent directory
