Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E91CF9C60
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 18:01:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF3D10E862;
	Fri, 20 Sep 2024 18:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fheRS8GF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9737E10E862
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 18:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726855303; x=1758391303;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Iclb3bMaOsoJ6S9HTXEOWb/bUHUgeR/J+9SYWN5z2qk=;
 b=fheRS8GFR9cPkjhc0RVLoFL/QePQ26g1QSUQRsP86YuWtI7kdyVK7O1f
 VW/KltUWeZk/kBJy4v1iPbqPZ0bODNTLUpSyVKrCSChZJ0nrKyYe3wQt4
 zEMm+lkmottbZlBSGN5AksoMD5yKwklcEEWsoIZZKIL+1bZ25Y+RWC5Kx
 zYluyn+Rms/Pq79+bxILtYbYghYCVRhViE/nw30qhvDh/kA0TMEAzhtWj
 S8h0U1HHLRMaqbZIQ7M04oTWT0cr8fWtbQ8k+0C8i4VJsQtosmC3HPZP5
 1331v3Yn1jsI1UwXmriRik2yYY90Ae/iS9M6RDNxPkJLJvVZ7PADul2zS A==;
X-CSE-ConnectionGUID: P/IAn8hqQ2Oz2lcysDdFOQ==
X-CSE-MsgGUID: a5PJ5+S9Qd6bp94kEhdkkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="37243627"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="37243627"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 11:01:42 -0700
X-CSE-ConnectionGUID: 6j4deyXvTWivBu4OnzLyuw==
X-CSE-MsgGUID: NZiMfOTWTjm9v8yFOz8Eew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="93706401"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 11:01:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 11:01:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 11:01:41 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 11:01:41 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 11:01:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPtrpO8b7u22JOgCEH2ML/0NwvZpd0z8gB9fF2HTNEtRRF+VebFqyzQMxUzS2YGgj6iQouJeWrVGrjVx/kl7fjs2iKHHdDMvajALW6u7OS6qgW9bcN62cZNrh0Dt2/ohej+mGmZNmeJEAz1b+Z2HlY/O1SrGPyjsYBwzl1NHtg+YOJvJNq9+3d6CPcP/l4Vxv3qmYRbxt1jZsQfLpPpa73TdrkKmXgAjIs6jcNXDD98YtE9grJorDZcRW3mesk10pJvwCkQ8QUTsLUm/NTa5t6ReF1iA9rX016cqD4Ltd58HEpHhsI/ILCX/bfKB4izpBRT/DLgD8Qjh+H4kNhAGRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fztmMdZuFW5y+okMErC2YP8C+JVyreTi/rWTK+1AtQY=;
 b=xf4Vtb9fGq1XsY9XCxgyKN1llPDGLy5THCrnFdBr5S42PmnbKoNkUwC7LYfylHg9wRIvNegCuK7nhsdmS5l86CLZgXBKzeA8cqw16xsoNmqFr3jSMvXKn6iDoplh8toiBK+cA3ZNeFbbbk35ZexETncp739islW1pxRmknBqRnkKZxm0q6Jk98z7+KmzLSpNikOhsmL5sdEISnrRrn2ZHNLTzMDowaelofHa0ZhIClRxgHAzjQ3QJuxHpuSAgNSHJZx3YWPweMpJQouVZP6mFuRkWROWVMAC1NWyHW+4n+jk8YfLCYuEPRoAPoYT+9yxoIuR09iiYIUQzCb/E3O/+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by IA1PR11MB7872.namprd11.prod.outlook.com (2603:10b6:208:3fe::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.23; Fri, 20 Sep
 2024 18:01:37 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%5]) with mapi id 15.20.7982.022; Fri, 20 Sep 2024
 18:01:37 +0000
Date: Fri, 20 Sep 2024 11:01:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 6/6] tools/intel_reg: Add forcewake support to xe
Message-ID: <20240920180135.GR5774@mdroper-desk1.amr.corp.intel.com>
References: <20240918163629.1186314-1-lucas.demarchi@intel.com>
 <20240918163629.1186314-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240918163629.1186314-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::14) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|IA1PR11MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b46d325-9762-4d9d-dafd-08dcd99e4577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uAW5RDaWiKKta2FoiW51H/uIG3dWO26Ym/y/lho64gX5Wi8pJOxZUTfgz1Uu?=
 =?us-ascii?Q?Pd1jOEu8s0gxv22SucyPtgzfVuMaaBf2yb84fb5R7VZuSL92WIZiJ1OgXbZ5?=
 =?us-ascii?Q?q6kzv+85u0wbaVTBDOqnWx5/ZCZIVuEO7jGxDqQpoaq/26hAyK91ZddPhV5h?=
 =?us-ascii?Q?qFtU5Rd/N5uN6so4cDI+xtJbmlRc5FvJTKfSG/+NRb3i2ybc9c4UC+LAOlyt?=
 =?us-ascii?Q?/NC9DBE0D3wprodtjNlgfm/8Xjgbefw/AjyZBFjRMANEmxq+3UCys4Wh6P6Y?=
 =?us-ascii?Q?hj6oqk7vd8longfATOJnCqSMwacd+s6TXqXeXSpCMAAR6jvf/sbXEfUGkRJf?=
 =?us-ascii?Q?axthLAbwwyVAsv7bRJL7c3ZUHuwEsUxHqYhOFglHqWifmiMofYDsgfURcxVZ?=
 =?us-ascii?Q?46KzQgFAvvV42eqWa5c1wj2NVuZlKHdUAqCfqomdQDHJ466jfh3gQNi8/721?=
 =?us-ascii?Q?hLffVfqfPQ5127ezIKPmdO46bgs7Ac84d//Nc1rahujWVDzQXrH4Co/aOSmr?=
 =?us-ascii?Q?Rldm2phJlBt5AB8umle4JIyh7JYKZYr9BZ4L5ZpypA4MbgZUd6vKL0hcKX12?=
 =?us-ascii?Q?FBXzetj6EAhf30+pKTnOJNyMVhFRhD6DmxgHLjjczGh69zQ4wK4sarOVVu53?=
 =?us-ascii?Q?HXPOwUR+bGUjmvDCX0JoPzePQD/ybUhcbj+89MKwNe/97v5re+Lrii3EJ7ZT?=
 =?us-ascii?Q?EnYDepVkA887LrPmBsYenLDYY0YmUhk0t9p/nkX5VujSpwwCGF1lUzk7J39R?=
 =?us-ascii?Q?bmCLyNGZ7t0d1YoSWNhN7h8cRFHludRDyzg5UlvB+yTNLl7F3HJqnnpsSeVn?=
 =?us-ascii?Q?biOwu6H4jf/7BlMXbGwcDWAlMDOMQMvG5glrZcE3cJw+hr6zwMjSjfsNM5au?=
 =?us-ascii?Q?3N8vbXYTsR90vxdsoXhuUfPRpqcGkPMNQSlOjRnxj6vcKRTDwbxSkOIhvSdC?=
 =?us-ascii?Q?7WONtGb7/2Uud/r7SRulR9M/5SeJ9T6/FDNxjDeLaQd8aniexIoBbq6dIttL?=
 =?us-ascii?Q?Jk9HjRks7/RxuceCf4PZoI2V/fZfU8Oe3cPtXgnZ9JuvmXMR/z//RaQQlutt?=
 =?us-ascii?Q?50dMqSAI5wrt+TwYyp5OMVXxCYE5UQJjiP5o0t8iEFVynhXUNDQo95rzkDcX?=
 =?us-ascii?Q?9zQif8iI5401/4/6AwmZnz7nYQ4LVWokyRk5/0gZkKKubiciDIw1/P4DhBSY?=
 =?us-ascii?Q?Sa5sqAA6seQDdWCsBspGlnmHYT0EplG2nIZrfNnF/Er9+nNKNyf0IVVbhaaG?=
 =?us-ascii?Q?UneURDU73AJmmq4LDbtdsDRgwN2GBcx34AQHl0uf6eqfhBN/CullM4jnB+j5?=
 =?us-ascii?Q?6HH0EWuhi2SSe/WmN8SncFD5tQuX60nPO12eCcXSu+0m8w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YOmk5sFiXbCnsLJHZpNIzObXgRLfEv3DumvGyCwZch9XSIqTfq9VI8fBxllx?=
 =?us-ascii?Q?tSyd4LJ6bXEw3Q8YXcNpkFiOySZ9BepMGc4l8op3LKexSJ2M2Cw2sCmc8eU2?=
 =?us-ascii?Q?rRg42ulxDPyyYMoeGgUQU0Whl+r+ZyKqOiGxOqJwAqQs5dI7mUAgLI8b1IuR?=
 =?us-ascii?Q?rXkC6L6vmDFBCvpIAUe05euk1gJH2S1Lna7nhoPoIM1G9HeV5au3jejkMBnf?=
 =?us-ascii?Q?+Dc6zX36uPvwKmvCY3K6lbhjm9MfR/RcYd+7VFgx2wsMGh/JYCd/j0a6WSjy?=
 =?us-ascii?Q?Z7xIdQLoyo0oNX/F6Zb3KqfaJrDOUhRN3tjQ9Vzfpf+T+bjTnwe4kQ6fQqyX?=
 =?us-ascii?Q?ASBhMiY5A9wIKQoKMuYKTo1ntgvozYfR8cWULJN5PVp93SieK1uz/qkXljCJ?=
 =?us-ascii?Q?93j8+J0JjAanSZowL1xDzrdovfkLIaKEe+7f12rWIetliGxs1shRWlCf9Xvh?=
 =?us-ascii?Q?hjXWocNiH2/jofWjoycreWmxTUyHOByPNRNs+vDXPUc6SgfedLI00haeaXOq?=
 =?us-ascii?Q?sTzJRrgDnoffuxt2gNYxIyKzUl0e3eiZS7rsOGFbDOjG5pDoppI+FZeKXsQT?=
 =?us-ascii?Q?lvGFuyZKrPRJEXGApMh+RjTtE2sjruQ15Tw5mQ9JVJgeTF4zVHT1YbiRS41L?=
 =?us-ascii?Q?//TmnDb67iH2Pkz3V/OnyO8YDmPEhRxWoKlJixMTYnyQK7loPK9Hoe4gNno3?=
 =?us-ascii?Q?ec2Tox3MwdsZfsrRteNnbQns+Veat1wHSRuRuJtMPDn21r2hVFPeyV3A0I/z?=
 =?us-ascii?Q?1NDzER1Vk8r9NU15daatVck1OzclnPUesnh2zU8bjW0DBr28nR1P6GQ1sw07?=
 =?us-ascii?Q?wi50gMPUJckm6PMJ3Q1tIVR09PPekk2+vThZwi54LDz2xdqttkHmPyy4CnbP?=
 =?us-ascii?Q?kMRV6ldBjQcpZTujKZ/G7PZ7Dwj15wf2s/35VyaveBcMoTSaIY+hJFJVzDtM?=
 =?us-ascii?Q?t3U/uMvtcnEDcrJ4+M6GtcVb66z/p0yQJwmdR/cRK4Bbv+2tKCBvXeMoIOie?=
 =?us-ascii?Q?hDbpBNkO3otUvqDiCU2kptCJWXAfhGON3kpAEv/bFrPZFtn/2waxCxp2giVf?=
 =?us-ascii?Q?xkXuTXTlM7oBtrqtaKDHtAJ1FtKOANsYP+tvmNJFDn0rUykSimnSg/TCjNz3?=
 =?us-ascii?Q?FbsqE5aXy62DsuNNa3E9urIcm2dlkjUBaDKpgkEDNm/EhsL0N3tz+T3dXdJx?=
 =?us-ascii?Q?V+KnndRK1mkC3iUIys+xy3IBOGwJ3l+fBcmb3l+eRzKPFbqs7wzSBSHalM48?=
 =?us-ascii?Q?37h3IMKwpOrX552sf9RpBEON5ipudzPaVZWBKFAl+8jt3DLdrwOrjpYYFQK1?=
 =?us-ascii?Q?ojczM5HmJJ1oDnMqwhAfqBpMEqNRFIN7XYP7uPrrA/PcaZJNnWO6OpAx/YiZ?=
 =?us-ascii?Q?zpZPYr/AUSVz/ghvmOowN2L6nEBxiVDS83uIs4Ajv4NdQapuKvoQVuHtyhGq?=
 =?us-ascii?Q?xF+Yv8XghUK/Wl3bp9RqZxf6ypqQ8OaLwlqyKdZnKDW9pf6S73dQ6/4ruRLq?=
 =?us-ascii?Q?zx712MMkvlNBOiIAKOJP/qiL4gba9ZWaE5krLhtlqN9Vj8qWtYAFb+tYGHvg?=
 =?us-ascii?Q?S7XESfkF95oDr6IqUtAPvJE9M2NwlCzhOaujA7VfcVQP0VMYGuZY6TGBfML/?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b46d325-9762-4d9d-dafd-08dcd99e4577
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 18:01:37.5499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7lhZn33Le/pk0g1d96gBgVqJrITSDpttAbpdLrFVxGm/EWNg6PQgPXzwX7/XTK88y34FSGY2y0cdIrUTObuLw33FRHoImrQXYcQ8jAdkmzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7872
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

On Wed, Sep 18, 2024 at 09:36:29AM -0700, Lucas De Marchi wrote:
> Now that the igt lib is prepared, start passing the open driver fd so
> the correct forcewake is taken.
> 
> Before:
> $ sudo ./build/tools/intel_reg read 0x2358
>                                     (0x00002358): 0xffffffff

Hmm, this example makes me wonder if we actually should have called this
top-level "forcewake_all" debugfs node something else.  This example
shows that we're not relying on this interface solely for forcewake
purposes, but as a wider "wake everything up and make sure it's
accessible" interface.  At the hardware level, forcewake deals only with
the GT-specific ability to exit+suppress RC6; if we read GT registers
while in RC6, we'll get back 0x0 as a result (which isn't what we see
here).

The failures we had here were because the device itself had gone into
runtime D3 (so register reads come back as ~0); using forcewake
indirectly suppresses runtime D3 as a side effect.  But if you'd wanted
to read a non-GT register (sgunit, display, etc.), those register reads
also would have failed before this change due to D3, even though the
registers themselves don't need forcewake.  So we're in a situation
where we also rely on the "forcewake" interface for reading/writing
non-GT registers that don't care about forcewake.

If a future platform adds, for example, a new sleep + wakelock system to
part of the sgunit, do we want to make this debugfs automatically wake
the sgunit too in case we want to read its registers?  For that matter,
should this device-level "wake up everything so we can read registers"
interface also be grabbing all of our display power wells by default?

Anyway, I'm probably overthinking this; we don't need to worry about it
for this patch series.

> 
> After:
> $ sudo ./build/tools/intel_reg read 0x2358
> Opened device: /dev/dri/card0
>                                     (0x00002358): 0x91e59eeb
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tools/intel_reg.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/intel_reg.c b/tools/intel_reg.c
> index 906ae9b84..b650c3697 100644
> --- a/tools/intel_reg.c
> +++ b/tools/intel_reg.c
> @@ -802,7 +802,18 @@ static int parse_reg(struct config *config, struct reg *reg, const char *s)
>  
>  static int register_access_init(struct config *config)
>  {
> -	return intel_register_access_init(&config->mmio_data, config->pci_dev, 0, -1);
> +	int drm_fd = __drm_open_driver(DRIVER_INTEL | DRIVER_XE);
> +	int ret;
> +
> +	if (drm_fd < 0) {
> +		fprintf(stderr, "could not open i915 or xe device\n");
> +		return EXIT_FAILURE;
> +	}
> +
> +	ret = intel_register_access_init(&config->mmio_data, config->pci_dev, 0, drm_fd);
> +	close(drm_fd);
> +
> +	return ret;

As noted on the previous patch, if we get here, it's always a 'return 0'
since intel_register_access_init() can't fail (and should probably have
just been a void function).  But not a blocker.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

>  }
>  
>  /* XXX: add support for register ranges, maybe REGISTER..REGISTER */
> -- 
> 2.46.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
