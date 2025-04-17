Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647EFC369C9
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 19:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17F910E072;
	Thu, 17 Apr 2025 19:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iLZRsyJU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9BC610E072
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 19:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744916483; x=1776452483;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zXF9avWH+Hom/2JXZ/9t/ykg83xl3LgVq3LT/NQ9yPs=;
 b=iLZRsyJULPISq+/kmoA+pQEl3Y0pq7tbdfgoZXoBDAlISiVhHYP6BN4C
 RisrOqhg3OqYS9MmmTI5Es49zHRQ/YNEL2d8Bh6752OpLf0LFosPQVCXV
 GvTvzOfz6cM93TJAHaibkC9r+8nTCWetHLBwq+ocD3jdieoMG1ri8qDUM
 0fsMTKcZC5QDTfjb3ENOcL8qGBBTFaLszYA3KQcb1e3fVWl8e/zGbLOEx
 sFbbxOs2BfWYuke2jitVNnXd7bOtWUzxBesulxCq8XBBdzEU+3n/F6h18
 RtX0XtexSd/gGfYSA7M3OBO2jDTLxS39FJq9/ZAWnb9OSD9SABzrX5jd9 g==;
X-CSE-ConnectionGUID: bb8BGJrLRHm4Ylvm7bVdNw==
X-CSE-MsgGUID: j31nWau1SoKqqwYzBwnqBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46451059"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="46451059"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 12:01:14 -0700
X-CSE-ConnectionGUID: GCp7theUTti1qmrst7zHWA==
X-CSE-MsgGUID: oK1vB0HLQlKpnuNaCiGCmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="131450232"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 12:01:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 12:01:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 12:01:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 12:01:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=admBlw2anECsqhxWnfeR4mUV4iSuCfJ0G1aTwRUh7i5NoOK5rMAU4nGcKQVH/xvcmd0mKLiQZzvDFCQgSAVhfUzTeODmEA9OaoOmgB8+TJINeLxDT375OQk/j2oJ3cx6U07nSdjfsZuHH8K8Wr+ZHMyuxrpAGbnhKpjYWAIZ7MZE+vbTdvA5Ew5iyeH458QK+6g+x/h6jUh0Pqv7zL05GXGDQUPu8NtRXXMLIdgOovitd7/Jt4rYkDIJFZQQQIguQTUbqSAk106E5xSKmyiuEDM5Wa61pIXIvFvWvScLVM+XtoihC5odnrFkB8yfWNNniHkvvX/988H2NK0uVsB7lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uULtfd1xLvUql7P/dksgqpCDpm4klkxytzN5FZQwh4=;
 b=GMLQQHHpppFVTWkWyS7KyABXiQIg/EUSYRUT9mBnONLsAXwnYXYXONuaFVzXfVmWCvbPLU3zFt1ZgSdhqPrKHwrJOYRmP70W/x2CQG6R/+waFPvDgZakOx6rUBXVbBj0adM5k4upZMEfyIbrQz1FoHHaQFJGerKlqXEDq/2F7k1yKKg2a4BWYyiwUVtkE6q0zXcoIF3wLjMt6OX3W3Ol92uNgA8j1kTqrgP8ZSkNz7rHXvTObLUVc2MDABszx5k+7Wd3J3d0KqfgwGXF494HwzujmqJQORK0ffCzNOmQRWilp3+A62yNuuGtPJuFj4c2e4EEI7ABuDy8fFtuZ1ldXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 19:00:41 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8632.040; Thu, 17 Apr 2025
 19:00:41 +0000
Date: Thu, 17 Apr 2025 12:00:39 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_oa: Call get_stream_status only on
 EIO
Message-ID: <aAFP1yxunt0sOEGz@unerlige-desk.amr.corp.intel.com>
References: <20250416231203.13916-1-umesh.nerlige.ramappa@intel.com>
 <87cydbhf3b.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87cydbhf3b.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::24) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB6312:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e9afbc1-3aff-4261-dac5-08dd7de2263b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2MwOHAzam0rTUc1Ump0UXRNQ0FQdE9PVk1LWEVrQ0psd0tHMFU3clp0R2Jr?=
 =?utf-8?B?Ni9od2lNT2piYTBJT2p5UnQ0RDZKZTROY21sSGYxRXp1Y0FJSjF0R0RzYmlr?=
 =?utf-8?B?UG9iNEdwTGpBeEMyQnRjV1Rmd2tvZlhjUUJQMlpNNFQ4RHMvN25UaXlhSmRz?=
 =?utf-8?B?TDVET1lDTmpKMURkc1Z6L2NTcTh3Rlc5WWxrRHZscWFqa3k1c29NL1BvUXo1?=
 =?utf-8?B?VTcyRUUyZFdGNFh4elNEMCtHUTZFSjRQRjZ0b3hrNTFnSTF0c2YzU3hTVTdD?=
 =?utf-8?B?Zk5CazZJZGhwT096L0E2QmlEbUxaNFhtOENlZ2tsTVVJOU1HejYyYjVqc3hM?=
 =?utf-8?B?blFnejF0cDl3R0I1WU1Oai8yYmE1RmlLNXlkV3l5bFZ4ZzVVSGkyQmtTL0Fl?=
 =?utf-8?B?UW9XTWNVN1lTT3dsQ29HcjJmQkYxTFMzWVB2L1NJRDJjYnFkOHMrMUpXSkJU?=
 =?utf-8?B?anBEbE1pYnNPaUppWm1LZENZcmVILzRzUlVmaElqN0hmOWhjMmFCbmRlLzM1?=
 =?utf-8?B?bFZndFJjSTNHeS8wVVBTWHhrRjI4enFSdmRQbG9UOHRoZDVhZnZhZlo5cEJW?=
 =?utf-8?B?eURtTDZwVXdLT3FYS01oWUd5RWcvY28yRnRYRWtQaFFzRmJWLzcwbE5Hcno5?=
 =?utf-8?B?YXVMWDYwRVduWGVTb2lCL2xHZHJldmNsVjR4dDVnallPQW9nRzRieE9LK3Vr?=
 =?utf-8?B?a2Jlb0FYU2RxNXNrcXBtczh1eVFqTSs1NzV0TUtNeFppNHpPblllYkMycGI1?=
 =?utf-8?B?T0FnZ3lTSXlWYkxXZzhSWktxeXRZNkU2eE5lNWpTdVNEdmt0Wk5iRlpSM3hP?=
 =?utf-8?B?V1dZYW01Z05aL25sL21tRThPSFBNcWptR2h2SGhlcGQrai85MHBjSS9CRHht?=
 =?utf-8?B?N3lNYXJqby84ZVBjZkJaNWpYN0FJMHJwaVUzSUpYQWRySzFIdGlGZXZIR2dS?=
 =?utf-8?B?b2ZJcUZDTjhGcy9UNXplMnRteWFBZ0R0dHZweGYrWFRuMklXYmsxMjkzS1pH?=
 =?utf-8?B?VTREWVJVZkNsNnFhMTFVQ1BpYkNkSFNjRlM3YXRIekpySmwwajBKVHZiRVJ3?=
 =?utf-8?B?NXprM1pPTXRaYXdQWUdseG1WTXJSdlNsN3d5YnY1QnpEckhUUy9POGZPcTFj?=
 =?utf-8?B?d2svSUYrcDN6SUV4REw4UzYvcmMvbDl6TWw1MkMyeTE3Qmg0OXF2aDZ1cFA3?=
 =?utf-8?B?TCsva0ZtMFBPdDg3cVFCZFJldTNhamJNdklPOVcxaWEycjg4aE5FVStnWE1G?=
 =?utf-8?B?QmYySmtaYTRmYzByYzJ6clBKb2xaOFF3dHpqaEFZY1B0TnN0R0FON1ZDbjdh?=
 =?utf-8?B?UUF3dWpSb3RxWHB5NW82L2w4OHVIMmw2R0lGemJYeVdIcFI5ckZ0SWFrSFJh?=
 =?utf-8?B?VkhrNkgxVEpmSTVPQU5uWkF3MkhPR05wNVJtWTlFa3M5UXEwQXVaTmsvOXM3?=
 =?utf-8?B?MFlZdWV3NTZTMmtNSENQaENzd0J1RVQwM1U0QVFtclh5OGxhNG1ydlM1LzR0?=
 =?utf-8?B?WWM2UmFoS1lKUG9jOHZISVZORDd6ZjV6L3NJc2dQb1laYVd5czZGVlpreENp?=
 =?utf-8?B?b05CWVh4cXgvbmRkWXJnTHNBSSt1M0lGZEMxci9QL09mbjU3TFRDOHpvSWQx?=
 =?utf-8?B?OTVzaHVZeXlVZDhMWDZidUU0Y0hYTjNtNmRmZ3F4ako0TlYzREN6N2hTYjdl?=
 =?utf-8?B?L21JMUI2Vnl1eFUzaEcyVlBPMUd4OUY4WmFJOHByRmpIbXJjRVovdVU5bXZG?=
 =?utf-8?B?Uyt5RE5CT2RMa0t2VXRiVE91dUNCZDZrbkZoOWk3aVN3V1VBWk8yRlhDaUxu?=
 =?utf-8?Q?lg0OreuTF2iJlRdEEgsaOs4JKxcJgzcqEB8mI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1ROUFZnaStqM2pnaDh2R3FYNmkvdnRGdHI5SGVoM2F4dTZ5Ym41V21uelNN?=
 =?utf-8?B?QUtnVXZvZ1Q4US9XcHVNdDhqZkJmOGIzQ2FkUE9WQ29XdXlZYVoyRlk4OFdZ?=
 =?utf-8?B?UVV4Nm9JRWk4NXJtR2VEZzJYQXQwUm9maXM3RjZDSTV6Ly9HbWlqK25zdjAw?=
 =?utf-8?B?V0JhN0tvWHFleVRtalIrUDNqekpGZmtlV056MmRPMW05Wkp5L2dNdVNVRC83?=
 =?utf-8?B?LzNTaVRsZTB6YzZWTDlPRWZ5RzVQRnBBdXhCVHpUMWtpazFPN1k3QkhWV0FB?=
 =?utf-8?B?QXFzS2pUUmoxNnIrOWpOMGxyMjdzVW1STUZwVklSSWg2ZVoyM0hZMFREQlJK?=
 =?utf-8?B?MWRRcDNxWXJhOC82dUErL2NPQ2Z3aGo2em1KSW1hQ3hrckYzdFY4c3N1bm5n?=
 =?utf-8?B?bS93aGYxZXlMSVI4ditvSUljZ0xYK3Blbk5uM2FnNWE2c0M0NERnV2pHUGZh?=
 =?utf-8?B?LzRTODV6ZUQ1N1NBQ0NObng5RmZOUFRnUytoSnVIMlhJak5YdkwveVN0VWJY?=
 =?utf-8?B?Q2JmZ1JJQWdKMGZYRHpuQjl6eFhreFBzMXJELzdhNkplc2lUVzdGaW8zTzlB?=
 =?utf-8?B?anFFTzdJTVlZTHIzMitGcUZyMlVHdzh0L0VoOVFpZGJGeFZQTGZtWHFZZjJP?=
 =?utf-8?B?Mi9tSzJrVUx4ZHV3aXFoZHVrd1dna1FEdmxOYmExNFVMN3hxeEJocUlLZXBj?=
 =?utf-8?B?MHg4dnJPMFpISGFjUjV2bjVMOHN0Sys4NDJwcmRHdnd4bWdaT2h5SXJ6d0Vj?=
 =?utf-8?B?TXpCUituNC91OWRhWjI3TnRoRGRaaG9DSEJ6dFIwVGRoM3c2R1pJbFJtbkth?=
 =?utf-8?B?d3JlUmFjcjVTbEZZYi8rcEI5TTlYU1NLTU5LYUpGc3k0Q0JzQXhvRVdsanJh?=
 =?utf-8?B?amQ0V3dMa0xSRTBVZzhISFhSMG5DUmdlWGQ1ZFY3UzNFS0RRMmNxNHhMeFNY?=
 =?utf-8?B?SjV4eHlKWG9HdG5aQzIrN1hVcFNJWHB1SWZTNjRqSUJ6bWNJZXVZcnpSTVh2?=
 =?utf-8?B?UEEvMTdQTnJCcUIwd2FWcU4xeTNZNnVDUlNxSFRpRS9qWEkrN0hsdjlGbnIw?=
 =?utf-8?B?eHd0aEh5TDJvYjBUR29YcnV5dUNEVDErVS9mcXRzR0FzcGt6SmlyeXo3WHYv?=
 =?utf-8?B?b0xyY2pZZHBsZ2liazNPZ2hzTHpDRTJjNm5XR3MrNEV2MU5HR2xwKytkdm5C?=
 =?utf-8?B?TnpuaEV5a3VNbnVoSUZLa1dtQlpUZlQrR2lzYnNFcEkvUzkva280ejNwNng1?=
 =?utf-8?B?bWp1MVpEUjgyTlNPMzY5YnBmak5wN25PWThrZGNmd0pPZUYzUmlsVzdrZ2Yx?=
 =?utf-8?B?VVB2L3RMNEpKK0M2RWl3NXR2Wm5EZm5OcW1IaUxPSU5VOGJNUmFUVEpNejVN?=
 =?utf-8?B?M2dpdlYyTno4U1JXbEpsT1JjSStiL3l6UTIxdUYxdFRValh2VnQ5SHRPeU44?=
 =?utf-8?B?MkZZZTR0cGFHQ3JlYUFpQi9RN0I5UVRqUStoWEkyT2NsWnhXeDgxTmNYcnFi?=
 =?utf-8?B?Q2dwNDhZalNZTzl6THJvVVI4c1MzQ1lpOHk4eG5uSmIvR1lxVVR1Z3dYMFdU?=
 =?utf-8?B?N2pZUmpGaWk5Q3B6bEkweEYzU3FUc3UwbnY2NmRXVm9ZUTgybWltbmhNM0J5?=
 =?utf-8?B?THZqTHVUTnBXOTd1RmFpK0p6QnRiQTFmZ0lCb0I0RHE2M0N5SzJ5VFplSGdj?=
 =?utf-8?B?QWNzNTFWcEg0d2pEV1JQT1lmVmUydVZKd3VzdXZVN3ErZ2xRaW9QaUw4eUh1?=
 =?utf-8?B?M09xNkpBaXVDRTFZdDJWcFE4STBPSXJSVjk5bDZvSlhLcVFhYTFTaWdUK09s?=
 =?utf-8?B?blk0KzFWeHJSb3RpNWs1UVpxUFhpbEhvMndQN0FkTUFzVjFqdDlUUE5WdlhZ?=
 =?utf-8?B?NmhOeTExaXgwVG9MUlBucWhaUndDYVFmaGlPZmt5ZytjNDFFMzAvSEIvajRq?=
 =?utf-8?B?LzQ4RE5USFl3ZG9tcUpUWFdpNE9JTmVDOWxxNllhYksyZ1NpOFVXZ0tlYnlw?=
 =?utf-8?B?d1VtUk9lN2dBNVZtcXpMM04yNHR1dnM4TjR0SG5VbE9EczJIaDJDd0dlWWpi?=
 =?utf-8?B?ZGNUY215cHBDZHZwQXFkZmFKQXRSaDhidTdGM0d2ZGM2aDQ0eHpWdUhOMTRG?=
 =?utf-8?B?Q3hGNHcyd1dwOW96MHlnMUl3NlhVZFQ1bzRiNXdvYlVmSjNXaVB2em16MXpz?=
 =?utf-8?Q?r+ENcL61zUtkUk1xL0O/z1k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9afbc1-3aff-4261-dac5-08dd7de2263b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 19:00:41.6512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g70Fy5mho4kuNksKMncURgjkgj/D0nyXI+X/YpMzBCbyl8f8wMjICZ0UwZtjYtVPDzsW7ZVcs42+XOFRQAg0bci3mVoFEm88yvSJcOKbvyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6312
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

On Wed, Apr 16, 2025 at 04:16:40PM -0700, Dixit, Ashutosh wrote:
>On Wed, 16 Apr 2025 16:12:02 -0700, Umesh Nerlige Ramappa wrote:
>>
>> Turns out that get_stream_status resets errno and anything that checks
>> errno afterwards fails. This resulted in a bunch of test failures. Fix
>> it by calling get_stream_status only if errno is EIO and also save and
>> restore errno within get_stream_status.
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4804
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  tests/intel/xe_oa.c | 20 ++++++++++++++------
>>  1 file changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index 1fc8bfaafee2..360dd8ba00d9 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -380,9 +380,11 @@ static void set_fd_flags(int fd, int flags)
>>  static u32 get_stream_status(int fd)
>>  {
>>	struct drm_xe_oa_stream_status status;
>> +	int _e = errno;
>>
>>	do_ioctl(fd, DRM_XE_OBSERVATION_IOCTL_STATUS, &status);
>>	igt_debug("oa status %llx\n", status.oa_status);
>> +	errno = _e;
>>
>>	return status.oa_status;
>>  }
>> @@ -2294,7 +2296,8 @@ static void test_polling_small_buf(void)
>>	errno = 0;
>>	ret = read(stream_fd, buf, sizeof(buf));
>>	igt_assert_eq(ret, -1);
>> -	get_stream_status(stream_fd);
>> +	if (errno == EIO)
>> +		get_stream_status(stream_fd);
>
>Hi Umesh, if we are saving/restoring errno in get_stream_status(), do we
>still need to check for EIO? Or you just want to check for EIO anyhow?

I wanted to make sure of both actually. Ideally, we get the stream 
status only on EIO. In future if anyone does not follow that and just 
calls the get_stream_status, then preserve the errno to avoid strange 
issues. Maybe should update the commit then?

Thanks,
Umesh
>
>Thanks.
>--
>Ashutosh
