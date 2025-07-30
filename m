Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0D2C87FCB
	for <igt-dev@archiver.kernel.org>; Wed, 30 Jul 2025 08:54:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29A710E1A4;
	Wed, 30 Jul 2025 08:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mmOPsfB5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D960610E1A4
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Jul 2025 08:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753865677; x=1785401677;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VmAV3cm9qN0/Qp2Ce/N1DT9eiIQZJfOqNtlsupZ3ebU=;
 b=mmOPsfB5BB0PxbYfIY8xBIi1VdR8T0WFBsSN6ktumwFeF8E/cfTPiz9G
 ESbH7gJT9rMc8zehYIDC7YQAYLny14r7m0zaStoOmZJTHIFmQDepLGMda
 AuMY7yY3J9fGXMByTfvbu9nru37MGR04vaNQz46cQfJLM454nM+10q1Fd
 R6hdECCbH0juSLSqkoXQtonvTugOl3SJYUtpoVrFE3Jh8/coKpifb/uFL
 +ylLs/MqMCSdXLth3suDCjpbxkklz/YdvqbEhGF3uYITJLcymtHQKTjwA
 4gRs9CACGrRuD12jy05e7dyg6GrvSdcu46blDIUz+XIfexhdyLtvkjfcK g==;
X-CSE-ConnectionGUID: JAmIfgYeQXWpynu9ftwBPw==
X-CSE-MsgGUID: GrEsP5sdRhWOGppskt51wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="67601207"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="67601207"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 01:54:37 -0700
X-CSE-ConnectionGUID: YjiLOkvYSoW+Z0Arjt3bHA==
X-CSE-MsgGUID: aW0j2BCwRrKrGwKH33VZig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162194056"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.8])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 01:54:34 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Pawel Sikora <pawel.sikora@linux.intel.com>
Subject: [PATCH i-g-t 0/3] Establish MkDocs Documentation Framework for IGT
 GPU Tools
Date: Wed, 30 Jul 2025 10:54:25 +0200
Message-Id: <20250730085428.47298-1-pawel.sikora@intel.com>
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

From: Pawel Sikora <pawel.sikora@linux.intel.com>

Dear Maintainers,

I am submitting a series of patches to introduce a comprehensive documentation framework for the IGT GPU Tools project using MkDocs. For details regarding MkDocs please see: https://www.mkdocs.org/
 
This effort aims to enhance organization and presentation of our documentation, making it easier for users and contributors to navigate and understand the project.

How to build it for review:

$ cd docs
$ pip3 install -r requirements-docs.txt
$ mkdocs build
$ mkdocs serve

Then, open in browser: http://127.0.0.1:8000/

Patch 1: docs: Set up MkDocs for documentation site

This patch lays the foundation for the documentation site by adding essential configuration files and assets. The mkdocs.yml file is introduced to define the site's structure, including project information, navigation, theme settings(Material for MkDocs: https://squidfunk.github.io/mkdocs-material/), and plugins. 

Additionally, requirements-docs.txt lists the necessary dependencies for building the site with MkDocs.

Custom styling is applied through extra.css, which incorporates a Monokai theme, and visual assets such as the logo are included. This patch establishes the initial framework for generating the IGT GPU Tools documentation site using MkDocs. For more details on MkDocs, please refer to MkDocs Documentation.

Patch 2: docs: Initialize MkDocs documentation structure

This patch focuses on organizing the documentation content within the project.

The README is updated with basic content to reflect the reorganization, while detailed documentation is moved into the docs directory. 

The content is split across multiple markdown files, setting up a structure that allows for automatic site generation using MkDocs. 
This reorganization enhances the accessibility and maintenance of the documentation, providing a clear and navigable structure for users.

Patch 3: gitlab-ci: Add MkDocs documentation support

This patch integrates MkDocs documentation support into the GitLab CI pipeline. 
It ensures that the current API reference manual (which is currently hosted on GitLab pages) is built and copied to the MkDocs documentation directory, maintaining its availability via an internal link. 

The MkDocs documentation from the docs directory is also built, with a relative link to api_reference/index.html included in the navigation. 

After both builds are complete, all content is copied into the site directory and manually moved into public for hosting on freedesktop GitLab Pages. This integration ensures that the documentation is consistently updated and accessible alongside the API reference manual.

Together, these patches improve the presentation and accessibility of the IGT GPU Tools project. 

I look forward to your feedback.

Regards,
Pawel

Pawel Sikora (3):
  docs: Set up MkDocs for documentation site
  docs: Initialize MkDocs documentation structure
  gitlab-ci: Add MkDocs documentation support

 .gitlab-ci.yml             |   10 +-
 MAINTAINERS                |    7 -
 README.md                  |  203 +----
 docs/CONTRIBUTING.md       |   82 ++
 docs/MAINTAINERS.md        |   16 +
 docs/NEWS.md               | 1471 ++++++++++++++++++++++++++++++++++++
 docs/api.md                |   33 +
 docs/assets/intel_logo.png |  Bin 0 -> 34697 bytes
 docs/building.md           |   28 +
 docs/css/extra.css         |  550 ++++++++++++++
 docs/faq.md                |  102 +++
 docs/mkdocs.yml            |  221 ++++++
 docs/overview.md           |  220 ++++++
 docs/patchwork.md          |   18 +
 docs/releases.md           |    0
 docs/requirements-docs.txt |    8 +
 docs/running_tests.md      |   75 ++
 17 files changed, 2861 insertions(+), 183 deletions(-)
 delete mode 100644 MAINTAINERS
 create mode 100644 docs/CONTRIBUTING.md
 create mode 100644 docs/MAINTAINERS.md
 create mode 100644 docs/NEWS.md
 create mode 100644 docs/api.md
 create mode 100644 docs/assets/intel_logo.png
 create mode 100644 docs/building.md
 create mode 100644 docs/css/extra.css
 create mode 100644 docs/faq.md
 create mode 100644 docs/mkdocs.yml
 create mode 100644 docs/overview.md
 create mode 100644 docs/patchwork.md
 create mode 100644 docs/releases.md
 create mode 100644 docs/requirements-docs.txt
 create mode 100644 docs/running_tests.md

-- 
2.34.1

