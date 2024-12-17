Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7E9E7716A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 10:33:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD2510E2F5;
	Tue, 17 Dec 2024 10:33:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ncAbNWfZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62ED10E2F5
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 10:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734431610; x=1765967610;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=L4zh0IxazfLBYLfIEq9P8YvX1TtJ6j/9rCSntolRhic=;
 b=ncAbNWfZTZJ9nLGSIogzsEHPu4yD/Tz2fknT/8Iz3F4ovgOj+28I/Y9a
 hvJSygL6XkFHR+dBJbOVSf8PQu+cg+ZQEr+80DkFF6cno7YlDlR1Ss+qk
 5po2HWVHleQjbkISWJSj6TJOXABkmhaAodAZUeKVyTDv6seDBqVmk5qEP
 kAlgwuLCrKY5dFFw1JWzIxWsOy/MfIfJCNxvfwlD95TThIx2ssIopPrfv
 ABjINctZlNrz+7ch+08u3qzV0uFGQRI+0iiAfZ2ie+uK9AzJXFhqeDL7F
 /r/v+kG3oZnlphwdL6oDfSoqJIrt9/ubJXhvU7c+SIBNxrQfzTeA60eHn Q==;
X-CSE-ConnectionGUID: ZRkWRyLKR3i2/QLtkuf6nQ==
X-CSE-MsgGUID: Zcgn3by1Q2ySKp5ffO2P5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="38625861"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="38625861"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 02:33:30 -0800
X-CSE-ConnectionGUID: JCHLLQ6xTdytjcgLx9PGCw==
X-CSE-MsgGUID: FN2jQ/MfRGqBkxQUQ4LajQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="97529593"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 02:33:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 02:33:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 02:33:29 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 02:33:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7j6XaoRSGAoL4mlSaKLYX9jnRhGd63Iyg7QL1HqDeWYCz3KwZymaVYn37D3TyqWUhuhjCT2mA/G9+3edtrWcwNNi8jPJO6MB7SWF46P0OlD0HR1//P384QDTcB7vzVHIoEFBslHM1wamA6A3lCgty5NetCoZIjioKTrZIFMRf01nYoII64Cy78TXdFKvfbPb9sRxTpubd4EviOk3tDtEmB3SeEvhwzY6jVP7AVx++Fb2HB/GpwNz2RFkH/BRyijceKZR/e3UL/nbvgvK9fE8lN5tDVip+UgAo3EIWG2YDFEai1lB7SFYIuARObWwY1JIp6M3wiWAkWVHfq+CG+3lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5tCGTMR1y8opSOsryLKpkm4jA55ZbbRoSd5gS4Dp6U=;
 b=S91u+fixnOWqAW4F6S8mCdUVta77RaVFoWWo6AwyGC+X0CxXOhoWId8rvvLaGaaeS++KCDxQBtcGSVMPRpC9edN3Uv48ZCgOTYtv2809doE1dsGE8KbqUew+JeGzo+GpBXWsvLQfe5gZ7lVe7yXjAHG2zYeqct53QjYY8m7ltWXAOhMkCxQ9No+s4KuRSU0Es1F7MEbCUlLS/LbTs2SGXiscqsTG9nxJIUh8pR5+VMElHJjA9kGyn7P4RsDWyFxjZbSn1Ge0+Nb0iCH8OHADKRDTwrbrbciqgGyY7EirhR/c1yxJu2zCT+XcKVJtZJxkWmGke9oTz6p9MVtgo97law==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by IA1PR11MB8224.namprd11.prod.outlook.com (2603:10b6:208:44f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 10:32:58 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 10:32:58 +0000
Message-ID: <9a90fe38-8a7a-4102-9830-7867029cc7ee@intel.com>
Date: Tue, 17 Dec 2024 16:02:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v2 9/9]
 tests/chamelium/kms_chamelium_sharpness_filter: Add basic test
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241209114623.1843033-1-swati2.sharma@intel.com>
 <20241209114623.1843033-10-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241209114623.1843033-10-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0249.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::9) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|IA1PR11MB8224:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a4873a9-108d-4f90-45f4-08dd1e862cc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akVqNEswV00yZlFlZnZmRWI2RWQ0Y2V6aVdwWW1FRXRaT2d0dnVyS3pCYmc0?=
 =?utf-8?B?dU9QNHQ4MmtSRDdkb3hYSy8yL0RSSU1JVSswbnFZR0xrS29MVzgrdnJxWExr?=
 =?utf-8?B?S1VNK1JUZk55d2Z1dmx4bHkzTWliVk1KeUtEOWFJN2JzeWdCV0xTYnBpS0hu?=
 =?utf-8?B?QVp2Zm1JdVR1THlrZXhuWUh3RGNMNkZtUjZhaUI0K09KRXRpY1lJY3lKRWFa?=
 =?utf-8?B?SmxFWCtmZ3hEWnd3R3E2ZTNVYVRIUDF5enFmM1RURUpFbEZqUW1uK3hwYVE4?=
 =?utf-8?B?NklzZmFhYTZ0UklmbFM4ZllJRUdMcVhXZ2lRUTZMWFhpclU3OTB6UUtmUUc3?=
 =?utf-8?B?UzlaN1pOVGhFWmo5Um5sakVPSEsyd01ScWJLUHF6cFN3clZiWGRDYTJFZm9j?=
 =?utf-8?B?YXpndjFkWStQa0tHSmxqNzQ3c2NpUklVZVVpdEpFakhVUjk1TWxVQUVSSDdS?=
 =?utf-8?B?b1RKR3hSenlXTHRpTXhLSzY2SmxnYkV2eXg4NThQd2xaOElnSGlLbkx6UzlZ?=
 =?utf-8?B?OHZFa1lFaFhIWnRaU2MxaFErUDNNa2pwbXVuaWRUa3AveDdjZ3ZUVGtCb3VS?=
 =?utf-8?B?akJaN1lYV1pFS2I1VmtsMlZNNnJBSVU2TUZCZGNLMHd3MkMwU0JjZjZucnZC?=
 =?utf-8?B?aHRDcHNGNUx0aXJOYzdkbzJ5UHNGOVRPbUVkY2VwcHlISEFHY2VLNXlsMyto?=
 =?utf-8?B?ZEVTVkFFNVByamNNOVRLek1nRWFhZjRieWNpa1pWalNTWVM2eWZpODhTVlZh?=
 =?utf-8?B?NkQ1bW1LOEJ6bnhmVXIrMWlldHdKYnc5cmZIb09MaXFqcGxnMVBLR0Mva3V6?=
 =?utf-8?B?N1MySkFuYVppRW56dWNvaWFWdy9tU3RqTjd0bWxXMkFHRlA2ckczMG5aN1c0?=
 =?utf-8?B?dlhBMmJmU252dnN2ZWpVbktUb1pxMnFxdy9RM2dQMEdLcWtGa3BKV2tMWmFU?=
 =?utf-8?B?QVpGQmJmaUFrRXlIZDRHTWt3QVR4VnN6N1ovcW5CMUxGbkNENWUzM1NFME56?=
 =?utf-8?B?TDVFY1lGZm5oRGc5VGtOYnlHdUk5UE1iQlJvZDNmbGZQU3dkUi9vUjgzVG5V?=
 =?utf-8?B?U1BkV3lpUzJBQmtwVFVTYjg1OWVEcVd2UnlBVFcwVGtSV1hlaStYdUswZWxE?=
 =?utf-8?B?MFZVaWQwOFZ1bmdnQzBkVnZXVDZYRGFKc0VzMDdXRVJYeENSalA0a1dzT0Fx?=
 =?utf-8?B?ZnJyQURZMWFOYy9TZndwM0crZDdFYTJscVBJeVhXYk1wVjR0UkZQQnJDc1Vv?=
 =?utf-8?B?enRXQjJ6L2FkQjlRY083L3VHVXFIb29MOUJ3TlQxWXA4TE9UcStCeUdmYXJh?=
 =?utf-8?B?L1ozVFZGUjhjbWJad2xDMGRsY2FWZS9PeHNScjhKdmEyVmZ3SlIzbTBveEhn?=
 =?utf-8?B?UjdrZXVuRnJLWTU3aTU3b1JXNWU5S0FVUmFJb1FMVkdGc2RkckEzUDVkL3N3?=
 =?utf-8?B?d0w2ay83dHBya0JZSEx2ekxPOXdSQUpCMWZIRENxcXJxdE9vY0M0S0NYZFpM?=
 =?utf-8?B?UlNtMVhXMWhyOGJoK1ExK2FGNGVhNE1aNjhJSTdQS2ZpQmdaVkY0dzJIaWZE?=
 =?utf-8?B?akZaeHhIa3pTT3BKZG9wdmZYSkVFVzc0UFM4OTh1Y3VPOCtNbEdOOU9pY1Bj?=
 =?utf-8?B?b09udTB4L2pKTlRGYlJ3dmpWZFE2NDVRdjlNQmROeXlDUWV4SjhDZE1JY25F?=
 =?utf-8?B?QzBMZDgwdGxkbTU4VmVvbThCY3RFUDFhcGJCdFpNSEQxTHNuMGQydzZDcmRN?=
 =?utf-8?B?SnRYTGU3bGtodzl5YnhGdkhNWmRFcExibzlKVVpxR21qcWMrYisydjlWK3ND?=
 =?utf-8?B?TlNQQmZ1UGlTZk80OVlLYitzSWFuQ25kTm91aXp1Wmptclh5Q2cyMlpwRStm?=
 =?utf-8?Q?RihVWcsNfiWqu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUxjMEpTeEN2QUpxcVVISW9aZW4yWEhKQ2JHeHY4d3k3VFNxc1VzMHdMNmFX?=
 =?utf-8?B?UU0yOTRlTmVOKzkxU2p1RHV6eGtkNmpWUFpCcmtHNU9KOUpsOWV0UU5zTUZP?=
 =?utf-8?B?dlpsb2gxcmVHZUJwZVhraUU5bU91alBPa2U1T1RWMTIwMC9tTmVkYnN3cnBv?=
 =?utf-8?B?L1lSb1VsY3dZVjJ1aitzSCs5QmQzaWJjSitDRGZYSmJNcTh1QTNBYVJKNVRy?=
 =?utf-8?B?OU8wVjVQTU5hSFNvWVFXcmtEMFVpOUl2a09WS255clloakMvNUZWYUhOS01u?=
 =?utf-8?B?NnJaUXF2Z2puOVhsTjlMeXpzaEZaSUtKbFVMS2hjZUw4TTZqRVRFcTh0Y01Q?=
 =?utf-8?B?dHlmOFlBRm1WTGNtbFFPaE5oK2wxNGpqSkxwSDRacnh2Z3hzbVVRdVdGNlhs?=
 =?utf-8?B?VzFJc3RQeHRnUDZEQ0QxZUQ4a2pkNVdMS3BoYUxiUkR4eXc1dG5idHRFcTYv?=
 =?utf-8?B?ekRxZG4vNW9YRnpjNWZBbyt2dnFodXozTjNsU2k0a2crMEFtVXRVMURWcE9Z?=
 =?utf-8?B?eG8rSWNrNk50Um01VnYvZTFUY2x4YnlQKzdSR3FMZU4wK0dkcWNSR015aldJ?=
 =?utf-8?B?MllnWXNUbVZkZGNIZFhFbnpOOGJiaFUzOThXcFdNTUJPcWlzRGdUSXlsemF0?=
 =?utf-8?B?azdhL3JMQXNBK1ZuK0JvRGN6TWlkMThqZmN1VUlhdDVMOFlsemlFVnZzbUk0?=
 =?utf-8?B?dGtPY21oeXRHU2orVmFZQjJKM2VrVzl6V3hvUG9ZNndLTHBQUVAySnB4QVNz?=
 =?utf-8?B?WDVQTlNlOTNqc0JuQnhJbnJCeWZNTGRkb3N6TWN5RDR2Z1c4VFBNUXE2TlRI?=
 =?utf-8?B?RUhtOFRpNUNQSmxVVXpMSUlXUkdZRnNPTXJ4QzFJc251WlVSRkcyS0gvVnIw?=
 =?utf-8?B?STRyajczNmZNd2g1WERHeGJ5bUw1bU5acVBIZFhZcmJlVCtHOEJnRkVRWUc2?=
 =?utf-8?B?a1hpcnZFMytvOCsrNEJrN04xL0hSa1hkdEJBdWVRSTBsSXBNcGJYS1dmdXg5?=
 =?utf-8?B?aTE1L2V6enovNms1bUErK1FiYktHYUVMRHNTSnEwRmd5VmhlamQrcDFQR1hs?=
 =?utf-8?B?c25oUHJpK2ZKdEI3WFZLbUtFWlY1ckd6UHpzbjFaTnNPRk1rZEtKZmxocmRY?=
 =?utf-8?B?VEhJZEo1ZDBhbHNucmh4KzF6YjJWUDR2dzFseE92anlGaGRqTjhoa1VteFJv?=
 =?utf-8?B?a3JlQjlPTlMwVXBaR0MrWTFFMHh1SG9rNERaVk1wa3BvZjg1alQvWWN4Y3BR?=
 =?utf-8?B?WTlBMmJ1YjZjK1JWRm56bHFsZHNCTTFnY2UyU21CQjJhUy9oaURibDMrQnhB?=
 =?utf-8?B?ZEZ4SnpSSlVrRjc2amRUd0xucE5xZ3E3Uk9KMmlQQllkcWFybmJiZWpubzM1?=
 =?utf-8?B?cm1UZ281Y0hmM25Eelp4RU0xTEQ1MXdWY28yd0Z2blIvMXc4V0xZMHB4YzBU?=
 =?utf-8?B?ZENOaXhtZ2JzZ0ZGZFNhS1d3OFZLd1NtelgrS1lLMUJjSUdVK25oWWVGUGZ1?=
 =?utf-8?B?dW1PZm51YVV4SVArRFdINHFhVU5WNnF1cG9zVXFGcUIvOUtRZlBmUWtiSW5L?=
 =?utf-8?B?TFJQMUVrN29FUW4xTG1jNmlZOXIzNURDS3E0Q0l3YTgxbEZleDh3T0FkNndW?=
 =?utf-8?B?ck1kRnFySzA3aDh3Y0ZGRWs3SlJQTTgvN1lZTW9TV256LzJRRG9QZzF6N05a?=
 =?utf-8?B?OEg2VXBZNGJvTmszSmFMaGVjK005M0VMMURRdGlPVU90Z0ovNkFaWVAyTlNl?=
 =?utf-8?B?NFR4OHl5YndBNlVpRmhxYmpydEExSTRBR2I4MmJzQUJsWlo5aVlVZWdnQVpR?=
 =?utf-8?B?dXp3ajFjSHJtRWRJMnZya3Viem01R2swbENuR3BxWWlFcWRUTE5kYk92MERE?=
 =?utf-8?B?akNnQmx6S3VMNjhOa054c2hhUXQ5VHdpTzVseEFCSmIvdE52dWhoUlZQNllG?=
 =?utf-8?B?aVA1bkJLQmsvTWptRkZQTlUwM21yQm8vWkFLK3N5cHcxTHl6Z2hYcEJxOHpi?=
 =?utf-8?B?MDZEbG13ZXQydmhuTktTKytMN3VoaXNiN3lyNlJDRlZhMyt1ckYxeUJmMG42?=
 =?utf-8?B?QTRWUk5OWGpnMmxPbGtFc1djYktiTCtqaUJGTFU2SmR6aUJPcjFqemp5SjNQ?=
 =?utf-8?B?TUxIaTA2TXJoMzhoVFFvc3FUQ2NLOXZSTkY0bXd2R1dUNDNQQjlTSFkxV3hX?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a4873a9-108d-4f90-45f4-08dd1e862cc5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 10:32:58.3506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IpcNvWfu7ufIQNA/n2v4c4kG9+su86ko3dYMcTL1yqFVpwhhGFQDvJ7XZKzKLbtbx9LdpbKvim5yQ1qer5sC0l59rONm/rB7gpbiI0W3tS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8224
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


On 12/9/2024 5:16 PM, Swati Sharma wrote:
> Add new chamelium based sharpness test. Basic test is added where
> we have tried comparing frame dump of unsharped and sharped image.
> After, sharpness filter is applied its expected both frame dumps
> will be different.
>
> v2: -removed MIN/MAX_FILTER_STRENGTH (Ankit)
>      -fixed alignment (Ankit)
>      -removed commit with fb_ref (Ankit)
>      -set data->pipe_id (Ankit)
>      -removed disable_filter_strength_on_pipe()
>      -fixed CRASH
>      -fixed assert condition
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   .../kms_chamelium_sharpness_filter.c          | 240 ++++++++++++++++++
>   tests/meson.build                             |   2 +
>   2 files changed, 242 insertions(+)
>   create mode 100644 tests/chamelium/kms_chamelium_sharpness_filter.c
>
> diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/chamelium/kms_chamelium_sharpness_filter.c
> new file mode 100644
> index 000000000..d7316723a
> --- /dev/null
> +++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
> @@ -0,0 +1,240 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms chamelium sharpness filter
> + * Category: Display
> + * Description: Test to validate content adaptive sharpness filter using Chamelium
> + * Driver requirement: xe
> + * Functionality: chamelium, casf
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
> +
> +#include "igt.h"
> +#include "igt_kms.h"
> +
> +/**
> + * SUBTEST: filter-basic
> + * Description: Verify basic content adaptive sharpness filter.
> + */
> +
> +IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter using Chamelium");
> +
> +#define MID_FILTER_STRENGTH		128
> +
> +typedef struct {
> +	int drm_fd;
> +	enum pipe pipe_id;
> +	struct igt_fb fb, fb_ref;
> +	igt_display_t display;
> +	igt_output_t *output;
> +	igt_plane_t *primary;
> +	drmModeModeInfo *mode;
> +	int filter_strength;
> +	struct chamelium *chamelium;
> +	struct chamelium_port **ports;
> +	int port_count;
> +} data_t;
> +
> +static bool pipe_output_combo_valid(data_t *data, enum pipe pipe)
> +{
> +	bool ret = true;
> +
> +	igt_output_set_pipe(data->output, pipe);
> +	if (!intel_pipe_output_combo_valid(&data->display))
> +		ret = false;
> +	igt_output_set_pipe(data->output, PIPE_NONE);
> +
> +	return ret;
> +}
> +
> +static void set_filter_strength_on_pipe(data_t *data)
> +{
> +	igt_pipe_set_prop_value(&data->display, data->pipe_id,
> +				IGT_CRTC_SHARPNESS_STRENGTH,
> +				data->filter_strength);
> +}
> +
> +static void paint_image(igt_fb_t *fb)
> +{
> +	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
> +	int img_x, img_y, img_w, img_h;
> +	const char *file = "1080p-left.png";
> +
> +	img_x = img_y = 0;
> +	img_w = fb->width;
> +	img_h = fb->height;
> +
> +	igt_paint_image(cr, file, img_x, img_y, img_w, img_h);
> +
> +	igt_put_cairo_ctx(cr);
> +}
> +
> +static void setup_fb(int fd, int width, int height, uint32_t format,
> +		     uint64_t modifier, struct igt_fb *fb)
> +{
> +	int fb_id;
> +
> +	fb_id = igt_create_fb(fd, width, height, format, modifier, fb);
> +	igt_assert(fb_id);
> +
> +	paint_image(fb);
> +}
> +
> +static void cleanup(data_t *data)
> +{
> +	igt_remove_fb(data->drm_fd, &data->fb);
> +	igt_remove_fb(data->drm_fd, &data->fb_ref);
> +	igt_output_set_pipe(data->output, PIPE_NONE);
> +	igt_output_override_mode(data->output, NULL);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +
> +static bool test_t(data_t *data, igt_plane_t *primary,
> +		   struct chamelium_port *port)
> +{
> +	struct chamelium_frame_dump *dump;
> +	drmModeModeInfo *mode;
> +	int height, width;
> +	bool ret = false;
> +
> +	igt_output_set_pipe(data->output, data->pipe_id);
> +
> +	mode = igt_output_get_mode(data->output);
> +	height = mode->hdisplay;
> +	width = mode->vdisplay;
> +
> +	setup_fb(data->drm_fd, height, width, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fb_ref);
> +	setup_fb(data->drm_fd, height, width, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fb);
> +
> +	igt_plane_set_fb(data->primary, &data->fb);
> +	set_filter_strength_on_pipe(data);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	igt_debug("Reading frame dumps from Chamelium...\n");
> +	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
> +	dump = chamelium_read_captured_frame(data->chamelium, 0);
> +
> +	ret = chamelium_frame_match_or_dump(data->chamelium, port,
> +					    dump, &data->fb_ref,
> +					    CHAMELIUM_CHECK_ANALOG);

Currently we are comparing the frame captured after sharpening 
(converted to cairo surface) with the cairo surface generated from the 
reference fb.

I am wondering if we can capture frame (chamelium_capture) before 
setting the sharpness property and one after the property and compare that.

Regards,

Ankit


> +	chamelium_destroy_frame_dump(dump);
> +	cleanup(data);
> +
> +	return ret;
> +}
> +
> +static int test_setup(data_t *data, enum pipe p)
> +{
> +	igt_pipe_t *pipe;
> +	int i = 0;
> +
> +	igt_display_reset(&data->display);
> +	igt_modeset_disable_all_outputs(&data->display);
> +	chamelium_reset_state(&data->display, data->chamelium, NULL,
> +			      data->ports, data->port_count);
> +
> +	pipe = &data->display.pipes[p];
> +	igt_require(pipe->n_planes >= 0);
> +
> +	data->primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +	igt_assert(data->primary);
> +
> +	/*
> +	 * Prefer to run this test on HDMI connector if its connected, since on DP we
> +	 * sometimes face DP FSM issue
> +	 */
> +        for_each_valid_output_on_pipe(&data->display, p, data->output) {
> +		data->pipe_id = p;
> +                for (i = 0; i < data->port_count; i++) {
> +                        if ((data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> +			    data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) &&
> +			    strcmp(data->output->name, chamelium_port_get_name(data->ports[i])) == 0)
> +                                return i;
> +                }
> +        }
> +
> +	for_each_valid_output_on_pipe(&data->display, p, data->output) {
> +		data->pipe_id = p;
> +		for (i = 0; i < data->port_count; i++) {
> +			if (strcmp(data->output->name,
> +				   chamelium_port_get_name(data->ports[i])) == 0)
> +				return i;
> +		}
> +	}
> +
> +	return -1;
> +}
> +
> +static void test_sharpness_filter(data_t *data,  enum pipe p)
> +{
> +	int port_idx = test_setup(data, p);
> +
> +	igt_require(port_idx >= 0);
> +	igt_require(igt_pipe_obj_has_prop(&data->display.pipes[p], IGT_CRTC_SHARPNESS_STRENGTH));
> +
> +	if (!pipe_output_combo_valid(data, p))
> +		return;
> +
> +	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name)
> +		igt_assert_f(!(test_t(data, data->primary, data->ports[port_idx]) == 1), "No sharpness observed.\n");
> +}
> +
> +static void
> +run_sharpness_filter_test(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	enum pipe pipe;
> +
> +	igt_describe("Verify basic content adaptive sharpness filter.");
> +	igt_subtest_with_dynamic("filter-basic") {
> +		for_each_pipe(display, pipe) {
> +			data->filter_strength = MID_FILTER_STRENGTH;
> +			test_sharpness_filter(data, pipe);
> +		}
> +	}
> +}
> +
> +igt_main
> +{
> +	data_t data = {};
> +
> +	igt_fixture {
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_require(data.display.is_atomic);
> +
> +		igt_chamelium_allow_fsm_handling = false;
> +
> +		/* we need to initalize chamelium after igt_display_require */
> +		data.chamelium = chamelium_init(data.drm_fd, &data.display);
> +		igt_require(data.chamelium);
> +
> +		data.ports = chamelium_get_ports(data.chamelium,
> +						 &data.port_count);
> +
> +		if (!data.port_count)
> +			igt_skip("No ports connected\n");
> +		/*
> +		 * We don't cause any harm by plugging
> +		 * discovered ports, just incase they are not plugged
> +		 * we currently skip in test_setup
> +		 */
> +		for(int i = 0; i < data.port_count; i++)
> +			chamelium_plug(data.chamelium, data.ports[i]);
> +
> +		kmstest_set_vt_graphics_mode();
> +	}
> +
> +	run_sharpness_filter_test(&data);
> +
> +	igt_fixture {
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 84d8bed4b..0a336c2c1 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -340,6 +340,7 @@ chamelium_progs = [
>   	'kms_chamelium_edid',
>   	'kms_chamelium_frames',
>   	'kms_chamelium_hpd',
> +	'kms_chamelium_sharpness_filter',
>   ]
>   
>   test_deps = [ igt_deps ]
> @@ -365,6 +366,7 @@ extra_sources = {
>   	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
> +	'kms_chamelium_sharpness_filter': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
>   	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
>   }
