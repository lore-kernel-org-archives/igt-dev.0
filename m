Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8FDC25B10
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 17:22:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262A010E8A9;
	Mon, 13 May 2024 17:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ncbYzp0+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8671D10E8A9
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 17:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715620942; x=1747156942;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ky+OgYKG3f0pXsQFf1702rohtbKMgt9Pa/7GOHJux+c=;
 b=ncbYzp0+PDLAOmYT0yTTYRWd5vOUhSMEIlZyYacGlGYHPUtUuqMLbLyo
 hikGJU91UGKsmR0+OJ7mfAiEvX4GclL2TJ+qfaaHUEzlRDmEXkyfmm25O
 leyWlmJ4ASf80DWWYB3O+ZF2UYjIt+sOqFIaovpx3IYJiZwV6ZU5mHZ9M
 LWKkiuaMF/wP3aFYja21ihxvT306Ckjw/YPMqEWNOyM0rDGHbmkZ2y01B
 u+hEszLRkAV2i1fCxk4N/AvoGIjN3uoowNoPZqhheNjjwUX5c5hAcm0Wj
 eM4jf49SAVDHIrbxcPU+5Qftj0/+t7VYh4rKtQ7LOQx6H+9+O+S4MRNhX w==;
X-CSE-ConnectionGUID: 6TwdhkRpQCO0XuJvc92O9g==
X-CSE-MsgGUID: nXOTlT2lRhKn/qlEY0pvhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11400900"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11400900"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 10:22:22 -0700
X-CSE-ConnectionGUID: ByiPAaB2T1Say+TiWOjbqA==
X-CSE-MsgGUID: /Pj4YGK7SkOkjzHNyi5w+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30444432"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 10:22:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 10:22:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 10:22:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 10:22:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfxzOfw6Fb+hXN4xG48jbI3545MXGGYPUkrm+SLz6WdSKr2d0/QQNr+JUeQ/4JwAhr4bab1ncdT2ksAap+QjB/zqz4y140s1Ifh1Y1nXGnUagUo0GeVVxqMWeif7JSX1Fz96Y837zAxI8vI4I5TuuerqZqZ/lTZM4P7KBdDz6ejOyXqZbKolU3+DRxzHn/y0+3RYEU19+jUHVD8A2AZ/2YI1iaM6tltD1XEJCnlUmKWQW4WzZXZn7XYZsSGnnY31m4AlvNceVwwhtFBAqaeWz4f9uJ/yrUxgxQpCW65R3UCR8fjVyrc5RgP6sgLWBBs9nNwz7xlcz7hG7hwih3D1ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLeE8SGH4jdQYSDf6kPwxF+CJtIQs3qdKBoxlLU9DKU=;
 b=ThrC0yd95GdpmKthbdIq33ICi8gyGf5qDSVGgPgz3KCl5Q797voAAL0QxqpOrd5qg6nRzvJuxcROLUQ7l3MnyxkX7WkcjR2fCwCOX5ePI4AkKn9BQvZKVp5jKoO2jqgZ0EY7k53VsjaaKMSGY94ZQBvWuSqm6AlKVEb8QgdDR+QQLNIwSGwN+P+cpoje7S2bvvuRgjr/TzGHFGZ6RpyI6v0C+TbAGwsn6xlV04Vn06UyPyiHvm+u4vZdgI+dkndKR8UNh3UEW8/UsHLwoQ/gcqjOwMzb8QjOFzvBX1T9Ng4oP0vGCEcNIrE//rpy7mJsGAHu7AyGSIJGEqYC4g8yAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB6842.namprd11.prod.outlook.com (2603:10b6:930:61::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 17:22:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 17:22:12 +0000
Date: Mon, 13 May 2024 13:22:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Janga Rahul Kumar
 <janga.rahul.kumar@intel.com>, Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH i-g-t 2/3] tests/intel/xe_pm: Move mocs documentation to
 the right place
Message-ID: <ZkJMPx7P6qZVEInt@intel.com>
References: <20240513162435.952578-1-lucas.demarchi@intel.com>
 <20240513162435.952578-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240513162435.952578-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0043.namprd03.prod.outlook.com
 (2603:10b6:303:8e::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB6842:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cbe0893-2242-44f0-60ad-08dc737139f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?buVtrMWqZYgrcAMw9LBXb56Ild82xtPMj4J+bFPTh/n62uBnOREXPokM9+/j?=
 =?us-ascii?Q?WJVMtPmLHpIR9yPXL6JUIA7eH3xwb1oSLBPyKe6Uh6GJ5NcqsbwGtLhm8eC6?=
 =?us-ascii?Q?LE0QoNajJk0WG2HGyBClzVgjCsYPnwXoC7+qGGz//KWLy8iHMLxhYTqLhJRC?=
 =?us-ascii?Q?tbqmOicmWC6aX78tzKnLxrl0t1pxvQInDcy+ebm24ZOSmBlyjgB2JMkLXp4a?=
 =?us-ascii?Q?89vaQRVt05Zty4Kdoc6C2SHqs4u8sweK+AK/TyK7os+E+WxLOxV7dYs6kMNP?=
 =?us-ascii?Q?CHN9c08pNuTfFBW9sCw29aPWKQNEY+lecnLARWLIcQn9HPK+1KCzlm1Ej6PU?=
 =?us-ascii?Q?Vve1kMo0ySgwNZznCgW0EobTaj2G2ey3LlsRt2Bpc/PeyqDdKnivb1XaBSbi?=
 =?us-ascii?Q?WQPP0F0OIzJRQrCxBtSytVokPounUwHMWa5gEFOi9F5/d5aTzLZrS4Y99TUB?=
 =?us-ascii?Q?TQHyChqp/tO/YVWMz8ncdTTu9Y7MV5FcgjIsjNmxRQcYlqSj33giw3hRWbKp?=
 =?us-ascii?Q?hgLutqh+Y3TKn2DcY08zEJ1Dk/5yujTJJ6Qwr6492y72wT7qaX8ar7qz25A5?=
 =?us-ascii?Q?Ygi3aWeUngYg0+8440oaU0JYQnkQg0+hxBaImTqjt+Vtt29zyFEjTiDiU2Mx?=
 =?us-ascii?Q?Ul0FLm9Ov/eS/0ucGDqrvDXGI7JAi8mp2gE94g2NbiujwY16DrWch/JDDxsR?=
 =?us-ascii?Q?s8pp+nqo8gUBPbaOTpBTocq0aYSmrDUHZtCpSwijNM9ssOHEK5/bX+Eqvxhx?=
 =?us-ascii?Q?Wx6j5vL3nRd9eUa7fwM4pA+3Pwtz6/6FCSQh/8lI4sPtyPpGC7NyZTdEVyyM?=
 =?us-ascii?Q?/mWsUh/0XlC2l8NlhHKbpK3ZPTtNQ5BVkR+xQgQ5LRTRtXlE/nnGzzorqx7j?=
 =?us-ascii?Q?C/aBFOIuMVlihid8znYwNI/ywyV50JTotXTkGUvwz2wtlsuMrAxLN6rzr+sf?=
 =?us-ascii?Q?/YoXTOOMVohCqyN8rBWBhL8utLghK2U9fN5oAR7rZ1/57pRbnLgsrBEHHUTO?=
 =?us-ascii?Q?WLf0vyBOdDI9u1M2vIuoBi2n0SRQnydisBm3PGBimG6Z6tk1MMIi2QXNOrdM?=
 =?us-ascii?Q?nOAqHrHmPUC2nx/MmaKeIs7qqqesEO6sBTfQPM5s2/OwZ6QkULJ0hrF5tVyt?=
 =?us-ascii?Q?SPeLglM3IdnxNhNOi9jWpOS+hLIOWuofmpQhgwoZSP7lyDElZ88zUNEjxorb?=
 =?us-ascii?Q?HKvbqcMAEdohJU6UHVeij3Vdc1t4sZHCDl7V5XHiw/1TJ+LFCXE1+BIT5Coj?=
 =?us-ascii?Q?QGwLhC4+jfqAWkTGJq7rfN79z/io1rx3IF0TCqKA/Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9GlXRaT80Vdg14UFwAPyjvbrP3nldtCLPZ5bmvcoR72ovXBBk4tyZAV3r0wY?=
 =?us-ascii?Q?dSqVEVcRVArOTWKrhlYFal9MzK/3tR2T7ldas+lUK7T63fTmPArXjQ1aa+A5?=
 =?us-ascii?Q?8iGv1kMx2KGJkociwXSSDGrE5rp1IOV067UbtPaRv/2lnUXFA7qGCaduaGnN?=
 =?us-ascii?Q?kLEZE8t0aP/IGsf9Jd7XfYM6iA1tEHbksUMMjmNmHPtmfwfQmht8+uROuFAj?=
 =?us-ascii?Q?o3CDhDgcRp8Ql66I0B2dps9EnFm0picnK+IEBTM6CVIMOVgXMtW0b8p0D+oX?=
 =?us-ascii?Q?Xzv3N6X6ewN7Zl4DJMSfSwZH27evqBWk33Rik9dYKdm5PlvV8mjt75O6eG3R?=
 =?us-ascii?Q?BUnPXLGrOIaJx96AkkfJl+ebQYt1/MnTkLzf3UcelnfknOjwFN2MHPmJ+twD?=
 =?us-ascii?Q?WVadh+bSGLdZ2gChFJWxLEqP3US3yzkKL+K66lzTtBf3F68f1AWKeRHV+XMG?=
 =?us-ascii?Q?fv0gvopNgw6U/2iybg0LhIxtv1rdLptaYLW1S1efwHazuawYsGjBJtVRq2bJ?=
 =?us-ascii?Q?ILM8hirn4ex2m2CmUWDuw/m4FGKDYhxdIChMURecjHsadd06IV/EHctrmsVk?=
 =?us-ascii?Q?nEL1m2lMVweB1jvYds++lvVGeHAhwq+xiYUHxSP+Y0HhBksIs4eQOVwrE9Cg?=
 =?us-ascii?Q?bX4CjLjYZ0LRjwxX53T4ZwEdbB364U01rx2QMWps1N8TxBqA5bDTSybe7yFa?=
 =?us-ascii?Q?gPy9XtZSyZ5i/Ehva8v2jBS1UQpyLvQVWdMzS9gDMSpXvJDqrQbdCkzinP30?=
 =?us-ascii?Q?iOY64E2jsZlSJQQRwuJr4gStefzUsGOVVZR/VkLLXmI+ukCDOzsauc+o5kTw?=
 =?us-ascii?Q?nxu7XW2NAyVZ673kQ2plSCDAgk4E5Kq9DwNZwNQnTeTW2ikrlYlkAnj/IUYr?=
 =?us-ascii?Q?dQKx/yVN/Mqygnr/Sm/FUpcgmwpy9qTcF5dzWz7zZLTA4tKhMIyH7stZqJwS?=
 =?us-ascii?Q?ZUDwCh2kwfbeKI3nO01HBhlCX3PiR7OFn2N0JKgyUf5JrOEtScO9Vr5dAPZR?=
 =?us-ascii?Q?d9C7sETGSbBTQWed5zoWiUhAuohxvJYeWFShRtveoDOuOTqaQutSwCPICWwi?=
 =?us-ascii?Q?bTKy4+AlN9j1jEB9+LUtQAfYYCUpddt7K1EolYGfIlkFeGvP/l16JAkmwo05?=
 =?us-ascii?Q?Xpf0PejjFo/GJZWy2317JcyT1bvumO63BiDX+Wok4y7PR0/jfmudKfFIXrD7?=
 =?us-ascii?Q?UO4jvqdglsXT3MiaTWmo2pPGJD9iEmiqVqqrhtzS//bILzFlYqD53hQlMcpC?=
 =?us-ascii?Q?seJimdf52E91jugRtMKtqE3zw5+0YnprBgFqPYOe20lT4rz8miPzL5GDghcy?=
 =?us-ascii?Q?aIKC6YYAU+yPo90HqAORTomp2o7MQjmI6HA/5V0/7Z7lDJZsM5irhuqppTVM?=
 =?us-ascii?Q?MWByH8EXRRdiEs5cHVAVA+xg2JTiIjSigZVUbbkOrY5dI6Piz0NJkV3QUkDe?=
 =?us-ascii?Q?Rnqj2OkPyXwjXJ0+Ev5JmB8iCnmX9Cu7oIDmqma9B9Jkk2DEKH/Uz8LQELJp?=
 =?us-ascii?Q?ykqG7d9xBBjZL+srlclAw/NRLjYclCcZ2Vanl2tv3ijvD9TbYu7ok4EF3h1w?=
 =?us-ascii?Q?00vR1175gxN7CAjjJU7cwrZMnarjvTWLB4F9Y9JJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cbe0893-2242-44f0-60ad-08dc737139f6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 17:22:12.3158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IsSFsOzgYq9ZqW2D/f297UAOc2/OigBGT3k7NqQqEiCwqtsyQja0gGbloY5CtXUFCh+UdgOrzN0lgxN7CIgAXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6842
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

On Mon, May 13, 2024 at 09:24:33AM -0700, Lucas De Marchi wrote:
> {s_state}-mocs is not tested by test_exec(). Move it on top of the right
> function.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  tests/intel/xe_pm.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 1215b5c2a..584cb8548 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -251,10 +251,6 @@ static void close_fw_handle(int sig)
>   * Description: suspend/autoresume on %arg[1] state and exec after RPM
>   * Functionality: pm - %arg[1]
>   *
> - * SUBTEST: %s-mocs
> - * Description: test checks for mocs state before and after %arg[1] state
> - * Functionality: pm - %arg[1]
> - *
>   * arg[1]:
>   *
>   * @s2idle:	s2idle
> @@ -624,6 +620,17 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
>   * Functionality: mocs
>   * Run type: FULL
>   */
> +/**
> + * SUBTEST: %s-mocs
> + * Description: test checks for mocs state before and after %arg[1] state
> + * Functionality: pm - %arg[1]
> + *
> + * arg[1]:
> + *
> + * @s2idle:	s2idle
> + * @s3:		s3
> + * @s4:		s4
> + */
>  static void test_mocs_suspend_resume(device_t device, int s_state)
>  {
>  	int gt;
> -- 
> 2.43.0
> 
