Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685D1CA0EF8
	for <igt-dev@archiver.kernel.org>; Thu, 21 Aug 2025 15:10:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18ACE10E9BF;
	Thu, 21 Aug 2025 15:10:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dvsQ4dtU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA7910E9BF
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Aug 2025 15:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755789010; x=1787325010;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=z8f1Xkt82MFohMeFmMkKTtQDvxA7sa7MrOkR3ElumXs=;
 b=dvsQ4dtURbXQyRGP0OmGbO7KwSL6jMNzVOOTuC88nju/fZtRepBIxgs0
 6hma8AV5hmbYo8gd5AqQb/B6AU5x2ThkxMSIpCGqxQV7uVn9VSOaiubz9
 IBpmfUynlw0QBxmpy8uiQDLKLPPPPCqvq4WHb2jf17LRcmwL7qSt/EL3b
 GhgqPdfjHhi6FEOH//UprPsXRjqeku3q4jUKiWaS+fRr4CuVApijSbIMu
 TkVQzWwJaEAQDBTsenJI8J26gUkMXUvFvgclmu0NZBKUiV4Fx4xWvzo1z
 dqkXUyywHndQlpGh9LcLCirJD1YphC6uiWP/SJYzNDktI5MLivttpHSvG Q==;
X-CSE-ConnectionGUID: juKYe1rdQXWHbJUfWHJhSw==
X-CSE-MsgGUID: sEpj08ekT1WL9r0Iisj5jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="75665677"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="75665677"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 08:06:31 -0700
X-CSE-ConnectionGUID: /bfbbQpVSF+SoZ/pZaAHRg==
X-CSE-MsgGUID: Vje9oX6IQd6k/V9kIfS6AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="205609857"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 08:06:29 -0700
Date: Thu, 21 Aug 2025 17:06:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pawel Sikora <pawel.sikora@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Pawel Sikora <pawel.sikora@linux.intel.com>
Subject: Re: [PATCH i-g-t v3 2/3] docs: Initialize MkDocs documentation
 structure
Message-ID: <20250821150626.dut3ywgzmkjnsba4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Pawel Sikora <pawel.sikora@linux.intel.com>
References: <20250820052934.121604-1-pawel.sikora@intel.com>
 <20250820052934.121604-3-pawel.sikora@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820052934.121604-3-pawel.sikora@intel.com>
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
On 2025-08-20 at 07:29:33 +0200, Pawel Sikora wrote:
> This commit establishes the groundwork for a comprehensive
> documentation site, enhancing accessibility and organization.
> 
>  * Update README with basic content, reflecting
>    the reorganization of documentation files.
>  * Move detailed documentation into the docs directory,
>    splitting content across multiple markdown files.
>  * Set up the structure for automatic site generation using MkDocs,
>    facilitating easier navigation and maintenance.
> 
> v2:
>  - Add new content and make corrections (Swati)
>  - Fix line width to 100 characters (Kamil)
>  - Fix moved/copied files (Kamil)
> 
> Co-authored-by: Swati Sharma <swati2.sharma@intel.com>
> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Please remove both r-b, this should be explicitly given by
e-mail or irc or other ways.

> Signed-off-by: Pawel Sikora <pawel.sikora@linux.intel.com>
> ---
>  README.md                            |  203 +---
>  docs/CONTRIBUTING.md                 |   91 ++
>  docs/MAINTAINERS.md                  |   16 +
>  docs/NEWS.md                         | 1471 ++++++++++++++++++++++++++

As discussed offline, please add only symlinks in docs/
to original files.

Regards,
Kamil

>  docs/api.md                          |   30 +
>  docs/blocklists.md                   |  387 +++++++
>  docs/building.md                     |   27 +
>  docs/{chamelium.txt => chamelium.md} |    2 +-
>  docs/ci_infrastructure.md            |  419 ++++++++
>  docs/cross-building.md               |  240 +++++
>  docs/cross-building.txt              |  122 ---
>  docs/faq.md                          |   92 ++
>  docs/new_driver.md                   |  230 ++++
>  docs/overview.md                     |  249 +++++
>  docs/patchwork.md                    |   18 +
>  docs/running_tests.md                |  130 +++
>  docs/test_categories.md              |  266 +++++
>  docs/test_plan.md                    |  216 ++++
>  docs/mkdocs.yml => mkdocs.yml        |    2 +
>  19 files changed, 3914 insertions(+), 297 deletions(-)
>  create mode 100644 docs/CONTRIBUTING.md
>  create mode 100644 docs/MAINTAINERS.md
>  create mode 100644 docs/NEWS.md
>  create mode 100644 docs/api.md
>  create mode 100644 docs/blocklists.md
>  create mode 100644 docs/building.md
>  rename docs/{chamelium.txt => chamelium.md} (99%)
>  create mode 100644 docs/ci_infrastructure.md
>  create mode 100644 docs/cross-building.md
>  delete mode 100644 docs/cross-building.txt
>  create mode 100644 docs/faq.md
>  create mode 100644 docs/new_driver.md
>  create mode 100644 docs/overview.md
>  create mode 100644 docs/patchwork.md
>  create mode 100644 docs/running_tests.md
>  create mode 100644 docs/test_categories.md
>  create mode 100644 docs/test_plan.md
>  rename docs/mkdocs.yml => mkdocs.yml (98%)
> 
[cut]
