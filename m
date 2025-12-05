Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC91D2CDF2
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 01:58:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBEB10E9F3;
	Fri,  5 Dec 2025 01:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/3/jb+n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0BA10E9F3
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 01:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764899914; x=1796435914;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NNwC3FyDHGvjVl5gYk1E4ZYNBgB+lqYYmLjsgsC0h28=;
 b=H/3/jb+nQu1cnu2zw8lO2FGN9/t2OFOsf3i1K/dAOCNN9zVl6TM24HsW
 LL3ehqxTfhza4tDFYS+28nAv2P+IZokdfAmrVGqBTDmooquZD5LPiRrbi
 CIBVcAlRK7S7FrkoySccajSK3GDp52InUqRdKS3eKTTW5yu2uUgflQuSo
 UEEqrVSmeXD60qnVUzIzZol85ZH3SC1lgdlKC4LLPQ28DUZZXKAtVWtAF
 JlLKN60I69s0RNaVmT1LxJXNnJZ36Jm3m2aXaPoOWX7jp/La0he4wP7H8
 wqSqSPVT/7GHnaICeMbEHnxVeYlx0s/LBNGKJT14RRgNAxSOm81GWblvb A==;
X-CSE-ConnectionGUID: 2hGKlWOETtW/smObu7dlxg==
X-CSE-MsgGUID: mkOh1puIT1ODrghKf+SQdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66969424"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="66969424"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 17:58:33 -0800
X-CSE-ConnectionGUID: VZubwiHlQlmMQiWxUama9g==
X-CSE-MsgGUID: fMqzKXrhTLSNE5tmBrXDCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="199583744"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 17:58:33 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 17:58:32 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 17:58:32 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 17:58:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRVc8fMKcuRt8RP1XV0WNfeICVUw3Ek/sT0aUZWwNLUz43wV2p90LH9puoS/RQWRMOANIV84fpXInlnWiwiS4BomHOZ/GXqn1e/Viz27smvRSdHapi/Udz68ZS+c71dEuej5p5q2TgJvL2KyfC06u135qA3TInp3ig9EQeu/QLD4lEkZB57JvJFH9zrq1s7YN14G7zjg8eWGi1H1HrjP2wgN2s/HBdtm1PC5r7pKV3UFwJ/5i0aOGncg2fG8nlg1F1+JQwT6+NuB+5h0yFXlB3kPqt6MF+ylgaraN4+UX+ruRn2DkQBM9vWyrvC/qgOIhPRTpC3dhacVu4k2zMiGHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMLzizDjMtER8Qzk1pVidApkVdV1h+egXbubMrR9wIM=;
 b=al/1+cyUnfwkLdVrljvopZBaZzIABSPqlCDoYoRslO9jg+Q8OGKpCQy56iOVCuP4IlaNfyhhAQR/XHC/FoeWoW3c+h2r9d9BuXDRnvm1C31QbivaWaIDcAZqHguqfxvYigfPUYu86gI0tDW2enu1yIZhC720j3jFIQZZxMJBOrAusi3vd20eOeDZv9xGhfAPoN6oMLTVvUCrRiuF2FTXmnsQkLVRCtZqKdh/0JXJjrIfX5uelbiW5B00YjJu3Sy0zieDocN+MXRvcq74ZBf9e/zCpzdldjDWEYWY4xJb+Zx/JLTOl+JYY+UnpwmmCvNKQ0Giz6Ahzt89XqG6KQ4N7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DS0PR11MB8717.namprd11.prod.outlook.com (2603:10b6:8:1ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 01:58:31 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9366.012; Fri, 5 Dec 2025
 01:58:30 +0000
Date: Thu, 4 Dec 2025 17:58:27 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 09/19] lib/xe: Add exec_queue set_property ioctl support
Message-ID: <aTI8Q4YonVnFB100@nvishwa1-desk>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-30-niranjana.vishwanathapura@intel.com>
 <4793ae1b81f967de1425ebdcb06962e8dc9df651.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4793ae1b81f967de1425ebdcb06962e8dc9df651.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0332.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::7) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DS0PR11MB8717:EE_
X-MS-Office365-Filtering-Correlation-Id: 466f7e52-0b1c-4d52-7b15-08de33a1c9da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?layURE8RB5YhY/MaRLWjTzRQ8JtXI8DSZ+TABuHl04f3kvvXsbHMBfbqhq?=
 =?iso-8859-1?Q?I7wgyCzLhfFWSqoiYfmrmqrWmPr3W2oMmq/ZhUf3PMMAljtFpQFkexbr09?=
 =?iso-8859-1?Q?Yb4NY45bTi/NV/O4jHlhl8ELpxupa3yup0WJiHftVwHbkaf6mmckzICrbH?=
 =?iso-8859-1?Q?h4t5Mi6udBIZrynCVtea+oBKT4UWuABx/PnAz6ctZlHBqPq+mmS7PlnM9t?=
 =?iso-8859-1?Q?FZq+sir233bfdCQwx/y9IalrIMvAAZboHeyf7mWk4SOW+L+fTh4dkKp+X7?=
 =?iso-8859-1?Q?XcfpVucQtzwQKG7gcHvTT6+wovx63+LAAdYq2Y9UuLlyEcZctKKHxI13Su?=
 =?iso-8859-1?Q?hjVRNihWRiHGJKV0bWopqbU13WI442yvcZPw4UfYPLHr2XIrP4uSTGvD5y?=
 =?iso-8859-1?Q?kbi3IAZlgyELBpHy3iaeAEThYYTEVAhNH3+O305PBvVh9G3IxH+mImGA2F?=
 =?iso-8859-1?Q?QQVgRwpZ26nFSKeOXxE839AQY23cW1LNaBB0P19aQS1+TDoulIGDSrwh0V?=
 =?iso-8859-1?Q?RU4g0p4n/awd7sMSqUe8XusJh77laPnky95NBcP/tEt6H0RK/DbdwPxeLB?=
 =?iso-8859-1?Q?IQUGYHKKZQtHDwngXwccEsxvuJcKOK44hwswxkTbCjoIColkSLKDbhr+rU?=
 =?iso-8859-1?Q?ab6nclspkQ8xkMgDtXKlIhbw8r+5cmxDc16teQB5fRPRmcx2GAwtf9RU95?=
 =?iso-8859-1?Q?LFdylte8qb8i5su7Gp5NqgIt+2x7IWY8/oAQpEsXwwyN16sisUOIcMxk5v?=
 =?iso-8859-1?Q?3gyYd/m2pQAY/HuA9D39j+jnb+EmRn38D0DyzFiHgXkuMIg6bNvX2IJPFr?=
 =?iso-8859-1?Q?8i9FTHd/ST0bY5ee850BDcMlIIPtp2wWIVH28nfcZIXgjqHUFtMwwsPy3p?=
 =?iso-8859-1?Q?92FRjS/hijV8LT3yx/Duw+Lj8qtAp9x7j6dc0wNwzBSxeuBfC50a0uPgww?=
 =?iso-8859-1?Q?HoqI3fX/wix5J5oCSVCLB4SJJfz5WIDfdRMjke6QLdbJj7JAshsa1fXaH3?=
 =?iso-8859-1?Q?IMvDY15Vy5du2BNaUoJScNW2pTHf8Vf5QCRnMNGuMjTy7yerlNNxjZyarV?=
 =?iso-8859-1?Q?YQCs84zKUFN/vdG3GU1pL06VDTzF9dOeI/M8BCZIEfLZ05N9k0/GUrgSOR?=
 =?iso-8859-1?Q?j1WukLg7MGtwcq8rcWCSQo/ULHRGtUo4NG1VijACUt4DIekVgp17PT/1CG?=
 =?iso-8859-1?Q?ngPg13y5OF6Qr9A5y7ksc+2DT1n8MshX4thHreQtCSW9m7pyQ+ogbR+rWj?=
 =?iso-8859-1?Q?lSHMF6va317CAeZw6cmCYjfzWI72XaCrs+LKt01oI+oFi1O4/CHeAyrDsJ?=
 =?iso-8859-1?Q?hgho+hQzrL3VyoNMmTzy6zkDiI+MVTqaJxEf+NliRP8TQ7G4XCWXxaG7LA?=
 =?iso-8859-1?Q?/4e50vrrbQsMdlgrt6juLt1NJQn0RDmf9RXgOrrPZA998Luk+1YyC8b92A?=
 =?iso-8859-1?Q?Zf9eLjq8W/saaBrKQ11CsUssIvroz8Cl1HJvaUk0OUOtZbhsWuNfB1qjGd?=
 =?iso-8859-1?Q?dIicKvpogmVoBFV3e1OMtY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7Z9tcZM+U8q/PDKP44yBPnME3EH4A3pWCnre+2VkfGJH5UsfMu82IFIixs?=
 =?iso-8859-1?Q?LAeultdL9KnAkN5nkIPDqnMiSxnQYfstW9SEOrJdcQ+U4LVXD7FHxtmBdy?=
 =?iso-8859-1?Q?r5ePCqGGQvgSOX1+vudQkgngm7uuWDSyqeAuMAQg64HsrtHsEW1JJxAARR?=
 =?iso-8859-1?Q?0nd6sr8EG5OjV+vKGVko38jyx9wr2xFriDjksObYjTsedYTSkMKSJrQ7o6?=
 =?iso-8859-1?Q?IltZ4CxHnA9gR94jrXQKRDuK5ro+8k/uARRkY30ikWRhsCm5XwNaaN1Vfr?=
 =?iso-8859-1?Q?iRJHckZfD1r5WPddJnI1t+DBM4elSeUsyvhOTkqnLBiXiXk5LOkt+B6Njf?=
 =?iso-8859-1?Q?UYL5tMFcjyv7GEyKz10gVckzLel3UcX0kICX968rcfpQxnhvDksNq/5PNj?=
 =?iso-8859-1?Q?ssbXyjx1yzNteqCFXVyRVNQ4+2VnYah/mn12wLfuhNeJM36uMkRBdBgLAk?=
 =?iso-8859-1?Q?/sd8H3INgK9G34LaX52xOoMs82Fsx5UUsBtWSt+ls0C1JHUo7s+mV6mQb5?=
 =?iso-8859-1?Q?fG4hv7HAH6s+nSgnC0mlD51ngc/8LiZgBuTm0268ZuThIktsaQSMper428?=
 =?iso-8859-1?Q?6GsecdejXFCZDLxJO26amEyb7VRAWol63zvmhx+K+eWfmIdUEsbuPreFtb?=
 =?iso-8859-1?Q?+zBoIc7YxkONgzqSRmY7mTVfFQK+0A3NE/4IaO/QipU1FuakYNDyusv8rs?=
 =?iso-8859-1?Q?ir0pH7KXDJSSlxB465SzVy7xzENI8aq18+7jJvDrpoKbolud2lGVFTL6Qx?=
 =?iso-8859-1?Q?FTSBPuykO4C6GsRx0VwyNtfmnc+l/TsxciIpBtxQv0o0BGSQur5+bJs+C+?=
 =?iso-8859-1?Q?94xVtjPAI8k6VPArYsqFYP5yt90UOZajPKlT5ypSkIYNfTCo9pZPgnoDRh?=
 =?iso-8859-1?Q?6KnSP6DTrP1Kg0hOXzep44W3xw1onbLjIHRJxF8sAhvD6cFPDiK/yv/4Tg?=
 =?iso-8859-1?Q?fH0RFuFcvCEqW1WIhUhikS6jIO9Vg720bIkW/tMP13K8i9EPju8fqO9qJW?=
 =?iso-8859-1?Q?mEQZqw58/+d+vjLykZakX6O3OQt0k1xOs17lQc1Efmvusiv5IFf2HWk71I?=
 =?iso-8859-1?Q?1Z9PHUhGG3EjLny2FISIioz7QVmLGQf6WpaaY+1pJaQ/Yu1ZxOB2p+yjuo?=
 =?iso-8859-1?Q?1tS7pffpPKXh9AKT0xlj7sqNiduy9+QmgKshm1KQkswFuEGxCPpjQJg8OR?=
 =?iso-8859-1?Q?kA3U0UM4M3VMgabuL0T5diVuo+cMcXXeA2Lu5Ld5Nlz71iFpu80jNqiGG6?=
 =?iso-8859-1?Q?hU0Fhhb6/HKriKwFXg+w/D4qYgU3UCtkRkmAXo4XPPTrsNi3VZgSVmjFt5?=
 =?iso-8859-1?Q?sW2MoSXbMrII+6hevqjM3AGL76Vk/5XI40lrrux7V7wrSOZq7XmGnUCc5l?=
 =?iso-8859-1?Q?5pc1ECAvx9adNw4Arg6fAUEnkxB2aCk04YyTIbLZN2G/0mvmZb4aEF0qIF?=
 =?iso-8859-1?Q?GmOeb/BvW6zh7zKPIxpIRIO0dcgBmsGFwBl8XlGWOh5g+Wuegt9NPhJMjT?=
 =?iso-8859-1?Q?2U7fbp/ColRmHngGzwXARsHwZeBc84dA6hyrp3PV/7db7PtDzG35boH2Mc?=
 =?iso-8859-1?Q?g6wBgtIo1LXGdBRupnBFCOST1frZSg6BwSJY4i+EhFJRk5wONHnstMFm3k?=
 =?iso-8859-1?Q?fwNkTMISxsVLgADQTcxCotj7FVOpf1i3L+HQUFer10gQwCyHc2Bd3/KMQD?=
 =?iso-8859-1?Q?duJx6p7Ce+K3Cz39JNY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 466f7e52-0b1c-4d52-7b15-08de33a1c9da
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 01:58:30.4864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvMidS8FdeJNtPp2yR+/UNd9phMltzzlfh0tbj7q7G5K0VEK9iksgrJlXVb9ZiWVvXDtJqem5ZtnEzZv68/LSCXzEow9KKDSYoUiH8uw0uiGbOU8Ha9l0XYSQqyVJxYx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8717
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

On Thu, Dec 04, 2025 at 11:24:01AM -0800, Summers, Stuart wrote:
>On Thu, 2025-11-20 at 19:57 -0800, Niranjana Vishwanathapura wrote:
>> Add infrastructure to support xe_exec_queue_set_property_ioctl()
>>
>> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  lib/xe/xe_ioctl.c | 27 +++++++++++++++++++++++++++
>>  lib/xe/xe_ioctl.h |  4 ++++
>>  2 files changed, 31 insertions(+)
>>
>> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
>> index 39c4667a1..319853da0 100644
>> --- a/lib/xe/xe_ioctl.c
>> +++ b/lib/xe/xe_ioctl.c
>> @@ -503,6 +503,33 @@ uint32_t xe_exec_queue_create_class(int fd,
>> uint32_t vm, uint16_t class)
>>         return create.exec_queue_id;
>>  }
>>  
>> +int __xe_exec_queue_set_property(int fd, uint32_t exec_queue,
>> uint32_t property,
>> +                                uint64_t value)
>> +{
>> +       struct drm_xe_exec_queue_set_property xe_priority = {
>> +               .property = property,
>> +               .exec_queue_id = exec_queue,
>> +               .value  = value,
>> +       };
>> +       int err;
>> +
>> +       err = igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY,
>> &xe_priority);
>> +       if (err) {
>> +               err = -errno;
>> +               igt_assume(err);
>> +               errno = 0;
>> +               return err;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +void xe_exec_queue_set_property(int fd, uint32_t exec_queue,
>> uint32_t property,
>> +                               uint64_t value)
>> +{
>> +       igt_assert_eq(__xe_exec_queue_set_property(fd, exec_queue,
>> property, value), 0);
>> +}
>> +
>>  void xe_exec_queue_destroy(int fd, uint32_t exec_queue)
>>  {
>>         struct drm_xe_exec_queue_destroy destroy = {
>> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
>> index ae8a23a54..a7fd43c9e 100644
>> --- a/lib/xe/xe_ioctl.h
>> +++ b/lib/xe/xe_ioctl.h
>> @@ -83,6 +83,10 @@ uint32_t xe_exec_queue_create(int fd, uint32_t vm,
>>                           uint64_t ext);
>>  uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t
>> ext);
>>  uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t
>> class);
>> +int __xe_exec_queue_set_property(int fd, uint32_t exec_queue,
>> uint32_t property,
>
>I might have missed it, but why are we exposing this one? I don't see
>that we use the internal function anywhere, just the wrapper below that
>has the assert.
>

These are library routines and it looks customary to add
both of these functions (one that asserts and one that doesn't)
in the library irrespective of tests use it or not currently.
And this patch is for the library update only.

Niranjana

>Thanks,
>Stuart
>
>> +                                uint64_t value);
>> +void xe_exec_queue_set_property(int fd, uint32_t exec_queue,
>> uint32_t property,
>> +                               uint64_t value);
>>  void xe_exec_queue_destroy(int fd, uint32_t exec_queue);
>>  uint64_t xe_bo_mmap_offset(int fd, uint32_t bo);
>>  void *xe_bo_map(int fd, uint32_t bo, size_t size);
>
