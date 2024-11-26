Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3728DD66B84
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 23:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0C510E0CC;
	Tue, 26 Nov 2024 23:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e1Cqug9t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D9210E0CC
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 23:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732662569; x=1764198569;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bsuObWKSJo0pWbl11yhmMQYos8aSPW87dgr2Pmlz38I=;
 b=e1Cqug9tmbG0M80N0/zDqUdEHPnxXcO5p/RcJC7jhy9coB8NZAaGD4Q1
 syIBVzzWI2QXdNyFdNCPdV0OrYdIDp1+f/nM+d0+DBwoLVG5/+Fr07Ub/
 8BDx1m/PW3Zfoz155W/8Ec+XwdDF9DJFe6XVmKPMz1WSDS0yYuqwfDxQ0
 Ga4B3gQ1qkUFqIpY3aaOvWhOLnHowNs+qo3yvxsnDqnqTaFrsZIwW3EGw
 EMfXxahQzcRjjZ4yuIy8Bx8Cdx5WFXA5zeOHK2Mhb1tmY4Jq36ImCn6Cn
 KA8rJVa6/bekX6JgdrcaQMf7UsOfyS7IRAnZK+hUoZWxUD/JtpUAtuLsk A==;
X-CSE-ConnectionGUID: pLF2KFspQGa5cIJq+5rsmA==
X-CSE-MsgGUID: NUPzs9K5Rj2EQL9n+JlVTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43463029"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="43463029"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 15:09:29 -0800
X-CSE-ConnectionGUID: FOjQDI4/RjqPOty2cP7ypA==
X-CSE-MsgGUID: QdTmQOQxRhe+bnOmswDXAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="96826547"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2024 15:09:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 26 Nov 2024 15:09:28 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 26 Nov 2024 15:09:28 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 15:09:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEqWCcmtSaKdicLBnyUtJ4VhIXvUkWtVdUIYNuMXqCGPePoMusrjEcgdC7BkQPykEyNwFjXxt87ZwGQH40MShUElcQxl+Ayx3Vwuo4vPuLPOCmhaDhG3PYd3wEB38GABNNU62M7Vje50v0+Q26WJuqcWnryP1fj9sItShWZia2gfOnJ0R8yazcGuxn1EegvMG8dKl6GO3WqkuRvjsB/DemTigLqWuFzRV0oA4pNBzexQDr7HUPy4WkbKUY2KTS/bcn7ifA881J1L8ftoQISGeH1CLZ1i3Fhssk1H8VoJsJw7Bk+MozKVbb3+zBf9jk65YOOwkROQ/wdxuKwQhkAlMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwgLOTuHMA/kwMt/DMLQuwFIaHbLrQ/C8OxL04n8DaY=;
 b=Uhgz1nbUyWFca6D/czhX6kxaKKHEBTDmw1w4Ra2b27+1+vxtH5U7cFmVrqJByZoPkcZvZ2y6/TzB/en96ZEo8eIQ3KoUspx6zwbeJyIu9401Qn2b87Ua6bpXBmgcAgCHbxvBIUqY2tsaEUlWCiUmgXvh8a+NL0vOwDPzV4siRaPAn3aGkG2kck4J0NjG6/Rjq7BOyrbQuksfK7x2Ixtl4+Rpx3bYShtp0+37ggBOPEc7CrX/D1nG4iICu2ggpKhv/OXWmcGOZqH8cvix5fPk8FK1YWg7286fu0JQNYBqYrriONKa0gP8uFfLInHJc46fpfqQOeguicyaPaCtmUTdow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CYXPR11MB8755.namprd11.prod.outlook.com (2603:10b6:930:e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Tue, 26 Nov
 2024 23:09:23 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 23:09:23 +0000
Date: Tue, 26 Nov 2024 15:09:20 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Zbigniew
 =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v4 1/4] tests/intel/xe_wedged: Ignore more dmesg
 warnings
Message-ID: <20241126230920.GI4891@mdroper-desk1.amr.corp.intel.com>
References: <20241126181024.1398259-1-kamil.konieczny@linux.intel.com>
 <20241126181024.1398259-3-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241126181024.1398259-3-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0158.namprd03.prod.outlook.com
 (2603:10b6:a03:338::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CYXPR11MB8755:EE_
X-MS-Office365-Filtering-Correlation-Id: deebb53d-9902-4ac3-d40a-08dd0e6f5d66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFJ5MTdPTkh3OWoyc3cvNGx4aGFvUlZWeCt3VGswUHNrZmRYV2ZnSXNJeVdZ?=
 =?utf-8?B?S0VjdTFCMTRWcXB3bDIxTUZaVlZ5NmpRVjFWaHpDb04rdU1zZ0dvd3JnZGs1?=
 =?utf-8?B?d3lsaUdWOVNpSkVTSHNkODI2dm5lTnFSVFRaVEJNZzUwMks4R1J6a2tUT0ZO?=
 =?utf-8?B?K2REOCtFZzhTZUs3RU0wdGE4Sk93WHI3dVFPM0xEY1JzSTFaWFlXN2N3ZG53?=
 =?utf-8?B?dkRQSThLWENQQWR1TjJyWC85V0FqU0JReXFrTkthRk0wWTZzd1ZpVURmYjNt?=
 =?utf-8?B?YzcyaTd4THA4QzVmcTA5Yzl4MERzODloWDdrRmVmVS8zeUE1bnNWVTVnS1Bw?=
 =?utf-8?B?S1B4RFFsS1NmOGtrTms1d1Vpc2xQbDBhM0YzYjl3TTBDTEZGMC9vWkkxd3o5?=
 =?utf-8?B?NGtsa2l5eXdVd0Zmd3Fib1lKMUdXS3Z0UGxzZGJCRjVCNVlqZ2hNVllSNi9E?=
 =?utf-8?B?VnBxYzdhVnkyUXZxQWswS1ROdUlJRVpFRUtUcFozK2hOZmxlRnFKdWJlK2pN?=
 =?utf-8?B?SFJFN2lra1hobFBJMnpXZkdiYkkrb3FyV0ZrYnFibXRsT3FheVIzaDIycmY0?=
 =?utf-8?B?dHRqOVptVElHQmlXR05UbFZna1NJaWMyZFlWY3BpaTA4Q0JQQTJyV1FHTkhD?=
 =?utf-8?B?bTh3d3JvbktLb1dzMmJvWGFMaW1KVWRCSERIVWRiQ0RPc3dVVXpMMGhqc2JP?=
 =?utf-8?B?S1FRN0ZybDNVcE5rYWtzeW82UmtNQm13Zmt3dGJBeVMzaEpzRjZiK3F4Zm9N?=
 =?utf-8?B?TWVsMzY0V3pPWms0bUp2cUIxUE9DR2tWYUh2QS9sNzJhZDZBZW1MQ1NCUmxS?=
 =?utf-8?B?MElGVmNyaUI5SDErQXQ1eVkyQ29uNS9Pa2EzbmVHaVZUbnM3RnNRK0hVNzQr?=
 =?utf-8?B?U3AyOEtyeGFqbmpia0x3YUg0SklRYWpEeUdaTGVVa0MvWW4wckdKNGtDS2JD?=
 =?utf-8?B?VndNT3UwY0xwR2E2SmlvL3h3RU1ySDR5VXFyeGNsbVBTY0xzNVBFWkJjb1Nr?=
 =?utf-8?B?UVFjSlJQSlpaMDJhSytQOW9FTk5ZNURQOVBCWU1YVlorQVVkdlZkL3QzK01l?=
 =?utf-8?B?Qis2MDlCMzZTTFg2MmRKbmFob2VIWGNxVjFpcHNnMXJvOGJpbU9WdXUvdlRC?=
 =?utf-8?B?TTIvVWJ0RVFpWnQvV3BGR2txNXhzZ3pXdG03SDJFRXJMY2pzZ1N5a3l4ZnhD?=
 =?utf-8?B?NXFCZFVtOXd1a2JSWFpxMkNFNS9KL3lBMFpyTGIxWXVpNlhEaEMrdlR3bmlI?=
 =?utf-8?B?TVd2UmM0ZnRDdUdNL1pwbVpWOXFjMCtmMmxmR2VXSENVRkpVU25wYUxIdjl1?=
 =?utf-8?B?NHhrWDVoSThOc3dPcTh6S3hlLy9pYWl2WC80bzRJUGN5YXhNT0FxeVFoTGVC?=
 =?utf-8?B?V1VOOHBNYkFFNU9mMFJhSHUzcGR0ZDRUbEJBaythVUY3ZW1DeDFPUmh3eGlw?=
 =?utf-8?B?OHlmekd4Rm5sWXk1VDNUNnE0MkRGL09YZXVXbjdFYlhmWTdMNE05MmtUdi94?=
 =?utf-8?B?YjF2RTdyWTFrUmFsUW9jRURpWnVzaEpNSXp0S08yV0JweHFOa3RSZXRQMStj?=
 =?utf-8?B?RFJGdmprZEZhcHNVenNhYldycWpMdDdRQ2M5NkFtM1NCVG1HTnQrQjBFalNa?=
 =?utf-8?B?YzJFQ1BRaXdvQ3pGSWluOVZVSWZzbWFmaGp3bzl2ajJKcmpIZE5XUHB6RExT?=
 =?utf-8?B?YkloRjJCZENYbGR1WVR3b25jenk1RytITUV6eDlVU1llSHF1azBHV2JWRHN4?=
 =?utf-8?Q?XlvzD7fjqcyicbgdS52BiOBEZdtaNuNyO2LfkM5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnZ6amgra1RCa3Y0L1VlNHpNV0dIcGU5KzRySXlDK3FTZDBLclBZNUJldFpu?=
 =?utf-8?B?UFdJMkc2bHdIeFE2S3ZxNnh0RFRGbzZMdUI0UUZLdTlYNUw2bXNod2l3M2kz?=
 =?utf-8?B?YWY0STNVNE1LZlRrNUV4cjZvTERyUlFiSUc4QkZ5SHVRY1QrbDh3a0R0SGNp?=
 =?utf-8?B?VFlxTW52STdmdGtvRldWNG01S0lNdXNiWDZaVGlUbkpaL2hNMCtabWlaaHVZ?=
 =?utf-8?B?SGlmWjR1NTFBczU0VUx0MWw2RHBxOGM4VGV2d0U0bmkzRnFRTGpoM3lvSEY1?=
 =?utf-8?B?MkxzanR0eXJkeGUwTEtVQ2I2cUpsNFRncVNQQTNUckxNY2R2UmRxOXJ3V0xI?=
 =?utf-8?B?YkE0VzNFL0VSM2pJYWcxSFpSaUJFc3VSR2xGZElnSTI3U20wREdwamQ5S1h4?=
 =?utf-8?B?Vm9UVTNQdEtCanl0SkxOTGMyb0NJbHdxRkJncFFoQXF2VG9EcWh6Q2hnSUEv?=
 =?utf-8?B?Q05PNUVlR0w3SlZLTWlXN3F3V2lJTXdVUG1KWmRRenhJd2ZwaGFpNGFuaGVp?=
 =?utf-8?B?ZjNqb0lmMk1hUVJlSFNMelFpaWF2QlU2RTZJR1k1aE54UFVqd0w3MnhqMWJo?=
 =?utf-8?B?ZDZpWE9LWW93dkY3Ni9MVEZnVlVFTXB4UzdUZHFac0dIRk5TUm5BSW5xSFVy?=
 =?utf-8?B?SlAxV00xS1lJQWJnWXB0UlV1NVNjdUxqYjVLUlRyZVJrektaZjVXa0FTOHZU?=
 =?utf-8?B?MnY2Zk9rZGN6Mm5CK3k1YXZvclhzbTRXakpTVEdOZEdqdDNDaHBrV1cwekJH?=
 =?utf-8?B?MmNpTFAzdEkybURvd1BFRmF0dCtiQzR1b0xnNDF6V3BrM0F0TVEzWEQ1Rmdi?=
 =?utf-8?B?M2RkYzhwc2tORE44YTF0aXp3cjlYZlhWWFpNMG5hYzFlZGNPYktVU3NiN3Vj?=
 =?utf-8?B?OW1KeWNlamE4NldxaUZQckh1Y1pZeDRNSnhpME5CVTFyVHhwNll2M3dLQnh0?=
 =?utf-8?B?b044Ym5HSUxFUWd4bjUrR1MzZWRuUjdaSHlJQ1VOWmxXWHp0UGJYWVF3cDFT?=
 =?utf-8?B?NEN0eHB4K3duckFmNnphTU41OHZIdVJNMlNEVDhKMXlHTnZkNENiWXJPZXdn?=
 =?utf-8?B?ZnNyVnpsbXhGWWFrN2YvSVlwa00zZ0FrWlU1Mlk0RWY5WFl6OXQ2NlJRRlRY?=
 =?utf-8?B?eUY5V1lKaU1YYVVyekNselBLaU1pWlUvTldyM0RpQ3MxSjRTeWM1cGJ6dENM?=
 =?utf-8?B?cGlrS0Z5cEtsYnVCU0IyZHJ3ejBoTThWc25WWEl4dUlaQzJ6bXQ3YjlnWkdP?=
 =?utf-8?B?RUlVd045eEp3RU1JeDI2NGk1ckJVdmhuUHNSQmdya3hYNGtoaHR0S3dqaTFS?=
 =?utf-8?B?OTlVMlVFb1FWS3F1WEpyZmcvOGdYUUVBSHovbTdZTGUwc0FTM2d0T29FQ25a?=
 =?utf-8?B?T3Y5Yk9NOWRIWVR6VkxPbnV1dmF3dXBWazE3TVAvUXFpL2hYNnIyUzNHdjVM?=
 =?utf-8?B?Wjdpb2ZpR0FxM1EvelA1TWp6eXY5T042UGZFcDd6blRiZWY3UDZqZEhkSFdo?=
 =?utf-8?B?S09BYVQrZ1NBTTdESlB1MFA0YnYxcTZLUmlEUjB6MlBOVnlLM2h4L2JIenNy?=
 =?utf-8?B?UHlDalg4bnJCbi9HUDRnNFZxRFJlaWR6OG1TeHRFY3pzVTZvVS9rNWxQSEhM?=
 =?utf-8?B?S3NwRDhDMDA4dmJ3NnhBb1UwbEhpMUhnOUFVM2cvN29WbjFWQTZBaWtMNTVZ?=
 =?utf-8?B?SlA0enMxeW5LK2pxNG5lR3dmc2p4Z0tRTjlmUjd2VCtqY2lWM3JUa3l0V0or?=
 =?utf-8?B?KzNkMzZQVGdsT2cwU1k3OVZ6dzZXa0J1STE2RFVENWM4S3JPMDdaNU55dGtD?=
 =?utf-8?B?SE1mOHc3Q0JEWDN6YmVtall1cWpCWS9CTEVNZU1aZ0VaSG45cVJ3OWR3Z3N2?=
 =?utf-8?B?RzR3WXd3S0o1MWVSU3RadjU0TGoySEg4NFV4SnpIZk13amRSNFo3M2dGQmFB?=
 =?utf-8?B?RGZoVzNFaVdILzZadUJ5S2xicThOa00vOWVoQkdRbUZqTmZhYnRENml4bkVq?=
 =?utf-8?B?RVNZazc2OTBKQVh1OWMzTHNDclFiSGsvK1JjOFp1VGpVREh5MFBDL2p2M2Rv?=
 =?utf-8?B?RktkYmtXcDhkeUtoSjZEb0ZBSG4xQldIVUlpd1lHUFAzN25wbW9GT2VRNWpH?=
 =?utf-8?B?L3JBbXFYbjZSZFcxV0JYRVFyZnFhUUVwL2lGRk52ZjBxTjlJM2VLZXdJVDRH?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: deebb53d-9902-4ac3-d40a-08dd0e6f5d66
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 23:09:22.9509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tImT9AI8gB5uFYfSqr8qMmfs/NS9eTQNT3ZaTyU80Hs6cpDcrCyUY7tKZOoeo3Lh4Yo96eb1o76BeXfc0SihE9BRVBuAfitim6WLx8lI2Ps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8755
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

On Tue, Nov 26, 2024 at 07:10:20PM +0100, Kamil Konieczny wrote:
> There are more warnings in dmesg which should be ignored,
> one comes from driver, for example:
> 
> xe 0000:00:02.0: [drm] *ERROR* GT0: reset failed (-ECANCELED)
> xe 0000:00:02.0: [drm] *ERROR* GT1: Failed to submit gsc proxy rq (-ETIME)
> 
> or from drm:
> 
> <4> [438.651441]  ? __pfx___drm_printfn_seq_file+0x10/0x10 [drm]
> <4> [438.651476]  ? __pfx___drm_puts_seq_file+0x10/0x10 [drm]
> 
> or from kernel itself:
> 
> <4> [226.597358] Modules linked in:
> 
> so extend regex with them.
> 
> v2: move '|' to begin of strings for better reading (Jonathan)
>   extend regex with two more, correct __pfx___ regex (Kamil)
>   added r-b and correcting name in Cc
> v3: fix and simplify pfx___drm regex (Kamil)
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2919

I didn't realize you were already working on this issue; I just sent a
different fix for this issue here before I saw your patch:

https://lore.kernel.org/all/20241126230240.1780940-1-matthew.d.roper@intel.com/

Basically the test isn't touching the 'verbose' setting for fault
injection today, so we usually wind up with verbose=2 by default which
prints both the general fault injection message (not a problem) and a
kernel dump_stack (which is at warning log level and thus confuses the
runner).  If we explicitly set verbose=1, then we'll just get the
general notification about a fault being injected, but the unnecessary
dump_stack() is skipped.


Matt

> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  tests/intel/xe_wedged.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index 88e5d47f2..9a95a2455 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -29,7 +29,11 @@
>  static void ignore_wedged_in_dmesg(void)
>  {
>  	/* this is needed for igt_runner so it will ignore it */
> -	igt_emit_ignore_dmesg_regex("CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged");
> +	igt_emit_ignore_dmesg_regex("CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged"
> +				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
> +				    "|GT[0-9A-Fa-f]*: Failed to submit"
> +				    "|Modules linked in:"
> +				    "|__pfx___drm_");
>  }
>  
>  static void force_wedged(int fd)
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
