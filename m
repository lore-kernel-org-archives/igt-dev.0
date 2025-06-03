Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FD8C5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 15:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF48E10E05D;
	Tue,  3 Jun 2025 15:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VZ5l65ij";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2544B10E05D
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 15:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748963671; x=1780499671;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uG46nNg7Pa2LyqJA8KjM6tfrahVos3W7fOpOKAlZ9c4=;
 b=VZ5l65ijlzP1pUCGlfyKzvbozPNVBClHrgBizRDP6zgRPwpCR8ZTuXw8
 7euADDO929XfFL7jX4LqZL7XtVzaGad+QrQ8pkRaST7ak/T1/Iv8GkOkW
 n5KFqy0soqvwT0UosWIaVPMunHhvQwWiI5G+/qMRWw9XBrjiqdYDNtciJ
 q6q2lCJnczmpNdftcygrGE4QT9zNIobu+mPq9C9pqH1GRVNRQnCOmULsN
 l36N+Mz2aOWUdTPAdHlASPRzjPkeVz0rQvAMBTh7a5hi3zRFxctMb35Ak
 76xC+BwuxmCVjvhMRvzWyIvkeQ9THjwGWUS+3y3nSiHiTbweCpwz/vsSQ Q==;
X-CSE-ConnectionGUID: E5/rqV80RmayVvTTKoXtQw==
X-CSE-MsgGUID: bfIsSFQ8S5+ocHA8rOjplA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="54803324"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="54803324"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 08:14:31 -0700
X-CSE-ConnectionGUID: xGcpaS6+STmYI5elNqWFrg==
X-CSE-MsgGUID: Ein89UaGSrKakS2G/q7iHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="148736673"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 08:14:28 -0700
Date: Tue, 3 Jun 2025 17:14:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v12 02/11] lib/intel_batchbuffer: handle base64
 encode fail
Message-ID: <20250603151408.64zpxbrfh52u7p6j@kamilkon-DESK.igk.intel.com>
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

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

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
> +		return;
> +
>  	outsize = strlen(str);
>  
>  	while (outsize > 0) {
> -- 
> 2.49.0
> 
