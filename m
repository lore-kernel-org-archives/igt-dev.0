Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4940FE77184
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 13:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC2B10E227;
	Tue, 17 Dec 2024 13:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k+XJhs1R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C1710E227
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 13:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734443209; x=1765979209;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=LteP/8K81VQmSs83hXUgkJIUWEhrEaOgMKwf/tqmC6U=;
 b=k+XJhs1RjGVw2bU4zo+1V3X5pizZUWkOm3C2j7xoh8aQeXDm6/ZVNczz
 LUpTITRKZM/bieW7XlVTfq2CvzphNe17iopjtRE3XlzSetAc3cz+zJ0tE
 qcEZL0lkxoYQTS5SUUizHcMU5lq5PcC94V5BdMYcOYRgRGzLPCPoyvHKL
 JNY+fwhn7+YUfUXXaAIHpH11rN/UAQnciOmhenOnXiEn5QmgasoaGTz+l
 eCzKC/PsrKCKO9G/1A7rYg5SBrYQEloRCBU4WaiOKxeGtm7I/jGAmFC3P
 L74bUS14KJilv1i6HHga8nXH0jZCrueanIvEad01weCzkVB8PbjMDtc3s w==;
X-CSE-ConnectionGUID: mwJvuRzsSP+H31sW2yk5Pg==
X-CSE-MsgGUID: O7s/0cD+RiaRALaeNZqc9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34906037"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="34906037"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 05:46:49 -0800
X-CSE-ConnectionGUID: E55kyH9zTTqhQp27FiJH8A==
X-CSE-MsgGUID: BCM2eHm4QzyCQJlpHlTgUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="128352557"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 05:46:49 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 05:46:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 05:46:48 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 05:46:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqvcUdw/ciFAahaJxDm9Jmpte7pgjwKAEgXSx9JSffB08jvgPZQI8ph2KKc+W+Qs2TOEj2zzrVt1rnVdeZ1hqiO0pbN0nM5JkMnqrpUvuNuK/NDtnUqq+NeCC8wSQaaKBZgIuQMhPlkTgZTGGT2tY04ZQgHPwcjygwmEQ29qzBs8lGVsNibwgF2br9fPZ+kfi0kWZ/CwNBjezZ9m3xB7E+RSIc+mcSJ8G8aiRJ3nt+hOXs/l6VPfZ8/MJCKniYIU1hJHqRkw0WzYFnHvaauo+MWzUGDGP053uPzbYXfSoIBBOy70AjkoHRndyfwUCplDvNFSwoNu1qjErRnig5pgWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBW4vrycQg6TqsGlfdj1w9E2eqoNr1SG9QTXe7PiIeI=;
 b=rWrePUMeYi1uzlxk6tAUqTiPTRHTC8FLv9azAcSUw3y8uoentbGSNW5GLZjz44GHmgqQxlK7ukISV51zj9gO6R5XEecayC3VGaJOn+WiwyKJxNOicFDAHVmHsbO84/10GHMdHgFfwsH/kcAWkj2cTTRyAgPPwhf1aX3e4RFw4A8HI36cfOMXPm4U+cxmifgq/K7pRdOThvyP9C801k8yTrqVbdbBQhSuJK7Nndf11FUUixM65xodM2ULwlXpweq2AfkICpzefSVUQSHVo9k1dOuiStLG9qGcgNC42gESJ/f69QmT4WEzfY1SjYAPquWkiu1GC5l0rk8kja6ok9Th/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18)
 by LV3PR11MB8577.namprd11.prod.outlook.com (2603:10b6:408:1b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 13:46:05 +0000
Received: from BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b]) by BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b%2]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 13:46:05 +0000
Date: Tue, 17 Dec 2024 14:45:53 +0100
From: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <andi.shyti@intel.com>, <krzysztof.karas@intel.com>,
 <janusz.krzysztofik@intel.com>
Subject: [PATCH I-G-T v5] tests/intel/i915_hangman: Fix spin engine hang
Message-ID: <ewfsrzwiwey464lvqix4apzswvmfs4vvwbnndxdbrvtmtyjev5@p3lqcqy6sxve>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-ClientProxiedBy: VI1PR06CA0201.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::22) To BL3PR11MB6409.namprd11.prod.outlook.com
 (2603:10b6:208:3b8::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6409:EE_|LV3PR11MB8577:EE_
X-MS-Office365-Filtering-Correlation-Id: 56386b8e-635b-463d-6a40-08dd1ea1273c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVdxNUV2aUtIblFNc0YyUFhNRHVMU2VRbGQ2TUhMTkRmNEdrdi9pRmRXenJS?=
 =?utf-8?B?NU9qekU2SEwvYWxwMTZURTF5YmRrRTdBREpLdjBOMFhTeHBLRER6Rm11aUtj?=
 =?utf-8?B?NkI3MXBheE9mQ1ViOHNHVTBVSHZwUHAvNmtNT1Y1ejFvM3FnclZTRjhtYUty?=
 =?utf-8?B?Q3ZEb0VmNFdaMGV4VFJXdGN6aVFxSjFxM0VBZVdTMTg1bCtZV1RjaDk3aC8r?=
 =?utf-8?B?YlBqMWE1N2YySXJjU2pWeUFXSHhFRzdTVzUzOEsxYjNSTTcrcUVJNFQyTldR?=
 =?utf-8?B?Vy80RURiTG9LdWQvK3JFSGo2NDR0c09Dam1Yem5jOXFMN1FORkVFM2hEbUFj?=
 =?utf-8?B?ODVUYldZTHpuNjdUVzBTMzJNUk1iOVo2L3FJVUxaVFlVVm9UNjJZelNJR3dn?=
 =?utf-8?B?Y0VmVTRwNnRWTTRwYXBZREtZd1FVR0Jibm9TT2FKVU5zMlRuWGlsQVBGaHVo?=
 =?utf-8?B?a21IREZBM0JBL1ovMXNnWU0vODJiYyttdFRjc0FzUkxGVmVTUmV1ZmJ6dXJU?=
 =?utf-8?B?S3FkeHNXYW5aSU82YlRncUtYdG1mV2VDc1NaRkt3VUZrUFhQYUtkVTNxSHdi?=
 =?utf-8?B?M1BabHhaVElia0lPbGJWSW44UG5pUTBNYjRKeW9yd3BkK3FQZlg1VDN3YTNF?=
 =?utf-8?B?Wk9wK0w4MVd4clVrTGJ2MEFzKzNyUDRKWWhycWIxWWg2Q1R2ek1rRG9oZjY3?=
 =?utf-8?B?VUJWMVhxcnU1Unl5Vm01YVBkb2ZUdExOcFJRNXdHaHlZVkZQUThWM214OE1v?=
 =?utf-8?B?eCt2SERTQTJoS052SGI2WE5IcjhtZ0MyV0RqNmtPMHhIeTBEcWpibDd4VXZI?=
 =?utf-8?B?ZStteElod01abnZ5TmRPQkZHRTh1L0luMVVQNTA0RFZIWUwvTjBlK1pVVkw1?=
 =?utf-8?B?U2s0Q09kSkJMR2dZYkp3Q2cycWt2U3RZNXdQQzgwemozSVE5QnN5RENQcXZJ?=
 =?utf-8?B?cWRnS2cvS05MVHpVbUtISlBYOUl4VnlpK2o3WlZMNm00UGNLOUE1OWxaUFp4?=
 =?utf-8?B?YzZvOXpLN2l2Q3laRXR2bWhDMFRJSVNKUnA2akdGSGNEdjFQYURZTElITkZq?=
 =?utf-8?B?M3duZUJXSFZLbGcxSTFTc01tWDd5MVRzNDFnZ1M1RDZId3pCWFp4YzFUY0FD?=
 =?utf-8?B?UVVBN21ENW1Rb21LWVJUM2xCZ3pOOFlTUHkwbDJseHV5b2VaYWxoZ1BTUnoz?=
 =?utf-8?B?WDBxZXhReVIwWStmT0J6RXV6MFZydFhDc1FWNE1QbGFKR0dHT2ZEelNQQzJn?=
 =?utf-8?B?M2lhOGgzL2xJdW5UWXhSZXRudC9uZDlDaEcwOU1ZamV3cE5ScjNxRlNvdG9j?=
 =?utf-8?B?YjY4OEdTRThPcEUySk05TGkvaW9aVHdybjRpbXVnSmQxN1pyL1BENVFhNnJo?=
 =?utf-8?B?Y0E5N3VLQzZXQURHTU8xNmxMOGdWZ2MwZ2N1RHo3c0R6N01OWXY2SFpoK3J1?=
 =?utf-8?B?SHo0WFpvbVJKdkg5QTR4K01zODBBOGYrMkQ2QzZodTJKVm4yQ0kyMHcrZ21T?=
 =?utf-8?B?TnZRM3hMdklVUk05U3pwV0tzRG0yODVFM25aSWtpYXNWcEEzNm5iVWdHNVN3?=
 =?utf-8?B?ZTNCMTdaMUZZeDdrNTB2RCs1akFVbTZJU3BhUEhyd2Nib1JrK05aeGF6YklF?=
 =?utf-8?B?U1NDUnFNSnRNVzZEbXVhdlV5MUJLUEJXM2VNSVZxUGIxOXJjT0tSdXYxUmpN?=
 =?utf-8?B?U0VNQXVGVkx6eXl4NS9YMWM2bGdlWGtNUGZKUy9GbXI4WDVjNWdUdkRVQS9V?=
 =?utf-8?B?cFBrSy9JbWxndWgwWU1rNEo2VlZXbWJPTmlLRFR3eUpXZHoreWxld01WUEE2?=
 =?utf-8?B?Q0c5dFlkQXZsN1grTzdVSGp5eXlyYzh3TUhTUmc2bVBwL1VVdEN0Z3EveDk3?=
 =?utf-8?Q?d2JxLx0wQX7P0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVUydFNIbStMbzJjNnZycDNudkpaMGtDRzMxdUFxSjM3bnBlOTJlMEc3ZDh5?=
 =?utf-8?B?amR2R2RmcG15RXhvZytIK2ZlS2h4UU5Rd01XbnhSeWpobTYrWjdpMHc2MnRS?=
 =?utf-8?B?V3RMdkNsL2wrbXA0TDNTRmVoL0pLNXRDNlJGZ0Y1TkdMVUZ1dmNBdVRVaGdF?=
 =?utf-8?B?SlpZMXNEcllPQ3JRVnRrMzhOb0RYK09qN3lNTExMZlVaZFVNYTB5alZVdUpj?=
 =?utf-8?B?TkF1Y2xLZ0Q5VzRqSXdvRXVqNlo2ZFRKUy9RUXRZbDE4alRWcFVSemQ3NGJk?=
 =?utf-8?B?VllwYkJwa05nSXFPbFg2YnJhcjRzekJrSEdoc2d1UFc5K1N4NEE1QU1rVDVz?=
 =?utf-8?B?c3dFb2RnQ0JsOER1TkRXNm80dXJDZkU3TFFYd3k0NjBhS1ZJTjdnUkVJb2Nn?=
 =?utf-8?B?amNXU1BRTzMwdmxDOHd5bTNqbWloc0xCUys4d0RkL2tSWDBKNmt0WWMxRXI4?=
 =?utf-8?B?MGE0cWU0S00vYXdGQXFMUVJrL3gyMjV5c0hlMlEzZVd6ZUN3SmE0cE4ySTlX?=
 =?utf-8?B?KzVpM3BvZE1FaC9mV3ZwUStnODhIYlRaWHNwTUt5dWEvdHZLcXdQS2FFQXRr?=
 =?utf-8?B?bTdQTWljdGZSRWtaUTMxSFFVV1VwaWcrdWNsTjZ3YzhMbXpSb0phUlM0MmEy?=
 =?utf-8?B?QUFNeHdXay9hWTBpZUdBUmRhYVNFOGRyakJMY24xM1JuaEI2WlVMbkZuRFRD?=
 =?utf-8?B?cHFHYTN1WlRseTBGdHd3a1dhQy8yYks1UW94Q0VDZnk0cVNEdXk4N1ZxQnF1?=
 =?utf-8?B?eTU1eXZSOWNDTTJJSnowcjNscTlaK1V4aTdQeHJQOEtSNXVuTkZXREw5SFFJ?=
 =?utf-8?B?ZTBYVmRYUG85QjM4emFFVld1bGZ1a3V1MWw3cCtRZjVpd0FyZkN5SkIwSytq?=
 =?utf-8?B?Y3c5bjMvOGowYVNXVk9zY2Urd1d5QVN4M0ZjWGZad1B4NXBhQkxHcmErclFR?=
 =?utf-8?B?djNXakJDbGwwelJ6VWdUenJrbTQ3VzFGMVFHRmhZU1pCZDNSb1dMSlFXMFJ2?=
 =?utf-8?B?aG5kRWdrWVVJWXN2RnFNemNrRmdLVm5HZVFBaE9TUnF2cHFieHl1Q01Ra3p2?=
 =?utf-8?B?OE5hMHNldmhWeXpLS2RTUmt6VWE4NXdvYXV3SEVSOUxFSkJCTG1zcVNqRjdJ?=
 =?utf-8?B?eEFmOEU5dWY4OWxuVkxKY2U3RVg5L2RLQ0hLUDh5SUdDd3luOGdVY29xUTA3?=
 =?utf-8?B?NU41ZlhEZ1QzdWFocmIwTDVsS2tRQVlOMHpIREpqMSt2TjdsN1dlZDhGcUF4?=
 =?utf-8?B?VytXVE1qM3phb0RTK0pQdy9PMDRhb09tS1JobDVnWVBqdlV4MmNiRUJKSnBu?=
 =?utf-8?B?dVJGVElZc1M5MGdqYXBXa1g0TUYyaXlnYmJkQ2RCSmdBRjVHbjdCZzNMT3U4?=
 =?utf-8?B?WXdEWURlNkxRSU5HR1dXK0E2dE40MHd6eFRWQ1NQWE9xVTYwM2JtY2gvLzM5?=
 =?utf-8?B?WXNoMjhaUzByT1FvRklqUXZsNW1SU0VIc0xpcloxT3lzNlRXTjF1ZkNzMXI5?=
 =?utf-8?B?c082SksxMnB1ZGhabkZ0enRpaGE1NElFdXhqR2IvY25XL0s0Q1VxOGVwRFJW?=
 =?utf-8?B?UlZTMUFCeXJBUmlETTBKTHRYTXZwMUhhdjVPc3RKYXNJbkNOTUR3azVZZjI5?=
 =?utf-8?B?R2ZIN3V6amIwUnlmdU9DRmRoQkcwMDcxU2w2YVF2aFV1SW1LUVNKN1NJWSt3?=
 =?utf-8?B?c1BVdVhKVjJ2WjNvUTh4QUgxVnlTaVUrcHlKbEt5OEFObzdtRzk4aVlnR1c2?=
 =?utf-8?B?VTFDTUxuVTZlN0x3enhyand0bkx1c2NWcmZiaXBoOHlVdjJ2VkIzWnVHM3ZK?=
 =?utf-8?B?bDlMU0ZieWtrVEVhNUxHelZicmZobmNoUWRDcWVrSGhQUTBlUXkrTkJkclR1?=
 =?utf-8?B?U2NHMWxCMjZGY0t0Y2dLVklQLzkxR1dlaGpWcWdpek5BdFAxc0FKcEJycWdI?=
 =?utf-8?B?MVBNdm1BTEdsUGZNb1JTQWM3MURaNlgxRCsvM00yWUhLeVBJOXY2bjFHbC92?=
 =?utf-8?B?MWxUYmxGN2JHVG5Vakw1cVVMRWlJZzVBMGFHOEdmYUhIWnY0OTl5NzJqTTNI?=
 =?utf-8?B?Y0Q1V0gydFNWSnpad3VxdVl3RUtRdXpoK1VjY0FwWHVsV1JjNUo2VkpYZ2ps?=
 =?utf-8?B?QkRrbmh5SzJyMEpYMGJMR0FXR0VNdzZTazl0VmpFR0FzQUk4ZmZHdTZhTzFB?=
 =?utf-8?B?SWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56386b8e-635b-463d-6a40-08dd1ea1273c
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 13:46:05.4759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TAKYxkhB+Ttd9Q+PWxGzLvhgHbGploQpHEfXaqJtOju/Ezqjq1I/4YMl4HChNPzWTqqaRFxJAxpf0DyeNGmRc86lr5w0/cAgS4ptaC8s2Z4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8577
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

On DG2 when RCS engine is active, the CCS engine freezes which leads to
hangman test failures.
This patch disables RCS and CCS background spins when testing any engine
on hangman.

Signed-off-by: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
---
 tests/intel/i915_hangman.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/intel/i915_hangman.c b/tests/intel/i915_hangman.c
index a556eec53..6f1fdc788 100644
--- a/tests/intel/i915_hangman.c
+++ b/tests/intel/i915_hangman.c
@@ -365,6 +365,12 @@ static void chk_err(int *dst, int err, int expected)
 #define ERR_FENCE_END  3
 #define ERR_FENCE_STAT 4
 
+static bool is_rcs_ccs(const struct intel_execution_engine2 *e)
+{
+	return e->class == I915_ENGINE_CLASS_COMPUTE ||
+	       e->class == I915_ENGINE_CLASS_RENDER;
+}
+
 static void
 test_engine_hang(const intel_ctx_t *ctx,
 		 const struct intel_execution_engine2 *e, unsigned int flags)
@@ -388,6 +394,14 @@ test_engine_hang(const intel_ctx_t *ctx,
 	 */
 	num_ctx = 0;
 	for_each_ctx_engine(device, ctx, other) {
+		/* Due to Wa_14014494547:DG2 we can't run RCS and CCS
+		 * in parallel. We still want background spin of the
+		 * same type as hanged spin to be run.
+		 */
+		if (IS_DG2(intel_get_drm_devid(device)) && is_rcs_ccs(other) &&
+		    other->class != e->class)
+			continue;
+
 		local_ctx[num_ctx] = intel_ctx_create(device, &ctx->cfg);
 		context_unban(device, local_ctx[num_ctx]->id);
 		ahndN = get_reloc_ahnd(device, local_ctx[num_ctx]->id);
-- 
2.47.1

