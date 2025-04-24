Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5009C369AB
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 19:29:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F2410E853;
	Thu, 24 Apr 2025 19:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jo73qX3W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDCC10E853
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 19:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745522982; x=1777058982;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rkYycO6VOoOT9uPOP0O1MaBTiAHvDxot1yTtnTylubQ=;
 b=jo73qX3WZCduvMJ9Za9uTOeqkFndzNyJhN+WpU+I3oB5imVqzI0vLcRh
 fpLnnV6C9tFXOqr7ZuCnZqR4tHC5MBKILTMuTsRbO249xiCu/eKmQLi4L
 tidih+Vt1lnb6LfbN+LAOqJzTc3AMxRsUGO5VwOTCQ5lS34iK05P/5LMm
 ROcIIQIOWv3MvrAUGpYFJGKA3moWWtwxeoGcczSlGZByYbJ2pqI88T9ZD
 JUQXecyzN6BTpbaQrtDghafzDSpI3HJ/kaDMZcO/T+oif6IXxNppPw4ld
 ppMI/HQFV6m6Vp1Zfwg7aEjhgW7le4dUOdfwdxm83GUK0ydSJLFkl0gEJ w==;
X-CSE-ConnectionGUID: XibmMjyuRaS+CuLD+zMbLg==
X-CSE-MsgGUID: tzS3tLa6RWenNzcPzpXO3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="69667785"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="69667785"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 12:29:39 -0700
X-CSE-ConnectionGUID: kNj7rj1KRqmdbXMTABPB2A==
X-CSE-MsgGUID: t7eSRlheSZyabDZPjqQYjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="132446956"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 12:29:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 12:29:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 12:29:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 12:29:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofk95qqI6ke5H57j6pbK6OQT9e9FIXuWvdXDUdMeGXp/aBkDZNTPQWOFsHIOZZ39dpGWDbPtRWgOMQ02/Q9igbOGcqqITyywet4JnlU/AE0XVbewBZ+qMb+BDPMGqZVp/nky71S3J5KzEnzbMSExGv4wQKFOpmIYBVh1D6bHS5jty3ZuU0QFW6JDuSeTna+2pvvYnCWA9OCBKwO2rnPX4RwrKYNr2ogSWU0R1ZOb/x31XPZCFNkgz91D8oPpPvEmQlOhJ2EhJcT0Nt7xOzWbhfrf3TBHseRD97jmERc/BSPTIDs6oc2M9ZG6cAnUBwC7AFYYay4k9L6B2rWKqy/Adg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwvHnpDI4Lz4+jX6KAlgMN/eSVTlsUaEUV2Gk/3vTMc=;
 b=WtI/1yzmKEZpLM2BPdD2wqzWwQisGReIWmes+mFMtUpyTFldThe0EjJwj1g3R/3kok9vGzlXqdZL6NAnCNywMP1XydjXS5BiRGONbLkTZn7OK0ogR81lIyYDXPNQvWDbN4h+ruHMPGlUj/HwX8hrj6FRETp/Eet6ANoe72LwRkE8Ue9vZgAu9GMdq9PLjhgyD0IbF4JAZ9Ml1n17aMugV9F0UoFbghTg9XF4bgJbYJKBTsjHFeteMHDM/mKlgijOJoYSoUL8ECoTyzqBwUNJkUuKqW54bwX0CxPBAyYPBhqtOkGvYzg8v07p9FsP+TdBHUXl1o1lvokdSwa/4msbSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7838.namprd11.prod.outlook.com (2603:10b6:208:402::12)
 by CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 24 Apr
 2025 19:29:27 +0000
Received: from IA0PR11MB7838.namprd11.prod.outlook.com
 ([fe80::62fc:d6dc:d0d2:bc4]) by IA0PR11MB7838.namprd11.prod.outlook.com
 ([fe80::62fc:d6dc:d0d2:bc4%4]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 19:29:27 +0000
Date: Thu, 24 Apr 2025 21:28:57 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] tests/xe: Add system_allocator test
Message-ID: <aAqQ-VuW2Jk6aauS@fdugast-desk>
References: <20250416022040.355100-1-matthew.brost@intel.com>
 <aAJ0K4YkFhGga42f@fdugast-desk>
 <aAKrs901pPWI/ZNz@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aAKrs901pPWI/ZNz@lstrano-desk.jf.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: WA1P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::24) To IA0PR11MB7838.namprd11.prod.outlook.com
 (2603:10b6:208:402::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7838:EE_|CO1PR11MB4851:EE_
X-MS-Office365-Filtering-Correlation-Id: eece5080-63b7-478e-f8ec-08dd83665398
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?fDlJ1Cj5PO+UujIsIwl2sGulBNQALlKrou733vooLPCrEwQyrv+v9FB2bY?=
 =?iso-8859-1?Q?6JsdPL+Rc0y4i4/QgbJGNhko9louGNfUoDpLoh3MCUF4og2CS1u+Az2oss?=
 =?iso-8859-1?Q?fXggnPB7AjR4pUoLO/SDt8kVLgIUFEtO6Zt0Z5sHlvo+a7kaj/SRjyssli?=
 =?iso-8859-1?Q?/fx1BANIzg50kAFPMI5IF0awwiT6HdRAyXJZ4CGUAW5l4PwCJQ84OG7A9l?=
 =?iso-8859-1?Q?Oo+L+bys7x7cKgq35LZhhbgN+Jwg9tzfmYM6i/SaGSgV0eovTU/LXuUdvz?=
 =?iso-8859-1?Q?ZVEJUVOfibTjJ5OOElD6Bxf1r2Isxxh34u9VHiAI7SwiprcBKi3e8cGZ86?=
 =?iso-8859-1?Q?u3J5K4MZGQUmJd5Y+CsyoQdDA1VESSp1HroLKsfeZrHeAW8fA6+eO7NyuF?=
 =?iso-8859-1?Q?43l1P28WSSFsG0bO6KmsCQqCAkX1vK50eUF4buADsayDnrxaLaGuQtcwJn?=
 =?iso-8859-1?Q?tlMjXonUqBcO0fOB6l0W3zU5pdX337uueT2l1AWidWS5uRq+nRsKWw+nB4?=
 =?iso-8859-1?Q?5U50AfLy4hQ3sHF1+F6mX7OMkUMuxDSDw+0JaEXniGHAD40oyp5YKnI5qC?=
 =?iso-8859-1?Q?EYUsIFZLksSs2VibWDiPavkHzJ5VqHixF400Sss45C90SIbEi342yrO0hv?=
 =?iso-8859-1?Q?86Qlc4/S5xkP7ix+xMa/0CN9la5PpOnfvrBoIrKzavPMSZvGkDzfjHKMFn?=
 =?iso-8859-1?Q?mz+S22aZmgWlABQ2xPf4hA9W6BVrkajJMn9ObgOei3a2ka+r8GFXE6bN+2?=
 =?iso-8859-1?Q?CEHIvn4wei0503QwMZ7KbZGRxo52soPfQK6jAaogps9hTtCoAJb7UoMiDY?=
 =?iso-8859-1?Q?ZL2Rfc+7pus0JtmqewAwuCq6b6I34mlkoLgQH/VT6NvgpjVf1aCuh6tEU6?=
 =?iso-8859-1?Q?lJ2EJoRJ63amj9Ro6QJJOYSAqx6LnFv9sTqutEDWxhm1vVauJEaanX9sC0?=
 =?iso-8859-1?Q?NIIuWZfBVc1QW+SOhj+epy90g5vw9Mhn2qOUXY7SQr2DzhXkXlwQKd4aw4?=
 =?iso-8859-1?Q?beWzyRuLnoqg2WHNU4LE6b2q63OwxB9e/GtUBA4VPKIGBnI64XoU/TNA0K?=
 =?iso-8859-1?Q?tHfh4YKq0/I+dhycI8ccvDSJcp8iaBFNzMmgP4q+zfFlUod3MvenBvnRkd?=
 =?iso-8859-1?Q?TUMN+22dOJuHtjd/cTGnnzLtApwY8r3AVk/2SlHK06p/ENehMDMnc9PbsB?=
 =?iso-8859-1?Q?lyHq2ceJhZLL4/tn59caSJIRnxHcEIlERTTnNe6EScK/Brt08HJiZUMh4v?=
 =?iso-8859-1?Q?z4xdrkk3cyzd+d+9AJizRvt9HCnqIHDcREFPjjJQqNbgcuvKE4JmYUoKxN?=
 =?iso-8859-1?Q?1ejmqALdzsc4IkJ49fN+Oz+UCL+sbSOO9npqP5OmUERbzbTP1LNumLZzy7?=
 =?iso-8859-1?Q?PvKAzEgbyyTBbI/VRk6nDS/FQcbkejNZWF1tH1zS0YnhfhfVbwxGPqj4Tu?=
 =?iso-8859-1?Q?nxl1ADV0uuMKYAwaIGvJMiJo0ScGmLQsT3nuUI2q4yhqdIbnvZcDtNpbiq?=
 =?iso-8859-1?Q?g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7838.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?seG60ezRFE4yVy2WIIpRnABsnCLHivlSJ9f0iMbOV/3GCRvlU+MP1XM/bs?=
 =?iso-8859-1?Q?oHbFz7NQP6GgLp96gIs05rBBk/T3j6ExpQWFZwoSQIDtHvYRuXDWJDWPvQ?=
 =?iso-8859-1?Q?A5UNORYYdkBcAn6McMu3npuuU9quEWGjYFgWS0XfWD5xC+YGIhRn+Tac+L?=
 =?iso-8859-1?Q?Erbq/YBYENpZzwEVdP9hfW+j9A3n6IQSzKaPyVKyrhQK0q+zf+lNISan9X?=
 =?iso-8859-1?Q?j0cv/upTxXnjLLIXu2ueZgvdysrhtqNxZJNaMGHj0ePlnZhrqjnGi2Hr4F?=
 =?iso-8859-1?Q?CdS3fVfZcbBNg8vBAeXTPeW06LTQLZwzmkG5iZCCVUcxN3dUwBITeVtRm4?=
 =?iso-8859-1?Q?eQrgnIUK1qFJWgpJQvk4XZ/Dx4jM++oC4Zfqrrb7KKZGUPfFsOubu6sEcm?=
 =?iso-8859-1?Q?ZqTQDrR5igmr3NQZC4PnuRA3xw+n1Vi4pNfvon/xWkhS9McQs0Hv85UUo6?=
 =?iso-8859-1?Q?dQCGas+qpg4UCCS5roAneSxNZKmofiLII82Ah9JlJ/Q0sIZAO/pBcl71Bo?=
 =?iso-8859-1?Q?3xx4LzDd0NeDiEdrFOIb9EgyAdr1f6gE73agjf6o91doh5GGuCGBX8tmg2?=
 =?iso-8859-1?Q?yBEw7EPTKfSroyVK3BppoQJM0zpEMUmC062cBP6hSJARron4d7lhTlWwbz?=
 =?iso-8859-1?Q?zSC0UinS4j05lF6CTS3Fst8WeO/MAAXtihncZbzUFzwdUStkIBvGV1axYl?=
 =?iso-8859-1?Q?N36NIuI0Rb7nPcTqF5gi9Cp54HcrMcD34TzfEBY8KuiGZkeKl0Jnhh+DlE?=
 =?iso-8859-1?Q?4bc5vLOeIpr1G4cSdzCt8G7sFQxt5HZX2v66DaDJJOAK2UuT3lGEept0RN?=
 =?iso-8859-1?Q?RQuYx9L8a/ZryK2ZtBZgtnlUsCJx3MI8eNRHB4oGQ6UCebkAMJyoQjiu7B?=
 =?iso-8859-1?Q?AQDqf/Ytweb+6VBRC31OMDYB1IbQvP7oRMEP0oBwBTqs42XdKTWTW42Lny?=
 =?iso-8859-1?Q?AejiAxSQAzn60kpSlS5XaBGNVywStkUyDZ1CBqB8yw6Af8+TCwzZ/lrh5x?=
 =?iso-8859-1?Q?B/4nM+xgjWA1yFI+ocHosjJyBaEzpGDVMmQdWGXndhAQEymPW6sDADFrTR?=
 =?iso-8859-1?Q?n1Ew1AxLj/ZwXFFhajFksOtZWSnWXofXeUWRoU5m0JGhAOKwK3zLMQUOXm?=
 =?iso-8859-1?Q?h+aTET+6z81+y2mNatB0opz9krPaHayqVOyq6z+k8Zibbx8bjNkUdDCrI7?=
 =?iso-8859-1?Q?2Q71V4L3FFWMM87cuzj5XFNOjMXTZ0l4t1umezwgvkyUQ8Hs1zbc9ZqKi6?=
 =?iso-8859-1?Q?BGOtgFUejOJWp/28bbc4hLVZKmRETfFnh9g05pChjQ5REnQtahBME93YIX?=
 =?iso-8859-1?Q?VX+qy3zK/8C5D21BcRxJ7Blqj5bi0ID7SN7DEQPCfgsD/Q7cIU03ww8++i?=
 =?iso-8859-1?Q?tbLZDmBFBAt/gvQIyVfzLSdVPefwkIrXDwQvGQxlV2ypXXx22ORTjGhPuU?=
 =?iso-8859-1?Q?eduy+XoCmhwwMfg3NVV+7IylriQqCS69I1ec/09DgJz36vphAy4s+dX5V+?=
 =?iso-8859-1?Q?jeMZS+SRjSb5SbDOvOf2PEVHHObEroIqhu/XQTdcoaglubkApBqnKNiA7M?=
 =?iso-8859-1?Q?pK7qo4txw3+PKtLkY6Amjw9NOfa3VRAcVGjhCPoShpR2GLQUyvD4+pm20U?=
 =?iso-8859-1?Q?6lbSBPFDdvoiaSBuYqtTC+K2JJOEQND1evToXvniy+UvhZnRnj6ivmig?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eece5080-63b7-478e-f8ec-08dd83665398
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7838.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 19:29:27.5591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3eexk2/FeB4yAVOJc73KVDo+j4ckDyOTwl1uM5LeSX+Ahm4lNADr8juvgrAl0U7hvcYcmgF7Nwqilo/dnuBl1Tcu3x3VcClshjU8Hjublts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4851
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

Hi,

On Fri, Apr 18, 2025 at 12:44:51PM -0700, Matthew Brost wrote:
> On Fri, Apr 18, 2025 at 05:47:55PM +0200, Francois Dugast wrote:
> > Hi Matt,
> > 
> > I am still going through your patch but sharing some comments already.
> > 
> > The sequence is neither complex nor too different from existing tests
> > but as it is a lot of multi-thread / multi-process code, I am trying
> > to come up with a suggestion to break it down. Might not be possible
> > though.
> > 
> 
> Good to hear you don't find it too complex, open spliting if it makes
> sense.
> 
> > On Tue, Apr 15, 2025 at 07:20:40PM -0700, Matthew Brost wrote:
> > > Test various uses of system allocator in single thread, multiple
> > > threads, and multiple processes.
> > > 
> > > Features tested:
> > >  - Malloc with various size
> > >  - Mmap with various sizes and flags including file backed mappings
> > >  - Mixing BO allocations with system allocator
> > >  - Various page sizes
> > >  - Dynamically freeing / unmapping memory
> > >  - Sharing VM across threads
> > >  - Faults racing on different hardware engines / GTs / Tiles
> > >  - GPU faults and CPU faults racing
> > >  - CPU faults on multiple threads racing
> > >  - CPU faults on multiple process racing
> > >  - GPU faults of memory not faulted in by CPU
> > >  - Partial unmap of allocations
> > >  - Attempting to unmap system allocations when GPU has mappings
> > >  - Eviction of both system allocations and BOs
> > >  - Forking child processes and reading data from VRAM
> > >  - mremap data in VRAM
> > >  - Protection changes
> > >  - Multiple faults per execbuf
> > > 
> > > Running on LNL, BMG, PVC 1 tile, and PVC 2 tile.
> > > 
> > > v2:
> > >  - Rebase
> > >  - Fix memory allocation to not interfear with malloc (Thomas)
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  include/drm-uapi/xe_drm.h              |   57 +-
> > >  lib/xe/xe_ioctl.c                      |   12 +
> > >  lib/xe/xe_ioctl.h                      |    1 +
> > >  tests/intel/xe_exec_system_allocator.c | 1832 ++++++++++++++++++++++++
> > >  tests/meson.build                      |    1 +
> > >  5 files changed, 1896 insertions(+), 7 deletions(-)
> > >  create mode 100644 tests/intel/xe_exec_system_allocator.c
> > > 
> > > diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> > > index 154f947ef0..9c08738c3b 100644
> > > --- a/include/drm-uapi/xe_drm.h
> > > +++ b/include/drm-uapi/xe_drm.h
> > > @@ -3,8 +3,8 @@
> > >   * Copyright © 2023 Intel Corporation
> > >   */
> > >  
> > > -#ifndef _XE_DRM_H_
> > > -#define _XE_DRM_H_
> > > +#ifndef _UAPI_XE_DRM_H_
> > > +#define _UAPI_XE_DRM_H_
> > 
> > Nit: The header seems to have been copied directly from the kernel tree, instead
> > it should be generated with:
> > 
> >     make headers_install
> > 
> > https://docs.kernel.org/kbuild/headers_install.html
> > 
> 
> Let me split out the uAPI update into its own patch + use the proper
> flow.

Sounds good.

> 
> > >  
> > >  #include "drm.h"
> > >  
> > > @@ -134,7 +134,7 @@ extern "C" {
> > >   * redefine the interface more easily than an ever growing struct of
> > >   * increasing complexity, and for large parts of that interface to be
> > >   * entirely optional. The downside is more pointer chasing; chasing across
> > > - * the boundary with pointers encapsulated inside u64.
> > > + * the __user boundary with pointers encapsulated inside u64.
> > 
> > See above comment on make headers_install.
> > 
> 
> +1
> 
> > >   *
> > >   * Example chaining:
> > >   *
> > > @@ -393,6 +393,10 @@ struct drm_xe_query_mem_regions {
> > >   *
> > >   *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
> > >   *      has usable VRAM
> > > + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - Flag is set if the device
> > > + *      has low latency hint support
> > > + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag is set if the
> > > + *      device has CPU address mirroring support
> > >   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
> > >   *    required by this device, typically SZ_4K or SZ_64K
> > >   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> > > @@ -409,6 +413,8 @@ struct drm_xe_query_config {
> > >  #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
> > >  #define DRM_XE_QUERY_CONFIG_FLAGS			1
> > >  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> > > +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
> > > +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
> > >  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> > >  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
> > >  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> > > @@ -911,7 +917,11 @@ struct drm_xe_gem_mmap_offset {
> > >   * struct drm_xe_vm_create - Input of &DRM_IOCTL_XE_VM_CREATE
> > >   *
> > >   * The @flags can be:
> > > - *  - %DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
> > > + *  - %DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE - Map the whole virtual address
> > > + *    space of the VM to scratch page. A vm_bind would overwrite the scratch
> > > + *    page mapping. This flag is mutually exclusive with the
> > > + *    %DRM_XE_VM_CREATE_FLAG_FAULT_MODE flag, with an exception of on x2 and
> > > + *    xe3 platform.
> > >   *  - %DRM_XE_VM_CREATE_FLAG_LR_MODE - An LR, or Long Running VM accepts
> > >   *    exec submissions to its exec_queues that don't have an upper time
> > >   *    limit on the job execution time. But exec submissions to these
> > > @@ -987,6 +997,12 @@ struct drm_xe_vm_destroy {
> > >   *  - %DRM_XE_VM_BIND_FLAG_CHECK_PXP - If the object is encrypted via PXP,
> > >   *    reject the binding if the encryption key is no longer valid. This
> > >   *    flag has no effect on BOs that are not marked as using PXP.
> > > + *  - %DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR - When the CPU address mirror flag is
> > > + *    set, no mappings are created rather the range is reserved for CPU address
> > > + *    mirroring which will be populated on GPU page faults or prefetches. Only
> > > + *    valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The CPU address
> > > + *    mirror flag are only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
> > > + *    handle MBZ, and the BO offset MBZ.
> > >   */
> > >  struct drm_xe_vm_bind_op {
> > >  	/** @extensions: Pointer to the first extension struct, if any */
> > > @@ -1039,7 +1055,9 @@ struct drm_xe_vm_bind_op {
> > >  	 * on the @pat_index. For such mappings there is no actual memory being
> > >  	 * mapped (the address in the PTE is invalid), so the various PAT memory
> > >  	 * attributes likely do not apply.  Simply leaving as zero is one
> > > -	 * option (still a valid pat_index).
> > > +	 * option (still a valid pat_index). Same applies to
> > > +	 * DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR bindings as for such mapping
> > > +	 * there is no actual memory being mapped.
> > >  	 */
> > >  	__u16 pat_index;
> > >  
> > > @@ -1055,6 +1073,14 @@ struct drm_xe_vm_bind_op {
> > >  
> > >  		/** @userptr: user pointer to bind on */
> > >  		__u64 userptr;
> > > +
> > > +		/**
> > > +		 * @cpu_addr_mirror_offset: Offset from GPU @addr to create
> > > +		 * CPU address mirror mappings. MBZ with current level of
> > > +		 * support (e.g. 1 to 1 mapping between GPU and CPU mappings
> > > +		 * only supported).
> > > +		 */
> > > +		__s64 cpu_addr_mirror_offset;
> > >  	};
> > >  
> > >  	/**
> > > @@ -1078,6 +1104,7 @@ struct drm_xe_vm_bind_op {
> > >  #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
> > >  #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
> > >  #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
> > > +#define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
> > >  	/** @flags: Bind flags */
> > >  	__u32 flags;
> > >  
> > > @@ -1205,6 +1232,21 @@ struct drm_xe_vm_bind {
> > >   *     };
> > >   *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
> > >   *
> > > + *     Allow users to provide a hint to kernel for cases demanding low latency
> > > + *     profile. Please note it will have impact on power consumption. User can
> > > + *     indicate low latency hint with flag while creating exec queue as
> > > + *     mentioned below,
> > > + *
> > > + *     struct drm_xe_exec_queue_create exec_queue_create = {
> > > + *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT,
> > > + *          .extensions = 0,
> > > + *          .vm_id = vm,
> > > + *          .num_bb_per_exec = 1,
> > > + *          .num_eng_per_bb = 1,
> > > + *          .instances = to_user_pointer(&instance),
> > > + *     };
> > > + *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
> > > + *
> > >   */
> > >  struct drm_xe_exec_queue_create {
> > >  #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
> > > @@ -1223,7 +1265,8 @@ struct drm_xe_exec_queue_create {
> > >  	/** @vm_id: VM to use for this exec queue */
> > >  	__u32 vm_id;
> > >  
> > > -	/** @flags: MBZ */
> > > +#define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
> > > +	/** @flags: flags to use for this exec queue */
> > >  	__u32 flags;
> > >  
> > >  	/** @exec_queue_id: Returned exec queue ID */
> > > @@ -1926,4 +1969,4 @@ struct drm_xe_query_eu_stall {
> > >  }
> > >  #endif
> > >  
> > > -#endif /* _XE_DRM_H_ */
> > > +#endif /* _UAPI_XE_DRM_H_ */
> > > diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> > > index fb8c4aef13..785fc9184c 100644
> > > --- a/lib/xe/xe_ioctl.c
> > > +++ b/lib/xe/xe_ioctl.c
> > > @@ -440,6 +440,18 @@ void *xe_bo_map(int fd, uint32_t bo, size_t size)
> > >  	return __xe_bo_map(fd, bo, size, PROT_WRITE);
> > >  }
> > >  
> > > +void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, uint64_t addr)
> > > +{
> > > +	uint64_t mmo;
> > > +	void *map;
> > > +
> > > +	mmo = xe_bo_mmap_offset(fd, bo);
> > > +	map = mmap((void *)addr, size, PROT_WRITE, MAP_SHARED | MAP_FIXED, fd, mmo);
> > > +	igt_assert(map != MAP_FAILED);
> > > +
> > > +	return map;
> > > +}
> > > +
> > >  void *xe_bo_mmap_ext(int fd, uint32_t bo, size_t size, int prot)
> > >  {
> > >  	return __xe_bo_map(fd, bo, size, prot);
> > > diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> > > index 9bdf73b2bd..554a33c9cd 100644
> > > --- a/lib/xe/xe_ioctl.h
> > > +++ b/lib/xe/xe_ioctl.h
> > > @@ -86,6 +86,7 @@ uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class);
> > >  void xe_exec_queue_destroy(int fd, uint32_t exec_queue);
> > >  uint64_t xe_bo_mmap_offset(int fd, uint32_t bo);
> > >  void *xe_bo_map(int fd, uint32_t bo, size_t size);
> > > +void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, long unsigned int addr);
> > >  void *xe_bo_mmap_ext(int fd, uint32_t bo, size_t size, int prot);
> > >  int __xe_exec(int fd, struct drm_xe_exec *exec);
> > >  void xe_exec(int fd, struct drm_xe_exec *exec);
> > > diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> > > new file mode 100644
> > > index 0000000000..14fa59353e
> > > --- /dev/null
> > > +++ b/tests/intel/xe_exec_system_allocator.c
> > > @@ -0,0 +1,1832 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2024 Intel Corporation
> > > + */
> > > +
> > > +/**
> > > + * TEST: Basic tests for execbuf functionality using system allocator
> > > + * Category: Hardware building block
> > > + * Mega feature: Shared virtual memory
> > > + * Sub-category: execbuf
> > > + * Functionality: fault mode, system allocator
> > > + * GPU requirements: GPU needs support for DRM_XE_VM_CREATE_FLAG_FAULT_MODE

Using this below will help test automation and reporting:

     * TEST: Basic tests for execbuf functionality using system allocator
     * Category: Core
     * Mega feature: USM
     * Sub-category: System allocator
     * Functionality: fault mode, system allocator
     * GPU: LNL, BMG, PVC

> > > + */
> > > +
> > > +#include <fcntl.h>
> > > +#include <linux/mman.h>
> > > +#include <time.h>
> > > +
> > > +#include "igt.h"
> > > +#include "lib/igt_syncobj.h"
> > > +#include "lib/intel_reg.h"
> > > +#include "xe_drm.h"
> > > +
> > > +#include "xe/xe_ioctl.h"
> > > +#include "xe/xe_query.h"
> > > +#include <string.h>
> > > +
> > > +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> > > +#define QUARTER_SEC		(NSEC_PER_SEC / 4)
> > > +#define FIVE_SEC		(5LL * NSEC_PER_SEC)
> > > +
> > > +struct batch_data {
> > > +	uint32_t batch[16];
> > > +	uint64_t pad;
> > > +	uint32_t data;
> > > +	uint32_t expected_data;
> > > +};
> > > +
> > > +#define WRITE_VALUE(data__, i__)	({			\
> > > +	if (!(data__)->expected_data)				\
> > > +		(data__)->expected_data = rand() << 12 | (i__);	\
> > > +	(data__)->expected_data;				\
> > > +})
> > > +#define READ_VALUE(data__, i__)	((data__)->expected_data)

Argument i__ is not used.

> > > +
> > > +static void __write_dword(uint32_t *batch, uint64_t sdi_addr, uint32_t wdata,
> > > +			int *idx)
> > > +{
> > > +	batch[(*idx)++] = MI_STORE_DWORD_IMM_GEN4;
> > > +	batch[(*idx)++] = sdi_addr;
> > > +	batch[(*idx)++] = sdi_addr >> 32;
> > > +	batch[(*idx)++] = wdata;
> > > +}
> > > +
> > > +static void write_dword(uint32_t *batch, uint64_t sdi_addr, uint32_t wdata,
> > > +			int *idx)
> > > +{
> > > +	__write_dword(batch, sdi_addr, wdata, idx);
> > > +	batch[(*idx)++] = MI_BATCH_BUFFER_END;
> > > +}
> > 
> > Slightly out of scope for this review but the 2 functions above might be
> > helpful under lib/ to prevent adding more duplications of the dword write
> > batch sequence.
> > 
> 
> Yea we could split out generic batch writing functions into a library at
> some point but agree is probably out of scope for this series.
> 
> > > +
> > > +static void check_all_pages(void *ptr, uint64_t alloc_size, uint64_t stride,
> > > +			    pthread_barrier_t *barrier)
> > > +{
> > > +	int i, n_writes = alloc_size / stride;
> > > +
> > > +	for (i = 0; i < n_writes; ++i) {
> > > +		struct batch_data *data = ptr + i * stride;
> > > +
> > > +		igt_assert_eq(data->data, READ_VALUE(data, i));
> > > +
> > > +		if (barrier)
> > > +			pthread_barrier_wait(barrier);
> > > +	}
> > > +}
> > > +
> > > +#define SYNC_FILE	"/tmp/xe_exec_system_allocator_sync"
> > 
> > Might be worth creating and propagating a unique file name at runtime, for
> > example with mkstemp(), in order to avoid potential concurrent accesses from
> > multiple instances of the test.
> > 
> 
> Let me look into that.
> 
> > > +
> > > +struct process_data {
> > > +	pthread_mutex_t mutex;
> > > +	pthread_cond_t cond;
> > > +	pthread_barrier_t barrier;
> > > +	bool go;
> > > +};
> > > +
> > > +static void wait_pdata(struct process_data *pdata)
> > > +{
> > > +	pthread_mutex_lock(&pdata->mutex);
> > > +	while (!pdata->go)
> > > +		pthread_cond_wait(&pdata->cond, &pdata->mutex);
> > > +	pthread_mutex_unlock(&pdata->mutex);
> > > +}
> > > +
> > > +static void init_pdata(struct process_data *pdata, int n_engine)
> > > +{
> > > +	pthread_mutexattr_t mutex_attr;
> > > +	pthread_condattr_t cond_attr;
> > > +	pthread_barrierattr_t barrier_attr;
> > > +
> > > +	pthread_mutexattr_init(&mutex_attr);
> > > +	pthread_mutexattr_setpshared(&mutex_attr, PTHREAD_PROCESS_SHARED);
> > > +	pthread_mutex_init(&pdata->mutex, &mutex_attr);
> > > +
> > > +	pthread_condattr_init(&cond_attr);
> > > +	pthread_condattr_setpshared(&cond_attr, PTHREAD_PROCESS_SHARED);
> > > +	pthread_cond_init(&pdata->cond, &cond_attr);
> > > +
> > > +	pthread_barrierattr_init(&barrier_attr);
> > > +	pthread_barrierattr_setpshared(&barrier_attr, PTHREAD_PROCESS_SHARED);
> > > +	pthread_barrier_init(&pdata->barrier, &barrier_attr, n_engine);
> > > +
> > > +	pdata->go = false;
> > > +}
> > > +
> > > +static void signal_pdata(struct process_data *pdata)
> > > +{
> > > +	pthread_mutex_lock(&pdata->mutex);
> > > +	pdata->go = true;
> > > +	pthread_cond_broadcast(&pdata->cond);
> > > +	pthread_mutex_unlock(&pdata->mutex);
> > > +}
> > > +
> > > +/* many_alloc flags */
> > > +#define MIX_BO_ALLOC		(0x1 << 0)
> > > +#define BENCHMARK		(0x1 << 1)
> > > +#define CPU_FAULT_THREADS	(0x1 << 2)
> > > +#define CPU_FAULT_PROCESS	(0x1 << 3)
> > > +#define CPU_FAULT_SAME_PAGE	(0x1 << 4)
> > > +
> > > +static void process_check(void *ptr, uint64_t alloc_size, uint64_t stride,
> > > +			  unsigned int flags)
> > > +{
> > > +	struct process_data *pdata;
> > > +	int map_fd;
> > > +
> > > +	map_fd = open(SYNC_FILE, O_RDWR, 0x666);
> > > +	pdata = mmap(NULL, sizeof(*pdata), PROT_READ |
> > > +		     PROT_WRITE, MAP_SHARED, map_fd, 0);
> > > +	wait_pdata(pdata);
> > > +
> > > +	if (flags & CPU_FAULT_SAME_PAGE)
> > > +		check_all_pages(ptr, alloc_size, stride, &pdata->barrier);
> > > +	else
> > > +		check_all_pages(ptr, alloc_size, stride, NULL);
> > > +
> > > +	close(map_fd);
> > > +	munmap(pdata, sizeof(*pdata));
> > > +}
> > > +
> > > +static void
> > > +check_all_pages_process(void *ptr, uint64_t alloc_size, uint64_t stride,
> > > +			int n_process, unsigned int flags)

It would be helpful to add here a comment similar to the one below for
check_all_pages_threads().

> > > +{
> > > +	struct process_data *pdata;
> > > +	int map_fd, i;
> > > +
> > > +	map_fd = open(SYNC_FILE, O_RDWR | O_CREAT, 0x666);
> > > +	posix_fallocate(map_fd, 0, sizeof(*pdata));
> > > +	pdata = mmap(NULL, sizeof(*pdata), PROT_READ |
> > > +		     PROT_WRITE, MAP_SHARED, map_fd, 0);
> > > +
> > > +	init_pdata(pdata, n_process);
> > > +
> > > +	for (i = 0; i < n_process; ++i) {
> > > +		igt_fork(child, 1)
> > > +			if (flags & CPU_FAULT_SAME_PAGE)
> > > +				process_check(ptr, alloc_size, stride, flags);
> > > +			else
> > > +				process_check(ptr + stride * i, alloc_size,
> > > +					      stride * n_process, flags);
> > > +	}
> > > +
> > > +	signal_pdata(pdata);
> > > +	igt_waitchildren();
> > > +
> > > +	close(map_fd);
> > > +	munmap(pdata, sizeof(*pdata));
> > > +}
> > > +
> > > +struct thread_check_data {
> > > +	pthread_t thread;
> > > +	pthread_mutex_t *mutex;
> > > +	pthread_cond_t *cond;
> > > +	pthread_barrier_t *barrier;
> > > +	void *ptr;
> > > +	uint64_t alloc_size;
> > > +	uint64_t stride;
> > > +	bool *go;
> > > +};
> > > +
> > > +static void *thread_check(void *data)
> > > +{
> > > +	struct thread_check_data *t = data;
> > > +
> > > +	pthread_mutex_lock(t->mutex);
> > > +	while (!*t->go)
> > > +		pthread_cond_wait(t->cond, t->mutex);
> > > +	pthread_mutex_unlock(t->mutex);
> > > +
> > > +	check_all_pages(t->ptr, t->alloc_size, t->stride, t->barrier);
> > > +
> > > +	return NULL;
> > > +}
> > > +
> > > +/*
> > > + * Partition checking of results in chunks which causes multiple threads to
> > > + * fault same VRAM allocation in parallel.
> > > + */
> > > +static void
> > > +check_all_pages_threads(void *ptr, uint64_t alloc_size, uint64_t stride,
> > > +			int n_threads, unsigned int flags)
> > > +{
> > > +	struct thread_check_data *threads_check_data;
> > > +	pthread_mutex_t mutex;
> > > +	pthread_cond_t cond;
> > > +	pthread_barrier_t barrier;
> > > +	int i;
> > > +	bool go = false;
> > > +
> > > +	threads_check_data = calloc(n_threads, sizeof(*threads_check_data));
> > > +	igt_assert(threads_check_data);
> > > +
> > > +	pthread_mutex_init(&mutex, 0);
> > > +	pthread_cond_init(&cond, 0);
> > > +	pthread_barrier_init(&barrier, 0, n_threads);
> > > +
> > > +	for (i = 0; i < n_threads; ++i) {
> > > +		threads_check_data[i].mutex = &mutex;
> > > +		threads_check_data[i].cond = &cond;
> > > +		if (flags & CPU_FAULT_SAME_PAGE) {
> > > +			threads_check_data[i].barrier = &barrier;
> > > +			threads_check_data[i].ptr = ptr;
> > > +			threads_check_data[i].alloc_size = alloc_size;
> > > +			threads_check_data[i].stride = stride;
> > > +		} else {
> > > +			threads_check_data[i].barrier = NULL;
> > > +			threads_check_data[i].ptr = ptr + stride * i;
> > > +			threads_check_data[i].alloc_size = alloc_size;
> > > +			threads_check_data[i].stride = n_threads * stride;
> > > +		}
> > > +		threads_check_data[i].go = &go;
> > > +
> > > +		pthread_create(&threads_check_data[i].thread, 0, thread_check,
> > > +			       &threads_check_data[i]);
> > > +	}
> > > +
> > > +	pthread_mutex_lock(&mutex);
> > > +	go = true;
> > > +	pthread_cond_broadcast(&cond);
> > > +	pthread_mutex_unlock(&mutex);
> > > +
> > > +	for (i = 0; i < n_threads; ++i)
> > > +		pthread_join(threads_check_data[i].thread, NULL);
> > > +	free(threads_check_data);
> > > +}
> > > +
> > > +static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
> > > +			    uint64_t alloc_size, uint64_t stride,
> > > +			    struct timespec *tv, uint64_t *submit)
> > > +{
> > > +	struct drm_xe_sync sync[1] = {
> > > +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
> > > +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > > +		  .timeline_value = USER_FENCE_VALUE },
> > > +	};
> > > +	struct drm_xe_exec exec = {
> > > +		.num_batch_buffer = 1,
> > > +		.num_syncs = 0,
> > > +		.exec_queue_id = exec_queue,
> > > +		.syncs = to_user_pointer(&sync),
> > > +	};
> > > +	uint64_t addr = to_user_pointer(ptr);
> > > +	int i, ret, n_writes = alloc_size / stride;
> > > +	u64 *exec_ufence = NULL;
> > > +	int64_t timeout = FIVE_SEC;
> > > +
> > > +	exec_ufence = mmap(NULL, SZ_4K, PROT_READ |
> > > +			   PROT_WRITE, MAP_SHARED |
> > > +			   MAP_ANONYMOUS, -1, 0);
> > > +	igt_assert(exec_ufence != MAP_FAILED);
> > > +	memset(exec_ufence, 0, SZ_4K);
> > > +	sync[0].addr = to_user_pointer(exec_ufence);
> > > +
> > > +	for (i = 0; i < n_writes; ++i, addr += stride) {
> > > +		struct batch_data *data = ptr + i * stride;
> > > +		uint64_t sdi_offset = (char *)&data->data - (char *)data;
> > > +		uint64_t sdi_addr = addr + sdi_offset;
> > > +		int b = 0;
> > > +
> > > +		write_dword(data->batch, sdi_addr, WRITE_VALUE(data, i), &b);
> > > +		igt_assert(b <= ARRAY_SIZE(data->batch));
> > > +	}
> > > +
> > > +	igt_nsec_elapsed(tv);
> > > +	*submit = igt_nsec_elapsed(tv);
> > > +
> > > +	addr = to_user_pointer(ptr);
> > > +	for (i = 0; i < n_writes; ++i, addr += stride) {
> > > +		struct batch_data *data = ptr + i * stride;
> > > +		uint64_t batch_offset = (char *)&data->batch - (char *)data;
> > > +		uint64_t batch_addr = addr + batch_offset;
> > > +
> > > +		exec.address = batch_addr;
> > > +		if (i + 1 == n_writes)
> > > +			exec.num_syncs = 1;
> > > +		xe_exec(fd, &exec);
> > > +	}
> > > +
> > > +	ret = __xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, exec_queue,
> > > +			       &timeout);
> > > +	if (ret) {
> > > +		printf("FAIL EXEC_UFENCE_ADDR: 0x%016llx\n", sync[0].addr);
> > > +		printf("FAIL EXEC_UFENCE: EXPEXCTED=0x%016llx, ACTUAL=0x%016lx\n",
> > > +		       USER_FENCE_VALUE, exec_ufence[0]);

s/EXPEXCTED/EXPECTED/

Also, we should probably use IGT's log functions such as igt_info() instead
of printf().

> > > +
> > > +		addr = to_user_pointer(ptr);
> > > +		for (i = 0; i < n_writes; ++i, addr += stride) {
> > > +			struct batch_data *data = ptr + i * stride;
> > > +			uint64_t batch_offset = (char *)&data->batch - (char *)data;
> > > +			uint64_t batch_addr = addr + batch_offset;
> > > +			uint64_t sdi_offset = (char *)&data->data - (char *)data;
> > > +			uint64_t sdi_addr = addr + sdi_offset;
> > > +
> > > +			printf("FAIL BATCH_ADDR: 0x%016lx\n", batch_addr);
> > > +			printf("FAIL SDI_ADDR: 0x%016lx\n", sdi_addr);
> > > +			printf("FAIL SDI_ADDR (in batch): 0x%016lx\n",
> > > +			       (((u64)data->batch[2]) << 32) | data->batch[1]);
> > > +			printf("FAIL DARA: EXPEXCTED=0x%08x, ACTUAL=0x%08x\n",
> > > +			       data->expected_data, data->data);

s/DARA/DATA/ and s/EXPEXCTED/EXPECTED/ and same as above for printf().

> > > +		}
> > > +		igt_assert_eq(ret, 0);
> > > +	}
> > > +	munmap(exec_ufence, SZ_4K);
> > > +}
> > > +
> > > +static int va_bits;
> > > +
> > > +#define bind_system_allocator(__sync, __num_sync)			\
> > > +	__xe_vm_bind_assert(fd, vm, 0,					\
> > > +			    0, 0, 0, 0x1ull << va_bits,			\
> > > +			    DRM_XE_VM_BIND_OP_MAP,			\
> > > +			    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,	\
> > > +			    (__sync), (__num_sync), 0, 0)
> > > +
> > > +#define unbind_system_allocator()				\
> > > +	__xe_vm_bind(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,	\
> > > +		     DRM_XE_VM_BIND_OP_UNMAP, 0,		\
> > > +		     NULL, 0, 0, 0, 0)
> > 
> > Is there a reason here to favor static variable + macros over helper function
> > with parameters?
> > 
> 
> va_bits is static as it looked up exactly once when the test loads.
> 
> I could change these helpers to static functions rather than macros if
> that is preferred.

It forces variable names in the caller but that is just a minor issue.

> 
> > > +
> > > +#define odd(__i)	(__i & 1)
> > > +
> > > +struct aligned_alloc_type {
> > > +	void *__ptr;
> > > +	void *ptr;
> > > +	size_t __size;
> > > +	size_t size;
> > > +};
> > > +
> > > +static struct aligned_alloc_type __aligned_alloc(size_t alignment, size_t size)
> > > +{
> > > +	struct aligned_alloc_type aligned_alloc_type;
> > > +
> > > +	aligned_alloc_type.__ptr = mmap(NULL, alignment + size, PROT_NONE, MAP_PRIVATE |
> > > +			      MAP_ANONYMOUS, -1, 0);
> > > +	igt_assert(aligned_alloc_type.__ptr != MAP_FAILED);
> > > +
> > > +	aligned_alloc_type.ptr = (void *)ALIGN((uint64_t)aligned_alloc_type.__ptr, alignment);
> > > +	aligned_alloc_type.size = size;
> > > +	aligned_alloc_type.__size = size + alignment;
> > > +
> > > +	return aligned_alloc_type;
> > > +}
> > > +
> > > +static void __aligned_free(struct aligned_alloc_type  *aligned_alloc_type)
> > > +{
> > > +	munmap(aligned_alloc_type->__ptr, aligned_alloc_type->__size);
> > > +}
> > > +
> > > +static void __aligned_partial_free(struct aligned_alloc_type  *aligned_alloc_type)
> > > +{
> > > +	size_t begin_size = (size_t)(aligned_alloc_type->ptr - aligned_alloc_type->__ptr);
> > > +
> > > +	if (begin_size)
> > > +		munmap(aligned_alloc_type->__ptr, begin_size);
> > > +	if (aligned_alloc_type->__size - aligned_alloc_type->size - begin_size)
> > > +		munmap(aligned_alloc_type->ptr + aligned_alloc_type->size,
> > > +		       aligned_alloc_type->__size - aligned_alloc_type->size - begin_size);
> > > +}
> > > +
> > > +/**
> > > + * SUBTEST: unaligned-alloc
> > > + * Description: allocate unaligned sizes of memory
> > > + * Test category: functionality test
> > > + *
> > > + * SUBTEST: fault-benchmark
> > > + * Description: Benchmark how long GPU / CPU take
> > > + * Test category: performance test
> > > + *
> > > + * SUBTEST: fault-threads-benchmark
> > > + * Description: Benchmark how long GPU / CPU take, reading results with multiple threads
> > > + * Test category: performance and functionality test
> > > + *
> > > + * SUBTEST: fault-threads-same-page-benchmark
> > > + * Description: Benchmark how long GPU / CPU take, reading results with multiple threads, hammer same page
> > > + * Test category: performance and functionality test
> > > + *
> > > + * SUBTEST: fault-process-benchmark
> > > + * Description: Benchmark how long GPU / CPU take, reading results with multiple process
> > > + * Test category: performance and functionality test
> > > + *
> > > + * SUBTEST: fault-process-same-page-benchmark
> > > + * Description: Benchmark how long GPU / CPU take, reading results with multiple process, hammer same page
> > > + * Test category: performance and functionality test
> > > + *
> > > + * SUBTEST: evict-malloc
> > > + * Description: trigger eviction of VRAM allocated via malloc
> > > + * Test category: functionality test
> > > + *
> > > + * SUBTEST: evict-malloc-mix-bo
> > > + * Description: trigger eviction of VRAM allocated via malloc and BO create
> > > + * Test category: functionality test
> > > + *
> > > + * SUBTEST: processes-evict-malloc
> > > + * Description: multi-process trigger eviction of VRAM allocated via malloc
> > > + * Test category: stress test
> > > + *
> > > + * SUBTEST: processes-evict-malloc-mix-bo
> > > + * Description: multi-process trigger eviction of VRAM allocated via malloc and BO create
> > > + * Test category: stress test
> > > + */
> > > +
> > > +static void
> > > +many_allocs(int fd, struct drm_xe_engine_class_instance *eci,
> > > +	    uint64_t total_alloc, uint64_t alloc_size, uint64_t stride,
> > > +	    pthread_barrier_t *barrier, unsigned int flags)
> > > +{
> > > +	uint32_t vm, exec_queue;
> > > +	int num_allocs = flags & BENCHMARK ? 1 :
> > > +		(9 * (total_alloc / alloc_size)) / 8;
> > > +	struct aligned_alloc_type *allocs;
> > > +	uint32_t *bos = NULL;
> > > +	struct timespec tv = {};
> > > +	uint64_t submit, read, elapsed;
> > > +	int i;
> > > +
> > > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> > > +			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> > > +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> > > +
> > > +	bind_system_allocator(NULL, 0);
> > > +
> > > +	allocs = malloc(sizeof(*allocs) * num_allocs);
> > > +	igt_assert(allocs);
> > > +	memset(allocs, 0, sizeof(*allocs) * num_allocs);
> > > +
> > > +	if (flags & MIX_BO_ALLOC) {
> > > +		bos = malloc(sizeof(*bos) * num_allocs);
> > > +		igt_assert(bos);
> > > +		memset(bos, 0, sizeof(*bos) * num_allocs);
> > > +	}
> > > +
> > > +	for (i = 0; i < num_allocs; ++i) {
> > > +		struct aligned_alloc_type alloc;
> > > +
> > > +		if (flags & MIX_BO_ALLOC && odd(i)) {
> > > +			uint32_t bo_flags =
> > > +				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> > > +
> > > +			alloc = __aligned_alloc(SZ_2M, alloc_size);
> > > +			igt_assert(alloc.ptr);
> > > +
> > > +			bos[i] = xe_bo_create(fd, vm, alloc_size,
> > > +					      vram_if_possible(fd, eci->gt_id),
> > > +					      bo_flags);
> > > +			alloc.ptr = xe_bo_map_fixed(fd, bos[i], alloc_size,
> > > +						    to_user_pointer(alloc.ptr));
> > > +			xe_vm_bind_async(fd, vm, 0, bos[i], 0,
> > > +					 to_user_pointer(alloc.ptr),
> > > +					 alloc_size, 0, 0);
> > > +		} else {
> > > +			alloc.ptr = aligned_alloc(SZ_2M, alloc_size);
> > > +			igt_assert(alloc.ptr);
> > > +		}
> > > +		allocs[i] = alloc;
> > > +
> > > +		touch_all_pages(fd, exec_queue, allocs[i].ptr, alloc_size, stride,
> > > +				&tv, &submit);
> > > +	}
> > > +
> > > +	if (barrier)
> > > +		pthread_barrier_wait(barrier);
> > > +
> > > +	for (i = 0; i < num_allocs; ++i) {
> > > +		if (flags & BENCHMARK)
> > > +			read = igt_nsec_elapsed(&tv);
> > > +#define NUM_CHECK_THREADS	8
> > > +		if (flags & CPU_FAULT_PROCESS)
> > > +			check_all_pages_process(allocs[i].ptr, alloc_size, stride,
> > > +						NUM_CHECK_THREADS, flags);
> > > +		else if (flags & CPU_FAULT_THREADS)
> > > +			check_all_pages_threads(allocs[i].ptr, alloc_size, stride,
> > > +						NUM_CHECK_THREADS, flags);
> > > +		else
> > > +			check_all_pages(allocs[i].ptr, alloc_size, stride, NULL);
> > > +		if (flags & BENCHMARK) {
> > > +			elapsed = igt_nsec_elapsed(&tv);
> > > +			printf("Execution took %.3fms (submit %.1fus, read %.1fus, total %.1fus, read_total %.1fus)\n",

Also here, prefer IGT's log functions.

> > > +			       1e-6 * elapsed, 1e-3 * submit, 1e-3 * read,
> > > +			       1e-3 * (elapsed - submit),
> > > +			       1e-3 * (elapsed - read));
> > > +		}
> > > +		if (bos && bos[i]) {
> > > +			__aligned_free(allocs + i);
> > > +			gem_close(fd, bos[i]);
> > > +		} else {
> > > +			free(allocs[i].ptr);
> > > +		}
> > > +	}
> > > +	if (bos)
> > > +		free(bos);
> > > +	free(allocs);
> > > +	xe_exec_queue_destroy(fd, exec_queue);
> > > +	xe_vm_destroy(fd, vm);
> > > +}
> > > +
> > > +static void process_evict(struct drm_xe_engine_class_instance *hwe,
> > > +			  uint64_t total_alloc, uint64_t alloc_size,
> > > +			  uint64_t stride, unsigned int flags)
> > > +{
> > > +	struct process_data *pdata;
> > > +	int map_fd;
> > > +	int fd;
> > > +
> > > +	map_fd = open(SYNC_FILE, O_RDWR, 0x666);
> > > +	pdata = mmap(NULL, sizeof(*pdata), PROT_READ |
> > > +		     PROT_WRITE, MAP_SHARED, map_fd, 0);
> > > +	wait_pdata(pdata);
> > > +
> > > +	fd = drm_open_driver(DRIVER_XE);
> > > +	many_allocs(fd, hwe, total_alloc, alloc_size, stride, &pdata->barrier,
> > > +		    flags);
> > > +	drm_close_driver(fd);
> > > +
> > > +	close(map_fd);
> > > +	munmap(pdata, sizeof(*pdata));
> > > +}
> > > +
> > > +static void
> > > +processes_evict(int fd, uint64_t alloc_size, uint64_t stride,
> > > +		unsigned int flags)
> > > +{
> > > +	struct drm_xe_engine_class_instance *hwe;
> > > +	struct process_data *pdata;
> > > +	int n_engine_gt[2] = { 0, 0 }, n_engine = 0;
> > > +	int map_fd;
> > > +
> > > +	map_fd = open(SYNC_FILE, O_RDWR | O_CREAT, 0x666);
> > > +	posix_fallocate(map_fd, 0, sizeof(*pdata));
> > > +	pdata = mmap(NULL, sizeof(*pdata), PROT_READ |
> > > +		     PROT_WRITE, MAP_SHARED, map_fd, 0);
> > > +
> > > +	xe_for_each_engine(fd, hwe) {
> > > +		igt_assert(hwe->gt_id < 2);
> > > +		n_engine_gt[hwe->gt_id]++;
> > > +		n_engine++;
> > > +	}
> > > +
> > > +	init_pdata(pdata, n_engine);
> > > +
> > > +	xe_for_each_engine(fd, hwe) {
> > > +		igt_fork(child, 1)
> > > +			process_evict(hwe,
> > > +				      xe_visible_vram_size(fd, hwe->gt_id) /
> > > +				      n_engine_gt[hwe->gt_id], alloc_size,
> > > +				      stride, flags);
> > > +	}
> > > +
> > > +	signal_pdata(pdata);
> > > +	igt_waitchildren();
> > > +
> > > +	close(map_fd);
> > > +	munmap(pdata, sizeof(*pdata));
> > > +}
> > > +
> > > +#define CPU_FAULT	(0x1 << 0)
> > > +#define REMAP		(0x1 << 1)
> > > +#define MIDDLE		(0x1 << 2)
> > > +
> > > +/**
> > > + * SUBTEST: partial-munmap-cpu-fault
> > > + * Description: munmap partially with cpu access in between
> > > + * Test category: functionality test
> > > + *
> > > + * SUBTEST: partial-munmap-no-cpu-fault
> > > + * Description: munmap partially with no cpu access in between
> > > + * Test category: functionality test
> > > + *
> > > + * SUBTEST: partial-remap-cpu-fault
> > > + * Description: remap partially with cpu access in between
> > > + * Test category: functionality test
> > > + *
> > > + * SUBTEST: partial-remap-no-cpu-fault
> > > + * Description: remap partially with no cpu access in between
> > > + * Test category: functionality test
> > > + *
> > > + * SUBTEST: partial-middle-munmap-cpu-fault
> > > + * Description: munmap middle with cpu access in between
> > > + * Test category: functionality test
> > > + *
> > > + * SUBTEST: partial-middle-munmap-no-cpu-fault
> > > + * Description: munmap middle with no cpu access in between
> > > + * Test category: functionality test
> > > + *
> > > + * SUBTEST: partial-middle-remap-cpu-fault
> > > + * Description: remap middle with cpu access in between
> > > + * Test category: functionality test
> > > + *
> > > + * SUBTEST: partial-middle-remap-no-cpu-fault
> > > + * Description: remap middle with no cpu access in between
> > > + * Test category: functionality test
> > > + */
> > > +
> > > +static void
> > > +partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
> > > +{
> > > +	struct drm_xe_sync sync[1] = {
> > > +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > > +	          .timeline_value = USER_FENCE_VALUE },
> > > +	};
> > > +	struct drm_xe_exec exec = {
> > > +		.num_batch_buffer = 1,
> > > +		.num_syncs = 1,
> > > +		.syncs = to_user_pointer(sync),
> > > +	};
> > > +	struct {
> > > +		uint32_t batch[16];
> > > +		uint64_t pad;
> > > +		uint64_t vm_sync;
> > > +		uint64_t exec_sync;
> > > +		uint32_t data;
> > > +		uint32_t expected_data;
> > > +	} *data;
> > > +	size_t bo_size = SZ_2M, unmap_offset = 0;
> > > +	uint32_t vm, exec_queue;
> > > +	u64 *exec_ufence = NULL;
> > > +	int i;
> > > +	void *old, *new = NULL;
> > > +	struct aligned_alloc_type alloc;
> > > +
> > > +	if (flags & MIDDLE)
> > > +		unmap_offset = bo_size / 4;
> > > +
> > > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> > > +			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> > > +
> > > +	alloc = __aligned_alloc(bo_size, bo_size);
> > > +	igt_assert(alloc.ptr);
> > > +
> > > +	data = mmap(alloc.ptr, bo_size, PROT_READ | PROT_WRITE,
> > > +		    MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0);
> > > +	igt_assert(data != MAP_FAILED);
> > > +	memset(data, 0, bo_size);
> > > +	old = data;
> > > +
> > > +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> > > +
> > > +	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > > +	bind_system_allocator(sync, 1);
> > > +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> > > +	data[0].vm_sync = 0;
> > > +
> > > +	exec_ufence = mmap(NULL, SZ_4K, PROT_READ |
> > > +			   PROT_WRITE, MAP_SHARED |
> > > +			   MAP_ANONYMOUS, -1, 0);
> > > +	igt_assert(exec_ufence != MAP_FAILED);
> > > +	memset(exec_ufence, 0, SZ_4K);
> > > +
> > > +	for (i = 0; i < 2; i++) {
> > > +		uint64_t addr = to_user_pointer(data);
> > > +		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
> > > +		uint64_t sdi_addr = addr + sdi_offset;
> > > +		int b = 0;
> > > +
> > > +		write_dword(data[i].batch, sdi_addr, WRITE_VALUE(&data[i], i), &b);
> > > +		igt_assert(b <= ARRAY_SIZE(data[i].batch));
> > > +
> > > +		if (!i)
> > > +			data = old + unmap_offset + bo_size / 2;
> > > +	}
> > > +
> > > +	data = old;
> > > +	exec.exec_queue_id = exec_queue;
> > > +
> > > +	for (i = 0; i < 2; i++) {
> > > +		uint64_t addr = to_user_pointer(data);
> > > +		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> > > +		uint64_t batch_addr = addr + batch_offset;
> > > +
> > > +		sync[0].addr = new ? to_user_pointer(new) :
> > > +			to_user_pointer(exec_ufence);
> > > +		exec.address = batch_addr;
> > > +		xe_exec(fd, &exec);
> > > +
> > > +		xe_wait_ufence(fd, new ?: exec_ufence, USER_FENCE_VALUE,
> > > +			       exec_queue, FIVE_SEC);
> > > +		if (i || (flags & CPU_FAULT))
> > > +			igt_assert_eq(data[i].data, READ_VALUE(&data[i], i));
> > > +		exec_ufence[0] = 0;
> > > +
> > > +		if (!i) {
> > > +			data = old + unmap_offset + bo_size / 2;
> > > +			munmap(old + unmap_offset, bo_size / 2);
> > > +			if (flags & REMAP) {
> > > +				new = mmap(old + unmap_offset, bo_size / 2,
> > > +					   PROT_READ | PROT_WRITE,
> > > +					   MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED |
> > > +					   MAP_LOCKED, -1, 0);
> > > +				igt_assert(new != MAP_FAILED);
> > > +			}
> > > +		}
> > > +	}
> > > +
> > > +	xe_exec_queue_destroy(fd, exec_queue);
> > > +	munmap(exec_ufence, SZ_4K);
> > > +	__aligned_free(&alloc);
> > > +	if (new)
> > > +		munmap(new, bo_size / 2);
> > > +	xe_vm_destroy(fd, vm);
> > > +}
> > > +
> > > +#define MAX_N_EXEC_QUEUES	16
> > > +
> > > +#define MMAP		(0x1 << 0)
> > > +#define NEW		(0x1 << 1)
> > > +#define BO_UNMAP	(0x1 << 2)
> > > +#define FREE		(0x1 << 3)
> > > +#define BUSY		(0x1 << 4)
> > > +#define BO_MAP		(0x1 << 5)
> > > +#define RACE		(0x1 << 6)
> > > +#define SKIP_MEMSET	(0x1 << 7)
> > > +#define FAULT		(0x1 << 8)
> > > +#define FILE_BACKED	(0x1 << 9)
> > > +#define LOCK		(0x1 << 10)
> > > +#define MMAP_SHARED	(0x1 << 11)
> > > +#define HUGE_PAGE	(0x1 << 12)
> > > +#define SHARED_ALLOC	(0x1 << 13)
> > > +#define FORK_READ	(0x1 << 14)
> > > +#define FORK_READ_AFTER	(0x1 << 15)
> > > +#define MREMAP		(0x1 << 16)
> > > +#define DONTUNMAP	(0x1 << 17)
> > > +#define READ_ONLY_REMAP	(0x1 << 18)
> > > +#define SYNC_EXEC	(0x1 << 19)
> > > +#define EVERY_OTHER_CHECK	(0x1 << 20)
> > > +#define MULTI_FAULT	(0x1 << 21)
> > > +
> > > +#define N_MULTI_FAULT	4
> > > +
> > > +/**
> > > + * SUBTEST: once-%s
> > > + * Description: Run %arg[1] system allocator test only once
> > > + * Test category: functionality test
> > > + *
> > > + * SUBTEST: once-large-%s
> > > + * Description: Run %arg[1] system allocator test only once with large allocation
> > > + * Test category: functionality test
> > > + *
> > > + * SUBTEST: twice-%s
> > > + * Description: Run %arg[1] system allocator test twice
> > > + * Test category: functionality test
> > > + *
> > > + * SUBTEST: twice-large-%s
> > > + * Description: Run %arg[1] system allocator test twice with large allocation
> > > + * Test category: functionality test
> > > + *
> > > + * SUBTEST: many-%s
> > > + * Description: Run %arg[1] system allocator test many times
> > > + * Test category: stress test
> > > + *
> > > + * SUBTEST: many-stride-%s
> > > + * Description: Run %arg[1] system allocator test many times with a stride on each exec
> > > + * Test category: stress test
> > > + *
> > > + * SUBTEST: many-execqueues-%s
> > > + * Description: Run %arg[1] system allocator test on many exec_queues
> > > + * Test category: stress test
> > > + *
> > > + * SUBTEST: many-large-%s
> > > + * Description: Run %arg[1] system allocator test many times with large allocations
> > > + * Test category: stress test
> > > + *
> > > + * SUBTEST: many-large-execqueues-%s
> > > + * Description: Run %arg[1] system allocator test on many exec_queues with large allocations
> > > + *
> > > + * SUBTEST: threads-many-%s
> > > + * Description: Run %arg[1] system allocator threaded test many times
> > > + * Test category: stress test
> > > + *
> > > + * SUBTEST: threads-many-stride-%s
> > > + * Description: Run %arg[1] system allocator threaded test many times with a stride on each exec
> > > + * Test category: stress test
> > > + *
> > > + * SUBTEST: threads-many-execqueues-%s
> > > + * Description: Run %arg[1] system allocator threaded test on many exec_queues
> > > + * Test category: stress test
> > > + *
> > > + * SUBTEST: threads-many-large-%s
> > > + * Description: Run %arg[1] system allocator threaded test many times with large allocations
> > > + * Test category: stress test
> > > + *
> > > + * SUBTEST: threads-many-large-execqueues-%s
> > > + * Description: Run %arg[1] system allocator threaded test on many exec_queues with large allocations
> > > + *
> > > + * SUBTEST: threads-shared-vm-many-%s
> > > + * Description: Run %arg[1] system allocator threaded, shared vm test many times
> > > + * Test category: stress test
> > > + *
> > > + * SUBTEST: threads-shared-vm-many-stride-%s
> > > + * Description: Run %arg[1] system allocator threaded, shared vm test many times with a stride on each exec
> > > + * Test category: stress test
> > > + *
> > > + * SUBTEST: threads-shared-vm-many-execqueues-%s
> > > + * Description: Run %arg[1] system allocator threaded, shared vm test on many exec_queues
> > > + * Test category: stress test
> > > + *
> > > + * SUBTEST: threads-shared-vm-many-large-%s
> > > + * Description: Run %arg[1] system allocator threaded, shared vm test many times with large allocations
> > > + * Test category: stress test
> > > + *
> > > + * SUBTEST: threads-shared-vm-many-large-execqueues-%s
> > > + * Description: Run %arg[1] system allocator threaded, shared vm test on many exec_queues with large allocations
> > > + * Test category: stress test
> > > + *
> > > + * SUBTEST: process-many-%s
> > > + * Description: Run %arg[1] system allocator multi-process test many times
> > > + * Test category: stress test
> > > + *
> > > + * SUBTEST: process-many-stride-%s
> > > + * Description: Run %arg[1] system allocator multi-process test many times with a stride on each exec
> > > + * Test category: stress test
> > > + *
> > > + * SUBTEST: process-many-execqueues-%s
> > > + * Description: Run %arg[1] system allocator multi-process test on many exec_queues
> > > + * Test category: stress test
> > > + *
> > > + * SUBTEST: process-many-large-%s
> > > + * Description: Run %arg[1] system allocator multi-process test many times with large allocations
> > > + * Test category: stress test
> > > + *
> > > + * SUBTEST: process-many-large-execqueues-%s
> > > + * Description: Run %arg[1] system allocator multi-process test on many exec_queues with large allocations
> > > + *
> > > + * SUBTEST: fault
> > > + * Description: use a bad system allocator address resulting in a fault
> > > + * Test category: bad input
> > > + *
> > > + * arg[1]:
> > > + *
> > > + * @malloc:				malloc single buffer for all execs, issue a command which will trigger multiple faults
> > > + * @malloc-multi-fault:			malloc single buffer for all execs
> > > + * @malloc-fork-read:			malloc single buffer for all execs, fork a process to read test output
> > > + * @malloc-fork-read-after:		malloc single buffer for all execs, fork a process to read test output, check again after fork returns in parent
> > > + * @malloc-mlock:			malloc and mlock single buffer for all execs
> > > + * @malloc-race:			malloc single buffer for all execs with race between cpu and gpu access
> > > + * @malloc-bo-unmap:			malloc single buffer for all execs, bind and unbind a BO to same address before execs
> > > + * @malloc-busy:			malloc single buffer for all execs, try to unbind while buffer valid
> > > + * @mmap:				mmap single buffer for all execs
> > > + * @mmap-remap:				mmap and mremap a buffer for all execs
> > > + * @mmap-remap-dontunmap:		mmap and mremap a buffer with dontunmap flag for all execs
> > > + * @mmap-remap-ro:			mmap and mremap a read-only buffer for all execs
> > > + * @mmap-remap-ro-dontunmap:		mmap and mremap a read-only buffer with dontunmap flag for all execs
> > > + * @mmap-remap-eocheck:			mmap and mremap a buffer for all execs, check data every other loop iteration
> > > + * @mmap-remap-dontunmap-eocheck:	mmap and mremap a buffer with dontunmap flag for all execs, check data every other loop iteration
> > > + * @mmap-remap-ro-eocheck:		mmap and mremap a read-only buffer for all execs, check data every other loop iteration
> > > + * @mmap-remap-ro-dontunmap-eocheck:	mmap and mremap a read-only buffer with dontunmap flag for all execs, check data every other loop iteration
> > > + * @mmap-huge:				mmap huge page single buffer for all execs
> > > + * @mmap-shared:			mmap shared single buffer for all execs
> > > + * @mmap-shared-remap:			mmap shared and mremap a buffer for all execs
> > > + * @mmap-shared-remap-dontunmap:	mmap shared and mremap a buffer with dontunmap flag for all execs
> > > + * @mmap-shared-remap-eocheck:		mmap shared and mremap a buffer for all execs, check data every other loop iteration
> > > + * @mmap-shared-remap-dontunmap-eocheck:	mmap shared and mremap a buffer with dontunmap flag for all execs, check data every other loop iteration
> > > + * @mmap-mlock:				mmap and mlock single buffer for all execs
> > > + * @mmap-file:				mmap single buffer, with file backing, for all execs
> > > + * @mmap-file-mlock:			mmap and mlock single buffer, with file backing, for all execs
> > > + * @mmap-race:				mmap single buffer for all execs with race between cpu and gpu access
> > > + * @free:				malloc and free buffer for each exec
> > > + * @free-race:				malloc and free buffer for each exec with race between cpu and gpu access
> > > + * @new:				malloc a new buffer for each exec
> > > + * @new-race:				malloc a new buffer for each exec with race between cpu and gpu access
> > > + * @new-bo-map:				malloc a new buffer or map BO for each exec
> > > + * @new-busy:				malloc a new buffer for each exec, try to unbind while buffers valid
> > > + * @mmap-free:				mmap and free buffer for each exec
> > > + * @mmap-free-huge:			mmap huge page and free buffer for each exec
> > > + * @mmap-free-race:			mmap and free buffer for each exec with race between cpu and gpu access
> > > + * @mmap-new:				mmap a new buffer for each exec
> > > + * @mmap-new-huge:			mmap huge page a new buffer for each exec
> > > + * @mmap-new-race:			mmap a new buffer for each exec with race between cpu and gpu access
> > > + * @malloc-nomemset:			malloc single buffer for all execs, skip memset of buffers
> > > + * @malloc-mlock-nomemset:		malloc and mlock single buffer for all execs, skip memset of buffers
> > > + * @malloc-race-nomemset:		malloc single buffer for all execs with race between cpu and gpu access, skip memset of buffers
> > > + * @malloc-bo-unmap-nomemset:		malloc single buffer for all execs, bind and unbind a BO to same address before execs, skip memset of buffers
> > > + * @malloc-busy-nomemset:		malloc single buffer for all execs, try to unbind while buffer valid, skip memset of buffers
> > > + * @mmap-nomemset:			mmap single buffer for all execs, skip memset of buffers
> > > + * @mmap-huge-nomemset:			mmap huge page single buffer for all execs, skip memset of buffers
> > > + * @mmap-shared-nomemset:		mmap shared single buffer for all execs, skip memset of buffers
> > > + * @mmap-mlock-nomemset:		mmap and mlock single buffer for all execs, skip memset of buffers
> > > + * @mmap-file-nomemset:			mmap single buffer, with file backing, for all execs, skip memset of buffers
> > > + * @mmap-file-mlock-nomemset:		mmap and mlock single buffer, with file backing, for all execs, skip memset of buffers
> > > + * @mmap-race-nomemset:			mmap single buffer for all execs with race between cpu and gpu access, skip memset of buffers
> > > + * @free-nomemset:			malloc and free buffer for each exec, skip memset of buffers
> > > + * @free-race-nomemset:			malloc and free buffer for each exec with race between cpu and gpu access, skip memset of buffers
> > > + * @new-nomemset:			malloc a new buffer for each exec, skip memset of buffers
> > > + * @new-race-nomemset:			malloc a new buffer for each exec with race between cpu and gpu access, skip memset of buffers
> > > + * @new-bo-map-nomemset:		malloc a new buffer or map BO for each exec, skip memset of buffers
> > > + * @new-busy-nomemset:			malloc a new buffer for each exec, try to unbind while buffers valid, skip memset of buffers
> > > + * @mmap-free-nomemset:			mmap and free buffer for each exec, skip memset of buffers
> > > + * @mmap-free-huge-nomemset:		mmap huge page and free buffer for each exec, skip memset of buffers
> > > + * @mmap-free-race-nomemset:		mmap and free buffer for each exec with race between cpu and gpu access, skip memset of buffers
> > > + * @mmap-new-nomemset:			mmap a new buffer for each exec, skip memset of buffers
> > > + * @mmap-new-huge-nomemset:		mmap huge page new buffer for each exec, skip memset of buffers
> > > + * @mmap-new-race-nomemset:		mmap a new buffer for each exec with race between cpu and gpu access, skip memset of buffers
> > > + *
> > > + * SUBTEST: threads-shared-vm-shared-alloc-many-stride-malloc
> > > + * Description: Create multiple threads with a shared VM triggering faults on different hardware engines to same addresses
> > > + * Test category: stress test
> > > + *
> > > + * SUBTEST: threads-shared-vm-shared-alloc-many-stride-malloc-race
> > > + * Description: Create multiple threads with a shared VM triggering faults on different hardware engines to same addresses, racing between CPU and GPU access
> > > + * Test category: stress test
> > > + *
> > > + * SUBTEST: threads-shared-alloc-many-stride-malloc
> > > + * Description: Create multiple threads with a faults on different hardware engines to same addresses
> > > + * Test category: stress test
> > > + *
> > > + * SUBTEST: threads-shared-alloc-many-stride-malloc-sync
> > > + * Description: Create multiple threads with a faults on different hardware engines to same addresses, syncing on each exec
> > > + * Test category: stress test
> > > + *
> > > + * SUBTEST: threads-shared-alloc-many-stride-malloc-race
> > > + * Description: Create multiple threads with a faults on different hardware engines to same addresses, racing between CPU and GPU access
> > > + * Test category: stress test
> > > + */
> > > +
> > > +struct test_exec_data {
> > > +	uint32_t batch[32];
> > > +	uint64_t pad;
> > > +	uint64_t vm_sync;
> > > +	uint64_t exec_sync;
> > > +	uint32_t data;
> > > +	uint32_t expected_data;
> > > +};
> > > +
> > > +static void
> > > +test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> > > +	  int n_exec_queues, int n_execs, size_t bo_size,
> > > +	  size_t stride, uint32_t vm, void *alloc, pthread_barrier_t *barrier,
> > > +	  unsigned int flags)
> > > +{
> > > +	uint64_t addr;
> > > +	struct drm_xe_sync sync[1] = {
> > > +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > > +	          .timeline_value = USER_FENCE_VALUE },
> > > +	};
> > > +	struct drm_xe_exec exec = {
> > > +		.num_batch_buffer = 1,
> > > +		.num_syncs = 1,
> > > +		.syncs = to_user_pointer(sync),
> > > +	};
> > > +	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> > > +	struct test_exec_data *data, *next_data = NULL;
> > > +	uint32_t bo_flags;
> > > +	uint32_t bo = 0;
> > > +	void **pending_free;
> > > +	u64 *exec_ufence = NULL;
> > > +	int i, j, b, file_fd = -1, prev_idx;
> > > +	bool free_vm = false;
> > > +	size_t aligned_size = bo_size ?: xe_get_default_alignment(fd);
> > > +	size_t orig_size = bo_size;
> > > +	struct aligned_alloc_type aligned_alloc_type;
> > > +
> > > +	if (flags & MULTI_FAULT) {
> > > +		if (!bo_size)
> > > +			return;
> > > +
> > > +		bo_size *= N_MULTI_FAULT;
> > > +	}
> > > +
> > > +	if (flags & SHARED_ALLOC)
> > > +		return;
> > > +
> > > +	if (flags & EVERY_OTHER_CHECK && odd(n_execs))
> > > +		return;
> > > +
> > > +	if (flags & EVERY_OTHER_CHECK)
> > > +		igt_assert(flags & MREMAP);
> > > +
> > > +	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> > > +
> > > +	if (flags & NEW && !(flags & FREE)) {
> > > +		pending_free = malloc(sizeof(*pending_free) * n_execs);
> > > +		igt_assert(pending_free);
> > > +		memset(pending_free, 0, sizeof(*pending_free) * n_execs);
> > > +	}
> > > +
> > > +	if (!vm) {
> > > +		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> > > +				  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> > > +		free_vm = true;
> > > +	}
> > > +	if (!bo_size) {
> > > +		if (!stride) {
> > > +			bo_size = sizeof(*data) * n_execs;
> > > +			bo_size = xe_bb_size(fd, bo_size);
> > > +		} else {
> > > +			bo_size = stride * n_execs * sizeof(*data);
> > > +			bo_size = xe_bb_size(fd, bo_size);
> > > +		}
> > > +	}
> > > +	if (flags & HUGE_PAGE) {
> > > +		aligned_size = ALIGN(aligned_size, SZ_2M);
> > > +		bo_size = ALIGN(bo_size, SZ_2M);
> > > +	}
> > > +
> > > +	if (alloc) {
> > > +		data = alloc;
> > > +	} else {
> > > +		if (flags & MMAP) {
> > > +			int mmap_flags = MAP_FIXED;
> > > +
> > > +			aligned_alloc_type = __aligned_alloc(aligned_size, bo_size);
> > > +			data = aligned_alloc_type.ptr;
> > > +			igt_assert(data);
> > > +			__aligned_partial_free(&aligned_alloc_type);
> > > +
> > > +			if (flags & MMAP_SHARED)
> > > +				mmap_flags |= MAP_SHARED;
> > > +			else
> > > +				mmap_flags |= MAP_PRIVATE;
> > > +
> > > +			if (flags & HUGE_PAGE)
> > > +				mmap_flags |= MAP_HUGETLB | MAP_HUGE_2MB;
> > > +
> > > +			if (flags & FILE_BACKED) {
> > > +				char name[1024];
> > > +
> > > +				igt_assert(!(flags & NEW));
> > > +
> > > +				sprintf(name, "/tmp/xe_exec_system_allocator_dat%d\n",
> > > +					getpid());
> > 
> > Might be another candidate to use mkstemp() or similar.
> > 
> 
> Will look into that.
> 
> > > +				file_fd = open(name, O_RDWR | O_CREAT, 0x666);
> > > +				posix_fallocate(file_fd, 0, bo_size);
> > > +			} else {
> > > +				mmap_flags |= MAP_ANONYMOUS;
> > > +			}
> > > +
> > > +			data = mmap(data, bo_size, PROT_READ |
> > > +				    PROT_WRITE, mmap_flags, file_fd, 0);
> > > +			igt_assert(data != MAP_FAILED);
> > > +		} else {
> > > +			data = aligned_alloc(aligned_size, bo_size);
> > > +			igt_assert(data);
> > > +		}
> > > +		if (!(flags & SKIP_MEMSET))
> > > +			memset(data, 0, bo_size);
> > > +		if (flags & LOCK) {
> > > +			igt_assert(!(flags & NEW));
> > > +			mlock(data, bo_size);
> > > +		}
> > > +	}
> > > +
> > > +	for (i = 0; i < n_exec_queues; i++)
> > > +		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> > > +
> > > +	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > > +	if (free_vm) {
> > > +		bind_system_allocator(sync, 1);
> > > +		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> > > +	}
> > > +	data[0].vm_sync = 0;
> > > +
> > > +	addr = to_user_pointer(data);
> > > +
> > > +	if (flags & BO_UNMAP) {
> > > +		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> > > +		bo = xe_bo_create(fd, vm, bo_size,
> > > +				  vram_if_possible(fd, eci->gt_id), bo_flags);
> > > +		xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, 0, 0);
> > > +
> > > +		__xe_vm_bind_assert(fd, vm, 0,
> > > +				    0, 0, addr, bo_size,
> > > +				    DRM_XE_VM_BIND_OP_MAP,
> > > +				    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR, sync,
> > > +				    1, 0, 0);
> > > +		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
> > > +			       FIVE_SEC);
> > > +		data[0].vm_sync = 0;
> > > +		gem_close(fd, bo);
> > > +		bo = 0;
> > > +	}
> > > +
> > > +	if (!(flags & RACE)) {
> > > +		exec_ufence = mmap(NULL, SZ_4K, PROT_READ |
> > > +				   PROT_WRITE, MAP_SHARED |
> > > +				   MAP_ANONYMOUS, -1, 0);
> > > +		igt_assert(exec_ufence != MAP_FAILED);
> > > +		memset(exec_ufence, 0, SZ_4K);
> > > +	}
> > > +
> > > +	for (i = 0; i < n_execs; i++) {
> > > +		int idx = !stride ? i : i * stride, next_idx = !stride
> > > +			? (i + 1) : (i + 1) * stride;
> > > +		uint64_t batch_offset = (char *)&data[idx].batch - (char *)data;
> > > +		uint64_t batch_addr = addr + batch_offset;
> > > +		uint64_t sdi_offset = (char *)&data[idx].data - (char *)data;
> > > +		uint64_t sdi_addr = addr + sdi_offset;
> > > +		int e = i % n_exec_queues, err;
> > > +		bool fault_inject = (FAULT & flags) && i == n_execs / 2;
> > > +		bool fault_injected = (FAULT & flags) && i > n_execs;
> > > +
> > > +		if (barrier)
> > > +			pthread_barrier_wait(barrier);
> > > +
> > > +		if (flags & MULTI_FAULT) {
> > > +			b = 0;
> > > +			for (j = 0; j < N_MULTI_FAULT - 1; ++j)
> > > +				__write_dword(data[idx].batch,
> > > +					      sdi_addr + j * orig_size,
> > > +					      WRITE_VALUE(&data[idx], idx), &b);
> > > +			write_dword(data[idx].batch, sdi_addr + j * orig_size,
> > > +				    WRITE_VALUE(&data[idx], idx), &b);
> > > +			igt_assert(b <= ARRAY_SIZE(data[idx].batch));
> > > +		} else if (!(flags & EVERY_OTHER_CHECK)) {
> > > +			b = 0;
> > > +			write_dword(data[idx].batch, sdi_addr,
> > > +				    WRITE_VALUE(&data[idx], idx), &b);
> > > +			igt_assert(b <= ARRAY_SIZE(data[idx].batch));
> > > +		} else if (flags & EVERY_OTHER_CHECK && !odd(i)) {
> > > +			b = 0;
> > > +			write_dword(data[idx].batch, sdi_addr,
> > > +				    WRITE_VALUE(&data[idx], idx), &b);
> > > +			igt_assert(b <= ARRAY_SIZE(data[idx].batch));
> > > +
> > > +			aligned_alloc_type = __aligned_alloc(aligned_size, bo_size);
> > > +			next_data = aligned_alloc_type.ptr;
> > > +			igt_assert(next_data);
> > > +			__aligned_partial_free(&aligned_alloc_type);
> > > +
> > > +			b = 0;
> > > +			write_dword(data[next_idx].batch,
> > > +				    to_user_pointer(next_data) +
> > > +				    (char *)&data[next_idx].data - (char *)data,
> > > +				    WRITE_VALUE(&data[next_idx], next_idx), &b);
> > > +			igt_assert(b <= ARRAY_SIZE(data[next_idx].batch));
> > > +		}
> > > +
> > > +		if (!exec_ufence)
> > > +			data[idx].exec_sync = 0;
> > > +
> > > +		sync[0].addr = exec_ufence ? to_user_pointer(exec_ufence) :
> > > +			addr + (char *)&data[idx].exec_sync - (char *)data;
> > > +
> > > +		exec.exec_queue_id = exec_queues[e];
> > > +		if (fault_inject)
> > > +			exec.address = batch_addr * 2;
> > > +		else
> > > +			exec.address = batch_addr;
> > > +
> > > +		if (fault_injected) {
> > > +			err = __xe_exec(fd, &exec);
> > > +			igt_assert(err == -ENOENT);
> > > +		} else {
> > > +			xe_exec(fd, &exec);
> > > +		}
> > > +
> > > +		if (barrier)
> > > +			pthread_barrier_wait(barrier);
> > > +
> > > +		if (fault_inject || fault_injected) {
> > > +			int64_t timeout = QUARTER_SEC;
> > > +
> > > +			err = __xe_wait_ufence(fd, exec_ufence ? exec_ufence :
> > > +					       &data[idx].exec_sync,
> > > +					       USER_FENCE_VALUE,
> > > +					       exec_queues[e], &timeout);
> > > +			igt_assert(err == -ETIME || err == -EIO);
> > > +		} else {
> > > +			xe_wait_ufence(fd, exec_ufence ? exec_ufence :
> > > +				       &data[idx].exec_sync, USER_FENCE_VALUE,
> > > +				       exec_queues[e], FIVE_SEC);
> > > +			if (flags & LOCK && !i)
> > > +				munlock(data, bo_size);
> > > +
> > > +			if (flags & MREMAP) {
> > > +				void *old = data;
> > > +				int remap_flags = MREMAP_MAYMOVE | MREMAP_FIXED;
> > > +
> > > +				if (flags & DONTUNMAP)
> > > +					remap_flags |= MREMAP_DONTUNMAP;
> > > +
> > > +				if (flags & READ_ONLY_REMAP)
> > > +					igt_assert(!mprotect(old, bo_size,
> > > +							     PROT_READ));
> > > +
> > > +				if (!next_data) {
> > > +					aligned_alloc_type = __aligned_alloc(aligned_size,
> > > +								    bo_size);
> > > +					data = aligned_alloc_type.ptr;
> > > +					__aligned_partial_free(&aligned_alloc_type);
> > > +				} else {
> > > +					data = next_data;
> > > +				}
> > > +				next_data = NULL;
> > > +				igt_assert(data);
> > > +
> > > +				data = mremap(old, bo_size, bo_size,
> > > +					      remap_flags, data);
> > > +				igt_assert(data != MAP_FAILED);
> > > +
> > > +				if (flags & READ_ONLY_REMAP)
> > > +					igt_assert(!mprotect(data, bo_size,
> > > +							     PROT_READ |
> > > +							     PROT_WRITE));
> > > +
> > > +				addr = to_user_pointer(data);
> > > +				if (flags & DONTUNMAP)
> > > +					munmap(old, bo_size);
> > > +			}
> > > +
> > > +			if (!(flags & EVERY_OTHER_CHECK) || odd(i)) {
> > > +				if (flags & FORK_READ) {
> > > +					igt_fork(child, 1)
> > > +						igt_assert_eq(data[idx].data,
> > > +							      READ_VALUE(&data[idx], idx));
> > > +					if (!(flags & FORK_READ_AFTER))
> > > +						igt_assert_eq(data[idx].data,
> > > +							      READ_VALUE(&data[idx], idx));
> > > +					igt_waitchildren();
> > > +					if (flags & FORK_READ_AFTER)
> > > +						igt_assert_eq(data[idx].data,
> > > +							      READ_VALUE(&data[idx], idx));
> > > +				} else {
> > > +					igt_assert_eq(data[idx].data,
> > > +						      READ_VALUE(&data[idx], idx));
> > > +
> > > +					if (flags & MULTI_FAULT) {
> > > +						for (j = 1; j < N_MULTI_FAULT; ++j) {
> > > +							struct test_exec_data *__data =
> > > +								((void *)data) + j * orig_size;
> > > +
> > > +							igt_assert_eq(__data[idx].data,
> > > +								      READ_VALUE(&data[idx], idx));
> > > +						}
> > > +					}
> > > +				}
> > > +				if (flags & EVERY_OTHER_CHECK)
> > > +					igt_assert_eq(data[prev_idx].data,
> > > +						      READ_VALUE(&data[prev_idx], idx));
> > > +			}
> > > +		}
> > > +
> > > +		if (exec_ufence)
> > > +			exec_ufence[0] = 0;
> > > +
> > > +		if (bo) {
> > > +			__xe_vm_bind_assert(fd, vm, 0,
> > > +					    0, 0, addr, bo_size,
> > > +					    DRM_XE_VM_BIND_OP_MAP,
> > > +					    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
> > > +					    NULL, 0, 0, 0);
> > > +			munmap(data, bo_size);
> > > +			gem_close(fd, bo);
> > > +		}
> > > +
> > > +		if (flags & NEW) {
> > > +			if (flags & MMAP) {
> > > +				if (flags & FREE)
> > > +					munmap(data, bo_size);
> > > +				else
> > > +					pending_free[i] = data;
> > > +				data = mmap(NULL, bo_size, PROT_READ |
> > > +					    PROT_WRITE, MAP_SHARED |
> > > +					    MAP_ANONYMOUS, -1, 0);
> > > +				igt_assert(data != MAP_FAILED);
> > > +			} else if (flags & BO_MAP && (i % 2)) {

The odd() macro defined above can be used here.

> > > +				if (!bo) {
> > > +					if (flags & FREE)
> > > +						free(data);
> > > +					else
> > > +						pending_free[i] = data;
> > > +				}
> > > +
> > > +				aligned_alloc_type = __aligned_alloc(aligned_size, bo_size);
> > > +				data = aligned_alloc_type.ptr;
> > > +				igt_assert(data);
> > > +				__aligned_partial_free(&aligned_alloc_type);
> > > +
> > > +				bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> > > +				bo = xe_bo_create(fd, vm, bo_size,
> > > +						  vram_if_possible(fd, eci->gt_id),
> > > +						  bo_flags);
> > > +				data = xe_bo_map_fixed(fd, bo, bo_size,
> > > +						       to_user_pointer(data));
> > > +
> > > +				xe_vm_bind_async(fd, vm, 0, bo, 0,
> > > +						 to_user_pointer(data),
> > > +						 bo_size, 0, 0);
> > > +			} else {
> > > +				if (!bo) {
> > > +					if (flags & FREE)
> > > +						free(data);
> > > +					else
> > > +						pending_free[i] = data;
> > > +				}
> > > +				bo = 0;
> > > +				data = aligned_alloc(aligned_size, bo_size);
> > 
> > Large memory leaks come from this ^ aligned_alloc(), see below.
> > 
> 
> Yea this will leak, thanks for pointing this out. Thomas also raised
> memory leaks as a concern.
> 
> Inline below with the changes to fix this...
> 
> > > +				igt_assert(data);
> > > +			}
> > > +			addr = to_user_pointer(data);
> > > +			if (!(flags & SKIP_MEMSET))
> > > +				memset(data, 0, bo_size);
> > > +		}
> > > +
> > > +		prev_idx = idx;
> > > +	}
> > > +
> > > +	if (bo) {
> > > +		__xe_vm_bind_assert(fd, vm, 0,
> > > +				    0, 0, addr, bo_size,
> > > +				    DRM_XE_VM_BIND_OP_MAP,
> > > +				    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
> > > +				    NULL, 0, 0, 0);
> > > +		munmap(data, bo_size);
> 
> 		data = NULL;
> 
> > > +		gem_close(fd, bo);
> > > +	}
> > > +
> > > +	if (flags & BUSY)
> > > +		igt_assert_eq(unbind_system_allocator(), -EBUSY);
> > > +
> > > +	for (i = 0; i < n_exec_queues; i++)
> > > +		xe_exec_queue_destroy(fd, exec_queues[i]);
> > > +
> > > +	if (exec_ufence)
> > > +		munmap(exec_ufence, SZ_4K);
> > > +
> > > +	if (flags & LOCK)
> > > +		munlock(data, bo_size);
> > > +
> > > +	if (file_fd != -1)
> > > +		close(file_fd);
> > > +
> > > +	if (flags & NEW && !(flags & FREE)) {
> > > +		for (i = 0; i < n_execs; i++) {
> > > +			if (!pending_free[i])
> > > +				continue;
> > > +
> > > +			if (flags & MMAP)
> > > +				munmap(pending_free[i], bo_size);
> > > +			else
> > > +				free(pending_free[i]);
> > > +		}
> > > +		free(pending_free);
> > > +	} else {
> 
> s/ else {/\nif (data) {
> 
> > > +		if (flags & MMAP)
> > > +			munmap(data, bo_size);
> > > +		else if (!alloc)
> > > +			free(data);
> > 
> > Something seems wrong with the flags logic when skipping this ^ free() for the
> > allocation pointed above.
> > 
> 
> Yep, see above,
> 
> Matt
> 
> > Francois
> > 
> > > +	}
> > > +	if (free_vm)
> > > +		xe_vm_destroy(fd, vm);
> > > +}
> > > +
> > > +struct thread_data {
> > > +	pthread_t thread;
> > > +	pthread_mutex_t *mutex;
> > > +	pthread_cond_t *cond;
> > > +	pthread_barrier_t *barrier;
> > > +	int fd;
> > > +	struct drm_xe_engine_class_instance *eci;
> > > +	int n_exec_queues;
> > > +	int n_execs;
> > > +	size_t bo_size;
> > > +	size_t stride;
> > > +	uint32_t vm;
> > > +	unsigned int flags;
> > > +	void *alloc;
> > > +	bool *go;
> > > +};
> > > +
> > > +static void *thread(void *data)
> > > +{
> > > +	struct thread_data *t = data;
> > > +
> > > +	pthread_mutex_lock(t->mutex);
> > > +	while (!*t->go)
> > > +		pthread_cond_wait(t->cond, t->mutex);
> > > +	pthread_mutex_unlock(t->mutex);
> > > +
> > > +	test_exec(t->fd, t->eci, t->n_exec_queues, t->n_execs,
> > > +		  t->bo_size, t->stride, t->vm, t->alloc, t->barrier,
> > > +		  t->flags);
> > > +
> > > +	return NULL;
> > > +}
> > > +
> > > +static void
> > > +threads(int fd, int n_exec_queues, int n_execs, size_t bo_size,
> > > +	size_t stride, unsigned int flags, bool shared_vm)
> > > +{
> > > +	struct drm_xe_engine_class_instance *hwe;
> > > +	struct thread_data *threads_data;
> > > +	int n_engines = 0, i = 0;
> > > +	pthread_mutex_t mutex;
> > > +	pthread_cond_t cond;
> > > +	pthread_barrier_t barrier;
> > > +	uint32_t vm = 0;
> > > +	bool go = false;
> > > +	void *alloc = NULL;
> > > +
> > > +	if ((FILE_BACKED | FORK_READ) & flags)
> > > +		return;
> > > +
> > > +	xe_for_each_engine(fd, hwe)
> > > +		++n_engines;
> > > +
> > > +	if (shared_vm) {
> > > +		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> > > +				  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> > > +		bind_system_allocator(NULL, 0);
> > > +	}
> > > +
> > > +	if (flags & SHARED_ALLOC) {
> > > +		uint64_t alloc_size;
> > > +
> > > +		igt_assert(stride);
> > > +
> > > +		alloc_size = sizeof(struct test_exec_data) * stride *
> > > +			n_execs * n_engines;
> > > +		alloc_size = xe_bb_size(fd, alloc_size);
> > > +		alloc = aligned_alloc(SZ_2M, alloc_size);
> > > +		igt_assert(alloc);
> > > +
> > > +		memset(alloc, 0, alloc_size);
> > > +		flags &= ~SHARED_ALLOC;
> > > +	}
> > > +
> > > +	threads_data = calloc(n_engines, sizeof(*threads_data));
> > > +	igt_assert(threads_data);
> > > +
> > > +	pthread_mutex_init(&mutex, 0);
> > > +	pthread_cond_init(&cond, 0);
> > > +	pthread_barrier_init(&barrier, 0, n_engines);
> > > +
> > > +	xe_for_each_engine(fd, hwe) {
> > > +		threads_data[i].mutex = &mutex;
> > > +		threads_data[i].cond = &cond;
> > > +		threads_data[i].barrier = (flags & SYNC_EXEC) ? &barrier : NULL;
> > > +		threads_data[i].fd = fd;
> > > +		threads_data[i].eci = hwe;
> > > +		threads_data[i].n_exec_queues = n_exec_queues;
> > > +		threads_data[i].n_execs = n_execs;
> > > +		threads_data[i].bo_size = bo_size;
> > > +		threads_data[i].stride = stride;
> > > +		threads_data[i].vm = vm;
> > > +		threads_data[i].flags = flags;
> > > +		threads_data[i].alloc = alloc ? alloc + i *
> > > +			sizeof(struct test_exec_data) : NULL;
> > > +		threads_data[i].go = &go;
> > > +		pthread_create(&threads_data[i].thread, 0, thread,
> > > +			       &threads_data[i]);
> > > +		++i;
> > > +	}
> > > +
> > > +	pthread_mutex_lock(&mutex);
> > > +	go = true;
> > > +	pthread_cond_broadcast(&cond);
> > > +	pthread_mutex_unlock(&mutex);
> > > +
> > > +	for (i = 0; i < n_engines; ++i)
> > > +		pthread_join(threads_data[i].thread, NULL);

Just a thought, the SVM page fault count is provided in GT stats:

    cat /sys/kernel/debug/dri/*/gt*/stats
    svm_pagefault_count: 134785

Wondering if it would make sense to read the value before and after test
execution then compare the delta with the expected number of page faults.

Francois

> > > +
> > > +	if (shared_vm) {
> > > +		int ret;
> > > +
> > > +		if (flags & MMAP) {
> > > +			int tries = 300;
> > > +
> > > +			while (tries && (ret = unbind_system_allocator()) == -EBUSY) {
> > > +				sleep(.01);
> > > +				--tries;
> > > +			}
> > > +			igt_assert_eq(ret, 0);
> > > +		}
> > > +		xe_vm_destroy(fd, vm);
> > > +		if (alloc)
> > > +			free(alloc);
> > > +	}
> > > +	free(threads_data);
> > > +}
> > > +
> > > +static void process(struct drm_xe_engine_class_instance *hwe, int n_exec_queues,
> > > +		    int n_execs, size_t bo_size, size_t stride,
> > > +		    unsigned int flags)
> > > +{
> > > +	struct process_data *pdata;
> > > +	int map_fd;
> > > +	int fd;
> > > +
> > > +	map_fd = open(SYNC_FILE, O_RDWR, 0x666);
> > > +	pdata = mmap(NULL, sizeof(*pdata), PROT_READ |
> > > +		     PROT_WRITE, MAP_SHARED, map_fd, 0);
> > > +	wait_pdata(pdata);
> > > +
> > > +	fd = drm_open_driver(DRIVER_XE);
> > > +	test_exec(fd, hwe, n_exec_queues, n_execs,
> > > +		  bo_size, stride, 0, NULL, NULL, flags);
> > > +	drm_close_driver(fd);
> > > +
> > > +	close(map_fd);
> > > +	munmap(pdata, sizeof(*pdata));
> > > +}
> > > +
> > > +static void
> > > +processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
> > > +	  size_t stride, unsigned int flags)
> > > +{
> > > +	struct drm_xe_engine_class_instance *hwe;
> > > +	struct process_data *pdata;
> > > +	int map_fd;
> > > +
> > > +	if (flags & FORK_READ)
> > > +		return;
> > > +
> > > +	map_fd = open(SYNC_FILE, O_RDWR | O_CREAT, 0x666);
> > > +	posix_fallocate(map_fd, 0, sizeof(*pdata));
> > > +	pdata = mmap(NULL, sizeof(*pdata), PROT_READ |
> > > +		     PROT_WRITE, MAP_SHARED, map_fd, 0);
> > > +
> > > +	init_pdata(pdata, 0);
> > > +
> > > +	xe_for_each_engine(fd, hwe) {
> > > +		igt_fork(child, 1)
> > > +			process(hwe, n_exec_queues, n_execs, bo_size,
> > > +				stride, flags);
> > > +	}
> > > +
> > > +	signal_pdata(pdata);
> > > +	igt_waitchildren();
> > > +
> > > +	close(map_fd);
> > > +	munmap(pdata, sizeof(*pdata));
> > > +}
> > > +
> > > +struct section {
> > > +	const char *name;
> > > +	unsigned int flags;
> > > +};
> > > +
> > > +igt_main
> > > +{
> > > +	struct drm_xe_engine_class_instance *hwe;
> > > +	const struct section sections[] = {
> > > +		{ "malloc", 0 },
> > > +		{ "malloc-multi-fault", MULTI_FAULT },
> > > +		{ "malloc-fork-read", FORK_READ },
> > > +		{ "malloc-fork-read-after", FORK_READ | FORK_READ_AFTER },
> > > +		{ "malloc-mlock", LOCK },
> > > +		{ "malloc-race", RACE },
> > > +		{ "malloc-busy", BUSY },
> > > +		{ "malloc-bo-unmap", BO_UNMAP },
> > > +		{ "mmap", MMAP },
> > > +		{ "mmap-remap", MMAP | MREMAP },
> > > +		{ "mmap-remap-dontunmap", MMAP | MREMAP | DONTUNMAP },
> > > +		{ "mmap-remap-ro", MMAP | MREMAP | READ_ONLY_REMAP },
> > > +		{ "mmap-remap-ro-dontunmap", MMAP | MREMAP | DONTUNMAP |
> > > +			READ_ONLY_REMAP },
> > > +		{ "mmap-remap-eocheck", MMAP | MREMAP | EVERY_OTHER_CHECK },
> > > +		{ "mmap-remap-dontunmap-eocheck", MMAP | MREMAP | DONTUNMAP |
> > > +			EVERY_OTHER_CHECK },
> > > +		{ "mmap-remap-ro-eocheck", MMAP | MREMAP | READ_ONLY_REMAP |
> > > +			EVERY_OTHER_CHECK },
> > > +		{ "mmap-remap-ro-dontunmap-eocheck", MMAP | MREMAP | DONTUNMAP |
> > > +			READ_ONLY_REMAP | EVERY_OTHER_CHECK },
> > > +		{ "mmap-huge", MMAP | HUGE_PAGE },
> > > +		{ "mmap-shared", MMAP | LOCK | MMAP_SHARED },
> > > +		{ "mmap-shared-remap", MMAP | LOCK | MMAP_SHARED | MREMAP },
> > > +		{ "mmap-shared-remap-dontunmap", MMAP | LOCK | MMAP_SHARED |
> > > +			MREMAP | DONTUNMAP },
> > > +		{ "mmap-shared-remap-eocheck", MMAP | LOCK | MMAP_SHARED |
> > > +			MREMAP | EVERY_OTHER_CHECK },
> > > +		{ "mmap-shared-remap-dontunmap-eocheck", MMAP | LOCK |
> > > +			MMAP_SHARED | MREMAP | DONTUNMAP | EVERY_OTHER_CHECK },
> > > +		{ "mmap-mlock", MMAP | LOCK },
> > > +		{ "mmap-file", MMAP | FILE_BACKED },
> > > +		{ "mmap-file-mlock", MMAP | LOCK | FILE_BACKED },
> > > +		{ "mmap-race", MMAP | RACE },
> > > +		{ "free", NEW | FREE },
> > > +		{ "free-race", NEW | FREE | RACE },
> > > +		{ "new", NEW },
> > > +		{ "new-race", NEW | RACE },
> > > +		{ "new-bo-map", NEW | BO_MAP },
> > > +		{ "new-busy", NEW | BUSY },
> > > +		{ "mmap-free", MMAP | NEW | FREE },
> > > +		{ "mmap-free-huge", MMAP | NEW | FREE | HUGE_PAGE },
> > > +		{ "mmap-free-race", MMAP | NEW | FREE | RACE },
> > > +		{ "mmap-new", MMAP | NEW },
> > > +		{ "mmap-new-huge", MMAP | NEW | HUGE_PAGE },
> > > +		{ "mmap-new-race", MMAP | NEW | RACE },
> > > +		{ "malloc-nomemset", SKIP_MEMSET },
> > > +		{ "malloc-mlock-nomemset", SKIP_MEMSET | LOCK },
> > > +		{ "malloc-race-nomemset", SKIP_MEMSET | RACE },
> > > +		{ "malloc-busy-nomemset", SKIP_MEMSET | BUSY },
> > > +		{ "malloc-bo-unmap-nomemset", SKIP_MEMSET | BO_UNMAP },
> > > +		{ "mmap-nomemset", SKIP_MEMSET | MMAP },
> > > +		{ "mmap-huge-nomemset", SKIP_MEMSET | MMAP | HUGE_PAGE },
> > > +		{ "mmap-shared-nomemset", SKIP_MEMSET | MMAP | MMAP_SHARED },
> > > +		{ "mmap-mlock-nomemset", SKIP_MEMSET | MMAP | LOCK },
> > > +		{ "mmap-file-nomemset", SKIP_MEMSET | MMAP | FILE_BACKED },
> > > +		{ "mmap-file-mlock-nomemset", SKIP_MEMSET | MMAP | LOCK | FILE_BACKED },
> > > +		{ "mmap-race-nomemset", SKIP_MEMSET | MMAP | RACE },
> > > +		{ "free-nomemset", SKIP_MEMSET | NEW | FREE },
> > > +		{ "free-race-nomemset", SKIP_MEMSET | NEW | FREE | RACE },
> > > +		{ "new-nomemset", SKIP_MEMSET | NEW },
> > > +		{ "new-race-nomemset", SKIP_MEMSET | NEW | RACE },
> > > +		{ "new-bo-map-nomemset", SKIP_MEMSET | NEW | BO_MAP },
> > > +		{ "new-busy-nomemset", SKIP_MEMSET | NEW | BUSY },
> > > +		{ "mmap-free-nomemset", SKIP_MEMSET | MMAP | NEW | FREE },
> > > +		{ "mmap-free-huge-nomemset", SKIP_MEMSET | MMAP | NEW | FREE | HUGE_PAGE },
> > > +		{ "mmap-free-race-nomemset", SKIP_MEMSET | MMAP | NEW | FREE | RACE },
> > > +		{ "mmap-new-nomemset", SKIP_MEMSET | MMAP | NEW },
> > > +		{ "mmap-new-huge-nomemset", SKIP_MEMSET | MMAP | NEW | HUGE_PAGE },
> > > +		{ "mmap-new-race-nomemset", SKIP_MEMSET | MMAP | NEW | RACE },
> > > +		{ NULL },
> > > +	};
> > > +	const struct section psections[] = {
> > > +		{ "munmap-cpu-fault", CPU_FAULT },
> > > +		{ "munmap-no-cpu-fault", 0 },
> > > +		{ "remap-cpu-fault", CPU_FAULT | REMAP },
> > > +		{ "remap-no-cpu-fault", REMAP },
> > > +		{ "middle-munmap-cpu-fault", MIDDLE | CPU_FAULT },
> > > +		{ "middle-munmap-no-cpu-fault", MIDDLE },
> > > +		{ "middle-remap-cpu-fault", MIDDLE | CPU_FAULT | REMAP },
> > > +		{ "middle-remap-no-cpu-fault", MIDDLE | REMAP },
> > > +		{ NULL },
> > > +	};
> > > +	const struct section esections[] = {
> > > +		{ "malloc", 0 },
> > > +		{ "malloc-mix-bo", MIX_BO_ALLOC },
> > > +		{ NULL },
> > > +	};
> > > +	int fd;
> > > +
> > > +	igt_fixture {
> > > +		struct xe_device *xe;
> > > +
> > > +		fd = drm_open_driver(DRIVER_XE);
> > > +		igt_require(!xe_supports_faults(fd));
> > > +
> > > +		xe = xe_device_get(fd);
> > > +		va_bits = xe->va_bits;
> > > +	}
> > > +
> > > +	for (const struct section *s = sections; s->name; s++) {
> > > +		igt_subtest_f("once-%s", s->name)
> > > +			xe_for_each_engine(fd, hwe)
> > > +				test_exec(fd, hwe, 1, 1, 0, 0, 0, NULL,
> > > +					  NULL, s->flags);
> > > +
> > > +		igt_subtest_f("once-large-%s", s->name)
> > > +			xe_for_each_engine(fd, hwe)
> > > +				test_exec(fd, hwe, 1, 1, SZ_2M, 0, 0, NULL,
> > > +					  NULL, s->flags);
> > > +
> > > +		igt_subtest_f("twice-%s", s->name)
> > > +			xe_for_each_engine(fd, hwe)
> > > +				test_exec(fd, hwe, 1, 2, 0, 0, 0, NULL,
> > > +					  NULL, s->flags);
> > > +
> > > +		igt_subtest_f("twice-large-%s", s->name)
> > > +			xe_for_each_engine(fd, hwe)
> > > +				test_exec(fd, hwe, 1, 2, SZ_2M, 0, 0, NULL,
> > > +					  NULL, s->flags);
> > > +
> > > +		igt_subtest_f("many-%s", s->name)
> > > +			xe_for_each_engine(fd, hwe)
> > > +				test_exec(fd, hwe, 1, 128, 0, 0, 0, NULL,
> > > +					  NULL, s->flags);
> > > +
> > > +		igt_subtest_f("many-stride-%s", s->name)
> > > +			xe_for_each_engine(fd, hwe)
> > > +				test_exec(fd, hwe, 1, 128, 0, 256, 0, NULL,
> > > +					  NULL, s->flags);
> > > +
> > > +		igt_subtest_f("many-execqueues-%s", s->name)
> > > +			xe_for_each_engine(fd, hwe)
> > > +				test_exec(fd, hwe, 16, 128, 0, 0, 0, NULL,
> > > +					  NULL, s->flags);
> > > +
> > > +		igt_subtest_f("many-large-%s", s->name)
> > > +			xe_for_each_engine(fd, hwe)
> > > +				test_exec(fd, hwe, 1, 128, SZ_2M, 0, 0, NULL,
> > > +					  NULL, s->flags);
> > > +
> > > +		igt_subtest_f("many-large-execqueues-%s", s->name)
> > > +			xe_for_each_engine(fd, hwe)
> > > +				test_exec(fd, hwe, 16, 128, SZ_2M, 0, 0, NULL,
> > > +					  NULL, s->flags);
> > > +
> > > +		igt_subtest_f("threads-many-%s", s->name)
> > > +			threads(fd, 1, 128, 0, 0, s->flags, false);
> > > +
> > > +		igt_subtest_f("threads-many-stride-%s", s->name)
> > > +			threads(fd, 1, 128, 0, 256, s->flags, false);
> > > +
> > > +		igt_subtest_f("threads-many-execqueues-%s", s->name)
> > > +			threads(fd, 16, 128, 0, 0, s->flags, false);
> > > +
> > > +		igt_subtest_f("threads-many-large-%s", s->name)
> > > +			threads(fd, 1, 128, SZ_2M, 0, s->flags, false);
> > > +
> > > +		igt_subtest_f("threads-many-large-execqueues-%s", s->name)
> > > +			threads(fd, 16, 128, SZ_2M, 0, s->flags, false);
> > > +
> > > +		igt_subtest_f("threads-shared-vm-many-%s", s->name)
> > > +			threads(fd, 1, 128, 0, 0, s->flags, true);
> > > +
> > > +		igt_subtest_f("threads-shared-vm-many-stride-%s", s->name)
> > > +			threads(fd, 1, 128, 0, 256, s->flags, true);
> > > +
> > > +		igt_subtest_f("threads-shared-vm-many-execqueues-%s", s->name)
> > > +			threads(fd, 16, 128, 0, 0, s->flags, true);
> > > +
> > > +		igt_subtest_f("threads-shared-vm-many-large-%s", s->name)
> > > +			threads(fd, 1, 128, SZ_2M, 0, s->flags, true);
> > > +
> > > +		igt_subtest_f("threads-shared-vm-many-large-execqueues-%s", s->name)
> > > +			threads(fd, 16, 128, SZ_2M, 0, s->flags, true);
> > > +
> > > +		igt_subtest_f("process-many-%s", s->name)
> > > +			processes(fd, 1, 128, 0, 0, s->flags);
> > > +
> > > +		igt_subtest_f("process-many-stride-%s", s->name)
> > > +			processes(fd, 1, 128, 0, 256, s->flags);
> > > +
> > > +		igt_subtest_f("process-many-execqueues-%s", s->name)
> > > +			processes(fd, 16, 128, 0, 0, s->flags);
> > > +
> > > +		igt_subtest_f("process-many-large-%s", s->name)
> > > +			processes(fd, 1, 128, SZ_2M, 0, s->flags);
> > > +
> > > +		igt_subtest_f("process-many-large-execqueues-%s", s->name)
> > > +			processes(fd, 16, 128, SZ_2M, 0, s->flags);
> > > +	}
> > > +
> > > +	igt_subtest("threads-shared-vm-shared-alloc-many-stride-malloc")
> > > +		threads(fd, 1, 128, 0, 256, SHARED_ALLOC, true);
> > > +
> > > +	igt_subtest("threads-shared-vm-shared-alloc-many-stride-malloc-race")
> > > +		threads(fd, 1, 128, 0, 256, RACE | SHARED_ALLOC, true);
> > > +
> > > +	igt_subtest("threads-shared-alloc-many-stride-malloc")
> > > +		threads(fd, 1, 128, 0, 256, SHARED_ALLOC, false);
> > > +
> > > +	igt_subtest("threads-shared-alloc-many-stride-malloc-sync")
> > > +		threads(fd, 1, 128, 0, 256, SHARED_ALLOC | SYNC_EXEC, false);
> > > +
> > > +	igt_subtest("threads-shared-alloc-many-stride-malloc-race")
> > > +		threads(fd, 1, 128, 0, 256, RACE | SHARED_ALLOC, false);
> > > +
> > > +	igt_subtest_f("fault")
> > > +		xe_for_each_engine(fd, hwe)
> > > +			test_exec(fd, hwe, 4, 1, SZ_2M, 0, 0, NULL, NULL,
> > > +				  FAULT);
> > > +
> > > +	for (const struct section *s = psections; s->name; s++) {
> > > +		igt_subtest_f("partial-%s", s->name)
> > > +			xe_for_each_engine(fd, hwe)
> > > +				partial(fd, hwe, s->flags);
> > > +	}
> > > +
> > > +	igt_subtest_f("unaligned-alloc")
> > > +		xe_for_each_engine(fd, hwe) {
> > > +			many_allocs(fd, hwe, (SZ_1M + SZ_512K) * 8,
> > > +				    SZ_1M + SZ_512K, SZ_4K, NULL, 0);
> > > +			break;
> > > +		}
> > > +
> > > +	igt_subtest_f("fault-benchmark")
> > > +		xe_for_each_engine(fd, hwe)
> > > +			many_allocs(fd, hwe, SZ_64M, SZ_64M, SZ_4K, NULL,
> > > +				    BENCHMARK);
> > > +
> > > +	igt_subtest_f("fault-threads-benchmark")
> > > +		xe_for_each_engine(fd, hwe)
> > > +			many_allocs(fd, hwe, SZ_64M, SZ_64M, SZ_4K, NULL,
> > > +				    BENCHMARK | CPU_FAULT_THREADS);
> > > +
> > > +	igt_subtest_f("fault-threads-same-page-benchmark")
> > > +		xe_for_each_engine(fd, hwe)
> > > +			many_allocs(fd, hwe, SZ_64M, SZ_64M, SZ_4K, NULL,
> > > +				    BENCHMARK | CPU_FAULT_THREADS |
> > > +				    CPU_FAULT_SAME_PAGE);
> > > +
> > > +	igt_subtest_f("fault-process-benchmark")
> > > +		xe_for_each_engine(fd, hwe)
> > > +			many_allocs(fd, hwe, SZ_64M, SZ_64M, SZ_4K, NULL,
> > > +				    BENCHMARK | CPU_FAULT_PROCESS);
> > > +
> > > +	igt_subtest_f("fault-process-same-page-benchmark")
> > > +		xe_for_each_engine(fd, hwe)
> > > +			many_allocs(fd, hwe, SZ_64M, SZ_64M, SZ_4K, NULL,
> > > +				    BENCHMARK | CPU_FAULT_PROCESS |
> > > +				    CPU_FAULT_SAME_PAGE);
> > > +
> > > +	for (const struct section *s = esections; s->name; s++) {
> > > +		igt_subtest_f("evict-%s", s->name)
> > > +			xe_for_each_engine(fd, hwe) {
> > > +				many_allocs(fd, hwe,
> > > +					    xe_visible_vram_size(fd, hwe->gt_id),
> > > +					    SZ_8M, SZ_1M, NULL, s->flags);
> > > +				break;
> > > +			}
> > > +	}
> > > +
> > > +	for (const struct section *s = esections; s->name; s++) {
> > > +		igt_subtest_f("processes-evict-%s", s->name)
> > > +			processes_evict(fd, SZ_8M, SZ_1M, s->flags);
> > > +	}
> > > +
> > > +	igt_fixture {
> > > +		xe_device_put(fd);
> > > +		drm_close_driver(fd);
> > > +	}
> > > +}
> > > diff --git a/tests/meson.build b/tests/meson.build
> > > index 9224145cf4..8c7b756716 100644
> > > --- a/tests/meson.build
> > > +++ b/tests/meson.build
> > > @@ -295,6 +295,7 @@ intel_xe_progs = [
> > >  	'xe_exec_reset',
> > >  	'xe_exec_sip',
> > >  	'xe_exec_store',
> > > +	'xe_exec_system_allocator',
> > >  	'xe_exec_threads',
> > >  	'xe_exercise_blt',
> > >  	'xe_fault_injection',
> > > -- 
> > > 2.34.1
> > > 
