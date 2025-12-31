Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F610EE645E
	for <igt-dev@archiver.kernel.org>; Wed, 31 Dec 2025 19:56:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF61010E7E6;
	Wed, 31 Dec 2025 19:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZCKflubE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEBF10E7E6
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Dec 2025 19:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767210960; x=1798746960;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q4SaCFQElwA1xixipN5pmS1JCPoN4OgilsyQG2OHSGo=;
 b=ZCKflubEAfraOzaKZtO6N8fCGAdZLOS5TAs6EB4oRfPqNNgeGj4ZTxg9
 xPfYVRzbsYpv+nV+vPs9raNTJL1q5f5H3lVYXI9iBo4KfxMsbZQJgti0w
 1ENkgh3GOeDGTmyjApMm+l4tdB7xkpPhTkFWxqjv9JqTXt6wydTdYrmnw
 dRW2x+qOl3eeuggMmd6cXoSK7qDVNmZdZhsdhMRErNg2dZ0qZhJVbVgWd
 Or37BaEfPCDhH97AJdaZ28rVX51oEySIq7nXLivyTDgbUHnB3L87rSBBs
 hQUcvqbfg4J1eJj2umt3EQ5OMLJ4Ss8Nqvl8/3XtJGEpR+2smsixyUD4y w==;
X-CSE-ConnectionGUID: BlOL+dDiRwWRqlvAVhWpgA==
X-CSE-MsgGUID: GUJKONNzQ0WtFn4tqmSMbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68523269"
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; d="scan'208";a="68523269"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 11:55:59 -0800
X-CSE-ConnectionGUID: 6HEiASrBRxuTxn3fkLdDyA==
X-CSE-MsgGUID: bEl8ForcSZ+Fe7pu6wfnVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; d="scan'208";a="201506733"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 11:56:00 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 11:55:59 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 31 Dec 2025 11:55:59 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 11:55:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwI+FBE2iSTRLlv4koDwE+kvTc4pDf4iY7oCFxWnG26Q6nW0unzcJm5cc365Yj1bQOzk+7iwEMPu7rI2ELSNccaPrl87w+wATQJmvgFtaNMSrkm0KjY2mdA5Z67+fIGtm2HLgOlZaw6ZhUXnWJewCDLAlSEG2lCNCVKTqsoq9dtYXeuY/VPE3HfhUIkqeHbU+97TdIP28ckg5WvGk6xKds2Vi8vBsVr5ILKQ/WVFCgEbH88nBYb0HN54DdfbqL3KQjjMWp50IgjfVzPG8IrGoWG7OG7IoqFEazSIdrc53pang28A4w8XmiBLyzon2qo3Rgnymh4l4M2HyBE6qqKBVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qjsdl16253Ty0DGDcr2lfg3/m9btkbcnwy93PBiV1sc=;
 b=ntB6H9Fik9cyqaY5dxx0UMaUzhnYbM/kezTnl24dp3AA1TU7dSgiyHo+Axj3qZ2DAMiJvb5dgouaajbxOlaxHFoBwUw3ixYPOGqJLqoCqeFnD4+L8bhgUJMyqbA+GfUcX8RFFwPZ9xCUxe3jP3iWD226uhJ6vjItN1InFe/KYRbp6LW3rC4q7b2QoVZayG87a0l3dtH160IQYtY40x4HBcZESldwjzpFfOWBAZiIHcppkN1n+LgDBGjEXbHI1jcVGQotpMIH2CSXK0cx6xO8fFUFduwxLpRYpYnERdtJyn/KPqAJLK+NUWwN4D21ZbbWmVjba5STKUMmzh+hj0kwXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH0PR11MB5125.namprd11.prod.outlook.com (2603:10b6:510:3e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 19:55:56 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9456.008; Wed, 31 Dec 2025
 19:55:55 +0000
Date: Wed, 31 Dec 2025 11:55:53 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <priyanka.dandamudi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/7] tests/intel/xe_exec_fault_mode: Add multi
 queue test support
Message-ID: <aVV_yaxXWCfYkc4r@nvishwa1-desk>
References: <20251219120154.695287-1-priyanka.dandamudi@intel.com>
 <20251219120154.695287-2-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251219120154.695287-2-priyanka.dandamudi@intel.com>
X-ClientProxiedBy: BY5PR13CA0031.namprd13.prod.outlook.com
 (2603:10b6:a03:180::44) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH0PR11MB5125:EE_
X-MS-Office365-Filtering-Correlation-Id: 97320a9f-69d6-48d5-91c7-08de48a69c25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zEIH+ONVycFvAgpQqV+4rxucCaaM6+ga66j9UrKfYhy4bTbnbwbG3PQGVu4s?=
 =?us-ascii?Q?MZeCXGGJR0rQfW9ozSZE8O4MPlwlxRbPRBMy7tHFY/VqktaqqUS1qxX8giN4?=
 =?us-ascii?Q?CsaQNaH4nuyoQ7tw8fEoqJyh4cnjvnjL6bDesGQFmc8sZbTlLinLVN5pH3Oi?=
 =?us-ascii?Q?3xs+/xA9iCOCw4KdGiZCCJdvXdVgAwRpYH4tsnMMEvP8L9ogE0pvz7+3m4Rd?=
 =?us-ascii?Q?iBcfJ8DwVSPgGOjHW0O5lYhM0vkr0gQ/SrRx72zCkWKaOQfVHTY2QdIYczkh?=
 =?us-ascii?Q?0JRxZajuEdF1xd9VkuiGgoyoSZT2eYNRDBOxrHKbN9t84p/SpS4wcM545BeP?=
 =?us-ascii?Q?RmeF7rOkjfbfYwUhXTG0cfJ6GE70HigpHFMtxhmU0OB+UhioK/xnzoQgfAzD?=
 =?us-ascii?Q?KLpjt4m/iTp5LSOQALXZPbwfGVz6RmwzfKuRRXnLx+cOIv/bZ+7Odq0qyHYT?=
 =?us-ascii?Q?ulb56D9k7BgeBp2If/yz7563eE2rjI+hllfR9KOm4pAC0YH+UFCPdbC3osLA?=
 =?us-ascii?Q?+w1rvUhTs1Ysn9WO2BhXxTbgjFThfvSivzpcuXEredWNZ/fG3/qmSRyczVhT?=
 =?us-ascii?Q?mf2ogxgs1k0l7fijYAhiFfo0NO5SmiItcGAov1jwKNP7Sc63UjJSqYsmt7ye?=
 =?us-ascii?Q?Np7WY4fR7LmQLVKXVCASYBuy/RsMclesYon7jmFYAS9YnTUC9beST/6Oa7wI?=
 =?us-ascii?Q?NefJvyhvfun93lZ4LPmUS1eE7cHF7PSIj7ub+xNewfFvSZhySAQb2hVK93d/?=
 =?us-ascii?Q?lliAco7KgS2QVxwtwPveVj96yKQEtG+ejogjF+ahy5THTXVLlCA8XkP+BX+f?=
 =?us-ascii?Q?431V6YQIdZGrm7cmYrGsxRmcozPBTigmyN6MYZDqg4CLzlYU61zPXre2uk0g?=
 =?us-ascii?Q?/AsGBWTFWyUOTK/5wEyKZXVDCRfsms9j3rxSre0s5y28JNSh6wuWgGIht9eq?=
 =?us-ascii?Q?eVzYwvaUrCowGVe13CBKOAMp6lqzv1RNg0WZm3/hQ+O515FavZw962ZRqVYw?=
 =?us-ascii?Q?JDGlYo/Mk/uBQJY9TVlUX0sZ00vReAA04KrMWVWZzTsBHSboRNRnphIV2mDl?=
 =?us-ascii?Q?f1UUZHvPQHLBNoWndlxyGpoeG37GZU91iySeHYRnXeaIMkgaljZ2V8o4+a69?=
 =?us-ascii?Q?zhpPJtZg8iwxzuIRPZWPl5Qij2zcrZ11aqBRFJeemgZQchTjzV4oo4FgaXIC?=
 =?us-ascii?Q?IveXeAgbCuCyqaTdWx4+RpS2ujpRAfOrZkZa5vohALsiK9DCYfHnQACVzgkK?=
 =?us-ascii?Q?IXxMv36ZS/LguZqb3tbRHLmQJxT9Cq4FIkxE7I51XXpMIYtAadALFQ+S1l60?=
 =?us-ascii?Q?HcMxOOP/CBVvQsz2o5z1vCwNBrUrgPvzdoyab9S+QTHMXsGTRLI5lbaVVMzU?=
 =?us-ascii?Q?iESiTo2FoQ3IhOvSWZhLQ/YHT9xKOdBB+p5M/SOYM7vJj0NOQZEuIXEeoNo0?=
 =?us-ascii?Q?HqG9eAHntZb0DRhVwQzWyMFd8gmaSjq9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X1tt2T3UKJYNCjP4s8VqeFHOVdsBWmDkyCjKfi4GP2iSRSJJxGxtm1VaNPD/?=
 =?us-ascii?Q?jdf660zb8NsXoGxkKkO22Sgw7TL/SY+kF/4EIY5W8iWt3tbNQmoyXlPsfj6x?=
 =?us-ascii?Q?S24/ot0Pk+TMwnWDz9dS07G0kvsCeF2DzjqrFRZt0phMZyS/7qvPLlMLNLet?=
 =?us-ascii?Q?KKHZCDZ74ZJpccQz0l55bsrpf1pFXjh2CyS5dC7ESErUD/X1Nj+tQrNAIvQJ?=
 =?us-ascii?Q?r1oB2I21tB+IYdOR4VZU5WICsxrvJ7pbHt6jFN9GaQu6eHkvqhSuzV+A9iSO?=
 =?us-ascii?Q?lR2TSiqwoW5eEm22g6gLPnYVTa0FFJvRkTmc9EIii7X3FL7vwjnR/YGUGs0E?=
 =?us-ascii?Q?UJ2YeFFkLhPM8UWzOw9AWEofUZ496x/bqieqcfORdQgV9j5LBWcQgwZUb9pB?=
 =?us-ascii?Q?d/Ces88sh7z4YVBaHZV6bAcxLieHv6rHFDDfOK2INaIRYJiMpR/qxbGhyJez?=
 =?us-ascii?Q?f7mb1fN6Kg2a+GMn6z2X+C+TqPgd1RodeDslN0cikd5VGyGimsK1ArdSpgTh?=
 =?us-ascii?Q?jyiUc/ax1qmorbYQ0ddCsxsR4kcnoOJM0KIPxr69G+J9S2UdOgOgqP/tN8xW?=
 =?us-ascii?Q?2m3kb/otpw8mat1qMffixfN0VGR3vxxpmP3kyGd9erX/mgysZ1EP8DtZn4pr?=
 =?us-ascii?Q?jExVwonQhy/jlkrYXD/jL7WG1JGB/otyy/T4sc88VLZdMowyYx5648uJxwNT?=
 =?us-ascii?Q?Zxxg3z9GGxKBCy7CCz5SJ+Uy4KjuEWtlcSo5cIS6Mjx3OjuMPMldM3ue1K/R?=
 =?us-ascii?Q?zW1PypjyRiU1nOEJTjxFa/hfBC7SSOZdqRS0540ms8MqC1vuGk2+Hd8lSbo3?=
 =?us-ascii?Q?g8E5iYmhkrkBrDNbdCx1Wgkc+bnJEdpOYpaCJEJ2F46h8QMyxmT76pPQiQUN?=
 =?us-ascii?Q?DTFzklJeaYb5V7Erumk/1MCgQkg6A+JQCgUSCYhphk6mIcEYLCz7ukKoWVbo?=
 =?us-ascii?Q?5+2yZyV8b1IIKeFGo4XCHwOI04d41VXHfW7GINbDiH6dE2yyMVi9RWP+6Xze?=
 =?us-ascii?Q?AxC75s40Jc+yObRDqh8c6uBsegPQLi9NagtN75K0Ic3nlfuGXQwslFaoaO3w?=
 =?us-ascii?Q?lJDaLuRfdrOgUbjZ8kvoMS1nPsSuQQPgceDP+czTJzFsjuYWgJuEjjgOQ+Sg?=
 =?us-ascii?Q?+2Xbn0PNZHEkuYdSEFo6IAMcZe7vijPJVeqKB0UdJ9HHHeB7T0INGShgntpn?=
 =?us-ascii?Q?9Tf+ebaIuAQI7/BHSrVYY30gAQSPq+o8k1k27ijkW2Hf7uyy3gi+wK+wPMT4?=
 =?us-ascii?Q?nh2naxTqpF9m3P46OE3uwuJN4zgVKrzMHjr12gI6yaoHQttCgh+nJQ/kw2n3?=
 =?us-ascii?Q?EpIOM0aeENhY7k9T9eAobJOQQPD1frfHL741kiHaobw+yfB7YNI23H4pE8BB?=
 =?us-ascii?Q?v8vx7PRDKAWcGFqBadO3bBagavKfnyjeML8i7Fb3rLaAJbsqWBP1PPlXTtFX?=
 =?us-ascii?Q?+7BtlfV2BCBMU+NEKY+fGJ02ujo47OgripYTggaK0ja1whS9vgMkiavHA0IJ?=
 =?us-ascii?Q?qv2LYsm6qFoN3wrnqdOw/iyG4kY2jW3222qTkM52AYH+BL1V9BOvEZi7KVCI?=
 =?us-ascii?Q?K3Nl8QUuzDK7P8gLOSWw3UYl2OTd7nrf61Zbpv/NB8SCGpWnB8fneSDKy/W/?=
 =?us-ascii?Q?po+dGgKyv1PT4m77dW62qhFtYWU/lploSp/M5OJ3hMVAKw5MmdzFgqx+N1nX?=
 =?us-ascii?Q?CDWplMW2OoIqwyLGvBbK9yb7V3NobEUbSKTTR+LLOJsCxv8peqPuP3iEdVG5?=
 =?us-ascii?Q?GbOUeCfk2gZF1B3WMsHSHkS6sLtXhJH9lRlJDjS/Oe1sxWsMHNSx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97320a9f-69d6-48d5-91c7-08de48a69c25
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 19:55:55.7245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EeIrsGOcjC1bHWMdyK45Q5EAUXpUYLFYZwsmBb/hfl/W5RzbESAnP9fJod7RcNLGYdVQBmq9tgUwZt+rPfKXVnc2LqiSuSePA4TyQeon/ZGO/i8h2pHDzOwy1CabFj86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5125
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

On Fri, Dec 19, 2025 at 05:31:48PM +0530, priyanka.dandamudi@intel.com wrote:
>From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>

Remove email ids that is no longer valid.

>Extend fault mode test to cover multi queue test scenarios.
>
>Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Remove email ids that is no longer valid.

>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>---
> tests/intel/xe_exec_fault_mode.c | 140 +++++++++++++++++++++++++++----
> 1 file changed, 125 insertions(+), 15 deletions(-)
>
>diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
>index 5f42051a1..40612449f 100644
>--- a/tests/intel/xe_exec_fault_mode.c
>+++ b/tests/intel/xe_exec_fault_mode.c
>@@ -35,6 +35,7 @@
> #define INVALID_FAULT	(0x1 << 7)
> #define INVALID_VA	(0x1 << 8)
> #define ENABLE_SCRATCH  (0x1 << 9)
>+#define MULTI_QUEUE	(0x1 << 10)
>
> /**
>  * SUBTEST: invalid-va
>@@ -109,6 +110,62 @@
>  * @invalid-fault:			invalid fault
>  * @invalid-userptr-fault:		invalid userptr fault
>  */
>+/**
>+ * SUBTEST: once-%s
>+ * Mega feature: MultiQ
>+ * Sub-category: MultiQ tests
>+ * Description: Run %arg[1] fault mode test only once
>+ * Test category: functionality test

Bit confusing as 'SUBTEST: once-%s' is already present above.
So, the reason we are adding new SUBEST sections is just to
specify Multi Queue Mega feature and sub-category.

May be make it as 'SUBEST: once-multi-queue-%s' and adjust
the below naming?

Also, don't use 'MultiQ' instead use 'Multi Queue' that way
naming is more consistent.

Niranjana

>+ *
>+ * SUBTEST: twice-%s
>+ * Mega feature: MultiQ
>+ * Sub-category: MultiQ tests
>+ * Description: Run %arg[1] fault mode test twice
>+ * Test category: functionality test
>+ *
>+ * SUBTEST: many-%s
>+ * Mega feature: MultiQ
>+ * Sub-category: MultiQ tests
>+ * Description: Run %arg[1] fault mode test many times
>+ * Test category: stress test
>+ *
>+ * SUBTEST: many-execqueues-%s
>+ * Mega feature: MultiQ
>+ * Sub-category: MultiQ tests
>+ * Description: Run %arg[1] fault mode test on many exec_queues
>+ * Test category: stress test
>+ *
>+ * arg[1]:
>+ *
>+ * @multi-queue:			multi-queue
>+ * @multi-queue-userptr:		multi-queue userptr
>+ * @multi-queue-rebind:			multi-queue rebind
>+ * @multi-queue-userptr-rebind:		multi-queue userptr rebind
>+ * @multi-queue-userptr-invalidate:
>+ *					multi-queue userptr invalidate
>+ * @multi-queue-userptr-invalidate-race:
>+ *					multi-queue userptr invalidate race
>+ * @multi-queue-imm:			multi-queue imm
>+ * @multi-queue-userptr-imm:		multi-queue userptr imm
>+ * @multi-queue-rebind-imm:		multi-queue rebind imm
>+ * @multi-queue-userptr-rebind-imm:
>+ *					multi-queue userptr rebind imm
>+ * @multi-queue-userptr-invalidate-imm:
>+ *					multi-queue userptr invalidate imm
>+ * @multi-queue-userptr-invalidate-race-imm:
>+ *					multi-queue userptr invalidate race imm
>+ * @multi-queue-prefetch:		multi-queue prefetch
>+ * @multi-queue-userptr-prefetch:	multi-queue userptr prefetch
>+ * @multi-queue-rebind-prefetch:	multi-queue rebind prefetch
>+ * @multi-queue-userptr-rebind-prefetch:	multi-queue userptr rebind prefetch
>+ * @multi-queue-userptr-invalidate-prefetch:
>+ *					multi-queue userptr invalidate prefetch
>+ * @multi-queue-userptr-invalidate-race-prefetch:
>+ *					multi-queue userptr invalidate race prefetch
>+ * @multi-queue-invalid-fault:		multi-queue invalid fault
>+ * @multi-queue-invalid-userptr-fault:  multi-queue invalid userptr fault
>+ */
>+
>
> static void
> test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>@@ -188,7 +245,19 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> 	memset(exec_sync, 0, sync_size);
>
> 	for (i = 0; i < n_exec_queues; i++) {
>-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>+		if (flags & MULTI_QUEUE) {
>+			struct drm_xe_ext_set_property multi_queue = {
>+				.base.next_extension = 0,
>+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>+			};
>+			uint64_t ext = to_user_pointer(&multi_queue);
>+
>+			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
>+		} else
>+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>+
> 		if (flags & BIND_EXEC_QUEUE)
> 			bind_exec_queues[i] =
> 				xe_bind_exec_queue_create(fd, vm, 0);
>@@ -398,6 +467,21 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> 		close(map_fd);
> }
>
>+static void
>+test_exec_main(int fd, int n_exec_queues, int n_execs, unsigned int flags)
>+{
>+	struct drm_xe_engine_class_instance *hwe;
>+
>+	if (flags & MULTI_QUEUE) {
>+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			test_exec(fd, hwe, n_exec_queues, n_execs, flags);
>+	} else {
>+		xe_for_each_engine(fd, hwe)
>+			test_exec(fd, hwe, n_exec_queues, n_execs, flags);
>+	}
>+}
>+
> int igt_main()
> {
> 	struct drm_xe_engine_class_instance *hwe;
>@@ -420,6 +504,15 @@ int igt_main()
> 			INVALIDATE },
> 		{ "bindexecqueue-userptr-invalidate-race", BIND_EXEC_QUEUE | USERPTR |
> 			INVALIDATE | RACE },
>+		{ "multi-queue", MULTI_QUEUE },
>+		{ "multi-queue-userptr", MULTI_QUEUE | USERPTR },
>+		{ "multi-queue-rebind",  MULTI_QUEUE | REBIND },
>+		{ "multi-queue-userptr-rebind", MULTI_QUEUE | USERPTR | REBIND },
>+		{ "multi-queue-userptr-invalidate", MULTI_QUEUE | USERPTR |
>+			INVALIDATE },
>+		{ "multi-queue-userptr-invalidate-race", MULTI_QUEUE | USERPTR |
>+			INVALIDATE | RACE },
>+
> 		{ "basic-imm", IMMEDIATE },
> 		{ "userptr-imm", IMMEDIATE | USERPTR },
> 		{ "rebind-imm", IMMEDIATE | REBIND },
>@@ -436,6 +529,15 @@ int igt_main()
> 			USERPTR | INVALIDATE },
> 		{ "bindexecqueue-userptr-invalidate-race-imm", IMMEDIATE |
> 			BIND_EXEC_QUEUE | USERPTR | INVALIDATE | RACE },
>+		{ "multi-queue-imm", IMMEDIATE | MULTI_QUEUE },
>+		{ "multi-queue-userptr-imm", IMMEDIATE | MULTI_QUEUE | USERPTR },
>+		{ "multi-queue-rebind-imm", IMMEDIATE | MULTI_QUEUE | REBIND },
>+		{ "multi-queue-userptr-rebind-imm", IMMEDIATE | MULTI_QUEUE |
>+			USERPTR | REBIND },
>+		{ "multi-queue-userptr-invalidate-imm", IMMEDIATE | MULTI_QUEUE |
>+			USERPTR | INVALIDATE },
>+		{ "multi-queue-userptr-invalidate-race-imm", IMMEDIATE |
>+			MULTI_QUEUE | USERPTR | INVALIDATE | RACE },
>
> 		{ "basic-prefetch", PREFETCH },
> 		{ "userptr-prefetch", PREFETCH | USERPTR },
>@@ -453,8 +555,20 @@ int igt_main()
> 			USERPTR | INVALIDATE },
> 		{ "bindexecqueue-userptr-invalidate-race-prefetch", PREFETCH |
> 			BIND_EXEC_QUEUE | USERPTR | INVALIDATE | RACE },
>+		{ "multi-queue-prefetch", PREFETCH | MULTI_QUEUE },
>+		{ "multi-queue-userptr-prefetch", PREFETCH | MULTI_QUEUE | USERPTR },
>+		{ "multi-queue-rebind-prefetch", PREFETCH | MULTI_QUEUE | REBIND },
>+		{ "multi-queue-userptr-rebind-prefetch", PREFETCH | MULTI_QUEUE |
>+			USERPTR | REBIND },
>+		{ "multi-queue-userptr-invalidate-prefetch", PREFETCH | MULTI_QUEUE |
>+			USERPTR | INVALIDATE },
>+		{ "multi-queue-userptr-invalidate-race-prefetch", PREFETCH |
>+			MULTI_QUEUE | USERPTR | INVALIDATE | RACE },
> 		{ "invalid-fault", INVALID_FAULT },
> 		{ "invalid-userptr-fault", INVALID_FAULT | USERPTR },
>+		{ "multi-queue-invalid-fault", MULTI_QUEUE | INVALID_FAULT },
>+		{ "multi-queue-invalid-userptr-fault", MULTI_QUEUE | INVALID_FAULT | USERPTR },
>+
> 		{ NULL },
> 	};
> 	int fd;
>@@ -478,26 +592,22 @@ int igt_main()
>
> 	for (const struct section *s = sections; s->name; s++) {
> 		igt_subtest_f("once-%s", s->name)
>-			xe_for_each_engine(fd, hwe)
>-				test_exec(fd, hwe, 1, 1, s->flags);
>+			test_exec_main(fd, 1, 1, s->flags);
>
> 		igt_subtest_f("twice-%s", s->name)
>-			xe_for_each_engine(fd, hwe)
>-				test_exec(fd, hwe, 1, 2, s->flags);
>+			test_exec_main(fd, 1, 2, s->flags);
>
> 		igt_subtest_f("many-%s", s->name)
>-			xe_for_each_engine(fd, hwe)
>-				test_exec(fd, hwe, 1,
>-					  s->flags & (REBIND | INVALIDATE) ?
>-					  64 : 128,
>-					  s->flags);
>+			test_exec_main(fd, 1,
>+					s->flags & (REBIND | INVALIDATE) ?
>+					64 : 128,
>+					s->flags);
>
> 		igt_subtest_f("many-execqueues-%s", s->name)
>-			xe_for_each_engine(fd, hwe)
>-				test_exec(fd, hwe, 16,
>-					  s->flags & (REBIND | INVALIDATE) ?
>-					  64 : 128,
>-					  s->flags);
>+			test_exec_main(fd, 16,
>+					s->flags & (REBIND | INVALIDATE) ?
>+					64 : 128,
>+					s->flags);
> 	}
>
> 	igt_subtest("invalid-va")
>-- 
>2.43.0
>
