Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2155FCA0EFA
	for <igt-dev@archiver.kernel.org>; Wed, 20 Aug 2025 05:12:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8C410E345;
	Wed, 20 Aug 2025 05:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="my9ZAFQ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC9E10E345
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Aug 2025 05:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755666751; x=1787202751;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v8ahnaXI1s7YicRvzR3X+e8y7dm2r7vf/mIJ+TyPbpc=;
 b=my9ZAFQ2+aBFrXVdrEk0KToyfNNGs2xNzbFpfvHq1m++0ymHPAA4EnFL
 IbVIuZKeNBFksA3WV3AU/b+f8bxARXd7Nn2JR/nyugjnGPPfm94XizpMx
 BAL+bZB1I8CQXJPlX1CEXHCoOg0fPy1Gf16Ge/ZzDlAWBwDmpEFpEnSOK
 DG6/tGLUxiCL7P2xvn5duQ80KmlUm1eSmJ8R+UTbmJrMmhxM+bI0DcHnT
 xBWxztAGSo3bgxYHJ+koO9Np2im2yCSW5KZf90gs6EIZ0ngDbAciVq7E5
 YZRQyD6Gltxr9XaVvi/LnXMp2GOU7+VVY5hamt7mxDi6n0nmzKxXYr4n7 g==;
X-CSE-ConnectionGUID: rkUsIJJSTB+pGCnyG/bw2g==
X-CSE-MsgGUID: GfAyXi2PRUaS/UoirwFtpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="80517199"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="80517199"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 22:12:30 -0700
X-CSE-ConnectionGUID: tjHThsnARpOerSMUwN14pA==
X-CSE-MsgGUID: NtsvuCDKQrGpZUZ0/n2eqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="168829816"
Received: from agladkov-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.238])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 22:12:29 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 0/3] Establish MkDocs Documentation Framework for IGT
 GPU Tools
Date: Wed, 20 Aug 2025 07:12:21 +0200
Message-Id: <20250820051224.121006-1-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Dear Maintainers,

I am submitting a series of patches to introduce a comprehensive 
documentation framework for the IGT GPU Tools project using MkDocs.

For details regarding MkDocs please see: https://www.mkdocs.org/
 
This effort aims to enhance organization and presentation of our documentation,
making it easier for users and contributors to navigate and understand the project.

How to build it for review:

$ cd docs
$ pip3 install -r requirements-docs.txt
$ mkdocs build
$ mkdocs serve

Then, open in browser: http://127.0.0.1:8000/

Patch 1: docs: Set up MkDocs for documentation site

This patch lays the foundation for the documentation site by adding essential 
configuration files and assets. 
The mkdocs.yml file is introduced to define the site's structure, including 
project information, navigation, theme settings(Material for MkDocs: 
https://squidfunk.github.io/mkdocs-material/), and plugins. 

Additionally, requirements-docs.txt lists the necessary dependencies for 
building the site with MkDocs.

Custom styling is applied through extra.css, which incorporates a Monokai 
theme, and visual assets such as the logo are included. 
This patch establishes the initial framework for generating the IGT GPU Tools 
documentation site using MkDocs. 

For more details on MkDocs, please refer to MkDocs Documentation.

Patch 2: docs: Initialize MkDocs documentation structure

This patch focuses on organizing the documentation content within the project.

The README is updated with basic content to reflect the reorganization, while 
detailed documentation is moved into the docs directory. 

The content is split across multiple markdown files, setting up a structure 
that allows for automatic site generation using MkDocs. 

This reorganization enhances the accessibility and maintenance of the 
documentation, providing a clear and navigable structure for users.

Patch 3: gitlab-ci: Add MkDocs documentation support

This patch integrates MkDocs documentation support into the GitLab CI pipeline. 
It ensures that the current API reference manual (which is currently hosted on 
GitLab pages) is built and copied to the MkDocs documentation directory, 
maintaining its availability via an internal link. 

The MkDocs documentation from the docs directory is also built, 
with a relative link to api_reference/index.html included in the navigation. 

After both builds are complete, all content is copied into the site directory 
and manually moved into public for hosting on freedesktop GitLab Pages. 
This integration ensures that the documentation is consistently updated 
and accessible alongside the API reference manual.

Together, these patches improve the presentation and accessibility of the 
IGT GPU Tools project. 

I look forward to your feedback.


v2:
 - Add many new documentation content and corrections to v1 (Swati)
 - Add colorblind friendly theme css (Kamil)
 - Fix line width to 100 characters (Kamil)
 - Keep MAINTAINERS file in the root dir, but second version(formatted)
   is created in the docs dir (Kamil)

Regards,
Pawel

Pawel Sikora (3):
  docs: Set up MkDocs for documentation site
  docs: Initialize MkDocs documentation structure
  gitlab-ci: Add MkDocs documentation support

 .gitlab-ci.yml             |   10 +-
 README.md                  |  203 +----
 docs/CONTRIBUTING.md       |   91 +++
 docs/MAINTAINERS.md        |   16 +
 docs/NEWS.md               | 1471 ++++++++++++++++++++++++++++++++++++
 docs/api.md                |   30 +
 docs/assets/intel_logo.png |  Bin 0 -> 34697 bytes
 docs/blocklists.md         |  387 ++++++++++
 docs/building.md           |   27 +
 docs/ci_infrastructure.md  |  419 ++++++++++
 docs/cross-building.md     |  240 ++++++
 docs/cross-building.txt    |  122 ---
 docs/css/extra.css         |  323 ++++++++
 docs/faq.md                |   92 +++
 docs/new_driver.md         |  230 ++++++
 docs/overview.md           |  249 ++++++
 docs/patchwork.md          |   18 +
 docs/requirements-docs.txt |    7 +
 docs/running_tests.md      |  130 ++++
 docs/test_categories.md    |  266 +++++++
 docs/test_plan.md          |  216 ++++++
 mkdocs.yml                 |  225 ++++++
 22 files changed, 4474 insertions(+), 298 deletions(-)
 create mode 100644 docs/CONTRIBUTING.md
 create mode 100644 docs/MAINTAINERS.md
 create mode 100644 docs/NEWS.md
 create mode 100644 docs/api.md
 create mode 100644 docs/assets/intel_logo.png
 create mode 100644 docs/blocklists.md
 create mode 100644 docs/building.md
 create mode 100644 docs/ci_infrastructure.md
 create mode 100644 docs/cross-building.md
 delete mode 100644 docs/cross-building.txt
 create mode 100644 docs/css/extra.css
 create mode 100644 docs/faq.md
 create mode 100644 docs/new_driver.md
 create mode 100644 docs/overview.md
 create mode 100644 docs/patchwork.md
 create mode 100644 docs/requirements-docs.txt
 create mode 100644 docs/running_tests.md
 create mode 100644 docs/test_categories.md
 create mode 100644 docs/test_plan.md
 create mode 100644 mkdocs.yml

-- 
2.34.1

