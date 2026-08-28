Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF855C61DD3
	for <igt-dev@archiver.kernel.org>; Fri, 28 Aug 2026 03:27:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8F210E432;
	Fri, 28 Aug 2026 03:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DUeFKrfJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107C210E2D9
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Aug 2026 03:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787887633; x=1819423633;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bSe+eJEe/P2eBaIqKNGwE+RHw7U+RXFpWUoCR/TuTuM=;
 b=DUeFKrfJ1G8zwH1SDBVw4MfOYZWaPGhC2YdGL/sDAWOf21zKY0Fu2V8g
 M5qkALt175uJmgsKXW8AjDLWJ1Bf//EcsrsBh64hxKbw/3/K0d7u6+fVi
 q0AarH+jAT3iaQ+XHngVLcmHUDFDrZFWlm/isZ9jPmfDVS9L3jZuf5eeF
 hb62eNyUdteSb5EANIATQLyQA/A7FX9D58p0hAj71CanNoJt5drGYNuin
 hkYh1mIZPVvadOVodzEZyRpPbCQkImpZOo+r/0SHKLPWHv4yUOiHQGaIG
 c1PVMBSNCBQLIVjLCsr8eTRZUkz9Vwmo41F8G1+BbyGNUonaUaXd57JN5 w==;
X-CSE-ConnectionGUID: 1KJIQMSaQlaSPVFP3xEuuw==
X-CSE-MsgGUID: Cyf1+BPyQOyD3cLPkOCN3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88447923"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="88447923"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 20:27:12 -0700
X-CSE-ConnectionGUID: B+e7UQLPTZeVl1TFyoYSrw==
X-CSE-MsgGUID: zcKNvp3LSv2pQ5SZhxUD8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="297943920"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 20:27:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 20:27:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 20:27:11 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.38)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 20:27:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MEWLwWHCLN4SW4k3LoxZSp+Yqp3rdXvmqcorJHi2pkrNRe0EWvhwJa009zzaAgnTdZ/M2dLj6tOtl4kkQL6/Xu6579hbMLQqubMixYw4Wu6+L4tvVPT6+2nQZnzbiCofOIgevmLGwVsog9gHqJSLpQZolbvW9VYXutkMrphbNbA+C3bVf+bau+peygrFmHDB//4zmgtWIRGQu75kCr3jy6FUSLpR4dK9tw+3aiz41gva4Ba6XnPUW88NoY3tCmlZdZja3rmqhqYUKNVfub8utacxVodVaeqJQR/GHmDYCT1IctJdq+CnCjX2PU4G5mufE7CYj/1+OhOwBoejL5G62w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzmZAC7ZcNXp/N3B2d99bJoT6+YfNb2xqKl9GYnrYTE=;
 b=rq097SQya5ilJPTF7s5Grfo9OfyWwyWTEjMQ0GBqfoDcWE7KjXtbMMbsiiuVok0tzD9m33YDMk1Jpzw8EF3l3m2nE4rcdC51d0KUs1jVzyHA5c3Jqba5lXNFoWTmPX214qRGVg+gbT9wHuLoDyNGq0mMI65q+Pp7rMl68Gw3Mb0AzevEb6WaaAI97Qu981b8TqZVFHh6oLVL24KBc1cEu7cnEq+cuAXZHkc6LvxI6HlvFIGdwAECTxNdVkaMoVrRGq+Lehz/gvHi7yKyBUG4oZMB+gfrySFssw8W8/U7iolLtfW8iimID/cHF+O2q2hcpF4B7gLWoc3DZLVyFtYhyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by MN0PR11MB6010.namprd11.prod.outlook.com (2603:10b6:208:371::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 03:27:01 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf%5]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 03:27:01 +0000
Date: Thu, 27 Aug 2026 20:26:57 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <mallesh.koujalagi@intel.com>,
 <raag.jadav@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH v3 07/10] tests/intel/xe_err_injection: Add GT UC Unicast
 GAM Walker Command Parity Error Injection
Message-ID: <apEAAXg8re_KxkUB@intel.com>
References: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
 <20260824164133.129138-8-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260824164133.129138-8-ravi.kishore.koppuravuri@intel.com>
X-ClientProxiedBy: SJ0PR13CA0132.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::17) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|MN0PR11MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 249bca9c-4eaf-4fb5-b6ac-08df04b43976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|6133799003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: Ofxm7fvBUqlkseVApCP4nyN06bRhwP9oKcVg5YAunw2u/F4VwB/77uXDC/P7pwcaycHBn2fUtRpcFp5P7PeFJjCMqeHYajR8YTj6zUQVV+BHexkRU6C52KjBj3QmhOKkIa1gF+wyfjaB/+3/jUgTz2mmTEzsdh/nRGDnl4v2YJSddk6KLjzOx1aHAoNhnFpu22pwChOK5lGf2WVr6uhaddcWfHiAaBs9DPxNWrWBwf2ehCCZKLVO9xaxbY6WBivZzoTGz2iUOLMsnnDz5EDj9h5PgFVzZGMD1AZEtPqd25ixf0YE53sirOY/ZCmMrVxZp1FhTO2sLse4/rf192G28mjQ+l/EG1X3PV/kHHHr0mJx1ATkRm4xxFy1jZxCGUv1eTT5GqVkgK3b9I12QqWy9H9F80EmQ8Gxdr6I9JqCgF5mbhNZk/QyZplledEhdza8ysFxvmwaU0JXImhNEF7tOKgET+ooZfP/4h5iQrCU/Tb8Q8U6EdZ8vPVTK+nShZXLqmgI0T/aU/77tOGyOWbLWNUJIPp4nDB0jC3fAi2po45kCWfLUQIdsw5IJ2h1Qx5RRudy86UHQj3Q7/xHlS3qcflS9ABFCI6nJ1plThR37w5mv/X1eFERVtNbRnByU4Yn7BqtLHQuWKHhqphwyXg+H69nZG+fx840W3WcSjScLiA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjRGQlVQSXpuWUdvNW9GUDRIYk1FUUlJRXBid1A4VFNvaUlaeDAxVnF2R0M1?=
 =?utf-8?B?YSsvNVhvSzlzMjJoaFpTQ0hYRVRTRm9vUTZ1K0QrcWFuUlBZL2N3U3dZK2RR?=
 =?utf-8?B?ZGJ2SXVrL2RWUHVZeU5OU3I2UFNnZmIxNURTUXZ5YVRZWUtMOVB1d1N4OVY4?=
 =?utf-8?B?QlZERjZvR3QvMk90RytON1VQZk93b0wvcHF2VmJuMXhDVWUxQjBYMEVjRjhT?=
 =?utf-8?B?MTBZSTdzVnh3UVNOc2FGMkpvdGZMSittQWtFVi9vS1NIWm1wb29ZZzFub2Jz?=
 =?utf-8?B?ODhPM2VDbWE2Y1ZiVU0xZXE5MURrSGlGSmU0MGhieG9EbFNncEtnSXdDdHZZ?=
 =?utf-8?B?dnRyQUpseHNTaWtXbmZhZFhrM1RxZnp6MFdJY21PcG9SaWh5MThSbnZydjVh?=
 =?utf-8?B?VmVMWnRGbVkwb0F1c3NPYTFTQXo1WjdmQnNhMHUyZDhiaVFOV090dzYxU2ZQ?=
 =?utf-8?B?M1FMRjRDV1laNnIwOFZra2oydy91U0N0aWFsR2t4TVJnKzB3bGxiVUpYcUZo?=
 =?utf-8?B?UzI5cFBhcS9XcmY3SXhWM0MxMkNiNDdpaFF3SUw3QklELzRzWTBaL0lkZ0NG?=
 =?utf-8?B?UzI3bVUwdlZaV3NNa0Z6Z0V4MWZqMFNqakVFYlJqb05kcXk1QVU5Zzg1YVpF?=
 =?utf-8?B?OFFUYVViWE5HL0prMUZnYlQvWFo4cmRSUUF2dHZqZ0IzOGZNbFVITlVpeis0?=
 =?utf-8?B?MmZLblhUMHJISm1tQjNuUjM4QVFDanFOTlRSby9Mei9TZTJyb3M0bk1YQVBZ?=
 =?utf-8?B?cmo4UlVZZ0tFL1gxeXBCdlR6L3lpYURjVm42WlAzV1pHNWpDSUNiK1hWRHlz?=
 =?utf-8?B?VUZPUzhIMXdYb21jY3VJOXI4TDE5Yjg2Z0xXa1pUREtJL1Vtb1dzOGFDcTdk?=
 =?utf-8?B?ZzhUMnJraDZnczN6T3VGdHdCYjVzek0vSGF4aWpVTXRwL0wxNkVadEpycEE0?=
 =?utf-8?B?a1ZuYjRuRGdybjRpWnErZjhieWRLaUtHK2JJY1hkWmFPRXFtdVNlbUdpQk92?=
 =?utf-8?B?SEtKZTAzY3ZseTE3TnA3d0FzUFMzNHNUNTJDK2ZPZmJqSXc5RnhMa2dhVTRG?=
 =?utf-8?B?ZXRjRXdCeksyZHhUTWkrUEFwTGFVU1RLUjQzWUlJZFhSTmhoZDFISGY3Z2Zn?=
 =?utf-8?B?c1paYzRyNHFmYVBTcERPaWdBTlpGckVDanhwVlV4dEdtV0FHTjJjTlA0Vm1z?=
 =?utf-8?B?R09Jalg2MEtCcW1GVVJPRHcrYWE3ZEphbjRCVFlhQ0x4WlJjMHkvQnRTNDB6?=
 =?utf-8?B?MlVRSWliOHZDbHlhSEdSSURTN0llMWVNbHVqQ3hMbTR4clYwVHlhK2pmaEpr?=
 =?utf-8?B?NC9ESVYzOFAwSU1udWVaTlZ6OEtkYmVDV2hyaTBacC9VaHNJUDg2REIzaXI1?=
 =?utf-8?B?WlZORkJPc21IZFljYm5IMngxdHhXdXdJVFlYZTNUUXdHVGpGMVY4RysydXp6?=
 =?utf-8?B?NWVaM2lmU3hsNnh4V3cwS3FuK2pLWU0rVjRqU2orSkQvdGVJZnV1UXU2OFJB?=
 =?utf-8?B?Q0R1bXViUTZJMy9uNktwZkZVRTNtSnRaNkUxck5CMGRrV05UNytTTDA3VzYy?=
 =?utf-8?B?WE9LeEhCd0NoaXJJV2FMT24zbUprbUJSSkFxVmVhMFJKUUZFVVN4RmNmOVRS?=
 =?utf-8?B?clN2QkN0bkVZVXBydUE2VmpVQ0FFaVRrZlRRbTRNdU02U3FkZ1MwaVdrNFdj?=
 =?utf-8?B?R0s0N3hHSzFzeWdySzRWaTlUK1VFSkd5NVVuTk42YnZ2MDkzRDhXb203b1FB?=
 =?utf-8?B?VlpQUHloYkpJTjBYMFpXMnlrUHAxQlo0MTZST0xCbTBXRFVjaDMrTHVneEQz?=
 =?utf-8?B?b3l6NENwMTBVYURIYU01NGg1dnUvRHlEdUlYcjM5UTh0RkZjNDdTd3loTmd1?=
 =?utf-8?B?SlR4U2UxOVpIR1djaGhnM3JGQnJHWmxDTVpvYUZ4WUpkSFExSjloSTAxQUh1?=
 =?utf-8?B?T3NFd0VSbnROSWF2RGdyUjJUUGREUFBkaldFWUgwVUtHcHlSTzc2b1JWbS9z?=
 =?utf-8?B?VFFoMXppeHd5TVBWNG4yK3lJeDJzdXhFb0hXTW11TituQ01MeUtpeWxDb1Iw?=
 =?utf-8?B?Y1IrQlduMk95UjYwVlhrMmRaYWF3cFVoei9sMGUxSTlBbkNwSEQ3OTBndVAw?=
 =?utf-8?B?Q3BwMEh6enRicjI0V0FJLysrMTV1WXRaaFYwdTRqcWlURHQxN0kwTzJrOGxP?=
 =?utf-8?B?TDNxUFgvVU5pYjFhVnFwYXY5R2hvaEdrcHpRL0hXYnpwcWtHdXZZVXdZbERt?=
 =?utf-8?B?dEo3UXMveThLaHpKR25ZVzgyWWVnOWlzSE5XWk9kOFJQdThYbG9jWktRendO?=
 =?utf-8?B?RjdRbWV1eG4rVGJ0L1F6bElnbHVjaEhIczJxWkVHVU9wRlgyeGdVSUZJZkV6?=
 =?utf-8?Q?TFwHDn6ytiyuJesI=3D?=
X-Exchange-RoutingPolicyChecked: QH3YqX1kU/earhGeit6ZHj5IALwjtcCDgKh1vRXzqX18RfOn/Goxup737Z1wNnB70OE+QCxFPs9ShkJX/eEGyVZh3YBi7fYntf/LuYJbT+dDMN0fKChaKIyP/Zr83Fw7XAT9ldBy6DNun8bdVEHSOzj6hTE5GspS21BUQ8eq/G20xUxTTt0Qo/sGMlGE00fzBgZsnNstCLBV4pX0tqJWCW9/6xcPg4Pc21TVAMr5V+6T5St5c+d8gkAw4yhyWPSje1uyF1Wzy1uRlxbm23nOCWnzobC+ZsCd4rIb0mRJpSWOFV8bnFXe+p0d8o8azWOdy235eIoR4AhG+9JmdgW0vw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 249bca9c-4eaf-4fb5-b6ac-08df04b43976
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 03:27:01.6552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++E4oK5MkZGDblzreyo0ek9BB/LJ4aA0TxYhV8rZcgH9OlyKf7QPajYB6wrTekKN3byF+l4JwV3GHzObx81sbr+u2ZpvUusZGbmrBYRl2D0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6010
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

On Mon, Aug 24, 2026 at 10:11:30PM +0530, Ravi Kishore Koppuravuri wrote:
> MMIO based GT Uncorrectable Unicast GAM Walker command parity error
> injection to verify the Xe driver error handling and recovery flows with
> the help of DRM Netlink API suite
> 
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
>  tests/intel/xe_err_injection.c | 321 +++++++++++++++++++++++++++++++++
>  tests/intel/xe_err_injection.h |  18 ++
>  tests/meson.build              |   1 +
>  3 files changed, 340 insertions(+)
>  create mode 100644 tests/intel/xe_err_injection.c
>  create mode 100644 tests/intel/xe_err_injection.h
> 
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> new file mode 100644
> index 000000000..ded5f558f
> --- /dev/null
> +++ b/tests/intel/xe_err_injection.c
> @@ -0,0 +1,321 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: MMIO based Error Injection
> + * Category: RAS
> + * Mega feature: Telemetry
> + * Sub-category: Driver
> + * Test category: Error Injection
> + */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <time.h>
> +#include <fcntl.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "lib/igt_drm_netlink.h"
> +#include "lib/intel_reg.h"
> +#include "lib/intel_compute.h"
> +
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_mmio.h"
> +#include "xe/xe_query.h"
> +#include "xe_err_injection.h"
> +
> +enum {
> +	RECOVERY_SUCCESS = 1,
> +	RECOVERY_FAILED,
> +	RECOVERY_TIMEOUT,
> +};
> +
> +static void run_xe_compute_on_all_engines(int fd, bool state)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +
> +	if (state == POST_ARMING_INJECTION_WL)
> +		igt_info("Running compute-square on all engines post injection\n");
> +	else if (state == POST_RECOVERY_WL)
> +		igt_info("Running compute-square on all engines post recovery\n");
> +
> +	xe_for_each_engine(fd, hwe) {
> +		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
> +			continue;
> +
> +		igt_require_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL,
> +								    EXECENV_PREF_SYSTEM),
> +								    "GPU does not support "
> +								    "compute on engine\n");
> +	}
> +}
> +
> +static void write_reg(struct xe_mmio *mmio, uint32_t reg, uint32_t value)
> +{
> +	xe_mmio_write32(mmio, reg, value);
> +}
> +
> +static void modify_reg_bit(struct xe_mmio *mmio, uint32_t reg_addr,
> +			   uint32_t bit_mask, bool set)
> +{
> +	uint32_t regval;
> +
> +	regval = xe_mmio_read32(mmio, reg_addr);
> +	if (set)
> +		regval |= bit_mask;
> +	else
> +		regval &= ~bit_mask;
> +
> +	xe_mmio_write32(mmio, reg_addr, regval);
> +}
> +
> +static int acquire_forcewake(int fd)
> +{
> +	int fw_handle;
> +
> +	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> +	igt_assert_lte(0, fw_handle);
> +	return fw_handle;
> +}
> +
> +static void release_forcewake(int fw_handle)
> +{
> +	if (fw_handle >= 0)
> +		close(fw_handle);
> +}
> +
> +static uint32_t get_counter(uint32_t node_id, uint32_t error_id)
> +{
> +	struct app_context ctx;
> +	int ret;
> +	uint32_t error_value = UINT32_MAX;
> +
> +	ret = igt_init_nl_socket(&ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to initialize netlink socket for error command (ret=%d)\n", ret);
> +		return error_value;
> +	}
> +
> +	ctx.node_id = node_id;
> +	ctx.error_id = error_id;
> +
> +	ret = igt_get_error_counter(&ctx);
> +	if (ret < 0) {
> +		igt_warn("get_error_counter failed from error command path (ret=%d)\n", ret);
> +	} else {
> +		error_value = ctx.error_value;
> +		igt_info("get_error_counter: node_id=%u error_id=%u value=%u\n",
> +			 ctx.node_id, ctx.error_id, ctx.error_value);
> +	}
> +
> +	igt_cleanup_nl_socket(&ctx);
> +
> +	return error_value;
> +}
> +
> +static int check_dmesg_for_recovery(const char *marker, int elapsed_secs)
> +{
> +	char *buff = NULL;
> +	size_t buff_size = 0;
> +	ssize_t line_len;
> +	FILE *fp;
> +	const char *success = "AER: device recovery successful";
> +	const char *failed = "AER: device recovery failed";
> +	bool marker_seen = false;
> +
> +	fp = popen("dmesg", "r");
> +	if (!fp) {
> +		igt_warn("Unable to open dmesg to check recovery status\n");
> +		return -1;
> +	}
> +
> +	while ((line_len = getline(&buff, &buff_size, fp)) != -1) {
> +		(void)line_len;
> +		if (!marker_seen) {
> +			if (strstr(buff, marker))
> +				marker_seen = true;
> +			continue;
> +		}
> +
> +		if (strstr(buff, success)) {
> +			igt_info("Found \"%s\" in dmesg after %d secs\n", success, elapsed_secs);
> +			free(buff);
> +			pclose(fp);
> +			return RECOVERY_SUCCESS;
> +		}
> +		if (strstr(buff, failed)) {
> +			igt_info("Found \"%s\" in dmesg after %d secs\n", failed, elapsed_secs);
> +			free(buff);
> +			pclose(fp);
> +			return RECOVERY_FAILED;
> +		}
> +	}
> +
> +	free(buff);
> +	pclose(fp);
> +	return RECOVERY_TIMEOUT;
> +}
> +
> +static int check_err_recovery(void)
> +{
> +	time_t start_time = time(NULL);
> +	time_t timeout = 5 * 60;
> +	int time_interval = 30;
> +	time_t elapsed_time;
> +	int status;
> +	char marker[128];
> +
> +	snprintf(marker, sizeof(marker),
> +		 "IGT xe_err_injection recovery marker pid=%d start=%lld",
> +		 getpid(), (long long)start_time);
> +	igt_kmsg(KMSG_INFO "%s\n", marker);
> +
> +	while (1) {
> +		elapsed_time = time(NULL) - start_time;
> +		status = check_dmesg_for_recovery(marker, elapsed_time);
> +		if (status < 0) {
> +			igt_warn("Failed to query dmesg for recovery status\n");
> +			return RECOVERY_FAILED;
> +		}
> +		if (status == RECOVERY_SUCCESS || status == RECOVERY_FAILED)
> +			return status;
> +
> +		if (elapsed_time >= timeout) {
> +			igt_warn("Timed out while waiting for error recovery\n");
> +			return RECOVERY_TIMEOUT;
> +		}
> +
> +		sleep(time_interval);
> +	}
> +}
> +
> +static void print_aer_recovery_status(void)
> +{
> +	int recovery_ret;
> +
> +	recovery_ret = check_err_recovery();
> +	igt_assert_f(recovery_ret != RECOVERY_TIMEOUT,
> +		     "AER error recovery timed out\n");
> +	igt_assert_f(recovery_ret != RECOVERY_FAILED,
> +		     "AER device recovery failed\n");
> +	if (recovery_ret == RECOVERY_SUCCESS)
> +		igt_info("AER device recovery successful\n");
> +}
> +
> +static void log_status(bool val, const char *err_name)
> +{
> +	if (val)
> +		igt_info("Injection: %s Success\n", err_name);
> +	else
> +		igt_info("Injection: %s Failed\n", err_name);
> +}
> +
> +static bool gt_uc_wkr_parity_recovered;
> +
> +/**
> + * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err
> + * Description: GT Uncorrectable Unicast Walker Command parity error injection
> + * Functionality: error injection
> + */
> +static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
> +{
> +	int fw_handle;
> +	uint32_t error_counter_before_inj;
> +	uint32_t error_counter_after_inj;
> +	/** TODO
> +	 *  Fetching node_id and error_id dynamically is pending to implement.
> +	 *  For now, using
> +	 *  node_id=1 (uncorrectable_errors) and
> +	 *  error_id=1 (core_compute)
> +	 */
> +	uint32_t node_id = 1;
> +	uint32_t error_id = 1;
It would be cleaner to have #defines for UNCORRECTABLE_ERRORS and CORE_COMPUTE and use them here.
> +
> +	fw_handle = acquire_forcewake(fd);
> +
> +	error_counter_before_inj = get_counter(node_id, error_id);
> +
> +	/* Arm the injection sequence. */
> +	write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
> +	modify_reg_bit(mmio,
> +		       WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS,
> +		       WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE,
> +		       true);
> +	modify_reg_bit(mmio,
> +		       MC_PKT_CTRL_MGSR_3D_ADDRESS,
> +		       MC_PKT_CTRL_MGSR_3D_VALUE,
> +		       true);
> +	igt_info("Injected GT Uncorrectable Unicast Walker Cmd parity error\n");
> +
> +	run_xe_compute_on_all_engines(fd, POST_ARMING_INJECTION_WL);
> +
> +	release_forcewake(fw_handle);
> +	print_aer_recovery_status();
> +	error_counter_after_inj = get_counter(node_id, error_id);
> +
> +	igt_assert_f(error_counter_before_inj != UINT32_MAX &&
> +		     error_counter_after_inj != UINT32_MAX,
> +		     "Failed to fetch valid error counters: before=%u after=%u\n",
> +		     error_counter_before_inj, error_counter_after_inj);
> +
> +	igt_info("error counter: before injection=%u after injection=%u\n",
> +		 error_counter_before_inj, error_counter_after_inj);
> +
> +	igt_assert_f(error_counter_after_inj > error_counter_before_inj,
> +		     "GT Uncorrectable Unicast Walker Cmd parity error injection "
> +		     "failed: before injection=%u after injection=%u\n",
> +		     error_counter_before_inj, error_counter_after_inj);
> +	igt_info("GT Uncorrectable Unicast Walker Cmd parity error injection successful\n");
> +	gt_uc_wkr_parity_recovered = true;
> +}
> +
> +static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
> +{
> +	igt_info("Starting Error Injection test: %s\n", injection);
Can this be an igt_debug instead of igt_info? There are several
igt_info()s in this file. Do all of them need to be igt_info? Or can
some of them be igt_debug to reduce verbosity?

Thanks
Harish.
> +	if (strcmp(injection, "test_GT-UC-unicast-wkr-cmd-parity-err") == 0)
> +		wkr_cmd_parity_err_injection(mmio, fd);
> +	else if (strcmp(injection, "test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") == 0)
> +		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
> +	else
> +		igt_info("Invalid Error Injection specified\n");
> +}
> +
> +/**
> + * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl
> + * Description: Run a post-recovery Xe workload after parity error injection.
> + * Functionality: workload validation
> + */
> +
> +int igt_main()
> +{
> +	int fd;
> +	struct xe_mmio mmio;
> +
> +	igt_fixture() {
> +		fd = drm_open_driver(DRIVER_XE);
> +		igt_require(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY));
> +		xe_mmio_access_init(fd, &mmio);
> +		igt_require(xe_mmio_is_initialized(&mmio));
> +	}
> +
> +	igt_describe("Inject GT uncorrectable unicast worker command parity error.");
> +	igt_subtest("test_GT-UC-unicast-wkr-cmd-parity-err")
> +		inject_error("test_GT-UC-unicast-wkr-cmd-parity-err", &mmio, fd);
> +
> +	igt_describe("Run post-recovery workload after GT parity error injection test.");
> +	igt_subtest("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") {
> +		igt_require_f(gt_uc_wkr_parity_recovered,
> +			      "Run GT-UC-unicast-wkr-cmd-parity-err first\n");
> +		inject_error("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl", &mmio, fd);
> +	}
> +
> +	igt_fixture() {
> +		xe_mmio_access_fini(&mmio);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/intel/xe_err_injection.h b/tests/intel/xe_err_injection.h
> new file mode 100644
> index 000000000..d7efc2fd2
> --- /dev/null
> +++ b/tests/intel/xe_err_injection.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef XE_ERR_INJECTION_H
> +#define XE_ERR_INJECTION_H
> +
> +/* GT Uncorrectable unicast worker command parity error injection */
> +#define MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
> +#define MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
> +
> +#define POST_RECOVERY_WL 1
> +#define POST_ARMING_INJECTION_WL 0
> +
> +#endif /* XE_ERR_INJECTION_H */
> diff --git a/tests/meson.build b/tests/meson.build
> index a62f447df..0f090dcee 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -292,6 +292,7 @@ intel_xe_progs = [
>  	'xe_debugfs',
>  	'xe_dma_buf_sync',
>  	'xe_drm_fdinfo',
> +	'xe_err_injection',
>  	'xe_eu_stall',
>  	'xe_evict',
>  	'xe_evict_ccs',
> -- 
> 2.34.1
> 
