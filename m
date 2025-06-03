Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7737C5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 15:20:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF83110E668;
	Tue,  3 Jun 2025 15:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B/E+8lMd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FC610E668
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 15:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748964040; x=1780500040;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uJVGO5Ted8caxott5pdrzc0il62pC2huaMJ3G5qajLk=;
 b=B/E+8lMdef0dDJa6UuMdgq3P+c0EZA8+oN3CbGTvlE0sRYugPDzISTlw
 nut0yGH2ceMFvY6YzkNFCoZ15+N7LKQ8yF7kLVkViNeK3/7LoF3r6O1sa
 yCYZSxWfGQRD9owx6RzasCi7pIzU88UwOLzvEFjfAXGjcOhr524rqtSR2
 7N10+gfkJuwWiCR4+BYYvLjtLVyVD4rXda6NwZqv0pd3aOlkWX4DVwYsz
 FSytjwuUs9AbomSKqifIiniM/q5XQG7mg/HSMtgpecNmW3RivXuEz13FM
 gMuYcOgLx0TUfE0XXSeLi5gQeWBDMJ42Cf7hirPCcRgaEZWAnavPCWQ0o A==;
X-CSE-ConnectionGUID: IsanDTe5S6Cri8ljgV0sNw==
X-CSE-MsgGUID: agDH+G1JQRaTqffu4fk5bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="54804838"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="54804838"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 08:20:40 -0700
X-CSE-ConnectionGUID: vxJH5UstRkmlTMEPGWW9vw==
X-CSE-MsgGUID: puns9ZEeR7iCd0+trLWxqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="148738286"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 08:20:38 -0700
Date: Tue, 3 Jun 2025 17:20:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v12 03/11] tests/intel/*_intel_bb: handle base64
 encode fail
Message-ID: <20250603152036.r66pwhrychh5s2gc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250602192515.95309-1-jeevaka.badrappan@intel.com>
 <20250602192515.95309-4-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250602192515.95309-4-jeevaka.badrappan@intel.com>
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
On 2025-06-02 at 19:25:07 +0000, Jeevaka Prabu Badrappan wrote:
> g_base64_encode function returns a newly allocated string containing
> the Base64 encoded data. Upon failure, null can be returned.
> 
> When g_base64_encode function fails, exit the calling function with
> error.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/api_intel_bb.c | 3 +++
>  tests/intel/xe_intel_bb.c  | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
> index 4a1c9be91..13b1091d8 100644
> --- a/tests/intel/api_intel_bb.c
> +++ b/tests/intel/api_intel_bb.c
> @@ -944,6 +944,9 @@ static int dump_base64(const char *name, struct intel_buf *buf)
>  
>  		igt_info("--- %s ---\n", name);
>  		pos = str = g_base64_encode(destbuf, outsize);
> +		if (str == NULL)
> +			return -1;
> +
>  		outsize = strlen(str);
>  		while (pos) {
>  			char line[LINELEN + 1];
> diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
> index d8bd7b519..ef95b4a2a 100644
> --- a/tests/intel/xe_intel_bb.c
> +++ b/tests/intel/xe_intel_bb.c
> @@ -595,6 +595,9 @@ static int dump_base64(const char *name, struct intel_buf *buf)
>  
>  		igt_info("--- %s ---\n", name);
>  		pos = str = g_base64_encode(destbuf, outsize);
> +		if (str == NULL)
> +			return -1;
> +
>  		outsize = strlen(str);
>  		while (pos) {
>  			char line[LINELEN + 1];
> -- 
> 2.49.0
> 
