Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F440C3600C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 10:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E434D10E990;
	Thu,  3 Apr 2025 10:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SjAdDJO0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA6210E996
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Apr 2025 10:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743674737; x=1775210737;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6278TICr2fwkuMDcM288MbutMnU/lWfL1uOvqiE1N9I=;
 b=SjAdDJO0dW8rPcPezyy31SZuoOWTZ+naqCqU2dSTv/zYOnWtIxrrtZg3
 ngs/Ye9ggKjzCt0rnjlXmRpx3DbPAZxzseY7/6/rle3Mv5si3kkRy0DMv
 Re8+P+kqCHltrQTmoGRsYZg2mboDOaQtaOUlfs3s6IqUsNaoG0saUhsAa
 nRcqC7zerdgRGg6b8GKe0lXYkCrOaWf95nPDE3hDHVtJnPky2OmJBqz8j
 OoZAtHxU4IxFax8Uvvkb/7m723kusaqc2YIxbfe6ZKw1wID5oDbZlpnQu
 nMl9/R0sBvLxZytB0laelrk5YnVAzajbdXINO8cs6nENt+TL4X2BHoF7L A==;
X-CSE-ConnectionGUID: 9TlUUCKYSK27QetFFYzaIQ==
X-CSE-MsgGUID: pCEjEZmSSYWpmbMxFmL4Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44957859"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="44957859"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:05:36 -0700
X-CSE-ConnectionGUID: XOOXBMgMTBaGByCnNh7epA==
X-CSE-MsgGUID: YthjVCcOQNGpiXmOZgoRPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="131944063"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2025 03:05:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 3 Apr 2025 03:05:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 03:05:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 03:05:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GTKaN2dCgEWcpUkOc+T97fSliIuu9LKOSJ3jBCtiGwYjpnsmZBAaEkhiIFFLia0qHpQvaUoBZvZBQtnwozRmWR721ejvgq0Ln3xmt8z24cqSCKHgtTIL2KtUcAG/9AxyeYYS5fS4s30JWLL1Fi75BAGwSR2DxJ/s5r8pGEeAHCtBmPJuQu/cSjtEyHTDoHboun5EfU0GfpmZG/OTgw+g662xIKkgy0V5a4b2WK2ZuBB5lPcfkFc8DAoG2ScXWnc1FEtINVJ9WrHtVHeH0LgmnIQy3P9finr9ldd1Hxfc4tFwbDmWCEho7mcqZJF/71Ri+Y9yqRVyVIxzutQ55XtyTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uRMTjilyKOc4dlTgm6l5+XWxT2aPE9oOUcFDzuEfnQ=;
 b=wx+VGe3aTdcIpx8ayr+ns4rrQKBUWtUzEzhFSer8/VUcfn4HjOkPkYLbAXo0HcbvMWaf2dfm4r1g0nN8hxzktFwuVJeM/QLCQMARE+DZ8C6IQoGrDBXx9LqfEGWOCjSH35ZuzYZDdXVMJyV+Ulr00Y3n9GyRg5VDS9oQQyScTfoDumSWBsu3Z5N5IWFI6R74lbIQ+PMjlbyY9dsO6IY1I6aqLZWXCw4f3nFUVFiDo1cNTYugZ7trQP+2W+0mrz/V0Flu9Xa4UcQ0K4Txd7kxtCM2jw8eTQ1+4VzVxeFkfE8lJUzzgcNwcoMEhMQUV2uEhfvGv7msnUmGYCCMPxx8+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by CO1PR11MB4818.namprd11.prod.outlook.com (2603:10b6:303:93::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 10:04:51 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8583.041; Thu, 3 Apr 2025
 10:04:51 +0000
Message-ID: <92291c28-1f6d-4fab-9527-fe44f4f8732d@intel.com>
Date: Thu, 3 Apr 2025 15:34:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 08/37] lib/igt_kms: Introduce drm_colorop and
 COLOR_PIPELINE
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>
References: <20250326233609.2980110-1-alex.hung@amd.com>
 <20250326233609.2980110-9-alex.hung@amd.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250326233609.2980110-9-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0144.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::14) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|CO1PR11MB4818:EE_
X-MS-Office365-Filtering-Correlation-Id: ce402178-1ad2-4087-842a-08dd7296f985
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlBOZUxLWmZabHdMM0dMUndaYXpCYXY1SlVHeUtKZDBwSXBVcmFSajREY3R2?=
 =?utf-8?B?VzVIT0twVXc2K3FXMjEvR0h6SlZCZmdCNTlycHZBbmthTXV3WnlDN2pBaVB6?=
 =?utf-8?B?TUNQTXVFS3hUcmxmd1RLMGY2Uk8vUUpoK2JBazhOUk42VWg1ZTB5Rm5RMDcr?=
 =?utf-8?B?eFJUVXRzSElDdHcwSzJFdjI4Zy81UmN2S2hSRHo4R1VadDd1Qy9TdmdUcU52?=
 =?utf-8?B?MzVIMDcrUzkyQmxudXdhc2FXYUdCSThJeU55R2RIN0lJaTYwUU84VFRlbGdZ?=
 =?utf-8?B?TllZaTA5REhaaDdPdUNYa2Jic2IyY1FoajFRc3ZKeURwellYd1I1WGxGeEdq?=
 =?utf-8?B?Tm1KTWkwL1RndVJWaXZ0dW5HN25VUk5ZMkdFN0dIZ3RUV3hicW9Na0pWU3Ny?=
 =?utf-8?B?ajlDZEtGZkVqMjRvRlBKMEQ5REEyQ2s3RzBBUEVuRTZnc0JPQTdRbXZKWWYz?=
 =?utf-8?B?L2VkMjc3WXJrQlhjQ29CUDQ5eEgyVnU3Vk5jQzg5aWpVNVhUMm9XaFN0Lzky?=
 =?utf-8?B?VlBzTjRDQ3lGWm1pS0VOL2VxVVZnZEM5cHJlbzFkYkd3ejhNQ0MzQVhJbmFQ?=
 =?utf-8?B?WmsySXRsbWdnbnMzVkFZZ21lejQ2YXI5eDB3bUw4T2xpaUFEbFpwWUhkWHZp?=
 =?utf-8?B?bHlYT0Uzd2xuU2wvT0pVLzNDSmdSUmVqeE1RV2k0NWl4dmRzV1BXdGhzYVlt?=
 =?utf-8?B?ZDNKU0daNVhTejg4OW9jSld1dzZEV2dBYktsWDZSbklYTTgwVUJmWWdOMHRN?=
 =?utf-8?B?L3IrbUhKRDd0YndaZUprOGFiOFp0YXF4ZjltdDlhQ2xYYjBqRmswRkZqTzQr?=
 =?utf-8?B?dmVibGw3R0VpeXFaaHNxVDl0cmU0QXRzVG5mbHVJTmx2VzlhK3RFbVhCbTdE?=
 =?utf-8?B?K0VKNktLUjVxMkV6Q25DaUJuc3l1dXBjZEpudkRaM1NmUGhQbTE0aHUvQkxD?=
 =?utf-8?B?WU5MVWp0VWlRRmZ5OVNmZ2lYalowa0h1Vk93UTJVWmVLM3FLKzhDb2Q5SFQx?=
 =?utf-8?B?WFdrZU83T0JzU3N4TXBkbGNXWW9TTlFmVnRUUGRIUXNyYTB0N2xyVkh6aEVT?=
 =?utf-8?B?QXdPc3ZFYXlyanZ5MWNEVUlSa29XdlhJZkRJcEQ4a2tsMUMwV2ZvNUNqbXZl?=
 =?utf-8?B?cDVmQXZoc0psbUR4ZVB2VWE3RVN1MVBpWXN3Z0JFaW5WOThFVXQzbHc5WXFB?=
 =?utf-8?B?azRWaHMyU2s3Q243OWcwWkNqOExHeUxRYlpOQk9TMnArUExtNDZpeTZUOHJC?=
 =?utf-8?B?MDBMa3pCMWViUFlkbmhoV3YyMUJPZEZBY1dQcjRUTDM4VkxnSkJIMkhDSUd1?=
 =?utf-8?B?U2JucFV3TllCVk9WMVlCSmhIWXh1cHR2RlI0dDFmWHJsOHNCRFJRMlBHZmtt?=
 =?utf-8?B?OUt4d1NJUUJYak9CRi9LU005MTN5ZlVNWEs5UEVMN0M0TlpFN0I4RWU3YUUz?=
 =?utf-8?B?L2V4WjllSWN2NWZ0NFZjWi9UUGRJcERCYkQ5RVoxTldSWDBPT0NaWU9mdU50?=
 =?utf-8?B?OGVYTkRja0dYRlJrZzJROTBrZDBBYTZ1RHVZMFRXTmhINUk1a04xQ0hMVXIw?=
 =?utf-8?B?R3lLZlNkeHU5elRmeFVSOU1MUTRWZmNGWnlmTGNNV0dNcFhmQnRRUEl6OGRo?=
 =?utf-8?B?T3c5bFQzSU90MTVoV0xzc0dDL1I4YWdFZ3JFRlZmUWRzUXdzK0xYWDlkaTFm?=
 =?utf-8?B?NjhQOXE4cmRqUFJST0hyYUtuc1BXUDY3YzBRZktabVpGZXBUTThvejIyc0g2?=
 =?utf-8?B?SDRKcXl1NTVFV3hablZxZlRyVS9lYnlZeDJyWU15TGFLNEg2Qk83U3diVlp5?=
 =?utf-8?Q?qayk55w4KGqw6cHtEDkchazx8FT/EY/SBMwlo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVhIUUgyRU8rUkY2WWlRa1FYdysxSGFkUHd3RWkxd2cwU09DK09IVXFyMCtI?=
 =?utf-8?B?MXhGQ05jVXp5SWdhaG1qWEMyRW1UblEyRzUxQ3h4YmJMNE9JMXFudFQxeVlG?=
 =?utf-8?B?U1FGaHdkcXd4RTdOUXY5TmFlZFp5S1dESjUwendYZnpUN0tUMEFBbE5HSjRR?=
 =?utf-8?B?d3k4Vmt0R2FkRlBxUHdUeGhvb0tmSTV2Z0lEZnltdjd1R0FmUHV0QnVCWStn?=
 =?utf-8?B?R0trUlc4NytBQXZ0ZE53MWVmamNFSGZHck05M3VxclVsaEpDcGhUZmRPbXEw?=
 =?utf-8?B?NStIRGRzR0V3dk1XUUJEMkNzVHNHMmk5VDhDa3RtbG1FM0ltenMwU1JIWWhK?=
 =?utf-8?B?ZFQ5dTlCQTE3TWg3KzNvbno5RTI5SWtzdHBuYmZ4dFgvSEhoT3JQNmJNNnRW?=
 =?utf-8?B?ekd1dUxBYy9QMGFZY3AzR2RJL0NLYmpaNGp3YjRmb1dxZ2cxRTRrMHZQNkg1?=
 =?utf-8?B?NkcxQWlHRy9QMkdKUTR4NnR5UEtod05hSWtQL0txTWVoeHBFME9SdEdSM0h1?=
 =?utf-8?B?VncvUG92cDI2eGJ0ODRUdUR0OVl5UDhJRTZyVzlxL0hGYnNRdXd6aVRUaFZ2?=
 =?utf-8?B?dU9SOTNQcE03bW4vUkhxSWlDQk11VFpQNXhzNEpSUVoyck51WnZ6eVdvUUhu?=
 =?utf-8?B?MldOZldTUDZrNTN2VC9pZTNOdkJOU0pQSlBxNHVXUXhjTTRmNkMxeHNJUUM5?=
 =?utf-8?B?ajZNYXJST0RGMWpiUzdUOVhlWUpYY0FkZ2c4VU9BYUk3Z2VlQXdVb2EvSlVx?=
 =?utf-8?B?K0hwTkEwMjJzYkludk5jTjRyZmMrL1k3d241VmFKU3plSXUxem52QTZOMnMr?=
 =?utf-8?B?b3RDQjAvamV2eXRDdnVMTkVvbHdycjN2S2l6RGR2T2x4TDhSTXZOaGtMRHBa?=
 =?utf-8?B?TDk0MFVNb2l6RFNEc0JFazFlZlpHK2FKNExJbGhyM3gveEVDd05RQnN2Rnlo?=
 =?utf-8?B?T3FGSWE3TWxmeHRpaTdmNExsS2NKSzc0YUV6RVJtMDQ4QjVmUVVZdTN2Yk9z?=
 =?utf-8?B?Tm9keFpWekRIV2ZBL0FXMHppaE12ZytQY2p5aHJkcEZtVHJXOEJUODZXUWJk?=
 =?utf-8?B?cHgxQWhsUVVERmdBY0ZqcmE3a0RvRjFmZXBOalJPWWtSR2tPV2E5bXlwcVBI?=
 =?utf-8?B?MENCYWJ4UC9oWmxjTFRpeStZVitJaml4OWlIaG1vbGdmZzFjT3NHS3psL2l3?=
 =?utf-8?B?eFdCbW1kcmtYWkFmcE5VMFVianJXNnE0U0NtT1pqOExXMVBsb3I3aXMxRHVN?=
 =?utf-8?B?Qy96K1RNSGVmcTZHU3NwaVlzek9taEtUQjFoc3g5TFpTMjJjOW9aQXoySGlY?=
 =?utf-8?B?K0JkT2JsajI3aWxPSnhucDlFUklFdm5WYThPTzhMUzd6VXpETGhldHRXeFho?=
 =?utf-8?B?TnlQeldwNUg3QS9zcjVHMzRrTllwa0V5cndXWGVVZTh2MVhvRWhoRWEvNWND?=
 =?utf-8?B?aXRERk9CT1diQTlxN09jSG5KY1JEbXNzQ0hLNGp1bjdPaGgvRlpFbVhXSUZJ?=
 =?utf-8?B?K1BPbGxSQklQRWNoTE4xOXNxSFRrSys4dVA5ZDZ5aDJvaEhPTVNuRDM5c2tP?=
 =?utf-8?B?UUJhZC9kZEhNa1B0RFlFRXd5Q3VZQnV5Um1hazV2emFYWUUzU3o5dXVJMTVl?=
 =?utf-8?B?VjVTNzNPWlZpZHBUdlRMVDhlK3grK204cmhOcGZ4K0hyN1cvL3IrdE9BSzRo?=
 =?utf-8?B?WWdtSnc5YTh0VkxSYURLOC9YTGQ3UmdibEd4TlA1cWhYWEFRZXppQUthM2VD?=
 =?utf-8?B?ZkpWRTEybEpWNnUvUGRHQi9uV3dqQ2dUV2JROVZZQTAxSGJiN29wVXJ5SWxZ?=
 =?utf-8?B?VjBUQUZzOTNvZUoyVWZTTmZJOCtYenN2WlM5VEdYOFczWFA3dFlzUDQ5Z3VC?=
 =?utf-8?B?elVFRHQ4cXgvKzAxaWg1Y25GMHdWU0hJNElqZGpVN0dVbjRvUmlFckNjZG4w?=
 =?utf-8?B?bkk5OHhTVmxucWJuY2tmYmJDL3M2cWF0SG4xSzhKK0tnVS9kU3dKMFlpdFQ1?=
 =?utf-8?B?TDIrR1lxZVdZWlJkanF1MElqOFBFaVRqci9XN3VuQnRyOVZoNlk2cHdNOTlo?=
 =?utf-8?B?NXBuaDNXNDhkeGxPbFBKcnZUeHBtMTBZTjU1N2paNmUwbmdIZHBPNGNxMGZH?=
 =?utf-8?B?eTBRUkllYm1HemhMY0RDTkRBN1d0QXFqTjM0MTZQTjBDVVFnQTVpaUJWSURB?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce402178-1ad2-4087-842a-08dd7296f985
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 10:04:51.6443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6y/kvxz5UTPQWziZcKLBZIdAXXqTrE8luEzODWZAohkCIa8sLj2LTTNm1WgpOZjnTE0LcwoLOiDbEFpWOcO8rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4818
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

Hi Alex,

Destroy colorops on exit in this patch itself.
Something which Bhanu had added separate patch
https://patchwork.freedesktop.org/patch/591122/?series=132839&rev=1

On 27-03-2025 05:05 am, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
>
> We've introduced a new drm_colorop object in DRM. These are
> used to make up a color pipeline. Introduce the concept of
> this new DRM core object to IGT, including:
>   - discovery of drm_colorop objects during init
>   - various helper functions for deaing with drm_colorops
>   - handling drm_colorops in atomic commit
>
> Along with this we're also introducing a new COLOR_PIPELINE
> plane property to track and be able to retrieve the colorops.
>
> v6:
>   - Ignore COLOR_PIPELINE property if
>     DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE not set
>
> v5:
>   - Fix warning
>
> v3:
>   - Add commit description (Kamil)
>   - Add description for public functions (Kamil)
>   - Squash with COLOR_PIPELINE patch
>   - Remove need for IOCTLs
>   - Change colorop discovery to work without IOCTLs
>   - move enum drm_colorop_type to drm_mode.h
>   - Drop display from colorop prop_enum functions
>
> v2:
>   - Iterate through all next drm_colorop objects
>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>   lib/igt_kms.c          | 271 ++++++++++++++++++++++++++++++++++++++++-
>   lib/igt_kms.h          |  89 ++++++++++++++
>   tests/kms_properties.c |   5 +-
>   3 files changed, 358 insertions(+), 7 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 88ed35f07..3f0ad25ce 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -92,6 +92,7 @@
>   #define MAX_CONNECTORS 32
>   #define MAX_EDID 2
>   #define DISPLAY_TILE_BLOCK 0x12
> +#define MAX_NUM_COLOROPS 32
>   
>   typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
>   
> @@ -701,6 +702,14 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
>   	[IGT_PLANE_FB_DAMAGE_CLIPS] = "FB_DAMAGE_CLIPS",
>   	[IGT_PLANE_SCALING_FILTER] = "SCALING_FILTER",
>   	[IGT_PLANE_SIZE_HINTS] = "SIZE_HINTS",
> +	[IGT_PLANE_COLOR_PIPELINE] = "COLOR_PIPELINE",
> +};
> +
> +const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
> +	[IGT_COLOROP_TYPE] = "TYPE",
> +	[IGT_COLOROP_BYPASS] = "BYPASS",
> +	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
> +	[IGT_COLOROP_NEXT] = "NEXT",
>   };
>   
>   const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
> @@ -768,6 +777,108 @@ igt_plane_rotations(igt_display_t *display, igt_plane_t *plane,
>   	return rotations;
>   }
>   
> +/**
> + * igt_find_colorop:
> + * @display: display on which to look for colorop.
> + * @id: DRM object id of the colorop.
> + *
> + * Returns: An igt_colorop_t if found, or NULL otherwise.
> + */
> +igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id)
> +{
> +	int i;
> +
> +	/* find corresponding igt_colorop */
> +	for (i = 0; i < display->n_colorops; ++i) {
> +		igt_colorop_t *colorop = &display->colorops[i];
> +
> +		if (colorop->id == id)
> +			return colorop;
> +	}
> +
> +	return NULL;
> +}
> +
> +/*
> + * Retrieve all the properies specified in props_name and store them into
> + * colorop->props.
> + */
> +static void
> +igt_fill_colorop_props(igt_display_t *display, igt_colorop_t *colorop,
> +		       int num_props, const char * const prop_names[])
> +{
> +	drmModeObjectPropertiesPtr props;
> +	int i, j, fd;
> +
> +	fd = display->drm_fd;
> +
> +	props = drmModeObjectGetProperties(fd, colorop->id, DRM_MODE_OBJECT_COLOROP);
> +	igt_assert(props);
> +
> +	for (i = 0; i < props->count_props; i++) {
> +		drmModePropertyPtr prop =
> +			drmModeGetProperty(fd, props->props[i]);
> +
> +		for (j = 0; j < num_props; j++) {
> +			if (strcmp(prop->name, prop_names[j]) != 0)
> +				continue;
> +
> +			colorop->props[j] = props->props[i];
> +			break;
> +		}
> +
> +		drmModeFreeProperty(prop);
> +	}
> +	drmModeFreeObjectProperties(props);
> +}
> +
> +static void igt_fill_colorop(igt_display_t *display, igt_plane_t *plane,
> +			     igt_colorop_t *colorop, uint32_t id,
> +			     char *name)
> +{
> +	colorop->id = id;
> +	colorop->plane = plane;
> +
> +	if (name)
> +		memcpy(colorop->name, name, sizeof(colorop->name));
> +
> +	igt_fill_colorop_props(display, colorop, IGT_NUM_COLOROP_PROPS, igt_colorop_prop_names);
> +}
> +
> +static void
> +igt_fill_plane_color_pipelines(igt_display_t *display, igt_plane_t *plane,
> +			       drmModePropertyPtr prop)
> +{
> +	int i;
> +	uint32_t colorop_id;
> +
> +	plane->num_color_pipelines = 0;
> +
> +	for (i = 0; i < prop->count_enums; i++) {
> +		if (prop->enums[i].value) {
> +			igt_colorop_t *colorop = &display->colorops[display->n_colorops++];
> +
> +			igt_assert(display->n_colorops < MAX_NUM_COLOROPS);
> +
> +			igt_fill_colorop(display, plane, colorop, prop->enums[i].value, prop->enums[i].name);
> +			plane->color_pipelines[plane->num_color_pipelines++] = colorop;
> +
> +			/* get all NEXT colorops */
> +			colorop_id = igt_colorop_get_prop(display, colorop,
> +							IGT_COLOROP_NEXT);
> +			while (colorop_id) {
> +				colorop = &display->colorops[display->n_colorops++];
> +				igt_fill_colorop(display, plane, colorop, colorop_id, NULL);
> +				colorop_id = igt_colorop_get_prop(display, colorop,
> +								IGT_COLOROP_NEXT);
> +			}
> +		}
> +	}
> +
> +	igt_assert(plane->num_color_pipelines < IGT_NUM_PLANE_COLOR_PIPELINES);
> +
> +}
> +
>   /*
>    * Retrieve all the properties specified in props_name and store them into
>    * plane->props.
> @@ -799,6 +910,9 @@ igt_fill_plane_props(igt_display_t *display, igt_plane_t *plane,
>   		if (strcmp(prop->name, "rotation") == 0)
>   			plane->rotations = igt_plane_rotations(display, plane, prop);
>   
> +		if (strcmp(prop->name, "COLOR_PIPELINE") == 0)
> +			igt_fill_plane_color_pipelines(display, plane, prop);
> +
>   		drmModeFreeProperty(prop);
>   	}
>   
> @@ -2999,16 +3113,14 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>   		igt_assert(plane->drm_plane);
>   
>   		plane->type = get_drm_plane_type(display->drm_fd, id);
> -
> -		/*
> -		 * TODO: Fill in the rest of the plane properties here and
> -		 * move away from the plane per pipe model to align closer
> -		 * to the DRM KMS model.
> -		 */
>   	}
>   
>   	drmModeFreePlaneResources(plane_resources);
>   
> +	/* init colorops */
> +	display->colorops = calloc(MAX_NUM_COLOROPS, sizeof(igt_colorop_t));
> +	display->n_colorops = 0;
> +
>   	for_each_pipe(display, i) {
>   		igt_pipe_t *pipe = &display->pipes[i];
>   		igt_plane_t *plane;
> @@ -3626,6 +3738,8 @@ igt_atomic_ignore_plane_prop(igt_pipe_t *pipe, uint32_t prop)
>   		}
>   	} else {
>   		switch(prop) {
> +		case IGT_PLANE_COLOR_PIPELINE:
> +			return true;
>   		default:
>   			return false;
>   		}
> @@ -3675,6 +3789,45 @@ igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_pipe_t *pipe,
>   	}
>   }
>   
> +/*
> + * Add colorop properties
> + */
> +static void
> +igt_atomic_prepare_colorop_commit(igt_colorop_t *colorop, igt_pipe_t *pipe,
> +	drmModeAtomicReq *req)
> +{
> +	igt_display_t *display = pipe->display;
> +	int i, next_val;
> +
> +	while (colorop) {
> +		LOG(display,
> +		    "populating colorop data: %s.%d\n",
> +		    kmstest_pipe_name(pipe->pipe),
> +		    colorop->id);
> +
> +		for (i = 0; i < IGT_NUM_COLOROP_PROPS; i++) {
> +			if (!igt_colorop_is_prop_changed(colorop, i))
> +				continue;
> +
> +			/* it's an error to try an unsupported feature */
> +			igt_assert(colorop->props[i]);
> +
> +			igt_debug("colorop %s.%d: Setting property \"%s\" to 0x%"PRIx64"/%"PRIi64"\n",
> +				kmstest_pipe_name(pipe->pipe), colorop->id, igt_colorop_prop_names[i],
> +				colorop->values[i], colorop->values[i]);
> +
> +			igt_assert_lt(0, drmModeAtomicAddProperty(req, colorop->id,
> +							colorop->props[i],
> +							colorop->values[i]));
> +		}
> +
> +		/* get next colorop */
> +		next_val = igt_colorop_get_prop(display, colorop,
> +						IGT_COLOROP_NEXT);
> +		colorop = igt_find_colorop(display, next_val);
> +	}
> +}
> +
>   /*
>    * Properties that can be changed through legacy SetProperty:
>    * - Obviously not the XYWH SRC/CRTC coordinates.
> @@ -4122,6 +4275,25 @@ uint64_t igt_plane_get_prop(igt_plane_t *plane, enum igt_atomic_plane_properties
>   					plane->drm_plane->plane_id, plane->props[prop]);
>   }
>   
> +/**
> + * igt_colorop_get_prop:
> + * @colorop: Target colorop.
> + * @prop: Property to check.
> + *
> + * Return current value on a colorop for a given property.
> + *
> + * Returns: The value the property is set to, if this
> + * is a blob, the blob id is returned. This can be passed
> + * to drmModeGetPropertyBlob() to get the contents of the blob.
> + */
> +uint64_t igt_colorop_get_prop(igt_display_t *display, igt_colorop_t *colorop, enum igt_atomic_colorop_properties prop)
> +{
> +	igt_assert(igt_colorop_has_prop(colorop, prop));
> +
> +	return igt_mode_object_get_prop(display, DRM_MODE_OBJECT_COLOROP,
> +					colorop->id, colorop->props[prop]);
> +}
> +
>   static bool igt_mode_object_get_prop_enum_value(int drm_fd, uint32_t id, const char *str, uint64_t *val)
>   {
>   	drmModePropertyPtr prop = drmModeGetProperty(drm_fd, id);
> @@ -4210,6 +4382,44 @@ bool igt_plane_check_prop_is_mutable(igt_plane_t *plane,
>   	return !(prop->flags & DRM_MODE_PROP_IMMUTABLE);
>   }
>   
> +/**
> + * igt_plane_is_valid_colorop:
> + * @plane: Target plane.
> + * @colorop: Colorop to check.
> + *
> + * Returns: True if the given @colorop is a valid color pipeline on
> + * the given @plane
> + */
> +bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop)
> +{
> +	int i;
> +	bool found = false;
> +
> +	for (i = 0; i < plane->num_color_pipelines; i++) {
> +		if (plane->color_pipelines[i] == colorop) {
> +			found = true;
> +			break;
> +		}
> +	}
> +
> +	return found;
> +}
> +/**
> + * igt_plane_set_color_pipeline:
> + * @plane: Target plane.
> + * @colorop: Colorop to set as color pipeline.
> + *
> + * This function sets the given @colorop as color pipeline on @plane, or fails
> + * the test if it's an invalid color pipeline for the plane.
> + */
> +void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop)
> +{
> +	igt_assert(igt_plane_is_valid_colorop(plane, colorop));
> +
> +	plane->assigned_color_pipeline = colorop;
> +	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, colorop->name);
> +}
> +
>   /**
>    * igt_plane_replace_prop_blob:
>    * @plane: plane to set property on.
> @@ -4242,6 +4452,50 @@ igt_plane_replace_prop_blob(igt_plane_t *plane, enum igt_atomic_plane_properties
>   	igt_plane_set_prop_changed(plane, prop);
>   }
>   
> +/**
> + * igt_colorop_try_prop_enum:
> + * @colorop: Target colorop.
> + * @prop: Property to check.
> + * @val: Value to set.
> + *
> + * Returns: False if the given @colorop doesn't have the enum @prop or
> + * failed to set the enum property @val else True.
> + */
> +bool igt_colorop_try_prop_enum(igt_colorop_t *colorop,
> +			       enum igt_atomic_colorop_properties prop,
> +			       const char *val)
> +{
> +	igt_display_t *display = colorop->plane->pipe->display;
> +	uint64_t uval;
> +
> +	igt_assert(colorop->props[prop]);
> +
> +	if (!igt_mode_object_get_prop_enum_value(display->drm_fd,
> +						 colorop->props[prop], val, &uval))
> +		return false;
> +
> +	igt_colorop_set_prop_value(colorop, prop, uval);
> +	return true;
> +}
> +
> +/**
> + * igt_colorop_set_prop_enum:
> + * @plane: Target plane.
> + * @prop: Property to check.
> + * @val: Value to set.
> + *
> + * This function tries to set given enum property @prop value @val to
> + * the given @colorop, and terminate the execution if its failed.
> + */
> +void igt_colorop_set_prop_enum(igt_colorop_t *colorop,
> +			       enum igt_atomic_colorop_properties prop,
> +			       const char *val)
> +{
> +	bool result = false;
> +	result = igt_colorop_try_prop_enum(colorop, prop, val);
> +	igt_assert(result);
> +}
> +
>   /**
>    * igt_output_get_prop:
>    * @output: Target output.
> @@ -4514,6 +4768,11 @@ static int igt_atomic_commit(igt_display_t *display, uint32_t flags, void *user_
>   
>   			if (plane->changed)
>   				igt_atomic_prepare_plane_commit(plane, pipe_obj, req);
> +
> +			/* TODO iterate over assigned color pipeline and prepare colorop commit */
> +			if (plane->assigned_color_pipeline)
> +				igt_atomic_prepare_colorop_commit(plane->assigned_color_pipeline,
> +								  pipe_obj, req);
>   		}
>   
>   	}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 7531ae53b..04a96f47a 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -365,9 +365,18 @@ enum igt_atomic_plane_properties {
>          IGT_PLANE_HOTSPOT_X,
>          IGT_PLANE_HOTSPOT_Y,
>          IGT_PLANE_SIZE_HINTS,
> +       IGT_PLANE_COLOR_PIPELINE,
>          IGT_NUM_PLANE_PROPS
>   };
>   
> +enum igt_atomic_colorop_properties {
> +	IGT_COLOROP_TYPE,
> +	IGT_COLOROP_BYPASS,
> +	IGT_COLOROP_CURVE_1D_TYPE,
> +	IGT_COLOROP_NEXT,
> +	IGT_NUM_COLOROP_PROPS
> +};
> +
>   /**
>    * igt_plane_prop_names
>    *
> @@ -376,10 +385,20 @@ enum igt_atomic_plane_properties {
>    */
>   extern const char * const igt_plane_prop_names[];
>   
> +/**
> + * igt_colorop_prop_names
> + *
> + * igt_colorop_prop_names contains a list of colorop property names,
> + * as indexed by the igt_atomic_colorop_properties enum.
> + */
> +extern const char * const igt_colorop_prop_names[];
> +
>   typedef struct igt_display igt_display_t;
>   typedef struct igt_pipe igt_pipe_t;
>   typedef uint32_t igt_fixed_t;			/* 16.16 fixed point */
>   
> +#define IGT_NUM_PLANE_COLOR_PIPELINES 4
> +
>   typedef enum {
>   	/* this maps to the kernel API */
>   	IGT_ROTATION_0   = 1 << 0,
> @@ -405,6 +424,20 @@ static inline bool igt_rotation_90_or_270(igt_rotation_t rotation)
>   	return rotation & (IGT_ROTATION_90 | IGT_ROTATION_270);
>   }
>   
> +typedef struct igt_plane igt_plane_t;
> +
> +typedef struct igt_colorop {
> +	uint32_t id;
> +	igt_plane_t *plane;
> +
> +	char name[DRM_PROP_NAME_LEN];
> +
> +	uint64_t changed;
> +	uint32_t props[IGT_NUM_COLOROP_PROPS];
> +	uint64_t values[IGT_NUM_COLOROP_PROPS];
> +
> +} igt_colorop_t;
> +
>   typedef struct igt_plane {
>   	/*< private >*/
>   	igt_pipe_t *pipe;
> @@ -438,6 +471,11 @@ typedef struct igt_plane {
>   	uint64_t *modifiers;
>   	uint32_t *formats;
>   	int format_mod_count;
> +
> +	igt_colorop_t *color_pipelines[IGT_NUM_PLANE_COLOR_PIPELINES];
> +	int num_color_pipelines;
> +
> +	igt_colorop_t *assigned_color_pipeline;
>   } igt_plane_t;
>   
>   /*
> @@ -496,9 +534,11 @@ struct igt_display {
>   	int log_shift;
>   	int n_pipes;
>   	int n_planes;
> +	int n_colorops;
>   	int n_outputs;
>   	igt_output_t *outputs;
>   	igt_plane_t *planes;
> +	igt_colorop_t *colorops;
>   	igt_pipe_t *pipes;
>   	bool has_cursor_plane;
>   	bool is_atomic;
> @@ -841,6 +881,53 @@ extern void igt_plane_set_prop_enum(igt_plane_t *plane,
>   				    enum igt_atomic_plane_properties prop,
>   				    const char *val);
>   
> +
> +
> +extern bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop);
> +
> +extern void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop);
> +
> +/**
> + * igt_colorop_has_prop:
> + * @colorop: colorop to check.
> + * @prop: Property to check.
> + *
> + * Check whether colorop supports a given property.
> + *
> + * Returns: True if the property is supported, otherwise false.
> + */
> +static inline bool
> +igt_colorop_has_prop(igt_colorop_t *colorop, enum igt_atomic_colorop_properties prop)
> +{
> +	return colorop->props[prop];
> +}
> +
> +uint64_t igt_colorop_get_prop(igt_display_t *display, igt_colorop_t *colorop, enum igt_atomic_colorop_properties prop);
> +
> +#define igt_colorop_is_prop_changed(colorop, prop) \
> +	(!!((colorop)->changed & (1 << (prop))))
> +
> +#define igt_colorop_set_prop_changed(colorop, prop) \
> +	(colorop)->changed |= 1 << (prop)
> +
> +#define igt_colorop_clear_prop_changed(colorop, prop) \
> +	(colorop)->changed &= ~(1 << (prop))
> +
> +#define igt_colorop_set_prop_value(colorop, prop, value) \
> +	do { \
> +		colorop->values[prop] = value; \
> +		igt_colorop_set_prop_changed(colorop, prop); \
> +	} while (0)
> +
> +
> +extern bool igt_colorop_try_prop_enum(igt_colorop_t *colorop,
> +				      enum igt_atomic_colorop_properties prop,
> +				      const char *val);
> +
> +extern void igt_colorop_set_prop_enum(igt_colorop_t *colorop,
> +				      enum igt_atomic_colorop_properties prop,
> +				      const char *val);
> +
>   extern void igt_plane_replace_prop_blob(igt_plane_t *plane,
>   					enum igt_atomic_plane_properties prop,
>   					const void *ptr, size_t length);
> @@ -1283,4 +1370,6 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
>   
>   drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output);
>   
> +igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
> +
>   #endif /* __IGT_KMS_H__ */
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index 01ec3bedc..1f21fd851 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -112,7 +112,10 @@ static bool ignore_property(uint32_t obj_type, uint32_t prop_flags,
>   			return true;
>   		break;
>   	case DRM_MODE_OBJECT_PLANE:
> -		if (has_color_pipeline && !strcmp(name, "COLOR_RANGE")) {
> +		if (!has_color_pipeline && !strcmp(name, "COLOR_PIPELINE")) {
> +			printf("hwhw: ignoring COLOR_PIPELINE\n");
> +			return true;
> +		}		if (has_color_pipeline && !strcmp(name, "COLOR_RANGE")) {
>   			printf("hwhw: ignoring COLOR_RANGE\n");
>   			return true;
>   		}

