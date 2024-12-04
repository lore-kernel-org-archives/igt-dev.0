Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2587E77160
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 00:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B01610E28A;
	Wed,  4 Dec 2024 00:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k2Xjr2DI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA2F810E28A
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2024 00:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733270446; x=1764806446;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QldVutbWPpJ57JonhcChFLxba45J7a6V0mAAA4YDObY=;
 b=k2Xjr2DIwZnEvScneCmVeH1pchDo4kSx5BfL8rcuXFBvR4ABuBeXDgEs
 hb9aG7rnljiso01kh13eAwpui5klLSVAAmn6XsVAqy2UZ+pubt4UR5kUd
 pecPP2ipjrc8MKRzrmHz3NZzG1NJlDehtTTFvt+oOwyY9TBRsC+c25OV4
 6tYGNhn3FmuaYS7G0yD8VHHk7QXsjNyQtScAOj7ampe09vh30QnqwV85u
 wpa/t0/ymxPKWevcyODz17G1NZAaPNcprfeVx7CuF1I+qHVwSFFvFc/8v
 w/l6PDlDnzer1Lg5i/zFUKKT18ZAHSR3CAEJfY4c00H0trwEDVJ/78JgG A==;
X-CSE-ConnectionGUID: a3yo/6YwQUqiicKrAw/saA==
X-CSE-MsgGUID: u0pf25eWSR2sPpssv+osUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33645959"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; d="scan'208";a="33645959"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 16:00:46 -0800
X-CSE-ConnectionGUID: bn1nNcC/Tq+5GA5F7LuMqA==
X-CSE-MsgGUID: fwhxfyEWRfmNwAgbId9VQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; d="scan'208";a="93451106"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Dec 2024 16:00:45 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 16:00:45 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 16:00:45 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 16:00:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rxc40m1wOB+Q6DTMl7ikCDqJD3bxF4vSaVz+bkdecyalwWXxyNgUWrBYHh5z/aWNgPwKhkGTy/SEYpjN9A7N4gOkOIkQ8qh8BV2+RarHdNs6LvLrkB7f5rznYtFjJ8yfx5wo+UCeQ5tY2EpjHiIEv6nfNX4U4suaoG7LNNEcmixwB1ZSLSxHaeMEjzD6QyorA7BqzkerHms56D+CKAnrqSxtCxkuBtOCY8MC59LVAx1uR2uURrVGUbfm4R5AtlmHX8R2hh5sI4K5QcnbnLH1eYHqitDVUcf50rhC7TlXSHFzOxrBCc/6deGHuVQtkvzbbVABC0wwkwVgT+D5ie1weg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hLxAGrkn3z6kDUnoXGNV2TLUHjdHB3uf2blvGUNJpY=;
 b=j1OGxfzchxP9fxEol1KTZfIUTNfmfpZupxaYvMU93NCbBvGZbj47g4uxArZPkiBszkbKWJihfcIYVh+A45svrdmLWrEQdXQND0XNp5oyKTHqhebVsnT80vRyR9lenoqCm0pppfmuBCD/Vws4yYnM1PedetT/Qi+4F9vU0svqclgxjPGHrAuymEz7X7cZKEeA2QnHy1N7/0+/dF4KnnimCKqemXGzM+09Ym17xLXBgT93uBrpZueAgNI94gf3q53mioSQ+zFM+k3Q0X1cPKa5yN1tapu/u8huRhULLTTHCvoC8ehaf14oCN71eWcQn3lPNPnbiXVPUm7VpnDY1Q7W9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS7PR11MB7781.namprd11.prod.outlook.com (2603:10b6:8:e1::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.18; Wed, 4 Dec 2024 00:00:40 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 00:00:40 +0000
Date: Tue, 3 Dec 2024 16:00:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Imre Deak <imre.deak@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e_for_serie?=
 =?utf-8?Q?s?= starting with [CI,
 1/9] lib/igt_kmod: Remove unused module_ref
Message-ID: <20241204000038.GA3224633@mdroper-desk1.amr.corp.intel.com>
References: <20241119054008.2001984-1-lucas.demarchi@intel.com>
 <173203520559.373309.724792645696617234@b555e5b46a47>
 <jv5wepyykcudndxiszdjnumqlfmtxzvq57nw4kggydhrlhige2@rufphvdmtsu2>
 <20241203231704.GM4891@mdroper-desk1.amr.corp.intel.com>
 <2z26xmkwu2n3z2ls7xf33rlogccpjsxdradgax3qb7hyys5kbs@l6s5aeisijex>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2z26xmkwu2n3z2ls7xf33rlogccpjsxdradgax3qb7hyys5kbs@l6s5aeisijex>
X-ClientProxiedBy: SJ0PR13CA0086.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS7PR11MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: dd3cbe4d-fb20-4dc7-f813-08dd13f6b0b2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/ODv40NIYRZonM+IVU4aoFeGqCGKnSkGG8XedXI4rlLHd4JnlCBv4zxxVIAG?=
 =?us-ascii?Q?GiULK2DSk8brPXQ7VLo6tcDC2rQhQVoXS+4U+HnYf9Dwm/MHcA9SqPrYaCkl?=
 =?us-ascii?Q?Q1xwnv/1MsIDLLlz7FqRKL2fF+3D2IEiCp6lEjGIIA65p5on+KVNl3c1IJ80?=
 =?us-ascii?Q?bswqGg5xK4/pTmZ/iiaSDjvwgv+7eDWA+87idyoxVd4V6Xk7NcjxlM9NcGHJ?=
 =?us-ascii?Q?YaxR5KBB8Pd0jKoPmMiFx7jo/1REb8GKekQ55pIn/dyDHqeyDijrTkijhLiH?=
 =?us-ascii?Q?sxi/ua1rXFH77ps2vAsTQ4KB4AFWQKd7WKbK622C7WLQlgFj/37uyW6KsUu7?=
 =?us-ascii?Q?Z1wqrGjuB0l9PSlUjm7X0a4g0qlJen5NWIdyt7pEjOW+dHToI19kLgWfXMXq?=
 =?us-ascii?Q?COutnq6peNFJhi97wr1tDjso45Z+/kf85z1JrAeY522mQRd4QxWFcPC+/KgB?=
 =?us-ascii?Q?dYlKez6PS7WbjU+Kbj6dGiI3gsmndGu+mg4g2INwqMGNmtbgxYNVcuwZHrhI?=
 =?us-ascii?Q?FQUSrKLRiQajoZjqi59ifKEsHsq0MMijlkzISZMwfy9f5/QGTLIecnyg+1wz?=
 =?us-ascii?Q?ayMy4leyfF2dGg/Bu62s5lL0a/VuEvXX4LnOohByeyN2fczWzvLOM+3+33Hr?=
 =?us-ascii?Q?hooCvsKliKh6CZSgvQyAtndNDoS4CJVi2lL3Ko3xP4k97NTa0RNfiSty3nP9?=
 =?us-ascii?Q?omsAtJVSlyNa3UkL2t6V+h89wB3bd/uqaukuayJCFb4L7oD/FqtcNNgCgpp/?=
 =?us-ascii?Q?elZn7jyn2tj4Qqg9HwNyvEKPrKsWZWdEuREQCC6QeAuTGSarIN2Eb34bCaCx?=
 =?us-ascii?Q?ZaeRNhNby428A0/AWyb/DrF4iAdRDf8LMeB6q/06u2G4AxxXV9UfQXuTid8a?=
 =?us-ascii?Q?ZhDdSFbdlFialYvKYGdqB15i0u8QMq5P53A5tNPCKXPV+W1kICgUT1YhyLUy?=
 =?us-ascii?Q?Lk0uxceAcDFGPhoahwSVubxQdy3R6NhVf935rhv8OdkjVVpc603F+1hVx0gA?=
 =?us-ascii?Q?QNIJDNO8Romcbc+kyBvpeJIqEqK6Qus3A42Ul64x6n/lOrTGZug4HqFM+xZ+?=
 =?us-ascii?Q?TggPwhAoHqNn4Zfy+K8r2SgnZgmxxxd+Vj6CJa/KKIIOR+UcnL0FANpGZB1u?=
 =?us-ascii?Q?jU9DepPjTDEwKqEgCSRSXV0MwkowODIq/raB1XGGoNXcpl3BwVtk9ZYcuyDt?=
 =?us-ascii?Q?YCgD8iOrBe0uS1tYObiai+4VzrX+MGnFmT6rtrykuQj8B0IQtgwp4lTMNA43?=
 =?us-ascii?Q?aFb1nWpM8pPWgBejsZGTX19ht0ldtZ7mwrXnJeuMF6GysGMH3nCl44XkV/Cb?=
 =?us-ascii?Q?TzTaZoyH5sMx5ix/SrT2DIYY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SWHyJlf92a+IwDiujMjT7XFH6nzGdrg7OJW3gb5cO6exUdXG8j66KfOTi/6w?=
 =?us-ascii?Q?Z/yyakpQTs8DaZZttMe7HLR6QKUc3CeOwkk8bFT8eAkSZ1YJvSFg79iY66Qe?=
 =?us-ascii?Q?Wqy7aUz44+zK27ZLOkOfuq9tBV6uumGvPicrw379rfbnn8us8hyiHLot1/CS?=
 =?us-ascii?Q?UJUCt94GoGZiHFqiBTL9uW+DYzPrrovgK6iDubLbfUeUVvy7p5Z+ccQRrWeY?=
 =?us-ascii?Q?iKtMfejx3KJamD3ZqhlDij6hAdHeDq8Eo4+Q4gKK9vHtBCViRF1ofbgyumst?=
 =?us-ascii?Q?H9yklpf6+QWtl71EeUe/6CNQk4rOb1q9aF/AYdtFIWQG5sZUGgIqlBlnN6yz?=
 =?us-ascii?Q?WtyeKN14LhL1pfcSQjWKd3uy8VIKOwRdmO0X3iJmvJlUWfbB2Sk/5w4+6dZx?=
 =?us-ascii?Q?q1Hif5ajKubNC8hTQj9NP9MSiW/8OMgvVeDaMRV0K4pPZUra5udMLsGQir+E?=
 =?us-ascii?Q?t3f4qdKM4dSPnfsJ8iKW8AvQwvs8pyQ2cLD5HDa29Y4IJUzjIYZhffuPSwoj?=
 =?us-ascii?Q?xiiPOeJaOaeqLBhJr8B+Mdn+ZoU5YaPxOPxvxJBCsWqcYN2ongFKO702dxqa?=
 =?us-ascii?Q?yZNyfyDkCivFZH72pE1zJq4vNyE2GQyNX8Y3K/AEP9qwiGD3JJmzcDeLZLvn?=
 =?us-ascii?Q?6m6NFp4eIHkuhn0elpovWvsZPr7b1rchJuMHEb+++8K9ChbWlM8mB6WbnZX2?=
 =?us-ascii?Q?k1z2FHQ19W/DgvLVEXlvv0pYyxQ9qWtHWEKgTOl3JWS1fvtcNsJwIQb1Ysc2?=
 =?us-ascii?Q?CBNM5rhy5/id/2Mplxv+S4Rv3/rXqca+vBksvXP4vVvG8sABhgotXboflh/p?=
 =?us-ascii?Q?/rMn1huuE4sF2A6iYQy0/rl1pSJd1H62SyBVEFD03J7kAgZuTZXgl5t9ZpWw?=
 =?us-ascii?Q?rxSdSiWeOEh9Kvz+9KbbJiARURbk+daRFIYiBp/LXw/GdzWcDZ0nJ+alDXqy?=
 =?us-ascii?Q?ylp3q51sZP7LO636nzcLCYmX0yrN4nsxGzRQ3VgrIE/xOVg1Y/4Lk07JSCOc?=
 =?us-ascii?Q?IMrX9rmdBArPj5QFxTaSqmfHZYgfKYum/DjpJVjSmysgm6t1VwBNZy7XakOv?=
 =?us-ascii?Q?GvNlo2JjeDn7OuM4Fb7OAvvryuQAs+Oqd55ZEtW05s+pnDClSCKPadC3FLOY?=
 =?us-ascii?Q?zJE9uEzicAaybgY9AbGBU9G33gk4YZpfXGuhGx8ROnNHAupskQRC4YIxybYW?=
 =?us-ascii?Q?0OXiPDRhniaX/GJXqsoysqIk1/XyhNFu7PnnRw+MqvpddvMpGvSAEHIhqttb?=
 =?us-ascii?Q?YxgAbI0h+o9XTFLTvN1BANAHqiXH6C4cqUny19GOaM5Me8IeKhSsr87B7EBT?=
 =?us-ascii?Q?NVauWsiVu46h7aN7S3DSJo+cJp3ABtSdd0g+iiskCi8bRZgA6utHCcx0zQE5?=
 =?us-ascii?Q?YP+hEIl3gwQm8h/+ALsIq+ABMBR4gkOzJQU8hsQ1yT+Na9NYYP3KZxbeP0GW?=
 =?us-ascii?Q?onXTYsmlBZg845790PLx1sZHKKJR4d+ANWFRZIYXaPPHMOGwU/KlmqMQlyka?=
 =?us-ascii?Q?YWZP2609oaZkANP5DqKZ43Vv6utn4Zf1SO6/5bt4zgDIAjMUUcuhzPmYv8kK?=
 =?us-ascii?Q?+37vnbtmYhsh/TGANvyoxuxy001XiB+rOeePCovwWDMzIFnomsroDB2o0cL5?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd3cbe4d-fb20-4dc7-f813-08dd13f6b0b2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 00:00:40.5633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1XG0qSyCbs/pZPg5AXW5D+e8pTI6QQjl0gpRyRl7n5J4vSFowxEOGtx+9lANtvBaY19JYnHsjOh0q0ulTZ/nhFtOtpJBFxc/Cs6g7V/h+pU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7781
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

On Tue, Dec 03, 2024 at 05:56:29PM -0600, Lucas De Marchi wrote:
> On Tue, Dec 03, 2024 at 03:17:04PM -0800, Matt Roper wrote:
> > On Thu, Nov 21, 2024 at 04:02:16PM -0600, Lucas De Marchi wrote:
> > > On Tue, Nov 19, 2024 at 04:53:25PM +0000, Patchwork wrote:
> > > > == Series Details ==
> > > >
> > > > Series: series starting with [CI,1/9] lib/igt_kmod: Remove unused module_ref
> > > > URL   : https://patchwork.freedesktop.org/series/141532/
> > > > State : failure
> > > >
> > > > == Summary ==
> > > >
> > > > CI Bug Log - changes from IGT_8118 -> IGTPW_12135
> > > > ====================================================
> > > >
> > > > Summary
> > > > -------
> > > >
> > > >  **FAILURE**
> > > >
> > > >  Serious unknown changes coming with IGTPW_12135 absolutely need to be
> > > >  verified manually.
> > > >
> > > >  If you think the reported changes have nothing to do with the changes
> > > >  introduced in IGTPW_12135, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> > > >  to document this new failure mode, which will reduce false positives in CI.
> > > >
> > > >  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/index.html
> > > >
> > > > Participating hosts (46 -> 44)
> > > > ------------------------------
> > > >
> > > >  Missing    (2): bat-mtlp-9 fi-snb-2520m
> > > >
> > > > Possible new issues
> > > > -------------------
> > > >
> > > >  Here are the unknown changes that may have been introduced in IGTPW_12135:
> > > >
> > > > ### IGT changes ###
> > > >
> > > > #### Possible regressions ####
> > > >
> > > >  * igt@core_hotunplug@unbind-rebind:
> > > 
> > > oh well... CI is definitely not happy with this series, hitting this:
> > > 
> > > <3> [152.880835] i915 0000:00:02.0: [drm] *ERROR* audio power refcount 1 after unbind
> > > 
> > > Need to check what's going on
> > 
> > I think that's
> > 
> > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3467
> > 
> > which we're now exposed to more widely by intentionally not unloading
> > the audio driver.
> 
> this series is not merged... by "now" do you mean in i915 (since this is
> extending the xe behavior to i915)?

Yeah, I just meant that when we run this series through CI, we hit known
issue #3467 more widely because the existing code was unloading the
audio driver and preventing us from reproducing the issue in those
cases.

I didn't look into the refcount issue itself; I just wanted to point out
that there was a gitlab ticket related to what's being reported here.


Matt

> 
> that manual refcount in i915-display seems wrong when unbinding... the
> audio component has the get_power/put_power, but if the entrypoint to the
> unbind is via i915's call to component_del(), it shouldn't really
> matter. Both components should be able to break it.
> 
> +Imre
> 
> I wonder if doing something like this would be ok and not mask other
> issues... that would match the "registered" logic we have in e.g.
> i915_pmu.c
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
> index c6b251f178c25..2c405e980c3a7 100644
> --- a/drivers/gpu/drm/i915/display/intel_audio.c
> +++ b/drivers/gpu/drm/i915/display/intel_audio.c
> @@ -1285,7 +1285,8 @@ static void i915_audio_component_unbind(struct device *drv_kdev,
>  	device_link_remove(hda_kdev, drv_kdev);
> -	if (i915->display.audio.power_refcount)
> +	if (i915->display.audio.component_registered &&
> +	    i915->display.audio.power_refcount)
>  		drm_err(&i915->drm, "audio power refcount %d after unbind\n",
>  			i915->display.audio.power_refcount);
>  }
> @@ -1376,8 +1377,8 @@ static void i915_audio_component_cleanup(struct drm_i915_private *i915)
>  	if (!i915->display.audio.component_registered)
>  		return;
> -	component_del(i915->drm.dev, &i915_audio_component_bind_ops);
>  	i915->display.audio.component_registered = false;
> +	component_del(i915->drm.dev, &i915_audio_component_bind_ops);
>  }
>  /**
> diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
> index 554870d2494b3..75f2a064feba7 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_core.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_core.h
> @@ -101,6 +101,7 @@ struct intel_audio_state {
>  struct intel_audio {
>  	/* hda/i915 audio component */
>  	struct i915_audio_component *component;
> +	/* registered and not in the process of unregistering */
>  	bool component_registered;
>  	/* mutex for audio/video sync */
>  	struct mutex mutex;
> 
> 
> Lucas De Marchi
> 
> > 
> > 
> > Matt
> > 
> > > 
> > > Lucas De Marchi
> > > 
> > > >    - fi-cfl-guc:         [PASS][1] -> [ABORT][2]
> > > >   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html
> > > >   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html
> > > >    - bat-dg2-9:          [PASS][3] -> [ABORT][4]
> > > >   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-9/igt@core_hotunplug@unbind-rebind.html
> > > >   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-dg2-9/igt@core_hotunplug@unbind-rebind.html
> > > >    - bat-dg2-11:         [PASS][5] -> [ABORT][6]
> > > >   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-11/igt@core_hotunplug@unbind-rebind.html
> > > >   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-dg2-11/igt@core_hotunplug@unbind-rebind.html
> > > >    - bat-dg2-14:         [PASS][7] -> [ABORT][8]
> > > >   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-14/igt@core_hotunplug@unbind-rebind.html
> > > >   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-dg2-14/igt@core_hotunplug@unbind-rebind.html
> > > >    - bat-dg2-8:          [PASS][9] -> [ABORT][10]
> > > >   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-8/igt@core_hotunplug@unbind-rebind.html
> > > >   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-dg2-8/igt@core_hotunplug@unbind-rebind.html
> > > >    - bat-adls-6:         [PASS][11] -> [ABORT][12]
> > > >   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-adls-6/igt@core_hotunplug@unbind-rebind.html
> > > >   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-adls-6/igt@core_hotunplug@unbind-rebind.html
> > > >    - fi-rkl-11600:       [PASS][13] -> [ABORT][14]
> > > >   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-rkl-11600/igt@core_hotunplug@unbind-rebind.html
> > > >   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/fi-rkl-11600/igt@core_hotunplug@unbind-rebind.html
> > > >    - bat-dg1-7:          [PASS][15] -> [ABORT][16]
> > > >   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg1-7/igt@core_hotunplug@unbind-rebind.html
> > > >   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-dg1-7/igt@core_hotunplug@unbind-rebind.html
> > > >    - bat-rpls-4:         [PASS][17] -> [ABORT][18]
> > > >   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html
> > > >   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html
> > > >    - fi-cfl-8109u:       [PASS][19] -> [ABORT][20]
> > > >   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html
> > > >   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html
> > > >    - fi-kbl-7567u:       [PASS][21] -> [ABORT][22]
> > > >   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html
> > > >   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html
> > > >    - bat-apl-1:          [PASS][23] -> [ABORT][24]
> > > >   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-apl-1/igt@core_hotunplug@unbind-rebind.html
> > > >   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-apl-1/igt@core_hotunplug@unbind-rebind.html
> > > >    - fi-tgl-1115g4:      [PASS][25] -> [ABORT][26]
> > > >   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html
> > > >   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html
> > > >
> > > >  * igt@i915_pm_rpm@module-reload:
> > > >    - bat-adlp-6:         [PASS][27] -> [ABORT][28]
> > > >   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
> > > >   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
> > > >    - bat-adlp-9:         [PASS][29] -> [ABORT][30]
> > > >   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-adlp-9/igt@i915_pm_rpm@module-reload.html
> > > >   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-adlp-9/igt@i915_pm_rpm@module-reload.html
> > > >    - bat-arls-5:         [PASS][31] -> [ABORT][32]
> > > >   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-arls-5/igt@i915_pm_rpm@module-reload.html
> > > >   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-arls-5/igt@i915_pm_rpm@module-reload.html
> > > >
> > > >
> > > > #### Suppressed ####
> > > >
> > > >  The following results come from untrusted machines, tests, or statuses.
> > > >  They do not affect the overall result.
> > > >
> > > >  * igt@i915_pm_rpm@module-reload:
> > > >    - {bat-arls-6}:       [PASS][33] -> [ABORT][34]
> > > >   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-arls-6/igt@i915_pm_rpm@module-reload.html
> > > >   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-arls-6/igt@i915_pm_rpm@module-reload.html
> > > >
> > > >
> > > > Known issues
> > > > ------------
> > > >
> > > >  Here are the changes found in IGTPW_12135 that come from known issues:
> > > >
> > > > ### IGT changes ###
> > > >
> > > > #### Issues hit ####
> > > >
> > > >  * igt@dmabuf@all-tests@dma_fence_chain:
> > > >    - fi-bsw-nick:        [PASS][35] -> [INCOMPLETE][36] ([i915#12904]) +1 other test incomplete
> > > >   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
> > > >   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
> > > >
> > > >  * igt@i915_selftest@live:
> > > >    - bat-arlh-3:         [PASS][37] -> [ABORT][38] ([i915#12829])
> > > >   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-arlh-3/igt@i915_selftest@live.html
> > > >   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-arlh-3/igt@i915_selftest@live.html
> > > >
> > > >  * igt@i915_selftest@live@workarounds:
> > > >    - bat-arlh-3:         [PASS][39] -> [ABORT][40] ([i915#12061])
> > > >   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-arlh-3/igt@i915_selftest@live@workarounds.html
> > > >   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-arlh-3/igt@i915_selftest@live@workarounds.html
> > > >
> > > >
> > > > #### Possible fixes ####
> > > >
> > > >  * igt@i915_module_load@load:
> > > >    - bat-twl-2:          [DMESG-WARN][41] ([i915#1982]) -> [PASS][42]
> > > >   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-twl-2/igt@i915_module_load@load.html
> > > >   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-twl-2/igt@i915_module_load@load.html
> > > >
> > > >  * igt@i915_selftest@live:
> > > >    - bat-mtlp-8:         [ABORT][43] ([i915#12829]) -> [PASS][44]
> > > >   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-mtlp-8/igt@i915_selftest@live.html
> > > >   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-mtlp-8/igt@i915_selftest@live.html
> > > >
> > > >  * igt@i915_selftest@live@gt_mocs:
> > > >    - bat-twl-2:          [ABORT][45] ([i915#12919]) -> [PASS][46] +1 other test pass
> > > >   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-twl-2/igt@i915_selftest@live@gt_mocs.html
> > > >   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-twl-2/igt@i915_selftest@live@gt_mocs.html
> > > >
> > > >  * igt@i915_selftest@live@workarounds:
> > > >    - bat-mtlp-8:         [ABORT][47] -> [PASS][48]
> > > >   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-mtlp-8/igt@i915_selftest@live@workarounds.html
> > > >   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-mtlp-8/igt@i915_selftest@live@workarounds.html
> > > >
> > > >  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
> > > >    - bat-apl-1:          [DMESG-WARN][49] -> [PASS][50] +2 other tests pass
> > > >   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> > > >   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> > > >
> > > >  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
> > > >    - bat-dg2-11:         [SKIP][51] ([i915#9197]) -> [PASS][52]
> > > >   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
> > > >   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
> > > >
> > > >
> > > >  {name}: This element is suppressed. This means it is ignored when computing
> > > >          the status of the difference (SUCCESS, WARNING, or FAILURE).
> > > >
> > > >  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
> > > >  [i915#12829]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12829
> > > >  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
> > > >  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
> > > >  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
> > > >  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
> > > >
> > > >
> > > > Build changes
> > > > -------------
> > > >
> > > >  * CI: CI-20190529 -> None
> > > >  * IGT: IGT_8118 -> IGTPW_12135
> > > >
> > > >  CI-20190529: 20190529
> > > >  CI_DRM_15720: f8f85a38f6c75e091805f01ceff4041ac2fdf3fd @ git://anongit.freedesktop.org/gfx-ci/linux
> > > >  IGTPW_12135: 12135
> > > >  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> > > >
> > > > == Logs ==
> > > >
> > > > For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/index.html
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
