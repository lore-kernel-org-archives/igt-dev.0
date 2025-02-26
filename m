Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1224AC021BE
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 02:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B6010E1E5;
	Wed, 26 Feb 2025 02:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hKC6oLh9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E120610E1E5
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 02:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740536048; x=1772072048;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=f2kQ+lEV/f7GG/44lDtQ9WV8rJPOTUsoTUGn+O6WwKM=;
 b=hKC6oLh9kPCtx3HmYhG+czIqLkTzpI9TJJ5/rRgPkLGoI9LOMs00Ap3O
 exMG3E1cV727L8ENj4f2tLZodQ4S8GclGfkQjjQjH4dPIDgp8uSPdQiF4
 aNkqQKh7QnULk52aZVNC1K2WVBIPLUrbTX1tyemzb5dDcUq63IuVm/PMd
 r/edmsAdMis5xCCJLA2sbp872J0qI0P/hjxUYjG33jFFK+FX73Yjn+vVu
 o+/zIp+pC/BhDVnjVsAYK99ae/22Xi6LTEjltL73N0iKZscUYIRzZzjBx
 qdprpXNjI4VD6YE4W2rucWW2ESzrf8du1MWV7DfBwl+FU0NNDmoKpkmJL Q==;
X-CSE-ConnectionGUID: KKTK2uvyQ3yjTPPabR/VJg==
X-CSE-MsgGUID: 8+QpNqAcRBGh727ckCphAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41622884"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="41622884"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 18:14:08 -0800
X-CSE-ConnectionGUID: nsm7DfzJRlaSIf7S9XlvZA==
X-CSE-MsgGUID: AkPnXL8GTd2wxrvRaYF71Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="117184983"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2025 18:14:07 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Feb 2025 18:14:06 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 18:14:06 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 18:14:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDAwrKgPjM6FNQ1+WfD0WgYnMmMO7+X/no/ybzvJSiqwHEuJq9GcNSh5s35uy2STRvHcOe7gCFsdZ4ewjR+MkhmVx6hwQcFZKLuzbHn1tw9CTUzW2f4IGzMrOyyfYodAXrUr4cA81e8lAS1P2tuXSsr0LCCopfBzHBfeEia43wrphTGumFhr1258qf8bdT5ZccbmafnoEMGA3PWi2uQWbYZ3b0gaKsnSniiVrSgX7/FpvtBFzBBX0vRFTZkOpyIJZkOQaddQZ3n7ExbZWJ3zMyIoGE4B3cTwlYidzdSCBfMR6U6HgTE6zXcnGoKODxd65atT/ztUHMDOy7EwfGfbLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRfqoqbiNBki2tuokHmH8m/8qjDYqcbcgr4Psb2WTOc=;
 b=ZOUw2yLrgl6L3XbnvYFgvhgh1zL1kvLlJ6Q8QGuLTJcazouMOonN5TtEKYoOPBOORwv2KpJP4n8vRfaT8jpuQEQO4nnsn4je34KMM0xmaOW8Mjtnfn7aUIhsrEyQgvjtSgWPmWSrXOe3DLId4dK7mmcit606f3zFPJeYZlnbx4hGjEPt63I/rxyM4zqGPfCEPziyRB3Ilo8Cgn1sjISPkZda2+Wy16HapIeD6YAYYP2r/L6fPf8yy/nqfnfDa6p6qKp0A+0ixONenx7Gmp6gdkiAmLgBSZlTMMgqHYpt3ie/h/eauxcr2GeNcXRr2Bw1hkVKeNfBSrbUv9JoHdQ32g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by CH3PR11MB8561.namprd11.prod.outlook.com (2603:10b6:610:1ad::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 02:14:04 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 02:14:03 +0000
Date: Tue, 25 Feb 2025 21:13:59 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <katarzyna.piecielska@intel.com>, <jari.tahvanainen@intel.com>,
 <ramadevi.gandi@intel.com>, <kamil.konieczny@intel.com>
Subject: Re: [PATCH i-g-t v1] tests/intel: Update sub-category of Xe power
 management tests
Message-ID: <Z75459--hUnc3s65@intel.com>
References: <20250213155740.361646-1-karthik.poosa@intel.com>
 <Z659i7WFEcPS8qbQ@intel.com>
 <437e8f9d-ecbf-49c9-8f07-0e30d469eb7a@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <437e8f9d-ecbf-49c9-8f07-0e30d469eb7a@intel.com>
X-ClientProxiedBy: MW4PR04CA0133.namprd04.prod.outlook.com
 (2603:10b6:303:84::18) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|CH3PR11MB8561:EE_
X-MS-Office365-Filtering-Correlation-Id: b6833550-aeaf-43d4-7428-08dd560b3d96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?F6ZGAlcHxSIAWfPbV2JK9LqAV2ZvD8c/Z9pQd4kY2qLQP3vSkADPYeiRhp?=
 =?iso-8859-1?Q?drtK8GfLRayBxj5Q/igBvQ9s6FpZuIBX74S10Ze/SNACJSH8iuwDKEH9KD?=
 =?iso-8859-1?Q?3Mssw9P7xxAkx9xJd2uCEhOSXvYkc4jeWM7hhPYCwxiKS3lpCRQRBcUMav?=
 =?iso-8859-1?Q?3AL3tHSmkeV9hJvzGidsvLcaPSpvSzUMQnpjJkdGrhZgPbtdWEH1q4hnDx?=
 =?iso-8859-1?Q?9/w0fjnklmRWZFbt/Tq3ha7oghHkq7aMIDMUL8fEhkbcIiJ1uQVg2Bsj/Z?=
 =?iso-8859-1?Q?O0Odt6bzsAq7tVYzWpck2TKGbi2mWcTzQ8wIWg/ugsyvo3Rd2cWE8e/e/y?=
 =?iso-8859-1?Q?DIFn+AIf0a4F+pjF3K6U8kJCxXM+YXyFupkP7RVWyj/ZGmmE9Eyu8oe1cK?=
 =?iso-8859-1?Q?R+RhfJzfW8lbf+FFwtNVnUvh9ZAXI9fju351l2myhhO68Mu9BjSRZqE0eT?=
 =?iso-8859-1?Q?56WQnFL7DF1/e2DbDtw28si66VdgtPxgEr17tJRkfugWLkTd+TapTriUzX?=
 =?iso-8859-1?Q?Ahs58Eghk35XPxYWVwN7M3arawUeaZqKPDuePmT6XHqcbducv+TRiESAGq?=
 =?iso-8859-1?Q?h3VpM5H1M7Vb737UNbL4U3XlBjnYq19nDyyHFQil6w4igbMOiVv7ro1fuC?=
 =?iso-8859-1?Q?u14z5MLr4q5nGAXd5WEvIxU7N7gftn4zOVkH8+gBvQ1mgbPhWQdOv6g06q?=
 =?iso-8859-1?Q?UorBQ2UUVC7uCuPLDBAcuu3h/XO4Py3o/fy2YaRPiPS67ktGLGFwegCdBg?=
 =?iso-8859-1?Q?EvKJLmhxoKIECA3amDcoTo4eijes7LYDUBr2zBKL6o02SXSnYcKDvp7mDG?=
 =?iso-8859-1?Q?8wdsB6UTmSEfBFGp24JdfVlQK7OeX+EqyW1AnqMnxYaWti6rNOBK/gdaYQ?=
 =?iso-8859-1?Q?v0DJ79gLS+74Jn6XDBhIIOqAOWBiM/2kxwOU31y8T62AhqSkC1PQwEeMvI?=
 =?iso-8859-1?Q?VFbAk0B3Yl0YkW5dWUxdHt98Telizf2+WJu/H6sdMjNiyquwv11Uld5YH4?=
 =?iso-8859-1?Q?KWQYwEOhjMdjnCBWSr5Lb07S5k8Xcu2H6W3ArA/JT5+HVeeAOOayMgNH79?=
 =?iso-8859-1?Q?hiWGUFzqBs/GGry+fVI4C9t8iREhlS4AZ53YQS+Hc0qDe5nniIcMQtuVpz?=
 =?iso-8859-1?Q?5aTLCtnCJK7OL7gsEvW4tl+rPgROwegT2Tka/8n3adSlU5LSO1y21xdW0v?=
 =?iso-8859-1?Q?XM5qgUwyADHp2I89Oot1bW3tUtttN4+D9PaFkeT5YnP5yC8LaJ5AyfhO1X?=
 =?iso-8859-1?Q?/ZdaOQ0wlzycU2bqidPk8eE2VHq11IqTIpG+TWdIufJaaH9xQJvBGBQZUj?=
 =?iso-8859-1?Q?eVlopVz7NC/vvL2eVodPglsq+/JVfzZ+zHl9Z54LjQYhMr+/8BH00DSTk5?=
 =?iso-8859-1?Q?+pGlojFoTu70oU/8ur644w2l+/eSrr7AhezGvAc4ugGw16lGSMnj99ukj8?=
 =?iso-8859-1?Q?AXbHWEdazkT/Zo+Y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/h+9Rz9FK1JywQL4G+nY2Artkp0tsOHGRttnehA5qaIyA31nRWPuK+oZnv?=
 =?iso-8859-1?Q?FuHeGN5XnSWrUpkjXtAGwKexDT4wanLBw0jDn5zyjcQjSMA8o64YiCRgyC?=
 =?iso-8859-1?Q?GIurXSPgye+q6xCwp+MckJRJRmulYuOIOX8baSDcZ1+XUPGQGOsheTynHI?=
 =?iso-8859-1?Q?OjImlaTAdP1LaYy57GESetuLIxCvWxZd7UxfHCvfG14dUK9WGv/QY7CuFj?=
 =?iso-8859-1?Q?/EmVc0pBH4XKuy0X26eFhbOs/OTgSrbhlx8uKZoDJNSaXExfau8KW8j7Ck?=
 =?iso-8859-1?Q?N1Jwlhga+td/rtw0fMLQJuYFoZPdlzuaEKnlgS75IFkzLyR/x7fGhR8cgM?=
 =?iso-8859-1?Q?hZGqCcDC5VlOaiTu7rzR75q0P2dxMrrWjzIcFYHzXZIHkgMEkXk7zAYH/9?=
 =?iso-8859-1?Q?7ErNpAq2tfsdsgZJ/jnzF72XkFm26sgEtjHoNTl+63H0gcU9MX7nyuW5Rl?=
 =?iso-8859-1?Q?6cK7HBd9NC+LUSBlOKmlG3CZZSyWGxWNsUs52oNvYYgOs0sKgQknHEmCRj?=
 =?iso-8859-1?Q?PbglNOfD2FElcfpJJWJRtsf+fZIK1lpePqekBr8kOAjEicI/ECAU4KLxpD?=
 =?iso-8859-1?Q?k3dduFPQNEUkzaYAaEeM0Qds/x5OulLeRY3owpq65osnPQ6hVkgoFs3EJo?=
 =?iso-8859-1?Q?juMF6BnJJiT1cq0x+0bh9OG9MLfnhDWEE6OtkUAPTYA1gnymhW4XFHvhrM?=
 =?iso-8859-1?Q?9HhFvDh6KF0truVfx2Oe2hWaav9oBD0COVwuvH1MJHAensRmu5he6Jio92?=
 =?iso-8859-1?Q?yh8lMq45sxEWZjScdTQfzCRgiYRLxjAany0b3Qoo3lWbv3cARzPz+jNVdC?=
 =?iso-8859-1?Q?u1CjenjtGFIzQa+8/Cj5RMU042tA6E0zE7YuEYO2JjJa5DzGv3afxwksyU?=
 =?iso-8859-1?Q?D9jz1id5rCekse8c6hqAM7IHYlB8l7oRoV9qrbyzLfBgpGlvTFFDrZj8nH?=
 =?iso-8859-1?Q?18M2fMHDACuTsTG0Qw1sN+zTGriuQynurIE3DntJdXE5BPcwyWpThVjjd4?=
 =?iso-8859-1?Q?N3m4/UY/RpAilUfcKU7nSFeobC1sHIU9SpK/lmI6HsmpBL6w0jjNT6zOVI?=
 =?iso-8859-1?Q?veOLZjb14H+/vv6iscT/DobN/dW+JuPca5aCy5w9U7LFFwtV2R3iZZfGI1?=
 =?iso-8859-1?Q?x8R+JpUe7NEbzt4ffBdyEwZP+v7pfVuHoY/1+2rCUES3eGFsGowSKpxogO?=
 =?iso-8859-1?Q?RQCwr0P5sDBsteqgUq+CJr10abKlQLprddAoqHUemK5+z1RbLgCW8RDEBe?=
 =?iso-8859-1?Q?i8tXLq3rqIJr01rfWzEXOskDG9dMstIwQia9HbfyUvcJpzCpBcp+MLjMqs?=
 =?iso-8859-1?Q?wLsjBHdXUxqbPvENWJG69LLsV33DzxxKe+IRSe6jpSHR9hOOqSaV5qW1/x?=
 =?iso-8859-1?Q?xeRR8l2p3Pxkorr4yIililiCJJ5jWMniXG6aeT9drIwUy30RBqkiKNuv5+?=
 =?iso-8859-1?Q?OcF0CqGW7lY4JQjSbU1f2zLALyVbzLdiFjrC0gDV5OaoiHF813mT75FGBs?=
 =?iso-8859-1?Q?p5wC9EUKqcSlrKiQdsu5ymkSNiRX+fzybWQd948a457dOe6qH22+fp6DNf?=
 =?iso-8859-1?Q?pRiRuOfSC37DJFSmENEkchUJPNFRkGxZGmU+4aNTER2IqH7SET2O0hp4U6?=
 =?iso-8859-1?Q?bhVuwlL5VHPFNeMj1haIhheFfo0gMj5xfWDgwDk/lnVJx2oXoNz7BbGA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6833550-aeaf-43d4-7428-08dd560b3d96
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 02:14:03.6732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8bRrId3AcPxM6fTSyOl0J4aZeRF86GqaLKwKLsajYNhyw1jjC+HpMI/v7+pn4b2+OOfRdeWArRS8sY6ORSNUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8561
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

On Thu, Feb 20, 2025 at 11:45:40AM +0530, Poosa, Karthik wrote:
> 
> On 14-02-2025 04:47, Rodrigo Vivi wrote:
> > On Thu, Feb 13, 2025 at 09:27:40PM +0530, Karthik Poosa wrote:
> > > Change sub-category of below tests from Power management tests to below:
> > Why?
> 
> These changes will facilitate tracking of sub-category tests results in
> visualization tools.
> 
> > 
> > >   * tests/intel/xe_gt_freq.c to Power DFS tests.
> > >   * tests/intel/xe_pm.c to Power suspend-resume tests.
> > >   * tests/intel/xe_pm_residency.c to Power RC6 residency tests.
> > > 
> > > Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> > > ---
> > >   tests/intel/xe_gt_freq.c      | 2 +-
> > >   tests/intel/xe_pm.c           | 2 +-
> > >   tests/intel/xe_pm_residency.c | 2 +-
> > >   3 files changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> > > index 1fb6d2b53..e97195b1e 100644
> > > --- a/tests/intel/xe_gt_freq.c
> > > +++ b/tests/intel/xe_gt_freq.c
> > > @@ -7,7 +7,7 @@
> > >    * TEST: Test Xe GT frequency request functionality
> > >    * Category: Core
> > >    * Mega feature: Power management
> > > - * Sub-category: Power management tests
> > > + * Sub-category: Power DFS tests
> > well, I know that we are not changing voltage, but DVFS seems more
> > used.
> > Or in other words, why DFS?
> > Why not Frequency management?
> Yup, Frequency management looks fine.
> > 
> > What are these categories getting used for?
> These will used by visualization tools, as mentioned above.
> > 
> > >    * Functionality: frequency request
> > >    * Test category: functionality test
> > >    */
> > > diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> > > index c2026474d..644680893 100644
> > > --- a/tests/intel/xe_pm.c
> > > +++ b/tests/intel/xe_pm.c
> > > @@ -7,7 +7,7 @@
> > >    * TEST: Check Power Management functionality
> > >    * Category: Core
> > >    * Mega feature: Power management
> > > - * Sub-category: Power management tests
> > > + * Sub-category: Power suspend-resume tests
> > >    * Test category: functionality test
> > >    */
> > > diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> > > index f9e96d608..f0833eb0a 100644
> > > --- a/tests/intel/xe_pm_residency.c
> > > +++ b/tests/intel/xe_pm_residency.c
> > > @@ -7,7 +7,7 @@
> > >    * TEST: Test gtidle properties
> > >    * Category: Core
> > >    * Mega feature: Power management
> > > - * Sub-category: Power management tests
> > > + * Sub-category: Power RC6 residency tests
> > RC6 is old terminology... It doesn't make sense on the Media GT.
> > 
> > GT-C6 seems better...
> How about GT  idle residency/C-states tests ?

Yeap, that works too

> > 
> > >    * Functionality: GT C States
> > >    * Test category: functionality test
> > >    */
> > > -- 
> > > 2.25.1
> > > 
