Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEC3C48BC3
	for <igt-dev@archiver.kernel.org>; Tue, 20 Feb 2024 05:46:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A5F10E04C;
	Tue, 20 Feb 2024 05:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UkLTEQHr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCF910E04C
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Feb 2024 05:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708408013; x=1739944013;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ahUhylagpjfCdJc7mPIrQrUIaUg7G6eT+tKG3MVV8LA=;
 b=UkLTEQHrMEVxDMZ83DaP4cjqRIDnbj0RS5zsy8MSQJojdCt0+Nfuc2GX
 P85t+xUBEtfKecvdxLT2lxfUaHo/BGRZ1LY3iSqFKTkc1dwA11MkxIf5A
 OAMAmfd05ZAJYG2xWSJ9JaBLTbActAVpAsYLC1J+p8/WmB3sm1Dj8q4SM
 BYE1e4x8D1bTpJlp4aGzFbOxOlyHP/a56GaLGTjFw4u4uTXxCWQ8EENLe
 JcQiFjuYsXU35KRF/R1Qz0+xvkJsuEymDE6SOXAb6LXnnAhofU1xpu8vw
 qASIZC/WMvndJubUfAfPf88BmYEvPAuCJDsoDXlxjLpKK7e5sc5va/2SS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="6321056"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="6321056"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 21:46:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; d="scan'208";a="42168240"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 21:46:53 -0800
Received: from maurocar-mobl2 (unknown [10.245.244.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C32A3580DBB;
 Mon, 19 Feb 2024 21:46:50 -0800 (PST)
Date: Tue, 20 Feb 2024 06:46:48 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Jari Tahvanainen <jari.tahvanainen@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/i915_test_config: fix JSON exclude
 section
Message-ID: <20240220064648.37632ba5@maurocar-mobl2>
In-Reply-To: <20240219164858.29870-1-kamil.konieczny@linux.intel.com>
References: <20240219164858.29870-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 19 Feb 2024 17:48:58 +0100
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Fix typo in exclude section for i915.
> 
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> Fixes: 6fb001a597e9 ("tests/intel/i915_test_config: align JSON documentation with xe")
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/i915_test_config.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
> index b09f4244e..61638a4f1 100644
> --- a/tests/intel/i915_test_config.json
> +++ b/tests/intel/i915_test_config.json
> @@ -53,7 +53,7 @@
>                                      { "i915 BAT": "../intel-ci/fast-feedback.testlist" }
>                                  ],
>                                  "exclude": [
> -                                    { "i915 BAT, 915 FULL": "../intel-ci/blacklist.txt" }
> +                                    { "all": "../intel-ci/blacklist.txt" }
>                                  ]
>                              },
>                              "order": [
