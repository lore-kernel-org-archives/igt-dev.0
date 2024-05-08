Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0990C19F4F
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 16:24:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9994711284B;
	Wed,  8 May 2024 16:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a2IT66k6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65C811284B
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 16:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715185449; x=1746721449;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=39szhGFQ0VFG0W2jeXo6GUHYk1g6Kc0BHh6CtF5oeaw=;
 b=a2IT66k6ZFUUFoDNH4etkVnH9ILZwz0t4tAP+jHPt6JksvTLzCk9o14e
 nAVQaXwHZepX4WrPfOGGfbVqycrcNY5R3jUMpvn2gj+TSnsEk5VG2f7zU
 lpJ1OjuZc1YjX50D/UKQ0N3UDMTRjL/ZmZD9eBFSdILXVk4IUamMANDc3
 TwEUbLiG2D1Z6L825KFEeGok6Xnf07wI0KHFylu/woJbjbdR6w6wAEQN8
 ocbiE1Q68g5EbXXOWVctxsBnapTSdNowCGtElLu8qnk5hsbB2GLVEM94M
 2vO52v7EAk8L906O5BA3J4KrLH2piCs8J4W2aeUVbtAybp6T0xUZ2Pus8 A==;
X-CSE-ConnectionGUID: KxS7GQ3CTgSX9PtALYXnGQ==
X-CSE-MsgGUID: NBAc0w20TVCHYOxvLjMHNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11188583"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="11188583"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 09:24:08 -0700
X-CSE-ConnectionGUID: Tzg5xwXeRxSC7IS+olm01A==
X-CSE-MsgGUID: MlnSlxQ/SKysajfgNYIV4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33498822"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 09:24:06 -0700
Date: Wed, 8 May 2024 18:23:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>, saurabhg.gupta@intel.com,
 brian.welty@intel.com, tomasz.mistat@intel.com, himanshu.girotra@intel.com
Subject: Re: [PATCH i-g-t 1/1] lib/xe/xe_query: Wait for xe_supports_faults
Message-ID: <20240508162349.4v4zpogce7ru6qh7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 saurabhg.gupta@intel.com, brian.welty@intel.com,
 tomasz.mistat@intel.com, himanshu.girotra@intel.com
References: <20240503193714.1967850-1-jonathan.cavitt@intel.com>
 <20240503193714.1967850-2-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240503193714.1967850-2-jonathan.cavitt@intel.com>
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

Hi Jonathan,
On 2024-05-03 at 12:37:14 -0700, Jonathan Cavitt wrote:
> It's possible for xe_supports_faults to return false if the system is
> busy with multiple running tests.  This is because the check looks for
> all active VMs and searches for VMs that do not have faults enabled,
> returning false if any exist.  Recently, this check has been changed to
> return EBUSY when the check fails in this way, so wait for up to ten
> seconds for all the active VMs to flush out before proceeding.
> 
> Suggested-by: Brian Welty <brian.welty@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  lib/xe/xe_query.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 6df8f42649..5458c73417 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -314,8 +314,13 @@ bool xe_supports_faults(int fd)
>  		.flags = DRM_XE_VM_CREATE_FLAG_LR_MODE |
>  			 DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
>  	};
> -
> -	supports_faults = !igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
> +	struct timespec tv = {};
> +	int result, timeout;
> +	do {
> +		result = igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
> +		supports_faults = !result;
> +		timeout = igt_seconds_elapsed(&tv);
> +	} while (result == -EBUSY && timeout < 10);
-------------------------------- ^^^^^^^^^^^^

Waiting any number of seconds in library function is way too much,
imho this is ok in test itself, not on lib.

Regards,
Kamil

>  
>  	if (supports_faults)
>  		xe_vm_destroy(fd, create.vm_id);
> -- 
> 2.25.1
> 
