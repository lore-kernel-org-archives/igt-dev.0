Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6E3E9DE62
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 08:13:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3964F10E75B;
	Thu,  9 Apr 2026 08:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ArW6JHRg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97D410E75B
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 08:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775722375; x=1807258375;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=DPCNZpPGdOSQT1Vg5RIq8PW+/MA/k9TGOBKWdijG/kQ=;
 b=ArW6JHRg2fx/JC2mqEL7L12akdzmOcAGDUm9FVZSY3oroiRt6J2PoC8k
 DeBmOFMV6CWLI/ifFrqi5tMLvIvNYoPRWqQIDESd3o1yKiwCkkM8h8FFm
 vSifPknrC6biYQRN0SBNpemYW1cFjTRc9C+bSrX0Pox6ByevuX9kOSItY
 5U7fN/r3o9nGSJjZ8b+moCTCTxe1VbLfmAn+MuF7C9wT9vZgJeOWwHxRu
 xYuxEyDmALejVqeOXXy/AOHswqlGSyvGvffWtuQd95HSbg9xqsihQNVOx
 Sk8e+tNeOecJ3iWE1vkvcZILdmIOu/XGLv6Q5cWau0f+Kjh+Mv+SiyYZ8 g==;
X-CSE-ConnectionGUID: pMJznPu+Qnup1yzTI8etkw==
X-CSE-MsgGUID: ov0QeOAETRuJQYSje94BdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="80314452"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208,217";a="80314452"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 01:12:54 -0700
X-CSE-ConnectionGUID: BwQly2IyQvOBK20u+MFl3w==
X-CSE-MsgGUID: bfXpJj92SuKgcc3m/RjDcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
 d="scan'208,217";a="252031390"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 01:12:54 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 01:12:53 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 01:12:53 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 01:12:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3LX9Y5hYTU58gKZZ/mHeaPHJkVie05Ucl07vwnHEHCV5UUdBzYIBZsuG3Wa6vrqkURIhF9WL292K67cv1Yl5DTIjqVf4Eyvw4ahtdtYo6WXZGYKHdgqk11AOIK5LWp2qQ1S7lRk+u/L7exIMZfTDlUuZ5CTvxiA7wK0NxNu4Jub2w4rg0XukdTgR3bw9MCSJ3cCOhrAX+aLDn8WPbG7ARd6gYbkCvC4tzNo0H4w6Eum8HwLmpsiwmXZ8wvs35FxtywLqaFrE7dAxwHkLpYO4Oc4DWW1hl9YKFMG1sKy24wsm18YA2uTOCytVg2HEO9i9nF6agIYyYtLKlk2qdq5xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lwuth8T/CnO1m6ysyT61bqcqsF2SwKE4cPEnHP6r0r8=;
 b=dh7twBx+mmS9/u33lHzGzOfM5KZjmQe+DhNP3g86ZvJ0AZaP5WWRyJ53p7qVS2y7hksD8y6ubg8Zk5yMZ/+VtYgAYdreV3Ad52btlzPm1vZjiN9Ldbucmhq39C56t8spTmh3Li62dzzck99RTyTT10vej7zgTA0zXYJ/p9xCuXt73mLMnXnWmj7XQC0Yp4FFWAFodduSiNSsQPeWgTZVotsMo/OVbQkRMjT1gCWmDiwj/gzk5+wTB1Q/UmfmJFI/nUSfsteQkj0msTQsFJovairIeBVNiCtMVNdzytz+OXaEaCoKPFsHZX2Zwewn0fCo+IejMxUtOLFbeU1DwOeABw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by DM4PR11MB6119.namprd11.prod.outlook.com (2603:10b6:8:b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 08:12:50 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%4]) with mapi id 15.20.9769.041; Thu, 9 Apr 2026
 08:12:50 +0000
Content-Type: multipart/alternative;
 boundary="------------N1L1tG5K8ksGPONTokrXeSWj"
Message-ID: <a7e9768f-50a2-4af8-9334-77f4c18ed984@intel.com>
Date: Thu, 9 Apr 2026 13:42:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/4] tests/kms_vrr: Add new test for DC3CO
 validation with LOBF
Content-Language: en-GB
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <dibin.moolakadan.subrahmanian@intel.com>
References: <20260304043805.572087-1-jeevan.b@intel.com>
 <20260304043805.572087-4-jeevan.b@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260304043805.572087-4-jeevan.b@intel.com>
X-ClientProxiedBy: MA5PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::6) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|DM4PR11MB6119:EE_
X-MS-Office365-Filtering-Correlation-Id: 3608f427-1609-48a3-ea63-08de960fca87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|8096899003|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: R4nKBTQRGS75ThPgXuB5c3deaIEE8Z/xgljtPr3rniaWm+S17zVQLZxxISbhQUwRKXGND9OzzdZp4OM0+/GUJjrG+kceh2rutcT0o1RmNvyYFGEi9bGt88evGKGuj+SJ6CIWU9hpwm5+SlMEQg/AxOHWANkCvIcEAoppSg8pvXYb+VV4xYe41Lq/Mxdg0NcP0xI5e6jNjmoJPca9aT2YoSN0iagcMNBqzWBEZOVYFaBPWkfhqTU/qkBKMsON+JXEC2VhDEFhn//qH0wtSoQCUFK1uYK23sPrIiP105MK2lpXcYmSMeeDyiakncIj+gM81Z0EAXzBTAVUKS6nX5Fs8xdrvbdvaznmXI0I0SRG2GoM/W7cbfbGtyGvz1GptBkY9rSgyUQCAaT8vTuIqhKfJe7QC/t92wRininU11OuLLlLVN6kU+vfXNMe6k0cj0+SXm6FbLVbkqASUk5Q3TCbagbMUcIgCcGIWvtcs3ak1GGp7mbRn28PQuhwvAn2KXYffEAK7Cz9MXAww6Aq88Mfs3YU5LOX87Kvd9bFu9wyBVSlx+QU65w4U9YDslLGP1YHJsM14XUquHI+qaAVas7bx2gFgNJovnuQP21AhvDFLw2quGQaBC3p0mV3QAO4O6f2LZ872Q/41SNAVt7XapjIvEJkt1qDAOcarDiU5vFQ1tgM8Tifj020UjaEfLsHx/bD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(13003099007)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QStLbHZWa3FzS21qNDFBbDRhQVhHcmxzQWlxbWZTTklLWXd5M0l6QUpiSGIw?=
 =?utf-8?B?Y0l0bFRaN1NvTzBUNTduRENTTVMybTNJci83WGZTUDNaeXBvNTFxY2Q1QW5z?=
 =?utf-8?B?T0duWTVyaWRnR3E3MDJsblZTa0cxcDViR0ZnbEdVNzlWNy83QkRNY0czRXgw?=
 =?utf-8?B?dFlZUzdLZHFFdEdrSlJJVitNaW02NjBDSHBZNGgyaG5jQm5yWldmY0JBdVAy?=
 =?utf-8?B?d2NQR3gxZ0h3ZGRUZjdkL1ZRVjdHakdWcTlqWUdpZmlOa1JxRzR1UFh0RS9P?=
 =?utf-8?B?OHJNejBYb0xBRjNzVVFBbkdvUDZzTGhSN2VmaDJVTHhMSUEranNRV00zTnp1?=
 =?utf-8?B?aDB5TnJRZWtSeGh3ejgvakUrakpjNHByUWswQk0rRmdhZ2VHaHVPMUhya1ov?=
 =?utf-8?B?RzlnL3pwWHA1RUx1elBHbXIrMHNNR3duVWJmY0JpdEFEYm40TGFBeS83OUFF?=
 =?utf-8?B?dEVBKzcwSTNEcVRDcGNlKzFOZXFWSlVWUStuMzFJTFZrdUY5bXgzTkd2T2VH?=
 =?utf-8?B?SEV2U1dDR2srMDUyakRqY0cwajFaMnFoOWR6aUlKUHFQODQ3OXJEWGd0c3U1?=
 =?utf-8?B?MkJQOVdNYnZkd3IrOXlrSGxCVythTEZwZEdaU0pLL2lwMmJpTktmQ0Z6ZnV6?=
 =?utf-8?B?akp3TWlvQzhsOW1wcXN4UDQ1SkJGY2hTYU9PTCszeTZRa0d0VDJCb0xDZ3pC?=
 =?utf-8?B?NTV5UXBlMXFvMElqU1d4Y3lHN2lxVDBzVi81SHRPR1JmQWNXS3phKzZQbkZz?=
 =?utf-8?B?MUFsTzFYVkxhRGtqWnVrekR1VzdsTWZ1N0ViUzdkRzNFTVgzUWlQWTlTSkQr?=
 =?utf-8?B?dlpSTU55ZHlZNk4vWVhVeTFRQkM1Sk5FUGtOUUFGWktPTW1qQ3RjTCtIYkgy?=
 =?utf-8?B?NXRqMkpjNlRvcWUvcFo5ZjNqUjVCM0FMb1FzaWZQcVowaXZQelJmZ1JQMHNF?=
 =?utf-8?B?QjNKR2lIQThhR1BwYzlDV2h1MXNaenFMMjZScGEvVFhWZG9HRUk3TE5LMjhp?=
 =?utf-8?B?cFFuUldRdTlmSFppeklGS1AydHovVHU1QXpMTGxYR3R0aFkwSG9KN1Z0REtR?=
 =?utf-8?B?cGpiM2x3MjBsa1pjd2JwOGo2Qi9ZdUNYK1htNHR3dk4vMmpGeHJVWHg4U0Ir?=
 =?utf-8?B?ZVJjUFRLbkFOWDFZQmZxcytxMTBVV1N0bkovUGMwa2NDeDNWU2hyRUM0WmVN?=
 =?utf-8?B?K1RVS2xLREQ3VDFuREJ5WXZBWVpUd29tY3BNMWs2anlqbVhwU0tSaXNrUkpx?=
 =?utf-8?B?K2lOeE9PN2d5bnVPamRUd3pXd1lFdWVqcy9IUUc0MmExWnMvUmY4c0o4ck5n?=
 =?utf-8?B?dGRQWW5EMSttTWhhYkZVQ2t5SGVBU1g2QUhPcWlwWk51Y2x4allESkMzSS9O?=
 =?utf-8?B?S21uemVsY09Bb0x2SUoyWkJGbGR6L3NNb043OWIyNDRNU0IydFg4RzZTeEFh?=
 =?utf-8?B?L2RjUngxcUphdE1vN21oK0JSUCtpSm1BRHEzVE5CejJGUU9RV01BeXM0eWpX?=
 =?utf-8?B?Uk8xMEJSU3FZdEppa3lhUk0xK0thVUFMdkUrbUF5VWJ1blZQYSt1Wktpemt5?=
 =?utf-8?B?b2M0c2NPV2xQdWYxcG1nNFpqODRtcXJCckZxdjBCdmJkL0d3UXVCTUZGajFj?=
 =?utf-8?B?eVB5aDc3VUdPR0s3WCsrRDZackxFUEd0T1lYeEtGVEUrNUtwenlJZ290ZU9s?=
 =?utf-8?B?SnlFOUUyZXovK040ZzhabEhnS29PZllQTFowNXRiYVVSTVRuTHRXLy80OXlh?=
 =?utf-8?B?VVNLeE92aE1BTWhJUWdQc2VJeWZxNWlIdHd0MXBHNmxDWUJxR0RqcVE1d3pJ?=
 =?utf-8?B?NXcvTXdCWkw3QzlCQlRwK2t0bVVHbXZvNy9hQW4xcGNVd3B2RlNIQXJ0ZFNz?=
 =?utf-8?B?bkg0dlU5K2M4aExGOFZrUDJ2TmVwVllpdU9seGVJdkc3TlY3MHo5OEdDZEhP?=
 =?utf-8?B?bHF5eHZkTlVDbmJGMllncDRWYXFmQldpTER6aUZtNTBPWWxNYkxtK1BUcUMy?=
 =?utf-8?B?cm4vVUVGenp2MGlGOSsvWlhBdVVQVGhCZXJoN3JsQXhhWkY0RlNCNlNTSy9D?=
 =?utf-8?B?RGZ1cXhlU2NMWjBkTWJsUlJjU3loRm1lOW02OWM4a1ZTY3pGVUxtdkpxeFJo?=
 =?utf-8?B?N05BTHRtbHVuK0EwRkZZVURzbFVkNzZVSW1iZ0Y3SnhrZDg2dE5OS29qajdU?=
 =?utf-8?B?VkY5MTZGRUxlbHdweW5taXFIUzNacU91ZTcxRGhCM0lnbnJnM2p5KzUxcUJi?=
 =?utf-8?B?Y1pzaXNRcndER2pJcG9OcG9sb0lhUEFmbTlXeU0rV3JOQmV6azF2dUEzS2lQ?=
 =?utf-8?B?N0VTMGhSTTg1ZFFQK0hvdmlTcTM1bnhiWUVQWEJPRGFwdG9peWtOYzc4Z2Y3?=
 =?utf-8?Q?ru0i3jawR7gP8tq8=3D?=
X-Exchange-RoutingPolicyChecked: uqdK265mlS5Df2KLswoWQl7n1twR0zQ6SjIq3vD0mpj56jC7qT/xJ34aPgZzGIYsSrLgNp0sYroUIvx4TxSb0F/jKo+CLDcTUwNO2hdtSenEantko2BZJje5eATOfmdwur/OkIvGaHiJpCtcTFCAK+GO8tQ2nl3daj2DSAeNgViPuwt97oyqKbrrNdoZ3XIfdJPm2XsBLVifX+WnVsBM2FyXs8DbK69AFlji3oiF2JH1RuxpxT6lxtqpPMB1/D1OfKS1YpLOCqMj7Zh+w57C+U0On/wU9xbBC0PqFiUg6kkl5QHPiSK76wXD1OEbXnwI9veocEHVrTFds47GsYag2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3608f427-1609-48a3-ea63-08de960fca87
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 08:12:50.3740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7tq8HLxVF8G5y9sVs2iOxIm8mZvn6HulKD6xharHaztzb7X3YL5jieREnUWeORQtA/YpWABkEIyL3u14AyiTybOpU8RzMduoftAx0f6Ehk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6119
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

--------------N1L1tG5K8ksGPONTokrXeSWj
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 04-03-2026 10:08 am, Jeevan B wrote:
> Add lobf-dc3co subtest to validate DC3CO entry during link-off
> between frames.
>
> Signed-off-by: Jeevan B<jeevan.b@intel.com>
> ---
>   tests/kms_vrr.c | 33 +++++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 569000fee..f8b830cc0 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -29,6 +29,7 @@
>    */
>   
>   #include "igt.h"
> +#include "igt_pm.h"
>   #include "igt_psr.h"
>   #include "i915/intel_drrs.h"
>   #include "sw_sync.h" @@ -80,6 +81,9 @@ * * SUBTEST: negative-basic * Description: Make 
> sure that VRR should not be enabled on the Non-VRR panel. + * + * 
> SUBTEST: lobf-dc3co + * Description: Test DC3CO entry during LOBF. */ 
> #define NSECS_PER_SEC (1000000000ull) @@ -942,6 +946,25 @@ 
> test_lobf(data_t *data, igt_crtc_t *crtc, igt_output_t *output, 
> igt_assert_f(lobf_enabled, "LOBF not enabled\n");
>   }
>   
> +static void test_lobf_dc3co(data_t *data, igt_crtc_t *crtc,
> +			    igt_output_t *output, uint32_t flags)
> +{
> +	unsigned long dc3co_count_before, dc3co_count_after;
> +
> +	dc3co_count_before = igt_read_dc_counter(data->debugfs_fd,
> +						 IGT_INTEL_CHECK_DC3CO);
> +
> +	test_lobf(data, crtc, output, flags);
> +
> +	dc3co_count_after = igt_read_dc_counter(data->debugfs_fd,
> +						IGT_INTEL_CHECK_DC3CO);
> +
> +	igt_assert_f(dc3co_count_after > dc3co_count_before,
> +		     "DC3CO should be entered during link-off periods. "
> +		     "Before: %lu, After: %lu\n",
> +		     dc3co_count_before, dc3co_count_after);
> +}
> +
>   static void
>   test_cmrr(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
>   	  uint32_t flags)
> @@ -1237,6 +1260,16 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>   
>   			run_vrr_test(&data, test_lobf, TEST_LINK_OFF);
>   		}
> +
> +		igt_describe("Test to validate DC3CO entry during link-off between active "
> +			     "frames in non-PSR operation non-PSR operation.");
-->remove copy paste error in discription--> "non-PSR operation non-PSR 
operation" with "non-PSR operation"
> +		igt_subtest_with_dynamic("lobf-dc3co") {
> +			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 35);
> +
> +			igt_require_dc_counter(data.debugfs_fd, IGT_INTEL_CHECK_DC3CO);
> +
> +			run_vrr_test(&data, test_lobf_dc3co, TEST_LINK_OFF | IGT_INTEL_CHECK_DC3CO);
--> IGT_INTEL_CHECK_DC3CO is dc counter check type but not a test flag 
this might be conflit with other test flag bits. define a dedicated test 
flag. i think better use TEST_LINK_OFF instead mixing, you have already 
checked DC3CO inside ur test.

-->https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_vrr.c?ref_type=heads#L906 

|if(flags & TEST_LINK_OFF) at vrr.c might not execute with ur current 
approach?

-->https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_vrr.c?ref_type=heads#L946
    is it expected to assert the test if lobf is not enabled?|
> +		}
>   	}
>   
>   	igt_fixture() {
--------------N1L1tG5K8ksGPONTokrXeSWj
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 04-03-2026 10:08 am, Jeevan B wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260304043805.572087-4-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">Add lobf-dc3co subtest to validate DC3CO entry during link-off
between frames.

Signed-off-by: Jeevan B <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a>
---
 tests/kms_vrr.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 569000fee..f8b830cc0 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -29,6 +29,7 @@
  */
 
 #include &quot;igt.h&quot;
+#include &quot;igt_pm.h&quot;
 #include &quot;igt_psr.h&quot;
 #include &quot;i915/intel_drrs.h&quot;
 #include &quot;sw_sync.h<a class="moz-txt-link-rfc2396E" href="mailto:@@-80,6+81,9@@**SUBTEST:negative-basic*Description:MakesurethatVRRshouldnotbeenabledontheNon-VRRpanel.+*+*SUBTEST:lobf-dc3co+*Description:TestDC3COentryduringLOBF.*/#defineNSECS_PER_SEC(1000000000ull)@@-942,6+946,25@@test_lobf(data_t*data,igt_crtc_t*crtc,igt_output_t*output,igt_assert_f(lobf_enabled,">&quot;
@@ -80,6 +81,9 @@
  *
  * SUBTEST: negative-basic
  * Description: Make sure that VRR should not be enabled on the Non-VRR panel.
+ *
+ * SUBTEST: lobf-dc3co
+ * Description: Test DC3CO entry during LOBF.
  */
 
 #define NSECS_PER_SEC (1000000000ull)
@@ -942,6 +946,25 @@ test_lobf(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 	igt_assert_f(lobf_enabled, &quot;</a>LOBF not enabled\n&quot;);
 }
 
+static void test_lobf_dc3co(data_t *data, igt_crtc_t *crtc,
+			    igt_output_t *output, uint32_t flags)
+{
+	unsigned long dc3co_count_before, dc3co_count_after;
+
+	dc3co_count_before = igt_read_dc_counter(data-&gt;debugfs_fd,
+						 IGT_INTEL_CHECK_DC3CO);
+
+	test_lobf(data, crtc, output, flags);
+
+	dc3co_count_after = igt_read_dc_counter(data-&gt;debugfs_fd,
+						IGT_INTEL_CHECK_DC3CO);
+
+	igt_assert_f(dc3co_count_after &gt; dc3co_count_before,
+		     &quot;DC3CO should be entered during link-off periods. &quot;
+		     &quot;Before: %lu, After: %lu\n&quot;,
+		     dc3co_count_before, dc3co_count_after);
+}
+
 static void
 test_cmrr(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 	  uint32_t flags)
@@ -1237,6 +1260,16 @@ int igt_main_args(&quot;drs:&quot;, long_opts, help_str, opt_handler, &amp;data)
 
 			run_vrr_test(&amp;data, test_lobf, TEST_LINK_OFF);
 		}
+
+		igt_describe(&quot;Test to validate DC3CO entry during link-off between active &quot;
+			     &quot;frames in non-PSR operation non-PSR operation.&quot;);</pre>
    </blockquote>
    --&gt;remove copy paste error in discription--&gt; &quot;<span style="white-space: pre-wrap">non-PSR operation non-PSR operation</span>&quot;
    with &quot;<span style="white-space: pre-wrap">non-PSR operation&quot;</span>
    <blockquote type="cite" cite="mid:20260304043805.572087-4-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		igt_subtest_with_dynamic(&quot;lobf-dc3co&quot;) {
+			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) &gt;= 35);
+
+			igt_require_dc_counter(data.debugfs_fd, IGT_INTEL_CHECK_DC3CO);
+
+			run_vrr_test(&amp;data, test_lobf_dc3co, TEST_LINK_OFF | IGT_INTEL_CHECK_DC3CO);</pre>
    </blockquote>
    --&gt;&nbsp;<span style="white-space: pre-wrap">IGT_INTEL_CHECK_DC3CO is dc counter check type but not a test flag this might be conflit with other test flag bits.
      define a dedicated test flag. i think better use  </span><span style="white-space: pre-wrap">TEST_LINK_OFF </span>instead mixing,
    you have already checked DC3CO inside ur test.<br>
    <br>
--&gt;<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_vrr.c?ref_type=heads#L906">https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_vrr.c?ref_type=heads#L906</a>&nbsp;<br>
    &nbsp; &nbsp; &nbsp;<code><span class="hljs-keyword">if</span><span class=""> </span><span class="">(flags &amp; TEST_LINK_OFF)</span><span class="">&nbsp;at
        vrr.c might not execute with ur current approach?<br>
        <br>
--&gt;<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_vrr.c?ref_type=heads#L946">https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_vrr.c?ref_type=heads#L946</a><br>
        &nbsp; &nbsp;is it expected to assert the test if lobf is not enabled?</span></code>
    <blockquote type="cite" cite="mid:20260304043805.572087-4-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		}
 	}
 
 	igt_fixture() {
</pre>
    </blockquote>
  </body>
</html>

--------------N1L1tG5K8ksGPONTokrXeSWj--
