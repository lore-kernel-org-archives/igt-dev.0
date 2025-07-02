Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DFCC8303C
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 21:24:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D48A10E0AD;
	Wed,  2 Jul 2025 21:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dQ72R+cO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C21710E0AD
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 21:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751491446; x=1783027446;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r6NwP7wRbWvi9UhjbldVixybM185oYzF82Eh6HWW7Lo=;
 b=dQ72R+cOJGheQKWgnWT1/mVOsncWhPgANXwFTfQpVDGVFk86u0FhmwnG
 TvhQZAHBv0ZO6b/2Vmx1sje3b5rHd9657mOQ0XJlswDEHN8qq0TsnMrim
 XUf8hDSxlXN6yM1rALmS2vrb/n50F9lRvHGa0dzu2ShfR/CHKaVnzCE5V
 AUycIXFbzZbY+tfqwnpYH6i7m3isvho5H4RMpuaIn/wb+OhHrt682rD8e
 jFg9SirWnIpSenn/aQXRzHRG7an76aDOsR+puzX5QNEZCm4Ow2oVDKjHj
 hm7Np7KZwJryZGrAcd6vOsvRer6+dP5o56TIkc0hbbXomH+xft20LL6kJ g==;
X-CSE-ConnectionGUID: f6G7QMeZTn+8uJmBKGAC4A==
X-CSE-MsgGUID: aqjYZ5eRQleLt3fYsC41BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="41434608"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="41434608"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 14:23:58 -0700
X-CSE-ConnectionGUID: s139xNFiRr63tpeK4ZWT2w==
X-CSE-MsgGUID: oow256hEQ+CAkvkc/8HMJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="153636609"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 14:23:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 14:23:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 14:23:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.62)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 14:23:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UL0KUumB9Qn2KVSHQrtYgtRhRWk+RaJGiIubNq0WSw76n4AX1jy2jyQQFuV5dErVvEU3lEjA54GQSZmrbtGZdTQShvogNXHgU+CQu+f3WhiweAELUm0JokLOO/ChkrfFX3fu8JzhFobhi+MZaGEAHGFs34IO2VcyKP80WU3VVS3iUgyVNsLYn2jbE3Dix+UxRlv3qNGLawEFzZuxLc+8zsDHcKSiZB84DVc/yutFxORMCZWGCLvYyXXNM5veNq72jJoxlVzdo7ZQqO+PuJTQn1JK62s52f/qnKA4SImoY4QBi5uq5HuKKqqcpSVOtJSS9lxaVd5GnZSrqc+4VvzNAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZWJF14FHLueW8ZuZsaFJuT/3Jjibqp0Bu2M57otFhs=;
 b=FrhnsqRTk6BQgnDf7VYNt4mxkiYXjQHrEoeYmrwnijpsHTcWi+rXs7Dr2E8LEiZYIXUH9c5rqkzcGpV/qaarKvVv2bSuPor0DoUeZkdWDNuzy8Hv0i6f9jj5Miay6DBm+28oQlspNuB1g7iO2R9XwQPdcN7Ot2jhBeEnePjZZyPkZZta0bfN4UwtUCVnkVEIM091/JNEvL/l608M/JVW73sKJT3tK7SCio7W74nR4f3QHcaj/LHebC3weaWrF++aRk8KZUgymFnVOuutPw/YPA4YLJosmpG2azvMs1ALRYDQjhtjwfCRmdswxjoiUph55r2S8+B33tf7TLOi1c4vqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6438.namprd11.prod.outlook.com (2603:10b6:930:35::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 2 Jul
 2025 21:23:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 21:23:26 +0000
Date: Wed, 2 Jul 2025 14:25:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 0/7] Future-proof GT ID handling for Xe
Message-ID: <aGWjtCnjlSxN3tP8@lstrano-desk.jf.intel.com>
References: <20250630163529.2096664-9-matthew.d.roper@intel.com>
 <aGR+4iq4QKJBXDrW@lstrano-desk.jf.intel.com>
 <20250702193655.GF1204996@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250702193655.GF1204996@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6438:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d31f4c8-956d-4437-02d6-08ddb9aeaead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eyhLE6nA6UZ/ouciXYvTsvCwaay2P9pZLhno499YsevbusImP49IjjNZlaGM?=
 =?us-ascii?Q?UkHUTFapLFWMT29O2JJC5Qzt8PxgihXpjrBx3fDd2eXuqkTtjKkiEB8xZ211?=
 =?us-ascii?Q?WswSMSNCIkizrrZqgjwvdONnpg1JGWfeBjCWVK60xoKCI2rtcy5+rztmxEPT?=
 =?us-ascii?Q?aL1AdXjFUT88gSKoysIjlGB56reckVj/cumzb4WNddkJtR8vQKMMK44RdMmq?=
 =?us-ascii?Q?OanCw5UrtIYiz41tCr5ks1frYeE9DNq/2Godz24ouPd1Bmn3wnuCpc5v/lUK?=
 =?us-ascii?Q?8H7hMmAkJBfjIjEkfl8WQ3k2DmQTrBQ8vKWB10UaPVfCvgmYHjTjL8MfWXyF?=
 =?us-ascii?Q?Zkbe2u7k+RKMV7Mjevl5syy22qBoPc6l3tuQ9nxks3erD2EBPY0SjWXKuY3z?=
 =?us-ascii?Q?LVoxHuNp7AGAuAa5K3Tcs6yfBnlLVwpsUlNfh5YsOguMk8qNwfN/3W++jAQj?=
 =?us-ascii?Q?nRC4ypqzpwtT0WumGqrN2bAf3df+Fci7MsuoogMea7+chdp98cYxnCWrbSiI?=
 =?us-ascii?Q?2M9DU5+XdeJvZPUTzxtsu+pwP0lXkMCumJ38dGlyEu3fjgNiN20lFtQYtSI9?=
 =?us-ascii?Q?62gFDgnXAocQhGTzG0EyQpVhkdHHPQvylmtn2xGP93yJk/+k6qgoHPuQ6AiQ?=
 =?us-ascii?Q?xVGSR8/72JU9FjTM2IJwGGeKSpD9U1nDQMYytt+aFLmhQbEkTfgVAvfJ5izL?=
 =?us-ascii?Q?ivzQGQ7AX+kPbAWUklAJtOzmZxzvG2ZfPkU4hn7k1ASWw3v0PQwqsoGhrzUH?=
 =?us-ascii?Q?r4Gk7mPISSjFsGdZkyBz6TVvQckRM+j1orWlLY96ioUsglfV/YjaNYkZGAfc?=
 =?us-ascii?Q?FMXqxVaUY3nz3vaaS23durfebA5K1f/5Z/b+KfXEC8BMmrmrVKjhrsaG92BI?=
 =?us-ascii?Q?tBEnOK0bW96iTFiXini/2bbRSdmHw2EwNCJU8twrz9X0ZR4G9/332IahsuLy?=
 =?us-ascii?Q?8t4xtbr8o0pscFfiqPQLfIvs85UWquOUaSaHIXF31imJYEirtUSM8kCUDc6/?=
 =?us-ascii?Q?XBm1m+SZrrOjxE9BHTjgj3h9IAr462x+15L9PBNCXkyA+VQMLGNa0wZKQl69?=
 =?us-ascii?Q?APnf9c6hxCx2416mgIBoYraW5ccY9Z5l974eLjToR6Np41SGW+tv4H8Y3vMF?=
 =?us-ascii?Q?H3MoZxYQF76P58dE/JAOYR9+ltkG4zvBPEl7QPbk3eBGl88iL7C4jr+USo63?=
 =?us-ascii?Q?vSSP7FWbauMq8NMQGlAw61VDfDvE4VdA6l+jo2uaI2o6VAeKQxSXJN/iu+mw?=
 =?us-ascii?Q?9rXXGN9IjiJzAsOp0nCvS/AC8A0aUd5J2ei/qtJufh6+Moe8ufatWQV5lMdB?=
 =?us-ascii?Q?+9Jn4Hy8BPYK13ANEoSvWyTi0pDKRyfENAr8tMkSSjcwH/CO7Zp6Th3P52NU?=
 =?us-ascii?Q?BQo1hIU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1Zu3vljTdR7VbCv0i7hid2ZtrfbNJQV2rdx1r7RnEUyj1D2Ej4EKt8DJXc/x?=
 =?us-ascii?Q?MD2CXb6vm3+ihDxwE0i682tlNau7RPaj/VOv1kbAayOoIysvfK9Op46316o4?=
 =?us-ascii?Q?o05lnhYdB3l3jcEewU7mSu8KEXFAw0zujK0ZxYMJ5jfN5XJ5qTeh41mLAR+Y?=
 =?us-ascii?Q?BFvQQ504R4uiwCbPO7HhniLwm6dN9/2RwNdH1fk3G+FMDdY0WxVgT5aeJv8B?=
 =?us-ascii?Q?dWjNcxCPRj7bXZmgSIn96Sfw/uHeuzXkCSLqD/dt3pTVoBxlwKoqHox20R/g?=
 =?us-ascii?Q?AeGKg/GuwGIUDsS3IdUkrJbb0ZcvekQPkrGYftYOz8j6fvVqZXNtzK+J9TwO?=
 =?us-ascii?Q?G699j+jNBInEW4w/oWPi6erHS7XQBar7HoVgKWyo853T/I4sxkyLAfR6aBHX?=
 =?us-ascii?Q?58y6CcOouxBW+bpAGlyZ9iC42dGVzGgYvK3Yekckq2ubZdF9fLn4SDRdi23G?=
 =?us-ascii?Q?C0sye9tb1b8Fp568rx8mjPTcchXGBCT/coc+O1gCfMjcacmwxWS1jb5J7Aew?=
 =?us-ascii?Q?5pt/4ETiJmei8Xn2OmuBLPqWWdVpJdFVZbU6LuITWyYRgR7Vub57XoUPl9FC?=
 =?us-ascii?Q?313RF6KsfvEcHcYF35n8i2W2wIA0vY9/rTfL0291QTzZ0oS31KVburl8Usbq?=
 =?us-ascii?Q?7bIZILRSMY4bPV9nVDwtqHpyZhcPRgXxOOPz2t/pnDAOlTUyw/QJEUnu1eqv?=
 =?us-ascii?Q?MyIW///Mz8XF30I2i2yqECy/AwYwDrnfzcPDq2vnN+bYeXtv52Y6IZ+fusfp?=
 =?us-ascii?Q?R4w06A5KiNUVExb+4BpatTaiBqNLmBOnBB6oQ11qCHIOqH3MuImdNF5Tr727?=
 =?us-ascii?Q?GxsSEJ8PMWdrAeDl+xENQlhqCizMJITX/0Orb1SG8AvbdiRaLBTkloDZdiwE?=
 =?us-ascii?Q?vW99KU/nivey4fA2r90aTOQTxH2eBwTLggf2ikyuS+oqNSO6D9TBWM4mdOmn?=
 =?us-ascii?Q?lnCFVMom3logIG0kP6hyXF+5xaKwZv8bvPryN91QIi4m/w6Wchk3kyKvlzYw?=
 =?us-ascii?Q?RPmsAyPTSklk9yAOsHK4r1UMy1R7/j+qXR5HYQetwKa5rGMXbj8P2ho/2Aay?=
 =?us-ascii?Q?9JdvIrhJU1s5fwDer88C0gVVxNzqTVt69XgRDqy28wI1B8ThADPj+9NkIiVv?=
 =?us-ascii?Q?Gi3sw+CMZ/1emA03PnABTIpLx5OpZI3uN3sQUYF12v7Y/4tL2/4ciw0LFciS?=
 =?us-ascii?Q?7kmERTs/cfjcuHiL4kzGeNHXKFH7L2PneKbzsSSlTDQWaLLi0BlRkEReoYPe?=
 =?us-ascii?Q?aR6yKXzPRJX7KwNogq+DLGM3C9HO3DaYyLjDrDxT2u4/e1yl37lk8Z+00+Va?=
 =?us-ascii?Q?mEJH1Ja3lZoSwszmzQI4lcAQ7rZGKoQZdYSb6x/l6tMHj0HkT1/ICfjDHQDT?=
 =?us-ascii?Q?SgWCtU5+v4aL8Yd4eBasNbU87C/5AWrvav0vq+92//u/EP3XmY9WsMdnAG/0?=
 =?us-ascii?Q?oeTyQNWtXSJnsNvyJwgizsFhTqdSVeS6x4TKSliTiHchIkJ4ZdVJ+woSAzki?=
 =?us-ascii?Q?GECc4X8X6Xx08WcTDJStLvZPlII1K5uhECl4y7PAlRYfWxcYYCRD3UCOaJ3t?=
 =?us-ascii?Q?3xVKpIrA8ok8qUhEPwcEIUWupYGy9HeruPzA6s2b8c012TcelJE54fRGTDlR?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d31f4c8-956d-4437-02d6-08ddb9aeaead
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 21:23:26.4871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ktFQl0+nSRg92baFWpXvKJ6MEETYBA9iNIe9ulAKlE38pKkyxvxQCLXdBw9KR4rRq25wxVpIZ6KO1q31DVFMbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6438
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

On Wed, Jul 02, 2025 at 12:36:55PM -0700, Matt Roper wrote:
> On Tue, Jul 01, 2025 at 05:35:46PM -0700, Matthew Brost wrote:
> > On Mon, Jun 30, 2025 at 09:35:30AM -0700, Matt Roper wrote:
> > > Current Intel platforms fall into one of three cases:
> > >  * Single tile, single GT (primary)
> > >  * Multiple tiles, one GT each (primary)
> > >  * Single tile, two GTs (primary+media)
> > > 
> > > In all three cases, the GTs are always consecutive (0 and 1) and the
> > > GT's uapi ID matches its index in the xe_query GT list.  Future
> > > platforms could potentially have multiple tiles with multiple GTs each,
> > > and/or could introduce new types of GTs.  In either case, it's possible
> > > that there might be "holes" in the set of GT IDs returned by the GT
> > > query (e.g., 0, 2, 3 if a multi-tile platform only media on the second
> > > tile; or 0, 2 if a single-tile platform introduced a new type of GT, but
> > > lacked media).
> > > 
> > 
> > I think in the future we may logically remap GTs too for various
> > reasons. For this to work, the gt_id returned to user space really just
> > needs to be an opaque handle which the KMD can assign whatever value to.
> > 
> > I haven't looked through this series (or KMD) but it seems like step in
> > the right direction for logical remapping, right?
> 
> Yeah, although at the moment there's still an assumption that we don't
> have GT IDs above 63, since we're relying on a uint64_t bitmask to track

I don't think anytime soon we will need a GT ID above 63.

> which GTs are/aren't present.  But this series (and the kernel one too)
> are eliminating a lot of the assumptions we have today about GT IDs
> always being consecutive, GT's always showing up at a specific place in
> the uapi query, etc.
> 

Great. I was asked potential logical remapping for some future scaling
cases, thought it was doable but we'd have to do a bit of KMD / IGT
work. I guess I'll take a deep look at these patches.

Matt

> 
> Matt
> 
> > 
> > Matt
> > 
> > > We need to break IGT's assumption that the uapi ID used to represent a
> > > GT always matches its index in the GT query.  This series shouldn't have
> > > any functional impact on today's Intel platforms; the goal is to just
> > > future-proof the code for new types of platforms that could show up in
> > > the future.  Similar refactoring and cleanup is happening on the xe.ko
> > > side at https://patchwork.freedesktop.org/series/150192/  although this
> > > series does not depend on the kernel work.
> > > 
> > > 
> > > Matt Roper (7):
> > >   lib/xe: Track valid GT IDs
> > >   lib/xe: Don't assume GT ID matches location in GT query list
> > >   lib/xe: Populate vram_size[] and visible_vram_size[] by GT ID
> > >   lib/xe: Ensure GT loops iterate over all GTs properly
> > >   tests/intel/xe_query: Look up GT reference clock correctly
> > >   lib/xe: Add xe_dev_max_gt()
> > >   tests/xe: Don't assume max GT ID is num_gt - 1
> > > 
> > >  lib/xe/xe_query.c        | 78 ++++++++++++++++++++++++++++++----------
> > >  lib/xe/xe_query.h        | 10 ++++--
> > >  lib/xe/xe_util.c         |  7 ++--
> > >  tests/intel/xe_compute.c | 47 ++++++++++++------------
> > >  tests/intel/xe_gt_freq.c |  8 ++---
> > >  tests/intel/xe_query.c   | 13 +++----
> > >  6 files changed, 103 insertions(+), 60 deletions(-)
> > > 
> > > -- 
> > > 2.49.0
> > > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
