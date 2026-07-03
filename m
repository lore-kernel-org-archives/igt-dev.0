Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153C6C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 21:08:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4BE310F935;
	Fri,  3 Jul 2026 21:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M0UOwEeb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772EF10F939
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 21:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783112794; x=1814648794;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QJIq+pQLhN6je18DZdseJ0V7FqlDeITWGfz3Y8o6bXM=;
 b=M0UOwEebbQ1U8/z1s9+iAR/lh6J2I+BLZD/xXUTX+FzoNsAk0lUmaGYh
 8LpqrcncqA+9hJh4fegZO10dAsvmtYf8t6Zg98H6GlDtq2tMdb/Xb4pzQ
 Y7pL5AYU4ffTzyj2o7MyAI2Y9m+K2nTLk5QIjSAwni3fCe1er+FIAZ30r
 lcfcQ+tkwKZrOe+kUi0QCycLrM+7EFY9C26y8fGijZRJjE0WVKvHS3Cc5
 yZGvD/msc68G6x9AFytTU4+5JzG+3iS58NMMxOikptgft8xvExvxNAuJJ
 sUAPSBewCRaKpb3PDOWkcT7TvWlmeqijexGqX8Bv3ngNp6VJ3aL3fbWKG g==;
X-CSE-ConnectionGUID: 6IwdoYj8QLmmstLyzsjqnQ==
X-CSE-MsgGUID: cn2AqWaIQsewBGfMLUGHhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86408923"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="86408923"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:06:34 -0700
X-CSE-ConnectionGUID: yz3DUxHKTVihzZHgOXdttw==
X-CSE-MsgGUID: V3YuJO/aTPC4C8+s7pGIIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="277518020"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:06:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:06:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 14:06:33 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:06:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KzqIsnQVY1UKTFZTtrKOt8ol02383YlIaBNE+xnKrAvCmU/AzpAvKAM5cUSLwB9n2ZTNNTDAd2+x0GWeo/sIYSVivTvZKSqpEMMWtx4kQ7ZyYCjiPETyEzWLIHlef+U1SkNH/kEjYkIhZqZc5USwIgiD2lSuqld0mE6WRU40GCKYguEIeM9yM8TEDm//50Gbj27OlUirkeoKMQgdsmcXgeqJFoNvOebdG/5JMv+n+Gtviu4ePywCK3p9/zSs2kr1BRu1cEQMHnR8KbhvwS1AVclvwRE/AvRw4SUGTjeXYsLkLFx3tGyqYluUqcCFPcVdDXVSSS4H8cgvpWbD+P0VIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEeaKw5+jMwN6BSHV04oEU7mwhkYnZ3AB0HvO4RD+Aw=;
 b=AWFPJEnk96PwwxrQVC/Z/tVEB+T8giZNvpeIM/DANG9BzZclcxI5Y2pHw1DhL81qCVDJrkg6SlV2eeCr/Vk0LglOKGVnoEtbwczCZovV2M0vlathg8dqU2Q+WKEr8/KI2xsW2g3b2WG039CYtw5f8Mk3uoVA182Sw7Yzd4SH6CppoVq+fka35MvPfbBV4BWN+C3XomyhadJJla6dx2jOdTl0IWawqlUGYlXwuClk6jk+grwHQi2qpiF4zCWDycQPVy2zlE8jOUE4vCSlZnKr05aJDvqCMeWEEcfDtbj8eNXKOghpDe1Ebf0Xz+fBrjMArJpuGANBVJN19WzMr7paRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by CYYPR11MB8307.namprd11.prod.outlook.com (2603:10b6:930:ba::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 21:06:31 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 21:06:31 +0000
Date: Fri, 3 Jul 2026 23:06:25 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 22/31] tools/intel_audio_dump: link with minimal
 sub-libraries
Message-ID: <qp7hmsolkax22klrnp3ybdxxn5t6kgyc2wh2hx7uiunk32dtic@t3biu6infm7w>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <0166057cbfe44847596cff9928fd652c08255626.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <0166057cbfe44847596cff9928fd652c08255626.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DUZPR01CA0337.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::10) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|CYYPR11MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: f09c7378-fd05-4644-edca-08ded946f4d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|23010399003|376014|366016|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: yZU1p6xxANeiOVhMX0xl76i+XjmV+zf6dm0LcoMmfY4j+L+2Bz4XqJH0u3FeIIvZ8SG72gfF9hrp3GdpHE262/p5dDiOe0D5wVDMqoZMlRl4FsxuiPz3DMWg9B5fhWMwjw6Ias+c97nVA10MmFcH4LWmjge2qhppjpN/61JRVzQ977WLFjLeKSOJCiF4uuiOrkSPHYMrj7BOMVYXnXNDtLK1NdsyhfqjNeKbjisR8NX5dpl2iNuSn/JNohE4kCfaFpzUl65O/Qar24m+OUzgwalHONtFKWPDneJYpRoNu2m3YuY2XlFmzlp9n2CwMoYjRSPhNKpp0EYyd1jTRglcz+by8McBoY6fEesZe9Bl6ojqFO66dAUF4iXEIq0FipJ2x8ytEJfJdaYGlt2VAw6gUeWXBWJcJ15vYQZO8pMh+YhE5BA7zqpYqIBcnGTS1QAAEXXNaBLq6mmm8MbBh5Aym/t0aeeSQO/yPqwcbApI2ieOpHClULd8pXtMFoan6zxbtd6ONdB0jsY/g1GHayxQO08N2mIgVzaquZop5Tdr3b9QvhMeFf03glnjtTjsMYK4YeFCebKXkmquojLzrgMRHSCXrgjzQ2YvuF1jyuxpVjoenO6b5IBazw6ZEJlA9P4ejkNpG7oT7wuc6Vp7DT2BGLbP5hs/IJrXc9g2RVBxQqw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUdiaWxhVStjbERpeWJjWjBiYy9BZWVnN0dyeTJiRVRJM1FXNnljT2RQNks0?=
 =?utf-8?B?dWNkOGt2ZjBLZnNTK0xDTzRhWUE5anBxaVRxS2xGcCtUTUlKR25MWEVtWEJh?=
 =?utf-8?B?ekJzVWx3MXNmZ1lNbXFOVkF1T2xKQzBTdnNYS3pDUGlIOVN3OVZ2bFpIRFpO?=
 =?utf-8?B?YWVjZkpxcVRBRXFoMnJiYmpEbW9FS0hXdm91UU9zT0tjM3owZ3hoQXM5SjJ4?=
 =?utf-8?B?NkIzTk14VldzbmpSbE90bzFYOUVBQUc4SkV6NTFjejZUSkhEbDhqbjhIVSt1?=
 =?utf-8?B?VmEzbUEya1NGUDVtRVFhTDNrUXVDRHlOKzdiblJyWDMyL2RTdm4rdndyUHNt?=
 =?utf-8?B?Mms4ZnRMN3BoSHJoM0hST2NjT3F5OHUyUHM0eU5PODR3SG01NXprclZEemov?=
 =?utf-8?B?eWw2QzJLaElxTlhpU2RlalFCY1EybmNYbmpuU0NTZmJXWkxTWU5nWVo1STRU?=
 =?utf-8?B?ZlVic1RVZDgwdG5wZ1VlTTBWdGMxM20vL2pUSzN3WEJTT2txVXE3UVpvR1VS?=
 =?utf-8?B?Znl4SytUSU9qamwwT0FucmlJczlNSnpTcGorU3JBbWUyU2VEd3IvbDl4cldq?=
 =?utf-8?B?OGtTYmlkVDA1MjRyUnFKY05teG43NFFNMVZSVzFSdllWaGVEc0F2VGRvYmI0?=
 =?utf-8?B?enpzSWF5OTM1eGRnc3c0RXp0bEJTYWp6NlF0dkNqTkIyOWg2U0c3V0I0SktO?=
 =?utf-8?B?YncveG53NEJtNGVHR2pUdTZkQ0RpV1ZER1FQRWVySGQwRG9USHZjaFlWWTlw?=
 =?utf-8?B?QWdWZVoxWGlZTzBpeHc4ZE1oY3FBQy8zWExJSDRYdFF0UHRvdHZyZGVVUXps?=
 =?utf-8?B?RnRFbzVNUG1yWDkrU3BqNDE4bVZOYWgzZU94L09CQ2J3YnlsRVdkcFpZKzBT?=
 =?utf-8?B?VVVZdDR4Vnk1RHNmQmdKZFRyWWdIbkliUjdSOFF4R1UzOUNnVUFhcEIvZkFS?=
 =?utf-8?B?UVFoNEJUaUh2dCtobWh0MjZnUjFSekhSQ09Zc0xVYzdFSUgxM1h5Sm5OYm9F?=
 =?utf-8?B?ell3cmxrSzJqSmlmZkxMN091WGhHQ1lFaXJ5Zk90L01pSlJKNUx6L1g2OFg1?=
 =?utf-8?B?UVQ1TmlQbkNVR2l3bC96bnhPY2lTdm4rTDhhYkcrWGprUHFGeUZlQmN0dm01?=
 =?utf-8?B?Ti8yUTQ0MTJGMVpmamlTOWFJY2ZIWnAyS2lPaEF4RWlKNkEvQTl0Wjl1YzlE?=
 =?utf-8?B?Y3RNQS9vZ3RVMmY0K0xuRnk4WjN0Q1hmd2lZeWhVNE10Rk5mRlNSSmIxWUFw?=
 =?utf-8?B?K0NRVVYwQm5ScU1VV0FrMUE1YnBwWlgwQ3dBNFRiQ0xxaEp2U0hPTVo4dmQ1?=
 =?utf-8?B?Wk5qWVNpWFBJWXR5RXBERWcycDRIVnlLb1I0V2xUSzUydkZpNHQ3YndwaStk?=
 =?utf-8?B?QW9hQVZOVXBmUWFBdFJtMnQyOUxzeVQvdnFnT0JOZS9idzNacHJtVEN4dHR3?=
 =?utf-8?B?QVkrQUs3UGwyS3ZsaTF2QUJEM2gzNiszTVdjWGZTbnl4eURGRlhiVm81eGlC?=
 =?utf-8?B?TjdudjVmWmUwRWM2L3M2UzhVMTkrRGYvT2E0ZEpBdmNJZStiSVN1S3pXZWlq?=
 =?utf-8?B?UmQ0aXRRbHhoaUdpWk9uQi9SamtCSjUwMGdoZ1lxbjZXNDZMTS8waXJwRWpW?=
 =?utf-8?B?MkFNMXh4ZitROFVUNUhaNnVwWTR0RDZhTExjcllaclhVTDNMQW81Q21VTmQv?=
 =?utf-8?B?U0cySGhQMjVodjJWUXgweE8zNUc0UU5PRC9hU1pMcGgwZlVEa3pTenZvV2JG?=
 =?utf-8?B?KzJVNGc4MVJ3WEZHM3I1eHg3R1pFYmlqc25zZEsya1hMams4Zy9jY0xXTFlC?=
 =?utf-8?B?WStTL0p1bERSVmZzTm5NR2xYak4xV2VEeVdWcjMvNy8wVVBrZS9JbWR1Ni94?=
 =?utf-8?B?WjA3U0taRHBKeWtvMzFFR24vT3ZSQjIyUjB2V1I1QVJvaE5nU2ZSSWNiRjYr?=
 =?utf-8?B?U1V5YXBlSWpobG9qdkFFNkJJVFhHNHE1U3lMYy9qb2JXQ1M0LzN3bFM0eWVo?=
 =?utf-8?B?YjE2cGF2ZVNxRVlxRVllcWpMUitESTF5MmpFNHY1MnptT1M2eW51R1JjN3Rp?=
 =?utf-8?B?cllwRWJOQ0UrYlpXYkZvSTJVWHQybUxNNmNpQ0h1bnFSQ0NadTY4VFp4eTR2?=
 =?utf-8?B?ZE1TWnZvbVhwbkYvQ052SHZiOFlUTWYwYkpRbC9uUU12MEd3VFNnWlVCWi9W?=
 =?utf-8?B?NzR1OXRwbi9nbzcwTEJOUFA2MFBrdlRsY0diSTlrTkVVbldobyt0Tll4T3o0?=
 =?utf-8?B?NzV5ZFNaZ3Z2Y2svZVAwd0sxWnk3UkpLZm00dFNhN0NjNGo2dkhvcHpPZm9r?=
 =?utf-8?B?Q2w1S0FHaW84RWJBcklJeC80TjRXc1Y3czdBVkJXT3NyWjZYSGdPUlhNYVFR?=
 =?utf-8?Q?SdH4D+qD9ECu3zbHlbElDXZr6f2oX5uFT5UV8moSuLbYe?=
X-MS-Exchange-AntiSpam-MessageData-1: tZWBfcCd2W2AFNKjm6LWgiLoKpAj7+ACqWs=
X-Exchange-RoutingPolicyChecked: AlIWQQqSGkVUwzJLIxzyfYBpp1xzqEUKBBWCiGOmuwO3LqIpWYQjlgON7s+/5URO85Bx5mtdZ79fHx2TbbUpLZerZI1Q/Jt9SMOTtSpHVuFKid+VauPkg3EaIz/Z4ledAl2UDvlUVA5lOWzsmR3ToxRvJd5rVUQhYsL2RH3c4TolFvh/NRGjneEWrngiYj7pe4SaLEGcLrTdO4CMAbj3Ss3Ujz2TwZ/DIIMSNM3aRRrvOtUBhWTv2L320VDtJE+smISI82TEd5yAmiNbVgGw3o0Rl/kunUYuxjgVNxqSxw9IcuMERjmyFYRuAtEKNtfjNocvAX2CZjOxcqhaH0f9UQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f09c7378-fd05-4644-edca-08ded946f4d1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 21:06:31.2669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7F+tlymtAMNG2kuuliSVZJpBCTnZWDvlFo5orVC4baP4KQ9PSLV7V1ORFez9gnA4gzB2+8b5lNLuiNkM4GM7t0eVAMA1dVvIijVJBq9XOWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8307
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

On 2026-07-03 at 16:28:56 GMT, Sebastian Brzezinka wrote:
> intel_audio_dump only needs the register/MMIO helper subset, not the
> full libigt.so stack.
> 
> Switch to linking against lib_igt_reg_tools.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   5  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 2e8ceea36..f9bbb41a9 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -14,7 +14,6 @@ endforeach
>  tools_progs = [
>  	'igt_facts',
>  	'igt_power',
> -	'intel_audio_dump',
>  	'intel_bios_dumper',
>  	'intel_display_bandwidth',
>  	'intel_display_crc',
> @@ -104,6 +103,11 @@ executable('intel_gpu_time', 'intel_gpu_time.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_audio_dump', 'intel_audio_dump.c',
> +	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 
