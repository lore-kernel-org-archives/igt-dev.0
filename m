Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C21CD128A
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 20:26:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6778E112EC6;
	Wed,  3 Apr 2024 20:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AUagPVae";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AEE9112EC6
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 20:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712175984; x=1743711984;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LsSH34f9mL+Lv3+nOIhs4jjwhwDx7+GPM2FlweG3mSI=;
 b=AUagPVaeM2tqMyauDvmfeEmcekP9GvG8SH4GMGLggZ+oACtYVW95Ukw8
 AgVmRrKvBeXSMZh1+H4o77EILWAJk94hcUu3LY1JTmLMB92heU1DH910X
 khbD9Ie+ySJzvrJCbrjNGZoPrw6elm56CaIIUxlku0YMOesp+psWd82Yc
 80DmvPD03c4odlwPERCJA3ZhGKKagB5hvkfKE6GbwFp6t+jcRLYXlU2yH
 F4Cwf+4KF98lovRic1hmSbexy7jn+9T4s5DFy0vbfI+bS2zcmcCzeC3+p
 h8MuESm4rgHt7OMDRD8C6SOB7jyocYY7csfwuT8WSyAOnApW6G1yNF6Rp w==;
X-CSE-ConnectionGUID: qNoAYDS7QrqWf0Wfng+OPw==
X-CSE-MsgGUID: Krq3X0vIRbePSforWqG47Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18008608"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18008608"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 13:26:23 -0700
X-CSE-ConnectionGUID: +hZ5MtnET1yPLM1RtRGniw==
X-CSE-MsgGUID: 1uOF00AWSue4n3FwREUQ1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="23202997"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 13:26:23 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 13:26:22 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 13:26:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 13:26:22 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 13:26:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UN3D3UscB3HUV7xG3ymO10EwY9veRipjH+xeOh+H80eGyhw45+pz/lHTCSc6YJc+c7j2aWcB1MZWhH6dX9HWYrgzbt3+AFAeq1AsuoAeLISqJjzaW3wYuHDP080ogfvkFcB7OMU3yQBrF4dha7WK32YhDFOHJi61IvkFv1HBKV9af9nmhLhMm4IluaSKGfgbsiVUjzjTc11JMBmk9+s4hiZYVmcnXJfcKetcKWc36e2AJWEmYy2+YOIYyrjNu32uMCBOk+pk+BeaXPECXMSK2BCxyRRyKTS6P84DNn2i7CKPs22yo86W0ohQlvTt2/DvCUoHj5XyAnF8dTu6cSvkHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrdX2NEEuitmkMh7jWc+pGKm85c+XFkX2qucYQCi0UQ=;
 b=c5QD/EgmHvhudmY34ipNEqwVjQ2/rqcOdZIRPecMA54E0jwstpIqojojAWUPCCMj9Hw1KOkfX8sKnKSp6feFVH6LMcbTbSUScnGySP4xW6f4DkBzWVKaFlnbl5cH27TZ2UcMmtPNSB4xkFs8ID4ja6jkLbAuD+zZik2soBqGWPiKgNiRiG5Mb81SzTSw3qA1O9gQrP9QzAJGdwRPhvbV8Q5po/40Vxva7BQ3DgyknMFhuagkvrV/V4LIGf56oFi7Sy2+7bldADuSCflFRmOUepUtU7eTVw0w0Y/tBdbHnlC7KSr2t7FQaVqCoI+1XxbjC7bRgi24sDNfJ70xk7oJAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB8269.namprd11.prod.outlook.com (2603:10b6:a03:478::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 3 Apr
 2024 20:26:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 20:26:19 +0000
Date: Wed, 3 Apr 2024 16:26:16 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <sai.gowtham.ch@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/3] tests/intel/xe_pm: Test validates vm-bind
 userptr flag with suspend and resume
Message-ID: <Zg27aEMOLwcSxmnw@intel.com>
References: <20240401184631.346-1-sai.gowtham.ch@intel.com>
 <20240401184631.346-2-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240401184631.346-2-sai.gowtham.ch@intel.com>
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB8269:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AntK/JTkdTTNLT3dcaS6RpanqVaiv5gBzEEEE8iLBz0z/9mr3xbWEFq/SHrJa/9NpVxk+i5xqLES73h9QUSjO+ObNXFKvE6RrYDPFiA1HIaDEi5a52rkp9kVA40fJe8BxO8gLsk3ogch72Jm27IpQuIAW4Fdv25y43cG3vK5Nz+8vaC5TT5Gjv1UL2Gn8RdMrRpg5rs+JhjzfQDV4CpEO/YvQZiYiu7jwYXakMy2FIVxWodNvPo9c+R1qEv7EUolriUF3iI6j5LkNID4X9lsfrsZ/oZ2zJEYt8Ti91YE97bVeZq8aNK9k/qpr7ZPTCHgt4uxifeoYvDPZn9Lk6/tTyl1/oBh30LNOmPR3QC+jKMq23GKh+zr1qi6Y8LI0o0MdZFiUtPQde+53S/xMRMlIsj+ZlzG481IMkjG6jg7CmTL6yHM/D1IgfowN63w1lcRP3WpUOuVea2EzATeYksun6pqYFNZL2VWhnsrc9sOFS6hsWMnG2Q2I9cFKRimgARtlWOJ52qFlqt1JPBKahjJZ9hlxm4wObKfrMSXiaUCWhoHbAbOsFjapcuUe0eHbB5XfJHkgGh5LHjSDqje2Kb2zhsr/DAse3VHvqdT7NL0YCJYAKvw3cLLnHHBXU8TMb1rql4DOtAFtecCGxsIpTjd13QbpJHYsXcg9tgw+bM7sWg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7b6jJGF4fb3OIBuhHngPefS5M4Rrx0dleki6TCwbYm3k7hBP/gmk+AAVjAfP?=
 =?us-ascii?Q?frnA09BP15/HyneVJkYDC0sS7q2brg2UkOE8TODTf6i4KlPSzoi6zgTNNrx3?=
 =?us-ascii?Q?wzfPAur6CkcCsFgKlQ/yc9TJ0mZVmubkAo8ugpcfTmKKsJTvKoTKdJec99R7?=
 =?us-ascii?Q?BhJHKnqatvtBgu+4FqOlTEsd4MjlkvFZmCuWaAnbjQ28qnNh4/XOE3InIH25?=
 =?us-ascii?Q?HvKO7mOHNqQsQRgc0b9iQDzy7iecsyGCG0FbdWXxDi24CcVzT2yIgbf3eMhP?=
 =?us-ascii?Q?jHhxsTNv9Mt/JBY5tujygDcOko9ujPU8Kr5deHZzpCmFaw7MPJLpfIln+VAZ?=
 =?us-ascii?Q?s2+iCQfJmSpjwBpoCxqwWlBIHNLbbiKLyGPuLRyERWLDl9UZWNQxVpRzawao?=
 =?us-ascii?Q?aTabDCUBaKegmZIWMw/gQwSL8ogY2v+wSYqhy8FwMLldWajXYnrpU/Jrz+H/?=
 =?us-ascii?Q?/ZxsfohTXEsxQnlLX+0tCnh0PrPuiNm5Dq41LbMPMdwUvNRz7at6WaCpiqSx?=
 =?us-ascii?Q?Tj3LGVl3Dp4p0lKrHMj53nSrLbzAdm0QEYDRBWnr9Xb0eiq/5n0gTADb86zG?=
 =?us-ascii?Q?DMiDqNfaOSQzAe7qNNpMdExzzjBbwtM+q5WqqRHEldo8079w9RQTEdf98NKf?=
 =?us-ascii?Q?RP1n8mvwIxsEyteN7nkRv8b9E8Oya5m8tRhBBmoyIeN9paaQnD5ozKBZT2b2?=
 =?us-ascii?Q?loqe3HTWzTVy4j/uXf2TzDtAmwzJsO85kvBCe8GPXxza9ADXLXs2WmolWI9B?=
 =?us-ascii?Q?xJGkw+Y0O6+uYgYGUx5vffhf5Hc8ij1qrSKcgFDGwSg24V1wLu1YuM3bpxGe?=
 =?us-ascii?Q?oRETblzRW/V8W3iPXEL+w0EHGPXPoMtZkyPdIQ3zgC2SpP1xqiIzjbBXiA+/?=
 =?us-ascii?Q?aoydVZ9Ml32tmM+8XhTl5DvvbPiPnSuht2R1HnJ84kPNNSY2awYxJ+od6UdH?=
 =?us-ascii?Q?iwHnLryWYiWoUHmNA/DF/P8B6b+o6O/68MhhKApLEh/kNsD/YQlmQrp/M9R+?=
 =?us-ascii?Q?3BSwBMN8YbSprRsRw0jvegSrYYraTTLwvLz61kXEQuG7jmi7zXDYFSXEd2B7?=
 =?us-ascii?Q?AuyZZE+o+uqYn39rVg7+yrgPw23VSew52AKW7PPNfOF/E4e+614xdIDN5J0n?=
 =?us-ascii?Q?UuPJ/9SpQzpT79N2nROlYyCgsFoq4do7sDNvbVCskeBx2bOXCI16PHwlienp?=
 =?us-ascii?Q?hdZZH+EzT9ITbezpohg2vheK1c/hMiOsPl35MyDw45kXK1a4t3gDsk6R69RF?=
 =?us-ascii?Q?diiW4SUHmYlbfV02wHqSXkpX9dOJY5ZMASY9jxIAHMyLgVFp8YkXPiepoP2z?=
 =?us-ascii?Q?QIisd2JgBTMyS2eXRisRf9QYgr9hL/i5LIr6e3X2H27lgBtBebVthAE590IO?=
 =?us-ascii?Q?QtFk7toBCiXQGsf6dlDIzmoYQDdHvEE2JOfCCeLpxkzM4zNuv8EFsiPaf1UX?=
 =?us-ascii?Q?EycYWUEaL4MUYAzIb5yBdMY7J/ZWMM6bCvJyCmkgwgg146fxLD1VWWuJzJWM?=
 =?us-ascii?Q?OBfzKRFcjxnVFvagX4vNIyLlnlgkC4c3ZMoBpCm8uwhs8hHDAVpO8Js/H4PP?=
 =?us-ascii?Q?ZVG1P9Iw5nTbqmwDoztbc1ZFrWftwzSKT4ZfHTBI/w2qaGbawtfQVTe0EUT2?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6569b57e-7ca8-4f1e-8aa7-08dc541c524c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 20:26:19.8372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnRZGYWmaFesweGvAMNd+IDwXxyYwz6oOsLRjIMvOGPtetSa3EkCLOA9daYju7K5gf2Jp+6111nkEJn08FdNBA==
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

On Tue, Apr 02, 2024 at 12:16:29AM +0530, sai.gowtham.ch@intel.com wrote:
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
> index c8a5cc6de..d2e5520a1 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -33,6 +33,8 @@
>  #define MAGIC_1 0xc0ffee
>  #define MAGIC_2 0xdeadbeef
>  
> +#define USERPTR         (0x1 << 0)

or we use tab or we use 1 space. But not need for 9 spaces.
Then, please also be consistent. In the last patch you use
tab instead of spaces.

everything else in this patch looks good to me.

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

Please keep consistent with the other definitions here
and use tab instead of spaces, since everything else is
using tabs in this doc blocks.

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
