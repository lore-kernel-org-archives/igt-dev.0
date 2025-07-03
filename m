Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C528BC77B7C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 08:41:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639C610E169;
	Thu,  3 Jul 2025 08:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iCIiby4o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183BF10E169
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 08:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751532065; x=1783068065;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=xDnfsTqfjruV2tf3nHjBfLbiSXIbhPEbEWW8xnC+BSU=;
 b=iCIiby4o2qPWlbflEtynVAod4bYa/iTJETOclMmEblobaMEcxXL4hzuX
 iXBVfIV/oMlSIjzmwhzV9kWE67t/RfNP0/p5sudDVFdZavsBejs8eO+XC
 ZP/0qAhB1yJitkHt+ZtUQdCIE/oaMkkoeWd06ZjC0qk/7hnY6Suvki82O
 C2bk0IxYGlZquEXhbeJzkLhuMVWxusiFEJZ+PAdg/jfjJZlpe0Kf8uljs
 SFjM9R5zrW52gtR4OPcEVyamPDHYIweHez5OzVhuSAztXW0DI8Dn1dlp/
 l7WK6lJLzPaB04Qzh/NgWyBbWjvRprsYxt45LbJ6nFtDbPxF0etGBx85+ w==;
X-CSE-ConnectionGUID: lYFNFWCcQPedH2smIJIEJg==
X-CSE-MsgGUID: ibQPF1tIRs2Po6kG1fHIQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53567886"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="53567886"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 01:41:04 -0700
X-CSE-ConnectionGUID: HUAmfxzOQP+Eq75W7SzP5g==
X-CSE-MsgGUID: OsnSrX9rTJOk0Q4uIwFbMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="153943831"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO [10.245.244.155])
 ([10.245.244.155])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 01:41:02 -0700
Message-ID: <ad2e0a39-066f-49b5-881a-bb4184561930@intel.com>
Date: Thu, 3 Jul 2025 09:41:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] lib/intel_mocs: fix wb mocs entry for MTL
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250703063032.553963-5-zbigniew.kempczynski@intel.com>
 <20250703063032.553963-6-zbigniew.kempczynski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250703063032.553963-6-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 03/07/2025 07:30, Zbigniew Kempczyński wrote:
> Likely there was some typo when adding mocs for MTL. Valid
> entry for WB is equal 1, not 10.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   lib/intel_mocs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
> index 5698c6cca0..e0c33c31c0 100644
> --- a/lib/intel_mocs.c
> +++ b/lib/intel_mocs.c
> @@ -29,7 +29,7 @@ static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
>   		mocs->defer_to_pat_index = 0;
>   	} else if (IS_METEORLAKE(devid)) {
>   		mocs->uc_index = 5;
> -		mocs->wb_index = 10;
> +		mocs->wb_index = 1;
>   	} else if (IS_DG2(devid)) {
>   		mocs->uc_index = 1;
>   		mocs->wb_index = 3;

