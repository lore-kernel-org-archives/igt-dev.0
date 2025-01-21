Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBEFC02182
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 16:02:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441E3886A4;
	Tue, 21 Jan 2025 16:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oax2YL7V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A26B10E5F4
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 16:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737475356; x=1769011356;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=E2okFvTSpc4Pf2RrMm4vTL/00tYvaGTZlUuPbc0/DLU=;
 b=Oax2YL7VfMYf1HKZPn5/bzBkaAYNomrxt0vC4f4wvxrg1sWx+Br9vZDq
 sjXGmZOVSO55cBgiseTfoip4+j75QgK17trAtsznqP7p3xgoN7ODfju0y
 WPyJdJEKZwYptbSc4/+A3N5PJVcYb6z0sVras2LUh9Ztat0qMKJPObc8C
 aT7zZz+MXsmb0KQYOj6K78YAfq7ojQUxR/sZp13D8RcunrgjbsMBkQ5uK
 F4FzYOeaKDgMhV5T1hgKtqFmRBnjhGVKkDg6hdd+jAylOYUiS5VeFDaPq
 DPWXH/P9ZXL7S7nlA9wzAUDbnRY7ygnC1nLrIIPnx/yJjePuz0jO48W9e A==;
X-CSE-ConnectionGUID: qHifU4uhQpCHVd4E3vx+kg==
X-CSE-MsgGUID: CrhHA9jCTg6n9DHgPGrumw==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="38142325"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="38142325"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 08:02:36 -0800
X-CSE-ConnectionGUID: YMuV1Cf9S5eY/qgURaCZuQ==
X-CSE-MsgGUID: e4aLEmWmSYWEfyMKFiwrcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="106958910"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 08:02:34 -0800
Date: Tue, 21 Jan 2025 17:02:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org, jordan.l.justen@intel.com,
 christoph.manszewski@intel.com
Subject: Re: [PATCH i-g-t 1/2] lib/xe_eudebug: Fix 32b compilation
 warnings/errors
Message-ID: <20250121160218.hxuho66oyigwxo5r@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 igt-dev@lists.freedesktop.org, jordan.l.justen@intel.com,
 christoph.manszewski@intel.com
References: <20250120131338.131713-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250120131338.131713-1-dominik.grzegorzek@intel.com>
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

Hi Dominik,
On 2025-01-20 at 14:13:37 +0100, Dominik Grzegorzek wrote:
> Fix instances casting using proper from_user_pointer macro and
> correct all debug prints which were causing compilation warnings
> on 32b archs.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/xe/xe_eudebug.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 24062e399..19bec2d25 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -324,14 +324,14 @@ static uint64_t __wait_token(int pipe[2], const uint64_t token, int timeout_ms)
>  
>  	ret = safe_pipe_read(pipe, &in, sizeof(in), timeout_ms);
>  	igt_assert_f(ret > 0,
> -		     "Pipe read timeout waiting for token '%s:(%ld)'\n",
> +		     "Pipe read timeout waiting for token '%s:(%" PRId64 ")'\n",
>  		     token_to_str(token), token);
>  
>  	igt_assert_eq(in, token);
>  
>  	ret = safe_pipe_read(pipe, &in, sizeof(in), timeout_ms);
>  	igt_assert_f(ret > 0,
> -		     "Pipe read timeout waiting for token value '%s:(%ld)'\n",
> +		     "Pipe read timeout waiting for token value '%s:(%" PRId64 ")'\n",
>  		     token_to_str(token), token);
>  
>  	return in;
> @@ -828,7 +828,8 @@ xe_eudebug_event_log_find_seqno(struct xe_eudebug_event_log *l, uint64_t seqno)
>  	xe_eudebug_for_each_event(e, l) {
>  		if (e->seqno == seqno) {
>  			if (found) {
> -				igt_warn("Found multiple events with the same seqno %lu\n", seqno);
> +				igt_warn("Found multiple events with the same seqno %" PRIu64 "\n",
> +					 seqno);
>  				xe_eudebug_event_log_print(l, false);
>  				igt_assert(!found);
>  			}
> @@ -1238,7 +1239,7 @@ int xe_eudebug_debugger_attach(struct xe_eudebug_debugger *d,
>  	d->p_client[0] = c->p_in[0];
>  	d->p_client[1] = c->p_in[1];
>  
> -	igt_debug("debugger connected to %lu\n", d->target_pid);
> +	igt_debug("debugger connected to %" PRIu64 "\n", d->target_pid);
>  
>  	return 0;
>  }
> @@ -1391,11 +1392,11 @@ void xe_eudebug_debugger_wait_stage(struct xe_eudebug_session *s, uint64_t stage
>  {
>  	u64 stage_in;
>  
> -	igt_debug("debugger xe client fd: %d pausing for stage %lu\n", s->debugger->master_fd,
> +	igt_debug("debugger xe client fd: %d pausing for stage %" PRIu64 "\n", s->debugger->master_fd,
>  		  stage);
>  
>  	stage_in = wait_from_client(s->client, DEBUGGER_STAGE);
> -	igt_debug("debugger xe client fd: %d stage %lu, expected %lu, stage\n",
> +	igt_debug("debugger xe client fd: %d stage %" PRIu64 ", expected %" PRIu64 ", stage\n",
>  		  s->debugger->master_fd, stage_in, stage);
>  
>  	igt_assert_eq(stage_in, stage);
> @@ -1584,14 +1585,15 @@ void xe_eudebug_client_wait_stage(struct xe_eudebug_client *c, uint64_t stage)
>  	u64 stage_in;
>  
>  	if (c->done) {
> -		igt_warn("client: %d already done before %lu\n", c->pid, stage);
> +		igt_warn("client: %d already done before %" PRIu64 "\n", c->pid, stage);
>  		return;
>  	}
>  
> -	igt_debug("client: %d pausing for stage %lu\n", c->pid, stage);
> +	igt_debug("client: %d pausing for stage %" PRIu64 "\n", c->pid, stage);
>  
>  	stage_in = client_wait_token(c, CLIENT_STAGE);
> -	igt_debug("client: %d stage %lu, expected %lu, stage\n", c->pid, stage_in, stage);
> +	igt_debug("client: %d stage %" PRIu64 ", expected %" PRIu64 ", stage\n", c->pid,
> +		  stage_in, stage);
>  
>  	igt_assert_eq(stage_in, stage);
>  }
> @@ -1949,7 +1951,7 @@ uint32_t xe_eudebug_client_exec_queue_create(struct xe_eudebug_client *c, int fd
>  	igt_assert(c);
>  	igt_assert(create);
>  
> -	instances = (struct drm_xe_engine_class_instance *)(create->instances);
> +	instances = from_user_pointer(create->instances);
>  	class = instances[0].engine_class;
>  
>  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, create), 0);
> @@ -1988,6 +1990,7 @@ uint32_t xe_eudebug_client_exec_queue_create(struct xe_eudebug_client *c, int fd
>  void xe_eudebug_client_exec_queue_destroy(struct xe_eudebug_client *c, int fd,
>  					  struct drm_xe_exec_queue_create *create)
>  {
> +	struct drm_xe_engine_class_instance *instances;
>  	struct drm_xe_exec_queue_destroy destroy = {};
>  	struct drm_xe_ext_set_property *ext;
>  	bool send = false;
> @@ -1997,7 +2000,8 @@ void xe_eudebug_client_exec_queue_destroy(struct xe_eudebug_client *c, int fd,
>  	igt_assert(create);
>  
>  	destroy.exec_queue_id = create->exec_queue_id;
> -	class = ((struct drm_xe_engine_class_instance *)(create->instances))[0].engine_class;
> +	instances = from_user_pointer(create->instances);
> +	class = instances[0].engine_class;
>  
>  	for (ext = from_user_pointer(create->extensions); ext;
>  	     ext = from_user_pointer(ext->base.next_extension))
> -- 
> 2.34.1
> 
