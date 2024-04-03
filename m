Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FDDCD128A
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 20:29:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131E510E2AE;
	Wed,  3 Apr 2024 20:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KpOS2NX6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9C010E2AE
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 20:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712176146; x=1743712146;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ExDpqRq7dbX9BL2dBe08Tl2UiHUvR/jx89cWLkBcVBg=;
 b=KpOS2NX6bby6NCWP7m3TRhW2KQhZtlJRunCpsasBgdY4/jj0xHp1XNVr
 3EsN5r4CCLTOIkTrImFMnWs+X/it7gU4OrnSPPVdnGTqVgayt0LsD9NKM
 FkWCqYVTNHxjmEpFLxBo+CpAfF3y7eE7HZXHM97XVWa4ilW83SCuDP4Bk
 99bbq75IrHb/joo/K7r+YQh8DY2pFYG5ARQ3G2oiXOcjtgw7r1DEDHjdo
 IbMGgnlF/MYYFLdwOYrEzeFrOqNOkvRCRL5tu71y9frxfsRYY6l/O87yi
 vVJsVoDIUTorELjmYmWrwa5iwp/ogr/wnxFwmWxEuyFvr+/AfcAUSc7fx g==;
X-CSE-ConnectionGUID: S/nXx2wjTKuTivhwvmIPeg==
X-CSE-MsgGUID: 5TSoROZ2Rl2detyR3CivNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18046269"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18046269"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 13:29:06 -0700
X-CSE-ConnectionGUID: Pi8NNgWaR8y7hrNDonr6Hg==
X-CSE-MsgGUID: NwFKCRZBRu+4SqEmKKVnMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="23248337"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 13:29:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 13:29:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 13:29:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 13:29:04 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 13:29:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1V7p1cJaWkh7S2moxA5wuDaxSZgeMFxaDL+yxW4MOQBgwoaRZKUEgP8w4r5wMTHkR30ad6R2Y2wU8kJ5eAnoLAb7m74a3JIYo0GamlvcLa6AWqESp1YTJtBiwPn9eLsBnZygBcufrDFwcIHlJH+CJDZOhShdiUwxOUNbpw/5vCpJ9wMDxY09KqbjU6Joxk7enFfXGJMp+nxsh7JPWkCDYG9rXMYb/WJMESiw+U+k0mcOHp6F7G62XJ9NO8Z0eI9vZlDYCcopdYGs/+bK6yUieaIlb/xw/ypN7FhedxQrEGTFticbZEMGsTqlp6yIV0kyJ88Z0ev1r9AOvQzDVVH2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwCDNDF5LuPrXQEv+Kg+TpMw22AK1kChnlU6aeIHgWM=;
 b=OSqKEU19xIUXd2BbjCIqGQc/OX/BB339BEvyP9hXwRHTq2V6eosMGrw7nc/+jLSjhZd0vTMyARTskHL+ttTSRxvu5h2eAjr6+vd4abHtIDnhJl8nnJH2VYVD1KMcygVz/5ianIABvIbvoVM8rt7Wnk56hnsivWuRBmu7GZjsHclRNqFWiCcA4SH2egdCdul3e1PEa7pyOplLtF81NeZKq4cstMNa34JgPSeDJ9egS0I3fuTOCdrGyHTCvNGjAcWTSUWk+7gH0BKIi6Y8XBQ+eoJtzIXWzb7N8wSDBnRfiP6+FXp/QSc+bM32vvfR4YFbo3VYliDk46U5VATo6x5gQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV8PR11MB8464.namprd11.prod.outlook.com (2603:10b6:408:1e7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 3 Apr
 2024 20:29:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 20:29:03 +0000
Date: Wed, 3 Apr 2024 16:28:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <sai.gowtham.ch@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_pm: Tests vm-unbind all flag
 functionality with S&R
Message-ID: <Zg28C66etc1960x7@intel.com>
References: <20240401184631.346-1-sai.gowtham.ch@intel.com>
 <20240401184631.346-4-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240401184631.346-4-sai.gowtham.ch@intel.com>
X-ClientProxiedBy: SJ0PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV8PR11MB8464:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V30/AVe/TOeMqN8DOz/KrGNf2kf5cdIsNwqBZOOSkyFDNRFOsnRQDfQ1xU5qeZgTyiYToqcsC8dcNKE1OKtfyTLgTyILVm7BmzG2bw8YgLK0QAhIA6Qr1Jpj87h+dVrCm0ELQMiiIHSFQW1IVctVcXR7K/hRVUUMAiAEOmeKn2p7QjpjDya7NeXNeoZyfP1SdqxTMtkzKKatrpSlMzLpksFDcEiP8Qpg0lRwd5kDKXh8yJm+boEPxeJ8fb21MORpV7QtPLqjWJ0tbKvCS0W9t5p21MT4KtX/MADF+2O6bfJQk+9X3DA47XGLKOCiHwi9k5M2mlbhwseDGXoYHKqXccHq8CDeSLQgAM2I89SGhNplEfsFEOXFNVRm4fNiopMBFrq2xu7pYmJbDWAuCLp1eubEW5Edd3sOsy11SSoP4dxOgNLe3h+tKmFaltkllpeuu2plI8xIqIVqICxXqwJpVjGD6VQn8KVBc4pwu60AUDsasb045MJH3+0yuSIHMfp1kwQllptBsfCK7tBArYbOZECAlMTiYBRtihlS94N28m015pRf0Pm0mbIqCQtybuxBJVDvytaYEoHaeUD1NQ+1TNtkWScsm6khof00KjCA7HMb2n7kNcuOWi5ZVzzT8Pl0WDYsMhlWGbFYjiz1Q4S9fkN/tAvmmcAQZt7VY8Rz3A0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o3UbmP4zfJ4ogtchbZLEpexhpcYmmbwCshMg8YGelDKPlMRx+sA3VwhceuCj?=
 =?us-ascii?Q?B2W5lKugBsDF4s9k3Z19MlvGeym5wo39+ASCYee0DTgDHZtTS5l12WpEB0OQ?=
 =?us-ascii?Q?ID2u7NiEfGVEmoDG7yPIWvmXrkaFX3vlq2SeQ+Sa6lQ7xIw6h8LHh40xEs3B?=
 =?us-ascii?Q?pmgSQ94lQuGd0auUypPcx1dWIdZ6TkiTvRhqm/ZGNHiXMLeg1Z9gK8x3xAv4?=
 =?us-ascii?Q?xXvFoBwHDbQBbtjbFke1T09MhGTIlFdHa7J5dxhTYXV9O+ZVD4meBu67PKWP?=
 =?us-ascii?Q?yUuwN1VHTpeB3D1ItkI4deKfOQ3FW4LzMIPwdNOJeudxbA2sSkOH0UzOyWb6?=
 =?us-ascii?Q?otr0XOKqj/V2ld7k9jigtO/VtbQ5qwZ9qj7u3mfr7w2hNr1WLZDUbH7w9DuG?=
 =?us-ascii?Q?nqCcMxBiqHuDcjU8+6FMyhgvBz6nKt1Ou/mUsq2/sGDEwFFGJV2TyiEwSF4Z?=
 =?us-ascii?Q?NRujMjYt7ICw7omTJHp3QC2ZHyWDIG5UOBd7nUVZ2OmqgxXNk9RL2r5zR6NH?=
 =?us-ascii?Q?Xszf0+IRKZkvRBSfZ8LZ2jHC7DOBPXeB2YceHh2F2hmRtNa6O8upZw6URPyY?=
 =?us-ascii?Q?zLs9CaSqWokADlqrFfEHt5w0+D17vc5qmrP6XPUbXKd3Xf+z+8yvSIgVXt5f?=
 =?us-ascii?Q?SyvUHZXG4hgp3Pchw+UZjLmKAieP8AhYEixNKVbXNp9mAenfJKIoY7+8g7FV?=
 =?us-ascii?Q?nIFXK9z/9vBPwAAg0VCfTb5+nHN8Wn4QGNYhUUzEjfzXpaSv1WgRSuPDm9WN?=
 =?us-ascii?Q?xLd8sn71fNIVxcu9Ee/dXa7Mkv/Bt5XoYGFcqsq+c7B/WemA/HfiD3+EF1jq?=
 =?us-ascii?Q?3J/82jcPrCr33aUgVohe2orAyEwQNA/1U01m7Y7hlZf+3SxSpnFKa2leHEA1?=
 =?us-ascii?Q?sSBHVRhf54DSdWDeVhQ8Rbjyy0ZLNaQNkw5ZmzhGsjlleLnic39Una45qGjc?=
 =?us-ascii?Q?b5oM8glpqrw6a3RIBv9e5pQcSKeE4kYC4v7/gAZ9KkldZdXJSZRLIYyNE0jm?=
 =?us-ascii?Q?jLZeGA6xnbQsecPg9fc7NsK5Km51jBm65334K6FIZZDinl4mM31HzIdBMgIL?=
 =?us-ascii?Q?Fx5p/ogV+8hK/YhkmB4mL/Ycv2JizXK+BCQ2aY1FHo5ey72h1+aVwfKJRKLS?=
 =?us-ascii?Q?BGS2NdDO1mKT6XTD+/BX1/pI1W32x3Iz5ZZChW0lLsl/PVFxSVJ2eB7fGrh0?=
 =?us-ascii?Q?wu/kMNkEzr9Myo9h77V8aQIqPa7YSv4VxIF2hxRSVIQmJNwKQaPHyjv5FM/T?=
 =?us-ascii?Q?C1KnRdyNXLO5r5evikMlhfX5OTEhT5te4lZ/2snAg40mvvcP544De5QFXNhb?=
 =?us-ascii?Q?FTnpOGIJ5b7nbXQRInXpw8ArDirTyo34dBN0TxG4hsxss0zghYwu1o4bbk3N?=
 =?us-ascii?Q?3+uQ3ApeA/YYMupOkxQUoAB+HDKg14wYvmrngURfk7iPPEA4l3IsdJEa6lWl?=
 =?us-ascii?Q?2qvfAzA/U+W8oZlOrwfmPBcOImjxtLRaj4lfULHVriK0vfzRORZkWfmOeaUm?=
 =?us-ascii?Q?OHs8EW5Y1CwZKfmI08e0shmWiUE2fpzF4F1UblXTLHuORejGLbCffkoIa47U?=
 =?us-ascii?Q?Po7fbvy6/GQWaQ4lGifBsCS0fT7Lfmfl5318gEPMPL3TpKL9QLnuTsSc4FQ5?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c81d9592-822d-4454-3cfa-08dc541cb37b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 20:29:02.9904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xIDTxgXfR+boWdELhD+ouhI9ZtXWWI2/ca7dzmXkgymI0VC06iVz865DXxBJLOSteAnLBX4mSllVk2U1GOgd1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8464
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

On Tue, Apr 02, 2024 at 12:16:31AM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Test validates vm unbind all flag functionality with suspend and resume.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_pm.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 839540f5c..6776f5505 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -35,6 +35,7 @@
>  
>  #define USERPTR         (0x1 << 0)
>  #define PREFETCH        (0x1 << 2)
> +#define UNBIND_ALL	(0x1 << 3)

please be consistent here.

>  
>  typedef struct {
>  	int fd_xe;
> @@ -219,6 +220,7 @@ static void close_fw_handle(int sig)
>  	close(fw_handle);
>  }
>  
> +#define MAX_VMAS 2
>  /**
>   * SUBTEST: %s-basic
>   * Description: set GPU state to %arg[1] and test suspend/autoresume
> @@ -291,6 +293,7 @@ static void close_fw_handle(int sig)
>   *
>   * @usrptr:     usrptr
>   * @prefetch:	prefetch
> + * @unbind-all:	unbind-all
>   */
>  static void
>  test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
> @@ -308,6 +311,7 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  		.num_syncs = 2,
>  		.syncs = to_user_pointer(sync),
>  	};
> +	int n_vmas = flags & UNBIND_ALL ? MAX_VMAS : 1;
>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>  	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
>  	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
> @@ -358,8 +362,9 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  	sync[0].handle = syncobj_create(device.fd_xe, 0);
>  
>  	if (bo)
> -		xe_vm_bind_async(device.fd_xe, vm, bind_exec_queues[0], bo, 0, addr,
> -				 bo_size, sync, 1);
> +		for (i = 0; i < n_vmas; i++)
> +			xe_vm_bind_async(device.fd_xe, vm, bind_exec_queues[0], bo, 0,
> +					 addr + i * bo_size, bo_size, sync, 1);
>  	else
>  		xe_vm_bind_userptr_async(device.fd_xe, vm, bind_exec_queues[0],
>  					 to_user_pointer(data), addr, bo_size, sync, 1);
> @@ -414,8 +419,13 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
>  
>  	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> -	xe_vm_unbind_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
> -			   bo_size, sync, 1);
> +
> +	if (n_vmas == MAX_VMAS)

if (n_vmas > 1)

would sound better here.

> +		xe_vm_unbind_all_async(device.fd_xe, vm, 0, bo, sync, 1);
> +	else
> +		xe_vm_unbind_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
> +				   bo_size, sync, 1);
> +
>  	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
>  NULL));
>  
> @@ -624,6 +634,7 @@ igt_main
>  	} vm_op[] = {
>  		{ "usrptr", USERPTR },
>  		{ "prefetch", PREFETCH },
> +		{ "unbind-all", UNBIND_ALL },
>  		{ NULL },
>  	};
>  
> -- 
> 2.39.1
> 
