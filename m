Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0E6CD98ED
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 18:57:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910CD10F3CE;
	Thu, 18 Jun 2026 18:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ki6MnOBM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1128910F3CE
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 18:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781809034; x=1813345034;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=z0pn1GtGJGarbPAqO95bzjQdL4xgk4b5wHGCwG8b4So=;
 b=ki6MnOBME4OAUutvhtlc6siRFlHhBwSSzjBIfugFoVYLUi0VjJ3ILHgS
 O0Sybw5Mj9YhXpQu7T7/jKBrhGbEb5Ra5KT7Ee9cC9nBaHt2vdzMBvdkG
 cfSKnFQIb6BIYo8sCZCGhwQxhSeMOPucDHZ3x6wU9lCGSFYchEd6Pri6J
 DAW7VxnDVFoQS+F4LvhzTVv7BXO06X9MVNyY2ikWeaAmawt8AKOHNUc6n
 1lKMh4EUi8/SVAfEFHot1lImATMMaHAAFt0D3UhiYRGTqZre2G7GXSpdi
 Jx+A/gBBShlFa0H6thPX9FpK+ZqUTYBtsHBeAY72jhSsCGQO7r4vKZSFP A==;
X-CSE-ConnectionGUID: MCrn8vtYShmsCdCjakeVVw==
X-CSE-MsgGUID: Jz1iUb1iTX2mqhBDH2I9Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="82660110"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="82660110"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 11:57:10 -0700
X-CSE-ConnectionGUID: 48ctl/WlTIGeqdcDrkC6Lw==
X-CSE-MsgGUID: ldz0hQ25RKyX8p0USD5eMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="250350541"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 11:57:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 11:57:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 18 Jun 2026 11:57:08 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.7) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 11:57:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=exNZcpsZwqlBfjOvlaYxaRCPRAwqQqAbWfTENIGhwO35sRy7QJuqI2wndT+u5+KxCVBnAk774TrgW+c1QGDLqirssm7OFqdlldhJeWTFy3TFrChBHfbsPceww49dwhvzJmpw/v/DPhJWXZ/IMwsgakxWn6zeK9KqfpSlFEGCZpFn34n7wNohsQ3Qri7V4QUghYR+y0o4F5X2deiVxjjxZpHvqgjYuShBKofTkPskIma2eyOjs8ZZf0PkCLpc8rS9c+0SxAjHGnrez8Pv+du8n58VPrRtiu0t141Nf44XUqaZG0DioMZVAFFWGHoxbo2a9tE4Eu/DkdNs3Al9MCETvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+b0F9f/QwikpI4bbsP11pd6zegP537TYL3B4mwqNnQ=;
 b=DQ7enLtahX2Z1mTwbQo+wl6E67Sg8MB1Acdkk3rVxKANO45FSH7gmBlzhunRT9drxuSuq8dxh4zme/FByKDedGSVG5aBgULYg4tbBL0WPXP7BbCMoBOg624xeA0snlyBFUDnhZ8Y4QNBsx6uZ6Llvr4n1erfxCY6rjbJxZZkc6N81zMjuPwtgkpbbIxQGhEncqARZIuXWBB/AIigAfYmYMjZpQiEkGBVKb6uHZFOfyngg/hO5AdnuxQKak4f21pGOh3f2Hk5C+/ASOGv1vfgIJcK2Y/szHFu/OIyMYFecXHHAeMYHRkCSt6EVyGZtvqcwbzF3FEBzqsDAQttIjMTFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by SJ5PPF12B0A4A9B.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::811) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 18:57:04 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 18:57:04 +0000
Message-ID: <8eba7d04-07a3-4bb0-9658-b5d644bf0098@intel.com>
Date: Fri, 19 Jun 2026 00:26:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/5] tests/gem_exec_lut_handle: use
 hars_petruska_f54_1_random() from lib/rand
To: Jani Nikula <jani.nikula@intel.com>, <igt-dev@lists.freedesktop.org>
References: <cover.1781791747.git.jani.nikula@intel.com>
 <5557fc29347fa3a35254ea56c57d81766e6973c0.1781791747.git.jani.nikula@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <5557fc29347fa3a35254ea56c57d81766e6973c0.1781791747.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0038.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::7) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|SJ5PPF12B0A4A9B:EE_
X-MS-Office365-Filtering-Correlation-Id: 88c6992e-84c5-452f-e145-08decd6b62fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: gwuTLNGwYiH/8Y1CoEgv+bOxVMBS/u9fqKOMoSKQkpi3sYbZm1BYQIHttMcSdEfyt1jSx4m1hNZ6viPAHf1AoCC60FHU/FxBwPFxzw3gZd92CMi9T/mKKQ1wrMW/YnAu0kEcz9LWZzHr32zAWYGtASPJ/Tp4tCzynnsYKFnWbMqiVgBBZMiNvWYObxTGCgOjQHTeHSPc18Z7vY4sxDBBlZztM96WxSCUgD/MCdU5suvLJQ7t6w5hQrlNlIFrZRnHweYEcQsIai1W1IyO4STOsAkdEww56b+Q5Oc05Zsbw8e76pFiR98d+yWm+yLd0VVY4+ZSsY8Yg4AXj6tITxryksq/Ac++dsqVFKFnupZ4uT8OBY2BYYCPunjrrzLGytQI72S5/gzbtQ5xhvGtSEySnrvkhZ/S6usAU3jVNqRba/iEGM1XcHrucPOmE2Cmuv7BPZqNqP13u+pPXSNSADqETaIFVHFUTlwns6HfXfUHEOdLvM9wd1KwpsQqw1v4SRCjBCqalhh0bi6W3KCD/awKPZiLc91BG3uDj/yzmOBzmCE7LwSU3Y7CisDiQaLwnYUFIw3AW+5VK4XnRc3XhdjxnUHQDn+NShPQHTLvxIV5V1m5U8fpfFVCsBvxYuD7zmROn2vswJs2cU/ZnCQXpGOZid959vWBGj+CSNmWyyJTHnhvNOKyGQtC1GosgnxT4vMs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3RJWEVUbUxkb1ozOUQ4Q3JmejluWWlIRHZ1YWNET3VZNTdOTmJ0NVlaV09x?=
 =?utf-8?B?QSszRU9RK1BnSThQRHl5RjZ3YlRYOVpQaEN6Z24zSG1hdmJ3OWNwNkFvK3JK?=
 =?utf-8?B?QTRWZS9HNk9FSCtFSHNQSnRnelRKSDA1WXZXUnNJZFhvSTR2aFZtTk0zYXpU?=
 =?utf-8?B?clk0ME5yU3dFU0s4elllOWZEZHJLN1ZNc0V2azltTUVkdVRmVW1MYUFyb0dz?=
 =?utf-8?B?RGZFL3IvTG8vYjVvTnQ1aTIremlaam9rS0tzOXNwb2wxaVVSVVJ3OXhxeVAr?=
 =?utf-8?B?TXRvWTlQeDhMSFBJRUIvblF4Yk9xaGFCV2psMDJUK0FURGxua2p6TEQvWUUx?=
 =?utf-8?B?SERic2FHV1VQSjQzRjJGL0tyVks5R25nNW0vQnZSbGhTQ3p1OGlWbkIweEV0?=
 =?utf-8?B?WjhLUzNZcno0dzZGazVpZTJqSndjVUxPd1lWTlFXaVJtTjhjZU1TZm5mRzhR?=
 =?utf-8?B?K2l2UmtMQVIydVp6OXkzQmM0STFhQkpxa3poeU84dElDQ3Q4UDllcVdXY1ht?=
 =?utf-8?B?T0lGRmlkWC9QSUVRYmNTTjczc2xnYjZudmU3RXJUUk9CcU0wVk9UUiswTDRt?=
 =?utf-8?B?VnoxY3lPV1ppS05OcHhFa2hNVm5QOW9FMnpjWnF6cWUrTGVRWDNuaU02UEVv?=
 =?utf-8?B?R0JvV2JpTzJ3dU5Ua2dvcldSU3pRYnZFUVU4Zm42QXRPYXpqY21Ub2JWa2tC?=
 =?utf-8?B?QzVIYW95ekc5NmswMGlTV2NlUzJMUk1LbnJYSHB3eTZvdWRGSGNpWmNPVkI4?=
 =?utf-8?B?THplZWpmcjVZN3ZIcXg5MDhwaElvdkNqcWhrbndZbFVBNXZ1UEd6RDdFTk5o?=
 =?utf-8?B?RkRHMW9neXZ2R2dNWEx2Y3J5Z2o4QkF3d3RhWTJFZlpCNjYzK1p6S3plT2lN?=
 =?utf-8?B?aFUvZk45YWVoQnh0RjNmN1N2Z3FuWFBUTVVGclpmYjRFcFFCRUxyUnAyTHdF?=
 =?utf-8?B?YkFUSG5OTzJFcDl0aFVHbWtNY3prbHFGNVRQZTVNTXpmb0tGVzlzRjlNM0Ev?=
 =?utf-8?B?R3hNYzZTVWNrdnJJOWZzUHN6TytaU056NC9wTlZ0SVV1NnBqSndHZXg0MGUy?=
 =?utf-8?B?K1JZTVFRU2NyQzYzVmVGVXBpM0lLZU5pTmtEZ2Vobng5RmswWWxzMFkxN0M2?=
 =?utf-8?B?WWg4L2UrZUFBako4WjJLWThFa0N1OXJxcGZRSWVlYzZ1eVF6dkFGM001K1A1?=
 =?utf-8?B?dWRxQ1ZZSVA3UlVCdFB3UUtmdEtUQzhBMml0ZUZKRUNYa3hackNadEEzMzRT?=
 =?utf-8?B?UiszOTlXblZpb3VvRGxsTytzUFJVWGFpMmJ1MTNScFJXVFhCcklBR1RBMkZo?=
 =?utf-8?B?alpjQlhZWk9IZmZIMXp0NklrYXFmVmNOS0FBVitvYVhIT1phaEVSZHp5R3Bl?=
 =?utf-8?B?cnE0SjlIem5nTi9sb0FZbFd2dEo5NFhPcnJpN1dSMTBFZjZrQXFtUXBzVVJF?=
 =?utf-8?B?U0VHeWVsMWpyZnhnNXc1SS9iYmQ0ekJTeEk0bXljcklaWVBialhtNXFTbnln?=
 =?utf-8?B?KzBKVVE0SlFYM1N5dG9KL2dLcWhPKzVtV2NBYk9iVVk3OG1Ua2QzN0FKdTZN?=
 =?utf-8?B?MGxQOEJJcnA3V3RJd201ZTRRMnE2WmJibUNhSkgxVnZ1aDlzVll1VlhqRElD?=
 =?utf-8?B?MVRBMDhZVHZHZ3d2WGVYNVlFWUsvQnFSMm01bDYwVlB3ZTh0U1h4SytoZS9t?=
 =?utf-8?B?RjJ3ckQrM0I2TlMzMEgwM3ZIbGZiTVFMMlN5N0FBZC9nWkVVV3ArRGtQbk90?=
 =?utf-8?B?cTdVeWd2TmFrVUw5YkpFdlZkaWhTWkdqeFB4ZGg2ZUorTDk5WCtwS1RpcUsz?=
 =?utf-8?B?Vk5xWjIxM3FjOFpCU0ZxekFjaHlNSElibmFzQkpPZG5FV05paDBsdGFtaStJ?=
 =?utf-8?B?bmVSK0JJRmhRcEFvUWEzK0lIdnpDZGNzbC9pUnVVYUxXYS9Od0NpaWNkdllM?=
 =?utf-8?B?N0FuZmhqVkJTOTE0dlBRMjFxVldtNzhUbkhCc0RVWEJrTWcxT2J3Y1FHZHpW?=
 =?utf-8?B?ajNRWkdqQi83UHlTL012M0dsZ3hBVW9uSHdFcHVmWjhVTFdoaWE3VFloMU9m?=
 =?utf-8?B?ZHlnbUxBckt0MjdGZnZHR2dqdUIyYmNVMGNnNmhFdmtYbEh4eHpjbFdqSlhC?=
 =?utf-8?B?cXQ4dXprUUVYNTg1Z29TcTIxaUNta2M3STlWclAwVWhDWi9FVWFRTzUxaTI2?=
 =?utf-8?B?a2E2Znp0Vy9xSng0M09ub2hwazdCVDd3c25xbDZoc1dCM1NRa0dsWkdXWXda?=
 =?utf-8?B?cVE4dE8vbkJkNnpWeFk1SnRMcS9wYU5FcXVzMGpFVmhnS0xzNkRsUmMrcDFR?=
 =?utf-8?B?OHpSSDVkT3ZXRkhWam1JWEEwTFcyRFRTQ0hWbTVGTlJTeU94clVlZz09?=
X-Exchange-RoutingPolicyChecked: sBpWOfGUHDSN1G20Y5uaE9R6b0KBNiN75B7N7wCdSNJ1K4FdMY4bAhHcVmz1vrRNrt2YPTewm7IN8A/qqo36vWD07/61p1FzEbktCP6kYb4kn2Jcj2W+gKIHELpVH4/O3uFSztVyoIEzWHCWSS2b7qriGJ393bKnipg5lSB068WG/Outyi6mF/rhwS0MrBjkQ1Y7a8bDVBJE7LzJAurx/iXROtbDg+6ou+3O2c5JFS6j0QVLfS55no64ELT87693phcCd19KhLnNXayK5WM+z+joz2ZWsXkxo1OZsLtZyg6lIqmKwvuLRe3PTU4cLEl0Gmb535LC4GGMRYqjzZv9eg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c6992e-84c5-452f-e145-08decd6b62fe
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 18:57:04.2942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VOdJJnIYpJxqAL4gm+Oel7Qe9ILAr6gOAD+rxVBwcTurvRyy8m94XhXu1nO/aR9uIyZ5h628hv4q2fQ9FojYow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF12B0A4A9B
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

Hi Jani

On 18-06-2026 07:39 pm, Jani Nikula wrote:
> Remove the local duplicate of hars_petruska_f54_1_random() by switching
> to use lib/rand.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

> ---
>   tests/intel/gem_exec_lut_handle.c | 14 ++++----------
>   1 file changed, 4 insertions(+), 10 deletions(-)
>
> diff --git a/tests/intel/gem_exec_lut_handle.c b/tests/intel/gem_exec_lut_handle.c
> index fac7f2fbb45f..6ed304fc6d5e 100644
> --- a/tests/intel/gem_exec_lut_handle.c
> +++ b/tests/intel/gem_exec_lut_handle.c
> @@ -40,6 +40,8 @@
>   #include "i915/gem.h"
>   #include "i915/gem_create.h"
>   #include "igt.h"
> +#include "igt_rand.h"
> +
>   /**
>    * TEST: gem exec lut handle
>    * Description: Exercises the basic execbuffer using the handle LUT interface.
> @@ -65,15 +67,7 @@ int target[MAX_NUM_RELOC];
>   struct drm_i915_gem_exec_object2 gem_exec[MAX_NUM_EXEC+1];
>   struct drm_i915_gem_relocation_entry mem_reloc[MAX_NUM_RELOC];
>   
> -static uint32_t state = 0x12345678;
> -
> -static uint32_t
> -hars_petruska_f54_1_random (void)
> -{
> -#define rol(x,k) ((x << k) | (x >> (32-k)))
> -    return state = (state ^ rol (state, 5) ^ rol (state, 24)) + 0x37798849;
> -#undef rol
> -}
> +static uint32_t random_state = 0x12345678;
>   
>   static int has_exec_lut(int fd)
>   {
> @@ -164,7 +158,7 @@ int igt_simple_main()
>   					execbuf.flags |= I915_EXEC_NO_RELOC;
>   
>   				for (j = 0; j < m; j++) {
> -					target[j] = hars_petruska_f54_1_random() % n;
> +					target[j] = hars_petruska_f54_1_random(&random_state) % n;
>   					reloc[j].target_handle = target[j];
>   					reloc[j].presumed_offset = -1;
>   				}
