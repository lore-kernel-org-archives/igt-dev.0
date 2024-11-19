Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1C9D591D3
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 06:42:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32E710E5DA;
	Tue, 19 Nov 2024 06:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hvr5bCHc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14ADD10E5DA
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 06:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731998525; x=1763534525;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0I2nl7/1kMf/t3b4gQKdlWY9XwFOz6Y9Ilfqz2vXhAc=;
 b=hvr5bCHc5MHq7xlzfJF8pYWDOh5EXg8UWGg8jhcDkeiylJ7VnUxxLFCi
 H5Wa2CUq0WngPvdiJCcE52vnFDH547IEiKfGGeL/VV0WjOd52cpxC7M89
 ybm+e107QkgG88mbja75dryyA8KK0baEBRgnRukvp6ejKw7yLnnNjGqK9
 bNURk1I5M1Zw/Rrol/UzP0XzqvDGRRLrH5sLN9POyzyhdq3wosZRV8NnP
 xLqMFDggVcpWmkAx0yFRhWmDeF6Mp9NW7ePGGilC5gnj5KrEC4vvSGggN
 i37vSuRx262KSi2W9V9ym3hGEUD5eHsuou9kVaWSyLFA4kg1u4lnNgDj5 A==;
X-CSE-ConnectionGUID: xNxkoqhkRiGYstD1EsY5TA==
X-CSE-MsgGUID: YhraLhIjQz6bTpW6obCM1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31354474"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31354474"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 22:42:04 -0800
X-CSE-ConnectionGUID: k/auCqVsTr+cIGJ30xVROA==
X-CSE-MsgGUID: RqSC7NlsTBShJAH1Z8e2OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89580190"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 22:42:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 22:42:04 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 22:42:04 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 22:42:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yBsB8SHmH9Lwrrnlf3j0TZgQq42jjiOeU0Kp+EloBqQp5FBnKmya9qFlKvzVMVrI17iX+Qybvfd2uTfphsAaKFsflKM2dRWPviRYj0R8IuifoerbTvaNw8Ckp7/Bx0Fv5v5HpSXN+IVOoM23eKdW8fhki8kkM3y5Ye53ZtrXmNdUFJLN97LY1PLc9gC61ZHOeFE0GgzGM35huCuSmB3F5/xSvEC8F8T6HSHPQ2xiMImUH5/JteeRqKQ7X1dgz1pVZk4sKJzAJdpmiNydcamksS80pM2x6SLTLuBAVo0Ps8/TJS4gGNBo9/oErN+6wDit0rXCVeWUa9bs9bZ5PdxARQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHLP2VD9h4twxY8sKunw73YoDjdWi5YRqCXZp9Dply0=;
 b=SzBPSS4jB+RvkNjryHfUHBnIcOvm3me5wA7Bu+gvQZKT3ys/DSD4eEC10NdPKfyt08tkS/A+Is5QZkSQvBNN1UuMrkBLvwi4rMk8toYMACJ3mL2/kLZlpkRjGqx2EoFwevnjms3OYSCJ2pytsiugEoF2+vHYGzXPwaml//aULmo4MkosWaQi7YCrI7xDLNecdMow0A1wgH8VYH3ghsyLHpf6rQoy74VedAgqQfEfC6lC8sbe8h5gcAQpf3nCKgHclgZG9pE/p8UKC4Gs1fmBYiyMQYyzc9JEbVkQD8fZ41QL8KUyMFu/ummQdNXWSr803l3qGkYJn7PZbty2gufR/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB6265.namprd11.prod.outlook.com (2603:10b6:208:3e7::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.23; Tue, 19 Nov 2024 06:42:01 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 06:42:01 +0000
Message-ID: <0886a572-3c7a-4706-86f3-140b5e183cb3@intel.com>
Date: Tue, 19 Nov 2024 12:11:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] tests/intel/xe_pm_residency: Skip on igt_power_open
 failure
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <kamil.konieczny@linux.intel.com>
References: <20241023215851.98090-1-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20241023215851.98090-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB6265:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e4f196-e437-40e6-063d-08dd08654570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0NndjUxUXlqR0h0UDZoNzdnMUMxUFY1QmhjTm1oQTh6bmUxd0RHd2RJdDBq?=
 =?utf-8?B?SUFyMzZHcnU4NVNOeWtkU0lMejlzY1VtdHd6bkYxVEliK2p3Z2FEajNKYS9i?=
 =?utf-8?B?ZysybGNaMXJaaEJ6VUJtQ21sUDFIM3FpQ043Qzg5aVVXTVBNYkxHdTF1c0Fk?=
 =?utf-8?B?eitncHJicVZ4NkFQY0UzYWQrWE9Wb0RJNFVlcjhZZkNBaVFJTVdWYUVBT3Y5?=
 =?utf-8?B?VDBjcGxxQmRSS0xhcFJKYVZZZWZjMlNMU3dLU3J1U095ZHBhNlpObUZFZytT?=
 =?utf-8?B?aHdnWEdqQlJiTTRWU1dxOXJodDl2dGxINC9YK1QvNC9XalUzci9qVHp0TkZH?=
 =?utf-8?B?K2lxSitscW9XdlA3clc3Q1VBUis0TzVKQ3FmOC8xTjlUYjA2d2ZkR3JSMzlH?=
 =?utf-8?B?QjFNeklzbDV6eVBzbUxMMEVyVzJycGxoeW9OTVUrRXBvamRRRE1rYlMyVFZW?=
 =?utf-8?B?MDUyTUp3UjNzYjBmaDdpWVhsdHFqSUsxK1hiSExHZFpJNko3L0NpbjIvWExJ?=
 =?utf-8?B?VGh2akNnL1ZGNXhiVnU2SnNMNjFEcC90YzNzeGNkajFVOFFQQWgwK2JQc080?=
 =?utf-8?B?MUhzYWVYV09EdlUzVS9kUzN6WlFXekV0RnQ0REtObzJ0SnFnWldWeklpcDBt?=
 =?utf-8?B?V2FZTmpUekFGWE1WeUFvTVZUeVY0d1Q1VENQekFqeU8vd21XL1N2RHFERWdX?=
 =?utf-8?B?eFVzNFdjYW8vbVNQS2d0d1dLNDZ6ak1Nem9HejhRVWxvQk5jekorSnRETFB6?=
 =?utf-8?B?RGsyOGU4aFl1UXpRRC9EUE1kbDVaY29DVjJOeEpRbFpLQ29jdEJPQkErNDlH?=
 =?utf-8?B?ZURxWklkNVVTOElvdWFyOVR5OTA1N2Flc05aSHdKdlkwRjJnZzVNOVc0QXFQ?=
 =?utf-8?B?Rms5QmMrZEhkUzluRDNHOU1reERBc2wvc1A1N0xEeFkzZ3RuOEE4cE13aUpV?=
 =?utf-8?B?aW1FNkQ1YXlvMm1nM3NjTjc5WU1XNnBqRlRKVEVOb2F6N1pPaUpISEJFTnlo?=
 =?utf-8?B?MUZtUk5iaFg4Zlk4YmZ1MVhMM3YxNnVTWWNZT0FNMnhhRi9oS2pHamxXWTRk?=
 =?utf-8?B?UGNkb3pQTG96ZVM1N0J4YXFTZnZweGVyZytYazROanBSaTE3cXdEVGNTMG8x?=
 =?utf-8?B?M0t3ZzhFQTIxQy9YNi9oQlhUcDlxL0tyaDRzWm45OFE1NEtlMTV0RElZUnRK?=
 =?utf-8?B?Ukh6bHhxeklXMytSNmhXcHdIc3hxSzFGMXdZSnRRWjJGMjd0SVc1QTh4T21a?=
 =?utf-8?B?NFlVWXBQaVlCbWh0ZmlhQ3FKclVpVG43SFMvbkZacGpRY2hhL3luL01yK3hB?=
 =?utf-8?B?T0dsK2xMVTUyc3U3SzdXeElVOVQ2L2t2VkxJdXpJbUFLNlcrdzFvN2RLL2Ur?=
 =?utf-8?B?T3c0aldhdVRTeTA2V2l6NStBMy9oRFlRSFRvU2ZkYTczNURwOFJiT3NrdzhZ?=
 =?utf-8?B?aDlVVGRNWEJXa0E4cjRvM3ZoUmZBcW1ReWlJUWFDeDZjVFRKT2dEdURwN2Ry?=
 =?utf-8?B?anhZQlpkQ2FMNmpmbkc3RnROQzRpV0FkTzN0NjQ0RlJ5T0JBZGlBZGIrc0dK?=
 =?utf-8?B?RTdVMjFtSmRNVnIwQjBBSzdDY204VTRmbEZORWlpWFQzOEFva1pqdkc5TkVF?=
 =?utf-8?B?Uk5qVW5HaWpNVlg0NDNmMUs2NXN6VmNrZHN3bnZURHdybVI2anpmTVM2QXo4?=
 =?utf-8?B?amkxWGxBSmZ6bWFUbXFyYmYwRWt1Wkt3emhsMGs1RDhxU0NEK1VvRDJOdXhJ?=
 =?utf-8?Q?Mv08ODVyEpfVjmTQ36jaNx1mbp2IVkZuyTapOWc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTB3Mjl2WXpyVFRoU1hROGVqTFdPRUVveVNrQVkxdVlObW5zblBUOFlqQ3l4?=
 =?utf-8?B?SFNIOHVKdWVJY1VkL0hIeXl3OUVnMTROUzR0R1YyeHB0RXhYcFQyeFFnUG02?=
 =?utf-8?B?Y3Q5OFdvc01vY1JVRi9ackMxRDRtVk1KYms0MjZmdTE3Mk5Zc0RMdFV5OEo5?=
 =?utf-8?B?dXF4Z2lydk1EQ2p6am9sRFFmaWdNWklKY3RyUkhJZUZEQUsvM3NIN1pJbGhW?=
 =?utf-8?B?SzlFM29ub0VDdUJmZGkrcnFIb2wwZGFzNVROWDlGdDZNN3RUUDhISmhnNzZi?=
 =?utf-8?B?d0hVd1dYK2FuZW9EUkVEWDBYdm5pY0x2ZlFVZXJHb1EvZHREU1p5Ni9mMy81?=
 =?utf-8?B?T0x1aTIzMjYyUEc3MHRFcFBNME1rUHpOSmQxYWV0T0NQUTIyYmh6VWM0Zkhl?=
 =?utf-8?B?N1JSZWkxZTFlNEJLaHY1aU4zZUNHSkVhcTdiL2dUUm9BSnk1dm5YWUgxcDJ4?=
 =?utf-8?B?c3F0TmxaaTBWdm9XMGQraXZNbm9HcEgzWTZyYWZCMWhHZE9PWkpzWE1yRnpz?=
 =?utf-8?B?S01RVlJ6ZGYvNDBYc1ZxaCtGWjQ5SEFQRE8vTjZ0RXU5NGxuM08xYnU1WmhN?=
 =?utf-8?B?UFNIU1VrZHVoeDliM1J2UnNpU0t1NTlzRmNLTUN5QzFKVUF2OGdKekQ2ajJR?=
 =?utf-8?B?ZWZ0NjMxNWtmU2RMQzFzTTdqNnBiL3E2MUZlTFZiL2ZUTEhpWFYrcFQ4ZkJk?=
 =?utf-8?B?SXljbzlreTNUcVFoUU9QZ2I0WTFldnFlN3Q3VUNhT1MwK1hSdlJzbW13a09t?=
 =?utf-8?B?ZG5XWGRNSGVrSGRFelRSNmNjNUZTSTFkS0l1ckJOT2ZieStwTnhLNjVPS2lV?=
 =?utf-8?B?V3QvYnZpY0NoRC9ENUM1emg1RElIc2RDZlZRNkJlZDRMZ0QrUG16RWtmdmN1?=
 =?utf-8?B?WENSZHArMW01VDFza2xtOFhmOUN0aHdGS3V1VTNuanIxNlBhVWNpOHN1WDFi?=
 =?utf-8?B?TFdpN0lXeUs5TnZqVzNndnZ3SEhwVkRVdGNLd0N2ZmxsTGlqOVBBd0JzVHNI?=
 =?utf-8?B?YjZkN3RsaUNFblAzaWdaZUJaK1NVdjZubkFZSUppb0pNek13eG9ob1B1M2lo?=
 =?utf-8?B?cFg0czJ6amJWNk4wRHRuM0NHVEpjbklEc09LQVdsZll5UGtQTEp4SThGVDI2?=
 =?utf-8?B?T1B4SFFXR3U1KzRzU2NkeVZFMXdXUXFqSGpadStySnZMZVBKckpYRS80RDNM?=
 =?utf-8?B?Y2VIQ0ZyTnJwanFIdkI5TC8wMUR5SHdoL0xsQXk2STVNZytXNFJLU25TTjZP?=
 =?utf-8?B?UHluMk5NeU9JTVRPUHg3dzNXbFJaOWFWdHlBZVA0c29LSDdpOXY2cXJvYmFW?=
 =?utf-8?B?UFU0cFBzdk5lQnNGMVZzUTlxdlJKdU1RazVubGpuc2pGb2FkSnVmblhlek1T?=
 =?utf-8?B?dVlQOUdKZks1dWZFTkhNNWhXUEQ2S2RwV29jT1pJQmdneFJ3aWk0K0JBOGc2?=
 =?utf-8?B?aTFxSkx2S3c4Z3pVcVdoZ21DUDBLVVNHQnRJd2wyems3QUNMSnZhUEl0ZkNj?=
 =?utf-8?B?SzR3aDQxOWpyTGxXM2lYOHhmenRlbFZ5N1VBUmpvaldIV0VoY1pMSHhTQUxp?=
 =?utf-8?B?dkhNcXhxR2k3NlJhRE9zaEdLSEYveDNDOW9KUnNZTEhDYjNJTG81azljZWtv?=
 =?utf-8?B?SWx4dlFRV2x6cFNqZXIvUU9LK25uaWtWZDl1enJMOTlGUC9rVkxselppRXBO?=
 =?utf-8?B?MVBoNW9KbTRLQW1rR2w0SHlrbjlCdktEYXBlMFJSWmIwczBBOEprTWVNVThD?=
 =?utf-8?B?NG4xSHV3bXZjaXo0Z0k2V0RMc2JjOFk2aU5IaFZtRENMMXhyekNMenlvNFFB?=
 =?utf-8?B?eTFaMitYZlJGTkE1RHZIZ2FXZE5GeFN4RHJyL2N1dXpYd3NHME9PQ0xHSEtW?=
 =?utf-8?B?QkpuWXUvOWRJSnhaYXJMLzBLTXMvZU96VnBBZzY3NVpLRTVNT0ZxUGtRUi9R?=
 =?utf-8?B?NFlaUlY5amNPNWMvQXZ4TCtPbXdWak1tYUF3dWtzZTVzeWl2YTRwTVZ3WGlw?=
 =?utf-8?B?QW1BaEVIbGExYmlLcjh0dituSUhwcWF2YStTaFJqdDMrbjJzdmxDVXM3RjYy?=
 =?utf-8?B?STNhdGtra0VERkJXMHd3UkhkTE5tQi9xWmI4NDcwUE4rRFp1NGQ2MzlzbHVN?=
 =?utf-8?Q?WnipCkzERRBHniSPRM1rHGsBJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e4f196-e437-40e6-063d-08dd08654570
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 06:42:00.9947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNzb0kakx57CLbcumOcF+wRfth7b/OLwONRicEjtBWX6D/8yO+Kder2Kro3SGQCGkXTC4SG6B4dh6BHZCGD2xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6265
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



On 10/24/2024 3:28 AM, Jonathan Cavitt wrote:
> The xe_pm_residency@toggle-gt-c6 test fails when
> gt_c6_power >= gt_c0_power.  These values are reported by
> igt_power_get_mW, which will always report 0 in the case that
> igt_power_open fails to open either the hwmon_fd or rapl.fd.  Since the
> expected result will always be a failure in this case, skip the
> assertion that gt_c6_power < gt_c0_power.
> 
> v2: Do not skip the full test, and instead only ignore the part that is
> guaranteed to fail.
> 
> v3: Use || instead of && (Riana)
> 
> Signed-off-by: Jonathan-Cavitt <jonathan.cavitt@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
LGTM
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> CC: Riana Tauro <riana.tauro@intel.com>
> ---
>   tests/intel/xe_pm_residency.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index 772fe9b574..7bd6bcc267 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -282,10 +282,14 @@ static void measure_power(struct igt_power *gpu, double *power)
>   static void toggle_gt_c6(int fd, int n)
>   {
>   	double gt_c0_power, gt_c6_power;
> -	int gt;
> +	int gt, ret;
>   	struct igt_power gpu;
>   
> -	igt_power_open(fd, &gpu, "gpu");
> +	/*
> +	 * igt_power_get_mW will always return 0 if igt_power_open fails,
> +	 * so skip the power check in this case.
> +	 */
> +	ret = igt_power_open(fd, &gpu, "gpu");
>   
>   	do {
>   		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> @@ -312,7 +316,7 @@ static void toggle_gt_c6(int fd, int n)
>   	igt_info("GPU consumed %fmW in GT C6 and %fmW in GT C0\n", gt_c6_power, gt_c0_power);
>   
>   	/* FIXME: Remove dgfx check after hwmon is added */
> -	if (!xe_has_vram(fd))
> +	if (!(xe_has_vram(fd) || ret))
>   		igt_assert_f(gt_c6_power < gt_c0_power,
>   			     "Power consumed in GT C6 should be lower than GT C0\n");
>   }

