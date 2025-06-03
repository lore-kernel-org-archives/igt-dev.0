Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD78C5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 15:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C8210E6F9;
	Tue,  3 Jun 2025 15:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0On7RNZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E966C10E746
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 15:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748964973; x=1780500973;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ae98tFlEawDhGqRZ3EAEay/T867rEceMWuWYyYrnzFk=;
 b=B0On7RNZBuT1qCJqNq5vZ9BFzsyZpucSQHW4lVUSl4ludGFQwg0DKJ2P
 WvWStysuFKceRS+qtvqnIObeM84WkgkdDlc7w6rGLhCAIeqiMg6ZYQU3Y
 5oowf/RZitwiWCMDyDTrn8cQ2TZAcIPLfnuTCC4vp50FUGWvE+6ETPkRs
 PRuFrx4Kdjoj7q5Utver4VTtO4TB3kR8tbIFawDtkZzDsY6qonVCVr/pf
 SM0ApWpng4pHCNWWwFzxFk4LXMES6znbG0/ai72jdZJ0xB59xTbtlsXG5
 k8BtZ39a3B1tf7F+dzyh8vnBSGtd2RpS+WguwH7QwKhSWPw7fZFguGB/Q A==;
X-CSE-ConnectionGUID: IuDQYHiBRaG7GR7SxrHTvA==
X-CSE-MsgGUID: Ixg4Vic3RVu4Ho5RQ5ff2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="68445727"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="68445727"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 08:36:11 -0700
X-CSE-ConnectionGUID: YBDxUc4AT1+vunuXPcigYQ==
X-CSE-MsgGUID: HTiIPvoWRTu5cmRVJu9yVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="144873156"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 08:36:08 -0700
Date: Tue, 3 Jun 2025 17:36:04 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v12 03/11] tests/intel/*_intel_bb: handle base64
 encode fail
Message-ID: <20250603153604.fy22un2o5pwvmtnz@kamilkon-DESK.igk.intel.com>
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

I forgot that checkpatch complained here, use just:
		if (!str)

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

Same here, use:
		if (!str)

With this fixed you can keep my r-b.

Regards,
Kamil

> +			return -1;
> +
>  		outsize = strlen(str);
>  		while (pos) {
>  			char line[LINELEN + 1];
> -- 
> 2.49.0
> 
