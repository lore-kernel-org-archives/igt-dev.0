Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B8CC02190
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jan 2025 06:30:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482D910E34E;
	Tue, 28 Jan 2025 06:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lLLguA3I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161D510E350
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2025 06:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738045850; x=1769581850;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9BrFiN0nRrHTDN6Q1kLJK9bpSZN4YNSdbIGAVdC2dGw=;
 b=lLLguA3I/PCbSCW17Oy2af/czVJDDeZAZJoESfrVIjmgdcyONO8vzRK9
 DZpqfhWTVrzqyn5c7xIikd7TAiNho0IzGhrWAFkRu70Duug3I0mjsGIVU
 LByHrFWKhPW9DOSfxGaBH0lC5sEoKazC2eHpFIMeJrqtq8JuF67lBrAbD
 xffJW6NB3UroCrn5RK803DVspBWYQeIl8wUAbAVddNhTf/HEecWHeojys
 JtmxMh2G2kPs6y9DqNdGpGM6s9c9U9TQ7zFiySJVK8m7GFP5atZcDuJSk
 O9i4Pa5yB9WiEPmGrs6BVkwaebWLhkc5sAQtuk2zFzbXoOyHuI2XAFF1k g==;
X-CSE-ConnectionGUID: vD+j5uMLQtKaGqnxIgJwIQ==
X-CSE-MsgGUID: Si2GR538Rk+geB4kEtu+xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="49506082"
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; d="scan'208";a="49506082"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 22:30:50 -0800
X-CSE-ConnectionGUID: tt5q+CjdQ0KKFG5iiQQbLg==
X-CSE-MsgGUID: A3WTMXajReKsM/PUDA+u5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="131946282"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 22:30:49 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 22:30:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 22:30:48 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 22:30:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AiGWUB4iaPrZRnkcev4IUuF84ahztfu3L+CBruI8SghLFuOgfzwIFKH+Oq2IAwUQg+BOWjjjXkxoYdlJG8omLJI7nRUTqvJcLqCdNKZWWUPaBMQiXNzrS/pq2mfqTtrbLG87xqLGXUILwWuhMsSpEDQgvSZdTvSBw3TTPm0nRvE8qQ36GQbjleTsXz+ODyuU6x6gWtpkM/U3UrU+D14LZQUC0pkpsc5tY4O2jxIx6Z9Ioiof40qL5OmeryxOtYbRlppqN68a6MYo0lTBMczGmL10wqrmbgbQ14s94AvB4VajmYFJog3tDJZLavz+87V2lmjPVXXP5YKuuZiO6vwwuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMlyliEnt0PmpsrtMN+ePdSM0r36lAgkcCLLw+5AXRc=;
 b=MH+ro36UYgAnuS7aM4Osfw3ActVtDLxNReayzlhp5qPU/x2JJlTV0SCVllhenHLLZdRtb+qHJMQg4tMk3ykTda0pPN5Fb7fUPgXiT+//UOwynQqkV/mTfEl3hl8TOeVIwlhjG89cr58rd/7Oa57PE3XFItjL/ruUcinhF8NxmDKANE9XzXLB2fd9ugPLobkcu06uS0d+YFfFwtre9QkN/OspXkPJXelKzcmYT1D5wq5EsNNJsLuyz88K+BG+V7RTA/u6coWRc9K96wiI++nf5qLngYvEAhR3i2fUQkdWuXAgbPJtRK/WAlwZCzN1PSyDPmPElU5UkK+M48QEbiZxgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA0PR11MB7306.namprd11.prod.outlook.com (2603:10b6:208:438::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 06:30:32 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8377.009; Tue, 28 Jan 2025
 06:30:32 +0000
Message-ID: <50a7dd94-2ca0-40a0-a4c6-fb12a3a723cd@intel.com>
Date: Tue, 28 Jan 2025 12:00:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_joiner: Add a new test to validate
 non-joiner mode
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>
References: <20250126181931.3356853-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250126181931.3356853-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0186.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::13) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA0PR11MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c2a9b12-8da9-439e-cf6b-08dd3f6543e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzJuRGZ0aDVVVUhsWHJzb0JrQS9wSVpIdFFiM0czR2U2MDZ6dHl4amZjZk1q?=
 =?utf-8?B?Mm9ZbkNJcDFWb1RPcDgrUGJ3UlRoK2pqcVlsUGZYdWhCOW81QVkybGZmbUVV?=
 =?utf-8?B?dlFuYkFiVk5OQXNJU1J1QzVkcVhwbUVBWkZXVGxXN2M3ODZiMzFHYWZXcHBz?=
 =?utf-8?B?VFMxb29SMjVSb2VybDI0U05XTE9LQ3JmdXhjV1BRbGRTWWxEZ2Vyekt1Q0pk?=
 =?utf-8?B?RFJNYmdWTUVsRUIrMnNLcGxTMVlSK1o1VjdJODRQS0ZNZjN2YTBSa3pibVV6?=
 =?utf-8?B?S1ExU2t2S1Era0k5QklUWVBnY1Y1WmNnMWE1RnE4OVBHOFZHTVpyK1I3WFBy?=
 =?utf-8?B?M2luOURRc1czc3pWV00rVzM4SjJ3dTFNSXlBaHFhQ3piMldKelBRV2JXby9X?=
 =?utf-8?B?K0tPSXlqZUQ5OVg2ekpyVklONnEvMTZ4ZUtWN0JTVmpKMVVBNWQwZFBhRTVQ?=
 =?utf-8?B?ODJXUmVheGRMNENWZkxxZWZVc2h1blp3WVJCQy9DQk5VUVNlemJrOFI4Zm5Q?=
 =?utf-8?B?VDBTM05Rek9RMmhWQmU1SnNWeFFpVEx2WnRGSkR2UlZIK3BkdlYyZUpNQWhu?=
 =?utf-8?B?MG42TndaYVRqanRpQXlKTldTNENjNnNFdE9BT2d4N3FjOTQ5ZlVReFI4REQ1?=
 =?utf-8?B?b2duazBTK3Y2TzVpb2NHRTBHVFZSU1RGV2JmVHkrYnlRM1IrYnhaZXdySnV5?=
 =?utf-8?B?a3VrUmdYQ0F6VWJOUXBjQ2VnM2F2SklmT2FXdDdpZGQ1N0Zpait2MVcvd3p2?=
 =?utf-8?B?ZDhNUkZkTzBzeEdLb2pDV1VDZjVINnZ2TCtickZpbk04QVVyMW42c0J1cUd2?=
 =?utf-8?B?Yzdud3V2MERsVnFzR2xTUlowMElUNU9BTm5DbHlFcTI2Nlhna05VWFAwWktQ?=
 =?utf-8?B?Q3J1Qk5EeCtpVHBlVlVvRWFvMDJ6OGxPcExBMXB5YktnU0s5dmphR0dwdDVX?=
 =?utf-8?B?QjdNaHFrNGNITzlKTllBUjhZdjVYUzJ4bkI5TitDc0JDZDUzWnZ2bUpxeUdP?=
 =?utf-8?B?VklUSzVUb0lqcm04eUtBSGEyMkVrMHlSZ3hmZnIxVWhhdUZPc1dUT1lxUVNX?=
 =?utf-8?B?VFh1MG1KK2JGa1YyRlcvMGF4c292UUdmS1l5UWpNaGM3b3A5a0pjNHpsWnU3?=
 =?utf-8?B?d05jejdhanh6MU55eURWNXNET3lDMjk5UStKU21XNjRqWmtNTHJsV0JtdXpu?=
 =?utf-8?B?QzcyUUs3OGZ3N3RWSDJqVlZoM0R3RTdsVFN6Sm5ocldrRkU1c3k2bFVjTUJo?=
 =?utf-8?B?Wnk2VjI2Umc0dndoYWlJdVlPd2M2bEJ2YTRZQW9tMjR1eVJiaWpYdG0wc2RQ?=
 =?utf-8?B?cjVHeWdsVFFERGlmNFIxVndwNDM1aWJDNW5Sby90dGY3Y09OaDlJOStOS3VZ?=
 =?utf-8?B?MWFDSW9QY2FiYklKSUEzODNCZUJmdnJldnNxa01tTUZrNm9hMjFITjFiS0x0?=
 =?utf-8?B?a3RyUUkzNkVoRlZjVmFweEJDWktqZHJPaGxEVktoNmVUSjlDeUpqa2Q2bEZa?=
 =?utf-8?B?cVVDVHlMREdxU1ViNWtmaThOdjB6dk9tMlVGYnJ1SUdYdnltRWZQSjJLaEdm?=
 =?utf-8?B?eldJVmgzS1A5ZzRJc0ErOWladFNEcXBFME1lazVUWGZGSVNQaEJZdWVkS0I5?=
 =?utf-8?B?b01hNDVZVUg4VUdQZGZYNnBWT1I5RmdQbERQd2I1SVBLMWFhUzRmUkZPVU8x?=
 =?utf-8?B?bDNSK0xXOStDL3FQUDBMM3pKMzd0emJ5SE0ybk8yZFdmNUdYK3hrTmJkaVlP?=
 =?utf-8?B?UXpYSWlaNWlVNWVyNFBzVkxvSWROYVcrd2FJeGRGZll0eHVxOXIzcEFJVUta?=
 =?utf-8?B?aTNsTTcvUW51NjA5d1Bad2VFb09IZmw3b0dTTVdjSUdTOEZ1U1A4ZkhRN3RO?=
 =?utf-8?Q?xkm3srRoQjU1H?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWZtRHZWbE0xTDNSaWRqRlpTUE1ud0RGWU9TYlRndUtWVEtHbUo3dlE5UllG?=
 =?utf-8?B?djBTNlgyb2JDb0hkQWE1dW10a3RlMnl1VHlMTmxEUGRXS2d2Y3Z6a1lOYXZh?=
 =?utf-8?B?aGVuOVNZRjg3cmJ2S005dDhVVytHeTFqUXh5bTNDTGRWT0YwdzFOLzNIbVVS?=
 =?utf-8?B?dUhmMklkck42U040bGxycUdCSk5oTy9JOTdaU2YrQi9tUlVvTVJZSy9wWmFi?=
 =?utf-8?B?Yk1iSXJyUUdPdis5QUU2N0pSdTJ4K1B2elNGZlpGc1hodkFyNXJjTHNPVWZy?=
 =?utf-8?B?T2NHSFQ5bWNBRXJ0N1U4RUxQenpqRDZNcDFLd0dvZ0plL3JGM3I0bWxMbzI3?=
 =?utf-8?B?YzA3ZUhCb0VtWUNHcXphUjFGTGlPa0R3a2lQaVlNbU51M2N5cW5QVzRLa2Y0?=
 =?utf-8?B?YlVBd3IzYWtvY0VOTUYwck9jaVBSRlQ3bEFsUUE1cUVBdk55K2pXVzV4UDNW?=
 =?utf-8?B?MG9meENDR09aK0NHNnVpMm1oK3djVHEyeFdiSkllMGVqbXBSREYzS0o5V1lH?=
 =?utf-8?B?K0Rtb2djS0tFWnZjdW9KTUxqMyt3M1ljZ1Y5dzVja2V1RDdNOWNLRlFuMndT?=
 =?utf-8?B?MUg2RU56dnJCL2syNmNwdko5ZnUzSGtxVGo1WlBQSk9mU0FtVmpvekcxdEFG?=
 =?utf-8?B?S2ZjQ1ZnWnFsZHFOSnAvRFVSZlhnNlhON2pTN0Jwbld0aFN2dDJUS0p5a3pU?=
 =?utf-8?B?dXBIR2xCMVRPdXBNK05mS1AvbGZIdWNXVkVQOTNnQlpwcnFLbUdkaTYwcVcy?=
 =?utf-8?B?UWxjRDNMbmN5RGw1K1VXNWRvNDIxSnQwTW03enVEVlpnRFROa1hZcUJMNVY3?=
 =?utf-8?B?R0N3T3cwOFE4OXZQb3RkTGhvamQzM3hkY2theC9vekdJaUlGNEY2OS9YdUNn?=
 =?utf-8?B?Zmx5UDlZOFY4VFgrVDB2SHp3ZWdwNDk5RzBWdGQ3OFlpdXpOUTZxRC9nWTJr?=
 =?utf-8?B?NHkzNGtqeFZnYmFaVE12ZE5DTURWSWk5WHJQK05rSkQ1a0NKTi83SFE2MmdI?=
 =?utf-8?B?VFA1OVZVWmlmWExxZkpGeVR3WVNGLzhLUWEwcTB0UUdzeS9CZVFuRkRXNTJM?=
 =?utf-8?B?YVJZbzBzT2FRcy9sT1R2UWlnREcyaEdWU3loOXJNbFZvMUcrcG9qWmNFWUZ6?=
 =?utf-8?B?UlNkVUlLamxSanBSQjYzVFdjT1NpSEYwRGQ0bFhxRjJrQnNGN3VFVlp1MUNo?=
 =?utf-8?B?bHdWZ1hMZXpHdTdFWXhKWXFCTGxGMWUyMnRyMzc3VGkxcGZCb0cxZThCV0Ux?=
 =?utf-8?B?MlVEL0oxOE02SHZvRC9YREJscW5tZHNpVWVObHQwbnhubUR5UWE1NllWR3VX?=
 =?utf-8?B?dDE1V2VKRjY0VDVDS0ptcXYzSHVnQWljTGI3VFNWZmpPYVZ1a2VpZFgzekdP?=
 =?utf-8?B?dmhDYWlWaVhvL2xnZUZqMEhDczhScnE2Q1Z5dEdRem1ZdS9GQ1pkS3BpY2F3?=
 =?utf-8?B?OU9RQ3VYS2h1RzZzMWd3bGczRXB4bHBXVlJ4Z2U4R3g2MlU4YkZzUjVWeVQ3?=
 =?utf-8?B?SmdhTXlQTHVuWnp1eGV4akhldzcxOFRVZThGTjBkT25pbGsvUEl0NjJGOVFB?=
 =?utf-8?B?WEJPQWwrWnhGVXJGU1hhOXhpRkdRVzJjTVFDNmhFaWNGa09PaUtralNGYThy?=
 =?utf-8?B?VzFjSWs1cnpzd1owYVVDM0kzQ2x3VG5mcjdRTFhmTjRoencwOWpzRU9EM1h0?=
 =?utf-8?B?K09GOXk1Q0lkck9yS3dEMW5pOXpNMklGUmNsR3Jad3d1b2pWaG4vcmpLNktl?=
 =?utf-8?B?azN0bjMyTXV5QUF0V2xjZTAzTklLcHhyalgrbWJDWUlRckNrYmJRYkhNaWFS?=
 =?utf-8?B?LzB2Ylg4WmF1MDRadjhzU1dUVzZYYS80alVLOGFEVU9lVUdTQmx6TGRZU1RC?=
 =?utf-8?B?UE1pTG1manlGK2FlUFpGZVBJU3dJSWFQd0d3Zm5TQjRlZVJYN1BWb0JUYzRG?=
 =?utf-8?B?cnJOeTcxNHpRR2w4UllqOUVDOXRiMi9hbmZsd1lKR0NhT3p4cVpLeldvenJM?=
 =?utf-8?B?dXpZREZpcXF4Z1I5cWhyZStMYUdiSzNkYXJ2NHRRMjJySURETm5ETXd1T2h2?=
 =?utf-8?B?dXJrWGxXLzRrZFkvYnp5dll4U2NYQmlNY2VlU0JGbUVFN25yVFFxTFcvRDMx?=
 =?utf-8?B?UGQ2WEVqWmhxdmU0UTg2NzVpVkJpQmxYWHNQUFIvTTFUaU1JVnpkR0lQMFJv?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2a9b12-8da9-439e-cf6b-08dd3f6543e5
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 06:30:32.2938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKI7CYY+Fn5UqirBbQE3rY9ULUxDOsdjPGF+2inX1Y9mlgKeLEMCquzKmqHJeUEtKRovfTTtjC24kHBzl+XaLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7306
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

Hi Jeevan,

PFB few review comments.

On 26-01-2025 11:49 pm, Jeevan B wrote:
> We need to ensure that the system does not use a joiner for modes that do
> not require it. This test will validate that the correct non-joiner mode
> is selected, and then forcing a modeset and flip on the last pipe. If the
> joiner is mistakenly enabled for a non-joiner mode, the test should fail.
> otherwise, the commit should proceed as expected.
>
> v2: Fix nonjoiner_mode_found to find the required case(6K@30).
>      Remove clk sort and minor fixes. (Karthik)
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_joiner.c | 78 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 78 insertions(+)
>
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index 086cfeb71..3d9fa095b 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -74,6 +74,9 @@
>    *
>    * SUBTEST: switch-modeset-ultra-joiner-big-joiner
>    * Description: Verify switching between ultra joiner and big joiner modeset.
> + *
> + * SUBTEST: basic-non-joiner
> + * Description: Vefiry basic non-joiner mode across all pipes.
>    */
>   IGT_TEST_DESCRIPTION("Test joiner / force joiner");
>   
> @@ -85,6 +88,7 @@ typedef struct {
>   	int ultra_joiner_output_count;
>   	int non_big_joiner_output_count;
>   	int non_ultra_joiner_output_count;
> +	int nonjoiner_output_count;
Rename variable as non_joiner_output_count. Make similar change at other 
places too.
>   	int mixed_output_count;
>   	int output_count;
>   	int n_pipes;
> @@ -94,6 +98,7 @@ typedef struct {
>   	igt_output_t *non_big_joiner_output[IGT_MAX_PIPES];
>   	igt_output_t *non_ultra_joiner_output[IGT_MAX_PIPES];
>   	igt_output_t *mixed_output[IGT_MAX_PIPES];
> +	igt_output_t *nonjoiner_output[IGT_MAX_PIPES];
>   	enum pipe pipe_seq[IGT_MAX_PIPES];
>   	igt_display_t display;
>   } data_t;
> @@ -164,6 +169,23 @@ static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe,
>   	return master_pipe;
>   }
>   
> +static bool nonjoiner_mode_found(int drm_fd, drmModeConnector *connector,
> +	    drmModeModeInfo *mode)
Fix indentation here.
> +{
> +	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
> +
> +	for (int i = 0; i < connector->count_modes; i++) {
> +		drmModeModeInfo *current_mode = &connector->modes[i];
> +
> +		if ((current_mode->hdisplay == 6144 && current_mode->vrefresh == 30) ||
> +		    mode->clock < max_dotclock) {
> +			*mode = *current_mode;
> +			return true;
> +		}
> +	}
> +	return false;
> +}
> +
>   static void set_joiner_mode(data_t *data, igt_output_t *output, drmModeModeInfo *mode)
>   {
>   	igt_plane_t *primary;
> @@ -491,6 +513,48 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
>   	}
>   }
>   
> +static void test_single_non_joiner(data_t *data)
> +{
> +	int count;
> +	igt_output_t **outputs, *output;
> +	igt_fb_t fb;
> +	igt_plane_t *primary;
> +	drmModeModeInfo mode;
> +	drmModeConnector *con;
> +
> +	count = data->nonjoiner_output_count;
> +	outputs = data->nonjoiner_output;
> +	igt_display_reset(&data->display);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
Do we need this commit here?
> +
> +	for (int i = 0; i < count; i++) {
> +		output = outputs[i];
> +		con = output->config.connector;
> +
> +		if (nonjoiner_mode_found(data->drm_fd, con, &mode)) {
> +			igt_output_override_mode(output, &mode);
> +			igt_info("Assigning pipe %s to %s with mode %dx%d@%d\n",
> +				 kmstest_pipe_name(data->pipe_seq[data->n_pipes - 1]),
> +				 igt_output_name(output), mode.hdisplay,
> +				 mode.vdisplay, mode.vrefresh);
> +
> +			igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 1]);
> +
> +			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +			igt_create_pattern_fb(data->drm_fd, mode.hdisplay, mode.vdisplay, DRM_FORMAT_XRGB8888,
> +					      DRM_FORMAT_MOD_LINEAR, &fb);
> +
> +			igt_plane_set_fb(primary, &fb);
> +			igt_assert(igt_display_try_commit2(&data->display, COMMIT_ATOMIC));
> +			igt_plane_set_fb(primary, NULL);
> +			igt_remove_fb(data->drm_fd, &fb);
> +		} else {
> +			igt_warn("No valid non-joiner mode found for output %s\n", igt_output_name(output));
> +		}
> +	}
> +}
> +
>   igt_main
>   {
>   	bool ultra_joiner_supported, is_dgfx;
> @@ -505,6 +569,7 @@ igt_main
>   		data.ultra_joiner_output_count = 0;
>   		data.non_big_joiner_output_count = 0;
>   		data.non_ultra_joiner_output_count = 0;
> +		data.nonjoiner_output_count = 0;
>   		data.mixed_output_count = 0;
>   		data.output_count = 0;
>   		j = 0;
> @@ -523,6 +588,7 @@ igt_main
>   
>   		for_each_connected_output(&data.display, output) {
>   			bool ultrajoiner_found = false, bigjoiner_found = false, force_joiner_supported = false;
> +			bool nonjoiner_found = false;
>   			drmModeConnector *connector = output->config.connector;
>   
>   			/*
> @@ -533,6 +599,7 @@ igt_main
>   			 */
>   			bigjoiner_found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
>   			ultrajoiner_found = ultrajoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
> +			nonjoiner_found = nonjoiner_mode_found(data.drm_fd, connector, &mode);
>   
>   			if (igt_has_force_joiner_debugfs(data.drm_fd, output->name))
>   				force_joiner_supported = true;
> @@ -548,6 +615,9 @@ igt_main
>   			else if (force_joiner_supported)
>   				data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
>   
> +			if (nonjoiner_found)
> +				data.nonjoiner_output[data.nonjoiner_output_count++] = output;
> +
>   			data.output_count++;
>   		}
>   		if (data.big_joiner_output_count == 1 && data.non_big_joiner_output_count >= 1) {
> @@ -713,6 +783,14 @@ igt_main
>   		}
>   	}
>   
> +	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
> +	igt_subtest_with_dynamic("basic-non-joiner") {
> +		igt_require_f(data.n_pipes >= 1,
> +			      "Minimum of 1 pipes are required\n");
Fix : Minimum of 1 pipe is required.
> +		igt_dynamic_f("non-joiner")
> +			test_single_non_joiner(&data);
> +	}
> +
>   	igt_fixture {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
