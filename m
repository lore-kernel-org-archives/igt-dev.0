Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAACFE77188
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 14:06:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8479F10E318;
	Wed, 18 Dec 2024 14:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ar0dcIsJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD6410E318
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 14:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734530776; x=1766066776;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BG7kC7lovVihV//xjDmxaEWGOHeDIoKav6fGd+IF6+Q=;
 b=ar0dcIsJLBHzbAMZMRyEGdzbILyYhSpwmYswhCiV/HiHAyfZvEyADz63
 T8XFezwkxBZbhNUx2JkGxlr/qBdGLxoFcgBAZ30/4kX+Oil7Rc37OWZId
 PJnHlzGmrdcSB/u+YSU+9aWTcq6AKyFTQtha/1PIyP1Hmkiv/AjDIRISZ
 Bue7Koo7SzH1sa48NhM3huqq//e2ZybeaQO+HJTlQHhuuZ4hguvyy1GS5
 lagtKSy3ldlkh255E12gQ28q/0OxUMl/YMKRF0sjy5XYp/5Kw++nkoqha
 +Yq0c9dS+blUjeG6j1yps3SdhDFIEYD5Pupz6j9l2gcZFcIvwqxn5bAUV Q==;
X-CSE-ConnectionGUID: y7AQ+qBkTPW/ga7Xyx5Jig==
X-CSE-MsgGUID: 4mmgmBxZSEOdHoghKLSvqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35157525"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="35157525"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 06:06:15 -0800
X-CSE-ConnectionGUID: 51d5EjwNSN+6TV3A4yTCdA==
X-CSE-MsgGUID: TJlviSLYRLyL+7Q8y0C+dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="98102792"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.195.20])
 ([10.245.195.20])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 06:06:13 -0800
Message-ID: <ac26dc00-e0c6-4e48-bc0e-2c041c292898@linux.intel.com>
Date: Wed, 18 Dec 2024 15:06:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci/xe.blocklist: Block the updated shrink test
To: Nirmoy Das <nirmoy.das@intel.com>, igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20241218142407.2558613-1-nirmoy.das@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241218142407.2558613-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8
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


On 12/18/2024 3:24 PM, Nirmoy Das wrote:
> xe_bo_shrink_kunit, sub-dynamic test is now updated to be a subtest
> in the kernel so update this blocklist accordingly.
>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---


Kernel patch is waiting for CI  results for merging, https://patchwork.freedesktop.org/series/142786/

>  tests/intel-ci/xe.blocklist.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index e29e745a0..189cc25a7 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -31,7 +31,7 @@ igt@kms_selftest.*
>  ##################################################################
>  # Exclude slow KUnit test which should run as manual test
>  ##################################################################
> -igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit
> +igt@xe_live_ktest@xe_bo_shrink
>  ##################################################################
>  # Exclude all other non-Xe tests
>  ##################################################################
