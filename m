Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4C3C54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 20:44:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F232311210F;
	Thu, 21 Mar 2024 20:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dCHDlS/O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2621211210F
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 20:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711053895; x=1742589895;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h11enGmrCEtgYJM86/Jdmxn/ALxfuST15n+nYzY4SGI=;
 b=dCHDlS/OsCaZRdv93UPGy04UabvtSrQ42+dlgvzQMJbKsOAs68LRBeiT
 zDn6lVZMZnrRHeCE8P7c6bLP/kpV6J+HVGyacwJ8XJ1FDBV4PvlTg36B3
 WlgNZJg7PVZhWIklizcqAOc5iua1DNiJA69+dYDT/rmjV/XWDXAXfnaO+
 MTwbDAsoiZkIDr25KAsPkfEcSM5QJvYrzU/6PRpIB9GU3Xmo8Ryk1/Jm5
 eu+XGhpvqJKmiY1eFgypxyDGFzcFN67MZsgeoXkNw6srDpDoLNhqWcqhj
 q/7yQzmcRhyeZ6wz6PVtZ3j9k8/oQCbxefwA7QVDqTduEmu+SS1q80W8u Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5935667"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="5935667"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 13:44:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="19109620"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 13:44:49 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 13:44:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 13:44:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 13:44:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXwS3+d3pPKCYvT8mjHux3yjcGQmeQ4PT3Y/hQ5vU9vPySshoIYWDa9B3hh/VI/+hVgplfKWEY3SrUwXhzZxBOtN//bImuOS2kkHNyJmobRQ8QVL+u0ddI2SXNw1GACZnM6T7wuxj/4Bjwc7vNc5q3604u4oIdGkinDY3JBl8Lt8b+S2eioY1YIWpEjsMUAWfRFo9ExWvKCjdQfjDel72IFGbLe/42qWfNke529sLC2EmSvJ7AdI0dillrdRwvKcqMEnaaH8LsF4OKU9ZuPaoPlGl4xAQBEXfVHJ4ejXKT1Z0qKNlWtf4d9AgoL5c0OX6dosLOmZjYaEIwezt2GgCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jDFiixeco4Xv4wJEoSvfPuScLBJCzVi5eV5dHvswQ1E=;
 b=ZL0mn59fbc16XtSCo/UyX4eqFBBJ4HIuwTUQSi50pPECjthx8vYlC+YhIjJKZMptjM36Mq8zTUM9itBjrXYRPrTwG7SflFI5gO9HWL0IUgPJ5pFU2WzEpd/kI99vNcA89Ib8UUsIVSqpgItXk0fdQ3twbDaLNIYZYSywnoZ0jRAyaMLSAWkPMT0vg7ifCWM1VlOSvuIzOStW+A/1ni3lIZE8aA7ZsvogEhEfRZakd2xaABjrOoYwXIQOzr9qaSiWnD8womH88dldGPGZ6TpWC4zoNqtQbB4IYU3OFl9pxVf4pVLTHmqSVJwW6FV8vSe4hwmooL7xq0ItUsvQbCpDzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB8158.namprd11.prod.outlook.com (2603:10b6:8:18b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Thu, 21 Mar
 2024 20:44:46 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.023; Thu, 21 Mar 2024
 20:44:46 +0000
Date: Thu, 21 Mar 2024 16:44:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <sai.gowtham.ch@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_pm: Test to validate vm unbind
 all flag with suspend and resume
Message-ID: <ZfycO5S5R5CS1fgz@intel.com>
References: <20240315050536.21319-1-sai.gowtham.ch@intel.com>
 <20240315050536.21319-3-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240315050536.21319-3-sai.gowtham.ch@intel.com>
X-ClientProxiedBy: SJ0PR13CA0233.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB8158:EE_
X-MS-Office365-Filtering-Correlation-Id: 1714802b-dd9b-4851-7828-08dc49e7be7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: APxdEDu+s+WjnwfIJM8R7iVUKvoCybo13GFb7U7jqEVSZsBlg4bYFB19F4We7WJ7kshCNTsJkpIRXFkrNcqQwWMrmLIeCxZRhhLEkbUWIH9J9FpeYb9wZXNyBircY2ssInX88Zbnh+5adqeu0qTTh/UNS301t9C1U4AwpMMFTqas+QRDzUvnPk0El2MdbFADoMJ/HAEztVZi3Sy1MSXxz+NGKNhq0qiMQNP95YjUhoagM8sm+lXzd8KpAdT4+zgrP7jlxGv1xWOiCOClPWLimrkzDY9uHN0vfbQRMxHAUMFOZMg3n4PY76HQ/3UiC+mrHfqfD30uSj1zgm4K5AbNnrPPqOPqN3hfCVcfpibky47f2RGkYNHLle9+rrnTMAJYbwQ8mQiKV/hf1XAkt5YtqSdkwdloGrxZZmQqNMv+ymSNGVmg/65drrw+6aDB6fBQDKQmSw9xhh/blvHyktLYfZkwvCaqmVbV5hk7yyqMgilneF7v4bs6XAoPC5Mzzy/nu7F19HHKg6TMQCRdAM8T0+RhHS8h5fOkcHu0v/cSvMzrW0FHUTKsHsoIdr/afItHZRNgV4lZ5yOV/YkDDHOSY9l2UjfS+yTTA9t5mSUdAGsWq4sCcaakeODB+ZHxjsE7VvInayEeR81+L09gM3tFpBS1R+flSGV6qc2SJSEL58s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SK+PtrQ15kMDPVnlzhVtGwAxt3vl8I1qJAOW/7s1ASmBNG7cdGwwcrjUHrzh?=
 =?us-ascii?Q?cv9j+E5+AqgFXPopc60VtN87BeJwmiFjPPVdXmxd51EzLis0vBOCsdMIwtET?=
 =?us-ascii?Q?ytmfwhgfhpfiDDAduBpQQySoKotuLoLluKj033+Hi9zvVGJQBNmf/KLWIsCG?=
 =?us-ascii?Q?k8KlhuTCmvyZrYFKou0Hup1OiW/MmpW44XTq9JknG2naN7942asAeDdSfUBZ?=
 =?us-ascii?Q?XO1TFJ9evooHhtxn6eRZgdNU+H7SJL8mWFyacFFPrnA6twiVIs5R4thq9mac?=
 =?us-ascii?Q?OSLp65byAnxd4fQD4hV8bv0xWw8bCusWHzcKyRGRBQwBswkTgSl2FN+NI0Ii?=
 =?us-ascii?Q?62NCd2QduEK32eiYmHh+17tEyvx5AzgYViSVw25+1EML/yEfOR9FCytx5mKL?=
 =?us-ascii?Q?iEog0G1u2wZAnVwAUiZtU3tPtQAK91q26rT583LyrhUk9h8pWeLLCkOTjKMR?=
 =?us-ascii?Q?SqoFUYwCEnakzsGgYcsTqQrXTPjEbVFOvvNjXMAFchfcsHN06v0/G4T4JKIH?=
 =?us-ascii?Q?8AEy6tGw0SurcJ6W6bUQy1fBSqrZVJ3GdR4LxDbN9Jl3QDf2JAj53pBrEr9z?=
 =?us-ascii?Q?9We8G5pp4wCNX0TNrGLV/uJqazo6XQ78RyG6liuu1mbxzfjR0/c1QMi4/E2p?=
 =?us-ascii?Q?C/NHWCaLHAM1Ws5Rhf1CpssNUbZxAsd6R3+RAmLk98fDHiSZ43iiTt50GTFh?=
 =?us-ascii?Q?v4XFBYtXivCez+KvG6Zf1JgO9iDQnh8R3pIxEzOGCW9lFPTbaHp5UQaDCo+5?=
 =?us-ascii?Q?266alaubC1e0EKA0LomvEeZJ2AoeT0jd2yjJAPPr+rBCL64WRLviDIPFVR5t?=
 =?us-ascii?Q?d/EImDMaXs/1qPi2nmEFrjKGGxcMcrjwD0JzhL9Iff581Pses+tcsPECPuQE?=
 =?us-ascii?Q?W8sMUIV5U3V9soke0ZA8U6s6oNUDhviLX2qKyyI3jAilRyECr96n1dX4P5j/?=
 =?us-ascii?Q?+k+2FOXwwDKfUGDYbwhx3Zl9GeLrK3CxxbgnilLVImXfouExK7IZkgaRx9nC?=
 =?us-ascii?Q?nAz3Fvmp8ta5hQf9iGqdeTA9wVdUIuidx6Ubt4+t39gZVT6wGADLkr8EwEXP?=
 =?us-ascii?Q?b0ULFq8ausgsG1ir5PbV4I43R3GknqyFHPo6fYIBzbFtFb5P0RpPdBmhiKTx?=
 =?us-ascii?Q?VOW2D42rMKaJ0gcZ6Qo31Kt+r08gXgXDL5L0liZBy40U4B0pWkzypTTsD5Np?=
 =?us-ascii?Q?9wj8yJWgg3hEWwX3hoDBK7/2Yl5B/pMl+4nI1q47453oyw3bzOHT8r36Dww9?=
 =?us-ascii?Q?8Q062R92VkTCaC0QDD/k5uEAe5mUOmd8J4RlSGfYCtk3F3dUyTPh8L+yx53J?=
 =?us-ascii?Q?CShawfFtXdr7x3t3lWQEprNuPxqvasNDCrJvlfnL7I/tuNLHA2UTNLhtDtdb?=
 =?us-ascii?Q?hn7ahuLQcyGOQsVMgr0lObCLhZnpQz1522HCs6OyRjutzgUaNJl1YVDUOFhs?=
 =?us-ascii?Q?mwT1BloPWyA9S752oPwlFVSsC/ckMJAhnpVzZEqpGJtzmnaGXEM2kb5Q3dyG?=
 =?us-ascii?Q?6mv3bxWr9m8ssV8pSOmd3BqhUu2LoMnYY0DosUKh3xneUGPLXZA4KDYizV7H?=
 =?us-ascii?Q?FOiNnhVi6Z89+fGLlh7aHwIBVNsveP9whQYRwLc+HXUWwQQ4HAtUkFz11TjZ?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1714802b-dd9b-4851-7828-08dc49e7be7d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 20:44:46.4724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EgI/KrP51k0NhvJbYKQ+zNafoXomBA1RbkK0XDDxmLYUpSFcfce7kFdO2Y50bs7DSgeC58C7CLfV/DztIgFBAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8158
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

On Fri, Mar 15, 2024 at 10:35:36AM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Test to validate vm unbind all operation with suspend and resume.

it looks to me that this is more a multiple vm_unbind then what
stated here since it looks like this case was already covered
by test_exec

> 
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_pm.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index ac402e757..f46120662 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -605,6 +605,40 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
>  	close(fw_handle);
>  }
>  
> +/**
> + * SUBTEST: unbind-all
> + * Description: Validate vm unbind functionality with suspend and resume
> + *
> + * Functionality: pm - s3

why only s3? why not rpm?

> + * Run type: FULL
> + */
> +static void unbind_all(device_t device, int n_vmas)

why not simply making n_vmas a test_exec param?	so you can have
more combinations ready already?

> +{
> +	uint32_t bo, bo_size = xe_get_default_alignment(device.fd_xe);
> +	uint64_t addr = 0x1a0000;
> +	uint32_t vm;
> +	int i;
> +
> +	struct drm_xe_sync sync[1] = {
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +	};
> +
> +	vm = xe_vm_create(device.fd_xe, 0, 0);
> +	bo = xe_bo_create(device.fd_xe, vm, bo_size, vram_if_possible(device.fd_xe, 0), 0);
> +
> +	for (i = 0; i < n_vmas; ++i)
> +		xe_vm_bind_async(device.fd_xe, vm, 0, bo, 0, addr + i * bo_size, bo_size, NULL, 0);
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +	sync[0].handle = syncobj_create(device.fd_xe, 0);
> +	xe_vm_unbind_all_async(device.fd_xe, vm, 0, bo, sync, 1);
> +
> +	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	syncobj_destroy(device.fd_xe, sync[0].handle);
> +
> +	gem_close(device.fd_xe, bo);
> +	xe_vm_destroy(device.fd_xe, vm);
> +}
> +
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe;
> @@ -768,6 +802,9 @@ igt_main
>  		}
>  	}
>  
> +	igt_subtest("unbind-all")
> +		unbind_all(device, 2);
> +
>  	igt_fixture {
>  		close(sysfs_fd);
>  		igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_allowed);
> -- 
> 2.39.1
> 
