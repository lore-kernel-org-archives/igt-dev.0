Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803FEC61DB2
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 05:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07E910E1AA;
	Fri, 13 Jun 2025 05:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NUWjekvf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9814A10E1AA
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jun 2025 05:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749794124; x=1781330124;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UVjsXkK5sveWvockNn8V0gtXJrKwqRZHx9wBSMO0jlM=;
 b=NUWjekvfaHHoiwxjR/79E3TD7pEHWTBKYKYAn8LxasVt9pGcbWl/DT9p
 VY2i76IaxRV9VV9A+vaLoD3vZMYvM/IbQfN7nFA9aukupHgmtto9cCv29
 D07bORSO2li/hDbVdWAfNotLZwPWPvlZ2THrZS7SmEzAv7IXLZ7fwX8I/
 WpA+99T59e5reKr2Bvc5sy/ca8rzPTF0FffW4PplMbBrbYcD8yOmNaFkO
 qvYRli3l6YJrOAU/vPhxs+u4vj0UZkU2K/8tW6jpk6xEsu8emvRZdZt+W
 XkFaZ4ffcISqTJyY9W5ebtlHmOXoKxELeYgufXbRGdP2lHHh8VKkCV82D g==;
X-CSE-ConnectionGUID: ALMeu0+gRcuorKgxpUY2Fw==
X-CSE-MsgGUID: VmDZ3AKoTO+UQ3y93SZz+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69572073"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="69572073"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 22:55:20 -0700
X-CSE-ConnectionGUID: zDWp3wzaTp2HcGxJnTitng==
X-CSE-MsgGUID: HEPnjOP+SUiOYgCoekkafw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="148620530"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 22:55:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 22:55:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 22:55:19 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.50)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 22:55:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pe/RKhZrPQs2vf09Bs4bMXan0Ne56WDj4ZuHYcqZb4+b8+n+sjafnnW7kufegFCYqISkpKdhGTvbQn2FexR4Ye6YES/PUS1PnlcRi5w7VeEWEsoYPk53WNWNzjMQYEfuRFBDhDzSuaN604R9vjTR8d/9HHNNQAonh3+W9qFfwHxFxT3ppGg2nalOpjGexYBcu3T1T5TsVIr68P2dpzTMawq+AnFvKGONSv0yh3KTgNqKVcO4s1yzH+n3HC8LPO70abEWkfOroeUMmFUgPkgP4fzSr10dGr2pkFlNrLKRKfIrk2deB1hBC/wQ7VOax2ZQiY9FW+BwP5ObzanBEw00OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZM9Nq7su3YtlXwY8zHo2xch9jkJUcFMyag/BSplgUg=;
 b=YzcPNtuqQFG0hYPOdmgUFaWtttxALmjCbeIn7FMQTFaehThvmXHRsc+xXjTVngUsnf7oV5d7PoahGVZ2EjZpaRIpBsYJ2zq3v8ak/H3v2MynUoYiVFL2huTpaZXixqHUc2W5/QmLJo1TYB4DGYJEGaOQ2QAGE42E1aeip/2TcrGFccTjyiva7sYmFKho6JoNOHMgZR8nYAZ3OTUkp2zqs3O1AJ+YaMt+oAvHZlcJGE98baHihcetUxdBGwF4tdjY9JSjNA/j+uNMS7qf8sjmc9X0gTZpegCVFsJQcmRF8F1Wht5e7ehKN/2szhlllYu4DdEt8+S7/41tk+IGmer7IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA0PR11MB8378.namprd11.prod.outlook.com (2603:10b6:208:48e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Fri, 13 Jun
 2025 05:54:33 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%5]) with mapi id 15.20.8769.029; Fri, 13 Jun 2025
 05:54:32 +0000
Message-ID: <1511d7ee-e269-4782-8025-7568f494fe6a@intel.com>
Date: Fri, 13 Jun 2025 11:24:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_async_flips: Fix for HRR panels
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <arun.r.murthy@intel.com>, <chaitanya.kumar.borah@intel.com>
References: <20250612061829.431231-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250612061829.431231-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0018.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::33) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA0PR11MB8378:EE_
X-MS-Office365-Filtering-Correlation-Id: 48ca919d-aaec-42ba-2f3e-08ddaa3ec4f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0QvZWNpYm1MUzQ2YTRVMDNNZHVnT3hEd2RlbXpPN2l5aHZlMWJ2S01YYXNQ?=
 =?utf-8?B?d28vbG1yNlZjYzJLdUFNelY3RnYxNGZuMEJKanpGSEREVXcweVZRSnJ5RmFi?=
 =?utf-8?B?dWdBN09nOEFjd3V2ZUtZVVB3Tk5oc1RIMFdXQlhPRnBoS0NjTTI0Y1Y4SzBt?=
 =?utf-8?B?MEoxN1lKTFB1aW1NNndaaGhXdzliU0NnemZ3bEFROGlpWWJubUNaTnBvc1ZT?=
 =?utf-8?B?MnVweHlERnVkVHFpSWtTSWcvanJRaG94TjYxcFQ1U2RJZnR3cERpdmJMclc2?=
 =?utf-8?B?RWIzczNlTFdDL0NFR2dZUnhvSDUzREdXSXRlUDBxQ1RNamFaclJOZlJMYzYv?=
 =?utf-8?B?OUxzTWJtM2Z2dEN0WUtyeTJDdkYvMENNdVlEMW02RUpFaWlhVUNFb0txTFpt?=
 =?utf-8?B?TVlueG04aVlEaVVEQ0VCcUVnbGRwdTZiTlhpcnBrcEY0OTY3UStlUk9mQTE4?=
 =?utf-8?B?YXhQQjAzMEJnNGdWbGhGV2hzVHQ3WGc4d2JhRjBMMDVDNHAvMSszL0NQOXV2?=
 =?utf-8?B?UEQrTVRrN1dQSWQrRTJLMlRPTzdGTFFjS1Y2M2dTRHR3UFFFTFY3aFFyWUp5?=
 =?utf-8?B?VytIWU1FaVFqUlBMTlJOQm05Z2VSL0M4OFhwLytoT09ERjUxMHdzTThxaGla?=
 =?utf-8?B?ZFloVGpreXcrWkQ1QVZpbG1lZmZJamVXNkg3eEFuTSsxamJvbnRmWm1nM3Ur?=
 =?utf-8?B?WE9SY01XQ3U3eFMvVXJROVp5Z28wY25OeXgzc0cxb2RhU0grY01qTUhNTTd2?=
 =?utf-8?B?Z1AxeVNqVXF3Q0RyMjd0VlRDQjVna21mQ2NnZHBjQXVMRlNPZThOY0RKYTRq?=
 =?utf-8?B?dmNQbEpaZW0vZ291eDh1UHdGM2RrbXB3YWtPNUhoeXdtZHlWYmFDVjRSNVpC?=
 =?utf-8?B?Y2RtYUdEOHVZaEhsTmFTblUvUmJYQmRsaVNLVzR3bm15d1B2aVNqZmtQKzN3?=
 =?utf-8?B?WWpsVHJ1UkRFMkZKcndvckdrM01QeUtjbVlGdWdFQW1ST2hMTC9veEZsMmFR?=
 =?utf-8?B?QmJydEJ3MGUvNkE1YkM5NHFiaWs5RFdzdVlTMzBiRVJWODBVb3RScU9MSUJR?=
 =?utf-8?B?aTVQQWZqWDliT3A3V1JRUitUOFpGck1BakNmSDZFT0QwL0loZWFCMThhOGdU?=
 =?utf-8?B?YkM1RlZKUDlZV3hnWUFONDBGV24zMHpkcnlPcENxU0VJSTB5bEdsSkRsQ1ds?=
 =?utf-8?B?VzJqSkhtODlQeE5iVGFES0J4OExaZ0FPSUd3K3E1UWM0OUhpTVR6VmthQUdJ?=
 =?utf-8?B?UDluZnlaTEVJc2ZCSWcvNWZwNjJoOVkwTmh5U0Y4OGV0ZHV4MVVqaHdRNmJx?=
 =?utf-8?B?ODZNTi90NEVEaVd1ZnYzbjBhQ2Q2clc5VFBScW9qNG8yQituWnNDQVQ1OUMy?=
 =?utf-8?B?QURIYis1Ym5zLzJDVzc5WGhOM0JKSGlFMUF5TVMrT1g0Q04zZmxBenIycE8w?=
 =?utf-8?B?TlhySm5mYTdpWWsxU2oxUjlyM2Q3RlNvT3lpRjRWQmQrTm1aeTlZY3VZQ2Rz?=
 =?utf-8?B?NGo0QjR1ZzVLQ1ozWHU0emc0K2JlM1RDR1ErZ1NBMGFFZDhhanZqRjJwbWVE?=
 =?utf-8?B?cWg0SDVTdDA5Uk9mL2VpbjkwZTVPR0NPcklRcUhBdW1Pb1dOeExWUHBLbFIz?=
 =?utf-8?B?SVd4M2VwM1BucG5XNENGRkxpOEw0eFUyb3pNd1lyWEdCZUFvcDdVQ2R3VWww?=
 =?utf-8?B?K3o0RzJsZW1SRkEzeW5qV3hSbmNpQjdwQlorNHJEZVViVGpSM2ozWHRCOXhL?=
 =?utf-8?B?bk5VQStocndCcHZacVFrNDFPUWEycHlRNCtJZ1lkdXgxY1dBNkc5RVl3bWE5?=
 =?utf-8?B?RGhld2tWS3NQdlRHRXAyYjBXYVlRWHlXTWVPdDliN095OWZGVjFadnAxVXBZ?=
 =?utf-8?B?dDlRYmNWLzFPL2ZaRTZTMHBZaDlkM1NkRzZYalRoYkw0dld5VDE3eFJxS1VN?=
 =?utf-8?Q?bmWTO+cFVmk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXZVMGxzQzlDS2FwTnVHUUNYRmwzYlFXb21GOTkvZU1LcFE5aHFNYmtlNjM4?=
 =?utf-8?B?WjFHOGNROUo4TVM0QTcycm1YcmxjT251MEx4YzYwdWFuLzd5a1NPUk9jVnpF?=
 =?utf-8?B?S0NKNnZLQmF1RVllVXF1NUZTK3VqUENzeGpRUWJVUktISm5FSkozRFljbkky?=
 =?utf-8?B?WWh2bm1XQlFYOXdJaTZSWmdDRGJ2UGVFZXJiUTRFMVNtb0xRQzEvak81c0JZ?=
 =?utf-8?B?eEVJNzRxU1ZqcXI2ZU9PM202OUl3V3ZmU0JhOWxpUEowUWV2aHFsQWhxWDBj?=
 =?utf-8?B?V3B4aWxuL0RFd2o4Q2JPbzhhNDUzejBMSWJ1R2lUd08wL1I2c1J6elRBM25P?=
 =?utf-8?B?VGF5UURJZy9weDhVdk9RNWpOT1Rsa2JDalkxZ0sxUWhKM3o5TUxOblkzdWtX?=
 =?utf-8?B?Ly9XMkQyVWFQUjhrR1lQL0dhVld2bUJTcEdGL2J6THRCV2JpQlpXeXF0bUox?=
 =?utf-8?B?VmFkVmNZbE4rRzZSSFBuTmNUanE3cUtBNDNuWEw5MURXN0R3bmFabllwZlBs?=
 =?utf-8?B?NGIydjBteGZHMXFPMFJ5M3hGcVIvR2FlR2tBbXcxYmlSY0dJQVpiS3RaSnRY?=
 =?utf-8?B?Wk1Za3lYVGZPZW4xOG4xay9HZ2JsVk1JTVVZaHZ2TC9wOEIxUlMreU16QXpx?=
 =?utf-8?B?MkF6TjViTGVoRTYwR2hOeEw2SVFpY2M4MC9wTWRwdGhGai9TU0lkZzV1WTZW?=
 =?utf-8?B?MG1VNzJCZkFpbVB6MjBCcHlYUi8xSGpsaEhQYzVBTU9hdElrYnZzVEpLdjdS?=
 =?utf-8?B?OTRScjlZbHRXYnpxV3JUVFhYWVJEVVNlOE9UUkY3UXZsdGdPZFlKeFBtQi9N?=
 =?utf-8?B?NlNxWGVjeFRCNiswWjJSdVQ4MGxqdWVycTMvMmhxdFBqcGJpbjhCelpXMldU?=
 =?utf-8?B?KytDRjY3Sk1TT084UTIyTGJta3ZzQU9qWmd2NFhtSU8rZ01wTkF6UGttS2Vm?=
 =?utf-8?B?S3p6Q1IwakhSM0ZaeXAza2NuRFp0SmdtbWw5MmcxeW9WWjZPUVQvd3F3ZWpM?=
 =?utf-8?B?WXdOSnJ3dHVYRUFnRHY0clFkWDhMbWE0RXl0VncvSGJUYnRmNmJmeWdlRUsv?=
 =?utf-8?B?V2J4YldzQng0YTNOeWdlUloxd01LbmJzMVR6a2wwUExKVlpDcnRIaDZvRDVJ?=
 =?utf-8?B?akxGd0o3REs4Y3IxNW9KTklucjBteUVOWWlVOEpHVHRuT1oxZDlMT2p0VDEw?=
 =?utf-8?B?ZnlqQnZ4anczZld3cXdBYnVnaFdEYWloQldnaHAxcGIxOTBjcEZ6b0VUVVlF?=
 =?utf-8?B?cGFXV0diTyszQkxJaFdWa3d4ZmY2L2Rna1dHTEI2UEZpN2d3WGkzazlYbzVj?=
 =?utf-8?B?aFBTOVNIUVlFMGxOTDY4cjFCYllYdW1sWGFiVCtQSkk2S3VnZ09yV1I2K1pQ?=
 =?utf-8?B?d1k1dmFDS2ZvM2EzOEJyd05LNXI3cFlwWWV6bkFGMCt1anU1Y1JLb0wrdEdD?=
 =?utf-8?B?YzVibkNiaUM0cHpLN0tXa3lFMSttSm5xYWJyZ3JrTjJuSEJmR2c5Q3VCVnN5?=
 =?utf-8?B?aWw4emtLc0tmV0FLR3o0d3d1cHN1SkxJOFF6czN6Tm94NjZUNy9kMnNYeFY4?=
 =?utf-8?B?YldRRlRYZzVoY1A4ZzdQd2FSRjR0Q09mditucTNKNGVScFNvVUJsdmVzeE5W?=
 =?utf-8?B?Y0FhTjQwNWc3Z2Z5TVhGWlZCVjRVemhmQm1tV1ZmbHdlRnNXMERHYnRxYWJY?=
 =?utf-8?B?SUgzTzUzM2ZRaHVSMHFTSDkxWnd3UTdmZVhkWng5QkkzNGJhWWdZcjFBeUdU?=
 =?utf-8?B?c1JOODJES29rNFJibDUzckx2MEN4SEtLNjdVKzFWVWd0MXY4bms5cHo0Tkh6?=
 =?utf-8?B?cDRTMng5UjJadXhSWmhTZkdJdEtqaGhTck1DZWx4QUIwbFBYVlhxL2hpOE5G?=
 =?utf-8?B?WXNmTHlHZzNDb1hCSVFHOHI2aGpnRXJGN3ZySituM2t4MkdWeGdOYW1PK2M5?=
 =?utf-8?B?ZkE4N0ZDb1lqTk03eVIveVdDbHJIcjkrRWVyVFpES3ZISE9VNXBZOEFuNEVa?=
 =?utf-8?B?dTA3aHRFTHpTNk5ZRk9MditmaDFJeDI3RzlKSDl0dUZVcWRFRGE0U3Z2TmN5?=
 =?utf-8?B?OGNCUncreDVUTVVDUW83NWRZSzV5Snpjc2lEeTd2OURDemdSZzdyQkVnVHhO?=
 =?utf-8?Q?PH6OO9s+jEY5Cy8oEpJ6U6lCY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ca919d-aaec-42ba-2f3e-08ddaa3ec4f1
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 05:54:32.9143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IzTTUws74qU58BpLVg0IndsVIzi6ofSm+bW1fxUT6VM9EdANl7eRhkUYduk+xQvvrYY3n2xYmQhGTVO/j0pcpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8378
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

Hi Santhosh,

On 6/12/2025 11:48 AM, Santhosh Reddy Guddati wrote:
> Current logic in the test is too strict for high refresh panels,
> It expects the flips per frame to be 5x times the refresh rate which is
> not ideal for high refresh like 240 , 360 Hz.
>
> Introduce func to determine min flips per frame depending on refresh
> rate of the panel.
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_async_flips.c | 24 +++++++++++++++++++++---
>   1 file changed, 21 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 97128cfad..5669d450e 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -139,6 +139,18 @@ typedef struct {
>   	bool linear_modifier;
>   } data_t;
>   
> +static int min_flips_per_frame(unsigned int refresh_rate)
> +{

I agree with this logic of having lower min flips per frame for higher 
RR, but can we have logic to calculate the min flips dynamically for 
refresh rate rather than hard-coding it for certain refresh rates?

Maybe something like below,

min_flips = MIN_FLIPS_PER_FRAME * 60 / rr;

We could even rename MIN_FLIPS_PER_FRAME to MIN_FLIPS_PER_FRAME_60Hz or 
something?

Thanks,
Karthik.B.S
> +	if (refresh_rate >= 480)
> +		return 1;
> +	else if (refresh_rate >= 240)
> +		return 2;
> +	else if (refresh_rate >= 144)
> +		return 3;
> +	else
> +		return MIN_FLIPS_PER_FRAME;
> +}
> +
>   static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
>   			 unsigned int tv_usec, void *_data)
>   {
> @@ -377,6 +389,9 @@ static void test_async_flip(data_t *data)
>   	long long int fps;
>   	struct timeval start, end, diff;
>   	int suspend_time = RUN_TIME / 2;
> +	int min_flips;
> +
> +	min_flips = min_flips_per_frame(data->refresh_rate);
>   
>   	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
> @@ -421,10 +436,10 @@ static void test_async_flip(data_t *data)
>   		timersub(&end, &start, &diff);
>   
>   		if (data->alternate_sync_async) {
> -			igt_assert_f(data->flip_interval < 1000.0 / (data->refresh_rate * MIN_FLIPS_PER_FRAME),
> +			igt_assert_f(data->flip_interval < 1000.0 / (data->refresh_rate * min_flips),
>   				     "Flip interval not significantly smaller than vblank interval\n"
>   				     "Flip interval: %lfms, Refresh Rate = %dHz, Threshold = %d\n",
> -				     data->flip_interval, data->refresh_rate, MIN_FLIPS_PER_FRAME);
> +				     data->flip_interval, data->refresh_rate, min_flips);
>   		}
>   
>   		if (data->suspend_resume && diff.tv_sec == suspend_time) {
> @@ -712,9 +727,12 @@ static void test_crc(data_t *data)
>   	unsigned int start;
>   	int ret, width, height;
>   	drmModeModeInfoPtr mode;
> +	int min_flips;
>   
>   	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
> +	min_flips = min_flips_per_frame(data->refresh_rate);
> +
>   	/* make things faster by using a smallish mode */
>   	mode = &data->output->config.connector->modes[0];
>   	width = mode->hdisplay;
> @@ -763,7 +781,7 @@ static void test_crc(data_t *data)
>   	igt_pipe_crc_free(data->pipe_crc);
>   
>   	/* make sure we got at a reasonable number of async flips done */
> -	igt_assert_lt(data->frame_count * 2, data->flip_count);
> +	igt_assert_lt(data->frame_count * min_flips, data->flip_count);
>   }
>   
>   static void run_test(data_t *data, void (*test)(data_t *))
