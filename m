Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2192D7879B
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 17:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6112E10E9F4;
	Thu, 21 Nov 2024 17:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NWfNLmnK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8071C10E9F4
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 17:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732209562; x=1763745562;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=X//Ife25btXLFFkuQem3g+QLIx2YKGjSyIJFB/Apf98=;
 b=NWfNLmnK0jbvV1ojg/gPiCVV9E4QgRn5U8iXX+jm6N2iWMRy8m8grlij
 9vV01a/nKbe8CewU1jlXrjtrQOjwwN4VPcHUq0b1xHWTg/YfbXjf+T6/d
 Cz+xDPpChfqjWdVJZlfInlgnsrMB3p97YKw8d3hrBV2KGP2dvTEIlc633
 DLflRAh/YVFJRO05ObNdM52BFMbGLB8F6ojQ4ZRV+rVienm+ZVi26zrX0
 y09osKJyk+TeHs4j1409mLLE+FiiSnmNkBPgYj1SVuH6LqvYf7vqNNZCR
 8uk8O3ADt0pD6Yrm8ovD7/1rjsLU957jPDovaSsxz1jVsuv53G1msIT+z g==;
X-CSE-ConnectionGUID: V1cMH7JjRx6FD+pi6Nk7Zw==
X-CSE-MsgGUID: l4KYtV7BRcm7igXwfMBOEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="31696389"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="31696389"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 09:19:21 -0800
X-CSE-ConnectionGUID: y/H2civDSk21qkc53BRb5g==
X-CSE-MsgGUID: 7JOUerkBTh6MoFNhItgkWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="91122463"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 09:19:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 09:19:20 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 09:19:20 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 09:19:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4bp8A0rRMw0O+BFqT1QfzGgJ4xRmsiDe18k/2FlPUiqxJQx64AYhDALhX8IJ0TeTX30Zc92qnDxB2Y3kcErKfkQYwwnj1w3NVUVSQ0c/W+a7viwBLfHzZdUfV6zWSMtZFFNnA8hT9XMKG9934dNOStLNmiXiBV2YNdLvdQKMzwhto9+VrnXE7Kxle4uvGP2ooFG1fZl2ApnsYPWTvRzfvwJlkSFBO3Vkfdg1F8JLhOypz3OTfARPOk8zfKS5HmSe2NNP1+IRoJVRMr0bOY9/YogWDfiJ06qUZAnVvt9w0AbiGOWBhfLCngyi1W04E7dNw9gI6+vygNP7ONI2N3/xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0m+70N3XDniepSZGv+Gb9xhBSaqmcKJSajXTqwKUXsA=;
 b=GdnGNQc3KzOshlOQPhG7EqOTamXyDuGxjcZhm1ODP3+3ldOGbVgjOhbebhYI98duvjvJLjY3QMqYKoZmtuF2MzwY1XQW/c0g0fSPe50ITLxM2zwcqRaG8AwrjjKxCVP1BngwL2Inhi6xB7Vy7NH0imv2E1AgqC+5Ff3S/yYV4GR/VaRk4wveWNm1UMZOrrsRFsNf7GA3K5YyexyBuDc5STZ++OnmZ4u4w1J57QEjE8sVn5Fp2te6z3ggc+Ij/lxhRzmUzi4ecqEPmFgu+9pBHhmEQaqjFyQ0x3VJecA23L79hbtcGbq082tvwJydfeV2/KqYH+Qx70/v/9poOw3NOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA0PR11MB8417.namprd11.prod.outlook.com (2603:10b6:208:48d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Thu, 21 Nov
 2024 17:19:17 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%7]) with mapi id 15.20.8182.014; Thu, 21 Nov 2024
 17:19:17 +0000
Message-ID: <6558cead-69b1-4b0b-8897-8db95bc6c5e5@intel.com>
Date: Thu, 21 Nov 2024 22:49:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kms: Add 6k resolution support for a
 single CRTC
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241121104554.65366-1-jeevan.b@intel.com>
 <20241121104554.65366-2-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241121104554.65366-2-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::18) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA0PR11MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: 8be46b76-c673-4cd3-5931-08dd0a50a0e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkljWnJGNkJQUXlLRDlVVWYySkY5S1FkR09YWDV6OVlYejVuSG9WVlF3bmQr?=
 =?utf-8?B?SktHNEJRNE5iVkNlVHZRMGRKNU1xSkxSME0rck1pa3VVUU9DcjJmWnBFRHk0?=
 =?utf-8?B?ZTl1b0xBV2tnMmdyY1FPZnpvam1Gd3BmeVBXOE54L3FVTkMraFVlb211NlYz?=
 =?utf-8?B?MkZDVm1BeCtYWTJMdTJGcmxHN2FMSWxsWUhVaDc0eVFHNnZsb1QyTFdJd1Jz?=
 =?utf-8?B?c05xTmpFVlNUUWhhYUcvTFBSSlJUZGJubkRrb2NzRFVaRWdCOUNEQm1WT3Br?=
 =?utf-8?B?YjlKTkZ0L0ZEeTRRQVh4OGZLdTJiOFZZbjVJMDhtUW1maVNtMngrQkg0TDJW?=
 =?utf-8?B?NXJvcXg3dFZOVFJlL0hocHhLczNaQnhVcTlldTQrdFVGVy9DMC9xUDN0a3Ry?=
 =?utf-8?B?bWtsUWR3aXgrT1MzbHcwM3lkenhYZk92WGZxam9SVnFRM0JyYktObjlhUzkz?=
 =?utf-8?B?NDVTOUp2UmpFNnNPVDdCZ2VJUzhFWUNHR1BUZmlkOG9ZeHZiNi84dHB6YTRY?=
 =?utf-8?B?OFdpbytmd3g1RFlDL2ZHWGJ2eloxYm1OeGdzbytiYnRQYlB3NHdsREdIWUpL?=
 =?utf-8?B?WEN1ODBMbDFWOTdxL01qMEVCRGY3MWZpS2JCMVNEYkd5V3ZWTEpNWThFZ3o0?=
 =?utf-8?B?WGpYakVucm1SYXJ5WXFsc2RTYjJoaGlESnpmendIekZlKzJsUlRCMWlVMjN4?=
 =?utf-8?B?RXYzaGxIRUROeFhLTUdxRzNxbEpZWjV2TE5mbUJud0tKdFhVeTdMb3hYaXlQ?=
 =?utf-8?B?V1c3RWFQN3Q2TmRISXA3M1ZleDlkRVMvTG9XV0UyanlXcWErTTU0VzRaZSsr?=
 =?utf-8?B?Q3Z5UnBlVENEL2trWnVHYWZJQ2JxMC9HNlpnbkFoalVnVjAzL3RmaytseGVo?=
 =?utf-8?B?YThKbnM5bkdreXVSVXpJTC9TN282ZUNjbnZRcUQrSElmbzdicnV1NUxyWGZr?=
 =?utf-8?B?dldZU2tScTYwRURxZkxuMDI1eXhGMWRUbFF6RDhWYUhReVB1ck9VUHlTZk1w?=
 =?utf-8?B?MzcvYVo4RDV4eFhrbFFOanVpcTFlSUVFeFRiNW4xaEMzSldVVU9rcXlGa2lh?=
 =?utf-8?B?V29yeTdjWE1pVHpwVlF5NDArcU9pWEptSy9BcG5OcEdISTU2a2VXOXVQakZR?=
 =?utf-8?B?TTF6ZDA0QzZTYWdMV0dxaTJnTzZPRlkwVXVLa0hoVzF3ZVRwVzl1ekpRbFBX?=
 =?utf-8?B?RGN5R1hsRjRyeXU2Q1VBRnhBeGU5NmJaMTN3YXl2NHlxOGFzUlFZZGFvVEM3?=
 =?utf-8?B?b3RmODhybTdWdWZXV2NZdGVFdUxEVWdxeWNER2srQzA4WHczc2F4OWpZVFNk?=
 =?utf-8?B?REJqSXQyU25yRytWUFY4OU4vT3RiOVo5RnorL3BteWtqeGRoajhQdFB1c0FB?=
 =?utf-8?B?aVRuMUtTWTF3QWFUbjdWem5kTG4wK2ZjRit0aEIyRXBPZ0E2em45QUdHTFp3?=
 =?utf-8?B?TnhXVEpuOFZSUFlvZDRzQTJQQ05Zdm1HWE5mSnhvZnVWNXRibmE4dVI1MHho?=
 =?utf-8?B?ZjRMeWFGdFVkUXBUSzZOQnk3VXAzbVM2NnhleHJ5dzM0cHZINjZLUGkrek45?=
 =?utf-8?B?SkIvLzN2T3JFNW1nOTFZOFJJWnAvcmJMZzZ0TUpOVWtPM0RTRVpCNFdWb2Zp?=
 =?utf-8?B?eDlmei9xRThqVDZaRzZJcnVBVDZOSWdKaEk0d2NCSTRsY0M2OWVjaGxTVlNu?=
 =?utf-8?B?WkNQVzY4a0txSkxpZXdUQWxoWi9yT1lBVjQ2Y2FnQTRocElJckRBSGovc0wx?=
 =?utf-8?Q?thhO8yTH9c1BrLW8ccpQZLUpzb8kj2GduGH24hR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWk3Q3YyQjRUaHZreXlMdktUYWxlTVFzdXFsYnN0VDg5YnVDQkhqMmNTQkV6?=
 =?utf-8?B?bVNmeE5jM1E2YlR4STRRclJoOEF2L1dRUzNQWVhJeWd4V0ZQWVFLaGgvdE1W?=
 =?utf-8?B?eFdOMlF1N25jY1JEYnYzWFFaQnpJN2xPcXhVc1ZJT0podFppem52eVlwQ2pt?=
 =?utf-8?B?Q21aYzEzdER0S3hQN0lBZll3WXE3LytJeWhrVVQwWitOYi9heFVwWC9VNnY5?=
 =?utf-8?B?VnZIZ0R6NDlpU1hXTmhKWDdQSlQxK2phTk1mNkJNWi96SmdvMjF4aXJETCtF?=
 =?utf-8?B?dVVUeC9zdzhCbSttMnRZdUNMaUhyK29qVWwvUVl3T0YwTWViaGdDQTZZSFph?=
 =?utf-8?B?WXcvbkNJM25ubG1wSWFSOVQrS0lIdk5XSzllRGttcnBEMVdudU1ySTFBSFJZ?=
 =?utf-8?B?aVprQ1hQbStaUFVkejM5RzZhN0VkUW5mbjB5YS9oOUM1cngyWll4bnlzVHZw?=
 =?utf-8?B?dGc2c243eHAveGNUQTFuMUVEdXpvQUxKd2hxZWx3SHdJdXd6NXFhVGNZVmxa?=
 =?utf-8?B?a1dpalhVY2NIbllNdmU2cm9rUU1KTzlkUjVNTkFTTmhYcDZXZUlUejhUTjU0?=
 =?utf-8?B?MytmNnRaR0dJVEd2MFBHV3BJam80N3pEaDFIT0U0LzdzZWFrTkZ4bzhiY1Uz?=
 =?utf-8?B?SXJBdFZ1dGNUcEU4M2xlUkZLVG9KVzlENTh1eXRhdnNPUEtuSENmR0dhMUhN?=
 =?utf-8?B?OFJGQzFkZk4xaFBVb3pVWFhYMDFBZFBvUzczRE9pT0hzVmtZMHA1Zk4yMlQy?=
 =?utf-8?B?Ny9GZmJrNmp3SlZoeE1KeEpwb0RaVEdwdXlENHR5MHkyc3plelk3amNHNXJ5?=
 =?utf-8?B?K2NkL011MnRNcW5kM3ZScEVXaVV1RDU5MzQ4aFl5alZpU2sxeGhrbDdmcklL?=
 =?utf-8?B?bTJYMEFEOEQ2czRlT1U1cU1ZS1pFcXF3UlBWVUY4RXVWN1RCZDJyY3ZFcEp2?=
 =?utf-8?B?QWp2TUgzcWUzZmdiZ1ZkckJZVHd4WGZOUkJUazlaQmprMThuTXpxdUQxREdV?=
 =?utf-8?B?SmROTHU0UW5IM3VjeWh4Tk9hQlkrL1dHK3N5TlZWZnRsUFZFd2c0dm9KdC9W?=
 =?utf-8?B?dnBCLzcweHhUdGFFN0lqVnFiYVVGd1NnaElxZ2ZBQTFNOVpVOWFkS29MQndX?=
 =?utf-8?B?ZTdvamhRSnoza01vL0hyOFB5eXJLeEF2Rm56VnhDaHZhalJVNEhxdENHVVFC?=
 =?utf-8?B?YStNNGdMbGF3ejMyOG5Idkt6dklFeVU5MmhXZEJJUVRwdGJrZTVEeE5odkhC?=
 =?utf-8?B?RXppaU5hRCsyMGVVQjd2bVpDRFlmWWxXUkFZS2Z0aExVU3hlOExqWUlqenJZ?=
 =?utf-8?B?dWRHQjk1ODJFU0dKZk43TW1QK2kyNVU0MlZsZU5pWHJYcWxOcW5DRFR3Mzcw?=
 =?utf-8?B?Wjl2NHRFOGwzWVpuYVBCa0J0NU9vb2dwVGRzYkdDRTREaVN5eE15Mk9IbENR?=
 =?utf-8?B?V1ZDRzJFV2lTbjNwNXc1cWxEU0lNRGxwRU51ZVA4bkVpRFlwL0dWWkovMFJN?=
 =?utf-8?B?cmNncjlIUzRFejJ2RTByVEdUTEpTODIzU1pvb3FScHdTTGtHbE5td0YzYzZD?=
 =?utf-8?B?czZPRlpvdXFWODljeTZpRFFKOUVUOHp3UTFXUzF1OGFlRFB0bkkyRFZvQ1dO?=
 =?utf-8?B?MFVRcUw1YkVlbzRWTTF2VFBrZjBNS3JHYjRNellsdUdSdTdpMTdxNGdwUjFP?=
 =?utf-8?B?eC8rS0JVcmRpR0tVZkVyZHQ5cGZveXlSOWxJZWJtQlJwMEsrMklvOU4yUGUv?=
 =?utf-8?B?bnhGRDF5TFFyb3JsdE9nNTF3VmpoQXd2V1NsbXpqZTlUeDhkbXI0WGFqRmo2?=
 =?utf-8?B?NUtwREFRY0tmb21naWZMWDBnM0EyeUJVZi9FUmViWTBDclkySW56akJCdlE0?=
 =?utf-8?B?Y29GVENKVkpUWUZoSlhWMHBJTEhreXpaVTBkSDB0R3BPajNFWnFuRk43QXVm?=
 =?utf-8?B?MmVZUEZrNExIbHBvZi9FR0g3U2tjNUtydllESW13WEdTOUN2TXV1TTFqVnc2?=
 =?utf-8?B?bW45K1crMGREZG1ZR1pTOXlDVmM1dCtkRThHVXZCbGlCTVh6U0dHSmpqN25S?=
 =?utf-8?B?aFB1RVR3aU9RRTE0Q0hxWTVCbGd3R0xaTGJ2SnZlY21hdDJhSmNFNXRBMFRC?=
 =?utf-8?B?UWZHTzZUM1NSQmJVMlQwSldTL1pKK1NFeHdQdjhnem9YZWNyOG1QSGtXNjd4?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be46b76-c673-4cd3-5931-08dd0a50a0e1
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 17:19:17.3166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mvKm5G+2Fo8FKeIenrFK0/HqQS51fXYEUQadobjzqq6gaZrIskq02tBKvT8M1bXS79gW8kXEDEnnkaBOCjwBGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8417
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

On 21-11-2024 04:15 pm, Jeevan B wrote:
> increase big_joiner limitation to 6k from 5k for display version
> greater than 30.
>
> Bspec: 68858
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   lib/igt_kms.c | 22 ++++++++++++++--------
>   lib/igt_kms.h |  5 +++--
>   2 files changed, 17 insertions(+), 10 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 76f32e1e0..fe5cea33d 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6355,6 +6355,7 @@ int igt_get_max_dotclock(int fd)
>   
>   /**
>    * igt_bigjoiner_possible:
> + * @fd: drm file descriptor
>    * @mode: libdrm mode
>    * @max_dotclock: Max pixel clock frequency
>    *
> @@ -6363,10 +6364,13 @@ int igt_get_max_dotclock(int fd)
>    *
>    * Returns: True if mode requires Bigjoiner, else False.
>    */
> -bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock)
> +bool igt_bigjoiner_possible(int fd, drmModeModeInfo *mode, int max_dotclock)
>   {
> -	return (mode->hdisplay > MAX_HDISPLAY_PER_PIPE ||
> -		mode->clock > max_dotclock);
> +	int max_hdisplay, dev_id;
> +	dev_id = intel_get_drm_devid(fd);
> +	max_hdisplay = (intel_display_ver(dev_id) >= 30) ? HDISPLAY_6K_PER_PIPE :
> +							   HDISPLAY_5K_PER_PIPE;
> +	return (mode->hdisplay > max_hdisplay || mode->clock > max_dotclock);
>   }
>   
>   /**
> @@ -6387,10 +6391,10 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   	bool found = false;
>   
>   	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
> -	found = igt_bigjoiner_possible(&connector->modes[0], max_dotclock);
> +	found = igt_bigjoiner_possible(drm_fd, &connector->modes[0], max_dotclock);
>   	if (!found) {
>   		igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
> -		found = igt_bigjoiner_possible(&connector->modes[0], max_dotclock);
> +		found = igt_bigjoiner_possible(drm_fd, &connector->modes[0], max_dotclock);
>   	}
>   	if (found)
>   		*mode = connector->modes[0];
> @@ -6409,7 +6413,7 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>    */
>   bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock)
>   {
> -	return (mode->hdisplay > 2 * MAX_HDISPLAY_PER_PIPE ||
> +	return (mode->hdisplay > 2 * HDISPLAY_5K_PER_PIPE ||
>   		mode->clock > 2 * max_dotclock);
>   }
>   
> @@ -6574,7 +6578,8 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>   	 *  - current & previous crtcs are consecutive
>   	 */
>   	for (i = 0; i < pipes_in_use; i++) {
> -		if (pipes[i].force_joiner || igt_bigjoiner_possible(pipes[i].mode, max_dotclock)) {
> +		if (pipes[i].force_joiner || igt_bigjoiner_possible(display->drm_fd, pipes[i].mode,
> +		    max_dotclock)) {
>   			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz), force joiner: %s\n",
>   				 kmstest_pipe_name(pipes[i].idx),
>   				 igt_output_name(pipes[i].output),
> @@ -6601,7 +6606,8 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>   			}
>   		}
>   
> -		if ((i > 0) && (pipes[i - 1].force_joiner || igt_bigjoiner_possible(pipes[i - 1].mode, max_dotclock))) {
> +		if ((i > 0) && (pipes[i - 1].force_joiner || igt_bigjoiner_possible(display->drm_fd,
> +		    pipes[i - 1].mode, max_dotclock))) {
>   			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz), force joiner: %s\n",
>   				 kmstest_pipe_name(pipes[i - 1].idx),
>   				 igt_output_name(pipes[i - 1].output),
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 301f370df..547b45ae8 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -146,7 +146,8 @@ const char *kmstest_scaling_filter_str(int filter);
>   const char *kmstest_dsc_output_format_str(int output_format);
>   
>   void kmstest_dump_mode(drmModeModeInfo *mode);
> -#define MAX_HDISPLAY_PER_PIPE 5120
> +#define HDISPLAY_6K_PER_PIPE 6144
> +#define HDISPLAY_5K_PER_PIPE 5120
>   
>   int kmstest_get_pipe_from_crtc_id(int fd, int crtc_id);
>   void kmstest_set_vt_graphics_mode(void);
> @@ -1241,7 +1242,7 @@ void igt_sort_connector_modes(drmModeConnector *connector,
>   bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
>   		igt_output_t *output, int bpc);
>   int igt_get_max_dotclock(int fd);
> -bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
> +bool igt_bigjoiner_possible(int fd, drmModeModeInfo *mode, int max_dotclock);
>   bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   			  int max_dotclock, drmModeModeInfo *mode);
>   bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock);
