Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3387CD128A
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 20:27:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D6110E0A1;
	Wed,  3 Apr 2024 20:27:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K5GE00GL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87632112ECB
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 20:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712176053; x=1743712053;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qZxB/+lfcmbYGNGpQGNwxLZod7dcsCmyga4fGb5FojU=;
 b=K5GE00GLi7nMl20Y0qrNgVVbPhZkVmcJoQ+xns9Rp2lRlv0e0DEnGyWb
 6oDrD5Ht0Kg7w0nb4z5YOlKyzQMKjIBzk3Qw1x8P324WZ4VHReQj7Sm7h
 LSS6+smBsRR5vq+Ca7ELTK/PQES1JTQ0LD3DIp81Kkv6U4D2kPA4/ZPUE
 +1n7TYodQTNNFU/qFkOeLi5NUFszttlHYP82eH/fNTzMZhdMrWYXxcc2H
 Vg1Cnau8W/Rde0UQ1Yz+4lVZtMuOV0L/jY61m3NAfDr+1sqa0RT6h+ZCj
 ctXEcatsKe+PtfT6bkszJR6Q/PdKbuw3iY93t0GDU8pAMH1U3TFKeiVDL Q==;
X-CSE-ConnectionGUID: 6aeUESxoSj61796NAAjNGQ==
X-CSE-MsgGUID: TFnYHjxvRTyw6EVC4eh3cA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18588974"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18588974"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 13:27:25 -0700
X-CSE-ConnectionGUID: dMZ2TWkiTfuslYZ+4pznDg==
X-CSE-MsgGUID: 89SSgeKLTQWB8PiS2PvIEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18643430"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 13:27:24 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 13:27:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 13:27:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 13:27:23 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 13:27:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxXuggxyVzrNeueg/bWKclp7F1f1IV0ydm/8RF+m9jw/dCnTZALbi6wc8BwCBV6r57+9KzK7HdicASAj3zeHjdBb1kgzGdoxsAS6B/pDs+CuPJcnrdxMfjOlzoTFrjX/g7/quKb2eVRufE3DuLL4BsojLP6ucb6Mi845AHanRXMWJc+JmcrWtJ7a6r78wr0S9ai6s3y+XK91x6+aPlZs+RBmWU1l53aCEWm63Xoi6Pnt1UyBVWg0aJVYys+Cqv6+ImyQWdEIcIUybQ9Qzw7q66dX+ohLylfjw2B3mczV/uBdvdposAEHMI9NWlhrbu8qIluCVf/N7snHs5zVVrbsRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iydFTipRmpv0AkdbYKXXnOUarQAZmRMBforC894E1q0=;
 b=PZc/ttHzXcjZePekq+T7I1SJ6IbqwyWzaCZHhNcAq/TMfsS65eLaaUG2H3VkgxsLDhBZHX9VA/F2K+HY+oav9thC8PiAoczs5dJUn7pMnc3mJcNFhEqJTooA9KziWYKNhCBOuZN2d7mYQaUo2VBGo8+r6uI5Jxb3c0Xp7Gg4nB+GYgntWy1vJS8mfa3z0Ip4XDuNuyEv0o0iw5jFXiMSDsUUBVC4kfh4iGm5/4flNo7CTUi5g7e9+xg2zkPW1PHdf/gQvvFYysndQug8tiWdSdfTvQh6GzPZ2Usw/nmonuNuyKtdjlowSpjxWjEskhnMDdlrS9NylL0CT9JLrXgVhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB8269.namprd11.prod.outlook.com (2603:10b6:a03:478::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 3 Apr
 2024 20:27:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 20:27:21 +0000
Date: Wed, 3 Apr 2024 16:27:17 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <sai.gowtham.ch@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/3] tests/intel/xe_pm: Validate vm-bind prefetch
 flag with suspend and resume
Message-ID: <Zg27pQ0XjoU1rJ7y@intel.com>
References: <20240401184631.346-1-sai.gowtham.ch@intel.com>
 <20240401184631.346-3-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240401184631.346-3-sai.gowtham.ch@intel.com>
X-ClientProxiedBy: SJ0PR05CA0099.namprd05.prod.outlook.com
 (2603:10b6:a03:334::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB8269:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lnXZEU0mmCWCmhViEkiHZ43oN04gx7Wp/t2dClRtIGaHhpFwJa4mpNEj39JZ7wlaQCgV9A+dKKQg6rzSmcQh/44IoVr/4IcnSUe52Q5ztje1bA+889IigCM+rFn8aaEKkUbQhgwVxwedoq3OdD1w7wjOxq3AH8gHnEUc9AIsLCOI2R9W47RG93CydbmxBXIYllwiqcIo3hojBLcHMjo5LtmLC02hSlO9Y407NzViXDxzddPge5E9xC5GeCdATbhSXQcKdZdXtkuDg8ZbguLovnacVqxXYcMFaDHQ6TcYBwxKoqjgbScu/8YMYCdrVvzYz/EERPwik3jT7CJQm4FEnq0aLvYaaAJiWMxCXjpAcY4VmD9YYI7FXf50UCwDjyqVs57Vids/7EH4M/GiB9WNT2ZXh3/JvDHWAC1gsWPs66vZxDeP+1FAdWGX8pAr53ljDNT/xQ5u5f8cz+BSnodQ7kyIsdZsOawOcyP7yjSBul1W38NuGINgMoxkByKDC5ea+gCaZT/4hD14MMx1fL1T3+kDTe/GQzjj+K45dkSfb/cAu2xsyrYvle1Kf7u0Dj6PifbrifNvd2zu+i6gvJ751x0CjF78nqCYp4N8eBpNkHisym1MBGcYNazEImq05x/c8kKN94yQTKEmfaJ73HkyGOPIe3YyyRy7dcJI1qdMcDc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nt5tHvGFFN708ct0tev/1Lzsrs078bsVpjHHkvxLc57mgcN/cv/WfEJelTCv?=
 =?us-ascii?Q?6DPSeYuUCgt57QtL+ZOJtvoIh/hgB7ScQk6uH23C0fICmRohKY/C/TGmsb9D?=
 =?us-ascii?Q?5nnsL7wfFS7ucvgrQdIKu7f9NJcjOQBbGkHJCipHWeYr8Niv2xkeTsSis2A8?=
 =?us-ascii?Q?/5lDzc/MYgJduwECIxzbqbo0lZvm6cW1msEUw3vN0oMDpECUWXD5yTkdmfEs?=
 =?us-ascii?Q?FRcikb/mQQlO7dtOH5j7Bef9KR6XxnAgsfjQmL9SQMrOy7ZGq8rxE9V2pB5P?=
 =?us-ascii?Q?/DkcY5dXZ98q9RnGJRFSwFTtwYmacuy24Ev6AcWNL+I0/3fk36U282SVyBbc?=
 =?us-ascii?Q?DXRHOWQkM61u7UB9NuWoNE/UKtXLZXIK59J3XLS0ynpvULVgjsOaQ0sHwvQ8?=
 =?us-ascii?Q?CACUSqf2/pXqHeRZ8vrM8P4SoAMKAvEAvPZzBeNbHhKJcFpjuOcL8aMLcBon?=
 =?us-ascii?Q?uaYHKDN3k8FIfjYN2Ji8ygzOUntF50qJBwU+2m/413+sZ3iKki67J8G4muqM?=
 =?us-ascii?Q?+FyKsktyWmcMQ1RYQPKAtqmRxdn/96UrbAQJaxhPMSz1cW0w+XMPXI1mLPsi?=
 =?us-ascii?Q?85LK7xcpzJCu/A40jT+p4lGq1QDXI3kJxVM6VbF2I0t3OLU2WsQSOxvSDovE?=
 =?us-ascii?Q?yEVoPjEGL0lJ/nmXkSXqWGDoWa5QdIqcpa8N9EIonpsnqdO5VwuhrTGGKrac?=
 =?us-ascii?Q?AqBUzaknZjZFPZ5StccOd9gtCf+IGO0rDgnEeKogY/DFQJW4xwrZn9wC4kE9?=
 =?us-ascii?Q?swmthGLWoVo3ol9hKZ3FnCg+XTO684zy78BB3z3ITw1Lyj8oDofAe6LtOhvZ?=
 =?us-ascii?Q?6icJfO4CcKEMymypGlSml7vQKQwQerX/+YiYAIJuwsszRJGYXvQ5+yuapjoT?=
 =?us-ascii?Q?NOzp5J25iXKXiTv9zIJB71JajR5v5VUt4MFTFA0BHX4FR0Vojm9DausIk7Y/?=
 =?us-ascii?Q?BgtxX7l46FXEQLCTTW76b6pP1eiiLC6DNxLZBFt/s8HEEOJKYD4Y3tabRVAr?=
 =?us-ascii?Q?A4S/awArNURbv3nfkPduFVsJhwP5Hi1n2+epnytXS81eDcW6Fq4aWPSM0+OU?=
 =?us-ascii?Q?AZsrkuQty7Tjd68mhTB2U6NZyP+bFYwSflhekBMyxMCFuOpmp0F8Pq82HDtv?=
 =?us-ascii?Q?6Xm9p9IW9F8NcNtrYPVvR0RtFfFQiTx1Oc+Qk7XDr2wx5zOyfYtJ3uqEpfOt?=
 =?us-ascii?Q?2MCITwhWpVaMaUiVghZgkiSYJSdbcjQ+z0LHgmEL05iEX6PRAtkeTSuWea4A?=
 =?us-ascii?Q?kcKI8JyS0fQChmOc+f1kZWD5ROSJFTKIRe5QsQ3rpvqttet/9WKSEHj+mYTp?=
 =?us-ascii?Q?UlslX1m7L6NDaNtCFXf8HBtgLZvqhbGGE98WA4fQH/GSQgB0wmStyvAumhw3?=
 =?us-ascii?Q?ocEqX/qTF9QOe39yc8x5vSnphlhMkgZpY5uup0dxJA/02+rr5ei85GUG+ljL?=
 =?us-ascii?Q?ZMEBlHoMGd0Szr6QiHHT//yJTLIjUjDFv5NU9149cbMTn30JUHabE0YDsCO8?=
 =?us-ascii?Q?A5SWWabwg8jQMyb3c9ut0EDuTr6uKDt30uv0IJ2tpFaJWGbkqC+Q6TbQ9LGP?=
 =?us-ascii?Q?/yyVrq+ZlibxbVzQG/euHMuXcgrs6halV/jTUm8rWpzoQUO0O4o9nbSno7sX?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 497cc07d-0354-4091-5b74-08dc541c76ca
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 20:27:21.0453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qi1V+KQR2IIBdwNpwgnHPy98D/61ht6xtk/6JFJzKDDUgKTFsmpo6v8h/h11UekdUsjy+GtznS7tEMMt9ubXMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8269
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

On Tue, Apr 02, 2024 at 12:16:30AM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Test functionality of vm_bind prefetch with S&R.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_pm.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index d2e5520a1..839540f5c 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -34,6 +34,7 @@
>  #define MAGIC_2 0xdeadbeef
>  
>  #define USERPTR         (0x1 << 0)
> +#define PREFETCH        (0x1 << 2)
>  
>  typedef struct {
>  	int fd_xe;
> @@ -289,6 +290,7 @@ static void close_fw_handle(int sig)
>   * arg[2]:
>   *
>   * @usrptr:     usrptr
> + * @prefetch:	prefetch
>   */
>  static void
>  test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
> @@ -362,6 +364,10 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  		xe_vm_bind_userptr_async(device.fd_xe, vm, bind_exec_queues[0],
>  					 to_user_pointer(data), addr, bo_size, sync, 1);
>  
> +	if (flags & PREFETCH)
> +		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
> +				     bo_size, sync, 1, 0);

this test is failing badly on my DG2.
looking to tests/intel/xe_exec_fault_mode.c it looks like there's a lot more to
do in the prefech case, then only this like nere.

> +
>  	if (check_rpm && runtime_usage_available(device.pci_xe))
>  		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) > rpm_usage);
>  
> @@ -617,6 +623,7 @@ igt_main
>  		unsigned int flags;
>  	} vm_op[] = {
>  		{ "usrptr", USERPTR },
> +		{ "prefetch", PREFETCH },
>  		{ NULL },
>  	};
>  
> -- 
> 2.39.1
> 
