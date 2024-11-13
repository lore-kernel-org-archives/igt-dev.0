Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88089E6781F
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 16:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4561210E13E;
	Wed, 13 Nov 2024 16:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IeZ8ZOSb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B3F10E13E
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 16:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731517078; x=1763053078;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zZyYsI9QgsOuxyM3th9s8uF4JNSSJZR3EOlLSvyBwv4=;
 b=IeZ8ZOSbuUedRFEwycdMrU2EyVXjmw2zb1ye6UsvTKaV1V47i4NupIne
 /x+0tidH/UmKHBy0JBUhtSskVKjCYz90q1+wakuBodPkWuTW0FxPvlv0i
 T7rOFyGT9BmaS7WwUFwz2W5xjYjYPDBkXICY79UdYcje2Rpj+MdtIqh8U
 TupgM5D3Yp236ECjOF0aDzosuxyHR7/3Cy2CAym7hxrCcPJig+g7eh11w
 0kiP3sKIbKmfisiJcFN4ug1k3m1zyjcH0gPQ00CAaL4fBFv/1qHaINjsG
 XG4iBx1fuzK0MXV9Hv3AMm9ZS3lxkdW3SZYWDtim1cNhAFmmJWSt6Mc62 Q==;
X-CSE-ConnectionGUID: 5rnB3beDRiuyaSbEPeYDGQ==
X-CSE-MsgGUID: A8LBI6QhQ6ioPddcslo8ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31592188"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31592188"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 08:57:58 -0800
X-CSE-ConnectionGUID: OgQAuNJLQMe4tFgrWcL3og==
X-CSE-MsgGUID: JyW9NGWRQKedcCfzvFimFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="88089431"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2024 08:57:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 08:57:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 08:57:56 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 08:57:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NTIE+Ila9QaYnmc2FG79kJNo6bNDjN/Z/8Oq3aqX8FCDtj4IPf024eGweozjrlSeN3bVKixUlL65cbLDEfnfYcJZZn+8DEwMjiON1bFPbOzG9X14bZMgWsRN9cdTof5V4fiJ5HNfDsoP79H9lkcHOZTqmmnVVrCnOValgQnf+g5Z62QqrxjhIGoVzJCLiexCok7/41ns8H6qzlVlyP8FQlLgQxiTRY8tKpM52nxqTBCQrsN7A6Ux4aDWzBkvn8krDNJblEA+gWok4/w0e8fR9ghITUaR0oUUkpH4IzQhb87iUYiU5nnT9kXAUyBTXU82UD6d9FVcr+9aGV1884cHpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OR8pdvl9+IJgjSosbxH9764yPGShMIemECA/8UxnRDM=;
 b=rtei6yxxgjVi3xLFqsfNcPHlYpM3yJzlHOUm2Jm2LXuqfV9VoTsF/aHMBn13a2skRKg+A9oAWwJ93S1dyXU8oWEbBgHFlm4lwO7ty8kLlD6iwUc51rA4BPIxaLuNJ75adMAv/tSKBi8sD1k3zBixYIYGf9SAqa9Ofw10Rum3UebHXTK3GJKButaf680nya8sqrBAvRyrL3IBc8gR3jWxFLn6xlrUGHDmmgAxwjSc5qmogzv0NbpzoG/M2hFq3I7m1pReez55hF3nHWl1L7mru8J1zMNv9QctX1A0CZvJCcmPk4WNJuTjMPc4mCDpUNsU73nL+rLCN00vgivcdBFIfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7297.namprd11.prod.outlook.com (2603:10b6:610:140::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Wed, 13 Nov
 2024 16:57:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 16:57:53 +0000
Date: Wed, 13 Nov 2024 10:57:50 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH 1/2] lib/xe/xe_spin: move the spinner related functions
 to lib
Message-ID: <ugq2nlvzcbbnna4nrh6cr7xpgxlcjmcnk6avn6gw5huskrrmgy@6s5zx27xo4bu>
References: <20241108074403.366318-1-pravalika.gurram@intel.com>
 <20241108074403.366318-2-pravalika.gurram@intel.com>
 <20241108090141.yppjx5ilbwkw2lmi@zkempczy-mobl2>
 <tqgdzleut7wpszlynppxjydouilfhyg6eu4s4xguslqnuayl65@r6lpibhpw5jt>
 <BL1PR11MB5525636A93AA37B26D45AAE2845A2@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR11MB5525636A93AA37B26D45AAE2845A2@BL1PR11MB5525.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW2PR16CA0033.namprd16.prod.outlook.com (2603:10b6:907::46)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: 28fe9551-b663-4ec6-e167-08dd04045054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFA0UDA1aXR5RUVLREd3L0xzay90S3pUZXgrc3FhaEZwWUNoOU1reDFtZHlF?=
 =?utf-8?B?aXowNDZ3MnBpOERuR0V4djlKU2l2MEtwaWR0elZ3WjQ4citDdEtjK3BTOHVL?=
 =?utf-8?B?c2l3ZE9rbnJyZGxEZzJYTkJndmtVQzlpTTlwcnFTdWVodFVRd1JoYm14Qmkr?=
 =?utf-8?B?VE9xU0ZncCtTeU00dnpYdEM2SzlMSHJEUEpMdE0vdGFVL1lKNTVteFMzc2JZ?=
 =?utf-8?B?SHYyVUpCUnZRUitTM3NuVTRmMmgwaHhaZnJGMXhSRkQwUDRDZVJOUWc4dHNj?=
 =?utf-8?B?WUh1UzZkNDJmckV1bVp6bXZGb2hwcnJlYk9aMG5qQWZuVjhjMjY1VnMzMmE1?=
 =?utf-8?B?UVJjR3lpZDNOWTB0SE9TWGFURDk5QVNRWW91VVd1bWZQNEtkVFNHcnYwbFRr?=
 =?utf-8?B?Vjk5RzV2MElYd1RXdWlxbG92OCt0OW9YcmJUdmQ2RTZ6dXlOV0M1dTF1OXlw?=
 =?utf-8?B?bTBjU1RlTDFsNEtlQXB4Y0k1Q05JZGFFY1QyN2tpVzREVkM3UzAyc0ZpQ0pl?=
 =?utf-8?B?MnVzMzhFenp5SDhVWmtMWFBRWndUQmxyeTBXRTFoU2VzalN5U3B4UFVQbllu?=
 =?utf-8?B?YU1iMnU1ZVJrZ3BwNVdQVm9ReTRJbFBxUjNZbkdZalp2QTgxWG5aejV5SGcx?=
 =?utf-8?B?WDE2SzhpbEpTOGVuTEM2QXBYa1ZFcjNRVFNUOFVMNzE3YmRpRlEyRjV0K0hW?=
 =?utf-8?B?Vk1BZUpJdnk1ZHhNQjcxTGpyRUE5R25yNldBV1BPdXNIbmNiMDZjaFNZTjlD?=
 =?utf-8?B?SWdydUhmaERhOXlldlBUcHU0N1NyWE9LZGZOUEVmb1dKTWN2eWw2dEp3TXNL?=
 =?utf-8?B?T2ZZNmhuZkZMOGYxbExGcGVpM2lIZ2RvazhBVkVFOGorSmJ6c245VkhmbktW?=
 =?utf-8?B?aGpuNXpGZkJudWV1akozOEVjSis1eWdDS2UxWllyRGVpMzJTR1BHTUsrU29k?=
 =?utf-8?B?OG13ekc1ck84cmxjaXErb0U2dnA3Y05YQ2kvWjlsZCtUa3dsd0VTVllhWWVC?=
 =?utf-8?B?RHR5RjJHN09BT1dYcUpTZCtjSkZrTno4NjNXajB5RG9RbjMrT2xuRlBwWGpm?=
 =?utf-8?B?S0dKMFh4VHNGNDgwalFYOFpKTXg4NVFlSzYrc3ppSzlxd0FGVXVaQzBtNThj?=
 =?utf-8?B?WmxGMkdaSENYc1NRWnlNNDVMTlVqckYwN3hsdU1ZcVJoUjEwQWo1ci96QmxW?=
 =?utf-8?B?clo1RkV6c1N6TWk0bTZkSUxnYUkrMEJ6T2xFRGhHUXhGUTNVVGRaTDNNQjVS?=
 =?utf-8?B?YzRJVUJPUGMzWFVFbUJSQ01oTXNraCtpSWVUZjBvU3hyaEtRclNLYWtUZllK?=
 =?utf-8?B?NktOWFRzMC9zc1AxbXpGMXpQbEJpNUlqWjV5VExoSDN5dnlLQnpEdklxM1E0?=
 =?utf-8?B?ZTV1TGRyUkdSQ1ZMQVREdEVFNXJBOFF1UXNXaVowNHFzWklNc25PM2NYZkJu?=
 =?utf-8?B?aGxkbEhLZkhNUjBFTkltK1VSUTE2bEl4cmQ4bHBpaWVrbGNndmtvWnN0QUx6?=
 =?utf-8?B?T2p5aS9RdzF3L25SSmIrQlJ2em9CQnoyQ0MrYytZQ2lsM0dCMWxad1VBbFIw?=
 =?utf-8?B?d2liQWdsbWFKQ3RmcWtNSnU4M0lhUVdjUThPQ3hoS2U2aTVQajFiNCtzZHl0?=
 =?utf-8?B?UW5Gd215bUo2UG42K2ZWNkk2WnBmam9iK2RYSHV4cGxYSnYyNzFabVVVSmFm?=
 =?utf-8?B?VFpuNk1mZ2tNVHJteHExMGFiRE5WSE1OenFZQ2lHYm1OeHhlSGZJem5zczZn?=
 =?utf-8?Q?TzZkNEd3zCPgODPac/8OrXHGqWI64ZZGpJ6vFjL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUJKS2ZBS0RQVnowK2ZMZkdtbzBtd0w3S0hlSndDTjhBZytYN09KWXU1Q0w4?=
 =?utf-8?B?TEdGbVRmdWVQVUZOZWN6RjAzL0JXSzNQeUJsRXNicWxFT0lXODd5R051b1ps?=
 =?utf-8?B?QWtFNVE2amoreXFUWitON0VPWnQ1cGxlOFV4TEdoeHV2Z0QySVZ6TDAzeEFE?=
 =?utf-8?B?UlZ2QnpObVc2cG1mY3JLK2lQbFBKU0lhQ0hTTGd2eUsrWFJlWFRJMENPTUJt?=
 =?utf-8?B?UFFkeW52a1lDQkpOeTNTSVc1N1UrQVptVCthZ1MrQmJqUm92ckhkaHNEVGdQ?=
 =?utf-8?B?NFVlZGY5eG9leGU5cWFvQ0NlSzFpVTNpc3lsVWxUVWRZTnpVR1FQa084ejFE?=
 =?utf-8?B?ZkFZOEdNbVJESTY4bkp1V083Ukd3YTgzcnpTRmtOd2JQQjQ3ME50VzBNSkJh?=
 =?utf-8?B?QzdUUEVkVzZHRkthS2tpN2ZVeXFDKytuQmpqV3JiMFRSTHltY29YejFpTHNC?=
 =?utf-8?B?cXZXQzgvbGh3ZklsbUVRYy9IcG9nQlpyUFdtWE83alYwUFJPRDV3S3U4NWxz?=
 =?utf-8?B?dG8wTjh3U2dSdnNBMVVuNkVrSjNZMUlWVGxxZlZoN2V1b21pdS82YUdnV25n?=
 =?utf-8?B?U0xld2txMWQ3cUIvb29PK2ZWcjZiaGxnL0RyR0lNdkRxQXIrRVhBV3ZqRURB?=
 =?utf-8?B?VER0NkhJMTJhZGxLQUYvdE5YaHNzZmhaRFlKSm9tM1ZLWmhsZUw3K3RTZlY2?=
 =?utf-8?B?T0ZqcnM1Rm9pdVY4Q0JpVTBpOFFEY21scXZsREE4THRNc3dnTTNmdUVBekJp?=
 =?utf-8?B?QnAzTFljZkVPWEE5L21oYW52cUpsUmVyNW1WRlhzL2FZQUFsR2oya3VZMjB3?=
 =?utf-8?B?ciswTzViM2xadlc0L2VJYllxQWxjLzNUbkpCMm1ObFRXNEJRc1cyZm1sNkJE?=
 =?utf-8?B?REJ0cXJPZHU1cWFDcWo4emVJNDJ2NktBVDJTRFRCYWQzRSsvS3dRUWc1Qkxw?=
 =?utf-8?B?eFEyV2ZudGlIdjJUN1ZERXVBQnNXaFBtZ0l6Sms4WGVnQk9MQ2JSS3FkQUdR?=
 =?utf-8?B?RnJvZWwvbzBNMHdMOHNBVktJalAvSmJMNmpxcURVQjg2N1NTVHB5QUlkRGZw?=
 =?utf-8?B?cUVUV3VmZkxERHE1d1IrdVJ0KytMRjFKQlptRXErdVNTZXRnZlNHLzhLWTBq?=
 =?utf-8?B?L0k0Z01IanlZOG9ZeEpXcTI2SkYrZ3dzRTRIS04raFlRN0dSamloNWU5aXd5?=
 =?utf-8?B?OVRFa0I5YVQ2ZEQ1TjFHVHpaOC9Id3BVTzNKOTloZ1gwaTRLWnJrTzlkOXNv?=
 =?utf-8?B?ZWU3blV3di9VMTZ5ZXNDQWVqa1hsc2Y0Vjhvc2sxZzVueisxdDBYdkM3YkxE?=
 =?utf-8?B?WjRaWDFFbVUyVXptRlFDbmN6M2pEQ3VvRUxlS3dBUXd4ZFk4Sm50QjdsTmla?=
 =?utf-8?B?T3RCSHZJWE1lSnJtbGtvMitOYUpWY0x4YUNLVi9VOStUSmdSTXQ3ei9vV2hz?=
 =?utf-8?B?RVloM3h1UWM1dXFacVZxK2dibXJNWURFTEVlanovNkNLTFhYMEJiam85VTZq?=
 =?utf-8?B?NWsyaEpNVW9vR0J6b0VFUGp1NDFMVkRLRkN3RjUwWXllbFZsU1ZUWFpiVDNx?=
 =?utf-8?B?ZHhES1hPeVpiTHBmb3BsdGloSkNrUGJuZGIrQ0xBbDYvbVJhZXJQNndFWjZM?=
 =?utf-8?B?Y2xWUThuemdWZ1JEcllqNi9EVG1yZ0dscjM2UlZYRkdRYkJZazNQaGpickVX?=
 =?utf-8?B?KzFZdEVjOFRSaTZnWUdFSktWYTJjRCsza25rdHBEMUdQdFpFVk1UNk51QjVT?=
 =?utf-8?B?ekgrVzF4RVdiYkJLM3VBK2hoK3ZyTVF3dWlWRmd4bjZxZTdabXhZNzM1K3Rm?=
 =?utf-8?B?Q0RRdlBSbDZSaFNvWTRaaS9sOW1Lck1tRWZCWjY3WUNaUVEyYWo3d0dLSzJl?=
 =?utf-8?B?dllWMUU1M0tGcnJEejhvZHVrTmE1TEkvV1M5cWdIRVJYTU0rOE5pODNkMjgr?=
 =?utf-8?B?SmxyYmJSc1pKMzkxUjJtNE5rRUx1NlhSUWlXRE51ek1tQmZIcTRTZ1EzMFdv?=
 =?utf-8?B?T0JIeldMQmhuZ0VBM3F4ZDA2aVV0cnJlUFdDU05NUjMrWEg1ZVo3R1RZYzA3?=
 =?utf-8?B?VldGcHRKYU9uaTMzTWhmN3lUUFVKU2FJbkxQSVE0RWIwK2d6aEdpT3FpWGZt?=
 =?utf-8?B?QlNrckpSSGM3YTlGdVdYNFZoN2g5R3JSZTJNK1BIWHhJc0YwaG9hcDNOb0d5?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28fe9551-b663-4ec6-e167-08dd04045054
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 16:57:53.3068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6cR+bvu4x8QDi9MlJQfE9WlkzbTruuYPDSWywq1wGFDazRmkB57xEHwAqi+UjiDEBmreXCXqcrQc2a6wxDR6LwiIXM1oSatYG7/6MPRhAvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7297
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

On Wed, Nov 13, 2024 at 10:13:06AM -0600, Gurram, Pravalika wrote:
>
>
>> -----Original Message-----
>> From: De Marchi, Lucas <lucas.demarchi@intel.com>
>> Sent: Friday, November 8, 2024 9:09 PM
>> To: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
>> Cc: Gurram, Pravalika <pravalika.gurram@intel.com>; igt-
>> dev@lists.freedesktop.org; Brost, Matthew <matthew.brost@intel.com>
>> Subject: Re: [PATCH 1/2] lib/xe/xe_spin: move the spinner related functions
>> to lib
>>
>> On Fri, Nov 08, 2024 at 10:01:41AM +0100, Zbigniew Kempczyński wrote:
>> >+Lucas
>>
>> Pravalika, please keep me in Cc. I don't watch the igt mailing list close
>> enough, particularly when it's a follow up to a suggestion I gave.
>>
>> >
>> >On Fri, Nov 08, 2024 at 01:14:02PM +0530, Pravalika Gurram wrote:
>> >> move spin_ctx_init,spin_ctx_start,spin_ctx_end,spin_ctx_destroy
>> >> to xe spin lib to avoid code redundancy.
>> >>
>> >> v2: use allocator based on developer preference.
>> >>     change spin_ctx to xe_spin_ctx to avoid name clashes [Zbigniew]
>>
>> but we already have another thing named ctx there, the rename doesn't
>> improve it.
>>
>>  From lib/xe/xe_spin.h, what should be added on is
>>
>> struct xe_cork {
>> 	struct xe_spin *spin;
>> 	int fd;
>> 	uint32_t vm;
>> 	uint32_t bo;
>> 	uint32_t exec_queue;
>> 	uint32_t syncobj;
>> };
>>
>> I don't really like that name, but we can do a rename on top... or we can
>> rename it now and then move things.
>>
>
>could you please suggest the name in place of xe_cork

not sure... I think we can probably have:

Current		alternative1	alternative2	alternative3
xe_spin		xe_spin_bo	xe_spin		xe_spin
xe_cork		xe_spinner	xe_spin_ctx	xe_spinner

Or keep as is and let the rename to be done when everything is added. As
the original author of xe_cork, I'd wait on Matt Brost about a rename.

Lucas De Marchi
