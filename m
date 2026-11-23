Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E305A606A321
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 11:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nrQMBrxv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8039710ED07;
	Mon, 23 Nov 2026 11:15:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0803210E0E7
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 11:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795432451; x=1826968451;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5JynJZGv2qujAcCCACF2qkRoqt71k6jfeiBojiCY95I=;
 b=nrQMBrxv7Hne3a7M1ScBCvzDhdnpT+FvaWvWcJsMhd2JUa2yIKDWO6LA
 KDJZRFqJm46N64K+MdueeMv2373oA1IOjlYTqIU4QrdmsFICwe+ywxliY
 90mnHu/UE7XWstW/BGAIqcn6IFf4mMA62FPJomVHKqJu9oTNP86YVnhu6
 OfWrMY/j10uIFQvs4olhtPJqogAP/X+ICsQrQO02+DIp3SSV7SaqvnQrp
 Cqu7iQChnvlmKNr5SMIaLdmJbC12TZEcDuKlrrdYIyKBViitixlxxjLbY
 6+1x2ggTo/AO7waISusRXuf03Dh97fc+/HBPDYDE0GU0JsnXTIUy/f4GN g==;
X-CSE-ConnectionGUID: yfOs+s4iTRe0/6xzVZu52w==
X-CSE-MsgGUID: dxADviT4R6C/hKRuU6EdVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4322976"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4322976"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 03:14:11 -0800
X-CSE-ConnectionGUID: TNs9YFwsSturdakJX8J5NA==
X-CSE-MsgGUID: UzaOoQ0rTDS9oI2z677zGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11608222"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 03:14:09 -0800
Date: Mon, 23 Nov 2026 12:14:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Avandhica S R <avandhica.s.r@intel.com>
Cc: igt-dev@lists.freedesktop.org, sowmiya.s@intel.com
Subject: Re: [PATCH i-g-t v2 1/2] Fix plane count and shuffle bugs
Message-ID: <ta3dcsk5pcngfmo7mp6gi7ppf5w43h5ktfu4zk7styijksbrey@wl4s6c66q6vz>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Avandhica S R <avandhica.s.r@intel.com>, igt-dev@lists.freedesktop.org,
 sowmiya.s@intel.com
References: <20261123101055.583218-1-avandhica.s.r@intel.com>
 <20261123101055.583218-2-avandhica.s.r@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261123101055.583218-2-avandhica.s.r@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Avandhica,
On 2026-11-23 at 15:40:54 +0530, Avandhica S R wrote:

this is not a review, only reminder to use prefixes for
tests in subject, so here instead of

[PATCH i-g-t v2 1/2] Fix plane count and shuffle bugs

better:

[PATCH i-g-t v2 1/2] tests/kms_plane_multiple: Fix plane count and shuffle bugs

> Use the CRTC's actual plane count for memory allocations,
> fixed the shuffle randomization range and used try_commit
> instead of commit for unsupported plane combinations so
> that the test skips rather than asserting.Also reference
> buffer and plane buffer are kept separate to avoid over
> writing reference framebuffers and fixed fb cleanups.

Maybe move that change describe after 'Also...' into
a separeate patch?

Regards,
Kamil

> 
> Signed-off-by: Avandhica S R <avandhica.s.r@intel.com>
> ---
>  tests/kms_plane_multiple.c | 81 ++++++++++++++++++++++----------------
>  1 file changed, 47 insertions(+), 34 deletions(-)
> 
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index 0d338eeb5..9db3e891d 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -88,7 +88,7 @@ typedef struct {
>  	igt_crc_t ref_crc1, ref_crc2;
>  	igt_pipe_crc_t *pipe_crc1, *pipe_crc2;
>  	igt_plane_t **plane1, **plane2;
> -	struct igt_fb *fb1, *fb2;
> +	struct igt_fb *fb1, *fb2, ref_fb1, ref_fb2;
>  } data_t;
>  
[cut]
