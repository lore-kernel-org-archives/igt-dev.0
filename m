Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1436C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 16 Apr 2024 01:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1420D10EB1F;
	Tue, 16 Apr 2024 01:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJ5uq/tF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E7910EB43
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2024 01:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713230557; x=1744766557;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=utbdjJ8imRd7c4G/hW41iuhGAy53Aqy0ZCyRg9+DF3M=;
 b=XJ5uq/tFiVo1u/jpeuFksRDBkjl0nh/1JfjdysbVOR4VkCu7w13W979G
 3zdbNYkvBwDUQzTsXiX5xM41B9sYFYPTa6NdNiRisMXZXdBQOps/pP9eh
 NPunAZb85qV4xMP2XuSNTcr8jPgj76B5zPq666hOd3IDwLPnsrFtEzWYs
 PGLsHXr3B3SACgxey4Gvwr62n4onP4MG5ToLbi/EMI5G/o6KH8Oi4o60U
 LMieiEn6LEIH+ZOUI+yy45MTvEz5Ed8eWaL16ut2DABwt0jH9Z+zqvyBN
 67Vk1GrGMHs8Ga7uuNVzvXTFsDqosUc+nPYMh9o+4Rg5O/j46L0eVPGmJ g==;
X-CSE-ConnectionGUID: v93tX+bsTzuI2pXw2TrHWg==
X-CSE-MsgGUID: +Pz6aewdRDqDMBOi3ypZlw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="34035704"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="34035704"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 18:22:37 -0700
X-CSE-ConnectionGUID: tWbaavklTC+u8PTJbtjp6w==
X-CSE-MsgGUID: NV2GnfmNRZO9UIl8uwUhlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="22166163"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Apr 2024 18:22:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 18:22:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 18:22:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 18:22:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTI+VVwp+GUoo/yCAWRpb5GjMHRdq5oqqjGTycXGpqOB0knsaieVdJboj+lfZrkV5Wiem5eFOxHim4nySwHK58OuybLj+q/YhTM+PDCsuND7+nt6xFQTeXEIF+xutonPda6wNyYw2x0lsMTSr7M8le/UsZ9CoallmCfeoRQEOMSahdgcIZH7ipKCTQCnyrMW7PAs6dqPk4V56TucPDvPtxlMEfs9ITwbZP+HQHDxPP8BybQ1HXTDZkcTXC9NtRff3wygPoOyy5UXyTAyBKjjf3n71zOubCO7/afETORznUq0wsR+xyxClnl7aE3B2FqHP3HXfyK3AcfJV0RSnbtV0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bFOiseFLXwbWP+shvFH6MTsn1Ekmokkx7zBvPgTd3Y=;
 b=RAmGy+/QY+O4hbzBvS4EwyfbE2kHPcY0kEKG7MZY0Wy6gbn2ZVGdZNpwQ+/psRXkI/y2zuBzNrjfM9tcSiJGGhkJgQmbAwe5h5OqYbdEd6GfdnKw7Eg0rqKhueDZ7509CplamqMkE5DyluhhhQcKsm1wPztcMhEgdBiJYR0bLh2xZDyzYAB0MpBt/BxvX/yL3cvnG5qgUVShL/ng/sd2ruOGFjS2J82ezjv1PT4xt7h4b3PKulCftL5PZartVHmHZICiuBrfQClug6INpr2iXZRASMgDSERe3UP74xsGAMhvTUAwoWNU22zAj8RbNIz26vxuSCD7RgQUjbPVCMXIcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CO1PR11MB5201.namprd11.prod.outlook.com (2603:10b6:303:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31; Tue, 16 Apr
 2024 01:22:33 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506%7]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 01:22:32 +0000
Date: Mon, 15 Apr 2024 21:22:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <sai.gowtham.ch@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/3] tests/intel/xe_pm: Test validates vm-bind
 userptr flag with suspend and resume
Message-ID: <Zh3S1a7xX4OVasV5@intel.com>
References: <20240415084035.2603-1-sai.gowtham.ch@intel.com>
 <20240415084035.2603-2-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240415084035.2603-2-sai.gowtham.ch@intel.com>
X-ClientProxiedBy: BY3PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:217::6) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|CO1PR11MB5201:EE_
X-MS-Office365-Filtering-Correlation-Id: cf34f724-453b-462d-df6c-08dc5db3b0bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uV/EoeIdcm8TmkpsUrPLuGHUizKRL6jVtI+B4er7373sGNv5NTUaDORHG5wvErNrJ732eueyU3bvGNzPbZ3H0IfgRwvetNAoPojDZN50+roQAK4nuK1W5AAx22RmbqLw5ILwXtJLZmHfU03imF0imLM9H1q99Ul4HwJEvstZ7y7cPN635vaveOSeFuWQb2BNSyrGSnGaf4iSFAO8xoOKKJ+U1QuMHO6q9yy0bUhLL02mjvUWSkIutWgALRVv0lDC/l0jkSby/py2xMCBiO8JMdfHl9EpC0k74upF18d6uQoA4eUQp0yis9FaPIm2qKJxZYreX4JAw9TD507mtnYdwsitih9tUnCMR1jThca23pQ2q/jeL6s5rA2z+ERXiq3alFPbs+SUgCclCPSHZICsb6XCoavQAQtOVyIz0bPj466OIBM3T9lGHojkkOi6sskn6bNckZAaghONNQpi2Joc5xzAdQN4LmkEU2dMUDkfl4tEmJemJJFA1D3EN/KPHooGaGj5YuAesAC3iSRIazQeVI0ssLA66gmhrcWbzhkJLK5b+6PuhLeuEVJPPQqtmUs16srOaPgw60R/Ywq+q3aah9TAM1ceX2n9AvHsxBieZ1rOtfpUkZ9e58pXwVD3Ea9+ItAoaR1hDxAsMh6EEO1ROCRMPx68Wgk+n2THSaB3n3s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NI0gNuRpQNcSx32irmU1HlZeGwexOm+z5sRwHKF110vQ+z0uv2b11g/TaSX/?=
 =?us-ascii?Q?Nugfeai3xZK1Y8zLqHHKEdsSRBTSKOAOdgVHQqRpCFXLsmoSWwLFQoeU/ZuZ?=
 =?us-ascii?Q?xihY+uFzPC425+VNnqcb7EpJrXdRplhNrvGImiqkGA2jCjCdRRoFr1PYWEu4?=
 =?us-ascii?Q?/FfBt7+cR5Js2d2bSq6/WVJEbJZLFAYAS1vMc7fCzlUWOw814DTlOr1MBeD0?=
 =?us-ascii?Q?Wy75MHZSefzzzyN0GuRLZad11spTvYVultgco0KE9jXCy7e40OS/FucuNu4n?=
 =?us-ascii?Q?pk0+asoVKnHRdNC3xDcF0/zNWV1l9sMauDPjTdG1oWzdNDlSL1P+Xx5oMR4o?=
 =?us-ascii?Q?XxmqCC5C5YIEDgrRchHl+0FHxivQ/wgTdi7bLIETMrN55iBX0PgL4dgraEFk?=
 =?us-ascii?Q?bwMgkLT6uX/PCwUJ/64nX0D1aYWCVp5uuGM90AthBV1+skhP8de0mScBWrOq?=
 =?us-ascii?Q?ZAd20FAqeYOOG2mpTjW2Kx19Xioa79BOeYNBob7F3DTGnp/qTRpnnjsqNcSY?=
 =?us-ascii?Q?tTb3BzmgmiL2nCvj+HLH3pMFVVmYhvyj9AFMPE6JsNuY82995PgawWXf+x/u?=
 =?us-ascii?Q?AyGN9DkzPs9TKpeUQ5+kmG8KgVYZlhPiwJqYrmSXea6XkE0hJxcLwLe80T5L?=
 =?us-ascii?Q?t13P421ak2Wfi8XcNxSG+zZLwpiSv+XshlSSPBAqAML+Qdk3DvcHyyAPo0dR?=
 =?us-ascii?Q?sCgppiLMKvDcOw2FDnERhffaHDLaSdzSyKcLKHURlule1Ji4kt12hHPBPdNt?=
 =?us-ascii?Q?xe7UB1mItgli83SJQgX7dbJMan1aZeSbbygGgjHzjKRnlj9cpSo6kD1ln14v?=
 =?us-ascii?Q?CMyLPz9VW6MxGjWCEe3z3qQV8hPG5CTfsyTk2F0c33Rvuy8fXfgIGSb7kiF2?=
 =?us-ascii?Q?J3/ojVf6kj8ZDtWE8fe8aXfMElKXmGuvMR5lX75SI0r7IbjxsnLLj16Jt5n9?=
 =?us-ascii?Q?aiJCteN5bafk6aYHOGzjk3mYnnKuHkqo6QS1wDPPrNE4/wYWkaAP2pvQ/MAF?=
 =?us-ascii?Q?Nma83lyWWql8CUIHtNGwFKkztTeDGhuZnzOEpOFHKPltWj22uVIHa1BN7YKw?=
 =?us-ascii?Q?vLcSzzPzDjZkcX8cyzOa8+c2VkbdFM4jM0NoD15SFVkSOGlSBVwWXQ+0jZAd?=
 =?us-ascii?Q?szkJu+Tq8c1Rj5DTMdIWGk3slMgj5RpiripbOmJsyVKaLRi903Q8eMxLZZ8T?=
 =?us-ascii?Q?zEHcuUYyWZnZS116L319LACvHAqyUpESO7gQYQ7LOQdVar1/ppgyown3svOJ?=
 =?us-ascii?Q?Giq3hUQRvbDMhXHm8qryDre95DAGoZbIm7ZnxW/XyuREO7pY8tp3j8upkGJW?=
 =?us-ascii?Q?ydMfv+eZTOhfVdM8ACmf+sx4QZJi++1u6Ln+iUA7dccfyNbQQGt+3spJLO/k?=
 =?us-ascii?Q?2riRZBk7doiT8CMIDZmwF/J+hbfAD9FgmmCfzrWuJpUfYLg44KSdAiySWkAC?=
 =?us-ascii?Q?5/MK++ytRdgnePEgwOMeunJy57Qim3G/q8PgLamhAOsGdDjXwxg5R55sxcMd?=
 =?us-ascii?Q?XzcBDz/q1glqcRCiS6OaCVZIyzO0UaXCrNRz1LS7mNBsr46BfvAxDE02g+Ks?=
 =?us-ascii?Q?y7DxUwxq1fDjeqyJKm8zvF7ierchdc2Zv2nPennVDcp04Ej3PEEX8vEIPNpm?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf34f724-453b-462d-df6c-08dc5db3b0bd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 01:22:32.7945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPJ9sl+Zaunjyg14EJwTo3tjlLdDK0RvPQn6OcHUp55HccY0sgwZ3LfuQcMyn0IHU419CZUS3YpLZ5v3qbhDYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5201
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

On Mon, Apr 15, 2024 at 02:10:33PM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Test validates vm bind usertpr functionality, by suspend and resuming the device
> after binding VM to a VA.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_pm.c | 80 +++++++++++++++++++++++++++++++++++----------
>  1 file changed, 62 insertions(+), 18 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index c8a5cc6de..fafd7a52e 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -33,6 +33,8 @@
>  #define MAGIC_1 0xc0ffee
>  #define MAGIC_2 0xdeadbeef
>  
> +#define USERPTR (0x1 << 0)
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
> + * @usrptr:	usrptr

s/usrptr/userptr

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
> +		memset(data, 0, bo_size);
> +	} else {
> +		bo = xe_bo_create(device.fd_xe, vm, bo_size,
> +				  vram_if_possible(device.fd_xe, eci->gt_id),
> +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +		data = xe_bo_map(device.fd_xe, bo, bo_size);
> +	}
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
> @@ -398,9 +424,12 @@ NULL));
>  			xe_exec_queue_destroy(device.fd_xe, bind_exec_queues[i]);
>  	}
>  
> -	munmap(data, bo_size);
> -
> -	gem_close(device.fd_xe, bo);
> +	if (bo) {
> +		munmap(data, bo_size);
> +		gem_close(device.fd_xe, bo);
> +	} else {
> +		free(data);
> +	}
>  
>  	if (check_rpm && runtime_usage_available(device.pci_xe))
>  		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) < rpm_usage);
> @@ -583,6 +612,13 @@ igt_main
>  		{ "d3cold", IGT_ACPI_D3Cold },
>  		{ NULL },
>  	};
> +	const struct vm_op {
> +		const char *name;
> +		unsigned int flags;
> +	} vm_op[] = {
> +		{ "usrptr", USERPTR },

s/usrptr/userptr

then feel free to use:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +		{ NULL },
> +	};
>  
>  	igt_fixture {
>  		memset(&device, 0, sizeof(device));
> @@ -593,7 +629,7 @@ igt_main
>  
>  		/* Always perform initial once-basic exec checking for health */
>  		xe_for_each_engine(device.fd_xe, hwe)
> -			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM);
> +			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM, 0);
>  
>  		igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
>  		igt_assert(igt_setup_runtime_pm(device.fd_xe));
> @@ -610,7 +646,7 @@ igt_main
>  		igt_subtest_f("%s-basic-exec", s->name) {
>  			xe_for_each_engine(device.fd_xe, hwe)
>  				test_exec(device, hwe, 1, 2, s->state,
> -					  NO_RPM);
> +					  NO_RPM, 0);
>  		}
>  
>  		igt_subtest_f("%s-exec-after", s->name) {
> @@ -618,13 +654,21 @@ igt_main
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
> @@ -632,7 +676,7 @@ igt_main
>  				igt_assert(setup_d3(device, d->state));
>  				xe_for_each_engine(device.fd_xe, hwe)
>  					test_exec(device, hwe, 1, 2, s->state,
> -						  NO_RPM);
> +						  NO_RPM, 0);
>  				cleanup_d3(device);
>  			}
>  		}
> @@ -649,7 +693,7 @@ igt_main
>  			igt_assert(setup_d3(device, d->state));
>  			xe_for_each_engine(device.fd_xe, hwe)
>  				test_exec(device, hwe, 1, 1,
> -					  NO_SUSPEND, d->state);
> +					  NO_SUSPEND, d->state, 0);
>  			cleanup_d3(device);
>  		}
>  
> @@ -657,7 +701,7 @@ igt_main
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
