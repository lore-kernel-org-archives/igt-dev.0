Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E096C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 21:10:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74D210F93C;
	Fri,  3 Jul 2026 21:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZEcX5xAK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7A610F937
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 21:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783112928; x=1814648928;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ejc+zP+sy7ZcOM3PXkSmSzjVFO1s7PUDzpVzuaIW7Q8=;
 b=ZEcX5xAKOIn+YM7FrHFOQswcaXCaNvXPdYCE3PE90GdFP7w44/41OSEH
 5advQMm3BfAswljbMdR9D/Gi2rikpRZmr9/14BGYmSxatQvw+OYKqZ0d1
 U6pVeu31RAq0t6mbMvkKSSkHx9/PEJP2JoAu5o639lNuegMVN2HF6uB7q
 hrzbLbVc9sp7nGYBMLLuerbAp0c36vsif7pbVSSCwTDxKLACAQxlkN5WD
 aoXe3iQjBjWumeEA2rCu/acOoUkCQblNPt9DbIKrj0IqpfTzvGS+OsVkm
 +tok97MgK7HbHWF/uEhenb97XmkDoffyz13kPawpGrGCl3CGsqtEao9br g==;
X-CSE-ConnectionGUID: bHWCAJ6/RJmKCq/1tkPj7Q==
X-CSE-MsgGUID: DgVfdZjhRfWKVhCKiWP1Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83637854"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83637854"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:08:48 -0700
X-CSE-ConnectionGUID: 3FRj1jsaTq2AtB/LLFEQsQ==
X-CSE-MsgGUID: qrBw8d3BQ7+mzFUG25O4Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="248736898"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:08:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:08:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 14:08:47 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:08:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bprZU4yR11jRtf8bZr+l/GJ3eA4SXZDWytIse/sJEZNbM/rjHLJI+o6kwyIaY47pEbfp1naaO6KnQDwUASWqO1nzWazwhoUHgOjWvRTUZBeF5eNV17lJqwkidHX2Ug6nM5DA3KTJcmzqxKVgOSniRwL6qeh51/lGNVAiRRfSp8LEndbQfVjC2S4cpXtn3hTJ/5kqNuExME05JesrsATeTx4P/wPXqGxlXNdFxTOmCvYno3jgd9PXKuH7b7r/WGxzxf8zQHRbBNFZmOE8eYYKa+WORxBcUBUu5fEGROIu64rTxEgbkjhlod4ZozMhT3T5TQrsME3HHBdzs89gkRyWBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2d9AB5mYcpOZ+nfyYHceZ0Y1YTz2xyia3w5K6BUQk7M=;
 b=JMGgi91Z8uzpsKIxzBtshRtFqpzpRj1mOvMdtXCtG9IIERrhIn68FLx7OQkImEz2bM/7cnHvOU6XJeeyoqIgZLB5aki6JE40lK9J6aMBq6IWrxUN+C/mMtTBO+Hq2QPdHcsYFte9YISd4U9lA/Po8uG2YsW0pqEw2NCd1bNU+kMDwUh2iaJ/5/WYrQH9zHcR3kqZ8R6t2jOA70UEnYgydwVbjafYQ7aKFX7x0H1EMJD/UHwNmeANpqABeLh+h+wB0jOjWsqLE8HDw62EqhXyNjF5Olabs32qrkOCGYyIljJidZYCxibQkit2oXzD0ft25WIBIlc7tQr5hPOpwspgTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by CYYPR11MB8307.namprd11.prod.outlook.com (2603:10b6:930:ba::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 21:08:45 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 21:08:45 +0000
Date: Fri, 3 Jul 2026 23:08:39 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 26/31] tools/intel_panel_fitter: link with
 minimal sub-libraries
Message-ID: <n5xkfbaveuo5cx2aerxbjptjaygouaoiz43defqqrxubpx3wd3@kpxus3ugrom6>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <4fa96369ba17ab2d327d3fe266140180f22204b1.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <4fa96369ba17ab2d327d3fe266140180f22204b1.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DUZPR01CA0086.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::13) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|CYYPR11MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: cc9772a5-df9a-4190-5033-08ded94744e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|23010399003|376014|366016|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: zPgrzHGF3BrWyq/AvdmOn4YHhYZuWJwK2P04jX81t9PsiZqHleTTdQD8CV66f1RYbQsRZ0w/EAb/KKHAEkB2UKLDUelvWSaqzM/gKeBWam1UC+uqRWFuxy7IURBz+HQaaUqZHOdCCgwiO3mMXAiTQR/gMg9zLR/Bqx14hu0lCI+cIofm4noVgoAorip/gsXrVSdeuQBYFyLqJo4g8D53UMB/bYvnO97AH/eEjmiTYLSvtUvqNVgr5pV2yLpKPbd3f55hmfEhJbFzEVJPKa+Uir8F/IpJc4FY9dpUeNlBW94YndZeihn1vlBC+CulewD2Z9p+iMdA5ojrASNKl16xa5zvdewzxFF35MKlM+s+m49pCtSYjAz9aAQdGkfBR2g0j1nKIqM/c+uX35T+kW0Btzyy+zgXcgAMcWcfbaVV3Svjulp9pQxyqYjWh77mddKCAcyDOkYpZPjL5RjXDJDTc5Auk9PRMbAiwzb1J3icTWWolXMQ2unIKGlFW5oDOn3EaVK6ZKdoBYwlzbGsPkw7iM9mr9jxgro3/U1+cJFgqNH3yqXYzKbOKR/C4gkPLLOYj3sgYejDlGao9vcYFZeULVKIXfmOrAR3SAIZAw6ytaATWGduyF14DBTEDrRq4d/s5JGf8Db21ClOwYH/Je0aPjxVoXnvCOKNLzOcqdiRAgg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWNndkZXWXNSK0cxRFlSamordWs5L01FZkxuZG5GRnA0eHlYTWlwc2RRSjg5?=
 =?utf-8?B?REptUzEwem9yWnZCSjBaUU5vUWFmd3QxSDBQQmhYNm5vMlF5TDlXTStISDA4?=
 =?utf-8?B?aWRJRnN1cGFyZXl5ZTFndmluSlhxNEhXeDRpWXBqelFmOEk4MGpiVHlOMkt4?=
 =?utf-8?B?MUJIV3dINndHRGxKQkJHNEJHaTBTQnNqN3Vad3VkVEVCVnp2ak80eGxBRDFi?=
 =?utf-8?B?S3NLR1JFdVByVHdhcURQdC95dURWL09DcWp4UVNLRTFEbFkwZ24zNzVSM0Nr?=
 =?utf-8?B?K0NaUXJyWkJOZStSc0hWWTc5cGFjeUVyU0tBSWxQc29maVhFbXRjbDlWM3d4?=
 =?utf-8?B?SElmVHFqWFhvMmxWR3NsemxLS0pwWWw3RFpXd2NGZ1hDYUFzMDFzcURMcEdF?=
 =?utf-8?B?dENlMlB6a2k2cGxyZGFPMFR4QVFoVVJTUTJUaUJ3SGZzRE93Z0VzczdveFU3?=
 =?utf-8?B?MFprTTRpT1VaSk14OXZSUmdCSzY3M05tTDg3V2FBblBSV2ZZRVZRT2RUMDV6?=
 =?utf-8?B?Z0RYQUVLSXhSY3dZUDlWaFJ4MTM4U21RT3grRis1NW9lOWx0RlRrYW1BOEFB?=
 =?utf-8?B?OTlpZlFMNXRZTlN3Q05SbnQyUE5wei9kYkprSzZuUUpERjdMcVJPdmlsRW9y?=
 =?utf-8?B?emlDdlRINXYxMDVvTXRoZ3Z4UlFSRHBLOW56WHh3TVRpRmlEZ21leE5HSWhx?=
 =?utf-8?B?K3pDMjJrNmFZME9Lc0tidmZaS29rd1BNQ1ZzYmpNRnRHTDBLemd0L1ZHU1Ur?=
 =?utf-8?B?U1ZlLzBabXh1Si9ZbXVGSzRvUVpQSWZRUG4yc2hQNGd4VHVpL1AxOUhVbWNL?=
 =?utf-8?B?QUN2Sy9sczFOTGxMKzRkamdmSXNSL1pVTFRGVmczUTBNQzdUTGowVHBzSzEv?=
 =?utf-8?B?MWVIdS94Q0Q1SHI0MFkzUmNCaWxLUkdCM09vcXA4ZFB2N3p0UXhBSHEvWFJT?=
 =?utf-8?B?MzBDblZvWkFoQ3RxSzJwVUV3eGM1YmdZbVowdkhTTXc0aGFnU1c0NHdvYVZ4?=
 =?utf-8?B?T0FxN3Z3OWE1bXZnL202MEJpdlhlQm9tVk9yYy9LcU8rdG1DaTJWYlQvN2V4?=
 =?utf-8?B?TUdyTUw0WHduaVZOdUZZK0ZlL2tMdnFlbWtlWnVQbi9vNjFtU1FaRUNOM25D?=
 =?utf-8?B?dGRyNytLL2Nnd3pSaGcxZzZyb1ZNdjlpb1pMTTJXNzNHL2R4Y2NlN1cyR3hp?=
 =?utf-8?B?WjlhUzVzU3EwTnR0RUFaWkE0Wko1Ujdnb0dSVFZxM0pVUDJSaThldkNBd2x0?=
 =?utf-8?B?MDVoOU1LYUNnSXFuY3h5ODUwWHhhQ2lEV2tKTlE5MDhpS2V1SXpxM1ZkYm9o?=
 =?utf-8?B?UjFPM3BTUi9UWkdsTHFDM285dExNaUcwUnlMRlNLQTI1UFNuWDBGNUMzbG0x?=
 =?utf-8?B?YTd2enRxeDJTOEx4R3RHbXlneGpOS3FWY0psSEhkMnpkWUdLL3RpdWowejYr?=
 =?utf-8?B?N2YxaXltU2FoVVVPQzJlTllXRlk0WlQrdVlxT0Nxclc2YmovUjZzR0RmeXdC?=
 =?utf-8?B?TU1SeGtpNXVTTzgvZ1IwUGRvSHR2RGlLMnRMb0puY0tKbEZqeVZscVN2ZzF5?=
 =?utf-8?B?RnVnLzRKR2loQ0pHKzhXdjRlQ1NiaExEZ2s4QmZKdjNjZ3lZeFlsLzZiYVZV?=
 =?utf-8?B?VFdnYW9oV1FadGNOdzRuS2VxeXlRaURRVGJkVlEva21TanhDbjM3eEdRaDYz?=
 =?utf-8?B?YzBNWVNtK29lbWlSa1R5Y2JqOEFEVzBXMm80N21EMHZ2VFNvTXZiVFJMQUxl?=
 =?utf-8?B?TzBCZm45SitUUExuMU8xbFFVLyt5emZGSUJNTEtXVk5KcnFJRjR1TXlIdWk0?=
 =?utf-8?B?MWxzZnVMOEQ1MVVobkJIYm84U3Q4dnBiTDBld1BsU3JTU0h1SldvK0hMb2lJ?=
 =?utf-8?B?dEZkNXk0U3JmeW5UQTVDUDVHQ2JpK3BKTkQyOXhvUUFINlpHYk1SaGxVdm9Q?=
 =?utf-8?B?Rzk1NDZraThjeWxSYVBwV3BCUFpiUk55UUYvM2xabExySmZIczVmSVRsalB5?=
 =?utf-8?B?VUJtejh5djZzOWJ6dHpWQkE1QXA3VWZhNVRUNVFDZDV0ZXVoZVVJU0hSeTNJ?=
 =?utf-8?B?K3JJSFRDNTVDRkZ6dUNFNEZSMVkyNng0SVM5TCtCcmg0SlNJbnkwWXN5QUFS?=
 =?utf-8?B?RDZWWStwcGZlTS9EcVFUemloc3FueGtDNGN1eGVVMnoyNFdnanF3SEZkdlBv?=
 =?utf-8?B?V2MyUzFhdGJROFB5d0RDMjgwbGgwUm01MDd4ZlREWkR6L3V2UGdMUXBkMGRR?=
 =?utf-8?B?bDJ6d2s0UGRYcisyb2lSRkczOU95UXJTWjFkUmFvTEt2RHVXd2xvNVMrZ1RJ?=
 =?utf-8?B?bDdnaTBwTnlGL2NxengrWDF1WUx0MEFnY1M2VlR3MXg4eHBuTlZKeVhQZ2d5?=
 =?utf-8?Q?pKjwbix7P7UqyF7j14e8VYlnwSmHipb0O/q/mcSe/85d+?=
X-MS-Exchange-AntiSpam-MessageData-1: wz5G/pbzkeh8795/Ohh29eV7tMUh7nP5qwM=
X-Exchange-RoutingPolicyChecked: nl00EG3K5VGQD5127+DD7VwYLJ/8P1WwzdUMtB1Du4pml/r5eYu79KkBdyFU7bit9rTuDF7su185PO9ryagBl3UDybQ5dn5iLeytCticEMFK3AhzaBtoNP08vkTeaHa7IiDcfCesgaGW0VOzX9v6/6p8c4F2hSesrujjvZocP71dAvu00PqWxPgLOzCYi3zWDxSBAKkCUHit1ltd42Es3y4anM+7cbkR1S95rfumHvpbhm+/Fn8j3skbo/T5Y5zGHFb2jnfOa06Lcma18SU/ANTC19wwnjy+Sno1n5I0vi9hkKedVYYEICtXI2xfmJP0I7+cwRQXRAL8A0l6QFx1ug==
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9772a5-df9a-4190-5033-08ded94744e6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 21:08:45.6051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iFisdLI670AKr3XSifmFCJRFF6fsq8Ievfu4TW0+4LGqBjPIXlFqoeM9uR9s2PLMA1swdqkuOCTOInOIFjnauwMYhx0eLmcvq8YWNTotsws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8307
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

On 2026-07-03 at 16:29:00 GMT, Sebastian Brzezinka wrote:
> intel_panel_fitter only needs the register/MMIO helper subset, not the
> full libigt.so stack.
> 
> Switch to linking against lib_igt_reg_tools.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   5  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index a31b6d0ed..1a4e14ed3 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -21,7 +21,6 @@ tools_progs = [
>  	'intel_framebuffer_dump',
>  	'intel_hdcp',
>  	'intel_opregion_decode',
> -	'intel_panel_fitter',
>  	'intel_perf_counters',
>  	'intel_pm_rpm',
>  	'intel_reg_checker',
> @@ -120,6 +119,11 @@ executable('intel_infoframes', 'intel_infoframes.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_panel_fitter', 'intel_panel_fitter.c',
> +	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 
