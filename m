Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3319BC282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 19:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BE510EA56;
	Thu,  6 Mar 2025 19:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HaD+jk5j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A55F10EA71
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 19:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741289909; x=1772825909;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rBF0SlouYzZyVrxuZOOowEp2dxSLqmqDr4jjnG41GOQ=;
 b=HaD+jk5j4Qsdf2cLCOLOZMxuR4VXawXqF6fe3ssAyM3ScfhCkKWpW9r1
 +GSbUFYBTjvNgY4P3spDaU9linv7Y+e3KCNtZjVi6tjEsr4JvWOM3ikcc
 8cZ93DGbUwAINdHSE5eauKNpDBu87Iu2XSk5WdqTopxh81uSZxjv1k5rK
 dKErSwVWdi9PELEC9FlYOMxXjQnf47XRq5LTgXs5FBHrl4VO+zXh+Go1A
 QuS6Kj7aWXBaBtozR/+EDeMJhKkC/XNZHbPEKGSj/rIxbwmoNhmjRp7tW
 oeKwYYp3PWu/QOfmksPoXfxfU7ztQoWrRxUy4X7FK0v+I6X2KPVZkmClW A==;
X-CSE-ConnectionGUID: 0ug+ohK1TuS4/If6GzauCA==
X-CSE-MsgGUID: 1YktimVfQGKuIIbJ/GFG5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52968034"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="52968034"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 11:38:28 -0800
X-CSE-ConnectionGUID: Rmb+r2NfQrCHRqRhp1iduw==
X-CSE-MsgGUID: CpoJ10cSTXml6KDFNHe+lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="124055744"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2025 11:38:28 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Mar 2025 11:38:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 11:38:27 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 11:38:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+cE8MEhwQNBqmk/OUihvDXPHDj37LR8Xjh6pE2cGJVtf57IlWZFiURL68g/aTtgJBPDmxFdjlHnqAoeadqoqHM3LMgHGfNHkVBUi6S7pHKTLQdVyj6vbDTrn/sW0yjDQV782tTatTZ1i9TCOTNSroOH395lXa6gMO/V5d2q6rwnpZw9z53fbpcCKlodzIBddOLGOFZsPsMCBJi8GjPpBRg9LiAkRJtxNGKKNJ1xK143V73MAJvLNEiurkY21ikoQYCMOuiRqxAglW8DyzhNV64PI6GAXdNhJNAGThlF/64HB0nuice0mR2qCsgjUd+9WvHVbDfUd8QZ60RETHqhvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojU8P2EkGOJUv8OEOZ+OtsAk+1FGBdBIeGC2ams1uWk=;
 b=QCHNRipeo4qFCxkZ3w9dLY3QeU+BNUDAidA2x/fQbxyrHff+NdecfVTjasAP7YwRAmyLSE7uLl/lmT14Rx2JPNI19mpLFL7ir8QDVzwHK21uqAVRRDd6QH4r/tdhCVHZEr9zyPf5RkstgtIpKGFAbfCDb5hwUxDTpo7+3SsDdQe7fyDieCNJZ9PZ4QCv6ff5W+DEtYUKfByh2B1lKqWah6twwLHeMPKe+lP4iIzYZWu6r0+wcwKCObncHBlwLq+p75BfNR/r92BLHWQqPo7NiYyG19uSNSelWzcMwKq4QSHvBhzPfM2qFffeDOB2/df9m1JphVr+55GFSecI24M5oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH0PR11MB8216.namprd11.prod.outlook.com (2603:10b6:610:192::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 19:38:24 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 19:38:24 +0000
Date: Thu, 6 Mar 2025 14:38:20 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
CC: "Purkait, Soham" <soham.purkait@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Tauro,
 Riana" <riana.tauro@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v1] Add support for runtime pm for xe driver
Message-ID: <Z8n5rDS0VLtvQXQx@intel.com>
References: <20250306112754.1483363-1-soham.purkait@intel.com>
 <Z8nJAIyhgqhVUph7@intel.com>
 <CY5PR11MB6211574C038C2F3C46842E6295CA2@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CY5PR11MB6211574C038C2F3C46842E6295CA2@CY5PR11MB6211.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:303:b6::7) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH0PR11MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: e23bb2a7-97e4-4acb-2bea-08dd5ce67580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NQm9POJtoX2Ysuxem1+EskRcCIqOEv+zlQ5h4q7W91Amw7ZIxTG/5re8FIMP?=
 =?us-ascii?Q?PDYsQfqwhI8i3jgOXuQlLiz78PhsPt7QlTiE8lH+URd8ky82aaiMm5zsgxYB?=
 =?us-ascii?Q?tcIVlW8HWfQhG8EM/tF4BY4A+aiBrpHU1dapmIJaUSOmr4RdjbPsnN8/XpD8?=
 =?us-ascii?Q?mTypKJWMaYMPGCAPzfrqYWKScNxLoitPt8IGskg6xu27gmKRZ/Mowwn34uJi?=
 =?us-ascii?Q?Zood695nbovQrCqQQmPxlOghdLz4ZxaV5EWX1LlpCcZX0+LvwN6CL6abBJxa?=
 =?us-ascii?Q?75u9WpuybBBxNjjIo8jh1RtkGr2jJ24VceKUdUMF4Rv30tn8b/+YbjKbv3Jm?=
 =?us-ascii?Q?DHsFHdKp+m2CL+/0IwFM35+huHyrgLxOE6B03jJcBSUg4B+qyV8Oae7grjQh?=
 =?us-ascii?Q?tncdavDkbrKTcMmKH34HieWTe6uPuakJmVpK0V+2NxGR/JjPVooAkyFSPCGl?=
 =?us-ascii?Q?tQ0HfpLlrYMEJ1QQr7bk7rIkLF+ujwAk4t7anM5ctd7LwEW77AXebcbriKDZ?=
 =?us-ascii?Q?3e5N74hAM1lusG/Cc7Q7yYLGI4zLu2M7Z9aY4efhn5J8Ea5WNX6oIXBpOmME?=
 =?us-ascii?Q?tUOmXkkS40atqeo5cZDukuTq3HqysbxcXjb6UyJzPfCx/j/ok1OKbZI8Mm2B?=
 =?us-ascii?Q?LbPnIkRye7qCbFKNBSiDj+ge8QGdm+zZ5vDQA7Nrx4wwvATdg2XzJ8mKtvGC?=
 =?us-ascii?Q?7/OBlZ6XqNKmlUDfuoW8j46uAfGIEIuqUxmS+nxpi3j7M4fTULDzy6SM7FB9?=
 =?us-ascii?Q?IgdVyK5zfx9DnKUMcKH0MYp6R46I4L5pMZJO8LL4FyCz5jFVeJMtL+2q8zZV?=
 =?us-ascii?Q?x4PCrZK7UipSOahQxivonGfplqTnmxGxT9Yf4ytA1Cmnrk5VraUt4v2VS3Bz?=
 =?us-ascii?Q?f/+YNXZBFfZLeZjGjWG9SRPe4X5ebbp79anL93daVkzNUPQEGNpjUql7flLN?=
 =?us-ascii?Q?vNzq68z2yeIZZ7TfRKOd15H/dn2+UMfgNR1LRnTeMiH/x9rR67yOUSkwqdT0?=
 =?us-ascii?Q?4pvFqNEr/sTDlqbu9V6usIR8S+Z6GFIJUSSClcBxG5rgNEiLMB2h3CffRV9M?=
 =?us-ascii?Q?JQOHOyV1grlqWB8mP48AHXZhSIQ4HPro2JLSFoqTW9kTeBctBBnn2BjSE1F6?=
 =?us-ascii?Q?9SazCDdXEzZkW5Nb/3rjXqHea34Qc2+wuJZwy0CuaeevP6Y5/KDyQqOqPpPc?=
 =?us-ascii?Q?tJZ8z2Hi5ccxdiI+nl+S3SNQOE3wWU+jAcqi9awS6/qF7yqVu7yhFz8cFWCH?=
 =?us-ascii?Q?4FngyKcKL2MYR1xixnCrarQTMTSCkXUKnPDuCa1U8BECDHx5gZrwyhnBLXT/?=
 =?us-ascii?Q?gl6R68XUa5CXVOavXcOtd5JgZdPfAwmb5/7DbStDC1ZGN2Z1Q/6Z8MzQlV8r?=
 =?us-ascii?Q?6covCiJvbTefN86K6xwipWqgzLR9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UL+WwI5OQHIPqvGgJac4g/P5Ob50iqGSK2wBiTSpz+des7BUWezF41BwGxm4?=
 =?us-ascii?Q?TAdq0xxHFtLdphs9y2B1L68cmiwlQxu44XKBthID0Sij2WkfS1+ol6MTnh8W?=
 =?us-ascii?Q?ey9Hl2hcoEhf7I/DpyAWQPkXpMKkPaZt+3j/rL8jcZkTDdOjceGHGsYwZ4M9?=
 =?us-ascii?Q?ECC1MflFhLXXkKWuVfseNNR+UQKIKXhCq91B7xDucic1LotceA4PfxRSnGIi?=
 =?us-ascii?Q?f1//rRJ592PmQ/vUcZahlO17Kkwr9kvqG+x7BdIcVuQr5w0AqCc24BJ0ZqPa?=
 =?us-ascii?Q?qVDB1ff54Iu3Mf1UVWyu5isb26B4IGmnv2aQQ5ZtnnG6yAR5dh+vdclxTKf0?=
 =?us-ascii?Q?l8DmZ9KBAgwylHzpy53PA1LHGQYAABPt4SuWpo66dzL7XuFZiN7F7Mxexc/q?=
 =?us-ascii?Q?IzyCmMSqnkeagIW7Gd7yGaOqgMQ5IGlSRZf90wA97WUYL0D1yPj8N5RdzsFF?=
 =?us-ascii?Q?bk0jIii/OJ26HGTBK5vMKLp1U3mPGRFw2I+QwMG8LDq3EgSfObS7+kniIoQr?=
 =?us-ascii?Q?gSWehDXS/8EEMGIwNsFz0S7svgqA8OTVUXwsUpkCA/FLs8Voa7sl0NN1Yef/?=
 =?us-ascii?Q?xQW1oL01I8d5hTj6BlAWAooERv+A+2LIPP2FCKph8tidXIqEdeHeREHt0WM3?=
 =?us-ascii?Q?MPcTnJBETEcAIPnxDMU6e7K3yD/hi8lQQKo4IYvXaZsU9eStvpqgZArekfih?=
 =?us-ascii?Q?mFKHCLeelw2MF/6rmknYNLggiqHKcBSpxvpPKZPzmrClhafKpS6XPZ/whYQO?=
 =?us-ascii?Q?oIDMarSGmAOue1ruG/k1astcVsYO9YcdP5eO/kykOI0ufLyA96yaHBKaVCF1?=
 =?us-ascii?Q?tJ5XBd1zeN+cXE8qt5kk8y8vYUWUH/yrm2ERNw72Jpor8YoxqvQ3lLOdMZwZ?=
 =?us-ascii?Q?xlMl3QbKto/LR6vSFYNXPdOktCFEhOYVrZH1w0cJKv5snd5YcX9FWbUshZxi?=
 =?us-ascii?Q?t4ux55HeG2vU4vtorpL+UlGVcwd6RbVjqGMp/BYgsAIDQsH+T06Od/0Kjw8Z?=
 =?us-ascii?Q?pUo2r1MqXfzfmvyvOuBOp3B1NGnbWezmohwjFcFHuCM4GMlDB5PaBYZpYDhX?=
 =?us-ascii?Q?Y6zE4TiIx72GVIMu5lTkyTb6QlmpCcl49rXbxYNYyuzsScyHI+9kImrV+dtq?=
 =?us-ascii?Q?+A94Fo9zYREEC2CLW5u5ugxxq69uWE1DiRmWSu15Af6lcMI8u+ekzlhFXMH7?=
 =?us-ascii?Q?RvPOZzTqGf93AKgeMP2E4Bi+vjJKNsjMuCpUrjzyJWsxb7sW8sKnJKBO9ZNf?=
 =?us-ascii?Q?TpWh9IdoFl2XPwnoai8XECk4JUnbZVyhyLWsYW7qd3f+z/kj6Fce0u5DLiDE?=
 =?us-ascii?Q?IYjcEQ304YAZ5SRCSv3bVIJk1vMsqg0Izw4RAr6D1V+U0GKfjWCVlyGKX/4W?=
 =?us-ascii?Q?ZJ/49X/mSE6F7ZRSQrASZWCOIgJR3YslZ4178EyqElXRrjaC45k8H2Ngqldp?=
 =?us-ascii?Q?0ACH1jVNtTQ12gjaAyKlUw3hHFhBQEF+8q8i5nxzkeeS2MN8P7PiyyvSa90z?=
 =?us-ascii?Q?x0Y8piFUPLesKkSePfg5n49jD6dBrst6AH58f9bF/0z1OCV52odF7p/ZmydI?=
 =?us-ascii?Q?PVuszY2E8aqySRJ3bYNje4nR/YtjgTRFJqRwmFn+NRSLGyWxsqOfUKVsex6J?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e23bb2a7-97e4-4acb-2bea-08dd5ce67580
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 19:38:24.6822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JcvNdvPXr+6iRnBcyoQ5CqglNoU0wjeU3hos66h5sXx39zi8eZ7yPCrmYr4Zox6wY9RJgAac7pL8i2vgkb1kuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8216
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

On Thu, Mar 06, 2025 at 11:45:15AM -0500, Gupta, Anshuman wrote:
> 
> offlist
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Sent: Thursday, March 6, 2025 9:41 PM
> > To: Purkait, Soham <soham.purkait@intel.com>
> > Cc: igt-dev@lists.freedesktop.org; Tauro, Riana <riana.tauro@intel.com>;
> > Belgaumkar, Vinay <vinay.belgaumkar@intel.com>; Gupta, Anshuman
> > <anshuman.gupta@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
> > Subject: Re: [PATCH i-g-t v1] Add support for runtime pm for xe driver
> > 
> > On Thu, Mar 06, 2025 at 04:57:54PM +0530, Soham Purkait wrote:
> > > Add support for runtime power management for Xe driver.
> > 
> > Why?
> > 
> > We already have that covered with xe_pm d3hot and d3cold tests.
> We need to this tool for e2e validation to keep the card in d3cold for longer duration and verify the Package G state counters by Python SV. It is useful tool. 

Fair enough. If there are cases that we are not covering with the xe_pm,
let's do it. Just please let's explain that in the commit message.

> 
> Thanks,
> Anshuman.
> 
> > 
> > >
> > > ---
> > >  tools/intel_pm_rpm.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c index
> > > 08c25ca8a..945247d2e 100644
> > > --- a/tools/intel_pm_rpm.c
> > > +++ b/tools/intel_pm_rpm.c
> > > @@ -151,7 +151,7 @@ int main(int argc, char *argv[])
> > >  			goto exit;
> > >  		}
> > >  	} else {
> > > -		if (!igt_device_find_first_i915_discrete_card(&card)) {
> > > +		if (!igt_device_find_first_i915_discrete_card(&card) &&
> > > +!igt_device_find_first_xe_discrete_card(&card)) {
> > >  			igt_warn("No discrete gpu found\n");
> > >  			ret = EXIT_FAILURE;
> > >  			goto exit;
> > > --
> > > 2.34.1
> > >
