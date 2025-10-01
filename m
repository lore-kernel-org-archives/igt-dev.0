Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97693CAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 09:30:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4379A10E356;
	Wed,  1 Oct 2025 09:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mQd55s3x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF4310E356
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 09:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759311028; x=1790847028;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=EQVdO2m2zYIrHC/NumkdAeKKYJ/R1MjWIKlYf791QsE=;
 b=mQd55s3xT4NaLER1hEQC1rFmI8xgoCY9OrtZysjzYCJC/XUvygTpgnpR
 BqIi5TF1DjSJqWH//mqEde4QvjDJG8wxp15BM0HNvl8oggv0U+7tDtFpq
 o0rDItcWTXwo7Pgunwy1NqKhkSWIt+9ZW/tZBVnFu+eIf/EtLh/CoA1r7
 sQh8vjhKXe8XDgXLJoOHeYJBNTQMnPL877295B+RiRXoxfWa5BcnIeYjY
 jAW0ltKDRskgJHEZesDdN47IZtfOYYougS2b/7b4puU4tJU/D1CajzROZ
 GTGDj9hWm8HOJGYHwFnmkkudWEhgIqXwCpQHr394njvJ01s8ir+OnDMfN Q==;
X-CSE-ConnectionGUID: QE/3cXttRxaqRkUXaa6Qdw==
X-CSE-MsgGUID: cd7+W/kpQkyeloeEheGrYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="64199449"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="64199449"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 02:30:27 -0700
X-CSE-ConnectionGUID: jYmbrjxeS52jqWhRgWFJ0w==
X-CSE-MsgGUID: K2PuTtiGS+6LjEsWmd9q9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="184011715"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.37])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 02:30:26 -0700
Date: Wed, 1 Oct 2025 11:30:23 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: Re: [PATCH v8 i-g-t 7/9] tests/xe_eudebug_online: Introduce proper
 sync for closing debugger fd in set-breakpoint-sigint-debugger
Message-ID: <x3bv7xq5ajgnamqcyrdvtlwky4e4x2zeqrfxgjkexoip43b6r4@yczdjyrw72ze>
References: <20250930104209.22462-1-dominik.karol.piatkowski@intel.com>
 <20250930104209.22462-8-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250930104209.22462-8-dominik.karol.piatkowski@intel.com>
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

On Tue, Sep 30, 2025 at 12:42:07PM +0200, Dominik Karol Piątkowski wrote:
> Wait for the SIGINT handling to complete before closing the debugger fd
> to avoid tripping over asserts.
> 
> Introduce handled_sigint to help with coordination outside the debugger
> loop.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  lib/xe/xe_eudebug.c             | 5 ++++-
>  lib/xe/xe_eudebug.h             | 1 +
>  tests/intel/xe_eudebug_online.c | 3 +++
>  3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 0db9eaaeb..1282e2918 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -1106,8 +1106,10 @@ static void *debugger_worker_loop(void *data)
>  	do {
>  		p.fd = d->fd;
>  		ret = poll(&p, 1, timeout_ms);
> -		if (d->received_sigint)
> +		if (d->received_sigint) {
> +			d->handled_sigint = true;
>  			pthread_exit(NULL);
> +		}
>  
>  		if (ret == -1) {
>  			if (errno == EINTR)
> @@ -1182,6 +1184,7 @@ xe_eudebug_debugger_create(int master_fd, uint64_t flags, void *data)
>  	d->master_fd = master_fd;
>  	d->ptr = data;
>  	d->received_sigint = false;
> +	d->handled_sigint = false;
>  
>  	return d;
>  }
> diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
> index dd5c5e20a..7c7a01471 100644
> --- a/lib/xe/xe_eudebug.h
> +++ b/lib/xe/xe_eudebug.h
> @@ -45,6 +45,7 @@ struct xe_eudebug_debugger {
>  	enum xe_eudebug_debugger_worker_state worker_state;
>  
>  	bool received_sigint;
> +	bool handled_sigint;
>  
>  	int p_client[2];
>  };
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 30e661b13..e388ea888 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -1601,6 +1601,9 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
>  			sigints_during_test++;
>  
>  		xe_eudebug_debugger_kill(s->debugger, SIGINT);
> +		/* Don't close debugger fd before it dies */
> +		while (!s->debugger->handled_sigint)
> +			usleep(1000);
>  		close(s->debugger->fd);
>  
>  		igt_assert_eq(READ_ONCE(s->debugger->worker_state), DEBUGGER_WORKER_ACTIVE);
> -- 
> 2.34.1
> 
