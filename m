Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1A9C5321D
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 18:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0308910E137;
	Mon, 26 Aug 2024 18:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ldAaJHwn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B4D10E137
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 18:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724697436; x=1756233436;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KGBCUHXIWMA9z+DfGcCF2xsUrXb1OCb7aBArfcIhvcA=;
 b=ldAaJHwnbRk9JCa44xExDmzyt4xEtn7quJuwgjQc4K5PPLr1vl7thLIk
 iUSEf6qzERBK7nqK+FfuBaEIduq31CQLtxEUnliiZ1OTOumYhPbxSMk0T
 PHSvD4wWXmMskmsbiVKoFNtYiumIs817bY1xPJi3f3d8n/IgfIU2N9MzH
 DVcvj6+RuQiZGlmMJDDGqsBDB/KcSS1MWoc2T4GeLhBn1asHr6z/b43d2
 4STCAp8fv9FMWbz+/Qx5U2KNPezkQP0HWyBsSFdDMbrMSyKzBfoO3MC2s
 F/zHRp7ScT0kF9Z6nXaQLnElsNodyul0kf7+FZTOOF3L/a9hUg8YmU7BI Q==;
X-CSE-ConnectionGUID: 4zo8cXc5QHuiqhDXuCPtCQ==
X-CSE-MsgGUID: fdHZz8CmTRCJqeEN99yySg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="13219698"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="13219698"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 11:37:10 -0700
X-CSE-ConnectionGUID: drQm7nRfQ0SCBJ5HhBkBkw==
X-CSE-MsgGUID: e8oarKdORKC4dxyLUypr7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="85794884"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 11:37:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 11:37:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 11:37:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 11:37:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 11:37:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVNZ0gcwKX7hJfQAF+iEkYpcz0w8OMDlPANx+b216fUZFBVvK9yaPoNG3X9dvuzVKqkXuRj5DEl8TMG8vTxFQZNwwEF4W9eKd2z3sA1syInobRUfQ5ykyTico73PYsDq4EDbc/aHWyjsi3m+8XZoyY19HfY91DFv4uJUfwlZjUJXTLuqdSdwXfHXRviQ2OsmibpgJrqKg3Vgy/+fx+p6rOibn42iymGumnvC/OimHdLhmO4By0VJPxKNqUftpj0S/+pZhDEMFIvJQNutLEvG12fH/MF0MgruhL7PWjGP4fb697iIqvWTDRCypJuhq7tsa2TwlvZsTzrTmrIJAMgrnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBm6XTf9UQAhyF7EHAJx/JWHwJzS3nlazMupuJN4HtY=;
 b=k3pvQO2zf4udA9cz23elKO/V5U3fvXyeMYAZAonwKNxk4Pe6KsDVx14aMMWyL1j9weVT8bk6Ocve+HzrDSOfNCqBYujDPRzheZMoBaQW/ntWP7bQNbxaggv6+5bTPrsVLd/4nywXwcGMMvoA9+eT00iRou3as5TYhv/GmHEBjJArz8BVJAfqvtZ+HRQ4bcWVibhSZqTuxYr6Sp469ZZPni7OD1b/f7Lv81U5FoiIXMPlU0CNizLr8W4VfyduURlUv8myo0T65B5WIwlKqW4gsRRIgmK2s+RhwHiH7nSXCqVGBGLW0ou+SY8zAHZ6tWkxOvhlnNEHT3B9gFtmI916Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CY5PR11MB6463.namprd11.prod.outlook.com (2603:10b6:930:31::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 26 Aug
 2024 18:37:04 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 18:37:04 +0000
Message-ID: <856d27dc-886e-4ee5-96f6-984ba90254c5@intel.com>
Date: Mon, 26 Aug 2024 11:37:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 6/6] tools/intel-gfx-fw-info: Add proper HuC
 parser
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Gustavo Sousa <gustavo.sousa@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20240826152656.1306490-1-lucas.demarchi@intel.com>
 <20240826152656.1306490-7-lucas.demarchi@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20240826152656.1306490-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0342.namprd04.prod.outlook.com
 (2603:10b6:303:8a::17) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CY5PR11MB6463:EE_
X-MS-Office365-Filtering-Correlation-Id: 9781ee2b-29a9-42b6-2e6b-08dcc5fe14ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3c5Rkx0YWZVTUI0aTFRNytnZUpuK0NOdHVCWVFLS2Z3Sk93RGVManFSeDQ1?=
 =?utf-8?B?cFRFVXdhMHp6ZVdncVJ4bVIydEFpRDZXYmdabThPbHVDU29HNnorVENpdnpO?=
 =?utf-8?B?bXBtSTNqRTBTZlg2SU5IYmswbDAveXJ1VkNmL3FaT1ljaElZWFl0c09lSm40?=
 =?utf-8?B?U0I5L2xWc1ByVVpQVmRTbUlPdHNKRytVNCt3MXRORmRjcXl6OW1VQ2t3bjlK?=
 =?utf-8?B?TjhFNGtlcmJselV4TnNKNVdiOFAyYXhTY3dCdFlJTW1iOFJuRUZ4b0ZiYWU2?=
 =?utf-8?B?MFhGZHk3TnFOOTdLRjJvamlqQnR6S0JyaDdQaVZIUTQ5MFd4Y21ic3BuNm50?=
 =?utf-8?B?aW16dEM3L1J2WndzdnJpZ1ZHajNyVnh3cjNvSzRCcDU3aFR2enpnM2ZiMHAr?=
 =?utf-8?B?QTBvVW93VXgyK0tUTnQyMGJNL29oME96cVVteGZDRUJlL1FINStXSU5ucmJD?=
 =?utf-8?B?aGlpSm1haGRDMFc0SzdvS1hROEdLWnZEZ1hwRXE3Rmt3dlUzaTM0dDMwcWEz?=
 =?utf-8?B?NGJUT3NoWk9uN04xZXBOOTZhWUppMzk2NUVFMUd5QURxVDNOYlRLbDVBWjRa?=
 =?utf-8?B?ZldMN2R1ZCsxbnR4R2R6Y1RTcy96UWJ4dUlhd240bWR2VTBLYk9lQi9yb0hV?=
 =?utf-8?B?Y3liWkpzTkVNb05kOWMxeU9OZW5EY0xvdUZadjZ2TVhaNG42TUxyZ1hBZHdD?=
 =?utf-8?B?NElLMG14SUl3aERPeU13UzZwQzgyNG5iSEdZWUVZRm4zd0ZLSXVaNmVzM1I5?=
 =?utf-8?B?ZkVyUGJ2TnlFZ2dMTUIxN3M1UmlKYmloVGNlaTFac3hoWkRUM3J4SG9MZUN4?=
 =?utf-8?B?QjFkTWs1SXFNTWpZdDVPNmsxeGdsekZCU0IwSTJXZXJ0OWVBTitpd3lLUFVq?=
 =?utf-8?B?c2YvRGhaUjYrcldZb0dObGFXUWVuYjVGTG5KU2pXNFQvb0lGcXEyZUNIYzdO?=
 =?utf-8?B?Mm4rRnpGNEkvVWVqZVNBdFlnd3FEK1lZcXNIa2dxSEQyTHUyWm1TazNXV0R1?=
 =?utf-8?B?YXpCQ3J5VUZBOGJ0ODY5YVZnWk1pU0ovVm9jbjdiYURCMGpJeVJQZ3N6b1Jp?=
 =?utf-8?B?QXU4WlFCOVdacnpZOW5GeUxIWFgycnB3ZWVhaDQ5dnlFTGJEY04zUE9MMnZw?=
 =?utf-8?B?aXZlclA2YTVlZW9FMzg4RnprY1RQTXAxVHVCOUgwc2d2dFJrYklrOU5xTG11?=
 =?utf-8?B?YXZlTTJOVEVOWStoWDJOVTluc0V0UzV2NXdXbkIrNXV6YjB4SEJGZWVUT1pZ?=
 =?utf-8?B?TnR2ZU5STzlrU1JJdjlBd0F4OHZkOXNWSUp1YjkzQlR3SWsvTUN1YUtSWHph?=
 =?utf-8?B?ZTJGY3VzVG12cEorUVhRdDFGQ2VvL0RsTFFFZHpPVTExK3VqaVU5NmJHazhY?=
 =?utf-8?B?b0FxV09lbTUyR3JVVDlRMUtMNEh6aTlNWEFyZkExSXhnVkRwSFNKV0ZtY01W?=
 =?utf-8?B?eCtXQzhLdkluSGlYMUk2KzRkZHc0WU9BSlhWL1N0b1MxRi9GNmZ4UUhudWMy?=
 =?utf-8?B?WmZ6RklOQjhIa2tGczFCMk5VbWJ5M2tTKzhBQkVYblVJb2tHVUVEU2c4Kytn?=
 =?utf-8?B?di8zemVEUjc5alBNSEI3WEt0RE5NcUVoMkdBZlkrbTZXcWwyditFWFducFht?=
 =?utf-8?B?VTh2TkJqQnlrSWU4Qkk3NUlTeGdBdFc3aUtId3pPOFdCclBqY3RvbzZya0J4?=
 =?utf-8?B?Y1h4Q0sxbWJwMFc3UlB1NHcyUzFVcUdtdUxYVDdzZm5rMU0wd2xiWHFvTmdX?=
 =?utf-8?Q?e1bdZdXkz4KRoZ0Y4k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2lXcHVCeDdCWkJoaXNOSmhZUUJwSlluSzNkL3UzcUNDOCs2M0hOa0dwREpz?=
 =?utf-8?B?dVk5aEV2UTh0RXd2QkRYVElNdVlGQ1Qvek5KTXl3amM5NG1BaHlwSTd3OGFv?=
 =?utf-8?B?T0JYMWtIZTJHMVhoWHN2aG5yTnowMGR1WVBVMUg0VlBucW1FdkM1cnVlZitJ?=
 =?utf-8?B?N1BHQU5MTzBqWTVKQmlLZFFHVkJLbDJXSDN0cDF4Tmg2ektQSVpxd1JnUUNv?=
 =?utf-8?B?eXBYeFUwRU9ZZ0hWbGlOTEE3Nm1mU0FwQmpBY1FMRlA4S1RsUmpTaXVOSlFQ?=
 =?utf-8?B?ZHl6K3FBS3Q4WXl2aGZUbHJ0MEJUY3YxV2lqcmtyTDlDb01ZOEVIb1I4eTVW?=
 =?utf-8?B?M0diN01mYTZZaUxnbjJOdVJQSmlrZTIweWE5bmxQZGxFaWdRSWZuUEViN1BG?=
 =?utf-8?B?WVBqRG5sQXI0NEovRjBDQmJma2UxRU9sbEpINTJLa1dxSzNYbDNjVTZ6Yzdq?=
 =?utf-8?B?K2VZblRaL2lLVVhGbjI5SEF1VjRjdmJ4UmVCNTJXdUNDWUgrN1B6WnJyTjJl?=
 =?utf-8?B?SE4vRFhQcXd1RVJWODY5Kzc3NnUxWThUdjlNNVZqT1ZXWjJmNSs1YTdURmQv?=
 =?utf-8?B?dUZCL29zRCtLbjVMVVp0aGZ1MyswT2V1eWQ4NzlRWFlOWm0vR1Z4VlZYUHZO?=
 =?utf-8?B?ejY3VnZLc1pZc09wTEFjZGxuMHVKS2dEUXNMSFFDSnowOTk5cFdJNnlHL0dG?=
 =?utf-8?B?ZnpaRlJpL3paL1F2dXRRanlCbWFSclRLMmU3Q2lhZS9PMDg5WENNaGN6VjAy?=
 =?utf-8?B?cC9hNE5BR0tqMXBubTN3Z3dmSDMxL1JvTmkzZ0ZpY01GalNHMmFoYm8xWE9r?=
 =?utf-8?B?eDkxaUNGblRIcnZPbE5XU3ZmVlRmQ252YUwyZmMyUU5PNm0xdEk4cmdzaWhu?=
 =?utf-8?B?c1czN2RMTWJmaUU2cGJTQnVpTzFSTlRTYTB5WGJldmxNVUVrNDBmUCtCd1NQ?=
 =?utf-8?B?SjBIaHg0Njg5MkpaRVdWQzdxZHEyYWorQzR1Qy90cXBIaElRRzhHVmlQRFY1?=
 =?utf-8?B?NU5VYU9USWdsc0QzZ1IySXdRRFBzVU8rMzlncHoxcHZtU1ZRRVA3RkdLNUFn?=
 =?utf-8?B?Y1RCY3VZT2lEMGN0Q0NoNWRZOXcyaitRUFp3VEF4bGRyT3NLSERoVkpoR0Q3?=
 =?utf-8?B?dEVlQndOYUl6RDZmZmR5TlB0RkVLVmRzRnNQbTV1eVVxOEZFdnNXNE9uSGM3?=
 =?utf-8?B?MmZrZGk2eWNSRHlGV3lBNzNOaHF0QUpROC82V3JtZ1hZV0IwNGxlNVU5clNo?=
 =?utf-8?B?aWxYNWtwb0oydW5tRkZLVi9uV3VNcjZPWExNdUpZQzBtRERSQ2IrbDJPYlcy?=
 =?utf-8?B?NHRRTUQ1ZHBMWUhZWFNkU2xDeTM2MWhOZXQrS3RmZjZtYVA4QzNxVEkxYlIx?=
 =?utf-8?B?ajFNMzRvUTVDUlpZckwzQzlVMVZHcTRCeDR4ZkJ4WEVQVDI4ODMwY3NBNkVR?=
 =?utf-8?B?MzFCaWVDRGhadUxGMlhBTnRwcFRSdVM4WGt1YTQrWU5zUktPN0ZJWWN0ajJm?=
 =?utf-8?B?SjZ4TFE4UElwSUFuSWM3UlNzSUN3UkFzQzVMTXBDMDRIM05pc3VpSVhtc0g0?=
 =?utf-8?B?R1BnbjI2Y3VXbDh3cFpsRllFQjhzSHZWM2t4TFgvaFVkNnBIM21MbzRzdzJS?=
 =?utf-8?B?V0ZFZWdtVEJKSEgzTFZrMTFMZlVuR3dpVzFBcjhMRmJYM0d0bHVYZkpsSmJY?=
 =?utf-8?B?Y24rOERtS09nc2duaUxtdHdRNWtYT1VjRC8ySUpnY3A2OU43S2tHR2o0UmhM?=
 =?utf-8?B?Y1lra1ZuQ2piQlZOcVRLOWxiQnFLNUNYNlNCdnZJSEVTZ1NqeVRNMWFEdzFi?=
 =?utf-8?B?QUVjRUZSTmVsUHU4NEk3VzJaYVZDR3pxOW5RMVRlajZaU0FVaDloeEF3QjRj?=
 =?utf-8?B?b3JqbGtyc0FnQ1NJMHM4SnJVWHR1WnRITGFPYkI0d3FYNjh2a3FLWFAvd2lj?=
 =?utf-8?B?bjBpNExVSUZaZG1UNlp6enhRZnNZcVdFYUtOWTBMMm16Z2lsdXV1YU9NRGRX?=
 =?utf-8?B?NjdaVFcyVG93Qm15MnFKVFZ5clYvY3hpWHlISWJNNFY0VEEzVmUvUUlFQ0h4?=
 =?utf-8?B?SVZWeGJZNFp3Z2N0NVpsR2YvMGV3RVFQZHoyM1hDMlJ6NEZxU2dXTGhOTmdE?=
 =?utf-8?B?cGwvMWJxWFhpMjFoMUJLVzBTYkp1ZGI2NDNVVFBOUk9VWGJzZDB6RVVMNVdk?=
 =?utf-8?B?WVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9781ee2b-29a9-42b6-2e6b-08dcc5fe14ec
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 18:37:04.4655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IilKd6phqVds6tARCHGagiyPgJ6R9VVwW5szEj1mRYhMNk5VPfOKqqHQOBEUySpoCN9qgBsq0ch+hyzGDOCJiYhsDykBM6hm0dWpgWnhQP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6463
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



On 8/26/2024 8:26 AM, Lucas De Marchi wrote:
> Initial implementation to parse HuC's header was lazy and assumed the
> manifest was the first entry in the cpd, which is not necessarily true.
> Add proper parsing for the headers that matches the one documented
> in https://docs.kernel.org/gpu/xe/xe_firmware.html#firmware-layout
> as "GSC-based HuC firmware layout ".
>
> Before (wrong):
> 	$ intel-gfx-fw-info -c /lib/firmware/xe/lnl_huc.bin
> 	header-type: GSC
> 	version: 13.91.1
> 	checksum: 320e765cbe42b0f5f95333794a6a00a4e67246d6ad8393b59b64efdc3506cfe9
>
> After (fixed):
> 	$ intel-gfx-fw-info -c /lib/firmware/xe/lnl_huc.bin
> 	header-type: GSC
> 	version: 9.4.13
> 	checksum: 320e765cbe42b0f5f95333794a6a00a4e67246d6ad8393b59b64efdc3506cfe9
>
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   tools/intel-gfx-fw-info | 105 ++++++++++++++++++++++++++++++++--------
>   1 file changed, 84 insertions(+), 21 deletions(-)
>
> diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
> index fb98f1bcc..c3b98ebc1 100755
> --- a/tools/intel-gfx-fw-info
> +++ b/tools/intel-gfx-fw-info
> @@ -60,19 +60,68 @@ struct uc_css_header {
>   	u32 header_info;
>   };
>   
> -#define HUC_GSC_VERSION_HI_DW		44
> -#define   HUC_GSC_MAJOR_VER_HI_MASK	(0xFF << 0)
> -#define   HUC_GSC_MINOR_VER_HI_MASK	(0xFF << 16)
> -#define HUC_GSC_VERSION_LO_DW		45
> -#define   HUC_GSC_PATCH_VER_LO_MASK	(0xFF << 0)
> -
> -// Add a fake definition for the GSC's header so this script can still
> -// check the version
> -
> -struct uc_huc_gsc_header {
> -	u32 rsvd[HUC_GSC_VERSION_HI_DW];
> -	u32 ver_hi;
> -	u32 ver_lo;
> +/* Code partition directory (CPD) structures */
> +#define GSC_CPD_HEADER_MARKER 0x44504324
> +struct gsc_cpd_header_v2 {
> +	u32 header_marker;
> +
> +	u32 num_of_entries;
> +	u8 header_version;
> +	u8 entry_version;
> +	u8 header_length; /* in bytes */
> +	u8 flags;
> +	u32 partition_name;
> +	u32 crc32;
> +};
> +
> +// Added as python code
> +// #define GSC_CPD_ENTRY_OFFSET_MASK GENMASK(24, 0)
> +
> +struct gsc_version {
> +	u16 major;
> +	u16 minor;
> +	u16 hotfix;
> +	u16 build;
> +};
> +
> +struct gsc_cpd_entry {
> +	u8 name[12];
> +
> +	/*
> +	 * Bits 0-24: offset from the beginning of the code partition
> +	 * Bit 25: huffman compressed
> +	 * Bits 26-31: reserved
> +	 */
> +	u32 offset;
> +
> +	/*
> +	 * Module/Item length, in bytes. For Huffman-compressed modules, this
> +	 * refers to the uncompressed size. For software-compressed modules,
> +	 * this refers to the compressed size.
> +	 */
> +	u32 length;
> +
> +	u8 reserved[4];
> +};
> +
> +struct gsc_manifest_header {
> +	u32 header_type; /* 0x4 for manifest type */
> +	u32 header_length; /* in dwords */
> +	u32 header_version;
> +	u32 flags;
> +	u32 vendor;
> +	u32 date;
> +	u32 size; /* In dwords, size of entire manifest (header + extensions) */
> +	u32 header_id;
> +	u32 internal_data;
> +	struct gsc_version fw_version;
> +	u32 security_version;
> +	struct gsc_version meu_kit_version;
> +	u32 meu_manifest_version;
> +	u8 general_data[4];
> +	u8 reserved3[56];
> +	u32 modulus_size; /* in dwords */
> +	u32 exponent_size; /* in dwords */
>   };
>   
>   struct magic {
> @@ -91,6 +140,9 @@ except ImportError as e:
>       raise SystemExit(1) from e
>   
>   
> +GSC_CPD_ENTRY_OFFSET_MASK = 0x1FFFFFF
> +
> +
>   def ffs(x: int) -> int:
>       """Returns the index, counting from 0, of the
>       least significant set bit in `x`.
> @@ -181,17 +233,28 @@ class FwGsc(Fw):
>   
>       def decode(self):
>           self.f.seek(0, 0)
> -        self.fw = self.cparser.uc_huc_gsc_header(self.f)
> +        self.fw = self.cparser.gsc_cpd_header_v2(self.f)
>   
>           data = ["header-type: GSC"]
>   
> -        HUC_GSC_MINOR_VER_HI_MASK = 0xFF << 16
> -        HUC_GSC_MAJOR_VER_HI_MASK = 0xFF
> -        HUC_GSC_PATCH_VER_LO_MASK = 0xFF
> -        major = FIELD_GET(HUC_GSC_MAJOR_VER_HI_MASK, self.fw.ver_hi)
> -        minor = FIELD_GET(HUC_GSC_MINOR_VER_HI_MASK, self.fw.ver_hi)
> -        patch = FIELD_GET(HUC_GSC_PATCH_VER_LO_MASK, self.fw.ver_lo)
> -        data += [f"version: {major}.{minor}.{patch}"]
> +        # find manifest entry
> +        self.f.seek(self.fw.header_length, 0)
> +        for _ in range(self.fw.num_of_entries):
> +            entry = self.cparser.gsc_cpd_entry(self.f)
> +            s = "".join(map(chr, entry.name)).rstrip("\x00")
> +            if s == "HUCP.man":
> +                offset = entry.offset & GSC_CPD_ENTRY_OFFSET_MASK
> +                self.f.seek(offset, 0)
> +                break
> +        else:
> +            logging.fatal("Unknown/corrupted firmware - no manifest available")
> +            sys.exit(1)
> +
> +        self.fw = self.cparser.gsc_manifest_header(self.f)
> +        major = self.fw.fw_version.major
> +        minor = self.fw.fw_version.minor
> +        hotfix = self.fw.fw_version.hotfix
> +        data += [f"version: {major}.{minor}.{hotfix}"]
>   
>           return data
>   

