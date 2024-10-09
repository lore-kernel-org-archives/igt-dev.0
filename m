Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B74CED62A
	for <igt-dev@archiver.kernel.org>; Wed,  9 Oct 2024 08:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64D910E686;
	Wed,  9 Oct 2024 08:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NVZcxKu/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5D810E686
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Oct 2024 08:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728462405; x=1759998405;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=92s83Ah22Dp0067QpBl37mvdQmFNtOA+wotlQSnaNeY=;
 b=NVZcxKu/VY/wyZqse9kveAA4rtG8aWlPa8Bl560Ct9u+i2lDn69ONcwG
 lQ62+wgOOVC2AVY0+BhlwKipYmofDYrp8xCddAJhvDgOX5owGF3L+EtOn
 8+JUI5eVVthouAHgDXBdsnHGfWAgc8XmNmqvOOE65GW8fmac4UQqyMxc7
 BRoA4yinTnVWRxbjpoM/287hLlECFRHl+Lv+67lcc2aBfz2QiP7HCRwzD
 2VI03h3dqtXOHE5QgXiv61tftMn5GD84hLiICdtyX3SKHG6Tm86ajkwDF
 tIrgDTrHdUHO1FQnl8NwclIdbAPzqWI4yyCEGhl91Oj5ZwPQLygMwag25 A==;
X-CSE-ConnectionGUID: G90yTwoORHarbvbMTKR6tw==
X-CSE-MsgGUID: +0SZ3ZtKRsiXlNSTbYqFFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="53149709"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="53149709"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 01:26:44 -0700
X-CSE-ConnectionGUID: BF9wRoaTSK+M2xLxuVgl/A==
X-CSE-MsgGUID: HvhirpMMSV+4N+ZXdSsj7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="99500161"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 01:26:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 01:26:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 01:26:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 01:26:43 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 01:26:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXa9SbCgwg1IROWf78dTCcAC55B4NdwF6As5VcVONzG77tPinD4J0TSZsY07PRcFHlEyQXGFvxVV4bjVhth5eZom6bem71kT+YCics/WcBIOfS8otHLVCzMl8fiGiWUKJDs9UZnFNDQzpcDcC7y9Oio9rksfJc0zra8tW/9pI/xxd+10TQaCkFNyn2CfY+5Chd0caBQPzZrNYtsMh1Z1NwbSivMPdc/rFTm0eeTRkBdIo4kOOt/lojwkKXxAFftyZDsl5FDtTsLi5tayiaciq+RGGwwrNYcUsj56fby2ACsKYLbHt/FFuvGBLz1GnrjIDTI8AOWLopTcAmPVz0agaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVHLLjaMAiIUb/nyPg/GCz3idv28jQBGC0lBH4AEGpY=;
 b=K8P5rWAxlSaNrmF7+3xV4Bh3gJ20Fz7vVUpcInLiUmlyQ2csgws4HyBgFHT4WQgho9crXadJehfKSYUwDef+ezNG1eeWMQ207IdRA+GZ0xYkEuTT5oAt9tIqV3jymcnBWSQE5IWFrmIoZ51QT37LGVCK9mNvsU6yoF7/TiJXHuX7f8Vk4HlNtc/lZNhC+ouJXpBpo0QDDQZaxduIPBUeqwJRZrYTGwPOV/gIUpg/pQcQ3QtabquAAMk6Vw20l9Sypyel48F57dCCQPKQDF/ImlT5Gmle/+HgbihgF13SVfd7AdcwHgp8GT/B1p47P9IQDa+ddGPW2yd1+4fvjZLH1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by CH3PR11MB7250.namprd11.prod.outlook.com (2603:10b6:610:149::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 08:26:40 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%5]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 08:26:40 +0000
Date: Wed, 9 Oct 2024 10:26:31 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeFULL=3A_failure_fo?= =?utf-8?Q?r?=
 tests/syncobj_timeline: Update invalid-wait-zero-handles test
Message-ID: <lker5nwgb7z5qyy4auj7ogzcyo6rlh3yxuyquxswywhpo3umwx@c3dpzcecuz3r>
References: <20241007102611.23544-2-krzysztof.niemiec@intel.com>
 <172837395662.1202362.303889494832481504@2413ebb6fbb6>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <172837395662.1202362.303889494832481504@2413ebb6fbb6>
X-ClientProxiedBy: WA0P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::21) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|CH3PR11MB7250:EE_
X-MS-Office365-Filtering-Correlation-Id: 0465ac54-b439-4c4a-71b6-08dce83c1977
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2I1eVZ1Zm04YkMyUnhGTXVCczJuamhEeWJyTEJvdW8rdUVQMTJ4RFYyOXJl?=
 =?utf-8?B?b2JRU2xSWWYrNjlvS2EvejI3V3JaQTFSSTZZbVpTVXAxYUhRR1BVSldaTWhG?=
 =?utf-8?B?bis3eW1BRkN2SHk5Y1ZCNE9qUU81T3pReHljNjBUZGJudjZxdTg5enBwLzNi?=
 =?utf-8?B?QitqcE02a0FRdHJRR21Qb0xHTnd1OWJiQlppZ29HOTNOSUVSczF3L1R1WXFX?=
 =?utf-8?B?UGt3TVRrb0lBRlZiL0JONGMveHE1bTF1L2FWSHl6dndGMkVtVzYzSjZ4VEdz?=
 =?utf-8?B?MmtDc0gzN2tqUitGeW9XeDh1M1l2MUFGTndKTTJtWHRFRWlxMjZubWxMR2Fw?=
 =?utf-8?B?bXlmaVR6aTlMN2FhblZNMUJlTzRMZDIyVEc1cG5LYmpnWHpvc0ZOSTJVbURq?=
 =?utf-8?B?UnQ3SEJaeGpvbzZ6U2pqRlFDQURDWlRRYUtsS1pwWmtZR1pCZUVINjhCTGNN?=
 =?utf-8?B?YjFKMXJUZDFBTjJwZVFTUmRZeW0rWFp4RkRicnRiTUtzQmtiT3pzRTJhb0dE?=
 =?utf-8?B?bENWZHNXSGFQSERBR1RKdnl1MTBZN0tUdGt6Rzk1WCs3UGRMejRJUW1LSUcv?=
 =?utf-8?B?alIxd3d6RHU3cEpRVEhrNlJaeUg4K3Fra2UxUDk3bkVRcnhhb0NxUkt4ditt?=
 =?utf-8?B?MGYxWnNWODhtK0NXbzFiUFM4OUpCRmpzdU04SXY4NmExSjNsZHhoRVc2cnVk?=
 =?utf-8?B?NFNzZGdFOEsvN04rcWZuRktudlRsaVhNNDJYbGZLSWpaREpsSlByVGpoTW0v?=
 =?utf-8?B?WWZqcHE5SXJQU1J3RWpLYTVLVXlFbWc1UWlrTWRTTmdqM1lDc2xWU0N3WlVu?=
 =?utf-8?B?czNXaklVcWhSbEhiU09seVZuaUVuL0xSYXhDdlFTTGFlaG9Kd2FsbzYwTFpG?=
 =?utf-8?B?d3R0eVJHSG9NdzRwcUJhVk1UNFhoV2x5bDdGcElKaWZWVEdHSHRzK0cvc3BZ?=
 =?utf-8?B?RmVZZFYrTHZTNjE3Y2JJakhLMXF3azh2eVJSYWRwQ2YrUUoxMGExaEIrMnZO?=
 =?utf-8?B?VVUySXM3ZGtaWXVPdGRqZFBsQVJKQkFLaEZmdkhTZTFiOXdnZDREMERuaGZ4?=
 =?utf-8?B?dEtpZit5TUdGYkVhMWVVdDFVYm1SUEpZSm85YnppenN3M085aTBVTk5nTDNj?=
 =?utf-8?B?bmpzTG91cUk0cElka0FaZ3YyNEMrSHZKRG1sMGxqZzl3cVp0S00welJwc05M?=
 =?utf-8?B?c0ZjSkpSV3FYeFo1cVVvam5DdVMwWmU1R3E2MWhHR0F3NXd0YTcydXpKdHRD?=
 =?utf-8?B?SDZzTGhNVGZ6VjRQUnhIa2JmUnFYQTBnNGVza1d0SkZGd25YRXRzemRRMFNn?=
 =?utf-8?B?cWxEYkVtN3l5UDVZc2k0Q3NxMHZneHhXOGdpY2xscVd5cTF5THNwT09HakxI?=
 =?utf-8?B?STQ5MTJzZ21lUXhsOUgwTWxEQzZSZU5vc3VhV3dKZE8xQkpNbUJhNDkrOTRq?=
 =?utf-8?B?YkFPdWFzZDRtWUZzdWV3ZVR3S0oyTWU5TGIyS2MrRWRaZXVZUlduUlNKV1Zv?=
 =?utf-8?B?S28vMER6REFxL0ttV0QzMGFMUUZIZFZ4alBSY0lzaHR4OGxwTVlyZjJrenlz?=
 =?utf-8?B?bFlPSmd4b3lyRnZwNnpuR3pDbllmaUE1dXRYWHdoczBLRUFwV0ZybVhLdE1K?=
 =?utf-8?Q?YnuaEyQj4ZRGDEZVl+llg8UPRsbcyEW1r7jvQuS1lcTs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHJNRmx2Q1NPNndNbCtpZ25kVGJxR1JHRklYZ3VFbkhQaTZUUm5ld2x5VSs3?=
 =?utf-8?B?ZXFhTjkvcUtncjdaK2h3REFQY3Q3VzZXUXVSdVdXWlpRcC93ci9uciswZzRI?=
 =?utf-8?B?WlRUVUphaDY2bXZwZjJLRHlobnNRWktXM3VaNytkaTZhUld2ZGZTVHVUM0l0?=
 =?utf-8?B?TmYwRTJ1ZDFrSzNkS0RBYzBPTGF5M1BLb0Ewd3pNOVY3eU43RndSTkROZjJn?=
 =?utf-8?B?YVBwYzNtangxOFcyNDQrUFhvcUhadjZJZ1IwdUtmeUd1RDVqTzhLV09XZ3hz?=
 =?utf-8?B?d1hHOTIydEc4NzNGS3ZESUN6STBaeWhhd3FtRWRpS2hXeGdvYmZCdlZFbDhN?=
 =?utf-8?B?VmlWa0xIQm5oR1hpQUR3REFacmdIKzNCVk5QKzNJbXVnUHViSDhkZ2xvT2cw?=
 =?utf-8?B?VUhBN1ZiYlFnNjJIS0RVa04yQXdNR2VYRVBaWGdOamREU0dDNjMzL2twZzBa?=
 =?utf-8?B?cXdOMGR5L2daUktJc2U3UEVuRE9Vbkpqd3ozUDM0bG5JUSt3VlZ0TVVCbEN0?=
 =?utf-8?B?Ym82dUZVZU5JbHZ3MjZjMFpBNFJYRHdHRkU2U2FUV0dLZTFBZDZnVnJYd2NG?=
 =?utf-8?B?cDBiUktNSmJEcU04ZGpNcnJzdzlOcS91dlVFZndrSHhCWlpPamZzWDNKdFFR?=
 =?utf-8?B?NFljdWtaQUJqamZqNE1adlV5WnZjZk53dzFiQTBXNS9NblhKcjFZUCt0c243?=
 =?utf-8?B?TG9VQUp0TmJFdFB4RThncHZTWHh2TUZwY0N6ajVJOEpnUmlJdkFRT2kxOTl4?=
 =?utf-8?B?Nko0aHByZ0dLVExxL3ppVW53dHY5WTMyNVdBWG4zZjRic1ZqR3lTSUFMQzFT?=
 =?utf-8?B?ZlBvVVVpcUZTdTlCME5VMjBKV1F5RzRRTWZTY21TdHhCbzhEMkFnaUJRdHg1?=
 =?utf-8?B?RjNzVG9tbzArZVlRdkRPbjFJdjVwNzQxMUhSZm03V0dPOHhoOXY2bFJOckZy?=
 =?utf-8?B?Y25HR0tvM2ZoVk1hWlNYdU9rNnZnTWpCWWVSWTlIUW5oc2pjNnpEKzBheFRi?=
 =?utf-8?B?cFlKb0lCMHdqaGovTzJBTSt0OGZkZ1dqTUNPZmgyYzNGd015T0g1NXNXZjFo?=
 =?utf-8?B?TVZEM3F6UHhKNGhZU3FHL0pWZWxhTU52Kzg1VjVjcnZjN1ZqQ3doQjI5bjY5?=
 =?utf-8?B?QTNCSDdSRnk0d0hoTEw2RUQ2WjdZZ1N3a0dva1NVRW9Ka21LdXpGVmV0SEQ3?=
 =?utf-8?B?NGlLdlBscHY4R1JBaG9PeUhUUVBuem9SVWQxNERFemtEQm83a3hYREdkRzdo?=
 =?utf-8?B?dXd0ZlIwQWppVm1URngzZFFiZ0w1dmtDMy9GTGIzNTRFSzI3VEp5MStvcThp?=
 =?utf-8?B?MFR5a0NpNnRLQTFMdnBsK21sK1FwZXo1c2FYYzhOeEpTd0JXc3VQbmpZQnVH?=
 =?utf-8?B?SnRCWW8ySHlSTTNVZzZKTUUveWUvd0hZa0FraFhzSUoxY2w3NkprcFU1Z013?=
 =?utf-8?B?d2U1ZXN1Um05dlVRalFhZHJ2WVpLcXN5d0pGQW9ZV0hPZFIycURMK3JLcExR?=
 =?utf-8?B?aElWMXozQlYxaWVWVzAvWlUvOUxjVC9jMUZZTXBacWdScHRHM2JyK0ViWXhP?=
 =?utf-8?B?QmY5OG5OeUtUQVlYbWFMV3FkNXBYME5aZFNIdXpuTk9EbFI4UzV6SEV2djMr?=
 =?utf-8?B?UUF2WExWTGlsMWJtMFoxREg5dDZPcS9leFdWNTk4NElVNnJ5T1lyUTNlY3Fs?=
 =?utf-8?B?a0hMckZUWGNib0hrUjFZTnlxc0hERmVhTUxkUFp2SU9haVhvL0ZKY1VKekxK?=
 =?utf-8?B?OVlLRnJncTdmdmZmdjdFdWtndnNmQjVKYzRpTVNKdk1pblVVUUgxZkQ1Zndk?=
 =?utf-8?B?NlRHbkpNM2RXQk5ySUIxR2xoWUJSM3NNN2R5dEprREtHUm9NVnVHeG4zdWtq?=
 =?utf-8?B?R09NSEU1OHZYS3JQSVdiS0RLNW5DNzVKa0xqb00vd0txdDd4RGVUNjMrbjgr?=
 =?utf-8?B?VkVuQ0FqN3JjY1gvakFCOGpiQjFaS0tzYUlzcVdUemFGZUMrc0RreFVHV2Vu?=
 =?utf-8?B?QWI5cWloWm92MG9PMkVKYytFS2owbkJqSnlXQjdKVmRLL0FOMGI1Vm1tSEVo?=
 =?utf-8?B?V2p1UGg5Rjh1bnIxZUFmUWg5RlFsZSthazA0VXY4U0hTMGlLOVFOWGVtUjRT?=
 =?utf-8?B?aWNpZmJCNG1rMUxaamdKVis5RXFrNTBYYnpxYnZrUHV1enZMQ0h3VDJPM0RS?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0465ac54-b439-4c4a-71b6-08dce83c1977
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 08:26:40.4172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +wtOaIj6mKmu3JXXy1uiA/0RMQAdAfWQ1z/QXw6l5MKeqbiqhg3iZhsO5jhylrehzRtMdM6ogq/b8j7JUyOwRUBUXpWmX8Lp9BGM6/Z0Yas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7250
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

On 2024-10-08 at 07:52:36 GMT, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/syncobj_timeline: Update invalid-wait-zero-handles test
> URL   : https://patchwork.freedesktop.org/series/139622/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8054_full -> XEIGTPW_11877_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11877_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11877_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11877_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_addfb_basic@unused-offsets:
>     - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-5/igt@kms_addfb_basic@unused-offsets.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11877/shard-lnl-5/igt@kms_addfb_basic@unused-offsets.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11877/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:
>     - shard-dg2-set2:     [PASS][4] -> [FAIL][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11877/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][6]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11877/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
>     - shard-dg2-set2:     [INCOMPLETE][7] ([Intel XE#1195]) -> [TIMEOUT][8] +1 other test timeout
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-435/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11877/shard-dg2-433/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - {shard-bmg}:        [PASS][9] -> [INCOMPLETE][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11877/shard-bmg-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:
>     - {shard-bmg}:        [PASS][11] -> [FAIL][12] +2 other tests fail
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11877/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html
> 
>   

Not related, patch doesn't touch these tests.

Thanks
Krzysztof

> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11877_full that come from known issues:
> 

(snip)

> Build changes
> -------------
> 
>   * IGT: IGT_8054 -> IGTPW_11877
>   * Linux: xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965 -> xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634
> 
>   IGTPW_11877: 302140392fcc1e4d90d1fd2fb08bf162e44b2785 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965: 92d12099cc768f36cf676ee1b014442a5c5ba965
>   xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634: 39a016b276ce8adac629cc6c31892d0b7d2af634
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11877/index.html
