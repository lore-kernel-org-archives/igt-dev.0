Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E47C54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 20:37:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA5210EA84;
	Thu, 21 Mar 2024 20:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JNzxwMuA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7428710EA84
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 20:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711053473; x=1742589473;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rErsG2nF5Fm7ZpCYkiflA+3meBSXkiZ6+RaEONTm2yE=;
 b=JNzxwMuAvyqbsNV79OdNKTqxA/jPP67zoEiQt32Ohilr+Eg2sdz60hZ/
 7secU1YeswtZepoWd4SNSiZakG0nzE3RJw86LE8mEQqySY3QGTW+LlDAx
 6jZuEHGYYyvfH3qWLzudnZf6o813aSSZgbTXEb3Xwc2yjFW1XCBUM5T1z
 nEHzHfRuZ4FZQ0zvqoljeUk1AcFTv/hkxVerkus1GwIfXfuYcMbQI5yw0
 lBIQuqJWQGpzDZ1ee5mVlFKO5UCeRFErdGoCkCCQtbsvBJcJNcIl0JlV9
 CxCcOiCtYy7VHfAdn76R1LDmN+pah5iQ7n475RybTPCzwYc5j8i34dWGH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6202513"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="6202513"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 13:37:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="14617480"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 13:37:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 13:37:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 13:37:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 13:37:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 13:37:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=in5subdlKVxxDSzZCNBnU/7ZR3rlGquEnSWoJTyeufm3LMDAUPjO/n6cQpDLF3PPAAd9cr8Ikb0GTROugd4yVzjq/2msJPg3zEfHbi1+nsrDuDJUAIxjUHQzOq6BCE2rVPM7NRgyaNo+bZOoYrzwHYE8aAiZPmB1JECaIYSDgeozlNqTefhCliZRMNkf5l1n6wTddxNdO8A4Jq0m2lli6+CGp3mFK8ETKAQE9PmJFvAprvU7QvtiWSzd/A9aQlG3K0xNbOKJPv8l67zRzCkrlm2AO7JNdM+EMPCsy+QEOKfb1TW9HdwVgT0KHpiCnncZsMIYjQ5pp/7xst3NttRAjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcyrDn7o60sWHlKzFmr5P7qRFNaGyw685vNqI5kWQ3Y=;
 b=AiwcdQFrzo4NWPBLbQeV35u+FrqU0iTdpQAhZ+qJCZynyLtbG8+jTRpN/EULtX0nz50nGDLX+HzPSpYVUd+6+MW26xmCJdgv2n6shCwpVmbg8be57zsSApaZ+CSiIN2FLcdbrwJVTeTkYPo5A9eTK7UWj1OfBDysXh2n1SuV0MOxk8HXPb07EiataNi9/lrr7PpCwzUqZdv9j9WxVqK/A6MFgieSmVwi9cNV6GmV2b1kVE4kdS6CN6nCKwGmASn2Iirob39l20M5HjSEv90w6emvFYzFby+VQ67ijwJafM9n7g1Fn7alKTcoUJtDGVHghOBIGBp/wKSpWNfA0bJG+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB6615.namprd11.prod.outlook.com (2603:10b6:806:256::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13; Thu, 21 Mar
 2024 20:37:48 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.023; Thu, 21 Mar 2024
 20:37:48 +0000
Date: Thu, 21 Mar 2024 16:37:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <sai.gowtham.ch@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_pm: Test to validate vm bind
 functionality with suspend and resume
Message-ID: <ZfyameoGTqYNABKO@intel.com>
References: <20240315050536.21319-1-sai.gowtham.ch@intel.com>
 <20240315050536.21319-2-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240315050536.21319-2-sai.gowtham.ch@intel.com>
X-ClientProxiedBy: BYAPR11CA0066.namprd11.prod.outlook.com
 (2603:10b6:a03:80::43) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB6615:EE_
X-MS-Office365-Filtering-Correlation-Id: 18291de5-d26e-46af-1568-08dc49e6c575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 15nstML6yxvqumr4HdGoq90WUu1phegNHV5aA3fE45UeoNSf2XXjUt8RwXDWH2UomtJavcsLeizOSkw6F6/QvTfIRtCHBc5pf7T7vK7JmDzClGuRlR1lctJg+g7rXU3qY9kxJe8lprPlRXMC80YodwdJZzYwMLvj+blPaTzPlz4pTnU/2TLCGusmj6gZ1JhKR1mP2dwzc2VYHuAp78Hx7FBIEFuBVPBQWc+mlSZwiEiBFo+eBsVkDW9w8DFGq6esPlmgMlxWw2MYtimY7rsa2o1zQD9J78loinlXzlVbiFXGGBcTIV2KKLj1qRhF8z2jZTg0rq9fXVBFxTmEXQpfLMprJeXVF7uJUGWbYW52a+oNT/h7H3Z+r3Cyi16h+WEQgA6HIbsu5+sNepb0/NAAskwYLWRXutfuzzMSSGwvAvDIYXi86xJZP/iKRsLtAA0dPpWb775JLAoghgyb/y0rQOuYsAozJnh8MC/+oCo3ooig/xVtbKbQDm1QbTTXiczD7n3gL+Xo5xFZCw4WA5zRh/dJU47pXJLuj6S+ykZJTvE8BgGuhViGiydGFC0E6UOgYqe5xK7dMyK5w5CyqONh23HbIXoF4AGO3p36W4znU1f+78UlqFJvBfuD7rESmYB/PRlI1XFng1CUMlA1LRvlDbM/H6apKLvGpzD50M19C4U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?07KSm0swb5mc5L0uubzQIjFoWWBOMURmapdt5JUojbxoxPcvDYsrGBHyiqPX?=
 =?us-ascii?Q?6bNxWvJNK+PKDIjURALuLFQ0qNSM7KfaxzrQRq18ScNdq5jkbgCb0Lfv4xX+?=
 =?us-ascii?Q?WzEkEH1xfHI9guIXfTRbn4TJSR+bv38cScJqCqPsElvmg6KjvzaGmjiS+eb9?=
 =?us-ascii?Q?Y/8dRXo7KQrJUZXX5UZqvboa4Z0s8ONZByMSzlcFvHRzK22FGrcVCNFsEyPu?=
 =?us-ascii?Q?rkG2cijfGMouuZFTLteyNrL4YzqtcOEzOALUHr1Dp6mxGpQac4s+cBIJpg/b?=
 =?us-ascii?Q?pqRdbp0OLTbitHSa4j38AGrlvz921l6jtTMMC7x6FesuhletdB1S7+A8u/yp?=
 =?us-ascii?Q?RFUwPjDm8KOyjROYyMTCLs9YMnqWnGhR8PUOt2iHEFSRXarR1FZs0YBqgyrk?=
 =?us-ascii?Q?8TIszLSt3A/T2Gy+oIDAuAe92m/QP6u0Qx7Bp+o0Woe2jHZpXH1Ab1EP9yqT?=
 =?us-ascii?Q?q0XKG3rwpHXrZTBZuNIu261TnQMoGrsRruKOTyJ0KIKundaDXJhs8YpmiAVw?=
 =?us-ascii?Q?S1EwpFl8j6u3Kkejgp41W4chyZAAJmhTMf8b6uc6A+h42z3x0hnKN9cJQJqd?=
 =?us-ascii?Q?nxuC4a/3qAC+8JXjD+WEu3bWOVNu+kb70ftzWI8yiHc8MpIH10bx0G7SzcQ+?=
 =?us-ascii?Q?etqG+zcbd+PBDkcrzML09VinJlLk3VDvkJQinaQzDMKxxy98s3Cm/GIAo0kc?=
 =?us-ascii?Q?S+rhP6uiZEfoTDPH3GCfbPCtkP+ADg59EAeGfryYcP6NKs8S494sZDOToVMv?=
 =?us-ascii?Q?u2/KbfWSRk96NRt6RVKovdJ2Up1KsOpG7z28DIyhlgbKxzZH6js4JXxJhO2K?=
 =?us-ascii?Q?KbRo67c7Osa/Y8B4ZKjLJlJH6YEh67QV2C27Dnvs2wF27RGZlq7ZFYArXtOC?=
 =?us-ascii?Q?9/Xy3WrEHu8g8s62sagC9iUZGMTkcdUtpfGuyrXMHqpO5OcwcxBZKVKuOie1?=
 =?us-ascii?Q?JcyP/7n798klqERd6X7C8wzBMGMTGCjz0RSqnROplIUOctXLE1A0U+/r93DQ?=
 =?us-ascii?Q?SO5GBkGXcE3sbh3dpVyfHRb+Ug/Sws5RaonLZnjlsCofZevxbH4Jm3s+DtEQ?=
 =?us-ascii?Q?nJfZ7D3lwsWQPu5F8EfoVxVQiWP96iSF/Cej/cxJBzp9MBVMBgQtz03qk9md?=
 =?us-ascii?Q?n/lpUtr0L01SRSY/xCN/J7rTKF/TcgksRgzAta8M33LeJytdAq70eSKBoxWh?=
 =?us-ascii?Q?C1czvs4cTRLKuF7dbsngk/G0Q9TnWJoofqfZznf7q3tnzeGNXTex4bg0gflJ?=
 =?us-ascii?Q?pyKLWzRHRIFHsXrw8yaSVLZdN1cKdBSPOD2eF0ZsU2NQSev6LxM4pZ5oP03n?=
 =?us-ascii?Q?M6kKXLxP0LBzsP0QPkOE9+qvGwX03SN4Wt59qXnQ6guokbhQxpAtzvX6exjv?=
 =?us-ascii?Q?Jqv2D1z6k9SG+IpgPs++QMnEXrICDA3JdgMgvBpRuzTmGkoHRx8IXWKCBOdx?=
 =?us-ascii?Q?Q9s6QHBDtYcYl4i6/9YLzuq24hSKGIpGCx9OYVPZhX4Yyk5Le8tny6pEG6/6?=
 =?us-ascii?Q?j2231B+OmYu3NXv6M27GS+y7U9dkHJatkuaVfsmxPGtMGLNTYHR6YuC6pDlr?=
 =?us-ascii?Q?nbGrBN+xrLIiHX/0mAqnI2DzoC9XS3275SZDMoCnjuZtzwpskKBlfbXKJ+nA?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18291de5-d26e-46af-1568-08dc49e6c575
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 20:37:48.5705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60dj57itUy+LMnsSsEaIaxlZzUEII9b1BLOBA3l/bp9/DycuznklpBeZXAEk5KMz/8of80hjIWtXscIV37PEyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6615
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

On Fri, Mar 15, 2024 at 10:35:35AM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Test validates vm bind functionality, by suspend and resuming the device
> after binding VM to a VA.
> 
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_pm.c | 103 ++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 84 insertions(+), 19 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index fcbed6249..ac402e757 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -33,6 +33,9 @@
>  #define MAGIC_1 0xc0ffee
>  #define MAGIC_2 0xdeadbeef
>  
> +#define USERPTR         (0x1 << 0)
> +#define PREFETCH        (0x1 << 5)

why 0 and 5?

> +
>  typedef struct {
>  	int fd_xe;
>  	struct pci_device *pci_xe;
> @@ -273,10 +276,28 @@ static void close_fw_handle(int sig)
>   * @d3cold:	d3cold
>   */
>  
> +/**
> + * SUBTEST: %s-vm-bind-%s
> + * DESCRIPTION: Test to check suspend/autoresume on %arg[1] state
> + * 		with vm bind %arg[2] combination
> + * Functionality: pm - %arg[1]
> + *
> + * arg[1]:
> + *
> + * @s2idle:	s2idle
> + * @s3:         s3
> + * @s4:         s4
> + *
> + * arg[2]:
> + *
> + * @basic:	basic
> + * @usrptr:	usrptr
> + * @prefetch:	prefetch
> + */
>  static void
>  test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  	  int n_exec_queues, int n_execs, enum igt_suspend_state s_state,
> -	  enum igt_acpi_d_state d_state)
> +	  enum igt_acpi_d_state d_state, unsigned int flags, bool test_vm)
>  {
>  	uint32_t vm;
>  	uint64_t addr = 0x1a0000;
> @@ -308,7 +329,6 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  
>  	if (check_rpm)
>  		igt_assert(in_d3(device, d_state));
> -
>  	vm = xe_vm_create(device.fd_xe, 0, 0);
>  
>  	if (check_rpm)
> @@ -320,21 +340,45 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  	if (check_rpm && runtime_usage_available(device.pci_xe))
>  		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
>  
> -	bo = xe_bo_create(device.fd_xe, vm, bo_size,
> -			  vram_if_possible(device.fd_xe, eci->gt_id),
> -			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -	data = xe_bo_map(device.fd_xe, bo, bo_size);
> +	if (flags & USERPTR)
> +		data = aligned_alloc(xe_get_default_alignment(device.fd_xe), bo_size);
> +	else {
> +		if (flags & PREFETCH)
> +			bo = xe_bo_create(device.fd_xe, 0, bo_size,
> +					  all_memory_regions(device.fd_xe) |
> +					  vram_if_possible(device.fd_xe, 0),
> +					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +		else
> +			bo = xe_bo_create(device.fd_xe, 0, bo_size,
> +					  vram_if_possible(device.fd_xe, eci->gt_id),
> +					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +		data = xe_bo_map(device.fd_xe, bo, bo_size);
> +	}
> +	memset(data, 0, bo_size);
>  
>  	for (i = 0; i < n_exec_queues; i++) {
>  		exec_queues[i] = xe_exec_queue_create(device.fd_xe, vm, eci, 0);
>  		bind_exec_queues[i] = 0;
>  		syncobjs[i] = syncobj_create(device.fd_xe, 0);
> -	};
> +	}
>  
>  	sync[0].handle = syncobj_create(device.fd_xe, 0);
>  
> -	xe_vm_bind_async(device.fd_xe, vm, bind_exec_queues[0], bo, 0, addr,
> -			 bo_size, sync, 1);
> +	if (bo) {
> +		xe_vm_bind_async(device.fd_xe, vm, bind_exec_queues[0], bo, 0, addr,
> +				 bo_size, sync, 1);
> +	} else {
> +		xe_vm_bind_userptr_async(device.fd_xe, vm, bind_exec_queues[0],
> +					 to_user_pointer(data), addr,
> +					 bo_size, sync, 1);
> +	}
> +
> +	if (flags & PREFETCH)
> +		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
> +								bo_size, sync, 1, 0);

This patch is changing too much at once without explanation.
Please split the series. All this userptr and prefetch should
be both in separate patches.

In the current way it is hard to follow on why you need all the
changes above.

> +
> +	if (test_vm)
> +		igt_system_suspend_autoresume(s_state, SUSPEND_TEST_NONE);

these 2 lines seems to be the only part that is in the commit message itself,
and, thinking about this while looking the code it looks like this line is
not even needed because we would already taking care of this need with the
system_suspend_autoresume call below right along with the exec?

or what is this bringing?

>  
>  	if (check_rpm && runtime_usage_available(device.pci_xe))
>  		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) > rpm_usage);
> @@ -398,9 +442,10 @@ NULL));
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
>  
>  	if (check_rpm && runtime_usage_available(device.pci_xe))
>  		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) < rpm_usage);
> @@ -585,6 +630,16 @@ igt_main
>  		{ NULL },
>  	};
>  
> +	const struct vm_op {
> +		const char *name;
> +		unsigned int flags;;
> +	} vm_op[] = {
> +		{ "basic", 0 },

perhaps you need a proper for the ops,
adding the 0 there instead of hardcoding it here?

> +		{ "usrptr", USERPTR },
> +		{ "prefetch", PREFETCH },
> +		{ NULL },
> +	};
> +
>  	igt_fixture {
>  		memset(&device, 0, sizeof(device));
>  		device.fd_xe = drm_open_driver(DRIVER_XE);
> @@ -594,7 +649,7 @@ igt_main
>  
>  		/* Always perform initial once-basic exec checking for health */
>  		xe_for_each_engine(device.fd_xe, hwe)
> -			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM);
> +			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM, 0, 0);
>  
>  		igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
>  		igt_assert(igt_setup_runtime_pm(device.fd_xe));
> @@ -611,7 +666,7 @@ igt_main
>  		igt_subtest_f("%s-basic-exec", s->name) {
>  			xe_for_each_engine(device.fd_xe, hwe)
>  				test_exec(device, hwe, 1, 2, s->state,
> -					  NO_RPM);
> +					  NO_RPM, 0, 0);
>  		}
>  
>  		igt_subtest_f("%s-exec-after", s->name) {
> @@ -619,13 +674,13 @@ igt_main
>  						      SUSPEND_TEST_NONE);
>  			xe_for_each_engine(device.fd_xe, hwe)
>  				test_exec(device, hwe, 1, 2, NO_SUSPEND,
> -					  NO_RPM);
> +					  NO_RPM, 0, 0);
>  		}
>  
>  		igt_subtest_f("%s-multiple-execs", s->name) {
>  			xe_for_each_engine(device.fd_xe, hwe)
>  				test_exec(device, hwe, 16, 32, s->state,
> -					  NO_RPM);
> +					  NO_RPM, 0, 0);
>  		}
>  
>  		for (const struct d_state *d = d_states; d->name; d++) {
> @@ -633,10 +688,20 @@ igt_main
>  				igt_assert(setup_d3(device, d->state));
>  				xe_for_each_engine(device.fd_xe, hwe)
>  					test_exec(device, hwe, 1, 2, s->state,
> -						  NO_RPM);
> +						  NO_RPM, 0, 0);
>  				cleanup_d3(device);
>  			}
>  		}
> +
> +		for (const struct vm_op *op = vm_op; op->name; op++) {
> +			igt_subtest_f("%s-vm-bind-%s", s->name, op->name) {
> +				xe_for_each_engine(device.fd_xe, hwe)
> +					test_exec(device, hwe, 16, 32, s->state,
> +						  NO_RPM, op->flags, 1);
> +			}
> +		}
> +
> +
>  	}
>  
>  	for (const struct d_state *d = d_states; d->name; d++) {
> @@ -650,7 +715,7 @@ igt_main
>  			igt_assert(setup_d3(device, d->state));
>  			xe_for_each_engine(device.fd_xe, hwe)
>  				test_exec(device, hwe, 1, 1,
> -					  NO_SUSPEND, d->state);
> +					  NO_SUSPEND, d->state, 0, 0);
>  			cleanup_d3(device);
>  		}
>  
> @@ -658,7 +723,7 @@ igt_main
>  			igt_assert(setup_d3(device, d->state));
>  			xe_for_each_engine(device.fd_xe, hwe)
>  				test_exec(device, hwe, 16, 32,
> -					  NO_SUSPEND, d->state);
> +					  NO_SUSPEND, d->state, 0, 0);
>  			cleanup_d3(device);
>  		}
>  	}
> -- 
> 2.39.1
> 
