Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A17CAC587
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 10:27:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C214410E6A0;
	Tue,  9 Sep 2025 10:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DSUGphql";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E603010E6A0
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 10:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757413664; x=1788949664;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XFP7f0fBSSufmnlBdvs3fth3/TC2HUkBYk2Hi8LPjUk=;
 b=DSUGphqlppLBddLYlhlC18Q/QqgO55DHI4yAPcMULs9hTbHvnEQ+A5QX
 Xio1Z1hKzBHGYlbENAZnSe9BuFpF5sJkMp3W/BaGRbiBTG+MohKjamL4f
 ufo3FctTd+gmPYox77OZBsfkZAh+POGEN01QRZ8/7kiwm4pM5zKbOhyw1
 4EOVDj7QK+IqR+rrAtwYCYx+f5BJEctpiiUNj1DnDiQtJNEIF0/NkCNJx
 3oJ8xlT/EZrdnzp7jwa2QtP1takNFqVMJbvrbcpm6CaN8wISo0XXbaP4h
 O9vMYAeSKKiPBexrI5Sv3jwU46fHOSKEaZChf32IluDBrzl42eAQWeNlF g==;
X-CSE-ConnectionGUID: EZJcqIh2SSm4ipy4xGPJbg==
X-CSE-MsgGUID: MgP7DNTPQWWoxwm0RLxrPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="77147782"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="77147782"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 03:27:44 -0700
X-CSE-ConnectionGUID: fKCqZu2rTl2UD1aiGbzXxw==
X-CSE-MsgGUID: XEM0MfxkSwq5D0pULucxHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="178272982"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 03:27:42 -0700
Date: Tue, 9 Sep 2025 12:27:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pawel Sikora <pawel.sikora@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v9 1/5] docs: Set up MkDocs for documentation site
Message-ID: <20250909102727.m6j7h6dkfiso7qnq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250909084233.183885-1-pawel.sikora@intel.com>
 <20250909084233.183885-2-pawel.sikora@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250909084233.183885-2-pawel.sikora@intel.com>
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
On 2025-09-09 at 10:42:27 +0200, Pawel Sikora wrote:
> This establishes the initial framework configuration
> for the IGT GPU Tools documentation site using MkDocs.
> 
>  * Add mkdocs.yml for site configuration, including project
>    info, navigation, theme, and plugins.
>  * Create requirements-docs.txt for MkDocs dependencies.
>  * Add extra.css for custom styling with Monokai theme.
>  * Include logo and CSS assets.
> 
> For details regarding MkDocs please refer to:
> https://www.mkdocs.org/
> 
> v2:
>  - Colorblind friendly theme (Kamil)
> 
> v5:
>  - Remove Intel logo (Lucas)
>  - Remove unnecessary plugins/extras from mkdocs.yml (Pawel)
> 
> v6:
>  - Add information about MIT licence in footer
>  - Change Download section to separate .md page instead of url
> 
> Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
> ---
>  docs/css/extra.css         | 323 +++++++++++++++++++++++++++++++++++++
>  docs/requirements-docs.txt |   7 +
>  mkdocs.yml                 | 191 ++++++++++++++++++++++

This looks almost ok, I am not an expert with www sites
but do we need external dependency?

>  3 files changed, 521 insertions(+)
>  create mode 100644 docs/css/extra.css
>  create mode 100644 docs/requirements-docs.txt
>  create mode 100644 mkdocs.yml
> 
[cut]

Found in yml file:

> +
> +extra_css:
> +  - css/extra.css
> +
> +extra_javascript:
> +  - https://polyfill.io/v3/polyfill.min.js?features=es6

Can we avoid using it?

> +
[cut]
> +
> +copyright: 'Copyright Intel, 2025 , made by IGT Team. SPDX-License-Identifier: MIT'

It is useally:
Copyright © 2025 Intel Corporation

e.g. (c) year copyright-holder

Not sure also about 'made by' here. imho better:

Copyright © 2025 Intel Corporation . SPDX-License-Identifier: MIT'

> -- 
> 2.51.0

Regards,
Kamil

