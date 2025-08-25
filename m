Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46755CA0FE1
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 10:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5DD310E450;
	Mon, 25 Aug 2025 10:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k0O6JWF8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2F510E440
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 10:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756119595; x=1787655595;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RaQdK9VaBefnooakWYXi4/1EOZe3e2dBBnao160bej8=;
 b=k0O6JWF8/UzFAFYRR4HE8CdazrI7JRU9ASyJieiogq4mQbcIPe8s1zwP
 tM91wJJdtgNcy29/AdQShSYDzygxqvaiGiQWN8jDNmpQy0CmgCIRiBzuc
 s4TAs1TCGTvL0S3xnjg60JYCqRz8OXpXVnBG8Dj/uS6UIVehZbSx9366D
 gyYPfPA/ZpHQ2MaU1XtLj8iOUZje7CH098rv8kqPIQ69cpEX1L83RsMog
 et4/UIQaYEYN2/bc5obtdRBwGsav1XFUy1UYlLf6AkzFpJqRSNCgq4qJs
 vzvRZFhKSVftdgYlsb1HRKGxwKsARVQZKZQiyUPsPQH08jV9ThIXLp7/B w==;
X-CSE-ConnectionGUID: lbkOa+07TWC6cZEXFcSRZw==
X-CSE-MsgGUID: 9RwEKI+lSLqt50cm8f896g==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69431160"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="69431160"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 03:59:54 -0700
X-CSE-ConnectionGUID: JRghb6hxRZq/LK6qXz8edw==
X-CSE-MsgGUID: sUIwNy/jS5KdpBoIKkGmdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="169657934"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.101.99])
 ([10.245.101.99])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 03:59:53 -0700
Message-ID: <6429b8d8-daee-4f4a-b0d5-44586269526c@linux.intel.com>
Date: Mon, 25 Aug 2025 12:59:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci/xe.bmg.core.blocklist.txt: Remove
 SR-IOV tests
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>
References: <20250822142425.491548-1-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250822142425.491548-1-jakub1.kolakowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 8/22/2025 4:24 PM, Jakub Kolakowski wrote:
> We now have support for BMG in drm-tip kernel, remove SR-IOV tests from
> BMG blocklist as it doesn't make sense to keep them here anymore.
> 
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
> ---
>   tests/intel-ci/xe.bmg.core.blocklist.txt | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-ci/xe.bmg.core.blocklist.txt
> index a43e43a62..6207d6af6 100644
> --- a/tests/intel-ci/xe.bmg.core.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
> @@ -1,8 +1,4 @@
>   ##################################################################
> -# Tests NA for Native
> -##################################################################
> -igt@.*iov.*
> -##################################################################
>   # KMS - Display related tests
>   # Other Display specific tests
>   #################################################################

LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

