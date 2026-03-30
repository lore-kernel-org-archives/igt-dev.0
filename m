Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9528FF494B
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 06:49:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739FE10E1DA;
	Mon, 30 Mar 2026 06:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cD69taSK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7099810E1DA
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 06:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774853346; x=1806389346;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sAyZaUnA7fXUAx8rpqxtKRWQ5d0dGFvuatVd+fdxT/w=;
 b=cD69taSKrQI5Aw6Nbq7ofNHm43HyY+MSI+zVm4sS9HKP6socMiirm6mI
 7G11SDbk+4U4V6ziv0EAAD77hhHKkx2rjhT9e/c98K44bSRRx+xw74gNw
 tfwuvKpE5gODFukRmf7tlPy7Pb4seQ8a+1ouY2Oq/rBqmZ/auxHalPDIW
 phMZQUgtvXF2+BpmTBWmPoe2+HytTYiEPUZOhmxLbgCTjrisqbpF5f6Qr
 EyAXECpSffXfuJDORTWpg2inkY1j4WqhG2TbQ6v+zAgSah0uIUqnc01x5
 EAV8GqWJspwiyclv4IVCcVPW2rXrpik1aXPxW6Iqm43vYRbPC6XopSYmT w==;
X-CSE-ConnectionGUID: nEXyIgtrSpCePiBQwdkjwA==
X-CSE-MsgGUID: hSGrZQEtRK6XZhXPAbKPDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="87226274"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="87226274"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2026 23:49:05 -0700
X-CSE-ConnectionGUID: b/gvzsVqQoeNivGmLlGjCg==
X-CSE-MsgGUID: 5r54psgdQZi+D0VP5ezHQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="225969358"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2026 23:49:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 29 Mar 2026 23:49:04 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 29 Mar 2026 23:49:04 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.13)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 29 Mar 2026 23:49:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWawr9n40nnXauvF+MYZHChu6AcAOsKZfwe6Dtwgh45idIUDNgB47OYLARrSOMFVKEUHuuQCpzAJ/l3cPrDWaac7aW1d5pXVUOwgRLHiCGJlDoF+AWDjbdjmj/BgrgnHL8NgMQ0DLOsQc+iZ9H02KehkOijF+1yAcNfcrlgCd/50hYZf8HTX46kjv++7KbcmLn75JXg7YGrO8Wb5y/KAo7aGorz64EwbSPgkmZf5EXDWakbzxfknLop3MKaJCUzz82ILHVpZVRqaRW07L9AT7Z+jdvYs25orvpOyh1+RbC3yyNu5dTbo1igdqqvL1B1Nal325p46wTwU+g+pIQWlZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Y0xBd2wlm2/DXijcHRF6gYhKf4OMjGvflwPxoCLEJE=;
 b=iKbHdQdy5V5+XboaVjEt5cMEW7gAdsOjQ1BIlXCYQ7ylDDYyoTrTvbBmDMb4Y/pwmJhEYxYBapA681xU5rXNclhBS/A0rpx3Os/SgI2qcR4v1hbuk+G22m5+E9kVB2LS4flJT1P4FLh2ltvZfO5xtSU0AFLDwVNSKAfWkxDrhJAOO9Ns446lGHhU1OpmdsuO4gUIzz+FdwFt/A+hjOXCxwFJ+lgcRgCwlqC89R2dSmPsKgV9YDzPboygxFF+oMehvmhGfnt9wZqme+oBoavcGKpeavk6J5C8a8s7VRQeug0UdK/zvjyCdaDwhwjTFbTzneWIMSooFUShdWsxQIDN7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by CH3PR11MB8433.namprd11.prod.outlook.com (2603:10b6:610:168::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 06:49:01 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 06:49:01 +0000
Date: Mon, 30 Mar 2026 06:48:51 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v2 2/6] runner: Create attachments directory to use
 by hooks
Message-ID: <zhs7x2ujbcjdgiyrqqd3eyfpmykrr27mnl7ccmgtyrhdmcfj5e@6lovhtvp7gna>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260324131235.712916-8-zbigniew.kempczynski@intel.com>
 <20260324131235.712916-10-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260324131235.712916-10-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: DUZPR01CA0333.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::27) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|CH3PR11MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: f3d1bdeb-0a15-43db-bf61-08de8e286d1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: ZpzDQa4/TKJRmxQQN8AmOBuzlfFgLQb/ZusEvRDwf11B0jN+RL1jhDNucqIaoQbSAh2+FWdvZo/0gNWSHWRTTjVdaYoPasM5aekfwqdiLpZsDHAi5OHzxHGPShCz6dBOug2kKdQWrth/7SgoZJTtgt0O0u8BVeVHJ6UuwC4BIsifakBJcSbWERn85M3xzVyFTah/+UursWl+BEePEof393B7TNat9ixXh/GYqfs+YJHqfvYZVQYskg5NjmPwJ96HIwY6Dx0mlNHa5cMNAvEJhuul2Bn66ORHREOPRHN04cpGqu8nJJK1kUwXBCCkBsXoeYkcCGM+e9HxGVO7DZFFFWOpr+AR3sW9G2QzDetKe9lyvSIodReBczJ//28Qb6zZ1Dmyae67fJAu1jYtzVzRF3MXtumhAaN8Ble9iz8yMR4gcbllcq6/MTHJpezyw/hFRnl6hhNbADOru+Vlt6/2u2xjxXfDEMfB7DwMrQXgMPYxT/S1RwRjPARbf7E/ELn/p1xX2+dy1UZ5UdPRlALoX+VxSH+UZ8gpHfwbLQ2WVYovo5qUF22XLraMRbV0Ju4ozkfYnwZhnkhX+CIFjGC3HY6c4eroyzPtOKShhe16zGXfWbjyEX4awywPqG/BKdyJm+VHBppGLqSe2e/kvTe6bCa05puG1RigyiKTAwdsvDK57xeDrcMIFIZPyfh553LaZ+xoVTZw9osSglneb41R17auh56ZKFhHAXcI5QX1mSg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzFmRENXMDB0QzFzMjFoZ0hETFlRdkFWQnF4dEo2MkQrdXVqaFhvcGdPSHhz?=
 =?utf-8?B?QVRZUE5ZNlJVS1N4VUpXRTZCU0hsTi9aNi9LM2NWTmhkaHlIR3dUbW5mOEdP?=
 =?utf-8?B?cHpYaE1LbHB3VldVWFZlWi9seG5Hc1dzVVdaY1EyYWNsTndCRkwxaVd5dmxl?=
 =?utf-8?B?Y0lPR29zcG1Qczd6alBTMm5hZzJvY0kwTGNrcUR6WUR5YTMvYlJmZ0RWSWdy?=
 =?utf-8?B?WUlUcWptRUpEeWVEby9ZQWptRlBVSzhqeGRwb1c5MVd5WWMrbk96TFV5Y3NS?=
 =?utf-8?B?YXRiMHM1SzEwRHUzZkhWT1YvK04rbWc0SlJMcFpUdGNqeDlBWE10QzloRkhu?=
 =?utf-8?B?Nnk4NVU5L042MTkveDd6K1F3d2hGUzQ2enJieFZOT2paUm5UeVRWS3ZJZk4r?=
 =?utf-8?B?Nml0djVqSDc0bzAvbnBkMWMycXUwaVRtNm9lYlFZSDJxdXhnZTJReTMrc3o2?=
 =?utf-8?B?cGJRanFpbEJsVlhVVEhTVU94TGNHK3U2TVZnbHN0UXQ3SUNhNXdKOTdUR3Fk?=
 =?utf-8?B?bytaZTR1cVZGM0JQRy9iVGFUZmpETEVOUlhzby91akdteHp1bnRjYVlJcjc4?=
 =?utf-8?B?KzlrYUtlMlpnb3NDWGVFMmVwMkJ6UGcwc2JmR0x2TGYrOG9vZ1crR3FPQkNw?=
 =?utf-8?B?TnZRanJrSzdFOUNwYjJGdHdwbFV0cldNVlNVTzF6MzlVNWpVY2JqdUJPSURJ?=
 =?utf-8?B?RTNKTVczby81ZWNhMDZYeThzejF3NENtOW12Z1NnbjlQWkRXcUJaVDV0ZDl0?=
 =?utf-8?B?SUtrZTBQN1lrN3BEMW9kMmhWV3JOcmhzSFBSUFJOTVpFeUFla2FQS2VaMFQw?=
 =?utf-8?B?b3ArRzBBVkloZG9FVzB4REcyV1V0MVdEaWtTQzFMNDZ0L05Gekx5NEpoMjhl?=
 =?utf-8?B?eUgvalFVRHozT2cxUlZSUmFKNWRSeUgxT2pMVkhKTGNkNFFZMXFjWGdxMjZV?=
 =?utf-8?B?cGQ3Smc1bDFsK3JCY3JQQkVqQi9vK0NadW9YWURnQlJSS1VjbmRXb2VwZkIr?=
 =?utf-8?B?MGhmQzdqb2VDUC9vcldNNUR2YmE5UnJsLzc4R29SNGtSNUJMVjNkWDAwYXIy?=
 =?utf-8?B?MlNQTjhXTjR4S0pPQ3VFUnJVYVdraVI0b1ZZSVVxZHNMS1QyUmRCVGJlNVg5?=
 =?utf-8?B?OENnbkwycVArYnc1ZHlPb3dSbml5cHV4UWJzVlk3TldIWndZazI2bXUvc2Fl?=
 =?utf-8?B?OGs0bXRtWmFla1NySTNDYVlZN3ZOWUVwbzJKNlFPZkVVM3QvUGFYbEV2Y2Zm?=
 =?utf-8?B?Z1JEU2MxMkNGM3lCd083ZHppZUtDYTF1Y2hFOXVQVGkyRjJyRy9jRHVmckE1?=
 =?utf-8?B?OCtmbVcvRVp5dDltRUFyZ3ltUWRZNERSUUxicERadkhGY3lvaTA2NFk3MlQz?=
 =?utf-8?B?YjhIZFR2Y3B2elhYNk45N3lZWFZtSzdkdTUxUDYzN1NoZVhvNi9FNGpicUxR?=
 =?utf-8?B?dUExM0hERGtVZ2Vna2dkQmJtWGg4UExSL0s2b2xOcWE0OUJ0TDJJUmQydmtD?=
 =?utf-8?B?WFZHd0o4OHB2MmtSZmVkeVgxNWZaVHo1MkxYVXNKNzdNUHNJdlo1R0pVWWdz?=
 =?utf-8?B?ZldOWTlqRlJ1eXA5bm8vT2ZLenJWQjVCK3NHUlBiSWRaWEE2M1FkQkdDeVZK?=
 =?utf-8?B?STlEeDE3UnJaM3B3bXc5QTBlTVBIdGxYWGhFaktPR3BaTVplYVJYdnMzUUN2?=
 =?utf-8?B?SWNsVG5uOGJHL0Z3cVRZSzN1R1pENDJmZmhMR3BqSGVmUDhNbjFCN0tSSElY?=
 =?utf-8?B?VVN2NE44ZVpselMrQVcrSUJMMDhQVHh5dExLaEZiSU5XV211VUVwL0tCeTFX?=
 =?utf-8?B?UUFYRVFGYXBaeXdlaXlhMUl3SXNVdU1QNnNVSzYwMERQTEU3cHlCM1h5bm96?=
 =?utf-8?B?bzNOSjFySEk4Z2MvelFLL2QzenFOV0l2aVkvUjRpOWYvbzVla3htUEpFcWV1?=
 =?utf-8?B?MGRhaWVHOUIwSVZyZHA1QmIwWlJqVWE2TlZQV1JrUU1TTk1Hb2pBNFBULzNs?=
 =?utf-8?B?dFJ3Um1jR0I3SWJnTWdHcS9JL0gyRXV1bnd3a2pEUWZGWTk0cnJCb3ZzbWkx?=
 =?utf-8?B?bHRnYzZCMTc4SWx5NmJKUHdPQTIxNUw4SHpIczJvNHZFeU9BZ0FpbWlJb3JH?=
 =?utf-8?B?VkRLbFFLSmNiMXFSU0xNOE9lc1Izc0dFWHpaNGJNMndVU0dVbzZ1TDk5YkVs?=
 =?utf-8?B?K1VUV3lDWmtYeVdKVEdZMU5SKzFLc083elZockpxSldzdE5WSG9ObGQ1ODBT?=
 =?utf-8?B?SWJWNHZPNzJSUnlLcThSM1lpak95dWlUSldPVHZ6enEvb3c1RERGTlJMRlhY?=
 =?utf-8?B?a2xUNlJJbEdReW9iY0Ruejg4LzVBRXV0ZG1QNWREc2tmMk9ybDU4elYyc1g4?=
 =?utf-8?Q?6MP63LIOwQy0XDFQ=3D?=
X-Exchange-RoutingPolicyChecked: kymYUWPK/jMWR5E5FdUQzRYRjE95kWErPTEmRxNNuDCXuWSNKSEAwU4mD6HoJ2YrogbsacQDnkWuUU884f46nTa82I4UQlT4kTSCwORAx3L03PhPJkFvXsgOzUPV++8ZDFUA44xvjmUN7UgS+4gGnBWOE9liQeWsRF+t9eKvD0JZBIM6ErPFbCcmmabuF48gH0VkSDJGaEsnXe41PfZDwIx0OIkujCFdMF3vE7ekEG/N2OK/4VVa+DJOHlNmAjciP7RlY4TDBpHr7YqlBiBoj8C87l32KQw+jkumuFi03utLFwUUmsxViwM3qPoAhO26qiwXXc6G+0Se32rHyZqLGA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d1bdeb-0a15-43db-bf61-08de8e286d1e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 06:49:01.5859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E47byUsbHPmhiPl2cu6cA1YRg5lSCwehwsVJLJRoUHJhjeEK5crwhowxouM0g4e/Aby8upmqGvRr3pZjvrTXRV9KfVMu0CgXwyZHpxRpvMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8433
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

Hi Zbigniew,

On 2026-03-24 at 14:12:38 +0100, Zbigniew Kempczyński wrote:
> Results parsing is currently limited to few predefined files.
> 
> Create "attachments" directory and export full path of created directory
> to be used within hooks. From now on environment variable
> IGT_RUNNER_ATTACHMENTS_DIR become visible when igt_runner is used
> to execute tests. This env contains directory where subtests/dynsubtests
> may write auxiliary files which finally be included in results.json.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
> v2: simplify attachment dirname concatenation (Kamil)
>     remove files in attachments dir when overwrite is set (Kamil)
> ---

[...]

> @@ -1779,17 +1779,22 @@ static int execute_next_entry(struct execute_state *state,
>  	int errpipe[2] = { -1, -1 };
>  	int socket[2] = { -1, -1 };
>  	int outfd, errfd, socketfd;
> -	char name[32];
> +	char name[32], attname[32];
> +	char attdirname[PATH_MAX];
>  	pid_t child;
>  	int result;
>  	size_t idx = state->next;
>  
>  	snprintf(name, sizeof(name), "%zd", idx);
> +	snprintf(attname, sizeof(attname), "%zd/%s", idx, DIR_ATTACHMENTS);
>  	mkdirat(resdirfd, name, 0777);
> +	mkdirat(resdirfd, attname, 0777);
>  	if ((idirfd = openat(resdirfd, name, O_DIRECTORY | O_RDONLY | O_CLOEXEC)) < 0) {
>  		errf("Error accessing individual test result directory\n");
>  		return -1;
>  	}
> +	snprintf(attdirname, sizeof(attdirname), "%s/%s",
> +		 settings->results_path, attname);
>  
>  	if (!open_output_files(idirfd, outputs, true)) {
>  		errf("Error opening output files\n");
> @@ -1870,6 +1875,7 @@ static int execute_next_entry(struct execute_state *state,
>  			setenv("IGT_RUNNER_SOCKET_FD", envstring, 1);
>  		}
>  		setenv("IGT_SENTINEL_ON_STDERR", "1", 1);
> +		setenv("IGT_RUNNER_ATTACHMENTS_DIR", attdirname, 1);
>  
>  		execute_test_process(outfd, errfd, socketfd, settings, entry);
>  		/* unreachable */
> @@ -1950,7 +1956,10 @@ static int remove_file(int dirfd, const char *name)
>  
>  static bool clear_test_result_directory(int dirfd)
>  {
> -	int i;
> +	DIR *dir;
> +	struct dirent *entry;
> +	int i, adirfd;
Since you use "att" in the function above, you could use
attdirfd name here as well. It will be easier to identify what
this variable represents when reading the code.

Rest of the code looks good to me:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
