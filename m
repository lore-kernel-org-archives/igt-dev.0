Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9BFC5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 14:08:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364AD88FBD;
	Tue,  3 Jun 2025 14:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MlCYKkmq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D083088FBD
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 14:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748959718; x=1780495718;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UI9zZyPATekrwPxPOSqEZsIsDAqXJ/+MaYZDS0xApXs=;
 b=MlCYKkmqHhpT2KbIt5CPrcWycQUeHZgf7LCm/n34OKEef5GDq1w+XPfQ
 koieyAMnW1DYFppPK10hTHCQeiWknCOmRJnz14zmtGJwr5tIOPerYxhq2
 MBArVqsXh3unyTHKrNxtH+tIMFOAgMWHL4PL15+tZe/42zbDsEdIuO7Xn
 RMzVocpzPQeRYshS3nRm8vrtKGOrfq5T2dm21WVaXUcag6DZ6jO6oPx+H
 ZiuyV+A6YMFZv3o21B1HndC0ZakqvyHI5/Le3BC+8ES+1GD10W/9IlcRA
 HB0xLGiB7AFElACrMnuCLFSjzxo0nxT9PdPc/TV5+HZth1sD1xLVD7qfF Q==;
X-CSE-ConnectionGUID: FQtvEvjpTSiJAEDe06Es8g==
X-CSE-MsgGUID: keDZwyJYRgCFJYvuwo3SxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="68433358"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="68433358"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 07:08:37 -0700
X-CSE-ConnectionGUID: gmj8k64sSQu1//pYiep6ig==
X-CSE-MsgGUID: +waJ57b8SJK5OwG0sP+qwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="182042427"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 07:08:37 -0700
Date: Tue, 3 Jun 2025 16:08:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v5 9/9] tests/intel/xe_eudebug: fix print
 formatting for 32-bit compilation
Message-ID: <20250603140834.xyu4usd4qtdieevo@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250603111107.3170529-1-jan.sokolowski@intel.com>
 <20250603111107.3170529-10-jan.sokolowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250603111107.3170529-10-jan.sokolowski@intel.com>
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
On 2025-06-03 at 11:11:07 +0000, Jan Sokolowski wrote:
> Compiling on other architectures than x86-64 causes a lot
> of print formatting warnings.
> 
> Fix formatting by using proper formatters, eg. PRIu64.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>

Same here, it got r-b in v4 so
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

> ---
>  tests/intel/xe_eudebug.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> index 60700a8bb..bdf73c4e9 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -1156,7 +1156,7 @@ static void *discovery_race_thread(void *data)
>  
>  			xe_eudebug_debugger_stop_worker(s->debugger, 1);
>  
> -			igt_debug("Resources discovered: %lu\n", s->debugger->event_count);
> +			igt_debug("Resources discovered: %" PRIu64 "\n", s->debugger->event_count);
>  			if (!s->client->done) {
>  				xe_eudebug_for_each_event(e, s->debugger->log) {
>  					if (e->type == DRM_XE_EUDEBUG_EVENT_OPEN) {
> @@ -2669,7 +2669,7 @@ static void vma_ufence_trigger(struct xe_eudebug_debugger *d,
>  				    ef->vm_bind_ref_seqno);
>  		xe_eudebug_assert_f(d, eb->flags & DRM_XE_EUDEBUG_EVENT_VM_BIND_FLAG_UFENCE,
>  				    "vm bind event does not have ufence: %s\n", event_str);
> -		igt_debug("vm bind ufence event received with ref %lld, addr 0x%lx, range 0x%lx\n",
> +		igt_debug("vm bind ufence event received with ref %lld, addr 0x%" PRIu64 ", range 0x%" PRIu64 "\n",
>  			  ef->vm_bind_ref_seqno,
>  			  addr,
>  			  range);
> -- 
> 2.34.1
> 
