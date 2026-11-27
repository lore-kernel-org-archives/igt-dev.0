Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8C1606A324
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 04:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AMiLEkQh;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=mI8QhplT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F3910E869;
	Fri, 27 Nov 2026 04:49:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C39410E869
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 04:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795754864; x=1827290864;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zu2qh0o9jAt4E65Azhl6VC+GwiS/yg3iDu4f4N/K5aY=;
 b=AMiLEkQh6Mwb2ctiW///Kw7WBh8TLR2Aoy3aPXkf4K4uDLjX8IIrS4it
 U5AR4wF4BhB3bGPWyf39ZkZ7LE2WR5EH2XUw5HZF/VQxUOuCGEeiX3Krg
 ejHxE/VE1vZV92c4ERRNyMVtUtUSsYpWkeUohyY2+kMKs5geIOAI9BXfc
 t+MxF/hVdeh7XToqZ9x3l9Gw8m/2GtpPv484Ou/GKI6D2od/DpJbj+ML/
 PfdBLx6sv2AuzAYllaD7PirWMeGnUrARB/rOg6wyUWeUre/M4LRSbxNc0
 41/Sf1HPlDoylBQOSp6eZUhMCmkualXjvABHNa5iHX5UhtPZJvkKWvJBp A==;
X-CSE-ConnectionGUID: +UF2eODvTqKabebIgegwqQ==
X-CSE-MsgGUID: W4WAtTaJQSK9mbbdp5sOOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4677828"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4677828"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 20:47:44 -0800
X-CSE-ConnectionGUID: zdvyNLidQZ2WajYaoXXxgQ==
X-CSE-MsgGUID: 0Wp8HrW0SHW4X8IAfD3sig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12923583"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 20:47:44 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 20:47:43 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 20:47:43 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.53) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 20:47:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xaVuB5GW69Od7RVxUhllGOhhzoQPzF8eBIO5R8fh4IEhLDJStdbMTm43Kk+9ODaSvCJQVqq2Dv2xuxQFpuLHbROLyKlnW2jX++A+vwtYqkQXp55l6b/lasfyOlKW6l9P2cAm0XkYPDtmgOSoRfr2fNRPLgvPWO4F4Ry/7KyYna2NBVLaudU0NtSRtJim+D3mWxqbTXcbnnAduUZM2BAlnC2uoCXw4FHsuJoXWA3KphFDqKT39M926Hqzi3hT0nyiXJjbqHIGwSUCc1uXFHXQl4v62rImsDHZ8/luXMojbphYs1k33e3V1LG8QI5E3Un93Uen0GNyz8Ct4rl/G9CLEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqbGCh17ef+MW9r0MI4fZTAHQy6sOTXNcwlugkLcwlw=;
 b=kMNJYWDfMuZpu2bZ5i29j/DgaDdmOGWTQeUJR4hTdypiTPbdzRKPJws/Ds4xHXVjyK4y16Q4fcBlA1gEfgNboqXW9OLKUsmoeQHKFUsBs6xU92nBNPJQ05XVgBcJUB3vHComOqbw/ON9Jy/3NIc675TUC5nboBmj0Xa1n1K87sHFaY3R3QnSs2Kk+2Tuu5QV4bdLyZ1IKGUcKxaN3rFzLYoyg5Qd1qwrqbM+Geu78z7/IIj6fFoZORtvN+PFK9p6p5dtG7+9wh29RTZwkvo9Xi/1AducRq2bc+7aQ34WUVoyrM0e5JwvmVAMzN9sg6ERalAV77XlxVKW1PjTmZOHjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqbGCh17ef+MW9r0MI4fZTAHQy6sOTXNcwlugkLcwlw=;
 b=mI8QhplTgE7fJRBXfUdH8IyBkI44CU4M++t/xh/H7+vJR7eEVbgfICl41T5jIvbsTUGyFfKAN1MAKQ3t21rf1Y2DjE7n7/NFzNU9YokMlyTMV/CDbxjIqF6F/s0466UObOhwlOBBHSMESEhtYmz3cPZwQt3o1ZWB3S/eKL/WTsE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 PH7PR11MB7076.namprd11.prod.outlook.com (2603:10b6:510:20f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.7; Fri, 27 Nov 2026 04:47:32 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 04:47:32 +0000
Message-ID: <569ec20b-c5e4-4a9e-b3b1-1bb64f713287@intel.com>
Date: Fri, 27 Nov 2026 10:17:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] tests/intel/xe_err_injection: Readback and validate
 threshold
To: Raag Jadav <raag.jadav@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>
References: <20261124053219.2129054-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <20261124053219.2129054-1-raag.jadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::7) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|PH7PR11MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: 2381bdce-5e4d-485e-6320-08df4c418c44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|261009223027099003|18002099003|22082099003|11063799006|10067099003|56012099006|261102123227099003|261026140227099003|261022105027099003|261028144727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: CX/zgw3X7JpTl1havWPR495+OXZP/qKgQGNA+AXWovFZWSGSffpcs5PWkbhxtF21tqyjQA5+qbqM2sDAIiIbkWlB5rNmW9uDH95rbkXKubDMIRvilX1A37L4nhBVKH9kItibTakGmh5azcVr652iVSLRQHqCcVc1m6pEDVDx4kUiiPMz8VCwwALtRgDo1wfQQX2sCJpVEqhvv7u7y6wH4pZRa+IbF+XhmImXfxrRXK1sjtJkbTUC6hsEkJxc9/r1WsawBIM/xePVQqJf9VBbvx7sniprJNMDGms0HyyLTVG2eQX0SQGg1YCSDFR6F5LIJobtbe48Ihzd5jDu6yixjivh+JVwwwNnk4VhwngnM5rHHRvfSVLpMZQYJDh6o8eBGGhQxfuU2jqpcE+XbAZvAeLA99FtE/JIte8BbSu6SQQMG2zQkNj2wbV1zAg/0YIX6v3NsiBtq9SftT+3T+xF0jQ7JtFEYB1LJUxyLX0WxoAL50E2LNfRcn4ONkLzoiC6ZaXwMkGrwAzutaPbR1eP42Gsg5RZJrkhXVqnHc8RKdzR+Q68OfVCMquCZ+WwJ9hR0m46DGfkWegEBySuOrTei0dAYH8cdfrgO4kbo4hbkiz+5ZEGCD+CwJNu7K3ZYfhuhRjuMPX1HgduCFnKB4C90Acj9BzhrBFSL/W1K/nC8qw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(261009223027099003)(18002099003)(22082099003)(11063799006)(10067099003)(56012099006)(261102123227099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmU2VU9iTEp4a1d4Vlk4akpCTWpyL3BqbXY1TmRxanlzN283aklQUGk5bmZh?=
 =?utf-8?B?Q1BpeGRQOEZFTjZGUHVnd1VRNjF1S2hTVkErK1VOa21Lb09sWGZNbFlncHFR?=
 =?utf-8?B?SnFmWTdwQjdLdEROZWg5YmhaU0FlSHlzamtBaG5kazVQVGJFK1VFZmlpdjBt?=
 =?utf-8?B?MStLODVvZDBObHo4MmlSSWoxYlNXcVM3dWFmZExscHFDazJqWEc1MFJKaXJs?=
 =?utf-8?B?eDNkZkd4Rkx2cWwrMXAvR0xQZEUvSDBjdVh1d3QycDJES3BUWWlVVlM0R05p?=
 =?utf-8?B?THRHTnZXU0hENk8wU3VMU1loSU1iZENoNDVFb3pvYUtPajRCYU1DdlZZUEwr?=
 =?utf-8?B?azl4MW0zK2RIdjZLdmFRVUFNYUhPWWtsVktWdlNMSVM4QVlOMTNVVkNZeDBm?=
 =?utf-8?B?K3drNythWklqVHpsYkpKd1FjT0J0dk9abHc1a2J1d0dqdFlzSGxWZTRNdXZw?=
 =?utf-8?B?cnNGRG1MWlA4MWZ0cVl6UUpWdVcyYlB5aWZhdWdaRld1TUs4MTE3dTRWZnFH?=
 =?utf-8?B?VW00aE1XMDVYNjQ3SmpsYURUZFUxZXV1eGxkRFV3VVJhZUd1Ukt1WTRXS08v?=
 =?utf-8?B?VGdhOFd2MWdzNHhnYUF0ejRGSEE4WGdWcUVSSEhqVkxhL3k3cTdsWnY4aGpT?=
 =?utf-8?B?S29KdmptZDJyM3ZQaDZaZHVFaWdJOXJXeStGOXhHUE5BWktNVW1WVU1lM3Q1?=
 =?utf-8?B?RlFkYkJUZGRMOWlUN2dveVNkVncxeWFjc0QxS1BBb0p4NzFIUEZ1KzkwUWlU?=
 =?utf-8?B?alpqOXAwcVlvbTFHb1lNQjlrQXU0cSsrSTlNTEhlaUd0cTcxbncxUzJPc3dZ?=
 =?utf-8?B?SFpjQjJLYVlxU2g4Tlk4R3VkQVZWWnEzOFY2SDM2UWx0M3BoR1NaWlIyMmR1?=
 =?utf-8?B?Tk9ocmpQSWdROHVxeWo4QUI4dHJMbjRMMVpNNzViZStHcEpsdmNTc3BFK0xO?=
 =?utf-8?B?K0dCSnRjTkZmUWtzcVdydGxoVHpqanNCY2RLNnZRVm5TalJLMzNCK3pPTzRJ?=
 =?utf-8?B?QmQrM3htTWtDNE5SenFZZFNvWUJwNHZ3WFY3RlkxZlBHQ0I1Z3JCelhYeUVI?=
 =?utf-8?B?YUY2Mllld2c5VUVRY3BqdHFINVhKeGgvd0dQRlVqa0ZOMThBVjcvaFYxTlFw?=
 =?utf-8?B?U2lhUkZLL01jeVppWC9VcTgyNlhzNE5vQ1g0RzdBVkFKRGphd2JTczlwNlZp?=
 =?utf-8?B?bjJCSmxBd3FVa05YVGJORGFsWU5hMStSMnBTUGNORjkwVDVlbjFlNUdkVFZQ?=
 =?utf-8?B?Syt5dmFvekNCcGdidnZZem9BTld5aE1sdkhKU1Joa3d6R1NRMUZKM3F5Vytm?=
 =?utf-8?B?WVBGcWZ2bDZrWGx4VlVjKzVxemh5TlJadGtKU1UvcW9zc0FJUHJtNjdqMytO?=
 =?utf-8?B?S211N2l4RmQ0WGR3dCs3K0JMRDlHQ2U3d3RZMVE0NE01Z096aFJLMGpsTms0?=
 =?utf-8?B?aTVrb0JqaHdPU24rdW9YV084Z3lrWERSZjhGbE9sdDF0R0VDazU3RGRkajFk?=
 =?utf-8?B?RGd4VUpxQi8vMUNoMFdWV3hxNzR1aFpEcGRPV3NiSEpwMGVJWmZBdUc1bHhJ?=
 =?utf-8?B?S2QweFd0eDA4Y05vVXdHVS9UL3ZwL2RJL0R6YXVydEdsOHpvdGE1SFVIU2g2?=
 =?utf-8?B?Mk1iWlJ4dGp5TnVYTnY4U2pEejZuclhqWUswUEpaZDVxMHloWENNZHBoVytK?=
 =?utf-8?B?YjRIQ3REWHF2T2xUS05jcjZCT2t0dGxxMEJyQWJUYzkrSzNoWWVvbnNiQi9j?=
 =?utf-8?B?Q1dFd0h6ZFA5OWlpNkZYakZiVjZmcUwyOGVnWkdoTXI4MmhJcmplNUtLaHor?=
 =?utf-8?B?ekhtS2JsZi8vMHNOQ3RrZHVGc0JRcURocGJHU3Y2ZEs0cGhwTHlPbmRHMUxE?=
 =?utf-8?B?Y3RjeVovS1JGaC9YbHQ0Y2NUeDVJREZ6T1owYXphWEpScTNiaHpWdGFyVXFi?=
 =?utf-8?B?NnI1Y1l4M24zbm54U0FTYU4rWEw3RFpXaGRuMlFBOEQwNjByNkRPSWNyTVls?=
 =?utf-8?B?K0NhallSZzdLak8yeHIxNWQvSHBUQVY4YjliT2ZXQ2RkTi8rVWNoVnpQcURG?=
 =?utf-8?B?Q0tEYk90YWFpOE1VdGF4Tk1uNUdRdEF4QnFUcmI2a1Vsa21QcHB3LzNralhQ?=
 =?utf-8?B?Skh1SVppc1NFeXJRcTNhVnpuenJSeXFpM1JUeU05cjNhSjl6Q25CYWo5dThw?=
 =?utf-8?B?T0JoVVZjZUhtc1dRWlZTeHhMeUxzN3JSQVhMZmFoWFlkbnFJZFAwS2RTU1ov?=
 =?utf-8?B?cGZENkhpMkpGWGQ4OEh2L2lLOXpQV1Q2ZTR4TUk2S1FFTU8zQkptMEtHT3Fa?=
 =?utf-8?B?Vk1HdmVwNlNDdWtTTnFnSWQ1S3B5R2VrT3p2ZExqRkRtYW9zWE9qUVVROVBC?=
 =?utf-8?Q?/i7Un9X+9T+v4rdRBIvoP3HM1Q8DttDBQqwwF?=
X-Exchange-RoutingPolicyChecked: efhj4xZ/7ddDaW9CKo6lkkTm2IiBR87AyiIrHhFYmdmWx2YX/HCKnhW3W12rZ+o2lYtzztl9wcDgo+2wHAyNPl4M3OHBVVSAsOGrqWfafTq4zRKCtBrjWFIAhewJY9woYs9so9qHziK6WTkLLnU4n7rdj0iPDhMR3ByIS+OgyW3KqDCesEnSQGscrPB00vx0WSIka3ujvavXwpwKbwjPYw/x95NpYOEk+08ihLgCAkDkqFsxy58wgKaXBIIwyLTYNetxc3F4QbtpMOy12g4qEJfTBmty5lZLpeyMe8tKQ9r8a6kKzkHZdXsg+qzFSdTfdb8DlBmD324Hm8DqtQwvuQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2381bdce-5e4d-485e-6320-08df4c418c44
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 04:47:32.3253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yF0sV/CV21BM+bBUbDR+jz1xZZsWaZG+jpZybs6Xh7xkqCQQDwuJ5E/d/CnAQpECyXn35TXB+bqNjdIJY5kYGsWAGRg8JiSX+KDy3YVU2YSlc4nk7Gv4TQ3/9bwkhIIh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7076
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Raag,

On 24-11-2026 11:02, Raag Jadav wrote:
> With error injection test, we're setting threshold for given component
> before injecting the error. Also validate that we're able to readback the
> threshold that we're setting.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   tests/intel/xe_err_injection.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> index 74ae9b243..dad65842f 100644
> --- a/tests/intel/xe_err_injection.c
> +++ b/tests/intel/xe_err_injection.c
> @@ -459,6 +459,12 @@ static void test_inject_core_compute_corr_error(struct xe_mmio *mmio, int fd,
>   			cleanup_on_error(&ctx, fw_handle);
>   			igt_assert_f(false, "Failed to set Core Compute correctable error threshold before injection\n");
>   		}
> +		ret = igt_drm_ras_nl_get_error_threshold(&ctx);
> +		if (ret < 0 || ctx.error_threshold != threshold) {
> +			cleanup_on_error(&ctx, fw_handle);
> +			igt_assert_f(false,
> +				     "Failed to validate Core Compute correctable error threshold before injection\n");
> +		}

Injection-based subtests may not work once FW/GFSP locks the error 
injection registers. To keep this functionality independent of that, add 
it as a separate subtest instead of extending the existing ones.

>   	}
>   
>   	if (check_event) {
> @@ -505,6 +511,10 @@ static void test_inject_core_compute_corr_error(struct xe_mmio *mmio, int fd,
>   		ret = igt_drm_ras_nl_set_error_threshold(&ctx);
>   		if (ret < 0)
>   			igt_warn("Failed to restore Core Compute Correctable threshold to original value\n");
> +
> +		ret = igt_drm_ras_nl_get_error_threshold(&ctx);
> +		if (ret < 0 || ctx.error_threshold != current_threshold)
> +			igt_warn("Failed to validate Core Compute Correctable threshold to original value\n");

Same as above.

Thanks,

Ravi Kishore K.

>   	}
>   
>   	ret = igt_drm_ras_nl_get_error_counter(&ctx);
