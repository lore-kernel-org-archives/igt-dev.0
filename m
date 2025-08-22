Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34C9CA0EEB
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 16:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9949A10EB68;
	Fri, 22 Aug 2025 16:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IsBPAhnT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9EE10EB68
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 16:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755879894; x=1787415894;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=L381IETv1ZnmvTQQs5zyX6tGw105PjsWK6I01lB+jGY=;
 b=IsBPAhnT6uDSSc3uCGl2ZR5tvNNDSC8rzF5puweevLiRv0ExNFrlUf+C
 70zvIJpfg0+A/EQ471i8EE32/VTTRIMPRzSDLwa+v15A8mmKgmeSXp8LO
 x/fk5m2UHOaUWhlyxWF8o7yZek/F0wH2OuYF62PJ7v12AgrR9iHoAms/T
 qjpWdzPpaGN/bsWdQheiwuZqxSj9dnKyoP/zSM6MloOv4+J0MOo4zzKVd
 TCuwoqQa0d27391a7uaIxQ/FXbI3UHcHp68FSLm9VfJtKipKl28JCF4JM
 QM3eobW8PSW/b82wvtGJOrmeFYeh/scUQof63Mxefml0XVHXIfVtfSV4X Q==;
X-CSE-ConnectionGUID: JswrsxsyTo+Feeg8uS0BTA==
X-CSE-MsgGUID: fLdodSsDT8KsbtCybR3Rgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="60818718"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60818718"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 09:24:11 -0700
X-CSE-ConnectionGUID: T+Gc0IwnSJmIhoqfKWyzJQ==
X-CSE-MsgGUID: 9SNAQbhlTliqinLuq4Eilw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="172939810"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 09:24:10 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 09:24:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 09:24:09 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.42)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 09:24:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJikqW6BigvNfB/lqPI57EFeD6iapmslargSK+XgLK/0I8k5Cy60b/ZfnNvF7/kUTmDz9Of4h5WF56QYUI2jTc1vtfTVtJ2BQXqcfIRG8l1F02eadQ6gjHyndcvvOwWgZTpjRvPTyY8Rf4xqe/JCjWldnPNUM4axGx/YaqRCKjcET+1zmaxXLF+y+NmVnhT7V2ZgNn5a8ZzAJEjeQPyo4VrANdLRUuoi0Oy9sxy2pE0ymfxQPSc5X9eO/oK02SJfxqY7ajrwxsSVu8z78VYvhCO5NRY/5mgj79p1UoNb/2p8g0J+50XZnGtN6dqMvL8CxiRMPJCAint6Ek6vevQeew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXXu1/bjvoCmEd/oTCT9MS49d4lVhEubuLZU7AlImrM=;
 b=VwYgPRm6oHgfrdgRBK5piv0xHPeHlpwNyelNxfz8GY1mln2nZL+vrzEL1BuaEwyCpWvwB6N/JhCu7oaquMEQcXQaIEUDnewnmQRKQvb+a3YpayiucWvu3sF0I8Hr0y5wzZrpzWB+jIN/VbZTPlApbeyP0bkb4YuyP0plfvKyD3wqj5ahGwGhxQz9MAVs0qppk3OHqDysg7/jewJ7l2ngLBwIxlW1zl8lSAsp8g5OB4l6jZ8VBhESfWYH/Elgzdn8PIIJpeIW8E1JAnfAX3MGIZIUy9AkEgd9VedMfOT5kdRZC3Ux80kYQ29KAeXIN43DpVPOCci2SrqFq1cxktxOtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB7156.namprd11.prod.outlook.com (2603:10b6:a03:48d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 16:24:05 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Fri, 22 Aug 2025
 16:24:05 +0000
Date: Fri, 22 Aug 2025 12:24:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Martin Monroy <martin.monroy@intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_pm: Ensure we open as primary for setting
 display off
Message-ID: <aKiZofKkMflw-LXC@intel.com>
References: <20250820002104.312534-2-rodrigo.vivi@intel.com>
 <20250820163802.wsarifled2rl3bvm@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250820163802.wsarifled2rl3bvm@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: BYAPR07CA0035.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::48) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a7c5bf4-9467-486b-c719-08dde198501e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PMq3tOkEi9Go41RjR5P3G01e+lP//mYArktoqpbEiGztn8RJ0PG8A4jqXlgN?=
 =?us-ascii?Q?LsMJnEHV8B30JuprfLcRCQo69nzXWJd4KrqPY34rjozFmsyhrBdOsVO4z0JY?=
 =?us-ascii?Q?CfiDA30D1ZM/O1RYojigqt6puH9232vr+KCH82pua/1AVfZ2anwFy/schO8b?=
 =?us-ascii?Q?dAelO7tF3LmYtksZ/9/gZaFPlxKRaahS93YOIlVnBZWdu3tp7yXVr9xpuKnL?=
 =?us-ascii?Q?388q/WOD58pmDaJ0DxV6WyqROyIRr7sZAla6iHIp/Lnq59a1R27B9ULZi75S?=
 =?us-ascii?Q?1rVZJcrzz370YmxCw2SZqe5ME40M4doXdMJoAOunKedfdLQUANFCGEUjFCEp?=
 =?us-ascii?Q?yhmiXgMRvTr7p9Tm/c9gd5sv5dXKlOBH5W89HpVZeSTO5quA9NMfpvl0+rKh?=
 =?us-ascii?Q?itkHQpnhki/5zKLU+TppUEkq3bpx1TSGCpwrKyGpPQNBUSzvGgHicsNKoYmA?=
 =?us-ascii?Q?39sOWqCag0H4mSDukzZKhvSUkfp65rDywIOQL6Xji/Ac9xV+R46FvB6USG2P?=
 =?us-ascii?Q?YoaFMBh8SIwFksWCpRvNictW7Somouq71fnX8nGLJyE+QO5DtCG1J1Fnztyv?=
 =?us-ascii?Q?kbU7wkYyl0DzBlwzuuTv4SlsXG5Z8Mu0Y1v/tk8kdhpAXZyIx0bjeWPNDcx/?=
 =?us-ascii?Q?lcvtqZaGUiBH9q2qt1vw0Pj5t5y3DpgvrNOMiCmOfIB7oPep3mO+2t1t+rA/?=
 =?us-ascii?Q?I4B5sYBXcjFremL/JX7V4L8BwoZxybhD+VXVp9V6mGkAQ50TYK9klbY56BkK?=
 =?us-ascii?Q?a52DLNOu3DR+KPdSjvGeDl0pvSeSIMnCtq6ECyKCE3oh/B7UfWkhUJj3c2gl?=
 =?us-ascii?Q?3IbIkFhoMF5dh3hYT2iUmr1twV1qOgPmjDFyiGBFb9SM/c4gXdficokA+odD?=
 =?us-ascii?Q?ke2xaH3K5HUN9mTgwbHGSgNZDYTcmSiSvGXWWg3fikgpu4ZyyQhLQcs/mlEq?=
 =?us-ascii?Q?KvQ7IFXS+02zipYD1LJWYo1qtRagek9OsTtlc4TO5g05EiVIqPEz62fMuKcI?=
 =?us-ascii?Q?quP1AB0YPcN1L4cAKkyWC+jjfpRVE+WRuutE/zkxwllDHSN38rjmOyEh2IUk?=
 =?us-ascii?Q?e9au+ENIVDEE1hWNSYQxb9AHll8sDzW4TlrmeEuGiZYT/G8+a4RgSuXVz5P3?=
 =?us-ascii?Q?RohHKYcg1vL6pvbi9/nKb82dG0/PDTROnJHBYzArqPomt6g9aXX4T/suxFHl?=
 =?us-ascii?Q?Wnf+9WZ6dCYod/ctigITXaLqONepmBT2Z/NPAWAtib0P/OzbWmA21rjyQDIc?=
 =?us-ascii?Q?NAy4YLsrty1Td/btOVj+5KLM/d0vQRIyiYSobObOdm+qpj9xvm0nSODWPdgD?=
 =?us-ascii?Q?w2QjfBZXZzZRQqAcM8vetBbxfZE4B+xWM+CFRKhonnucCreYelyrxrUy/Lde?=
 =?us-ascii?Q?cAs90iWD/DgftvFmiKTRvqyvYugZfqwV0FI/Yv4lnR+DaPIxuVtjVBgS8GMf?=
 =?us-ascii?Q?Lf5GlrU1Ux8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DuKb9+CnJSxKJonL0LWzfYNm9i77oBghtr4vitgXzY5qpiabSSyAPlTspJAQ?=
 =?us-ascii?Q?Vl5YvWFWJcB7GEauuivUaDV0ViMfoRFHOxrPuYWEwNve9o/rf7phVqywdUpa?=
 =?us-ascii?Q?N0ujlfxXkkI1cfebki5OfF3kj0Z432HGZl7aY38n79gRjC45oiut66CigqrZ?=
 =?us-ascii?Q?ygr09QDpVICOBUnBZZ6UrmPkEBToFL6dtCqzqgOw6VSuNnUdBYwp9U69lwId?=
 =?us-ascii?Q?Y0u+GT9y7kcT8ts98aOPNqXPdoiGtdRd8LzGsFlu4dCadbw7nywPRjgAKHtn?=
 =?us-ascii?Q?8nzEbX57rkjDcWLf1hUzOK9/KtPvLn/Q8YdszmGXLOrnMD8t2cfiTdZ7VN1i?=
 =?us-ascii?Q?OYVUhLLJCsLPZ7CxiTARLpP5aV3NJ/mDin3YG1IoB93I/dy8oAMSPNz6V1Eo?=
 =?us-ascii?Q?PGNz2RK6X/LmlF9ygutoXslgiReYeUsFx2hMqE/hTgTcMgLFH18VuiOf6tmf?=
 =?us-ascii?Q?kTUHN0b4mFVrUQIFuZulGj2AwpOwZlEINnZ5lb7VSGZE499ry0enkpghgHIp?=
 =?us-ascii?Q?CvMqzXiqmqe1v256yK79+JlzOwalfbWU71P6bGkrQuyn+c+CyWr0xtzJFiLh?=
 =?us-ascii?Q?5e9qkmyBiPNZ/6qR7l9FudJtL0ST0oNNUphzTqLvTwaOzZYx4teYtm9UDGLL?=
 =?us-ascii?Q?IWDRFszeu4RvdAiVjlONXsrB9aT5K6Dm98qWFHusHUG+n5qTq+vjANJReOhD?=
 =?us-ascii?Q?cGyGtDCYtn+vPxfXlK60PC/+fY7t5ZqUnreQ7BNIxlgfUOKP/XtYXz8u6Rca?=
 =?us-ascii?Q?3dA6qKJ3fVPsYS/7iU/N2T4I0/BimG/3yPNJUMgsU9xeNHvV6T1GeO57+6Pc?=
 =?us-ascii?Q?1zhpnQFn0Rbf6Ec4Iok0isy5EjMCC6PP7bP25GHamhu6J49ykyYlfVfkTCJ4?=
 =?us-ascii?Q?wzD7FBKxqqGk8Un2gSQ1NwZ+2E32Ucl047Cb9yHmY5iy4LVKXL/ektH7Uy5U?=
 =?us-ascii?Q?J6BXcNDo7uh+7N5Iv6hCsWmyr67Mta4IVoPKZNfR5p6FUmC7w4rLCI2TYunK?=
 =?us-ascii?Q?z1y+PdtJuQfrdLUQ2Xi0xZse/s/iSmGE+gB2kvDOHSC5fa3UAX4nvbylRINg?=
 =?us-ascii?Q?Xymw59q36ba7mKYW61ZnwRU3qXm75awTpX9RbDaCtAX7pxa3Rec58W4QRzLK?=
 =?us-ascii?Q?78hWUWHBtvWKP7b/3gBFCbXeBNCMg2Ifde/AHzln9AWfiS3IbU8rvbC/NPa/?=
 =?us-ascii?Q?i0fxoUzcjiQpZdmkBGsdqLXWsu/Ics1ZdMKDQqj8LofYEdczIkOERqC58Qca?=
 =?us-ascii?Q?nT7O5KYheZu22AgX6RSIowrpd06bWVirr4iEIQbs0a9qLSb1H5pcigd9HL9W?=
 =?us-ascii?Q?rMDDka0qdWM9QB5Gt1ziYaT3+T+SD8cFgTF+7Aa4zR47BTBlWN247y0xyZi/?=
 =?us-ascii?Q?vyKIFqB9HlEZeHHn4csSiDdkhz+Xv4fLaDSd8FCeGQGMjTPR4vVD0fZZHEMp?=
 =?us-ascii?Q?PLKYMSfvj4vALuWhc3QGGrQ6i8rR2bsInNa4BeL/zayAIcakGIfy4qhpsrNZ?=
 =?us-ascii?Q?Z5/8m+5/m1sHcvpZnfbEXNIJvvhxPomkc8ndm6mJasPKDYIh52W9fpgg9SZy?=
 =?us-ascii?Q?N25M1i29loOohwYBwht0DszFNpZHJJMnyQJCtpMy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a7c5bf4-9467-486b-c719-08dde198501e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 16:24:05.4211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WMgGeDaVZlkHw+QZ5It4UzpFr0K3SIuGqGRcAkn6GJOxnbDmltWPFa4h2DDGax5uYZGqLu2WO+PUtZKy+X410w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7156
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

On Wed, Aug 20, 2025 at 06:38:02PM +0200, Kamil Konieczny wrote:
> Hi Rodrigo,
> On 2025-08-19 at 20:21:05 -0400, Rodrigo Vivi wrote:
> 
> please add 'intel/' after 'tests/' so it will be:
> 
> [PATCH i-g-t] tests/intel/xe_pm: Ensure we open as primary for setting display off
> 
> This could be done at merge time.

Thank you for addressing that and merging it.

> 
> > We need to ensure that no one else is using the display
> > so we can turn it off and guarantee it will drop all the
> > references.
> > 
> > Cc: Martin Monroy <martin.monroy@intel.com>
> > Cc: Karthik Poosa <karthik.poosa@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  tests/intel/xe_pm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> > index 46b441c4d..a3a26f62a 100644
> > --- a/tests/intel/xe_pm.c
> > +++ b/tests/intel/xe_pm.c
> > @@ -145,7 +145,7 @@ static void vram_d3cold_threshold_restore(int sig)
> >  {
> >  	int fd, sysfs_fd;
> >  
> > -	fd = drm_open_driver(DRIVER_XE);
> > +	fd = drm_open_driver_master(DRIVER_XE);
> 
> LGTM
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> >  	sysfs_fd = igt_sysfs_open(fd);
> >  
> >  	set_vram_d3cold_threshold(sysfs_fd, orig_threshold);
> > -- 
> > 2.50.1
> > 
