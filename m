Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B91DCCF9E9
	for <igt-dev@archiver.kernel.org>; Wed, 29 Oct 2025 14:19:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE8A10E151;
	Wed, 29 Oct 2025 14:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iFs7JqBc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5686A10E151
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Oct 2025 14:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761747595; x=1793283595;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GR4THkXcyJ9j6FT2SKGSrqIss0h/nnwcwIbqsQOS5Yc=;
 b=iFs7JqBcOcwSL1CCCaKgDbp5b6J1BFN+FuoqGH92E9bMQJxds5T5otfT
 hQdoYSVWCy+c2B1tlrLAPKShzUd+U1PujTC/3ojrY+GBum1hbDbkSSlga
 Vg/6w/3KLAZBq7QoJjQ5cHTt0gVEn2vGFaIquAnOYLVeyiY6c6qXUaT6M
 CHdfDU5xlyfvY1FOroOVu3h+226v93v0lJLB80DRvKUX8DT5PzuLXZ4Zt
 9c7pnirlWKPkuBnFKzkHNTsxHOeUX9K/MrwEo1AO9frB0ZBtkR90zC+TY
 HTcitMVyq6US+tWhG8c3ImoiVxh3wa5BdN/Y32sc/72E4aqMIaYmjECDs w==;
X-CSE-ConnectionGUID: tWgEi4NzQzGNSvFYhvEs5w==
X-CSE-MsgGUID: bxLvN+WzR6u0194jHVhFCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63774112"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63774112"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 07:19:53 -0700
X-CSE-ConnectionGUID: 47Es6ZutQvC88yTtf1wD3g==
X-CSE-MsgGUID: emNwfFqyRw2rktUvqAf3sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="189745201"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.233])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 07:19:51 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v13 0/6] Establish MkDocs Documentation Framework for
 IGT GPU Tools
Date: Wed, 29 Oct 2025 15:19:39 +0100
Message-ID: <20251029141946.1165010-1-pawel.sikora@intel.com>
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
theme adjusted to be colorblind-friendly. 
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

Patch 3: Rename cross-building.txt to .md

Patch 4: docs: Initialize MkDocs documentation structure

This patch focuses on organizing the documentation content within the project.

The README is updated with basic content to reflect the reorganization, while 
detailed documentation is moved into the docs directory. 

The content is split across multiple markdown files, setting up a structure 
that allows for automatic site generation using MkDocs. 

This reorganization enhances the accessibility and maintenance of the 
documentation, providing a clear and navigable structure for users.

Patch 5: Add platform-specific documentation
Add platforms.md with information about HW/SW to be used when running
IGT tests/tools. Add Intel-specific details with a placeholder for other vendors.

Patch 6: gitlab-ci: Add MkDocs documentation support

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

v9:
 - Site directory creation dir change to just ./site

v10:
 - Remove ext deps and edit footer in mkdocs.yml file. (Kamil)
 - Remove some unnecessary plugins and reqs

v11:
 - Minor changes in documentation content
 - Separate platform-specific HW/SW details into platforms.md
 - Change Copyright footer to IGT GPU Tools Team

v12:
 - Minor changes in documentation index/overview
 - Change of path for copying api_reference files
 - Correct some Intel platforms based informations (Zbigniew)

v13:
 - Minor whitespaces cleanup
 - Change Copyright to 'Made by IGT GPU developers'
 - Bring back api reference build in deploy stage

Regards,
Pawel


Pawel Sikora (6):
  docs: Set up MkDocs for IGT documentation site
  docs: Create symlinks for NEWS/MAINTAINERS/CONTRIB
  docs: Rename cross-building.txt to .md
  docs: Initialize MkDocs documentation structure
  docs: Add platform-specific documentation
  gitlab-ci: Add MkDocs documentation support

 .gitlab-ci.yml                       |   9 +-
 docs/CONTRIBUTING.md                 |   1 +
 docs/MAINTAINERS.md                  |   1 +
 docs/NEWS.md                         |   1 +
 docs/api.md                          |  29 ++
 docs/blocklists.md                   | 354 ++++++++++++++++++++++++
 docs/building.md                     |  27 ++
 docs/{chamelium.txt => chamelium.md} |   2 +-
 docs/ci_infrastructure.md            | 390 +++++++++++++++++++++++++++
 docs/code_coverage.md                |  68 +++--
 docs/cross-building.md               | 240 +++++++++++++++++
 docs/cross-building.txt              | 122 ---------
 docs/css/extra.css                   | 323 ++++++++++++++++++++++
 docs/download.md                     |  25 ++
 docs/faq.md                          |  92 +++++++
 docs/how_to_build_docs.md            |  54 ++++
 docs/index.md                        | 159 +++++++++++
 docs/issues.md                       |  31 +++
 docs/new_driver.md                   | 231 ++++++++++++++++
 docs/patchwork.md                    |  18 ++
 docs/platforms.md                    |  80 ++++++
 docs/requirements-docs.txt           |   3 +
 docs/running_tests.md                | 130 +++++++++
 docs/test_categories.md              | 266 ++++++++++++++++++
 docs/test_documentation.md           |  66 +++--
 docs/test_plan.md                    | 216 +++++++++++++++
 mkdocs.yml                           | 177 ++++++++++++
 27 files changed, 2922 insertions(+), 193 deletions(-)
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
 create mode 100644 docs/index.md
 create mode 100644 docs/issues.md
 create mode 100644 docs/new_driver.md
 create mode 100644 docs/patchwork.md
 create mode 100644 docs/platforms.md
 create mode 100644 docs/requirements-docs.txt
 create mode 100644 docs/running_tests.md
 create mode 100644 docs/test_categories.md
 create mode 100644 docs/test_plan.md
 create mode 100644 mkdocs.yml

-- 
2.51.0

