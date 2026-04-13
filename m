Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A23AEBFD17
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 08:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3345610E37C;
	Mon, 13 Apr 2026 08:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fd+cyh/a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9BF10E37B
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 08:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776069331; x=1807605331;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Vqsh7Z4LwtkVuLnz7eguXBMpLNcsQDoPUK5EkWd6uqc=;
 b=Fd+cyh/ai+ZVEP5LsQ8+vdRiDRykJJruQM1YJjqyo8daeM4xVzS95A76
 59r1Tm1jv9J/HQomZECvdhkYJIu2X3mHgbb2ZfnOg4VAme6hkcbB9JhgF
 Yiuxt7WJ7IiUvyAEJBSs8D09TzwSAIZP+8rP8U+UPLDAMSNaTwJQg75Gm
 5UkHv4zRLRxb8OJQwa0g0JG7yK4gPHPwqhdjEFTwLHQCbQ9RDzd+ZIl1Y
 779YZreHc8Ls92+3uoacNyrHygW5YfLOdMC1tWJkOIHKOfTIc2hMckzGK
 gaDRN2af7FhmbblTBrLnV87UDIs4VyNqG7oUta4dvUXRcWsCOH0aLwIoE Q==;
X-CSE-ConnectionGUID: 1DvSoq9EQlqWZWDdJsi1sQ==
X-CSE-MsgGUID: hLu+HXKjQlmnQ0e8YajEZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="76960172"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="76960172"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 01:35:30 -0700
X-CSE-ConnectionGUID: XOEtVs7LQHK1OXQnEZaqUg==
X-CSE-MsgGUID: GrT9YcKaQAeHTuibLqSEhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="226560046"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 01:35:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 01:35:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 01:35:29 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 01:35:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NsT6lAcMBhu7gQqZ4sTSc/O2Rrz31UTrV5FXesmx1fd29iVa03b7uiR4PcIu5srGTAOEGzj5YYWplKWVJ/FNO4wpYtAQaEYoj33uqBKF6AsX3WrDmaQ4mSouFc+alL4Qy4aVjm/ALHyRQpnPHWp/6hhtpvqXoVR03YI2BBQ19TnKD2NEgpZdNBSNfU78InyKmSQlRyRDRSon8AjrkmwjO2hB516fivF/HRmWgaSs6fAimpdhlf0jMbGEqg5fVfg3Hq/UwZbRS/hcFUbwBDcVxVTjYAy4fVztRB3fjCo0gEpmlQ4XqpOmh5HrU/Y6+zq7MFUWxdBz1Wah5RPuBH20tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIktG1q1AiYzAOmXkdEXdq3KGaG6WjiYohf42n5Rpbk=;
 b=mMoWYwTHvJ54J7MKwpXPi4ZTrbGx6Wzgrdj08Deg4mYp2D+4INWf/+9Ty7qY8CD5jR+eDbxnbszTdCksORdUQbO8vSFb1Wd4dWpCUHkxartUxGZ9l20vJW+BJ8FUg2Tfq7Cva5RRtKwizlRGNI0GEm7s/xvALMLjkgk5O1n+cRxoekF1jcpsxht2UHXh/cSjjPnuViGAJCiW0G0TLkLJhiwvKva3HWyObgw9NxhiSae1w7HB8WzzuJuukwrH+Bfm34WUBfuT+vC2nRMHj6RXS5WUPPDf/wR6GFm1r1SvYIEVuunsPS75vEoNCy4MKOHRBTY6h7FGSaxAkcO2/mCXWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by CH2PR11MB8813.namprd11.prod.outlook.com (2603:10b6:610:282::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 08:35:26 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%6]) with mapi id 15.20.9791.032; Mon, 13 Apr 2026
 08:35:26 +0000
Message-ID: <b4d3f4a5-3dec-4a52-9321-0cb71238794e@intel.com>
Date: Mon, 13 Apr 2026 14:05:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v10 4/5] tools/gputop.src/gputop: Add support for
 per-engine busyness monitoring
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <badal.nilawar@intel.com>, <kamil.konieczny@intel.com>,
 <vinay.belgaumkar@intel.com>
CC: <anshuman.gupta@intel.com>, <tursulin@ursulin.net>,
 <lucas.de.marchi@gmail.com>
References: <20260406060428.2734117-1-soham.purkait@intel.com>
 <20260406060428.2734117-5-soham.purkait@intel.com>
 <e9d47e1d-138e-4742-9ea2-abe21a071c8c@igalia.com>
 <ba0b9f73-db89-4845-aecc-8c8fdf037ba4@intel.com>
 <e589ef3a-7703-40aa-a121-701c11955b24@igalia.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <e589ef3a-7703-40aa-a121-701c11955b24@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0150.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::7) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|CH2PR11MB8813:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b0b9283-72e8-4e3e-2568-08de99379c87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 1oYiNK9GHU5T55AZ0gmT1DqjwH3V7X7Dz+KVOaZKdLEGgDsHbZ3r6vpg00Qwlbx1d3YeHgFKVDbPUNYG3e/GjYnMaZBWPOMaSppeA2VsyfPWDz9Zl+pDHkogwN+HgnaZa8zXiyzRAdE/T7lfdT0XtEzL8LZ5h2RRLRlxNxkS2f8a6LSiAUMinmz0M69YrkdvpWZQjbidF6njn8Cf8ycJFgdgLcLputjJnK0kNx8T8Yo9loIvKntM/alnwMCV19bjmAyZfeDfFRd1fX/0hucN0/hsGpHMSCnajnFUV8p38Zwbp8ufs58meyvCGZzp7mcJmIkhkEM0wyxqvDZhPFFxp2O3MDRf6tIZ1DiEiwDrX7E9+twnMv1QeKU6v9yjVq9rlVKAOl7aaTBazZieMUVzk8kNEFYJJSnDAxmik78NpVwipaH6x8cVxYeAWVQ+wHD8m8XgxNmiU3cPKVHXTrxJOXP/A4eAOHqVk4VQVIZ2VAkxXwi0y8nVCk0qhBtD2OpB+ybiyJr4vxs8EL1TmmH0Bk5JczXhjkenIxyd6bT9LBRAFZ0A2xy5RwgYz3S1xcTn4CyuIYdcDmm7N+KUPSZySLPfeq0ytOxQdOqheCaSU33aZIVzvqI9Ncjl0YYPAO+iKrydHEPrELmVXExayG5/jtLIatKplQF+TnF9N2p/n7OxJh4w6g76biyNAd7gck3bzUyGiGC0bBioppMA8YdcbHzK0W0xq5WK7QsXuvZ+0p4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVFaM0V4a2kyTUJjTDlXV1BlRXNjVHJudDRhS3VmanQ1bkhZMXVuWkFvY0hj?=
 =?utf-8?B?dXRMMUYvQS9PNDlvQU95WkJrdHlvV0xtL2ZlZ0ZzQnpKcXc3OEswdFYxaGpz?=
 =?utf-8?B?MTROMXB3KzlJUllLZUF2SWZCZGhBdko5UTA1R0JveVZQbEJDcHRZejRmM3JY?=
 =?utf-8?B?b1M5Yzc4dEpWUm9wSUx6WTBhRkQ2dE0rU2tUbFpubHJiTVdIK0xUZ1BqMTE0?=
 =?utf-8?B?YUo5a3p3OTdxUjA1M3VHVjZPMzhMTE9QN0psaXRNanVYWkdseE9scUh0bXRJ?=
 =?utf-8?B?dW84eUpJU0ZQbUNQQXVQdkJlV1gyMlgzNm1mbGdrdmpOWFdieGpZbk5mSGlE?=
 =?utf-8?B?akViL3NYMUFFSlM5Tzl2c0RUNkVtUncycTZFYzN1RElDYWoxTTNsdVY2NnJG?=
 =?utf-8?B?cHlPbFljL1lZRit3QlZiWUxuRlo2TnpOT2R1YUZyUkt5UHFrczQ4aTZLY2N5?=
 =?utf-8?B?YjNmQ0tmR1cwT2tQU1NsYnVXM2tUMDUrSHhiSWVieCtIQ1ZiOFZsbUpuVHhT?=
 =?utf-8?B?QnhhUkhvTEo1RWZaVEtMTkYzQXQwbjBnLzkzN3hEVkVmV2U0T1lJcGRwN2xn?=
 =?utf-8?B?blhpKzhpT2w2MitWQnBYMGYvN1lkNjFOQmV2bGduaUQ1NmwxdzNuVVFwQTRx?=
 =?utf-8?B?MjY0b00rQzBtYzRMMTg4NnpuMjJLZnBBZDNUZjEvTDNUQXgxclRwblZBVWpF?=
 =?utf-8?B?Z1hETE8wUlJaYzBRaisrTmpuSEEvNlVRUEtVdUlvZXZpOFpDTTZ4REx5WTJ2?=
 =?utf-8?B?cFVVV3I5aFh1M1dlSFBncEFVTmt3eS9FSjNKRE9yZncvNFJ2aWxaNUZWdHZW?=
 =?utf-8?B?RTBGRWdHdlhjWWZqQXJIeWhtWGV5aXZDc1drcXdXVEtZZ1I2a1YxbjNJN3Vq?=
 =?utf-8?B?Ni9pbXFwOWVBS2QvUmZDK3lHRENpdDhNaXpCa2JSaGVOdFI4UnR5alBNSjYz?=
 =?utf-8?B?bmRRbWlGcWNPcGN3cnFhVm9SYWFGNW1uNHlnL3I3bnB4Y3E4K2dsZmlyNHp5?=
 =?utf-8?B?SldNZTFFM3NsZXBKSHhlTnM1Ym51RHRLVUNvZ3BBK2NKZW1PQ0NCNExLWTNJ?=
 =?utf-8?B?NkNVWS8xWVlhYzRjMWVMSlBVSDJ5L2VsbzFJM1dXdzlFUFlFRTI5Uzhna3hB?=
 =?utf-8?B?alhqRzFNSFRsZHlZd0R6UmZYTWJZZDJkYVdWY2NLNDlXMDRwY3NWV055U3BK?=
 =?utf-8?B?citzdmlpVUw5R3AxbmtpaE1WdW1SSWMwTGpENFZybDByb3E4SEl6c2xOa2g5?=
 =?utf-8?B?NXovNm1QalpqNVpRWVo3U0dXbHdxWklpQjliRk11d3NPa1NFT0VsZlc1R2Fh?=
 =?utf-8?B?eDQ5d3hDd0kxdlNDcUpUSEZadFJ3VHRVQ2ZiWkprSXp4cjBTeUZxUmgrS2FT?=
 =?utf-8?B?VU8xOGtYeDdsTER6T1pmbWlLWjBiMGxWMVVIdFBDUkpZZURsQ1VkUHBvSDhw?=
 =?utf-8?B?QmYzbTQvOE43L0Uyd1VrL25mVXlHZU12ZnJMSWUxQUJ0NHhaWTVRK2dZY3o5?=
 =?utf-8?B?a1pxb2xuam0zempkQzlnd08wMkdYU1dyeVZkbWtXRDJITkFqTmt2OWN4QlZ6?=
 =?utf-8?B?MjhvK0FMRG1zdDlvekJTZHVSZzdEc1FSOUYyL1dQU2tVQ2tza0Z5SHZ2ZVZE?=
 =?utf-8?B?cEgrZmJucXJuaXFHRk1uTDZjU202TzEzSUhMSjUyZG9aRjdlT3FsYjFHOUVy?=
 =?utf-8?B?VXRLLzVia1dxN3hINHNMWUtPRTBTamVON3JlRk11bFdRQ2VHOWs1OW9Ta0xJ?=
 =?utf-8?B?akdJU1grR25oOXlDZC84aG9mREViMHdoM2NScVNlMzN1RXZlcis5UzhwZmI0?=
 =?utf-8?B?WGdqVkZxT0pBd0lDMFFIMTdnMXVGVDNUdkM2NHJGQmZjQ2k1N3Y1d0JnSTlq?=
 =?utf-8?B?YVVoQ3BUNDVqNzFvSDF0VVcxZXpPc1RrMVYvN3ZrdXZTQzdkbzZwdUFvNnRX?=
 =?utf-8?B?L1V1UStyT3lZTENJUmNlR3ZTR2E4ZU1IWmpEd2xqVUx6RmVobHhDNWtuUFNI?=
 =?utf-8?B?NWx3MDJYdWd2cHAwQTY1U2c5dURFR0hjU1BCN1FJcU9PbWRoSlpFMXhzVW5i?=
 =?utf-8?B?cGppUURzanAwSGlhT1JDSCtJQnUwejM0dGR3OEVNb2ZRMTErdWVNcFJSdWxx?=
 =?utf-8?B?Mm5qdElQcHNROE9Eb1RjY0tyZnFhalFVUEtjTWhzVjdnZ2RHVDgvZUtJNEpk?=
 =?utf-8?B?S1RZUGxrYnFwMTFEMXN1UlJPRnhGNjA2UG9pWjhGNGVHZ1NtV2pJeUs3a1Ns?=
 =?utf-8?B?eEFjTlpxamwzQVJOeXRhU0xuQWxzR04rcDU1RnFvUnpSWDUvbGt1Qm9FQmU5?=
 =?utf-8?B?Z1BFTTNhUWtQNk8vcnVSQWI4NElXUkFpN0RpNlNlZjlsZnVLMjdKQT09?=
X-Exchange-RoutingPolicyChecked: uOPVtEs7/X/IouR1sGKdc3DlA3lgkqAtdviCL1EOUKWINuSyYN/V6daL2wNXMb/V9k/GvnjwjuPvFQpuIzGo9Jbj2BCCo5fDMaGMZNPIH1krY8k0A7+jyw+x2TxlLBij1bjJd24PUvec0CVAl88V4H6/chNa7ybvkjHE8xt/tE2bbcc57i8t9kV+FrFLDQ+ZJ8amJoH6r0X2ZEfRxIU8r4EhzjWHUQ/04vavs17fgO4nzZ/GIO/5ukaCVod5Bz2dz+nPloBPwstLobdgfgLJiDp7Jmcf3XDBj8p/7kEVQAqAJydchHGwhsM+vHf9090bGFXBW8l8wyDCFjvDpEKQmg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0b9283-72e8-4e3e-2568-08de99379c87
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 08:35:26.3747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /agmUoVSCVnkIgAgmWamGMW+cc0s09SvAOG+AfZqTpAH4kgSQaFk7gorZucY2y/pdnPBjXJAq9HdPTUGWOmUuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8813
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

Hi Tvrtko,

On 09-04-2026 14:22, Tvrtko Ursulin wrote:
>
> On 08/04/2026 08:50, Purkait, Soham wrote:
>> Hi Tvrtko,
>>
>> On 06-04-2026 14:34, Tvrtko Ursulin wrote:
>>>
>>> On 06/04/2026 07:04, Soham Purkait wrote:
>>>> This introduce support for monitoring per-engine busyness in gputop,
>>>> extending existing per-client monitoring to handle multiple GPUs, when
>>>> present, including support for multi-engine instances, enabling
>>>> finer-grained engine busyness reporting.
>>>>
>>>> v1:
>>>>   - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
>>>> v2:
>>>>   - Cosmetic changes. (Riana)
>>>>   - Avoid three level indentation. (Riana)
>>>> v3:
>>>>   - Add device filter to populate the array of cards for
>>>>     all supported drivers. (Zbigniew)
>>>> v4:
>>>>   - Add user message for running without root privileges. (Kamil)
>>>>   - Add support for GPU client-only busyness on unsupported
>>>>     drivers as a fallback mechanism. (Kamil)
>>>>   - Remove unused dependencies and headers. (Kamil)
>>>> v5:
>>>>   - Replace hardcoded values with Enum for driver number. (Vinay)
>>>>   - Rename driver_no to driver_num for better readability. (Vinay)
>>>>
>>>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>>>> ---
>>>>   tools/gputop.src/gputop.c    | 305 
>>>> ++++++++++++++++++++++++++++++-----
>>>>   tools/gputop.src/meson.build |   2 +-
>>>>   tools/meson.build            |   3 +-
>>>>   3 files changed, 268 insertions(+), 42 deletions(-)
>>>>
>>>> diff --git a/tools/gputop.src/gputop.c b/tools/gputop.src/gputop.c
>>>> index 9b2e8cb6f..479897f40 100644
>>>> --- a/tools/gputop.src/gputop.c
>>>> +++ b/tools/gputop.src/gputop.c
>>>> @@ -1,6 +1,6 @@
>>>>   // SPDX-License-Identifier: MIT
>>>>   /*
>>>> - * Copyright © 2023 Intel Corporation
>>>> + * Copyright © 2023-2026 Intel Corporation
>>>>    */
>>>>     #include <assert.h>
>>>> @@ -14,22 +14,71 @@
>>>>   #include <math.h>
>>>>   #include <poll.h>
>>>>   #include <signal.h>
>>>> +#include <stdbool.h>
>>>>   #include <stdint.h>
>>>>   #include <stdio.h>
>>>>   #include <stdlib.h>
>>>>   #include <string.h>
>>>>   #include <sys/ioctl.h>
>>>>   #include <sys/stat.h>
>>>> +#include <sys/sysmacros.h>
>>>>   #include <sys/types.h>
>>>> -#include <unistd.h>
>>>>   #include <termios.h>
>>>> -#include <sys/sysmacros.h>
>>>> -#include <stdbool.h>
>>>> +#include <unistd.h>
>>>>     #include "igt_core.h"
>>>>   #include "igt_drm_clients.h"
>>>>   #include "igt_drm_fdinfo.h"
>>>>   #include "igt_profiling.h"
>>>> +#include "xe_gputop.h"
>>>> +
>>>> +/**
>>>> + * Supported Drivers
>>>> + *
>>>> + * Adhere to the following requirements when implementing support 
>>>> for the
>>>> + * new driver:
>>>> + * @drivers: Update drivers[] with new driver string and so the 
>>>> enum drivers
>>>> + * with the new driver entry.
>>>> + * @sizeof_gputop_obj: Update this function as per new driver 
>>>> support included.
>>>> + * @operations: Update the respective operations of the new driver:
>>>> + * gputop_init,
>>>> + * discover_engines,
>>>> + * pmu_init,
>>>> + * pmu_sample,
>>>> + * print_engines,
>>>> + * clean_up
>>>> + * @per_driver_contexts: Update per_driver_contexts[] array of 
>>>> type "struct gputop_driver" with the
>>>> + * initial values.
>>>> + */
>>>> +static const char * const drivers[] = {
>>>> +    "xe",
>>>> +    /* Keep the last one as NULL */
>>>> +    NULL
>>>> +};
>>>> +
>>>> +/**
>>>> + * Supported operations on driver instances. Update the ops[] 
>>>> array for
>>>> + * each individual driver specific function. Maintain the sequence 
>>>> as per
>>>> + * drivers[] array.
>>>> + */
>>>> +struct device_operations ops[] = {
>>>> +    {
>>>> +        xe_gputop_init,
>>>> +        xe_populate_engines,
>>>> +        xe_pmu_init,
>>>> +        xe_pmu_sample,
>>>> +        xe_print_engines,
>>>> +        xe_clean_up
>>>> +    }
>>>> +};
>>>> +
>>>> +/*
>>>> + * per_driver_contexts[] array of type struct gputop_driver which 
>>>> keeps track of the devices
>>>> + * and related info discovered per driver.
>>>> + */
>>>> +struct gputop_driver per_driver_contexts[] = {
>>>> +    {false, 0, NULL}
>>>> +};
>>>>     enum utilization_type {
>>>>       UTILIZATION_TYPE_ENGINE_TIME,
>>>> @@ -37,50 +86,84 @@ enum utilization_type {
>>>>   };
>>>>     enum intel_driver_type {
>>>> -    INTEL_DRIVER_I915,
>>>>       INTEL_DRIVER_XE,
>>>> +    INTEL_DRIVER_I915,
>>>>       INTEL_DRIVER_UNKNOWN,
>>>>   };
>>>>     #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
>>>>   -static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", 
>>>> "▉", "█" };
>>>> -
>>>> -#define ANSI_HEADER "\033[7m"
>>>> -#define ANSI_RESET "\033[0m"
>>>> -
>>>> -static void n_spaces(const unsigned int n)
>>>> +static size_t sizeof_gputop_obj(int driver_num)
>>>>   {
>>>> -    unsigned int i;
>>>> -
>>>> -    for (i = 0; i < n; i++)
>>>> -        putchar(' ');
>>>> +    switch (driver_num) {
>>>> +    case INTEL_DRIVER_XE:
>>>> +        return sizeof(struct xe_gputop);
>>>> +    default:
>>>> +        fprintf(stderr,
>>>> +            "Driver object size does not exist.\n");
>>>> +        exit(EXIT_FAILURE);
>>>> +    }
>>>>   }
>>>>   -static void print_percentage_bar(double percent, int max_len)
>>>> +static void gputop_clean_up(void)
>>>>   {
>>>> -    int bar_len, i, len = max_len - 1;
>>>> -    const int w = 8;
>>>> -
>>>> -    len -= printf("|%5.1f%% ", percent);
>>>> -
>>>> -    /* no space left for bars, do what we can */
>>>> -    if (len < 0)
>>>> -        len = 0;
>>>> +    for (int i = 0; drivers[i]; i++) {
>>>> +        ops[i].clean_up(per_driver_contexts[i].instances, 
>>>> per_driver_contexts[i].len);
>>>> +        free(per_driver_contexts[i].instances);
>>>> +        per_driver_contexts[i].device_present = false;
>>>> +        per_driver_contexts[i].len = 0;
>>>> +    }
>>>> +}
>>>>   -    bar_len = ceil(w * percent * len / 100.0);
>>>> -    if (bar_len > w * len)
>>>> -        bar_len = w * len;
>>>> +static int find_driver(struct igt_device_card *card)
>>>> +{
>>>> +    for (int i = 0; drivers[i]; i++) {
>>>> +        if (strcmp(drivers[i], card->driver) == 0)
>>>> +            return i;
>>>> +    }
>>>> +    return -1;
>>>> +}
>>>>   -    for (i = bar_len; i >= w; i -= w)
>>>> -        printf("%s", bars[w]);
>>>> -    if (i)
>>>> -        printf("%s", bars[i]);
>>>> +static int populate_device_instances(const char *filter)
>>>> +{
>>>> +    struct igt_device_card *cards = NULL;
>>>> +    struct igt_device_card *card_inplace = NULL;
>>>> +    struct gputop_driver *driver_entry =  NULL;
>>>> +    int driver_num;
>>>> +    int count, final_count = 0;
>>>> +
>>>> +    count = igt_device_card_match_all(filter, &cards);
>>>> +    for (int j = 0; j < count; j++) {
>>>> +        if (strcmp(cards[j].subsystem, "pci") != 0)
>>>> +            continue;
>>>>   -    len -= (bar_len + (w - 1)) / w;
>>>> -    n_spaces(len);
>>>> +        driver_num = find_driver(&cards[j]);
>>>> +        if (driver_num < 0)
>>>> +            continue;
>>>>   -    putchar('|');
>>>> +        driver_entry = &per_driver_contexts[driver_num];
>>>> +        if (!driver_entry->device_present)
>>>> +            driver_entry->device_present = true;
>>>> +        driver_entry->len++;
>>>> +        driver_entry->instances = realloc(driver_entry->instances,
>>>> +                          driver_entry->len
>>>> +                          * sizeof_gputop_obj(driver_num));
>>>> +        if (!driver_entry->instances) {
>>>> +            fprintf(stderr,
>>>> +                "Device instance realloc failed (%s)\n",
>>>> +                strerror(errno));
>>>> +            exit(EXIT_FAILURE);
>>>> +        }
>>>> +        card_inplace = (struct igt_device_card *)
>>>> +                calloc(1, sizeof(struct igt_device_card));
>>>> +        memcpy(card_inplace, &cards[j], sizeof(struct 
>>>> igt_device_card));
>>>> + ops[driver_num].gputop_init(driver_entry->instances, 
>>>> (driver_entry->len - 1),
>>>> +            card_inplace);
>>>> +        final_count++;
>>>> +    }
>>>> +    if (count)
>>>> +        free(cards);
>>>> +    return final_count;
>>>>   }
>>>>     /* Get the correct sysfs prefix based on DRM minor number */
>>>> @@ -526,8 +609,31 @@ static void clrscr(void)
>>>>   struct gputop_args {
>>>>       long n_iter;
>>>>       unsigned long delay_usec;
>>>> +    bool verbose;
>>>>   };
>>>>   +static void countdown(const char *msg, const int start_sec)
>>>> +{
>>>> +    struct pollfd pfd;
>>>> +    int i, ret;
>>>> +    char ch;
>>>> +
>>>> +    for (i = start_sec; i > 0; i--) {
>>>> +        printf("\r%s%d... second(s)", msg, i);
>>>> +        fflush(stdout);
>>>> +
>>>> +        pfd.fd = STDIN_FILENO;
>>>> +        pfd.events = POLLIN;
>>>> +
>>>> +        ret = poll(&pfd, 1, 1000);
>>>> +        if (ret > 0 && (pfd.revents & POLLIN)) {
>>>> +            while ((ch = getchar()) != '\n' && ch != EOF)
>>>> +                continue;
>>>> +            return;
>>>> +        }
>>>> +    }
>>>> +}
>>>> +
>>>>   static void help(char *full_path)
>>>>   {
>>>>       const char *short_program_name = strrchr(full_path, '/');
>>>> @@ -541,18 +647,47 @@ static void help(char *full_path)
>>>>              "\t%s [options]\n\n"
>>>>              "Options:\n"
>>>>              "\t-h, --help                show this help\n"
>>>> +           "\t-v, --verbose             wait 5 seconds before 
>>>> starting client-only busyness in"
>>>> +           " non-root mode if neither CAP_PERFMON is set nor 
>>>> perf_event_paranoid is"
>>>> +           " permissive.\n"
>>>>              "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS 
>>>> [.TENTHS]\n"
>>>> -           "\t-n, --iterations =NUMBER  number of executions\n"
>>>> +           "\t-n, --iterations =NUMBER  number of executions\n\n"
>>>> +           "Running without root:\n"
>>>> +           "\tAs a non-root user, CAP_PERFMON or 
>>>> perf_event_paranoid is required to\n"
>>>> +           "\taccess engine busyness\n"
>>>> +           "\t" ANSI_HEADER "Steps to run without root (using 
>>>> CAP_PERFMON):"
>>>> +        ANSI_RESET "\n"
>>>> +           "\tcd /path/to/igt-gpu-tools/\n"
>>>> +           "\tsudo setcap cap_perfmon=+ep 
>>>> $(pwd)/build/tools/gputop\n"
>>>> +           "\tsudo sh -c \"echo $(pwd)/build/lib > /etc/ 
>>>> ld.so.conf.d/lib-igt.conf\"\n"
>>>> +           "\tsudo ldconfig\n"
>>>> +           "\t" ANSI_HEADER "Steps to revert once done:" 
>>>> ANSI_RESET "\n"
>>>> +           "\tsudo setcap cap_perfmon=-ep 
>>>> $(pwd)/build/tools/gputop\n"
>>>> +           "\tsudo rm /etc/ld.so.conf.d/lib-igt.conf\n"
>>>> +           "\tsudo ldconfig\n"
>>>> +           "\n"
>>>> +           "\t" ANSI_HEADER "Steps to run without root (using 
>>>> perf_event_paranoid):"
>>>> +           ANSI_RESET "\n"
>>>> +           "\t\033[32m# Save current perf_event_paranoid 
>>>> value\033[0m\n"
>>>> +           "\torig_val=$(sysctl -n kernel.perf_event_paranoid)\n"
>>>> +           "\tsudo sysctl -w kernel.perf_event_paranoid=-1\n"
>>>> +           "\t" ANSI_HEADER "Steps to revert once done:" 
>>>> ANSI_RESET "\n"
>>>> +           "\t\033[32m# Restore original value\033[0m\n"
>>>> +           "\tsudo sysctl -w 
>>>> kernel.perf_event_paranoid=$orig_val\n\n"
>>>> +           "\tFor details, see 'Perf events and tool security':\n"
>>>> +           "\thttps://www.kernel.org/doc/html/"
>>>> +           "latest/admin-guide/perf-security.html\n\n"
>>>>              , short_program_name);
>>>>   }
>>>>     static int parse_args(int argc, char * const argv[], struct 
>>>> gputop_args *args)
>>>>   {
>>>> -    static const char cmdopts_s[] = "hn:d:";
>>>> +    static const char cmdopts_s[] = "hvn:d:";
>>>>       static const struct option cmdopts[] = {
>>>>              {"help", no_argument, 0, 'h'},
>>>>              {"delay", required_argument, 0, 'd'},
>>>>              {"iterations", required_argument, 0, 'n'},
>>>> +           {"verbose", no_argument, 0, 'v'},
>>>>              { }
>>>>       };
>>>>   @@ -560,6 +695,7 @@ static int parse_args(int argc, char * const 
>>>> argv[], struct gputop_args *args)
>>>>       memset(args, 0, sizeof(*args));
>>>>       args->n_iter = -1;
>>>>       args->delay_usec = 2 * USEC_PER_SEC;
>>>> +    args->verbose = false;
>>>>         for (;;) {
>>>>           int c, idx = 0;
>>>> @@ -573,6 +709,9 @@ static int parse_args(int argc, char * const 
>>>> argv[], struct gputop_args *args)
>>>>           case 'n':
>>>>               args->n_iter = strtol(optarg, NULL, 10);
>>>>               break;
>>>> +        case 'v':
>>>> +            args->verbose = true;
>>>> +            break;
>>>>           case 'd':
>>>>               args->delay_usec = strtoul(optarg, &end_ptr, 10) * 
>>>> USEC_PER_SEC;
>>>>               if (*end_ptr == '.')
>>>> @@ -610,9 +749,12 @@ int main(int argc, char **argv)
>>>>       struct igt_profiled_device *profiled_devices = NULL;
>>>>       struct igt_drm_clients *clients = NULL;
>>>>       int con_w = -1, con_h = -1;
>>>> +    bool is_root;
>>>>       int ret;
>>>>       long n;
>>>>   +    is_root = (geteuid() == 0);
>>>> +
>>>>       ret = parse_args(argc, argv, &args);
>>>>       if (ret < 0)
>>>>           return EXIT_FAILURE;
>>>> @@ -621,6 +763,62 @@ int main(int argc, char **argv)
>>>>         n = args.n_iter;
>>>>       period_us = args.delay_usec;
>>>> + populate_device_instances("device:subsystem=pci,card=all");
>>>> +
>>>> +    for (int i = 0; drivers[i]; i++) {
>>>> +        if (!per_driver_contexts[i].device_present)
>>>> +            continue;
>>>> +
>>>> +        for (int j = 0; j < per_driver_contexts[i].len; j++) {
>>>> +            if (! 
>>>> ops[i].init_engines(per_driver_contexts[i].instances, j)) {
>>>> +                fprintf(stderr,
>>>> +                    "Failed to initialize engines! (%s)\n",
>>>> +                    strerror(errno));
>>>> +                    gputop_clean_up();
>>>> +                return EXIT_FAILURE;
>>>> +            }
>>>> +            ret = 
>>>> ops[i].pmu_init(per_driver_contexts[i].instances, j);
>>>> +
>>>> +            if (ret) {
>>>> +                if (errno == EACCES && !is_root) {
>>>> +                    igt_devices_free();
>>>> +                    gputop_clean_up();
>>>> +                    if (args.verbose) {
>>>> +                        fprintf(stderr,
>>>> +                            "\n"
>>>> +                            "Running without root privileges.\n"
>>>> +                            "Engine busyness may not be available "
>>>> +                            "without root privileges.\n"
>>>> +                            "See \"--help\" to enable engine "
>>>> +                            "busyness without root.\n\n");
>>>> +                        countdown("Resuming with only gpu client "
>>>> +                                "busyness in ", 5);
>>>> +                    }
>>>> +                } else {
>>>> +                    fprintf(stderr,
>>>> +                        "Failed to initialize PMU! (%s)\n",
>>>> +                        strerror(errno));
>>>> +                    igt_devices_free();
>>>> +                    gputop_clean_up();
>>>> +                    return EXIT_FAILURE;
>>>> +                }
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +
>>>> +    for (int i = 0; drivers[i]; i++) {
>>>> +        for (int j = 0;
>>>> +             per_driver_contexts[i].device_present && j < 
>>>> per_driver_contexts[i].len;
>>>> +             j++)
>>>> +            if 
>>>> (ops[i].pmu_sample(per_driver_contexts[i].instances, j)) {
>>>> +                fprintf(stderr,
>>>> +                    "Failed to sample PMU! (%s)\n",
>>>> +                    strerror(errno));
>>>> +                igt_devices_free();
>>>> +                gputop_clean_up();
>>>> +                return EXIT_FAILURE;
>>>> +            }
>>>> +    }
>>>>         clients = igt_drm_clients_init(NULL);
>>>>       if (!clients)
>>>> @@ -642,22 +840,49 @@ int main(int argc, char **argv)
>>>>         while ((n != 0) && !stop_top) {
>>>>           struct igt_drm_client *c, *prevc = NULL;
>>>> -        int i, engine_w = 0, lines = 0;
>>>> +        int k, engine_w = 0, lines = 0;
>>>>             igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
>>>> +
>>>> +        for (int i = 0; drivers[i]; i++) {
>>>> +            for (int j = 0;
>>>> +                 per_driver_contexts[i].device_present &&
>>>> +                 j < per_driver_contexts[i].len;
>>>> +                 j++)
>>>> +                if 
>>>> (ops[i].pmu_sample(per_driver_contexts[i].instances, j)) {
>>>> +                    fprintf(stderr,
>>>> +                        "Failed to sample PMU! (%s)\n",
>>>> +                        strerror(errno));
>>>> +                    igt_devices_free();
>>>> +                    gputop_clean_up();
>>>> +                    return EXIT_FAILURE;
>>>
>>> Imagine abstracting this all to a library akin to igt_drm_clients 
>>> and then both xe_gputop and intel_gpu_top could use it. Then the 
>>> step where latter would work with both i915 and xe could be very 
>>> near, all the code would be only in the new library and not 
>>> duplicated, plus, one day extending the support to a non-intel 
>>> driver could be quite plausible.
>> At present, the planned scope is focused on adding Xe support in 
>> GPUTOP and support for i915 will also be added in the near future if 
>> necessary. In addition, GPUTOP is designed to be extensible and can 
>> be adapted to support non-Intel drivers as well.
>
> Yes I designed it to be driver agnostic and so extensible. So I think 
> it would be better to continue with that direction and not make it worse.
>
> Specifically that would mean not having things such as 
> intel_driver_type, xe device operations, get_num_gts, 
> get_intel_frequencies, etc, and even assumption that all devices are 
> PCI, _directly_ in gputop.c. Rather move it to a library and abstract 
> the concepts.
The  frequency related codes are not introduced by this patch. Could be 
moved along with the engine busyness codes. Although I am under the 
impression, if moved to a library, there will be hardly any user of it 
apart from the gputop it self.  Would it be better if the engine 
busyness related codes moved to a separate source for better readability ?
>
> Then there is countdown() which is, well, novel, and a pretty verbose 
> help text.
>
> The diff of the series is quite bad as well since it deals with the 
> mess created so far. For example this patch removes some functions 
> which are needed and not added anywhere in this series. So the series 
> is very hard to review on it's own.
>
> And finally, but not least, it still breaks the tool for non-root:
>
> $ tools/gputop
> Engine query failed!
> Failed to initialize engines! (Bad file descriptor)
>
> At least on xe. But still not nice since there is no need to regress 
> that. Just make it access what it can and hide what it can't.

Noted. Unavailable functionality will be hidden, and the program should 
fall back to accessible features without failing.

Regards,
Soham

>
> Regards,
>
> Tvrtko
>
