Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FE8C77B7C
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 19:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8ABB10E062;
	Wed,  2 Jul 2025 19:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CMVBnB9I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6D510E062
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 19:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751485060; x=1783021060;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qPj5sqcn4RG0p3zS+qDNtwrJxrd7i6qtLWUqunb7YcM=;
 b=CMVBnB9ICIdOJqe1fsoJ5JCL0a1WFKUZxyAWdYsTW4+BJj8seMNiEsBh
 eImwmEHEM1OOyOEkEDLyQX5ZI5cUzGoHCieCy0+qOykZTYHBHy373Cqij
 QauoFsXXaCLu8JtulK1w7ZUAAaZvBgHLniBnq4aQerdrI/+MNwiob/udI
 Q+pCN8h5stklqir3Okz0tfBbJA5ZOCEtTl3h0byO8uGldeZxLgB/m4uyH
 /zXlumlZqRiRqlH3lsTgl0AkmGn/DLSpXdEQ7FWGu9pbk0lIVdPuYtSwb
 4gRZ1M6zqn1G4Ra9l78wWpPbCkgYN7fvw5Tx7SaGGccRFD6nCY0uGMOsm g==;
X-CSE-ConnectionGUID: QDryP8HnRjSuNJ9pKRdBag==
X-CSE-MsgGUID: BeWv0PMYTnqPthGr/OtiXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57472044"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="57472044"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 12:37:40 -0700
X-CSE-ConnectionGUID: y9TFGvMDSTK2dHgiXINU6w==
X-CSE-MsgGUID: QzleMGE2ReGWkKOKxKp/mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="153937003"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 12:37:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 12:37:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 12:37:41 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.76)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 12:37:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=id4LqLzCZryEYHkx2M7UA8+G5+q99H9BWGEu0HtsTiJ7z2xzk3T4OEbw1D+wguTCInOY9tE63VtYv4ue1S3ig6kzLix/84wgPzZ4ZFswE28HyBEx3CPmwYwGMqE5e4H/8dtUvrc1tNf/UbDDskw9+vner1VJ2QrB4eARI/hvPpYKggeDxCX75dg43v5Rb+seL61mDpX6xwYqCPZgMxI/ZccZndFKbyfQaiwpZM/0qyhFNpfjTgrhCAYg1kZNMmMrHTD3jaaRA/IzTL0qwZav3xMbOrheFi7fy20uGOr5fJWovy0oIPopNfujdbewO4oJAkeZTRR3VD8hJ8BAW/XQwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8T1EFNpA0E1nKica0Gt5LzZGsVKEK/FAe/N8AXYlgA=;
 b=DTyO1HzX1Hs3Ajg/N1NvaqA1Irf9C1mGEeQYsnqehwPv1nUpzyd4JS8eatqTAgi1sfQoU9qhgrhsYG+obAD9tE4u2OMwnrotti+fe7+n2WMtWcmhIZsJvCTQ0UOZoXNYGNCmLA2oELB3L2zGJ91NUUl3sm7u5OXRX4+wT6tLAbTM9TDu2JBV0Pj4AKxPsXLaw+TqdgP8G11EUk8w32c8i6pgwsVaqwnPo37AzmPf31xd1Oo+rInXxq6fpWr/GQOywko7dM7rJDjaKQ7PrriTN9E6xDaMVb1PWo1MnUy17oHRbyp0p0Nbv6UEhac1EKUuE/ik+xAyg6wjQOykk14t6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA2PR11MB4987.namprd11.prod.outlook.com (2603:10b6:806:113::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Wed, 2 Jul
 2025 19:36:58 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8880.030; Wed, 2 Jul 2025
 19:36:58 +0000
Date: Wed, 2 Jul 2025 12:36:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 0/7] Future-proof GT ID handling for Xe
Message-ID: <20250702193655.GF1204996@mdroper-desk1.amr.corp.intel.com>
References: <20250630163529.2096664-9-matthew.d.roper@intel.com>
 <aGR+4iq4QKJBXDrW@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aGR+4iq4QKJBXDrW@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BYAPR11CA0107.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::48) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA2PR11MB4987:EE_
X-MS-Office365-Filtering-Correlation-Id: a802bec6-ebcf-48bd-7630-08ddb99fcf18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G/zR0xJXhWmmyRImfH7zwQkPhy+uuOCM0uHDn5bhK/k9uPuWP7WDNXUtGzwp?=
 =?us-ascii?Q?tArNETjS3nQ2+2bWyz3ecqHS2QJvdE29vD3k/YC97MG1QnnTFN7knwxyJeO/?=
 =?us-ascii?Q?H7p7TUlyLUBFu9egu2nLdut9hJ3y0WOA+KUnVkchlZ2swS7RFILE6yPdM5p2?=
 =?us-ascii?Q?xxzIy+NDSPbOmyWSYRZTHergwTLghXULoWl4an6MMZ8+9J1zaaoY0hUEJbUV?=
 =?us-ascii?Q?610zu3bfdS+5EasG5xV5pBrYjFJQ5VhTyjLcgrIqLNsP4WIm85SiueQBXAJS?=
 =?us-ascii?Q?jFhq5fbZEHDWwDgICpUvEiPOJVKHqHf6dV5MP5f5FJCstheUuG0GGOm68lif?=
 =?us-ascii?Q?b69Nt+ot9APmCGHi0SmONVkMsBwzccuiZFGlqiZkXd0PjYXHS+DdNN0+WB41?=
 =?us-ascii?Q?GLpE1mQyiRzjh942nR3d08flOjryRiCrpTa/56W2xjeilCUfIj50lxpukP0k?=
 =?us-ascii?Q?H6WhLIWM51ztfpsWgEMaR+o0BAXNlNMUyGj7iLX0+mrY3sdrIbCYzZl0VkhE?=
 =?us-ascii?Q?hg0z2JXW42zfLoUTOxcIlaNZEA9KDU+kSxowpxjUYysvvjUvqGNdxlymCH9U?=
 =?us-ascii?Q?OV+xpPFPslzEJaPvukWwu8IY6tEAcWjyojqq+BgtXeOWWlGtd4MahtgkMg4s?=
 =?us-ascii?Q?aQUi6NsAYVvNPZv8/pwHnUx1HT+mBOBI+6GE59AU3nC+4rrI6cuNISJa1pPp?=
 =?us-ascii?Q?g4HbmUzMRBJfS1gyr2nB4uM9+S5UoowonVwMCYAYtUrAcQC36nutzaeoXrB4?=
 =?us-ascii?Q?/VtD9X2NwodJMCVrifFOnT9LBnBMKbC8RGv7AobJn6U1NxCRpb7MyDXQoVNi?=
 =?us-ascii?Q?owZEyPK8Iktt2NOpBgJjlK4a7TU01G3uamR/EzfFVHowcXoVlrcI15QqJ1BB?=
 =?us-ascii?Q?lHRebTkJu/e9IGUiuzuiKvp/t/QuVmRlR7o8g+QavJ4t+xxFnElBlPa3Cpgb?=
 =?us-ascii?Q?glQLgsZRT/jFsejaRQAh6XOJ+N9YaF7NN2QB5k0XcHakT122E3u227AJ27Y7?=
 =?us-ascii?Q?wJyFZdrn6a7he8woG0spFVQoj843Zny3YK+SceYt/HeQh6dkk/Yug7lCusFo?=
 =?us-ascii?Q?FnbxfxMi2kU03XyqQ+0yp5K5mc/7zW3BbCpks3cDfRJpxpzxy7f5H+Ce8jSK?=
 =?us-ascii?Q?EjxeVJh4EfXQ2UrCOQqIxgKNF/uFrgs9gcnB7Zm0XjMs+RKXz+dlq+GTbwUd?=
 =?us-ascii?Q?V//sLkjJgqd0/aGzJAlZW7h9MpUcGZwSeYh56TpMsXMKyThbYs5PJ2DT1HMB?=
 =?us-ascii?Q?g71VaObXRCp2DTsTGwPZUsbOq86X08RTf23lOrnMllOHS1/zFZgJ80vkeMA5?=
 =?us-ascii?Q?/kXWWSMpAlfOwVZbSjzSOcFRTmYuEX5x/hYywNgp2A+MJl78ReKuDVb/k76J?=
 =?us-ascii?Q?RvboIeY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u2/XIpwdNygShZM7Mhta1GOKvWK0WdLgG4yR6cCUkMaytU7EJZ83SyMpVOLH?=
 =?us-ascii?Q?oqPuiXoZ1Ci7yZ9jBExrPebp+8xwMguUCFB+BcQ2oklckpblnOVUm/A28+8e?=
 =?us-ascii?Q?LrbuuwsiWI2sUe8BJEFb0pb3x9kp3yJfzsZBGIR2Fz50uS2t7rwj342gZ2NY?=
 =?us-ascii?Q?WKQhTe6k9KzypqJ2o+eLeottcdc2CdjUa7EsKrxUYaEuPMiwhMMAaCTAJo3M?=
 =?us-ascii?Q?sJ9bcFyaJuwVV7MMhv84lQRQfNMYuNofZShWuz9ITI7CunWKE28r7Cm3136J?=
 =?us-ascii?Q?1UaldmSxgYsSVFIFwQ+0c4G+3MoHXT9yPnCHIYc5dvLC3yPRoJ9ABcqX+mSj?=
 =?us-ascii?Q?O+O+cWwSNmJFJ0oXO97cq+hzd0SNi2H8cMPWHQCzPJFUM4Cf6rbg2t5I1G9U?=
 =?us-ascii?Q?re8nqzhj3BZyr0EjgrH9Gn9zolFUh1Jg6XdUn2uqiE+6cz3pUCKCNLQLaIVn?=
 =?us-ascii?Q?AGSDFfbieiZViRgALMMC1IPLEThPzgQaSP4yHKLOoUmo1rzWfO2MAZBmZPYB?=
 =?us-ascii?Q?Vd7nTdt4l6fqCIgmO/qpfn6CDOFKIuHVjH1yPNk6F5YBz+pALZkHjaQiHM/5?=
 =?us-ascii?Q?hBr1hBEBow2sxNpv4Uw/4lDazu02k+vknXE7zcHegXVl2O4RrH4YeD2olaDD?=
 =?us-ascii?Q?f8hgZHjH5apDMfkFF3c9sZeU4s2lb/EBsP5vAq4/WmLjhLMowh1mH1mwgNEL?=
 =?us-ascii?Q?59KHEqPEg811rq3iRvSLJt1XiaEASqP+W2KIkedwqhiSun8JIQTxbYtcQjQF?=
 =?us-ascii?Q?+EmcM6+3RK87YvvjfMZUXEDikzJh9i/GstztTx+h/fGYHvE/54OOLIQpULUZ?=
 =?us-ascii?Q?/NV4pIsWPfX/9B5BcKY1ZYzJUk6ye+lMdn95UDqG9FKNjSwvHJtavp4yTKlN?=
 =?us-ascii?Q?QC7P6T7qfMq32qnJD/vlYQtKnpsUwjrwrIYP5YpIfupxqtp34au8fOi0d55v?=
 =?us-ascii?Q?1Sk0b/FuAp2czAt9xbUnSQG9Y++2KqnUDuyq9FlNOt3zhRowwj/CJor6xbBf?=
 =?us-ascii?Q?cwyGijLY08H0I0LEC1aGuAso1RkEBI17xPaI8A99HUWf/UPoAWGBOpI3kI/d?=
 =?us-ascii?Q?YhNEc0m6WZ496ByMfYCtOIb7SCnG6jk27DFVIX9dPdYPvzGn0XgpCUzE0vX3?=
 =?us-ascii?Q?ceKCcNlpZlcJj4JNU+vNNnJmRYwZz0ys5MmDiEVyaQ5HycJ0wH0vmrIlxxUF?=
 =?us-ascii?Q?SgJFanBZCr63a/tYFJ7/uroEEHLO49F9MtdMn3pQaRqlmZRviMGct42j5Nuq?=
 =?us-ascii?Q?2ymE8I2JmnDoOFL3vMhdbQ6vy4o1ApdN9QFgHJyGzBxiL3SKnL/WRrVm9NpD?=
 =?us-ascii?Q?wo6S5AeuUNgG2UCOgLPfPYeSvm5EMR0zDkZwdk01rocSltWP39xKdXMDE2u6?=
 =?us-ascii?Q?gWlBRCxE/YGz1ZaatIg2W5l5GHklVAlseNe0iXMGIHr92hYKAdE0Gvi3NrUS?=
 =?us-ascii?Q?0zaaoM2B59yDUoR4QcRTiSp2VDLC+7lxHbqBkQqxK1mxEhGd9Lxvhc60ITsP?=
 =?us-ascii?Q?VPdORRY+eRpHYZ+Kt1wt2M3YcIUJmqtWXl4q1YPzJ1ZpyQYLo1/19ge2q3kt?=
 =?us-ascii?Q?uebzLi7f8T24brpr+mBgrEw5dGkI0PbLef+wy3f5VNL/FqhkMBeLC0dOA3yH?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a802bec6-ebcf-48bd-7630-08ddb99fcf18
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 19:36:58.2938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDGf64pnJiGhupupAku0kSc+s0dWKjzwEsAPOBiH+6l/EuuLYdAeNcPav9T+p2LIHfnAvSbiwKn7TBjXLFrUJcRVzFrt2r2qH/ZQAZqMAS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4987
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

On Tue, Jul 01, 2025 at 05:35:46PM -0700, Matthew Brost wrote:
> On Mon, Jun 30, 2025 at 09:35:30AM -0700, Matt Roper wrote:
> > Current Intel platforms fall into one of three cases:
> >  * Single tile, single GT (primary)
> >  * Multiple tiles, one GT each (primary)
> >  * Single tile, two GTs (primary+media)
> > 
> > In all three cases, the GTs are always consecutive (0 and 1) and the
> > GT's uapi ID matches its index in the xe_query GT list.  Future
> > platforms could potentially have multiple tiles with multiple GTs each,
> > and/or could introduce new types of GTs.  In either case, it's possible
> > that there might be "holes" in the set of GT IDs returned by the GT
> > query (e.g., 0, 2, 3 if a multi-tile platform only media on the second
> > tile; or 0, 2 if a single-tile platform introduced a new type of GT, but
> > lacked media).
> > 
> 
> I think in the future we may logically remap GTs too for various
> reasons. For this to work, the gt_id returned to user space really just
> needs to be an opaque handle which the KMD can assign whatever value to.
> 
> I haven't looked through this series (or KMD) but it seems like step in
> the right direction for logical remapping, right?

Yeah, although at the moment there's still an assumption that we don't
have GT IDs above 63, since we're relying on a uint64_t bitmask to track
which GTs are/aren't present.  But this series (and the kernel one too)
are eliminating a lot of the assumptions we have today about GT IDs
always being consecutive, GT's always showing up at a specific place in
the uapi query, etc.


Matt

> 
> Matt
> 
> > We need to break IGT's assumption that the uapi ID used to represent a
> > GT always matches its index in the GT query.  This series shouldn't have
> > any functional impact on today's Intel platforms; the goal is to just
> > future-proof the code for new types of platforms that could show up in
> > the future.  Similar refactoring and cleanup is happening on the xe.ko
> > side at https://patchwork.freedesktop.org/series/150192/  although this
> > series does not depend on the kernel work.
> > 
> > 
> > Matt Roper (7):
> >   lib/xe: Track valid GT IDs
> >   lib/xe: Don't assume GT ID matches location in GT query list
> >   lib/xe: Populate vram_size[] and visible_vram_size[] by GT ID
> >   lib/xe: Ensure GT loops iterate over all GTs properly
> >   tests/intel/xe_query: Look up GT reference clock correctly
> >   lib/xe: Add xe_dev_max_gt()
> >   tests/xe: Don't assume max GT ID is num_gt - 1
> > 
> >  lib/xe/xe_query.c        | 78 ++++++++++++++++++++++++++++++----------
> >  lib/xe/xe_query.h        | 10 ++++--
> >  lib/xe/xe_util.c         |  7 ++--
> >  tests/intel/xe_compute.c | 47 ++++++++++++------------
> >  tests/intel/xe_gt_freq.c |  8 ++---
> >  tests/intel/xe_query.c   | 13 +++----
> >  6 files changed, 103 insertions(+), 60 deletions(-)
> > 
> > -- 
> > 2.49.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
