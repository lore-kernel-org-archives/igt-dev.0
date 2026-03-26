Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7B5109E53C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 02:32:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9388C10E8F5;
	Thu, 26 Mar 2026 02:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ls5tmzcg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2073410E8F5
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 02:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774492347; x=1806028347;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mKAx/OrDzUmgaBcYxjudneK8WRbvts/BeQTt/oP0TyA=;
 b=ls5tmzcgfXKeo6F8W4tpSq7vD4bxrkX0ar2/wZ++GEGPwWMxWrUJMg32
 tmQ1XwkGx/7HX4Lav+osrS6AjvIMKJ5ZwyW73yL0j9uYQy6mULESUxMHI
 5b3ZFdhLSPSqtSi9jxk1EEEZn8EluMHsZkljxO2PnhKAxZQYVZXZlVpBh
 OmsfEiWq9jE+yB76VW929m3KNttUUN23QYhY1sm0fanfJ4/Uv9LtZ8knm
 ElxS1qNeGZLrY8+2VD9+jJZBWMA0w/tBQBHTdU8A5ZXa/E6lzLfcG8KyL
 ULUPWM4Vb6sJGclaWSEVcX8m3N24Fv6ubdhgEYsjbrDjalhvwHao1jX/4 A==;
X-CSE-ConnectionGUID: 3WicpYKWTY6pkbSCd4YbGQ==
X-CSE-MsgGUID: AiUWlypOQAmuB7tdRlzYQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75428371"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="75428371"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 19:32:26 -0700
X-CSE-ConnectionGUID: MsDlWz3QQmSVsioNl9AMOw==
X-CSE-MsgGUID: w4BhaV0ySf+XQLH9GivkFg==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 19:32:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 19:32:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 19:32:24 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 19:32:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CpJIqmBYUZ9hA5/6YBfpfto/mtND5G9xR+YcuJe8HZQAH32azAUIAbo4aPJ1Njlw8LQQ6DyfLBjtbS7fN5Val8E2G0+DPiGTAN6lGhWS0z+UaiDx3oJeXXyrnTNqfy8XotTu2aiRjaxUTXlmYV5xRYmsOOAGWoei082aHV9aK/tv9NaTFjIqPx+tWR6/gsrHs8NhtZ88z0KD0DUEY+UhB75Jo9rmkSwbRe0fKqP4a+lNpF6yWhNCoF6hYVAH8SCtzr3cMeLG1or79jeIClL5lmTJvIcQwgkF5Etg0x/6N4ViBUGKAbS8iAVzcdlXxlLxt8xlnHjXhSee52aZrpMxzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5fuByuw/CNZEnl1nJuaeFyJW2hWC1J7LT6TRw1TREc=;
 b=HG2BfTb13E7daX4oo75U7ei9isX+dmA8MlDpBjKQsugweauf/7g2TyfHGR2NpsOJHXGa1OuNq4EJ1eYaFIuDahGkSmPrGYessp1o+IXgLj5Q96axSk3Bqt5AVik9XANvqewR7Km6vEmeesu73FOwkMXv4GIQfuzZy5tGL9azoMP0zDI+c8Sus0tUZqJgLTWWVMsOZQqNzGX2G+YLAZcPwfQ28etzLPmVKoj8k1wtbR1nojJ3IM19apTQqyNMVwBAeDDK/kTAKAb8UU+i1bvlBzcPnbgh5BSqO9SXnpsmALp+gSNxlOUHmdTFXMg/a9cF7tBbRXUwpz15UDQh5P7MpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA3PR11MB8893.namprd11.prod.outlook.com (2603:10b6:208:577::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 26 Mar
 2026 02:18:11 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 02:18:10 +0000
Message-ID: <0b8cc639-caa8-4130-a47f-83b144461aba@intel.com>
Date: Thu, 26 Mar 2026 07:48:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci: Blocklist BMG specific modifiers on
 NVL/PTL
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Jeevan B <jeevan.b@intel.com>
References: <20260325123237.692836-1-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260325123237.692836-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0057.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::7) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA3PR11MB8893:EE_
X-MS-Office365-Filtering-Correlation-Id: 70b189b8-81d1-4912-3413-08de8addecc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|376014|366016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: khbxDTLWaOEWTpl6THWPk+es94Qn2sXPIDXrW686BZFJokuft7fPVahsXPcktFoX8TQLVjhDZSM+35Xc+DonN0SoeXxkeA7AtOMymNFwy70D+2uHF/F9oPMD7Y1in1rfj2ZSV0xqntFf1U4kFjdgAW9987UTQa3Ll+BkDKvRNP/IADys07Ytupnpq1tjs97gTpa5CeXPj/NaspZJn8jkamOeiCRF6lRjGd2xf+mo7bd3oRlO8S7DTv9NYgMQzYPopQwWKMZV7Ha6sskSCyVtJuSKIAr0tz0efiWwz4lLYkb8MlBn4CkTiGhLh/7xVRP1AZeqqfNh/Gerznf7Q9o/xye+2bnbrhfVc7SYP51EdAUbv50crdm/cXevgPRN5L0LGOKTIk2E0tjDvKkNMH4cn5xfdSf9KorK1S0bcfRaun5ZQTbPxjX2gw0VlErnxe+YVGOM6fTkKx8li3GGcgjXsC8KYK7q/mNX3d9gRABrf5zSmbAwYeTlMDft9Aj36ICJUIFqzpLb3+yefwWhSnTriNzFzi8YdFkFKvKvR5IXTy6ZdCG1Ovqb/5gQ5y1MtCxoFeYzfbL9uXaBhHDaJZB5eGLuj5x+nUnAlfoWa2z2Be9fuuxtBGmn2rls0mVbqM1EVP0zkok0HlWLm/MBxEUa7bFTWwdUv/LwcFDRBj5S6tIyQFcIa+ZVe5WIqQqxiG0smGW3Sp3ZgT4J+ptuiCr8fB8b5G6qYONkrOl2dos+800=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkpIcUpFUUJOU2R5aHJBNWVjbUoyRU5uYUNsY0JaNjZzalVKdTJ4L2gyUTRp?=
 =?utf-8?B?RU8vY1lIK0JiZmhGbnAwcWpRTWo5VDhydjd6eXM4c0VhbEdoci9GQkFIZWVP?=
 =?utf-8?B?UmIzVWJDMU9EWldYRlp0dTU0a2J4Z1FYT0kwMThYbDZkQUxaS1M2M1BrRWtR?=
 =?utf-8?B?dFVJRnpxeXNqK0ZZT2tDUVl0QURwVU9MZGJBZlRteTZkbEVJR2sycTJ2RmVG?=
 =?utf-8?B?YVFnNzEvR3VxS0dsUjZDbGt4MmVzZU9MMmpyOHg2TXcyb1ZNUTRDR04rUEM1?=
 =?utf-8?B?RVU2b0RTYlVLeUJUZmMwaHhiTWlqSDloUk0vZVBCaFpXS0w0b3hHM2RNR0h6?=
 =?utf-8?B?SDZLYVdIMEI0b3h4YmNLSWw2aVIvTDhzOWFKTVRGTzZFMW1lS29Oa2M5a3Ey?=
 =?utf-8?B?TWwyN05QTFhQUWoydTQ0YVdmbXpxbkJXUGI2NS9YQzFXbTNDWUgySG5XQSts?=
 =?utf-8?B?VWlWL29LVGVEZUxwSUF1NGVVdzhDaU96UlVqVzBvbzQveWxmWVA5Qm1nRXJt?=
 =?utf-8?B?elM1UGkxb0pNOHhtV285dkFTK0VMODMrVzE2bDh2UHpOcG5pT0ZJcWU3Z3RL?=
 =?utf-8?B?ZFcrMGdMQlhkS2ZQU1gwcjd3cjR3dEZuMDRyeGlJWnZjNWRtaXBvRW9uS1Y3?=
 =?utf-8?B?VlRxYVo0YUdlNUxQemNYVjBGREp6NGJ5aEZCM2djOHdpellpamlFdXR6dEox?=
 =?utf-8?B?SGp0Kzg1MXQxOG5VcTBVUHZnL0U3OXorTzZpVU1vR1F4dXlXQ2MvTUtKYkht?=
 =?utf-8?B?Q0hCS0trTGRuT3JwOVV4TVV5VmpreHNLUm9NYSt1TnByTGlHQzhQVFNXQUpI?=
 =?utf-8?B?Zk55cG1hYzlNeGxGWDk3d2k4cmoxZGlPbEQwcGdVS1BONnRTTEVwTk5wN1ha?=
 =?utf-8?B?a1NDZVJaSTBCNFBCZmQrNGlSSWZUTGk1OW5vYUwxaUZmSmpQOGYwcUEzQ3ZL?=
 =?utf-8?B?K1BXTUVtMkY0eHVSM0ZrRktPb2twMEFOdGp5QUs5MjI5V3JQeEVkVXpUK2c4?=
 =?utf-8?B?aGJ2TWg2RzZmNTVmb3M3UXJWNzk5dEQrL3ZBalA2cHFjSTEybzZ4Z2hTSkVQ?=
 =?utf-8?B?aUQ5eGRJaW1ia3VBaWN2YndhbHN1OGNjSGJrMjM2R0RIazI1SCtBT3d1QWVI?=
 =?utf-8?B?c2ZKQVo3YnNHdyszc29XY3FVSGs3dXZoZUROaHkzSTBKa1pWM1hlZHhnYTcw?=
 =?utf-8?B?dmpWMlpuNWVPZ01rQkI5b29oSmgrVWxaZHdpM1YwQ0dFckJsY0dnVTVWcnNB?=
 =?utf-8?B?dEkzQ2lyT1ZLcE1mVStTaHpFRmkrRElaTk1TU2M5WmhoWEljZmZyYllyTmtO?=
 =?utf-8?B?dWc0RW9GS3dWeGRycFlkSHJYM3lwZjBSWFp4b2g1K0V6RDFaYkppSlBzZ0pQ?=
 =?utf-8?B?K0hjbHhaV0VXMUZZUkFnemVEdExnaldBLzlmT0V6NVd1UlZlZDdJSkV6V2l5?=
 =?utf-8?B?NVRRYllSQXBsRXVHU1NEZ05tbldqeG5XMEZFU0MrREZ4S3RTdXhhRjgyRGdP?=
 =?utf-8?B?K28yMWhkdDZaRnhlUVVVbFY1R05jVU1FUkNLUEtwYkhhVXBSVCtkenpLTkFU?=
 =?utf-8?B?elQzZGZUSjhHTDZSbkdUeFg3emlrVnM2TTZ6TzlkWW1rQkkzQmU1NDcwWW4x?=
 =?utf-8?B?SGdZZW8vTUxadFQ0RUV5S3RQZ3hEdFJ3M0l1RHBGcm4vLytlSExPaDZFL1VN?=
 =?utf-8?B?MFNzREh2RVY0elg2MTlxTmhxZFRhMUNyOUZuenpZU2thSFN0US9hbHIxZEIz?=
 =?utf-8?B?NHExNVRGWW9URXorajZaSzFTZTVSNE5zUmZwbHNabm5HUDB0OW1sSHVBU3lO?=
 =?utf-8?B?ajQreERoQmExZVVjalBreXBzbkpuU0lNZGZwWUg0bUpIN1ljWWQxL0U0Vmg4?=
 =?utf-8?B?Nm1PbTlwVFRLRXJXQjU2NkxlL05hSFhUWHJCMXN2TzQwWGU3cGQ3bTJSbEFj?=
 =?utf-8?B?U3lEc3l6TkszeUNFRWlQTzkrTHBobFBZZ3VmY3NTT0JndlpNSUxYWWh6dWlq?=
 =?utf-8?B?ZTlKMUJCNjh3MXFpR1M4VFc1azg0Umc1YjdHL1FhYXpFRnJ5MXZyd0xvY0c5?=
 =?utf-8?B?MWk0ZUJCQzE3Ykt1bHlzWVlCY28vYjducEhPQUx2VTQyZjBRelhvRlduS21w?=
 =?utf-8?B?YWg1YWVZamttRnVJMEtqT1ZLT2tNY2hFNVllVmVMMkF2MUdiWFdFK0FWTDV2?=
 =?utf-8?B?WTAwZjQxUU1qTG10L1VzUEc0M0g2ODQvWlFCc0JQOFcwaEhBVXdZY0JzRXRE?=
 =?utf-8?B?ejlEc3RyZjVrdmhvVFd6ZUg5R2xGZVJyRnBaTWFVeHZNK1JCN2EvWlYvdnVY?=
 =?utf-8?B?NTRkbkRPNExBZ3pXWE9Pem9QanExSXZHWHk4VUIrNU9qSDNyVTlQUT09?=
X-Exchange-RoutingPolicyChecked: whHRwBgEVwNrPvRHAtlOJSRNvvQNk3zRaVP9/VbClwHvnGmGKshHwhE7tEACbG3fdMt9dynk+kdJn4TKUSh6kIjYhPvnEhY2kQPZiTwk3MiBwkfU6ATsmrBwnzQ/SX/wPSZ2EPAab6kpRheU6LAxx2rpx26Ve2QwqNeRv0w3yK9+jO3TI4ktrit9hBcfmgFTMRWX2fAtlsa/6jMfI3pCA5LyxKjgiw+MozsM0GO8uXmvy66XYf+5UeY2oBiTgF3pXsFlWwFlJEDSvkyiImy5npz9zLu2o1jilMVtBdFvsBrWu0IT4p46eAI8mgt2fnbGuAS3yfS+jeXXZUI0mqdb8Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b189b8-81d1-4912-3413-08de8addecc1
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 02:18:10.2137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mCOBvVMW9BkiWTceAt1z8/ZzoJGtyswDtT/3GVP+9t41k39pl5Ksf5hwa0LcYqXY4wGaUpHKdVq8Ut3DURST4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8893
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


On 3/25/2026 6:02 PM, Swati Sharma wrote:
> The 4-tiled BMG CCS modifier is not supported on NVL/PTL platforms,
> making these skips expected. Blocklist to avoid CI noise.
>
> v2: -Add bmg-ccs tests to blocklist (Karthik)
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Reviewed-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/xe.nvl.display.blocklist.txt | 4 ++--
>   tests/intel-ci/xe.ptl.display.blocklist.txt | 8 +++-----
>   2 files changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/tests/intel-ci/xe.nvl.display.blocklist.txt b/tests/intel-ci/xe.nvl.display.blocklist.txt
> index 15ad4345a..5d8398918 100644
> --- a/tests/intel-ci/xe.nvl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.display.blocklist.txt
> @@ -62,9 +62,9 @@ igt@kms_scaling_modes@scaling-mode-none
>   ##############################################################################
>   igt@kms_ccs@.*-dg2-.*
>   igt@kms_ccs@.*-mtl-.*
> -igt@kms_flip_scaled_crc@.*dg2rcccs.*
>   igt@kms_ccs@.*4-tiled-bmg-ccs
> -igt@kms_plane@pixel-format.*(mtl|dg2).*
> +igt@kms_flip_scaled_crc@.*dg2rcccs.*
> +igt@kms_plane@pixel-format.*(mtl|dg2|bmg).*
>   ##############################################################################
>   # Valid skip: Valid for display ver < 13
>   ##############################################################################
> diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
> index aaf7eb1ef..99758c2ec 100644
> --- a/tests/intel-ci/xe.ptl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
> @@ -67,12 +67,13 @@ igt@kms_writeback@.*
>   ##############################################################################
>   igt@kms_scaling_modes@scaling-mode-none
>   ##############################################################################
> -# Valid skip: DG2 & MTL specific
> +# Valid skip: DG2 & MTL & BMG specific
>   ##############################################################################
>   igt@kms_ccs@.*-dg2-.*
>   igt@kms_ccs@.*-mtl-.*
> +igt@kms_ccs@.*4-tiled-bmg-ccs
>   igt@kms_flip_scaled_crc@.*dg2rcccs.*
> -igt@kms_plane@pixel-format.*(mtl|dg2).*
> +igt@kms_plane@pixel-format.*(mtl|dg2|bmg).*
>   ##############################################################################
>   # Valid skip: Valid for display ver < 13
>   ##############################################################################
> @@ -123,9 +124,6 @@ igt@kms_bw@linear-tiling-.*-display.*
>   ##############################################################################
>   igt@kms_getfb@getfb2-accept-ccs
>   ##############################################################################
> -# BMG modifiers are valid skips for PTL
> -##############################################################################
> -igt@kms_ccs@.*4-tiled-bmg-ccs
>   ##############################################################################
>   # Expected fail on current CI config
>   ##############################################################################
