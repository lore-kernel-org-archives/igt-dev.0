Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0CDD1CDCB
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 09:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2846210E657;
	Tue, 22 Oct 2024 09:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nTFucQUP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EC810E64E
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 09:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729590630; x=1761126630;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KfUA7mEq2nWwVqLQBw7jEvU43qVubX7RNYeheCqB8HA=;
 b=nTFucQUPr99x2pDZvrFfbX8ohfwbgpYo9H5FektXo+qKxcskqxAwge7V
 0NSnbb2KXa/IE+/hZsHKgox2O3xXeIJdJgsSzolDyMRxdX0HjyPvkDmBu
 7vzljxlwoZphYEUopvmdY1NS0JCkUge4b5HAWffuDcAkAiNbmrWsB4K3E
 3GVjLXbnDOJ1WUFe3lQeEiNz7BgwHc429KYy5n6ESgI6cg5RmR48CX/YW
 SI+Y/mRSZggD8bhs+Ia+M4kdVJRYRnHCu4lNjaouEFm5HfVWiBMtnAbMP
 QQxXVki+WCfGy2MLqCX/9/lYQWp+9MMfK5hE5YgYBj9IJ80c/mASMFv33 g==;
X-CSE-ConnectionGUID: UozAq4HKQCmZgDs34p71ww==
X-CSE-MsgGUID: p+5qBW2EQUK0MlQS6NnE+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29005064"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="29005064"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 02:50:30 -0700
X-CSE-ConnectionGUID: /8cyNU+UTMSu1Zj7LL3yvw==
X-CSE-MsgGUID: TRnzzWp6Qm+F020CbJACEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="117243795"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Oct 2024 02:50:30 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 02:50:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 22 Oct 2024 02:50:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Oct 2024 02:50:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMuONIxCUyaFkGOdduhtOM57Kpw4CyX7ffD2LxKQwOOU4nyYCxwkRXyLRN8De88+zduj5Ws4tHKQDDoHIlmPgAuUevcSb7gJliTAPZsNmdUsZFCNL3fW+UDHjY4x/woiNz5nMu+0lAsPu+o+shOpKBMlKeLSTWwDrdtQmEa2LQoTuRQqhaGj2ZkKVVITu8Zo20mWeAtg8sxLpKA06RMMtHdjH4whZBb0l6uabyJXRisyvwwT1vpyWwxnRK7aMSsQ45g6RoPDMx3Ghzs1iO+9dVnfU4sFX0hMUI4uzdvhngw9ReH1QWFj2YQYrsfdgFr6yehIgnRc0KkNLPMU3BpKRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imFky7rPsyrFp0O7UaEvGZE4hZn6LdfUW7GbTaydTB0=;
 b=YWhm/Bkakpt3KrK//vRsQfBqSDbnPsYGljf3ANr/EOgDAsLolNdQ2vsHETh0CPNs9Zy5MjfV2zAggEHe39qS5++8r4TNq296b8MLAPaLLLikXi2/k2H0l6BEVpbVoeuyB6+Cv/u6b22vq7l7fW+wV51QLL3NWcznJIUIGmjHYI4gyCPVgGxoKP6U6doSUGr/tnKySdljNXSZMjKYQMaj0jz5+h1/ruemekjm7KwqUv8pjj7P3iQOUXuL7S8uvcSlWC1LVNQoEymPmbw5fBkIiu+y1zJ+qGNbPexJyEQMoG2Jlyb/034SjWpOHal+QCiKtwHnvgA1L4ULHqJXS0hDtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.28; Tue, 22 Oct 2024 09:50:22 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 09:50:22 +0000
Message-ID: <44bce885-d0bf-4186-b8a6-9ff2acc86dfc@intel.com>
Date: Tue, 22 Oct 2024 15:20:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v3,1/2] tests/intel/xe_pm_residency: Add GT coarse power
 gating validation
To: <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>
References: <20241021071902.2086909-1-sk.anirban@intel.com>
 <20241021071902.2086909-2-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20241021071902.2086909-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::30) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB6399:EE_
X-MS-Office365-Filtering-Correlation-Id: 887834f4-4f75-4202-ce70-08dcf27ef1ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1orZnRRc0lMdGNvbi9nLzJ1VkdNUHhYUG5ob0ZvQU01TnExQ211c3dmeFdw?=
 =?utf-8?B?SzhFVjZtVTlpTGFNNUlnZXVqcUl1b2JXd2gwVHY5cURhTy9LY0RNVm1ocGRP?=
 =?utf-8?B?V0JYcmU4LzhGMFJ6MW00eVo1M0F4ZmpsTkFCazFoMXJ5UDhMeUpTYnR1VXBw?=
 =?utf-8?B?Wks3YjlndVUyYXN1QTFDeU1uRU9FTHE5a2JUVTRaV3BrSVVpZmszT0liVWVO?=
 =?utf-8?B?QS8zejZJOTdwempzOWxLREZyd1FlTzBLcnNqa2JSUHU2MHFKcXA3OXhvY3dK?=
 =?utf-8?B?c2x2THRKUGNhNWhZSVVsNXdUVTR1dHhPK0J5WllJRGpSdzl4cnNibG42cjFB?=
 =?utf-8?B?SEE3bzRmdDBmL3BwRWxScVFkTWVISzFPeE0zT2hOeFk3clV5LzNkVUQ4WGdH?=
 =?utf-8?B?YmxFN0RVdWVqWmdWMm0vNzhIUDZBWXdMckhxL1dBY3FXNDRWSUx1dXRnOFo4?=
 =?utf-8?B?aDdUNXROclFWaW9ZTEFaT1VIZzJ4ZFIxT2lCTkR1a0IzYXZaR1k1bCtvQjFV?=
 =?utf-8?B?ck42bGYzWlRzekdHT3JqOGVCZ1hOcC9xVVBMWGl3MUczdkJmZ0xNZ0tFbUl3?=
 =?utf-8?B?K2tpUTlPQzhQT1V1UkdCRHhDOHZPZFM2TTNQY25nUVBnblovdzFzd2xLcXRM?=
 =?utf-8?B?Y0IydkU1eG9udEl0eThBNWt0eGxYb0VuMVJCMmpNUlpkejRwZ1JPSng4ck9r?=
 =?utf-8?B?SHlDeHpRRkpBMTlRZ3BQdWlHMVdsZllvZDg4dU54WXQ4OGR1QnJlQjJ4MVJK?=
 =?utf-8?B?K3FXNUpBemNJU3huMGo1MnZlNEpxNm1xdEJYN0pXMVhDY0F5emlvVi9RMFdX?=
 =?utf-8?B?ajExTmJuc0Vzb3ZVQzVxOGs4WXlSWWdabmNRbHRwWm9wRkZyblEvY1NTdVcw?=
 =?utf-8?B?STRzRWltZ0d1Q1RpMmkzZXZ6R0lHQUQ5TmJ4N2t0VzR5N3IyNlZlRmlKSFRU?=
 =?utf-8?B?TkUxRmlPQ252UnRmNmVJdldTRU1RWVUzTGpJcys3L2VIeks3Ry9tVmlmM1Nk?=
 =?utf-8?B?MVMxUUdGdEhsOUwwOWhOeVpWYmZkNldRMi9WdTRQelRmRC81QnE0T0dvbUwz?=
 =?utf-8?B?Y1pJdWtxNktyWEJrRklQQVFrOFNFVnRkOTNSZmJZd2lYcEVYdnNBK0lLSEFy?=
 =?utf-8?B?NzlpWlVtQlFzWks0NDkwZ3NGTWZoVGZGelQwcm8xYXd2UDJEL0lNNmo5RDIw?=
 =?utf-8?B?YjJzR2hCMVI5REJqLzdqbTVoRUI0emFRKzhBdjVUdXBzd2hJVUZrOEdXU2VR?=
 =?utf-8?B?dzU1L0w0alB0bW93bzdYajA2a0g0UzE0NHU0ZjhEWmNyb1daZTZwL3dtcCtZ?=
 =?utf-8?B?N0FaTEcwYTNqMU1kQlZaTjMyWkdlZ3BiVDhFMnZ2QnpVeHdiSTN3QVAzNng5?=
 =?utf-8?B?ZHkxdDhVeitTRzkvMzdldU5aNUtzU2pWS2s2ZkdhSmhxdE5NWVNOWU9UOGI4?=
 =?utf-8?B?d1owbDR6bkZVTXF5RmpUVnhLTGtRbTZlWTdGdlh1czhHTlFOOXpLS3h4ek5v?=
 =?utf-8?B?cXFGeHh1RnhveXUyNzNhNkxtVExPMlZVNDF3bCtPWnc0NmgyYjEwL2h6N3JD?=
 =?utf-8?B?T2c0TlZMTnVsb25kRS9hYy9ORTV0d25vSjQ0cVFkN2Y5RWIyeHllTGFodGd6?=
 =?utf-8?B?ZlNNUDFGNUNtVGgvdkg3SUJVQ3pUdU9TRUpVMHVRTWxhR3V5M0hnaW1SaW5B?=
 =?utf-8?B?WVlXS0xnOHY3R28xU2hSNXlPcFA4bVZtL1lrUjFweE5GMVdrRG1jQk0yemt4?=
 =?utf-8?Q?8FwmG7ogATxIUQfP8rP9UCuk4DbXNP0LpRXI0RQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUFWOHBBMUNCVERwNDBIUFlPQ0VTNm1NY2RTWjVVZEgrclliOW45R0I3a1Yz?=
 =?utf-8?B?YkxNYW51a21nek9wVzZxN2hxUUh6YTRvOCthRDJ3ZGxUK2VuOWtQL1Noclhr?=
 =?utf-8?B?L1gzYnNFc0x0R0Z5U2Nrak53RzN4TFQ3enpTWnd3eDNaTUxRd3pJaXhjVVlG?=
 =?utf-8?B?QzNsSFlQZTRmQktWU3JsQ29RaE8rK0ZCU29CbVBnWk5lUEhQc0Nicks2NW1u?=
 =?utf-8?B?aW0xcm51MXZMdGlJanlwMXhuTk51d1Z2d2VSMk5Lc2N3WTA5Z2xKUmxzeGtQ?=
 =?utf-8?B?dm1qL3NMZVlBbmw3cnUyL0IvMVJ5OHpWNlViTWZQc0ErTE9Sem44T2dUcmxm?=
 =?utf-8?B?SW5YUWVsSEwvN1ZING9Nc25nWDBqOGg5K1VtbmM3dis2R1BoTllLT2lnbUlv?=
 =?utf-8?B?YVdJUGFZV1JVd0Q1VFgrNlBINkdvNHgxdWRWTWI2NGJ4aTVndkpocUhiK2lZ?=
 =?utf-8?B?clVMRXZObEJzbnZ5aE5lbTJnUE01SmJjWjNwa1pJdDZUZm94a0hhZ2lnNHZB?=
 =?utf-8?B?bkJ5eVozbkF4Sk12SDlveStmOVdXVHJCRm14RnRLM25BdUxiQmRiRUQ3QmVK?=
 =?utf-8?B?TytCM3VZWi9IUXdQbFlFUUc1eUwwYWF4WXRvWGswVlVPaG1mSlZpWDh6SkR4?=
 =?utf-8?B?cGEwcTRqSnliRkRvb2xOSnd1U3RXNjAyR3dXMkhmNHpYc0FwamFFays3OERE?=
 =?utf-8?B?dFJuOTc3bzV2eDlxS3czR1U4RWJPR2pmVUpZWnIyc01FTHNHZXVPbXdHeHpC?=
 =?utf-8?B?dlA5TnVWNFRYakxlY1dNUjA2anppMHFGUXJwM2RtQVdzUklrc21iby9QV252?=
 =?utf-8?B?Y250aERhMjlmRHVDQ0FQUWgvVnEycUNIZHBjWitSSUdTR0g1Y3pEU2dhT3J3?=
 =?utf-8?B?QVZoM1dNSHI3WFd3bEh3NEc0ekcxaXhlenFrUjRQTS9RTCtqbUlMTkxCaUY0?=
 =?utf-8?B?UGZYd3FybmhuOWM3THFjRDJZQVdJb2Fia2V6NkRudThXcHlkZWt5cE5DMFUx?=
 =?utf-8?B?MEh5ZzlxUUtzVSt4MTl0MUhNSU5rai9hL0kzekN3eE16YVhJSU5rTzdTQUJZ?=
 =?utf-8?B?dno0YXllZk0yRkVoaUV6T05QcUdIUFJXL25Hais0OUY3ejBXdzEwdHFFRnln?=
 =?utf-8?B?ekRsQjlXZEJDeTRoKzFIRkpyZmNOLzJOa0pYUy9ucW94UzZhMFNjZW1KcGp3?=
 =?utf-8?B?cmpNbEU5MFg1TnA5ZlBhVml0UldhMzZUUFEvam82ZkptUHR6SjRGTjBWeDFC?=
 =?utf-8?B?VlRvVnlac1lXMy9ackxmTWxrR3FSejJYVUNJWmlSWFJhaks5V0tPU2l5L0Nq?=
 =?utf-8?B?S1FPcllSSFNENVNENTZyM1NhZGhXSDgzbzdBcFZsRUlzQldSa1lnUTRlWm1k?=
 =?utf-8?B?NGIreTNMcGJXbjUwK1J4V0dGQjN3MTZNeVpES08wTXcvYnYyaGduRUx6WnFv?=
 =?utf-8?B?Zm5BS1QxODFwejdqZ2tUKy84dTRQeTRYdDNGNStWZ0VueklHd0VZcnRwSjdm?=
 =?utf-8?B?Z29CK1FKMEpWV0RKeHlGZ1VlbU1KTm14Zy9iTnFmdE9tY20vK0dqMVovSlZq?=
 =?utf-8?B?Y01lMFg4anFJTTZPcUhOZEFCYWFEcTJDcmwydGVwSUZDb2lzMGdaTXlnSUVQ?=
 =?utf-8?B?RTMrb2ZhV2VITDdrMGdrREREd1J2b2x0eEFlK3Yzc25YT0t0eVd6MlNkK0Fw?=
 =?utf-8?B?V0JMOHBuMk9yMWwweW1uVlpZeEkzcGZaQXFwanpjdzBKTDQvRWNMUWNyL3Ra?=
 =?utf-8?B?SEI4UCtoam4yc293QlpKS09aRnpkelZHalg3ZjJiTmwzMFV5SXJIVjNUMGhh?=
 =?utf-8?B?R001cDY3MXc2UVBLNlUySkRFdEZtVE1Wa2QxbEFVSTVJVDFndFZjQjRsRGx2?=
 =?utf-8?B?b1dnamhGZHY4S1lhTVRiZTZLU3dOSFlYM1NRMnl1Qi9pNUlaVTRBTnlsR1FQ?=
 =?utf-8?B?b0ZuZ1d4NEdPbEJTbERJU2xjYUlabnhOYnQyYzcrTTN3K2JvYUZsWW1TblR4?=
 =?utf-8?B?cVVkTXZkYmQ1ZG9DK0RPYzUxZFlEMVZMSkNLZElQZTFuWlUvVjVkU0l3YUlX?=
 =?utf-8?B?bFoyVEJSMy9NcHFKRDQvb2dBamFXYVJldEFRR0V3Y2NCUDIzakEyekFqUHha?=
 =?utf-8?Q?ghxvUeUmxoSB7+nylnvzFGx88?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 887834f4-4f75-4202-ce70-08dcf27ef1ed
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 09:50:21.9829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WAfDprKjEeDVMt6joJumjT6DVrePeNiBUQWC9HPtMFQGpWyhvKOX5J1W1+Hd8yIj6K06lOA12cmYI0ZNKJpJEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6399
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

Hi Anirban

On 10/21/2024 12:49 PM, sk.anirban@intel.com wrote:
> From: Sk Anirban <sk.anirban@intel.com>
> 
> Implement test cpg-basic to validate coarse power gating status
> after S3 cycle.
> Add test cpg-gt-toggle to check if GT coarse power gating is up when
> forcewake is acquired and down when released.
> 
> v2: Address cosmetic review comments (Riana)
>      Fix suspend state (Riana)
>      Add exit handler for test cpg-gt-toggle (Riana)
> 
> v3: Address cosmetic review comments (Riana)
>      Fix commit message & test name (Konieczny)
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_pm_residency.c | 92 +++++++++++++++++++++++++++++++++++
>   1 file changed, 92 insertions(+)
> 
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index 772fe9b57..29316514a 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -63,6 +63,12 @@ enum test_type {
>    * SUBTEST: toggle-gt-c6
>    * Description: toggles GT C states by acquiring/releasing forcewake,
>    *		also validates power consumed by GPU in GT C6 is lesser than that of GT C0.
> + *
> + * SUBTEST: cpg-basic
> + * Description: Validate GT coarse power gating status with S3 cycle.
> + *
> + * SUBTEST: cpg-gt-toggle
> + * Description: Toggle GT coarse power gating states by acquiring/releasing forcewake.
>    */
>   IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>   
> @@ -317,6 +323,81 @@ static void toggle_gt_c6(int fd, int n)
>   			     "Power consumed in GT C6 should be lower than GT C0\n");
>   }
>   
> +
> +static void cpg_enabled(int fd, int gt)
> +{
> +	int dir;
> +	char str[512], path[64], *render_substr, *media_substr;
> +	const char *render_power_gating = "Render Power Gating Enabled: ";
> +	const char *media_power_gating = "Media Power Gating Enabled: ";
> +
> +	dir = igt_debugfs_gt_dir(fd, gt);
> +	igt_assert(dir >= 0);
> +
> +	snprintf(path, sizeof(path), "gt%d/powergate_info", gt);
> +	igt_debugfs_read(fd, path, str);
> +	close(dir);
> +
> +	render_substr = strstr(str, render_power_gating);
> +	if (render_substr)
> +		igt_assert_f(strncmp(render_substr + strlen(render_power_gating), "yes", 3) == 0,
> +			     "Render Power Gating should be enabled");
> +
> +	media_substr = strstr(str, media_power_gating);
> +	if (media_substr)
> +		igt_assert_f(strncmp(media_substr + strlen(media_power_gating), "yes", 3) == 0,
> +			     "Media Power Gating should be enabled");
> +}
> +
> +
> +static void powergate_status(int fd, int gt, const char *expected_status)
> +{
> +	int dir;
> +	char str[512], path[64], *status_substr;
use PATH_MAX here
> +	const char *power_gate_status = "Power Gate Status: ";
> +
> +	dir = igt_debugfs_gt_dir(fd, gt);
> +	igt_assert(dir >= 0);
> +
> +	snprintf(path, sizeof(path), "gt%d/powergate_info", gt);
> +	igt_debugfs_read(fd, path, str);
> +	close(dir);
> +
> +	status_substr = strstr(str, power_gate_status);
> +	while (status_substr) {
> +		igt_assert_f((strncmp(status_substr + strlen(power_gate_status), expected_status,
> +				      strlen(expected_status)) == 0),
> +			      "Power Gate Status Should be %s\n %s\n", expected_status, str);
> +	status_substr = strstr(status_substr + strlen(power_gate_status), power_gate_status);
Indentation
> +	}
> +}
> +
> +static void cpg_basic(int fd, int gt)
> +{
> +	cpg_enabled(fd, gt);
> +	igt_system_suspend_autoresume(SUSPEND_STATE_S3, SUSPEND_TEST_NONE);
> +	cpg_enabled(fd, gt);
> +}
> +
> +static void cpg_gt_toggle(int fd)
> +{
> +	int gt;
> +
> +	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> +	igt_assert_lte(0, fw_handle);
> +
> +	xe_for_each_gt(fd, gt)
> +		cpg_enabled(fd, gt);
> +
> +	xe_for_each_gt(fd, gt)
> +		powergate_status(fd, gt, "up");
add under the previous xe_for_each_gt

Thanks
Riana
> +
> +	close(fw_handle);
> +	sleep(1);
> +	xe_for_each_gt(fd, gt)
> +		powergate_status(fd, gt, "down");
> +}
> +
>   igt_main
>   {
>   	uint32_t d3cold_allowed;
> @@ -380,6 +461,17 @@ igt_main
>   		toggle_gt_c6(fd, NUM_REPS);
>   	}
>   
> +	igt_describe("Validate Coarse power gating status with S3 cycle");
> +	igt_subtest("cpg-basic")
> +		xe_for_each_gt(fd, gt)
> +			cpg_basic(fd, gt);
> +
> +	igt_describe("Toggle GT coarse power gating states by managing forcewake");
> +	igt_subtest("cpg-gt-toggle") {
> +		igt_install_exit_handler(close_fw_handle);
> +		cpg_gt_toggle(fd);
> +	}
> +
>   	igt_fixture {
>   		close(fd);
>   	}
