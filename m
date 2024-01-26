Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817B0C47422
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jan 2024 06:20:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E34810F206;
	Fri, 26 Jan 2024 06:20:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAA210F206
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jan 2024 06:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706250019; x=1737786019;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZJ1MX2s6ktZOX5QMz/hG3PRX1FRBp8BwV7901UoB+tE=;
 b=MWxFZwW14unbWAT26LEmJSDru7qLm1KjJNXk+kLny0tln9OZzsq6n1fI
 rsqyuZM/Ir1WL4JP2Jf8ie672rUH89Uka2Hd7qgwa03Xv2ueUN4gm3eQf
 BsB3RDimnOCG8SgGEshaoO0+ozSq0LyNaO/ENVByuT8S8G8BBm659Jj83
 OPYlAiDZmYxHaSsVj/xO5lNEB3wrxLPTpM0d3TobUV/g296EZ5K2Kcdgi
 OGDr1kh3j0eX5hER8L211TBEEC11oP04JZYSvCO0vOuJ16TQuDNEHRyTa
 eb76q0NMUYilrG8Nr1f/b6kiQqnaNIXMELq9QB6r6/eTzSWwj77Ts7REC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2267136"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2267136"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 22:20:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="736592208"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="736592208"
Received: from unknown (HELO localhost) ([10.245.100.152])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 22:20:13 -0800
Date: Fri, 26 Jan 2024 07:20:10 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH i-g-t v2 2/7] lib/xe_spin: account for prefetch
Message-ID: <20240126062010.6bcwhx363jojspyl@zkempczy-mobl2>
References: <20240125105646.313561-1-matthew.auld@intel.com>
 <20240125105646.313561-2-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240125105646.313561-2-matthew.auld@intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Thu, Jan 25, 2024 at 10:56:40AM +0000, Matthew Auld wrote:
> Xe2 expects an extra page after the batch to avoid prefetch hitting an
> invalid page. Not doing so can result in CAT errors.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/xe/xe_spin.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 243e97047..2c531e85e 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -186,7 +186,7 @@ void xe_spin_end(struct xe_spin *spin)
>  igt_spin_t *
>  xe_spin_create(int fd, const struct igt_spin_factory *opt)
>  {
> -	size_t bo_size = xe_get_default_alignment(fd);
> +	size_t bo_size = xe_bb_size(fd, SZ_4K);
>  	uint64_t ahnd = opt->ahnd, addr;
>  	struct igt_spin *spin;
>  	struct xe_spin *xe_spin;
> @@ -285,7 +285,7 @@ void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
>  		  struct xe_cork *cork)
>  {
>  	uint64_t addr = xe_get_default_alignment(fd);
> -	size_t bo_size = xe_get_default_alignment(fd);
> +	size_t bo_size = xe_bb_size(fd, SZ_4K);
>  	uint32_t vm, bo, exec_queue, syncobj;
>  	struct xe_spin *spin;
>  	struct drm_xe_sync sync = {
> -- 
> 2.43.0
>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
