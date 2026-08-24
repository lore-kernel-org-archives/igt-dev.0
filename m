Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A222C5DF94
	for <igt-dev@archiver.kernel.org>; Mon, 24 Aug 2026 13:15:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D56910E12F;
	Mon, 24 Aug 2026 13:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eU9gM+xs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD6110E12F
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Aug 2026 13:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787577286; x=1819113286;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Qd/sibUy3zQLZPDk2If7JQqtjtkgHWnhEt1NImLhdV4=;
 b=eU9gM+xs/3CR4pNpvpqbJWL7yJ1ctUV/x+UatH9leTmJOa6BXT6XIBxR
 JfdUJT0tsWB4zVhP+1lvr/8Hs4AOEwbrklZJPiP5yjXRWFg+/jDtTAx03
 rHT0kD1lqxpuaEDOfw19ZkumHl7nWUY69Ro12qHkfPdD+4fbo6rqMZ0je
 hgXTI8V/YJz2vtkvIOpmyzTWKLUwGtz5DtgGvCltO4AOQUyYOEv7eHWho
 xfvEX/FZ6rfQkrMN+aK9RGf0Kt8LGKq9fu+9/HKVLSIuPsmjuqBiyBqS7
 ek0TEJRC8Hx9B8s6sTBkPrs3wuLTJ/kFDg41z3M/GX0VWPCEnGgZ/ohI/ A==;
X-CSE-ConnectionGUID: ey1cXjZSQy2/oDhGtPw+9Q==
X-CSE-MsgGUID: 8wEfqarSTnKY6zynULaDDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="98703336"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="98703336"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 06:14:46 -0700
X-CSE-ConnectionGUID: h5m6bXqoTVWUFt97Y6J1VQ==
X-CSE-MsgGUID: H+3be+sATN+1velS2uIK9A==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 06:14:44 -0700
Date: Mon, 24 Aug 2026 15:14:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, himanshu.girotra@intel.com
Subject: Re: [PATCH] tests/intel/xe_debug: fix NULL dereference in GT
 register-save-restore debugfs check
Message-ID: <20260824131418.3opf6q4sqo4pn7vy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 himanshu.girotra@intel.com
References: <20260824105249.503725-1-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260824105249.503725-1-nishit.sharma@intel.com>
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

Hi nishit.sharma,
On 2026-08-24 at 10:52:49 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> This fixes a critical bug in the Xe debugfs validation test for the
> GT register-save-restore debugfs node. The test opened the debugfs file
> but checked the return value with igt_require(debugfs_fd) instead of
> validating debugfs_fd >= 0. Since igt_debugfs_gt_open() returns -1
> on failure, the require was incorrectly treated as true, and the
> code then called fdopen(-1, "r"), leading to a NULL FILE* and a crash.

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_debugfs.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index 5c045b04f..6b2cf2f37 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -581,8 +581,12 @@ static void check_gt_reg_sr(int fd, int gt)
>  
>  	debugfs_fd = igt_debugfs_gt_open(fd, gt, "register-save-restore-check",
>  					 O_RDONLY);
> -	igt_require(debugfs_fd);
> +	igt_require(debugfs_fd >= 0);
>  	file = fdopen(debugfs_fd, "r");
> +	if (!file) {
> +		close(debugfs_fd);
> +		igt_skip("Failed to fdopen register-save-restore-check\n");
> +	}
>  	while (fgets(buf, sizeof(buf), file) != NULL) {
>  		unsigned long offset = strtoul(buf, NULL, 16);
>  		bool ok = false;
> -- 
> 2.34.1
> 
