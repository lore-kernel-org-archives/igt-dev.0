Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC66C02188
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 16:08:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E76210E5CC;
	Mon, 27 Jan 2025 16:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jJakSTaO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6DA10E5B0
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 16:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737994115; x=1769530115;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/HHziospfLm6lFKwMOE5Ca1OFx++he2q+aEckS/8e4s=;
 b=jJakSTaOc7fEsw19pDR8hWbfLt71adO6TmfF48/GSuuLuLQipCMPb8vj
 hwD7+2tJU3lUQeVeEvz6Xs9JldFgXOgKwOhupwyyqX5dNIk5qR8Aj2YUc
 IzpfNywCZHnzZtojVwXDNuw8tRSNDfx/y7GtiLEjU09cNaWo4790nZUVL
 qorR3b0lXow7MaOpPqfxg6h8UXAJG02/iliwKhJYq+QpNG+a+5LJNg4BB
 P4LfuOjwp8xQ0uSLC+Lr3u/68nnt5qQusZCyw4p2/6F44zHgbDV6HDfMO
 8RbRekx0j0kiCoMSzEvwdXG+u4vHvUtAuzEYcnerXJ3cHNv994025L178 A==;
X-CSE-ConnectionGUID: LcZwfWVEQPiuzq+2kzoK3g==
X-CSE-MsgGUID: KIV6cWE7S72lo/jwxNlwhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="41298258"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="41298258"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 08:08:35 -0800
X-CSE-ConnectionGUID: zG+aKq/7T4+qTSxdb2hSFg==
X-CSE-MsgGUID: ZaTsaCAwShSJ99Eki+sJ7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="108289663"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 08:08:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 08:08:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 08:08:34 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 08:08:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aPNlzsc45ykDf18LRwa4vbHw4+gteEor3v5wqWFX7NrEd0pr7lO1I9md4FxFpqpU3PvD4ekP388boBbZhVqmDvl3doSkuad2CNBpGX8JLHZn6o8UtJzjc0ZIxFj4SyqtfJ65VwFbrQUJ3APWEKhuHSsungzpVnaoVoK34aPce6RtHg6YGoTSODSW9eMAUkF8iHf3qDJgWaB5VnL9HLFqzhjtDdwtoYWj9EaCXrlLjDGRPGTIR5NRgSCI9ewH9SIgMDxzZQIjPfWbuE9c3F2zUJ8HBTNevixd9b5n17es48JPgLlNLSpSp1SpXejHcVjRJc98FTMstIxXwZxv/zGooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HHziospfLm6lFKwMOE5Ca1OFx++he2q+aEckS/8e4s=;
 b=LKWGnRN5ff0/kAdOFVdK5zq/mfVLmw6FfZKA4AD9baxE7Ckq2iQqonI+iIJ1rQ8O1qeMs0wWzUP6UC/I3oxDmAyYUeiklROxS3VB/C45yFN6uktjryozYJCIhiFE5Efv0yg/1AWccLzCMWETye/ayFrD042DfmVJ1VvOusE5cSm+41r6FywnTrlF/8lGgkyZChLCP88tBGPQNpAOgKl5V3ZgAQ70qUogU/8cx4z2iVrmIyIHug6q6P9+USX1Ke2FJsL2N19wE7prg/we0bD5ajwXMbgtXTP2Z30RgeCqqH+l9zfn4yDQlpzGzNWdZlDBdLpNmOsXnBR/Y+K5i+Airg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8186.namprd11.prod.outlook.com (2603:10b6:610:15a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 16:08:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 16:08:30 +0000
Date: Mon, 27 Jan 2025 10:08:27 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 2/3] lib/igt_device_scan: change device list
 variable visibility
Message-ID: <g64ns7fntxr24qorhvrawruwtsz4cgfibsncmzpqdru7zhg6rp@76exlxvogqg6>
References: <20250123095208.72984-1-zbigniew.kempczynski@intel.com>
 <20250123095208.72984-3-zbigniew.kempczynski@intel.com>
 <20250124162625.2lz3spps6vgfmie6@kamilkon-desk.igk.intel.com>
 <20250127044915.izkpkskylqw4gdyn@zkempczy-mobl2>
 <rjrjaq5o2c5ip7ejg22vqzntrnqvhztpvozufv6yvwmlvzygue@t6t6wtmmwcc3>
 <20250127153749.zso6hhex5mva7ypg@zkempczy-mobl2>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250127153749.zso6hhex5mva7ypg@zkempczy-mobl2>
X-ClientProxiedBy: MW4P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8186:EE_
X-MS-Office365-Filtering-Correlation-Id: 0314e543-18c6-4282-f285-08dd3eecd77b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0lGOTFQZDliZDVDNms0N0xpOTFheGIwbmRHbTVFWVdDN3VYQ2JFWmlUTkdJ?=
 =?utf-8?B?ZWg4R051dEtNVW9UVVJiOUpIS24wR0VYSURNY2w3b1dnTjkyMEhuYlIveHkx?=
 =?utf-8?B?OHhXRHU1dFdOWDRXRHJyQm9LaE9ITW1OWWlXZThVYVQxK1ZvV1B0dFlFbjdo?=
 =?utf-8?B?TnFpNE8zZWsxWHVCRjJ2MHBOOHhiRTBlNkpvZzd6NjhnL1U0S0dRTGtHQ09H?=
 =?utf-8?B?eHN5Q2tyMDVoRWV2Q252N0tjakpUV0FjY3lZN1RrNDRJTjZSay85V3RMNjlK?=
 =?utf-8?B?KzNlOGRzTEp0eisxOFlZZHM2aWlKOHQwL0t1ZmkxbU80N0NwU2c4UWNpd1I5?=
 =?utf-8?B?WEEvbjdQbG05TVErZTZ6ejJaM1MzWC93VGtjSC92UEUxTm9qNjNPTFFGTU9r?=
 =?utf-8?B?eEdFa3FnQzVLQ1hWSktpT3dBQ08vK2hvZi9iV1NrZ2N5Ri9TMzIwemxPRzJm?=
 =?utf-8?B?WjJPK2xYZnR1c1ZOckZxRitNM2Znc1RxYkxnNkZIWkFpaGdpM0RkaDVDSzZK?=
 =?utf-8?B?Q0ZiVUpBSEEvYUNWMjlVSVdpR1Z0SkdXRGlDUGpnMGtSclV5a0JxQ0lid3B6?=
 =?utf-8?B?a3ZvbVpVazg3YytHL3dETWJ6SDFIVHQ3NmxaMmhJMllJclRLQ3A2WTFwelRm?=
 =?utf-8?B?OTdBcWlYRC8ycHorNFdLbW4rd2x0dUxva3VEcDZ1UVhXY2tTUEc2dWg2SzJ3?=
 =?utf-8?B?QlVSZXVONTZySmUwRnVRYW5qRTRvM0FUSE1tdUhUQmdSbXpmdHlWSmUvQkM3?=
 =?utf-8?B?RW1hR29LdkhPcDc1bUcyRDRicFhJZys3NDdMakpiOHZFakdoKzNHNjNFZ3NK?=
 =?utf-8?B?NW5HVDU3U2MxdHN3UG51dHR4aW5XU0tvNEJ2V2pEUUtHZS91K1IyRWlxMENI?=
 =?utf-8?B?TzdCdFQ4a3FubDUvMCt3d3dJZEM0VEI5NVBmbVNBMXVEWkhNVTFyNjlVQi9o?=
 =?utf-8?B?Q3dZYkZYREZ6UEsyZGwzMFhyNFRjbjhjODJETzl4Q215RFBCWGxwNmhXL2Y2?=
 =?utf-8?B?dVR6Qk1ham83ZlFhK1QwUEp3YjRNbVFBbjViS2E1ZTRXTXR2ZUk1ZnJoRUln?=
 =?utf-8?B?akFzMVYzcS80eHpUengyVUVXMFRkKy92Rzl0TTFSS1lKaHpLcG1RWUtjRGlP?=
 =?utf-8?B?T1FRbytIZDB3Kys1alpkNkQ2aG9TOG5HQWhBem9meWhnT2tHSGFHWGpyTkRm?=
 =?utf-8?B?aHRlbDNNOXk0U1pNRGE5cVNkc3RJT1hDTG53QTZCanFIejZsZDYvYm83ZEx6?=
 =?utf-8?B?dE9hMUFLQnM0ZmxTM3ZRcmJPYStIMXRGYnZ5MU4vTDFXaHE2OFdVVDZRcDR2?=
 =?utf-8?B?aWR5N0pLOEJGY0FJcDZYdWFGZU96amhURnB5aDNUNDVxZ2ZPWmJILzVXdm9F?=
 =?utf-8?B?NzBSc0E1N2k1b1BGVUFWaXNJRE9SVGUzQzEyRmIrTHI0QjRGQXFmNEtBZzl4?=
 =?utf-8?B?dlZTSWZQdmNEWW9xeHZpRzZ6QlpRVmt3V1QvUFQ3cFM2RlRDNHVzdjVNNzlS?=
 =?utf-8?B?VFRpWDNUdmNFMThvd0lLVXNXZjRsTTNpdUtrakR0V1ppTndZektSOHJrU0xa?=
 =?utf-8?B?UjZNd1MwZnY0NVJJMTUyUXRjV2kyU2FiRjZ5SXF0aXA1ZFhCSXVCMWVKTU9x?=
 =?utf-8?B?ZXhFTU1hTUdLWlU0Z1NkL0xSTUpZK1JsZnE2Yk9CM3V5dXFIYWhWOWpCNU1X?=
 =?utf-8?B?emFCNFpVemh5WXFhL3JJdURjWmxNZWNiWElwSmMyQWY0S0ovNy9KZ09LalRj?=
 =?utf-8?B?ZUt3azJYa1Q1OVA5cVJ2dWJLN3VjbTFOOGtFV3k4TG9ZeWVzUkFCNlBpYzYv?=
 =?utf-8?B?QlBrMnY3UnpjRS9CT1ZpRU45NElBNSt5dlpPVDRIdmlsWjBuVVpRdXdVb3VQ?=
 =?utf-8?Q?kDhHEldeaSgxA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWRzQkRlbkZqYkh5MlBwVnM1LzNPN0xPTGxENnlGRytOMnJHUFpFUUoyT2hK?=
 =?utf-8?B?M2VFMHF6alhLRHZZZzRaQXBEUEIxNncwdGRTRWNRQS9oSmJldzhKWmd4N1JG?=
 =?utf-8?B?Um4rK1BWTlhYSFpOWVRBZXpXMENGVmxDTnBPNFhPcnA3UVdFOUl6UnE4S05z?=
 =?utf-8?B?U2J2VEpscUlraXMxeGpmZlJoZWM1UVB4enpyQmRiYkYzTklScW1rZ3VIclVV?=
 =?utf-8?B?d1EvQmw2VkVpbXkvU3NBd3N1U3E5cWY2cHp4MlFmQmw5UlNTQ0pVV2JRR2xJ?=
 =?utf-8?B?UGdValFtWEt4UG83SG1MMTM0NE5oeExlY01CMC8rK3V0K1M0YmRSbnBQWmU3?=
 =?utf-8?B?SWVkRmU1K3hXOXpCa3A4YWJlNWdCL1NFdGl4MEV3ZHZaZzc2TkI1c2xPQjJI?=
 =?utf-8?B?eDl3UVFPVzZxTXgxem9abzNJOWNSekpuSWRHYUZnZDl2TkJhSXM5RmJ6NUpa?=
 =?utf-8?B?OEdONVRDUUNhZlFTRG9vN3F6OS90WGZ0U0w2QjN3eGsraERja1dycUdYRVpz?=
 =?utf-8?B?VEUwR1liRE9SS3NTMkZqakxQd1g5S2dBRXI1eEU2SWMzNlU0TVgzbVRpZjRF?=
 =?utf-8?B?bHMxR3BiSUUyMVhxdW5MWmxvNkg5aEJtZ2lqemszRmpyTXpvdVRpNWRCTXd3?=
 =?utf-8?B?S2IyK2o1alhYL01NSS8vSnZRZnJoTmt0RkJUQ2drNTJkNzdQSUJqTGVQZWV3?=
 =?utf-8?B?R0lPRk92NGZTYy84clZEUm1mVmdOYUtnRnVFcnErUVhxbWpRZEJBUDZQVXN5?=
 =?utf-8?B?MjZvbGFmM2ErT0tQL2huODByaHQrWnZKakw5dmlHMzJRWWJ5Vi9xUERUYlNh?=
 =?utf-8?B?VHNsU1pHQ2FUVnpReGdZVkhUR3VhOUJqcGV3elNxNTNWeXF1Y2dlTEtYc3My?=
 =?utf-8?B?NFhtaFVocEJQcmhGaXM0VmNJUXRsTG03K0ZwZitpSld6STloK0NWZGF3c0Vx?=
 =?utf-8?B?NG9UOXNjMlEzSzQ0cnMvR0NMRFU3QzZkbUlreE9Tb20wem1rVGFMTFg2b0U3?=
 =?utf-8?B?NTBuejUwdXFlSWN4NVdBcDNCRU1UMVZpTU5MeEZxRTlwVUErSm5KaGxBYzB2?=
 =?utf-8?B?OURLSDd1azFTc1duNDNnM3R2Tkh4QS9idGI2RTZCbTFwa1owV01JM2dSVlZY?=
 =?utf-8?B?TTl6VGQ0d0pBSWFXeVJ0bFdad2h0ZDM0dDZUQ0N0YlA4RUtNZmY2WE1QNXUr?=
 =?utf-8?B?ZE1FKzA1TUEzV1NWc1RqYXdYcENqNUEreEZHZWQ5LzltNS9sUTRsNjdnaHRt?=
 =?utf-8?B?UlF2UThzUXIwbVNKd2dFbENabnRDdjVDWmo2ZTdTNFE1eTRKaHNZNnNiR1dS?=
 =?utf-8?B?Y1ZaaStYTm9DWFNqRkdpcnIvRE05ZU0rTUg1LzRCeDJ4azlROGdkMjAzaUxt?=
 =?utf-8?B?VzhqcEhWUTZkcWx2ODVJdmc1VWFBS29zV0YybHVITFlBalJIU1VEQ242ODRy?=
 =?utf-8?B?UU52aU1YbEVCVjREK2hFNitCQ2Z3SE5wU3RpWFlBRG1SNEtYNml5cTJqbXRS?=
 =?utf-8?B?Y0l6QkNMS2Qxb2ttdk5NNlpZejZYcXNBcFJyOG5KYUtKcXRNNnE2TGt4bFFi?=
 =?utf-8?B?T1pOS1MwWnMxS2FMZzZuei84c0lzMzIrZGtRWU9BYjE0N3lCdE5OdDk2RVY1?=
 =?utf-8?B?cnkzOEJYdHFyK2c3OUdhV3hZVlZJMXhBaXBUd2xNRzBOeEdmRmU5ek1oRkxa?=
 =?utf-8?B?OC9zd0c3QXUxMjg1S3ZLQXphbCtFSEdLR1ErY093dnVHekc4cEt4UjFoN3dS?=
 =?utf-8?B?ekNiMGc3MVFmY2ZBcjJLTVFiZHVvNzY2blBCaDJxNi9SNjR6ZmcxQVE4NTdF?=
 =?utf-8?B?cThXa0NoUExTaktTclZqVTBiUnEvQU1CSmV6TXZ2dk5IT05xanlBTU1yVm0v?=
 =?utf-8?B?U3B5RXppRUU2ckgrNkJwMWxFMFk5dGhLRFBuT3JwVTF3ZHB4UndLdmIxV0l3?=
 =?utf-8?B?YTViWmNlczFhSTByOUdRRHJ3RjdkS1o3MzZZUmY3TWxQRENnSUtLbHVWYXRX?=
 =?utf-8?B?L1hsdkZhUWk3RXJCUU82K01DdHdCSXJwMmVVclgzbVRqSG9nZ3JHZCtJNERo?=
 =?utf-8?B?c29XOXlUbXpWcXlYRi9IN3hOemJYZThUSjRpYzFmcXFOdjZBQkpCa3o5UU5x?=
 =?utf-8?B?dW4vWkl5VHpVZktSZU9xOVNKTmUwTm9DK2Y5eWlXNlhzZDJtVmZWcHZCZXlr?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0314e543-18c6-4282-f285-08dd3eecd77b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 16:08:30.7291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V7BXKfKIDYyIvfAca2LFffNUHaKd7CFXWvDG0MLfThW7+wVLYLDOKJ0lM9jgosEi9KVL8/uJAjEaf0wXXe3t2fZcNQEQCI5983ogKxe41pg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8186
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

On Mon, Jan 27, 2025 at 04:37:49PM +0100, Zbigniew Kempczyński wrote:
>On Mon, Jan 27, 2025 at 09:31:46AM -0600, Lucas De Marchi wrote:
>> On Mon, Jan 27, 2025 at 05:49:15AM +0100, Zbigniew Kempczyński wrote:
>> > On Fri, Jan 24, 2025 at 05:26:25PM +0100, Kamil Konieczny wrote:
>> > > Hi Zbigniew,
>> > > On 2025-01-23 at 10:52:07 +0100, Zbigniew Kempczyński wrote:
>> > >
>> > > could you improve subject? something like:
>> > >
>> > > lib/igt_device_scan: Fix multithreading for Xe
>> >
>> > Yes, I can change it to sth like
>> >
>> > 'lib/igt_device_scan: fix multithreading support in device scanning'
>> >
>> > because it also affects i915 even if there's not used there.
>> >
>> > >
>> > > > In commit: 2e8f3e06fb (tests/xe_evict|exec_threads: Use fd reopen
>> > > > to avoid corrupting global data) I simply changed tests which
>> > > > corrupted device list global variable. i915 didn't use opening
>> > > > devices in multithreaded tests but this changed with xe.
>> > > >
>> > > > Device scan is now unconditional so we may change device list
>> > > > variable visibility to TLS. With this reverting of above commit
>> > > > should be safe (but I'm not sure is it worth to do this).
>> > > >
>> > >
>> > > What about adding Fixes: tag? It is not a kernel so no strict
>> > > rules here, up to you.
>> >
>> > I don't if any freedesktop issue was created for this, maybe Lucas
>> > knows about it.
>>
>> fdo issue would use a Closes:, not Fixes:
>>
>> We do have some issues in which the device "disappears" after certain
>> tests. They are usually created and closed as "cannot reproduce" after
>> some time.
>>
>> I don't think we can point to any bug with 100% confidence it actually
>> closes it - there may be other bugs lurking around on either kernel or
>> igt.
>>
>> For this specific commit (not the one before) maybe we can point to the
>> commit first using multiple threads, but I don't think it's really
>> accurate.
>
>So if you don't mind I would merge it as it is (patches 1-2) with reprase
>of commit title as Kamil suggested for second patch. If you won't oppose
>I'm going to merge this tomorrow (no negative answer means agreement).

agreed, this can be merged as is.

Lucas De Marchi
