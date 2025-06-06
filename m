Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6632C61CE8
	for <igt-dev@archiver.kernel.org>; Fri,  6 Jun 2025 11:17:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5BA10E37A;
	Fri,  6 Jun 2025 11:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lT4hEugE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1278910E37A
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Jun 2025 11:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749208619; x=1780744619;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DNXrLFkcnQNI3RkMCautPp5Dr4T6CeROcEFv79sAQIw=;
 b=lT4hEugEwL+yqV4KmFDnBZmd5K/1rA9QRojxCQUj+F+GNHdinb+BnJ8r
 dkXbVVMauC+37JA6G0IyS1KqW1lWyFaP53WSoV4GcAAETrkTefbUyxnK7
 48PHZen9J1akSqc+pyclsNwrxobMOiySYRtbOhIXbX3+iyDTDdxYWcYO5
 KUeXWZXSGkk6B/ZI1Cj18NME8292c1P5++69kgqjBntCMeEAzJUxrBg7l
 TQn2IwXtgbHsPUs76ksUAkZNY3abd9CFGWIzeRHo4lBl+mIL4r5GZ+xyJ
 jBvkjNIYvwjnO7jAkdAACe5GtQYdL2vRnM58Mcail2kKBuVEmQLm4DYN9 w==;
X-CSE-ConnectionGUID: k/VfHxtsTum9MYaT/k1ZRQ==
X-CSE-MsgGUID: OvWr36k+Sl6MXDUYI2Mt+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51500993"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="51500993"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 04:16:58 -0700
X-CSE-ConnectionGUID: D3NFSB2TQIunu9yhv4NGUw==
X-CSE-MsgGUID: NX/koBlmRqK5L94gmSuQlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="176670861"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 04:16:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 04:16:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 04:16:57 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.75) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 04:16:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kasgQR4jcNosMhuoC5/50MHSqfowLm7mLCbE79r8LLI0zHj20TtCkTVYNlL1FcjY10aH2c3Yz1uMprgK2VaLaBY4enTytkdbqRwsSln8r8w6+ADKomcohezbOr9+o8XJh9aRQKvrQJkI+qnAcFfw7XTwtif2ZYczYU/D7ZHP702+gPz5ar/kPsW5hyKBf/dG1cGGbgkEAwI5hGXRqGK3WILqhtIa5b5lPZy0hqayUpy54Ze0vk+NPzIx06VChhde5Pp5CidKxC8f/lY1JVSp+UhCOlaf/OroVFXne0h66WdU1c6a8UtXsjDTKkxruywZhJnyCNJ3TkwDCfDrE5qReg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNfssA9Nj7fu6xdvD/wl2GC/fjCwo6Hs94HV5ywIaWo=;
 b=V680GSih29eu/UcUBMZVUzhw+D3gFBLmhF7avlCj4PkZq1oxzEZF4HtOhAs3A4OsRqz57+6IfiuXfnw4FlmsBnJE7Me7qBq7u07aNVT762ARHD2xb8rI0i7JQg5G+rtbjVijZHd4RwDkpk7d9ND4U7xyJCvK0Z3f9YA6RifreQnpZtAUvUwhe9KYvR51Gn6LVm63s8nc9G6lCVjFFEcmtrezAWjQrB5xvLrWZ2aEzcSE7VmXx9Y7WYLuewm6O2AXuTCyUHYBfgIRX/NRZV1jTTJZSv8dRdvGu/DoSG6NrBmgLYyMTAbrL109HhuNThrqzR0Htugih6wRlo/ubkztSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB6401.namprd11.prod.outlook.com (2603:10b6:510:1fb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 11:16:53 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8813.018; Fri, 6 Jun 2025
 11:16:52 +0000
Message-ID: <cc9db6af-4bca-40a8-b19f-3e972acf5f6a@intel.com>
Date: Fri, 6 Jun 2025 16:46:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] tests/intel/xe_configfs: Test engines_allowed
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250602-engines-allowed-v2-0-52bffe717766@intel.com>
 <20250602-engines-allowed-v2-2-52bffe717766@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250602-engines-allowed-v2-2-52bffe717766@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB6401:EE_
X-MS-Office365-Filtering-Correlation-Id: 33463181-37d7-466e-ac94-08dda4eba393
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGdQWWlOMlNXQzB2dXNkcTVINnFRRFFyQzJxSDNDYU9mWlBtRmhzb28xbEFZ?=
 =?utf-8?B?Q3VCeDF5dFpKU09RalM0WTFkR0tadEpDUndjMDlqazFxM1RXMjcwN0NZZ0Rz?=
 =?utf-8?B?enQvYjJmM21kYjAvcEwrb0VKcW9mMnowUEc1ZUh3RlB0ZDJiK3Z0NnhpanJN?=
 =?utf-8?B?Vnc1RE9KL0xXYUlUUFRzVExWemFiYkRMNVFIcWtTSHE3R3A2am51VWdUWDJI?=
 =?utf-8?B?S05jZytvM0hJR2VHSCs2a0x1UEVTNHJielFQNFRseDZ4N2VxTWRHU05UQ2E3?=
 =?utf-8?B?aWV4NXR3UkRMSzdwRHRueno4VjQ2R3VrRUhuM09PdlVkVWg5OERkSFdKTnEz?=
 =?utf-8?B?UTRDZHpUQitubEkwT21uTVpDblNOeFpSRm8vNlFWYTV0RXYrQkdjd1hSSGhP?=
 =?utf-8?B?SFJ4NEpGNmtpbFk3bWhQRVI5ZER3Skx3OXJWUFZiQnUwaUZoZ1Q2bjg1VTB3?=
 =?utf-8?B?ay9XcENES1R3MEZqL0NPVndLWkVwZXRSMDJsbnJOSEdjdFU4Mm1KK0xHODZr?=
 =?utf-8?B?eEpad2tqZUt6aE84d0dsODBnSjJqOExCUThtZ3NxNVdUWXEwSUJqeG85N2Z2?=
 =?utf-8?B?ZzZBQjl4dEZNSUdWa3N3ekNCODZpUUtlRGhZb3FHdmhwbElDU3p4QlVDRzln?=
 =?utf-8?B?Zk1JWjZtdXROV25EQTlzcy9sRitTdUlQL2ZVa0E0Qjg4MjNsSlgwRUIvUVR6?=
 =?utf-8?B?ODM5amdyMi9MWUZPMnFSOVBuaXMzVU9DYVdQVUJYYzZLTUpETnlLaTBMRjJJ?=
 =?utf-8?B?R3MyUVQ0c2ZYM3FzOGNidGlPSzREMTlFV3NkS05qQ1ZnOGJGb3VDbVlxSjI0?=
 =?utf-8?B?WHRKdjFSVUFjTDNtRTVmQi9yZDE4MTBJR2VMYVpQeVRqZktmU0swL1BUM1ZB?=
 =?utf-8?B?bFY4blduYVR5Zjdkd3gvTVYrc2huN0Z0OUxCc0hnaGdpU3hGRitreWhkVmdz?=
 =?utf-8?B?cGFPVzNuN3NrM3ZlRExGUEh3ZXV4UVZhNXVwZXNucWg3VUY3L1ZLTzNvaVBq?=
 =?utf-8?B?SEZNVDViUS8yalVSSDVDNTcvTkhJTEZGM0JPMUFRQnNOdWEyUjdXVmdhK2Qr?=
 =?utf-8?B?NGtvOVRvSW4zZVJ2SEpzZXg1QnZEUW9BcUs0bHZ1akFjbnRtTGpkZk9wVWZy?=
 =?utf-8?B?YjhyQWJiMktSVGM5U2djTStGRGowVDEvaEtkZmY0UTJ1VXZtS3JlUUJnb1RF?=
 =?utf-8?B?SStZQ25wNkVDQWtxdmxoVUpZU0IyS0E1WlRwUEl6aC9lMTExeEFTZEVuVXVF?=
 =?utf-8?B?UzBLVWxBbmZoVlQwRkhtUzFrcGc5M2Y2SDNzNkVrNkNsbTN6QVN6NkZxV2Jn?=
 =?utf-8?B?YkNMYm01cndWZXFmZ2ZhYnpVcmNzajZYakZ5T1NyanFqUE9xaUlFQU1WWmJI?=
 =?utf-8?B?eFpXTzAxdTVPZVVsbS82UUFreTVpMkxoZDZoTXJrZU9zYmVYRzFCZmVqYjZN?=
 =?utf-8?B?NXBMQTg5c0lqNWEvTVU4V09lQWxDVlg2V1RzU2UzRWNFeTBBTnZjM2haMWpX?=
 =?utf-8?B?Z014WXFGWVJ1K3NZN1B3OXRKcFhCMy9yR21UNHRCYVAyY2xlUWl0Rk9KV0ty?=
 =?utf-8?B?MVJGRUV5bHhXNVZxTXRrR2V1VlpuNFA0SmpqbzQ5cGlOQUJEMlk2MXIxRjI2?=
 =?utf-8?B?enFmYXBpSnBOQWpUaGx6dkV0VEI0akdXTW4yU05oQVNjci9haUhhbXNydFln?=
 =?utf-8?B?TEpwQmJDYjJOMUYzL2lqL2I3MzMxZW1mVGN6OWVHZDV2QStIMytreElhNnpR?=
 =?utf-8?B?dDYvUFpsYTdIYURMNW9KMkRFOWlQVFRVRHJpTEVIMUd3a21xU1BnTENrNnRN?=
 =?utf-8?B?MmJZUy8wdmVuK2RzSFdJNTF0U29PWC9uUzIxSE5MVmdMS3VsaWJrM0JvTExO?=
 =?utf-8?B?T0NLaVdtclUrZ3JRWGR0NTVBR2xQaFY4a092ZG9uNWMzNXBFRW5kT2NJUlc0?=
 =?utf-8?Q?O1/79zlYlJY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elMrZ20ybUQ4aEt5RldwTmIyZmVhWGprcG56WGtkcHpYTjNWaFQ0Rktpb3Bp?=
 =?utf-8?B?aDlFTGszOURLTHYxektFd2lnMjNnZEpiM3lFYUhzTDdJQ3NiY1FCR0VvQnlk?=
 =?utf-8?B?VkhhOHFwOFhjak9hTW1MU0lQc3dyWHBSZkMzVS9hb08vWDBUVUlGVTJVMHNG?=
 =?utf-8?B?ZGFENGN1L2I2a1l6anp2eTFPMjF3WmVMcnk2a1RyelJNSnd2WXhQZXRGY2dy?=
 =?utf-8?B?NlNZVmlNYS9KdzEyempITGlkNjE4ekFSRFJzNmNzcXVWZi8wUU5YZzg4QTFF?=
 =?utf-8?B?azBmTVVaL1hIUnFTV3Q2blBoRGRoWk0zU1d1b2dWN2MzcVBycytLc1Q5bFBu?=
 =?utf-8?B?QmQ2WkxvZDg3VnBHMGlrME9wY0NPeThFZi9LRHZBN1F3cmxMcXl5Q1dwVlI5?=
 =?utf-8?B?MTR0YktEN0hWYU9taUFIQ3AvejdTaE5HMExINUowMFRKSWkzN1lYaDJGNi9p?=
 =?utf-8?B?NnMzUVVqdUd3OUxwNGkvaGtsSTVSbkxQMyt0UlVpVEtCd0NIZFAxK1pmb2JB?=
 =?utf-8?B?NU56d1VKLy8vWUhTeXViVDFuaVRHWTVTbFZWdFdXcCs2MGsrS0VaaHlDM2xD?=
 =?utf-8?B?OFZHc2t6VWR1WDhERzc1eThsQlUwWi9uMGRpWDR1UTVKeE10Q0s5Njh3bzFE?=
 =?utf-8?B?VmljTWcvc0N2VTVOaGlwL2tBc3RsTDMxd3JqMk1lTmlVSkJleUFsUG0wWUk4?=
 =?utf-8?B?NkFPeHFYcFhzOHRFQ1NiYzMyMFV2V2RuY3VUbFRycEtVa053YWpLdDNZY2cy?=
 =?utf-8?B?R0JUYktGcmZ0TmZlcy9rMjlreDdyc3RjM2NYYVBDZ0hIUnV4aVhucVBNeFRq?=
 =?utf-8?B?aXRLTE8zSFM2OTBGYUhUMTZ4bUcyaWZhdFVSYlJpRnVEMWpsRWJsV0kxN005?=
 =?utf-8?B?T2VSdzNnb0VNdTZ1NTIzWTNjalgrcjY5WHNYWDYxeFpaajlBSkJNK1JLWkd4?=
 =?utf-8?B?dXl4WmxEbUdpM3IvOU83ZFNDYjEvb1FFUHV3Y1JUYWEwaWZjS3JySEVaM3Ni?=
 =?utf-8?B?d1NXUklERnNrT1daMWcvMk1JcGJYMTF3SFJDV0JheEdjWWNKYTdJSVBCMWNq?=
 =?utf-8?B?NTlUd09FQzlWaDVTbDVueTR2cjcxZnhoUkQ3L056bGdFcG13Um5zeUJTQXMv?=
 =?utf-8?B?RDJEQ1VxRnljeTdiUnFIc1lYT1liM2xvb05JK0cxcll3dmRaRktHRHAzVHhu?=
 =?utf-8?B?WWpDNkJNSVIraEJYMklEaWhHQzE2UG9rdC83b21qZmJDT0V0d000YWIxdE9r?=
 =?utf-8?B?cERZQkVYYmRnZ1RSUzZXTjlRcncyUXNGUFVQT3RkTzZjajJnNGZQYk9EM3J2?=
 =?utf-8?B?UGJRTXc1VFUxYmtIUVp5MGtCT1QycEJmT1NTZDQ4R24zR3ZsNWN0VC9DZVcx?=
 =?utf-8?B?L0NhOU5zUEdWemt2MDJXRVdqT3Y5M2w3WHpIaWttY3pVVEhjSlhZWVAxNjds?=
 =?utf-8?B?WkZMS2Fjd242NzN6b2svSC95bnhFMXdMcUZYdEEzcWVZUWMyWnVSeHNuMyto?=
 =?utf-8?B?SGF3UlpybHRPWWJZSFVDcDEvOTNnNm5scnBRS29NTk1xeWNLS2xMSW4vU2N0?=
 =?utf-8?B?MXRibVAyMVpZUTRKZUsxcHE5ZjVUUmljOS9id2JJRmR1dFNSb3NiSlB1b2pp?=
 =?utf-8?B?dkU3T1dFb1FwUHZlSVdPRkdWQ1RSa3NZNUNUR0pxWnU2cmlwNUlCZllKYXJ6?=
 =?utf-8?B?U0IxTitxK2pUUEJVamNJVTM2ZW54NjVJR3lXcit3NUV3akdoQ3h4ZXNFMmRE?=
 =?utf-8?B?dHd3emN4bzQrQWJuNEJQOUZORzltd0hVSGp3OEMyZ1laaEhmSko0ejk1elV3?=
 =?utf-8?B?U1Z0aG5HMlNUV014U2J4UjNoUmJWYmdVSTQzcFp3aWRGbmF3cjEyTHhGMlRK?=
 =?utf-8?B?ZVJvaVhVbmJVZUlNM0d4VXJTdnE4eEdJa3ZLV3hCbFJiSTdHTHg2NnRsNENw?=
 =?utf-8?B?S2dOVjV5U213aGxBVGwrR1FYekZUVDVpQlpRaW9oM09ZYmozcCs3L2VZWWZp?=
 =?utf-8?B?UFJ5ZUdNNVNkM1lsZVQ5MVVzY3puWUVCWGsvU2hDcGx1SWJ0bXRIUkR4WGQ0?=
 =?utf-8?B?ZDlHTTl4RER5YjNoK3kzVFVyMzJ4NHJ5RlYwNGllYTBYNnRQWHk2VXdLUmg0?=
 =?utf-8?Q?o0GHa9Rd3rtyDKC8qz8N9XqkY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33463181-37d7-466e-ac94-08dda4eba393
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 11:16:52.8693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/X5NMx2aNBMOXRlxpqcURXnjnkfMeM7ves6MAxxKq+Ns0gHZfYUzVVtE3ueyutwf/zDkKpfPFA86kGRMyUscg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6401
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

Hi Lucas

On 6/2/2025 9:54 PM, Lucas De Marchi wrote:
> Add tests for the parsing of engines_allowed configfs. This doesn't try
> to bind the driver and ensure only those engines are available. That's
> because the engine uapi instance doesn't necessarily match what is used
> for configfs configuration. Maybe we will need an engine map in debugfs
> for covering that.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   tests/intel/xe_configfs.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 56 insertions(+)
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 074cd04d9..e4fffd0b9 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -10,6 +10,7 @@
>   #include "igt_fs.h"
>   #include "igt_kmod.h"
>   #include "igt_sysfs.h"
> +#include "xe/xe_query.h"
>   
>   /**
>    * TEST: Check configfs userspace API
> @@ -54,6 +55,49 @@ static void test_survivability_mode(int configfs_device_fd)
>   	close(fd);
>   }
>   
> +/**
> + * SUBTEST: engines-allowed-invalid
> + * Description: Validate engines_allowed attribute for invalid values
> + */
> +static void test_engines_allowed_invalid(int configfs_device_fd)
> +{
> +	static const char *values[] = {
> +		"xcs0",
> +		"abcsdcs0",
> +		"rcs0,abcsdcs0",
> +		"rcs9",
> +		"rcs10",
> +		"rcs0asdf",
> +	};
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
> +		const char *v = values[i];
> +
> +		igt_debug("Writing '%s' to engines_allowed\n", v);
> +		igt_assert(!igt_sysfs_set(configfs_device_fd, "engines_allowed", v));
> +	}
> +}
> +
> +/**
> + * SUBTEST: engines-allowed
> + * Description: Validate engines_allowed attribute
> + */
> +static void test_engines_allowed(int configfs_device_fd)
> +{
> +	static const char *values[] = {
> +		"rcs0", "rcs*", "rcs0,bcs0", "bcs0,rcs0",
> +		"bcs0\nrcs0", "bcs0\nrcs0\n",
> +		"rcs000",
> +	};
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
> +		const char *v = values[i];
> +
> +		igt_debug("Writing '%s' to engines_allowed\n", v);
> +		igt_assert(igt_sysfs_set(configfs_device_fd, "engines_allowed", v));
> +	}
> +}
> +
>   static int create_device_configfs_group(int configfs_fd, int fd)
>   {
>   	int configfs_device_fd;
> @@ -88,6 +132,18 @@ igt_main
>   		test_survivability_mode(configfs_device_fd);
>   	}
>   
> +	igt_describe("Validate engines_allowed with invalid options");
> +	igt_subtest("engines-allowed-invalid") {
> +		igt_install_exit_handler(restore);

Exit handler can be common in the fixture if it's needed by all tests

Otherwise, Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> +		test_engines_allowed_invalid(configfs_device_fd);
> +	}
> +
> +	igt_describe("Validate engines_allowed");
> +	igt_subtest("engines-allowed") {
> +		igt_install_exit_handler(restore);
> +		test_engines_allowed(configfs_device_fd);
> +	}
> +
>   	igt_fixture {
>   		igt_fs_remove_dir(configfs_fd, bus_addr);
>   		close(configfs_device_fd);
> 

