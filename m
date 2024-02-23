Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCF7C54798
	for <igt-dev@archiver.kernel.org>; Fri, 23 Feb 2024 20:43:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F2710ECBF;
	Fri, 23 Feb 2024 20:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ev6ExwfW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42EE710ECBF
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Feb 2024 20:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708721036; x=1740257036;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/5NNhM8KUIBkFADxWIljxUvuty9nNT/g8Trw2RrWEEc=;
 b=Ev6ExwfWJs+YeFjXWgywf9HnjYuuqpoakurYXDk+E4jo7iZ7KqM0VvjX
 U7sd5XsDphqjvlyBfze/M6ymCtF2s57rMJEC+ZPrmKvjUQ/bGh1pvg0qd
 EIkM7wukfK6qAHZ7n4KWFKx3mJ6sWw88HIQmtazywMyqGFwwwIqHlrDch
 X2hAoYFR0kkc4MnMEMyviibbwQHSfVdxte5+aDigA9vEqHWXeVGNUv4Xe
 l2bQjnMBYgOKYvdofm2RpMbD+Qa3So4kZBGaaMdxI8MLWkBoCXIW4Do1A
 IBqBk+pHmj3R/HqYn5OiIK0LQ9uUd1zvkI0KswaZdqbQhfVBRtkGsgYIf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="14468628"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="14468628"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 12:43:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="10716334"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2024 12:43:56 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 12:43:54 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 12:43:54 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 12:43:54 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 23 Feb 2024 12:43:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMKj7SK5F2tXQn60or6vfvuuDTS9xEcAxzEXMMXRDui4CtzbgK4yAb7rERLHkMYq419LvKj6GW0uq9zE4KbWT7LYQA0zIV2pB4EraWmZfKMFd9QD9uOWn3VFYwQ9S0jJ51AViEQnbzM5tzb8gDR00V6Bsb8b3xBvVB/OEl40qBqhCzPP4eWGYmHsgTePxOe7MAYxCZQddDIVC2+TqbHsMdNPMLXgmtMbu7Ui9Vu+CU1fud+7MRgmM4LZ94TYGaDveUrq8sRX3WULWExzYc3TypYogZf8vibu4tb6730xhyVv1Wqa+q3EzoGwLQXBESyuh4G/buRXjCm/sJIY6Xb2bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yolm20ELHn0jiTupEbyWR5RfZkLGC/FaXzxX4clQsgs=;
 b=JssBeH3l1M+T8ES328sKJrVjXlEheVdm6rLnERBZcuTUF/+y+ra0veTc6DOhKr222qRHW4Nq3qe92aQI5NJbrnksH6S0xd1ZWtTuiOBbz/vqrGIUFXEzEbcmF79R2wjo6k10p5e9jcX+kc2ocGri0dL9rlK6fj31opmdPpnU0LaSI/8FIlkkBp6BQHTu2jvQM0Y0sDzvvdyGImJ/4sXPMnYD7IrTKIFuhrbaWKFp6o1RPqA6aiRLn4dtnjNoQfdVGYZwfbVxpnq6LxeuyyiWWpXpI9MP1iBPV+yxawPRyvZoZ7ST1RjRsB/NCeNkx6rddfTE5wRd0r+eqqrl5zE5vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8658.namprd11.prod.outlook.com (2603:10b6:610:1c5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Fri, 23 Feb
 2024 20:43:52 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Fri, 23 Feb 2024
 20:43:52 +0000
Date: Fri, 23 Feb 2024 15:43:48 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <sai.gowtham.ch@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_pm: Test to validate vm bind
 functionality with suspend and resume.
Message-ID: <ZdkDhAT9FxalNTEa@intel.com>
References: <20240223065136.19900-1-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240223065136.19900-1-sai.gowtham.ch@intel.com>
X-ClientProxiedBy: SJ0PR05CA0096.namprd05.prod.outlook.com
 (2603:10b6:a03:334::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: d03b586a-6bec-4cde-3eb3-08dc34b024e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3hmq/JBHQtSlpO2y8Ts5M3MU9j66TzusT9LxuCoKVSU9rZ+Czbz3AL13eBRhReNpy9YIi7feye+JyIPk8O2X8r0VmcMiE4AhOAEaWy3NallP0xesvtPYA1ZSqTnJwoaMmTFJ/Ha9gA7PLZH/JUAXbyv76ci5FPrl02i1XfbdqgIi7utazP7zofXU8U7BxwVqq4CUQFXBxetkYpeoyfS/REE8+Z3kfEy4brNyIkbD+8OLGy3dQrX5vZE7Z2Xg4S27s0tCj0+FH/iNm1yliFB2Py9OQ69Wrqo3jwE2atGTfu92LVkrDta+1CyGjbioJL3SqyM/q1PL1r+QZGQwv7bCvPiFBPQVZBx+Fpe74LpIW2H/R5Z23zU3Igztn4Yo9EqkTlUkNP9p8x4BbIxRN1aw3AFw8wtWRSvzjXPme6ajLBMnMjj99ckPaqHTgth3BE8eQddvRU6hcN69nVHnvDQC42U6xlkfa7PYdz3kKvRaQoulW8uqeiS2zZm7hYGtUkaKhU0wBn87C6Ye3Xz8cBc54iDWMxexp2/nFfNP290e/3E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PnmuNHaAexd/8v3Hl/8lOeKdL3ppR/MA9G/Jmakq6YritEF9eNC0A5r8UvTs?=
 =?us-ascii?Q?bc565HbvYqUU5IxdlcjgZzshRbfwNdARhuQNZb3PuBZ2l86Lw1Au+QTTGm2l?=
 =?us-ascii?Q?+DABVJMknoNnUzZRaLeSn4+rIaWnJqvDHvuKshNSQ5EnySns55Np41xgTZZ3?=
 =?us-ascii?Q?UtZS3q90KqNpQzCfdn0EEGuxx/LtopbJuJy9QaEoKmZqFEWpZBrpXzVf6WCT?=
 =?us-ascii?Q?hrzS83R510xe6xXAqBhYSPhuNBwL1IZVvQT3B8Cag18zJWOml2XvIQ0hGs7H?=
 =?us-ascii?Q?kZ6xer/K1CHYSGcfRrQQRQujyEiNVIqMnHP8/RWO/fuUvg5lVtLO4dvuzSks?=
 =?us-ascii?Q?bIl8g77z7TlSFZiyYQ4aThVY4fyR6dHf7nPVYlw54vF9Yd6yx0GMdla9P0vj?=
 =?us-ascii?Q?hZ9k0lmOkbU4cgEQRr/ugNJoaj+TQE3Qd04PkLAKd9R4jg9jfXDx/7gEOOZj?=
 =?us-ascii?Q?zIIVXFPohWgvv0OApP8QSJtDQNX8PhRBi78eAjjvSBry6N4cMLZgqBBkVyfR?=
 =?us-ascii?Q?6ji9Tq/sP16aUeChpLzm8bOn6Cl4Nsma1od5ubg3le9xmLocEy7H5YBsFmiD?=
 =?us-ascii?Q?PCC49j8OZkdQObcFudkEZR5hdYXrw3t3gim1TyZgo0WEHIoNo4HS+SRZ6OHN?=
 =?us-ascii?Q?r2MK7eEPVrhWG3k4koqq3bbDS3eglGgXaV2LQvs/hD0W4cb//I1lAjmU+ylZ?=
 =?us-ascii?Q?05jPIxxE0WFY7ZC1pXwhWVasFjScylH+l5uMz03PI0cEHjgYVigCcB3YffBZ?=
 =?us-ascii?Q?dfPu2ONmAHHWHESGjCuFMOM8ulpoirLG3Srpee+JBoF+26AqRyWRFfP5i/NW?=
 =?us-ascii?Q?YbgeFOUP2vb2rZLAUWJNRz/7UBfU4KAeWLF6g9x2v58vsVSWZQyyLSJJvsX/?=
 =?us-ascii?Q?+CKiG5o8f+ptwA6CSvTDEZp0MzHgLL5XbpAjzsEEnryh2F7G8Blw6n2RBJ07?=
 =?us-ascii?Q?RilXi8IfQUZy18kU40R+x4UXzyDd/Gr3wzLSm0any1cXD+xGXuum6GrAZ7Pq?=
 =?us-ascii?Q?mKtgty4P78AslHTywiC+HOwoHjn680/nsYfQM+uOvByNhFPZTkVKxr0iX3sP?=
 =?us-ascii?Q?ER2+2Es8vH/5M6szv3mk2aimCFPwngLK1DG6H0q0IBwH2GXy1dvH70Pzgj5q?=
 =?us-ascii?Q?BSEwpkkb6N/kw3l70g5O9C0xTW/9bCBiLAWJlKqd6j7dQI5fifCGxnGUNJa7?=
 =?us-ascii?Q?wfQ8672ye28N8AmeJkiWxBo8dL3nHiuYZRYB3PpCuB/HN6PMhgxX+UfkmYOi?=
 =?us-ascii?Q?rfRgJpzUOrVh2C5QuWhp3yaA/fKpPnWE7HvYpJum7y5Mu08EOtLil3Ledg9/?=
 =?us-ascii?Q?it1SpB1Pd90LstAHM1b0b2PYhIcgrHtfWlWofJbQbl8KkTUQz2K3wFZmXYUC?=
 =?us-ascii?Q?Mu18PyJI9hsZGpj1toDsLaA4xlAYONDtKDNWPANYx/T0FigpkG0vOr7zohxP?=
 =?us-ascii?Q?LLVXlYPTE2PBbxbnCW4B6l8gGMC0nYcAJOr3TFOO9JCzM9DKdWwATF4nJ2Tg?=
 =?us-ascii?Q?RTWqyX2SOoDsXO6+aJgKs8FI2EbNcS7OQKTAJ3E2pjje8ehOz+CJUHtbLvhQ?=
 =?us-ascii?Q?/BNd6MxB/rBxroBpdWOn5qYaqP7hM1fTxCjoAaEznIWqJMsNs0w4W7q59h4z?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d03b586a-6bec-4cde-3eb3-08dc34b024e1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 20:43:52.0242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: azn7npsSqtOoKDlRsL/k2LB6TxyAwqQ6kmtsQfWdNAZNLiy7p/8q79/yXphEdl2VFSEYLkfmelJWFQILBXNA4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8658
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

On Fri, Feb 23, 2024 at 12:21:36PM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Test validates vm bind functionality, by suspend and resuming the device
> before and after binding VM to a VA.
> 
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_pm.c | 92 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index a0045da0b..f9d2ce421 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -550,9 +550,96 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
>  	close(fw_handle);
>  }
>  
> +/**
> + * SUBTEST: vm-bind
> + * Description: Validate vm bind functionality with suspend and resume
> + * Functionality: pm
> + * Run type: FULL
> + */
> +static void vm_bind(device_t device, struct drm_xe_engine_class_instance *eci)
> +{
> +	struct drm_xe_sync sync = {
> +		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(&sync),
> +	};
> +	struct data {
> +		uint32_t batch[16];
> +		uint32_t data;
> +		uint64_t addr;
> +	} *data;
> +	uint32_t vm;
> +	uint32_t exec_queue;
> +	uint32_t bind_engine;
> +	uint32_t syncobj;
> +	size_t bo_size;
> +	int value = 0x123456;
> +	uint64_t addr = 0x100000;
> +	uint32_t bo = 0;
> +	int b = 0;
> +	uint64_t batch_offset = (char *)&(data->batch) - (char *)data;
> +	uint64_t batch_addr = addr + batch_offset;
> +	uint64_t sdi_offset = (char *)&(data->data) - (char *)data;
> +	uint64_t sdi_addr = addr + sdi_offset;
> +
> +	syncobj = syncobj_create(device.fd_xe, 0);
> +	sync.handle = syncobj;
> +
> +	vm = xe_vm_create(device.fd_xe, 0, 0);
> +	bo_size = sizeof(*data);
> +	bo_size = xe_bb_size(device.fd_xe, bo_size);
> +
> +	bo = xe_bo_create(device.fd_xe, vm, bo_size,
> +			  vram_if_possible(device.fd_xe, eci->gt_id),
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +
> +	exec_queue = xe_exec_queue_create(device.fd_xe, vm, eci, 0);
> +	bind_engine = xe_bind_exec_queue_create(device.fd_xe, vm, 0);
> +	xe_vm_bind_async(device.fd_xe, vm, bind_engine, bo, 0, addr, bo_size, &sync, 1);
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);

this is the only thing new here, a S3 right after the async vm_bind.
for this we can only introduce a new option to test_exec and add this line there,
withouth having to recreate the function.

But I also don't believe that the goal is only to test this,
but a combination of VM_BIND operations and how they survive to the
suspend states.

So, we do need a new function, but to test a combination of the
vm_bind operations against the combination of the suspend states:

*  - %DRM_XE_VM_BIND_OP_MAP                                                               
 *  - %DRM_XE_VM_BIND_OP_UNMAP                                                             
 *  - %DRM_XE_VM_BIND_OP_MAP_USERPTR                                                       
 *  - %DRM_XE_VM_BIND_OP_UNMAP_ALL                                                         
 *  - %DRM_XE_VM_BIND_OP_PREFETCH      

vs the already defined s_states and d_states

> +	data = xe_bo_map(device.fd_xe, bo, bo_size);
> +
> +	b = 0;
> +	data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> +	data->batch[b++] = sdi_addr;
> +	data->batch[b++] = sdi_addr >> 32;
> +	data->batch[b++] = value;
> +	data->batch[b++] = MI_BATCH_BUFFER_END;
> +	igt_assert(b <= ARRAY_SIZE(data->batch));
> +
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = batch_addr;
> +	sync.flags &= DRM_XE_SYNC_FLAG_SIGNAL;
> +	xe_exec(device.fd_xe, &exec);
> +
> +	igt_assert(syncobj_wait(device.fd_xe, &syncobj, 1, INT64_MAX, 0, NULL));
> +	igt_assert_eq(data->data, value);
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = batch_addr;
> +	sync.flags &= DRM_XE_SYNC_FLAG_SIGNAL;
> +	xe_exec(device.fd_xe, &exec);
> +
> +	igt_assert(syncobj_wait(device.fd_xe, &syncobj, 1, INT64_MAX, 0, NULL));
> +	igt_assert_eq(data->data, value);
> +
> +	syncobj_destroy(device.fd_xe, syncobj);
> +	munmap(data, bo_size);
> +	gem_close(device.fd_xe, bo);
> +
> +	xe_exec_queue_destroy(device.fd_xe, exec_queue);
> +	xe_vm_destroy(device.fd_xe, vm);
> +}
> +
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe;
> +	struct drm_xe_engine *engine;
>  	device_t device;
>  	uint32_t d3cold_allowed;
>  	int sysfs_fd;
> @@ -693,6 +780,11 @@ igt_main
>  		}
>  	}
>  
> +	igt_subtest("vm-bind") {
> +		engine = xe_engine(device.fd_xe, 1);
> +		vm_bind(device, &engine->instance);
> +	}
> +
>  	igt_fixture {
>  		close(sysfs_fd);
>  		igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_allowed);
> -- 
> 2.39.1
> 
