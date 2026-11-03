Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E89606A33A
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 14:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WCgC+8o1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3BF10E807;
	Tue,  3 Nov 2026 14:19:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6660F10E807
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 14:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793715531; x=1825251531;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=chaAVEtTxP48fphuG06Tsml18Phaw56CAr3VlrCRga4=;
 b=WCgC+8o1xZVFNS4yDIKPc9uKIopSXP6MZfSFxUiELbpaq+W9ekdzOXDP
 9nDPGf9kDyZz1m2lbDGliQCV6fOwVgGO+FD4dpxyFU6YYX46fiVikIAO1
 E0+uByRh0UJJDrJnr6Vl7wkEYmrv/7hEO6AiirsxsdLi56t20GrBfXMCa
 /QGbr0rCHzInmtKD4uiXlIZBejeUJn5PKjQtNt+ZV8Gk8SzQfT3PT+ejG
 u1EZUWw0naw5l+OP5N4Th3pozuubhz0+oBZQO18In5n2+yUlYCu0Lul1P
 9fSyPVcoi1X+hvuwEmJk+Ju2U2oNBABQm37lQvdW6JX0wcHe0RoV6HUsu A==;
X-CSE-ConnectionGUID: Kd7F8AYARHiOACDaNY9kEQ==
X-CSE-MsgGUID: w6HJUO76ROagDV5Y701vVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2333654"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2333654"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 06:18:50 -0800
X-CSE-ConnectionGUID: 1ZGYPlpdTGeHRH7wIJcwzQ==
X-CSE-MsgGUID: IFxTAzUmSkCWExqxVyzmQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6318676"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.160])
 ([10.245.245.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 06:18:49 -0800
Message-ID: <feeefb3c-d4e0-46ee-b35b-9b77e5ef7093@intel.com>
Date: Tue, 3 Nov 2026 14:18:47 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/intel/xe_create: add create-big-bo-interruptible
 subtest
To: Jan Maslak <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20261021142240.826942-2-matthew.auld@intel.com>
 <aunqkZXCF9AsnnH6@ART-DEV-395>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <aunqkZXCF9AsnnH6@ART-DEV-395>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03/11/2026 14:07, Jan Maslak wrote:
> On Wed, Oct 21, 2026 at 03:22:41PM +0100, Matthew Auld wrote:
>> Add a create-big-bo-interruptible subtest that wraps large BO
>> creation and CPU mmap verification in igt_fork_signal_helper() /
>> igt_stop_signal_helper() (500 Hz continuous signal interruption) and
>> also supports non-VRAM (iGPU) platforms using a 512 MiB system memory BO
>> (roughly matching bug report).
>>
>> When a large BO creation overflows the migration batchbuffer
>> suballocation pool (gt->usm.bb_pool), an interruptible suballocator wait
>> aborts xe_migrate_clear() with -ERESTARTSYS, synchronously drains all
>> in-flight migration jobs at err_sync:, and restarts
>> DRM_IOCTL_XE_GEM_CREATE from scratch, livelocking under periodic signals
>> such as Xorg's SIGALRM smart-scheduler.
>>
>> Current working theory for user reported bug. Running this locally, it
>> does indeed run forever on BMG. Patching the intr wait on kernel side,
>> fixes it.
>>
>> Assisted-by: LLM
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9644
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
> 
> Hi Matthew,
> 
>> 	bo_handle = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt),
>> 				 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> 
> Could we use xe_bo_create_caching() with DRM_XE_GEM_CPU_CACHING_WC
> here? The existing VRAM case already defaults to WC.
> For system-memory BOs, xe_bo_create() defaults to WB, which skips CCS
> clearing on LNL, leading to the test passing without calling
> xe_migrate_clear(). WC exposes the stall on LNL on an unfixed kernel.

Yeah, very good point. Will fix.

> 
>> +	if (interruptible)
>> +		igt_stop_signal_helper();
> 
> If a dynamic case fails before this, the helper stays running and the
> next GT aborts at assert(!proc->running). I reproduced this with an
> injected failure. Could we move the helper start/stop into setup/teardown
> fixtures around a group containing this subtest? Then create_big() no
> longer needs the interruptible parameter either.
> 
> With WC and fixture cleanup, I compared the results with and without
> the kernel fix [1]: three 60 s external timeouts without the fix,
> versus three passes with it. I've included a suggested diff.

Ok, I will incorporate this. Thanks for taking a look.

> 
> Thanks,
> Jan
> 
> [1] https://patchwork.freedesktop.org/patch/764504/

