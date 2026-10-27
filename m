Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FBE606A31A
	for <igt-dev@archiver.kernel.org>; Tue, 27 Oct 2026 07:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SqunsUen
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB6510E13A;
	Tue, 27 Oct 2026 07:09:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0FCA10E0FF
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Oct 2026 07:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793084923; x=1824620923;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8CXpiRE9j7XQeacz+26MKlYQKTXAYUw/hRo35ikBrI0=;
 b=SqunsUen1bWGUODTrNIxUScDzZ7UC7qmsetQLteFQQH/iREGbZZdeQgc
 oziiZaxudzzfmawPQyif43oVsmYZfOGjFoc1RwRu2npYDejh9oYjEs2Tp
 Wa5hcEK8poQYUdrpD31tB/zyT4/0IwZ7HfqUrHg7Ku70J5U/qy9lK/zFB
 LzubeQjA2mkk5SKEstPULi/WmiKq4a962pVnKXwpou6xVVlG1UfaE2IWA
 ETLPyNEdZ3iFwrADYG0mUUt94u847ayOfYVwlabD+SFT2rsSErigWQqj9
 1iQbyti0Oore8FVwcrdpwbPT1w4tEcYFaiGQXoPubqS4G2xl5RvOIDnCu Q==;
X-CSE-ConnectionGUID: XOIxIlnjRBetlFaOWfSyUA==
X-CSE-MsgGUID: 0HSmtjDCQ1Gwqiv5+hV8lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1770775"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1770775"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 00:08:42 -0700
X-CSE-ConnectionGUID: mtnW4ZzbS7CipuCVj0ztzQ==
X-CSE-MsgGUID: PdpKLTNZQ7qnoRldynqwdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="6315966"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 00:08:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 00:08:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 00:08:25 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.71) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 00:08:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gv41TIVkR+cZboemKO+jNGMzYSpQk8qE7C6IBdC9t3VHk4WbgE5xwtWdAn4005o45Z/Nl4g6zgG9uzkrN1oKEeVsMXl0ofeT8HENlsoEqcvOXiygCZ8NBZ0Z7Ge/W4o+ImVRb2rUIi3ezpAupP/4ThZabVhHvPUMaa5xnMP3i0/piBst6ASkBdt/83/boyEKOlhwo8CZwkpB3pfZ3Pa+LUxuYrP2nTUVy5inZ84720fPlD12rUfzy35RCTIdjW3p5bIMxiKNCP6lC1a9gaBtcM5F25ah/3oFBPG3Ipe0BPpbjqrYlb7Nl2QoZHe1um+JMdCQKoKMl9dnbI2MY0o2oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HrQVrOg5htU4m7R75vbf2qjhzk2aI5M/fDXMnb1SXJ4=;
 b=wyAVHek4FOq+8LLZWXxvwzEdk4ukPE5sm2ku89bG5trM/jD6GbNAjB94cdwprhWvWWwk52R+/NBxQ4JKw2Mwz4x7bzJQlOMK4XYOc3jZC6W/h+VbjNuaiiDauNUeGAFDM5kamLBpIRJOpVnppEVnOedJJp6WeAnkBQy9tlI+/d0UQuz84sF/97dqndCa86EIljCpRyG0f7ygsmO/kYPm6ng6Xzu5G5vYZblEPycEoZXQJCWLgAzWwnHwPiVBnOpMC6rM/NuLv9RyViWL0dcbhmLP/cE5TwJENDXfr4GADbAe1d6zVGhG0gvdc79Eod9V9W0dqkxx6YJ2jZ5RFvjEBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by SJ1PR11MB6250.namprd11.prod.outlook.com (2603:10b6:a03:459::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 07:08:23 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 07:08:22 +0000
Message-ID: <b80a8c51-1212-45ec-b665-bb9a238afe38@intel.com>
Date: Tue, 27 Oct 2026 12:38:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] tests/intel: Add helper to dump GT debug state on C6
 wait failures
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20261023121034.1139234-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261023121034.1139234-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::8) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|SJ1PR11MB6250:EE_
X-MS-Office365-Filtering-Correlation-Id: 415991e0-cdbe-46b8-5864-08df33f91686
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|261026121527099003|11063799006|56012099006|261009223027099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|22082099003|18002099003|6133799003|10067099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: o04fnKwfU03gaYv9qRL6Qm0hcFre0AzYtfc4U7bshhL4IgZumPrTluQMGMcza2FX2Wlg0kXihTqLJ4/DCtNAG4QOzgkrWql9xvSleu6u9XJlqZjkTqoxMhUg9pvsq+lD7ROaanfKjbpxXE5S4Vt+iCdH3JXbt0rXLsAqpsu+6RhWIq4zR0dPFwXLXdZj8lmtDRTiiHbdp70WqTuVSJZVp7upC6j/5luJGMmoplBSqhaWHH1gYUV7P9RUu3rzYvZ8gSnSBhnhIjv8upYhL2BUw85giVnW3wVu0wUeZZppx6/ARuJEHcYDFM02AQSlnlYTLkxWVFkaMJgBWdVlLB5+DZf+Dim2htlj3H0NNfSfxA5eNxmZEFNINca2g+CCI4Cs9QoLwlrx+CxpHEDPEgKWP3ISPiqTymODQMLD+cl4KbfWN63z/w3kEVPl0evVp6RDKPUoMyXT3Wo2t70OvMFWEckLMbP3+xcGGguzREkwyUACdgJR9vBWFPYxiVSw9mZ2G3u089uo358Ge9GGM9UqoYqOduKWGn19eB/27mrjSK6NjS9K6DIn3pI5kHb0ZdZltamq+1+MOEtFdNEeTITysxb5FPMcd/ZFwKbPwtdn26KqAhJREFhzZVpMH31bt/VnNYLtMhCHNleK4hAwN5kdbdSFAcmvvrS+L2p5XshNAFU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(261026121527099003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(22082099003)(18002099003)(6133799003)(10067099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0lSUmRUT1VwcTVVVWVscDBZT2VUNzFEUCtINEVHTkx0V3I3V0RaemtaTlhI?=
 =?utf-8?B?MWFCdHRtT1lIai9hcERzL0NkOE1hN3crTG1CSWE5UzdtekxiYmxIK0IxQlpB?=
 =?utf-8?B?ZzdEWmRpM1BLRDRBU3ZTZks2dlRhVXM1aVRqVzR4Y1NmdTZVYXJ6NmpCUzAz?=
 =?utf-8?B?c0dkQkhQT0tpUGJXbkM3TDdUOGZnd1NBb2llVnFQU0Q1Y0RGcmxsNVBvNVRO?=
 =?utf-8?B?ZFV5U0xnaDgyQUFrY3JNTnd3dktvYjRUNlhMMWtPVXFuV0p5enpIUHdqbVoy?=
 =?utf-8?B?bWtaeHlxQTBSekc4UnBkRzFJZFFFdnhEMjhTZEVUUk5GQXZ6MVZyNkttUHZ5?=
 =?utf-8?B?NTh0WGI2VStITmtzc0lXZmh3SWtZa3BFZ3g3TXRwMzdtT3lwN2lhc0hPRU5v?=
 =?utf-8?B?bVA3RlZ1VFdzdERuY2pmdzRBUDVSbC9JeVV2S2RoRnhEOElPekIwR1FKV3I5?=
 =?utf-8?B?anoxNnhhT2J5eHBla3NEQ0UvU1JKUE5lY1oyUXpsc3R6WjdsVjRTN0srV3Rq?=
 =?utf-8?B?M2YzOUhtNGJGV1pqckV3RXpxRWM4OGZNRnB0eFpwcDdwTk9qUmlFNUFBVEpk?=
 =?utf-8?B?UWNoV3lWVE82SjY5SXNjcmdTRjJUdGVUYzBydGxGL0wrQ1F0Z0FFbUh0U1pJ?=
 =?utf-8?B?aW5hN1MzU1pTaXV0blBIU3JuN1g3YmZpR0JWUEJ4U0MvbWxQZXhtYXdsaG44?=
 =?utf-8?B?REgxRlRlU0tUb29MZXRON2lOS20zWnhJTVFLZ0c4YVlJVHBXdzV2ZVpobTh6?=
 =?utf-8?B?bDVubldaSy9HMlFOT0UrV0M0Vi9jd0U5TnEwTEROaHQyYWxONjJxdklpei9o?=
 =?utf-8?B?ZmNwSGp1UUFrQVdqOVNOZkxxRXpMK3IrMXlXYUE2aDQwc1lncExyU3ltRmxH?=
 =?utf-8?B?SDBUdmN5c1BuSnVZT1UzcDkva1ZiUWtNSlc2ZHVpVjd2SU1acTI4Si95UmQv?=
 =?utf-8?B?SVRCa0tRdFlTaUdUR1gwUm85VFNYY2Z0V3hFc2RNRndHL3VtZ0NYU011U3VF?=
 =?utf-8?B?R0ZiQ2NKdVNWL3NYRDZaZlhEbTFoN0VLa1UzY2JIVGdVS2hrSG9UVkYyRUUv?=
 =?utf-8?B?OWUrL3BEdzNLWHluOXR4MzRsSmVKU1ZpNHRSVDZ2Qkl3cFp6aEJiQzROZmNk?=
 =?utf-8?B?cFlXbGp0MkQzQWtUaUFOK3FPWEtkclFvTEFyL3pMU1NMLzBYVEpkeDBib2xx?=
 =?utf-8?B?bXNrVW5oN3NzbnlWQ1Z3ZE5SeU95OUE2bFdkdVZRaVltancreWFFMUJHSGZv?=
 =?utf-8?B?Mk9JUzRTa0lDK3hJR1pYT3gyRmhvVTlIS3o0NTRUZG1mTkxZUTNSc2Uvc2xu?=
 =?utf-8?B?ZnFHeFFWaU9MNlBjNGgvZVdyaXpNcFdFNjFaSFpIYkVjNnRhQ2lXRXZ5ekJY?=
 =?utf-8?B?a1lNSmZNbUpEMzcra3VjdjBQbnova3ZkTXE4S3oxSGhFb2hkRWpjYk9sMGZo?=
 =?utf-8?B?VUtyT200R1hOcXFzUmtlQklsUEFGai9TL2txN21EOXR0cGJvMFhBKzY3YW0v?=
 =?utf-8?B?NEZCeWJVRmJkYU5jZ1FyQjEvbVhLT216YTRSd3JrdVdSTjBtRS81TlJxNUFs?=
 =?utf-8?B?QnJicmhXbFN2MzR1UkhDMGRMcUlmVXJmQldBY3FCSmJzM3pIS3dZSjJYd1d5?=
 =?utf-8?B?elVRYmY2WjYwRTBZYXBUelRyc1FKYUpWcTlFdHJvZnBBeVVjUDRPWjJISXNa?=
 =?utf-8?B?TDhNYjhyU0RjS1RYK3BJZmd3UkVwcUhQM0c1Z3NSbmI3ME9tYUQwcGllelEw?=
 =?utf-8?B?NFA3U05KZ0ZtVnVDMEtyVEFYQXFCL1VaWnpZaFkwaFpoT0FxcUJNaGJVUUYr?=
 =?utf-8?B?djRSNlNVMXlDb21XZC9vNFRoRURTU2RqZDRVb0RJM2NjWHE1SE1pQ1l4NDJS?=
 =?utf-8?B?NUlHbEpCcVl5OHdPYzNMUFpYbjVFdmkxN3BtQlZHVHNhWlVsSHRoNCtMSWFP?=
 =?utf-8?B?aW0zNmlOeVNhbzlITkJNM2N4S3YyUXlOZmduYW80aFluZGtROC8wUjN1ODZT?=
 =?utf-8?B?Qi93eDFZVVVJVUlia1IzS3QzbFJ0MVlvYU9QS29EMWE2c1NsendyRlc4eE44?=
 =?utf-8?B?bFlVOUZLZ05KSmt1dnVuQ05BV3E5Qkc4S25oS2lqZnUwNlQvdzZHRnVrU3V5?=
 =?utf-8?B?QmhmUEtaeWZNeEpoZnRLbm5DdXhaeEtFRUZ6SnBrSkpZNmNPQWIwWUhRUFpl?=
 =?utf-8?B?dTdSRTNPV0FrQnBwQ3RuR0ZCQTcrV2FsTzVadXo0aE9zclREeFV2em9aMXE4?=
 =?utf-8?B?Qyt5QVBOMkwxYWhxWjBaTk53SEVISW5MZTFuK2Rid3pRckNiL09QUXAxKzZk?=
 =?utf-8?B?ZHl3VDNMenNVd3dwMDRQQmttcC9pNmZzR2kySHRNaUkrbnhvTlFWcTRjRWZt?=
 =?utf-8?Q?REKhduddQ7dcthhI=3D?=
X-Exchange-RoutingPolicyChecked: gxzIkGTYxYZi4dLnMITzgW88NhezRLCdaoUMEAl/gFL89rAD3wrinZii7RROw6vPtUSMFQUGDbfIyJ3HtcqpHSI0m3CvZhDPcKQOhZACHYA6E8WjGIy2tsXLfW27Iu4s7ZKlku0Go1WzLG9PTnJOax9sSUJY8Z/RahwGEevSZTp8+xw2jJrG1cJsGbDDapLinnlZV1l6P9mcTfkDwR8kHD5OMD8eav3/xH2Xaf8c7lcYCVuVEo5u3jTofIVDj2JmDgYqxsm2lqhDecq1LonTy7MOdqXdwWUTcwzuCrJc3wxepYHvucI+yNs4NWPrDH4j+eJUBFY1QoltrPFW6GgZxQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 415991e0-cdbe-46b8-5864-08df33f91686
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 07:08:22.8569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JOnXlh5Hz7skrYBNdp8Dg8xeUD+MqO7Er2pBj5Ea1D60Sj9W0bArJ54tO55leG/jMpob7AZxC+jz1HQB1KDuwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6250
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Anirban,

On 23-10-2026 17:40, Sk Anirban wrote:
> GT C6 assertions currently only print GT state on failure, giving
> no insight into what kept the GT busy.
> Add a helper that prints both hw_engines and powergate_info whenever
> a GT C6 check fails or is skipped.
>
> v2: Include NULL check & cosmetic changes (Soham)
> v3: Cosmetic changes (Soham)
>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   lib/xe/xe_gt.c                | 39 +++++++++++++++++++++++++++++++++++
>   lib/xe/xe_gt.h                |  1 +
>   tests/intel/xe_gt_freq.c      | 21 ++++++++++++-------
>   tests/intel/xe_pm_residency.c | 13 ++++++++----
>   tests/intel/xe_pmu.c          |  4 +++-
>   5 files changed, 66 insertions(+), 12 deletions(-)
>
> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
> index 3d8b4f68a..1f0b77986 100644
> --- a/lib/xe/xe_gt.c
> +++ b/lib/xe/xe_gt.c
> @@ -8,6 +8,7 @@
>   #include <sys/stat.h>
>   
>   #include "igt_core.h"
> +#include "igt_debugfs.h"
>   #include "igt_sysfs.h"
>   #include "lib/intel_chipset.h"
>   #include "xe_gt.h"
> @@ -229,6 +230,44 @@ bool xe_gt_is_in_c6(int fd, int gt)
>   	return false;
>   }
>   
> +/**
> + * xe_gt_dump_debug_info:
> + * @fd: open xe drm file descriptor
> + * @gt: gt number
> + *
> + * Dumps the hw_engines and powergate_info debugfs entries for @gt via
> + * igt_info, so they are printed unconditionally on both FAIL and SKIP paths.
> + * Always returns false, so it can be OR'd with the result of an igt_wait()
> + * condition to dump state only when the wait fails.
> + *
> + * Return: always false
> + */
> +bool xe_gt_dump_debug_info(int fd, int gt)
> +{
> +	char *info;
> +	int dir;
> +
> +	dir = igt_debugfs_gt_dir(fd, gt);
> +	if (dir < 0)
> +		return false;
> +
> +	info = igt_sysfs_get(dir, "hw_engines");
> +	if (info) {
> +		igt_info("GT%d hw_engines:\n%s\n", gt, info);
> +		free(info);
> +	}
> +
> +	info = igt_sysfs_get(dir, "powergate_info");
> +	if (info) {
> +		igt_info("powergate_info:\n%s\n", info);
> +		free(info);
> +	}
> +
> +	close(dir);
> +
> +	return false;
> +}
> +
>   /**
>    * xe_gt_fill_engines_by_class:
>    * @fd: pointer to xe drm fd
> diff --git a/lib/xe/xe_gt.h b/lib/xe/xe_gt.h
> index 93525ea35..9ef15d7dd 100644
> --- a/lib/xe/xe_gt.h
> +++ b/lib/xe/xe_gt.h
> @@ -21,6 +21,7 @@ void xe_post_hang_ring(int fd, igt_hang_t arg);
>   int xe_gt_stats_get_count(int fd, int gt, const char *stat);
>   
>   bool xe_gt_is_in_c6(int fd, int gt);
> +bool xe_gt_dump_debug_info(int fd, int gt);
>   
>   int xe_gt_fill_engines_by_class(int fd, int gt, int class,
>   				struct drm_xe_engine_class_instance eci[static XE_MAX_ENGINE_INSTANCE]);
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index 886537862..ab1c30ea1 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -57,7 +57,8 @@ static void test_throttle_basic_api(int fd, int gt_id)
>   	char *throttle_reasons;
>   	int gt_fd;
>   
> -	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
> +	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
> +		     xe_gt_dump_debug_info(fd, gt_id),
>   		     "GT %d should be in C6\n", gt_id);
>   
>   	gt_fd = xe_sysfs_gt_open(fd, gt_id);
> @@ -145,7 +146,8 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
>   
>   	if (gt_idle) {
>   		/* Wait for GT to go in C6 as previous xe_gt_get_freq wakes up GT*/
> -		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
> +		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
> +			     xe_gt_dump_debug_info(fd, gt_id),
>   			     "GT %d should be in C6\n", gt_id);
>   		igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
>   	} else {
> @@ -160,7 +162,8 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
>   	igt_assert_lte_u32((rpmid - FREQ_UNIT_MHZ), cur_freq);
>   
>   	if (gt_idle) {
> -		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
> +		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
> +			     xe_gt_dump_debug_info(fd, gt_id),
>   			     "GT %d should be in C6\n", gt_id);
>   		igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
>   	} else {
> @@ -179,7 +182,8 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
>   	igt_assert_eq_u32(xe_gt_get_freq(fd, gt_id, "cur"), rp0);
>   
>   	if (gt_idle) {
> -		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
> +		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
> +			     xe_gt_dump_debug_info(fd, gt_id),
>   			     "GT %d should be in C6\n", gt_id);
>   		igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
>   	}
> @@ -210,7 +214,8 @@ static void test_freq_range(int fd, int gt_id, bool gt_idle)
>   	igt_assert(rpn <= cur && cur <= rpmid + FREQ_UNIT_MHZ);
>   
>   	if (gt_idle) {
> -		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
> +		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
> +			     xe_gt_dump_debug_info(fd, gt_id),
>   			     "GT %d should be in C6\n", gt_id);
>   		igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
>   	} else {
> @@ -412,7 +417,8 @@ int igt_main()
>   
>   	igt_subtest("freq_fixed_idle") {
>   		xe_for_each_gt(fd, gt) {
> -			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
> +			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10) ||
> +				      xe_gt_dump_debug_info(fd, gt),
>   				      "GT %d should be in C6\n", gt);
>   			test_freq_fixed(fd, gt, true);
>   		}
> @@ -430,7 +436,8 @@ int igt_main()
>   
>   	igt_subtest("freq_range_idle") {
>   		xe_for_each_gt(fd, gt) {
> -			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
> +			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10) ||
> +				      xe_gt_dump_debug_info(fd, gt),
>   				      "GT %d should be in C6\n", gt);
>   			test_freq_range(fd, gt, true);
>   		}
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index e976048a9..c5240378a 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -217,7 +217,9 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
>   	unsigned long elapsed_ms, residency_start, residency_end;
>   	struct timespec ts_start, ts_end;
>   
> -	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1), "GT %d not in C6\n", gt);
> +	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1) ||
> +		     xe_gt_dump_debug_info(fd, gt),
> +		     "GT %d not in C6\n", gt);
>   
>   	if (flag == TEST_S2IDLE) {
>   		clock_gettime(CLOCK_BOOTTIME, &ts_start);
> @@ -326,7 +328,8 @@ static void toggle_gt_c6(int fd, int n)
>   		close(fw_handle);
>   		/* check if all gts are in C6 after forcewake is released */
>   		xe_for_each_gt(fd, gt)
> -			igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1),
> +			igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1) ||
> +				     xe_gt_dump_debug_info(fd, gt),
>   				     "Forcewake released, GT %d should be in C6\n", gt);
>   
>   		if (n == NUM_REPS)
> @@ -392,7 +395,8 @@ static void cpg_gt_toggle(int fd)
>   	int gt;
>   
>   	xe_for_each_gt(fd, gt)
> -		igt_skip_on_f(!igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
> +		igt_skip_on_f(!(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10) ||
> +				xe_gt_dump_debug_info(fd, gt)),
>   			      "GT %d is not in C6\n", gt);
>   
>   	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> @@ -581,7 +585,8 @@ int igt_main()
>   	igt_subtest_with_dynamic("gt-c6-on-idle") {
>   		xe_for_each_gt(fd, gt)
>   			igt_dynamic_f("gt%u", gt)
> -				igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1),
> +				igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1) ||
> +					     xe_gt_dump_debug_info(fd, gt),
>   					     "GT %d not in C6\n", gt);
>   	}
>   
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 1dc102a7b..de07c2236 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -878,7 +878,9 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
>   
>   	pmu_fd = open_pmu(xe, pmu_config);
>   
> -	igt_require_f(igt_wait(xe_gt_is_in_c6(xe, gt), 1000, 10), "GT %d should be in C6\n", gt);
> +	igt_require_f(igt_wait(xe_gt_is_in_c6(xe, gt), 1000, 10) ||
> +		      xe_gt_dump_debug_info(xe, gt),
> +		      "GT %d should be in C6\n", gt);
>   
>   	/* While idle check full RC6. */
>   	start = read_idle_residency(xe, gt);
LGTM
Reviewed-by: Soham Purkait <soham.purkait@intel.com>

Regards,
Soham
