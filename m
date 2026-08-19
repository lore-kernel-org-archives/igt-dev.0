Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A16C5DF6D
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 10:30:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210F210E465;
	Wed, 19 Aug 2026 10:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b5GkRW3i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42FC310EDA7
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 10:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787135415; x=1818671415;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SeIAwAvtQ2J91fMKyRygjM0965c/TFmzOruJKA7BaQM=;
 b=b5GkRW3i9Jx5Mo41Egc33dDWc2AQFBwhMPI6VIeppkkb+OnAln6Z19yg
 6OnAM2pnCUCl3wVjEQk+ZUr3qXm8ppX7IjgVK8O3VHknBGg6r5upf+LEQ
 /6BeDFeMdNB1k/ba657YA4Y7FvOIDXXsmQYxMcwUA0bNhi/pRJQkVixss
 f0fekYIAu45KCTP+IYU7u6FRPyl7/zE8+aRvT/0z6dUTnNG/5gSIjS0A8
 mUoz8XLUNPdpDAz3BQxRhu16KDccyUtIXWxIWbFtHjOG8jXU7MW/eaplB
 xvetLLU3KGL9CdiMOlUnTwluBZV1dG7dzT58RUpQYsUGCedTRujJczLMg A==;
X-CSE-ConnectionGUID: CxJ4C/wqT/unk2AdE467iA==
X-CSE-MsgGUID: 4mxfxLKSRtuYxxnY/g6xkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87767615"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87767615"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 03:30:14 -0700
X-CSE-ConnectionGUID: Y2WQ/X0eTxWF0pHqQ81aoA==
X-CSE-MsgGUID: HPvpbIQwT5m71Q3XFA+FQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="269793783"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 03:30:13 -0700
Date: Wed, 19 Aug 2026 12:30:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Varun Gupta <varun.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com,
 andrzej.hajda@intel.com
Subject: Re: [PATCH i-g-t v3 1/2] tests/intel/xe_prefetch_fault: refactor
 test to accept shader function pointer
Message-ID: <20260819103011.vjuqvptpc6coig2q@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Varun Gupta <varun.gupta@intel.com>, igt-dev@lists.freedesktop.org,
 priyanka.dandamudi@intel.com, andrzej.hajda@intel.com
References: <20260818171239.277897-4-varun.gupta@intel.com>
 <20260818171239.277897-5-varun.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260818171239.277897-5-varun.gupta@intel.com>
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

Hi Varun,
On 2026-08-18 at 22:42:41 +0530, Varun Gupta wrote:
> Parameterize test_prefetch_fault() to accept a shader getter function
> pointer instead of hardcoding get_prefetch_shader(). This enables reuse
> of the same test logic with different shader configurations (e.g., L2
> prefetch fault shaders) without duplicating the test function.
> 
> No functional change for existing subtests.
> 
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>

Did you changed anything here from v1? If not, then r-b from
Priyanka should be added. No need for sending series again, it
could be applied at merge time.

Regards,
Kamil

> ---
>  tests/intel/xe_prefetch_fault.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/intel/xe_prefetch_fault.c b/tests/intel/xe_prefetch_fault.c
> index d3b5aff47..e86cd68d9 100644
> --- a/tests/intel/xe_prefetch_fault.c
> +++ b/tests/intel/xe_prefetch_fault.c
> @@ -117,9 +117,11 @@ static struct intel_bb *xe_bb_create_on_offset(int fd, uint32_t exec_queue, uint
>  	return ibb;
>  }
>  
> +typedef struct gpgpu_shader *(*get_shader_fn)(int fd);
> +
>  static struct gpgpu_shader *get_prefetch_shader(int fd)
>  {
> -	static struct gpgpu_shader *shader;
> +	struct gpgpu_shader *shader;
>  
>  	shader = gpgpu_shader_create(fd);
>  	gpgpu_shader__prefetch_fault(shader, xe_canonical_va(fd, PREFETCH_ADDR));
> @@ -130,14 +132,17 @@ static struct gpgpu_shader *get_prefetch_shader(int fd)
>  
>  /**
>   * SUBTEST: prefetch-fault
> - * Description: Validate prefetch fault and hit-under-miss behavior
> + * Description: Validate L1 prefetch fault and hit-under-miss behavior with
> + *		L1 cached, L2 cached cache policy (fault source: LSC)
>   * Run type: FULL
>   *
>   * SUBTEST: prefetch-fault-svm
> - * Description: Validate prefetch fault and hit-under-miss behavior in SVM mode
> + * Description: Validate L1 prefetch fault and hit-under-miss behavior in SVM
> + *		mode with L1 cached, L2 cached cache policy (fault source: LSC)
>   * Run type: FULL
>   */
> -static void test_prefetch_fault(int fd, struct drm_xe_engine_class_instance *hwe, bool svm)
> +static void test_prefetch_fault(int fd, struct drm_xe_engine_class_instance *hwe,
> +				bool svm, get_shader_fn get_shader)
>  {
>  	uint64_t bb_offset = BB_OFFSET;
>  	/*
> @@ -191,7 +196,7 @@ static void test_prefetch_fault(int fd, struct drm_xe_engine_class_instance *hwe
>  	ibb = xe_bb_create_on_offset(fd, exec_queue_id, vm, bb_offset, bb_size);
>  	intel_bb_set_lr_mode(ibb, true);
>  
> -	shader = get_prefetch_shader(fd);
> +	shader = get_shader(fd);
>  	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, shader, NULL, 0, 0);
>  	gpgpu_shader_destroy(shader);
>  	intel_bb_sync(ibb);
> @@ -225,7 +230,7 @@ static void test_prefetch_fault(int fd, struct drm_xe_engine_class_instance *hwe
>  	ibb = xe_bb_create_on_offset(fd, exec_queue_id, vm, bb_offset2, bb_size);
>  	intel_bb_set_lr_mode(ibb, true);
>  
> -	shader = get_prefetch_shader(fd);
> +	shader = get_shader(fd);
>  	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, shader, NULL, 0, 0);
>  	gpgpu_shader_destroy(shader);
>  	intel_bb_sync(ibb);
> @@ -271,7 +276,8 @@ int igt_main()
>  			    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
>  				igt_dynamic_f("%s%d", xe_engine_class_string(hwe->engine_class),
>  					      hwe->engine_instance)
> -					test_prefetch_fault(fd, hwe, false);
> +					test_prefetch_fault(fd, hwe, false,
> +							    get_prefetch_shader);
>  			}
>  		}
>  	}
> @@ -284,7 +290,8 @@ int igt_main()
>  			    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
>  				igt_dynamic_f("%s%d", xe_engine_class_string(hwe->engine_class),
>  					      hwe->engine_instance)
> -					test_prefetch_fault(fd, hwe, true);
> +					test_prefetch_fault(fd, hwe, true,
> +							    get_prefetch_shader);
>  			}
>  		}
>  	}
> -- 
> 2.43.0
> 
