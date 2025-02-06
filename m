Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A4BC0219B
	for <igt-dev@archiver.kernel.org>; Thu,  6 Feb 2025 19:44:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD0210E30C;
	Thu,  6 Feb 2025 19:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jizZQXSK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398F510E30C
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Feb 2025 19:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738871094; x=1770407094;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Jh8+5EaFhy9sRe0lJKZHegHaRl8Vuk6nq/ijEg5nc4U=;
 b=jizZQXSKdWH2rr/JPjWnU4HOv5LZPviZ/Awdo1yFOj/9Xq6fUa1Xxu0k
 TuHiQ/QCwfQUrHM1igb9nuLZ8tOq7rJy5omLEUTPUAtXebPDvBSqCnX7n
 ejyOn6idE0NYnu517IDyp0dK0fR4k+3NShTMH+FFjI8mysW8PmTyhWjQR
 TZNMFy6cgBSf6ZSKCpXO7AUVlBThvnFy0T/sm+Qf5L9Vh6U8dO8oGpDAS
 MXuKJttHNTtcTMZJizcQLGb7ohRBLamg7cUdVGiaJ4pE9WH/iL5v9NOoJ
 FQE1raNQJwcHRl3wbU9Osrzde+ZBdr6S3XWQEFdwN7/f7JPU3dsRgcg2M w==;
X-CSE-ConnectionGUID: mMBHygSLRrKOprRaWu3X5A==
X-CSE-MsgGUID: wH8dM32+SdeDYeAc3Q0JRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27102666"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="27102666"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 11:44:53 -0800
X-CSE-ConnectionGUID: zb7RRPBhT0mnggpbbn4UBw==
X-CSE-MsgGUID: bp3MWhljQUiyUPgCUwW3Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="116251052"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 11:44:53 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 11:44:52 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 11:44:52 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 11:44:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dlr4yBR4dOFA8pQ+gRCndzrdtBPE/sDDZfQB/opht0nqprlNy9Mvz+i8P1ZoCkYod5UGOiBkTSN+BbchoUmw9WR2zOM6waRt1mqTy/ApMALTVJKpiWqr/RsJhmX4UOF93MCRoq5VBxgWN1gXXBNkfynJgYkWJpzTx//YzZwihDTlC7UZcycZCkzv86t5x8IdJm+nwOoNsNSxJFImOtckv6riMcDniC2pCTJ8b2W3fj+HraxXLF7t6TDPAwOndrCEAC9Mov2usUX0rTH6YTVQxOftDfdItLzRs3b8m7dHbYh7DCNIoHDL04C4iDZBxN6e2cwrlyy528RS8RzTuFewGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72tB/KzGOTVsakUmW6OfBPrnfoaeTby5tO+atotOqSA=;
 b=HeGY/gqrIo6uHnFuh52FzdpSaWgMZbu4t10pgpn3cFzx5YfWxGijWB6lDh7dNJUkqPfE9O2z5ow0ovS/W3C979fklImnU2sEdovzDxwZCr4SUqTn0gOxE9jJIfOBWz8RgZ2+sC08OX0215hJ9u4FAq1Ca+imjNGtnTbvtSttj6qCJ4dDvqIZpcS8UMTybc6pizH/fFElXtWzytyfiEp5juBS5ReUlyBozcuikBIfSnT48TKgm0u4vEVRJTJ3OQGS6ScWVLfZJz0YumN68Wf8oNq/6IfElWTqrNe49gpymvV8p0MARi6N8tPfMtAZ6UPX9J0WMLb9o/iYmlOXoFinBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6454.namprd11.prod.outlook.com (2603:10b6:8:b8::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.24; Thu, 6 Feb 2025 19:44:50 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8398.021; Thu, 6 Feb 2025
 19:44:50 +0000
Date: Thu, 6 Feb 2025 11:44:47 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Matt Atwood <matthew.s.atwood@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] lib/pciids: Sync pci id changes for DG2/MTL/BMG/PTL
Message-ID: <20250206194447.GM4460@mdroper-desk1.amr.corp.intel.com>
References: <20250204175302.18147-1-matthew.s.atwood@intel.com>
 <20250205233055.GV5109@mdroper-desk1.amr.corp.intel.com>
 <Z6TsGM6LD26qIcRY@msatwood-mobl>
 <20250206180113.GL4460@mdroper-desk1.amr.corp.intel.com>
 <Z6UMzbDHC9vMPRI2@msatwood-mobl> <Z6UPA-zaG1AwWAlX@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z6UPA-zaG1AwWAlX@intel.com>
X-ClientProxiedBy: SJ0PR13CA0233.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: 98db7670-774a-47dc-150a-08dd46e6b7ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ke7t8ZDPbypqc7h7i+OI+EVnTJsy5vuUUIaAxPXLrZ4emisCZAOvwd9MtwWR?=
 =?us-ascii?Q?m8zZf+9990FaiAP5R091/IMLA4BokiWFRRE0swL0zZF8UQTfGUTD762zldxV?=
 =?us-ascii?Q?WQ9JY/TFMS5b0UFsj/qDHyXSoIHNYcEubJig1CeunQAPDq2wJeZx64kARHRQ?=
 =?us-ascii?Q?OygQRp+raHH3iWOtJadknXZ2X/rB5VaKpLRi/cuAYQczlnoynxmjK2XVUeIv?=
 =?us-ascii?Q?r1YHEdqEDb6TwFZIHmeRq5suwvQu4AVEXqMyQTdZMDtKa3qT9Rx20Vfv6hP0?=
 =?us-ascii?Q?Px8gOT6gIC9K24NwuQKwyjuIPEfLPweQhnERjAklTMBFwMv6TLrvDvUWVngj?=
 =?us-ascii?Q?kqCpsdV+rnqUSAruvz+dNu4iKy/80CPnhLV39xkvQoYV7uyHnU7RgywlRpTz?=
 =?us-ascii?Q?XIsI1EReAeymA5NrKS9hKCdh1xM23sS2sVRPtmVOtir8NfLA1Yq+DOeXGzwM?=
 =?us-ascii?Q?27WrJ/xQyv8XWFgTYjgFA3tvqSQ/GBBAPqlm2VYL1Fosy97lCbfAR+jVDRgX?=
 =?us-ascii?Q?PbXr8D5buM2gqL1kHnuO+l6ZyS3PCnFSuRW4lRp0O8Z3HwA+NNb8L8mUc0IC?=
 =?us-ascii?Q?lxgZEbN9S7sM/W6CI9JLzDlg2RZh/wjDOTKW6Ke07C4F9lkpDRVMsR5SWs9g?=
 =?us-ascii?Q?dSbF6rUYL7dcfx+aPm1yuJEoTxnsHIcjDQXLngTGW1BUBg+N34RtKBJyY5ic?=
 =?us-ascii?Q?KFw+iyaun0z6kXVC6IhmfMD+FCobNHIB3tiW3PjdVH/VnAftigc9Wy57GvrZ?=
 =?us-ascii?Q?WyLs8G7La6YbcGrQnov+W19towuBDz73AYyEXSA4hH/K+JbwOlPnCIKhS00G?=
 =?us-ascii?Q?YK3JERzYNrIFeFVx2RzlT5nJcBgWALw9pnghzLuJbT/gv5kZHRbX0Wqx/oC5?=
 =?us-ascii?Q?p0jW51Hck9IPWbbN3YQI1w0ckkJMQ6PIHr4tnZ+VCKppCH1Ywo5Ki6VerEtT?=
 =?us-ascii?Q?gDMPM6yS8dMVUWi4DVDhkmlxvYosH9uqfC5N3K4H25rZ+FBY8lng1SqFzPDw?=
 =?us-ascii?Q?l9R3XGwyZMalxHYrAM4VTShk9sl9hO2dmYwvX9X0kMIIexitMWKu3R4pFvNQ?=
 =?us-ascii?Q?3NwMIziYx+qfYy98K5aBufqBitAISVX0afAS6Ka/lb+ZiPK1bHyMVNCNx/Ed?=
 =?us-ascii?Q?xkxGOeQz5xTsnsbfnmXP/fBVE5g1tI7GjRzAbCHFvjR5D6sDIgGtUZIpTJEE?=
 =?us-ascii?Q?LYYPRhkXqBHArGFs9e+kHuLU/v6QgPTKXURuTBPNLrIDMTkAD9IVlNIeULVT?=
 =?us-ascii?Q?CFJctaZ/YvcXNjujpyJ8yTjVJ+Jvc2eAEjsgPITNOB0hKMfx9W2jal30+Wjq?=
 =?us-ascii?Q?5naSxDItlYNJTiTa8SHTZHuuCwblXoCBQ9tasmLsipD/35WXc4gN81a3DGol?=
 =?us-ascii?Q?eUyMLNXJ57MXhiy56Agc1TEdAysB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EHj5Ub/kY3d/s0tKYooO5dDmpb4KdMt4gRi01rIC73dDqrxEQa+l639+mbQg?=
 =?us-ascii?Q?TfAn3Lsg8dTSz+vWNiJijS5WfWemF6hao60Ts48LKdPR7VYMW0Q/WAKns6wY?=
 =?us-ascii?Q?j5cuVlePzAlaPnTqfW2dNul3xmclJa15I3ortOB6peFVwLa9gCLsogkdUewk?=
 =?us-ascii?Q?AOjJYGSocikgC50tZPHHe8Xfu1Fess9s8lFVBFL0jyb4EPjXTc2FG+7X4ly0?=
 =?us-ascii?Q?1S+zw8fqfH2j7vkK20/wL/XbsdrEV8u978D+C1+vhfm10/X0fM+fHbxbY5SO?=
 =?us-ascii?Q?mpS5RYh/HosMQ50VjLNcY6+HYWpCcYeqyUSO3gNSIUFr9B3N9vIfUBMsAT1H?=
 =?us-ascii?Q?cX1bp7kRGkwnADWfaYsdN+I/VdtOofsC5fxaFzX12wwHS0RZk1gceADF9iIH?=
 =?us-ascii?Q?m+tTP+Y3gZAqpAVYBscN1Ebe2kQCYEHiuZ6639HBV1o0LxGIfMuqz9SCupfd?=
 =?us-ascii?Q?4dJGwBHQ1L+hnntRT8phpSj7AuxRDVwrucGBjlG5kSUDAD9AMFzeW2xXJpB9?=
 =?us-ascii?Q?2qbbhEyLxPewDeE9Q5EVhc5a2JJZCawlBQue0ZtfhVsA2jUvozrCggGy/nzt?=
 =?us-ascii?Q?NGYoORTD28z4LPV+Oyw0kdvchyG9gDN27W+u/3oRIe9jbs5m20xdM1C0JVLS?=
 =?us-ascii?Q?O/Bt1zo08iGJkp/TkJlujoMG6Bqiu7tQjXgFD/+rHVRKIXvJiaWK8+2HhvAA?=
 =?us-ascii?Q?aCuouXXGaKChzjWxKFTFlnGe12LqXv3L7G5bjCtfGV8QUyW5RFPREaq85CcK?=
 =?us-ascii?Q?T30hNg++6JrMGa0OGjn250VgeVkplEFuzlJ/nSTQaxayvl2N/cmx/ThKgNNR?=
 =?us-ascii?Q?dnMsfIDQWg1/6tM/3ncFB6S/3KaALJUUqQ2v6QGwJcaBVhu0D+Acyxh4QRQT?=
 =?us-ascii?Q?ebX8lJ+UthwuyM7pLDy6QvDuX3p2lAXxKPyRG1RtUrDrnmym3kRv9OSOrFm6?=
 =?us-ascii?Q?JA3AepGym8KrQkKyfztUdaKHsnCABojrXc9DTbcOlOiU705L7b89nLe8eWRS?=
 =?us-ascii?Q?3vjE+YUIsUw0/RSwTpds2ZGU8koR1in6npY0Ckf3oJ3Eq0PNE6Rq8R3UIrVQ?=
 =?us-ascii?Q?hQVpVs+T1+INFPDjqozy3W+Z8TzXk+ng5SD7ARvqMhM+1huEfoGXVl+6bRW2?=
 =?us-ascii?Q?uPAOXwGzIuf8TVvVMSgwZt2UYpKiBqu3qLcXnjzuHd0dzpKVEgy063h981T1?=
 =?us-ascii?Q?RSqBhgFDQb+b0R8C4VvsF/sJX9tsWvDs0YLEdzg77qLu/eZm2t4/m+o+uU3k?=
 =?us-ascii?Q?TC0eDSY7Ob1pA6cUjEPEGb5ABj4PE/XlyIss2CRp3pqWKxEQFCrt6uA+g+bU?=
 =?us-ascii?Q?ZvF3mysLKpHbLH0itmLUVLUfFOQzCrDcgqhsg0Sahdka0YPiZLuWv12IvS3o?=
 =?us-ascii?Q?j8h2A4piW1QP4ma9VRUJ1Gt9/NrTDIajikLzMcl62oL+m1jxck5gSnDc2Qj1?=
 =?us-ascii?Q?q8fNuFFzCHS/hXzjbMOQI8c3drP4MQf876LRX74c7AM1ym3c64vO+yaNel0s?=
 =?us-ascii?Q?8oBrl36Owj2iwX7SvqMybQzM2NM0AbxpiHzGbhjrvdmdRE4S2djweneboQZl?=
 =?us-ascii?Q?Lf8dvWJWAECvWi6wFMIXTmJrpV97/Ne5iCtPYg396J4n3foBhSgPHqtppk7Y?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98db7670-774a-47dc-150a-08dd46e6b7ff
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 19:44:50.1329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j36fK7O7CGv9u3Q3Bcul3O7XX+90sclU4nKG3u23z9WaEC62kConmDoVUUg4ATkx0KnEmNrqD+w/dmzJXhHPnzbnznlUT6DBVz/hFjA1kW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6454
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

On Thu, Feb 06, 2025 at 02:35:31PM -0500, Rodrigo Vivi wrote:
> On Thu, Feb 06, 2025 at 11:26:05AM -0800, Matt Atwood wrote:
> > On Thu, Feb 06, 2025 at 10:01:13AM -0800, Matt Roper wrote:
> > > On Thu, Feb 06, 2025 at 09:06:32AM -0800, Matt Atwood wrote:
> > > > On Wed, Feb 05, 2025 at 03:30:55PM -0800, Matt Roper wrote:
> > > > > On Tue, Feb 04, 2025 at 09:53:02AM -0800, Matt Atwood wrote:
> > > > > > There have been several changes to pciids upstream that need to be
> > > > > > sync'd into igt.
> > > > > > 
> > > > > > Sync with the following kernel commits:
> > > > > > f9a15b968dce ("drm/intel/pciids: Refactor DG2 PCI IDs into segment
> > > > > > ranges")
> > > > > > e35ecd95ecf2 ("drm/i915/display: Add MTL subplatforms definition")
> > > > > > fa8ffaae1b15 ("drm/xe/bmg: Add new PCI IDs")
> > > > > > 16016ade13f6 ("drm/xe/ptl: Update the PTL pci id table")
> > > > > 
> > > > > The updates below look correct (they match the kernel header), but the
> > > > > commit message here is confusing.  IGT updates to this file generally
> > > > > specify which actual kernel commit you're synchronizing against; none of
> > > > > the four listed above match the content you've copied here because there
> > > > > are additional changes not present in those.
> > > > Because there are now several out of sync next branches, saying as
> > > > of this commit idea was not working. Hence this approach.
> > > 
> > > You should generally be syncing with drm-next after things land there.
> > > So which drm-next commit are you syncing with for this commit?
> > They hadnt been in a drm-next commit yet. At the time it was just after
> > a next cut, at this point we can probably just wait for them to land.
> 
> I agree with Atwood here. We had changes coming from drm-intel-next
> and changes coming to drm-xe-next. In the kernel history the changes
> coming from drm-xe-next are on top of the drm-intel-next ones. But
> they landed first here in the IGT.
> 
> Now it is in a situation that individual patches from drm-intel-next
> would conflict here badly. The safest thing is to keep it simple and
> use a single patch like this.
> 
> This is the final copy of the file directly with the proper mention
> to the commit ids. I really believe we should just go ahead and push
> this to finalize the alignment before something else gets in the way.

But in that case we should be explain what we're actually doing in the
commit message.  I.e., we're *not* synchronizing IGT with a kernel
commit like we usually do.  Instead we're manually rolling up individual
changes from various kernel branches before they propagate into
drm-next.

As I said before, the actual patch is fine; we just need to fix the
commit message to more accurately reflect what's happening, especially
since it's not how we usually handle things in IGT.


Matt

> 
> > 
> > MattA
> > > 
> > > 
> > > Matt
> > > 
> > > > 
> > > > MattA
> > > > > 
> > > > > 
> > > > > Matt
> > > > > 
> > > > > > 
> > > > > > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > > > > > ---
> > > > > >  lib/pciids.h | 62 +++++++++++++++++++++++++++++++++++++++-------------
> > > > > >  1 file changed, 47 insertions(+), 15 deletions(-)
> > > > > > 
> > > > > > diff --git a/lib/pciids.h b/lib/pciids.h
> > > > > > index 23f349f65..4736ea525 100644
> > > > > > --- a/lib/pciids.h
> > > > > > +++ b/lib/pciids.h
> > > > > > @@ -717,37 +717,66 @@
> > > > > >  	MACRO__(0xA7AB, ## __VA_ARGS__)
> > > > > >  
> > > > > >  /* DG2 */
> > > > > > -#define INTEL_DG2_G10_IDS(MACRO__, ...) \
> > > > > > -	MACRO__(0x5690, ## __VA_ARGS__), \
> > > > > > -	MACRO__(0x5691, ## __VA_ARGS__), \
> > > > > > -	MACRO__(0x5692, ## __VA_ARGS__), \
> > > > > > +#define INTEL_DG2_G10_D_IDS(MACRO__, ...) \
> > > > > >  	MACRO__(0x56A0, ## __VA_ARGS__), \
> > > > > >  	MACRO__(0x56A1, ## __VA_ARGS__), \
> > > > > > -	MACRO__(0x56A2, ## __VA_ARGS__), \
> > > > > > +	MACRO__(0x56A2, ## __VA_ARGS__)
> > > > > > +
> > > > > > +#define INTEL_DG2_G10_E_IDS(MACRO__, ...) \
> > > > > >  	MACRO__(0x56BE, ## __VA_ARGS__), \
> > > > > >  	MACRO__(0x56BF, ## __VA_ARGS__)
> > > > > >  
> > > > > > -#define INTEL_DG2_G11_IDS(MACRO__, ...) \
> > > > > > -	MACRO__(0x5693, ## __VA_ARGS__), \
> > > > > > -	MACRO__(0x5694, ## __VA_ARGS__), \
> > > > > > -	MACRO__(0x5695, ## __VA_ARGS__), \
> > > > > > +#define INTEL_DG2_G10_M_IDS(MACRO__, ...) \
> > > > > > +	MACRO__(0x5690, ## __VA_ARGS__), \
> > > > > > +	MACRO__(0x5691, ## __VA_ARGS__), \
> > > > > > +	MACRO__(0x5692, ## __VA_ARGS__)
> > > > > > +
> > > > > > +#define INTEL_DG2_G10_IDS(MACRO__, ...) \
> > > > > > +	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > > +	INTEL_DG2_G10_E_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > > +	INTEL_DG2_G10_M_IDS(MACRO__, ## __VA_ARGS__)
> > > > > > +
> > > > > > +#define INTEL_DG2_G11_D_IDS(MACRO__, ...) \
> > > > > >  	MACRO__(0x56A5, ## __VA_ARGS__), \
> > > > > >  	MACRO__(0x56A6, ## __VA_ARGS__), \
> > > > > >  	MACRO__(0x56B0, ## __VA_ARGS__), \
> > > > > > -	MACRO__(0x56B1, ## __VA_ARGS__), \
> > > > > > +	MACRO__(0x56B1, ## __VA_ARGS__)
> > > > > > +
> > > > > > +#define INTEL_DG2_G11_E_IDS(MACRO__, ...) \
> > > > > >  	MACRO__(0x56BA, ## __VA_ARGS__), \
> > > > > >  	MACRO__(0x56BB, ## __VA_ARGS__), \
> > > > > >  	MACRO__(0x56BC, ## __VA_ARGS__), \
> > > > > >  	MACRO__(0x56BD, ## __VA_ARGS__)
> > > > > >  
> > > > > > -#define INTEL_DG2_G12_IDS(MACRO__, ...) \
> > > > > > -	MACRO__(0x5696, ## __VA_ARGS__), \
> > > > > > -	MACRO__(0x5697, ## __VA_ARGS__), \
> > > > > > +#define INTEL_DG2_G11_M_IDS(MACRO__, ...) \
> > > > > > +	MACRO__(0x5693, ## __VA_ARGS__), \
> > > > > > +	MACRO__(0x5694, ## __VA_ARGS__), \
> > > > > > +	MACRO__(0x5695, ## __VA_ARGS__)
> > > > > > +
> > > > > > +#define INTEL_DG2_G11_IDS(MACRO__, ...) \
> > > > > > +	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > > +	INTEL_DG2_G11_E_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > > +	INTEL_DG2_G11_M_IDS(MACRO__, ## __VA_ARGS__)
> > > > > > +
> > > > > > +#define INTEL_DG2_G12_D_IDS(MACRO__, ...) \
> > > > > >  	MACRO__(0x56A3, ## __VA_ARGS__), \
> > > > > >  	MACRO__(0x56A4, ## __VA_ARGS__), \
> > > > > >  	MACRO__(0x56B2, ## __VA_ARGS__), \
> > > > > >  	MACRO__(0x56B3, ## __VA_ARGS__)
> > > > > >  
> > > > > > +#define INTEL_DG2_G12_M_IDS(MACRO__, ...) \
> > > > > > +	MACRO__(0x5696, ## __VA_ARGS__), \
> > > > > > +	MACRO__(0x5697, ## __VA_ARGS__)
> > > > > > +
> > > > > > +#define INTEL_DG2_G12_IDS(MACRO__, ...) \
> > > > > > +	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > > +	INTEL_DG2_G12_M_IDS(MACRO__, ## __VA_ARGS__)
> > > > > > +
> > > > > > +#define INTEL_DG2_D_IDS(MACRO__, ...) \
> > > > > > +	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > > +	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > > +	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__)
> > > > > > +
> > > > > >  #define INTEL_DG2_IDS(MACRO__, ...) \
> > > > > >  	INTEL_DG2_G10_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > >  	INTEL_DG2_G11_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > > @@ -782,9 +811,12 @@
> > > > > >  	INTEL_ARL_S_IDS(MACRO__, ## __VA_ARGS__)
> > > > > >  
> > > > > >  /* MTL */
> > > > > > -#define INTEL_MTL_IDS(MACRO__, ...) \
> > > > > > +#define INTEL_MTL_U_IDS(MACRO__, ...) \
> > > > > >  	MACRO__(0x7D40, ## __VA_ARGS__), \
> > > > > > -	MACRO__(0x7D45, ## __VA_ARGS__), \
> > > > > > +	MACRO__(0x7D45, ## __VA_ARGS__)
> > > > > > +
> > > > > > +#define INTEL_MTL_IDS(MACRO__, ...) \
> > > > > > +	INTEL_MTL_U_IDS(MACRO__, ## __VA_ARGS__), \
> > > > > >  	MACRO__(0x7D55, ## __VA_ARGS__), \
> > > > > >  	MACRO__(0x7D60, ## __VA_ARGS__), \
> > > > > >  	MACRO__(0x7DD5, ## __VA_ARGS__)
> > > > > > -- 
> > > > > > 2.45.0
> > > > > > 
> > > > > 
> > > > > -- 
> > > > > Matt Roper
> > > > > Graphics Software Engineer
> > > > > Linux GPU Platform Enablement
> > > > > Intel Corporation
> > > 
> > > -- 
> > > Matt Roper
> > > Graphics Software Engineer
> > > Linux GPU Platform Enablement
> > > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
