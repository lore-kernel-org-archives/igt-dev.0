Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0022CCD6E55
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jun 2026 09:39:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF2010FAD1;
	Wed,  3 Jun 2026 09:39:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZQDEL0vG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C8910FAD0
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2026 09:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780479533; x=1812015533;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=n3beW1NrKCBbm2Fiu0wMD3Q5wc6HHK+ZuewIXZWCN9A=;
 b=ZQDEL0vG9BDouF5XZLzp5ldofnyPFTwBJkhFh9NGOZuwoL0SjgLHIGSV
 oBIJypbO1M9ck2TZA6h6PEzHTwf/0fDvWAPnKyAyJI96SUl9b+b22f02r
 wMdQ6f2Iin6+26xdK9Y8t6hy9TMLzSTJrBS0q0JPhOFvLbgleCIdqQUrR
 P8qgkeDGf7/4Luq0w5YteL4ZnJV8FDjKivBxcCm8Bz7XfS8LK/UCnGAan
 iFxcYfieBRjOyVBHBiIyUj5dxEbBk4BCZ9VvunW+ktqZ+Yw5R6rxvZUrj
 Q2HUlumvAbPffAu2dswurxpP7iIX/aZzHgLujiiyjPdR7T6XKpKHI+Kmc Q==;
X-CSE-ConnectionGUID: 3M7f0emGQq6S/YYaiyWxUw==
X-CSE-MsgGUID: tQ4PMrMaQSOGLI8uirGdMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91593826"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="91593826"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 02:38:52 -0700
X-CSE-ConnectionGUID: 0KbvisDdSXuzp4mqBIbLLA==
X-CSE-MsgGUID: TWmYORZcQciUFLRyTU8lGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="237820174"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 02:38:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 02:38:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 02:38:50 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 02:38:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QD4Gmi+XU/e3CiznsSxSW27eKDQFH1LNGQlYqakysO0Mrhtty/ltkF8FR+vxx5LGhClPkHANbbutxQYboq6X2euHxst2yGsGxrNKHZz64u/orr7w5dt6bAJBbPMbPNnEn5xkcLL8ChAq+gp28/Kz/lohjY0vNl1ojv8W9jm0r89QW88WxK+QgrnIjq8nqiyfoh6J7OpsT9PfvlvKts4/jpUbRyhwJBbLWCsU3oTsyVsWa+kc0E2YzIaCyQvWPxCS2FptXb9Kc0d9UJilY72gFrc2AIla9z3wHm9XFTPjagrSRZAUnDGP4vwAgCIE8UGqz9xs7785+yMpGUdRmiYvCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1ff8LO8cvRfrv0XFajR46Lp2UBl+iGxkLbPFDMaSsY=;
 b=aU3fZTMYQKD7vgCb7UbUQGTv7Xi5FnuKy6DAeOp83rghPN6joNbyMk/HthapQpSvPulSoOJh4HwMaPvRVwUHWLiFKS9ISqxGRIHg7q2lwvYuVdlia5pGO5Gbs8vr8Dqn+dZpCLC38jFbpP3lOYpgy/uGKTOhf1sXjt8HpgKUxC+Vhq2u7BQdPCtYFVXvz+vNMOlXxHoUOhmoLQMF0cvTOtMeJYei8IjdCA1eOf3HwKe7fNX2t6Ksmh4ctYytyKkDUFWp9HFk9ixkJxEeDQK53ewoL3iCwiM+geoXUrPkrxEUSNEk/A09hulSyzOK/PEqbMx7GRzqc8bRH2oVkfT6XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by SJ0PR11MB5103.namprd11.prod.outlook.com (2603:10b6:a03:2d3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 09:38:43 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 09:38:43 +0000
Date: Wed, 3 Jun 2026 09:38:33 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t] runner/resultgen: Fix fd leakage
Message-ID: <64i2ynrwmwgjuvj7ka4f4gvt3znmls7eky3pqzo73qo7oqkvse@egntqt2nhyon>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260602124809.111457-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260602124809.111457-1-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: TL2P290CA0013.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:2::7)
 To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|SJ0PR11MB5103:EE_
X-MS-Office365-Filtering-Correlation-Id: 88941ec1-0e01-4389-5fe7-08dec153e6eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: xTEkABQ72PLdftyUeqCL8Car+shW0erZXVEx2ERVZmG2iHVBhSko3FWLZRup57Q9VBy6YR3dBSWUyIuBD9wnmzojo2VgUbsQVShISz8xtL0yC153TAH9/58p40/ipEU5DF7acvlq7lXrieQeLBeAm9AqGmsyA4tEPEJ4P0zX9m74fc1JKfw0QEyKidKa+10W5sYKVevHRfE2+9pZ2YQ9vNWty3+UAbuKOv9G6geXJNHWfXFAcqLleVAtZNvDHh9ltgtfxC2L3qZ1Stry+U39945DJCWzPfDfiHTmA9ncLvJu0z05di4NsVwt/DR5LYCNXH2D9LB0WND5cvmeOcJrAiBGTa3+Rqj1facHOCUi/GrmWSV7ztpXaO1fOyKK2nNYfUlm8Jr4OXfz8ZalkDI79csI2bkvFCH4ZKDq5YkkfjMmiXWtaXcTJOHYt8yKfFt5CT/x4Qi3S5Qk6cay+cprl588IEH68HRSCxwX/Gr26kwXLocPS/bFBJgr0FTjNQiFSp56yoKRM4HVwxa2FHNJEiAuISaprWhIqDwpXM74XRQ98tzR2hPD583w44E464EmEH4xxykjV6WgP+5Ul0k1dNdTiaXueeBfkqJI9bdNAix6x8LfTfWar0UloopBoWCFzwIaJ4t7H9hUpyfQX0xAU9L0+7EOjIpBogxmSxmvnWzh+PAQ2nbkoMpKxGrQ4GFC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0dCYnVZcU5NNVozcEkxOWNydnNUS2FFTTNzcDRWVHBIS2Eydzd2a0xqVHB5?=
 =?utf-8?B?THFmMVlpZ0FlUFhaNHpINlREQWNKM1JSZXZ6aksrdG1DZUl4YzQ0N2wwR1Vk?=
 =?utf-8?B?dUpyR2xzNVJZZ01nWmJPQWFJVFZxZkZnY1RVYzdmT1lpZWZKelJzRkpCUENq?=
 =?utf-8?B?RUVaWXk5TWIyVXhnT043L054eTBwaGZVWlNZVUw1N3NBT3hCQ1ZaeXNDN2Fl?=
 =?utf-8?B?bWdkcnZoQ0VSdTRCb25BbTFScU9sTW5WK3VsN2NFOUpCM21VRGcvRnhFQ3RW?=
 =?utf-8?B?bUhweWVDdXFPbmdoRGJlT3Y5ZlhwYUdYVnM0b2VCVmJzbjB3c2hnbm85c2l4?=
 =?utf-8?B?eUZ0YU04bDlGMHBLeTQzd1B2eWhiSit6L2VnMk5Oam8rVURkMHFZRDdWcm9v?=
 =?utf-8?B?ZXM4ei91QjdPbTYvSU02VFlPVGVGUDg2Sjh0aUpIWis2UHBIaStBMGhoemRG?=
 =?utf-8?B?MmNqZGkwRTFLN29OcStjR3ZRTUVMZTBJYXNNY1Bybyt4b2o0SCtiV2w0Zmpr?=
 =?utf-8?B?QUUwTXNlQVZ4UDVqNjBEZWMzTGw5Y2MyNTNnMjU2OXl1RUNHVHZ6OFd0aW83?=
 =?utf-8?B?cmg4ZExFbVZtNXhyL3RYQVBxbitENmR6Z3U0bzdZZCtTZFh5YzhNVHBXTmpK?=
 =?utf-8?B?eTZKTHI0Yis0bGNzdlBpRzQ4T0hsUFk3dVEyMTJlMmdkWEJMUFo1S2djMEl6?=
 =?utf-8?B?bUpMTFBUSVVUTFc4dkN1V01rY0tPRk1CSlZLUDZLbmh6SUhJY0hWNFZjK0Jo?=
 =?utf-8?B?UTVpYTZaY1QzRVY5VXJSL2g4N3JGODNvMzcwdzFVUGpaTVV6UEFpVTR1cUZ5?=
 =?utf-8?B?b003cHQ0UWxzQWhCeDlnV05GS0VoTmZ0MHNsaXF2cWNRMTh6RS9UTEx6S05B?=
 =?utf-8?B?c3dZVHVvdGNxQ2dtdkdCcU5Mc1QvN2ZDRkt2MmFGWVhvVWx2Y0hNUUM3RzRJ?=
 =?utf-8?B?MGtWaThBa3RVTExpTm9Kb1B6cTNiRVVOMXJRQnlCakNyclF4dzRjQkwvcWUv?=
 =?utf-8?B?dXpzZ005TXF5RlA4M29pMHNEa3BOMzJMUWJRcVRsVVRyaHRjSndNQmt3TjFO?=
 =?utf-8?B?VVpHVzMrQUJDV1haNnVXYnRFbzZCWkM1Zm1XZHlxQ2dLbG1uVHpOdWp1VnNB?=
 =?utf-8?B?QWV0NndxSG9YSmxYbCtyRk1tZU0rNndTUnl1NkxqY2dWUCtIT1J6b3IvSGo3?=
 =?utf-8?B?cURJVW9aSXFyMjNMbVN6TEhXQk5rd0k2NWhVY1R6alpSdGdVVjFmNVBCS2Q1?=
 =?utf-8?B?VkZFMFR2a1NIS0s1a1BpVnVETDd6MVZMOElaTG1HS1RQRGVkaDhEZVVJL21w?=
 =?utf-8?B?M0Y5SGpod2U2d2JsT25TUVpMK0UyajR4VllTcUtrRER3dzlSUmE1RXFuWmRE?=
 =?utf-8?B?R1luVktjRUxENWtUTEcwelhXQWxyM2tjWkUwbWdLTkhiUWlUb0IyTVo5L1RR?=
 =?utf-8?B?eUZSWW5sRFdPUGo2Z1I2cXZnbm1heFpuZVVidEMxTGdYb1kwMWhiTEFSS1Zi?=
 =?utf-8?B?MFJoR0g5LzF2WWJzdWhGbW15SDNJanBueGJTSGQ5bTVmc3BxZFpaR2cwZzQ2?=
 =?utf-8?B?dUx4dDBWSzV2ZVNqMjNVcUI3R0pMeTR2aE8xcWlrOCtPSC95YUNhbjdEbmxk?=
 =?utf-8?B?WlZxS21iUENzZ0Y4a0x5Vm1zN24vVCtNSHFVc2NSNDc4YXM5KzdZQzQ2ejVv?=
 =?utf-8?B?aGYvNGwya3NLdWtWWmFtYVlaZ21KWU1yTTc4YW1iR0JNS0J2c0FTSWhNbkx3?=
 =?utf-8?B?aGhYbDMyQ2xxYjhHeGRIUFFyOE40ckZON3pDUmRKRUpJZkZLamxnMDZSQmNC?=
 =?utf-8?B?cXJBcnluZklaMHZpekNxa09ob3B2MldaQnBUT0Q1WFB1U3VsV2FGWVpyeGFO?=
 =?utf-8?B?dWtMRTVNdHRhSkd2UmdMUzJQTWRQaGRwMkJGdFRuMGtQOTI1WTNhSE5HbmhJ?=
 =?utf-8?B?a1YzdzZ5YmVVZThWa3lmYmZBaEtpdk15ZjhkZEZRM0dMU3cxNWltdm13QnQv?=
 =?utf-8?B?WEJJTy9vd0hMemJ5WUhvdjY2Wk5jTy83cTJuQkw5Rzg2dTJEclVZcjlPb0RT?=
 =?utf-8?B?RWlrdzJ5eko5WkY2Y293K21OMXlOeUhoeWR1d0lieW4wVVVJTVh2RHlwQjA5?=
 =?utf-8?B?Nk1peHV0T2VYVzNBY2o2ZU8yQkU4THlPMkw1dit2VkRwb2JjRUFEZEwvaWg5?=
 =?utf-8?B?b2pYbmZQeFo1dE9SUHhhSTBxS0xuUVl0Um1wUkhUZVNFTE5mTndPN1RHRGdP?=
 =?utf-8?B?OGx0Y3BVNS9UUUxWcGtFL1FVMUM3dlcwVGk3VkRqU09yOVNFSFhxRU5ud3lZ?=
 =?utf-8?B?dkNHNlpwTzNmN2xaR3hFbGpyQURWUmZydmU0WVk4ODdkM3ZSSElWcTJBOGtQ?=
 =?utf-8?Q?hjOS+ueskovJqq9c=3D?=
X-Exchange-RoutingPolicyChecked: MDAYoL4q2Z+/TgmMVM/FwCyO+SbvU1uB4cWfLaNPqfmxWe7jsSeND9tnsKK64YYpyPah6AYGVcOtLq3u0kejS5pf1xcuyh51kBxfykkOTyBebOjYx0kSvPqcx+A/hcpxfuVQJzRvxoDtYwB2c55YHup9ep3daBr9CB/5+s+c8SlevzL0f1654hq5SR8zkeksq1FF4RkJkOomOkLJ5kOegwBUZazgZcSAb3S6UPWguB6J+SbsjHLsR1S0x429d87T8VU8tmROVIXmjKLzYNFlYokSL/NQe43CTwg1Xm8zdgn2QU//WF1soS36vOM8v7hG2Y9+psrCyqFmCflIXvWYww==
X-MS-Exchange-CrossTenant-Network-Message-Id: 88941ec1-0e01-4389-5fe7-08dec153e6eb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 09:38:43.4647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Oyo9jMH+p1FOOLy8P6dw8CZ25hL4qwSUijw9PxpdRmymNGVzwXGC6aGBtakJBfbB68nwgnFSVXtT0KRmo3zs5wotUAaIuEKd5R19IuOaLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5103
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

Hi Kamil,

On 2026-06-02 at 14:48:09 +0200, Kamil Konieczny wrote:
> Close dir fd before exit from fill_from_attachments().
> 
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Fixes: d34395a7ede7 ("runner/resultgen: Insert attachments list into results.json")
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  runner/resultgen.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/runner/resultgen.c b/runner/resultgen.c
> index aeec9eb08..1ee167fb0 100644
> --- a/runner/resultgen.c
> +++ b/runner/resultgen.c
> @@ -1230,6 +1230,7 @@ static bool fill_from_attachments(int idirfd, struct json_t *tests)
>  	tmp_tests = tests;
>  	ret = nftw(".", ftw_attachments_list, 4, FTW_PHYS | FTW_DEPTH);
>  	fchdir(dirfd(currdir));
> +	closedir(currdir);
>  
>  	return ret ? false : true;
>  }
> -- 
> 2.54.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
