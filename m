Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751D3D6DDF2
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 11:48:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A5B10E854;
	Fri, 15 Nov 2024 11:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hpu3B+Hl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850BA10E854
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 11:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731671311; x=1763207311;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=w89t1cfjF/sD4f4hLhVGuuMzHqJlGaCY+dFoF+k5RiY=;
 b=hpu3B+HlzlHj2oPpdsxS59akCcXDWNo5+Zn+oZxm+dqhQkR4uYNCrY1+
 LBSh6cJcthBBrh9+MqAahgJ9aMyBROdeep83iSp8rpJ1m/CE2JMK1prkg
 8yXXS6THzO4WZmSmH6vANZL7pefvgn/j81xWX2hfinU6net+qGjseHX9E
 WJHTNo8wy6rdu4z7eiIhPH649RByDyHJdwXEVKSldD9XTulf6H1/Y4pcC
 k4L3C5afK3vOPuQmKBVh6TUSOrN40C8Ga88cVnSJNeObEBMVnnJoJMkp1
 m10S1RT0Y37QCpK/BwiJW2A9EREGVN07kC4zoRsTk5eep0cA71UW9RhMV w==;
X-CSE-ConnectionGUID: OoSZ5xMQSFSDRMzInHMoRQ==
X-CSE-MsgGUID: yT+yY77GTc24xqPZcsexrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31595741"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="31595741"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 03:48:31 -0800
X-CSE-ConnectionGUID: kxf2GKk6QwmDwozWsT8B5A==
X-CSE-MsgGUID: f6qiDhV3SLCPVob+V8v1mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="89295438"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 03:48:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 03:48:30 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 03:48:30 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 03:48:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQe/gdbRU2tWJxRLuXM/lgo3VSHyNOs/1P1utbtwcPKXVIhz0PyBJowHABXlIJlZHJ3cSL/SV9S4pgRe//gWMs5MbN11/h5dtID4WuV85zQRkAtAZo85s5+71hnaOax+QSBKCXWYWux1FuQmZBjLeipE8xsrefkWAr+sVrS9kJJHzPIu2jVpAaw3xDMqXoh3A3XD6+zKUv34PGz8reZ9JIZxgTLxNS1pW/Wl38j17NI35mYuD0rptnaD4EvGmzuTxPMH48ialQ+KkFdpYXrs8DaLZPHJnPhb1btl17PDyZRYlSK31VdF/V3xN8PQeoe1Yvh6qC9TzW8ij7qLEZ7Fjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvptskmDVlkkAPhnLO5N/pgdMygH0wAC5OLygMC3DyE=;
 b=Cez0uZ0Iz1vYyVuNfpywA0yNLsLn4YqlwHthrMUaWxeCFC4ogpfDNKDrNI74YRh11szrfXrc+BJ3C4GBg//WyYjrVQbfOBqN1h8IqxakRIeQzJQ+jjTc5BHIbvH7CLxXITApWAuNzWJshENfKdvqYlV7DCLgJBLQ5LBZTEpvZKdPmCP1BfYHO1TSanWbYuxfPZNpOftPWt0NSxlAKdF+SJbEH+EK21wUOiKPf2rsR9l1yZZ6HX3wgfMdAeSmmXAmPibkc2Xl2dOtGyF/wfGi/5mfKocm1bS7DhoPD3G1yjqYOPEGiPzfm/2+Rv9mC9kfIHnTcmIDYwM05adN9Row8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SN7PR11MB6993.namprd11.prod.outlook.com (2603:10b6:806:2ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 11:48:18 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8137.027; Fri, 15 Nov 2024
 11:48:17 +0000
Message-ID: <1c2e7204-2619-4a9b-ba13-bd45bc667a8b@intel.com>
Date: Fri, 15 Nov 2024 17:18:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] lib/igt_kms: Add
 igt_kms_frame_time_from_vrefresh()
To: Imre Deak <imre.deak@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241022155311.2797257-1-imre.deak@intel.com>
 <20241022155311.2797257-2-imre.deak@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241022155311.2797257-2-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN1PEPF000067EA.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::26) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SN7PR11MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: e2be1599-da65-4a9e-2199-08dd056b6560
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHNHb1hKZGJQMVh4ZWdSVEtlY1JRVUp5TlV5djBabzZJb3ZsS0Uyc0pzSFJv?=
 =?utf-8?B?UTdWcGRnbkt2MGJGUEk2WVVQSHFiWmlncWFISHlDWUlkUXVyNjFzMFpkR00w?=
 =?utf-8?B?TFhidmorMjVrOUtWcVUxdmNxVkdldUpwL2pOQ3RET2JSODYwODJXUFJkMCtL?=
 =?utf-8?B?dkpqWWZNa3hwTjJSNW1Ga1JjSmJBNU15YzJkZkF2SC85Q0ZtTitLVXJNVTY1?=
 =?utf-8?B?NlZLTmhFZ0xyQktTRE1HNzJSOXVCZ2lobGRLbkRCd0FQZUpWWCtXTDF6RHpI?=
 =?utf-8?B?Sm5Cd0hnWFEvMlp4MG5mWXYwZ0h0aVRibU9uRzBZbDhFQTNBbG5VQ2NOOUdI?=
 =?utf-8?B?SXo0MnUrZ2M0OVdSbkpub2tGb21ZTDdwSUFFbURNekcrbDZDaThydkVqUXJl?=
 =?utf-8?B?MGRyd3dTN3dvaW4vbGQySmFGSnBLdU52NU8xNittVGF6c2RBV1VMVkJYZElB?=
 =?utf-8?B?elZaRWhXN1IxcVdOUmFjSkl2N2VhTkxCUnBsWXBtNFhTbGh3eWVQWWMxK051?=
 =?utf-8?B?VVpPUW5mNEtnclhSQ2FBMzhUNlFHWWJ4QVZkNnVuRjNmUDdsNGtEeXNVaXNR?=
 =?utf-8?B?VDVhMS8zbSthRlNRdlV6a2REV2J6ckxmcUxDVUFvS0V5UGJvL2JpUm43dkVJ?=
 =?utf-8?B?Sm5FcEIrZ3NnSmNBWHkrclk0SHpyV3oxeHR3UkxBS3hOS3BQSXBDeVVPWUJv?=
 =?utf-8?B?ZUFEQUNjb1d4eENtaFdKYWtjdGJuTGkwMXFTcFZlTnZzcGliNmREbXVNbXdV?=
 =?utf-8?B?UzhrMjhOVlRETFFVWnQyRDNEdWgyaHRRcXhkK3hMbjI0SnN0QmxhdEVkWk90?=
 =?utf-8?B?QWo1YUdPVUdNbm1uQ2ZGRTN2bTg1akUxYm5CYWZZSnVLc2pUaURPaXpQQjBP?=
 =?utf-8?B?alk0VnloTnFrZ2x1MWhHbU5acUVjdFhRUXRIeTJRRkZzaDFQMStTMG5ZRmxz?=
 =?utf-8?B?blM0cUNSNWt1RFdlRVpWQ05walpXSnJQVWxQRU1uemFJWmZnMFBBK0lFRlZM?=
 =?utf-8?B?eTVVNnRaSWZqSnl1Ujdsd2F0OEVNajV6ZGFWdkFreFJjWk1sSkRIYjFiODFh?=
 =?utf-8?B?U0ZLNWxqdys4UE1IQ04zTTNhbWxqYk5mR1dNc3U2amhwVk5oeTdTTDJCSnR5?=
 =?utf-8?B?NllyVlFMKzJhM0lLQ29KQWlXQk5hMVBrQmlVL1U4cDNPV29nRHdGWHo4dGFW?=
 =?utf-8?B?ZHdlOGtDM05sYThEc04xK2NZR0dUWlRxblZndzRYUGpaNVg4Y3BHQXZDOFFR?=
 =?utf-8?B?NUIxNWFyWHBKWjVGWVNvTWxCbDIrajZZM1JNV3BOdXVKVWE3YWs0dHFDUzJY?=
 =?utf-8?B?Tm85K3NDd1dqSW5Ca0x2dHJjM2hvSXpjbGVXNUU0RkY2QThVcTdEVFFORGF5?=
 =?utf-8?B?R1Vnek1SNVpwNWZhaGo3RW95OWNFRll6aXUxQ3NsTkszV0VxNzBoOFIzZW5C?=
 =?utf-8?B?dUZqdGo1b1VtOUs2YUVXaVptV01yR2JxWkt3M3lyY0NBYjRGMlBLNE8vQVZT?=
 =?utf-8?B?QjdRUWliUSt3bitjTjEvZDR3cU5pYllKWTZTUG9MamZONjdvcHNmQkZ6TlRk?=
 =?utf-8?B?UnpibFk4ZGM4SmJ6Wm1aNGQ4alBVRmpRbUN3TjVQZVkzaEtnRFpteEtORXh4?=
 =?utf-8?B?NmZHTlNGdzdxMXdvWTErT2x6Ty9HZ1ozQ3c0eWFybFdwcjVibTZBeXM2ckpF?=
 =?utf-8?B?N0Y1N2cyWXZpdTdyOGlObDdLQkd6c0NxYlBCVVJCZ2dmWVdjTGJVYVYwbG5r?=
 =?utf-8?Q?pjp0h5FIMVg6gVu1UhoXNM4lV0o7LoRseMlD0gg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTc4N1NMcW5tbldHcTlKYjM5b0VEZ2htRFhncFB2S3pUcDFvd21IT3hpNGQw?=
 =?utf-8?B?cFhiVFJMY0lzUUxCa0tOWkcxNUVhcnpnM3g5QVVBU05pdUJMU2YzaVMyOVVV?=
 =?utf-8?B?TmxKUWRiUDBTU05yWW1wVjR5YVdQMW9IcnQ0bW41WnFXZDN4S2Fzd2VXbWo2?=
 =?utf-8?B?RllWWXpVa25obGh5YjZIVHhWY1kwQVYwTCsyV0h0eFZnbTlWRVJPTUd5V3k2?=
 =?utf-8?B?YlpHcTZkVUluSGZlY01JT2FGcm1yNnAwSjhsUVYwdXJ6eXNkbVV3cWlpOVVV?=
 =?utf-8?B?UmZCUjZLcDFDS2MwTlZTdmV2YTIzWkNEbGhkajRjeFNYRW5JRHhMOHUxZFN0?=
 =?utf-8?B?dW9uaFE2VjVEK2xIVjBLUjFQTXdIOCsvd0o2UFFnN3AzZjdFZXoyME44dXIv?=
 =?utf-8?B?NXRrMVgyUUQzT3BGbi9jUWIxWkU4Z1o5SnNOQzBOTVhHZVYxNE1LY01OUEpS?=
 =?utf-8?B?VDlKQ2htV25Yblo4ZWI3b2N2M2pRc0NQS254ZTFKUjNlRDNlUmlwb25Xb2Zz?=
 =?utf-8?B?aW5PYzVHZDJieWEwa3BJekFuRkxXV1dsZHBXZ29TVHc1U1BTNmFWN1M5dTVJ?=
 =?utf-8?B?N3RseWFxRkJpdDIvNE0zV1g1UDZLcXZyQmMxQWF0bUVhcVU5bWNZc3VzRDZD?=
 =?utf-8?B?WWs4cTMyZkF1RWhpY3lMMzlVQmJWRXRWMkJLNnMyQkxVVWVCSzk1dzgvaXYr?=
 =?utf-8?B?T1RUVVdPVlc1K1lTVHNNOG5RbE8rbks0VUJxNmZaU0d3WW1hVkYvekluY1V3?=
 =?utf-8?B?bDJkNzZ5bkx6WTM5YnJuK243VUxuY2dxbnV3dGJ3SXIreU9tU0dySEt5OThI?=
 =?utf-8?B?VWJESXAzVkdtREV4MmxjaEdaZmVxY1k5T2h0Q3UzVGZKYTc2cXVWRnlDZjM1?=
 =?utf-8?B?bUFmZTRZdHJnbTlXUEx3bDZybWVCZjd6Q3JDSkE3RjV4Qk5WRkdNcHV5ZGQ2?=
 =?utf-8?B?QTFNekRPVkJCWkdlb1U4b1U3Mk1Kd01FQ0FqUWw5alJiYXdwWU5tS1VSZnhF?=
 =?utf-8?B?dldMYnBUZXQxZXFhSFA4ejFGVEk4WWEzNlRYWVhZbXF1OW1DMk9xSEpuUDhV?=
 =?utf-8?B?RWJFTStZNzZMZHZDNmVhRVMxTSsxNHVjNnRxdm01YndVTThPVUNPRVcwaFFz?=
 =?utf-8?B?OG56NGg0V1p1SGhRQURKSjFOQjl1ZStVb21ZSVdjUkNESEJYby9iSzdNY3Uw?=
 =?utf-8?B?aURGY2tCUWcreTcvYmRlMmZ2YVNDVHFjL2ZaRnQ2QjVTOVV0M2ZLS1dNWUs0?=
 =?utf-8?B?SjBnS1Z2aStpT0xyVWYvbVpkVjMrbFUvMmRSNzdVVW9vWjYwcytnYWEzbExh?=
 =?utf-8?B?MDEyZnJOdkpKWVFiSE1WdWVzZzRHUjRQWWNPS1BRMjhOdkJzOVUxYTc5WGVB?=
 =?utf-8?B?Z2VvVHAyb3FUaWUySXZrc0NCTUJ2RFQvaW5NWkNWd1ludzhCUERoajZybjZr?=
 =?utf-8?B?UC9XNlN6cHJxSVJLZjVvaEpha2Y5MnE1aldpUU5oYnkwZktzOUcyeWhYZ2xC?=
 =?utf-8?B?bUtWQ1YwY1ZXUlFjLzBWUllXTlY2bkNIVmNlTDhxWlhPb2NlVCtDWWZrTEF0?=
 =?utf-8?B?USttTGZPYWQzZkJtUUdENnAzcGJ4Umg5OC8xeUcxZUQ2b24rN3d6S05iMWZN?=
 =?utf-8?B?MDl4K0ZNT29Cc3NlaHV1Vm5UWm40KzhMOXIwZjZ1ci92Sjk5b1VQZUVJam9I?=
 =?utf-8?B?YnVnSXB2Y05kVGhsV1d6MHlCalExM2ZCTXJJY29tdFBkRE1BV3VUbGdwc3Vo?=
 =?utf-8?B?NWkrR1FJUnpSaVdyVjkyRmxHb25WckZLczh4OTFMLytrVVVsMnh0dU1ZcGM2?=
 =?utf-8?B?RnN6Tk5TUVdVOUU4SytFb1ppck16UDVYNnNLSUJWT21IU3J6NXNZd3lKTWlR?=
 =?utf-8?B?Z1NlL0JNWnF6UEVMNENWd093TmxrbE9FRkkrS01GSHkvSXlXbTY3VWt1bmNZ?=
 =?utf-8?B?QUZWWlpZeC91bldSR1FvZnlJZlRyeEVuUEZzam1LSGJVb2ZqVWt0aUpIY25W?=
 =?utf-8?B?WW1jalRXUmVTdFBzWkF5d3IzbjBRSjUrSW0zVW5yOXgxbE5UOW9CMkFSS2Nl?=
 =?utf-8?B?a3hnTk5aTGIxb3NxS0F1Sng2Zmk0WjdCRGFaaldWUFlBOE04cE1ETFBodkk3?=
 =?utf-8?B?aDhWTWZHblFUc04vMFYzekp3ODJWbUpnNWhwZDFxdlVBM3ZsK1lhOElub1lV?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2be1599-da65-4a9e-2199-08dd056b6560
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 11:48:17.9620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TKH8EJZ8ZnXPdQyiOT03CGtrgvKHP6OQDwmhEb3T028uLRDtrmnuUgxaiz7/u4YDBoUaFyBXIyzM9gJ0PD2K4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6993
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

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 22-10-2024 09:23 pm, Imre Deak wrote:
> Export a helper originally added to kms_vrr.c to convert a vertical
> refresh rate to frame time. Use uint32_t for the type of vrefresh
> matching the type of drmModeModeInfo::vrefresh.
>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>   lib/igt_kms.c   | 12 ++++++++++++
>   lib/igt_kms.h   |  2 ++
>   tests/kms_vrr.c | 37 +++++++++++++++++--------------------
>   3 files changed, 31 insertions(+), 20 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index bb35d4b82..99231d6e7 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -52,6 +52,7 @@
>   #include <i915_drm.h>
>   
>   #include "drmtest.h"
> +#include "igt_core.h"
>   #include "igt_kms.h"
>   #include "igt_aux.h"
>   #include "igt_edid.h"
> @@ -254,6 +255,17 @@ const struct edid *igt_kms_get_alt_edid(void)
>   	return &edid;
>   }
>   
> +/**
> + * igt_kms_frame_time_from_vrefresh:
> + * @vrefresh: vertical refresh rate in 1/s units.
> + *
> + * Returns the frame time in nanoseconds for the given vrefresh rate.
> + */
> +uint64_t igt_kms_frame_time_from_vrefresh(uint32_t vrefresh)
> +{
> +	return vrefresh ? (NSEC_PER_SEC / vrefresh) : 0;
> +}
> +
>   #define AUDIO_EDID_SIZE (2 * EDID_BLOCK_SIZE)
>   
>   static const struct edid *
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 2b26d2bbf..fc7e4cda1 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -274,6 +274,8 @@ enum joined_pipes {
>   	JOINED_PIPES_ULTRA_JOINER = 4
>   };
>   
> +uint64_t igt_kms_frame_time_from_vrefresh(uint32_t vrefresh);
> +
>   bool kmstest_force_connector(int fd, drmModeConnector *connector,
>   			     enum kmstest_force_connector_state state);
>   bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, int joined_pipes);
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 36a22eebe..12d29aa82 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -192,12 +192,6 @@ static uint64_t get_time_ns(void)
>   	return 0;
>   }
>   
> -/* Returns the rate duration in nanoseconds for the given refresh rate. */
> -static uint64_t rate_from_refresh(uint64_t refresh)
> -{
> -	return refresh ? (NSECS_PER_SEC / refresh) : 0;
> -}
> -
>   /* Instead of running on default mode, loop through the connector modes
>    * and find the mode with max refresh rate to exercise full vrr range.
>    */
> @@ -340,13 +334,13 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
>   
>   	mode = *igt_output_get_mode(output);
>   
> -	data->vtest_ns.min = rate_from_refresh(data->range.min);
> -	data->vtest_ns.max = rate_from_refresh(data->range.max);
> +	data->vtest_ns.min = igt_kms_frame_time_from_vrefresh(data->range.min);
> +	data->vtest_ns.max = igt_kms_frame_time_from_vrefresh(data->range.max);
>   
>   	/* If unspecified on the command line, default rate to the midpoint */
>   	if (data->vtest_ns.rate_ns == 0) {
>   		range_t *range = &data->range;
> -		data->vtest_ns.rate_ns = rate_from_refresh(
> +		data->vtest_ns.rate_ns = igt_kms_frame_time_from_vrefresh(
>   						(range->min + range->max) / 2);
>   	}
>   
> @@ -533,8 +527,8 @@ flip_and_measure_cmrr(data_t *data, igt_output_t *output, enum pipe pipe,
>   	uint32_t total_flip = 0, total_pass = 0;
>   	bool front = false;
>   	drmModeModeInfoPtr mode = igt_output_get_mode(output);
> -	uint64_t req_rate_ns = rate_from_refresh(mode->vrefresh + VREFRESH_MODIFIER);
> -	uint64_t exp_rate_ns = rate_from_refresh(mode->vrefresh);
> +	uint64_t req_rate_ns = igt_kms_frame_time_from_vrefresh(mode->vrefresh + VREFRESH_MODIFIER);
> +	uint64_t exp_rate_ns = igt_kms_frame_time_from_vrefresh(mode->vrefresh);
>   	uint64_t threshold_ns = exp_rate_ns / mode->vdisplay; /* Upto 1 scan line. */
>   
>   	igt_info("CMRR on: requested rate: %"PRIu64" ns (%.2f Hz) "
> @@ -633,7 +627,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   	 *      next Vmin.
>   	 */
>   	if (flags & TEST_FLIPLINE) {
> -		rate[0] = rate_from_refresh(range.max + 5);
> +		rate[0] = igt_kms_frame_time_from_vrefresh(range.max + 5);
>   		result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
>   		igt_assert_f(result > 75,
>   			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
> @@ -649,7 +643,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   	}
>   
>   	if (flags & TEST_FLIPLINE) {
> -		rate[0] = rate_from_refresh(range.min - 10);
> +		rate[0] = igt_kms_frame_time_from_vrefresh(range.min - 10);
>   		result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
>   		igt_assert_f(result < 50,
>   			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold exceeded, result was %u%%\n",
> @@ -660,7 +654,10 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   		unsigned int range_min =
>   			/* For Intel h/w tweak the min rate, as h/w will terminate the vblank at Vmax. */
>   			is_intel_device(data->drm_fd) ? (range.min + 2) : range.min;
> -		uint64_t maxmin_rates[] = {vtest_ns.max, rate_from_refresh(range_min)};
> +		uint64_t maxmin_rates[] = {
> +			vtest_ns.max,
> +			igt_kms_frame_time_from_vrefresh(range_min)
> +		};
>   
>   		result = flip_and_measure(data, output, pipe, maxmin_rates, 2, data->duration_ns);
>   		igt_assert_f(result > 75,
> @@ -752,7 +749,7 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
>   	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
>   
>   	prepare_test(data, output, pipe);
> -	rate[0] = rate_from_refresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
> +	rate[0] = igt_kms_frame_time_from_vrefresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
>   
>   	/*
>   	 * Sink with DRR and VRR can be in downclock mode so
> @@ -784,7 +781,7 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
>   		igt_output_override_mode(output, &virtual_mode);
>   		igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
>   
> -		rate[0] = rate_from_refresh(vrefresh);
> +		rate[0] = igt_kms_frame_time_from_vrefresh(vrefresh);
>   		result = flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
>   		igt_assert_f(result > 75,
>   			     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
> @@ -802,7 +799,7 @@ test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   {
>   	uint64_t rate[] = {0};
>   
> -	rate[0] = rate_from_refresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
> +	rate[0] = igt_kms_frame_time_from_vrefresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
>   	prepare_test(data, output, pipe);
>   
>   	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n",
> @@ -811,7 +808,7 @@ test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
>   	flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
>   	igt_output_override_mode(output, &data->switch_modes[LOW_RR_MODE]);
> -	rate[0] = rate_from_refresh(data->switch_modes[LOW_RR_MODE].vrefresh);
> +	rate[0] = igt_kms_frame_time_from_vrefresh(data->switch_modes[LOW_RR_MODE].vrefresh);
>   	flip_and_measure(data, output, pipe, rate, 1, NSECS_PER_SEC);
>   	igt_assert_f(igt_get_i915_edp_lobf_status(data->drm_fd, output->name),
>   		     "LOBF not enabled\n");
> @@ -857,7 +854,7 @@ test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   	result = flip_and_measure_cmrr(data, output, pipe, TEST_DURATION_NS * 2);
>   	igt_assert_f(result > 75,
>   		     "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on threshold not reached, result was %u%%\n",
> -		     mode.vrefresh, rate_from_refresh(mode.vrefresh), result);
> +		     mode.vrefresh, igt_kms_frame_time_from_vrefresh(mode.vrefresh), result);
>   }
>   
>   static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
> @@ -1006,7 +1003,7 @@ static int opt_handler(int opt, int opt_index, void *_data)
>   		data->duration_ns = atoi(optarg) * NSECS_PER_SEC;
>   		break;
>   	case 'r':
> -		data->vtest_ns.rate_ns = rate_from_refresh(atoi(optarg));
> +		data->vtest_ns.rate_ns = igt_kms_frame_time_from_vrefresh(atoi(optarg));
>   		break;
>   	case 's':
>   		data->static_image = true;
