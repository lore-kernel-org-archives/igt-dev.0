Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9897AE98FB5
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 06:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4216210E11D;
	Thu,  9 Apr 2026 06:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k5IPkb1m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7730010E11D
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 06:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775714828; x=1807250828;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=4+tvYKMkk8ugXy4SnDnC7iM/sixuYCeUkYthCNfoX0Y=;
 b=k5IPkb1mpvS+87Hn63DGQIxrzHaMkeD9z6WJE7SYFTtkXhz8T9xQG8Pz
 +KAnFKu5qj/OhAfTQH0jInxSXA9zfT6V4fev9h4ToD4T1ETsMhABVbtCh
 9nhPFQ1F/M7cPtX9dm0ZVDzEronSX11I1doyzmB510D/qiTktjO2HBGlb
 oN8+YpjNtTfBIX64Uljk/yt8iQnOwkySuwNQTKoQOmnjvo7ZaxX5VktEZ
 R66P+5qY3Bh4a4CztnT1pc5quW6FXCWLHHyAe9JAA1dQv/mi9WfbPY1R6
 u+sWIT2Gg2qJFkMLgsZ2FMywDwTLLH7HGDoAKo74F0W5Tcoq7azdOtxur g==;
X-CSE-ConnectionGUID: F/iWRU8rR+60eeyeAcM3AA==
X-CSE-MsgGUID: o2RpPqDTTimWFvg7H0sFvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="75748126"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208,217";a="75748126"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 23:07:07 -0700
X-CSE-ConnectionGUID: AKqfPSBHSoSobKfswER5Cw==
X-CSE-MsgGUID: 63ZcTo+STcmJ9vdTD/ds8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
 d="scan'208,217";a="233564874"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 23:07:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 23:07:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 8 Apr 2026 23:07:06 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 23:07:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjcVWkt5VXELMnQp7NoO412yHyZnVEMo8akrsX0ezWNH1+PvAtdDMmBCihXgZF//Lj7Lv86Be2byQ6PmeLBiur76HoMHEe4eCR4IUVFQP03ibCbsP6L/6BuVMD46ZqEu6AOUb/Vl67nfY4RVlRH58Onl/jjB5PDu1IWUM7VZXwgCy/qtFWWmxeB6joPuQl19K+YZm2ziKTc7/306m+UeOPau877XgHyYSiCRJj3HdaTgm6saeNe6Owoe332a07iKGX/8mWlJ2ihLO+7japU09283kEO299swp9xlOr/B2+jb8XdLxc7Qp/nHLwcI5uXIHpp9/n0KACwD/zgdnynShA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNFzf9heMUt0clfhHdWSV/fcaTMD8BQlBtOwwc05Xzc=;
 b=PH3IS3m3lPDL1jvzf+gBzJubHqnHapjpAd/2aQOX/n6X5h/CU87w6OADAulcsR9SSb5q56XbtGEawYOTvRC7B4mBoTotzQV5y/h8YvLAMXf6NP0vl6YWnjq9clHp0HlbaOIPEcrY5gbYCI35Z8BD+aV7gWy95z+8MwkHR0aAWav/HCxIvo5EVOvcteY2V5l7l1DEMF5v3RZvTo/3uxGL6EGyUadwG8/eGHTv7tAHKf6ch/DcK/O1WWs/N+PIHbRlzktoifXuAxxuH9lBNFkrtN1MZjviEgtMvrWgdoHa2t0QOrTgV8Xb04v/UL5i4mNxqwZGjgqgSQXTIXpY0couAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8465.namprd11.prod.outlook.com (2603:10b6:610:1bc::19)
 by CH8PR11MB9457.namprd11.prod.outlook.com (2603:10b6:610:2c3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Thu, 9 Apr
 2026 06:07:05 +0000
Received: from CH3PR11MB8465.namprd11.prod.outlook.com
 ([fe80::5895:7e7f:ce69:26e]) by CH3PR11MB8465.namprd11.prod.outlook.com
 ([fe80::5895:7e7f:ce69:26e%6]) with mapi id 15.20.9769.015; Thu, 9 Apr 2026
 06:07:04 +0000
Content-Type: multipart/alternative;
 boundary="------------LGRYzCzQVDeKxBXl0km7eUnv"
Message-ID: <72d241f7-238d-4946-afa6-e47ca0ed4b1a@intel.com>
Date: Thu, 9 Apr 2026 11:36:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] tests/intel/kms_pm_dc: Enable DC3CO test for
 PSR2/PR modes
Content-Language: en-GB
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <dibin.moolakadan.subrahmanian@intel.com>
References: <20260304043805.572087-1-jeevan.b@intel.com>
 <20260304043805.572087-3-jeevan.b@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260304043805.572087-3-jeevan.b@intel.com>
X-ClientProxiedBy: MA0PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::10) To CH3PR11MB8465.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8465:EE_|CH8PR11MB9457:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bc9dbe5-1ab3-4d01-a08c-08de95fe38f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|22082099003|8096899003|18002099003;
X-Microsoft-Antispam-Message-Info: pp4xDGuRwNXXYdaXWJHTU9JH2dXncPJ1pMi9wfSWF4JB2kIQUWgcgz1FL+alSSgAS0FlyR4wBQJbg8eIcZUUOeb0Vmb2wk3kEHAkuwrvz/3KLiNaB000RFezarzcmi1Kn4JlELjl8NG6khqdr+ZyYLEn14sHqOLGFuU9jZQrHwNyQ3E+j4TreWeMtezzuxlmTjLZSR0cJ13dsQV46oJs4VJyIBYJTkhf0keyHfOw5FeMBv1KVHHbO/nT5zfStZnGp9ACmjrvdW0axP+uplhUy/+B6AffXS0KtS0xkJIHnOSZ/hxP+F25lj7JE07JDL9HFkdhNZ0AzxJQgS2SmaYL1BY8v/je8laXIQECqNJt5Zr/U20Z5/wWK3lPeKvLjh+uk8UXV0dmHmSkhma5SGffFdRZCRogEc18xGh6Gs7YR87Zl5LnK7wktRTzLJ0/Z5LZHFAOERo4+yJfHcvkSpK2zx97eGPIUiALJfnXOhZw1YqJY5u4H08S0PABI4MSpM28geHnF+0w8BzL57oTQioE+qovi8MFxWm4pokO/RXR1PNpmWPf3VCNyMlZuj//t9MQHWEkPl8JUlz5lv44W6IQnuWGdrxnklF9SZ2DQH4pxQFR1jc2n9tgJZZbxiHrXywatM4Ttlf/cUaWUU7YyCVd91QUYAGBFflMEyPVdzOk5WPPHirP4Iae/e+B0MNBO+v049wyitVWyWKqiNUzjgmY91NOQbvd1qkBx/pnIJhfvD8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8465.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(8096899003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFN3VXZLNDNiZEtzc3Q1OWZ1UmxLUm5pMVludmZVYXQzbW02M2FxbEJmci9M?=
 =?utf-8?B?WkVnWTNSbHRXNlpMc2dyNFhHWS80NzFndGRVMERJWFExUW1XcVpmSHp0bkVC?=
 =?utf-8?B?RTNqRVc3YzlmY2JPb0VZWmd0MHN3alp6QTBrdkVNVGxnd3hwb2ZvQVQwLytk?=
 =?utf-8?B?dHA4czVtc3M3REtxdVRSMC9RRUZVUjJFZEpMdEtPR2VlOUJmNG82SUFnbDFW?=
 =?utf-8?B?OG5RazVjM3U0Ymx0b3habFJlMG9TZktjT0RIdWo2T3pJUTE2Q1pjYWl0ZjhO?=
 =?utf-8?B?VjIyZkJVM3VSZW80OEowMys1SERLRVZ4eVJmL1pRdFkvbE9uWlVxQzhtajBO?=
 =?utf-8?B?alFHM09HTXhHd3dwYmlUSDhBemR4MDZKZ0hLQk1vcGVFRFFrek8xUS9jZjh2?=
 =?utf-8?B?eG55SkNITVJ2a3FEZzBzbkVLTXRydDU4MkFNVmZzakh4TkptbEk1WlhRT21E?=
 =?utf-8?B?Q1BkU1MvVGkyU2hta2YrVUlIT3I3UkhsU1NLQW5tUEZ2SnVyV3hETyttQXZH?=
 =?utf-8?B?dXZGRlY5Vkc2VU5XS0diWEI4RzljalpIMG90cWRaZ1hNUmdVOThGNzJyeHJR?=
 =?utf-8?B?WHQxMWwrQnk3Qm8rNCtQNXJ3ZExnandSenJMZmpKN0s0RWtEcWl0M1ExVlB4?=
 =?utf-8?B?aHUrbkxxb3F0YTJiM2ZTRUlLWVVYRlhYaldiZUU1SDJjVHdCcW9ma2F2b2Vo?=
 =?utf-8?B?ZWZBcmxpUFdyN3V5eW1RQTJBTkNlWVZQdUZlbjJUMUlWaURaUGc0MmJWN0lr?=
 =?utf-8?B?QVdEKzFHSW0vNG9MK3JvR0NyMTRUWmdGQU1OcUZneVpLODZmbm05MWZVVnZZ?=
 =?utf-8?B?TnMvdTVhSjZ4dVpIZzRhc0lYaGFTK2VSUENReW54aUFlWHpLeDE4MWtQUzVR?=
 =?utf-8?B?dHBCMzQyQ2JqeVI1ZFRoL0dKb3lVeGJaNUZHcUFnaDBERXI4djR2aXViWTF6?=
 =?utf-8?B?NjQvQzArT0VhSVNudklZZi9nMmVsSURvRmh5UUJub3JMSStLU2ZRenBDcDl1?=
 =?utf-8?B?dFFKcHVzK0kvTVd2WXR0K09oWCtRUnk5WHhyV3VvMjh2dmNyanoza0RkdzEy?=
 =?utf-8?B?ZnlpQlp5SDZ0QlRycmFONE4wdVhLbEQ5UUhjOEtwQkhQMW5jNzVnY21XY1Nl?=
 =?utf-8?B?SE1vVnNyaE1Cdm9sZGtvQTMzcFN2TGlyWWVmSGZsRmE5eWJpMS80WkxjWHpE?=
 =?utf-8?B?bkJKNEVBOTEwTkZsU1B4amZmQkEwd05CWkZMQ1Nrc1d5QUJBYlRsYmtuNm45?=
 =?utf-8?B?SGpPdDZobG1IMVBCak5McXJGVERlY1Q0a29ITGc3aHkwK293eWxRMm94UU5Y?=
 =?utf-8?B?UFY2OHlVakxMdThxSG02L3hNMHh4dVFEMWRFeUdqTW1Sa0N4cFRTeXd5UCtO?=
 =?utf-8?B?Ri9GbHZoc0k0RFhCR0ZJVklZWm96Tjd6ejA2YTNseUpDZHc2VTV3c3d3V0Yr?=
 =?utf-8?B?YzV4OXE4WjAzK1llSDBWTHJJT3BIamE4Uzc5UU1LeUVKbkZGc1Z6Tkg5ektH?=
 =?utf-8?B?ajlvVXh0NlBKaVhPTHdwTHZNSTArM1Q1c3R3Q05oK3Zmd1ZheDJFWWpBMzM2?=
 =?utf-8?B?SW1NZUNNUHpMdW9ZOHkzTXZmY3RoaXJrd2h3eWMzOE5zVTMxN0tuY3psOHMv?=
 =?utf-8?B?NE40UmpoUXNlY2hYLzlzUFFIYXFKVHJmU1FoL2tINzdLeUthcU9iTVJ0c1Zt?=
 =?utf-8?B?aFpFcVlhdXNNNUtvZngvNk9jOXQ4dTBrY3NuMnNRdFZmeWtvT3RMckd1QTE0?=
 =?utf-8?B?dS9WYU9YbWdUMjlTN08yQkFNTHZrdjRkY2FydFlzQzNoWForL2VPNGxMR0VK?=
 =?utf-8?B?aTNRSHFXeXVmdGFGTVVHMlVSaVpobTRUNHRPVXBGSjdrdGZobCtJUmU0c1hk?=
 =?utf-8?B?NU5DZlZ3VjBBU3R6S0xoc2U5ZjNoelZxMVRXN3ZDd0Z2ekx1SlI1bGl5VkVj?=
 =?utf-8?B?a2l3L3VtYW5OcXZNcHpQc05Jb09DQUREQytlbGZpM0hMOS96KzFLcmZPTTlN?=
 =?utf-8?B?RUZlOENveFJkODZkcDVEbUtOVnhPY3pWanNHclprN2pCck1SMlBUOTU4ZlZ2?=
 =?utf-8?B?aGwvdVhNckREV0tmNnF3WkxHZUNiSW85NHNCSWZWUGpCTjNqbXBJS0lMZ2VU?=
 =?utf-8?B?eDRVeUMyOXBqdzd1YWNTVzFPTXRJaVd3aHlxVXc1YzhEc1JMWUlsWWhyenFp?=
 =?utf-8?B?RXFxM0xSVVFDM09IdWZyY0lvTEUwT1hnT2l3MjYzWWs0dEJDc21yUytGMGFa?=
 =?utf-8?B?RW5pbkFrRGVMMFRnTkJJbWNWMVpxRlEyUFhPVEUzM2dRaGZranNnZjlRVFI2?=
 =?utf-8?B?YkNwUU1CTURWZ1p2Y1hpVkxPL3VrRzkrVytvOFV1MTB0MHoxaVRCL05mOVY5?=
 =?utf-8?Q?D0oUkC1K0efW0kYA=3D?=
X-Exchange-RoutingPolicyChecked: wZElb+OayYBatEuiiCcMuwMYHdy7MkKpLyCyAy37O2Wi+ZzKWsnWsyy6w0j/m2mmihC/h++ohOhq5pJ3rRIStGYApJhoSOtuSR7IHvJVf/XNYfwKzr2F+gp8Lj5PcX/R46uxpC0lDoQC9fg/icXxoLtHZHXMc+miRLzMq2hmdiAbGLJydUe/Z21Ui2N1zKN8UyVzxcIxL01lkNomVzKFTNVB0xheBUaJ27m8cdG+BqcKLcrwsQ9lkM+LVnR/149GWyhzF7wAVY0FnxxSMTOSN3wgkAC17ox2mVDGrb83T8psZVmFeJA3uIF2sloYfM2phIepkhLl9GpZn7/kKMm3aw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc9dbe5-1ab3-4d01-a08c-08de95fe38f9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8465.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 06:07:04.7603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JG569lImdZza7mOjZVDGJQ4YC/56RVaGhrvcIzPuRv0Nfp2hT3JTS7oEd/NyHUvMn7lnfXzQTHyMOtqjkSTF+MZ+cFX3wKF6/I9GQdPrcZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9457
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

--------------LGRYzCzQVDeKxBXl0km7eUnv
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 04-03-2026 10:08 am, Jeevan B wrote:
> Enable DC3CO with PSR2/PR mode on TGL and for platforms with
> display version greater than 35.
>
> Signed-off-by: Jeevan B<jeevan.b@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 34 +++++++++++++++++++++++++---------
>   1 file changed, 25 insertions(+), 9 deletions(-)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 507b6168d..10450474a 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -315,19 +315,19 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
>   	check_dc_counter(data, IGT_INTEL_CHECK_DC3CO, dc3co_prev_cnt);
>   }
>   
> -static void setup_dc3co(data_t *data)
> +static void setup_dc3co(data_t *data, enum psr_mode mode)
>   {
> -	data->op_psr_mode = PSR_MODE_2;
> +	data->op_psr_mode = mode;
>   	psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode, NULL);
>   	igt_require_f(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL),
> -		      "PSR2 is not enabled\n");
> +		      "PSR2/PR is not enabled\n");
--> add message like: "PSR2/PR mode is not enabled\n"
>   }
>   
> -static void test_dc3co_vpb_simulation(data_t *data)
> +static void test_dc3co_vpb_simulation(data_t *data, enum psr_mode mode)
>   {
>   	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
>   	setup_output(data);
> -	setup_dc3co(data);
> +	setup_dc3co(data, mode);
>   	setup_videoplayback(data);
>   	check_dc3co_with_videoplayback_like_load(data);
>   	cleanup_dc3co_fbs(data);
> @@ -638,10 +638,26 @@ int igt_main()
>   
>   	igt_describe("In this test we make sure that system enters DC3CO "
>   		     "when PSR2 is active and system is in SLEEP state");
> -	igt_subtest("dc3co-vpb-simulation") {
> -		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> -					     PSR_MODE_2, NULL));
> -		test_dc3co_vpb_simulation(&data);
> +	igt_subtest_with_dynamic("dc3co-vpb-simulation") {
> +		int modes[] = {PSR_MODE_2, PR_MODE};
> +		const char *append_subtest_name[2] = {
> +			"psr2-",
> +			"pr-",
-->beter to remove here no trailing dash so that below dynamic_f call 
should be execut like : "psr2/pr-dc3co-basic"insteald 
"psr2/pr--dc3co-basic"
> +		};
--> here two completly separte arrays are used, it would be better if 
use them in to single struct array
so that name and mode together as single unit.
> +
> +		for (int i = 0; i < ARRAY_SIZE(modes); i++) {
> +			igt_dynamic_f("%s-dc3co-basic", append_subtest_name[i]) {
> +				igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> +							     modes[i], NULL));
> +
> +				if (modes[i] == PSR_MODE_2)
> +					igt_require(IS_TIGERLAKE(data.devid) ||
> +						    intel_display_ver(data.devid) >= 35);
> +				else if (modes[i] == PR_MODE)
> +					igt_require(intel_display_ver(data.devid) >= 35);
> +				test_dc3co_vpb_simulation(&data, modes[i]);
> +			}
> +		}
>   	}
>   
>   	igt_describe("This test validates display engine entry to DC5 state "
--------------LGRYzCzQVDeKxBXl0km7eUnv
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
    <blockquote type="cite" cite="mid:20260304043805.572087-3-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">Enable DC3CO with PSR2/PR mode on TGL and for platforms with
display version greater than 35.

Signed-off-by: Jeevan B <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a>
---
 tests/intel/kms_pm_dc.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 507b6168d..10450474a 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -315,19 +315,19 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
 	check_dc_counter(data, IGT_INTEL_CHECK_DC3CO, dc3co_prev_cnt);
 }
 
-static void setup_dc3co(data_t *data)
+static void setup_dc3co(data_t *data, enum psr_mode mode)
 {
-	data-&gt;op_psr_mode = PSR_MODE_2;
+	data-&gt;op_psr_mode = mode;
 	psr_enable(data-&gt;drm_fd, data-&gt;debugfs_fd, data-&gt;op_psr_mode, NULL);
 	igt_require_f(psr_wait_entry(data-&gt;debugfs_fd, data-&gt;op_psr_mode, NULL),
-		      &quot;PSR2 is not enabled\n&quot;);
+		      &quot;PSR2/PR is not enabled\n&quot;);</pre>
    </blockquote>
    --&gt;&nbsp;<span style="white-space: pre-wrap">add message like: </span><span style="white-space: pre-wrap">&quot;PSR2/PR mode is not enabled\n&quot;</span>
    <blockquote type="cite" cite="mid:20260304043805.572087-3-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
 }
 
-static void test_dc3co_vpb_simulation(data_t *data)
+static void test_dc3co_vpb_simulation(data_t *data, enum psr_mode mode)
 {
 	igt_require_dc_counter(data-&gt;debugfs_fd, IGT_INTEL_CHECK_DC3CO);
 	setup_output(data);
-	setup_dc3co(data);
+	setup_dc3co(data, mode);
 	setup_videoplayback(data);
 	check_dc3co_with_videoplayback_like_load(data);
 	cleanup_dc3co_fbs(data);
@@ -638,10 +638,26 @@ int igt_main()
 
 	igt_describe(&quot;In this test we make sure that system enters DC3CO &quot;
 		     &quot;when PSR2 is active and system is in SLEEP state&quot;);
-	igt_subtest(&quot;dc3co-vpb-simulation&quot;) {
-		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
-					     PSR_MODE_2, NULL));
-		test_dc3co_vpb_simulation(&amp;data);
+	igt_subtest_with_dynamic(&quot;dc3co-vpb-simulation&quot;) {
+		int modes[] = {PSR_MODE_2, PR_MODE};
+		const char *append_subtest_name[2] = {
+			&quot;psr2-&quot;,
+			&quot;pr-&quot;,</pre>
    </blockquote>
    --&gt;beter to remove here no trailing dash so that below dynamic_f
    call should be execut like :&nbsp;<span style="white-space: pre-wrap">&quot;psr2/pr-dc3co-basic&quot;</span>insteald&nbsp;<span style="white-space: pre-wrap">&quot;psr2/pr--dc3co-basic&quot;</span>
    <blockquote type="cite" cite="mid:20260304043805.572087-3-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">+		};</pre>
    </blockquote>
    --&gt; here two completly separte arrays are used, it would be
    better if use them in to single struct array&nbsp;<br>
    so that name and mode together as single unit.
    <blockquote type="cite" cite="mid:20260304043805.572087-3-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+		for (int i = 0; i &lt; ARRAY_SIZE(modes); i++) {
+			igt_dynamic_f(&quot;%s-dc3co-basic&quot;, append_subtest_name[i]) {
+				igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
+							     modes[i], NULL));
+
+				if (modes[i] == PSR_MODE_2)
+					igt_require(IS_TIGERLAKE(data.devid) ||
+						    intel_display_ver(data.devid) &gt;= 35);
+				else if (modes[i] == PR_MODE)
+					igt_require(intel_display_ver(data.devid) &gt;= 35);
+				test_dc3co_vpb_simulation(&amp;data, modes[i]);
+			}
+		}
 	}
 
 	igt_describe(&quot;This test validates display engine entry to DC5 state &quot;
</pre>
    </blockquote>
  </body>
</html>

--------------LGRYzCzQVDeKxBXl0km7eUnv--
