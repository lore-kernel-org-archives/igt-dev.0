Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D71C79F9F
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 13:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A2710EB79;
	Thu, 10 Sep 2026 13:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U8EmxBZe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82EC410F46A
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 13:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789047203; x=1820583203;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jOqfPCfiOkIiSk//dgg8lintbgNohtw4ABMdMb1q/9A=;
 b=U8EmxBZezcgtfP6xZrnV6nCTZBIIGLvEr04oGhfN2Cv4mUlzRVoVsOaf
 dLW0G8ZgbPhKPUhYppHigYY8lY8INwJ/qUP9MbEGmH2S9eGXxiZZL5b3p
 dz21TcfukNUk9wRBThcZnXB/QrEHL1lGx3ApDtll+X40Zc608DdVtp12E
 4cT7KWj6pFdw8SGUfro4CBhdVSylb5eYO+JPRY5y7xaDmiC6DjFt4Qfml
 xUpZ+kFPxg9viIfxNz+lyidjNLBzMHsq5GGQ1LfnTiuTouisa8OJE/2Lk
 4puVembXZ0WHhbaBsZ2BMx5NoDyUZCSTs+9NUbQiccOPFHli0U9v0WDjn Q==;
X-CSE-ConnectionGUID: cEB5pQbER7GMN0gq07Xvjw==
X-CSE-MsgGUID: Uxj6rxOfSI6t9ql2FTcuoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89369470"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89369470"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 06:33:22 -0700
X-CSE-ConnectionGUID: zyc+pKeGSvy5mTDP/3bmXg==
X-CSE-MsgGUID: MLG78AR4TKObHJbaUy5QFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="2385"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 06:33:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 06:33:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 06:33:21 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 06:33:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=apBcR4u/O09wsTcwsbokhPtgE7vUW/HTFL2mvZF4IVF7UQvSEvfeYM2WObF7ffHnmk6YC5HTKMGmkKCIvh4/dcS8t7kWVaw27M2cyGtdaEAgaGS3vUkgaqCt6JC0efaAoKpkGi7WU4UNxutKIqabxggwYYSJd5bVw3jl/f0zX/DipcISMlEkc6O1BOOHWRj6WQZBEmHKKRmpPPj216T4ErjGl5QlMbEjTSfDJ2lkk/BP8mAf+ArKE2eGfOyTCy0TJo/U2tw7FWO+CMyX7Knelr/gckR8yuTUxvBGvxVjdrJHJrVDsVKlgXoh/3ge/9Z9VFPke7WyfjxEMjBIwbmMNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4SZ96fcpcCfTX5qYpw2izF93vakCmevv8sI5C4aVKw=;
 b=VkWLAVVhcwVpcpJiOYEEAjkDE+692Y9Hmd4APviVo7QrR8o23M/66f06zr9/KA2cgtugepKQKPjp9DFR53LS6/NDQa10PQzXLIiqotWjhyLj4hs0uQ9o26+w4b6+BIeg1W2h7Lm2RCqXIhpoKQFYyLHHjZ53sCtAMMu/iPBaGENIGWyMVq7e2BoGGyQoy++3sY4mS9I+gu7VCWNNy3ea5aKi/r9jmwrT5vxVxKlk3sLM6mokvNC5o+sYJsIE2W0pnmUd+uZIrMEdfeWAsf//UbHbMbtBWe1r7jQWz1hOX9ynRLYRxY/lEstZwg1gV9Ov4CqXV49yPstzgM9zCieLpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by IA0PR11MB7751.namprd11.prod.outlook.com
 (2603:10b6:208:43a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 13:33:12 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::9323:8d2:64e0:4c7b]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::9323:8d2:64e0:4c7b%4]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 13:33:12 +0000
Message-ID: <2999bd00-ef43-4f51-881b-81545e827a2d@intel.com>
Date: Thu, 10 Sep 2026 15:33:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] lib/rendercopy: Use the Xe2+ depth buffer packet
To: Jan Maslak <jan.maslak@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <zbigniew.kempczynski@intel.com>
References: <20260910123935.4183522-1-jan.maslak@intel.com>
 <20260910123935.4183522-2-jan.maslak@intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260910123935.4183522-2-jan.maslak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIVP296CA0113.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:358::6) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|IA0PR11MB7751:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff2cded-9d71-460c-9f65-08df0f400f71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|6133799003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 8SqI4UyPHKzmxWXfQCQZueiFW1gmtq8tI3UZsNY6xV1tAO47/pQtNF2B1azbJtDQGCWQPvNRl8oCdtyqYJn0+XwP+BG8TPSPHQ6KF6fDKA/1gAMKAcyOyCxgFy4rlcSqe2EXqN+yNsql7RIp58zHtfVvMrIc7LHpF8aEh9/xg8G+DSZuQP465bmaXrV37ntoWWClUjEVnR6nN8SLbG2Y5cAZW+qNVoe5h9hXjp2cORbHnizVU7YshKafhznnoswvNKWlqi5NijLyPQkkcl+bp4nIkC/rbdyIkh30ARSlvtg613x7UJmB40VEMiWbcq+/xQbqv123rr/q20erLq++VeChedAcncmDBaUZH2BORb2NsLZpUNW9D9qOqIIMnBiln8aYPm/EHivbGQJ+HgoSz0YIBrYYOclm096GSBQf2xg1U/oUqzADF1C2sAeVB+ZWkBx81Ms46LKPKd4Jop7IPzLGqC+0bDpUaQV7I1gmP2LuRZhJbgYnIkPMycC3XCGf/JitEBGjf+nCx39NlskPBOhBngbBsa/Nx1j0a+3SeHhWqhfsrwm0LVdiczwJg1PkxyzfuJN0XFMO6ddvQTUJY6LI9tBr2EARmLkTx8Cr/z8xYCmKc008kvHKypwfONmgNknF2hHimiJfsEMQjyL4lKPMhHzFBx9mpj8Cfz349Gw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U29vL29lVnBXZXZzaWFDdUJ0QVF0eUV3SlpvWnpRbnN0UzJRWkFRS0xTOTNk?=
 =?utf-8?B?R2pvUUJnamZGMWdURUpnQTN6bkdST3JqUnBMZ2RtT3JoZGRlQmxzeHJWZTJq?=
 =?utf-8?B?RHRPQXVUa3ZIZnpUcFVNR0RBR1UvMGlic3g1TU11VFZoUUlZRkNTSVlqd2JS?=
 =?utf-8?B?TjAxK0loYlk0alhTZEdZRWU5VUl3M1UwdW1iUGhUaGZKUU8wL1gwOUZyNkgy?=
 =?utf-8?B?NjZJVWxoYUJ5eGtiRGVJUzBabW1kK1VONnJ4WEt4T0tnTnFJVENLeXVMQzln?=
 =?utf-8?B?SHJqb2tDdVh1d2I5Vnc2V1NSY0c5MUkybVg1VktFRkVGK3pzM0lab0hNMlVL?=
 =?utf-8?B?WVlDZ2JIcDB6akJ0OFlUQkNhVDlZUkJTekVNeUV3Vk9keTdDM0YzSWw3b1VE?=
 =?utf-8?B?NzJLdHEwajlBVk0xYlpNeW5qTmZpM00xMnFlSmVWaEJiVXJNSjZtZ201NFVM?=
 =?utf-8?B?aXNZNmJIc1NiK2tjcGVYQ3pJZGNIL2w3djF1clY4U1Mrb1duYTBoYnNSQTNL?=
 =?utf-8?B?NWc0c21QdlcxR2Y3WFNKUEtLRGhiZTZpRzFZUlplM1hXdXdmZnNzdTdCbVk4?=
 =?utf-8?B?QWlpTzJTL0FseWx0MStobTZVbkd3RjdQMmxsMGhXTkxISkZRbVRnY0JyT29F?=
 =?utf-8?B?VnlwOUZySXlCMlY1YUpPVUsrTW00SlBnc2x1cmtjR0JzSjRwM3JBREdIaE9R?=
 =?utf-8?B?aElpcjhvTGduT1VHMzZ4K0FHYjByd2VJb0lIc0dQeUx0U0UwZFlaUUY5TEc4?=
 =?utf-8?B?V2dJc1drVUs0MzliVDFvQUMrVVlQMHNub3RneE94MnJHdXVlOWJTN3VxWURQ?=
 =?utf-8?B?b0tOMHVZeWx4OEZJdEJ1MWs4Z1pyejgvdVlUYmVxWWoyZU9yU3NvNjZLSmJ2?=
 =?utf-8?B?Yy9EemswZ1hmS0F5OTdwOXErRmcxRVM1dmpTMHhwZmhleXVUb21xWlVCRFBG?=
 =?utf-8?B?RTZPZDFmWXV1cFNGY0p5UzZzcVJBSlB1ellrRENaQ0hqTWI3dmdZOXZzV2ZD?=
 =?utf-8?B?ckVKdkNRMDluQ0JMMDJHNjlJSm5tQ1dDRC9UWmZPQWUrZmI1d3ZtZitBekRk?=
 =?utf-8?B?MEpyOXNQbitaTU54SjlLRUo5dENSaEhJd1RNRVZnalpTRGZDQXdsdC9OT1Vr?=
 =?utf-8?B?OGgvdU9ab1J4Q2x0TnhwR1RjVWpYKytBMTJSUnB2cTRETTZwZ0ZOek1jN1lh?=
 =?utf-8?B?UkNLZTJNdm02SkhWUW9JV25YY2I3dmwxYVNXMnRMTXZmdGZzbk1MbC9aaU1o?=
 =?utf-8?B?eHZ5WWdiYnlNbEt5am43UlFpdHA3c0VweWFzYTFXR0NxOVIyQ2JTS2RIY1NB?=
 =?utf-8?B?WFB2Sk5kNzZWYWhGRmhkemNGOGRQdENURS9ZRnh3KzMvTGdkR0MxVy96RDdK?=
 =?utf-8?B?SDlCWmswbkdPTmNuSTBEVVF3UGJjQ1g3SUpzVkIzbDJ0Zmh5c3hHWGswSTY2?=
 =?utf-8?B?Yk1aejVwT2pZVWw0SFFtQVE4bGthVWlOZHl4ZldqYUZUWDFybmk0UXdIeEM1?=
 =?utf-8?B?azlTRzA1YzNQYXZiVGU5VitCNEY3RTBvNUpWVi9DMVhQT2g3WThmYTVPVWxO?=
 =?utf-8?B?c3VSZUtsMUN2bzh6ajhTYWFpTGwzaEtWTzczYTFHU09FbGhWTHAzMDJsUkRh?=
 =?utf-8?B?OTdqcXNyci9mcHdBSkRjb3JuU1E3K2U0akdJOW1FMXh4Wkt3MDExc3hKQzNh?=
 =?utf-8?B?YUowM2pxQ1JJNFFqQnh0THhMcHE2bHhQZm81OG1kZFovVkMwc2lmWmFuR2lF?=
 =?utf-8?B?T1FzSGV3WEM5dDA0Y1gxWFFBQXRmSTJlaDRlaDhmVzI2THBocmhkTWZtTjNm?=
 =?utf-8?B?QXNFT2UvNWQ2VHlrNGFlaU1YYWNDT1ROejNaVDYveVFuRVc0WVcrTlhuYnJz?=
 =?utf-8?B?ZmgxZXIwa0hKWFBvdm1Tam5zblpVeFFvQVdLd3lvbzFKbVAzZzhwWHB1NWJj?=
 =?utf-8?B?SDQxc292elMxQjJTN0s3eW1CeWVjWTNqMDh0a2plNnBGRWxnMTVVd0FVWThl?=
 =?utf-8?B?ZWh1TUpYbU4xK0RxcGFYcXdoZkI5SVJSazk5MUZ1S0JiQ3RJK0xPcHRuRkFa?=
 =?utf-8?B?OUFoVmFmVzVJUjBCZWhvbUJvbGoyQU9Ici9EcDdmU2Q0L0ZIR1BYb09UTmJF?=
 =?utf-8?B?bnBJOUJMVmtsdXJ0SFpIUkV5MnE0TEU3VG14ODhKVHJaZDVMQm1NQWQyL1RV?=
 =?utf-8?B?aW5PS01TODNIVzE5ek5nNVE4OGtZdjZzL05CYzQ4d0tnc0dsRjV5WCtNQ2Rr?=
 =?utf-8?B?eTRVNEJFTEIxWm5TR1AvTVVmT3h1d2pKaFR2MUdQdlA3dmh1dW1qWkVxR0Ns?=
 =?utf-8?B?ZEU4eEEwYWk2SkFxVGdNeW1SMHBpZ1NGUVpCWVRpOVF5aFVSdmhRZz09?=
X-Exchange-RoutingPolicyChecked: JOHF7RBl2ZVCHRuxN5WgnEgE9i5f0mPI1X9pYfnwN/oU69cNpJeQSbfRwqRHfYfL+dxmUpnWjnz7WJAy8H9fklPL819XC4n3k87/Ok8vE/JDzygf0E4NW0YJ14a3OWSIgFp4OWm8LIR7kL19Nhoxtlx7FiuTD64rx3grc+LrOFTxYqNY44HWJ3dr/bKOPikEQpY8ykmFxZCXerhDlXlxX0y3ZhLUfvVi6cJ6il9cXKRJ4Z3PzJAsc49ugGjU9x+VGBFJYdNBaaaGUmUdu2GR/eBuUuxORRRTEF/d/tcIvAUciY2k57+x2bK22U70INlOegp9O3ioQl0hM/33GArLuQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff2cded-9d71-460c-9f65-08df0f400f71
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 13:33:12.4845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5Osk8THVz+j9qwUwLyZBby+zbu9NWeCBY3P98FoQ5G1zFPF91ZIw3dbIcrn/al9eBhAO9LRFSGfTE7uNjyoOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7751
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

W dniu 10.09.2026 o 14:39, Jan Maslak pisze:
> Genxml provides a dedicated 3DSTATE_DEPTH_BUFFER definition for Xe2 and
> newer platforms. Use GFX20_3DSTATE_DEPTH_BUFFER on those platforms,
> keeping the existing GFX125 and GFX9 selections for older hardware.
> 
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>   lib/rendercopy_gen9.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index 31913badba..d3f793fcc3 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -1043,7 +1043,11 @@ gen9_emit_depth(struct intel_bb *ibb)
>   
>   	igt_genxml_emit(ibb, GFX9_3DSTATE_WM_DEPTH_STENCIL, wds) { }
>   
> -	if (HAS_4TILE(ibb->devid)) {
> +	if (intel_gen(ibb->devid) >= 20) {
> +		igt_genxml_emit(ibb, GFX20_3DSTATE_DEPTH_BUFFER, db) {
> +			db.MOCS = mocs;
> +		}
> +	} else if (HAS_4TILE(ibb->devid)) {

Hmm, you have dropper 4tile check for xe2+, is it intentional?
If yes, please document it somewhere (commit message).

Regards
Andrzej

>   		igt_genxml_emit(ibb, GFX125_3DSTATE_DEPTH_BUFFER, db) {
>   			db.MOCS = mocs;
>   		}

