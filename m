Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB682C5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 15:37:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FAB10E62A;
	Tue,  3 Jun 2025 15:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AGM7JkP4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E55010E8E4
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 15:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748965030; x=1780501030;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vdHCNhiUOVXF1djqE8np5QueYdEnDynTNyvSdQ/lw70=;
 b=AGM7JkP4Oj5xHVYNRREilojHhc1GRuED/vqOh73lc2jayH7VHkhWGGL6
 A+v3BX/UaYM+zHCsHIxiyQhqc7X8cj+3M5jdh1nxSpptVsQKP3tt9pxsB
 sE2vvpEpHsIw2OtKHymJLXC+WWdLqnNE5tkqSeYeISzsVGvtfY5/53e4D
 d53HJQI0X8bIADc2oCkjv2BEh9zc9ewnsDTCLfdJI7jdhlMQHjruw9ovO
 x/q5g9FmSn+W8OfJyKxuhYWNWIdS6U6derL11nUt2Yas9cmE3XYOxpK8x
 JEk5kP9He6HbVynAHO5kKZoG4xx8mVe/hVB9M9FQwr+5NrJoiQh1kGCFZ g==;
X-CSE-ConnectionGUID: kpT6HWHATPGx+F/FpxFtOw==
X-CSE-MsgGUID: sVJxxVVQQ8eU7zixPjVLJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="61277711"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="61277711"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 08:37:10 -0700
X-CSE-ConnectionGUID: on+b5krlTN+ssvLQQ55U0w==
X-CSE-MsgGUID: 5CqqUEwzQbOqWc4+j7NgAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="150180500"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 08:37:08 -0700
Date: Tue, 3 Jun 2025 17:37:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v12 02/11] lib/intel_batchbuffer: handle base64
 encode fail
Message-ID: <20250603153705.656gx7vopxgeqa4d@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250602192515.95309-1-jeevaka.badrappan@intel.com>
 <20250602192515.95309-3-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250602192515.95309-3-jeevaka.badrappan@intel.com>
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

Hi Jeevaka,
On 2025-06-02 at 19:25:06 +0000, Jeevaka Prabu Badrappan wrote:
> g_base64_encode function returns a newly allocated string containing
> the Base64 encoded data. Upon failure, null can be returned.
> 
> When g_base64_encode function fails, exit the calling function.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>  lib/intel_batchbuffer.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index f7569e768..03ce65ded 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -2348,6 +2348,9 @@ static void intel_bb_dump_base64(struct intel_bb *ibb, int linelen)
>  
>  	igt_info("--- bb ---\n");
>  	pos = str = g_base64_encode((const guchar *) ibb->batch, ibb->size);
> +	if (str == NULL)

Use here:
	if (!str)

With this fixed you can keep my r-b.

Regards,
Kamil

> +		return;
> +
>  	outsize = strlen(str);
>  
>  	while (outsize > 0) {
> -- 
> 2.49.0
> 
