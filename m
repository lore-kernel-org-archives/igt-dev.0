Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9B5EB1060
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 15:11:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408A410E160;
	Tue, 10 Mar 2026 15:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JJ7CFcAx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFD510E160
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 15:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773155501; x=1804691501;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Wt7QatiBAKcfCBCN6dj6yA8Xq8YYEZFwXd+kPfYNPvg=;
 b=JJ7CFcAxt9aPk6w/K+DTfP/8/zabU08HG8BHcyWYFk1ji+aawF5Wi761
 0h1ZGFEIK17c+gkXT+p7nrVGeEV1PULuvbfexOmbYaZo09qiOcMeoE1D0
 ZJxoTxoFPM/68BapoHIEIHuPbfYdEbcHBkS7Fz3aKEF1MsFWNqK46vCOF
 AjEHDlRvd/mKoyWduky5I/VJO8Q0Qx7IjE7gbLvjDwSZEFZW6y34lj/nw
 YMpXNmi7zRE952vgeDv91lCSKLrMwNTN+/v0+nOiVTFPo4KLVyFM6mWxv
 4wCIOGUY2IsQSZHnnyMhdQuDqAsKaE/VJTedPtFtn7gPxyhTxEktiByPk Q==;
X-CSE-ConnectionGUID: lSdkHdsHRDOLdlIgZyi34w==
X-CSE-MsgGUID: fmaEzA4NTOqNiTGgVhrgiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85683702"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="85683702"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 08:11:41 -0700
X-CSE-ConnectionGUID: m1FDqRqKTJugXubZOzvIqg==
X-CSE-MsgGUID: lFwKopLeRDKQh2RyPcV1ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="218102777"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 08:11:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 08:11:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 08:11:39 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 08:11:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nw/5kJDHUzvnbmqYsVKXHOQSjDpefrWLp9FoSRLfc2KT1pFGBiDdLfQxNUvHxLY3qlNAWlC/XUYFuIc38iKwmYVbAX9MzpAZdJZUxzvntB7qdIVmBW8gVw0wiQ+MYeJ4lP8a32EFpmEgbUr+O0fPGi8B489t+3TKxx1FL2/NyCC/L4uyglSV9Kpk0BKoo9HJT4Iu7EoISkZx3tkGPYjo0FDMKoJCd9zpSwmmMdqpBMexbfecyUWPbnkjnlo3GJEVTrweWbVDhPU2xuDXKaI92g1k22feVlYCJI1qe83cACY2XewJsC0xnAttgTXwVmpb58G5DYWkt8uQI9H4F0cIRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hB0GkQjzwwITXEyV/be9wLbK1kbPApYkTWeWi1jZ+A=;
 b=Zwr7MsjjjqtgBhan0l98fwC3qCie0wQUBXSvkMKoD/fgWpmwL8hWpn14JhK4hypNnAkaDPPFRY1qNz85RxViiKkiP2T/Bp9ZjtJerQsqdFFir3zTbXzlODew1J8pEY0FLlOP6imnE30SehC2ZBbJl3M5yf+KoM0K2GNjEb859gOuGvDfyxi0DKHrIGIwdeDjuHvijYapOg1qX5trJ/ti43DihbE2f45HTU0/jssOgu3J3OSRWQt7AoCFE+30sfchaGwhLWCiqV9Ue6NHZGPCpG4jsCWgTygaECWpZKnKaJXhkpmbZ6ob97raHmvwZgAEvfT55lykQzSlhYSSfIdtNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by IA0PR11MB8420.namprd11.prod.outlook.com
 (2603:10b6:208:482::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 15:11:36 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::682f:20b8:f518:49b3]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::682f:20b8:f518:49b3%7]) with mapi id 15.20.9700.003; Tue, 10 Mar 2026
 15:11:36 +0000
Message-ID: <d76f4647-2e6f-4fa3-8d57-df986162fb10@intel.com>
Date: Tue, 10 Mar 2026 16:11:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 6/6] tests/xe_compute: Change shader and local
 max x on PVC
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20260306091430.1234990-8-zbigniew.kempczynski@intel.com>
 <20260306091430.1234990-14-zbigniew.kempczynski@intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260306091430.1234990-14-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0057.eurprd03.prod.outlook.com
 (2603:10a6:803:118::46) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|IA0PR11MB8420:EE_
X-MS-Office365-Filtering-Correlation-Id: 90cd66e9-a269-45de-6863-08de7eb75249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: nszuDbE+7ZYBQ0eDZCUEdkYvefSfx6ecvKB0QPvt3m6wD/+8TODGfAH/xgfGaY48Oh/G7IskGkCHYnQw5HZmqpWB6yBWIEP5IoA+X0WXkD6QIs8MMFI6eF0xOiLh0TZhCMu/GHLpaiAACONuLYEXoDlbC/F4a0rsTSQOeFJmCcqzA9nE3fQpCeBL+ut803/eNirlMF/S41Q6i5YvUSW2bNudLIfhDlhS3drwwfqvRa6nrCjOyb9vyQ2W9/68XbmIiunHjRNYFm91O9yXr/4qnR1lsbR9IPzSmYPefGUA7WrdQlq2R/Kvf6aCsBIPYFcid2lqgK4pA2U00Y2khUvrZtOSTfCRNYSak6Gk9s4zXQF4pSbF/JoynVk7+TRVIs+degtrlhRVuN582nDrILVO3SmHQjAg0EOs9/KDpIA/4AdrRajSspj/k66u+8Ks1DZkSXLfGOiCWS1cgk6UeQA30fOG5cRQKeYb7yRpNssPZ50DiLVc+Mo+YdgswabmWV7V37GqzkuGGjJ5ZcBt3zXwtL7Ta8x5zMuLX2UbQ6QUwwpwe+//9HvqVpXk+bNSW6SBQ0yp6SvVE4SCDJzFdYoKPweiZqL6BAP9v3SfAARwsaf01aeKc2vK6O6/fwOJ3lAdah8E1lUntnIXe9ZeuteTUnATe2gyinK4epBw6ovl+yqs9+LY/N5axI0DMh4f6t/eAgEogYOpHkhSEBkY4iXdIDtD6Uo6vwS0qmvDM5XoEvs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHhTcG80NWU2eE1iMWo5ZERham8wMDZyM1VlOE9XczlIRG5LMFhYWVVhOHJU?=
 =?utf-8?B?SXRBcFFpU1hQeGswMGFnVE5BK1NHOXFDZVluajloSFJpYXkvZm5URjF0SzhC?=
 =?utf-8?B?TzJ2ajBqUTZLT3NRTHp3U3NsT1VoRnVUKzJmcHNZeTA5S1BTdUtMUUV0dHQ1?=
 =?utf-8?B?V1VMK2xUc3dQRWlHOXJscGtZblBCUmpXM3Y4TDI2blBBdVBuUlV4QXhBaVNq?=
 =?utf-8?B?ZENZSVdKSG5keFFSdFNHZEw2emxMK05xRE1HUHFGcDhQR0hkdzgxN2pDaWVQ?=
 =?utf-8?B?bVJ0MVlxVUpkSWF6ZDBDN0hFVUszK1p3c2U0WGxMeHhodkJoNWNmUlUwbklE?=
 =?utf-8?B?RU5NMEFyV3Y2SlNpYWNrbFI5ZENDcXk5c1ZMSDZ0WUpCQ095S1k4TWsxZk8r?=
 =?utf-8?B?NWpwSTJ5b0tIakVncytMZFphUTRIVzFDYkgwaGNYVlpTdjJKNGxLTVkrdFpu?=
 =?utf-8?B?Mk1TcVN4eXJqUk45Z2k3dHY5TEVLRVEwRHRRU3FsRlZUbElpVnVxVUNURVhG?=
 =?utf-8?B?bnQvSGhCNG5SWEJuRExCT1NMTWxRVTFCUlNVcGI5QzNBYU1SRDB0SFFRVFdl?=
 =?utf-8?B?NVZXRWdNSWgzVHFLL21vbi9Jd0J5OEFGbmRWSFZEOUJDb1VNdlNHYmtqQStp?=
 =?utf-8?B?M3B2T0N1eHQzc3V1Q1U3ekowWE5sRXdQM2g3bjdpZFN0NzZNSkY1SUx2NzFv?=
 =?utf-8?B?bUhMbDhkR0RzaGQ5R3VUVWZ5dnV2bXpTckR4VWc2MTc3T2RMcWJKR0tQcmly?=
 =?utf-8?B?cmpTS0Z1WnVWMW42OTd4WVFnTHBGZTZiQ0hBeHFwWmR6L1BJc3NhS2RlSnpr?=
 =?utf-8?B?aElsUk9lMkM2a0VvNmtzbW1nVFRzeWNOb0piS2ZpSGZ5N2FWa25GYTdUQmYv?=
 =?utf-8?B?QTNBV2h1T0crT2h1aHdsTWFPcC8zV2NuWGNrNWRqcFhlQlE4V0VWQnBBTlNi?=
 =?utf-8?B?dElxQ2E4Tm5DQUZlRG5HVlVCSHEvRU9rVUdqa1R0UlRJWnBacVZlTHJsNjFB?=
 =?utf-8?B?QjNPZUF5YVY2SlJTZWM1bDRoM2creDkvSUF4NWhFSGZXeHFscTZGUWxhalVE?=
 =?utf-8?B?UG55VWp6THlDb1ZxczBsZlAycDFpdkZHY3d4V3o5UHV1WWEvelhtdnF0d09S?=
 =?utf-8?B?cWlXdnFVajViK09lVmxHOFU2WEV2S003ZS9USmo1Vkc0TXFEV3hRcWc2UkdX?=
 =?utf-8?B?YTV3R1hUUjFCSHM5bGJlMS9RYlVVaUhOWUdrRFZWMGw3MlZVeFd3L3o0cU9m?=
 =?utf-8?B?UG9MM3paR0FETzFYSHJzQjkwUVU1aTBqdzE4SjRTR3lvNnVwQjN0bmU5dndq?=
 =?utf-8?B?MG1UaTZUdlRpZWFvMk9tNEZsNTBrMFhLTlhBalB2bVptWTU0R0gxSmlDc0FD?=
 =?utf-8?B?Q0wyaFpKWHE3TEdvNVFCd1N0NjJzY0FndUNiMzVzckhpQlR3aHlnTkF1WEdR?=
 =?utf-8?B?dk1McWRpajBqRHRweDh1TVIwRStiWnB4RHhBMGU0a0xtTnBPekpFRU5SU3dB?=
 =?utf-8?B?WWIzVDdiZXdGMHRVMC93UTF2MmxYUzZta0ZFWURLNUw3bVZvK3dEZ0JnSk56?=
 =?utf-8?B?OW0xS3RSZElMOGJmOUtKYjh4V1BkZnpwZEFaZFJ0REZpT1hHWlQvWERYQWZW?=
 =?utf-8?B?dlI1QmRlWkg5ZzFuaW9mUUpVZmlXa2dpcmlpVEtOY1F0YjV4UjMyenQzaENs?=
 =?utf-8?B?aTcvMEQyRlZ6Znhjc25PYUVwZjk1aEhBRTNNYlJYZHFQZ2RCSmVOekpRcGgy?=
 =?utf-8?B?ZkZPVDBUSUNLN0ZwVE5paGlYRHhjSzdlQ3hFbHJpdzBMNkVEZ2tGNm1LaUFv?=
 =?utf-8?B?cGNlYTMxVmo3aGhlMEFER2JTaFcvWWNJdXZZRjQyYVN6TG16d3laVFIweEVW?=
 =?utf-8?B?OGMxTno0cTJZWS9nWkxDMmNkZEVFMEpZYi9qVkFWc0xnb3ZjT1VHTlFrMVVm?=
 =?utf-8?B?NHdBT3Fla1JtT3dyZ3hleUZCR1FVOWVndzdTeSs1YkhYSjJ1RkF4dHhxV3Zq?=
 =?utf-8?B?M0k5S21Tc1BheWQyTHRYTlh3TzM5WFNSZjFpYkFtNmhPR1VuZy9tS2lPWjJV?=
 =?utf-8?B?bHRad2dkeGdoZTBwdFE5OUVWUHFwSnhEWFUyWHAxb0lqUUpFdjZmWTVTWFBR?=
 =?utf-8?B?V3BEdGpPY0pzY1N3R3FKTmRKR3Jsd29zajlLY2JzR01xNnlJb0l5N1l2UkFX?=
 =?utf-8?B?cU9WSjRmUng0eG0rMWVwOTdTV3NqdldaZDNFSXQrTVc1RnZoRTRTaEJpSHBa?=
 =?utf-8?B?UnU0Z1ZPRi9SOTJKUjlRNDBWQzJkTjkveFZBKzZBSS9ZNDRIc1hzV2FoMFBZ?=
 =?utf-8?B?STRYN1FjTGtpL2tuMEpHeWNiUDRkZlFmQkFiZXg1dG9UNnhYZ3RyQT09?=
X-Exchange-RoutingPolicyChecked: Lew3heqB8xnsQ1bR/Z/J5/Nutxn+d6uJsK8q055yNqQSkh5SjeWYJyrffPFFXa/Ksfl+lBxkOSsqRw6I0dFRlG5u/Vu1YxfnyURhj/dxjHUNG8oDeW2iHFqKjNbzRrx7vcIoKtFrmNj8fBW1OHRrTDwUOSfPxJ+P4W8snz/AcsNk0a1/kcwAuidR6OPdxxvHtZVg529gNdsti+q4DtEEfrrodcNtd5Y1AuPPC5OhoA9pfJjm6Xz1CpJo2kcYAewG1kTCsYaJbXo95Ce7ww8drokFghboq9NC6q1T7KHSZ6K2dsGIvkifP0CcbDj2JypeKkJ9Uz+w1oW382+5DDZ4Ng==
X-MS-Exchange-CrossTenant-Network-Message-Id: 90cd66e9-a269-45de-6863-08de7eb75249
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 15:11:36.1186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p6LhXrZQRje75WSPFBM6NQ35b8SXG6BT3r4dzvqHNS6UIYZS3Pm9FCGHtmV9PGez+n2V1FCr93KY9BiYlsYQ8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8420
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

W dniu 6.03.2026 o 10:14, Zbigniew KempczyÅski pisze:
> New compiler changes argument positions what requires altering
> the pipeline. Change local max x and replace PVC shader to enable
> compute-square userenv subtests.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Quite magic, but if it works :) :

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

