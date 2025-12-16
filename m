Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8D6D5E133
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 11:22:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E72F10E704;
	Tue, 16 Dec 2025 11:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gQ6emfRN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2FB10E704
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 11:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765884121; x=1797420121;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UgteM7YZ96FN4CRvOOto3XnJIfkvKq0LNBfuHeiDBco=;
 b=gQ6emfRNICTS9T4Ti5MYXCL/yyE8K1nhVBuW/3ak1lJ8fhLjnim1nZfo
 fNDeBtR5j2RcjleeBDHRlSfIUDvUMEhwdW08PrI8MhnpySO0aXbUdpHbc
 SPEOzDFED2c9Z18UBM79fMeoytlYHoyim4Kq2aAg2myNFM0NQAL7pWy4j
 GlrjKeKH0zqzt06dlfvO/SOudWHYPBxR3g6ZMpw0u/+EgOOcBCjGvPxYw
 cUeGawj1Cl+jxl4ECYy5arrJdDaCGJHTwpBHiIQxrbRs7WkIXQFNZguLZ
 ztmuNmWzNK5EAWv2dC6RbPBsd9yJAG1Z2uwH0DH9CaHh5hnsoVLo1TkYp Q==;
X-CSE-ConnectionGUID: WN9tyXY4SretliCIlNiMBw==
X-CSE-MsgGUID: S99moEgeQJODtVcx/ZLAjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67677861"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="67677861"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 03:22:00 -0800
X-CSE-ConnectionGUID: 8nCYaorETI6AJyq04p6NDw==
X-CSE-MsgGUID: EfqtLEDtQimjl8b+pxqDSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="203100977"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 03:22:01 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 03:22:00 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 03:22:00 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 03:21:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BxumSgnb8edNRr2X1vR83DA4sys4V7r6i04iyS4doBHhpdc+FkPM9+xwzpJRuiyTaa4OkkJGVr0+3K6NGZY8ZkExKy1/x77pq5piFMc9PkZOIjh0JWyUl6q0aruvev1Yl8HU/jgWHZlqyKM6bG5ESA7hzbA5En+BtZykdSeoVsnXkpEquKF91hLWRtdCSrNlHPyqLf3IgWitvf8GAeKED2Cdv/Tfo0jeVts52dj7SdXvCHoDh5uLKhrAogTkP48zbJEexEmQ7Q2hISmaKiRzFxLf3Yd6uUmvXNKtd+IzQGa2Xo1NfxQma8/tDQJRvgKytYlFuvidv9KW+EUQF7SbcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zb1x+DvSPdl87c4MFxy6mCvJ40i1FtxA0Zvy3RHLgxA=;
 b=J50119kPxjIgyTfqJEOxqhVqbpzXXA0SVtgXxm4zYIUl7Zx7cM9WSu6kytpFLamw8LXmx5H+M3SCHZMftCkQNz4tHBV4b+VbSpm1h/jbgtSxrsvODEla4rdlcop4nraendIPiVDuaRZ/gzKfKtQMlfgGlAdHwKLJ3tIeBzkTOzVw1oN37t+z85swMiyyYiLwkO69BAWXUuTa8Tn2hjfjq/losxsKKP7mMbwj4UfahX8X/tvhm1OsUnUHUUR1+KAnX1Y8uNAFCDmNtV5IeFiBLjTcL+cDm8aoPOU09g/OHa6or21MSckNjqtTnOfX+8NWx591BzWllnOg4u0VEnbI1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA0PR11MB7936.namprd11.prod.outlook.com (2603:10b6:208:3dd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 11:21:52 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 11:21:52 +0000
Message-ID: <c4b727ca-787a-476a-8ed4-83a0f820d943@intel.com>
Date: Tue, 16 Dec 2025 16:51:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v8 1/2] lib/igt_device: Add API to get pci device
 upstream port
To: Karthik Poosa <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <rodrigo.vivi@intel.com>, <kamil.konieczny@linux.intel.com>
References: <20251216080951.199893-1-karthik.poosa@intel.com>
 <20251216080951.199893-2-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20251216080951.199893-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0266.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::14) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA0PR11MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: f9b0e84d-84ed-47e7-5dfc-08de3c954ff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWt4ZnJyMG5LWUFyMzFDUnJkYThpZ01PYXpXc3hlMzNXZVJzM1JnMUFrbHRG?=
 =?utf-8?B?TWI4TUZibGpSTWVKR0dxMUpkUGJ6WVVmOVA3aXBFMkFFcG1ROGdOQXNzRWJM?=
 =?utf-8?B?YkhkSU5EaHpJdzZqMk1jOStlUng1MTFpenBNeWxGVDRtUnQ0YnRxcEVoa3J0?=
 =?utf-8?B?clBmbUhLWGdlWFlUeXBCK29KWlN6VFZlVE51R3ZURmVOajZCeDNkNzgxNjhl?=
 =?utf-8?B?emQ3YlJOdUZxdEhmRyttd1RXV1pSRFZkVWdSeWR4U0hQNTBkd1pZbnN3THlW?=
 =?utf-8?B?R0lVMUtiNG94VFdod1pnOTk5K0xULzF0N2p2ZVU2ZXNjQTBPUmhiZ29oZGRI?=
 =?utf-8?B?OE9QcWpXVWNraWVPaWZ1cVY1VnR4VGhBVk4rb094N1E4NFlSNGZQTHNzQ3c3?=
 =?utf-8?B?V3ptMlNwb1Z1WkhIYkJCTFVJbjNORkw5VC9FNWROb1NWV3dOOFJ5ZkNlVE4x?=
 =?utf-8?B?WXNWb3kvZXp0SExobjZvTHBMVENKeW43NGNZL01jM29NUlBGQXlmT014akRR?=
 =?utf-8?B?WUluRkEvVDRqaEIvUTBSMyszWjBvaGI2S09iNGRxd3JRejBtdTY5ck1XM2NF?=
 =?utf-8?B?WjJkZGJKZ21ZOFZ4dEpNd0I1WjFoNUN1T0FncTJpSmdwd0h5dFpxWW9ZMkR5?=
 =?utf-8?B?YTE1anFPUklRY3piM3lMWjJmN0s4Z3Q5ZElERHhLb1VnTmNTOUsyTFpzNnpD?=
 =?utf-8?B?UVoyeHIwTTlhSjkreW9SQlp3RktITjVTNDlHaWVFQmkxNE9CZno0VEVvRmpY?=
 =?utf-8?B?bC9qTEM3WTlHWWppeDRxMEI4U2dUZ1VUUllRR1dKMnlXZ3NXWW1OaXB1bDJE?=
 =?utf-8?B?VEM2S29GQUFSOThYR0ptYXZyaGJjOFBxZ0JxKzFISkZFdDlCTFdzdGRLV0c5?=
 =?utf-8?B?dHhZN1YrWU1TZjdMRjJIengyU002NHN4cTZoZm14Ymk3WG45K3lIenVVTTRw?=
 =?utf-8?B?cXIzajFrcjhMRW5xcC9pK3BwTS80eW40cEhSRWgweUEvKzcwdXNCNHpWVndS?=
 =?utf-8?B?ekppYTFtY3NxemJCUzVKZ1h4TmlRUE40TDg4Nk1nNlk4SndWVDkxY1cxYjBO?=
 =?utf-8?B?dVB0T0V6VmpDdHNBYU03TXhwTTFJcThGY3FnK0Q3eVpOTXVRdGoycHhNRVVt?=
 =?utf-8?B?Y0x4MmFVUXg3dWkyNWVybDV5ell2VzlMdXBacjM2Y0tlWDFTc01ROWJaeVNv?=
 =?utf-8?B?VXAyTXhhNUgxTlF2R0tJVnR0cktKUXZVRmQ3Z0ZPSWM5NzVyeEc2S0ZKbU5F?=
 =?utf-8?B?aHY4eWcxS3hzWGJreGFOK1lmVlAyTnN4VExEbWFsK2d0a3VFM0lkTG1pSHRy?=
 =?utf-8?B?YXgxSllzeElGRkNaVWthM3dEZ2Q0eTIvWDcvZm9VcitMbHZZOUZvMVhCK1ZE?=
 =?utf-8?B?WkxGMXlHWm1ZblZmWWFwMEF5VCs0dFdtZjUvMWNQL0V6TnlEMmE4eEYwcTFZ?=
 =?utf-8?B?eHhIbTVrVWV2QmNNcEtZeWVJVkpsZXUrYVhUY2JlTklRMzh1N2t3b3ljMFlw?=
 =?utf-8?B?VEJuaFg5NmZub3pnTnBidTZOUjM3WWlQMDFxSVRPYzZvOHBETDQvZXpnSXRN?=
 =?utf-8?B?VFU3azRJSUNCblN4MUdrK2dXVnJRckFaMC96di9SSmd5aUZlT25qR29NQ0th?=
 =?utf-8?B?V1liazV1REdVZ3dKVkJZWkQ4UUJpYnVpN2NnZUtadlRTSmIwL09NRngxazNx?=
 =?utf-8?B?d1BJSW5TVk9CMFQzNUxvakFRRnIvMGZaaUhQbFlOTm0xem16S0NaWER2QVBE?=
 =?utf-8?B?b2VHVHhEZEtxUWJ5eUczcnBZRkdkeU9lbzl1Y0Z5UDBkZjNLbC90SFh6WkJs?=
 =?utf-8?B?ZFdLYTdhU0c1UmFYL3ZCNURXTHJOcVVYcERENlgxeU5zdXN2aTk4bUI2K09y?=
 =?utf-8?B?RFptUkkvTUV4eEd1VjdvWjE1cmU3K2kvTm9vRW12VjZ5UmozMExQTXB6TzVz?=
 =?utf-8?Q?6hnkgDaaW0Q812HmNKvsaRWb21AZnOFb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEdvTW1QQkpkUXN5S0tWTVRya2RBTFJDQjVvcGQvZmRveDBmYXNIaEJoSFFi?=
 =?utf-8?B?cUxNTUpqdFVDaXdvVFJqcHJRRmJ1YUg3UlcxZ2htZlhVZENlTkY3ZXg5NFpP?=
 =?utf-8?B?bUdGTmdTUXVlSklUQUxkN0R0VDZ5MVh6TUgvWnhkZEhCakpHY012QytObS9h?=
 =?utf-8?B?UVdabkp6L0x5SUlRVWU4VFEzOVlQSkVtYjhqVkRNaVdYOW1zamdQVDlMa0Ir?=
 =?utf-8?B?V0t4UE4yYm5NL054NVhBUHVFOHJrV3U5M285Q2l5cGw1bmJZMWN4SWRibDFs?=
 =?utf-8?B?M0pacDRYaVJWRFdxS0ZGUTlxUFVEVnVDc1ZnVG5QVWRQVVRYVVNTdUdhYklP?=
 =?utf-8?B?NjQxRmlXcjMxalBRdGtKN3RpN0ZUTkNQMDFxa3RwWlFQNUdPUEZIdll0Z09Y?=
 =?utf-8?B?ZnFzK3RwZ2UzNWpYQkQ4eDREVytJRGdtYzZoZlNwdC9vVWpyOXN6aGt2a1pa?=
 =?utf-8?B?Wnl5dllzek93cGxnbVdwY3NuTmF0NDRld2dnenA4TTk3OFJnYTY2Y0R0M1hH?=
 =?utf-8?B?dkhUTHJtdkdXbHdJQWo0aE43T295V25waVBaRy80cjI3czhVQkNwTStGWnN1?=
 =?utf-8?B?Yk5mcGRrSkVqeUNSRS9RMUNjdktCckpjRytaVjRnSlZMbmJYVEN6M0JKVDBI?=
 =?utf-8?B?c1ZvRlhLeDg1ajdmT3RjQ2hwSUw5NFBKb2lRbHVBYWNEcmFtVTBtOWVBSURw?=
 =?utf-8?B?LzJzQkRqZVJodWppU0lZcFFRTXhidjRKNURoYmR5V05aTDJYSDBUb1ZUUWVh?=
 =?utf-8?B?MWxHWERqL0tJN3djamVXTDZlVG53VkZzSy83ZGkxdFdpVmZFd0tmcjRqZU5j?=
 =?utf-8?B?MElFRU92UEZkYkFBQWM1QXNxWkNEamVNd3NRYXV0L1Nyd2tNZmorWm5qcG5E?=
 =?utf-8?B?ZjlLcHhrNlFuUFA1NWViQmJnRlEyM1k3OTVQbnhMWHpLRkVhYmNSaGFhOWZD?=
 =?utf-8?B?MXZ0SVVSNXFrZEdsTTgrSWtodTFVd3lodEg1YmF4Wko4Rnowekg0TC9aaWE3?=
 =?utf-8?B?NmtpTG5hWVJxQko2VzZjYllkVVZIa2ZmQk5hRDE5TmVnZWxHSHY4aVBES2VP?=
 =?utf-8?B?U3BWQitNbFkwWVdJdnVwYjk3T2I2RlNTM2Z2UHhqczIvcW5iYVVCZjNsYnFW?=
 =?utf-8?B?ME1XUjJwM0R3dTVYWE1MSUZxVkVpQkdyaEF0SGovTVY2b2tENDZQL0NwN1ZV?=
 =?utf-8?B?cXR1Q1ZUaDhrY1Fzb1VyTHR0Yk9RQ2cvQTFiUFpRWWpNektZNDg0ZmdVSE56?=
 =?utf-8?B?MHBiazJtaVhDN1g1RHNMY1ZCZUxkby9UNWxsSm5ZbHR4Ni9LaDAvZTluNzNV?=
 =?utf-8?B?Sk9nQzNFSTZoZG91LzZMY0JqYkc1VmE4N1JhMVdJRXBkS0hKVHpWUmlLSnc5?=
 =?utf-8?B?eDZjTWZIL1Zxck9xRE9FNDRBOXZFeEoyalNFQzE5Rm03eHFaWkJoTEpuMkRy?=
 =?utf-8?B?Yit3anJ1RDA0bkk1UlhVY3dzM1JkcFNPQlVFcGdaS3BnNlVJQkpKQWxjNGVH?=
 =?utf-8?B?SFVYbkhsd0NPaFRlT1Z4c3Z6WGVETkdIQnczR0Y5L0x1dkExVUVBcDBJbVZU?=
 =?utf-8?B?clFWYnR2ditxNHNSdjg0MU5VbHJ0QVp0MS9JcUhsMnFocGxRdjlvMjB2NFJs?=
 =?utf-8?B?REFIUnVTRkJTYlN3dVFJaENOYXMrUkMza0JMblJtdHQwRXdWeVRBRW9yUWhw?=
 =?utf-8?B?eFpkd2JjOExjNHpqT3BQS253RzFkTTlvNFBDTG9semtzZFViUjIvTzBPcUxK?=
 =?utf-8?B?MExzRDhmV2VYMzFUaUZxVjd1QVVsejNRWEoyUzJxNndtNnVJbGh5dmk2aUhW?=
 =?utf-8?B?d1Q5VXBMRWJZcjlVa05wU1hrN0ZvT1NCMUIyakkxekhHZFpaSmNxRVR2U1BM?=
 =?utf-8?B?YzNTcm45d09BMENMQ0k4TUlvbHpsVGM4MzBUYll0MmFEZjJKcTlLYWhhRFdH?=
 =?utf-8?B?WWxiRk1tdlN5VkhEc3JhQ3I1cndGdGhwdGZJR3Z2NjR6aFhlWHVCODZxYnNB?=
 =?utf-8?B?TVBGTEM1blkwVjJHeUxGRGl1L3FLbFZ3bWt1dmZoUU1QNHlySWhxendOaVFx?=
 =?utf-8?B?R2xYQ3hsUkQwTlpUREhrdytiRnVxTGVObnNNbkptaFh6bFJrazVVN1dOUEVU?=
 =?utf-8?B?WnhTWlc2NFhzRnFYbmxJd1hLZnVTSkZYdXNqcEY3NzVNYmIyRzdEczljaGwx?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b0e84d-84ed-47e7-5dfc-08de3c954ff3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 11:21:52.7304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mqc/vTQ+e9oVJOV6B31HpVpGmUITskR88arUqIbPRxx1/HWhH7TAH7mKjHBuUVaSNYOx7SmV2RuiUpP42h3Zfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7936
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


On 16-12-2025 13:39, Karthik Poosa wrote:
> Add API igt_device_get_pci_upstream_port() to get pci device's upstream port.
> This API returns struct pci_device* of the upstream port that is closest
> to the root port within the device's hierarchy.
>
> v2: Avoid igt_require in igt_device_get_pci_usp(). (Kamil)
>
> v3: Rename igt_device_get_pci_usp() to igt_device_get_pci_upstream_port(). (Kamil)
>
> v4: Use device type from pci express capability of pci config space
>      to identify upstream port. (Badal)
>
> v5:
>   - Search for upstream port only two levels up of the endpoint as we want to
>     verify ASPM only on PCIe link on which GPU card is present.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   lib/igt_device.c | 41 +++++++++++++++++++++++++++++++++++++++++
>   lib/igt_device.h |  1 +
>   lib/igt_pci.h    |  2 ++
>   3 files changed, 44 insertions(+)
>
> diff --git a/lib/igt_device.c b/lib/igt_device.c
> index c24f6a58d..d6c3f924d 100644
> --- a/lib/igt_device.c
> +++ b/lib/igt_device.c
> @@ -32,6 +32,7 @@
>   #include "igt.h"
>   #include "igt_device.h"
>   #include "igt_sysfs.h"
> +#include "igt_pci.h"
>   
>   int __igt_device_set_master(int fd)
>   {
> @@ -308,3 +309,43 @@ void igt_device_get_pci_slot_name(int fd, char *pci_slot_name)
>   	snprintf(pci_slot_name, NAME_MAX, "%04x:%02x:%02x.%01x",
>   		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
>   }
> +
> +/**
> + * igt_device_get_pci_upstream_port:
> + * @fd: fd of the GPU endpoint.
> + *
> + * Looks up for the pci device's upstream port using libpciaccess.
> + *
> + * Returns:
> + * The pci_device of upstream port of the device referenced by fd, NULL on any failures.
> + */
> +struct pci_device *
> +igt_device_get_pci_upstream_port(int fd)
> +{
> +	struct pci_device *pci_dev = NULL;
> +	uint8_t device_type = 0;
> +	int offset = 0;
> +	int level = 0;
> +
> +	pci_dev = __igt_device_get_pci_device(fd, 0);
> +	if(!pci_dev) {
> +		igt_warn("Couldn't get pci device for fd %d\n", fd);
> +		return NULL;
> +	}
> +
> +	for(pci_dev = pci_device_get_parent_bridge(pci_dev); (pci_dev && (level < 2));
> +	    pci_dev = pci_device_get_parent_bridge(pci_dev), level++) {
> +
> +		igt_debug("PCI device %04x:%02x:%02x.%01x\n",  pci_dev->domain, pci_dev->bus,
> +			  pci_dev->dev, pci_dev->func);
> +		offset = find_pci_cap_offset(pci_dev, PCI_EXPRESS_CAP_ID);
> +		if (offset <= 0) {
> +			igt_warn("PCI Express Capability not found\n");
> +			return NULL;
> +		}
> +		igt_assert(!pci_device_cfg_read_u8(pci_dev, &device_type, offset + PCI_DEVICE_TYPE_OFFSET));
> +		if ((device_type >> 4) == PCI_DEVICE_TYPE_UPSTREAM_PORT)
> +			return pci_dev;
> +	}
> +	return NULL;
> +}
> diff --git a/lib/igt_device.h b/lib/igt_device.h
> index dad7bb047..781a72235 100644
> --- a/lib/igt_device.h
> +++ b/lib/igt_device.h
> @@ -35,6 +35,7 @@ int igt_device_get_card_index(int fd);
>   struct pci_device *igt_device_get_pci_device(int fd);
>   struct pci_device *__igt_device_get_pci_device(int fd, unsigned int vf_id);
>   struct pci_device *igt_device_get_pci_root_port(int fd);
> +struct pci_device *igt_device_get_pci_upstream_port(int fd);
>   
>   void igt_device_get_pci_slot_name(int fd, char *pci_slot_name);
>   #endif /* __IGT_DEVICE_H__ */
> diff --git a/lib/igt_pci.h b/lib/igt_pci.h
> index 92b9cc392..84355e9dd 100644
> --- a/lib/igt_pci.h
> +++ b/lib/igt_pci.h
> @@ -20,6 +20,8 @@ enum pci_cap_id {
>   	PCI_EXPRESS_CAP_ID = 0x10
>   };
>   
> +#define PCI_DEVICE_TYPE_OFFSET 0x2
> +#define PCI_DEVICE_TYPE_UPSTREAM_PORT	0x5
>   #define PCI_SLOT_CAP_OFFSET 0x14
>   #define  PCI_SLOT_PWR_CTRL_PRESENT (1 << 1)
>   
