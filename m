Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7E6C369B0
	for <igt-dev@archiver.kernel.org>; Wed, 25 Sep 2024 09:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995FD10E094;
	Wed, 25 Sep 2024 09:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C4qBl67o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F8810E094
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Sep 2024 09:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727255871; x=1758791871;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5sNWAbKlA1KTNz6pf5iS3BvDp7Z4k9mbjuX6K/1ZaXc=;
 b=C4qBl67oCY/MB/V88HHyvWWomg72zOtJvOOAKQSz0WwWzW7TfcY7ZnE4
 oQ7pmKnVBbMI7Gf9EpI0rUNDIBG180DGvJp2VfJrxkJWpQylKA0+olj+t
 +O3uIqpSFnjBv2YXUCLrqGS6rrDqPnxXPVx5bhoeHuj5V9suw7BWUUCe9
 oPRsH4rhGTKhZmVET2x6upawEs5JlxYSv6nzjCE2MiuGYg0GoETEROjLL
 8FSIgONUr8wdKqpvp6RLI9DN5ZIoJ+10pOc09V+nmJ2aTk6EsctTgspkz
 9rP+GaRgWAe9XRR+PRgVy5r/CfWCRAbTiaeNQ2xU9SvFbp901OhoLmXHU Q==;
X-CSE-ConnectionGUID: rGH8Tx9uTX+vE1JN5FvulA==
X-CSE-MsgGUID: u84Z6rExScGHKLMK+RxIxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="37432680"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="37432680"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 02:17:51 -0700
X-CSE-ConnectionGUID: 4FmCvxSuT02PLxh7UDOD3g==
X-CSE-MsgGUID: k0APdSfjT4els7wtYQJcOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="76104651"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2024 02:17:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 02:17:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 02:17:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 25 Sep 2024 02:17:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 25 Sep 2024 02:17:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LDXwJDmCrVuU4ABIjaRZ0YXpTStinvnndbN6di+pLSiMrWD27sqIsV0m6T2M/y8z8ceh2uWh2HTiMuYxvCYCaMBqAv+jxRaOBhoRBbkvdoMG5CnS92qXm37/sa1ijXPI8MaNK/qFOCmma6JPeXdx4La3qeT4gpAYhHUjjS34EQ0SNKzZKejVI57N2fJVFnOhL7Ng4QmNAi4WX5MVJBV4es6iDwheWqeNw+ABlBWTogEk7q2eumGbISmw4slLfFbXXluTwfeGJAPGSfAcXSWcGIlRwX4HQymGoBMyUvTX2agjdRsmFGm39srcc/OJhqvaYBVyIop40z9yVaSXvfAwig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwsueSye0wFXUvUUVAtlPQ/IW6TGp6Sjge4c4bZULYY=;
 b=q4QLL/ftoR32Dti2oG4+/IY9qKmvaFQi+nOoSr5fz9yFccogX2znoiiwpKT6jHhhQKMsBUUN0VHSbLLZ9sWPwwUZ+w9K6GDxoobivduh51NeP6R9bDBLBlw/HnFRwhiJ5uCm0yLwV02UVYyvu5zxEaMAyAWRXTltC+r819+28+Xu55aBImziImegS53hAk+nWXXo1acdDog6hW4A1TgUHbhv/naKWnw3iJjZwpHF3aAaxxj2t+1VuVFdBZRYKzd/gIa1+YBO7PdsVvQTLPD3J7h1MZp8DPc7gA0kiKOP9a4XcjW5gADVaHRdfivibC/mTj9FwDQgRlL+p4fFwSOz5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.28; Wed, 25 Sep 2024 09:17:47 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 09:17:46 +0000
Message-ID: <01f37f21-b428-4943-9889-64ad36e793b4@intel.com>
Date: Wed, 25 Sep 2024 14:47:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/xe_pm_residency: Fix while loop in
 toggle_gt_c6
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Bommithi Sakeena
 <bommithi.sakeena@intel.com>
References: <20240919165950.50879-1-rodrigo.vivi@intel.com>
 <ZuxvBL2FbkOT8OZp@intel.com> <ZuyfcOSblAEBY9S3@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZuyfcOSblAEBY9S3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB7593:EE_
X-MS-Office365-Filtering-Correlation-Id: 49d6291c-6db2-4bf9-9198-08dcdd42eb4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTZEQmwzZFJrdXAvN2tkY3lLcUcxZEZuRW13S1JwSGZjcTNLSXdZZGcvVUxX?=
 =?utf-8?B?Sm1hMlFRd0hDb1pVNEpnUlB6L052ZXE4dm91bGxsMmN1Tm5zNkRKS3ZjR3gz?=
 =?utf-8?B?K25jdnlwSEROSG9hN1RGTDY5Rkc5MDVhRmg4aG5HQWRNalFkU3NrcFdZUktM?=
 =?utf-8?B?aE1IQWFNR1RwL1lBSnZhc2tERFNiT2ZDb3BybFVDNkhxRnhycjBlcnk5blpk?=
 =?utf-8?B?Uno0QjZRc3BoUm5JUTd5WG1vdCtRT0JKMjVYNFlHRFhhS1d6UFRvMW1xYXFL?=
 =?utf-8?B?UnYxNDVTdW51L3FEUlZMZ0xwb3ZjNUtDK3dsczNyU2hZZVpYaWVpaURjV3Jr?=
 =?utf-8?B?NnAwVk80WksvanZNdStHbGR6UVhuOEtWeisxTVRVRU1EVCttWkYxYUlWMzl5?=
 =?utf-8?B?MzJCRTkrZlBmUzhUNEZQZ2dua1VHcDlpbU5jcExUQ1N1OVlEZTc3czRYVlQ0?=
 =?utf-8?B?WHhsV2p6aUFJS1RucUlWNXB4WDdsOGpkb2xyeUNpVFA4emNBcmFqWG5scFkv?=
 =?utf-8?B?dkp5RlM3WVFnM3NDSEY5bTBEdHBPSXhMSmM2ZG5jdjdBWHpiVWdpSEQ0NlNM?=
 =?utf-8?B?dFZWSWc2QlB4ZjExUE9OZW1rSmY2NysxeXEza20xSTgrYkNKUTQ5UzBQWlNY?=
 =?utf-8?B?YjZjbzAzWHkrRjRFNlJWUW5kN0JZcUJlT1NBaitKY3JEUHBmbnB6eEV5NVJT?=
 =?utf-8?B?bmdpYmJyc29ocFZySXZsNjZtK2NoUS9RMVVxUTdIeUcwMWhaT3F5V2tUblQz?=
 =?utf-8?B?ZGp6K0ZYQ3R1WVBzYnBqMGwzd203d2w2R1VzSlZLT3I2T0J1VTVQd1k0YWp2?=
 =?utf-8?B?aXI3RzAyb3BMU2s1a2FpMTdQMjZUU2xVdURBZE1ENXQ3em1lay81U2I0aVZU?=
 =?utf-8?B?SzlNOWxJQW9DOXZYSmpKbnBRaXAzQVNHU1hHZDVnT3FXZmVSUGtuU0RRVEJu?=
 =?utf-8?B?TXBWMnM3WW1kbjR5NlJkN1VIUUxJa00yNHMvaEo5QXNmdVh5UVNKNkRhN2ps?=
 =?utf-8?B?Q0I3ZTdUZWl6Q0NUaElZZlRXNHpzMnd5SUlhMWYxMzlrL3ptSWpPK05JMVZ1?=
 =?utf-8?B?dHJIbW1ZckRtOXVGTHlHZ3EyZjNURFlBRGJWYWNkK040N0ExcGlxb3EwWVhB?=
 =?utf-8?B?UWNCU1gxdVY3cXVIdkxiZ3N4ZkpHK3paV1VZSW9SNEpQSnJMbjJ5RjNjMFpE?=
 =?utf-8?B?NU4vTEdiMU5mK0RGOTFLNU5KRUxrNjRxbzkyNWxYS3FXeXZTcFdkdjV5TjBq?=
 =?utf-8?B?RkFVZ2pxaElRUS9qdXdEckhUclByd0dqSFZOV1RTeWo2bnZ5MFdHb3pQbHFz?=
 =?utf-8?B?eW1NRHE5bzcrV1R1WDc4bjVYS2YzRTRWTUcvSDNSLzRndDNLVDVOM3FPNVBu?=
 =?utf-8?B?QXVaRVhMaGhzblIyMjVlZ2xQK2NwaFFqR21JUEgxVFlVQ0VPQy9YQVhidmFp?=
 =?utf-8?B?cnBXU2g3NElDQ085WWxsSTNpWG5BVDFpTUdyTUFHcFU4QjJRU1lYOUsvWG00?=
 =?utf-8?B?YkJpdW5hRnZaaHhWd1NuUHdYY2o0QjZnS0tyS2phaHhuRzd3Mi9CVFFEcnNG?=
 =?utf-8?B?L3JSV2JqRHJkcGZtREJXZVQrR0xmeHNKOUFOcldMTnR0MnpxUUdSWFgzNDM5?=
 =?utf-8?B?VkRmcENYelZJK3V4TUNUZ1UzWjg3OFZvSFI2RG1BRnFYVGVCalJGSXdVVUto?=
 =?utf-8?B?eDlnRGxsMUkxTkU3VnVUOXNBMWtOdVdaWCtZM0p5SGRmczluSkRpWG9QdXFZ?=
 =?utf-8?B?SnE4c0tUN0pxRkdFYkVQbnpqVmFxNVB5REd3K2M5M0dNdFhMNXppUjd6ekhB?=
 =?utf-8?B?dXl4RTAzZWRtOGlkL0tVZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkFoUjVMRDl1bFBjM0NQUFR2UUpmeWplVnNCUjFxNk9oOUxRUU45UkRRWjRL?=
 =?utf-8?B?N2xMR1JwWDFqVkVrT1IxWE1vMWpqNVdhNTlnN05YaFlwWUZ6Q0RrbjFzY0lR?=
 =?utf-8?B?eXNldzZocXZrQzF3ZU9jRW5tS2lObjQ2UFZIUUxtSUhlN042QUhtSFpNTG5G?=
 =?utf-8?B?MDJucUs1Sm4xVEQ4cWhhWHNLQk9qZXpDYTBIa2VDYUxRcy80dUpuNi8vUUZU?=
 =?utf-8?B?eHVvTUQ0K2NkT250UXdLOVF5QXd4bzc0T2hsbHBoc2MxZExmL0lyOGVYQnBL?=
 =?utf-8?B?VTgxNkg0NkVFSEtKNjZMM3ROOWpnRCswOEViclB4bjZzYk1EZWVITTcrYzRm?=
 =?utf-8?B?ak5hZ3QxaDAzZ1ZPaGIxV040S0JrdEhLelR1SkZqVlRQTVo4R0VMYk52Zjk4?=
 =?utf-8?B?alJiSXpuUUo4YVQyZmxOL3ROak9YRllWdjZwdWQyUUZ6U3V4Ti8zOWl4dldp?=
 =?utf-8?B?aTZlV3BPbldBdFA1aGZ5eWtVUE1jY1R1MjVaNGd1UERPWkdxaWM4UGUxRUNi?=
 =?utf-8?B?ZDRrcDl2aVdQcmdaN0pZMkZieTJpVERoME9sZHBCbjF1ZWtEanJRZUdnQWFl?=
 =?utf-8?B?d3ZBdk1xNXdmL3RZQXJtcE1uYnRyaEg0N0h3Y2k5dnNrMFZkQlRibDRoTU5q?=
 =?utf-8?B?TVlTWVE3dWJERXFBeVh0aVpQZU5LVW0wdEtROHpHNUtOazF3ZFZXUkZIT2Iz?=
 =?utf-8?B?Q3l0am9nQVF2V1RSWW5MTDJrQWtKamx5VDZtQ2Z4bU5pYkYvRVhrbStKUVNj?=
 =?utf-8?B?akU2RGVFU3VHbi9wbXM1WjBTY281c001aFVQa00vY3pmV29GLzVlWDBwK0ZW?=
 =?utf-8?B?eHljazd6ZkxvMVMvRzFFVnlNMFZ5cjZQQi9MYmhHRytQT2UxVGFVaVNFUC9I?=
 =?utf-8?B?Um1uQ2IrRHdtOFNCdndzeU9nYk9QOS9ES1p2bUtKU1JUU1BxZkFndlU4QkZz?=
 =?utf-8?B?QTBta050UlBRQk1TM3NmZHNGeXY1OEZaQThyZURWbG8rTGFvSUFXV0srVmhK?=
 =?utf-8?B?SFpCYjVVZnVyQ1J2clc5bGlRMHJ6SXo3N1ZhUWRIbEkwLzhWcGw5RldsejM5?=
 =?utf-8?B?QkpmK1IxMDJZZzhZbXlZVUZvMTdoMnFaNzArM3RHWjRPK1FrK1ZnWGJZeWlU?=
 =?utf-8?B?d0x5dzNvby9OSHF5R0pDSnJPbjcyV2gwem9sMXVUZkpZN2NqdFZpbFNGWGNP?=
 =?utf-8?B?VklKRWtlNjBqL2dmU2ZqbjM1c0pSdmZZMTRVV1k5VWhzUGJ1RHhIUHBCT2xU?=
 =?utf-8?B?dnVNT0tBTFhkR1lZaWtpMjdleU9wczBEWXJVNm54MHJaMGJHTGg5RXdBM2J5?=
 =?utf-8?B?TzdYT3ErRWNhS0EzeHZ1ZVRTbjlIUWVmbVY0bXI4bnlQYVB0VWdJSHZBczJM?=
 =?utf-8?B?L3RIc0lHK0dsTWkyZFYwbnppbFJkK3J4NTAvL0lEUUZYamY1RnBEZm9YYjB4?=
 =?utf-8?B?bnROc1JpNzU2a0JPRXpRREJvbHJmZU9jcEc4cUFzbFJZVHRRcHExNUp4Zk9K?=
 =?utf-8?B?UGZCcm4vOFRkanIvd3c3QTlSRHJxQithWXRjSGdFakFneVA0YWRlb0t3aU4w?=
 =?utf-8?B?NUVoYStBYVZoZ0d0RHh3WnY3WVMxZWFhZUk3UE9lRUNmVEVVVnp1emJtbTA5?=
 =?utf-8?B?dmJVdzZoZlhyQW8wRk9ESk91eVZrejhwSkZIZVBpTVc2QjJCTUFuYm5qMXVQ?=
 =?utf-8?B?aS9TWmNGNmVNZEFmUE9IRlBVbWdHTVlFNnRUd1FwTU5uMU1GdVhLNk4wLzV1?=
 =?utf-8?B?R05rRkR2a0dEWTExUmNUbUVndjM2ZndKWU9heFdmOHhCN3l2K2FKNGI3MHpi?=
 =?utf-8?B?eGFvcXNwQ1hBeXFQVHo4czFISnpZcHJtcm54Ui93NjJsTCsycHNkRWdOZ21Y?=
 =?utf-8?B?T1lVY2htSFp1eGpJVVBvN1J6ZmJCUDJMRExLMHVlUFY1WlliWEdzaGpoTlNP?=
 =?utf-8?B?YS9NTmJxVXczT3VtTExNeXJyRlpzR1hjWVhDUW5xUXJOa0V1WDRpQ3lidFNQ?=
 =?utf-8?B?ckVtQU4yRlRXTi9XNEJtTTlPVnFNRmdCWVNISEZkaTdlWUNhbTlVMkR0djhM?=
 =?utf-8?B?ZmVXb3pPVU5oazM4Njd5MmRuQXY3NUpYTmtkZDdBaGVsaDBzYWxGQUFsdmJ3?=
 =?utf-8?Q?VCF1yKDqAe+8JlAL3kslfhVzv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49d6291c-6db2-4bf9-9198-08dcdd42eb4c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 09:17:46.8530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Bg/dhetSnGwOe1CIo9zoKQtmBT4rumXvw2q3brw/Kr0WENaHyNkq74mjqm22sAyKSK7Y+7MfXi453Hr/Rc3Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7593
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



On 9/20/2024 3:32 AM, Rodrigo Vivi wrote:
> On Thu, Sep 19, 2024 at 09:35:48PM +0300, Ville Syrjälä wrote:
>> On Thu, Sep 19, 2024 at 12:59:50PM -0400, Rodrigo Vivi wrote:
>>> From: Bommithi Sakeena <bommithi.sakeena@intel.com>
>>>
>>> Function toggle_gt_c6 has while loop iterating for (NUM_REPS +1)
>>> times. Correct it to iterate to NUM_REPS times.
>>>
>>> Signed-off-by: Bommithi Sakeena <bommithi.sakeena@intel.com>
>>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>   tests/intel/xe_pm_residency.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
>>> index 0e687558b..f4d05889c 100644
>>> --- a/tests/intel/xe_pm_residency.c
>>> +++ b/tests/intel/xe_pm_residency.c
>>> @@ -297,7 +297,7 @@ static void toggle_gt_c6(int fd, int n)
>>>   
>>>   		if (n == NUM_REPS)
>>>   			measure_power(&gpu, &gt_c6_power);
>>> -	} while (n--);
>>> +	} while (--n);
>>
>> Why isn't that just a canonical for loop?
> 
> I honestly asked me the same question when Sakeena showed me this.
> If it was in kernel I would had requested the for loop.
> but given while is used in more places in IGT I liked the small
> patch as possible here.

This can be converted into for loop. There was no specific reason to use 
while.

Thank you for the fix. This patch however looks good to me

Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> 
>>
>>>   
>>>   	igt_power_close(&gpu);
>>>   	igt_info("GPU consumed %fmW in GT C6 and %fmW in GT C0\n", gt_c6_power, gt_c0_power);
>>> -- 
>>> 2.46.0
>>
>> -- 
>> Ville Syrjälä
>> Intel
