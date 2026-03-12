Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841731067042
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 15:08:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EB610EA34;
	Thu, 12 Mar 2026 15:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n2+6ZQsC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FB010EA3F
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 15:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773328131; x=1804864131;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Jkl2JqQifVGVa3MeY80QI7OuugD4dXu9uL1ltJvBQKo=;
 b=n2+6ZQsCfdiAjPjI2Sz5UMatHKK08RoDpxh4sXMrmIp8gpjaK2nhehDq
 eqD4txsrGRtsPyoyY5I5yXCRzvFQTj5gqQUE26tPPj1SnvvVWGGaTwZIy
 2C2dirSFExiJGqr0iOL8nwFaHYm/aG+YcdPZv92xQ9hcVrzxIhZ+NfWXX
 /9nlvmrYHltoYuCWj0K8W8ezTHCnFjpS/yZYb/nSTI2CKrPHkZ1kqvFMQ
 QzQNoTF5D3lZ9uWl+GZnr1HCzW1ykHrw/H47L7RmqOs7dnvXzBLLEfQjU
 c9GChw5IFeGe/OcszVkKn+sMwV/RyTpPlv1HBA0s1EAVXIlAMtUXOMlf7 w==;
X-CSE-ConnectionGUID: NoROxXjrQaqpb+NSLJwPyQ==
X-CSE-MsgGUID: nIfzO2PbQUi5unsYMAJa2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="61997316"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="61997316"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:08:50 -0700
X-CSE-ConnectionGUID: UsKxEzMrREGEMc5K/E4UiQ==
X-CSE-MsgGUID: s9OLTvDTTbS8jbGAV7nYjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="258771327"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:08:49 -0700
Date: Thu, 12 Mar 2026 16:08:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pawel Sikora <pawel.sikora@intel.com>
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH i-g-t v1 4/6] docs/css/extra.css: make nav/toc initial
 max width
Message-ID: <20260312150846.mgstoywv2xu62ih7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
References: <20260220150202.1013804-1-pawel.sikora@intel.com>
 <20260220150202.1013804-5-pawel.sikora@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260220150202.1013804-5-pawel.sikora@intel.com>
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
On 2026-02-20 at 16:01:58 +0100, Pawel Sikora wrote:
> Due to the new API reference pages, some code examples
> contained in function documentation comments are now
> rendered side by side with the explanation. To improve
> readability, the navigation needs to be moved to the left
> side of the page, and the table of contents needs to be
> moved from the center to the right side of the screen.
> 
> Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil 
> ---
>  docs/css/extra.css | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/docs/css/extra.css b/docs/css/extra.css
> index ff1b47cb8..094bdc443 100644
> --- a/docs/css/extra.css
> +++ b/docs/css/extra.css
> @@ -321,3 +321,7 @@
>      transition: none !important;
>    }
>  }
> +
> +.md-grid {
> +  max-width: initial;
> +}
> -- 
> 2.51.0
> 
