Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5874CCF9E5
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 14:25:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAF210E4BF;
	Mon, 27 Oct 2025 14:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iCz0Q+Hg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809FF10E4BB
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 14:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761575119; x=1793111119;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fi6b+0w3mLwdtkCESbIDQZlkAfpwKYMONUsqc5arQyY=;
 b=iCz0Q+Hg6QKu5azIpArlrYCfmwPYrhU66UX44HuYrPwU8/3FwcmLDZCI
 rZsrSep4xQORHwN1pdL/OKq95Au4o6OncDsDCYv8pmuynJjIoDp6b/amz
 CbHq1LRSIcHgqY3cBGMCoVI/wVMvxvmr+4u4Zz3JQ6H3pRPhALCepQvCu
 QFlzRm1fSCoVOW2ceBD20BHvEG53UYvwL4SRuqimBxk2ezwqeCJcrKI7D
 G8iKiUhfQbDRD4TBJgI/DB3K1Akw3GQFBVzp+Kw9UzV0K1HoO6LH9MiHq
 q5yk9bHJKDN0xYkjyObtizWQyWGQRqvCpaOBgkCYLE0f1YKYTcuoTU5+O A==;
X-CSE-ConnectionGUID: U9hNfJ7kSAKuvol8pAmYWQ==
X-CSE-MsgGUID: dFgEoCdsQ+KJmbXmj1qmrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67298299"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="67298299"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 07:25:19 -0700
X-CSE-ConnectionGUID: mGkqo0F0RASvhhPJeGCGDw==
X-CSE-MsgGUID: NBKd1NfNQRuihJvS13EKsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="185406207"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 07:25:19 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 07:25:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 07:25:18 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 07:25:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yrLpD++eASi8zZ/ZE1vyZRWhlbAnYtr6XUZcwu2rHzB16d8VFTHsnyuJDbgKA5n5A3xmz9Z9U58oMu0vCywTnF1Eizwm79/iM6uFs/y1A4bK6DllSrgbflaC0W0JOVgn+gpGtfUPzqRtO/KcbLYhVDIMiWdFObntu4g8KRDLFEZAGtDBwBzDny5sLTJxN6ALCChvq7KY0d4v0iPTn3f03zDgdYUhNHcb5rkXI8L0fr0ZxcdgftiFa6mpC1Gu7tsTrkXvsUgNvw3J4Izz66exCP25t5enDngaMqhanfFodpR7ECV7n0V7gQPhNl3ASb1A6tUpJVkUgPsntF522JHbUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jC8AjrClYO645cD02pjgt0++waz3aBWHuzdH3tjyf6E=;
 b=qw3ZuTodOqe0ol4bk5vZVeYZ3foKpHUImjYWC1MMJ6KEqRFBIZBZ/+1+anQV24t+jazzcgr0H+ItsZh90DXir2eZv6VvgX/ONIUhU/KsDeF53aOzS/s9TxbvJXJ1MLRk16hEHf5M49CRTT/4isefoUvtaZZ0DHr+6lljzjxx6tyWYPLaphqAab8d65Lpu9S/1qDZH6ZnBBj9ai47j5IKa3Ex/10PeICydgz1lUBD8qxYv0WTDZ7XToNGqpzll2T3EHNb5/mawMgfu0m3WHwROrry7X4ZsKXYnu7Qrl6qtRX2NqQxdIQumKWcqddiVWkyGFtgEhAypO5fnDtKLfnSFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA4PR11MB9107.namprd11.prod.outlook.com (2603:10b6:208:562::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 14:25:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 14:25:15 +0000
Date: Mon, 27 Oct 2025 09:25:12 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>, 
 Jani Nikula <jani.nikula@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>
Subject: Re: [PATCH i-g-t v1 0/2] Sync PCI ids with kernel: split BMG to
 BMG-G21 and add NVL-S
Message-ID: <3loc66jqittg2apyos7jvnn73r3p3jkcdlzua5icxlgxuncxev@fve2uvhiqyt6>
References: <20251024121517.73013-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251024121517.73013-1-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: BYAPR11CA0103.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::44) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA4PR11MB9107:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d84a426-c2d0-4d13-d7a6-08de1564a57d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Jqi0cMOSfJP8DqmIInghf9vcCzWMH1Q/taBvZPTuKmy+mh9kUBE1KvCblaAy?=
 =?us-ascii?Q?f+3wlaHHvraOD6R3+vuquN0Ghxnv3XNPpZpciARNmdXKFVJj1CoadK+vl1xV?=
 =?us-ascii?Q?sjZIyxC3G0K+tM0xhHV0TsO50KUTsGnRSPfxHWY2jeH2Yl5AJEZr1uTyIQFj?=
 =?us-ascii?Q?Q3DUeZcvIokqAAECvGDS8rwU0DbopCy8pepJSnotKg0Tvv6lC3uwQ4G4YSjB?=
 =?us-ascii?Q?HB8eo1bLItQFw7jDi4+oyOdkN/4EbYpLsaYs2Pbpqk98ux8j5RdreNni3K7e?=
 =?us-ascii?Q?gfuBqNEeFY3Stx2D+ylg8ftve6Y7ZMMlLvXiomfaz5/6c29P125jl2Z5ivg5?=
 =?us-ascii?Q?yfSITQcZCPz4GD9uxit7c3k5Uf92dQBGvcoaSP9cQZQJTM1GGMA28cDo9ljP?=
 =?us-ascii?Q?LDU+0skhKbAeAD4otO0B+zjRBsP5UW88jO5H8P4CdmbLFk01oAOnI3Unnsxk?=
 =?us-ascii?Q?99j+QbIl6YF4vVPUuLtkFnyNxeiUqqDWt0QzbX+FlV1HxDTd9rj6OmgjPDCW?=
 =?us-ascii?Q?M8cqXY9WOUE4a3lPtBO3Wr7q2P6VLFKGJnyZuo8hXTf/Gew0OX7bwONGPvkF?=
 =?us-ascii?Q?2tSL/HNe1yKUUrtmI3x+RQ/BsCeHBRC+QLZpUiWrC3LaHbr0Mqodf+zcHp1A?=
 =?us-ascii?Q?TRZJZSABZsFN4RrY5GwdyAPRc5v0Zj6v+jFv8SzK4hh6P4IJRF1F2O9goSEJ?=
 =?us-ascii?Q?8/FT5yQ71wMBLSxYmHU08LAOJ7ajSGEFJUiK2a0ZxNheMfS4qfqHEax6eKvm?=
 =?us-ascii?Q?ET//P0IJkUuRKjokbHxdq/M3mIkpXLnmLmlfsY0Sewuro9OmjdzbO8/L8o+i?=
 =?us-ascii?Q?GZcrSum06hp4kfm+eCb78KqvHsAwiljEMPKPzmFMKFAsFi3oMme9iT57/6UH?=
 =?us-ascii?Q?B08NggXxGJOXggcZDuXabSm5cSSZ+eVl9evkn2qmPwLOnELSLwYaXX3voil+?=
 =?us-ascii?Q?AgRWug3lQC7ofQPFV8X7WqUu5+XCFdhvmpLzgOucwCnjC+GNUZhfL8O5fJVH?=
 =?us-ascii?Q?cTlNMS77Pq5REx3PcPMnP2aBorMhkj6jJLYoJn+LeAbZWG7+SgKCnCFzBw+w?=
 =?us-ascii?Q?JUyAiw+PmtctDKdYeiW+1+K8RC08LBgAiHzHDvbjKkM1D8n/jGOx0Vz/9yoq?=
 =?us-ascii?Q?cAsrDtNjLz8isfU3Zgs3NtsIDGxcYu0xbpfeE+aaaOBRiKzl7JuL+hIPFzjD?=
 =?us-ascii?Q?/vYGs91U+yyXWcVdS10PuCJc7J+NUFlYC8+0JSlOOVX81Uz4mXDkTfT0WRGq?=
 =?us-ascii?Q?oXltjTHhKOVQX/C4VIEN2NBuM/x88uRe8H5jg9NHjIgcuUcBr3W6sB6Hfl5z?=
 =?us-ascii?Q?YXB65avBEP3XM7sk1FfCdALoREJOnBCGYlUyUSZdBzKlRQoLL3Dr678W4/s5?=
 =?us-ascii?Q?PpR3JafUM1fJnlDOpr0Y3C3FMYh03gbydR9v0KLNJXGmITc+enrBEtV8p9M1?=
 =?us-ascii?Q?MEiEKk/bMIXWBuElD45+GY0HeWNllGJz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R5myzZr7K9pN2G+F6ixYmem+Zi5eZxg5cMHRw9vErfZaREmnpqK3VS8Bf+UP?=
 =?us-ascii?Q?Mww6f3FKViTay1kCDNRWmgcAXKsdmYcGHMhlsogFRoNT0Bj66d/gXyCpK4YS?=
 =?us-ascii?Q?nLiUUz8rborr4A+513QmazUnmPChFpkElc6rTHsGgLupxmPuW0lSAGJChOYF?=
 =?us-ascii?Q?fjeciDk4FyFAGPx1akro/4jY/ft9rMMtb6IkGumxnExI1iR/5syFPySHnDcI?=
 =?us-ascii?Q?YkddgwIE9vz519XIb4q0+4Zr2jFT1X9lNZ+BbdPtdHKvDa8Rck/vCql8ldJi?=
 =?us-ascii?Q?SSSE0mSY/AZB+pGlxN5ef1fJqcPcb6SzxSFBOOz2nlA1IioxHlxWU7yEw9yp?=
 =?us-ascii?Q?jtF6QNPMGiZnOXNXVTJu/30sJ9R/smC6+gbB9QVYXCEvxK+NOCdpz4gFC9jZ?=
 =?us-ascii?Q?BF9aBBvsA9PNqa0hwKYJvgBYVr9raSVmVzRw2ppS4iHfcJd4PjMEM+juTW8J?=
 =?us-ascii?Q?f+lBKgo8Iul7G+We99ERFcpZcdYqsOs2rR/X2RtTekuIR1OmjvdyuLhNvID6?=
 =?us-ascii?Q?+a5g3mddMRINU5hZgtrvEjmgnzh7Z6oUFfgJ3gagpR06eusEAs8E5+P35tWJ?=
 =?us-ascii?Q?iPPuqlUewNvbYCnXq/LCmRZEfi0mBosDQt08IPu3lQrGcrbJ/bibgPAJ7J7B?=
 =?us-ascii?Q?IkZmGBFlb6+2eyPNWh5XHsZpUwC64FUTnT6MrK4qXcw+IdWpDUpiSmkOTGPb?=
 =?us-ascii?Q?KmzLdMoAeNM2tJKG04BBRDJ78jWXBr5kzcTIRKJ3uxIQ44TAsQB9rHVzwg+R?=
 =?us-ascii?Q?Jn7o9q7AZDwLNQpKLXJNu6dPdMgdhcdBzmnA8ASy3MYeylN3+cNWN2Ibz0Bk?=
 =?us-ascii?Q?2CtSPLg7CGUd/je7loPDIfm6OZf6zNN86oyGF0ZxmjFdaoL7rV6xpVQfI17A?=
 =?us-ascii?Q?Dj8gT9qRmtITISPZI/chaTKXYWReVRo9mRVfb42IuE928KrutI2HNnmY4qEZ?=
 =?us-ascii?Q?zDmUQMw5qzmCqI9Vhw6rZrsdWt2MR3pjpq6KezW/9ojfVtEOAOoYWJ47O2jF?=
 =?us-ascii?Q?279d5HsU9bUTKJO3QF1f1Yn7JJep43zsqCxdvwZ4oqcg6Ebck2oC08KdzSgM?=
 =?us-ascii?Q?eenMCp3JecC5o+BrIo8TrfrAOy5uGhO4rODKgDSWio9Yr5QVaM8jW9B0LQtK?=
 =?us-ascii?Q?ENSR7CHWaMzCjkjkuen39vLoDU9yUFn3lRyanX18N0GZiu/Txus1L9sU73xp?=
 =?us-ascii?Q?/wjLoeyT/CTkQhlJmzzBmdApzzLiIwfABV2bjUeFfeYznVFgpPAHOJtrJ+AH?=
 =?us-ascii?Q?SEQjlGNqlnMTmo1S6zZGmql0jQqNnuNKVztJfe3DgmFQ/pErc1Stvl8PBSHW?=
 =?us-ascii?Q?zotvzu/iRRNbh/U5cCFmEHS9bDJPgu3WhH+hWSo95uj0HBsiem5QQ/OoCGLl?=
 =?us-ascii?Q?xqenwkanZ2xeogtNWkhVArP0Or6Ob92K1Wvw0uAmpMGCwWTSS4NbZvlDqVtU?=
 =?us-ascii?Q?EbZn1izsg1aM6PqhJNY2QvwmB6RZjAGOnhfc6/I6pKXnuA/s6L+Uc+0xLlDW?=
 =?us-ascii?Q?0/0SGIrFajvB+L3G1QYh7Ulfyfj4drbLsnpIbCD4PBuOKXyDEub82JRw0bb+?=
 =?us-ascii?Q?7a4NkuQ9+47YYfDjXQWi5a1oxh8dPGo5WynlLfvDLG6lss/I6EL3PATyjgFJ?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d84a426-c2d0-4d13-d7a6-08de1564a57d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 14:25:15.3873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQUQd4hXXyRkwu/IX/kZadUKCnu1DdUOAlVv3QVn2nuJihXzt0shxr5RuGTtW2miJwE/09xlRDxrNim5pSXlZMJi8zcxUNi1DKGWjJ85fKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9107
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

On Fri, Oct 24, 2025 at 02:15:15PM +0200, Kamil Konieczny wrote:
>This syncs Intel GPU PCI ids with drm-next kernel commits
>
>edb660ad79ff ("drm/intel/pciids: Add match on vendor/id only")
>78de8f876683 ("drm/xe: Handle Wa_22010954014 and Wa_14022085890 as device workarounds")
>c002b1764e7b ("drm/xe/nvl: Define NVL-S platform")
>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Cc: Jani Nikula <jani.nikula@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
>
>Kamil Konieczny (2):
>  lib/pciids: Split out BMG-G21
>  lib/pciids: Add NovaLake NVL-S PCI ids

any adavantage on splitting the sync? I'd rather just have one and
already go with the tip of drm-xe-next, which also contains the PCI ID
for Crescent Island that we are also upstreaming:
5e0de2dfbc1b ("drm/xe/cri: Add CRI platform definition")

thanks
Lucas De Marchi

>
> lib/pciids.h | 21 +++++++++++++++++++--
> 1 file changed, 19 insertions(+), 2 deletions(-)
>
>-- 
>2.51.1
>
