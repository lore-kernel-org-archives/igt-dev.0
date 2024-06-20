Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AC3C27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 21:54:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C351910E1E0;
	Thu, 20 Jun 2024 21:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="inUyhAQE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B06E10E1E0
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 21:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718920497; x=1750456497;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xkfLCfVnhh+/vOHBks8PRC+qkUcoZTztBBWXszZmDf0=;
 b=inUyhAQEv/dGG9OMHOgwT3qzEVQE2M2HKKBoqxnwnrFrqPHwWGRsVQqo
 XrvJoSVueoly+3687mMcglpdlfg1YLnLGSWfgFmJes12Nh7nLUavZ/CMT
 nHfNUSWnhiq/7jvdEmP+cOGxtMmJwhu9IrEVN15LARqeBVT36GlHpNvjQ
 YlLGyFeOKpvbf6aUI0cj4rIMw6pkjbbeE+cphlAGqHglct2wPh3ZfuCQA
 Bdl43EwrmnJKTrEhGVhdixYDn1juaawZy+NXROQhwfvaL9K/u7waNfl7/
 YHpPNBSEo/lonlhCO/eLL7xLCacvs2Z4fIs5Y/6GgpRWlYrA5kiihlp7+ w==;
X-CSE-ConnectionGUID: /Cm1jhbXSdOQNUV6kXE1Eg==
X-CSE-MsgGUID: SF6ikcGxSc61zDfYDNwjxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15766015"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="15766015"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 14:54:53 -0700
X-CSE-ConnectionGUID: haNyVn9ARGe9T9HMmSV/xA==
X-CSE-MsgGUID: LgIUzFoWSjGtgtMvpZjmQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="42467498"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 14:54:45 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 14:54:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 14:54:43 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 14:54:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcxnKzWmusL+ukHwZ7GtdwQrjTCSWWZSkiugirB0pOo+DoVJjYE23jmbSMtlU53OjQyjbopG5zNn68AMWzpsprec6qSycq9VelisnC/JapoNtDJdQrLRkyTkCMO4ZLkUPfFPXTJZsPKGKynCcP91ZwTUBjvBN6O+y80QxlMNwGRBq4IDMPlz7xgqbkuyyAuhs4lRxnua5+xMXmTUtJfQgamW9IbPN5sGsAS6419N88rBqvHoirIlrGE8yNuB1cQpTXBAKydczxgsH7TV/7tGAUmu03nKJB9JF3GORb6nry4gJsRFB9EqevBPh62KvFGn7YWiaH8ymMDmiJLt8PZxGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WeBpWwuAnzHFsge+xGxdha8p2yodDcy0JdpQnY3N32I=;
 b=gffV3oXXxj4T4/HWbt38j+bFtr+Hf+H83ZQ75+D1vmH8RJMkRn/Y9EqiC+9xfyhx9BZND/d8iVSc95CAOaDjD6SlOlT/TCUw3tN8S8oExOi7unrAeKbsf7ByQW3sG1V4/EoeJDXpg98oSt3DVgBM4rRNuEhcQJlAmM/oLKxC5kAVcUyAubUtXY+2Kj0x7Xpik2ZQ3SfyLBBzbqm4FkyV6o3vKje2UMhLTkrG44SKKKpbap07zVSoqFsKLp6cyneJGc/SwLA2bGuU+wUq2WJ+Oo0B5X3rwj7gp+jSXNM3lhamdVYagyE2MvTxR/lcAc5FrWvWFbYTjuO2w2DJoSEDuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MN0PR11MB6301.namprd11.prod.outlook.com (2603:10b6:208:3c3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.18; Thu, 20 Jun
 2024 21:54:40 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 21:54:40 +0000
Date: Thu, 20 Jun 2024 14:54:38 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 02/28] lib/xe/oa: Add LNL metric guids
Message-ID: <ZnSlHqWyab5ptrxJ@orsosgc001>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
 <20240620200054.3550653-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240620200054.3550653-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0240.namprd03.prod.outlook.com
 (2603:10b6:303:b9::35) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MN0PR11MB6301:EE_
X-MS-Office365-Filtering-Correlation-Id: d0c34c54-37f9-4b25-cf70-08dc9173962a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3J0d1FQUVRGWFFnbGFtUGZxL3ZxeTZCSDgzbVA2MGZBSFhqK2tFdjlySm1q?=
 =?utf-8?B?UlA1UzlQcys5akVWaDlrdkRXT0szbzN2cndNYzdwNC95Vk5uOGJ1WlFRaERi?=
 =?utf-8?B?c0pid3dWa2l0VUJKa1hIck8vamhCdG43T2g1TUNVRXlJSXM3aUdzT0I2V1ZG?=
 =?utf-8?B?R1pZU1p6SzhwRXl3UHM2MFNyaWQrcXdnWnBZVUN2TUFZRjBEUzk0ZVNMOTZV?=
 =?utf-8?B?YVBZWnRGcXl3cmNtUjNwTGdHV2toYW9FZFlnVjdQNG10MGVaemd0RndrcnFG?=
 =?utf-8?B?ZnFLU0NPb2tta0JndjZRN1lyVithRUlsbHlwM1hPdUZxaU9jYjRXQlVWVFEx?=
 =?utf-8?B?VTc0UEd4Q1ZVMXNCYkwrL1BVbW9Ob3BteHRTb045U2VJaE90anlWTXhEWlZL?=
 =?utf-8?B?Yk1KSnA3UkxpeHc2VElCWTV1em8wTmozZGxSdElxZlZHUk10RkJVZlVIdGFQ?=
 =?utf-8?B?ejM2M1hmeFU5aTlhRXF0K1Z1L1NOZGtpQmRSamFDbEczenBaT1Z0LzVUWEk3?=
 =?utf-8?B?d25lQmdlc1llRTRRYnhWZXIvRVpQbVJkR1NPMXAvVDFXaGNmYUV3cVJwRWxW?=
 =?utf-8?B?UTFqbEREaTNkTjYyVnA2U1dPdDJnSTRHR0J1TW0rM3Y5REtpRDhBWldKeEMy?=
 =?utf-8?B?a2c5L1Bacnd0WmtuMnlmSkoydHk0ZTB5eGw0YWNQZjJudzYzQ202bWp5VkJw?=
 =?utf-8?B?enMrNDlxbmVFOW8xRk4wRUVMS0ZhOFV6dnlPR0MvS2FhZzNEYURHcndBdEQv?=
 =?utf-8?B?UWhIOSs2Qm82UDBjMTRSODJxVm55QjYwbmQvcVZmMmZYekJtTjhlQ0lLa051?=
 =?utf-8?B?MEx4TUJsUCtwczhlb1NqODZXUDUxMElhcDhLVTdBRkYwdkFJaTFIdmNIeXhm?=
 =?utf-8?B?Yk9USEdYeVh4VGxFcXpnT3lXYktGYTNhRHVVUlQ0U2xXTy9Najd2aFNPeWhP?=
 =?utf-8?B?K21jM3pOWE9YQzBPM0w2WVFMS29ETDhMZnFOZnpkU0Y2S2xHTDZJR0NzUWZs?=
 =?utf-8?B?STRkRkU2T3hUZjlURitUUkVNaTAyWkJWTnQrYThvY21xY3I4cFgzNTNOT2Fh?=
 =?utf-8?B?WXNoWXBJYjMvM0RCUlZHemdmWG1STXJGcDJyTjFkdjFIWFZxRzRlREdXK2Q5?=
 =?utf-8?B?VWRhVE5qUytIc25Za1ltWUVaY3JGRC9BNDl6RlM5Zm1MVk1pL0lrdytJOVVM?=
 =?utf-8?B?MTRJb0g5VzY1WVI2Y1NDdnlPS1oxWXAwKzAzRWR0TW1XNlN0eHU5N2Z3MjRQ?=
 =?utf-8?B?NXFQOWxFWDdRc1h0SUFDOVVNT1VPL29kVFJmNE05UVAzQWFTcTE0a2JkWHZa?=
 =?utf-8?B?YXZ1SXhHd0VwOHhEUmdEdUdHcDczbzAxSXl3RUF5T2wwK3lUenhlTU1YYm40?=
 =?utf-8?B?YjFEVE1veFYzazBUM0UyZGQ3Mnl6TnBJLzFlNVIrU1dHQmIzZ1IzT2RNVkY3?=
 =?utf-8?B?ZkZoMllYYzE3OXVoZkgwRHh5dm1pdkdKTjBJYy9VZTFXQ0dHWmNSdUtkQmY0?=
 =?utf-8?B?R0hBYjNldWFaQThnbzlJcGhhTVBNNVJib3ZodytOM3NEMjcveHl0b1h3RE42?=
 =?utf-8?B?RXRaTHhQVnFIOFhFSm9naXhqcklqZmVrL2ppenIwQ0c1WWhFNFFpWlpFYWVE?=
 =?utf-8?B?Z3VKckNHVVVzMWJXVVJMOUhiUFZpSkRlb1YrVk1tbWFRZENZNXdCSStNaVcw?=
 =?utf-8?B?Ly85WlA0UDBaanRZR2tDaGRyQm5EQnl6Z0hLcWIzL1VPeklzc1h5a3NsY3lX?=
 =?utf-8?Q?9HLPCzwtDhEklYGs7xVhX30cd9toZcoBl0qsheC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG9ndkdIWHlGT1FKd092SzNabGhFcFJLa1Z2aVAzcTNJZW1QNjhjOFJUeU8z?=
 =?utf-8?B?d2R2cFVGT1BzRzJtN1V4QlZZRzRmdTV2ZGUzZ094djlCWVhGMlhFbmtWUklp?=
 =?utf-8?B?dGJycG9YdmlmNnBObE5VNUVIZkVrdmR4dDByRjNSQjFzcTEwZUhsV09CRFVM?=
 =?utf-8?B?WHdLQUxXV1UySFRqR2tRR05LT1orbFFWdWVnYVJEellPUGFnc0xUays4eGkv?=
 =?utf-8?B?ektrd2k0SERyN0xZeW40OWNsanAvQlg4c0xDVXlUSmlQYkhmZ1Bmd0xvVWxY?=
 =?utf-8?B?VTdVaTE4Q0tWbmRFaWhlcnNJTVNUZm45blV4eTF2Ky9vRjA0VmdpTTR0YUgw?=
 =?utf-8?B?ZEw3YnUyazF6Q25BdkxuZUttb3R3V09FbzVxZGQ0WlprTm5XWjJyWU1jeFBu?=
 =?utf-8?B?SCtqNWtjQ25LTjJHNEZyNTZLczZzTjlucjdSemF5Kyt0MGtieEdKQktycFZ6?=
 =?utf-8?B?QjVqLzZrWWtvWnBiV25NSFVLSHQ4cmtJbE0rKzBWaGJuVDloQ3YySThZMFkv?=
 =?utf-8?B?RU9JejY1U2orNk9EcWZ1b2ZFenpTWHVZQnhGZldsRlBPWWdXVm8xVE1HZzRV?=
 =?utf-8?B?K0RESjh5SzJvWWN6bk16akJZQjJQdnBOYnpWZmJabndxV1JaSHJ2czMyUDUr?=
 =?utf-8?B?N0RoZVk3d1Z5c09HSmljWHVMaFdDcURIeWlTd01jRm9XOVBhaHdIeFRNem81?=
 =?utf-8?B?NzZ0V2ZqV2JBZmJYSFFjN0IxcjBiWFRpZU1jMXR6akRIVExZNnA1WW5oTnA0?=
 =?utf-8?B?ZHE0Z0FvRTRFNFlDYyt6NG5oRzNROTFRRGhUb3IyUlU2SUg4a092dVBTaXh6?=
 =?utf-8?B?SFJEUlNzSXcrWi82R0ROcjlqMjMrbytDMU5ndHpvYlAwK1ROS3RGRGZ4OE04?=
 =?utf-8?B?SEhWV0YyNXRvQWVDbmFJT3ZmZmdQc1BVWm9WUUxkb0NuWTl0MkllbS90WDM1?=
 =?utf-8?B?T0RILy92UHpoajBwQXZqYnoyL2sreWt5em82ZXgyZUFlOVBlSDFreW5HaW9Y?=
 =?utf-8?B?ZlkvWXVhR2MyeXJVUWF6eUNzZDRheTcza3Z3OEZ3MlFZMVVwR2Yvb3grdG1l?=
 =?utf-8?B?TXB3bnVWQUpQZGlMN0hXRHFja0kvM1JNTUVhTEdwSjk4T3k2eUlHV3pnMCtw?=
 =?utf-8?B?UVdHUVQ5bVlrNTdBK1FiVkJQZ3QzV1JuUTJsNUZqRG41T01aVlVEMkYxQ1pq?=
 =?utf-8?B?NVhqYmVhWG14Q3JDa3M0dHpTSEhmOTdQUFhYMzlTT25aTlBQMzJzeUo2YmhU?=
 =?utf-8?B?d2diUE1vUWhmNXNyR0JwUHN6dzEwc3J0Vmh3Mno2VlAzamNicFVZZlcxaHhZ?=
 =?utf-8?B?WG5PYk94ZHJrMXh3Ly9KS3lDLzdQcXB6V280SmxQZjRaeG9aTDgzUXpXZFpa?=
 =?utf-8?B?ZS96b3dIaGFZRWpGN0pRbGtrTnphVnpjRlBPY0t3MnQyQ0xsN0V1NVplWjJz?=
 =?utf-8?B?VXVEbm12NzBWWFlnV2lQeExJK0lxOW9NV2tCa2d1VTZTNTNZa2s2Y1g5eFZw?=
 =?utf-8?B?QzJCSDVZZnNRMVVjbStKZmdRMkc3RGhnM3h2WDJmV2VzSGJoZldoSXNzNkJF?=
 =?utf-8?B?OTdvcWg1UlFnYTJyRG4ybGhNeUdSNXhvL0tpMEcxOEthaXFqMGhMTkVEb0NI?=
 =?utf-8?B?QUpTbGxqN3hjUTJ0dlA0ZzdsNGdpbTdLclZTdkltRFdXbFY1TmtNVnYrZlIx?=
 =?utf-8?B?KzdhWnFKbCsrU1E4elVCWVBVZUZPc21jTDMzeEZWTEtQL0ptZzkxaUdHbzZ2?=
 =?utf-8?B?bklVWXZZb3BGM3oyMTZGVzRBd2tJazM5dVBkL2gxcFROVjB4RUFpS2ZRZlk4?=
 =?utf-8?B?OXJML0ZoR3BqeUdjYzMvWHdtQWpmOTV0UGFrMm1LbFBucnFCWGMxQkptVTJQ?=
 =?utf-8?B?WWM4ZE9UcjlxdFUyRzl3QUVyY1NFaVlQTUNVVk5heUZtVnlPZFdrVFpORDB3?=
 =?utf-8?B?OUowQkRaNnJaRVlMV1dJVXlGYmUydG1NK1Vtaks3SXE5N281b0lyNTZaanJi?=
 =?utf-8?B?ODg3RWd1ajNaOHVQbGdwQ05kSjZLUk1NMWdVZEZ1bEQ1eXAyMjhwYnVZNHJr?=
 =?utf-8?B?cjNVVkJvZ01KUkJzVWplbFE2RlZhKzNnU3JqMDNaM1RwWGJieFYzQS91L2Zj?=
 =?utf-8?B?VmVmUG1GY1V3dEtyYmxDdmRMcXZULzhQUS8yYnB1ekc1K1h2MlkreWRrR0RU?=
 =?utf-8?Q?h03rl57H7eewfJWdkeV/Q8U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c34c54-37f9-4b25-cf70-08dc9173962a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 21:54:40.7655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Jh2YIMXMt96DUnM+qOvFwGphlxVSm8XOZHquJNHfYZOXHPABP+47Srfycoo+WHDDDOUE3XxzchlgWiHQbIUp2n5PhJ5SWjm2xgCWbQsn+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6301
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

On Thu, Jun 20, 2024 at 01:00:27PM -0700, Ashutosh Dixit wrote:
>$ update-guids.py --guids=guids.xml MetricsXML_P31.xml > guids.xml2
>
>And copying the new guids to guids.xml (as per the README).
>
>Note: as mentioned in update-guids.py and README.md, in order to generate
>config_hash in guids.xml, mdapi-convert-xml.py must first be run (as
>outline in the next commit) and then update-guids.py command above should
>be repeated.
>
>Note: LNL media guids had issues after running mdapi-convert-xml.py so have
>not been added, revisit this.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> lib/xe/oa-configs/guids.xml           | 14 ++++++++++++++
> lib/xe/oa-configs/oa_guid_registry.py |  4 +++-
> lib/xe/oa-configs/update-guids.py     |  1 +
> 3 files changed, 18 insertions(+), 1 deletion(-)
>
>diff --git a/lib/xe/oa-configs/guids.xml b/lib/xe/oa-configs/guids.xml
>index 510450f87a..27330edd3d 100644
>--- a/lib/xe/oa-configs/guids.xml
>+++ b/lib/xe/oa-configs/guids.xml
>@@ -2746,4 +2746,18 @@
>     <guid config_hash="482cebdeeb78bb56e67b42d24644c8db" mdapi_config_hash="11e33e01a371bf15e59b9786f4fe1050" id="4d9b2817-19b9-4461-a54b-dc9fdb7d69cb" chipset="mtlgt3" name="MediaSet1" />
>     <guid config_hash="5bfab887a79b99cf34a606dcca5f4f8a" mdapi_config_hash="1c238e39e5c73eefd870cef2fb7a18af" id="651a6694-0ac1-4bd5-a4a1-94bcf479d4f4" chipset="mtlgt3" name="MediaSet2" />
>     <guid config_hash="44bcb438bea8b46b57779739bebfbd69" mdapi_config_hash="fbbd97d1f3b60c17eae57bbd3c42e7fe" id="bac01106-5869-489c-a306-67303a434173" chipset="mtlgt3" name="TestOam" />
>+    <guid config_hash="208c3c79f1b4db2f86277292566d3f10" mdapi_config_hash="1fbaf5ad061ccf96ff7d4e108cbcf3ae" id="12f20772-0044-44ff-bcc0-d2bc252d140e" chipset="lnl" name="RenderBasic" />
>+    <guid config_hash="b781b616d31187e7f4982f3a238b0ecd" mdapi_config_hash="35c121ef361006ca639d1e3377b5c6d7" id="72539be3-67d9-4101-b067-766b7811d2bb" chipset="lnl" name="ComputeBasic" />
>+    <guid config_hash="955739b43332e61729e0a7a032188c02" mdapi_config_hash="d9be0378dd2dd6a5f85f71d156d21b43" id="cae0b2ca-c52a-4111-b8bf-5af070677d57" chipset="lnl" name="DepthProfile" />
>+    <guid config_hash="55ecb5067bca7d99769a30a14eaceba5" mdapi_config_hash="e444af605670c2230a5796b4ad65b2c0" id="70cc56cf-3a37-4f6c-8911-4455fe441b2a" chipset="lnl" name="DeviceCacheProfile" />
>+    <guid config_hash="e4a38cb223b20b9c28c5941b2f4979cb" mdapi_config_hash="952b726980ff7e836089c7651070f44f" id="01ffd51d-a6d6-4ff4-93d0-619f04c3a547" chipset="lnl" name="MemoryProfile" />
>+    <guid config_hash="5d38d137356ca80dca2ea337449675be" mdapi_config_hash="07f0aa1a93f77bc7b6771ba2b68c8325" id="6791470f-f1e6-4f77-9013-bcb0c4be6f57" chipset="lnl" name="RenderPipeProfile" />
>+    <guid config_hash="72e3ab9e7d727f97c5ea29bef23be40e" mdapi_config_hash="e6b78fe68f406ee2a0cc25293c60bc62" id="d66ce633-4ae5-4de2-8678-9705adfd45bc" chipset="lnl" name="RTProfile" />
>+    <guid config_hash="6dc1bd4e8d8b49cc9776701db836ffe9" mdapi_config_hash="cee63b3642783febd3bcbf45629c5e1c" id="e7338926-568c-4424-bc44-f90318a6b472" chipset="lnl" name="VectorEngineProfile" />
>+    <guid config_hash="b87d3a3dfab7193309deb13aeb595589" mdapi_config_hash="1950d62ef4b729af4494d76ca3ec8101" id="4ccd6535-fb9a-440f-b0f5-882879dc4cb0" chipset="lnl" name="VectorEngineStalls" />
>+    <guid config_hash="9df6fd1c4fd100b5e50cd97e16bd1cb8" mdapi_config_hash="47c19557fd9591c3fc3955e46db4565c" id="24c33f2c-f8d9-40d9-b2db-64e863b4d625" chipset="lnl" name="TestOa" />
>+    <guid config_hash="9bfa717fd19e8d5b99062ca0101113dd" mdapi_config_hash="f390ce860d404c3f22f9d1a3159ec58e" id="0af24f48-05bc-467b-b561-33dec252e651" chipset="lnl" name="MetricSet1" />
>+    <guid config_hash="d635631df97322be3d97b9c4e38152e9" mdapi_config_hash="68c19075e48e5128b456a91cd7b95286" id="914ad901-832a-4ccd-a21e-ddc7690ed213" chipset="lnl" name="MetricSet2" />
>+    <guid config_hash="d63d186f5b83e91f8c0680847bbf4b24" mdapi_config_hash="d31ec4eaa11c8be0d8d72ecece53434f" id="3b3c9f55-e34b-423d-8c05-7b1af03b6685" chipset="lnl" name="MetricSet3" />
>+    <guid config_hash="76b7587d047c30ecde26e3f6253b4165" mdapi_config_hash="e39d956ed7b8d0cbe7d354cff234af7d" id="e6f21065-a6f5-4ea4-a545-80d6aebaab56" chipset="lnl" name="MetricSet4" />
> </guids>
>diff --git a/lib/xe/oa-configs/oa_guid_registry.py b/lib/xe/oa-configs/oa_guid_registry.py
>index ab14b398f3..969d40e568 100644
>--- a/lib/xe/oa-configs/oa_guid_registry.py
>+++ b/lib/xe/oa-configs/oa_guid_registry.py
>@@ -100,7 +100,9 @@ class Registry:
>                            'DG1',
>                            'ACM',
>                            'PVC',
>-                           'MTL', )
>+                           'MTL',
>+                           'LNL',
>+                          )
>         if name in known_chipsets:
>             return name
>
>diff --git a/lib/xe/oa-configs/update-guids.py b/lib/xe/oa-configs/update-guids.py
>index 0c7d129404..18f3458e84 100755
>--- a/lib/xe/oa-configs/update-guids.py
>+++ b/lib/xe/oa-configs/update-guids.py
>@@ -165,6 +165,7 @@ chipsets = [ 'hsw',
>              'tglgt1', 'tglgt2', 'rkl', 'dg1', 'adl',
>              'acmgt1', 'acmgt2', 'acmgt3',
>              'mtlgt2', 'mtlgt3',
>+             'lnl',
> ]
>
> for chipset in chipsets:
>-- 
>2.41.0
>
