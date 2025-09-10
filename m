Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D89CA0FED
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 15:03:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06FF10E941;
	Wed, 10 Sep 2025 15:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E36O8oIQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E81810E941
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 15:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757516594; x=1789052594;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q8Q6oI4KhIAcEdIrOSHk8Q8slgdKbrEKWNB61AupD7o=;
 b=E36O8oIQ66lG+vJU+g7eDq9FajEuknX5VXuXKYHuaXmk2eHVfEWEkKwr
 2JAV75YgPuz9sgysAeULpwyZSXx2GOHX6CcPjsRkkTZ+hlyWS0guO+iTs
 QQcrMwepvvk8eF2ccpAG81kq8E/hQT3U3rB5sxuz+78CrtQB8A+yzqHTn
 7xDr3PGrnF2H2ZUgoYkn5WRJxquYY0HGAbHPLPNj2Xr5Al3phsrypQyek
 HEzhasEWJEjdamNR7nEksePU+50QPPRsr0eLL8ayaWY4VRQKXnD0yumh3
 g4nAurObppQO74Qa/AbJ/fa+g5g7MI+TyuNryJeUBJQK3spAbfyr+Ddte A==;
X-CSE-ConnectionGUID: Sx6gZA/8RF6i4HIvLy8XsA==
X-CSE-MsgGUID: cLpoKP5zSiSAdLEICuo/Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59687910"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="59687910"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 08:03:13 -0700
X-CSE-ConnectionGUID: F653K6MiQf+xGdNcrItCPg==
X-CSE-MsgGUID: 2TyL3zCMQ5mFMrgOjuyO+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="204408455"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 08:03:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 08:03:12 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 08:03:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.87)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 08:03:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JzNM3pIN5coh6p797ytIthV5fVMOJgJro3QqkhYwXOu7zl/giQ9y9atRsdia9m0RjPW5lBLF9QQdvX0lnS2/LnMtDeGrKLoXE81ZGG/vZr7CS5Hdi1PnnF09eR13wNoe+jV8IgwNV3gOoBKHwNT1655ATsTdu24kPeVGSiOmGHC3AqstuzmcoycHBsji48kwsJJCn8D1SIr+Zyki+DT6/zKHMNMw04tiyArgGIIuhDmB7ElQd7OITSXKlsBKu//cA4CFMY95SWooVci8gJo1NZA7t+EH7NhkRHuIEVa+e+5ugxZQGF/IlgHj+n9ApyysIcPd3hpvybcnJoO2Xh9w3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5/wD7rdON8RukX36hAEKagY0J7JLMiIU4HZ3EozfCE=;
 b=rMIsh5FolL9qXPEMfbhm6f5vtzqHbF8x2+PCMVu8J7osZwJD3hB9lZTq3c6Z83hqqDT6cTUJlzTU3yRiU+U/sKqraGTI7YdPvXIh/mef1bOTZfg6sJ+Amjp457/Tpv/Xm9t8/kW4zO8uvFgUCewmjlCwTzX89CLlh1YSRPVMNVEV0pnJKKhFkcqQfd7lh0QauyociPNHZsSmTGoNadCKDiJrVpzYqVkA2n0v8zSTNAtHZC+QLiz8xo2J1PQNQo5TYkh3ds0/WeFJlxDS6YIP+sqwxOkG3WOusc7yGKqL58E9UISBqDJIx718gUyHZuBmjJmb+Ds9u5mzHU3nq5qCGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DS0PR11MB7483.namprd11.prod.outlook.com (2603:10b6:8:147::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 15:03:07 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 15:03:07 +0000
Date: Wed, 10 Sep 2025 17:02:58 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Daniel Charles <daniel.charles@intel.com>
Subject: Re: [PATCH] tests/intel/xe_exec_mix_modes: Fix, refactor and cleanup
Message-ID: <aMGTIkO3PuK4UJ9y@fdugast-desk>
References: <20250910123946.1144932-1-balasubramani.vivekanandan@intel.com>
 <20250910125257.vshhygh3iq3ir3rq@kamilkon-DESK.igk.intel.com>
 <aMF6g_jTDt40Zq6g@bvivekan-mob1>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aMF6g_jTDt40Zq6g@bvivekan-mob1>
Organization: Intel Corporation
X-ClientProxiedBy: WA0P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::22) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DS0PR11MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: bc23c5aa-d192-4360-5035-08ddf07b261f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?erkz3JG94HTI/ws0W8mOh5Pz2ju+sOifIP1ukqlyZwWppry6F1O20ns7DrGN?=
 =?us-ascii?Q?uk5vSGyFB0+YTCce8vbmEnFSoGo1Pkg4SVjo3oVq0X7CDg9+yhdyo6vV4TDo?=
 =?us-ascii?Q?XSalrAfqLdf1C04Lq7ENaQVuvo2WuLcdvMqR1CAJx/xvobtQ5+IYCoEX87ZL?=
 =?us-ascii?Q?5mK8KvppC5A4a1JcgnTleOdbYqan9Q8TVm+fNXgakcFiDryptxzjHiWkBw+o?=
 =?us-ascii?Q?AngK7QdtumAu23gNGGx5FE8A4CIi6q00NrmaAHjdsn4TFLNqB71tyYFnwcUo?=
 =?us-ascii?Q?m2lWkyKFNZ6zaT/Zvps5I9GF+gE//3+4Rz3lZRWTI2Ue33x6/Khx/oxQFoup?=
 =?us-ascii?Q?2dxUWANZJIVLduLbvj5YqhyUc0S1P461KgBba07O8ggf2AXU1RmVMgQPPfZh?=
 =?us-ascii?Q?Q3AvspWMO3tcJLB2nrJuXSbE/EbqGlLvdCb2lytoOuE86MgUTi5kzla7Q8Q/?=
 =?us-ascii?Q?Axg5xacTqdrY+5jQj2X578kho889d7lnNsmcg9kaW2rGgbJqGJbCleYUsk1d?=
 =?us-ascii?Q?U/myIm2R8cQvZldRqzidFE2M/KtlivSE3FxGNRw77kiwSrCKpE5fgyGpwXse?=
 =?us-ascii?Q?ubYhQZqENUCmtNm+egEbuKc1KCSy1G5hSVEYoa+JX5d5noY7sj8+stSGAcCC?=
 =?us-ascii?Q?rxVfjRQwdqgWzmEhpuVwy61Qe/A6z8HGfR2hpjiIbY7VOU0+l+2p64zioP8H?=
 =?us-ascii?Q?Cs3R3L9SzU0i/Q/D1UPoe9X0WrUEkp004fgSkaiiUukvz10H8U9RUdFY8NXI?=
 =?us-ascii?Q?GW4DDFJ9TT8igd2LAJdnvyCMaBg6Olmr3nagZFyHKf/tiWs10PWngrzKs+oH?=
 =?us-ascii?Q?iHEETr2t3caOkh96QJ+bSI6wg1hOvpLgxNAVOYvu5nRGxA8BK3eoStoGw2z9?=
 =?us-ascii?Q?MiblwZxMrW3ZCMFiD7bacXvk5LgvPoTel8JTjDRoxQB1YWKbG28svzz7vFos?=
 =?us-ascii?Q?NuQFOtzDpRxNXDmvsaeLjvzDzEM+/dHQ7ghTVVWPsM8ERiXISEXiyVz9Fegy?=
 =?us-ascii?Q?pNir7cpXux3a1gUyUtRXB7mH+seXC8J41XSHTzMppINXS79aZO3Gf2jx3Ibm?=
 =?us-ascii?Q?oxBavlcKoXSLVpFl+Tz8GCyxU3HE/mQ9QELdpM+SsvIthz/wcgZ2vGUrF/IC?=
 =?us-ascii?Q?jAoiMqU1Baz0Ca+XWRPKCcRixXU9GuSEaWf1XGv9hqHq+RuleSARD2C8QjOW?=
 =?us-ascii?Q?xD/XNuwuFlIR6+9H+31m2Q/4RRCODw/rMW5FXzlawrP9vgh9qfemirDZWTc7?=
 =?us-ascii?Q?V4YHvTqhOpBTZZqEUoktf7cTq0jUF0oSfrAI0IW49rxwkoGT755lfZOlpvek?=
 =?us-ascii?Q?VR6O+rIDfLM/miGbnyqZ3cFUULbJDPnQaQEmY3Fk9ZUTwvdvCEO3tkPcLQfg?=
 =?us-ascii?Q?Y0/yaJGVg/o+j9rNbKk0ZQ0M/CxtKtsLWUAbjEwbfn/1rTjFOpL4rbV5yamK?=
 =?us-ascii?Q?US/grAo/2KI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pUHOZ6XTpcJoo+g49p/3iSROvyd4u4RhsjZzeoloELbzgexTU7Gx4M56xUbe?=
 =?us-ascii?Q?tMMtn+A4Jk51crONXc8AENLbYaFS+huvU6Yjo2VFER4wSnFtZlhAb+dY0BP/?=
 =?us-ascii?Q?rQM7yAyWSbvfCXnlllOPKTBTNEwgoXPvYIhXqbV1kRaCoOmYRDnBKlfR9Cd9?=
 =?us-ascii?Q?hlygsZb0wlrhaEcbny23plrnA84aCkX1hwKWLVPhgLqfNSUY8sWCzUeCto/z?=
 =?us-ascii?Q?DkSD77Wcao3rAi5SMd0+OG4AFhbC2Z4cBp1XPOp3YbWeLxZZZPgfAhVuJmYE?=
 =?us-ascii?Q?6VjC3NgspqZ/yF/IgLVhXNgWUssv7KkcJuOpZhU9OBPcoyp9txmpGypj95q2?=
 =?us-ascii?Q?KL4rj8R1ldn8rndMpJ4dZeeFPkpJcJHOIL2QmAKNihrBJ9ALtkxZOcxxtXBB?=
 =?us-ascii?Q?qa29oUz5R7R2zQRz73KpzBANhYV76cwnYeoxm+Olbv10jQMws7j1HQpdhsA0?=
 =?us-ascii?Q?vIw5611hjkk5mmShhFHVoDlm9q9cSgzt8r1D99WGuTygxkH2ftwkGfo4nuxT?=
 =?us-ascii?Q?Wm5BInKwd6PP6O7kn5uLfdaq4hfkMOSGsGXiGZrcADMv2jrQhnmINvGkIXu2?=
 =?us-ascii?Q?64nwJjJYafoU3+YecBS+oqJSkuruv/LVZaMqqH/d27Jz8v8iggcNoQwH6K24?=
 =?us-ascii?Q?3oQB/8BbXTnsaXOohD+XhixN2hOwPYmp5NIWU2/ZdtZRuMhnEIPM4y59cxUM?=
 =?us-ascii?Q?5u+2jZtjMOK03MorYgKMS9+ZIR5uADah6MC9hU0IuSrRXXlhVwWZ/bYMz0e5?=
 =?us-ascii?Q?QEcw+wmtVgLP5SZ9oicoifc4k2dLiSbgz8DdQny2j44qIY0K8Jj70DdVFhuK?=
 =?us-ascii?Q?tawi3ZnMRmng1AIDXE52pKpbA5fE9kpMr++8IJdaBT2786t6vmzIKY7+jBaJ?=
 =?us-ascii?Q?fqWb7vwPpc3szQrxfPxVTxfrwfalY20/kU4OTguW3vpA/pR0QUqei2AWIgSb?=
 =?us-ascii?Q?fQ+PD12WB+2tGMbAKuspTpOwRGnx2VXD85Ocewfj800VlOMe5oMaKWiI7Z1P?=
 =?us-ascii?Q?bwWKlwEwUgxeRYUt+M6OigLgvv7yiMUIxFtSdSbN6DXWL+DC3MtAUQgIMsAa?=
 =?us-ascii?Q?VVMf3loB/g4NavWPk5wevHyuB4tvCBI6v4rLaVQlBHsGH0GiInFQMAxOQLx3?=
 =?us-ascii?Q?HlS6TyHioviga7Yr9tpa+zP/9YFwWwH+X9aE2rlSf0Q8qcDafR/O3cfxqbmV?=
 =?us-ascii?Q?y4yIa3FgyRoDCQA09zguZGEMtHgqdePpLsHa4ZdSXTYtuQwHZkjJ75RmnxM1?=
 =?us-ascii?Q?5gK+0mRfV38bUPPscij5rIGDjZBUaQDPieOsYDfAmbSyH40bkFou0eciFZ1n?=
 =?us-ascii?Q?JofZhLNBAdEH85om15EhxeDHInyW8SPFjo06NRLKNUaFi3UG6wS1p2hvvl8T?=
 =?us-ascii?Q?u+a6lTrjSue5Adu92ln34uYO1sIF2KL6sx7UTMwTtTbOedso0oyb9yzBFQmg?=
 =?us-ascii?Q?Rd6MoY+onOsf/OjggK67iN1ubd19hqxRfZ5LYPYCY0MD3s7Ch9SRnS9EgKpk?=
 =?us-ascii?Q?PM8CR2moPn9y74A0YYgIo4poFnLY7ECPLnvU80yoT7Le4jKsGPnPzncuyD2J?=
 =?us-ascii?Q?ZzXg8qxb1Xn2sWBdLR3QG1w82ctO2Fxip53uz7r71wF8C338WXKUeKBu9dcg?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc23c5aa-d192-4360-5035-08ddf07b261f
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 15:03:06.9665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jNMFoEwOokQPWUktgX736GpZJ9cM9BUnp/HPXxQv3EWB633V/pft1XLya2WbuBfB8MNwVIBTLpEaOyBajKSIM2FUKod/bFgYstZNE8AeXPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7483
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

Hi,

On Wed, Sep 10, 2025 at 06:47:55PM +0530, Vivekanandan, Balasubramani wrote:
> On 10.09.2025 14:52, Kamil Konieczny wrote:
> > Hi Balasubramani,
> > On 2025-09-10 at 18:09:46 +0530, Balasubramani Vivekanandan wrote:
> > > After the recent change of xe_exec_mix_modes, fixes were required for
> > > the following points
> > > - A local variable spin_arg was used uninitialized.
> > > - There were some variables and macros left unused.
> > > - There was an unnecessary loop.
> > > Along with these changes, also some refactoring done to simplify things.
> > 
> > Is it a revert of recent changes? If so, it would be better to make
> > it a revert + fixes, e.g. in two commits.
> 
> No, it is not a revert. It is an improvement on top of it plus a bugfix.
> 

Kamil is referring to the partial revert of commit
"tests/intel/xe_exec_mix_modes: Remove absolute duration value"

Your changes bring back absolute duration values which creates some
issues, please see that commit message.

Francois

> 
> > 
> > Please write all Cc before s-o-b:
> > 
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Cc: Daniel Charles <daniel.charles@intel.com>
> > > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > 
> > Regards,
> > Kamil
> > 
> > > ---
> > >  tests/intel/xe_exec_mix_modes.c | 101 ++++++++++++++++----------------
> > >  1 file changed, 52 insertions(+), 49 deletions(-)
> > > 
> > > diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
> > > index e65854d0d..b74247bc4 100644
> > > --- a/tests/intel/xe_exec_mix_modes.c
> > > +++ b/tests/intel/xe_exec_mix_modes.c
> > > @@ -28,7 +28,6 @@
> > >  #define FLAG_EXEC_MODE_LR	(0x1 << 0)
> > >  #define FLAG_JOB_TYPE_SIMPLE	(0x1 << 1)
> > >  
> > > -#define NUM_INTERRUPTING_JOBS	1
> > >  #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> > >  #define VM_DATA			0
> > >  #define SPIN_DATA		1
> > > @@ -96,9 +95,12 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
> > >  	uint32_t bo = 0;
> > >  	unsigned int vm_flags = 0;
> > >  	struct xe_spin_opts spin_opts = { .preempt = true };
> > > -	struct timespec tv;
> > >  	enum engine_execution_mode interrupting_engine_execution_mode;
> > > -	int64_t timeout_short = 1;
> > > +	/*
> > > +	 * This is amount of time the test will wait on interrupting job fence
> > > +	 * to confirm it wasn't scheduled. It is set to 500ms.
> > > +	 */
> > > +	int64_t job_wait = NSEC_PER_SEC / 2;
> > >  
> > >  	if (engine_execution_mode == EXEC_MODE_LR) {
> > >  		sync[0].type = DRM_XE_SYNC_TYPE_USER_FENCE;
> > > @@ -153,55 +155,56 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
> > >  		interrupting_engine_execution_mode = engine_execution_mode;
> > >  	}
> > >  
> > > -	if (allow_recursion) {
> > > -		igt_gettime(&tv);
> > > -		for (int i = 0; i < NUM_INTERRUPTING_JOBS; i++)
> > > -		{
> > > -			struct xe_spin *spin_arg;
> > > -
> > > -			if (job_type == SPINNER_INTERRUPTED &&
> > > -			    engine_execution_mode == EXEC_MODE_DMA_FENCE &&
> > > -			    interrupting_engine_execution_mode == EXEC_MODE_LR)
> > > -				/**
> > > -				 * In this case, jobs in LR mode are submitted while a job in dma
> > > -				 * fence mode is running. It is expected that the KMD will wait
> > > -				 * for completion of the dma fence job before executing the jobs
> > > -				 * in LR mode. Provide a pointer to the spinner to the interrupting
> > > -				 * dma fence job so that it can check that it was blocked, then
> > > -				 * end the spinner, then check that it was unblocked and completed,
> > > -				 * see "if (dma_fence_job_spin) ... " below.
> > > -				 */
> > > -				spin_arg = &data[SPIN_DATA].spin;
> > > -
> > > -			run_job(fd, hwe, interrupting_engine_execution_mode, SIMPLE_BATCH_STORE,
> > > -				false, spin_arg);
> > > -
> > > -			if (job_type == SPINNER_INTERRUPTED &&
> > > -			    engine_execution_mode == EXEC_MODE_LR &&
> > > -			    interrupting_engine_execution_mode == EXEC_MODE_DMA_FENCE) {
> > > -				/**
> > > -				 * In that case, jobs in dma fence mode are submitted while a job
> > > -				 * in LR mode is running. It is expected that the KMD will preempt
> > > -				 * the LR mode job to execute the dma fence mode jobs. At this
> > > -				 * point the dma fence job has completed, check that the LR mode
> > > -				 * job is still running, meaning was successfully preempted.
> > > -				 */
> > > -				igt_assert_neq(0, __xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync,
> > > -								   USER_FENCE_VALUE,
> > > -								   0, &timeout_short));
> > > -			}
> > > +	if (allow_recursion) { /* Main job */
> > > +
> > > +		struct xe_spin *spin_arg = NULL;
> > > +
> > > +		if (job_type == SPINNER_INTERRUPTED &&
> > > +		    engine_execution_mode == EXEC_MODE_DMA_FENCE)
> > > +			/**
> > > +			 * In this case, jobs in LR mode are submitted while a job in dma
> > > +			 * fence mode is running. It is expected that the KMD will wait
> > > +			 * for completion of the dma fence job before executing the jobs
> > > +			 * in LR mode. Provide a pointer to the spinner to the interrupting
> > > +			 * dma fence job so that it can check that it was blocked, then
> > > +			 * end the spinner, then check that it was unblocked and completed,
> > > +			 * see "if (dma_fence_job_spin) ... " below.
> > > +			 */
> > > +			spin_arg = &data[SPIN_DATA].spin;
> > > +
> > > +		run_job(fd, hwe, interrupting_engine_execution_mode, SIMPLE_BATCH_STORE,
> > > +			false, spin_arg);
> > > +
> > > +		if (job_type == SPINNER_INTERRUPTED &&
> > > +		    engine_execution_mode == EXEC_MODE_LR)
> > > +			/*
> > > +			 * When main job is executed in EXEC_MODE_LR,
> > > +			 * interrupting job won't end it, main job should take
> > > +			 * care to end the spinner
> > > +			 */
> > > +			xe_spin_end(&data[SPIN_DATA].spin);
> > > +
> > > +	} else { /* Interrupting job */
> > > +
> > > +		if (dma_fence_job_spin) {
> > > +			/*
> > > +			 * A spinner job is executing in the DMA fence mode as
> > > +			 * main job. Until we end the spinner explicitly, the
> > > +			 * interrupting job won't be scheduled.
> > > +			 * Make sure the interrupting job is still not completed by
> > > +			 * waiting for on its user fence with a long timeout.
> > > +			 * Wait is expected to end with a timeout.
> > > +			 * After that send signal to end the spinner job. Once the
> > > +			 * spinner exits it will make way for the execution of
> > > +			 * interrupting DMA fence job.
> > > +			*/
> > > +			igt_assert_neq(0, __xe_wait_ufence(fd,
> > > +				       &data[EXEC_DATA].exec_sync,
> > > +				       USER_FENCE_VALUE, 0, &job_wait));
> > > +			xe_spin_end(dma_fence_job_spin);
> > >  		}
> > >  	}
> > >  
> > > -	if (dma_fence_job_spin) {
> > > -		igt_assert_neq(0, __xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync,
> > > -						   USER_FENCE_VALUE, 0, &timeout_short));
> > > -		xe_spin_end(dma_fence_job_spin);
> > > -	} else if (job_type == SPINNER_INTERRUPTED &&
> > > -		   engine_execution_mode == EXEC_MODE_LR) {
> > > -		xe_spin_end(&data[SPIN_DATA].spin);
> > > -	}
> > > -
> > >  	if (engine_execution_mode == EXEC_MODE_LR) {
> > >  		if (job_type == SPINNER_INTERRUPTED)
> > >  			xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> > > -- 
> > > 2.34.1
> > > 
