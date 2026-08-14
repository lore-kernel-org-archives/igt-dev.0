Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36540C5CFC1
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 14:14:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D397910E13F;
	Fri, 14 Aug 2026 14:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZlpFrBk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E8410E13F
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 14:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786716852; x=1818252852;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=LXItNLTb19Fg/iJWCQOuSnAWebyMoufbBgbJjqBQmqc=;
 b=UZlpFrBkrKdqW6JtuFlM3iGec1FTLOXxeYAoJ1J04PfMnA3w5eEuNvwn
 zaKuSR7Ss3IXJ8+R1NUybI2dZQ96MtE4Xk7K7Pc6gFsma/dupEp9ZC1Oc
 ZajfxmBcIpzQFDgR5TLhqyJnxT4Vj0UOMbyFfohIgaSWcWp/NirhvFBRx
 QD6T9V+rFy0TwQ/WxF3JvhYssY1P8h3URL07ICtus3uUBBaGejoffXKBb
 npEGRw8AEDoy8A7dqGmmbLy9mDKn8YLlNOY01MiJq/+oSc8bvkGyQ6Qq9
 +07DsKHCrAuukLareS8Zd+uaO9G27+knujs0H9PFkwXMySTxLZiQyZU23 g==;
X-CSE-ConnectionGUID: Uk9KspwbRoCITfb+ZvhRhA==
X-CSE-MsgGUID: fV9EuXuQQnqRddtdkRa4BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87315297"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208,217";a="87315297"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 07:14:11 -0700
X-CSE-ConnectionGUID: Lpe5QnhRRbGhs/GOkpyN4Q==
X-CSE-MsgGUID: 23zZbUiRTiq6ZoK56MqK9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
 d="scan'208,217";a="267726217"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 07:14:11 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 07:14:11 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 07:14:11 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.45) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 07:14:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTQafbY2nqbvWCBtU9nBRma/PcK1e4+upQmcySF21A0BWEjpomSVjhinWqdu5oZxv3CK0cID0x0gZ49Gh6GuzjpJrgAlSslOOHYpGkeQ2K5kaWADNXc6gQCFgPFp02UdGRXk6GmNv0Iarlgh1xEgcLj+D9286DRdJzVct3ns0IhTf+GTPcvYI//MnOu7+yDTyhjHTJDCXTRL5ZGczF9li+OxdAv/3Q1yoepFNRroCyZQcPU/csjOzXqnmOy0Pu56z1jnizOl8tsaBX1NTdU08PnVGb/Iv6QsmrnbCoBoV2KGX9RRXj4NI9VQwVnD5dbae2G705RqOgMyuyvcmmltdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwx0SFKyblZQcCBv3PZOOmkdwPnxRCIdse6xiHKS/0c=;
 b=SDO1VMZXU4vC7I8Cv6yTiiZhKfhBVg79CLiuyFQSNfJP2XEr1uIMFMzU8XU6JwHMlN2O5X5jU7Ig1cXSt17dGDVDLQsh7cebuSfFaOzY2SBPJKQVRe2pLA2ME32cRWWHfRXq4mj2ob8V0qYg7Rsk6bFG8I9cOmo8jTOgKmbRagDbEVTOsjQsWW9or7sNaR5YF8Myl9wKWhhAZUi33iG0rJa2UkaFjaTCMicazvtumDnwV4+kxcofKtZVrw5Ssea8175+j92B0TZfgCCnzstrwiDu9Z4SixLHLVuopgMOdUk6sbIm92pPCm8K0/Vp2Bg7nCBe53megBxDumRWrGO7HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by SJ0PR11MB5007.namprd11.prod.outlook.com (2603:10b6:a03:2d2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 14:14:08 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 14:14:08 +0000
Content-Type: multipart/alternative;
 boundary="------------tGHndfRCZEGnLqI0D30p0uis"
Message-ID: <0d398125-de1f-451a-a4e6-15cf02b98dde@intel.com>
Date: Fri, 14 Aug 2026 19:44:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [7/8] tests/intel/xe_err_injection: Add tests for L2 bank Corr
 err threshold scenarios
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <mallesh.koujalagi@intel.com>, <raag.jadav@intel.com>
References: <20260729121959.603890-8-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260729121959.603890-8-ravi.kishore.koppuravuri@intel.com>
X-ClientProxiedBy: MA5PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::12) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|SJ0PR11MB5007:EE_
X-MS-Office365-Filtering-Correlation-Id: 2de72528-7117-4b47-4942-08defa0e4e20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|6133799003|8096899003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Hp7vdTogfg2FvIVLGljxh6gOLGzT3whiouu4y+h1oqY5RcU5J0lGUBw5RUR5KTU8lgCuVtPBh6VKsbFgcBoUFtbeW0RW2sLXu2owy/vRFStkl+T+UC9A0iUc3bs5RjOBgrZBHtfQ9Zqxu2E/3hTjS192qNzWzjakjNLCzhhRAZfJvXGksz3lhAnkUH6wm0tqCMApPpQ+p4q9dndYPIG57BbK8kK+3dwvXX5Aj9LNzRsoswcMT8cttKOA+QK3Nc57vkgc7Q0j4Klp/kVjPO8uGj6trrn9s+HVUsZnwUdmKJdIn4nmF3RVuXW51H0Olr0/Xu644YyrUi6EdsHDYL5vU7Jx/XtnV4AH8HG10iRyMNEfN59ucnu6qqAiv+I8mOI4QLdKIwN9Bm+XZbotFq5qOx7kpVajiZlyH7NxHRaaPkqHTsoz8kkTfoWiGiDj9i2EJRzkebgKxZo/sW2KUqmBSpNAtzNlbZXrcdhNiilGgwNv/Tdb6pI6DtrPDRQSuwYcGv3YJjWAk8HDy/EWC+r9Pppt1l00gcODudc0i/JVq7nK/6ttB9hO5v0JOXDJlhGWDShsQ3/rLf070GRsDp521ggPzKS8fD0kSIBr8/YdNKqcBVG2FmaeDl9uALrtX1audVAwCBaLQxqokEy9/BLlTHzkSaMImySShawcUtfGJQg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(6133799003)(8096899003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2RLUndWK254Z1VXVjBadjRrL0pCak54akkyV2xtMkRrUmRsYUlDMkErbXNo?=
 =?utf-8?B?MlpYd3dmZGtHZDUrWFoyaWtMWGVWUmY3RVhna21SemJhZ0o2S1VXaXdWa2k1?=
 =?utf-8?B?d2dQYXkzVmkzbDJLdVREU2wvVFZmYld4Ulh4NWxVVG5uUGFMdGw5RTVMOHky?=
 =?utf-8?B?ZkFOS0hFaWk1YkxRVEVPRTE5SDZXYXZLZ0tOYlAyN3hFRzZkNU9XZEpqVUdB?=
 =?utf-8?B?R1JqR3FYc0M3YU9ITzlzQ0FYYklGUWRyU2tGUHZEWDc3OStpM2x2R2VDWmt3?=
 =?utf-8?B?YmdNMGpRYS9IK3Y2cGRWMW5KRDkxNEc0aGJsb3RlS1Z2clBPVkZvR3pQbGZa?=
 =?utf-8?B?UnR6VGE4RVNyQ0xWK0Zod2xWSCtyVStybFhyb3ZOb1F4b2Z4c3BsRUlIaGVs?=
 =?utf-8?B?RWZKb1J0a0FaazFjU3l2UFhmcFZpSmNJVmpFN2Y4V05icGFVeUpQbEdtUWJY?=
 =?utf-8?B?N204ZURlWHdSZzhaOVBNQXhUNVVEY1Rwdmh6LzNaZTU5bkFIbUhCNDBWSGtQ?=
 =?utf-8?B?S1hMc0YycHJrcUJBbk8xYzlpZ1dqelp4RVBTVTFoVUZiZ0lqK1FzZUN6bzhu?=
 =?utf-8?B?ci9CNVJqeHN6U3pBaVNWU1ZHYXN4YllOb0hRMUdIckJJdC9iZ0s2clJKUjYv?=
 =?utf-8?B?T0o1dnVsLzRjeFJJRG5xU00yemJVanBSVktPdGNYVktDZjRreTIyVld4TG1M?=
 =?utf-8?B?bmIyZktOTk1LdlVxenU2TkIvOXpIelVwWEdrdy9tSTFMOXNSQUd5NXRqWTM2?=
 =?utf-8?B?M1lJa014VWtLNWpRbEtjcTdPaTFUYmZiWEdaaVR4L3I3Mk5xQjBLd3BEbHZm?=
 =?utf-8?B?L3dXek0reElHdGhnclhCUk8xOEQ5WElHRUxCYXJ5K0I1RTN1ZUZzTjVTV1JS?=
 =?utf-8?B?Z25kYnlidmdoa2MyOXlIaEcxZ2dIQVQwa0dzeG5ZWWw3SVFsOTZIWlRNTDJo?=
 =?utf-8?B?VitJS203cDlhUFZsOXg4Rm9ZTlF6cVVFQlpYRk1KalVCMGNRM1ViMCtsbDhv?=
 =?utf-8?B?SE9mUUdVdytad0FRSDg5TUY1TFoxcmp2MFd1ZVV4Zjh6bWRoNUtHSWNybldL?=
 =?utf-8?B?am1WZ0VjaGxRbXBHcE1QSFc2ekFybmxtWTFacTZjZUV4ZHJzZDM4d0pvU1RD?=
 =?utf-8?B?T24rN0F5VU9mbEliZEgwQmZrUmxJM09uYjUrSy9XU2JFSmtTRUd2a1RaOGUv?=
 =?utf-8?B?b0tmSmRRS1ZOVkhDajhRRk1iekNiUTB2Vkx5dHZvbU5FTVZDbHdVUkRGNzBp?=
 =?utf-8?B?OHRPVEFoRHVlWmxzcFhnOW1zb1Z1RDZWc05nMnZJSk96cG1LR2I1eVN6aFcx?=
 =?utf-8?B?ak9obVc1QTlHeFhNZUpvSVBRRVo2Z2h4Sy9MbTlTOFBJUXpNTDM1V0J5dlVR?=
 =?utf-8?B?YjhjVzE1WHNvcHJGckJRNVg5T0JyU0dBVXZ1RVJ3b1BtKzF0Vmt0RStzOTRC?=
 =?utf-8?B?eXVBT09zTVhwSzl3SXAzVm5yak5rTnJnTG5xOWtqejYrQnlmeGt5dkorc1M2?=
 =?utf-8?B?L0dxM3lYM2JlOHBiNjJQejlFY09RU1BWQVFKRnhJMnlaTmRuU3JWcDlScUcx?=
 =?utf-8?B?bS9RWFZqTjV3Ry9qVkhHeXVEeFRacEdQdHFXWDhiaUZ2cTNrdXJteUpyWENK?=
 =?utf-8?B?UTBwRWdqMXBuYllMUG9DSlJHM2lJMDVpVFN3NEpuS21odVNMaFNhL1pRL2M0?=
 =?utf-8?B?Q2xiemVLRUhJR1Jmcmxqeks2V2ZROWQ4MkRDVmh6a3hoYUN4bHJZN3c4MWFu?=
 =?utf-8?B?ZitLeFNRTm9OM29KOFdZdTJMR2FiSWN4R3FSWFo5UGsrRnZIV2NXN05mK3dU?=
 =?utf-8?B?ZlBQcGJpN0VIc05lVnhsMTZLblhOZURIeXRSdjYrdlh3eWxqKzJBdWdIK3Js?=
 =?utf-8?B?MTFNQ0lnYVo4SW1tOERvRnZUTk1UOFljTG5tNi8vZE92RzRYamZLVnlWTUR0?=
 =?utf-8?B?VkY2d0FmU0VHRlRheGZEU2ZLdXRoQUViRVhnbFRmaEFkUlhtL2k1SVJoaDRx?=
 =?utf-8?B?MlpvNVc0L3NCZThDR3hMUm04Y1ExNUxpNmF0NnJpLys3aXFWdEkxY2Z4eEhG?=
 =?utf-8?B?TmttVURCZFJpaWVSdXpQUk1ON0FWQ3pqNnVCQkVWNml1SzdaeGxrblJFeWxs?=
 =?utf-8?B?N1U3N3dLWmY3UTE2ZlNXSnZ0dUdqdGpnSE1HR3dCazhhWTZtdklUVFpDV0hr?=
 =?utf-8?B?am1yaFBLMXhqeWkrZ3lzRG5WL2h2QnpUNFIyVDVkby9NdHc1VURhWW5VSG1T?=
 =?utf-8?B?eVdLeGJ3SHlTRTJmZ3VRSzM1ZEk0ZFpKTmRDZ2owRW5wK3FKVUxJQlh6WU4z?=
 =?utf-8?B?cVZrOER0LzNxOVJsQ2lNUjVHNnk3YUZleko2MWQ5eW9lQzE0UU41a2ZIeG5B?=
 =?utf-8?Q?pC02v5V4X1RkrC08=3D?=
X-Exchange-RoutingPolicyChecked: RteEfrW6zsAhCWPQlokPbQDGDBpKXHvRGIXXi0+062rd/dTQYhtGa/DMGmNzOmk4CGnBOFiVBEB0X64etNbtmY/BFpUHkBct4Uv6BQSVnoWx231MBTrjYUIUq2UpFhKecfrFzEaLXwMgGpBI4cnGYjogVnicrT/kdSbH5d0DGXF35QSYfg5A6hmbPv0BjJ+5xTsMfyiEdQSJM8RVyzJQhjI0Rg12smZJFezBaYLXn8Oie/FzmNViNLaJnvFz21NojZG561fQV3sCsidjF9nA0wHH/tYZjpS6SOHoR2beoZd9Z46PsWwCP8g8RL/VneJ0HvNDlZpkVubsAi2LfYgFow==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de72528-7117-4b47-4942-08defa0e4e20
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 14:14:08.3998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJYo1mudMtarY1qOoXBVOCdo85YfNadcVa3rRBuFZsE3+GR826crfWmeuYTF1gNoze6TtVcLKkYIJ2JSLcbUSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5007
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

--------------tGHndfRCZEGnLqI0D30p0uis
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ravi,

On 29-07-2026 17:49, Ravi Kishore Koppuravuri wrote:
> Introduced L2 bank correctable error threshold subtests:
>     - single correctable error
>     - Correctable error with threshold set to 1
>     - 16 Correctable error injections with threshold set to 0xF
>
> Add DRM RAS netlink error-notify event subscription to verify
> correctable error detection across all the above subtests.
>
> Signed-off-by: Ravi Kishore Koppuravuri<ravi.kishore.koppuravuri@intel.com>
> ---
>   tests/intel/xe_err_injection.c | 252 +++++++++++++++++++++++++++++++++
>   tests/intel/xe_err_injection.h |  10 ++
>   2 files changed, 262 insertions(+)
>
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> index afbaf0646..0303f4a56 100644
> --- a/tests/intel/xe_err_injection.c
> +++ b/tests/intel/xe_err_injection.c
> @@ -35,6 +35,14 @@ enum {
>   	RECOVERY_TIMEOUT = 3,
>   };
>   
> +time_t event_timeout = 10 * 1000; /* 10 seconds */
> +
> +/* Cleanup helper for injection test functions */
> +#define CLEANUP_ON_ERROR(ctx, fw_handle) do { \
> +	cleanup_nl_socket(&ctx); \
> +	release_forcewake(fw_handle); \
> +} while (0)
> +
>   static void run_xe_compute_on_all_engines(int fd, bool state)
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -268,6 +276,238 @@ static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
>   	gt_uc_wkr_parity_recovered = true;
>   }
>   
> +/* Inject a GT correctable error */
> +static void l2_bank_corr_err_injection(struct xe_mmio *mmio, int fd)
> +{
> +	/* Arm the Injection */
> +	write_reg(mmio, L2_BANK_ERR_INJ, L2_BANK_DATA_1BIT_ERR_INJ_CONFIG);
> +	igt_info("Armed L2 Bank Correctable Error Injection\n");
> +}
> +
> +/**
> + * SUBTEST: l2-bank-corr-err-threshold-1
> + * Description: Inject single bit error injection in SSA data array when this bit is written
> + * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
> + * Functionality: error injection
> + */
> +static void l2_bank_corr_err_injection_with_threshold_1(struct xe_mmio *mmio, int fd)
> +{
> +	int fw_handle;
> +	int ret;
> +	uint32_t current_threshold = UINT32_MAX;
> +	struct app_context ctx;
> +
> +	fw_handle = acquire_forcewake(fd);
> +
> +	ret = init_nl_socket(&ctx);
> +	if (ret < 0) {
> +		release_forcewake(fw_handle);
> +		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
> +	}
> +
> +	/* Subscribe to error-notify */
> +	ret = subscribe_error_notify(&ctx, DRM_RAS_MCGRP_ERROR_NOTIFY);
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false, "Failed to subscribe to error-notify (ret=%d)\n", ret);
> +	}
> +
> +	/* get current GT Correctable error threshold */
> +	ctx.node_id = 0;
> +	ctx.error_id = 1;
> +	ret = get_error_threshold(&ctx);
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false, "Failed to query GT correctable error threshold before injection\n");
> +	}
> +	current_threshold = ctx.error_threshold;
> +	igt_info("Current GT Correctable error threshold: %u\n", current_threshold);
> +
> +	/* Set GT Correctable error threshold to 1 */
> +	ctx.error_threshold = 1;
> +	ret = set_error_threshold(&ctx);
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false, "Failed to set GT correctable error threshold before injection\n");
> +	}
> +
> +	/* Inject a GT correctable error */
> +	l2_bank_corr_err_injection(mmio, fd);
> +
> +	ret = wait_for_error_notify_event(&ctx, event_timeout); /* wait for 10 secs */
> +	if (ret == 0 && ctx.event_error_value == 1) {
> +		log_status(true, "L2 Bank Correctable Error with threshold 1");
> +	} else {
> +		log_status(false, "L2 Bank Correctable Error with threshold 1");
> +		/* restore threshold before failing */
> +		ctx.error_threshold = current_threshold;
> +		set_error_threshold(&ctx);
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false, "Did not receive expected RAS event or error_value after injection\n");
> +	}
> +
> +	/* restore GT Correctable error threshold to original value */
> +	ctx.error_threshold = current_threshold;
> +	ret = set_error_threshold(&ctx);
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false, "Failed to restore GT correctable error threshold after injection\n");
> +	}
> +
> +	CLEANUP_ON_ERROR(ctx, fw_handle);
> +}
> +
> +/**
> + * SUBTEST: l2-bank-corr-err-16-times
> + * Description: Inject single bit error injection in SSA data array when this bit is written
> + * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
> + * Functionality: error injection
> + */
> +static void l2_bank_corr_err_injection_16_times(struct xe_mmio *mmio, int fd)
> +{
> +	int fw_handle;
> +	uint32_t current_threshold = UINT32_MAX;
> +	uint32_t gt_corr_counter_before = 0, gt_corr_counter_current = 0;
> +	int ret;
> +	struct app_context ctx;
> +
> +	fw_handle = acquire_forcewake(fd);
> +
> +	ret = init_nl_socket(&ctx);
> +	if (ret < 0) {
> +		release_forcewake(fw_handle);
> +		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
> +	}
> +
> +	ret = subscribe_error_notify(&ctx, DRM_RAS_MCGRP_ERROR_NOTIFY);
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false, "Failed to subscribe to error-notify (ret=%d)\n", ret);
> +	}
> +
> +	/* Query error counter before injection */
> +	ctx.node_id = 0;
> +	ctx.error_id = 1;
> +	ret = get_error_counter(&ctx);
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false,
> +			     "Failed to query GT correctable error counter before injection\n");
> +	}
> +	gt_corr_counter_before = ctx.error_value;
> +
> +	/* get current GT Correctable error threshold */
> +	ret = get_error_threshold(&ctx);
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false,
> +			     "Failed to query GT correctable error threshold before injection\n");
> +	}
> +	current_threshold = ctx.error_threshold;
> +	igt_info("Current GT Correctable error threshold: %u\n", current_threshold);
> +
> +	for (int i = 0; i < 16; i++) {
> +		igt_info("****** Injection iteration: %d ***********\n", i + 1);
> +		/* Inject a GT correctable error */
> +		l2_bank_corr_err_injection(mmio, fd);
> +
> +		/* Query error counter after injection */
> +		ret = get_error_counter(&ctx);
> +		if (ret < 0) {
> +			CLEANUP_ON_ERROR(ctx, fw_handle);
> +			igt_assert_f(false,
> +				     "Failed to query GT correctable error counter:iteration %d\n",
> +				     i + 1);
> +		}
> +		gt_corr_counter_current = ctx.error_value;
> +		igt_info("GT Correctable error counter incremented by : %u "
> +			 "since before initial injection\n",
> +			 gt_corr_counter_current - gt_corr_counter_before);
> +	}
> +
> +	/* Confirm whether error counter incremented by 16 after 16 injections */
> +	if ((gt_corr_counter_current - gt_corr_counter_before) == 16) {
> +		log_status(true, "L2 Bank Correctable Error Injection 16 times");
> +	} else {
> +		log_status(false, "L2 Bank Correctable Error Injection 16 times");
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false,
> +			     "GT Correctable error counter didn't increment "
> +			     "by 16 after 16 injections\n");
> +	}
> +
> +	ret = wait_for_error_notify_event(&ctx, event_timeout);
> +	if (ret == 0 && ctx.event_error_value == 1) {
> +		log_status(true, "L2 Bank Correctable Error Injection 16 times");
> +	} else {
> +		log_status(false, "L2 Bank Correctable Error Injection 16 times");
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false, "Did not receive expected MSI event or "
> +			     "error_value after injection\n");
> +	}
> +
> +	CLEANUP_ON_ERROR(ctx, fw_handle);
> +}
> +
> +/**
> + * SUBTEST: l2-bank-single-corr-err
> + * Description: Inject single bit error injection in SSA data array when this bit is written
> + * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
> + * Functionality: error injection
> + */
> +static void l2_bank_single_corr_err_injection(struct xe_mmio *mmio, int fd)
> +{
> +	int fw_handle;
> +	int ret;
> +	uint32_t gt_corr_counter_before = 0, gt_corr_counter_after = 0;
> +	struct app_context ctx;
> +
> +	fw_handle = acquire_forcewake(fd);
> +
> +	ret = init_nl_socket(&ctx);
> +	if (ret < 0) {
> +		release_forcewake(fw_handle);
> +		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
> +	}
> +
> +	/* Query error counter before injection */
> +	ctx.node_id = 0;
> +	ctx.error_id = 1;
> +	ret = get_error_counter(&ctx);
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false,
> +			     "Failed to query GT correctable error counter before injection\n");
> +	}
> +	gt_corr_counter_before = ctx.error_value;
> +	igt_info("GT Correctable error counter before injection: %u\n", gt_corr_counter_before);
> +
> +	/* Inject a GT correctable error */
> +	l2_bank_corr_err_injection(mmio, fd);
> +
> +	/* Query error counter after injection */
> +	ret = get_error_counter(&ctx);
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false,
> +			     "Failed to query GT correctable error counter after injection\n");
> +	}
> +	gt_corr_counter_after = ctx.error_value;
> +	igt_info("GT Correctable error counter after injection: %u\n", gt_corr_counter_after);
> +
> +	if (gt_corr_counter_after > gt_corr_counter_before) {
> +		igt_info("GT Correctable error counter incremented by %u after injection\n",
> +			 gt_corr_counter_after - gt_corr_counter_before);
> +		log_status(true, "L2 Bank Correctable Error");
> +	} else {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false,
> +			     "L2 Bank (GT) Correctable Error Injection count not incremented\n");
> +	}
> +
> +	CLEANUP_ON_ERROR(ctx, fw_handle);
> +}
> +
>   static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
>   {
>   	igt_info("Starting Error Injection test: %s\n", injection);
> @@ -306,6 +546,18 @@ int igt_main()
>   		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
>   	}
>   
> +	igt_describe("Inject GT correctable error and validate error-notify event with threshold set to 1.");
> +	igt_subtest("l2-bank-corr-err-threshold-1")
> +		l2_bank_corr_err_injection_with_threshold_1(&mmio, fd);
Could this be also added as part of inject_error() ?
> +
> +	igt_describe("Inject GT correctable error 16 times and validate counter/event behavior.");
> +	igt_subtest("l2-bank-corr-err-16-times")
> +		l2_bank_corr_err_injection_16_times(&mmio, fd);
Same as above.
> +
> +	igt_describe("Inject a single GT correctable error and validate counter increment.");
> +	igt_subtest("l2-bank-single-corr-err")
> +		l2_bank_single_corr_err_injection(&mmio, fd);

Same as above.

Thanks,
Soham

> +
>   	igt_fixture() {
>   		xe_mmio_access_fini(&mmio);
>   		drm_close_driver(fd);
> diff --git a/tests/intel/xe_err_injection.h b/tests/intel/xe_err_injection.h
> index d7efc2fd2..1a9ea2f2e 100644
> --- a/tests/intel/xe_err_injection.h
> +++ b/tests/intel/xe_err_injection.h
> @@ -15,4 +15,14 @@
>   #define POST_RECOVERY_WL 1
>   #define POST_ARMING_INJECTION_WL 0
>   
> +/* L2 Bank (LBCFLOCKMSGREG) error injection */
> +#define L2_BANK_ERR_INJ 0xB1B4
> +#define DATA_1BIT_ERR_INJ_REQ (1 << 3)
> +#define FUSA_TEST_MODE_ERR_INJ_REQ (1 << 2)
> +#define MASK_BIT_FOR_DATA_1BIT_ERR_INJ_REQ (1 << 19)
> +#define MASK_BIT_FOR_FUSA_TEST_MODE_ERR_INJ_REQ (1 << 18)
> +#define L2_BANK_DATA_1BIT_ERR_INJ_CONFIG \
> +	(DATA_1BIT_ERR_INJ_REQ | FUSA_TEST_MODE_ERR_INJ_REQ | \
> +	 MASK_BIT_FOR_DATA_1BIT_ERR_INJ_REQ | MASK_BIT_FOR_FUSA_TEST_MODE_ERR_INJ_REQ)
> +
>   #endif /* XE_ERR_INJECTION_H */
--------------tGHndfRCZEGnLqI0D30p0uis
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Ravi,</p>
    <div class="moz-cite-prefix">On 29-07-2026 17:49, Ravi Kishore
      Koppuravuri wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260729121959.603890-8-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">Introduced L2 bank correctable error threshold subtests:
   - single correctable error
   - Correctable error with threshold set to 1
   - 16 Correctable error injections with threshold set to 0xF

Add DRM RAS netlink error-notify event subscription to verify
correctable error detection across all the above subtests.

Signed-off-by: Ravi Kishore Koppuravuri <a class="moz-txt-link-rfc2396E" href="mailto:ravi.kishore.koppuravuri@intel.com">&lt;ravi.kishore.koppuravuri@intel.com&gt;</a>
---
 tests/intel/xe_err_injection.c | 252 +++++++++++++++++++++++++++++++++
 tests/intel/xe_err_injection.h |  10 ++
 2 files changed, 262 insertions(+)

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index afbaf0646..0303f4a56 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -35,6 +35,14 @@ enum {
 	RECOVERY_TIMEOUT = 3,
 };
 
+time_t event_timeout = 10 * 1000; /* 10 seconds */
+
+/* Cleanup helper for injection test functions */
+#define CLEANUP_ON_ERROR(ctx, fw_handle) do { \
+	cleanup_nl_socket(&amp;ctx); \
+	release_forcewake(fw_handle); \
+} while (0)
+
 static void run_xe_compute_on_all_engines(int fd, bool state)
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -268,6 +276,238 @@ static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
 	gt_uc_wkr_parity_recovered = true;
 }
 
+/* Inject a GT correctable error */
+static void l2_bank_corr_err_injection(struct xe_mmio *mmio, int fd)
+{
+	/* Arm the Injection */
+	write_reg(mmio, L2_BANK_ERR_INJ, L2_BANK_DATA_1BIT_ERR_INJ_CONFIG);
+	igt_info(&quot;Armed L2 Bank Correctable Error Injection\n&quot;);
+}
+
+/**
+ * SUBTEST: l2-bank-corr-err-threshold-1
+ * Description: Inject single bit error injection in SSA data array when this bit is written
+ * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
+ * Functionality: error injection
+ */
+static void l2_bank_corr_err_injection_with_threshold_1(struct xe_mmio *mmio, int fd)
+{
+	int fw_handle;
+	int ret;
+	uint32_t current_threshold = UINT32_MAX;
+	struct app_context ctx;
+
+	fw_handle = acquire_forcewake(fd);
+
+	ret = init_nl_socket(&amp;ctx);
+	if (ret &lt; 0) {
+		release_forcewake(fw_handle);
+		igt_assert_f(false, &quot;Failed to initialize netlink socket (ret=%d)\n&quot;, ret);
+	}
+
+	/* Subscribe to error-notify */
+	ret = subscribe_error_notify(&amp;ctx, DRM_RAS_MCGRP_ERROR_NOTIFY);
+	if (ret &lt; 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, &quot;Failed to subscribe to error-notify (ret=%d)\n&quot;, ret);
+	}
+
+	/* get current GT Correctable error threshold */
+	ctx.node_id = 0;
+	ctx.error_id = 1;
+	ret = get_error_threshold(&amp;ctx);
+	if (ret &lt; 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, &quot;Failed to query GT correctable error threshold before injection\n&quot;);
+	}
+	current_threshold = ctx.error_threshold;
+	igt_info(&quot;Current GT Correctable error threshold: %u\n&quot;, current_threshold);
+
+	/* Set GT Correctable error threshold to 1 */
+	ctx.error_threshold = 1;
+	ret = set_error_threshold(&amp;ctx);
+	if (ret &lt; 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, &quot;Failed to set GT correctable error threshold before injection\n&quot;);
+	}
+
+	/* Inject a GT correctable error */
+	l2_bank_corr_err_injection(mmio, fd);
+
+	ret = wait_for_error_notify_event(&amp;ctx, event_timeout); /* wait for 10 secs */
+	if (ret == 0 &amp;&amp; ctx.event_error_value == 1) {
+		log_status(true, &quot;L2 Bank Correctable Error with threshold 1&quot;);
+	} else {
+		log_status(false, &quot;L2 Bank Correctable Error with threshold 1&quot;);
+		/* restore threshold before failing */
+		ctx.error_threshold = current_threshold;
+		set_error_threshold(&amp;ctx);
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, &quot;Did not receive expected RAS event or error_value after injection\n&quot;);
+	}
+
+	/* restore GT Correctable error threshold to original value */
+	ctx.error_threshold = current_threshold;
+	ret = set_error_threshold(&amp;ctx);
+	if (ret &lt; 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, &quot;Failed to restore GT correctable error threshold after injection\n&quot;);
+	}
+
+	CLEANUP_ON_ERROR(ctx, fw_handle);
+}
+
+/**
+ * SUBTEST: l2-bank-corr-err-16-times
+ * Description: Inject single bit error injection in SSA data array when this bit is written
+ * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
+ * Functionality: error injection
+ */
+static void l2_bank_corr_err_injection_16_times(struct xe_mmio *mmio, int fd)
+{
+	int fw_handle;
+	uint32_t current_threshold = UINT32_MAX;
+	uint32_t gt_corr_counter_before = 0, gt_corr_counter_current = 0;
+	int ret;
+	struct app_context ctx;
+
+	fw_handle = acquire_forcewake(fd);
+
+	ret = init_nl_socket(&amp;ctx);
+	if (ret &lt; 0) {
+		release_forcewake(fw_handle);
+		igt_assert_f(false, &quot;Failed to initialize netlink socket (ret=%d)\n&quot;, ret);
+	}
+
+	ret = subscribe_error_notify(&amp;ctx, DRM_RAS_MCGRP_ERROR_NOTIFY);
+	if (ret &lt; 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, &quot;Failed to subscribe to error-notify (ret=%d)\n&quot;, ret);
+	}
+
+	/* Query error counter before injection */
+	ctx.node_id = 0;
+	ctx.error_id = 1;
+	ret = get_error_counter(&amp;ctx);
+	if (ret &lt; 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     &quot;Failed to query GT correctable error counter before injection\n&quot;);
+	}
+	gt_corr_counter_before = ctx.error_value;
+
+	/* get current GT Correctable error threshold */
+	ret = get_error_threshold(&amp;ctx);
+	if (ret &lt; 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     &quot;Failed to query GT correctable error threshold before injection\n&quot;);
+	}
+	current_threshold = ctx.error_threshold;
+	igt_info(&quot;Current GT Correctable error threshold: %u\n&quot;, current_threshold);
+
+	for (int i = 0; i &lt; 16; i++) {
+		igt_info(&quot;****** Injection iteration: %d ***********\n&quot;, i + 1);
+		/* Inject a GT correctable error */
+		l2_bank_corr_err_injection(mmio, fd);
+
+		/* Query error counter after injection */
+		ret = get_error_counter(&amp;ctx);
+		if (ret &lt; 0) {
+			CLEANUP_ON_ERROR(ctx, fw_handle);
+			igt_assert_f(false,
+				     &quot;Failed to query GT correctable error counter:iteration %d\n&quot;,
+				     i + 1);
+		}
+		gt_corr_counter_current = ctx.error_value;
+		igt_info(&quot;GT Correctable error counter incremented by : %u &quot;
+			 &quot;since before initial injection\n&quot;,
+			 gt_corr_counter_current - gt_corr_counter_before);
+	}
+
+	/* Confirm whether error counter incremented by 16 after 16 injections */
+	if ((gt_corr_counter_current - gt_corr_counter_before) == 16) {
+		log_status(true, &quot;L2 Bank Correctable Error Injection 16 times&quot;);
+	} else {
+		log_status(false, &quot;L2 Bank Correctable Error Injection 16 times&quot;);
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     &quot;GT Correctable error counter didn't increment &quot;
+			     &quot;by 16 after 16 injections\n&quot;);
+	}
+
+	ret = wait_for_error_notify_event(&amp;ctx, event_timeout);
+	if (ret == 0 &amp;&amp; ctx.event_error_value == 1) {
+		log_status(true, &quot;L2 Bank Correctable Error Injection 16 times&quot;);
+	} else {
+		log_status(false, &quot;L2 Bank Correctable Error Injection 16 times&quot;);
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false, &quot;Did not receive expected MSI event or &quot;
+			     &quot;error_value after injection\n&quot;);
+	}
+
+	CLEANUP_ON_ERROR(ctx, fw_handle);
+}
+
+/**
+ * SUBTEST: l2-bank-single-corr-err
+ * Description: Inject single bit error injection in SSA data array when this bit is written
+ * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
+ * Functionality: error injection
+ */
+static void l2_bank_single_corr_err_injection(struct xe_mmio *mmio, int fd)
+{
+	int fw_handle;
+	int ret;
+	uint32_t gt_corr_counter_before = 0, gt_corr_counter_after = 0;
+	struct app_context ctx;
+
+	fw_handle = acquire_forcewake(fd);
+
+	ret = init_nl_socket(&amp;ctx);
+	if (ret &lt; 0) {
+		release_forcewake(fw_handle);
+		igt_assert_f(false, &quot;Failed to initialize netlink socket (ret=%d)\n&quot;, ret);
+	}
+
+	/* Query error counter before injection */
+	ctx.node_id = 0;
+	ctx.error_id = 1;
+	ret = get_error_counter(&amp;ctx);
+	if (ret &lt; 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     &quot;Failed to query GT correctable error counter before injection\n&quot;);
+	}
+	gt_corr_counter_before = ctx.error_value;
+	igt_info(&quot;GT Correctable error counter before injection: %u\n&quot;, gt_corr_counter_before);
+
+	/* Inject a GT correctable error */
+	l2_bank_corr_err_injection(mmio, fd);
+
+	/* Query error counter after injection */
+	ret = get_error_counter(&amp;ctx);
+	if (ret &lt; 0) {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     &quot;Failed to query GT correctable error counter after injection\n&quot;);
+	}
+	gt_corr_counter_after = ctx.error_value;
+	igt_info(&quot;GT Correctable error counter after injection: %u\n&quot;, gt_corr_counter_after);
+
+	if (gt_corr_counter_after &gt; gt_corr_counter_before) {
+		igt_info(&quot;GT Correctable error counter incremented by %u after injection\n&quot;,
+			 gt_corr_counter_after - gt_corr_counter_before);
+		log_status(true, &quot;L2 Bank Correctable Error&quot;);
+	} else {
+		CLEANUP_ON_ERROR(ctx, fw_handle);
+		igt_assert_f(false,
+			     &quot;L2 Bank (GT) Correctable Error Injection count not incremented\n&quot;);
+	}
+
+	CLEANUP_ON_ERROR(ctx, fw_handle);
+}
+
 static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
 {
 	igt_info(&quot;Starting Error Injection test: %s\n&quot;, injection);
@@ -306,6 +546,18 @@ int igt_main()
 		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
 	}
 
+	igt_describe(&quot;Inject GT correctable error and validate error-notify event with threshold set to 1.&quot;);
+	igt_subtest(&quot;l2-bank-corr-err-threshold-1&quot;)
+		l2_bank_corr_err_injection_with_threshold_1(&amp;mmio, fd);</pre>
    </blockquote>
    Could this be also added as part of <span style="white-space: pre-wrap">inject_error() ?</span>
    <blockquote type="cite" cite="mid:20260729121959.603890-8-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	igt_describe(&quot;Inject GT correctable error 16 times and validate counter/event behavior.&quot;);
+	igt_subtest(&quot;l2-bank-corr-err-16-times&quot;)
+		l2_bank_corr_err_injection_16_times(&amp;mmio, fd);</pre>
    </blockquote>
    Same as above.
    <blockquote type="cite" cite="mid:20260729121959.603890-8-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	igt_describe(&quot;Inject a single GT correctable error and validate counter increment.&quot;);
+	igt_subtest(&quot;l2-bank-single-corr-err&quot;)
+		l2_bank_single_corr_err_injection(&amp;mmio, fd);</pre>
    </blockquote>
    <p>Same as above.</p>
    <p>Thanks,<br>
      Soham</p>
    <blockquote type="cite" cite="mid:20260729121959.603890-8-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
 	igt_fixture() {
 		xe_mmio_access_fini(&amp;mmio);
 		drm_close_driver(fd);
diff --git a/tests/intel/xe_err_injection.h b/tests/intel/xe_err_injection.h
index d7efc2fd2..1a9ea2f2e 100644
--- a/tests/intel/xe_err_injection.h
+++ b/tests/intel/xe_err_injection.h
@@ -15,4 +15,14 @@
 #define POST_RECOVERY_WL 1
 #define POST_ARMING_INJECTION_WL 0
 
+/* L2 Bank (LBCFLOCKMSGREG) error injection */
+#define L2_BANK_ERR_INJ 0xB1B4
+#define DATA_1BIT_ERR_INJ_REQ (1 &lt;&lt; 3)
+#define FUSA_TEST_MODE_ERR_INJ_REQ (1 &lt;&lt; 2)
+#define MASK_BIT_FOR_DATA_1BIT_ERR_INJ_REQ (1 &lt;&lt; 19)
+#define MASK_BIT_FOR_FUSA_TEST_MODE_ERR_INJ_REQ (1 &lt;&lt; 18)
+#define L2_BANK_DATA_1BIT_ERR_INJ_CONFIG \
+	(DATA_1BIT_ERR_INJ_REQ | FUSA_TEST_MODE_ERR_INJ_REQ | \
+	 MASK_BIT_FOR_DATA_1BIT_ERR_INJ_REQ | MASK_BIT_FOR_FUSA_TEST_MODE_ERR_INJ_REQ)
+
 #endif /* XE_ERR_INJECTION_H */
</pre>
    </blockquote>
  </body>
</html>

--------------tGHndfRCZEGnLqI0D30p0uis--
