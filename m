Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D215FCA100C
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 07:44:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1D410E11A;
	Wed,  3 Sep 2025 07:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VCt1W2ou";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6228A10E11A
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 07:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756885491; x=1788421491;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=D1n95ZxdOvKmf66usd6X0w8iKCMUnmPYd2NjTtlIQrg=;
 b=VCt1W2ouYYvGO/Y+0DtBKJYxveAy1fzVLnCcFAoaqqN3fBOKPF5x7IzL
 Z4YiAQDOBEQK/Gx46R3hrqQP++0mVhldClO7Mdza6Vvftk6RQSV0P2PAy
 Ou4YHx4AnTYooLV3CFtUlCqoSLyQIY7HrI4o41kT2fVUnWrKgSL46EqSp
 aUvBTBORLs8bQUsqewhnHoaswIh3rt4vThk2wnCsrnAVk9KHFP9i8zUbr
 o+pKiuANtTv0fkXL5sXl96dgJZUDllPr3Rx95zLxZuZDVHPF8T4lvhxbq
 U+RR2Mhsl3frqGfr51S3A8BjdQMN3sWa/HbpO9hIkqhDW6fX365Uw/i+/ Q==;
X-CSE-ConnectionGUID: gjcV1tuNSXGQm4PQN7G4AA==
X-CSE-MsgGUID: Ox8N2uJBRJ2qo1jsaK3uRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58218746"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="58218746"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 00:44:50 -0700
X-CSE-ConnectionGUID: BX2IT0lOTGauB9paz83eIQ==
X-CSE-MsgGUID: 4YVL0qj0Q6yfdr+e0C7/7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="176766314"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 00:44:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 00:44:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 00:44:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.67)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 00:44:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHl5Ptak0cp1xcUREqdm3x6PbFe4EvyV6grTxjOv4THSZNbilzq/z+mHOUVSqbNqLIZlFijOBM11Czki3+noQY1Lc3VHUH7daGjnQTE4xiyPMpvAGn+VgU7pZ3gfIygvVFNIyeZaKg+Cg8rhnjoUIMC9mRbsJ2WcOdm74b/OrlQ4WTAtFTzliDyMjcohhgimG4tUNvYZxo4KhdBNC4KoLjaIWnfEcf34w5Bl2EzgnuptXTOo41VcdTAq1PIgea4/2GOmgGgDvqX2vgy62P6tB/0pDlkUuo2j5e/KbTj2IudcLMVBJ/ChsZfJm+IY8zp5fu4hFkpKNYIhiEXRLDy7ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wm+bOo+p6YR0JGy5F2ZYS95uOLDETYImFiTZiMLiC+o=;
 b=Pe/dRhQd6ywTyJsP9mKM2pCayX8fTbpZQfhcJfOu5mjULRo1a0Umq+KwGgUboo1XPaoBxbTNe5X6RsuEa2fLrvhHMGxtzofl/5V6Pq5QGnf9W+OmjM6rHBgAW5ysNFGsgSmKEaauCNznyXQHr/ctE4irVCUL3B6VYeKO1JRBz66GTDTyU3J96PKcffLcLdMMKIxFFaCwQhT0oQpiVyImx35enVmxRjOQQpPnm0CcZJaM5aMhmAI7d/4lpn5CoHv3MuiuiZ2ZmltGCPBSxy1wS9ir0w5NsaqstVg/ZVWvpz291NJnWJqPvRLlPEFuaC8ayqca+2in0xg9y1wBgQYJQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CY8PR11MB7845.namprd11.prod.outlook.com (2603:10b6:930:72::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 07:44:45 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 07:44:45 +0000
Date: Wed, 3 Sep 2025 09:44:40 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Daniel Charles <daniel.charles@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_mix_modes: Remove absolute
 duration value
Message-ID: <aLfx6NSlMi0iAGmv@fdugast-desk>
References: <20250204110634.976833-1-francois.dugast@intel.com>
 <4faa5a18-24a5-492f-a1dd-c6c108350664@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4faa5a18-24a5-492f-a1dd-c6c108350664@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: WA2P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::7) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CY8PR11MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: 90c0339d-0cea-4465-bf59-08ddeabdc047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8bl4tiHNtqoKoQwNpBS21gmEWgdH7Ag+JZi1tgWsFiz737hwXDHfZN6SOS2a?=
 =?us-ascii?Q?NNmd+68RO1k4PZiagkbX0FLRnivTw6+IKKZgbi84Kfo1HPwMCnb0XxojeEPY?=
 =?us-ascii?Q?99hvbPlKjmOg2LyYGL82QvGw+VvnSJk4jJ702Utkc/0v2N+20OqFSkkraaLY?=
 =?us-ascii?Q?3h59E7BZuZZBe8RWyEGPVzaArr5Y7l1IMrDjaMVbFTkQ1QNimT8D7LgreogB?=
 =?us-ascii?Q?ZT3O5lLeePsiiUfCTmNstedcE2Vr5IjPW4TdniRGORL7q7Y9U7Wvdb770a+g?=
 =?us-ascii?Q?3U26Yy0jt7d0L4OMixmqmfVs+Gay7qx1nbv5ANzBVHgz9cngLaPWyCoBPX9X?=
 =?us-ascii?Q?epPfGBGeERPzAnQ2lvaLTf2kbcTwZ7UlHQgsiE5joO8RY/8afcpRV3LlxaBc?=
 =?us-ascii?Q?5gkGFvGyMY86/5lJ9R0+7oKFTZ8zX9HR0/s0kHxbI5Z4+BL5lhXcd1Vxf7ZT?=
 =?us-ascii?Q?CkS/91HJA5ZreU5W9Bg61LKdwzPtRqBCT6tCBfKm7CAlPdISuDNz1atPLSyq?=
 =?us-ascii?Q?OvIhbyIrwEn8trbZ1/BPD4uSEwnnVSYL3Aw41QwMmBp8Y6YhS/0Ca72Ml1xT?=
 =?us-ascii?Q?lqZ1OojaJkrBlWOYm1UffkyuB9ymO5X5jIa8fvfgw/9BSxxd7uD5Xf+kQxEq?=
 =?us-ascii?Q?YMDTU1hrnzeEfR9zu3GYkRT02P3PFZ3Jdz5lhWVfZU56qJ4gH5kCj+i/uQ5u?=
 =?us-ascii?Q?fDTW92voAnUx0x7VKalsWBh1/O6gbCrpmO3G7N/dWrhJwnbGG7GSQXZb2C0P?=
 =?us-ascii?Q?3H/OHtR4CY5/b2ILPUooMzn/jnHinW/o0Rl06itl57hVEpdYxvfG5xH0j0We?=
 =?us-ascii?Q?dehMq3C4NH+hFxwrI5L5xFPN7s9HK7eSsp2wOh13xgipZ3h7BQ/3BB9lUaqQ?=
 =?us-ascii?Q?P77Rw8R/+CClBA7WJ2Au4SbQ+2d7UaNBGVXDLvJ3mQ6Ixp8H6vjx5OnnS+nL?=
 =?us-ascii?Q?STSd1kWoIEvgn3HdlYyTdOVIfdkbtVOl1oZ7Z10Edgew/oo+tvQ9IgpVQtTY?=
 =?us-ascii?Q?tW7+WA5FcyfAXAGpisB/trN1V2IqpZc2VrHmZdFd24bXKj8Iq5/lOaSG0TYS?=
 =?us-ascii?Q?8ieyuI1CTJxxg/o1OPLsHXnFG5R0E5qx9MwASOhtixEKKSbzW33Cg0ZCOqrx?=
 =?us-ascii?Q?oNhl0VdYJyzfYsbtFuKxsh3PbXRVlCvfZPNOkHlt5jnh/h9b1tIfaAClBhLE?=
 =?us-ascii?Q?vGVJu2pSS/u63IiKFAju2dAKvFulvxwq3OCnG0c6NGhMyLd8hcCR0Os4SN/k?=
 =?us-ascii?Q?OdJRzl7DaGuoUqW5YVF9u80XOxTAL5QtZWjHRchruD7YzwXad2hnZTcUft6l?=
 =?us-ascii?Q?wTsTg+yhmInuFHeSJ2lQnOzwH7hM1BQPq2Prbuoy45Cw62+lffOhwsvPTrnW?=
 =?us-ascii?Q?/YxfLtinXGPhNSGiawuPko1hHkLaP/4usjVRf8ve5tt9mwZmLR8QOEliVf8C?=
 =?us-ascii?Q?MvBjVAtlZAg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gF7RNZme5++Dm2jBPmB0YVQRznMruGElcLoJ3/bc/HrnsmcyPnTb3vEgFKA3?=
 =?us-ascii?Q?1NFdtS2GEPgJy4LHNArQpTI3avlUk3tF/DRCgLHt1MvCB/ogdr5z79S56Wf7?=
 =?us-ascii?Q?rgjYPdbU9TJj9AczBBZrmY8Rd7j/ssXNaku/SBTmyt4OMstFGbOIisKri3jd?=
 =?us-ascii?Q?w3yJfvpJEniPdI1FrZDMIP2paSYiHF236cBsPAYsWQG2DK7NwzyO8mOa+AXn?=
 =?us-ascii?Q?/5MdmF9/F9v4vNKrJRGiTw0zlUZTA6skBenKnpMX03aXdQ3Tf0LXt8NcIrbF?=
 =?us-ascii?Q?/ieKUNMaZx1ZQGVJ3WzX50PcNsMubXrODyCS6u7mMUae8PFXzc3A+4F3izIs?=
 =?us-ascii?Q?9zc54hMYoUxfSGFpbptq8JmFHM19K5tq+Xl5s8R+whziw6Zqj1/JnE19CH5Q?=
 =?us-ascii?Q?EQWGhNh3CMigiOb6sji18qNHkIM4ErnsRaKFDPq4qcmKjwnu8XVYqdQQ2D2w?=
 =?us-ascii?Q?KLCLlmTPeZO73ibZ6jvfkObc/qmfBIOe2DJT+z5NeVjPfdiEdJ/t3peEuvBH?=
 =?us-ascii?Q?915R5tcQQDm22y4MXkiaK7iSSiOdRmxb3jCJi2m2/F8Va/ge3sUVnDTM29DX?=
 =?us-ascii?Q?/V4WoUkre398NIuCQBWRse6vkIYJQKPa3OxJfbWky+AXyZCCO9RsSpprESEn?=
 =?us-ascii?Q?FblNOAYMIBxY+5mojs5XnPVpjxLCAERvd0awgZvcIu3Q5JgP8XdpFPSm+JMz?=
 =?us-ascii?Q?hYDMhVz4290v5Va0G2ZwLoGONjW6MN/V81F7CiSefZKY4XKWNzzo5KUOVjWH?=
 =?us-ascii?Q?xjv4xtO1MUseAoJBRJ2x/mUu9kwK+jvdBFazPMfxFSCTtuvMwTMji7lxitH4?=
 =?us-ascii?Q?GnKfQMCYG1raxwY58eN/cXMKcfXgQhJF8C30XyzEtxflqrV7OJUXv5SBFqU0?=
 =?us-ascii?Q?zg3XUKSt1Bz6furRNBufo9G46pwDuTk/jWdQ26PJ6YqqUxH5ET6cQ6OPI+HJ?=
 =?us-ascii?Q?+TaS9m3Is4DrJNH5kjx6LWLdracspmhOhwblvkfvFsOmJpsj0QkCQ3P47xuM?=
 =?us-ascii?Q?Ea8YFeucYd0V0q7YtWA9tL3hVjxsULwVnDCsJ5ln8W2MFCh+xbjb1p+yDHix?=
 =?us-ascii?Q?vRXr9ocnvxf6rcD0J1jOPVaEA3jfdVHwZl7LkP56pdcDz5GNCcOZFOzdB2JY?=
 =?us-ascii?Q?cJpD24MsKr5xJV+6nUV05s5kzmth36hHqSzcedaKBHkDW9Ak6PROeBhcyqb4?=
 =?us-ascii?Q?zW/VkN7wtyAScjcBiW2U0EUz1758xcpa+CTtbMEe44QymDHiBgyracmv38U/?=
 =?us-ascii?Q?892liMABlPyu8UVcxRFd7vo134sotkVREUClJ5+h6qzpxpFYFSsw5tT3X0ig?=
 =?us-ascii?Q?K9NW1mQpnArojbPhwGhdt0IEcnj4Hd5ti1+HbpKpE5lU8nLw3QDs3fNBKr/r?=
 =?us-ascii?Q?qRUlClZqM0odUzdYQuNCGbl1lNn+4OHKX39rxFxK521PWcxUWE6YTV9sDkLw?=
 =?us-ascii?Q?1QgpgW8laQ3I3UmO1ijtCrheCoQhl3mWeXnjZAGGOW6oTO9vDjFeCij7ARVn?=
 =?us-ascii?Q?Aw8F1Tz9ppVMGAAI+oGvGy25gokM9/q96/JRh7BBRbWv+Ed5qNR3gmrmgwpO?=
 =?us-ascii?Q?EBQdfDF0ciCP4iVhGeFhGAq1EN+lQERX3LaOADbcBwPDVxZiolVicld8G4TN?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c0339d-0cea-4465-bf59-08ddeabdc047
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 07:44:45.4762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LXyJiuSLWZDrXoT/WkIZAbjh0Vv0k4VM+71EAjBfyDIETiSEMGO+XY6gKAtQ7PLrODuPKbE0AJHE4OYsL8auduZgi3PKiaHpYunMOaZk7QQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7845
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

On Tue, Sep 02, 2025 at 03:53:56PM -0700, Daniel Charles wrote:
> 
> On 2/4/2025 3:06 AM, Francois Dugast wrote:
> > This absolute duration value was making implicit assumptions about
> > execution speed, which can lead to issues in specific environments.
> > Remove these assumptions and instead explicitly end the spinner and
> > check the completion order of the jobs.
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >   tests/intel/xe_exec_mix_modes.c | 68 +++++++++++++++++++++++----------
> >   1 file changed, 47 insertions(+), 21 deletions(-)
> > 
> > diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
> > index 59887d2aa..e65854d0d 100644
> > --- a/tests/intel/xe_exec_mix_modes.c
> > +++ b/tests/intel/xe_exec_mix_modes.c
> > @@ -28,7 +28,7 @@
> >   #define FLAG_EXEC_MODE_LR	(0x1 << 0)
> >   #define FLAG_JOB_TYPE_SIMPLE	(0x1 << 1)
> > -#define NUM_INTERRUPTING_JOBS	5
> > +#define NUM_INTERRUPTING_JOBS	1
> >   #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> >   #define VM_DATA			0
> >   #define SPIN_DATA		1
> > @@ -76,7 +76,8 @@ enum job_type {
> >   static void
> >   run_job(int fd, struct drm_xe_engine_class_instance *hwe,
> >   	enum engine_execution_mode engine_execution_mode,
> > -	enum job_type job_type, bool allow_recursion)
> > +	enum job_type job_type, bool allow_recursion,
> > +	struct xe_spin *dma_fence_job_spin)
> >   {
> >   	struct drm_xe_sync sync[1] = {
> >   		{ .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> > @@ -95,9 +96,9 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
> >   	uint32_t bo = 0;
> >   	unsigned int vm_flags = 0;
> >   	struct xe_spin_opts spin_opts = { .preempt = true };
> > -	const uint64_t duration_ns = NSEC_PER_SEC / 2; /* 500ms */
> >   	struct timespec tv;
> >   	enum engine_execution_mode interrupting_engine_execution_mode;
> > +	int64_t timeout_short = 1;
> >   	if (engine_execution_mode == EXEC_MODE_LR) {
> >   		sync[0].type = DRM_XE_SYNC_TYPE_USER_FENCE;
> > @@ -133,7 +134,6 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
> >   	if (job_type == SPINNER_INTERRUPTED) {
> >   		spin_opts.addr = addr + (char *)&data[SPIN_DATA].spin - (char *)data;
> > -		spin_opts.ctx_ticks = xe_spin_nsec_to_ticks(fd, 0, duration_ns);
> >   		xe_spin_init(&data[SPIN_DATA].spin, &spin_opts);
> >   		if (engine_execution_mode == EXEC_MODE_LR)
> >   			sync[0].addr = addr + (char *)&data[SPIN_DATA].exec_sync - (char *)data;
> > @@ -157,25 +157,51 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
> >   		igt_gettime(&tv);
> >   		for (int i = 0; i < NUM_INTERRUPTING_JOBS; i++)
> >   		{
> > -			run_job(fd, hwe, interrupting_engine_execution_mode, SIMPLE_BATCH_STORE, false);
> > -			/**
> > -			 * Executing a SIMPLE_BATCH_STORE job takes significantly less time than
> > -			 * duration_ns.
> > -			 * When a spinner is running in LR mode, the interrupting job preempts it
> > -			 * in KMD and should complete fast, shortly after starting the spinner.
> > -			 * When a spinner is running in dma fence mode, the interrupting job waits
> > -			 * in KMD and should complete shortly after the spinner has ended.
> > -			 * The checks below are to verify preempting/waiting happens as expected
> > -			 * depending on the execution mode.
> > -			 */
> > -			if (engine_execution_mode == EXEC_MODE_LR)
> > -				igt_assert_lt(igt_nsec_elapsed(&tv), 0.5 * duration_ns);
> > -			else if (engine_execution_mode == EXEC_MODE_DMA_FENCE &&
> > -				 job_type == SPINNER_INTERRUPTED)
> > -				igt_assert_lt(duration_ns, igt_nsec_elapsed(&tv));
> > +			struct xe_spin *spin_arg;
> 
> initialize the pointer for when the first if clause below doesn't assign it.
> 
> Perhaps it requires a rebase, as I had to do it locally.

Hmm it seems rebasing is not required from current master.

> 
> Otherwise:
> 
> Reviewed-by: Daniel Charles <daniel.charles@intel.com>

Thanks, will resend for CI before applying  as the patch is a few
months old.

Francois

> 
> > +
> > +			if (job_type == SPINNER_INTERRUPTED &&
> > +			    engine_execution_mode == EXEC_MODE_DMA_FENCE &&
> > +			    interrupting_engine_execution_mode == EXEC_MODE_LR)
> > +				/**
> > +				 * In this case, jobs in LR mode are submitted while a job in dma
> > +				 * fence mode is running. It is expected that the KMD will wait
> > +				 * for completion of the dma fence job before executing the jobs
> > +				 * in LR mode. Provide a pointer to the spinner to the interrupting
> > +				 * dma fence job so that it can check that it was blocked, then
> > +				 * end the spinner, then check that it was unblocked and completed,
> > +				 * see "if (dma_fence_job_spin) ... " below.
> > +				 */
> > +				spin_arg = &data[SPIN_DATA].spin;
> > +
> > +			run_job(fd, hwe, interrupting_engine_execution_mode, SIMPLE_BATCH_STORE,
> > +				false, spin_arg);
> > +
> > +			if (job_type == SPINNER_INTERRUPTED &&
> > +			    engine_execution_mode == EXEC_MODE_LR &&
> > +			    interrupting_engine_execution_mode == EXEC_MODE_DMA_FENCE) {
> > +				/**
> > +				 * In that case, jobs in dma fence mode are submitted while a job
> > +				 * in LR mode is running. It is expected that the KMD will preempt
> > +				 * the LR mode job to execute the dma fence mode jobs. At this
> > +				 * point the dma fence job has completed, check that the LR mode
> > +				 * job is still running, meaning was successfully preempted.
> > +				 */
> > +				igt_assert_neq(0, __xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync,
> > +								   USER_FENCE_VALUE,
> > +								   0, &timeout_short));
> > +			}
> >   		}
> >   	}
> > +	if (dma_fence_job_spin) {
> > +		igt_assert_neq(0, __xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync,
> > +						   USER_FENCE_VALUE, 0, &timeout_short));
> > +		xe_spin_end(dma_fence_job_spin);
> > +	} else if (job_type == SPINNER_INTERRUPTED &&
> > +		   engine_execution_mode == EXEC_MODE_LR) {
> > +		xe_spin_end(&data[SPIN_DATA].spin);
> > +	}
> > +
> >   	if (engine_execution_mode == EXEC_MODE_LR) {
> >   		if (job_type == SPINNER_INTERRUPTED)
> >   			xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> > @@ -227,7 +253,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *hwe,
> >   	else
> >   		job_type = SPINNER_INTERRUPTED;
> > -	run_job(fd, hwe, engine_execution_mode, job_type, true);
> > +	run_job(fd, hwe, engine_execution_mode, job_type, true, NULL);
> >   }
> >   igt_main
