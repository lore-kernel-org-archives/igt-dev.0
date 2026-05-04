Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F189FF885A
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 23:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7C210E8C2;
	Mon,  4 May 2026 23:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ava5xcdn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B56410E8C2
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 23:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777938004; x=1809474004;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xzX1sWGV8eLcMiMTmolFKrgismhigQSmqtEEc9c8exo=;
 b=Ava5xcdnZpB4dJOMGunkYUImXmpPyri8RF8wr1Dv9tOOwzUWrKsyGfVo
 Wmi9p3jJFCbgou14hQfRyGtT4aND8YqRTo6s1+jsP7262XDYXOOmDemDE
 9Ub+pdB5pwhT3toui0ywxQjak7XyU6fzxj29NFrER2LruczEbhEChL9L4
 vglN5AvFNideNZ5wW0VRQARRQnrcJ4mJp2/e7zAruG5tvW+/CoHbdMSyS
 LwrORUFS8IxbRemhUrTcFPrV5Fs6jfeKR5Ut4tLnb5eM2tHA65jQEw41K
 JNix+XpqMwQk3svOVXZAGt69T2nvncCoOQLuf3iPWL3in7ZmK/dzAUQ6b A==;
X-CSE-ConnectionGUID: k4ZM7MVNRdSzag0CKaEjQA==
X-CSE-MsgGUID: h6vqvJYsTMGPRjbb0/O+IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="101468989"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="101468989"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 16:40:04 -0700
X-CSE-ConnectionGUID: uUXfsUO/QNydqFDTn+VX9Q==
X-CSE-MsgGUID: eXkQUt1hTQu7lH4x2qbhIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="232988623"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 16:40:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 16:40:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 16:40:03 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 16:40:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7ssf7dOJOCUvPSIiFia9PfUfn4zWXzXpp3RGuu8D10ctfxGg6vT/YG7jLwzV4zdi0h96jKSrBvRZq4TC90R8H3Lp7lVctrA3fY9R40jzoI1pL2ptRW61ojKxJ5D3u1W7U6CUuFbtTGM8DEdZkXDoWsLzaJCx1NDay5lhLz08odcpjU+8Bjg46rJojM25zeCIamOY6wfM/uvTZsH06zATji59WuLSztV6Xvm6FgHc0w+637Vl0mvKeOF0ATTh31zTCE/smCf0dDClTe0agfQ4clWj8d+MTlxfLqsB8DePouCMHvwpIIbFMbmZVe7mJJQZumUf3TFKS+DpTa2/Qo3JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRFZPqg/8TKfDwy/M/sMZgbmK0MuH2ll5fZgsDd+FPM=;
 b=KO1cR3GHF44E+TNEKz8GmFZ+6+hrPjQQLWYa71ODuu8Hk/5jsQnRVR6eq78MWehEMIH0nOm+9Bi5SgCkISBI0dvzHS/vYnWlam0vQ67duVP6JPvVzyoYpcUdd/LPRWThzGn/4I7pXVfngiVlFzTgN+xpoftjBF4BcRQCt56szWvYx2XGZi8ci5OcShv7pZa77N6PeunluAHrJlJGpBGNghoSn5OxRxWKsNMOrVAOaBphLeUjlPl8LLFb/ITbAuNZVkQ7tQ32788gWINR/7xBXgGUNT3TsMJ2KHW3t3q7W6japKQCBkIX0uA9ELmkizI0W+7h1+Vw849L4obhAoOiSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SABPR11MB9962.namprd11.prod.outlook.com (2603:10b6:806:50d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 23:40:01 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 23:40:01 +0000
Date: Mon, 4 May 2026 16:39:58 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Wang, X"
 <x.wang@intel.com>
Subject: Re: [PATCH v2 1/2] tests/intel/xe_exec_multi_queue: use timestamp to
 check job start
Message-ID: <afkuTtMQ4kAHPjgo@nvishwa1-desk>
References: <20260430041055.1901126-4-niranjana.vishwanathapura@intel.com>
 <20260430041055.1901126-5-niranjana.vishwanathapura@intel.com>
 <8f815c90d00b9c7f775725a911b78f088f4a24f1.camel@intel.com>
 <afkl18esqm3GfxWj@nvishwa1-desk>
 <900aba57cd0171213555c866bd12ac6cfc90b0af.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <900aba57cd0171213555c866bd12ac6cfc90b0af.camel@intel.com>
X-ClientProxiedBy: SJ0PR13CA0184.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::9) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SABPR11MB9962:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d55273d-5474-4703-f338-08deaa367560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: XIovWh/o8jOmBIl0p4oIdkRsKHxGfIX0u/lYlP/4+lxO4FrP2mdHs3yf3wg7x21X/iC4WLKS2CkQegMm5cBHUg1EKR0JMIfTiQJxgQI2SQr/yj7fcZilmLHbiQWTebI79sbehUrghNx67+Ufhv0QqBa47J22Kk+OfkvzPGeTbNqE+3tOOeSf2Y4/JvvK65hNnxLfFK7kYFmcaUqfYAxVaNaNmf2LzZTGc0p3CBnCmd7NV4hC9qPJ1nvbUV1wamWUvUg9yjNbrZ+c+jrSkguQZUmdsg0DDR3aIcDDwgo0F8mbjSsvmi9shlr4lBXktIaC2eurk2RtfpBrIhXZFms7HGKdXdDGf5ee3IcdwrryL5ToYTsyhHbQzjQrUg1D/txQng6GdyPDTkzjnJyskeZ0GVwtV4EY5/qw24FcOKqR+0tfW0Kdikwyvij7mUXv/Zin7sdNjfUkjdVQa6O8Hvg/pIyM7d3EX5Kfn83l9F6tliL+nyHEp6uXgOKwaQvNIlWwTsQ3dBepZvmICWEmw4WZmUCfhxQ7rJS4PEwRjf4TdAgtltavmg9aVzHvvk1dkyyJIsMhpvYajhR5sU1dQrJcIaPP5uosGpqiau6iSB1eoMoHSffi7U7hiumMxTNJiLK1aaoPvJ2oPDioX50XpAibzviHDuOEth8NHH7/kespJKxBLDNO3CE54x2gHiwY1JlS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PS4NBJktZA46OGh4xjmoRlgUBkC/i4zFTpJnfSCGDJk2u3wmLXL5Pk5Npq?=
 =?iso-8859-1?Q?NpRTDg7mU2KAK9sVnbTiZwLwjQNhvzet11DlzqggxfpAlUwjNj4HzSVOaO?=
 =?iso-8859-1?Q?UqmtRMmhX6uya9dJ+15TTkkQ34QS4CIBqrXY9ZVUMRT4C9WgeWJW5dTEmV?=
 =?iso-8859-1?Q?7NAxHnXUBcb1eJt5I3CBF0UaVuQU1JVIMrh+rNLbfLeSNeIcFQxa+DaPfY?=
 =?iso-8859-1?Q?5yso3fCY50eCag9jCEMxO/GdxurY/K43GWubPEU1G8rOjY0LgcB2aTa2Ca?=
 =?iso-8859-1?Q?h+afJDrAU/zeOQPHNyF8af9TobF/T/6rMFxPx86EzQMMWDjQQ8vFS9hEXK?=
 =?iso-8859-1?Q?VpS4gMtQykjveyLqHSlVLqIXtOrW1SsMwIAN5Xep3ubdQ1bNlEXzjz+9cp?=
 =?iso-8859-1?Q?bGTO449ANwzdFZDNjFMB7U5Bmis9WxTgMhOcjvauNAAK7T6TQMLGOaLmOF?=
 =?iso-8859-1?Q?i+KUtEcySgjqqSM66EH8Di+1YdIxNVA+OH0uxu3rRfGt8Pa2qdp2zeftQF?=
 =?iso-8859-1?Q?Xj6bwwkBOwdTGg9PahuRbeG6a/ybJOPgPxspgZpSw+esiSvMyd0S45qqoY?=
 =?iso-8859-1?Q?wKUrZySa8YH77zOwHmSk0b3RV0rouqIoC4TDcu3mrJfORgM5LeofTvkbng?=
 =?iso-8859-1?Q?yKeAtSPC0WoVBtEjmlIgoH6XBl+b0MqMZ/Ca1D2BAgWR1TA2aRhCcO6iNu?=
 =?iso-8859-1?Q?FmeiCLG7jaxIwz7mK5qg2b/zD0sG0srPoinS8aKXW25qxwNx0Sgy7jIHu1?=
 =?iso-8859-1?Q?Nx3m/bX2bZAquj8O65g6hhNvDvEC8AYLZPo+yVv9wPfwHTRaWQFT2TpV0o?=
 =?iso-8859-1?Q?5jkZwN8MBiYSTp1dWLH+P1SB22/ZBAFfXmdMy4UKPJPDyBFTWqkYEAS3SN?=
 =?iso-8859-1?Q?gPWwWP0vVv65AcRvKtBN2jYcwJXadejhlTkBeBji+3qj7s3JgWMtcWDUNl?=
 =?iso-8859-1?Q?Ka8CYOHY7O45/EHW3og23McTwUJteRF6GsGy8twLZOGcG0TiEiQ3EDiDKi?=
 =?iso-8859-1?Q?hmobyikMU1vpf/gpxLBAl9JIRkIjbc6d1SGIiZGQrzPUf2ta8CM/xjWfvI?=
 =?iso-8859-1?Q?R8N2tgA/q95YSULkES2tgGSdMB8OKK2WPzOeeMgpq5Xsg7TxbVWI3OKgCA?=
 =?iso-8859-1?Q?8Opom8zb28yxfYOUTjgAbsozXrzwOVXCUYptDBz0AFFDkHwrZ4cDf0MAec?=
 =?iso-8859-1?Q?lCvtofNm6RvGeau/V5bWG0EQXqLQrNk6prEY2Ij81H2eLZGM18la0CZMx4?=
 =?iso-8859-1?Q?b8ZBSehzobuC/eebYrm/3r24ZAds9FSHXvKPhFuIxICHIdRu9/SZ1A3zRE?=
 =?iso-8859-1?Q?nD8u4M3eGomI/g8B3dR0La7G5dvYfB1Reo5PAnn0svKNy2uLuq1KpNfZYT?=
 =?iso-8859-1?Q?p4P7M3/PAs1/IF1VrBBoz8EjnWwsadx7h5R+yWcoSr22B+ghsBRVZxM+s/?=
 =?iso-8859-1?Q?7Lg/6r0emVZMWZvBZuZvv7m9Rkx+Jtq2M+XVTmoq0UryfPq6gKBy3qdCuU?=
 =?iso-8859-1?Q?4a2JOCaImn4jwlFdjmrTgkp3oTpV7n91U5tnJUygGdAWMHL/RgCUHHIUwG?=
 =?iso-8859-1?Q?iPRW463Kr8wYcLmpZgvquS+2zRNiCy02eC8icmjQUGB8YJG7iTfpj62Zgh?=
 =?iso-8859-1?Q?Bku+RAU2Z9AnrNnLDKBKJfoQOwc0blMn9FR9upJvcgiJV0UeNawUekeJ1S?=
 =?iso-8859-1?Q?NNQEgf9VL2+3Uxtjh/CvNW0JCTD27vyRHxbwcPqchy6ZzmD3BlDk91WAXg?=
 =?iso-8859-1?Q?qkOd4O9zQNJeu2pmbjpbXFIoIIfyPLp6sVcOSqjdMIyYTCtoi0Hv35RNcz?=
 =?iso-8859-1?Q?6tKqNHJN3kWKA8U/EeiR5S8mDKqjDk83oUrGdrUB8NAK4RqaqogM?=
X-Exchange-RoutingPolicyChecked: JRk6/XMANXQESzvWbsGUmvGY0QSQvUXY5qlXhfzgZZnLgvMAGvtNbn0mG3X6ahUUQz9/1SWeL7HkgptlyOEuGYQIf7kkfwE5W7Y2NaXRdTSSoRj4SvfB6uszcEn9Dj9e7xYkMEV2RldgUQ65AVM0QVFKaxdutCcSBvnsla7cUgQf4LzBqkeD1CW5Mn2uMd/FGUpmKYJtYK6b0VExczhPWd5oSqQguZqhybD5Biie65kDeZmsBCxY4kiEBui5ybqm74K2JyAhxieDxOtPyeKx5885RI7Z6FCINyXCgITvnwx1M7HRxj0YJdneHH0jRTTaao9iiE1T8/cVYsLhTAlSVw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d55273d-5474-4703-f338-08deaa367560
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 23:40:01.0249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJhlwkckFaF0xxC0i0fTb4OXbzYHHz5HMpJcaOzsIhgKriJ8CMzmUVoJF8LGgyTWrj2hl/fncESK/ogsP0VI/AERwFAVfXhlik7efmomI+f3+Fmokl5GinAmUdnKRhre
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SABPR11MB9962
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

On Mon, May 04, 2026 at 04:13:32PM -0700, Summers, Stuart wrote:
>On Mon, 2026-05-04 at 16:03 -0700, Niranjana Vishwanathapura wrote:
>> On Sat, May 02, 2026 at 05:46:20PM -0700, Summers, Stuart wrote:
>> > On Wed, 2026-04-29 at 21:10 -0700, Niranjana Vishwanathapura wrote:
>> > > In __test_priority(), enable write_timestamp in
>> > > xe_spin_init_opts()
>> > > and use timestamp value to determine the queue switch order. This
>> > > replaces the indeterminate sleep() with a more deterministic wait
>> > > based on the GPU timestamp.
>> > >
>> > > Pre-set all spinners to preempt-wait before submission so each
>> > > queue, once scheduled by HW, blocks at the semaphore. This
>> > > ensures
>> > > all queues are running on HW before testing priority-based
>> > > scheduling.
>> > >
>> > > v2: Read timestamp to check if queue is started
>> > >     Use usleep to ensure all semphore updates are visible to GPU
>> > >
>> > > Assisted-by: GitHub Copilot:claude-sonnet-4.6
>> > > Signed-off-by: Niranjana Vishwanathapura
>> > > <niranjana.vishwanathapura@intel.com>
>> > > ---
>> > >  tests/intel/xe_exec_multi_queue.c | 57 +++++++++++++++++++++++--
>> > > ----
>> > > --
>> > >  1 file changed, 43 insertions(+), 14 deletions(-)
>> > >
>> > > diff --git a/tests/intel/xe_exec_multi_queue.c
>> > > b/tests/intel/xe_exec_multi_queue.c
>> > > index ca96099d36..0b31dd7a3f 100644
>> > > --- a/tests/intel/xe_exec_multi_queue.c
>> > > +++ b/tests/intel/xe_exec_multi_queue.c
>> > > @@ -454,25 +454,24 @@ __test_priority(int fd, struct
>> > > drm_xe_engine_class_instance *eci,
>> > >         for (i = 0; i < num_queues; i++) {
>> > >                 uint64_t spin_addr = addr + i * sizeof(struct
>> > > xe_spin);
>> > >  
>> > > -               xe_spin_init_opts(spin[i], .addr = spin_addr,
>> > > .multi_queue_switch = true);
>> > > +               xe_spin_init_opts(spin[i], .addr = spin_addr,
>> > > .multi_queue_switch = true,
>> > > +                                 .write_timestamp = true);
>> > > +               /*
>> > > +                * Pre-set all spinners to preempt-wait so each
>> > > queue, once
>> > > +                * scheduled, immediately blocks at the
>> > > QUEUE_SWITCH_MODE semaphore
>> > > +                * after writing its timestamp. The HW switches
>> > > between queues at
>> > > +                * this point, allowing all of them to schedule
>> > > deterministically.
>> > > +                */
>> > > +               xe_spin_preempt_wait(spin[i]);
>> > >                 sync.addr = spin_addr + (char *)&spin[i]-
>> > > >exec_sync -
>> > > (char *)spin[i];
>> > >                 exec.exec_queue_id = exec_queues[i];
>> > >                 exec.address = spin_addr;
>> > >                 xe_exec(fd, &exec);
>> > > -
>> > > -               /* Wait for job on Q0 to start, other queues
>> > > block
>> > > behind Q0 */
>> > > -               if (!i)
>> > > -                       xe_spin_wait_started(spin[i]);
>> > >         }
>> > >  
>> > > -       sleep(sleep_duration);
>> > > -
>> > > -       /*
>> > > -        * Expect the job on other queue to not get scheduled
>> > > while
>> > > the spinner
>> > > -        * on q0 is not waiting on preempt condition.
>> > > -        */
>> > > -       for (i = 1; i < num_queues; i++)
>> > > -               igt_assert(!xe_spin_started(spin[i]));
>> > > +       /* Wait for all queues to start and write timestamp */
>> > > +       for (i = 0; i < num_queues; i++)
>> > > +               while (!READ_ONCE(spin[i]->timestamp));
>> > >  
>> > >         if (flags & DYN_PRIORITY) {
>> > >                 /* Assign increasing order of priority for
>> > > secondary
>> > > queues */
>> > > @@ -485,6 +484,36 @@ __test_priority(int fd, struct
>> > > drm_xe_engine_class_instance *eci,
>> > >                 sleep(sleep_duration);
>> > >         }
>> > >  
>> > > +       /*
>> > > +        * Clear timestamps and release all queues from the
>> > > semaphore
>> > > wait.
>> > > +        * The order in which they next write a timestamp reveals
>> > > the
>> > > +        * priority-based scheduling order.
>> > > +        */
>> > > +       for (i = 0; i < num_queues; i++) {
>> > > +               WRITE_ONCE(spin[i]->timestamp, 0);
>> > > +               xe_spin_preempt_nowait(spin[i]);
>> > > +
>> > > +               /*
>> > > +                * For Q0, wait until it is running again to
>> > > ensure
>> > > it holds the engine
>> > > +                * when priority arbitration is triggered.
>> > > +                */
>> > > +               if (!i)
>> > > +                       while (!READ_ONCE(spin[i]->timestamp));
>> > > +       }
>> > > +
>> > > +       /*
>> > > +        * Sleep to allow xe_spin_preempt_nowait() to become
>> > > visible
>> > > to the GPU
>> > > +        * for other queues before checking if they have been
>> > > scheduled.
>> > > +        */
>> > > +       usleep(10);
>> >
>> > Ok I still don't understand this sleep. The fact that we hit the
>> > READ_ONCE(timestamp) above means we should be in a waiting state,
>> > so
>> > I'd expect the asserts below to always pass. If they aren't that
>> > seems
>> > like a bug to me. And if they aren't passing because the timestamp
>> > write to 0 in the for loop above didn't take before we hit the
>> > nowait
>> > at least once, that also seems like a bug to me. Do we need to
>> > something else to flush the write in that case? Or what is the real
>> > problem there? What is the signature you see if you remove this on
>> > a
>> > sufficiently slow platform?
>> >
>>
>> We need this sleep() before we trigger the queue switch below.
>> We add the sleep here or after we verify that the secondary queues
>> have not scheduled in the loop below. But we need it before we
>> trigger the queue switch. Without this sleep, I see that sometimes
>> a low priority queue starts running immediately after we trigger
>> queue switch, then rest of the queues run properly in priority
>> order. So, looks like we just need to give enough time for the
>> xe_spin_preempt_nowait() to become visible to the GPU. This is
>> way better than the multiple seconds of sleep we had earlier.
>
>Reviewed-by: Stuart Summers <stuart.summers@intel.com>
>
>I agree this is a lot better than what we had. I'm still not convinced
>on this sleep though - it seems like something we're using to cover a
>missing flush (e.g. maybe we aren't explicitly causing the PCIe write
>to POST from the nowait write).
>
>But yeah for now let's just take the improvements you have. We can
>always further optimize later and it's better to have something working
>consistently in the short term.
>
>Maybe for a future patch, but one thing we could try is adding an
>MI_USER_INTERRUPT conditionally in the spinner? Then we call
>wait_user_fence there and the read should flush the PCIe pipeline for
>the nowait change and ensure we're past a specific point in the batch?

Yah, we need some kind of flush triggerd form the CPU side so that
CPU side memory writes are fully visible to GPU after the flush.

Niranjana

>
>Thanks,
>Stuart
>
>>
>> Niranjana
>>
>> > Thanks,
>> > Stuart
>> >
>> > > +
>> > > +       /*
>> > > +        * Verify that secondary queues have not been scheduled
>> > > while
>> > > Q0
>> > > +        * holds the engine.
>> > > +        */
>> > > +       for (i = 1; i < num_queues; i++)
>> > > +               igt_assert(!READ_ONCE(spin[i]->timestamp));
>> > > +
>> > >         /*
>> > >          * Trigger a queue switch by making the spinner on q0 to
>> > > wait
>> > > on preempt
>> > >          * condition, allowing job on q1 to get scheduled and
>> > > finish.
>> > > When we end
>> > > @@ -501,7 +530,7 @@ __test_priority(int fd, struct
>> > > drm_xe_engine_class_instance *eci,
>> > >         i = 1;
>> > >         while (i < num_queues) {
>> > >                 for (j = 1; j < num_queues; j++) {
>> > > -                       if (xe_spin_started(spin[j]) &&
>> > > ((already_in_order & (1 << j)) == 0)) {
>> > > +                       if (READ_ONCE(spin[j]->timestamp) &&
>> > > ((already_in_order & (1 << j)) == 0)) {
>> > >                                 start_order[i] = j;
>> > >                                 xe_spin_end(spin[j]);
>> > >                                 xe_wait_ufence(fd, &spin[j]-
>> > > > exec_sync, USER_FENCE_VALUE,
>> >
>
