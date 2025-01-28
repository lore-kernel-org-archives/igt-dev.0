Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A484DC0218A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jan 2025 10:38:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5624110E646;
	Tue, 28 Jan 2025 10:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l3VbMHCw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F72C10E646
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2025 10:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738060690; x=1769596690;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6XH+SXwDS2veiGd1arrMdjW55e1P+4M8O1lBjF1YNDQ=;
 b=l3VbMHCwEm+/AmzL0TcYQDgaJ/9hP+n1vQSJDWcWqvmJnqbnt4Bwl77D
 x40C5ibig1BMrLvDBSiLE1D90M8GeXGr0QsmSTU31mjjgAyepuN1+Lz3U
 NisUEqYSSXxsP3U2yIzPDntAhPpTW0aTvOIWwq72j1TEefaJi8CxoWBi7
 qpDnWYIyGywkyWK5nQKfj9iQzvy9mCkcABjIfrthpgl8+qFVc63I4TmlK
 jqWPvuFAf7Uz6zzFTtSotZWeVilC6Iw1WGB8G5w7WhpbfT7HyJU61vY5z
 pwkS6inruxiqrdfZ/QFrrptWReC61zzDbwDxAM3ni1+4Y1aHZAB6aPeGs g==;
X-CSE-ConnectionGUID: 9V08sGyfQ1+H9kd7d6G/FQ==
X-CSE-MsgGUID: N8j+rDUBSpGvMgfqqDcKqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="26139628"
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; d="scan'208";a="26139628"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 02:38:10 -0800
X-CSE-ConnectionGUID: fOFGNlubSZegTAMnypIDWw==
X-CSE-MsgGUID: l3O64yMhREK/0LQtulvikg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113326032"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 02:38:09 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 02:38:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 02:38:09 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 02:38:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhNW7PZNknGlpZ6R7694DhMWxGX7e03uZhWAiGo8tndo1/l+r9Db/xAxtvuyh4OLj831VkPYp/OWE3nuKMuoGKd/gRqRYbw2cYa/8wmJkABK+eQ7bzGmXBDqL79KnptH7Zxkbd+zsAojVwc8h6Pn3BS9F7Yt9TzgIVl3UKCyANjTueVmoqUhLU605bDeZG0PfSRcXrELWCjI4/o4PxSU9GAispEQdPknqmZWzSk2NiNSXwLvI8p1bVPMvfOuCeBJW3e7359Q2IZtCVvVO1SUBbkNtaE+YlSR/75fpF7pR79xhabik2Bv53vGN+YrICkbWzXxDayhXCNjRIhRTm7eaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RBSg97oG/TNzm8wQysQWK+wytfGpsUnBDCH3IFtImY=;
 b=S5klsOvbokggKuJtRTOt6lo+C1akqGrpeMLiTINZHLs0hSY1nqPbIpqNEc3EJJEZDN08sIoQVMJy4uyL81KmNdFOpz1FK755PK58KMxHk2xdR9J80MNxXqAR/l2qHxH6icB5XwNgZPsceQqKF0hG+iBedMQ+ddQf8DpU8KDpjGtgazGTMsc+MDnPqmhgfVmWDReWDQ3ms1ks+++uDPIHhWZezEH5zFGfvHglfAdO8dnbF0PDVvdxPMEz14pk9QfdbTrEs3w5Il6AhGKvwPS151ckkOmVdaFmTBJdplKGQfSLIjPkvCp3F1uo4TdLc0jzear6JsYuxSr1r4Te4br6mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB8573.namprd11.prod.outlook.com (2603:10b6:806:3ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 10:37:53 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 10:37:53 +0000
Date: Tue, 28 Jan 2025 11:37:35 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t, v2] lib/intel_compute: Use LR mode for compute
 when using Xe
Message-ID: <Z5izY2O1BoPpODlC@fdugast-desk>
References: <20250124113140.2525323-1-francois.dugast@intel.com>
 <CH3PR11MB8434B27FE71DFF6981ED72DC8DEC2@CH3PR11MB8434.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH3PR11MB8434B27FE71DFF6981ED72DC8DEC2@CH3PR11MB8434.namprd11.prod.outlook.com>
Organization: Intel Corporation
X-ClientProxiedBy: VE1PR03CA0001.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::13) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB8573:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f7e846d-fea5-44d4-bda5-08dd3f87d213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OV+xPM6MXAjAAPBaLzE+az0qxvPl+dxgpH261HLFyI+9gHelSLgmwrq/7jIE?=
 =?us-ascii?Q?a9jsiDJ7J/c8qLkJi8IU1+rdUu0vFOLlhrYxeeirZ5/RhTgUnKEiP3kjIu+X?=
 =?us-ascii?Q?EJLmoMrwRByzwVl9r3wv/naT+H4dx5KITLF2tu7kfCJBdWA+C1YbHML6afBf?=
 =?us-ascii?Q?LZV/GV3SfP7gYPnf7UoyTAP8N2Nl8uBB8GsPPAKZllRCUCCLr+HUzKtcpdZP?=
 =?us-ascii?Q?l+6C0WH+78jAzhJnjPv0yGYSuHQJ3tZnXyBJZZm1c58ZF9dNLeQsdzCzonJe?=
 =?us-ascii?Q?QGRWG63tYw3KcnEVeDKecn5B1N1ceUmlQQeIDVtVKFy1FUfd4hASXNarZ2X0?=
 =?us-ascii?Q?y7NWBAxolgqmeENk0fD/7Nxnv4KO9dgBGr42Ha/71jyfa6zok77QqSuFBm/w?=
 =?us-ascii?Q?R/Nakfm+qvx7kMlF39lSHH3vS3tn2t1Fdwa1u+qtYeB9rFTNsXGEyEY0gFXL?=
 =?us-ascii?Q?356PXI9wvLuMxgyGuwNMmt6rfOGv2b6p53qnQrsTflifJJ5o2xJ1IhgK8bJu?=
 =?us-ascii?Q?aDc1b9UhWmJb/XyeB0CuFOYeleO5/ebgwhcvjsk8xXVb+NTgIskVjcMMGjxV?=
 =?us-ascii?Q?CT7tbOAoBBRvPVz7QKuNvzCDnP51pmcsQzwzmhI8cuwaAdTo+qa3NLnk97r8?=
 =?us-ascii?Q?S+SADzOiLMPKl6/4PB8k94ONvgypgYbzG8NnRxK+6Owi6yU2YNNLEH0cn7cj?=
 =?us-ascii?Q?24gQy+LqwARIP6dm0D0dxpyJ8XdnxGt7PnlKZ07O2WWqpeVKN4/xzJX3I7/B?=
 =?us-ascii?Q?m5xBOKbpWYOsVzuhlIRRM7OfIxXqZdhlSD8lEUo5b+PtlAKg1mOKCAekpf9j?=
 =?us-ascii?Q?V/ZfReFL4/B++91UTztwVJx4e38OeSCuqGgQwNteHFIgL3MhAMRyR5014/FJ?=
 =?us-ascii?Q?KHUNjKU0DnzTwn2S3ezZLHOUrfYMKvDkXV1LJojHdBOmIh+ZtorCz6dSBBwm?=
 =?us-ascii?Q?QOD2JCzxqinfvWIsn/Y1IPYF5RCv96g0EIis/tq9DVvzb4KC9cu3F6AJuyb9?=
 =?us-ascii?Q?vmWYdKIIBGUoaHXnR9vh8MUFkxOxD1V8cII5CeB8Xkns8JTsWqvceaNHtQvq?=
 =?us-ascii?Q?WDatvoSMmZl6QR8JiGS7P73Q86fTSxIT1XL7LynT56eTQepaOdJqe9sSfrkb?=
 =?us-ascii?Q?ydTwJXHbTmjbmski8V5I8oLkgDSLt+2BQpB/EvAgbMh3nCKWEfAE/UZSlrF/?=
 =?us-ascii?Q?SBt60Y4RBeQ6j7N4gqY8oRxMCHol5pJiL3qDxkDu+/KnO5uXfNBfw05P5W3L?=
 =?us-ascii?Q?RYcPTSbADhDB62samGCkby4WRbbU0SQ+ymeLP7eqXWERk+F8pmxXLEgplOKe?=
 =?us-ascii?Q?E1K3V7AWUP2KfvYmNYmDD+fldGCgKamGsZUU84+CT7A+tBDvFqQ8pzURPTGU?=
 =?us-ascii?Q?3ig46V4/vadb924SStf9uDS1LNfW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jY6CFBxRIKkCN7PQDxkRbCMr77XmC9dKjGYKz7BuWhBlelVMgzzlCcMwQRjq?=
 =?us-ascii?Q?Rm+xpPcqJIzLmzQcozd+EtrdovhDDFK8CZ4oLYHCrv5Cy175UhKiY8SMgQZ2?=
 =?us-ascii?Q?e0DmtAaLJvJPrCoTRdg7ivIlHKFtiv938SSE9g2bvVSpjo8Ofk7Z8caslJ3r?=
 =?us-ascii?Q?E6gj6PzYSl9vSwNg0K01GclzTg0a2H1/PIXL4wvmhcTXM2BaW3coevEYNgUF?=
 =?us-ascii?Q?j35lyAYNAhD8jJcEZTXPvwsM9DgnpaiFPyrt+loFgsjebqF8MgZnjvkdAzLc?=
 =?us-ascii?Q?gJxunG3nHO701EjqgZ6TRjXvOx20v569A4pyRZhtbVHG2IaL8Rpg7XidPGq7?=
 =?us-ascii?Q?rl9ubFOy3eN1S07/8xa/ooUJazGrWnUrcApICRWwVFpORi8Q9eOFhWU8QfCu?=
 =?us-ascii?Q?llm/UIjyQNXPaD9/qTz3okG6RXPIR/qnQhVuR44So0YW5pdorORwiYx/Vqxk?=
 =?us-ascii?Q?0sHE36MuJXLI1f5GsGDXyRz57KIZqOULfWII+4weZUeYxeMcWUPVZCCQAMVS?=
 =?us-ascii?Q?gJUf+kcBVqBZ6NmGMbP3Jprd/bqBvPBIPZKBAOcD8iv3uzG06m7o168cEItI?=
 =?us-ascii?Q?teUgXgTwvUjSe2yQw0lE/Fej3q6vuruRYIaJGh5FxP4t+M8NJLy3vgm1q8HG?=
 =?us-ascii?Q?BJn9DJRje8MCMzlru3mdlzfsgSfpks1yRR7+kTfPyFXMoJMb8vJ+P+m3vZWG?=
 =?us-ascii?Q?X2pNV0FTEpC+ekriOs0+R6h3pTgkHTJI9esxm1kCGzxKTkDpNZtkbWjdq97Z?=
 =?us-ascii?Q?5giFzeYs8gBvN11YdD/GmA35x5EbFHOweRXltSMUuU0jfUQeS+y4T1vKWSPK?=
 =?us-ascii?Q?2q7/n9ClLlfrpG7LtklffCS/go4iaFx3rPtlo55OkUMlcfcZFwibjPZzmefu?=
 =?us-ascii?Q?SezOUgPW2CpHwkNkUDPvrx3Ew6vUIFwfuVmpaJhFuqqW8Vilhl8CK77EHTbg?=
 =?us-ascii?Q?XbSBC+/Brtctx2qTcUT2EuxGXIPE0iFUoZOkX83GSgFvh2+bKp7L6QRFfSi8?=
 =?us-ascii?Q?rl3g/Mbf5Z5kl5erBuJOzjXyxheM6VkFlKs31hNFE65g6DgxHj/7thkNRl/a?=
 =?us-ascii?Q?17bA3/b5QTsC/Aip9gmk+AHCr+Cgct4f8v3M/qbwilVGRg5i2jwcqy3FHV4t?=
 =?us-ascii?Q?rXSEZ4rwNMwBb83caulzLgKf2jZ7Op1qM0sEQUld9zz/2ZAQG6ik04NQqSrR?=
 =?us-ascii?Q?nCFO+o8EuhFak72oylxc1YGF8HYwg9O5iyjA3zgr/L4fzsyV5OnWgJWwAuZo?=
 =?us-ascii?Q?lsyq6KONWvMYr1jYL4mHEF97sxVG3g2ulCH1J3SZmfUkD3VbQgnZbioK6MAZ?=
 =?us-ascii?Q?VzTTIvOjuTa0n0GeQhBd/humQupHCUdTlgHCoqVPM0cSQCTFc1yjh5akMmvE?=
 =?us-ascii?Q?SOXK0lcJdjjXVczgOsKUnh3ZuKCj34A7IyeAlOzYTpR6WPQD1LvjIQyPmu5e?=
 =?us-ascii?Q?xwRY4JLk1bnr4On2i5TGuPwz/zHeOsJT1vs2iMetaq2DSjgQIkd3eC96m+KW?=
 =?us-ascii?Q?vBurRsnlLxrRgRfgQzK5SML30iWDyirh8WzZWYNsWLA0Qy8l9J9boQ+mTLxV?=
 =?us-ascii?Q?TArSE0ANHVsNppDn/VCW3hzamX7OGkCq2Xul5hPRXgMukyN+RjQQpSlwezVd?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7e846d-fea5-44d4-bda5-08dd3f87d213
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 10:37:53.6894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2QS9hYF8lMp+/ihqMNLuHSiq9DBVU+e61bfShXrDtnu4nTFtyyLc/9s/w/GcCRDvdl8Vj3BLRtDr3wcG+P37r8wgqWjOvnri6EefW0qiAxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8573
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

On Mon, Jan 27, 2025 at 05:12:24AM +0100, Dandamudi, Priyanka wrote:
> 
> 
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Francois
> > Dugast
> > Sent: 24 January 2025 05:02 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Dugast, Francois <francois.dugast@intel.com>
> > Subject: [PATCH i-g-t, v2] lib/intel_compute: Use LR mode for compute when
> > using Xe
> > 
> > When Xe is used, create the VM in LR mode as this is what the compute UMD
> > does to run compute kernels. This makes those tests more representative of
> > real world scenarios. A side effect is that user fences must be used.
> > 
> > v2: Minimize changes, stick to xe_vm_bind_userptr_async()
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  lib/intel_compute.c | 98 +++++++++++++++++++++++++++++++++++++--------
> >  1 file changed, 81 insertions(+), 17 deletions(-)
> > 
> > diff --git a/lib/intel_compute.c b/lib/intel_compute.c index
> > f1520aad4..a7d5d3e0d 100644
> > --- a/lib/intel_compute.c
> > +++ b/lib/intel_compute.c
> > @@ -27,6 +27,7 @@
> >  #define SIZE_BATCH			0x1000
> >  #define SIZE_BUFFER_INPUT		MAX(sizeof(float) * SIZE_DATA,
> > 0x1000)
> >  #define SIZE_BUFFER_OUTPUT		MAX(sizeof(float) * SIZE_DATA,
> > 0x1000)
> > +#define ADDR_SYNC			0x010000ULL
> >  #define ADDR_BATCH			0x100000ULL
> >  #define ADDR_INPUT			0x200000ULL
> >  #define ADDR_OUTPUT			0x300000ULL
> > @@ -43,6 +44,8 @@
> >  #define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x900000ULL
> >  #define OFFSET_STATE_SIP			0xFFFF0000
> > 
> > +#define USER_FENCE_VALUE			0xdeadbeefdeadbeefull
> > +
> >  /*
> >   * TGP  - ThreadGroup Preemption
> >   * WMTP - Walker Mid Thread Preemption
> > @@ -58,6 +61,10 @@ struct bo_dict_entry {
> >  	uint32_t handle;
> >  };
> > 
> > +struct bo_sync {
> > +	uint64_t sync;
> > +};
> > +
> >  struct bo_execenv {
> >  	int fd;
> >  	enum intel_driver driver;
> > @@ -81,7 +88,7 @@ static void bo_execenv_create(int fd, struct bo_execenv
> > *execenv,
> >  	execenv->driver = get_intel_driver(fd);
> > 
> >  	if (execenv->driver == INTEL_DRIVER_XE) {
> > -		execenv->vm = xe_vm_create(fd, 0, 0);
> > +		execenv->vm = xe_vm_create(fd,
> > DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> > 
> >  		if (eci) {
> >  			execenv->exec_queue = xe_exec_queue_create(fd,
> > execenv->vm, @@ -107,8 +114,8 @@ static void bo_execenv_destroy(struct
> > bo_execenv *execenv)
> >  	igt_assert(execenv);
> > 
> >  	if (execenv->driver == INTEL_DRIVER_XE) {
> > -		xe_vm_destroy(execenv->fd, execenv->vm);
> >  		xe_exec_queue_destroy(execenv->fd, execenv->exec_queue);
> > +		xe_vm_destroy(execenv->fd, execenv->vm);
> >  	}
> >  }
> > 
> > @@ -119,18 +126,30 @@ static void bo_execenv_bind(struct bo_execenv
> > *execenv,
> > 
> >  	if (execenv->driver == INTEL_DRIVER_XE) {
> >  		uint32_t vm = execenv->vm;
> > +		uint32_t exec_queue = execenv->exec_queue;
> >  		uint64_t alignment = xe_get_default_alignment(fd);
> > -		struct drm_xe_sync sync = { 0 };
> > -
> > -		sync.type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> > -		sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
> > -		sync.handle = syncobj_create(fd, 0);
> > +		struct bo_sync *bo_sync;
> > +		size_t bo_size = sizeof(*bo_sync);
> > +		uint32_t bo = 0;
> > +		struct drm_xe_sync sync = {
> > +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> > +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > +			.timeline_value = USER_FENCE_VALUE,
> > +		};
> > +
> > +		bo_size = xe_bb_size(fd, bo_size);
> > +		bo = xe_bo_create(fd, execenv->vm, bo_size,
> > vram_if_possible(fd, 0),
> > +
> > DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +		bo_sync = xe_bo_map(fd, bo, bo_size);
> > +		sync.addr = to_user_pointer(&bo_sync->sync);
> > 
> >  		for (int i = 0; i < entries; i++) {
> > +			bo_sync->sync = 0;
> >  			bo_dict[i].data = aligned_alloc(alignment,
> > bo_dict[i].size);
> >  			xe_vm_bind_userptr_async(fd, vm, 0,
> > to_user_pointer(bo_dict[i].data),
> >  						 bo_dict[i].addr,
> > bo_dict[i].size, &sync, 1);
> > -			syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0,
> > NULL);
> > +			xe_wait_ufence(fd, &bo_sync->sync,
> > USER_FENCE_VALUE, exec_queue,
> > +				       NSEC_PER_SEC);
> >  			memset(bo_dict[i].data, 0, bo_dict[i].size);
> > 
> >  			igt_debug("[i: %2d name: %20s] data: %p, addr:
> > %16llx, size: %llx\n", @@ -139,7 +158,8 @@ static void
> > bo_execenv_bind(struct bo_execenv *execenv,
> >  				  (long long)bo_dict[i].size);
> >  		}
> > 
> > -		syncobj_destroy(fd, sync.handle);
> > +		munmap(bo_sync, bo_size);
> > +		gem_close(fd, bo);
> >  	} else {
> >  		struct drm_i915_gem_execbuffer2 *execbuf = &execenv-
> > >execbuf;
> >  		struct drm_i915_gem_exec_object2 *obj; @@ -177,19
> > +197,32 @@ static void bo_execenv_unbind(struct bo_execenv *execenv,
> > 
> >  	if (execenv->driver == INTEL_DRIVER_XE) {
> >  		uint32_t vm = execenv->vm;
> > -		struct drm_xe_sync sync = { 0 };
> > -
> > -		sync.type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> > -		sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
> > -		sync.handle = syncobj_create(fd, 0);
> > +		uint32_t exec_queue = execenv->exec_queue;
> > +		struct bo_sync *bo_sync;
> > +		size_t bo_size = sizeof(*bo_sync);
> > +		uint32_t bo = 0;
> > +		struct drm_xe_sync sync = {
> > +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> > +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > +			.timeline_value = USER_FENCE_VALUE,
> > +		};
> > +
> > +		bo_size = xe_bb_size(fd, bo_size);
> > +		bo = xe_bo_create(fd, execenv->vm, bo_size,
> > vram_if_possible(fd, 0),
> > +
> > DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +		bo_sync = xe_bo_map(fd, bo, bo_size);
> > +		sync.addr = to_user_pointer(&bo_sync->sync);
> > 
> >  		for (int i = 0; i < entries; i++) {
> > +			bo_sync->sync = 0;
> >  			xe_vm_unbind_async(fd, vm, 0, 0, bo_dict[i].addr,
> > bo_dict[i].size, &sync, 1);
> > -			syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0,
> > NULL);
> > +			xe_wait_ufence(fd, &bo_sync->sync,
> > USER_FENCE_VALUE, exec_queue,
> > +				       NSEC_PER_SEC);
> >  			free(bo_dict[i].data);
> >  		}
> > 
> > -		syncobj_destroy(fd, sync.handle);
> > +		munmap(bo_sync, bo_size);
> > +		gem_close(fd, bo);
> >  	} else {
> >  		for (int i = 0; i < entries; i++) {
> >  			gem_close(fd, bo_dict[i].handle);
> > @@ -204,7 +237,38 @@ static void bo_execenv_exec(struct bo_execenv
> > *execenv, uint64_t start_addr)
> >  	int fd = execenv->fd;
> > 
> >  	if (execenv->driver == INTEL_DRIVER_XE) {
> > -		xe_exec_wait(fd, execenv->exec_queue, start_addr);
> > +		uint32_t exec_queue = execenv->exec_queue;
> > +		struct bo_sync *bo_sync;
> > +		size_t bo_size = sizeof(*bo_sync);
> > +		uint32_t bo = 0;
> > +		struct drm_xe_sync sync = {
> > +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> > +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > +			.timeline_value = USER_FENCE_VALUE,
> > +		};
> > +		struct drm_xe_exec exec = {
> > +			.num_batch_buffer = 1,
> > +			.num_syncs = 1,
> > +			.syncs = to_user_pointer(&sync),
> > +			.exec_queue_id = exec_queue,
> > +			.address = start_addr,
> > +		};
> > +
> > +		bo_size = xe_bb_size(fd, bo_size);
> > +		bo = xe_bo_create(fd, execenv->vm, bo_size,
> > vram_if_possible(fd, 0),
> > +
> > DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +		bo_sync = xe_bo_map(fd, bo, bo_size);
> > +		sync.addr = to_user_pointer(&bo_sync->sync);
> > +		xe_vm_bind_async(fd, execenv->vm, 0, bo, 0, ADDR_SYNC,
> > bo_size, &sync, 1);
> > +		xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE,
> > exec_queue,
> > +NSEC_PER_SEC);
> > +
> > +		sync.addr = ADDR_SYNC;
> > +		bo_sync->sync = 0;
> > +		xe_exec(fd, &exec);
> > +		xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE,
> > exec_queue,
> > +NSEC_PER_SEC);
> > +
> > +		munmap(bo_sync, bo_size);
> > +		gem_close(fd, bo);
> >  	} else {
> >  		struct drm_i915_gem_execbuffer2 *execbuf = &execenv-
> > >execbuf;
> >  		struct drm_i915_gem_exec_object2 *obj = execenv->obj;
> > --
> > 2.43.0
> 
> All functions use bo_execenv_exec except xe2lpg_compute_preempt_exec where it uses xe_exec_sync and wait independently. So, that also needs to be updated. Until this it looks good.
> Please check if xe_compute_preempt@compute-preempt passes with this change or not before merging.
> LGTM,
> Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Thanks for the review. xe_compute_preempt@compute-preempt was failing as
reported by CI afterwards. This should be fixed in v3 which I just sent
without your RB. Let us wait for CI results.

Francois
