Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6ACCCA0FED
	for <igt-dev@archiver.kernel.org>; Fri,  5 Sep 2025 13:47:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6480810E2ED;
	Fri,  5 Sep 2025 13:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hEsOSWJG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9079D10E2ED
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Sep 2025 13:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757080064; x=1788616064;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=THbv23Ad6+d0FSpWup+xMaUasuwX6wkhGmc1zTZvpQY=;
 b=hEsOSWJGDYs4rTD08C5I+OkjKQntHBRBqVGzKlP7LGkrKHarDRizTpOc
 zWfmxcnu0AKMVmSzKAV91UiBPpz2bL9ffTNB/hOoqXkvuiw6pg9EZ8mai
 39O49ig0xFYjzi6t9aaCjsx8/vt2dyPKE5+i1O88Bdz1+v0cNb1+OPRzn
 Ad4EDJpLOkHxGBWJMnVi9Ag10G2f922biUqYeeziLkc3ft+guuS3DpKKC
 mnvnuJL/c7Jiar/XCVnV/xAszF1Slqk0VwKGx9dxmTrY2QaB18+sI/oxZ
 BwL6mkzTf3WRZ5mCnNh1quT97HwMT9Z+uFcif18ITRUlkyEAHxWt/AKCL A==;
X-CSE-ConnectionGUID: bh+HMWz/ShePHacMyrt7Cw==
X-CSE-MsgGUID: 1iXPO0UvRVSF+12zjb86fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59129752"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="59129752"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 06:47:44 -0700
X-CSE-ConnectionGUID: TcMkj5+DSsGrPeWVvDQpDw==
X-CSE-MsgGUID: E/vJDKvvQ0SVsTOdJWvESw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="202982458"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.226])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 06:47:42 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v8 0/5] Establish MkDocs Documentation Framework for IGT
 GPU Tools
Date: Fri,  5 Sep 2025 15:47:28 +0200
Message-ID: <20250905134735.132119-1-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
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
 
This effort aims to enhance organization and presentation of our
documentation, making it easier for users and contributors to navigate
and understand the project.

How to build it for review (strongly recommended to use virtual
environment - please relate to your OS/distro instructions)

Set up venv for python local installation of required packages:
$ python3 -m venv venv
$ source ./venv/bin/activate

Install requirements:
$ pip3 install -r ./docs/requirements-docs.txt

Build documentation:
$ mkdocs build

Start the server to host a local website:
$ mkdocs serve

Then, open in your favorite browser: http://127.0.0.1:8000/

Detailed description of patches:

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

Patch 2:

In a current mkdocs configuration (initial, actually) all
documentation files need to be placed in the 'docs' directory.

Thus, some files like CONTRIBUTING.md, MAINTAINERS, NEWS,
README.md are left out of the scope for mkdocs.

To mitigate that and maintain backward compatibility for
current tools that may use those files, this patch creates
symlinks in the 'docs' folder to those files (except README.md)
and give an '.md' extention where it was missing for clarity.

In the current MkDocs configuration (initial, actually),
all documentation files need to be placed in the 'docs' directory.

Thus, some files like CONTRIBUTING.md, MAINTAINERS, NEWS,
and README.md are left out of the scope for MkDocs.

To mitigate that and maintain backward compatibility for current
tools that may use those files, this patch creates symlinks
in the 'docs' folder to those files (except README.md) and adds
a '.md' extension where it was missing for clarity.

Patch 3: docs: Initialize MkDocs documentation structure

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

v3:
 - Simplify mkdocs build (Pawel)

v4:
 - Add symlinks instead of moving files into docs dir (Kamil)

v5:
 - Minor changes to documentation content (Kasia)
 - Remove Intel logo (Lukas)
 - Remove some unnecessary configuration from mkdocs.yml

v6:
 - Add information about MIT license in footer
 - Add download.md and link Download section to it

v7:
 - Move changes into README.md and docs/cross-building.txt
   into separate patches (Kamil)
 - Fix mentions about 'blacklist' to 'blocklist'

v8:
 - Restore README.md to its original

Regards,
Pawel

Pawel Sikora (5):
  docs: Set up MkDocs for documentation site
  docs: create symlinks for NEWS/MAINTAINERS/CONTRIB
  docs: rename cross-building.txt to .md
  docs: Initialize MkDocs documentation structure
  gitlab-ci: Add MkDocs documentation support

 .gitlab-ci.yml                       |  10 +-
 docs/CONTRIBUTING.md                 |   1 +
 docs/MAINTAINERS.md                  |   1 +
 docs/NEWS.md                         |   1 +
 docs/api.md                          |  30 ++
 docs/blocklists.md                   | 354 +++++++++++++++++++++++
 docs/building.md                     |  27 ++
 docs/{chamelium.txt => chamelium.md} |   2 +-
 docs/ci_infrastructure.md            | 414 +++++++++++++++++++++++++++
 docs/code_coverage.md                |  68 +++--
 docs/cross-building.md               | 240 ++++++++++++++++
 docs/cross-building.txt              | 122 --------
 docs/css/extra.css                   | 323 +++++++++++++++++++++
 docs/download.md                     |  23 ++
 docs/faq.md                          |  92 ++++++
 docs/how_to_build_docs.md            |  54 ++++
 docs/issues.md                       |  31 ++
 docs/new_driver.md                   | 231 +++++++++++++++
 docs/overview.md                     | 249 ++++++++++++++++
 docs/patchwork.md                    |  18 ++
 docs/requirements-docs.txt           |   7 +
 docs/running_tests.md                | 130 +++++++++
 docs/test_categories.md              | 266 +++++++++++++++++
 docs/test_documentation.md           |   5 +-
 docs/test_plan.md                    | 216 ++++++++++++++
 mkdocs.yml                           | 191 ++++++++++++
 26 files changed, 2944 insertions(+), 162 deletions(-)
 create mode 120000 docs/CONTRIBUTING.md
 create mode 120000 docs/MAINTAINERS.md
 create mode 120000 docs/NEWS.md
 create mode 100644 docs/api.md
 create mode 100644 docs/blocklists.md
 create mode 100644 docs/building.md
 rename docs/{chamelium.txt => chamelium.md} (99%)
 create mode 100644 docs/ci_infrastructure.md
 create mode 100644 docs/cross-building.md
 delete mode 100644 docs/cross-building.txt
 create mode 100644 docs/css/extra.css
 create mode 100644 docs/download.md
 create mode 100644 docs/faq.md
 create mode 100644 docs/how_to_build_docs.md
 create mode 100644 docs/issues.md
 create mode 100644 docs/new_driver.md
 create mode 100644 docs/overview.md
 create mode 100644 docs/patchwork.md
 create mode 100644 docs/requirements-docs.txt
 create mode 100644 docs/running_tests.md
 create mode 100644 docs/test_categories.md
 create mode 100644 docs/test_plan.md
 create mode 100644 mkdocs.yml

-- 
2.51.0

