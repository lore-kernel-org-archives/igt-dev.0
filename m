Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55929CD11DD
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 18:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF30A10ED07;
	Thu, 28 Mar 2024 18:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EYCqEeBR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7F210ED07
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 18:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711648845; x=1743184845;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5sWfHQFSkUw1ghvTe3iBnXbxtIpoEjh0T1H/FfMf7uQ=;
 b=EYCqEeBRjCeEV9Ep0W78RGs1hYtzzJgLd1TAeVAaneNrCDDLnF6hxWB7
 OWOTMeYZ7YCkeKkR/LrWyJZlYAgBMGumi2elknzrfB9NrtbwT1EQMO1O0
 GXyXMaQaiyqWO9NUFN1RQ1/LhAFBoXUWFC9AamtKDdyJGuZtRBx8kZwsN
 79/MKJt8zra7vFXqifdjNoPxTqFfmaf1FwuNiYfiJpFzbfuMgRPvGWcPJ
 PO2SAn52Dg5pVEFZyZYAQohBTg5Jb8KFYjabgml99laInKsUicQKYlbbm
 7DZpdioVh8KSn5h2GCaeIVCRPJQCtBsC+XxUoRcfrlZUN2ciJNOOMsD2n Q==;
X-CSE-ConnectionGUID: qmjBo2gaRvemMjGYfGrEHw==
X-CSE-MsgGUID: G7uPqMrmS92+hLiNgR20iQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6682492"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6682492"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 11:00:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="16754572"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 11:00:44 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 11:00:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 11:00:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 11:00:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QaUng0o3TnVqq74lPPUO03Fj21DmfOHH77tmItOz/IAI77npb91SBxs5pvgqnhDveDbwT/NDgaX4k4WPC45qzJ8CTSSKzmpsi7g8I/VHAc9MFhndTG5IP7Hb+5r9JoyeHDkKqKVrrkfMQ55yAqfU/IPznBEb/48yzvxQkV8z9SNccczjaaoEfxwLZRyIDIj0uDIuZUP+VzvWUWHtH05QDALgd6pm7svWQs8+4hC1Te68xglupfYjE44hYnuwrC2shf4WCnPZO7Zxp0C4c+iI8szLtZd2ILeEoxtl1slcq+DolLL0Ud3yKJMdAmSM6w9BSQnGwUEvla5NPpdxXGarTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=io2dTdS6gtaQtHRegNwqK3Jg/kFDyFO2p3TtVhg2akA=;
 b=nRqbDzf+1vh6n2REbuoM2rd5UHT3cDZ6CQo6Utr365DSodGcI1kqGQu3+qvbge67Y8zHkk4qbHxqkOD4sKzqX9uK6ipmtfCdL98ifA3t4USFkaQgXEBJn3qyEOA0RsQwpo0L976a/bCklYc9I8BMnX3rnX92b9J/ras3+oW4fGRSxOxvzIo7a5XPfXgFMoxmhl78kNmFts+8jIG7HP2zKREzqwbbvtIyQYLm8r4o9qt6F6Rxm9sNH6hkRa9ZtWRjmo0UiIRNmS7Q45is29Y7GFNLCzN1HzLrGwByovCL2rn4IdxVx6YwqOV6ouaj9twLs5NLql3GQdpP+AQbuFnrLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4755.namprd11.prod.outlook.com (2603:10b6:5:2ae::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Thu, 28 Mar
 2024 18:00:41 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 18:00:41 +0000
Date: Thu, 28 Mar 2024 14:00:38 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <sai.gowtham.ch@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/3] tests/intel/xe_pm: Test validates vm-bind
 userptr flag with suspend and resume
Message-ID: <ZgWwRjTDEPXJwCFK@intel.com>
References: <20240325201045.25805-1-sai.gowtham.ch@intel.com>
 <20240325201045.25805-2-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240325201045.25805-2-sai.gowtham.ch@intel.com>
X-ClientProxiedBy: BYAPR21CA0013.namprd21.prod.outlook.com
 (2603:10b6:a03:114::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: b3b74a56-f049-4d33-3d89-08dc4f50fb72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PaEVVNJkMvl3Jz3ebeeMKX2EfuijIVUPVxJhT4HjfGCdPuw2YHnq9z1ODAV/WfpS27wYeVEhYCNeJ0uoC/4SihXpTw7F/DxhLcYyN3MGu/2EWPS84WSoTv2pnKqrzM8QAf+OGLCxnvMfmTIUQJq9YTD3FFv+/DyytI3qCXyROlsouz6KhmCxqbhIRS1rWXRFEa40bF8ZL7udFNy8waAXI1umx0wfxG4/jHZNvUDZf6D2gJW/mjnKsTVWMRRjW1wNPKMd/46nqf2CDEjYy4os0grZNgm2sSCs9spKLHb8rAWDfYZklZYSYkWT+vQlhNUsFR6DTxXUiaYkd3RRD6HXwd0EioGVguClZDVF62kzXsLY53O1ddA1zGzF/sO6N2Wxv8l0ckFeolPMFOeGdkVVnu7r943wqoSIlTpt0vzyU0pPx81sYAljToX+vj9LKz0Zs+ml2QU+hQoysLAjA2oLUoH2934SvJ/+aiBZRAmfuMWaZrBYzjiJejiDV+nxGcBFnVwjuSBTZFU6N2q2FW3kf5417j6qlLn4J35/bxsGkZ9DKPwrsBS706Sb+Z2BnUNiUtNAIFXyIwJ1cxRjVla58sqow/noGCzQ5Hv2BTUDjosyFxwPKvpqEANNxCUhUFtVvrLzzSHFTxjSJG6cvlFKlEbRxWwSElgUfeesYH2UPNg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KyPDYV3S8bKgP50ERRJMzo2GAEoVQZu6PwpM1tPBx0Czhk/M2StfIxSO91Mx?=
 =?us-ascii?Q?Mneymqnr04EWEiFrM9tMk8d2AxLzlM/IFSpt/Z2J1idgVxIY8qpoKJGp3h6t?=
 =?us-ascii?Q?eyevhFH0hS7YtAIJfMZJTGqKY8u0hLQkCI9SuF5a6dTkAWJjsiYg8QIepjhI?=
 =?us-ascii?Q?xejRPn0dYFbIgtkiKrqkbVOGESzB9Jj7Ph4I4TJHEYfgw60Sd1s7U3/BU+EW?=
 =?us-ascii?Q?vcIIJtQ0fQszjgYduynDQMrJHDk3+BASU70nubwrsgPLAplIxxp/7OzsIb1N?=
 =?us-ascii?Q?IaHV//MOz+TabHIlNvzAFgrrYETFhw46NfQ/myeoDSXOcyFzC0cwFMv4epMf?=
 =?us-ascii?Q?2D2sTeGG91yeHEuEm7iGw5+SWgFoCUMEQew8oSLM/8WpBrmKh5g+p6fgVEqr?=
 =?us-ascii?Q?doptyjD0+gxmRTeQ5wyVQvKTlsFBzR/qPFjnU+RiW/9+Ks0oA67QOieAY/d4?=
 =?us-ascii?Q?jyDTOoYLCwg8MNkRqUVeAlTYkBLPkYavxS+lWm+1Z6jaRF3WxH8l1PLQsKua?=
 =?us-ascii?Q?L1V2xcswRKSFXaslKu/8PwnZ7s4LYPKPD4JoDJ+RbFevmGkr5Rbu1KQrj2Gt?=
 =?us-ascii?Q?hSCZjlWoP8ZY/4NeNjkz04FN/Ep31wgiQ6OEF3UJ7bQgePJmfy30ZVyfoc9X?=
 =?us-ascii?Q?0AFukJgC25+sw7ZhupJYVrt50w+1vh/7a5ISbB4b0jIHFZud0btcH3RtN55G?=
 =?us-ascii?Q?ABgoeETgCBRRu9KG0p7Zgu9mcLqe2FUdExM66mhUOCASam+EbYLxMMNUOULp?=
 =?us-ascii?Q?YM19LLZeYfwt/kwLVREG51Q6HTTZ7hauWid+qfl95cBcFOqU7955aKzeRprF?=
 =?us-ascii?Q?7f49d3aS8pLMm+g/juakXugow9XBuKF8bfj4+Zoq9c4EUWGHh05nokKvtNqN?=
 =?us-ascii?Q?UP0XyNhl/iEhDkWaDFGuP3RID3BpW53szpGu+KJ69Dmq+OSUYEIZ9fUJ3ZLB?=
 =?us-ascii?Q?aOQX2Jb/GzikH1ZZKCoN19DqvQVVVuj1AaZOqCi/4O70lvm/hk/HinCZayxW?=
 =?us-ascii?Q?SJpfuaiW8OQQsbMimIZJIK806u3+wnsYCpxJ39LQderBco/nwrou4oLPQic+?=
 =?us-ascii?Q?P6KlqjcIthvPvUN433gUcjDBQXO8awjtNtbzgLCh8RVX/+wgFHd3iOJiI++m?=
 =?us-ascii?Q?qxfEN36QNv9Sz/g3a2M5QTorhy9CpRnY/dObS1BG+GeyhghdihKIgRLzrMJH?=
 =?us-ascii?Q?8L4MjjXMgPU8v4NpW970pornk55yQSig5RYq4YzVdfn9Ge8GKgoFLgWRN2vK?=
 =?us-ascii?Q?NxQgInn/AZ/w43gv/OLCiUwzou/DxdA9P89TVg2b6WCMzhjRzIZ4Rjmge8BO?=
 =?us-ascii?Q?jHEC2mSKBjBHnbjBPf54bf6qxmEciOcB19JEiSjGvBvsNY2btPnCJtyTTKLA?=
 =?us-ascii?Q?rva7RlVMOqZnd5BjiunKsyIyaijRU+bmDqL1NSHIvGPtHNFSPVMUai57VtoI?=
 =?us-ascii?Q?E3D4v3FnLlAujsGDk1e0BAXS8R1V5AdR7IFGSJhZw2hiu2jBgIGyJYXn4eer?=
 =?us-ascii?Q?+oKhWSSSVL9sPla74N+vXrQO8EVVT5uMfxbp5BBu5ej9vqK9rC+JlHvGbZan?=
 =?us-ascii?Q?BFR9K2+995Zub0SehuRJAKuCIx7wfXVSVYiPQ49/6vvlx3lOdvBFBRorU6SJ?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b74a56-f049-4d33-3d89-08dc4f50fb72
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 18:00:41.7472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tuX4LLGsMPHf2E0EbxOt2jYPnCyVRT99xbW108J+XzrBaDSChEMDbUBIDZhoQpXi8Z0hVXS7U9+0FzJuztJ3iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4755
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

On Tue, Mar 26, 2024 at 01:40:43AM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Test validates vm bind usertpr functionality, by suspend and resuming the device
> after binding VM to a VA.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_pm.c | 78 ++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 60 insertions(+), 18 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 3aa247353..8659e87cc 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -33,6 +33,8 @@
>  #define MAGIC_1 0xc0ffee
>  #define MAGIC_2 0xdeadbeef
>  
> +#define USERPTR         (0x1 << 0)
> +
>  typedef struct {
>  	int fd_xe;
>  	struct pci_device *pci_xe;
> @@ -272,11 +274,26 @@ static void close_fw_handle(int sig)
>   * @d3hot:	d3hot
>   * @d3cold:	d3cold
>   */
> -
> +/**
> + * SUBTEST: %s-vm-bind-%s
> + * DESCRIPTION: Test to check suspend/autoresume on %arg[1] state
> + * 		with vm bind %arg[2] combination
> + * Functionality: pm - %arg[1]
> + *
> + * arg[1]:
> + *
> + * @s2idle:     s2idle
> + * @s3:         s3
> + * @s4:         s4
> + *
> + * arg[2]:
> + *
> + * @usrptr:     usrptr
> + */
>  static void
>  test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  	  int n_exec_queues, int n_execs, enum igt_suspend_state s_state,
> -	  enum igt_acpi_d_state d_state)
> +	  enum igt_acpi_d_state d_state, unsigned int flags)
>  {
>  	uint32_t vm;
>  	uint64_t addr = 0x1a0000;
> @@ -320,10 +337,15 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  	if (check_rpm && runtime_usage_available(device.pci_xe))
>  		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
>  
> -	bo = xe_bo_create(device.fd_xe, vm, bo_size,
> -			  vram_if_possible(device.fd_xe, eci->gt_id),
> -			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -	data = xe_bo_map(device.fd_xe, bo, bo_size);
> +	if (flags & USERPTR) {
> +		data = aligned_alloc(xe_get_default_alignment(device.fd_xe), bo_size);
> +	} else {
> +		bo = xe_bo_create(device.fd_xe, vm, bo_size,
> +				  vram_if_possible(device.fd_xe, eci->gt_id),
> +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +		data = xe_bo_map(device.fd_xe, bo, bo_size);
> +	}
> +	memset(data, 0, bo_size);

move memset to inside the USERPTR if block.

>  
>  	for (i = 0; i < n_exec_queues; i++) {
>  		exec_queues[i] = xe_exec_queue_create(device.fd_xe, vm, eci, 0);
> @@ -333,8 +355,12 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  
>  	sync[0].handle = syncobj_create(device.fd_xe, 0);
>  
> -	xe_vm_bind_async(device.fd_xe, vm, bind_exec_queues[0], bo, 0, addr,
> -			 bo_size, sync, 1);
> +	if (bo)
> +		xe_vm_bind_async(device.fd_xe, vm, bind_exec_queues[0], bo, 0, addr,
> +				 bo_size, sync, 1);
> +	else
> +		xe_vm_bind_userptr_async(device.fd_xe, vm, bind_exec_queues[0],
> +					 to_user_pointer(data), addr, bo_size, sync, 1);
>  
>  	if (check_rpm && runtime_usage_available(device.pci_xe))
>  		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) > rpm_usage);
> @@ -398,9 +424,10 @@ NULL));
>  			xe_exec_queue_destroy(device.fd_xe, bind_exec_queues[i]);
>  	}
>  
> -	munmap(data, bo_size);
> -
> -	gem_close(device.fd_xe, bo);
> +	if (bo) {
> +		munmap(data, bo_size);
> +		gem_close(device.fd_xe, bo);
> +	}

 else {
       free(map);
 }

>  
>  	if (check_rpm && runtime_usage_available(device.pci_xe))
>  		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) < rpm_usage);
> @@ -583,6 +610,13 @@ igt_main
>  		{ "d3cold", IGT_ACPI_D3Cold },
>  		{ NULL },
>  	};
> +	const struct vm_op {
> +		const char *name;
> +		unsigned int flags;
> +	} vm_op[] = {
> +		{ "usrptr", USERPTR },
> +		{ NULL },
> +	};
>  
>  	igt_fixture {
>  		memset(&device, 0, sizeof(device));
> @@ -593,7 +627,7 @@ igt_main
>  
>  		/* Always perform initial once-basic exec checking for health */
>  		xe_for_each_engine(device.fd_xe, hwe)
> -			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM);
> +			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM, 0);
>  
>  		igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
>  		igt_assert(igt_setup_runtime_pm(device.fd_xe));
> @@ -610,7 +644,7 @@ igt_main
>  		igt_subtest_f("%s-basic-exec", s->name) {
>  			xe_for_each_engine(device.fd_xe, hwe)
>  				test_exec(device, hwe, 1, 2, s->state,
> -					  NO_RPM);
> +					  NO_RPM, 0);
>  		}
>  
>  		igt_subtest_f("%s-exec-after", s->name) {
> @@ -618,13 +652,21 @@ igt_main
>  						      SUSPEND_TEST_NONE);
>  			xe_for_each_engine(device.fd_xe, hwe)
>  				test_exec(device, hwe, 1, 2, NO_SUSPEND,
> -					  NO_RPM);
> +					  NO_RPM, 0);
>  		}
>  
>  		igt_subtest_f("%s-multiple-execs", s->name) {
>  			xe_for_each_engine(device.fd_xe, hwe)
>  				test_exec(device, hwe, 16, 32, s->state,
> -					  NO_RPM);
> +					  NO_RPM, 0);
> +		}
> +
> +		for (const struct vm_op *op = vm_op; op->name; op++) {
> +			igt_subtest_f("%s-vm-bind-%s", s->name, op->name) {
> +				xe_for_each_engine(device.fd_xe, hwe)
> +					test_exec(device, hwe, 16, 32, s->state,
> +						  NO_RPM, op->flags);
> +			}
>  		}
>  
>  		for (const struct d_state *d = d_states; d->name; d++) {
> @@ -632,7 +674,7 @@ igt_main
>  				igt_assert(setup_d3(device, d->state));
>  				xe_for_each_engine(device.fd_xe, hwe)
>  					test_exec(device, hwe, 1, 2, s->state,
> -						  NO_RPM);
> +						  NO_RPM, 0);
>  				cleanup_d3(device);
>  			}
>  		}
> @@ -649,7 +691,7 @@ igt_main
>  			igt_assert(setup_d3(device, d->state));
>  			xe_for_each_engine(device.fd_xe, hwe)
>  				test_exec(device, hwe, 1, 1,
> -					  NO_SUSPEND, d->state);
> +					  NO_SUSPEND, d->state, 0);
>  			cleanup_d3(device);
>  		}
>  
> @@ -657,7 +699,7 @@ igt_main
>  			igt_assert(setup_d3(device, d->state));
>  			xe_for_each_engine(device.fd_xe, hwe)
>  				test_exec(device, hwe, 16, 32,
> -					  NO_SUSPEND, d->state);
> +					  NO_SUSPEND, d->state, 0);
>  			cleanup_d3(device);
>  		}
>  	}
> -- 
> 2.39.1
> 
