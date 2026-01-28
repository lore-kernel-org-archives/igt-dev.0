Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A64D3F098
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 16:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E846810E1D6;
	Wed, 28 Jan 2026 16:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A8TQW5fY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B52410E1D6
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 16:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769618888; x=1801154888;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FqTV4cQxgVfflH/tJaph1QeHrisyU4fsqT232vWbcws=;
 b=A8TQW5fYKFVO1UW7aRONf8oFOhMgzVeCMD/eo3MLRZQdWGjPz6zymX3A
 yuSXSn/s3infjpu2IKRdeB7WZod75jR/bXEdfjahVCSD9SokR2oAVaY4/
 BMagP7MrtFD4SLUE74tZVz0opVWskHHXqugOob9vIHvK5j3EluhwyKr76
 ZBAOLS6a22O9+394C/GMlfZ1NJ5CS7Dntvzwh5xQcmF8ZD6mo1O8xYLFz
 IP7pBMxGgFdQ5DujPCvF0FnrOvdAo00tfS1IOBamo1UX2CIYw3CAF0Ht0
 tioK3dqMKRVJA/RorXRd6+iRKMH39fFE3wtv/wmbgwGlAibaemVvk8AIy Q==;
X-CSE-ConnectionGUID: l8cOtL7gS6Gglxj7lzyhng==
X-CSE-MsgGUID: FYu8VKe5TS6hDjpXs4vTIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="96299242"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="96299242"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:48:08 -0800
X-CSE-ConnectionGUID: u4y2VQkOTCmKWvlA/Bhjxg==
X-CSE-MsgGUID: Bl5VRuxTSu2wbSlyOyJdHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208336236"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.245.24])
 ([10.245.245.24])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:48:06 -0800
Message-ID: <ab8f36d7-e1ca-4702-b1cb-370510317652@intel.com>
Date: Wed, 28 Jan 2026 16:48:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/intel/xe_exec_system_allocator: Fix UC PAT index
 test timeout
To: Jia Yao <jia.yao@intel.com>, igt-dev@lists.freedesktop.org
Cc: Alex Zuo <alex.zuo@intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>,
 Xin Wang <x.wang@intel.com>
References: <20260127215102.19951-1-jia.yao@intel.com>
 <20260128003021.33204-1-jia.yao@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260128003021.33204-1-jia.yao@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 28/01/2026 00:30, Jia Yao wrote:
> The pat-index-madvise-pat-idx-uc-single-vma subtest was intermittently
> failing with 'Timer expired' error when waiting for user fence.
> 
> Root cause:
> When the PAT index is set to UC (Uncached), the batch buffer written

Uncached on the GPU is not necessarily an issue, since it can be 
coherent, depending on the exact PAT index.  I assume you mean the 
coh_mode here, which is coh_none?

> by CPU may not be visible to GPU due to CPU cache not being flushed
> to memory. The GPU would then read stale or corrupted batch commands,
> causing the execution to hang and the user fence to never be signaled.

At a glance that sounds more like KMD bug and potential security issue. 
For normal buffers we disallow CPU cached memory and incoherent GPU 
access via the KMD. Otherwise the user can potentially bypass sensitive 
CPU page zeroing (potentially cache dirty on CPU) as done by core kernel 
when you ask for GFP_ZERO, for example.

Also I assume this issue is for IGPU? Do you have some more info?

> 
> Fix:
> - Use igt_clflush_range() to explicitly flush the batch buffer from
>    CPU cache to memory before GPU execution
> - Initialize clflush support in igt_fixture with igt_setup_clflush()
> 
> v2 (Xin Wang):
> - Move igt_setup_clflush() from igt_fixture to just before
>    xe_for_each_engine loop for UC PAT index subtests. This ensures
>    clflush is only initialized when actually needed, and allows
>    proper skip if clflush is not supported on the platform.
> 
> This ensures that when using UC PAT index, the GPU can read the
> correct batch buffer data from memory.
> 
> Cc: Alex Zuo <alex.zuo@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Xin Wang <x.wang@intel.com>
> Signed-off-by: Jia Yao <jia.yao@intel.com>
> ---
>   tests/intel/xe_exec_system_allocator.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 412ad0384..6970b8201 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -1692,6 +1692,10 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   			prefetch_ns += (end - start);
>   		}
>   
> +		if (pat_value == intel_get_pat_idx_uc ||
> +			pat_value == intel_get_pat_idx_uc_comp)
> +			igt_clflush_range(data[idx].batch, sizeof(data[idx].batch));
> +
>   		sync[0].addr = exec_ufence ? to_user_pointer(exec_ufence) :
>   			addr + (char *)&data[idx].exec_sync - (char *)data;
>   
> @@ -2633,6 +2637,11 @@ int igt_main()
>   			     !xe_has_vram(fd)) {
>   				igt_skip("Skipping compression-related PAT index\n");
>   			}
> +			if (strstr(s->name, "madvise-pat-idx-uc-")) {
> +				igt_require_f(igt_setup_clflush(),
> +							  "CLFLUSH support required for UC PAT index test\n");
> +			}
> +
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s->flags, s->fn);
>   		}

