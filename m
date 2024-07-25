Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880B5C3DA5D
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 16:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493AF10E05F;
	Thu, 25 Jul 2024 16:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQwRzhbf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B3F10E05F
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 16:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721925373; x=1753461373;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=48klbB2P/IbFI3vdMuiriMrX/2vLPAdbzn/lE62/flI=;
 b=AQwRzhbfJpgWcIGtAAyscmQ+9IPjCn7dWh0eSpRbBQODkVjMvAIvK0Q1
 9z7yfM3az7Lh1GV//IRRufLd1emoUH8IL21XhAANNAMTQ0y4Q6KlRSlZF
 SUwxHrq4phT1rBJtrzxEelyVwMEiW55A201ywqEva04ff+ar3ZxafiQj3
 PAzI9QLz59OmtHoSruj9ZHrh0qZYO9xfh7fnRWcQOsTSqvRqmNScxeR56
 ylec0pRtrEv05Q7A/Fr5Nm+DL7SiiRU1M7STkvE9u2iP6mEtG+1djkpO5
 ZZKJIGX6+MRqqbATK55xJDigmNfmOCdKbCN5Gg/8zTklgjekr+cGE/ZFB Q==;
X-CSE-ConnectionGUID: ejxiDMKAT2Welmmamh6rDw==
X-CSE-MsgGUID: mu2ewUtNQoKluPiRfTRe4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="12713074"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="12713074"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 09:36:12 -0700
X-CSE-ConnectionGUID: cG39FS6JSpe2fI00PQRi7g==
X-CSE-MsgGUID: mn0zsPLjTtOCKB6Num+Sdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="52908726"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jul 2024 09:36:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 09:36:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 09:36:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 25 Jul 2024 09:36:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 25 Jul 2024 09:36:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4a9fkLpReUlURg8v3fPbnXExL1lfx58TLBvx+BZWLohl/6miVCL7QTXGLfimo15ZbBha9kJgtCOR2Fo0QsP6J0Z8E2NFWvgSOSpF04lG7A9vuI4rTQJOhhUgqN61SDjDY241M2P8qcLbLG+puNSH2mbNu3UEdcHNvgPj04aadm1j9mgza/CIEMSzM4SIWEHnmxVL6HuF+XA1Pu78mhb7dGX2oT+khKaibDBXXzgSxNUXE2VskIlGEvmano1fQTmb7NNS6tQRicaogCkm3txOb5uAwZh+7HnFBs9nP/H8h7IedAPUl41hDkJlTzxxNS0RpCO4l3ytkcwulSFMipDsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eISyu2n/GA5Kw5tItJnal+0ZYrwe6hkRNzRbLVD3lpY=;
 b=aMttkVvsj1QIJjf/TgnvXZyU1UDDcHw0LXXvja+JPUyO5E9/cJZi+8b4qdxaB0E4U3AyWhEmSbXZj1E2K7DU1R/y7/EOWXbRWDd9+haByOoDyyuCm3wVM2eLxf4phCfOfMkUe3/MPYPQR0Ss2l7mL7/by7Jvf5geg0xft77fY0q8aNKrfZpwH/KeKt0DN+Ssmfkr+30FFUMqxgJmNmfhCdrHdvhn5vDHdpEbFIB8npxk42HLtg5wE7zO31pTiSkqxauzlXqGg9YmLgD9a1fp0mKaRLq5PYLRyl4D3TqFWK+WX+ItXwAzlbNloZRnnRDBfl+2l1rOcY8P34n/gvfNkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6828.namprd11.prod.outlook.com (2603:10b6:806:2a3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 25 Jul
 2024 16:36:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7784.020; Thu, 25 Jul 2024
 16:36:07 +0000
Date: Thu, 25 Jul 2024 16:35:16 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
CC: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>
Subject: Re: [i-g-t V2 1/2] lib/drmtest: Ensure the XE driver is idle before
 starting a test
Message-ID: <ZqJ+xAgnWBCp0JLE@DUT025-TGLU.fm.intel.com>
References: <20240724070544.1734040-1-bhanuprakash.modem@intel.com>
 <20240725041803.1764959-1-bhanuprakash.modem@intel.com>
 <75f51358-3cba-41c3-92f2-dadf8eb33604@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <75f51358-3cba-41c3-92f2-dadf8eb33604@linux.intel.com>
X-ClientProxiedBy: SJ2PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:a03:505::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6828:EE_
X-MS-Office365-Filtering-Correlation-Id: 09c51940-0174-4c77-ec7e-08dcacc7e23f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dBKAaPNYs/9B1If2v2iRCuRys2AceV09BuC/LAfqj9DijtbUwUSNhqdLrV2Z?=
 =?us-ascii?Q?yKwsNA+Z5JFbvJJBcXjG0Rw4dOP3dWKzC7bH2gKqI8I9eM5fAhERr4XLnxtY?=
 =?us-ascii?Q?5DPxsEprxuu00960OAGvZ97ruou9V/I6mhvY1z/DzeYDJMjt8UaM4paZepiT?=
 =?us-ascii?Q?quo3Uq1H6tvREbVwTTY99WVrekL/cqhGUoCxH7+dGfC1RR8pOLGgQ2uAPt1t?=
 =?us-ascii?Q?prHHQTSbHgA8R2OfeIOYsIjZBcZeKf395F7fUGOl3Im9ryN8TxRSS/Gbts1g?=
 =?us-ascii?Q?iMfRgNsa5VFVYrYIfkVgGtLyo24pY7v+xub7M2ToN3V4Mt5xNfp0tufJiIy2?=
 =?us-ascii?Q?6aLR0C3ijfy7JM7SgHPOUJXORrLCbTpjdmxQ7xF0phcvUMJPSCY96M48u+yi?=
 =?us-ascii?Q?gWnbZREmTqlz2sa18uIiZpWkG9jB4dI4rpApK5Uf/Gt0P0uzAxT6q5rnXslJ?=
 =?us-ascii?Q?gcIOYEqoTpfYngdh64tw0yE1VJ+HGhyc0PBU+c5Td9c2G/Fx5A0vRllBzCxv?=
 =?us-ascii?Q?dizZZ2n6noLZBCQ2zI5MWDhIIsIPZy3SZXxAxle1C9HZ6PnmuYB1egv9Btk7?=
 =?us-ascii?Q?T9aKHFxdzAK37nzMDE0Lc0POev8d6RrAdUq/01XPOzUXRYinPcuhhmIYVcS+?=
 =?us-ascii?Q?pnQYpO01/NN/4/iPfo5/Y4kvtXqfQUFyqs+WmaxeQIEjVHK3ezISV2HdkEnr?=
 =?us-ascii?Q?e6z/5sFbkcJTsufAdczIeZ2HgLwSPHp+YPYioW2KFSIkHNPsPuTKtAdRD2XP?=
 =?us-ascii?Q?ncZbuk5bS+r+zIHnH38+IisfVQGmNoNcNBS75PuLraTXoxnKgOEFN8y2aX45?=
 =?us-ascii?Q?U13K6o7GVSG+KsZ80RS+i6DZkXRBq2hzkR5GhjobaquJAxAse2ARinuNSwKj?=
 =?us-ascii?Q?DjHjPoa0HKdZGL6CBo96xpDp5c3WAJy4JVXmtef3KHBwqkqjubt/6PbYFBln?=
 =?us-ascii?Q?gu49N/L/evXywIr2bmHQVjR8l7dvXANFjnrqdEqTJ3RlCS/POGzEIv9IGUD5?=
 =?us-ascii?Q?Mw10q3iNNr5C9YBd68gLskPWjbccscvBG737tuF1Z8dvLU3sOe1dkI/CfMao?=
 =?us-ascii?Q?XPPPSxJ2LkF0CyanWrp+nxjHTl846+nppcJkL1CVrgWC8aM+mpExv0VMR7mz?=
 =?us-ascii?Q?fJeMy2LRbiNeMX7+gZVna6pCOL6R4ZJ/Si10yKQ8y3Vxl4/FDJRgVk1t5XRz?=
 =?us-ascii?Q?d6bnylpveLnojG0fZpBGZvm1QKnsPLCAxyEHXwpH8mg+n2a2tKB83zhKuyzE?=
 =?us-ascii?Q?BHnqyRh9GTTpysoIHeBnWQkol2MwtUIZthSkllJbEuoRYTlz0+MNI5U7byKd?=
 =?us-ascii?Q?Ap0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OLrgpnqb/FGIgtGdiQk4UO7mHftXvmQPMGn1EVVo4aJi+62UCB20hf+Htegs?=
 =?us-ascii?Q?5MZBc/kbTOq8se1nfp9zymgSruaD0J2bVCyv1UIeL35Xw4DKOhIgoyODwCVk?=
 =?us-ascii?Q?Eg98VRPNVFhU4RwhkLcz+taR2xxyF27WVsBhN8hEaXarLr1WeiPmFMj4LfIY?=
 =?us-ascii?Q?vjkKFPXv2wzznm7xF1DZsevIB4fw3L4KDVndNOZf+nc4xpc2+NoDV3t7+oI7?=
 =?us-ascii?Q?h3t94/nvuG+rEKkuSe4+vr6PcY6eFbIqtLo1fGahG4Ah5mNitVs9AIsWMh3Q?=
 =?us-ascii?Q?A9EtBr7fKPeXCwvPcqQ9pqg8rHM/+WAQEnIQDrai2b686asdyninAjYXYh8t?=
 =?us-ascii?Q?dbiYGfTNGYzfs9wUyx9po8RRUXwxMvfrKhNbKL+GE6+y0a+qCpBN1FyvTbaE?=
 =?us-ascii?Q?YJ8f7leeZrrywsHqkZwOiMaXEl0E+EyckA3AvZG9syFdgZNuOlCd8Nxuw3MD?=
 =?us-ascii?Q?sO2cDcgjmWx0zA1vZD1z1N9gNhV9WDMB5Xnp+ChTUi5eRJOlQQ+o2Rrinsms?=
 =?us-ascii?Q?6zPH3OxRSjousJH54b99zA65saZCjEeDXqBXZRJlyuu/J5DmTsxa77g1ilK7?=
 =?us-ascii?Q?G96+1g++wLRVFFbxTxQ8UtrxXGI2gFvpjeHP02kcnmMTT8D4akfuyL8jj8LC?=
 =?us-ascii?Q?Ck9CUl2cudxMlT27SEL++HOIaVTaxZaZFqeSkxjG3nFZ7R60bxn3HWggEWAa?=
 =?us-ascii?Q?2kZMf5GOd1ZbbPP9Scrmx/GmUVYXkZh9DePfFgJUh/ejhwIJClumc/RfIcZY?=
 =?us-ascii?Q?GyspUyEhsZx/ZRlG+tHRSQishk1a77wfANc6XO2+7KsBay4JYuHarjLti4m6?=
 =?us-ascii?Q?8c9xQwhv2qrbb6WeTQ0M637eRmTlRXHm1+7Kk5D7mzapzCF/Eq9aNmThGMGe?=
 =?us-ascii?Q?bl0FTVZHaIPsOZycHKkCUfpdCz+pZgsChXlm9gIYuep3ZIHUN5XS0//1NpCt?=
 =?us-ascii?Q?G9v1ayNI3uB2dj9HxmFB8LLlBuJ8QwN41OJdYA6zT3UywKleFfuqPIvokfnq?=
 =?us-ascii?Q?9HkZgi1ypxkvmql600v48HUklo90QAchQMaDi+d/utSBefMaYrITLn7tWQyZ?=
 =?us-ascii?Q?BwPw6zm1rp8ke7zCeffUw0YvtxW7XtYSEQJBBL3+0U2Eh3iXWDuK51qYXW7U?=
 =?us-ascii?Q?QelNfXWna5mAW7wnVm6YvZ0srm6eswSNM3HKASBUKTJeg7glsVMyOjYW13mw?=
 =?us-ascii?Q?+eYxaCimAr71Gv8fK8wKaChr897Je2JsGmV3u9Ungn/+JLmrpogcCm4Y6F34?=
 =?us-ascii?Q?DysQcTZJkJZLG6kQfjgxgSbiVl1qMiicpd/n3ku6vz0fVlX+vsrZIiVcBrtl?=
 =?us-ascii?Q?PSEYwLM0YcfuaQtctHf1UodwEFklqA51wO9ljF7RLkY0lKVdkcUUlFeVzmjB?=
 =?us-ascii?Q?//YOZCGyOoybmDe3w6zWKT7KsBu7WMhqMDF+Y0sbQCE3xfHlI0wkNu9DycKK?=
 =?us-ascii?Q?t9tTcDeFsDd9VnUT8QNPykI/re6q77On0/5ZGk7dLITiMxAwhWLxQwUtSCim?=
 =?us-ascii?Q?4CvDarDByDQsw1uClRd70rdJYxaw0MjRVNXVcjtbBmNasUPjqdbYk/ur+4Bl?=
 =?us-ascii?Q?baWa7z10SZNYZfnE4bk3BIZAh3C1+OWTRAdWOBvS4UKlBqlInMcP1it4wJ14?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c51940-0174-4c77-ec7e-08dcacc7e23f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 16:36:07.4865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NkW7XVchBDC4QDiQ00N+YwL3Bf1sNQvh6hlWJpLeXpVv15QJjRZGdjzDlf/uOv0BNDZBgTIF/XUmmZQmZin8AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6828
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

On Thu, Jul 25, 2024 at 03:45:19PM +0200, Bernatowicz, Marcin wrote:
> 
> 
> On 7/25/2024 6:18 AM, Bhanuprakash Modem wrote:
> > Re-use the existing i915's exit handler to make sure that the
> > XE driver is idle before starting the subtest.
> > 
> > V2:
> >   - Add some delay after attempting the gt reset
> >   - Cover drm render device path too
> > 
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/294
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >   lib/drmtest.c | 24 +++++++++++++++---------
> >   1 file changed, 15 insertions(+), 9 deletions(-)
> > 
> > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > index f8810da43..90885ec36 100644
> > --- a/lib/drmtest.c
> > +++ b/lib/drmtest.c
> > @@ -64,6 +64,7 @@
> >   #include "intel_reg.h"
> >   #include "ioctl_wrappers.h"
> >   #include "igt_dummyload.h"
> > +#include "xe/xe_gt.h"
> >   #include "xe/xe_query.h"
> >   /**
> > @@ -663,12 +664,17 @@ static void __cancel_work_at_exit(int fd)
> >   {
> >   	igt_terminate_spins(); /* for older kernels */
> > -	igt_params_set(fd, "reset", "%u", -1u /* any method */);
> > -	igt_drop_caches_set(fd,
> > -			    /* cancel everything */
> > -			    DROP_RESET_ACTIVE | DROP_RESET_SEQNO |
> > -			    /* cleanup */
> > -			    DROP_ACTIVE | DROP_RETIRE | DROP_IDLE | DROP_FREED);
> > +	if (is_xe_device(fd)) {
> > +		xe_force_gt_reset_all(fd);
> 
> It looks quite invasive, we will loose the guc log ?
> 
> > +		sleep(1);
> 
> How the 1 is selected? Is it reliable enough ?
> 

Definitely don't do this. Forcing a reset is not a great idea, sleeping
is a horrible idea as all tests are going to run way slower. I depend on
tests running fast to be able to quickly test my code.

The question is also way is required. A driver is built around process
isolation so if the GPU not being idle before the test causing issues it
means one of two things.

1. We have bug in the KMD
2. The test is very poorly written

Idling the GPU will simply paper over the above issues.

It is quite troubling that their are RBs on this too.

Matt

> > +	} else {
> > +		igt_params_set(fd, "reset", "%u", -1u /* any method */);
> > +		igt_drop_caches_set(fd,
> > +				    /* cancel everything */
> > +				    DROP_RESET_ACTIVE | DROP_RESET_SEQNO |
> > +				    /* cleanup */
> > +				    DROP_ACTIVE | DROP_RETIRE | DROP_IDLE | DROP_FREED);
> > +	}
> >   }
> >   static void cancel_work_at_exit(int sig)
> > @@ -716,11 +722,11 @@ int drm_open_driver(int chipset)
> >   	igt_skip_on_f(fd<0, "No known gpu found for chipset flags 0x%u (%s)\n",
> >   		      chipset, chipset_to_str(chipset));
> > -	/* For i915, at least, we ensure that the driver is idle before
> > +	/* For i915 & xe, at least, we ensure that the driver is idle before
> >   	 * starting a test and we install an exit handler to wait until
> >   	 * idle before quitting.
> >   	 */
> > -	if (is_i915_device(fd)) {
> > +	if (is_intel_device(fd)) {
> >   		if (__sync_fetch_and_add(&open_count, 1) == 0) {
> >   			__cancel_work_at_exit(fd);
> >   			at_exit_drm_fd = drm_reopen_driver(fd);
> > @@ -836,7 +842,7 @@ int drm_open_driver_render(int chipset)
> >   		return fd;
> >   	at_exit_drm_render_fd = drm_reopen_driver(fd);
> > -	if (chipset & DRIVER_INTEL) {
> > +	if (chipset & (DRIVER_INTEL | DRIVER_XE)) {
> >   		__cancel_work_at_exit(fd);
> >   		igt_install_exit_handler(cancel_work_at_exit_render);
> >   	}
