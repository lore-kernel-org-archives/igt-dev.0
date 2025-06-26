Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3FCC7EE33
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 11:30:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2D010E279;
	Thu, 26 Jun 2025 11:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VDT14xRh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F5310E279
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 11:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750937400; x=1782473400;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IcpSnLWiwPz0yCNJhEnKUTyA0v489Y52YTI5YjhxIEM=;
 b=VDT14xRhCRM9aGYEFQM5+FTmbepGbc10QuvPLEoWDZweKw7Lex4qKEXw
 jwd4dJEBEfRo0CdJSDl0BAgK73oYoylHPN/HVM/wFUdFqw66PkMBt3XYK
 MHJ/wzGa3kkdfbQ/GBDK7iJ4VW2Cug8D4QRJaF6v75hLE85+XHWC/f7Ke
 mVbd7pV0IPeta0gFOU+Js4g+Bybt+0x2MJnaQwYLGiCD3YhymiF89Wy9V
 ALNIu/Fp7KQxVAiHs0zv4uNNr0np0UDbwIgQJTFCn6xd66scXktiZpNqu
 N+d7//M0Po/f3TpKtm+l71NZXH5taVIlMfWLgZyK1rAvTI0BTBdUD60qy A==;
X-CSE-ConnectionGUID: mhBprDxfQvWwk548oHWW6Q==
X-CSE-MsgGUID: eLF7kTpPSXKqi6xDlw7WUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53364429"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="53364429"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 04:29:59 -0700
X-CSE-ConnectionGUID: z8zQPRguTT2Vi+SXVmQXJA==
X-CSE-MsgGUID: 8198+q5dQJquOR7M7nkUHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="152122716"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:29:57 -0700
Date: Thu, 26 Jun 2025 13:29:38 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: himanshu.girotra@intel.com
Cc: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 jari.tahvanainen@intel.com, kamil.konieczny@intel.com,
 katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/xe_live_ktest: Adjust test documentation
Message-ID: <20250626112938.gsvazsr3ncuj3bjs@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 himanshu.girotra@intel.com, igt-dev@lists.freedesktop.org,
 ramadevi.gandi@intel.com, jari.tahvanainen@intel.com,
 kamil.konieczny@intel.com, katarzyna.piecielska@intel.com
References: <20250626104401.19370-1-himanshu.girotra@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250626104401.19370-1-himanshu.girotra@intel.com>
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

Hi Himanshu,
On 2025-06-26 at 16:14:01 +0530, himanshu.girotra@intel.com wrote:
> From: Himanshu Girotra <himanshu.girotra@intel.com>
> 
> Change mega feature and sub-category for xe_eudebug subtest so that it
> can be fetched under EUdebug Feature.
> 
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Ramadevi Gandi <ramadevi.gandi@intel.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> ---
>  tests/intel/xe_live_ktest.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
> index 164c90501..d64d6a12c 100644
> --- a/tests/intel/xe_live_ktest.c
> +++ b/tests/intel/xe_live_ktest.c
> @@ -40,6 +40,8 @@
>   * Description:
>   *	Kernel dynamic selftests to check eudebug functionality.
>   * Functionality: eudebug kunit
> + * Mega feature: EUdebug
> + * Sub-category: kunit eudebug

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>   */
>  
>  static const char *live_tests[] = {
> -- 
> 2.40.0
> 
