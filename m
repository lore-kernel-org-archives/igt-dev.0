Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE352C54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 18:44:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DCD210F5A3;
	Thu, 21 Mar 2024 18:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TWpXajay";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C5410F5A3
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 18:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711046663; x=1742582663;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IKW6ZA3paxf7G6CBec4qSR2CKQvuVtJMHM5thxME3qc=;
 b=TWpXajayG4D6dbUycUDVY/zmy7d2Y1cTXQrEIRcEwrgSCPDGJir3e7L4
 0Cq7Pi2eJO3JS4HP7rMJlujSkgLqkBz4ujgKN/CBXg7mWpPzv+Q3PIbjk
 BOQHgn3piInSZqIeemqXmKSIaVQS/ICEGdWuQLFQIZWcREMG8aUFGzDEV
 VxeU1iF3R4j+qTJzwBvQeAcyE4ZEmM3TGXd7YV8N1pFRi1xi32uU8Po2+
 57g+A2c4U7g9jWPuJzvrQyikHgzvF/lsxVyZuPN1I1QUgjPy235nSulER
 EmZ/EfpfQRps9FvwsnGvSqvsLKKasJXk3TTfnS2J+UH6vS173QA/FOB0p w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6272617"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="6272617"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 11:44:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="37738102"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 11:44:23 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 11:44:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 11:44:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 11:44:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjbInm/ETjul4wZQ5EF94PtD/6xGP5GqaUY3H5yXIdcwET5NzWnSyRe0XNs8SAQn147oPkQksGYNC4KE8ADFNGmZQrxfBJcI3Ha54HmYdqAeMgdAx7qDLJgLIJR+NLulAv5IoGE7dIHyJi8Gz6IwbIz3iFZEWFXqnFz/KIyoO8MNGyj+2jR+ezCI/5dmxZQEJwmHFBODbCJCQ7unElIIKy/3oo3vuwuAmQtuEc7e3vTbq6tla88Ysu4Edsqv3gHup7antd2djqFWgqjZGrA+rJgIllJojR8GW3eEDuZxq/LCM2OZYXWMjziJmXEUsDZbKKms/IU3JeHKdmj1FF/+Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRMyUgAHcDF84ricHuJoUPSXbnGDlcvdxK8p7hDnqxc=;
 b=HQPYxs+pGRAnU/Spz1kNs5ksmz7N5gd8zlSWLrBWnorbkYpJEa7U7pxFiiQPlWEluQ4511VqBgxoMV/siKiKs5MI+n1b++OkteN2FJ6kc9vyPcf+xxRdY/8IlGXGPpJGmzooNN9HnmosA1U0uMvYNcBtYUG/5o1ZmZwuM8Eewye2bKE6+EtEtzn2biFQ3xCASL40wZWFatuVSZ+5wZUYIeWOhceqTSabn2YMn8Bs/rv13T9uBWO6oQWhadUFBLas67dl5jg5n6KskfIF+h2PD+0DUyuCM04ioDMyUcKPfncd5mRvgb7Do2SR4DlGDzyyTa05tnnBSzFM7RIJMtFRNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7118.namprd11.prod.outlook.com (2603:10b6:510:216::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Thu, 21 Mar
 2024 18:44:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 18:44:20 +0000
Date: Thu, 21 Mar 2024 18:43:46 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/xe_exec_threads: Fill in GT field for second
 balancer thread
Message-ID: <Zfx/4tqsIyhVYDSl@DUT025-TGLU.fm.intel.com>
References: <20240320192356.359327-1-matthew.d.roper@intel.com>
 <7vgrnkw4ndo5ydxybh3qoqriovorgyvrrsatt4tgifis7xo3ju@3g7qmeluwrps>
 <ZfuHpR6TCEnzLw8X@DUT025-TGLU.fm.intel.com>
 <5frc2lhbpyb7xlpt2pt3rce4jo4pes5qbpjjsuase57pwen4hm@44wimyrmjomc>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5frc2lhbpyb7xlpt2pt3rce4jo4pes5qbpjjsuase57pwen4hm@44wimyrmjomc>
X-ClientProxiedBy: BYAPR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7118:EE_
X-MS-Office365-Filtering-Correlation-Id: 73e80ae0-6e01-4585-d9c8-08dc49d6eb81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ION1cCpBIdjoXscevhLradoQ36erOrrN9TfetdfbO43j47WWx2mGXopM64BJvr5TeaXcPbtlQeXKnrh6NziqXi08tbI4oV++1C4VDOxNtw34/HJGwQqWYK8z7Ge1iPGCNszV9zLwno19bL1iSdkmpJRX2RdCecUuaCUcYZEUCvb/xwqB6snuqe6No+6iewSFVSwW16db6/gkQiv441UdoxPEU577UnyDqLI5xESHv/28Cpotee4DSoQC441KuvW97IElhW0WE/GEba82d4D0x6zA1mFc31WTkmrYIBJg0FSVM+Q2YsY4bdp5AEzMak6KoeGW5nPDas1E2YMFGl3RylI5+P48RXBl894xw8TOLv+lEi0iK6yayPBW1lhkFLmobCLnUz6k8XrieYxwVy4LNQqCdI2KE4JMA8Fj8RsVXSDqPGfKAxjTyK2HyTaGG98kVLnmWJEwUGOEaTcLpEgZKnx1DNj0vo3H1UGUlJwTEduJXWfZxZVXe91QciTAcLQnaqtKiwQq8xMtZWeL5X5hdGpYL5Mw6TSLFdlsho0w2oNZ3af9VPO9yx4Z5wfd6dOCkhD9ssbPYajVqTl1xj0JPP5+qlWjta2LI9BapRixGjtF2T7vUVKU0bkWOjGzZiVCH6RzZ3tZ6Y6/5zjHdRiSa/RnH772X7fXz7tcFLAxD8A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fROmO1sob2vvM7ptYqLPhj0GP4I2iWVewmVNxlBqPB9NJ91jy374o8VEeUj7?=
 =?us-ascii?Q?eeX4DSF6oolbWbPX2QhQX1rQknEhVdkt3clrnR5CmV7lADIGcfiH6oOpHgMe?=
 =?us-ascii?Q?YSkLLfwcYZY7BEHe3n5waE0j7y0eu/Mx68dC2/w7ixoiFT/rO7OZGWj3hbtp?=
 =?us-ascii?Q?4yP7kekEeoCPUNBajaq2eyjfV6UvzrLU/t6pp//maNTvUb/wmadXnE8RV1Mz?=
 =?us-ascii?Q?tgxwFxIxIZ8fgrxkbZtoCCKnv0KmCuqVp5x+rhKkFFHFiObJ7EVUy1tLqV2G?=
 =?us-ascii?Q?LSN1XHz5tau+zqSifaPcGgzX0iVUKHCSd0vi+ToA4HwdhS15E3pxLabOVWUI?=
 =?us-ascii?Q?khp8+ytKSN92Ri+4wsy0Twf4oiPHikg+FgkXBsgB9V9oNhLxXKDLuG670X4t?=
 =?us-ascii?Q?5fMzqoKN8stXGCR6V1aDgIOAbAZzA6vIYUZ5XHZJys+aDi9Incl3j5aJdgF/?=
 =?us-ascii?Q?BLY2mb6fWc+gF8jHh/VkoLQdp87Di71etl2j1t+SR19oR3y3YJhnNdTCSZOJ?=
 =?us-ascii?Q?eAdgrsvggrhJhL+SO5wZNptTx2OnS99YNBTBcgsex66lUm8xjFRd4dDjg6Cd?=
 =?us-ascii?Q?GFMogAI2XBPFRlBzeIb858RuW0i5mkx9e3a6CoVis5TBnFWDnps2jHnBViF4?=
 =?us-ascii?Q?gK6p/q4j/ebdi4l34P4JdQlvnI27lMkNvMvJcMpz4A8h48Jf4qjGYoEfTl+T?=
 =?us-ascii?Q?MRU/B7U6DkZd+7ldDnXCwhc2/g81ZJUNasKYEBxNX1DYXGp+BTQNZPnO5Nt8?=
 =?us-ascii?Q?aReJUNpndqEXYicdiAx4F7Auo4WBck20A2P/egK0q4aJXvA7XaWBd3gV3C6o?=
 =?us-ascii?Q?S46KnNYHCt7wZHhzuWqBzRB84Uw8yu0H7c/ac7d3ImRQZNZPiTJKxsSxf+rc?=
 =?us-ascii?Q?5Ec20bxvqIWB71XQspKWUyKStJdbv2HE8T+FZe8zvrMysX6F1tp5jjO6SHeJ?=
 =?us-ascii?Q?yqtlnD5urTFP7GKaiSObp19HfLnvG/U4ctecKAbBhSq/2RNeDaUtiRhQA49D?=
 =?us-ascii?Q?xc8MV7VweBjjIkmI39X1JuvVwJkRYHBcU1T1U0U/uvvmLREo5CKn2cQdMOzy?=
 =?us-ascii?Q?DJHKyerTfG/aftkayU0qeC9/31LLqbhYm3Y/ylGE4o/LRYiiHY1Rb6SPcEYQ?=
 =?us-ascii?Q?n1At1gJYj9OrBmSGB9dg1Ol890c64hsAlQdxTznFoqyRdXW/HNykgOb5mufk?=
 =?us-ascii?Q?UmeAZ/q3pT6TArNQPVWwQvmvon8an4aW9LPX7DAUgT+LyVyDLOlZ+q3Ip7V/?=
 =?us-ascii?Q?5NzmidHi75Ot6J8zoyBRz1Hcc6VJmh85vyuOobW5joMoveGGkQbrkGJwCWQ3?=
 =?us-ascii?Q?r5UPmCs352SkBmkroJi7pN0Ll/x0Cpd/LdOwfZjyzfWt7+QFbAFw+4sgrMop?=
 =?us-ascii?Q?b4Lxpc00XJqCKuSnjxnY5bRlNWcpRTqwRBvEpLpqeVU21Qebso/0s7dbd98f?=
 =?us-ascii?Q?1Jol0grnx21f4+2JiVnodKiVn4N8CkTLkiM2/Mob5+wFyT+Rr9OezPq31c2c?=
 =?us-ascii?Q?Jh7UlHPB7ayiNW9ht4Fi2ETZFo2Rm1Hn1ZclEIpw8evVFZuymer+dJx3FwB7?=
 =?us-ascii?Q?h+xddG5+6DesTBD0LF+bKTvmlSbCZN0V274QrSI8pby/pMsNl8CckQYTruYl?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e80ae0-6e01-4585-d9c8-08dc49d6eb81
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 18:44:20.4290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9GgS1nZNcum+QpE5H6F+3v4UTzbDQOi1OBzHx/vGp1C1o1MnyCHLUKQe2YysZhXNGVcVoNTifCMcKZY/GUS/kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7118
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

On Thu, Mar 21, 2024 at 01:01:22AM -0500, Lucas De Marchi wrote:
> On Thu, Mar 21, 2024 at 01:04:37AM +0000, Matthew Brost wrote:
> > On Wed, Mar 20, 2024 at 03:47:57PM -0500, Lucas De Marchi wrote:
> > > On Wed, Mar 20, 2024 at 12:23:56PM -0700, Matt Roper wrote:
> > > > The balancer subtests spawn two pthreads per engine class if there are
> > > > multiple instances of the class.  The GT field of the data structure is
> > > > filled in properly for the first thread, but not for the second,
> > > > effectively leaving it set to "0."
> > > >
> > > > For platforms with standalone media, this will result in failures when
> > > > the thread tries to find the instances of a media class on GT0 and trips
> > > > the "igt_assert(num_placements > 1)" assertion in test_balancer().
> > > >
> > > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > 
> > > 
> > > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > 
> > > do you know why we unrolled a loop in there and did a wrong copy and
> > 
> > I think the for_gt loop was added after the original version of this.
> > Likely an ommision when that was added.
> > 
> > > paste? That together with vertical spacing on flow control seems to be a
> > > good source of bugs. Good find.
> > > 
> > > The only difference between the first and second thread data I'm seeing
> > > is flags VIRTUAL vs PARALLEL. Matt Brost, is this test from you? Could
> > 
> > Yes, I wrote this one. Not my finest work in terms of copy / pasting,
> > indeed the only difference should be VIRTUAL vs. PARALLEL. I think this
> > should be consolidated into a loop.
> 
> 
> sounds good. Something like this on top of this patch? (completely untested, it builds)
> 

Yes, that looks about right.

>   diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
>   index 977e8c600..b95870714 100644
>   --- a/tests/intel/xe_exec_threads.c
>   +++ b/tests/intel/xe_exec_threads.c
>   @@ -1030,6 +1030,7 @@ static void threads(int fd, int flags)
>                   xe_for_each_gt(fd, gt)
>                           xe_for_each_engine_class(class) {
>                                   int num_placements = 0;
>   +                               int *data_flags = (int[]){ VIRTUAL, PARALLEL, -1 };
>                                   xe_for_each_engine(fd, hwe) {
>                                           if (hwe->engine_class != class ||
>   @@ -1038,36 +1039,10 @@ static void threads(int fd, int flags)
>                                           ++num_placements;
>                                   }
>   -                               if (num_placements > 1) {
>   -                                       threads_data[i].mutex = &mutex;
>   -                                       threads_data[i].cond = &cond;
>   -                                       if (flags & SHARED_VM)
>   -                                               threads_data[i].addr = addr |
>   -                                                       (i << ADDRESS_SHIFT);
>   -                                       else
>   -                                               threads_data[i].addr = addr;
>   -                                       threads_data[i].userptr = userptr |
>   -                                               (i << ADDRESS_SHIFT);
>   -                                       if (flags & FD)
>   -                                               threads_data[i].fd = 0;
>   -                                       else
>   -                                               threads_data[i].fd = fd;
>   -                                       threads_data[i].gt = gt;
>   -                                       threads_data[i].vm_legacy_mode =
>   -                                               vm_legacy_mode;
>   -                                       threads_data[i].class = class;
>   -                                       threads_data[i].n_exec_queue = N_EXEC_QUEUE;
>   -                                       threads_data[i].n_exec = N_EXEC;
>   -                                       threads_data[i].flags = flags;
>   -                                       threads_data[i].flags &= ~BALANCER;
>   -                                       threads_data[i].flags |= VIRTUAL;
>   -                                       threads_data[i].go = &go;
>   -
>   -                                       ++n_threads;
>   -                                       pthread_create(&threads_data[i].thread, 0,
>   -                                                      thread, &threads_data[i]);
>   -                                       ++i;
>   +                               if (num_placements <= 1)
>   +                                       continue;
>   +                               while (*data_flags >= 0) {
>                                           threads_data[i].mutex = &mutex;
>                                           threads_data[i].cond = &cond;
>                                           if (flags & SHARED_VM)
>   @@ -1089,13 +1064,14 @@ static void threads(int fd, int flags)
>                                           threads_data[i].n_exec = N_EXEC;
>                                           threads_data[i].flags = flags;
>                                           threads_data[i].flags &= ~BALANCER;
>   -                                       threads_data[i].flags |= PARALLEL;
>   +                                       threads_data[i].flags |= *data_flags;
>                                           threads_data[i].go = &go;
>                                           ++n_threads;
>                                           pthread_create(&threads_data[i].thread, 0,
>                                                          thread, &threads_data[i]);
>                                           ++i;
>   +                                       data_flags++;
>                                   }
>                           }
>           }
> 
> > 
> > > you add an overview to its documentation? The boilerplate doc added
> > > there after the fact looks less than helpful.
> > > 
> > 
> > What kinda of documentation were you thinking of? Most all the IGTs are
> > light on doc but updating the doc for ones I wrote is on my todo list...
> 
> It would be good to have an overview on what the test is checking and
> how the different subtests are different from each other.
> 
> thanks
> Lucas De Marchi

Ok let me see if I can write something up.

Matt

> 
> > 
> > Matt
> > 
> > > Lucas De Marchi
> > > 
> > > > ---
> > > > tests/intel/xe_exec_threads.c | 1 +
> > > > 1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> > > > index 55907e2b3..977e8c600 100644
> > > > --- a/tests/intel/xe_exec_threads.c
> > > > +++ b/tests/intel/xe_exec_threads.c
> > > > @@ -1081,6 +1081,7 @@ static void threads(int fd, int flags)
> > > > 						threads_data[i].fd = 0;
> > > > 					else
> > > > 						threads_data[i].fd = fd;
> > > > +					threads_data[i].gt = gt;
> > > > 					threads_data[i].vm_legacy_mode =
> > > > 						vm_legacy_mode;
> > > > 					threads_data[i].class = class;
> > > > --
> > > > 2.43.0
> > > >
