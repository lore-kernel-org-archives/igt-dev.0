Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5281FCD1296
	for <igt-dev@archiver.kernel.org>; Mon,  8 Apr 2024 17:56:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29421127DB;
	Mon,  8 Apr 2024 17:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oFs/G11e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E7E1127DB
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Apr 2024 17:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712599003; x=1744135003;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bb95VRanHrYT17/+AIiXMBDb2FIu97nWzVDR8EuFEIc=;
 b=oFs/G11eRE+HF6BGQ28nnTq5cQE6NQEmZ9bxBdhYt3l93uyt+SIZ5W8g
 gdNhXFW5XUMBLkvILP3AU1V4jfKp1ddsZkjlWhgFT+O33u5Smoe6Di7Fg
 Bs82BOWUdWj536jcM3uCCecHPjkMYMthsjUgnsP5IfoHRe7QqafxEG+Cw
 KVBiU7GcJnB5mMdMj83hF8uQCrCK6DPKgEfMOr1Z9jy2VH/e5YEG8x6g3
 4YQMlHT84yI8VYWaR5mv3zblT0wHn/UqFaNtUZUXVZikdQ+GKF82kzW9M
 ymNfT8psG8aDVVZcuvg3uRc8GDkVeEyLBR1XDGBQkuIBAywVsl77dG/tV w==;
X-CSE-ConnectionGUID: zfbK6I47Q7K4bLifWefrxA==
X-CSE-MsgGUID: BiBZrtJ4RMKULMawLo20yg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="8470433"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="8470433"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:56:42 -0700
X-CSE-ConnectionGUID: 0J/sUA60SDeL6Cne4Kzn0w==
X-CSE-MsgGUID: xrUCfY3GQFiFAiP/jwof1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="19987617"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2024 10:56:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 10:56:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Apr 2024 10:56:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Apr 2024 10:56:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lk0Nu9o3VqvtNWtSdPpiZTr6GeCs9T0PoWz8BtbvHeddiXbQmbx5h8ik4zWVZwpRdqd03E81+a9Rdiq0ntLr+ju3Qwy18gUubKv57Jw6esoe4B/lVBbh48U3HgJuzM6LlcRvjjwlvRYS3qFpKuEjIlE1X0pP52FaLNqm0ihVpSiCgv7SMlG1yTVXbITU33u80ee+N9f/yVBB7wmoek9tt80m7BRHZy5h/8K3W09MRotZW0lh7i5UcLX76Vosc9EOEeUA/DQBk8i3CPVQRo/zN9xyNbRQR3+Y8yDCArPBGn8VvVfVmPijO4qTQ0CJQKKH+R+M+9sYOVEL6Y7pxJiTCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fyMHXkHndfI7qcLLSNr3Wp+8OnKP7Jwwt4qcH2n+2tI=;
 b=nZKr6yyBcj3YFB4StDKmcZzTF4JiGIdBr7PLPzZEjQIZk6O6oTnUu76suZLGQRnXE0DYrsNHLOsYSoXy8kib4QnFVDVTGPsNOTbg9G0DQIJHmHgHHVvSAXQgkKndhZCUFie+K054+OH3OAqyR2oejLsg4l7TEtOKM0Bb4gsZixGB2KsD8yu+yGneLs7TXYqIle44DvmS5mYNivIic4vX6aPXP5D6BKdxqYKULMENfoPdgs63SrN3MKyW+QbOsGv/sWsCG2/f5eq/9bE85GvpAFkgR5VpxRGpGkdWr4X+HhwmTY5l+O0WBkMC/GWaFSC2dVYKkr0mq0/07R9jVhlAfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7127.namprd11.prod.outlook.com (2603:10b6:303:221::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Mon, 8 Apr
 2024 17:56:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Mon, 8 Apr 2024
 17:56:38 +0000
Date: Mon, 8 Apr 2024 17:55:24 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_store: fix sync usage
Message-ID: <ZhQvjBlfDy3Lgr8k@DUT025-TGLU.fm.intel.com>
References: <20240408174113.73617-1-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240408174113.73617-1-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7127:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 30nzMEFurzTp0wSLfwfvG/YutuE+Easfjd9RWGbzqlhksroIUo6ij0G1xI4LlIeoWTH3RLlVf9Wr/HEwIQ/XKcR4pAeY7xUFrMD0GBIbi7tqPPyy+JNKEB1fY6HTjcsqjcoNo4SK532nAp5i8Uc+r88SH6XhBaOyA+aRuPkOJ+bYw8ozfTrFVFuoI5OyuycXMCjHreghIZpg+tEK8Tb7UhRpZ0kV1+jCCP6ycQZjTLSQ8z3DtoiCzECodfJXmvpJzbNFCmklDRh6Z45b0rWyOcGgREt5KyMGtxtHmyr48dFqBtFMVasvpEaLxlbQrqOjZNVcK/ZBVV/Pf/v92Ug6zsc+k96RR7dIQ3Muu8tXjqmHDokg4Ud8J9WAYSJnq25qi/Jq40v8hoYecfSgxLOrTmgt/ZGHiRP0ID/ghU2Ljrlii2iPM8XFvjDomS8kM6ee1T3EW09fcz+1XZ4UK4GWXz87BUxjFws2HI1Jk/11TpcjlXRLOI3RHa9BqyzMx+FJCb39OrtynBLucqTe72rAYVC8iOtStiF6RDoLwnaBG+XflVIEY+gdMoGaErQWRRxIMkXL9BLgqx31hdfS2JRnBK4EhHzyXpeL3xhWFPp6HNI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3AsnA7qwNf4kXIBXhKRLlhmCujQUwkHXMcAlzzeGoYm7xuK2iFIcdIJWh6rz?=
 =?us-ascii?Q?2ATg6Ux49+uwE8J3szR7ABj7VyXHt9i8gIC+ks0jb2Z57CSThMIz6Rr/CQIa?=
 =?us-ascii?Q?GPsvOAfEtCKLc2KpytdnXPBwanzUe7jIeJibW8P+rO/DNzx/rFqmFefZip3n?=
 =?us-ascii?Q?reJKz4kB+Y9av7E9miy17fP4NiBVq38vFIiKw+XcBrhwwSFwLKVvApryRyXy?=
 =?us-ascii?Q?iK0pqWlWmdbqUF5Lw35Azb45HLJkhPTRRdutj6QbYpmPtyIk6j8+bNsHC8nc?=
 =?us-ascii?Q?fxeJ5gK6Fz8Dto9k5MucnrZfn82caoMgfoFAHqf18qihsJQONub563bX4o8o?=
 =?us-ascii?Q?Vr69llgV/y3ZiCsuKxclWrhsIagNx4sfgI51c3X/jmrEqcYwEmfhsMa+djgh?=
 =?us-ascii?Q?POYjjt34uIRhH3HrVHMc8Gm4Woh1f8y8tED/9+7ZYa8aj8BzRK1cfqhu9bDy?=
 =?us-ascii?Q?d2ETqJx7rnzAjnzuaI0GI+ByGZe5YDxrCCvb5eltjQ+bfiJv3XdiFDAddeHT?=
 =?us-ascii?Q?TVIqwut5grOjA4MXgncgGilGNekcMx/I8SQ6nufLyAKYqU7p15xQyNY9PtNs?=
 =?us-ascii?Q?XHYAxSk11oqN1hd+yU6d2CGQ3a3pcbT7lzhEGUBLDjpEMrnpPrLmNwX/XpuB?=
 =?us-ascii?Q?KSpNc/EE6WKVEbV3zTVRyllcXV31tVu4c7lyuobgqB94+Qsq7XPbIBZ9f28J?=
 =?us-ascii?Q?Se3u7mpT8V1H5nf/06C+YxXB7pCJh5iHTHI5NBDtrB5oD98JR79OXzE/ed6Y?=
 =?us-ascii?Q?niU2+flKwzFO583Q2bjpznvVzpdciv+M87gKMkHZ6T0E7Zv3lMBydKlyDRWx?=
 =?us-ascii?Q?QU9a5D6mHgmyUrZLcl/aRxn9j3PtTKBNs26+R3/S//XTyzFNbGYbSrJSbd4N?=
 =?us-ascii?Q?K5k0cmZy31DpJaBbsQrGq9W9NmrrE6JpZm01Vfc1A1jRXpCAuG6zY5sgx2Hw?=
 =?us-ascii?Q?f9y1SZBe27E4lXi8yrBys9SOPk+8lxiuGgVx3JHfULo1nAyt1eyvD0ImUTkY?=
 =?us-ascii?Q?tw2zEJwZ2hqsAjVjAisxDAu5hUaD6WbuW3e7/EixVByu28aO9w/0q5ElEVoV?=
 =?us-ascii?Q?mDkv8fJXlc3smReSYeWhSgX3iv8DQ2r6OLjZPdbhxebL1/VfOOpgFUaJZq2p?=
 =?us-ascii?Q?AlvtJLzjTFFsOGiOj4IdJpXZxiUAbwo5j0lka8lh0nYcPpW214fZP+BKZZET?=
 =?us-ascii?Q?dyyaJNqGCwKGF77qfdKxRdUxXTrTpWV/lyMo0687JhX/gAh/sYMjf7QXAQVe?=
 =?us-ascii?Q?luvIxU+NV2SxroHaaiEzCrJok6tEgE0QM4hvETD7sn2pnPMD60h6Ob2reUes?=
 =?us-ascii?Q?x0z7TAVhnPCRxW9qC6DDprtpQfeEwv7NWjce5mBKZ7Q60szUTInq6UWJhMf1?=
 =?us-ascii?Q?DjniXbxJ1hIWhE4N5TxTghe9Ldh9prZR4LXEdRaJwR0e1WUXHYHkgbo1qVxD?=
 =?us-ascii?Q?xGvYY8cPNuMmMyb0iZKJcUSENO6Xa3Q0IqUaTDzcFl96jeukKH8dT+lcZn1/?=
 =?us-ascii?Q?HvsZNRnKznwZixXAoDJY29Kr2GMhTQtvvYI4SbO6B24JnRS0bE1xf8bRxBLm?=
 =?us-ascii?Q?vDBg/axhN3vD4/V2C1M5ltFw6HgQXJwT98p4n6KcUVaCsaJkGYyQ0rDGK2Vz?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2623aef6-20d5-439a-253e-08dc57f53cf3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 17:56:38.2745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKSL6bP6lG28rqzQcfUfno3sPSKMC62SFOpP5Py7lS7J5LaexYFXv58ASifQJad9U/Am+rdANz4QBaLu2LqVpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7127
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

On Mon, Apr 08, 2024 at 06:41:13PM +0100, Matthew Auld wrote:
> If using async binds it looks like an in-fence for the exec is needed to
> ensure the exec happens after the out-fence from the binds are complete.
> Therefore we need to unset DRM_XE_SYNC_FLAG_SIGNAL after doing the
> binds, but before the exec, otherwise the sync is rather treated
> as an out-fence and the binds can then happen after the exec, leading to
> various failures. In addition it looks like async unbind should be
> waited on before tearing down the queue/vm which has the bind engine
> attached, since the scheduler timeout is immediately set to zero on
> destroy, which might then trigger job timeouts. However it looks like
> it's also fine to rather just destroy the object and leave KMD to unbind
> everything itself. Update the various subtests here to conform to this.
> 
> In the case of the persistent subtest it looks simpler to use sync
> vm_bind since we don't have another sync for the in-fence at hand, plus
> we don't seem to need a dedicated bind engine.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1270
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Changes LGTM but IMO we jus delete this test as I'm unsure what coverage
this test is providing.

Anyways:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/intel/xe_exec_store.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> index c57bcb852..728ce826b 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -102,13 +102,13 @@ static void persistance_batch(struct data *data, uint64_t addr)
>   */
>  static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instance *eci)
>  {
> -	struct drm_xe_sync sync = {
> -		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> -		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +	struct drm_xe_sync sync[2] = {
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, }
>  	};
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 1,
> +		.num_syncs = 2,
>  		.syncs = to_user_pointer(&sync),
>  	};
>  	struct data *data;
> @@ -122,7 +122,8 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
>  	uint32_t bo = 0;
>  
>  	syncobj = syncobj_create(fd, 0);
> -	sync.handle = syncobj;
> +	sync[0].handle = syncobj_create(fd, 0);
> +	sync[1].handle = syncobj;
>  
>  	vm = xe_vm_create(fd, 0, 0);
>  	bo_size = sizeof(*data);
> @@ -134,7 +135,7 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
>  
>  	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
>  	bind_engine = xe_bind_exec_queue_create(fd, vm, 0);
> -	xe_vm_bind_async(fd, vm, bind_engine, bo, 0, addr, bo_size, &sync, 1);
> +	xe_vm_bind_async(fd, vm, bind_engine, bo, 0, addr, bo_size, sync, 1);
>  	data = xe_bo_map(fd, bo, bo_size);
>  
>  	if (inst_type == STORE)
> @@ -149,12 +150,14 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
>  
>  	exec.exec_queue_id = exec_queue;
>  	exec.address = data->addr;
> -	sync.flags &= DRM_XE_SYNC_FLAG_SIGNAL;
> +	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> +	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>  	xe_exec(fd, &exec);
>  
>  	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
>  	igt_assert_eq(data->data, value);
>  
> +	syncobj_destroy(fd, sync[0].handle);
>  	syncobj_destroy(fd, syncobj);
>  	munmap(data, bo_size);
>  	gem_close(fd, bo);
> @@ -232,7 +235,7 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
>  		batch_map[b++] = value[n];
>  	}
>  	batch_map[b++] = MI_BATCH_BUFFER_END;
> -	sync[0].flags &= DRM_XE_SYNC_FLAG_SIGNAL;
> +	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>  	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>  	sync[1].handle = syncobjs;
>  	exec.exec_queue_id = exec_queues;
> @@ -250,7 +253,6 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
>  
>  	for (i = 0; i < count; i++) {
>  		munmap(bo_map[i], bo_size);
> -		xe_vm_unbind_async(fd, vm, 0, 0, dst_offset[i], bo_size, sync, 1);
>  		gem_close(fd, bo[i]);
>  	}
>  
> @@ -300,7 +302,7 @@ static void persistent(int fd)
>  			      vram_if_possible(fd, engine->instance.gt_id),
>  			      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  
> -	xe_vm_bind_async(fd, vm, 0, sd_batch, 0, addr, batch_size, &sync, 1);
> +	xe_vm_bind_sync(fd, vm, sd_batch, 0, addr, batch_size);
>  	sd_data = xe_bo_map(fd, sd_batch, batch_size);
>  	prt_data = xe_bo_map(fd, prt_batch, batch_size);
>  
> -- 
> 2.44.0
> 
