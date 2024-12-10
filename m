Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C025E7717F
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 20:05:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448D610E5C8;
	Tue, 10 Dec 2024 20:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bj8eEJro";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7FF10E5C8
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Dec 2024 20:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733861119; x=1765397119;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oyUfB9rnO+Y4ZlsjPvetEpGUoa5ULvuoTFKIFIRCvGM=;
 b=Bj8eEJrorCK6lqpvImaMkaIBXrAViprF1mTLrV+xeEDN5i0gK49BoGY9
 408NnpNnWDhHg0gTXn/tLw3DbgztzlFz8scCkTNDAMpSv/RH4/rZzp3hx
 mWsee9xJIuJ6kZ9yfM6l7dzsP2KlqUIFGYUY5KeOfNYjpFkSl+lfOBRHk
 N/xHaXTDHEw8ulZGXQ4STdL6A557d0HDa7maWKOXY9X7sk2Y1NUp2cOFb
 aWxGPRM+6KpzFTppAomA1/3DWG6hE+zSRykR4JrOYWzNGw+D8N6Y6uF2T
 z4UE7sX0lMD9PzWv1pE0tLodVL2XBUEaMagZ1KtT+BuV8DtGQq+YJ34Hg g==;
X-CSE-ConnectionGUID: cMaocUe4RIyQmljpD5FSKA==
X-CSE-MsgGUID: OFuVKia3RyiI9KGme8alcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34350269"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="34350269"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 12:05:19 -0800
X-CSE-ConnectionGUID: ZpNELyB1TBqHirMa2omb3w==
X-CSE-MsgGUID: NiKO9rMPRweCP0IJliw5PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="96336653"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Dec 2024 12:05:19 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 12:05:18 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 12:05:18 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 12:05:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NatQSqpSfwr0pEWvP61Gkmz9y1GxpF0qrw8bFWomHarUY7+b2PelKpr5t0b/V2vQWomZTsKlKAxM3KnGGVtQuhJwKe/8349gBNWxKqe/CeRBUPwmCg6SWbo0oriEh4dPxG4wpZd0swlpUpW+J2e9zwNjRMQLyjjfpc8Y/QYCpMOqMgJrhsPladvlHWMW/INNCHzQsWSK0+sdKX4EIjkhtdwYtP3506wWYFG5CO/7kqbDYaguX2NFZHStzNsDIqTqGG0+xW8M6L2zob7NgiAVZsMaitgsJ1Xv6wOzoODPNpdg+p1LCNUJEnPMt2Q+UQV7ATTdafb5URY9DOt/1PTLJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jc7qpqhNwp7FgTiApRSL/SromPkgdBQwdaqGeygfRZM=;
 b=wX4dIxgYgZLwmPpTr+Bbda0T2uKbyQ5TfSUsHrvs5beLf+t93iFNrDt6c3Kwe8uj4iKmk3/mQH+NZNOZg+k/zQ0yhfPbDtPMH4MyqWmw0/HQHUXyRLjmMZH2RXB7B90B5XVxHdrL/2RONZbKyhoYYfN/kLyqLHg+7/2L1QnimqcHXqVA/E91saVmSgQEASLDcoppCZgxXrzE2aIoVQoJfpQbSS52LtxH7J4kkunyjNLSiohornIsMIa3vfvJXiMTaMyWP4RPUclx7+7ZDfaniLR3ON27IKrmxEerSC2GkhX2B3eUcrVlurvlJ+e8zLtQNwDSIPMcOCGubpEuqI+bUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB7199.namprd11.prod.outlook.com (2603:10b6:208:418::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 20:05:15 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8230.010; Tue, 10 Dec 2024
 20:05:15 +0000
Date: Tue, 10 Dec 2024 12:05:12 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Adam Miszczak
 <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Michal Winiarski <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>, Piotr Piorkowski
 <piotr.piorkowski@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: Re: [PATCH v2 0/3] VF: Avoid reading inaccessible registers
Message-ID: <20241210200512.GS3224633@mdroper-desk1.amr.corp.intel.com>
References: <20241210161525.777763-1-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241210161525.777763-1-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0127.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB7199:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f61c276-5c76-46be-a969-08dd1955f67a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?csiwEg3k67ddpVYtggYldeOp8O3ZZk/hK7UqTooXr2KfyweUIvq3LhNrT+Q5?=
 =?us-ascii?Q?dAoK4lS8QV5JZ7jd00sinAUZgO4+bij79Jt4+i1BIHSSVhJKLzVx7nhyZ01f?=
 =?us-ascii?Q?v/nTGbkYojCs65xsheuncaXAuJUjFuONuWfKYUGoojlyOsuJ8y59KY+lgLbI?=
 =?us-ascii?Q?odhkI2Tb0vpGg93qTpYxbF4hBvIL9E6pK3Rt0RHReT5NinJiKvl898BVTZML?=
 =?us-ascii?Q?Yjs/N7pEDf+9WtPGVBQ1c5Ko3FdNGA5lfTaexC3TmF9yDsWmtQloubRDLUZh?=
 =?us-ascii?Q?I0+zojbjU5LEnH5zTXUGIN+f4XPi7JriJ5n22v6cBoQwVY67TxGJPNUAyXF2?=
 =?us-ascii?Q?g9L5a/TpgXsZSTEkwmI94d/BuuGUXgQbcIrz+oCzCy6Z4T1Adju285vwD+QE?=
 =?us-ascii?Q?EbpRsyfDG9plI0viffBpismYx4/ZxKXWx5zKHn3sgIj5LeRF9X1Pe2d9ve17?=
 =?us-ascii?Q?XDUQdifnBjg5GRIwlzbD2mUo4MzSGJ7MJr8N40L9G75BhNCFbH4U8cRVe/1F?=
 =?us-ascii?Q?eS/MygpgCcRSAgUrhjwnUR97Ynfn/da7nhQY9aELTWTn9Jdw5MFPubmwI+OK?=
 =?us-ascii?Q?zm7bG2hRjoZc5hybk0ib7cheerqfMlz86HZA1RlGdNAn6vrHUvKh11rTehu7?=
 =?us-ascii?Q?p2GVLyFU+3pHRimo/ORHE5A9/Zy8m+MEIUCErE7r+8wIqvZ5gYD6BvKQS6kb?=
 =?us-ascii?Q?/4IYnXUhMDQVBlSOcbRBHM5UzxhZL1Nncv0TShplEDpDxqEZ5YlfoltzUmMY?=
 =?us-ascii?Q?UwpmUqHGpVw6MzOnkaSNal1JSG4FwzmzY47s4JPm/UK4UZDim3lJ/JV8rheJ?=
 =?us-ascii?Q?U9lCYGx+HUOEH6X84Zd04CGU4BDszDJDvDtYcM7tEQhqAhjRIXl3cxYNm2HT?=
 =?us-ascii?Q?tGnrZOHD5p0X8qN76DlMTRjFNkWKDTQvTj9Q0kmLvN870z6Fg1+IQqnBJmoz?=
 =?us-ascii?Q?bbr5sqA5VNRTNPzFp0p9OEkvIN6IIyhskcZ1ftc3tUu+xThlH/NCw0ybItaW?=
 =?us-ascii?Q?HJoCcuMSd9aXBHZBra0cB9A5iBNs3C5zjVt4FCpAPl8Bw8VxNStYjaB2u/yR?=
 =?us-ascii?Q?rBQRKEN4r5dUZdQTElUwWcT0Q1rK4Rh8LWCHhqkT0bcL3K0U3YDC7oe7TAVf?=
 =?us-ascii?Q?qNEdlYJtWbFBYM8x/gfgJmIzrD1fNCA2IHR+t9gbYRP5+nKl85CdlEvCVrnQ?=
 =?us-ascii?Q?98t4BWDXyXwAmilnsCnpzt8LCm6dG0P8ijSn2PHY9/7poHl8E19k7iNaaduA?=
 =?us-ascii?Q?vtpo35+0U14VMmK5bdD0SdCMNrEjgdiNtt4h55zdLWSA/wzR6q6HGuJHP/ES?=
 =?us-ascii?Q?VyJh/6151xcDFMsHxIM1dbLfziXVYRMoTkXbV0aRak5keg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aLhs4KVqj7NgyC3CyiAVEa1omxw2je/MWRBhfLQpqyidvO7UnFlS6CwITkKA?=
 =?us-ascii?Q?DP8ZCGQdRta0/Z2rasAPBKfbuM/uMdZvmYkpAscBp7LDGbBmt4eF0f6CEBhY?=
 =?us-ascii?Q?7fVDpx8fLNmJn7hCYoObBt5e7xXQQUDiei6MZzAaX8G5Ja16WNUqTUhBkBPJ?=
 =?us-ascii?Q?Um1GePd1sOxgyLcFReT3Q6aR4V807ZHtD0uTuEOewzdo9ENHoNjrf3ZP1vWB?=
 =?us-ascii?Q?DdLW6h7n0vE+a5FDNQqUKreMcAq63M7iq0+V0iZRbdCUCKqx45YYzyXVHsTf?=
 =?us-ascii?Q?17D1qQx86ybpNw7gycryJYmkstLvN2VJ0DwsvcsHmA3OZOTapFWykFka4kh5?=
 =?us-ascii?Q?pmBNwArEEhzHRqbx3WLvV6K/YVkCSzWCJ7JVPOuj9LIPYpz2nFkS+BV/4Y3K?=
 =?us-ascii?Q?lC31FhjXx3VnpKCMnBikLPKkUvCuXiw0yX2YuTexNz0dw5SvVL+SnLrpLx8x?=
 =?us-ascii?Q?Vq7Od06k2pFLS6/ff9otASSk3ZDsgWLTp05t1tZ+AeED8PD64U07T23rTpFl?=
 =?us-ascii?Q?F5Fhpkly4GvFSJCvx7Oz6PsfbEmr4X9t78bFyAmOrhklUk1zQwWivnrHSYb4?=
 =?us-ascii?Q?sBRsoMWsaOtX4GDbUhzKt6uiXX5efzH8O7kj2L8sZyoXnekAUAxJvrKsWJ1u?=
 =?us-ascii?Q?9SMEV5yUzt/khA3lAJEY89Ms6V0UXXrhMmeqvP/irGUQ1vRHQ/OqjcUfqltw?=
 =?us-ascii?Q?U4IBzn6EIANTjfChYFNspDcFM4zEAKROk0o2gNt6eAEpqy2J1zw94Jq9wDqL?=
 =?us-ascii?Q?QcfQ5W0eKbHgdcreRQBeYMiZzvu39lgib9HM+z8/mgOKS1Bc+uTSGopl7Iyk?=
 =?us-ascii?Q?arIxQ+hdfoJcfOqshvQO/NDaIT77wQ2ZY4oTR8EI5zecMZRXhwhKnMH7p5/C?=
 =?us-ascii?Q?dlyoYIo6LPtcLjZ8sSBSkpwABcYG18aPuMIJWbDH8x1FJQa3GbAxc4aDvVgx?=
 =?us-ascii?Q?sLouaagsK8crIIm38mjIjX79+BJWRHBIBE+S2xGlXwu4McoE4Pil8IE+nO1O?=
 =?us-ascii?Q?H3TTxwrgQ8eowGZIw/G825Wujze+yxSgDhQMIZXidyIWMcEnIiqX2Y0ZwgLT?=
 =?us-ascii?Q?WVDW8VemGzoOX3iBvrVsgGBQEkv1FspQmlPDHWfTfLeXFj8kWkFoaPO5PnfM?=
 =?us-ascii?Q?UfHRng2dZ72RqOXrM7CbPtj1br+huioZ7DJwdzgYwq1e1Sof4CHPk4JfHfZD?=
 =?us-ascii?Q?cv0BzGvRTHLv0kB5kaG1SMZBYMTUiZoPh8f87AcyYqLtvbB/A1FnDFZhB+wp?=
 =?us-ascii?Q?D40TJBMkT1wvDAteHvjzwQ5YYzQAkUpvBY28F6YOu91qzd2VzZV0vrag2WEi?=
 =?us-ascii?Q?iWB2BYkgZHHMFRN8XRf7DTN/SwVtH+mRReQJLq2PqX/u0PLe40lEQTcZwmMA?=
 =?us-ascii?Q?jppwJqPvWwkTHEEOYn9Nr8BWYhBc2wAPjJqZEUiEfb+J4xgk1WeAD+gUTE18?=
 =?us-ascii?Q?oIdJWlYKdf8aWQ70x28D7bPqWS11MFBaGpIwHjnXQ4J08A2hU8CFoj690XVJ?=
 =?us-ascii?Q?WdRpoAv+Qni/3QlZ99k2MBLU2hDuhEzvI2JQ59K37Fud4k0D8v6q69XUo7Tq?=
 =?us-ascii?Q?WBk66RXdhQf04NtxBqGyPmoQTjp8lCCeMDmzYk17Zk+EOMA/K9EPF7QrvOAS?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f61c276-5c76-46be-a969-08dd1955f67a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 20:05:15.6258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1w5EOaXlIt993redPOXYnd1Pf2gS6fRsAGkl0cnr1hL1mKxPuHF1QXCTyu4HabEcRKNFi1s/G00HSW8Iv7TMh3zQwzi8j++JoRJxtD6Z/z0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7199
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

On Tue, Dec 10, 2024 at 05:15:22PM +0100, Marcin Bernatowicz wrote:
> From VF-level some registers are not accessible. Don't check for flat
> ccs from VF-level, also don't use Wa_22019338487 for VF.
> 
> v2: Updated description for has_flat_ccs flag setting on VF
>     when disabled in BIOS. (Matt)
>     Reworked workaround ommision on VF to use the RTP mechanism. (Matt)

I think you might have sent this to the wrong mailing list?  This looks
like it should probably be on intel-xe rather than igt-dev.


Matt

> 
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> Cc: Narasimha C V <narasimha.c.v@intel.com>
> Cc: Piotr Piorkowski <piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> 
> Jakub Kolakowski (1):
>   drm/xe/vf: Don't check has flat ccs in bios on VF
> 
> Marcin Bernatowicz (2):
>   drm/xe/rtp: Add match helper to omit SR-IOV VF device
>   drm/xe/vf: Don't apply Wa_22019338487 for VF
> 
>  drivers/gpu/drm/xe/xe_device.c     |  2 +-
>  drivers/gpu/drm/xe/xe_rtp.c        |  5 +++++
>  drivers/gpu/drm/xe/xe_rtp.h        | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  2 +-
>  4 files changed, 18 insertions(+), 2 deletions(-)
> 
> -- 
> 2.31.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
