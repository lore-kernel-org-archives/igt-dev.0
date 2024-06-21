Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7568BC27C4F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 17:09:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F399910EB7B;
	Fri, 21 Jun 2024 17:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E7P9IAlW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0AB10EB7B
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 17:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718989739; x=1750525739;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=po0FzsvmyIsTyu7W8eECdlMU8VGqyKEPGcCI8NtMi+o=;
 b=E7P9IAlWJnBcLj5YszcL6eo7wnKC0AoXUyKFGGvd/BsOAQ1709KyaBiL
 rNtwWB1UGwzU9RrTG4abHCmGKW3HWpxBvVUSBsIyHLFXWHzYtpxDyWgGE
 MdcpX50KFuXVbNFZeYhf6gQgIvEKX5CrkUFuNgcgTxjkvctq91l7ScnA1
 Bhj45LOWM04Om1H3mzVA6rtYvNNXCs6d/nTFna8iBOqDD6984LgtX87iV
 9dn3Nz+OHZpTG++M0tcTTJqLc+Hiw6cSeULWtjz6Xviq3MdB+0ne8B/xY
 4jqAbmQ7LjH4N5iPuPVDc3Zg/Qz1dd6O9m2yqk/YW6rOz8kWgvAyhbizK w==;
X-CSE-ConnectionGUID: iKsotdqpQeSaFbLOdan9uA==
X-CSE-MsgGUID: EIrnfMUTR4yfm0bMqVeX+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="15864606"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="15864606"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 10:08:58 -0700
X-CSE-ConnectionGUID: vNlydioKQ/WpS2U2GDgO/A==
X-CSE-MsgGUID: 1I6Vz9YNSkeFg92J7yEGTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="47100914"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jun 2024 10:08:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 10:08:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 21 Jun 2024 10:08:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Jun 2024 10:08:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSguPaOxrYsXJO+i33jFfeuwsZGLcj/nwDwhCcnUy5epI3Ww1mfv4WwfJA6HbzTfMK4qNERy5hDy13jxqVMxROMDSGwX1agqsq6lh+WU7TGhU2uH70cFECbcivprhNoZp2dP2FAhtm8aUyJX73qYF883kn9JR7NyCiLmjzOoYCQPkOgK0MbGPhIXsRh8dlHh/R2SbvGrfz+2W6D3At33sjqd6VFxIgNG1a9wY01X/6aJvZQ3uXUBm3R5Zg92DgdeYMscw76TxmX1w4h+EaTvhOAWuZZgfm7N0hseM6Ul15iuqUrXik8JPlfPFxggSTCt5Pm8fesovUZAr1r7WZmrgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xo1IzHQVdA+eIr7+pEoLQVuS7F7O7WGW+D7r2jYJIPs=;
 b=ILKChxIvL5QXtYwV2AkAYmtUCOaE9kFReSvhyRAFGf0pbGhm6zLvoLBM5cIp98Anvl0GSgWdt3CJn3PTJ7sY+e6yXW7aOJAyEb2tBO2Ujx31ADweLGwD7d6Hw7jB6YCzGmCJKjSlqbz4n/InfiygnJJI0D/WPK2lj4tL9cxl515IItd095HHLeoHyX9mm9WJ2/P0KON13bMMOogQ7cPAYl/dpjicIpfnuvMohi5PmLCVGffXKR12KZnRCN/f2xQ2woSqCeIxz78Lal+g09BmagRRIASMHEnhDvQsCdVT0TxSlIYek4qYJOSSF351YlmTeD9UzgJkWsuAvkDsZJrbig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Fri, 21 Jun
 2024 17:08:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7677.033; Fri, 21 Jun 2024
 17:08:53 +0000
Date: Fri, 21 Jun 2024 17:08:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] xe_vm: Add bind array -ENOBUFS section
Message-ID: <ZnWzgZdevdoHLe9d@DUT025-TGLU.fm.intel.com>
References: <20240620235437.3722232-1-matthew.brost@intel.com>
 <96953a51-cb66-46cf-a346-065153ad01d1@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <96953a51-cb66-46cf-a346-065153ad01d1@intel.com>
X-ClientProxiedBy: SJ0PR13CA0042.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB5824:EE_
X-MS-Office365-Filtering-Correlation-Id: d3571317-2e8a-4e96-143a-08dc9214d3fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yHuEJ4CPEpnmOHOvn7+ckOnEG1uJq6MUJWMF4gqpId9d7yRnI+rQCG3zwBAp?=
 =?us-ascii?Q?DuxWjwdW6s7CE7/40/TxPeJxLEmBW+udaXXRlty44B0CsUMDse/qLEBxdu42?=
 =?us-ascii?Q?igv+bin3QSkqRawCVgV3cNCOkUaGVUKz5PacfXKsut2wSi7EZ+Sggo9T4ai4?=
 =?us-ascii?Q?+jeUGUjyTm4GqjjeTIL1Z73PmY+KP9mXZNgmb2rAzesfIk8zt4mf8XyafYxk?=
 =?us-ascii?Q?znyVd57f1MpzVjFqAsrwKMxfZgkRlc1QwB9hlCgVTNQcROe2Fxy9mVDjptt8?=
 =?us-ascii?Q?1qb8veWkENVvrU+MMgojwrzB22Em0ehPz9e5gIEX+Et+BBgiHZGTQRvEABQI?=
 =?us-ascii?Q?+8DfrzbQMocnXWK9M60U//GBz9O4EQajMD8yo8YLcJ8OTYA12bblz/5NeEW/?=
 =?us-ascii?Q?Vs/n/liQ+ghLtbbscH3aqOZK6D1gZNiEZvmGUy/5a1OgqWt4zW3MQqYnF2Uu?=
 =?us-ascii?Q?LVHsBds8oPnq7oJxOlnrOtc7cL3zsdtIW52d7CPHhNTAjSkIhh0tG9IkqMrC?=
 =?us-ascii?Q?0pDVpr796Kp4QFDJk29+uUjEYIZFBZs/8y/qNaqNmrY1HXk+oLWEds+HoHTl?=
 =?us-ascii?Q?iOyEo0NGnbNJxdoYgnB4yY9NY0kU32x3LlTbssTpYR6U+KhJYrbladdetMep?=
 =?us-ascii?Q?Zvq8v1bDvYMPTZlEn8LOXci7Wv4dDUi0T9H7Si0KHzS7T3AkNQ8dXNrxzl2z?=
 =?us-ascii?Q?tBpuLkccZEUv4dWY/fKeGt9lSAFqSItG3x+UJuN6CrahBtsdFrBak5N7h02e?=
 =?us-ascii?Q?lh86wYASx2+zIYS5JrkdsB27DgNTnJzvlbdcaUKhQbw88ztReTK2upIUJJDV?=
 =?us-ascii?Q?Fqe1DglKB28vlBsvYViim3wyTRwgN5xTYUx2K8W/YyUyCHv92H8mzRr380GI?=
 =?us-ascii?Q?oux27J8MysusI8ySlJNxMq2PQUQ5ojQfwGcudYeTCYKqVEwmLp7WzG6qQlYP?=
 =?us-ascii?Q?asmM6KJl8Xu4vrVytslGjjKvuZNnUbRnhz+vCDLugErbKpVmHmBm8Tyr5WLN?=
 =?us-ascii?Q?9q/j6R1gBWYG5jSQRlKPdwqgx8sZwSIiwwXc5Q4QL/J+4f38UvUmVh2cQ5vA?=
 =?us-ascii?Q?O/gAetG/PgVDy9wEOl0IMwMFHXSa1M+eJ0gib4Nk9ERgcCIXaNgxuUUZorqc?=
 =?us-ascii?Q?yvNaycWm+4RjdjOM/6q8mBDMDwLBYjHre//kYBQ/KzmKhBh2jeTB/JJgmq4J?=
 =?us-ascii?Q?/mNtFBgY2l0NuhNIEVYXmvQOo2Q2mCxbH3bz4uxa7efI0Q+CiB+Dhj6y+hM/?=
 =?us-ascii?Q?r61c1YRvA5eG5A5ZsvvY2PhGpz9B/1tTqetqd7uRZBSHPBqte7m0ejIYa7Ho?=
 =?us-ascii?Q?cRPuzvuhtDhQUDzCSfe0EMll?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8IpNx16Ei9c73Ac1pPwDnSuFd2zz9nG2L7KB8jCsKN+udaDhlXL3jBq3paFb?=
 =?us-ascii?Q?FF9/277IVkdGyzVDHTYRbWpZTh0N+iT9EEOV9bZOu+7iuy8bM+LppyF2PziE?=
 =?us-ascii?Q?EqozY4NepvjYcOrBSRIppELKwA+ITIGLr3Mv2ZVGqU2+QyOTVqm8tbMXAhnO?=
 =?us-ascii?Q?typhmhYq1inxiskWMDVa36HeVZ8J+f/OqRyXYMj+BufYXf2Mh23dMOjAgrt3?=
 =?us-ascii?Q?jlkhEjvblQRrbgpFcTBUCi7w/bgK1Pt22Zhl3a7zzY5eTLxm1vp/PsZVQqqi?=
 =?us-ascii?Q?0NoGdiVTxRgzgC1awEGw4ONrAEU92O/luhw1fY+bxjhmD7PRlRg0HwVK6nfL?=
 =?us-ascii?Q?ZP0f1Nxq6tWzvHkuQ7Qlbf2EtHGvjFkn91RApkxl2TJrYlemLIEy0RX9YJbo?=
 =?us-ascii?Q?MYtVFA2zcBGQdYZLhGgNceuWXvUpmX3/CILNbZ8lMxFZtLEPd8BuD5dF8Q3K?=
 =?us-ascii?Q?pw1fKPSy3CoSdfN1BpHcTitgPAn9A5r2IwtSLK+lOKYI69xLLdbT50KTrxKK?=
 =?us-ascii?Q?a3tbzQXoxVDtFsSg9fJblE3gh1moplESUTZRHumr9Da0wkn7G7upG/hTBtQ6?=
 =?us-ascii?Q?gOZqprtUJA02dgz7pid7jEMM4jFqvna67LnJpgNRcP6ZH1a55SrQeIf6hgQk?=
 =?us-ascii?Q?2hUOIDTJUt/gnGTj2YceTuU+7wpXYrJj55uZA5jHLqBSm2/Ps3JFcPmvXa1m?=
 =?us-ascii?Q?/vp7kCk19sBhtCKdwagioXzvWLoQmm87/9z2bB2TbWcL7NniPcNRy9h0eL4x?=
 =?us-ascii?Q?uxzqeOYsGQkGmkg1qX/iZtdzDAx62ZHRpI7p89d1IUYJAewssU16kJkbD6Y7?=
 =?us-ascii?Q?3IpHDUHcjxlqMCLogQoGRssUdrmY9Zncaev+01Q6/6dxTuyupv3kiTJfmqe/?=
 =?us-ascii?Q?vY8zF03r5wBOoNP7RKLS9eCDkoYxzRi/HLEgRl+o4Om1JUWsq4lBrCwHgsXg?=
 =?us-ascii?Q?IbqTVbxSdYDWbOZJU1tvf2MTz19apN0ThqN2hFcxvW523YpPJh8FkTnubPng?=
 =?us-ascii?Q?9pSa76X1bInZI8Mzw3LV/lSP4Mj+SnnQQbIZ83yWKtM+kQKZ53c/fe6L2pec?=
 =?us-ascii?Q?Ulyt56SO+B9cFQE1UEWN1HVnLAAzabLhHwTOBmUsRxByW+B4Vu8s1CNXnLH7?=
 =?us-ascii?Q?l9z/1ZgDjouem4m8fwaaNc0p1OWKEKaFguTT8DlALbODDlELkTMd6w/dY0W5?=
 =?us-ascii?Q?yL7uHuhZPHN4IANBtX0tD7pWXtxbZqbh4aBumyahdP7NSStVh0IrqTuj4zcA?=
 =?us-ascii?Q?IGxtrwSag69kCrCqzI2gycYS8oN5HwXj2JeLuSgfJc+VyEEK0VMuF3ZD5i83?=
 =?us-ascii?Q?IE/wTnmdktAF5vrCKEUlAwkyZdIeu/c6vSQQ0X799l6OkXWeXrbZlAoPmV2k?=
 =?us-ascii?Q?CYvxH//yOZplfXEEHjmzNMek/6FuchQ16LJOL6sGt+9nnaYMnuUZhh9F1Cef?=
 =?us-ascii?Q?L9BbW52rBZd0TAuoRRWOM2hOd5mVfFaODUed/Zy+PaGRNCBp70rgbybY5Y5Z?=
 =?us-ascii?Q?MlmMDSNwHjYKPQzcv3EmOHxYmg9B2LP74pidVAlbT7bnMhylAIlxI3kM7Y85?=
 =?us-ascii?Q?IsE+HohyuW9zk8wjbFnqN64gkv6fQpkMWuYT0WyTQg+DgWrlXWACZTWv9Ll7?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3571317-2e8a-4e96-143a-08dc9214d3fb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 17:08:53.4791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMl6p0bojr7ffoNIS4jUrUmmKQZPVwk2OGSrCUV3hkODkxbu26ojHVrSPVGzxKNjG0yasNQWWL4OJDrHaPl+aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5824
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

On Fri, Jun 21, 2024 at 12:09:39PM +0100, Matthew Auld wrote:
> On 21/06/2024 00:54, Matthew Brost wrote:
> > Add section which has a large enough array of binds which triggers BB
> > suballocation failure. Verify -ENOBUFS is returned in this case.
> > 
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> tests/intel/xe_vm: or similar for the commit title prefix.
> 

Wil adjust.

> > ---
> >   lib/xe/xe_ioctl.c   | 19 +++++++++++++++++
> >   lib/xe/xe_ioctl.h   |  4 ++++
> >   tests/intel/xe_vm.c | 50 ++++++++++++++++++++++++++++++++++-----------
> >   3 files changed, 61 insertions(+), 12 deletions(-)
> > 
> > diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> > index a437fd828a..9072801ce1 100644
> > --- a/lib/xe/xe_ioctl.c
> > +++ b/lib/xe/xe_ioctl.c
> > @@ -115,6 +115,25 @@ void xe_vm_bind_array_enospc(int fd, uint32_t vm, uint32_t exec_queue,
> >   	igt_assert_eq(-errno, -ENOSPC);
> >   }
> > +void xe_vm_bind_array_enobufs(int fd, uint32_t vm, uint32_t exec_queue,
> > +			      struct drm_xe_vm_bind_op *bind_ops,
> > +			      uint32_t num_bind, struct drm_xe_sync *sync,
> > +			      uint32_t num_syncs)
> > +{
> > +	struct drm_xe_vm_bind bind = {
> > +		.vm_id = vm,
> > +		.num_binds = num_bind,
> > +		.vector_of_binds = (uintptr_t)bind_ops,
> > +		.num_syncs = num_syncs,
> > +		.syncs = (uintptr_t)sync,
> > +		.exec_queue_id = exec_queue,
> > +	};
> > +
> > +	igt_assert(num_bind > 1);
> > +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind), -1);
> > +	igt_assert_eq(-errno, -ENOBUFS);
> 
> I think we can replace with:
> 
> do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, ENOBUFS);
> 

I figured we had something like this. Let me use this.

> Do we really need this in lib/ ? Are we expecting other users?
> 
> Anyway, having a test like this to ensure we don't trigger any kernel
> warnings or similar makes sense to me,
>

I have similar function for ENOSPC on an array will move both locally in
xe_vm.c and share code.

Matt
 
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> > +}
> > +
> >   int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
> >   		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
> >   		  uint32_t flags, struct drm_xe_sync *sync, uint32_t num_syncs,
> > diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> > index 2c7506caaf..a9954d0d41 100644
> > --- a/lib/xe/xe_ioctl.h
> > +++ b/lib/xe/xe_ioctl.h
> > @@ -61,6 +61,10 @@ void xe_vm_bind_array_enospc(int fd, uint32_t vm, uint32_t exec_queue,
> >   			     struct drm_xe_vm_bind_op *bind_ops,
> >   			     uint32_t num_bind, struct drm_xe_sync *sync,
> >   			     uint32_t num_syncs);
> > +void xe_vm_bind_array_enobufs(int fd, uint32_t vm, uint32_t exec_queue,
> > +			      struct drm_xe_vm_bind_op *bind_ops,
> > +			      uint32_t num_bind, struct drm_xe_sync *sync,
> > +			      uint32_t num_syncs);
> >   void xe_vm_unbind_all_async(int fd, uint32_t vm, uint32_t exec_queue,
> >   			    uint32_t bo, struct drm_xe_sync *sync,
> >   			    uint32_t num_syncs);
> > diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> > index 7be85da62f..b116d7da1b 100644
> > --- a/tests/intel/xe_vm.c
> > +++ b/tests/intel/xe_vm.c
> > @@ -728,7 +728,7 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
> >   }
> >   #define BIND_ARRAY_BIND_EXEC_QUEUE_FLAG	(0x1 << 0)
> > -
> > +#define BIND_ARRAY_ENOBUFS_FLAG		(0x1 << 1)
> >   /**
> >    * SUBTEST: bind-array-twice
> > @@ -741,6 +741,11 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
> >    * Functionality: bind exec_queues
> >    * Test category: functionality test
> >    *
> > + * SUBTEST: bind-array-enobufs
> > + * Description: Test bind array which too large are trigger -ENOBUFs error
> > + * Functionality: bind exec_queues
> > + * Test category: functionality test
> > + *
> >    * SUBTEST: bind-array-exec_queue-twice
> >    * Description: Test bind array exec_queue twice
> >    * Functionality: bind exec_queues
> > @@ -753,10 +758,10 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
> >    */
> >   static void
> >   test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
> > -		unsigned int flags)
> > +		uint64_t addr, size_t bo_size, unsigned int flags)
> >   {
> >   	uint32_t vm;
> > -	uint64_t addr = 0x1a0000, base_addr = 0x1a0000;
> > +	uint64_t base_addr = addr;
> >   	struct drm_xe_sync sync[2] = {
> >   		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> >   		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> > @@ -766,9 +771,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
> >   		.syncs = to_user_pointer(sync),
> >   	};
> >   	uint32_t exec_queue, bind_exec_queue = 0;
> > -#define BIND_ARRAY_MAX_N_EXEC	16
> > -	struct drm_xe_vm_bind_op bind_ops[BIND_ARRAY_MAX_N_EXEC] = { };
> > -	size_t bo_size;
> > +	struct drm_xe_vm_bind_op *bind_ops;
> >   	uint32_t bo = 0;
> >   	struct {
> >   		uint32_t batch[16];
> > @@ -777,10 +780,11 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
> >   	} *data;
> >   	int i, b;
> > -	igt_assert(n_execs <= BIND_ARRAY_MAX_N_EXEC);
> > +	bind_ops = malloc(sizeof(*bind_ops) * n_execs);
> > +	igt_assert(bind_ops);
> >   	vm = xe_vm_create(fd, 0, 0);
> > -	bo_size = sizeof(*data) * n_execs;
> > +	bo_size = bo_size ?: sizeof(*data) * n_execs;
> >   	bo_size = xe_bb_size(fd, bo_size);
> >   	bo = xe_bo_create(fd, vm, bo_size,
> > @@ -808,6 +812,22 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
> >   	}
> >   	sync[0].handle = syncobj_create(fd, 0);
> > +	if (flags & BIND_ARRAY_ENOBUFS_FLAG) {
> > +		struct xe_cork cork;
> > +
> > +		xe_cork_init(fd, eci, &cork);
> > +
> > +		sync[1].handle = xe_cork_sync_handle(&cork);
> > +		sync[1].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> > +
> > +		xe_vm_bind_array_enobufs(fd, vm, bind_exec_queue, bind_ops,
> > +					 n_execs, sync, 2);
> > +		xe_cork_end(&cork);
> > +		xe_cork_wait_done(&cork);
> > +		xe_cork_fini(&cork);
> > +		n_execs = n_execs / 2;
> > +	}
> > +
> >   	xe_vm_bind_array(fd, vm, bind_exec_queue, bind_ops, n_execs, sync, 1);
> >   	addr = base_addr;
> > @@ -867,6 +887,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
> >   	munmap(data, bo_size);
> >   	gem_close(fd, bo);
> >   	xe_vm_destroy(fd, vm);
> > +	free(bind_ops);
> >   }
> >   /**
> > @@ -2251,20 +2272,25 @@ igt_main
> >   	igt_subtest("bind-array-twice")
> >   		xe_for_each_engine(fd, hwe)
> > -			test_bind_array(fd, hwe, 2, 0);
> > +			test_bind_array(fd, hwe, 2, 0x1a0000, 0, 0);
> >   	igt_subtest("bind-array-many")
> >   		xe_for_each_engine(fd, hwe)
> > -			test_bind_array(fd, hwe, 16, 0);
> > +			test_bind_array(fd, hwe, 16, 0x1a0000, 0, 0);
> > +
> > +	igt_subtest("bind-array-enobufs")
> > +		xe_for_each_engine(fd, hwe)
> > +			test_bind_array(fd, hwe, 512, 0x1a0000, SZ_2M,
> > +					BIND_ARRAY_ENOBUFS_FLAG);
> >   	igt_subtest("bind-array-exec_queue-twice")
> >   		xe_for_each_engine(fd, hwe)
> > -			test_bind_array(fd, hwe, 2,
> > +			test_bind_array(fd, hwe, 2, 0x1a0000, 0,
> >   					BIND_ARRAY_BIND_EXEC_QUEUE_FLAG);
> >   	igt_subtest("bind-array-exec_queue-many")
> >   		xe_for_each_engine(fd, hwe)
> > -			test_bind_array(fd, hwe, 16,
> > +			test_bind_array(fd, hwe, 16, 0x1a0000, 0,
> >   					BIND_ARRAY_BIND_EXEC_QUEUE_FLAG);
> >   	igt_subtest("bind-array-conflict")
