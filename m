Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64590D42BBE
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 17:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1108010E60E;
	Tue, 12 Nov 2024 17:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dZaLLKyU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B412110E60E
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 17:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731434351; x=1762970351;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iU3m0z+uRdN3wmuaMWgLgOrDdl8n6Y0sU0L1Vk3l+lc=;
 b=dZaLLKyU8c+NVdLr30vUGqiHZwU7Zk7ORI3g19Pqxtsi5V0fawO9fiK0
 veoztYmaa41bWpGeoHXWS31FrDJSP/p2wiUfbSnPH35LsFU+UhCFB4HAV
 zyI6fBe7PfqsSKUiJTAXq7UD2ptjLgMGl7Uq9xNewXhEABfzIQJW3ECkq
 AjOaXHTArv5lBzBJ6RwVyYclRyAV+P8gJcrZx/Uz3dl1EIBci5hRdL71F
 VVjUYBe6rBa+bnNHcIbGh/4rJYPizoQUZc3BfcIIlYGjcSeB6YiANB9Up
 7AVXiGZ7oOd1/Dla9atw2QdpNqtgNrkycmUZEyYgKT5HyGWVBHvkfPW1N Q==;
X-CSE-ConnectionGUID: e3pYhUkYSkqYk4YgcZ1E9g==
X-CSE-MsgGUID: 4HL5yykMTV23VT09miDhVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="42676913"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="42676913"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 09:59:03 -0800
X-CSE-ConnectionGUID: 8qpwySdxQ32pFw2KvVi4yQ==
X-CSE-MsgGUID: 1C1/zkFmSJGuAqhVGsmwrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="92549697"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 09:59:02 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 09:59:01 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 09:59:01 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 09:59:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdK68eTnRPxm0eP/W4oVmIMdVNIRvXtzl6LddnSctG60xbHFHR4aIaghJQzTZdQ21PgFAzwwoI6qoNd2MXrJixWcqIbsB9TYMCy/3gVG+JeDBfM5pxl6DXw3uppgC8coi2XEwli59aXFX16WGq6MBqBTGQNd+/Ba81+UVj6TujA/L4fsM5q6x4bQmrROBbtbz/81dsTC6Hd+EWEhijOxtEKJUkqAd0TFgqf0muvPG7i2KNH0MPcOHIAoLKlzCGSpWLP7KjFCWTbzfKqvJCy0J2IhZS81YiIATwF+N68j8EfLGL7v9tIxw01c4T9Yz1r31SomQHfXta+XdpPlI6nrdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvEVu8BzBlSO70hO1eWABC7N+dcK6AkQBQbqDt/JA/4=;
 b=i6ZhNvD6KWLTOiEUY/Z1tA47KmhwIcM38Z9LUfJOEuHuNcSmAV7r/wcw5oopWukKZ0ekkpDhZbHCJw/vkwDt7UCkgna6DwGJJMmvSYs/LU7NGmaqe5kSiH4vK2ss2CDAF0Z1xTkZzxj0fu+J4pFvmk+D1IODVNeGSx+s5Qvp9soIJdDjqc8YFBWGHtRwdu3fItqeC6aY+GO8EwamckclHoEsV9RPIovH5W9eajpr7IlXAQDPPAnAa2ISuc+KDCdE2Eli3Ij/1WAmXxC/qT2N4XX6j4nT7HZ9VCLnM8BiIXMrBcoO0D3CWyqPKIkdhi7A52cYMBnSzIQ2Qn0429e9Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Tue, 12 Nov
 2024 17:58:58 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.8158.013; Tue, 12 Nov 2024
 17:58:58 +0000
Message-ID: <df0baea0-7dd3-414c-81fc-c163a5efe6bb@intel.com>
Date: Tue, 12 Nov 2024 12:58:55 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/intel/xe_fault_injection: Ignore expected errors
To: <igt-dev@lists.freedesktop.org>
References: <20241107195959.98509-1-jonathan.cavitt@intel.com>
 <20241108155824.deuiikqqcvog32ms@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20241108155824.deuiikqqcvog32ms@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::23) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|IA0PR11MB7864:EE_
X-MS-Office365-Filtering-Correlation-Id: c3ed3043-893c-4870-9053-08dd0343ae7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T05NODg1VE9Pc3NWc1Fwd04rUUNlbjloOVpiTC9mUWFJMXMzZWVDRXVsVEhL?=
 =?utf-8?B?NEdpdVdLVG5oM3ZlVHViUGhTRXhiZ1hYbHQ2em9zLzQrcktPeUQvUmI3ZkxR?=
 =?utf-8?B?WUFVZk9tOGFOL3o3VUdFWExlcDB1REhVY1JIYW5rSGU1T09PM2dLUFZZb3ZI?=
 =?utf-8?B?Z2lGOCtvR1RVbjFYN3JHWVZ3UGhNMWxiOC9RS2V3andOZERTNU1lQnBWVzEz?=
 =?utf-8?B?ZDZid1NRSkxvMmRHNU4vUmFpK3o4Zm0rZWhpQ2VJdExLMEJXSUdpUFk2Z0VB?=
 =?utf-8?B?SHZIakJJRzVmdUM0ODBqTUt1RXRsY2ZHcEJtTDVRazV0YS85WUV4RlZGeGJQ?=
 =?utf-8?B?bUxaU0NXVHY2dVppRk5kQWhHUjYrTFpCL3F0OVYzMnRjcWhsQmYvQU9GWWFv?=
 =?utf-8?B?a1g0R0hDdmlMMnB6aFMvdHRtOTkvMkJqYkhNMGxreWFBcktQRmdjVUsrZHQ4?=
 =?utf-8?B?dFo2TitiZzdrM096UWdkelNSU3hQc3J3U2FqN2NIMXY5SGZSMVBRMi9Pd0Nw?=
 =?utf-8?B?SlpXbzh6ZEUySUhvUU8vamI1MkpQNUVKcmJkWGt5QUM5amczNFNWMEFOSXpv?=
 =?utf-8?B?SFpwckJZOS9INFNoalVUVlY4aTNRRWVXNG9JV3dVREllUnd1WC9wVkNpcUhM?=
 =?utf-8?B?T25GRDlBRFd6RmFPQ0FZbG42Sy9NUFpLbUM4U0xSazBWdGV1RmFwMXhwbnNO?=
 =?utf-8?B?Z3QzSjZoemJaOVR0WmM1aDFIdnNDRXhYMGh6MXpXSjd0L1dnQ1BIY1hHVWdK?=
 =?utf-8?B?Zis1UU1ZQkNiQ0NveHZtR1IrMzdTUVk0cmxyYkw5ZHRiekx1aHJpbG5odE1p?=
 =?utf-8?B?dVozQTFkcjhTYmFOQmdvL1B0SHRzZVVtUkFTVklGU0lPYjAvcy8wQzNxRjJX?=
 =?utf-8?B?OUhqSnNBWHlQcEc3c2VuVGJ0bmNoUnlRbzNYNmZ4Qy9YRklQWUNRTFEvS282?=
 =?utf-8?B?dnhEczFoVzdtZXZlRlZiVFdNY1dJNkVHVm03U2hzMWN0TXVheEdGTnBQOXRV?=
 =?utf-8?B?QndjbDFrbUd0M2hoalJuSG56Vzg3MzJkOWs4QStxeVVkaTVIL3pnL0krQ24z?=
 =?utf-8?B?bXpOb1dwaGZiOUhJWG5oOExvV0R3VnZaZWN3MUk0bStsWHJKQXlMMEhlbkgv?=
 =?utf-8?B?NXZmUUJNbklQQmd4SFZROTNibXRCQXFhbUwwT1JYbSt0SEowWE92UVBwY3Ux?=
 =?utf-8?B?M1cvQmVMVkNJRERIUDMxZWlnN3RsallqQWRoSEZWeHFmajlBV3ZCNngvaTl3?=
 =?utf-8?B?cWVmd3VpTVJQOFlKWDZzRldycVFDckVpeWl0MWdlU2J4Y3N5L0RoRjFqR21J?=
 =?utf-8?B?SlRNM3lvNHdXTmIrVExacEVQMWlTVUZYa205SGdrMjQya2ZhOVZTd05ZMjFk?=
 =?utf-8?B?cjZZTmdFbGRpSThOTEVVdi9oYkhERFh5c0ltWjlobXIrVU9LMjBCWXJYQkpi?=
 =?utf-8?B?NUV6VlRTVC8yc2lMWXlOVTRpM0E3d3hPMlNtYlpLanRUcHJvbnhxeUNGZmpM?=
 =?utf-8?B?ZGxTeFFSZFBkWkF5bmxNRkZLbGpWK0gwR2hnUjhZakFmc1FWS1pvcERqV1hF?=
 =?utf-8?B?R1Nid0lHNllZdDAzT01nRlZzNy9jZWNiR1N2TjZ2eEJlUTl1Qm9xK3ZSOGdD?=
 =?utf-8?B?a2Y0NlFITTJjWnF5MFUvd1FvbGp2NlBVdTAzdExCTFJVMzdLSHNmK21kZms0?=
 =?utf-8?Q?k+XLB6nhfRc5oirKoQ5W?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cExqekNkdVIyUzVENVkxNU9xdFp4TXNBUHF4Szkvd3dYN0RYblNHYXp6aFBJ?=
 =?utf-8?B?aWd6UFJBMng4T2l6Y2VzL2xtMlJFVzUwdTJhNWQ1QjF3NDdTUUp2WFVmVWZD?=
 =?utf-8?B?WjA2NHN3MStyQmhIVzVYOUNDdkwwSHFpOU5EZ2xuMlVDTmxSNzJ2OW9UWFRa?=
 =?utf-8?B?K2J4MTdtak9GVkpsWW41Vkw4VUs5OFA3d2llNUZTc3BMRXZuN2xBc3lZZjNo?=
 =?utf-8?B?S2E1dWZ3S2JwTnozUDNsVHUza1JBSW1xVjhhQVN2Tk5KMzVPUGNTR3AxZlZH?=
 =?utf-8?B?V292R3ZjOEtnbXZWTHd0cVFzOXZaWVhiZUpST2diejFYN0JkOXA1MVN3cXdp?=
 =?utf-8?B?bzVxVnp0N3V4cElrazF5KzZtWmhWREpqOVZwWFg1cGNlbWtTeDE1TlYyUStO?=
 =?utf-8?B?M2drM2ptMFU2cHVuMU9oNE9ZNXF2QmFPam5vd2JjcDBuQkp1aDVDMHZCVmZk?=
 =?utf-8?B?YmZpWllNbFo4eEVsSHJINUUrM2tpUGV1UnVNV2xUUlFMbFpTNUJ2ZnBiS0Nj?=
 =?utf-8?B?Qy9XVGljL21EVVpPZjBhSDREK2g1RkVxbVMwQWxDTVpzRVN4bjZSaTBLRG8r?=
 =?utf-8?B?YXBYV2VRYlN5Yi9IWjlCSzhzUU10VE9Sc0hlNmpuQy92QmhWTmoyRmZOM3VT?=
 =?utf-8?B?OGhtVkdoNG9lQW5VZVlUMDFKTEE3d1pMcm4rQ0dRVEN2VHZVNWM5SG5LdjJk?=
 =?utf-8?B?d2ZHSWNGdW9vQzUvVXFTYUVVQ3cyZVBVN0p3TURWcnRnSmMyNkQxSGZHTVVL?=
 =?utf-8?B?eDZ2S1ZTcitaQ2Q1ZkswbytUalNvY2x1NFVDeWVYWllXOUVPS2RRL0tsczVR?=
 =?utf-8?B?dDl1MVFtY2o1UEYwcmZhaUNPWno0T1JjajVRNVZvTU9NSU9XZ1dSUkpyUlp4?=
 =?utf-8?B?VlNSY2g3M1VYRVlGN0VBbDZNYkd6U0ptN1czSG5reTExaW52N3NyRG9CMnJU?=
 =?utf-8?B?ZmJwN2Rpb3I0NnZOblFvZm1KR0VadGhyQitLaTZqeDhtNm1GZUhTcW9GS1dN?=
 =?utf-8?B?Z1VaMXBSZ2ZNMFd3Y1ppdTNreVF5ZzZ0YzR1S0dXekN5TnlBMnFvRTJUekY1?=
 =?utf-8?B?VGt1OGk3aTlDaWF4elJvaGRjMEhlUlFpZ054d2s3TmZtbHB4ZEVYcUEranpp?=
 =?utf-8?B?VFZhd3g5UTB2cGZoTHhQUHRXWEpkamN5SmY2WmcwWUlnQmxodWFpdUxra09y?=
 =?utf-8?B?ZHY1SlNRMDNPR3Q0QVByOFJ2ZWxZWDdHaEY0OEZuaFJ2b0dtcHJCUTNWNjFT?=
 =?utf-8?B?UjdoRjhEaGhJY1dEZkZZOHZlM0lkTm9ZOXFUWExtWHRSZ1loM1FBdTcyR3VX?=
 =?utf-8?B?U2JhWG1vYUdDRlFuS1dQU0ZJWXJGR3FReHpydHVORStsNHVuV2JoWEgvSzJZ?=
 =?utf-8?B?ZnNqR2FUQzNlcWZnblJqb0NDUXoyWmMvbk9RNzUrTnBFSmJESC9mU1F1eTZ2?=
 =?utf-8?B?MHkwVm5nRjVDbi9JUzRwNm95REduL1gzelhlZFd1L1IyOCt4R2M4NGNaczMw?=
 =?utf-8?B?aythZXR5TW9hUTlCV0NYMlNWd1ZjakFpYUZyeTdoQ3lXYXZUTUlwNzZCNXB0?=
 =?utf-8?B?ayszNTF6SmovQ1ZSTWdSZUczMHpVRTFsQ1ZzQTZKL1RJb2I0azB4b1poSlQ0?=
 =?utf-8?B?SDRaRlI2UEljZ205L014VmdGNWlJUmh1a1hwRGwxVnNRaXYxd3FUUTdtT1dQ?=
 =?utf-8?B?NmVncnA3TktVLzF1YS9UcVBIL2svcWpZUEFBNldPRGtmdE5ZUDA5QjVZK3ho?=
 =?utf-8?B?L0RLQ0FHVW5hemxGeWlRTjN5TzBjVmJDUHlIZmUxSFRBMWV1VlMwMHZMNXov?=
 =?utf-8?B?azEvVmlwcTFhY2piWWlyOEN2UUZySXdpeThyMjhVL1RnSWd4dmpPbEdKK1dZ?=
 =?utf-8?B?UC82blIwZXFaN1ZWZTZaTnIrdmkxVHRIWXlSajVuSEs5ZE43UVdkbEJ6Y2ZC?=
 =?utf-8?B?eXc1WXZpYkF0NXNnVzh6SjNOM0IvOEV4MmZvemQycjllZndFTTYyREVQTjZZ?=
 =?utf-8?B?M0cra3RkVmk5V0JZdXlHZkp1dGMvcURqN1hFcTViUTBIdjNWdjVQMDRhUkpp?=
 =?utf-8?B?b0graXFhNWk4SWhZOFIvZHhLZnE1RldiSkFGa0N0Y0dMUlk1ZkhmOFBxUXMr?=
 =?utf-8?B?QmdhSU15TFFraHhNZmNCQVFqSXp6ZWtmSUVCMkFkSWlNY3F1cEk2Y1ZURkxm?=
 =?utf-8?B?aEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ed3043-893c-4870-9053-08dd0343ae7f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 17:58:58.4522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ux1CFxwh0BvCf1y1lHmciqdvf5SRbrYkon1DNGcLYUD2jHcomQ+i8pZKflcfODeErRE9wOehiVcK/jTzZ/+VxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7864
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



On 2024-11-08 10:58 a.m., Kamil Konieczny wrote:
> Hi Jonathan,
> On 2024-11-07 at 19:59:59 +0000, Jonathan Cavitt wrote:
>> The following errors can be observed when running the xe_fault_injection
>> subtests:
>>
>> [drm] *ERROR* GT0: GuC init failed with -ENOMEM
>> [drm] *ERROR* GT0: Failed to initialize uC (-ENOMEM)
>> probe with driver xe failed with error -12
>>
>> Add these messages to the dmesg ignore regex to the applicable tests
>> (specifically, all tests for the last error, and all tests that target
>> GuC subsystems for the first two errors).
>>
>> v2:
>> - Fix and merge regex (Kamil)
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> CC: Francois Dugast <francois.dugast@intel.com>
>> CC: Lucas De Marchi <lucas.demarchi@intel.com>
>> CC: Matthew Brost <matthew.brost@intel.com>
>> CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> ---
>>   tests/intel/xe_fault_injection.c | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
>> index d1c8b25307..8b181808ed 100644
>> --- a/tests/intel/xe_fault_injection.c
>> +++ b/tests/intel/xe_fault_injection.c
>> @@ -30,6 +30,30 @@ enum injection_list_action {
>>   	INJECTION_LIST_REMOVE,
>>   };
>>   
>> +static bool function_is_part_of_guc(char function_name[])
>> +{
>> +	return strstr(function_name, "_guc_") != NULL ||
>> +	       strstr(function_name, "_uc_") != NULL ||
>> +	       strstr(function_name, "_wopcm_") != NULL;
>> +}
>> +
>> +static void ignore_faults_in_dmesg(char function_name[])
>> +{
>> +	/* Driver probe is expected to fail in all cases, so ignore in igt_runner */
>> +	char regex[1024] = "probe with driver xe failed with error -12";
>> +
>> +	/*
>> +	 * If GuC module fault is injected, GuC is expected to fail,
>> +	 * so also ignore GuC init failures in igt_runner.
>> +	 */
>> +	if (function_is_part_of_guc(function_name)) {
>> +		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
>> +		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
I see "." matches left parenthesis, why don't have another "." match 
for right parenthesis? I mean it looks strange when compare regex string:
    "GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM"
vs
               "GT0: Failed to initialize uC (-ENOMEM)"

Regards,
Zhanjun Dong
> 
> This could be one call to strcat, but it is not a blocker.
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
>> +	}
>> +
>> +	igt_emit_ignore_dmesg_regex(regex);
>> +}
>> +
>>   /*
>>    * The injectable file requires CONFIG_FUNCTION_ERROR_INJECTION in kernel.
>>    */
>> @@ -175,6 +199,7 @@ igt_main
>>   			if (regexec(&regex, line, 2, pmatch, 0) == 0) {
>>   				strcpy(function_name, line);
>>   				function_name[pmatch[1].rm_eo - 1] = '\0';
>> +				ignore_faults_in_dmesg(function_name);
>>   				igt_dynamic_f("function-%s", function_name)
>>   					inject_fault_try_bind(fd, pci_slot, function_name);
>>   			}
>> -- 
>> 2.43.0
>>

