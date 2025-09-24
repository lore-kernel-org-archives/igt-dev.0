Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4698ACAC5A5
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 08:22:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C943E10E6B0;
	Wed, 24 Sep 2025 08:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ktIL2uuK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E6F10E6B0
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 08:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758702135; x=1790238135;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rXr/oiGqrAzj0AUVch38H12YXPIyrMrutgZrJFmmwC0=;
 b=ktIL2uuKw4nj/mMmKYblbrzl2iT2+7/76X5hbLoat/35n8bA70xp/Y/b
 sSPxMFCsDWPWRicrHwueuAbpJJCvW0a+/DIS76M6vzzpbrirzJBgXM41n
 eelKlHAqbNmmQ37+qGevkQwCuegd/3DgMKJaFb5XewfmperMDCDwLOuM3
 wMiNXSRzgECVr1QlgRTtbrtt28mNnnGQsdIvJk37SZlRNPgzDv2Q3q2Wn
 JLRsx0AneO8SwBU8qJVEca0x3+P0juIbsio2VVkFLEgANqGKjYleSaUTA
 pFWqyHqdc696+yGTpgcYaRaHi0zdlI0kHZvf4T7To9zUtaSx1TaPUNmE+ w==;
X-CSE-ConnectionGUID: x199ALU0SjKyRNRiZ/HNvg==
X-CSE-MsgGUID: uZGY1/spRkuNFY+cSz6sZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60033612"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="60033612"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 01:22:15 -0700
X-CSE-ConnectionGUID: phAFZMRuSIq4TTb8ldHPGA==
X-CSE-MsgGUID: wWI4CJbcRcOTCHq/+KqfNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="176559532"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 01:22:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 01:22:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 01:22:13 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 01:22:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIoTRpcm0+F9BdxxiMqA8YrpbX+4czlMZrf/+xeLoTp6y8NLwgMwVZF/a0pFL9DhBn/E/zkH07LvtWT6PYTfXpMSixIVaRhqzixIbAZH8w+b/weL83+bLxN/7ZgViY0LiH5xqCXN4JVZ5a4frVuK3/2vnK8kjcptY3jPcVWam5jih7Ef3CCJZKwNCj9tsAx6ARXSANNtspBvnt2ayQZrsG85I1B5Bf4NhNvkAOCHB/cFZBKN3jiW8SZnViDVcX3w0XCYNOexSak8L2nO+zrjSXDXKfQpgnc2tpiMLnRZuac1PZSAbf38VDlGUjZjzTg2SEBVxestOO/+S7N/TRJYpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NrS7Lh/RJRknmNkk0OT9py05u/uv5LgHQvVxkLWIF10=;
 b=y1yZWqGdTxlDO8gnAMvaulk/LFjWCvzLwNFxHjmd74yYDySUbhsYeOIAlGFAL/il+d9msBvqXnPHju6swWE6uhOVOwuALIy2uE9VOr96LuGDII3bfgUmFUDsqQfEqK2XyYxxhuUPxzQfzho5mBI37uDsAzRSbyU+n5rn8GOknkpIXBxVUf1axd3f4yYOTWl7Yv632EPagvR/mfSRfQh4TxF0Caeg7Kx0+TvZo825no4I5Mxnm/dTIhzqsTLbdf+YtVCBy14etQod6NysgC6GF418GTTmjQWxrNUjOGlfzyFL+eFiQPyoex4PH2uPX2eLu87zONtiOT60iiWQxmdjjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM4PR11MB6357.namprd11.prod.outlook.com (2603:10b6:8:b5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Wed, 24 Sep
 2025 08:22:12 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 08:22:12 +0000
Message-ID: <5b5b8ddf-e395-40e7-aaa1-0a8c731c40df@intel.com>
Date: Wed, 24 Sep 2025 13:52:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_pmu: Set min frequency to RPn to stabilize
 frequency
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>
References: <20250922175439.2027292-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250922175439.2027292-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0022.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::34) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM4PR11MB6357:EE_
X-MS-Office365-Filtering-Correlation-Id: c8b4556c-d683-4438-b024-08ddfb4375d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2x5Q1BMQkZPUjRwOTFPVVZtYS91bE5EUnlDTTNaV0hiZEVFU2l6aTIrQTRl?=
 =?utf-8?B?NHg3MEN4YmNyUVd0WlRhZHY0ZEdSN0hUOWp0SEFhc3ZJU3ZoUkF5Ti9zdGNY?=
 =?utf-8?B?RTI3YUovdExHT0VjbEdUenpXcEJNTm16MFFzSFgvVy92NFAxekRnK0VTWEhi?=
 =?utf-8?B?ZlNLRHFhekVKcjVEYnBZTlRHSmtNdHpnN3cwR2VqOVF4NTNMMVMvQmR1cjg4?=
 =?utf-8?B?U0t5dThNRFYyWnRnN3JRVGZLSGdEVVpoYzZTbXcrclZFOEJOZ1VSS1J1cnNU?=
 =?utf-8?B?bGxIS2hDMnZzT050dXJEQkJvMWdWbGMyUnpOc0VWUlhwMHdiQzAvaS9mSGc1?=
 =?utf-8?B?d3dScUg1K2FTUjJTbXp6ZFRNeDl3M1dKZjhacTNqUTNDa2JVYzFqTnNiVFgv?=
 =?utf-8?B?TFV1TXhna3QzbXYyS1hWb2txd0JiVG83bzhJQlNUeTZ1N280QjRpNlVka08x?=
 =?utf-8?B?STdYNkNJMmtsUkxpVlIyLzdyKzVwcXV2QmJ6UURwcGFneXFwUlh3Y1ErOG9R?=
 =?utf-8?B?VjQrRFNvdHUyZzRaY293R2NDcGd3a0VLTkh6ODlzRHBrZUJYWFBzMytrVGtI?=
 =?utf-8?B?NkRiVTZUeGV6UGxNZW1HS1dna01WM2NueXpqeE90YzJKK3dDdWgzOGQ1bTQ3?=
 =?utf-8?B?Ynp4U2tLN2dSYUVCckF2WnJYMU40N0V2YWREVHdWQ3FpNWFLWS9MV2FoajFx?=
 =?utf-8?B?aDF0Z3h4b2d1SEJuNTBjMWNZODVKNUtqbkZSc2l6SW8xYXh2ZnVWK0dhdGJF?=
 =?utf-8?B?Y0pEMGhIazRVVVB4MmdkUXdiamhFeTJTZDNqZnhXUGZ4ZmhKM2ZQamtWaEd0?=
 =?utf-8?B?UkRsQkY1L3JRT3lsZ3daTkRCbWFmSExjWnpIVUdhS3VDdVJyVmgxN3lwak0z?=
 =?utf-8?B?cFRTSmJubW1jV0QzdklTTUhmT2kvbUdjTlp1OEliSW9JdURPUEpLd2VWcHBs?=
 =?utf-8?B?K0NhZ1dBR2hpQWRJQVB4VlJuUExIM2dqbVk4MkdIdURCK3k4QnR6ZnorQTRQ?=
 =?utf-8?B?WWdoS1lVNVJkanJyZkNmMGVrUUdwWW5SMlF2RzlnVnFodmVhVXB1UDFJelQ1?=
 =?utf-8?B?ZHBPRjhYamxybmRxZ3FSRitIUTNRK2ZuSy9OdStZY2RKL3dnSzZsekNPZ1NS?=
 =?utf-8?B?TzZQYVJwUy9QQ0wxeThWWEJZL01EVWRQaXNWSVlvMnVHcUZkRHpXZjFway81?=
 =?utf-8?B?d2Z0ekVIbUpTTDhrNlg1Y2htN2U2UDlXaWhOK0pERXowajhDeEZ5OWsyRzVi?=
 =?utf-8?B?cWM1NnhtYldPSDhzNWdWRWZ0QmtoWmVuUlYyTGVmdjBMZzdHcldJb3F1djhB?=
 =?utf-8?B?em5QUmF1NmQ1UnY3NGlxUXpjUzNEUXFKaEg0WHRCWjFGd2N2L2VxeWZZaDdU?=
 =?utf-8?B?cWdLSWhUNkZTaUdMYnFSM0lZOWRMY0x6SHFGS0pqcmVMU2M3MEoxRTJ4ZVBJ?=
 =?utf-8?B?SmZFdEFhTy9mMEtyTGkyWmV4UWh2RHJhWXV4NW1yTjg1R2RtRjNqYjBGWGlU?=
 =?utf-8?B?VFN5VUNNc0tMOS9menY2VGVsL3Z3eWthNkdGZDI4dXY3bERVMTdqbmkra1Yx?=
 =?utf-8?B?VDYvZWJ0MDdKcHhBSlNnaDdVTTQ3UUN0Wk93cm54K08vN0NZNzFwcytJOFRy?=
 =?utf-8?B?Zjh0L212Q0d5WjJBTzNIN21JcDhoc01PUVNtd2dFWHdoWGhZaWEzcEc2ck1D?=
 =?utf-8?B?cnJlRXNYTG5mYkZNL0pWZkxvaUtDRDQ5eVdmSjVUeDB0RHZPQ1J3K3YyU0ND?=
 =?utf-8?B?VGVDbmlkaWpUa2ZhLzJRWEl2SmlpVlBTUUNTZHdjOGpLL1lHTUdpQlVGUmdK?=
 =?utf-8?B?dmhNMEZHeTZXUzlUMjBEVkJjYzBKS1N5cXdEVUFPZ3B1NUF4akcrWXVDSGpU?=
 =?utf-8?B?T2FNamlZbTlWMUdyZG0rSzBrdjZLL1RIRFBXUDRCeVh0azNSZ2d0WDRSOVcr?=
 =?utf-8?Q?Y3Z7g4JuZww=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjEwYVk5TEVHL09oS3pPaThmeWE0MHk2dlQxaS9RRnRrWDVyQlgrZkY5UC9K?=
 =?utf-8?B?am9qZ1dISjV6bnZjdEU4ZE5MaFVuYWIyQ3E0bFRodGE0TU5sS3grMjlGVGpW?=
 =?utf-8?B?ZElzd2NrQjNNY1NUTjFvOHIvRi9MS3o1bXgvMTNpV2RHTFZHMTlsYUxveHBQ?=
 =?utf-8?B?ZG90YTdCVkFkdDJNUW9ycFIydGV4Y0Zlb3lDd0QvK0lKTXlKN1A3WGpwWGdX?=
 =?utf-8?B?TDhsMi9uRW4xNm5WWklFSGJPQmlpanh3QmZIUWtBSlpZK2NLWlBvdkFIejAv?=
 =?utf-8?B?VGZBYUp4ZDN2STAvMERYZm5menVBY3NoMXZnbExqTldXUmVFSUIxQ1F2QlNh?=
 =?utf-8?B?em9rSXowZTRIUWZsbGlXeFlqc1FiRHZzWldrQURrK2ROVWlpK0ZOaS8vVmdn?=
 =?utf-8?B?TS9xMmdnOXFUbVo3YWZHV2pPdEpkWndFUXdDVmYvRXBUZ2RaOUtFaThZT2hr?=
 =?utf-8?B?VjJwWExINmcraFVmYWtrK0JhaE5WZHVTN2ZPZExKcEZFRllrWlFzMFRHMnAr?=
 =?utf-8?B?UG53ODA4QVlCc0NVSFRmczFGcXIyendUZUI0aW1jdUwyNE9tZmtYTE5zVEIr?=
 =?utf-8?B?YjlxOTJ6dWhoa1QzRmdUbHh5QnljV1ltSFlqM05pRzR2U25HV3dBUXNZK243?=
 =?utf-8?B?WU1pazZKQUJibUZZRHdrT3YwbXJpalVXcEhJaGhOTGNSUUt6Zm4zSVhnTE85?=
 =?utf-8?B?cE5MaE1DVUVsK3UvY3d4TThrK0RxWm5aL1JpQ25aUWgwL0g5Z2psVUo0NVNO?=
 =?utf-8?B?T1c3TndBcDA4Tk1PQWZTS2F6L1BudTZVWENYZEVVWTJ4eFlDeU1aQ3EvajUw?=
 =?utf-8?B?c1drakJlVmVGY1NSblhlOHpLNWNEQlBVTEpEZXhJT3owYjlxQUpFc3VHdzZt?=
 =?utf-8?B?NkNvNUNXWVB3OFZQVHZNbG1GWXNCUGlUeUpBUUdqQlJ0L282TTJMWWtmVjdv?=
 =?utf-8?B?REFZTGJ3UDRjd0g4aEJKVVZ5WW9iOHc2alNMc0k0a1h1cEQrb2twMEZFbGpq?=
 =?utf-8?B?ZkZ4dGovNDBObFZjaEJmWjZXeTBBWGpWRGhKc2EwYThHajViU051cHJJTjRT?=
 =?utf-8?B?bjF0MElpQW5VVnk2aGllY2JWZjFsSk93Q0h0WThINjFsLzFJNFU1UGQzb0Y3?=
 =?utf-8?B?ZzR4ZmQ5VEhoOVZwMEZPTGkvWTZFbTgrUGs1MFUrdTJSRDF6eVRHeWY4U3gx?=
 =?utf-8?B?S0xDUnB0WFZ6R2FqQXFoVlpBSTFaR01QTHFSMUU3RVlLbHlaVEtlNnJSUVZz?=
 =?utf-8?B?dERtQlh3RWNxQmtRTUcrRTVIZmw2eElORkZDK3pOR0J1bm5QNFRIRG4xSkhr?=
 =?utf-8?B?TzMvYU42bW13TzdXMEtBZmlXWUZWR0l5d1Zhc0NsbWRvRGhyeXFxYldyWDBt?=
 =?utf-8?B?VTdYMnVQTGVLRnBGNDNTUmVOMkUyU2x6dURWSjZtdWFlaEc1SXNFYUxqTUdr?=
 =?utf-8?B?WWV1Rmdmc1Y1d3E1SmFjNVZlK2hQUW5pSm00ZHN6N1pKVCtMSVYydXhkOGd2?=
 =?utf-8?B?aFVDdzM3SjlJT2l6MDJyTGt5VVl4NGhka28ySHRLR2taVkdudkQ4ZTVmVEp5?=
 =?utf-8?B?VGZaUndxZDNCMzQxNE45cXlCKzh4MzFxT3NmWGlxcm9ZSmsveHp3ZkJqQnZJ?=
 =?utf-8?B?NE0rSGNvVlBvUUxkNkEwYzY3cUFValR3TGdUaXJmNE9Qa1N2bU5kVDBkNW1G?=
 =?utf-8?B?SGViaWlaTVdWU0VmRXRreTcrV1k0aEVub0NaRHlieWRNMzRpanpJSk5FRmQ1?=
 =?utf-8?B?OXpPMkxLYi9uTkh1NTd0d0hhYU5SbjlueHdpQjhSNi9EakNTaXFOOG9vREd0?=
 =?utf-8?B?Vk00dmU1MXBzakhxYnZwdnhJWnFSUTgycUhmL0JRWm9IYmVlUnJ4UEVEVit4?=
 =?utf-8?B?WHRIVXh6aHdCVUVIanc2MUQvc25sS0lkQmtKVFdoS1VkSWp4cUNtTExKZGtq?=
 =?utf-8?B?K0ZoSDU3TXdkQURvenhJUXZTemlOVktJbys5MjZ1c3owWVdZdzR0N3lEbG12?=
 =?utf-8?B?em9SYWlMMjRDSDBLYkh1WHJBVlluZWdERk9hVkY3aGNpYzFaclFOM1VVSHdk?=
 =?utf-8?B?RjRhMEl6UGxjd3M0U0ovK2lXbUtMMGhoNEswcThVWktyYTVQUDBnbytETmls?=
 =?utf-8?Q?jDba87Gqj50vGcztRhmQn2TpV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8b4556c-d683-4438-b024-08ddfb4375d4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 08:22:12.0917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2NBzqkKd2r2oS3+/frdTpP01JlqC/6Zo1l2UI5DpPolqHj2WbQJNVDQ2y5mwUM7MOee9stcB1mG8y2vGbGCizQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6357
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


On 22-09-2025 23:24, Sk Anirban wrote:
> Set GPU min frequency to RPn to trigger GuC "ignore efficient frequency"
> parameter. This prevents GuC from elevating min_freq to RPe level when
> min_freq < RPe, eliminating frequency fluctuations during PMU testing
> and ensuring stable, accurate frequency measurements.
Add Closes: BUG link here.
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_pmu.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 0e5a7360f..1ad58f606 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -734,13 +734,21 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
>   	unsigned long config_rq_freq, config_act_freq;
>   	double min[2], max[2];
>   	uint32_t gt = eci->gt_id;
> -	uint32_t orig_min = xe_gt_get_freq(fd, eci->gt_id, "min");
> -	uint32_t orig_max = xe_gt_get_freq(fd, eci->gt_id, "max");
> +	uint32_t orig_min;
> +	uint32_t orig_max;
> +	uint32_t orig_rpn = xe_gt_get_freq(fd, eci->gt_id, "rpn");
>   	uint32_t current_min;
>   	uint32_t orig_rpe;
>   	uint32_t vm;
>   	int pmu_fd[2];
>   
> +	/*
> +	 * Set GPU min frequency to RPn to invoke ignore efficient frequency GuC param
> +	 */
> +	igt_assert(xe_gt_set_freq(fd, gt, "min", orig_rpn) > 0);
> +	orig_min = xe_gt_get_freq(fd, eci->gt_id, "min");

orig_min and orig_max are intended to save the current minimum and 
maximum frequency values so they can be restored after the test. With 
this change, you are overwriting the current minimum frequency with rpn, 
which will result in restoring an incorrect value.

Thanks,
Badal

> +	orig_max = xe_gt_get_freq(fd, eci->gt_id, "max");
> +
>   	config_rq_freq = get_event_config(gt, NULL, "gt-requested-frequency");
>   	pmu_fd[0] = open_group(fd, config_rq_freq, -1);
>   
