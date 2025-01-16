Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844A1C02180
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 11:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C7810E58E;
	Thu, 16 Jan 2025 11:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gNpkcFcX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DEC10E58E
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 11:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737028330; x=1768564330;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1or1aNgX2u0SFE3gCh64dAhIatmyanBQlJ95Tq9GvpM=;
 b=gNpkcFcXbq3xtXgXetwX0eBFgkQn5H85kpms0t5wueWzM6/uQBn62a5F
 ifcFIKT/XkWiHs9LuV/gNmizaLSLkOUQRMTi22c8AvyqEQ56eaCnRsMeQ
 Up5JlWS95JKJx3VwS/yMi7CUi7Yabyv4/NAbi7+UAJabRCyuCeaeMShka
 VgPfPAUjC29pGuGigxlPc1uOTJKoTSnz5JyaeIe51a4vK+Ps6G+51Q4Wh
 zYMakhNsRf+mCUAFqEWm6v/Y4eSgZ8FE1HO/XXKXTxy6eZUcojlxugYBm
 +MiM85tlQ9TJymYbqipubqiURdQWU0SXvWvgsxA9xeYpeYVqRLTC75b0h w==;
X-CSE-ConnectionGUID: KS8Aw+y7SNmDRj/2eUsJlw==
X-CSE-MsgGUID: CSxUQFs3QxyuG2YuOvJgWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="40221517"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="40221517"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 03:52:09 -0800
X-CSE-ConnectionGUID: 6L3Gnk7LS0KNXfum/bzvyg==
X-CSE-MsgGUID: vYMD36JzReOqL9hk9XF3ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="128727837"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 03:52:07 -0800
Date: Thu, 16 Jan 2025 12:51:50 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sunil Khatri <sunil.khatri@amd.com>
Cc: igt-dev@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Strawbridge@rtg-sunil-navi33.amd.com, Michael <Michael.Strawbridge@amd.com>
Subject: Re: [PATCH 3/8] lib/amdgpu: Add user mode queue support in ring
 context
Message-ID: <20250116115150.ma35lvddby7647it@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sunil Khatri <sunil.khatri@amd.com>, igt-dev@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Strawbridge@rtg-sunil-navi33.amd.com,
 Michael <Michael.Strawbridge@amd.com>
References: <20250116065211.1882469-1-sunil.khatri@amd.com>
 <20250116065211.1882469-4-sunil.khatri@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250116065211.1882469-4-sunil.khatri@amd.com>
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

Hi Sunil,
On 2025-01-16 at 12:22:06 +0530, Sunil Khatri wrote:
> Add the meta data to support the user mode command
> submission in the ring_context.
> 
> User mode command submission methods needs these
> resources to be initialized and to create/destroy queues.
> 
> Also once we have the queue created the queue id is
> used to submit the work load to the h/w.
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> Reviewed-by: Vitaly Prosyak vitaly.prosyak@amd.com>

Why do you send it here with r-b already added?
Was is sent in some previous series and got r-b on mailinglist?
I do not see any info about this in cover letter.

Before merging please address build failures:

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1346611 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69437776):
  ../lib/amdgpu/amd_user_queue.c: In function ‘amdgpu_user_queue_destroy’:
  ../lib/amdgpu/amd_user_queue.c:183:6: error: implicit declaration of function ‘amdgpu_free_userqueue’; did you mean ‘amdgpu_open_devices’? [-Werror=implicit-function-declaration]
  r = amdgpu_free_userqueue(device_handle, ctxt->queue_id);
      ^~~~~~~~~~~~~~~~~~~~~
        amdgpu_open_devices
  ../lib/amdgpu/amd_user_queue.c:183:6: warning: nested extern declaration of ‘amdgpu_free_userqueue’ [-Wnested-externs]
  ../lib/amdgpu/amd_user_queue.c: In function ‘amdgpu_user_queue_create’:
  ../lib/amdgpu/amd_user_queue.c:387:7: error: implicit declaration of function ‘amdgpu_create_userqueue’; did you mean ‘amdgpu_cs_create_semaphore’? [-Werror=implicit-function-declaration]
  r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_GFX,
      ^~~~~~~~~~~~~~~~~~~~~~~
             amdgpu_cs_create_semaphore
    ../lib/amdgpu/amd_user_queue.c:387:7: warning: nested extern declaration of ‘amdgpu_create_userqueue’ [-Wnested-externs]
      cc1: some warnings being treated as errors
   ninja: build stopped: subcommand failed.
    section_end:1737012393:step_script
    section_start:1737012393:cleanup_file_variables
    Cleaning up project directory and file based variables
   section_end:1737012394:cleanup_file_variables
     ERROR: Job failed: exit code 1

Regards,
Kamil

> ---
>  lib/amdgpu/amd_ip_blocks.h | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index dc4d87151..9d110d402 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
> @@ -86,6 +86,14 @@ struct dynamic_test{
>  	bool support_sdma;
>  };
>  
> +struct amdgpu_userq_bo {
> +	amdgpu_bo_handle handle;
> +	amdgpu_va_handle va_handle;
> +	uint64_t mc_addr;
> +	uint64_t size;
> +	void *ptr;
> +};
> +
>  #define for_each_test(t, T) for(typeof(*T) *t = T; t->name; t++)
>  
>  /* set during execution */
> @@ -141,6 +149,29 @@ struct amdgpu_ring_context {
>  	struct amdgpu_cs_ib_info ib_info;     /* amdgpu_bo_list_create */
>  	struct amdgpu_cs_request ibs_request; /* amdgpu_cs_query_fence_status */
>  	struct amdgpu_cs_err_codes err_codes;
> +
> +	/* User queue resources */
> +	struct  amdgpu_userq_bo queue;
> +	struct  amdgpu_userq_bo shadow;
> +	struct  amdgpu_userq_bo doorbell;
> +	struct  amdgpu_userq_bo rptr;
> +	struct  amdgpu_userq_bo wptr;
> +	struct  amdgpu_userq_bo csa;
> +	struct  amdgpu_userq_bo eop;
> +
> +	uint32_t *queue_cpu;
> +	uint64_t *wptr_cpu;
> +	uint64_t *doorbell_cpu;
> +
> +	uint32_t db_handle;
> +	uint32_t queue_id;
> +	uint32_t npkt;
> +
> +	uint32_t timeline_syncobj_handle;
> +	uint64_t point;
> +	bool user_queue;
> +
> +	struct drm_amdgpu_info_device dev_info;
>  };
>  
>  
> -- 
> 2.34.1
> 
