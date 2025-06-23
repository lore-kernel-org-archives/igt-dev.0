Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30A0C77B7F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 11:47:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9649B10E375;
	Mon, 23 Jun 2025 11:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fX3tBmzX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350CB10E375
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 11:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750679223; x=1782215223;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zevqCUtK15amBZr19uyEufsbAEvsQV4ETEOFuENATno=;
 b=fX3tBmzXtCtsQ2W75BAcmemKxeVvS9j2eJMATRRSjodRTl+ZeATRWpW7
 CljzzesAQ12/EZql0K3X6z02boK62VwALWJSNv4wgPwKOO/yseslICOhk
 /aHw0U86BBQ0gH77oG8azbQBP73+M+CDuSuxIeVnjseyRkaUAyuGBRd8e
 pMbLLHmARLLtOyplTx3XspK8PbBSatSZlyLbx72RepDfZR5sCfFjOsGzu
 IBPQIWv8z7WdrSGoprVieO6llZg+7uam5LJGnxsWczhxW1UQi5GA3vSmh
 kg9HIaZFqLA05giFdSp52QbMADeruivBLOee7PVCObAiLs9smY63wleC2 Q==;
X-CSE-ConnectionGUID: SI8k3rZlRwSXr+YpS07JzA==
X-CSE-MsgGUID: wgPRJPmrQ6uc65hingShXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="56555083"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="56555083"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 04:47:03 -0700
X-CSE-ConnectionGUID: SGLiVd1VRnCJAZKBuen4HA==
X-CSE-MsgGUID: FLIWySegTSilpVYfth6Yhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="151003519"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 04:47:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 04:47:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 04:47:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.82)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 04:47:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otf+aa+iu/wOKtIbQ3oCwkSkXmb9DJg7par0MkX+MqY+XUTjduWtbZP5lWzE0EwDXzT6fdz1scAM1Wp0SvjF+xcoW3/wy4VLAPDURReN3L+Bk55lccJNkmH45GIBPZNeEg75oLpIoNQRqnX3NDkYfeVIytOPBHnsi3PhmX3kplw/nmkTJVe8JohX7bIXHoRslq5SJ1O9pMND5Gm2/2aSUeGE5reScL7d/LiG+7wDCrF47PbtxX27He0+8f3P8aQ7BeArrrlbaU9fiGxT4Uuhl20jpffysccgY5EZNbiNJweUAWCpM5hLWMyc9KPTzw3lYLBq5l7vAh8/Pvb8UXiAKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aV6nDxz8fR62lrEgIKrQJpjPWTbGtWyHPiv7Jpc1Df4=;
 b=y8VOUcrLcj6nyZtZaIgjtUUNe8LyaEFNuNQD9clmR+L67KO9g4f2+HHitMhAWqYIW9YXU/6hvox93MHQ0ov2DXNoEMaEn7qzgmwbq33qAMblcx05GkZGDkiiK2Qq1JeYTKU+scP4P04BSjsMF4UuURLyfwF9cWgb+5m6APCUe4V5b8yZ2l2nHK07F67Kgtm2ZgXyh/L/ht+6O7Osai3LOMocnSDWJRdIghlYG+W1rswjCRkMIuSWclDH5rPzUH6FSrB99g8WRnrPrpkGJ8MqmqfgM45juXkG5GfZxn5PYG55/YfMe069DH7eQuv7pxGn8D3odM5k4/QLzbV/L4hxuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 11:47:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Mon, 23 Jun 2025
 11:47:00 +0000
Date: Mon, 23 Jun 2025 04:48:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] tests/intel/xe_exec_system_allocator: Add section to
 trigger 64k fault
Message-ID: <aFk/F1ZATJlXWsF/@lstrano-desk.jf.intel.com>
References: <20250616070640.2061642-1-matthew.brost@intel.com>
 <aFkkUmGWZH-mJMnc@fdugast-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aFkkUmGWZH-mJMnc@fdugast-desk>
X-ClientProxiedBy: MW4PR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:303:6a::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f4c3808-f716-469d-68fd-08ddb24baa52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fjy2AetHOH0MVRv+QOWKOs3ZOBpDoXp6Wze9lT9UI/V4DJbgsnk2RRkr6YH/?=
 =?us-ascii?Q?u3YyfitXYAURoM9FynYqgX16vDSA8Hmoi/Cuek4eZzXcwwbycGxgjvKIn3xC?=
 =?us-ascii?Q?tcv9wZy7F/bB/DJs9iErAFQGfSMCwyEOPZQg1maT10CioXdJXeQToPLUqcXT?=
 =?us-ascii?Q?CVGGBYankJfe6W5T573FDNaq/hAYVIZqzjdP4Vl2ZZa5atZUkESZtC5zwVWu?=
 =?us-ascii?Q?aTusz+67qfcCd/H7bnG1tGEaCKawt6qGaiuprMDrjSLTMzFvGh9zF4zOg3I2?=
 =?us-ascii?Q?5/79TYUppKsuyq/rHPMeIGb81Z3ReIhGhlPY7+Rw6rmwqkjB8oTcUWX6k++I?=
 =?us-ascii?Q?S7k7O2Gl4HstmtPv05q0ew73yfEiqkXx/GVxsr+lM9nLRFiBSCgBNANTFvf5?=
 =?us-ascii?Q?YSW4WodluBs/JVveS3yysZonQujPNUhOE/yH1AqF9kjlfyKMI9aqn+297S+c?=
 =?us-ascii?Q?nIjmYeDfK53ipVO0FldZSkvNEpVRoPPgmiqPAm1AGJey5CuHQ7WUBwa2BKPI?=
 =?us-ascii?Q?nkPpSmTp+57j4j1Gc5tYMmW74jQ/ZRbHG0eu6KAmylR+rIT1ZLDq5zp2c5CE?=
 =?us-ascii?Q?BWtMLMooC5wn5SBofKnovDZO93VXdAkE4hm4FBDVfzrJG0kfVlg0vM0brYG3?=
 =?us-ascii?Q?Fdg/CqDBSPf8agLCnSufoj6l60oraCv3uCArMzv2qBnXHNBFz7wBmikpdhrc?=
 =?us-ascii?Q?62YLoaWVjOTUn+lKxqCrRbWhUS8Z4oI44EUHg9/Rwkq48ahOkW1fXliIsNZp?=
 =?us-ascii?Q?0woJ5JAwoU2elUWMLsDOrFMiB6shPGWD+qlTdC8JW7RHjEiACiTBlBvf2/AU?=
 =?us-ascii?Q?7FAeMNiIer+QHdcMhkmloXSBe4klqokQ5V7W7ZGmFTs0ByofNS3Aipo8r1bS?=
 =?us-ascii?Q?nlHQDOC9PxUooaCLl74TfkYdH7w1zFH9dlFMP5/JwXpSDz2cA8Kc5BN0poOv?=
 =?us-ascii?Q?VTdqSEBJfbcFxXCpt8MBk8WOT/cWk+XpwQNefFHuFtXdibnIyweYUaMQxd8J?=
 =?us-ascii?Q?TDLZKVo9xGk4XlF+/xraqBAY7odcDZtyxUXukU8slk4gg37aVvYm53uLng6N?=
 =?us-ascii?Q?3LwNyyLlTLm8c68GYfCMgAmB2tll/fUNkfuDAXRsrIbgkPCzNvscUOwdB7mW?=
 =?us-ascii?Q?Yv4tFvgD1OfwLowBQGzmP1kiQ627SZAKedMPPWG7M0ObxEVI9M5RUSlw8x+G?=
 =?us-ascii?Q?5aLzi6Yc4sBkDWLxyoslo/LzP5sMLggdEbqgeQMpJqGUh8Mku2Wv5KS88ob+?=
 =?us-ascii?Q?fiQ5YpeJprVQxOJhVbHH+tGAzlg7W6DzjtoYtwSSRKHNOiho0oICY1/Oh7bf?=
 =?us-ascii?Q?Qt4AC8FfETVGbnVpksio0tE476x713NG5wi/r+Pr/ezIiqxbceRyPZn0eem+?=
 =?us-ascii?Q?wuqw7PNl7cxSwzoQj2tgCrBCUhXn5lQbgysCGjOS76dFlX4FzcV/MMKyWe95?=
 =?us-ascii?Q?i/+fxz6/k6s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?giL4CrM7GFajdWUmXjO7mwq3ij6N24+cxMEUgGQZQjP2uzB/yE4kTmuJFeca?=
 =?us-ascii?Q?9FVV3G/27JsZr+mvzlgqb3vNAwGIAbgF4+rfNm2wjDdKcmBt1rARRMSP1XJ0?=
 =?us-ascii?Q?WMz8IUCGfRHsvCr0hQeslA/A5SnklaCfBbKTwW3LxVf9hNftO9V35vAjEliG?=
 =?us-ascii?Q?fNVT+fdnfKIS3iibhvTvJdCazyfNowLhef9JyoDQZoM5EKSoDN5cZ4DVBio7?=
 =?us-ascii?Q?wmkztVAD99IPjYe1a1ZdjUEAyVjg44h0xFYKLCFIGtyVlSf8jcWnbw0BUv6H?=
 =?us-ascii?Q?iPk6slmK0wqCQ2cTnTwF2qgxjGsV6xyQMo43QDWmZ0f1AZwnoJScLT+wY4yS?=
 =?us-ascii?Q?CNngdruK8BSeKHqY1z3thfL1MnyYJeHs1EJtoK1I2vwv+0b9zs3Ak6U6DlNB?=
 =?us-ascii?Q?FxF52QD0daFIc5uGDbixh94vDFYdDIG6cqNTymDx6x+CN7gSlRv8rWbiKOgh?=
 =?us-ascii?Q?nwDFEY2BW3IT+S5X+KzeZsuUXfke7tACZPMIEKk95bvGoQHjPo+6ANY+gF32?=
 =?us-ascii?Q?vWN0Y7gpzXATUDZNAN+aCqxpaA0vGP0gJhu2hhNGZrWV6M0CO/amM/9peOdG?=
 =?us-ascii?Q?wD7C72rMaMwf6g4B2std+gD6C631ki9qbDMzv8AV0IAH7RkmGBIEZAy9aqxF?=
 =?us-ascii?Q?riOAPlf01Y3+7+u6NLs3W65Jhz3/cQBHw9GBiG/WD+/p0fhgYVE+n1AwCgaa?=
 =?us-ascii?Q?LKLUTUaUTob0ZUvzIvm39Iuwu2094WpSHMVF74I6R7S1OvW+cwn9K8fq8Ekv?=
 =?us-ascii?Q?itHA8M5Irgp1HDHcPnsw19nitneDg4oYdkOqYyQHKpwalp70eQRgEGCeHhZ4?=
 =?us-ascii?Q?ewWaXhOImy73bqZXvoGg8T49Y4Cm23ASfgcnPgPkzbY+j36IuGnw1q5GHcDT?=
 =?us-ascii?Q?+OfXewtjzebp6Vfp4G2FvxlH/C2iNqbycvUPI5iKFlnRRwZVVZlfCEeVG1kC?=
 =?us-ascii?Q?1HxWL1BPDBShsoi7ON5NsfAT6V2pTbZh7KYGetec178BdVFMrqojhgP3kiUe?=
 =?us-ascii?Q?Huuhko306vJuUp4i/SdKN3BMYJOEEY/y7D2S8iWiE9ZrOlTeBLceQFUNmvzX?=
 =?us-ascii?Q?DLkAttXyxKogZNUcyw1lEQyXW8PmvfTFEO/aFASMfYZfIq0ponfAk4X5XY4S?=
 =?us-ascii?Q?82FFh3sHK7e/BNoP4xz3tSCKgf6ME0C4EloeGfWQhQCn7QHs9nffg3uXx7NC?=
 =?us-ascii?Q?cpE+Hbk3/ephpoj1IUx7Hy077cWVrytEb9GVNrzzuHaw7RzHZC41bLzGdqyF?=
 =?us-ascii?Q?7ryIJCphbLFHM8J6MNlnSCZ4vvp4uCp5k9Dp4NfGXLiTWnZH7z1OEPBBUlXu?=
 =?us-ascii?Q?QR0v3ApFMocryrCt0EAWEcYZNaJQPYEHkefrzoT+TFUXRisqeQpahlfnNoD3?=
 =?us-ascii?Q?P7I8wa3D4r8tYnxVrB4nbROAXUdn16iEohKcBUko+BXINHhiOkIxzavvt630?=
 =?us-ascii?Q?9/GYdUhbxrqizZwyrYN765MKek6XAROtS4gHfb3xJfQHIsDViJOUmYVY7kHl?=
 =?us-ascii?Q?3vvyuMen/mZD7mAEcQqosRHbE6bzaMmn0pChijHn6SZ9hpVyfoSmWtmdUXC9?=
 =?us-ascii?Q?8dmVIqMtqm08zUomPJ0oQZOGbsOTaJRPA4ol4FwXLazBT9TpphopTsI7qlra?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f4c3808-f716-469d-68fd-08ddb24baa52
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 11:47:00.7777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9YRgilytEkJVX9kFte9a42LIiuPf/S/+ONgrpjrxaJBIRzVmtXaSpV8osR49YHMoEqsY3SgN0GlWsZ74ub8Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6391
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

On Mon, Jun 23, 2025 at 11:54:26AM +0200, Francois Dugast wrote:
> On Mon, Jun 16, 2025 at 12:06:39AM -0700, Matthew Brost wrote:
> > 64K is the fault size in Xe. Add sections to explicitly trigger these
> > faults, as they are interesting and having dedicated sections helps with
> > profiling the KMD.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Nit: to help clearly identify the tests, we could rename the previous
> section from "many-large-%s" to "many-2m-%s".
> 

I think that is a good idea but let's see if that messes with our CI stats.

Matt

> Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> 
> > ---
> >  tests/intel/xe_exec_system_allocator.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> > index 2a99bd435a..65d281c784 100644
> > --- a/tests/intel/xe_exec_system_allocator.c
> > +++ b/tests/intel/xe_exec_system_allocator.c
> > @@ -806,6 +806,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
> >   * Description: Run %arg[1] system allocator test many times with large allocations
> >   * Test category: stress test
> >   *
> > + * SUBTEST: many-64k-%s
> > + * Description: Run %arg[1] system allocator test many times with large allocations
> > + * Test category: stress test
> > + *
> >   * SUBTEST: many-large-execqueues-%s
> >   * Description: Run %arg[1] system allocator test on many exec_queues with large allocations
> >   *
> > @@ -1741,6 +1745,11 @@ igt_main
> >  				test_exec(fd, hwe, 1, 128, SZ_2M, 0, 0, NULL,
> >  					  NULL, s->flags);
> >  
> > +		igt_subtest_f("many-64k-%s", s->name)
> > +			xe_for_each_engine(fd, hwe)
> > +				test_exec(fd, hwe, 1, 128, SZ_64K, 0, 0, NULL,
> > +					  NULL, s->flags);
> > +
> >  		igt_subtest_f("many-large-execqueues-%s", s->name)
> >  			xe_for_each_engine(fd, hwe)
> >  				test_exec(fd, hwe, 16, 128, SZ_2M, 0, 0, NULL,
> > -- 
> > 2.34.1
> > 
