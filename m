Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12452C369B2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 13:01:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1C710E59C;
	Mon, 14 Apr 2025 13:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YHkY7pnw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C86410E59C
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 13:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744635708; x=1776171708;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Wi74ChaFD0aZzWpi8UPCfUy5dnI8osRY574C1/M21dc=;
 b=YHkY7pnwpUFjcIjPPsQbu7pnsp9dknRattJy8cxfgCdhh2iWpTqcJ+MM
 GZkizs6l2fqYDd8Xewqay+LgGhObCxcqa/CutCG7gzWaLgUyZYLcIkldZ
 XmCoX3BIuJf5SyfQ+E7Ukt0MBSihm161zksK3nK9w1vANqsQBsGXI0t4y
 NsRVKIK/5p8OfyAKgHQ2GxWXtodN1Ejcb2Yu5KUWMhBhMu0dGXk6nxPTb
 xo30lQRBH2ii6GdU/ummPJzH74BKY8eczOVrTZG808ZpLCjfCfVAAsqvo
 lyPbnD06VqSpWX0Qa1UrH4nu86Kq4fv54EUS5txKISowNWaK6zBehAFK8 w==;
X-CSE-ConnectionGUID: tn3XCx67QWC+3gSRpiRlKA==
X-CSE-MsgGUID: dCMG1Hm9Q6uqpYz1cpeCoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="49759952"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="49759952"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 06:01:47 -0700
X-CSE-ConnectionGUID: +d0kNlFsRKyPl7WLF8WlNw==
X-CSE-MsgGUID: Y6WNMAbfTJSvs76s6lxtpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="130668204"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.206])
 ([10.245.246.206])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 06:01:46 -0700
Message-ID: <fcf1d277-8eb8-4d8b-a580-747f492bd58b@intel.com>
Date: Mon, 14 Apr 2025 15:01:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] tests/xe_eudebug_online: Implement faultable
 variations of some testcases
To: Jan Sokolowski <jan.sokolowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
References: <20250401090651.298768-1-jan.sokolowski@intel.com>
 <20250401090651.298768-3-jan.sokolowski@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250401090651.298768-3-jan.sokolowski@intel.com>
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

Hi Jan,

On 1.04.2025 11:06, Jan Sokolowski wrote:
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> 
> Implement fault variation of tests, which are accessing the memory via
> debugfd, by creating a vm in FAULT_MODE.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> ---
>   tests/intel/xe_eudebug_online.c | 26 +++++++++++++++++++++++++-
>   1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 84ba748c1..a29e5a086 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -38,6 +38,7 @@
>   #define TARGET_IN_VRAM			(1 << 13)
>   #define SHADER_PAGEFAULT_READ		(1 << 14)
>   #define SHADER_PAGEFAULT_WRITE		(1 << 15)
> +#define FAULTABLE_VM			(1 << 16)
>   #define TRIGGER_UFENCE_SET_BREAKPOINT	(1 << 24)
>   #define TRIGGER_RESUME_SINGLE_WALK	(1 << 25)
>   #define TRIGGER_RESUME_PARALLEL_WALK	(1 << 26)
> @@ -1098,7 +1099,8 @@ static void run_online_client(struct xe_eudebug_client *c)
>   							   2 * sizeof(**metadata), metadata[1]);
>   
>   	vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE;
> -	vm_flags |= c->flags & SHADER_PAGEFAULT ? DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
> +	vm_flags |= c->flags & (SHADER_PAGEFAULT | FAULTABLE_VM) ?
> +			DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
>   
>   	create.vm_id = xe_eudebug_client_vm_create(c, fd, vm_flags, 0);
>   
> @@ -1481,6 +1483,12 @@ static void test_basic_online(int fd, struct drm_xe_engine_class_instance *hwe,
>    * SUBTEST: set-breakpoint
>    * Description:
>    *	Checks for attention after setting a dynamic breakpoint in the ufence event.
> + *
> + * SUBTEST: set-breakpoint-faultable
> + * Sub-category: EUdebug online

The sub-category is common for all subtests.

With that addressed,
Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Regards,
Christoph

> + * Functionality: dynamic breakpoint with FAULTABLE_VM
> + * Description:
> + *	Faultable variation of test set-breakpoint.
>    */
>   
>   static void test_set_breakpoint_online(int fd, struct drm_xe_engine_class_instance *hwe, int flags)
> @@ -1488,6 +1496,8 @@ static void test_set_breakpoint_online(int fd, struct drm_xe_engine_class_instan
>   	struct xe_eudebug_session *s;
>   	struct online_debug_data *data;
>   
> +	igt_require(!(flags & FAULTABLE_VM) || !xe_supports_faults(fd));
> +
>   	data = online_debug_data_create(hwe);
>   	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
>   	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
> @@ -1739,6 +1749,12 @@ static void test_reset_with_attention_online(int fd, struct drm_xe_engine_class_
>    *	interrupts all threads, once attention event come it sets breakpoint on
>    *	the very next instruction and resumes stopped threads back. It expects
>    *	that every thread hits the breakpoint.
> + *
> + * SUBTEST: interrupt-all-set-breakpoint-faultable
> + * Sub-category: EUdebug online
> + * Functionality: dynamic breakpoint with FAULTABLE_VM
> + * Description:
> + *	Faultable variation of test interrupt-all-set-breakpoint.
>    */
>   static void test_interrupt_all(int fd, struct drm_xe_engine_class_instance *hwe, int flags)
>   {
> @@ -1746,6 +1762,8 @@ static void test_interrupt_all(int fd, struct drm_xe_engine_class_instance *hwe,
>   	struct online_debug_data *data;
>   	uint32_t val;
>   
> +	igt_require(!(flags & FAULTABLE_VM) || !xe_supports_faults(fd));
> +
>   	data = online_debug_data_create(hwe);
>   	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
>   
> @@ -2521,6 +2539,9 @@ igt_main
>   	test_gt_render_or_compute("set-breakpoint", fd, hwe)
>   		test_set_breakpoint_online(fd, hwe, SHADER_NOP | TRIGGER_UFENCE_SET_BREAKPOINT);
>   
> +	test_gt_render_or_compute("set-breakpoint-faultable", fd, hwe)
> +		test_set_breakpoint_online(fd, hwe, SHADER_NOP | TRIGGER_UFENCE_SET_BREAKPOINT | FAULTABLE_VM);
> +
>   	test_gt_render_or_compute("set-breakpoint-sigint-debugger", fd, hwe)
>   		test_set_breakpoint_online_sigint_debugger(fd, hwe,
>   							   SHADER_NOP | TRIGGER_UFENCE_SET_BREAKPOINT);
> @@ -2563,6 +2584,9 @@ igt_main
>   	test_gt_render_or_compute("interrupt-all-set-breakpoint", fd, hwe)
>   		test_interrupt_all(fd, hwe, SHADER_LOOP | TRIGGER_RESUME_SET_BP);
>   
> +	test_gt_render_or_compute("interrupt-all-set-breakpoint-faultable", fd, hwe)
> +		test_interrupt_all(fd, hwe, SHADER_LOOP | TRIGGER_RESUME_SET_BP | FAULTABLE_VM);
> +
>   	test_gt_render_or_compute("tdctl-parameters", fd, hwe)
>   		test_tdctl_parameters(fd, hwe, SHADER_LOOP);
>   

