Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB38C87FCB
	for <igt-dev@archiver.kernel.org>; Tue,  5 Aug 2025 16:54:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CDE10E0BA;
	Tue,  5 Aug 2025 16:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P0i39rPb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53D710E0BA
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Aug 2025 16:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754412843; x=1785948843;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NEQ4pu4Sx0KTKSloxy4TQ98za3kS0oY1x7slWxRU5zM=;
 b=P0i39rPb5LzMIjGXdoJTSuqUwSHr2hwsUV/7vQmRp8DH3Jzh/Hv5yNbh
 2NLhxuPf4cSCaouk1Qknzu/qIokYTz7Fz4CUmyF8SWhXCQIXpkvoMzumS
 tzPSQtvJNF7hlUpdoweEkzjFfsN/IY4h9Cl9LoqC9Ibxo10Zw9OQJIG2U
 POlo3TTlrdhj781kN8kOCxScV73M73r4mAmz/KFNbp4V1XC0QM7MN/6Xn
 t9OrU5jWJjN18BHKqvrmn7/wIEsCQ2o1W3rvuYoQlr3EsuIemRulx1YMS
 yh1jppyx2GrbWmp9IhYAb8GJ3lKnMbWtoyQ6rxyVNyZjnuNhRtMO+ElWr A==;
X-CSE-ConnectionGUID: iBXO3FQhSeyqkd7r+B7/Hg==
X-CSE-MsgGUID: L23xedTMR2ap/5pLfm8PZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="60546448"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="60546448"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 09:54:02 -0700
X-CSE-ConnectionGUID: MsXO0upJSQm55omfAWpElA==
X-CSE-MsgGUID: kbYkQKIXRaq45/UpnxFl2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="165304261"
Received: from unknown (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 09:54:00 -0700
Date: Tue, 5 Aug 2025 18:53:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pawel Sikora <pawel.sikora@intel.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Pawel Sikora <pawel.sikora@linux.intel.com>
Subject: Re: [PATCH i-g-t 0/3] Establish MkDocs Documentation Framework for
 IGT GPU Tools
Message-ID: <20250805165358.3w2tdqkqxpqyyw5b@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Pawel Sikora <pawel.sikora@linux.intel.com>
References: <20250730085428.47298-1-pawel.sikora@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250730085428.47298-1-pawel.sikora@intel.com>
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
On 2025-07-30 at 10:54:25 +0200, Pawel Sikora wrote:
> From: Pawel Sikora <pawel.sikora@linux.intel.com>
> 
> Dear Maintainers,
> 
> I am submitting a series of patches to introduce a comprehensive documentation framework for the IGT GPU Tools project using MkDocs. For details regarding MkDocs please see: https://www.mkdocs.org/

Please fold all lines to 65-column, also in cover letter.

>  
> This effort aims to enhance organization and presentation of our documentation, making it easier for users and contributors to navigate and understand the project.
> 
> How to build it for review:
> 
> $ cd docs
> $ pip3 install -r requirements-docs.txt
> $ mkdocs build
> $ mkdocs serve
> 
> Then, open in browser: http://127.0.0.1:8000/

Add this as a script or into a documentation itself?

> 
> Patch 1: docs: Set up MkDocs for documentation site
> 
> This patch lays the foundation for the documentation site by adding essential configuration files and assets. The mkdocs.yml file is introduced to define the site's structure, including project information, navigation, theme settings(Material for MkDocs: https://squidfunk.github.io/mkdocs-material/), and plugins. 
> 
> Additionally, requirements-docs.txt lists the necessary dependencies for building the site with MkDocs.
> 
> Custom styling is applied through extra.css, which incorporates a Monokai theme, and visual assets such as the logo are included. This patch establishes the initial framework for generating the IGT GPU Tools documentation site using MkDocs. For more details on MkDocs, please refer to MkDocs Documentation.
> 
> Patch 2: docs: Initialize MkDocs documentation structure
> 
> This patch focuses on organizing the documentation content within the project.
> 
> The README is updated with basic content to reflect the reorganization, while detailed documentation is moved into the docs directory. 
> 
> The content is split across multiple markdown files, setting up a structure that allows for automatic site generation using MkDocs. 
> This reorganization enhances the accessibility and maintenance of the documentation, providing a clear and navigable structure for users.

As you mention accessibility, could you look into
Color Universal Design CUD here:
https://jfly.uni-koeln.de/color/

and use guidelines from there?
For example, it is difficult for me to read red on blue.

Regards,
Kamil

> 
> Patch 3: gitlab-ci: Add MkDocs documentation support
> 
> This patch integrates MkDocs documentation support into the GitLab CI pipeline. 
> It ensures that the current API reference manual (which is currently hosted on GitLab pages) is built and copied to the MkDocs documentation directory, maintaining its availability via an internal link. 
> 
> The MkDocs documentation from the docs directory is also built, with a relative link to api_reference/index.html included in the navigation. 
> 
> After both builds are complete, all content is copied into the site directory and manually moved into public for hosting on freedesktop GitLab Pages. This integration ensures that the documentation is consistently updated and accessible alongside the API reference manual.
> 
> Together, these patches improve the presentation and accessibility of the IGT GPU Tools project. 
> 
> I look forward to your feedback.
> 
> Regards,
> Pawel
> 
> Pawel Sikora (3):
>   docs: Set up MkDocs for documentation site
>   docs: Initialize MkDocs documentation structure
>   gitlab-ci: Add MkDocs documentation support
> 
>  .gitlab-ci.yml             |   10 +-
>  MAINTAINERS                |    7 -
>  README.md                  |  203 +----
>  docs/CONTRIBUTING.md       |   82 ++
>  docs/MAINTAINERS.md        |   16 +
>  docs/NEWS.md               | 1471 ++++++++++++++++++++++++++++++++++++
>  docs/api.md                |   33 +
>  docs/assets/intel_logo.png |  Bin 0 -> 34697 bytes
>  docs/building.md           |   28 +
>  docs/css/extra.css         |  550 ++++++++++++++
>  docs/faq.md                |  102 +++
>  docs/mkdocs.yml            |  221 ++++++
>  docs/overview.md           |  220 ++++++
>  docs/patchwork.md          |   18 +
>  docs/releases.md           |    0
>  docs/requirements-docs.txt |    8 +
>  docs/running_tests.md      |   75 ++
>  17 files changed, 2861 insertions(+), 183 deletions(-)
>  delete mode 100644 MAINTAINERS
>  create mode 100644 docs/CONTRIBUTING.md
>  create mode 100644 docs/MAINTAINERS.md
>  create mode 100644 docs/NEWS.md
>  create mode 100644 docs/api.md
>  create mode 100644 docs/assets/intel_logo.png
>  create mode 100644 docs/building.md
>  create mode 100644 docs/css/extra.css
>  create mode 100644 docs/faq.md
>  create mode 100644 docs/mkdocs.yml
>  create mode 100644 docs/overview.md
>  create mode 100644 docs/patchwork.md
>  create mode 100644 docs/releases.md
>  create mode 100644 docs/requirements-docs.txt
>  create mode 100644 docs/running_tests.md
> 
> -- 
> 2.34.1
> 
