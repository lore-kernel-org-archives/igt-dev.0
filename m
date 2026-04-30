Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7689FF886F
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 04:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6956510E08B;
	Thu, 30 Apr 2026 04:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eRGR1wWj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C2410E417
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 04:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777521992; x=1809057992;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c3rUxxduSYWTOCYr+Gd+PCYLJjeTM/0F9y6AEqRy1Pw=;
 b=eRGR1wWjMpEa4DLiPE9iW52yo6+48pvXcPM2Vmdgp/j4pNpasMsnoDiq
 b8UwBy5NQfSYlXwcTRQD6yRBsRSlK4OC7ughA5Pi/w2r9sykkEx042C5J
 c+7AFEvsKHpThOdf7yaNt8ycgzgbPPeWS0KKQRmzzK088QRMAfBATPCEx
 +eSK33nRuDfUSovfUIHAy1kOS5f6s5DgjkmJWjZEEilnOWUBI1guyPA/M
 pX20Ely91g6ljwkKpYEOT7KjzV2pZpoKrAmKmaGXPeOthqXoOcXJ10cYo
 TG0EKKVNn7iYfw0NYKsr7jefgx6kc2dbn/uRwViRPeyQjNFl6EYvYx5q5 A==;
X-CSE-ConnectionGUID: vK4Eku95T8mKsn88TXy/pQ==
X-CSE-MsgGUID: ggTQtcm0QO6L0RdD7s3XaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="81036913"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="81036913"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 21:06:31 -0700
X-CSE-ConnectionGUID: FbO+J23MR02YoLA1fBLTCQ==
X-CSE-MsgGUID: VmW/BudrTH+xBB10sNEMYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="231322420"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 21:06:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 21:06:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 21:06:31 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 21:06:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMUWOwXt4xO4q21PZLhUGtGTJcatiq0O276M/kMrncbu25y9tj2DjNl7qYuPNJGH0FjtpNCRi/EQ9Cg6edNT7EFdUjRGDLy92sytYfA4fH3DT7NaQy59RTLw9J8MDidC4IX2kvXy/tkOGx64YupuEI3NKx2OrvvL6eTTVsli44MZO2dHj/znlVUnG3fV0fypBQ4dSKPRt8LH5pcK/nBaonrfT3P9nJLArHI9Q/Y8E2z490ClbgEq3oOF3Dy1H/JNYjpopzjbs6FboXZWaGVtSWMGTJgVrEa+oyR9zzet4EkgvEKCzqriphuwOimU5V+30eNLvseL8YBSIh1X22elGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FGj3kfYfB7UDK94xK6/W2PvjnaKp/UNUkPjHBR+9a0=;
 b=ORIzArXbjfEdoSjPasJ5lVoR2tp4nkc9cvVPLAnt0cd8phs4bdb6gPT8jIHGvdxwhtcXkW8hIk/qSr25SqfSAHS76r0g/6GTYREzAZhvBvHznK0LeOmPl1yeWbXgUe/Z2QaOHsKYBUi8uZB0TDcngIy++EIVyPpcAoTB3aSvRYjUAbNUTJwKKaARIWmEupplW9jgVu2W8JB/rRdPG1gS4/RDGoqa1Y9EwWyVQL9/XJFhhVksjUu+hPfrnbLkajb2r5cqGE8oy+++Fdb2qeM9QFotiuldDzzz2/GSvY6afIEKcr8I0P6d8Z/o1tw5RVu22o6DhIznN5QmGv4lrihrJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 SJ5PPFC4905B1D0.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::855)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 04:06:23 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 04:06:23 +0000
Message-ID: <73443285-c687-4d91-8fb0-18f545f66e0b@intel.com>
Date: Thu, 30 Apr 2026 09:36:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 11/11] tests/intel/kms_fbcon_fbt: use common
 routine to skip tests on fbc status
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>, <jani.nikula@intel.com>
References: <20260416092559.88735-1-vinod.govindapillai@intel.com>
 <20260416092559.88735-12-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260416092559.88735-12-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::10) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|SJ5PPFC4905B1D0:EE_
X-MS-Office365-Filtering-Correlation-Id: 403930b6-6394-4d7c-264a-08dea66dd7c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: kcX+vZj4Ibb6En6bpLvngKkMp/zix8f49l0KUNDC7cqjSXrlE9iUOB3cLpfFS0pUW2WSErezty9DdbBQ3T55xohJ9Jl2qUEPssf8WyZALweEZBGz131SGZeGbPCLF//toxoxSpco9omXzSYipB0gPvSf/2CJpIgUqX1ChXdFKaAa5CeWVGfa7ao0x8JNJWlDaeEkFPHO8IgdsFLBr7iaz6wilwKruO53gPC4vEu9ydUmijUQDVManiLnDm1UHn61LbFrDSmzpJ488vHUv3tDNay81J9uD0/BqReHJPYMnfZea+6m06e6xQ/EPsGEE096uvTfnHU/FuAGKByxHmgKIje17cIkWBA6oaQVYOvsMY0kyxRh+bZFQZj0MH/oKZ5lirJnxxi7bQvxIYez+mw6fM6fte1nWU6sMrpyUjheq6mXne3iAxyigjRU07/nfb2wN/rNMTBI5oiXf2yxX29PhvD+QmXYP5U8neJScu89OL5nXXoIc/9NNct9S5EDr4qmLybkdkLG7Q/Uc8/ZV0fTHBCLAT3QYi890A3gTDlMPcpiObQ7RUgCeOASseM4M9ddJ/4qgLnVuRBnttuZFu1ru/4vAZfny+libxzPgLAgGpioNaDLLjSOcgsceViBwZYsvfj7RMw1jgac35ROOZzpJNjsNetGMryRckmz8plIGHqZgbNmyIhDCIBKBf+GGwLTOYI5R5R/yyjv6/Gv3iCXQtrX1IWOEZFMzTrjVGhYJG4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmtvL1d0TlFwamdySlRmeUhoRW1tSjl4aW1CeUVBbmI1ZnRIdWpVSTdVTXV0?=
 =?utf-8?B?akN6am9FeDNPeEFmRDl5Y3R5QWpLL000dVFuYWFjVG5vRG5qRUxDa0ROVUpw?=
 =?utf-8?B?TlJFd3FtQzcxODZDNHJsWFNuVVNXV21mMlIvMGlYd090SWZJZ1JGTnBvcEpZ?=
 =?utf-8?B?czJZQVg1V1djUlNTQklTMnhWWUtEUjU2Sy82dE5jNzZDUDRuYkFtNVFNUk1B?=
 =?utf-8?B?andLWGZsS2xJZ3RmazBEVDRYWGx1V1R2bDdnd2NXN3oxTisvL1puWk00MVJL?=
 =?utf-8?B?SkJ1U0JVeEZFc2tMZWFKS3dKcGxGaG1XWUZhKzlMWjRSdnVBbFBnZUZrUkhQ?=
 =?utf-8?B?ZTh2SVUwWTQrYm53cnVPS3loN0xMcVB0UEI2T25yVzFid0Z4WTR0ZGVNYlJi?=
 =?utf-8?B?cVdqcVJHQlphTU1KM0s1a2RZM2NhTG56elNoYnUrbXk3WTFxS3lBVXA2Q0c1?=
 =?utf-8?B?cDVTTjJoS1ZKNWxkdm0xc01OREJHUnFjOFFiWHBSWi9yVk9tNHVJSi9DM3RC?=
 =?utf-8?B?aDZSaUpmV0tnRy9vRzI0d0lyTC9Ec1ZSeWxML3NYSzZtOU5hTXcwR3pZVExu?=
 =?utf-8?B?SDRKdUkrR21tcXJuRjhkeEIxUDNrLzFzOGlJd2ZQYk1KV1IrditGeFVUekJJ?=
 =?utf-8?B?NHFXQmRJMWN5SERWOUFsc0J6UG5TSVNwbUxhcEJoOHdoemZMNjBoNzdNV2Y1?=
 =?utf-8?B?TjE1d3hQSHVmalQzT2hmRHNpYi82b1J6eEExMzFXMnNvdExGeXJiaXhRQjJq?=
 =?utf-8?B?SjdSZklvcFFYVzY4MExMbHFUQ0l3OVNBTi82ak54ZnlZbnh4RXBLMDh2aytQ?=
 =?utf-8?B?ajFCS1h2U2VrWUFuNS9QeWN3blBQYUQzY1hQU3FjcW16L2R6UjNSci9VNzRi?=
 =?utf-8?B?QlNIdWFrc011MmZWTXd1eUZDdGRNSEh6TjFNeW9WblhZUXRTOFNKbDM1aWUz?=
 =?utf-8?B?SW5uWDZvUktGc2M4M0U5VVdCUGwyNmR0bzJPeHNyaUIvZ2JkSHpQQ043a0hR?=
 =?utf-8?B?NDlPVnJmQlJEVFFvNXNDVjczT3pFdHg2czNmVG95Tk85VmV3OGMzOERUdUx0?=
 =?utf-8?B?M3pVZks4blJESUpWYUhXUEJwaFlmUW5wSEZTeDZEZ0hFM1lmMkhpUzRuTC9H?=
 =?utf-8?B?RWk1UlhCY3pFb3c5Wi9VK052cGlob2V3OUF3MkRTVjVFenV2Q04xZVNsRGo0?=
 =?utf-8?B?bEFLdWhFVTRId0dCVThCRkdGMHNWNjNuU3RWL042NmdZelVKVWwzQjZWMGZj?=
 =?utf-8?B?a05QNG9GTmptU0s2UldzNHhjc1k4UWZKTlE0b1g0MTFJY3JyTzBHUjhTdUhh?=
 =?utf-8?B?RDFScGRDRWlNZExVeTUwWW1ZNVMrbHU1blRYb0VnSW1hU2ZsbTZya3IxdXJQ?=
 =?utf-8?B?dTUrYW5kR3h6VWdBdjZEZFVlYUoxendST2RrY2pNZG1mWkY5ZXFvZm1DbGpD?=
 =?utf-8?B?TzdCNDhKcVNrdjJCZnU1RDNLS09GeGoxTFkrNHhIUG1TeHNTcHpLL0NvZldj?=
 =?utf-8?B?eVVNZEJaVU4wZU5kbHFiM1hQSDc4REpnVUpOVy9pTWV2RWVZSWJ3Ym1TbU5x?=
 =?utf-8?B?TStNTGZES1dHRE5oUXNrQlVZL082MW9ZTWFhZGR6ZUlqUEpJR3ZZQzZJbGI5?=
 =?utf-8?B?MjhMaVBkcWU1MmZCRldEbmx6eDBKYmU5Z255VXROSElmNmN1aTQxK0V5cDFC?=
 =?utf-8?B?clhKQ1h0MzNwM0RGM0JpOUw3aWtrU2szZnpEKzU2TnQ1OXMraTdjWEZEdHU3?=
 =?utf-8?B?NndrSE5lQUJ5OW1VelZGY1ExbHhqWVZFckk3MUxwRlZQMklqVDBGOUNOdFFN?=
 =?utf-8?B?ekh5WFJvQk1ZZDkzaTNlVFpLYWphWUZ1YW0xcUJNS3hxczJldkp2bzJoV3Zj?=
 =?utf-8?B?MVlYYk9HU2V3eUdDUG9USnJodVNXL2ZwVzE2ZGMxR2xGc3ZRaUtEdWdFWk1H?=
 =?utf-8?B?andsUklzektLOGdHQTdZcnIzR3BlR2xMblpjNWxLZHBxMUZoZ0lyRzMwaDA1?=
 =?utf-8?B?bmxmNXVaamJob0xNdHNzeXMrWFdkRGdhVzR0L3dRRUwxVlRIdnVmK2Zicmta?=
 =?utf-8?B?cGZmZWpOem1XdzBmd0JnM1RoNTVYcS8zOTJNc0twNlpiYk9kTjcwRG1pb0VP?=
 =?utf-8?B?QjFwWW9Xc3NZcTFaTnpFZzFGWm9pcFJpRW1neUQweDNOU05IREk0TjgzbTJD?=
 =?utf-8?B?RkFtTis2cHMxVktkUkI2bzhaTGVEVVZhVjF4V1ZjNGFKWTNhdlJ4TkZnY3U2?=
 =?utf-8?B?NFhUWmZoZytPWWxMMXdTaDJBQUFnb0ExamNicGExM2lXZUxFTjFXd3Z1bDRY?=
 =?utf-8?B?dk03NHc0UnlzTkxjRXk4ZkdYQWlTTU0rVkNrbVlDM2IxeVhrdlU4dnY3RGI3?=
 =?utf-8?Q?Ij6UMYjCvl6avebDm8yDwydurB+y10ea5O9Mh?=
X-Exchange-RoutingPolicyChecked: G8Q2eE++zBaHlj2dRwZ3AFa8ZDV5ny+P7q+KAwio44fw8iRccBgBmzJ3FZ/YOMOwAEBP+xf+i/OWyTQq02NwSN51hrbmZCxpWZXpImf1+E+DcNeVqWgDigs6XT1fL3zsYrhLQ85NgyfJEkOkDTbZDO2gtXREKsBsirTcSthLP+M9sQpxiHn5PRoB+s84Z6yZ/e3mcdnifL13vM9lc9QX1lCC3dfPsPQDvzDD7UiAAAnNeuZDBpOsjgPVKf043XPTI1VWXnCWWx4WgzrUhbYgi8y8nHwwKGBbfoR5qoI5gyfai6D4fgF06S2MWJmY34jGE4mR+U2hwr/I+9RWzJVARg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 403930b6-6394-4d7c-264a-08dea66dd7c8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 04:06:23.6044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6BpSUqcxfWDjKJsjCOnoqrLSpMcEG7OeMQjtlt8NOiUnRBdJF4k9KlRhodjX9x+tYe/egDEpboXJb3t8lZ1Su7766LefR8jY6YIHRwqU+W8lwbdKzZc8sCykhztrRQd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC4905B1D0
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



On 16-04-2026 14:55, Vinod Govindapillai wrote:
> Use the common intel_fbc_found_skip_reason() defined as part of the fbc
> library functions to check and assess the fbc skip reasons. The "no fbc
> reasons" are appended based on the reasons defined in the kms_fbcon_fbt
> tests.
> 
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>   lib/i915/intel_fbc.c        |  7 +++++++
>   tests/intel/kms_fbcon_fbt.c | 26 ++------------------------
>   2 files changed, 9 insertions(+), 24 deletions(-)
> 
> diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
> index fde9ef03b..30584925f 100644
> --- a/lib/i915/intel_fbc.c
> +++ b/lib/i915/intel_fbc.c
> @@ -77,10 +77,17 @@ bool intel_fbc_found_skip_reason(int device, int crtc_index)
>   {
>   	const char *const no_fbc_reasons[] = {
>   		"FBC disabled: not enough stolen memory",
> +		"FBC disabled: pixel format not supported",
> +		"FBC disabled: tiling not supported",
> +		"FBC disabled: rotation not supported",
>   		"FBC disabled: stride not supported",
> +		"FBC disabled: per-pixel alpha not supported",
>   		"FBC disabled: plane size too big",
>   		"FBC disabled: surface size too big",
>   		"FBC disabled: PSR1 enabled (Wa_14016291713)"
missing ',' here.

> +		"FBC disabled: plane start Y offset misaligned",
> +		"FBC disabled: plane end Y offset misaligned",
> +		"FBC disabled: pixel rate too high"
>   	};
>   	bool found_reason = false;
>   	char fbc_status[FBC_STATUS_BUF_LEN];
> diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
> index f738e243f..470027a84 100644
> --- a/tests/intel/kms_fbcon_fbt.c
> +++ b/tests/intel/kms_fbcon_fbt.c
> @@ -297,30 +297,8 @@ static inline void psr_debugfs_enable(struct drm_info *drm)
>   
>   static void fbc_skips_on_fbcon(struct drm_info *drm)
>   {
> -	const char *reasons[] = {
> -		"pixel format not supported",
> -		"tiling not supported",
> -		"rotation not supported",
> -		"stride not supported",
> -		"per-pixel alpha not supported",
> -		"plane size too big",
> -		"surface size too big",
> -		"plane start Y offset misaligned",
> -		"plane end Y offset misaligned",
> -		"pixel rate too high"
> -	};
> -	bool skip = false;
> -	char buf[FBC_STATUS_BUF_LEN];
> -	int i;
> -
> -	igt_debugfs_simple_read(drm->debugfs_fd, "i915_fbc_status", buf, sizeof(buf));
> -	if (strstr(buf, "FBC enabled\n"))
> -		return;
> -
> -	for (i = 0; skip == false && i < ARRAY_SIZE(reasons); i++)
> -		skip = strstr(buf, reasons[i]);
> -
> -	igt_skip_on_f(skip, "fbcon modeset is not compatible with FBC\n");
> +	igt_skip_on_f(intel_fbc_found_skip_reason(drm->fd, drm->crtc_index),
> +		      "fbcon modeset is not compatible with FBC\n");
>   }
>   
>   static void psr_skips_on_fbcon(struct drm_info *drm)

