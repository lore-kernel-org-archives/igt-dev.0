Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C99C02183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 13:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6344910E597;
	Thu, 16 Jan 2025 13:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eauev9/y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1BC10E597
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 13:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737032769; x=1768568769;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=74EflhR4cdLGgIeoRtKvtC4cbMopW9EWKarlCZ29jQc=;
 b=Eauev9/yq2TVTF/l3T0ny56j3dJaAHAZ4oy2W1rseoJpaQJ7PwKcNCyJ
 g6OFDEdhToR4xzaWDRsw5rgIdOgrhSO71vyc0Rv57RwOoxk6Q5zFFmsR1
 KIgPo/sUYUmeHjdsJaURB2h11LCZTE1VRK/IfmpvWi+leyUiqr3lnmcAJ
 cBdkHSsMJJCIRGlK5ijp3ZZ0Qkl82IxnSLLvzK4i3rcohnh80ioSmoNxP
 r1rf7M72eTxFUtnkUj0wj/ie0o2h9fSecIqjXv5hxQ7KkJQtgYPdWieeI
 iDPH6tayBKMpPyzqkO/XjjmeJXkAp5OuDPQCcwRs9P8366zJf9olq2xpp A==;
X-CSE-ConnectionGUID: Ktc+GpTCQRS6p9y/5MyCTw==
X-CSE-MsgGUID: 92Wj0AM2R/S4amNRlM2z4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37571541"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="37571541"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 05:06:09 -0800
X-CSE-ConnectionGUID: PCPw8VL7QuSESguiVRUaog==
X-CSE-MsgGUID: QSselkFwRlu+uYlPE34L3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="110467086"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 05:06:09 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 05:06:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 05:06:08 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 05:06:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=keSI4c3wLIh/X/VG4q9qZ3LpRmEZnWdzQMjiOipujKivPe+4tXXcn/ruI9uyQGZm14xRbm7pu9QFCVAWyQFKNd3WjxViw0hgwG+DHil8YvisQsFHzA+//kQqVGTaNqnswZ6GLZk463DuVgpShrfy5Vvjm9otCoWVD0kzhjxlXhKB4yoluA0wTvjBhYJUwPSJRwiwzfj4lgBgpjlBG2CFvpk6ntke3jM9yPOZ6SEZ+zEej1r/oTcbyefreNUTRTmP0mEKVigbWB7+JZUXemGvabtdaZUsUor9SvhL3S2G/l+Bdig2PvISalFEv1znue8pwaZpCAilbwigdLmTMkSv/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEqkuQrKlyvszO5cWR7bmAj04Zef+RE1u+Q5wogrLIo=;
 b=y+VCqUdRziAJbWB7WlPX0xwB2sJXr9kIDmP31jmZpAo8wuo7RyRoLjLMzxBr+Y+iFn/Wo1xz90ZRR5t2wwmPzNenidOubIsFq4gDMHc0GzbK3DDf2t5RBI+9S/Cpr/8cxDu3VcZiKKup2rAXXSW5RYrPg1kv0oRBc0cZ859W8fMQsxA3RpdKqpE5x4IiiffxEacowN1mZM5+CNq1JtdaO7GZfsMMWfT+a4iETW3gZ5BfHD9j1q/qdR4R1yJYtqHkMYEmQbaMgCIpBFtbWvIvbfA+d2IJh5Yf/uh5j2xCBKig5QzNEwoYpt5lbrQ9y6+LSjegndHiIoIzEcDBlzp0Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SJ2PR11MB8567.namprd11.prod.outlook.com (2603:10b6:a03:568::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 13:06:05 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8356.014; Thu, 16 Jan 2025
 13:06:05 +0000
Message-ID: <e3a355ea-684d-4b11-ae4a-d7ef277b5dd8@intel.com>
Date: Thu, 16 Jan 2025 18:36:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] tests/intel/kms_joiner_helper: helper for
 joiner-related functions
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241231141518.765212-1-kunal1.joshi@intel.com>
 <20241231141518.765212-2-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241231141518.765212-2-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::13) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SJ2PR11MB8567:EE_
X-MS-Office365-Filtering-Correlation-Id: adbb29e6-fd6d-4974-cf15-08dd362e88d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmVCZmZpTTlzR3JJOE5CamVUcUZ2aVEzakhIMUdEVk9jd0RqbXRmMkIwWEt0?=
 =?utf-8?B?RDdtT01YQXNjRDJnYXJPaUhUR2FZcE0rdW1mQmIvNWJheHF3SlVBR3lVOWF3?=
 =?utf-8?B?Lzlqa0lXcm1MWFVKa254eGlwOE5Vd3UzUVRzZlpWWHJkaGFQMkpjR05hQ1RQ?=
 =?utf-8?B?SXNUVVNEOGNzOW5NQm05TG44M282RGhvc0gvYWdSNE1LaWR4YjlGcER3Rmsr?=
 =?utf-8?B?aHRWL1g0RzY2ZWVtcVQzV3J3THdlOFBQd2pjbDhTT2ZYM0ZFbzJTZkhQekwv?=
 =?utf-8?B?NEJDR0wwQ1VCSWcxb0RNNnRhQVJzNzN1MFRka0ZMbXQ1U1YrNmt5VFhKZVhY?=
 =?utf-8?B?TlRad2dvU3ZqS0lCQk9FUzVGeUNEd09rRXBkRVZ5a1FVUTIzZTkvc2tqSW5x?=
 =?utf-8?B?V3l0VlRxMmpiNDliZU9vRVAvcFdVS2JEY0E3R2F0dEcwM0lkNEZFMUhrMTI1?=
 =?utf-8?B?eGVmRkZUekI4OWgvQW9oMElHampSVWtVVVZGS0pZK1lIOHFmMWU3V2pTS2xl?=
 =?utf-8?B?M3NHb2pIdmhadUtYWXhQMEF0RlJjcHZtVHVEZGFIVHMwZkZwRWtPK1gzL285?=
 =?utf-8?B?WldFQjZyYjY0WnRyQnNwZlFtKy94OWxScGV2L1p5cEM5THNlMTNqOENIaU5Z?=
 =?utf-8?B?KzR5YmVpZlphRGRsTEtNQ3JOVWVRWHMyWXIrWURRUkg0L29RRVlsQUtxTUNQ?=
 =?utf-8?B?OXNwNjJMVlhQeFBOV041bFpSRVpKejErOVVkYmlMOHFqdHhmTkErWWQ0SWRp?=
 =?utf-8?B?Y0JHVTdNMmZLbnFKWDJ0MFRyYzMwUTdEalRMK3lsUEtIQkQycThSYWJtUnJJ?=
 =?utf-8?B?a3ZISWxpZlU5aHlsWVQ3Q0h4VkdkU04yRExjcTAzVFZXREFvZzE1S05rQU1w?=
 =?utf-8?B?em1DMXhXZ21xcis5MXFFM0lRTUxWQXJzNVlmNjdXaDh1VDdIKzdqVDBzUENG?=
 =?utf-8?B?bkxBUVROMWptV1BOZnZkZGg1NUFnaENoQWEySlJ4SEd0aGpoakE4cTVyNlN0?=
 =?utf-8?B?OXRQdTlFMUFDN3RGZFcxZ3Nld2RLOGMrbERNUGRjM1BNRitzU05RcVB2czF6?=
 =?utf-8?B?YVBKNTJtcVdzNFl2amJCZzVPeFNPZmlxRE01RVdIa2gzL1J5OUVEYTExMERv?=
 =?utf-8?B?V2VJTzNVUzdBcFhGS0JBSU9ZdHpXSThHTVMycVp6ZzZwYWE0SUp1VHBXWk1H?=
 =?utf-8?B?MHU0T0lpdTNrWUdOWXR3bmk3eVpnNUlIdHo4U0M3NGxBeElVVXJ3WFUyKy9t?=
 =?utf-8?B?RnpCckVMQjNSUFNBc1NFWm50Sm5UYkxsMVN3emJSbWtiMW1xOG11YUVuWnZV?=
 =?utf-8?B?Q2hrZVY4eDlNSTR4Rm5MNGtYVVJ5T0hDYjhhaXlib21lOTQvNmVvYVBrODVq?=
 =?utf-8?B?enNVUWMwaTd1MUptU0hiYW53M0NLcGRRK3VWRTRjc3BQQnF2YWt0R0FnSHhV?=
 =?utf-8?B?MDhXWVkrY3lZMVkwM0JCaWY4clphMlBFRmNGTXJ0OGlUbFI0K2tyTlc3U29Y?=
 =?utf-8?B?aGdIUGJkOVNqcC9LdGxPblUxUmQxTXJONE9OMWZ2N01QOFZhTkRFV0Vsb08w?=
 =?utf-8?B?QzV1bjdaUHBRQ0NhQWU3VjNQWHB1Sk92bG5wQ00wTW4yWm9GVitBZWNNN0pn?=
 =?utf-8?B?SU5yRWExc01FVStNMS9xUFRsQlFNdFNmV0xQMkovTGd0OVRlbm4rVGxZSGdz?=
 =?utf-8?B?S3FIbVJJdHhObDlSR1Jzbld4Rm1rTUl4VVVyUGE0eXRMZGpOTDR2ZGdUTCtS?=
 =?utf-8?B?dEhFNUkwSjZ6VFp0d1RuYWUyMVpIUFBORVRiQS9mK0J2L3k2bTdHcFdrY3p5?=
 =?utf-8?B?b0xYMy9nWlRHYkFUeUdKNU40MUdDZ1BTR0tKMnlyempVbTlOdGZxVkFOTW81?=
 =?utf-8?Q?rFW6r234MI2Aj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlRSWTFFaGFHZE5sQTJvOU55TUxpMWxGaFNGTkNmd1dOVERaNWhDaGh3MDY4?=
 =?utf-8?B?cFVVeWhCTmhzc1hzRVZmc1hWbnhCSE0zQnVIc0xCN0E5cVU4K0ljOXcrNFI4?=
 =?utf-8?B?K29pTEJXdnl2NkRLQXpJV1Q2b0F3RWlWWXdvUmdJdWlPTGl5VzhuMlN3aktr?=
 =?utf-8?B?OE50Ym1MMkZTZ3kwYS9NT1QrdmJZSUFyTXVlSHp5VndPTW9WK3BGV1ZuRmt6?=
 =?utf-8?B?dXZqcjkrRHIzVEFnSHA2WkRhQ29FNjhEK2RvajY1NGhSRWM4dWFBNUpScmtm?=
 =?utf-8?B?eS9nMjh0QWk0c3Y3Uk5XNzNQNmFXZnF6eERPR0YzcmZHL2w0bWl2VjZJckJI?=
 =?utf-8?B?d2dtOFhKWmtJRFdoMnNobnlDNDllNUdBeHl6NjV4eVZoRDBGUWs3cDVqNEpG?=
 =?utf-8?B?L3lCZDV0cTBOV0J2UWovclp5WkNuY0ZPRGc4NzdWQks5cTdGd1FrNjFBeVcv?=
 =?utf-8?B?WWpPczVad0VOS3RRdlZKclczcTUySXV5UUdoNVZhR202MG1PYkE0ZytGWTZo?=
 =?utf-8?B?SGpmekt5OXBOUDJvUW5RSmtEMTVXTGdKeXdSZU1Zb2w0MTljZGhTKzYxUWNo?=
 =?utf-8?B?UkhZekVuZnVXY1Zmc2JXL1NnN3AwMng0YVo2bDNSSERZdmFZR0ZNVUFsdnlJ?=
 =?utf-8?B?UGxVOTkrMzloempVZ2txTCtVeEJjUFBLUXJVWmtFUEI0ZlV1SE9PaFk3a2Ur?=
 =?utf-8?B?T2ltOUlkekNlb2lBbGJ5VmxiaU5UV0VMSVZUVkhtaHlkSXNaL3dWcGVrdW9y?=
 =?utf-8?B?K3NnZFVpa1ptdkprdW1sV0NnRzFjZFpCL1BlTml2Tm4wbkpSWUUxZG43L2Jq?=
 =?utf-8?B?Qm1YdlV3QTUzczl6WUR2Q08xSVBlbUwzUGlqVHlXNjJ5YW1BVlJPU2VtbXFa?=
 =?utf-8?B?RFBTSW9WWXJhUXV2c0hneHJycHAveVIyb1JhVlByV00zd3daYU16RXBCTTdh?=
 =?utf-8?B?QStiVFBISmJvZ3JVU3lsZlc3a1FyRytsTmV5UGJ5REZBNUNXVUVHZVcxcFVN?=
 =?utf-8?B?K3JscUtpd0dRN0NNQmVkNHFnM1BPcXYyTm1oeHErb2I4Y2duRmd0NE12QmYv?=
 =?utf-8?B?R0dzQW9QNFhBMkVGSTBaQ014dmh1dlVLRTZ4VXNidDI3VU5uSkhXejR2OXdv?=
 =?utf-8?B?b1VLdmM0a2hkbFV3WVdRZmNTYmJqOEhCWVhtZU01T0t0WnRucCtkMzVrNU1a?=
 =?utf-8?B?QWlDc21aOTV1dTZpTjFmYnNqeHdDNVdxdjJFcndMbTYrclJ1eStMeXd6Qkdo?=
 =?utf-8?B?OHZmd1AvUS9HLzJBazRpc2xxR1Rva0NWTVJMTFZhSDVwSEh5NDJ5SUJ1WEZP?=
 =?utf-8?B?UlV1L1hJK3JsUnVPNG1QNCtMeFBvaERoTHBlYVA2d1NZUlFOTlpUcGhnSDZK?=
 =?utf-8?B?L0dzUjYyNTh0WkJHcU9hNjRLK0RJVUp6TnQycWY0YkxjTHVBZkRXdjdKbnVn?=
 =?utf-8?B?dW9ITGUvSE5pamZpYXFySG43QTRGMU16eGp1bExiY1pISWlvdHA5cUtMNW9W?=
 =?utf-8?B?Uk9zUkROS0xDKzEvUUZYYm5ZcjB5K0hkK0h1YzFwRk1KUDU3TDluQm1uTXBt?=
 =?utf-8?B?cVV2MFhWRnZHSHNqMDBIMFljd0ZZR0tSUVY2eHB0bERzZ1haa1hEOHpqMnVn?=
 =?utf-8?B?VzNuLzdMbHdSSm5iYzRhRWo5NGhTcnJOdzdkUnVaSHcySGEwQmJRc2JkNG50?=
 =?utf-8?B?UXFsOS90ai9tQXRTZ0xlMXU1dXltdkYzZW9CR3Y1OXJlQUFRQkJLVTFoNUQw?=
 =?utf-8?B?cXVPTzc0Q0cydnVmMjBMMEg0R3JGVUxDV3d0bCtUMFRCT1V2UktSeVRrMVpk?=
 =?utf-8?B?YnlTTWh0MTVGQ2xyRm1pTndZa3IvMzNPVTliaUFLcnFVMmNxUFgxV3hBZjd1?=
 =?utf-8?B?UGs5R0VHN3FqM2UzTDV0RG44Vm95OU5PR0NLOGcxNzRqT2FpLzhKM3hNbjYz?=
 =?utf-8?B?WmVQVUR3NWVYcTNWdHI2WjIzZ0FIMnExUmxGZXp3ejVVcWpwOUhYWmVISWVC?=
 =?utf-8?B?QlRhdWtObk1FZGJ5TzBxYXdERitTUXBnRkI3YmFiVTlZZHFHOGNrYVd1TWxn?=
 =?utf-8?B?WVFVangwK1JTR2pEczQzUERtR1JiVlA1aVV1ZHpsU2ZodG1iZkphUkRKYmZV?=
 =?utf-8?B?d3JDL2QzZkNVOTFFamJsRVI1bGU0TWZ3SGRqVkRFOEJNNzc2aW1zQmJHaTFo?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: adbb29e6-fd6d-4974-cf15-08dd362e88d2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 13:06:05.1398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i67sLDO+75ytbfroB6jtl8YdsnfQOOhhgKN3hUBtkunmvwQyhvUwXhcCnMcd75mwUUtIPq29/qigrn/R4q//rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8567
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

Hi Kunal,

Please change subject to "Add helper.." (imperative).

Also, this patch should have been split into 2.

1. for igt_set_all_master_pipes_for_platform()

2. add igt_assign_pipes_for_outputs()

On 31-12-2024 07:45 pm, Kunal Joshi wrote:
> This patch introduces a new kms_joiner_helper.c and kms_joiner_helper.h to
> handle Big Joiner and Ultra Joiner logic in a centralized manner. It provides
> utility functions to set and manage master pipes, as well as to assign
> consecutive pipes for multi-pipe configurations. By moving these operations
> into helper files, we improve code clarity and enable reuse across multiple
> tests requiring joiner capabilities.
>
> The patch also updates kms_joiner.c to use igt_set_all_master_pipes_for_platform()
> instead of the local set_all_master_pipes_for_platform() function. This
> unifies the approach to pipe assignments for joiner scenarios. Finally, it
> updates meson.build to include kms_joiner_helper.c.
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_joiner.c        |  15 +--
>   tests/intel/kms_joiner_helper.c | 179 ++++++++++++++++++++++++++++++++
>   tests/intel/kms_joiner_helper.h |  15 +++
>   tests/meson.build               |   1 +
>   4 files changed, 197 insertions(+), 13 deletions(-)
>   create mode 100644 tests/intel/kms_joiner_helper.c
>   create mode 100644 tests/intel/kms_joiner_helper.h
>
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index 418ff26a6..0151dd182 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -37,6 +37,7 @@
>   #include "igt.h"
>   #include "xe/xe_query.h"
>   #include "kms_dsc_helper.c"
> +#include "kms_joiner_helper.h"
>   
>   /**
>    * SUBTEST: invalid-modeset-big-joiner
> @@ -97,18 +98,6 @@ typedef struct {
>   
>   static int max_dotclock;
>   
> -static void set_all_master_pipes_for_platform(data_t *data)
> -{
> -	enum pipe pipe;
> -
> -	for (pipe = PIPE_A; pipe < IGT_MAX_PIPES - 1; pipe++) {
> -		if (data->display.pipes[pipe].enabled && data->display.pipes[pipe + 1].enabled) {
> -			data->master_pipes |= BIT(pipe);
> -			igt_info("Found master pipe %s\n", kmstest_pipe_name(pipe));
> -		}
> -	}
> -}
> -
>   static void enable_force_joiner_on_all_non_big_joiner_outputs(data_t *data)
>   {
>   	bool status;
> @@ -430,7 +419,7 @@ igt_main
>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>   		kmstest_set_vt_graphics_mode();
>   		igt_display_require(&data.display, data.drm_fd);
> -		set_all_master_pipes_for_platform(&data);
> +		igt_set_all_master_pipes_for_platform(&data.display, &data.master_pipes);
>   		igt_require(data.display.is_atomic);
>   		max_dotclock = igt_get_max_dotclock(data.drm_fd);
>   
> diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_helper.c
> new file mode 100644
> index 000000000..af89be777
> --- /dev/null
> +++ b/tests/intel/kms_joiner_helper.c
> @@ -0,0 +1,179 @@
> +#include "kms_joiner_helper.h"
> +#include "igt.h"
> +#include "igt_kms.h"
> +#include "intel_chipset.h"
> +
> +/*
> + * Detect if the output needs 1, 2, or 4 pipes (non-joiner, big joiner, ultra).
Only this is sufficient as comment
> + * This re-uses your existing logic from:
> + * bigjoiner_mode_found(), ultrajoiner_mode_found(),
> + * is_intel_device(), igt_get_max_dotclock(), etc.
> + */
All this is not required, its implicit.
> +static int get_required_pipes(int drm_fd, igt_output_t *output)
> +{
> +	bool is_big = false, is_ultra = false;
> +	int max_dotclock;
> +	drmModeModeInfo mode;
> +
> +	if (!is_intel_device(drm_fd))
> +		return -1;
> +
> +	max_dotclock = igt_get_max_dotclock(drm_fd);
> +
> +	is_ultra = ultrajoiner_mode_found(drm_fd,
> +			output->config.connector,
> +			max_dotclock,
> +			&mode);
> +	is_big = bigjoiner_mode_found(drm_fd,
> +			output->config.connector,
> +			max_dotclock,
> +			&mode);
Also, shouldn't we move all joiner related functions to this lib ?
> +
> +	if (is_ultra)
> +		return 4;
> +	if (is_big)
> +		return 2;
> +
> +	return 1;
> +}
> +
> +/*
> + * Internal helper to find a block of consecutive free pipes
> + * in available_pipes_mask. If count > 1, the first pipe must also
> + * be in master_pipes_mask.
> + *
> + * Returns the starting pipe index or -1 if not found.
> + */
> +static int find_consecutive_pipes(int n_pipes,
> +				  uint32_t available_pipes_mask,
> +				  uint32_t master_pipes_mask,
> +				  int count)
> +{
> +	int i = 0, pipe_idx = 0;
> +	bool can_use;
> +
> +	for (int start = 0; start < n_pipes; start++) {
> +		if (((start + count) - 1) >= n_pipes)
> +			break;
> +
> +		if ((count > 1) && (!(BIT(start) & master_pipes_mask)))
> +			continue;
> +
> +		can_use = true;
> +		for (i = 0; i < count; i++) {
> +			pipe_idx = start + i;
> +			if (!(BIT(pipe_idx) & available_pipes_mask)) {
> +				can_use = false;
> +				break;
> +			}
> +		}
> +		if (can_use)
> +			return start;
> +	}
> +	return -1;
> +}
> +
> +static enum pipe get_next_master_pipe(uint32_t pipe_mask)
> +{
> +	int i;
> +
> +	if (!pipe_mask)
> +		return PIPE_NONE;
> +
> +	i = ffs(pipe_mask) - 1;
> +
> +	if (i < 0)
> +		return PIPE_NONE;
> +
> +	return i;
> +}
> +
> +/**
> + * igt_set_all_master_pipes_for_platform:
> + * @master_pipes: Pointer to the variable to store the master pipes bitmask.
> + * @display: The display structure containing pipe information.
> + *
> + * This function sets the master pipes for the platform by checking if consecutive
> + * pipes are enabled. If both pipe and the next pipe are enabled, the pipe is
> + * considered a master pipe.
> + */
> +void igt_set_all_master_pipes_for_platform(igt_display_t *display, uint32_t *master_pipes)
> +{
> +	enum pipe pipe;
> +
> +	*master_pipes = 0;
> +	for (pipe = PIPE_A; pipe < IGT_MAX_PIPES - 1; pipe++) {
> +		if (display->pipes[pipe].enabled && display->pipes[pipe + 1].enabled) {
> +			*master_pipes |= BIT(pipe);
> +			igt_info("Found master pipe %s\n", kmstest_pipe_name(pipe));
> +		}
> +	}
> +}
> +
> +/*
> + * @drm_fd: DRM file descriptor
> + * @outputs: array of pointers to igt_output_t
> + * @num_outputs: how many outputs in the array
> + * @n_pipes: total number of pipes available
> + * @used_pipes_mask: pointer to a bitmask (in/out) of already-used pipes
> + * @master_pipes_mask: bitmask of valid "master" pipes
> + * @valid_pipes_mask: bitmask of valid (non-fused) pipes
> + *
> + * Assign pipes to outputs based on the number of required pipes.
> + * This function will assign 1, 2, or 4 consecutive pipes to each output.
> + * It will also mark the used pipes in the bitmask.
> + *
> + * Returns: true if all outputs can be assigned successfully; false otherwise.
> + */
> +bool igt_assign_pipes_for_outputs(int drm_fd,
> +				  igt_output_t **outputs,
> +				  int num_outputs,
> +				  int n_pipes,
> +				  uint32_t *used_pipes_mask,
> +				  uint32_t master_pipes_mask,
> +				  uint32_t valid_pipes_mask)
> +{
> +	int i = 0, idx  = 0, needed = 0, start = 0;
> +	uint32_t available_pipes_mask = 0;
> +	enum pipe mp = PIPE_NONE;
> +	igt_output_t *out;
> +
> +	for (idx = 0; idx < num_outputs; idx++) {
> +		out = outputs[idx];
> +		needed = get_required_pipes(drm_fd, out);
> +		if (needed < 0)
> +			return false;
> +
> +		available_pipes_mask = (~(*used_pipes_mask)) & valid_pipes_mask;
> +		start = find_consecutive_pipes(n_pipes, available_pipes_mask,
> +				master_pipes_mask, needed);
> +
> +		if (start < 0) {
> +			igt_debug("Cannot allocate %d consecutive pipes for output %s\n",
> +					needed, out->name);
> +			return false;
> +		}
> +
> +		igt_info("Assigning %d pipes [start=%s..%s] to output %s\n",
> +				needed, kmstest_pipe_name(start),
> +				kmstest_pipe_name(start + needed - 1), out->name);
> +
> +		if (needed > 1) {
> +			mp = get_next_master_pipe(BIT(start));
> +
> +			if (mp == PIPE_NONE) {
> +				igt_debug("Failed to confirm master pipe for %s\n",
> +						out->name);
> +				return false;
> +			}
> +			igt_output_set_pipe(out, start);
> +			igt_debug("Using pipe %s as master.\n",
> +					kmstest_pipe_name(start));
> +		} else
> +			igt_output_set_pipe(out, start);
> +
> +		for (i = 0; i < needed; i++)
> +			*used_pipes_mask |= BIT(start + i);
> +	}
> +	return true;
> +}
> diff --git a/tests/intel/kms_joiner_helper.h b/tests/intel/kms_joiner_helper.h
> new file mode 100644
> index 000000000..95e71a229
> --- /dev/null
> +++ b/tests/intel/kms_joiner_helper.h
> @@ -0,0 +1,15 @@
> +#ifndef KMS_JOINER_HELPER_H
> +#define KMS_JOINER_HELPER_H
> +
> +#include "igt_kms.h"
> +
> +void igt_set_all_master_pipes_for_platform(igt_display_t *display,
> +					   uint32_t *master_pipes);
> +bool igt_assign_pipes_for_outputs(int drm_fd,
> +				  igt_output_t **outputs,
> +				  int num_outputs,
> +				  int n_pipes,
> +				  uint32_t *used_pipes_mask,
> +				  uint32_t master_pipes_mask,
> +				  uint32_t valid_pipes_mask);
> +#endif
> diff --git a/tests/meson.build b/tests/meson.build
> index 89bba6454..4bc68d659 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -366,6 +366,7 @@ extra_sources = {
>   	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
> +	'kms_joiner': [join_paths ('intel', 'kms_joiner_helper.c')],
>   	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
>   }
>   
