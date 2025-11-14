Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2844CE7B08
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 13:10:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D5A10EA6A;
	Fri, 14 Nov 2025 13:10:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U+o1crho";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4EE10EA6A
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 13:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763125828; x=1794661828;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9xHxIMPOYDsgOColoG7DGoV3QcbokFOU/AHwwKrAGQo=;
 b=U+o1crho2YhkGJ3guBvgDb35n7+J+O0xYrALm1Mv2QGi1i3QySjlpPlj
 nVdBxIp4toH3jUDStbH+9GHSXRd9eMDQpJPWK1/crpKiEy/lajYyUle5I
 STOMs/YQCx8R7Fr0Nau0hl4w/pj5Q4aBDA+jtr4J0gQsov9XRdB5jJdAq
 nZl5+3epLClT9cJeABPhol/WifkarpUo6mYYWCF9DVZY5tX4Igywzdt5V
 qdl/wQRT4pMuuVvPITFICOHoDF2n1cH5BWeiyG+/fsJ+7pwPq0bc6Ai3C
 gKOkyy77FvDoVsX0151jfn+wZPlrP9Q+90vO418LG4w0nSAQXIkkdX7/b A==;
X-CSE-ConnectionGUID: tPDzFVLvRbe2soR95YH1Ng==
X-CSE-MsgGUID: cbVAeGD5TEq5jKKucmA7Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="69087631"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="69087631"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 05:10:28 -0800
X-CSE-ConnectionGUID: H5faRwLqTo26bLqyOAHXsQ==
X-CSE-MsgGUID: w/IerrDYRm+ohotgN2qBpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="189782940"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 05:10:28 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 05:10:27 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 05:10:27 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 05:10:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H5os3ETjmXItOR1A2yKGHinyqUoCA6UMaXExZcHV4eDIYYLxLaNottZI6dlVMhnOTQw6RQ1tHuUunE6DqNAVnEikbCDljBGphZ1QyV9K4g2BkjhGVxvpnQ4ws9Z/Vq40E99M4qCbqy/mNwKe4bZUwkCIc91zA5whZfx4Lm5Ggyj2MnQwYvfUYakeq1iN6EEhAD2xMRKwCWp4t/3Te1sE6prjHbhHolyxr6IgqF0iZPQ44OXQoEgjBF6fEmb9FWYfhwDBf4Q/GDtrIYLueMtHsKGO5GuPC1B+6g/03IHJB4uaB9jyF0Mgwn405MwI5UXz055xmPQr7myquBaHB3+5uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14hAkiBsL+dVUlb7apQOD+DvTulMvpLdOAQdEpG5LBI=;
 b=p0egkA0RLd7gGhSh1eVBLKNJQJySa15xfgNe82YoocRLq3YNOsd9VlJkr3A3o1BCm6fy00XQKL1MrYIHd6EYfAnOGkHh393IG87bGZt3KgF0TW/aCHTIziQoNf+8HoEXZPU1PJm+9sxBihs/+WHorTd8+VDk+aabX+vg70rIOEt4LA4WzVEawFQBbmTj5UQp8sQtEfsI56dl7zshjklGtjixrk5tMlUAJCcx3VYdqdgc14/3ZuZZGCbbU8Oa0SMAxewSyeFK96qeJxdOcxVsbb0ffWI0B751g10+dBQUDaeeBQW0pXjGao/Cj/nVQx9/S46l4l8fAoDJsEUp4BkSTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS4PPF69154114F.namprd11.prod.outlook.com (2603:10b6:f:fc02::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 13:10:18 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 13:10:18 +0000
Message-ID: <0dee33e5-0c36-4beb-a98f-00707da65ee5@intel.com>
Date: Fri, 14 Nov 2025 18:40:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tests/intel/xe_pmu: Fix frequency assertion when RPe
 raises min frequency
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>
References: <20251030192627.3810994-3-sk.anirban@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20251030192627.3810994-3-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::17) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS4PPF69154114F:EE_
X-MS-Office365-Filtering-Correlation-Id: 278bf140-d884-4d6b-8984-08de237f287c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Uy9ZMEFsdytqSEN1TWk0SkwrbXc3d05MbEpmVmVuSm5lM1luM2JjRlFlWFJ2?=
 =?utf-8?B?TWg2WnU1ckJKTzZEcEZxOExEbEdkdXpMYlhZejZMdms1VE5NSFBFVzI0bU83?=
 =?utf-8?B?NmFOdTFXbGQ0NVRZWnhHaUI5VDlrMlAzWlo5eWNsVFN2U01QSUhFRldtRmdn?=
 =?utf-8?B?bnZBbFFOdWJCN3orQVlVR2V4V1VodGFRWjVOSXBpbWhxNWZlMFo2REhMMHBk?=
 =?utf-8?B?N3E3UWtOZG5KRU0xbFc3TU1VMWhDQ1RuTGJySzRRdnhPUjg3bVVoS2QzbEE0?=
 =?utf-8?B?V3RucGh6ODNtUnhlWm5ZY29pTUR1YStzdTd6QlZkT2NzMnFYdVVkbk0wNjk2?=
 =?utf-8?B?eis3dkpCb09SSFJsYVloTVM3MDJvOGRuNnBmRnBuOE1lVmIvZWhkaFJzZzdr?=
 =?utf-8?B?UGc3MGdsZkxVb2VKdEdwRGpWOEVwNnAxOHpBaWozczJIS1ZDYWJmQ3VGeE5q?=
 =?utf-8?B?bHdiZms1Q3pkYkE3UEtRbFlHTkV0V2ZVa2daMFIvOFJPdDRwQ2o1QWNUUUs3?=
 =?utf-8?B?VjZxWmM3QnVJQldsZXlscnJwdEhlN0VwcWFOL1oxYXVYT285TlU0Rkw5Y0lH?=
 =?utf-8?B?NElKM0NRdlpmM2ZBNlhxR2t4NUdFTSs3WngwSXFNelo1Tng0aDFsWldoVXBT?=
 =?utf-8?B?NGdPdFZqM3d6ektwd0RVdUVBdXJPMWNuLzlyU2hXSWJmNGZyaU03OG5uSjFr?=
 =?utf-8?B?TjlKdmFLNmF0SlFpalg5SUkyTTk5Z0QySW0yeDZlQkhRdmY0czh3RVlSNGRr?=
 =?utf-8?B?UFRtUUxIZXhxKzZxblk4V3A3N2IwTFVkeXhGSGpnQkh1eTMwTXdYYzI4TFJJ?=
 =?utf-8?B?bEgvTGpHRTQ2SGRxeW5xdWROWFo4THVKTUFMNEVrZUhIMkpoellSOWNwNEUw?=
 =?utf-8?B?bnVmbG9aTkhMQlAzQ2QyT3ppS3M4NTBnYjNGTHRjL1BGOWpYSUdrR0tDTVU2?=
 =?utf-8?B?OG5XQncrRXVpM2NVbkIwWFFJY0NNWUFLanpHbmZNQnJjREQvbGQ5Y0dHV0FZ?=
 =?utf-8?B?RE1wa0g2NFdndmRwUkdzeHJtZWl4eUEySEU1SG5vckplek1XSHBvaFBsNGJ0?=
 =?utf-8?B?dXd1b3E1V2l2d2VUQUtBUnYwaU5BRS9GRU1RaU8xaHdDODdqRXFBWU5ab3Yv?=
 =?utf-8?B?aGtUbkhpc2NTcVJ3cDhpbEJOMmxLK0ZBd3NxUytsanduSVpMazBzajN2R0VW?=
 =?utf-8?B?WmFjRmloWmZaZU82aXpjVk0wR28yeWl0S0xpU1FVcFM1ZXN2WGpiOTlKNk1w?=
 =?utf-8?B?RFFWRkI1Qk1VYk9XS2tLQTJHcEw2MDRSOE1DM2pIV2ZKN1huZWVmV0F1WFAv?=
 =?utf-8?B?VmpCYlVWY1VPakhseUt0VXlwVTJQblNkckl1MXU2Zmp2YVdMT1pKbWFjVHIv?=
 =?utf-8?B?LzFxN3JHMHR5Q2NUMVVseXdWdC9SdEVXRDFUZ0pNODR1Z0dueWlrVTA3NjA3?=
 =?utf-8?B?RUQzektLbmFZRXZvMjk0cW9sM3BwQjFDQ2tLL2djMzJqeVJRdWdMbE5Ycmp4?=
 =?utf-8?B?QWxNV2hrWlNmakJ0YXl1RVhxaGVXaytXeWZqQmg4VzhhcEZvUEF4UWgvWDNB?=
 =?utf-8?B?bGF6VUZCaU1SOEt0cjIvblJVOHhkTnQ2V0VYYlZIR2h3a1NoQXE3MXdnVDRQ?=
 =?utf-8?B?emlKei9HZkhOMmVDRms3ekxrQTR1OWZNUll3blByR0JPdHhpd0V5QjhXNHZR?=
 =?utf-8?B?clBCSitIME1OZ2pPWFRrejNPdTU2NHd0RXoyb09NSTlzZEtQaHI3Q0k4TGpz?=
 =?utf-8?B?WEFhMFhwWEt0R2RLR1diNzlzWkJhanU2VHQ0cy8wOU0xMVppODhRcUxoYzRU?=
 =?utf-8?B?UTlLZnUwR0c1T1FvWDhhd0diRlZmQ1VWK1hVVEl0ditlSHd6K0hSTi9UWlVu?=
 =?utf-8?B?SkMvUHoxZ0dUNGxXZ1VWT1Avc25OWFFlSEZidzkxZWdUaXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVlWVTFvTFk2dWQ4YWVOUFhRT1pmL0J4bjR0TFpXSEltVERXQ2JxeXd0dEVK?=
 =?utf-8?B?Mm9rUmg1NVZwT01velhuaXp0SFZxZDdGYmdLRU5JQkpySTZkaWlRS1FQeVVm?=
 =?utf-8?B?MzRyV2NJcFZOcWJlaSswTThZV3IvWjdSc2YwVWZISkFrZE5SY2t2UVNEUEVt?=
 =?utf-8?B?ME9ZSjA2TFIySUErNEN4OXZzWXdCaEFFWllWRjJiWXdOODV2WjJUYzNDTHVv?=
 =?utf-8?B?L1U4OGkrYnFNUjc0cGowT1ZPWTBrczA4OVNMTzZ6OEk4VVhmMm14K2UzYllt?=
 =?utf-8?B?MXJqaWFLaW4rY2JKbTNmUGo5R2lRQnFjdThXTEEwSnJxbTBSYTBoOEEzRERv?=
 =?utf-8?B?NUZINmZIZmMxMkFUdkRJNU5TbjN1VFczMTAvZGtvbkw4THI0RGJnZVNFTzlL?=
 =?utf-8?B?UkI5WDRKMllOcDBmOUFPdDdKZTFhakpFTFhEQTBjSE5OQVdidTF6aGlsYVM2?=
 =?utf-8?B?Q3BIbmlGdU9wT3d2M2FXMVdvdms4V2JoZUgrK2NOUG52SjhJQnlYSnI0TjZ4?=
 =?utf-8?B?YkR0QWc3a1h5YVI1MXRJVVFlVGhmY29TbmIwWWw2VEpNNkxTK0FMWEY1SXFq?=
 =?utf-8?B?ZUduQzE0U1l4d1VKZ3JJZTJqSlRETlVuSjl2WFl0eEprQ1pTcmcxd0VVNUlY?=
 =?utf-8?B?VUVVRDVqUmlxcHI0U3lKYzg0cHpxSndnK1lGU2dVejVaQmtSUU56dDdHVDJF?=
 =?utf-8?B?VEdUS2REbjZkaUczMjRHYm5LOTFBKzhlc1RXWU9LVXpDbzA3UCt2L0ZFaWxL?=
 =?utf-8?B?MVFMU0N4TXFCNlJtYTdMR3Jicy9lb1NKUjRqaHhvdzcyUWc2blNQNExpVHQ5?=
 =?utf-8?B?eHZvblhWQzEwM0U5SnhFVDl3K2JUZnB0VTh3VnpxT09lNDJwM1BjdlhsSUR5?=
 =?utf-8?B?NElnNmVoU0RJRjY2RXJmNHFlT0FXMDZ2ZlRVSGppTmFkaUpYeXA0OHRjNEV6?=
 =?utf-8?B?N3g5amVjd0J4WmZKcmdMTTZMSG9FeWdrT083V0RING44czRzVjY0bkRxT1kx?=
 =?utf-8?B?TmhGTFNLaFo4dExXSjFRRzY3dkhGQUc5VFNtaVMvbzk2T0xTSzNJTStlQlpv?=
 =?utf-8?B?Smd6NklrT0liNUx3YUF0NEtEV1BkTERZa29LcGY3cCtaZk9DRnErdFFwc0dk?=
 =?utf-8?B?S0gwOURndUl3cUlyV3VtNk1qVmhSeDhSRW83RHpaVGdFdVovSjBtVXo5WWhI?=
 =?utf-8?B?Q01PcjY5eWkvaFNLcVhDd21MdVJsZEltYmgycFRlZ0l5cE1QZzBrZkkwU0Zv?=
 =?utf-8?B?amV4N2I4ZVBURWNIZXFaSjB4ZWpLNzRUbXJ2QkFQRjBUTERlRHltaG15b0tE?=
 =?utf-8?B?T0V5VlpmSzhuNnRxcm5TY3drYjZBQWZNRG01VVErbXVNV3I4cmMycGhha0Ru?=
 =?utf-8?B?Nm1Fa1IzMWIwQThHOWk5M0RuYkVZYzc0VkdxUzl5RFBLTHV2M2crdzFOemtO?=
 =?utf-8?B?MnNTZUJIcWpCcFhEalUvVDd3K3g5MWFKaDE3YnhzbitoQ0tBNHRDRzBhYk4y?=
 =?utf-8?B?T3JiZnhsekN0d0VpQnFoZEdJc3Nqa3lzU0NxUyszeVV4cENIQkw3OHVkU1hx?=
 =?utf-8?B?dG1MVXVZS3JPZmVLbnJTUDZTSnRYYko1TGhJV1Q2dmN1NUl0TXlLWGM0N0NZ?=
 =?utf-8?B?am9PdmF5V0hrNFZYbi9SV250OC8xdWJMbzlMWWFrRVlMbFRaUTRYMHZlbjFW?=
 =?utf-8?B?dk8xUzUwWGNxQWxBWGNYRE5PakMzeXduSGoyREsrSkd2L2x4TU16N2k1cTNq?=
 =?utf-8?B?MVNaYWo2dkN0N3BWR0NtclN2TzNVTFhuVEV5VUdjdnc3SkgwUk9NQWV5aE03?=
 =?utf-8?B?VXl1Y290QTJaMUNXK3NmZWU3TElWOGR5NFF2MWVxNW82S0xRZ3FPWTFpdUdC?=
 =?utf-8?B?WlJoVXRiM3ZzWTd2YlplUEZoRUtndVhWeW5sSU4xZEVUU0NqYVA0S0EvNUNj?=
 =?utf-8?B?ZVlpbVJmTTFrcCt2RUliL3FjaWJBaS9oTFRxdmRXZEhqZlBxS0N3VHFUckMx?=
 =?utf-8?B?SXV0WG10MUVzTmt1VGhaSW1YS2FjcXV4Mlh2RG1XbU9IUnZCZmdMaGxscDg0?=
 =?utf-8?B?cXBraUJHZEwzOVJRN3dZSWNYWlJqVlBnUEVHc000RXhtZnlIRE9oUERBblJ2?=
 =?utf-8?B?Q2crMHF1aGViN2wzVS8xOStIbkovNTI1QXdwa2ZoVVh3RDlDNW50c0lHN2E3?=
 =?utf-8?B?ZFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 278bf140-d884-4d6b-8984-08de237f287c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 13:10:18.3870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHft/SKurhD7ANSrujWS2pJ1uyZAOgRthkR05aABPqrBlYtZzVe1H9eSBiqUfvjdCjqru3rBs96+3dt5e5xoiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF69154114F
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


On 31-10-2025 00:56, Sk Anirban wrote:
> While running workloads, RPe may dynamically raise the minimum frequency
> above the original value. To balance this, set the minimum frequency to
> original minimum.
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5841
> Suggested-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_pmu.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 9525655ba..1a5b17de0 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -912,6 +912,7 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
>   	/*
>   	 * Set GPU to min frequency and read PMU counters.
>   	 */
> +	igt_assert(xe_gt_set_freq(fd, gt, "min", orig_min) > 0);
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>   	igt_assert(xe_gt_set_freq(fd, gt, "max", orig_min) > 0);
>   	igt_assert(xe_gt_get_freq(fd, gt, "max") == orig_min);
>   
