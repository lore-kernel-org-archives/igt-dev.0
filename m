Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440C7D5D689
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 20:06:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24FC10E313;
	Thu,  7 Nov 2024 20:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PHcQAS7J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF1CE10E313
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 20:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731009967; x=1762545967;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:mime-version;
 bh=qSzwOK/ZvuSVZhDBCGKxAF5SlO8rcRPgzdk4SXgxbh4=;
 b=PHcQAS7J2HtTIamL3BICvFmOb/Rqaze0jVQarJkrOBhDnkxp3CZSFX+u
 ZSqSNmXF3NYpJgkskJoBGqnnW17t+hL8jelQ83MQ1HnoQZ2Cyk6oMU0QK
 ug/ktqfb9QezPPOA8Bd/d+eNTewVZqxLPa0D/54eVxnO3sOmpVJeN0hnO
 hyIsle20X3+CI3L6nabua4E601ZmmECysju7SUOCZrOu6ewa71ReGojz2
 zamJzZckIxH5cuLJpUifx8QxBpTSgUgK6GkrykHAwZ9Pm+EYcNDXFp3Nr
 Gfa1ZA8t+EY4GpatYaCaba6lUZerf3NZ0uukyP3rkJCvo4PIoKTgpzDyg g==;
X-CSE-ConnectionGUID: 4XpDi2RKTaG2e9P08gp4GQ==
X-CSE-MsgGUID: oWqxt3HcSOaQpTWYcbE1cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="31100315"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208,217";a="31100315"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 12:06:06 -0800
X-CSE-ConnectionGUID: hnt2ztMZQhyjumxWtKN4QQ==
X-CSE-MsgGUID: q+masW7aTZicrBfqmZdwqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
 d="scan'208,217";a="116066123"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2024 12:06:07 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 7 Nov 2024 12:06:05 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 7 Nov 2024 12:06:05 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 7 Nov 2024 12:06:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BSwUf5Pygdy7sjlMtbNUUrQgFlTiHK0YLNcc28TTG5iwaODhk+GQeuaMVsmFmB88bluc8hfR063sRG1S/sygmy4w/n7lxHd0ADWcjONq4eXDFJY0J0n+sp2GBLk8jCQHYc6DWMS+p8iHhC4C3cahGjdjNQ5iebDABUkhOjci5A2NdWr628qWsUs30rVoojrYfjJijGTQnrjcADbD5QURE46PghwspuMbLfr+TaM+z28wrWn0l0lOB6GlfS/JbF89MSlqfwpHPQU8dSko3rdy1z3ng707nTgcS2Z7eAjLZhKaHhb6hoMS9H/xN/YoWrBTdbECajq14S32ddBZhexRSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OUJAhxnEuttQkxrS1w/vtDj6mw+dJvuvrYzuQpQH3m8=;
 b=lo9bgSZxaMST9NTF57bq/x5M5KgrspbAFumMuEwxPDLHLeHcJr3py3d6USIz7aC8wn1w2t9VkflcNRR901Ka2rxDdKamObeYr4se1qVvxKSzNPkxfdQhQn5Qnewulv5jhm9XHCGcLMTwMBXHIv5qeqi+eXmh5WlEOn8b6QnerMLUnGfRKKz79SfFeBc8ko/ci5s8QaC8yV2n/C8CpaG7eSWcIpGoFNSC9ZQ1kn7Eo7gqhiYUM1193AUni7sCEYsh/ZK14BJO4sd0eb8v8PYKEgs+v5vPlau+ud8kSbnCtu1edzWgUdhLbgkjZYQi5C/FDOEHE5FKGCSY4WuTRSplRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by MN2PR11MB4741.namprd11.prod.outlook.com (2603:10b6:208:26a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 20:06:01 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848%3]) with mapi id 15.20.8137.019; Thu, 7 Nov 2024
 20:06:01 +0000
Content-Type: multipart/alternative;
 boundary="------------yqRPLKwSUThaCYFYmYLYTWOJ"
Message-ID: <eaa938dc-a3ce-48d7-a286-b794414b27ad@intel.com>
Date: Thu, 7 Nov 2024 12:06:00 -0800
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/intel/?=
 =?UTF-8?Q?xe=5Fvm=3A_Reduce_n=5Fexecs_for_bind-array-enobufs?=
To: <igt-dev@lists.freedesktop.org>
References: <fb348c83c291f4257f525077660b9b67630d25a5.1730838535.git.jagmeet.randhawa@intel.com>
 <173084325892.1414110.12277836322296276507@2413ebb6fbb6>
Content-Language: en-US
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <173084325892.1414110.12277836322296276507@2413ebb6fbb6>
X-ClientProxiedBy: SJ0P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::27) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|MN2PR11MB4741:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a40e009-fbce-42f7-7cd1-08dcff679a3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkpteXhVbHVuN3FteG5YV2FpWUc3Q3Z0NmJKdFhiVkhVWGF2c3UzLzhBRHor?=
 =?utf-8?B?cEJxeXdHZEM5Zk9CRUtvMzhtK2NNcXkvWVN0NFYrdllYaE50bWZRMENFNkRv?=
 =?utf-8?B?anFlNjd0anFKd0NmeUFKZkd5L01ielFTamdWclFCU3VTbkVydUFhemhXemov?=
 =?utf-8?B?QXlrUUpWTUhuUTM2Z0VtV3pDYkphMXpZUHJqdnIra1RjZFllZGhndklzN1lw?=
 =?utf-8?B?SEF5S1VKVmpUQkFSblErZ1FZeGFncVJSTm5LdkVnRnNLM0YzZ0toVHBTYU5Y?=
 =?utf-8?B?bFI2dVRsR1NrMFlGS1NwRG5DSkdjcVpQNnN5NnZBcFpSZHZicjk4bUhXR28y?=
 =?utf-8?B?aTM5ZFVoTWFKWXphN0NGZ1ZzVWdiZlVOUWpCVXRjVWs3bC9nYnZqdGY0TEc0?=
 =?utf-8?B?bExBUW9pVkQxVXRmSmxTNVNDOFZTbDdtN3BUblNoYkwwanFNUGwyR0pudWlp?=
 =?utf-8?B?TjlsMFdOQzB0dkVFaWx5dVJ1MkFUNkxqOS9pYi9FYXlMZEFYRGg2VUFSMFpX?=
 =?utf-8?B?VVUwV2R3aHlkYm8wUW92b2dMRU1pdmwyR3h2d3lvZDJFQXJYUU9rd2dLT1l0?=
 =?utf-8?B?YlJLaHhXSW1VdFZ0VDVYOXpkM1lDZzN0VDIxdTNoNUxOeW1lNmI4RG1YMzVx?=
 =?utf-8?B?WmJxU0tGalYvZzlldTNneDZETlVhVWtjRHZaOFdLcGpPL2hjemF1RlRxSW5v?=
 =?utf-8?B?SjJoczV0QUZhN1pPeFQ5di9ldTNIUFVleE5ETkg1bWhVckhOSEZuY3FWZGpr?=
 =?utf-8?B?OElHYXlpeEd1eG9BYWQ4eHJqUmNEVEVlOVJCZjZ1REFhelBzK1k5bWFCMzJB?=
 =?utf-8?B?Q25pMzhCbTYyejhiaVp1V29uMmhGTTk2Z01xUGV3Q1RLemozVHAwR0E5K2g3?=
 =?utf-8?B?MkpmYXdabS9MckRzZlc1VXpCRGpFWFhlNWNYdEExbnlseUs1N2w1dWgyRXRW?=
 =?utf-8?B?UUhqamJxaUhEa3lwTTlrZzdObFRhNmxEL1dVTlBUeTA2MnE5SDZDRUF2Yk8y?=
 =?utf-8?B?ak8xY1NGS2VxVmY5L2J0NkhncHlpbDhWbGI3Y1lPSUJBdXhiNDFTNUNIUEZE?=
 =?utf-8?B?bi9RdkQrYUVNU2JaMDZlbURoQkhqV2lCWS9xMGx2VzJKSklaUVBWM3E2YlRG?=
 =?utf-8?B?Z2FxWkZlcHRtQncybnVVVkhWcGd4Tk9YTlQ0bTlUZWlJaUZ0MXpDSkRFSS9R?=
 =?utf-8?B?V3J3QWZjbk1BK2treEsyZVQ3b3d2V21lRTJsV0xVUXQ3YTFyNXhlWm40Mk12?=
 =?utf-8?B?eldoeTVRZmlsRkJzRTdMcDFSamlpcVpMeWpkRk5yU2RsUVNodGQxNHg5bWlo?=
 =?utf-8?B?djAvdHhXdUd6S2tmSVd4MkxGRzFQdUJBb0tFWFpMRlNrSVNzMFBHMnU3eXJk?=
 =?utf-8?B?eVZMRXhWZFZEYTVFVFFaZmN2eHhPeHZldmg3cnBYcVV3N0lJODZqcldHMkxh?=
 =?utf-8?B?aXpmdXZRZkxCeUdyYlpUdjg5S0s3ZHZUc1YwYWRuaUcrMk55NE9RMnZ4cThj?=
 =?utf-8?B?VDZNelhJS2xlVUROdXVpRTR6ZUg1dGIwUGdxY0xSZFhyVitmcDhCTFRDZWpi?=
 =?utf-8?B?aTdsMmh3d04wMXRHeS9BK1lDMXdsTjBjTnB4VmFKRUdIN0dIUkRiRVZQM3NP?=
 =?utf-8?B?WjNPbU92REpmeTlLZ0JuSUhZU2xndmpnVGZyRkxmaXdwWFp3cjB1SldQU2lq?=
 =?utf-8?B?LzBxK28wVWhjckpLcm5hdlZZcTM5NHBseHRjYWF1Q1hndVdrVklkTEFnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjNlRUxzM0RlaUZKM3hjc3NyN0FjUjB1aC9qb0M4N2JweUczUkh2dlVqWGJT?=
 =?utf-8?B?U3hacnpvcjRNTGtMak8xelh6dGNMdS9WM1ZQbmhZVC9NSVZnQVhOU1pnTFJB?=
 =?utf-8?B?RnZFb1M3QytvRGU5SzRxblRPZTNWZVgrVGMyWjJ4S25XaGNrM1BocUJnZGh4?=
 =?utf-8?B?UmhtUmd5UWhJc0E4OFhUR3J3cWswdTBkbSs1ZUZPbTFvQm5nNnRvTVNMODdG?=
 =?utf-8?B?TlBOUnEySWdIaGZhUytVVy9RWG9qWlJqTjY1UlBuWmMzMW5Wc2JlRXI5dEJZ?=
 =?utf-8?B?MGlCVWZiQU41cUp3TFVhQlBkUTVnMGF6K1htTWVuY3N6aEpBRExPYThBOTdM?=
 =?utf-8?B?cGRrb05LVTZHaHBWZjc3QTlqWTFCMUtLSmRzTjZ3MDcrWlZFbURhTGFHdWk4?=
 =?utf-8?B?Q3FVNWt0OU1QaGVkMllnUEczMU1mczJCczN1a2hoTEFXQ2g3KzAxVkJ6bGpS?=
 =?utf-8?B?emlibys2dHVPWkNMcUhrSkdSYmtpeVQxZUtFdjdZWW14ZTB6ZEtiU0dDRDBa?=
 =?utf-8?B?RGpGd1FzN28wVzR4bGExZjZVdm5GQ0lXSnhRYmZrc2w3eUtsb1A3QXdTR0M4?=
 =?utf-8?B?RjRFMEFPNzY2QkQ0N0xQandRQzU4cktwNWIwd25aSVd4MUo2eEVLbU45elMr?=
 =?utf-8?B?M3RXS05kMkZPSWI5aDFnQ29RZnVEVmI3bDlDcWhsN3Z1N01HbFFxYi9WMEsy?=
 =?utf-8?B?Qm8xalREU1ZJcEhLV3dZUEJJN09PSnRqTXNtZXN3NlB6RHA0OGdqM05BYS9W?=
 =?utf-8?B?YkQ5VUI2anBMRkFoc1FhMjNlODh0NXhtYjlST1M5UW9oUnVFTHZsN29DTG5Y?=
 =?utf-8?B?Z1g0UzVNODhPRkYwMVFBMWsyQW4zR1BxTllmeEhuNk1KT1pLakxFWHRtL3dG?=
 =?utf-8?B?UGNiTzVMVW1VOUNGSlBGWVdiZ2dha0hvR3Y2bjNnVFJ5SHVNck1kVjlvZjNC?=
 =?utf-8?B?cmx3MENSWnRhNmVCcllFOXIvYmMzSlpLYlBSbkJwYjJSWkJ4QUhBQWpTaWxL?=
 =?utf-8?B?N3h5SndVZ0JDdzQ3VXBZOFRsU2xKNDZ2SFVPbkVzRGt6OGpLTVJoR2d6cURq?=
 =?utf-8?B?VU9Dc0k1b3luZG0rMTZ2VHhZdXB4WVpzd2lSUE8zNTZub002ZjVWYnoxa3ps?=
 =?utf-8?B?ZEdiYm90NENneWJMcGc3ZEhCQzZCZ0l5dzdNTFF3L1o3bGFmZDJGTmZ6TE9V?=
 =?utf-8?B?RGFJWUlpbzFyWHF1VTVrM01ENUI4UXdxaVg1Um5yeG1OUnN3VVlkUDhQVDJT?=
 =?utf-8?B?TVFJYnFINHlGUjBCM2dEbUxXVENYNnNjejJ3ay80emMvdERjaTJyZWlLNXlE?=
 =?utf-8?B?TktiR0JvMWZ0RVdXUHRxTjhFL3F6VkpJLzZWSExteGxaNnJmcVFlTTV4eG9O?=
 =?utf-8?B?NVdDRStjUDgwMDhDaHd2REt1aENrZEhiNUk2aUQvcnlEdzNhS280NmF5Qlhm?=
 =?utf-8?B?K0FMRitHNXUzMDRacjVOT1M4NVFBNjRackNJdzZyM3ZxSWZwVlRJaFdrMnRh?=
 =?utf-8?B?SmVwczNiVStpMkN5S1pyQlUvOHIrbFBOUkFyR0VxZmpGdU93UDVDNWprNzdn?=
 =?utf-8?B?SzRtV0FKWXZOZzRLOVpsOW4vYlk4NWJTKzZWOWFUdG9EaXFIVFNIN1M1TjAz?=
 =?utf-8?B?VGk2ckkxL3lJRVJWc0xIU0dOVlU1a3dwT0gwNmVWZzNmcEpKTXJqekEybSsx?=
 =?utf-8?B?NHRJOU9udVNIblA5OVRZODZLbDJaMVBtZWN2NWs1Uno3eStVaW5TYXJYODR6?=
 =?utf-8?B?ZzFxZjFhVUZTL29KcWcxUHh3OGtrbTk1cGtEczJVZkVhRHBBcXgzWXlOVEI1?=
 =?utf-8?B?VEZaV1QrOCtRMGRnVXdpclFBemRXOEowQ3drMzBHSGxzamROQ2dDZ1hOYTBL?=
 =?utf-8?B?ZlU4elg1VDZ0cW8vSno5b1RtczBNMGZpWFRkTHpEZXp4Q3dxa2RYbERZbHFx?=
 =?utf-8?B?c0xuVWtKUnVhZ3VCa2hNb1h6dSsraXZHSEZ2MjFOWkhsSlQrOTZUT3ZmYzI4?=
 =?utf-8?B?NVlra0Fuc1UzazlzVUtiUDdvOWRTaC8veTN0ZEQ4MXl5VlgwUE9HR0FTcVRO?=
 =?utf-8?B?Vjh3R2kyQjhkQUN2cXdaT1FUUFhSWTBlY29mS3diaEFKQVVqbjVmWEQ3ZnFB?=
 =?utf-8?B?R3dBZ1lFS3ZPbmpDUTdtR08vb0pnL1pSR1QwTHdDUU42VmFGME81NXNrRDlJ?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a40e009-fbce-42f7-7cd1-08dcff679a3a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 20:06:01.5441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /5JBuxDWzFZlreAia9FNRjRzTwJNZKfWHbqmNOntHTNIKZQ9iVHMxuvQUEqsfPVJuqV1KqYhQAjkC8vKpN6COCWB5Wa4TA9FmcPswunb1Io=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4741
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

--------------yqRPLKwSUThaCYFYmYLYTWOJ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi igt-dev,

On 11/5/2024 1:47 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/xe_vm: Reduce n_execs for bind-array-enobufs
> *URL:* 	https://patchwork.freedesktop.org/series/140965/
> *State:* 	success
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12042/index.html
>
>
>   CI Bug Log - changes from IGT_8098 -> IGTPW_12042
>
>
>     Summary
>
> *SUCCESS*
>
> No regressions found.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12042/index.html
>
>
>     Participating hosts (46 -> 44)
>
> Missing (2): bat-arls-1 fi-snb-2520m
>
>
>     Known issues
>
> Here are the changes found in IGTPW_12042 that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@i915_selftest@live:
>
>       o bat-arlh-3: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8098/bat-arlh-3/igt@i915_selftest@live.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12042/bat-arlh-3/igt@i915_selftest@live.html>
>         (i915#12133
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133>)
>       o bat-arls-2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8098/bat-arls-2/igt@i915_selftest@live.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12042/bat-arls-2/igt@i915_selftest@live.html>
>         (i915#12133
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133>)
>       o bat-mtlp-6: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8098/bat-mtlp-6/igt@i915_selftest@live.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12042/bat-mtlp-6/igt@i915_selftest@live.html>
>         (i915#12061
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061>
>         / i915#12133
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133>)
>  *
>
>     igt@i915_selftest@live@workarounds:
>
>       o bat-arlh-3: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8098/bat-arlh-3/igt@i915_selftest@live@workarounds.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12042/bat-arlh-3/igt@i915_selftest@live@workarounds.html>
>         (i915#12061
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061>)
>       o bat-mtlp-6: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8098/bat-mtlp-6/igt@i915_selftest@live@workarounds.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12042/bat-mtlp-6/igt@i915_selftest@live@workarounds.html>
>         (i915#12061
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061>)
>       o bat-arls-2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8098/bat-arls-2/igt@i915_selftest@live@workarounds.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12042/bat-arls-2/igt@i915_selftest@live@workarounds.html>
>         (i915#12061
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061>)
>
>
>         Possible fixes
>
>  *
>
>     igt@debugfs_test@sysfs:
>
>       o {bat-mtlp-9}: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8098/bat-mtlp-9/igt@debugfs_test@sysfs.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12042/bat-mtlp-9/igt@debugfs_test@sysfs.html>
>  *
>
>     igt@i915_selftest@live:
>
>       o bat-mtlp-8: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8098/bat-mtlp-8/igt@i915_selftest@live.html>
>         (i915#12133
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12042/bat-mtlp-8/igt@i915_selftest@live.html>
>  *
>
>     igt@i915_selftest@live@hangcheck:
>
>       o bat-mtlp-8: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8098/bat-mtlp-8/igt@i915_selftest@live@hangcheck.html>
>         (i915#11349
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349>
>         / i915#12133
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12042/bat-mtlp-8/igt@i915_selftest@live@hangcheck.html>
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
This is unrelated to Xe test,

Regards,

Jagmeet

>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8098 -> IGTPW_12042
>   * Linux: CI_DRM_15636 -> CI_DRM_15637
>
> CI-20190529: 20190529
> CI_DRM_15636: b925cb281e79b763990ed64267ef82a87ace5060 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> CI_DRM_15637: 1051f5a468c5531923b01ba67999e502ce47a6b0 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_12042: c90b9d96eeaa62f09596c5f4e5c759633bbaebcc @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8098: 8098
>
--------------yqRPLKwSUThaCYFYmYLYTWOJ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi igt-dev,<br>
    </p>
    <div class="moz-cite-prefix">On 11/5/2024 1:47 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:173084325892.1414110.12277836322296276507@2413ebb6fbb6">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel/xe_vm: Reduce n_execs for bind-array-enobufs</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/140965/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/140965/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>success</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12042/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12042/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from IGT_8098 -&gt; IGTPW_12042</h1>
      <h2>Summary</h2>
      <p><strong>SUCCESS</strong></p>
      <p>No regressions found.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12042/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12042/index.html</a></p>
      <h2>Participating hosts (46 -&gt; 44)</h2>
      <p>Missing (2): bat-arls-1 fi-snb-2520m </p>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_12042 that come from known
        issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@i915_selftest@live:</p>
          <ul>
            <li>bat-arlh-3: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8098/bat-arlh-3/igt@i915_selftest@live.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12042/bat-arlh-3/igt@i915_selftest@live.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133" moz-do-not-send="true">i915#12133</a>)</li>
            <li>bat-arls-2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8098/bat-arls-2/igt@i915_selftest@live.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12042/bat-arls-2/igt@i915_selftest@live.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133" moz-do-not-send="true">i915#12133</a>)</li>
            <li>bat-mtlp-6: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8098/bat-mtlp-6/igt@i915_selftest@live.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12042/bat-mtlp-6/igt@i915_selftest@live.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061" moz-do-not-send="true">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133" moz-do-not-send="true">i915#12133</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@workarounds:</p>
          <ul>
            <li>bat-arlh-3: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8098/bat-arlh-3/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12042/bat-arlh-3/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061" moz-do-not-send="true">i915#12061</a>)</li>
            <li>bat-mtlp-6: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8098/bat-mtlp-6/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12042/bat-mtlp-6/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061" moz-do-not-send="true">i915#12061</a>)</li>
            <li>bat-arls-2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8098/bat-arls-2/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12042/bat-arls-2/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061" moz-do-not-send="true">i915#12061</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@debugfs_test@sysfs:</p>
          <ul>
            <li>{bat-mtlp-9}: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8098/bat-mtlp-9/igt@debugfs_test@sysfs.html" moz-do-not-send="true">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12042/bat-mtlp-9/igt@debugfs_test@sysfs.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live:</p>
          <ul>
            <li>bat-mtlp-8: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8098/bat-mtlp-8/igt@i915_selftest@live.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133" moz-do-not-send="true">i915#12133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12042/bat-mtlp-8/igt@i915_selftest@live.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@hangcheck:</p>
          <ul>
            <li>bat-mtlp-8: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8098/bat-mtlp-8/igt@i915_selftest@live@hangcheck.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349" moz-do-not-send="true">i915#11349</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133" moz-do-not-send="true">i915#12133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12042/bat-mtlp-8/igt@i915_selftest@live@hangcheck.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
    </blockquote>
    <p>This is unrelated to Xe test,</p>
    <p>Regards,</p>
    <p>Jagmeet<br>
    </p>
    <blockquote type="cite" cite="mid:173084325892.1414110.12277836322296276507@2413ebb6fbb6">
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_8098 -&gt; IGTPW_12042</li>
        <li>Linux: CI_DRM_15636 -&gt; CI_DRM_15637</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_15636: b925cb281e79b763990ed64267ef82a87ace5060 @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        CI_DRM_15637: 1051f5a468c5531923b01ba67999e502ce47a6b0 @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_12042: c90b9d96eeaa62f09596c5f4e5c759633bbaebcc @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_8098: 8098</p>
    </blockquote>
  </body>
</html>

--------------yqRPLKwSUThaCYFYmYLYTWOJ--
