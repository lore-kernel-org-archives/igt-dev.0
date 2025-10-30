Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C68CCF9F0
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 15:13:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C70810E9D1;
	Thu, 30 Oct 2025 15:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zzbic+0q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6518310E9D1
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 15:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761837227; x=1793373227;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aDysCVHOqwuP2bad286UfVxVJRlEi7P6FxbC4/EFmRw=;
 b=Zzbic+0qvmyIprYshNyCsr2I2UhwZS9FfEI4cK29oXSV3eMp04hqydX0
 TXooONtaoGOI5tq1Nz+t39AbleLLjv9YSIhJ5oItAXRckI/ZPlbzhkq/3
 InUY54z50npqgD2mva2CFRNfZ+pF6Sc//QHGIhBem0HH2Fl+2z7+O3O5J
 LBjnrPurw9ppqkKhznpttJCsAkeUu1F4tcrGQAB3RtkyL5mAZ2GkTl41u
 WuvWtYgcq3zxPrroHOzy5/g5SQcUU+5LHlduD/OQITGvX1Fe6dY2XUivE
 FrJ2MP2wAKI22dFM60uKC+Rg824KpPfVCWLPMI4AyHcb/G+J8rmkZe1EY Q==;
X-CSE-ConnectionGUID: luWLV11pQ1+3wJajm+jscw==
X-CSE-MsgGUID: WMEP+cKTSe2w1Nc/MBV+zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63682306"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="63682306"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:13:47 -0700
X-CSE-ConnectionGUID: zYoOvDUwRwuYBLQCT8cXAw==
X-CSE-MsgGUID: Vd7mqA96Qs+43BU5vThMbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="186073166"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 08:13:45 -0700
Date: Thu, 30 Oct 2025 16:13:42 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pawel Sikora <pawel.sikora@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v1 1/1] gitlab-ci: fix api reference pages deploy
Message-ID: <20251030151342.p6stm776prheuvnl@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20251030150216.1183847-1-pawel.sikora@intel.com>
 <20251030150216.1183847-2-pawel.sikora@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251030150216.1183847-2-pawel.sikora@intel.com>
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

Hi Pawel,
On 2025-10-30 at 16:02:16 +0100, Pawel Sikora wrote:
> Remove unnecessary step with api_reference dir
> creation.
> 
> This fixes main 'html' directory with the API
> Reference content being copied into docs/api_reference.
> 
> Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  .gitlab-ci.yml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index e3a81b547..34daba4d5 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -246,7 +246,6 @@ pages:
>    script:
>      - ninja -C build -j${FDO_CI_CONCURRENT:-4} igt-gpu-tools-doc
>      - pip install -r docs/requirements-docs.txt
> -    - mkdir -p docs/api_reference
>      - cp -r build/docs/reference/igt-gpu-tools/html/ docs/api_reference
>      - mkdocs build
>      - cp -r site public
> -- 
> 2.51.0
> 
