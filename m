Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8D31093172
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 05:16:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D549410E161;
	Fri, 20 Mar 2026 05:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nb3PfI/U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3E110E161
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 05:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773983798; x=1805519798;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VVIm8gmrHS3hGRfEtKWTz2teKhvLzmoC/8tpURB7JfY=;
 b=Nb3PfI/U5Ocsi7RrBxBKePyodbhrtPPsURQwi8a1CGtJ9cLUoPch8TEq
 Cv/PL9wKUPMHn9vD9eGe1Cwoeji58nJ2GFkBUMp8GsBrFzU6/FbycyliP
 XWxhsqwglq72jWbRalSsEumijpRbSA3GS4tyFWdTEUGNJQow991SuWgHC
 yDfRYRyB7F5Rtf9LK+F8Go7kmCbKGe+e/sSQqJ07NAxLCAiN+WNRpUvOw
 aObTDpSUHIdxHjRTVNXNPGICMiYEti8iai1oRi2w1AJ2p0KyxNoEcdUMQ
 tg1IhBYU+N8acYvXWeeunrlB83rxdQXl8az1lWkcsGprBp/DNgxY7yQZW w==;
X-CSE-ConnectionGUID: I4maCoEIRv2zhwl1emIpJg==
X-CSE-MsgGUID: 7KzD2LUHQ7q4tmcixoa/YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75099080"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="75099080"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 22:16:37 -0700
X-CSE-ConnectionGUID: kk65/6PUTCuJ39MfzVt+zw==
X-CSE-MsgGUID: ow8/jddjQPW6kyP3aQ8Muw==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 22:16:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 22:16:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 19 Mar 2026 22:16:35 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 22:16:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4UbqjWcaHmwyEp8agfHVGbDCHJ5qauweZg+z54bEAnTXDvIwbvbposp08Jlv8ulyxPrhY/V+0pgx+hfradDKZNwzsVau1tMwKbPU9zAdYQD0IyVewaXt9w9U+a+Yli6KgMebmULHE9+3CSinAR7gxRUJmK95fk1cfnVOLrgSmVi4X8jdbXGJZODSmj5KfhvIbuJmBgdQtDA9b4IutzZA4uyO4lbr9AZQHK1jK9+oO/XMOd2jo6uczcjFzTOO9Itcsq4OJsqFhVqy3XdAJ04DnA8QvESWstbmPExe8OM+REbSrx/ClKbn5kXvIdNpOEjjFjsVpWxGAHPXHOsmFPfiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbgUWdaBHHyFmHsVPu/O+KBQCkTy0+e4iaaSjhDa7+k=;
 b=InX1HQ9TtrcKfdW8RXurRoblsUbmod8BR5Be+SyhyaQTLZ/pc6GjWItP1PHIh95OKymnEcWOJJ8ogZFKzS4ut0zFcsShsMpz+jB2sa2GcD1EQ8Ys9dExm+tn7TIeFU9BqTlxeqiL78q3L6anf28Jc4Vifz0wnHtdKIaCMQaFy1np8n0B1fqPRcSYi3F6T154xypkyM5DvAqQZvxERC3PCOTqy50227yjT/E9qMxtHJolhVElPwp0GdJgqbB93qoJv00Bm1Zl96pHWnavSg6UcxS61yv9RgAbzKrN5Ae0zxuo3xa0o5dSQcz6r041HRlsobdE+ITLqnRPKq8FxGYSdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30)
 by PH7PR11MB8273.namprd11.prod.outlook.com (2603:10b6:510:1ac::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 05:16:32 +0000
Received: from BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737]) by BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737%4]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 05:16:32 +0000
Message-ID: <57b0a0d1-5737-41a4-9abe-49fad4804d96@intel.com>
Date: Fri, 20 Mar 2026 10:46:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] kms/feature_discovery: Add VRR capability
 subtest per output
To: "Bilal, Mohammed" <mohammed.bilal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
References: <20260121001324.118542-1-ramanaidu.naladala@intel.com>
 <LV2PR11MB6045974F9E4C0C24CE5731E38197A@LV2PR11MB6045.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <LV2PR11MB6045974F9E4C0C24CE5731E38197A@LV2PR11MB6045.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::16) To BY5PR11MB4260.namprd11.prod.outlook.com
 (2603:10b6:a03:1ba::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:EE_|PH7PR11MB8273:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b419f61-898a-49a2-e03b-08de863fd959
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info: yMAynmsQEEz5vdluyjSsI/oA+f/SdlXPsRoPIDjmWy9PWxZ2mnXfjnr/zih5+TgtRbeCwMe4VPw+vOVgzmxnXnwUQe4CXhzjuJ4SahPclYpJqjhFkz33VeBAUru9KGvssBGMBFSsscT+IbsvSajgQhSVwKc0oKJc/X1ajHrzhkkRSGKYSKfRhq73kxyzF/pp51yzONiStZoR+fXDF3qGB1u2ec3FMKHKrDHNY9/+c6RucbHBIr/EG0estEOJeopePhE0zlq/62S1pU16Dv33WcGkxywGsW3P4SUmztg8o9XhTaWDRSkatfBLjVdUSC/n2T49kD22gSgL229V8wn+2dMYJ7wC0D6JQRUgHtg+Xgeix5tYca7KzbYCl9ppfUoKTfdewgLt7S8NrCrCc0V7kpMMIbOjcSjudiPLbzsjhyA8sjHchHFlPv+LiKoc5Yu2Rkofbo1zAGYqCbpeVpLrMOqK+p0qW7+NjepH118/H1flV9nA8shiz5M5koj6sIVepPlwvZp0B/aDCNt9pxWUTuWiEaSBwS+EBt6BMoYAQCoLUrirxdu+0h1QsTS0zV7dBHPFa/zaarCSEyn8xVHmhxQf/0YiAIIbNryWaHi958f6ioo1zjNGP60I1Y9k08uwoME265++TihSg2G0y30vRxrS1xHRZEN5Q408Bh6++sOP4+Ie1INsI+Wxdl2ienhRgNUUm9GjTA6H83icLyVkH4vkuB4skrlOUroMtc8JBso=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4260.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVdSSnlRQTlKYVNOSzFzQlk0TCtxMWFYZEt0ME1tVWVXR0tudkhQVS83MmNa?=
 =?utf-8?B?ZThCaDZWMjU4YUk5UUdZeDdDYW5LdEZEai9NeGZ2cVYyUG13S0pOZ0cwV0pi?=
 =?utf-8?B?M2lsN2hZc1RObDZCb2RGUE9jZDI0b3QxbmNSaUsvY2liQ1lYTUlFOGtOVWQ0?=
 =?utf-8?B?NDVHQVlQV2hMUTRlSWc1emprOWUzN3k2TTJUaXBBNzRHVjlSSkxvVzFDVkFy?=
 =?utf-8?B?WjlFQU1jNXlhZDhxcmJ1V3p6dnozSHZUakVBWkJiS3RQSjk3U2VhL2ZOUG04?=
 =?utf-8?B?dnlDK3NodjkxdVozSGpvU1dqTFdMRWxJa3lMUWJ1clNkNnVEckFOWVdraTR1?=
 =?utf-8?B?ay9zckVwYXptM0Z5RDdTM2t3amMxSEp3K2prWmZVR0FENWpMVEtXd2JrN004?=
 =?utf-8?B?Mk4rV2NOZlhsRWxMWDR1MWQ4SjhHcVpHaWpqY21ob3pROHVwb0tkRFYzOU1Z?=
 =?utf-8?B?UVlLWlBHakpmKzBodkF0dlVDL2l6WG5ISklITE5PVUUrSlM0S1BweEFpWEU1?=
 =?utf-8?B?NUY2bnFSL0ZyWFpYK0tjWllwbzUrUCtsS1dOcVh3VGoyaDJ1ZktDMTUrS2JJ?=
 =?utf-8?B?RVd5VnVWb0RxaldTQndLV2FkdkV2a2p1eEpWYkhoS3lHcFdSbVlGS1BWQXNw?=
 =?utf-8?B?SWxSalNpYlhkK0VGaXFVek5OT1NKOXYrem92QnpyM3g3RDkvcGIxUHRMbDJG?=
 =?utf-8?B?VGhPd0FZZlZiTXpSQlNrdG84NVBMY2lnOVU1SXovdGdrM3dRdFQ0N1FmWWZo?=
 =?utf-8?B?Y093V3kwaTRMbS84bHVhYXBxcFI2QTVxRGVzdDQrN005b1J2TEptdW9XYmly?=
 =?utf-8?B?d2g2T3lXcE5RVVluYVE3SnBrdlRqaGNKRkZuYS9ZYTgxWU5VWVFGekxiTkZJ?=
 =?utf-8?B?VllCVy9CUjcyc0lIbzB0TWtHYi8zQnRVTkJqL1FXYVVPK0YwRzJKYWpVZk9q?=
 =?utf-8?B?YmpSdHpVMUxFZEo1MDJITU1PVUNRK0Q4a1BQemdtcm9ZejJNZzJydXpCNHd6?=
 =?utf-8?B?RG81M0lhdzNMMjA1WEtBVkFZVHlTNFg0b1NwNk1sanB6UGtzbWxXOU9NclVy?=
 =?utf-8?B?aGUycEVpNlgxZVUwa0E2M0ZiMC9GK2V5UVVkMVJSdU9hdG56dlRYRDNMeUpV?=
 =?utf-8?B?L1Z6ZjE5ZnFkcUxGcjVSOUdFZzJFWml2dDhoRDQ2cFFmSmZXQU1PRUNyeFo5?=
 =?utf-8?B?ckRMaEsrZkZodlpqSElaUmVvcnJKT0VyMkFwRy9wRCtpblVKMk42YjVOZVZO?=
 =?utf-8?B?VkhhSk1xU2ZQWUhkRXF4SGFPOENKZnVvU0J0WVQrVnRjM08xSDJQZHVORFZJ?=
 =?utf-8?B?WkRrWTVTTjl2QnRwaVBVNjMxU2E2d0xFVmtwYThCYnNxam4wdERMM050VDBC?=
 =?utf-8?B?VVJDdnZtbzVxN0p5WW8yYUdCMkRXOU4wMGVxT3Y4Um5jK1FLQURiVmxZMkdX?=
 =?utf-8?B?b1dZT2NZcEhBck9oUDFhOTlTZEV6SzNXLzZ2U3ZRLzUwRUZjS3FBRVdvQjhn?=
 =?utf-8?B?bmE3cytjVHlxcnNhTkw5c2JqNmhFVEN5YWNaeTV3aXpVWmhxeTNCVXBqclJN?=
 =?utf-8?B?MmNkMGlyc0JETnd2Q0VJRWhLeG45a3lTM3FaMFY4cmFLVk1yTmZwS1RKRHVT?=
 =?utf-8?B?dmcvMGJyMGh5bGdqcUViSzhIZmROUGNkcHpLajU4RWloTjJwc1NhNWJ2ejFj?=
 =?utf-8?B?ZmYyTWRzb2pzYXdNa3V6WGt5SWZ2aEFLVVlvWnFPbmFJNzFBd0VLNE9pU2Rw?=
 =?utf-8?B?YmxsNnhLREFYWDlvR2RNOFJ3cG9jbUZ2SXVlVmlXZXJnMXFPdEtRNTZFWEwz?=
 =?utf-8?B?alFldGRtOXNZR0NBNWxRRDJlWC9heEZtekFNcUdCSWY1TFZrUS9FR3h0R2Mx?=
 =?utf-8?B?QzFlQlh1ektpR3ZrbzAybmZvR0lNNldwK2FoTjlXUkgyWktVSmRTMGlWRW5G?=
 =?utf-8?B?SDM5R1ZFd1RDQkJJa05xZ0hEWWZwYnZCaU1SZVU2V3VhRlNGamxlaENtTUxv?=
 =?utf-8?B?M1RxaTBxS05VanN3Zi9SR0Z0M0o2dm5WZWROdEdJa01VNUJqcWs1dUhTejB5?=
 =?utf-8?B?NFNCVDRDTjVMSmdXR1Q1RlRWZXcxaEFjOEVaemdmVXNSOHZqTE41M0FuZWZS?=
 =?utf-8?B?cVpGTkNlc09PZFp4c2djdGhkVk5OSjcwVWRuMjVmU01sempqeVcvRGVNMXBB?=
 =?utf-8?B?VmxKWk1QeFExNnludHJoZFJWYlR5LzU1dVc5VkxwK1AwWmhvR3NWdWxBMkVN?=
 =?utf-8?B?cFZPN1d0d0x3ZVZpTnM1NDFYR3liZnA0U0V5UzJxS2kzOUdiNTV0bGN0bnpP?=
 =?utf-8?B?NjZRNGNwSWp1a3UyM0lyNEp2bnFEYlhpM09zbjBjbzNFWEdxWSswWjE1SEU0?=
 =?utf-8?Q?uwMDPnR/rroA1/Uw=3D?=
X-Exchange-RoutingPolicyChecked: QRiCVPPaRybVWOc87SlgXYpFfYzgOJLHjAPp2SpVlG/64Owd530IKEmzayFxhDmLhlfO+aqeXMzxqZt5l3N9kkZ/fDU2PYqaoB1OxvsRqkI7wy5sUkTxqyYPmEJb57bgbqbVwQJiu+RtyIsFNclkyEgEUWzSBM9M0Q/9LsF5kSjvTCN4/5bVmqi1JovVUg62vnR9E3rvWFI+41KQBTkGYZO4QemcfbztTVR3n/JjBApawOYtGOyWBRnPS2S0I0EVMcXlAJbQ1u6RpIM4al0r+xgxMms4Z+VHvZN7XNfIZgJd+FS2gbGq1trP9J+O/kCYHwJOlh+ASyVfBDxRZUpKRg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b419f61-898a-49a2-e03b-08de863fd959
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4260.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 05:16:32.4295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cu+jzDBtXKQrszueqLEJGahwg9vbVDaLPCEnGV2q4X36TyGga55uuyzMQBlGulpayvK/GGpCpyWDfbBirOmI6NIn8MjEUgsdwzDf3AkG/Ak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8273
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

Hi Bilal,

Thanks for the review.

On 1/22/2026 9:48 PM, Bilal, Mohammed wrote:
> Hi Ramanaidu ,
>
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Naladala
>> Ramanaidu
>> Sent: 21 January 2026 05:43
>> To: igt-dev@lists.freedesktop.org
>> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Naladala, Ramanaidu
>> <ramanaidu.naladala@intel.com>
>> Subject: [PATCH i-g-t v1] kms/feature_discovery: Add VRR capability subtest per
>> output
>>
>> Add a dynamic "vrr" subtest that checks vrr capability on each connected output,
>> skipping if the driver or output lacks VRR support.
>>
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   tests/kms_feature_discovery.c | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c index
>> da80ecf66..bf36740cf 100644
>> --- a/tests/kms_feature_discovery.c
>> +++ b/tests/kms_feature_discovery.c
>> @@ -60,6 +60,10 @@
>>    * Description: Make sure that we have eDP panel with PSR2 support.
>>    * Mega feature: PSR
>>    *
>> + * SUBTEST: vrr
>> + * Description: Make sure that we have VRR support on output.
>> + * Mega feature: Adaptive Sync
>> + *
>>    * SUBTEST: dp-mst
>>    * Description: Make sure that we have DP-MST configuration.
>>    *
>> @@ -155,6 +159,21 @@ int igt_main() {
>>   			igt_require(psr_sink_support(fd, debugfs_fd,
>> PSR_MODE_2, NULL));
>>   		}
>>
>> +		igt_describe("Make sure that we have VRR support on output.");
>> +		igt_subtest_with_dynamic("vrr") {
> igt_subtest could be sufficient here, as feature discovery only requires checking if any output supports VRR.
Dynamic subtest for each output clearly shows which output will support 
and which don't.
>
>> +			igt_output_t *output;
>> +
>> +			for_each_connected_output(&display, output) {
>> +				igt_dynamic_f("%s", output->name) {
>> +					if (!igt_output_has_prop(output,
>> IGT_CONNECTOR_VRR_CAPABLE))
>> +						igt_skip("Driver not supports
>> VRR.\n");
> With igt_dynamic_f, if the driver does not support VRR, this skip message will repeat for every output.
> Better to check driver capability once before iterating.
Sure. I will fix in the next rev.
>
>> +
>> +					if (!igt_output_get_prop(output,
>> IGT_CONNECTOR_VRR_CAPABLE))
>> +						igt_skip("Output not supports
>> VRR.\n");
>> +				}
>> +			}
>> +		}
>> +
>>   		igt_describe("Make sure that we have DP-MST configuration.");
>>   		igt_subtest("dp-mst") {
>>   			struct kmstest_connector_config config;
>> --
>> 2.43.0
> Regards,
> Mohammed Bilal .
>
