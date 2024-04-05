Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38296C67861
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 21:58:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D387E10EA7A;
	Fri,  5 Apr 2024 21:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LxPsd5Qs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869CA10EA7A
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 21:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712354318; x=1743890318;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fet5MVaN2SsK67wwErLTOJyMUO33/biJ11pSzJAp71c=;
 b=LxPsd5QsGId6uDdmKsXQoEE1AoIKPrvfOPn9CUE3UJAEg3+TEp3FknXl
 uNd7gezzstNa+tIwU4FSBpob1+IhNQfCM3fUQBa6OmCAJ7hqPJakKjPzm
 jMs0Kh7B84EdUCrSY1H308W3gt30B3q3nDBqXO3VLKBJU9F2dCfw3c6tA
 bDP2rcvM1lxZ7V0alHAVLAf8BNmalr8QUke4Yk5q04M29nc3ywySQLfYa
 wXkSl6Gn+g6y/aQM8iVdWPX98XXLf0Ynh6UjuBX+FyUv73H3gtkJLk0e4
 9AfpDx6JY4YVImQpAT4U2lyD7Q3b3iZ0S+CVc68QLtejDL01gQZxGbO/0 Q==;
X-CSE-ConnectionGUID: LpLqXJyxRWqP63pH1Zy4hQ==
X-CSE-MsgGUID: f4kHsIWIRt6dy+k+tntpgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="18842042"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; d="scan'208";a="18842042"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 14:58:38 -0700
X-CSE-ConnectionGUID: I7KXAU1ESm2y8nQA3gRcxw==
X-CSE-MsgGUID: EcKagl8USVm2av78Lp3KRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; d="scan'208";a="19138897"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 14:58:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 14:58:37 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 14:58:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 14:58:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 14:58:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOePltzt0W6rXMQNDp7zdRamu6g41ZdoGNWMrFF29VaaFkWvVwFT3qk5YpOvHGBIJMXAYRCbgmW+s5HWUCJLnRCWkusXpm9SVCWAmlyRraTRmDJyqCeCjVBoCkV3VFkJRSav/ZfTcOiQJTH2ZLnf4zMsX/rBO2aIBWmem9qyTUX0nF3gaYHReWaoMeotvwzHeiuT7e9ouuxmTI1UzytHHIZEPnw4qgoSKYsjqLJ1jwP2E9O0sGOPmSoVwaGrygio2PMFQ5wcJPQwDqAKwzq0/+2Zs+iT0Lp+GVAe/B37Hw49PrjLkupz3o07X71+M+rAO5xaEs2p/FdEN1Ce7waUmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bi5sZVdfRoj7jmLjNZ5O42rSuzOdu9pRYi253p7Hsuc=;
 b=cLd9FO1bkkalJGsJdDdYrfdPy7e+ddHMPanT068Msf58DveMzdn4mMKGJQGQgsInRM2Ro2Sz4n+lHXR+vEtdRwVb6g2sYhaSWO9mY5mUwN2qlG2jqNOchfqNNYVvS5TYA/nURPm23ZTAejJP1lPj66m0wY27qB+STUgOm4trFMHS3QkAX+Y1edZM8gTfRLSK3Kz/a4JPY82Y4mIU0h9DAptX6rAxJWntuWMfGdkbgWmm/3+EzwZPyf7gu7nzcI7YOUtPqY2g9YSSE5UAyVcPRdyCG6q7ot4h70lxHoBU29aWBxVMcC+n1NuavyNiYSDjUQNRUjO/7U228bFJV6Si6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4583.namprd11.prod.outlook.com (2603:10b6:208:26a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 5 Apr
 2024 21:58:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 21:58:35 +0000
Date: Fri, 5 Apr 2024 21:58:15 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <matthew.auld@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_vm: Fix Sync Issue between Unbind
 and Hammer Thread
Message-ID: <ZhBz9/pwg6/Ol8oW@DUT025-TGLU.fm.intel.com>
References: <f845a357442bd285ffb26cd0288a97819cd9d470.1712350676.git.jagmeet.randhawa@intel.com>
 <ZhBzlaOywBje1xeU@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZhBzlaOywBje1xeU@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR05CA0182.namprd05.prod.outlook.com
 (2603:10b6:a03:330::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4583:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mC57mYc4kuaCOHoBd9F5LshyeGL31Bg1Z0zD2/srJtQaSsjond70snGKrrFjy9QTCo45uGYER1B0tL/gGsaKyiDVCTShxjU6PNRn+LeZUOBK/dlEc9ecjlNyZajQKDRKkB9MxuYfBxZZiBd75GJleM6W5vW7L43+hHXfO0AgSJxEy+qpa3OApbMLeBeTrHV4i13+i1ijeKYLd2JoNP36MoVEOaqsXCf7chx5GVzHlbYRSihRdAAQVlZWPI/7a2vs3RDcT1BMbNgRFF9wV/YKFLaLoP6vSnTTixdTg9ASrC72t6PDXYNsYFDI1/6aV25dfcuvk+jnVcGM8trnH/F64aSDcHmQc7dJf8RTcHRBdjjQ0fPdNIeBcmin56k3WYwQdvLf9u9Qw9laVUfKgZm6pDKmXyuFoCvwR9uQvO3bxUK8m95D3F77/Mj/JdETaqQdjB1dP2PLWXz6xj6zIjXIBqx6LjauoDXY7WdWpLPeiVwsz0lPVrykSbl2qJsuYqa5K6LskgUHWRhSE0B1kpcxt7MpbamEpyHwUPnD2b16F1dCul0BLcNp7On6Q6QEs6VOTl0SYvoXOnT2YPIknF4gCcvxLu2jQDAl8PsjpIvH55b+VDj704Psk7jtjENxWjxCW4cSZHZXFahSdnJOvzIQ4ED12FjsTM8bZh1KydxILKg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oBr5OSFfv4fWSAgcC5OuXQl/S+eNTgyO7PxZQ2+l1LUZr5IpeztFVI8QslK/?=
 =?us-ascii?Q?7xpfy2lTaH2Rub9C/+mauiHXbJt9oy9ZSAMFY+GMTvBshkuw53imdbMaCJCc?=
 =?us-ascii?Q?zpNR0UwwdqppL9/bZKe83pLN7dtrl5K6B7G06+uE73e8erHgGT1ObVGoDCon?=
 =?us-ascii?Q?AVHxsU0j1aQydmB06EXuE3c7jMZsifSpNkAEAGd2TawJm5wYdvqx58rI2cPl?=
 =?us-ascii?Q?WGnUNfVCAvyAPKiB+Exu2FNgcHHhZS25s0VSgcO3blvibLIE+GHJAVAgra3c?=
 =?us-ascii?Q?p5TrOmVZwBDZdU6vwwLlcK2gX4tvLXDoOgbR/jDTecbNkOiakSYvfe/0POAe?=
 =?us-ascii?Q?8S/IMFUeVh2mtI68sgiGec71R/oXPDwCX14z+uYlWuGoXbX7OG91KXdz5Pr9?=
 =?us-ascii?Q?A3zGk+0U6qb6UQB6aAQX15SKIJbS6L+lBvBeSyda8l/1ZowMfqeLiZF2bM1S?=
 =?us-ascii?Q?TlXPueu0/XH2AIaypSSYyZ85oUBIJ0DoYtoss/8rDq82PaJMn0zhB+ZH9R/a?=
 =?us-ascii?Q?c77omLyrkE2DkVC4Wvx9O/jhfoIlxP2TDP/IcF7MEEaR81RG6Tb0RUAyFsS3?=
 =?us-ascii?Q?8iOlPxRgKe0l/uEG3Mx3F9/cTd9X0ij6ljgiXm3igiTsNt4hPfHwkSuujumN?=
 =?us-ascii?Q?BiL93f2wnyTf9pSDQ4gSUNjr1X0Sbm2Xle4fbqAc9/JO5e+xRHP+PKJ8BsfJ?=
 =?us-ascii?Q?qZT110wKm5aSXsNgyXLzO5ayd+0DqY7WoOi8aI24RRac7s3upQe6EKfBU93O?=
 =?us-ascii?Q?3qzDTQsgf+DKtlt4Yajs8J8rrAx1RjYMs+cMzPpIfSAewCOxC30yj6Ao9g7a?=
 =?us-ascii?Q?yOxdvR1mWSrqLeJXxo9kAXp1s+6fRUwYPo5t1lcgMZmP/VC0ngvnVE/hhrLQ?=
 =?us-ascii?Q?lF9M1wfb+BKAC+iTvDDzgLdg22zHDUMLciEWVlkCE0NcoZmTLKVnLobeuabb?=
 =?us-ascii?Q?gn5j9YrTNH8xV6FKOvOM72AxxRdxPAvQKZNJmMvHd4DzTN6Je4uV7p/beW0w?=
 =?us-ascii?Q?jjSkTKmgFxg58MXVNgq08G1ZQhnjhaQRiL6rl3SqhfYO5tA4cd0PqJLsmNhe?=
 =?us-ascii?Q?e3cLrBId1b4SkEZNfKXPYIR0KJoNQaKq7mHeMHGbiRn+Wk+2vTdluAzGzJoy?=
 =?us-ascii?Q?0x1b95tzvLhehDf3KauTLWs8ZOOo6JReeLn/9kH+BOmESO7aKfnHBHhfIBI6?=
 =?us-ascii?Q?k7BCee5FJzCU6Vk0Hm60tABC1AShq7WPFi6Gzwp6h5Mwa0PWYvL6AWFzF2fh?=
 =?us-ascii?Q?I+8xXiZUaZ5HA7CAq4TSZbfG2SH6Et5qfCsnBoNB47qTiWZc6z5t6O0UjU7R?=
 =?us-ascii?Q?i9Q3NI1bt5rfs5MOOv0Ce2a9Fhd0iX+2dsY19kzGif4fKCYthcFLdQ6LbsSp?=
 =?us-ascii?Q?hwkabIWFCJnv7C7h/p6EFYk6mEkf99qOkr/WJXFa6Gtrb/XTKGVKra+AqbwT?=
 =?us-ascii?Q?jiSVf7TL3CA866kz86nscO20G3KBP3hrFF8SMLVYa1G19Ii/ErQ178f2CRXV?=
 =?us-ascii?Q?cO0elqkdVRj5jJFiGVBuXVky+ebEBSQFd1ZBk/+c4Zvrb4+8fj7Zh75yarcC?=
 =?us-ascii?Q?krP+AnxY+bDml3ts+jHNI5TLZUIt2oarYcavyLxjqznMx/8ttGiP9rN64FP9?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2da977-a1e7-4df7-e83e-08dc55bb8a95
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 21:58:35.3380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nIJBfyvH58e+DfpKJgDIzYbTkfRXp/Y2W9rfafOX5p+QuGF9ut9528pPnLJrwqoPnM6wM9npgoavmMi2xrthhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4583
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

On Fri, Apr 05, 2024 at 09:56:37PM +0000, Matthew Brost wrote:
> On Fri, Apr 05, 2024 at 02:06:08PM -0700, Jagmeet Randhawa wrote:
> > This patch addresses a critical synchronization issue
> > between the "test_munmap_style_unbind" function and
> > the "hammer_thread" function. Previously, "test_munmap_style_unbind"
> > would proceed with it's execution after launching
> > "hammer_thread". However, the "hammer_thread" in it's
> > initial iteration encountered an error during the syncobj_wait()
> > call halting its execution prematurely. So we never returned
> > back to the "hammer_thread" from "test_munmap_style_unbind".
> > 
> > We resolved this error by adding a syncobj_signal() call in our
> > "hammer_thread" function, allowing "hammer_thread" to send the
> > signal to "test_munmap_style_unbind" therefore ensuring the
> > seamless operation of both threads and correct synchronization.
> >
> 
> This explaination does make sense, see below.

Typo, does *not* make sense.

Matt

>  
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Stuart Summers <stuart.summers@intel.com>
> > Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> > ---
> > VLK-54352 and VLK-55620
> > 
> >  tests/intel/xe_vm.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> > index ecb2a783c..a25878cd8 100644
> > --- a/tests/intel/xe_vm.c
> > +++ b/tests/intel/xe_vm.c
> > @@ -1153,6 +1153,7 @@ static void *hammer_thread(void *tdata)
> >  		} else {
> >  			exec.num_syncs = 1;
> >  			err = __xe_exec(t->fd, &exec);
> > +			syncobj_signal(t->fd, &sync[0].handle, 1);
> 
> This doesn't look right.
> 
> This thread is doing execs as fast as possible waiting on every 32rd
> exec. The main thread (test_munmap_style_unbind) is modifying the VMs
> bindings in a way that creates scheduling dependencies between the
> threads. The KMD is designed to enforce these scheduling dependencies
> while both threads run fully async. If syncobj_wait hangs, there is
> likely an KMD or hardware issues here.
> 
> This code signals the syncobj from every 32nd exec in software bypassing
> the hardware / KMD signaling the sync. This breaks the design of the
> tests and makes a likely KMD / hardware issue.
> 
> Do the VLK failures occur on every engine instance / class?
> 
> Matt
> 
> >  			igt_assert(syncobj_wait(t->fd, &sync[0].handle, 1,
> >  						INT64_MAX, 0, NULL));
> >  			syncobj_reset(t->fd, &sync[0].handle, 1);
> > -- 
> > 2.25.1
> > 
