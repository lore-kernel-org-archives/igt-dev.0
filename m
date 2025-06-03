Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED82C5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 19:08:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B3E10E02E;
	Tue,  3 Jun 2025 19:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EFqZ2j/l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1F810E02E
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 19:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748977688; x=1780513688;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=N5urajyl6Yj6z5yyK/CCxHXe13TVBsfWjUli/BOyMjM=;
 b=EFqZ2j/lVUNtX4yty775WhGwJhm4mfQibaSIaUG7pBqlh/mQmFVrdvdr
 j2aroZYHwMfnvpjNx3ZDS0J7WpOf5N5wHsxMzDr+ImF8mCViInUqq8Tt3
 xsr+nEw9Iw+xcblZOjV6dAucO9VXoxJpIOroeYfQA14BWNMx6zkdp+mKy
 0flVC10nj5fjtatYnMWVuBWVJVff0ESs/qaFITy1gRRBnP8y8WHBc5Pm9
 VSL5YG9/1Na3A8xAG1Q54pARYI1wrjaWuLBUB9VBfsqDtQOmFy/CjSa8b
 Ve1GP6EhE/vmIH7vbeyHHWM52uGHLg+9NGrpbA/7PHDZ7si7wdn+VN/p7 Q==;
X-CSE-ConnectionGUID: PyJZ4SL9RsqtjsbjX1QAOg==
X-CSE-MsgGUID: K/CbH5VcTsypceVM7W5i+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="61700875"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="61700875"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:08:04 -0700
X-CSE-ConnectionGUID: NdUrKOlRR8GBJlkpcy2QGA==
X-CSE-MsgGUID: rfb81FZ6Q92M3Tgo6Vc8UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="150245678"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 12:08:03 -0700
Date: Tue, 3 Jun 2025 21:07:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v13 03/11] tests/intel/*_intel_bb: handle base64
 encode fail
Message-ID: <20250603190745.suoehzyhs63eic2r@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250603163715.70774-1-jeevaka.badrappan@intel.com>
 <20250603163715.70774-4-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250603163715.70774-4-jeevaka.badrappan@intel.com>
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
On 2025-06-03 at 16:37:06 +0000, Jeevaka Prabu Badrappan wrote:
> g_base64_encode function returns a newly allocated string containing
> the Base64 encoded data. Upon failure, null can be returned.
> 
> When g_base64_encode function fails, exit the calling function with
> error.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/api_intel_bb.c | 3 +++
>  tests/intel/xe_intel_bb.c  | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
> index 4a1c9be91..63e171e16 100644
> --- a/tests/intel/api_intel_bb.c
> +++ b/tests/intel/api_intel_bb.c
> @@ -944,6 +944,9 @@ static int dump_base64(const char *name, struct intel_buf *buf)
>  
>  		igt_info("--- %s ---\n", name);
>  		pos = str = g_base64_encode(destbuf, outsize);
> +		if (!str)
> +			return -1;
> +
>  		outsize = strlen(str);

Sorry, I was thinking it was correct while it is not, remove above
and replace these line with:
  		outsize = str ? strlen(str) : 0;

>  		while (pos) {
>  			char line[LINELEN + 1];
> diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
> index d8bd7b519..c673eb11e 100644
> --- a/tests/intel/xe_intel_bb.c
> +++ b/tests/intel/xe_intel_bb.c
> @@ -595,6 +595,9 @@ static int dump_base64(const char *name, struct intel_buf *buf)
>  
>  		igt_info("--- %s ---\n", name);
>  		pos = str = g_base64_encode(destbuf, outsize);
> +		if (!str)
> +			return -1;
> +
>  		outsize = strlen(str);

Same here.

Regards,
Kamil

>  		while (pos) {
>  			char line[LINELEN + 1];
> -- 
> 2.49.0
> 
