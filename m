Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADEECD11DF
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 18:16:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D36C112531;
	Thu, 28 Mar 2024 18:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PepheMl7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93DD112531
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 18:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711649770; x=1743185770;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4MUDZ7vCzk89NhYxPfEUFVTjOyJzZZ9QuhnsXovjKJ0=;
 b=PepheMl7CQaMphrNg/trPCAUebDGewb5Bs5aPaOinqnj3g3BSL3oGthN
 u0cE0+3ehYv0Yn+R+TYro+nSACDMqGT51guq/XLmayOxqGPsOyHEKOtDj
 bLpuTX1pSr7i0QZN3OpxSK15p6vCyQx2566lFiN7ccEfgKrcVo/f7XeXj
 Jbeww6/QAvDlNODcpzp4mQoXKsVr+Fv8BJljLalaeoPBWhnh2JDGvkV8d
 99d64yFGtMMGow4UDmWku/Rv+vwqqzwTlKgLhSPActn/rKwoJ/8cUtG6r
 smVgsYOKrj/9zHVD/jGrVeZBGi5/p1vf/c6ij5JTIN7acsro6p0PWRt9R A==;
X-CSE-ConnectionGUID: +p0Z3RogSImYMIZwyO7wcg==
X-CSE-MsgGUID: 88AzpkRXS2WA+HgSsz1WwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6685386"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6685386"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 11:16:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="16759429"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 11:16:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 11:16:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 11:16:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 11:16:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGKsPgliqgSitIhZcOC6ReIJ/tOiYEU6AJi9be0y25hmFF158JBzzxHktvX86NpY6lZSsfWM3kOvKZndBM2v9xhbUIcYtKAQCi+N+5mH9WmY/RaJYdmclL0cL4KLgof8CSAu+gX9yaFHXsztHmthftdTuskyewA7cAq7iE9fPWWx3KWCdkeZkG/FGk+9cr4A7R328nUBSdVzVv2ZraVDaT9RBV/YzZkVm9K2C+MTu2+CgXi7v/lS0dWVC9/1/tWQgifantPYsjisgQZt4IbEaz+sQ8iAiTdVTDX361vATxVLAKfxZYEELOKzhkvd5rvITHABSZngYlihBjd6XfgKHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Byox4V8x/EBU4JiuDi9CptcAr+M8Ys/KJaR9Dusq7h4=;
 b=aZaEHnyobEwe+hZvcykevtDW2Mjd9ud08BrMdnqh37aQypAJ3ubQ1d+IE2W8lVK2pu9D1jp26eMaARy2Qe/fL03ympaTBU4kEi3ciamriqZJt9oCkYGqgIV/AWiq6yFpNzX+yd5zAhD3uAx1uE3YaNxCvrRvfDwdIV43PL249hjDTtJPF1AhF5hxFAEv96O8FAGvZEs6/SBJk6Gqyq0OeXmf3KglzOlGHgruR9XucNMQD6tMPVIl5XYQ1jcKbAB631KXUUihXW46qfl/q+phkz9ZlQZcmcRbdr8wPvq6a2rx6SAkAikQeIE5QkW6COBUb6rdRP9CUJ1UjE+3JOEO1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5064.namprd11.prod.outlook.com (2603:10b6:510:3b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Thu, 28 Mar
 2024 18:16:05 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 18:16:05 +0000
Date: Thu, 28 Mar 2024 14:16:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <sai.gowtham.ch@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_pm: Tests vm-unbind all flag
 functionality with s&R
Message-ID: <ZgWz4nSlCkfYxXzd@intel.com>
References: <20240325201045.25805-1-sai.gowtham.ch@intel.com>
 <20240325201045.25805-4-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240325201045.25805-4-sai.gowtham.ch@intel.com>
X-ClientProxiedBy: SJ0PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5064:EE_
X-MS-Office365-Filtering-Correlation-Id: 680e4c7a-b24c-405f-656a-08dc4f53222b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qJECtE8vnm+Cwce16izkVixZrrWYauXhSDE/ZYYlP31nKsMTKkq9K7hmSTOSRGaTyWax0hTCwj2AtbmmtZ+c89iFeAdloZ6SPc03cWxT6UXCgqlvC7CSOT6ZnLNiB/tidZzn6x7TMhIdZ+vqo1aX9VYQOuykHCjGujEEPMdeKFnxdjbcyUUeGA/kV552m30u4hMZiKV4dAJCp29RTR+PGBHtEJIAVolDEiQrm4HDQF1TblsVAKmypUW9cJtowgfe5pbGAy8pMBX4x14ADZmis26gYfV86yQcKm7JDS+YC8M3lfs0YwDl7qCtpm3vCteQzYqLNfUO+A3Ed67y1GgsHh69JbM14KpOpROMa1R7ek+bXTAE18q0CaQHQDDm0HHG+OtTbbUO5oLkr8WSdI5vauWo3Gpm4qRtnrPqOq9G51IoGTEsMWyNM769yGRS+XvXGCMbw9v0DJpjEMLaEBJ2CJ29KDRbLUJnmOQcPHLKPkUd0E6/fJnav2tTBA+AThBLMH10IvBXwVyVDUrryJjfQleEykVL+de/D9lgCm6OsUglXaVVZucpJ/pCOCSWZjrY0IR6KHjckJ6Oq7GTebue5spLmFtAJKAf8dk91DLgyab3xkheXDsQMyGYM2YDoepygbtuHHfmCF+X4/VQmdSxlJAmoqL6L9xapbiYy7+/PLw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ehfQbWIz/tz84uun2384bkwjhf12xc2bU7zO6EKy6Y1nQ7AQnXwajBBi62Ba?=
 =?us-ascii?Q?pQPSS0Df6nfXaaxGgKvne2ilau6/OpZKGIAF1TgjdVmis44UN1HzjuElaGpw?=
 =?us-ascii?Q?Yoa+N7vb26YEjCR4nJj2XJsKg+2FH5DgWYzB6j2WFCqUn10e2AS6/3BM24MK?=
 =?us-ascii?Q?K1wtocIMfn4/sVxT7eNzj63zD0d2ieOfWsYsLPw3jFOcYWnQgZSKBD3wnmru?=
 =?us-ascii?Q?1BbiE/KR5cNBoiEJGaZclRtxxUbAfw9DaoCWsftWwMdVg54AB2snw2s6ZqAs?=
 =?us-ascii?Q?yb1DlhhggigV4omoJGB2vOI2ZG0/1SjxBgIrBeW6dlmh5XX7IOi2kq8OySID?=
 =?us-ascii?Q?VFr/XTXfp1VOn7zxm9BMQ3O8bRCmjla82JFuWiOkNPYODDQSrrBJda18+vuE?=
 =?us-ascii?Q?sND8vKZGOGdV0owVgUEOT67+eTUn9FV8EcvbKIQSoAp77adOeXyPlJ2aUGyB?=
 =?us-ascii?Q?FRKHkUpvID1baTqB+EcxF5hwkskV9i64jRJd/7uCT9bQ5CtKaLAJix+oAVU5?=
 =?us-ascii?Q?tu8oY5XLnqfz9Iu09Sls8soBUud0BHZfJ4oFdIwJxzMG0Yc8CNY97735jI9n?=
 =?us-ascii?Q?DaZLiUAjiu8rN8hzWDABcglVFAK1/qoJr2IfcPtUg7eUL7m2KG1oCRozyWAp?=
 =?us-ascii?Q?AVSAKCcLMMNJw0eLG/1tjHx2iQl4RNe3x9kuGuYqpkWSJyZfiBYLOo7RnwBa?=
 =?us-ascii?Q?aSQoCLT14Cr/cJXqBmpxbo60CTO9O4DpXylfWGNwuUY7un/JPFccxPwPN0s4?=
 =?us-ascii?Q?wa1KINhwFx5DPVHTAUy5tO9cUvvJ+PbS4lEu40W9rl4B0xE5u4WjcBW18+X7?=
 =?us-ascii?Q?5J0FAP5VkO9Vrc5WKUa47QlYVOpcNvC/7QMWNdTeHFXrKmoVVjtHLxJe9pAK?=
 =?us-ascii?Q?j31Ms5zzfbGGbqJSO0Nbg45qK6emD0rjbLQCBVlyS0shULG1W4Ga4SFm2iBN?=
 =?us-ascii?Q?JHaevJhCRdEYpJFI/2Kzjf8LgCFxnRM9/9jzKK6voMFMBWzzmRWvueXf6spP?=
 =?us-ascii?Q?VSh/ViyBVz9ekFGGSgVi76HWpB7bL6HUnz3X41e9vd807vJG01VKlqLSf5gt?=
 =?us-ascii?Q?oNvreBl/V3PChMsQfwSW0IS8tSxj32vYx5958scu8mq2GjhBo+XigPpXnWPj?=
 =?us-ascii?Q?w3mzmXZHhg6Chsst9BhlPUHS868mQ+T2dDojeyFI77abzTrgAmDHcwwzkMHD?=
 =?us-ascii?Q?6RMVde3tQVrX8R2vu6iOixG0NtSCr8RJl4r99Aq+w6ajhK2GXaYY4KSnsS2f?=
 =?us-ascii?Q?bFwZTneXvmQZVO1SAjqUD3k85c6jxIMUb5l4IKg8MmoMiNrUZ8OJTaUmwRzW?=
 =?us-ascii?Q?uFXUIkWzTkIiEZBBwt1/EwMPvIkE9HOB38JES0bxXUtRRGJxGFs1/d0JkaPe?=
 =?us-ascii?Q?tbYS73PTHqLwXuvOFMfUWfizhq6heZcmnFqtzpCZJPdBnaB/k8CKP50SGgMx?=
 =?us-ascii?Q?S6LT2ZfDTvjCEPK2554qxeCCWiXWW2bE00OJBqeR0bwrDs5DOqBCm0Hfiiti?=
 =?us-ascii?Q?gmg+i96GuceONkWiA/OXIczSEPE8zcerU8z4kyag8J5uXlz9+O5+wJsHnfK1?=
 =?us-ascii?Q?+33ZJKwEtVAizKRx4t9IWgrMHmT1YeF4Xq3CqbgXNI1H+xGAhrFbghagESuc?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 680e4c7a-b24c-405f-656a-08dc4f53222b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 18:16:05.7331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsWIbVq5lOWo4pjoHOyCAM/PxW8NoFoF637Imi5XNDqV/aWpEEAFYrQijk7rXzlLlDBxZ9TSk8iMtpofiCevig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5064
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

On Tue, Mar 26, 2024 at 01:40:45AM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Test validates vm unbind all flag functionality with suspend and resume
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_pm.c | 61 ++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 46 insertions(+), 15 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index e016f2bca..7a9816623 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -292,10 +292,23 @@ static void close_fw_handle(int sig)
>   * @usrptr:     usrptr
>   * @prefetch:  prefetch
>   */
> +
> +/**
> + * SUBTEST: %s-vm-unbind-all
> + * Description: Validate vm unbind all flag functionality with suspend and resume
> + *
> + * Functionality: pm - %arg[1]
> + *
> + * arg[1]:
> + *
> + * @s2idle:     s2idle
> + * @s3:         s3
> + * @s4:         s4
> + */
>  static void
>  test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  	  int n_exec_queues, int n_execs, enum igt_suspend_state s_state,
> -	  enum igt_acpi_d_state d_state, unsigned int flags)
> +	  enum igt_acpi_d_state d_state, unsigned int flags, int n_vmas)

instead passing another argument for a value that is either 0 (1?) or 2,
create a new operation flag and pass in the existing 'flags' input.
then create a
#define MAX_VMAS 2

then, inside the function:

int n_vmas = flags & UNBIND_ALL ? 2 : 1;

>  {
>  	uint32_t vm;
>  	uint64_t addr = 0x1a0000;
> @@ -364,12 +377,19 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  
>  	sync[0].handle = syncobj_create(device.fd_xe, 0);
>  
> -	if (bo)
> -		xe_vm_bind_async(device.fd_xe, vm, bind_exec_queues[0], bo, 0, addr,
> -				 bo_size, sync, 1);
> -	else
> +	if (bo) {
> +		if (n_vmas) {

please don't do that.
use n_vmas 1 or 2 and then make the for to run only once for 1 and twice for 2:

> +			for (i = 0; i < n_vmas; i++)
> +				xe_vm_bind_async(device.fd_xe, vm, bind_exec_queues[0], bo, 0, addr,
> +						 bo_size, sync, 1);

I'm afraid you have forgotten to use the 'i' in here?
s/addr/addr + i * bo_size/ perhaps?

> +		} else {
> +			xe_vm_bind_async(device.fd_xe, vm, bind_exec_queues[0], bo, 0, addr,
> +					 bo_size, sync, 1);
> +		}

> +	} else {
>  		xe_vm_bind_userptr_async(device.fd_xe, vm, bind_exec_queues[0],
>  					 to_user_pointer(data), addr, bo_size, sync, 1);
> +	}
>  
>  	if (flags & PREFETCH)
>  		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
> @@ -421,8 +441,13 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
>  
>  	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> -	xe_vm_unbind_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
> -			   bo_size, sync, 1);
> +
> +	if (n_vmas)
> +		xe_vm_unbind_all_async(device.fd_xe, vm, 0, bo, sync, 1);
> +	else
> +		xe_vm_unbind_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
> +				   bo_size, sync, 1);
> +
>  	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
>  NULL));
>  
> @@ -641,7 +666,7 @@ igt_main
>  
>  		/* Always perform initial once-basic exec checking for health */
>  		xe_for_each_engine(device.fd_xe, hwe)
> -			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM, 0);
> +			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM, 0, 0);
>  
>  		igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
>  		igt_assert(igt_setup_runtime_pm(device.fd_xe));
> @@ -658,7 +683,7 @@ igt_main
>  		igt_subtest_f("%s-basic-exec", s->name) {
>  			xe_for_each_engine(device.fd_xe, hwe)
>  				test_exec(device, hwe, 1, 2, s->state,
> -					  NO_RPM, 0);
> +					  NO_RPM, 0, 0);
>  		}
>  
>  		igt_subtest_f("%s-exec-after", s->name) {
> @@ -666,29 +691,35 @@ igt_main
>  						      SUSPEND_TEST_NONE);
>  			xe_for_each_engine(device.fd_xe, hwe)
>  				test_exec(device, hwe, 1, 2, NO_SUSPEND,
> -					  NO_RPM, 0);
> +					  NO_RPM, 0, 0);
>  		}
>  
>  		igt_subtest_f("%s-multiple-execs", s->name) {
>  			xe_for_each_engine(device.fd_xe, hwe)
>  				test_exec(device, hwe, 16, 32, s->state,
> -					  NO_RPM, 0);
> +					  NO_RPM, 0, 0);
>  		}
>  
>  		for (const struct vm_op *op = vm_op; op->name; op++) {
>  			igt_subtest_f("%s-vm-bind-%s", s->name, op->name) {
>  				xe_for_each_engine(device.fd_xe, hwe)
>  					test_exec(device, hwe, 16, 32, s->state,
> -						  NO_RPM, op->flags);
> +						  NO_RPM, op->flags, 0);
>  			}
>  		}
>  
> +		igt_subtest_f("%s-vm-unbind-all", s->name) {
> +			xe_for_each_engine(device.fd_xe, hwe)
> +				test_exec(device, hwe, 16, 32, s->state, NO_RPM,
> +					  0, 2);
> +		}
> +
>  		for (const struct d_state *d = d_states; d->name; d++) {
>  			igt_subtest_f("%s-%s-basic-exec", s->name, d->name) {
>  				igt_assert(setup_d3(device, d->state));
>  				xe_for_each_engine(device.fd_xe, hwe)
>  					test_exec(device, hwe, 1, 2, s->state,
> -						  NO_RPM, 0);
> +						  NO_RPM, 0, 0);
>  				cleanup_d3(device);
>  			}
>  		}
> @@ -705,7 +736,7 @@ igt_main
>  			igt_assert(setup_d3(device, d->state));
>  			xe_for_each_engine(device.fd_xe, hwe)
>  				test_exec(device, hwe, 1, 1,
> -					  NO_SUSPEND, d->state, 0);
> +					  NO_SUSPEND, d->state, 0, 0);
>  			cleanup_d3(device);
>  		}
>  
> @@ -713,7 +744,7 @@ igt_main
>  			igt_assert(setup_d3(device, d->state));
>  			xe_for_each_engine(device.fd_xe, hwe)
>  				test_exec(device, hwe, 16, 32,
> -					  NO_SUSPEND, d->state, 0);
> +					  NO_SUSPEND, d->state, 0, 0);
>  			cleanup_d3(device);
>  		}
>  	}
> -- 
> 2.39.1
> 
