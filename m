Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D41C35FFA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 23:17:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9A810E258;
	Wed, 19 Mar 2025 23:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ij4j/lPm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24C510E258
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 23:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742426248; x=1773962248;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Wo9zCyZ41Ci+W2oAnfIYiGQO55uwFfNQHELuTOGR7ZQ=;
 b=Ij4j/lPmr4i8y4/4+0ifKoDbeTicAN32aMka1kJ9Th84po7AaDBxbQiQ
 D9gFqSeHrTmQh+f2wCSknXhOkQEHqQ/dn6S3KByQNjmHNE8U3kp+n/b1C
 af28mhZl8u4JRGvejjyHEdGa7mzMTNuygZcDx7THac5Jc7EqDOVHFHaKO
 yKSnAhgLFFLQ82u4/u9c5chz2wpaik8b6VWennfjg6SGNWVVpuDIpM4B2
 NQB3OTenpy0XrVtfUc1GeJRncMGSmNCP3hYQZOpBhPRDprcx2zmIjE/4r
 rj834B8z8CPNez3AM/SAkwaaatYDp0HcF4Pyj950om6lP8Ds44ihL5Q7a A==;
X-CSE-ConnectionGUID: I40AaHOiRMK1x9s9jumWxw==
X-CSE-MsgGUID: cIKvZ7dQTsOXhVs4MuTeqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="66099000"
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; d="scan'208";a="66099000"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 16:17:27 -0700
X-CSE-ConnectionGUID: Wx6+LtAcQjOSNQPrCYKpjQ==
X-CSE-MsgGUID: Ia8Ib0MWSRCubQkrK7wtWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; d="scan'208";a="122557060"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 16:17:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 19 Mar 2025 16:17:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Mar 2025 16:17:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Mar 2025 16:17:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWHqrhdL6we2N7qVbALBMi3uvRr7TUp4bZ1kxScwmgmpo5GmxihiJIhRut+RMotkjp2pM9wIGlftgOw4E5o+geh0KZCKYjoWb5hBQZf2dVZxYvULTnQzftJLem4pjOPr1vfYCuQhf47SMCIZ2BzoIW+1AIBMPMgwzPg1yMpoqAJyY4NmtWCZmqiEJspnS619lBBIYksZWgeJlkwhrrjeYnsQiFDPcn+C0XhMPGpwOjk+wDiXXcDeMYl0jgyACejIOpnc4H9okxZ7PqQjoMAVh1Z8t5JIjj4eHX0qYuayoKqQzd7pEeGRgkFh74+I49BtREg48r0Pqfp1+1gA+Ahj+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZiTeUvdFH/v3Dqt/u5SlEjlw44e4ON1rZOb7Ka4+cE=;
 b=sv79d5Ybms5GtaPw9ZyS5v9MSinDLlbMPYxoM519N913/XPSrwNNJcR2t+QMQcaOIRuXafADhAlWAAzVp/0zN6vjhq+nT0Eqb+TwZqArW7kwKjlApb+fRWR8384C54F+tHGYRre6Q9gEY7jeKC2rsqekuJmQvSiFo8INm4QKbUJPjGDUFDA8JycC/+DiKFkUQgOXsZu6SV4ZdHurz+lKx2KgdbYBvKS5vsUOn+8SVob7DBaCKS1OZpfkygU94fZF8f/btK0OgjB3+/YhSJpt2NBRYCW6UqQJ3IcpMdfuSqWxELzKHFcUl7xfiFy6v+40KbLsQpNr9owYkQY91Hf26Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA1PR11MB6537.namprd11.prod.outlook.com (2603:10b6:208:3a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.30; Wed, 19 Mar
 2025 23:17:24 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 23:17:24 +0000
Date: Wed, 19 Mar 2025 16:17:21 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <michal.wajdeczko@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v2 2/2] tests/intel/xe_pmu: Add a test to validate
 engine activity on a function
Message-ID: <Z9tQgSA4a1h6oc/j@soc-5CG1426VCC.clients.intel.com>
References: <20250312062431.2238409-1-riana.tauro@intel.com>
 <20250312062431.2238409-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250312062431.2238409-3-riana.tauro@intel.com>
X-ClientProxiedBy: BY5PR17CA0015.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::28) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA1PR11MB6537:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ead950b-a418-4cbf-dfee-08dd673c34e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkNnWWU0bkNmTUNXYy9acnpkUi96ZFkrS0dCeHd4Mmk3ODR4UmtuaUNPWnkv?=
 =?utf-8?B?YkdsNG5TOE9vT3o5aVJYTXRiYWM1aHd2WVhQdU1CMEYySkFaSHRDUi92RFY0?=
 =?utf-8?B?dkNHVTJEc2V6REp5KzZUOXZZODJmZGFXUE81amdSaVU5QjZxSXhRanhvN3dU?=
 =?utf-8?B?K05odyt5Rm5iTThDWjQxUUdtSFE4cWx4OHRZNUdsVFZqeVVsV2dEY2VwNXBO?=
 =?utf-8?B?czY3Wi9NUzJnNHpiZDlPWkE4MlY2T3FJcUlUVjZMYUlqbFBVQ2pncjVxWWFl?=
 =?utf-8?B?S3RJMDIyRlA3b25GdXNIbWI3UmUxZUszU2Q5N0ZiZXNhVmt6WkM0cU5LQ3BK?=
 =?utf-8?B?TFMyWmZDMCtNQkxWWmVOVTkydzJxMDZQWmV4c2Q2Y3BUSThhNjlFOEpIRFM3?=
 =?utf-8?B?ZlpvaEhyeXhUcDRzNXlYVkpKcW52YXlBRCt3VFYzVjFHdTZqbk82a09SdHpS?=
 =?utf-8?B?Wk9YTGFBOWlkc3Z3T2Q3ZXlYdHBFK0xSSUlOc01sdGlmOGI4ZjlsNTlFTlV5?=
 =?utf-8?B?UVFmTzFRZlBHQWdkZ0xlZk1CTFhSQ1J2bUUwek5FQU1PRGZhTWlRVWpLVEdo?=
 =?utf-8?B?Nk9uQjkyRnVZREFTbGJMVDgzaFhrRmJnWEJXSUt2c0w4aHRvZHQyczM5bTFO?=
 =?utf-8?B?ZVpGQmxGRW51eXRHcFpDTEdLTWwrb253MzdYK1ZtRUh1K0xOWDNoT2cwZlVF?=
 =?utf-8?B?UThmRVNvajdXSHlTRXFaSzdHUnRma3hVNGlkOXpGT0JTc1lidWFvby9MOFBM?=
 =?utf-8?B?NER1TndvU1BveEJHL1ZxRHRQNC8xYzdBcGRuRk1NV2VESFBYdHh5dy9uTGtt?=
 =?utf-8?B?c0NvL0hMV3JIUTB5ZDNBWERXL2JYbUZiYnFBM0RzNWtCY2FZbzgwTW5PZFk2?=
 =?utf-8?B?TnF6SHZDOFRINFgyY1RzODc4dmZybHdNMkhVSWIvQit4YmVJSXl3eUpDOEky?=
 =?utf-8?B?YjNKN0srbDZ0a2ozNVVYZXpSY0dsQnBBL3o5elpzQVRmbnJhbjhPTFlxTXVF?=
 =?utf-8?B?OEdpNHViVGtYT29WL0Z5WHI0cGZ2UDdvUm96UjNvMmM4TjdvNVpHOHF3ZGZL?=
 =?utf-8?B?eURwNVF2TTcvQjg4NkY2eGt1b0cra3BEYnhtTUk2aGJ1ZUZSZ0QxN0lHT2N2?=
 =?utf-8?B?aWtHYSt1OU5jUnV6MHRGbmdxZUdqMmhzK0hHSGNDK3hNeVNFdVdKa2FxekhX?=
 =?utf-8?B?SnhqMGxPMzl1STNnRyt0d0RueG9rUUpWWUJDQnNMU1JTdkY3Z01tdlRuY2J6?=
 =?utf-8?B?Z3QveVBkNGhSVm0rNU1NWHFGbWZ4UTJCODVYWkl1aW1GOHQrNnRKN1J2VDFz?=
 =?utf-8?B?L0JhM1pUa2M2czhQWlZWVHBEZklrSDhhZUgwYW9tRlNXSDliTlphWEphTzFy?=
 =?utf-8?B?b3RnMUFJSmJUK1NJL1ROeUhFcXkxNEdOUjVVNGszcHpSZExEOGdnak5rZFlv?=
 =?utf-8?B?Zys3NjZhUVJqNmZIb0VwdlU1bDI5Ky8zazVIcWhPMjR0VSttcVBTWEpYWGZr?=
 =?utf-8?B?UlF3NDZDVEhwY1ZCQzMwM3M0UDJ0b3YwZEE2T0dVMlhYamR0bjhNVzVjd2lL?=
 =?utf-8?B?TEt0QWF0TWtQR0ZHNVFlanlndHJlK1FvUCtoV3Z0SjhGOG9DdWhyQmt2cy9W?=
 =?utf-8?B?NnBoNVl5aHJDYWZGUzVUaUIvdW9wajZFMG55REF3QXFneStWNXZ4NkE1bW1i?=
 =?utf-8?B?eFF0akx0Y05JcEs0MUhzRGV6WHRkejU1OU5SQ1VRTXR0ZENxZG5FTjRweEdZ?=
 =?utf-8?B?a3ZMZmJoTkF4Q29kSCtOZ3E4T21NVjBTRUMyWU5DQlp1dVl4Ymxwbms1WDUw?=
 =?utf-8?B?NXRCVjRyWHFuSC85ZGttVEp6RHlsdFFGRFFtZm9FT1Jrd3FMRjRRQWJMSTRY?=
 =?utf-8?Q?v0nptbqsS9feo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3dJakw5dFNtUnY2VlpOQlRCNUZuZjBscHR1VlRObjVOQ0lzVjlvM2Ntb296?=
 =?utf-8?B?dVgway9lemJSU1BpU283L2JIbFQrMmhBYWcxSmRsTm54NXZlUTZJOGFjek5N?=
 =?utf-8?B?ZWxpVEU4cllHVHJ3T3o1T2tnUXVFaGcwR0I3ZVJVOHd3L000T2lpMEdFMWNZ?=
 =?utf-8?B?TGFnbUo5bENkdTZ4WlNQWHV4amhUYVpCai9BbnhzK01JV2lDdFhyZk1IeEND?=
 =?utf-8?B?Z3Bvb0dxSGJXcGRVRlc2cHF5cDc0MlRUeVhNUUttZTFuVmJlZ0lFU3BsTjgz?=
 =?utf-8?B?cGVUcHAyUXV3UTBDaWRmRzcxRTdwOWkydENVWXFoSHo4YzduQkRvK1VKMGpV?=
 =?utf-8?B?VjZrRERQTFVTSGdSU3dFVEpsMGJEZXFZZTR6TzMxaTI1TnkzRG1EbXZJSjEy?=
 =?utf-8?B?OXpsQWEyY1NveWNpZUNqckJuTVdJbE1ycmhJRUVqc21kVFk4OXFNU2pGV3Yr?=
 =?utf-8?B?U2I2Y3R1NlZEUTJaSHRlMkpkYm5FV09kQzBjdDhNV2JVazZNbm5PUWdQNCtP?=
 =?utf-8?B?QytFRzVhc1JuOGs0UnRVbnQ5ZHhNKzhKQnZXay9xd0ZxZEJ5WFVYRmZoZzVD?=
 =?utf-8?B?dE16MzRva1RWMDB2YndrbkRaTVBlSjREcCtDbFNOcVMxcEh3eUZ5VmpCT0RJ?=
 =?utf-8?B?czRXanZMSW5jSi9DQkNoSExXQmZzbDkyRnN2QnJVQTNNUDNOWDNhWkR0Wnd6?=
 =?utf-8?B?YVZ0cHIvcW0xWDVHcG55STdoMTdpaW9GSi9iKzN3bDFpNE1QWnZEcFZPWkNu?=
 =?utf-8?B?SmUwRFdka3hPNWE3bzVqNUwyQUttemI0bFBHSkRQOXdZc0ZVWkN4ZVFuZE5C?=
 =?utf-8?B?WmlGQ1EzS0pjY3BMa0w5T25TMjNLN0RSSXA1OTNhWmp0YXcxUW1FWHFMRUVk?=
 =?utf-8?B?QjN1cXBsb0VDNEZhSVMxeVR3U0w3RUNXbzRkRnY1ZEhMRzNwYjc2dDcxUFYx?=
 =?utf-8?B?Y3pTcFNvdzVHdGJvbU83LzdjWFVRdmh5bDgrT1pXRFY3TjI5MVk3dUgzaGMx?=
 =?utf-8?B?cnZEQ3p6QTNSVkpkaHEzTUc3Q1VySisvWWhIM1dWcnVpS2p6bU1OdUVaTGd2?=
 =?utf-8?B?cEhDRStGbW9ZbEwzcGZwRUtuMVNmeUNqZFNjRVhwbU1mQ1NsQ2xvQnREeUN4?=
 =?utf-8?B?ZXZuVU9STHhvZEt4T1FxcnVqazU2Wm56SXhJVTFPWkF3NVJGam52Q2xSNEpX?=
 =?utf-8?B?bWhxZVNtbTE5Ky9kMVcyQ1FHTUErQzdvdlVJK28vL3VRR1VkVEdVUlZaQmlw?=
 =?utf-8?B?REEyZEczazhtN3BLWjRtRWtzRDlyUUpNcFZUZkFsU09yWGRPRlFnVEttekJl?=
 =?utf-8?B?ek13VUZVQVBRbWtPdEFyYUJ6eERROWlob1BGNDdzclEvNFJPWDlPcnVMOHJl?=
 =?utf-8?B?ZGFLVnlwWnRJY0k1NXkwY3Z1Nmdtd01Yb2g1a1VRVi9FQVdHVW44UGdzclJF?=
 =?utf-8?B?dFU1ZWZ3c1pkV0hOT1hIeXdFZUhhQ3VydE1uSW9PbXJmOVM1UktYcTVRTkpj?=
 =?utf-8?B?Z0NxenZGbkVXZFVSTHp3QzZ2T0xCZlNVV3R3NzlKS0MweTVmS0FLWTlDL29P?=
 =?utf-8?B?WDJQdGdKL3RpL2o5N09BcDVaU0F4dTU3UHhkRUlZWlBHOVpNWndMVUxnTWFo?=
 =?utf-8?B?OXUvWUxNTUY0bzRDYVhXbDdZTnZGYWFTTTdpeVVVaW9FQnk1d3NhU1psWG16?=
 =?utf-8?B?YjVxV1EvVTg3NTU3Z1lIenNFN0VIZ2RadzNLVmpmSlhUOHRUMVNURDh4TVE3?=
 =?utf-8?B?czZFZ01EZk02Sk1SQ0NibUY5QmhxMHQ0WVlBblNYUzBUZU1BMlI1b2lXTjNJ?=
 =?utf-8?B?WU1LOG1TSHJLdGxnbGw4dzNtRVhHRlo3VGxJMUdaQzhXODVxdllyUWFLVkNB?=
 =?utf-8?B?NWhuME4wYlRFbElvTmlldHJzUXFNZitLS1VrZEZ6ZlpHelNJM0hUc2Y5cWpQ?=
 =?utf-8?B?NWlxVm9qdnAzRVlDZFhjVWJ2MUozM0hPaGNoMFNicWVOaVcrUkJ1RFUyL1dJ?=
 =?utf-8?B?NzducFM1Wmhlc044QzlzamtiZCtrNHRPT1kzZEhyS2xqZFY1UHFhNTYya29s?=
 =?utf-8?B?NmxkZWtWSnY5RE9GV3FyS1JtQld6dXVHWjhTMVh5bGt5bmRUZlZNcUR1anY2?=
 =?utf-8?B?cU1SRytqMk5yTUM0L3JwbEcrdGFmR2w5Zi91Ynl2eDJrU1JaekRrUTB6RkJT?=
 =?utf-8?Q?zAqKcllgrQ2PVXvl80taMyg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ead950b-a418-4cbf-dfee-08dd673c34e2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 23:17:24.1531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LB61FK7iPhbpO/TZ6UDbC+XvdffBAD+vhTr2KZ/hajHGBWM5qdpmZF3jHjcjvMU/6aa0Lh4Q0wfmfaYIQY17x4lXltW9VDCY7d+dP+GhxOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6537
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

On Wed, Mar 12, 2025 at 11:54:31AM +0530, Riana Tauro wrote:
>Provision and enable 2 VFs with execution quantum and scheduling policy
>set. Run workload on one function at a time. With sched_if_idle set to
>false, workload uses the execution quantum of idle functions.

I think part of this ^ description should be moved to patch 1 since you 
are provisioning it there.

>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> tests/intel/xe_pmu.c | 67 ++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 67 insertions(+)
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>index a95ee1777..be4d17ed2 100644
>--- a/tests/intel/xe_pmu.c
>+++ b/tests/intel/xe_pmu.c
>@@ -263,6 +263,68 @@ static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *
> 	}
> }
>
>+/**
>+ * SUBTEST: fn-engine-activity-load
>+ * Description: Test to validate engine activity by running load on a function
>+ */
>+static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci, int function)
>+{
>+	uint64_t config, engine_active_ticks, engine_total_ticks, before[2], after[2];
>+	struct xe_cork *cork = NULL;
>+	uint32_t vm;
>+	int pmu_fd[2], fn_fd;
>+	double busy_percent, exec_quantum_ratio;
>+
>+	if (function > 0) {
>+		fn_fd = igt_sriov_open_vf_drm_device(fd, function);
>+		igt_assert_fd(fn_fd);
>+	} else {
>+		fn_fd = fd;
>+	}
>+
>+	config = get_event_config_fn(eci->gt_id, function, eci, "engine-active-ticks");
>+	pmu_fd[0] = open_group(fd, config, -1);
>+
>+	config = get_event_config_fn(eci->gt_id, function, eci, "engine-total-ticks");
>+	pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
>+
>+	vm = xe_vm_create(fn_fd, 0, 0);
>+	cork = xe_cork_create_opts(fn_fd, eci, vm, 1, 1);
>+	xe_cork_sync_start(fn_fd, cork);
>+
>+	pmu_read_multi(pmu_fd[0], 2, before);
>+	usleep(SLEEP_DURATION * USEC_PER_SEC);
>+	pmu_read_multi(pmu_fd[0], 2, after);
>+
>+	xe_cork_sync_end(fn_fd, cork);
>+
>+	engine_active_ticks = after[0] - before[0];
>+	engine_total_ticks = after[1] - before[1];
>+
>+	igt_debug("[%d] Engine active ticks: after %ld, before %ld delta %ld\n", function,
>+		  after[0], before[0], engine_active_ticks);
>+	igt_debug("[%d] Engine total ticks: after %ld, before %ld delta %ld\n", function,
>+		  after[1], before[1], engine_total_ticks);
>+
>+	busy_percent = (double)engine_active_ticks / engine_total_ticks;
>+	exec_quantum_ratio = (double)TOTAL_EXEC_QUANTUM / xe_sriov_get_exec_quantum_ms(fd, function, eci->gt_id);
>+
>+	igt_debug("Percent %lf\n", busy_percent * 100);
>+
>+	if (cork)
>+		xe_cork_destroy(fn_fd, cork);
>+
>+	xe_vm_destroy(fn_fd, vm);
>+
>+	close(pmu_fd[0]);
>+	close(pmu_fd[1]);
>+
>+	if (function > 0)
>+		close(fn_fd);
>+
>+	assert_within_epsilon(busy_percent, exec_quantum_ratio, tolerance);
>+}
>+
> /**
>  * SUBTEST: gt-c6-idle
>  * Description: Basic residency test to validate idle residency
>@@ -360,6 +422,11 @@ igt_main
> 		test_each_engine("all-fn-engine-activity-load", fd, eci)
> 			engine_activity_all_fn(fd, eci, num_fns);
>
>+		igt_describe("Validate per-function engine activity");
>+		test_each_engine("fn-engine-activity-load", fd, eci)
>+			for (int fn = 0; fn < num_fns; fn++)
>+				engine_activity_fn(fd, eci, fn);
>+

Maybe add the sched_if_idle = 1 case here.

Rest looks good,
Thanks,
Umesh



> 		igt_fixture
> 			igt_sriov_disable_vfs(fd);
> 	}
>-- 
>2.47.1
>
