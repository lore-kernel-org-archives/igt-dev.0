Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B59CD5BD5
	for <igt-dev@archiver.kernel.org>; Thu, 28 May 2026 06:03:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC5010EC6C;
	Thu, 28 May 2026 06:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IJ7/qXOR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C37710EC6C
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2026 06:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779948161; x=1811484161;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=L09XSxhOOGnIy78L/01E+cSpDhSRyfqxodJLmf9wuOI=;
 b=IJ7/qXOR8/eaWTofqbO5T0JUHpADGDxH9K9VmOJoeW2BYOAMxpPoCvEN
 Zq8KNNqMyNQlcmgtdgm/nCsfa5Nrp8R/GvooInm5guIYCr9a2El5lgFb0
 B3Fp/dc1v1232ainfRQpObhQ7npLA5eR0yRBmFlmV1vLwNrr7j0Ni3Uwy
 6fW4gAXYrODv4lFlOsS+gTBTDb5afLciUyk/KwWjGKEXkn0Y6uppxf0oq
 9PBop8FEL7//JTTQ5A5E9/v4biiFQcXLqJ48q0g9YA9YE6g8xXYisCwz6
 2fXH1HTNBQbEu4WAdtoxpnWN8m/zbtRhRKYNu3i27HR18mAUENvKt9Rnc g==;
X-CSE-ConnectionGUID: xfGbNTD3Sme+vyHZLtncOw==
X-CSE-MsgGUID: /d8CizylSZioP0wtIOD+ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91472607"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="91472607"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 23:02:40 -0700
X-CSE-ConnectionGUID: 7Dl+eIONQemAXVoYYfJdTg==
X-CSE-MsgGUID: kxG13ZeUSUqREAw7fLTfCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="247403875"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 23:02:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 23:02:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 23:02:39 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 23:02:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HDS3m0RBBrtSU1BbTAJcok+PwW+pzkTA7ESAqYwpgOOe0UxMtG+1iuIg80PKJ7TvBZ1hUbLcT9rVZhhmgd9Ct9Kfr+Knbp0FOI9llOFTZNX2wMBwmmHJ8FmGGA7YH+r/hGMtq9WfOp08MGGr1Swy2Vq4ubi8q4b93cwMHALVb6BXbbf5zgQM36fNtQKfdHo1XuWNaKUtQAZZhsRxcdcmUjWQj9Iq7gwUtG8aCOwaCVGSmYJS14FDAvO/s/zwhp2GgP/lHECN5/FxZOACc+A0ImdWOmW8NrvDlJejDs7lCuYoRLUunkLQh/EJk8ZUGf3MxpK3yDjG3P6St+V1lmeD1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMs3RbP314ywKTbpUmRcDJMazNDp2xJ2h6BRGmflLMs=;
 b=SFnINowpr7od+z55UUj/NA4WNEnEajS8TKwe+yQbXLZpXSFb0IpR8t9RERwVnYVGpo7vWZtvpLcvWNbisM6O3gt6yDt/YIAI7PyB2twM/ZAE5C/7sTfpXwj/Omsj73L/FcJty3+mefqwABPB8nZHJKbuqHPQwx63Cz+fe/j74P09QjypsYlAGu+QKy3U6eypocJCc7lLAIUsQDJFQAodz9E2cvbNSHMt76JIQa2oecqhbX13B5R7gTzRm4BiG6bleMYa7IDMqlV76Sq/DuvqIHexUJQC7uH/uTeKyQ0fFlJYGi/xMmcrm1NjVKcUQmrbzLmj1pVodxO6JU+O38aoRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23) by BL3PR11MB6483.namprd11.prod.outlook.com
 (2603:10b6:208:3be::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Thu, 28 May
 2026 06:02:29 +0000
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::5a0d:e357:ce45:3963]) by DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::5a0d:e357:ce45:3963%8]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 06:02:29 +0000
Message-ID: <7a43b2dd-e394-4cdd-8110-2d4db79b6f03@intel.com>
Date: Wed, 27 May 2026 23:02:27 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/?=
 =?UTF-8?Q?xe=5Fpat=3A_dynamic_PAT_index_selection_for_pat-index-auto_=28rev?=
 =?UTF-8?Q?2=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20260527210052.161768-1-zongyao.bai@intel.com>
 <177992859486.18055.14271427240969097538@6beec6c84f66>
Content-Language: en-US
From: "Bai, Zongyao" <zongyao.bai@intel.com>
In-Reply-To: <177992859486.18055.14271427240969097538@6beec6c84f66>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0168.namprd03.prod.outlook.com
 (2603:10b6:a03:338::23) To DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF46B98A11D:EE_|BL3PR11MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fc8bc41-7998-42b2-e54f-08debc7eb33e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|5023799004|4143699003|11063799006|22082099003|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: FeIca0Pdexznz+jyz2Rz53VKcX0V5Z+AhRJGUX25RnGHLabbQppIBAxAcl/tgVXNmSA6LvUzqivmQ2PpUcxJrhfZTBT1kxbiu/5OlfE1UQRvHvw7JXjWFW/e2gLIY9HzfXw8/QTx/oJjt5a1GPumMtxAsILtjppKJCKBSke75VGKYUQ5FK2uSNdvJR1UHd6QjcukCAlsu7YJqvdNwdoTkKbhtNrvt3/quDEeWBFrFd5R3xhGr6yWoJqQWUqbzawiGaUWeVrRNVs5jGWsz0k+Jbf9bvzxXNa74wQLdRto1GsHOABwk4ewvI7zLzoebLo+G7hBSOxPZZCF8Ke+rnnE7XxfkarSiXVGC+jzgDc2Pzwz10groVojfdU0DVSzPRu6AKdbKwIqInoGAXVu60nPjMKjLfVfhIGcsT7R44CxRKWX7CViz1HON9plpM8pxjwJSUSJejPWMHrm2qmw1KI8dW/XeCCWe0dWfPA6a6kLHedOB75c8J1gB4NabZZwTiSX/6HE+1uKfkGeboIHgyrBOIWR+317lZ9unYkQpvbjf6XguwaGpunwS5JdM8J1qDbqu+RqTPyDDZWYVbA4L2ghTIzsHTPsZzkCOZv9vZrcp5kr4IcdcfVYxp6mQGu19GAXlw0AzsmV/pDQB75oXfvyzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF46B98A11D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(5023799004)(4143699003)(11063799006)(22082099003)(18002099003)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTVNckM1dXhPdjM2Mmc1aStHd0xWWWVCbG1rTmJ4NG1CTFR3WjV2V3BuK2wz?=
 =?utf-8?B?cE5oclRKeHFtS2NxQlJYMkhUNitCcnJiaGpRaC9tSUd1eWZhRlhnUXJHamZj?=
 =?utf-8?B?WTdXMDZhdVB6VXNsS0M3QTl6TUkwMStrZXI3QXd4cTRTNU1nQWlPSm1pc3pn?=
 =?utf-8?B?dzE0U2IrVkRnTkdJZUlvSmRTVEtMYjVwQXhhTUgrT2NvVnVFNjlpU3NmWFEz?=
 =?utf-8?B?WDRMdElaUnpadlAxb3lhck1lTnc5ajdBc2M1cDZqWlFtL3k4QWNUUXFScGsy?=
 =?utf-8?B?ZGs4aWhHeHd6T1dRREFGS0RtK3U2YlhkdjJ6SFk5Mjh2aUtudnIyWmZFZVla?=
 =?utf-8?B?U2huWm9hK2xmMDQxYW5NODRndTQvZHErWkMrek8rZ0JKbkRQbzhQNEUxYlNm?=
 =?utf-8?B?aE9KWTlUZ3p5d1JValFLWEY1bDQxNUxrR0hqQzkxZUxvYzNlR3JuaVYrQW8y?=
 =?utf-8?B?RXRxdDlSekE5UXdSaWYzTEZqYkRER05XeHBBTGZVUVR0UXJoUkRkMmhxMnhi?=
 =?utf-8?B?aVJ2TW1vK1VjbmdWZW5adUREa3loTk1QalhaZDg3blVFb3FmY2dWYnFMOFlD?=
 =?utf-8?B?NzhCa3FmUFUyQzJTbDFpd3JyY25FMjhFaHFnOUd6bDg3TVhyU3VPc1M0dXZ6?=
 =?utf-8?B?NTg2aGlnZGFzM21rVWZVb1lhRzYxb0Q4cncrNWNRMkNMQitVZTRHYzJMa2pv?=
 =?utf-8?B?VE55RFNCOHJZMW12MDJjR2xQQk80VDc1bHRUeHFHOG12SVhKeTY3RkNxV0ZS?=
 =?utf-8?B?eUduMEZvdWFySXNrVWNrbXRJcTQ2Z0JENklXNy95dHFKQTRrb3k4Zzl4dmZ4?=
 =?utf-8?B?b2czYldLMS9QNW9NZi9rU2Y0NklWamVNK2doVUNnVW45VHI0MWl6LzZnR2Zr?=
 =?utf-8?B?Z09TODFDTkxaaHhPN1llN0xqMjFBSytwQ24xSlM1U1gwR3hXZ2lRTCtYQWRU?=
 =?utf-8?B?SEkzVkc2dHozbVBkUEF1MU9VT3ZtRG1qdkpqc1AwZ09YdkYwMDl1QW9NamZh?=
 =?utf-8?B?RnZMYmczQzR5dWtkOUxHNVVud2I1eUlZSzdvYTBiS0FsS2VXUmpUM2hmWmR0?=
 =?utf-8?B?UkZPYWxhTVNDVHZlbFUwVENPd1MyeHVRWWdWSXBJVEU4WTJkV3lsOTBKalF3?=
 =?utf-8?B?SW5sbERDRThMWXFwbm1pVG1xVkwvcFN3NEtDeDA3V2RiUFFGVXJTZkFvQjhZ?=
 =?utf-8?B?bW9FSUdzbldqcWF4K0pjbXlIWjdCcG1JTE1meGtYeWFzK1p4d055RzgzYzJi?=
 =?utf-8?B?cEUyQmRDQ0tTVkpraURod3NlOHhMU1lZS1BGZm5NbG1sZEFKU1lOa2thV1Az?=
 =?utf-8?B?b2QvaXcwcWhJTGZnUlR0Mk5hZFBSN1g0dWI1aGdqbHlRWk02ODJTZDNqMURk?=
 =?utf-8?B?ZVlZWkt2SmwvVW41a2VFRjgxVHlMaUpBcVNsdzZLcWZVSytOdW5sOVhxTE51?=
 =?utf-8?B?cUx2Qjc2QjdEYVJrQjg2b0dxTXlRSWJ2d1ZDL1Jad0pmK01EOFVQa2lSYnVv?=
 =?utf-8?B?OXRGQ2RneXlTaW4rQnlqOFZTT2RiRGkvSzlLbW5VVGE0dVdRekE1UVUxOW5G?=
 =?utf-8?B?NWp1cEREdUZ3OXhJQzJ4ZDB0eUNXVlNsaUhWQk1qNWRaR2N2MytLS1Rzb2Nh?=
 =?utf-8?B?RW52aGRHWTh3b2gyc3grNmNjVjgxRTllV3BoY1Q4TklvcVJsblV1R3FNdkxM?=
 =?utf-8?B?Qng1Zk9GVC8vck5mby9pSm43RFc2emNwcGVxWjl2cHhJdXZmOG10Qk9yY3JD?=
 =?utf-8?B?QmhNbWYzVmtJbS9lb2tBYU5UZjJpNnhsNmM4VUFpM3RrU29HbzNxV2x0RFdR?=
 =?utf-8?B?aDJ0V1RCNHBGc0djNUUzMUdUVDJNOGROdVlKeitRTWFaSHR1TnV1SFJFSmQ2?=
 =?utf-8?B?WER4VTNIdmxqR3lpa2d4QVgvRHlUWmhnVDdHN0JWN215bzYwMFUrS1VWdk1H?=
 =?utf-8?B?WGc4NldoRUhjQ0d1Vm00aUMxNW9YV2pFUTk5UDNDdGFzVDBSeDEwRVgxTFJv?=
 =?utf-8?B?bGVUaVZKaG51dVlsZ29WODZCWHI2cTRvQ2tVT3hkM1ZjRUJGWE1sOFBJQ1VH?=
 =?utf-8?B?UnRiemFjWG5EQ2ZjcXJreVpadTd4a2hSMVpNM0dTdElmMnQ4ZEFTL01yVHh6?=
 =?utf-8?B?MXQxUnlRN1N2VGtVK1dVZWliSnl4b2d1RmxCRnhoNjNiTG1jVTRoK1BiVW1I?=
 =?utf-8?B?Z1dmUThKZzdwbTBsdHZianlJclo5L0JIb1RrSFIvd3NoUENSM292R09ESkhH?=
 =?utf-8?B?b3QvaXF3R0dIazlSNEhoZ2JhTEtMTmJOOXF2RzJMVFgwOTdpSlYzaDhZK2U0?=
 =?utf-8?B?T25oUEpyMW1wMmtRZWdZZStuanRJV3RoZWZSY1FCWS9jekluUytYUT09?=
X-Exchange-RoutingPolicyChecked: Wt4T70JhBBkRrh9dXAUwSUCysJwvYwwsOcftHxXF4zs2iTcz+2mESP6Jc5Ve3utB8WdgglFQTJKdcfgWgISgyoOtfzwyD0J3kmF2MeKbPiyzOm5KUzS3SBHYKY4Kz70kstFKHF8hZcCmnj0kop7lxJ/Txivqkusak0CP3LKmC6tSQBM4YoPQyhiYj1i1Xa7gFTpLeO/3EhLIFdBGoygdN43CyidhUpAOEzULRvKnTqbTy5CZbU3yk2gcCBkI0TjD9dcARzQDa7w9fvVkzS6/v4r3SCmjSGEBMiEKUjPeTZT7JNoU0mhZfqivHJcbqw0GSKr9/wluGoEh125N+eqIag==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc8bc41-7998-42b2-e54f-08debc7eb33e
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF46B98A11D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 06:02:29.3536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iam2bg77hNO9OwIlK1qTdjiEy+ybQWBnuAistX4qIf+ctE/Op6XGDXOld+hwTkuYr59NqxQVexR58EMhJRoIDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6483
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


On 5/27/2026 5:36 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/xe_pat: dynamic PAT index selection for 
> pat-index-auto (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/166367/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15266/index.html
>
>
>   CI Bug Log - changes from XEIGT_8939_BAT -> XEIGTPW_15266_BAT
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_15266_BAT absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_15266_BAT, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (13 -> 13)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_15266_BAT:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@xe_pat@pat-index-auto (NEW):
>       o bat-adlp-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15266/bat-adlp-7/igt@xe_pat@pat-index-auto.html>
>       o bat-atsm-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15266/bat-atsm-2/igt@xe_pat@pat-index-auto.html>
>
adlp and atsm are expected to skip this test.

>  *
>
>
>     New tests
>
> New tests have been introduced between XEIGT_8939_BAT and 
> XEIGTPW_15266_BAT:
>
>
>       New IGT tests (4)
>
>  *
>
>     igt@xe_pat@pat-index-auto:
>
>       o Statuses : 10 pass(s) 2 skip(s)
>       o Exec time: [0.0, 25.51] s
>  *
>
>     igt@xe_pat@pat-index-auto@blt:
>
>       o Statuses : 10 pass(s)
>       o Exec time: [2.65, 8.96] s
>  *
>
>     igt@xe_pat@pat-index-auto@dw:
>
>       o Statuses : 10 pass(s)
>       o Exec time: [0.99, 5.21] s
>  *
>
>     igt@xe_pat@pat-index-auto@render:
>
>       o Statuses : 10 pass(s)
>       o Exec time: [3.08, 12.10] s
>
>
>     Build changes
>
>   * IGT: IGT_8939 -> IGTPW_15266
>   * Linux: xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb ->
>     xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6
>
> IGTPW_15266: 02e26a03723e44ee1ab79b6477b993b35f681082 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8939: 8939
> xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb: 
> 11a8456527f00d86dc8b23035c324da194fbbadb
> xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6: 
> 7570b524ddecbe5db4af0c493a047e21bab6b3d6
>
