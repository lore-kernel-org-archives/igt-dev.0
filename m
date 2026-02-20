Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3BBC56205
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 15:01:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0289610E362;
	Fri, 20 Feb 2026 15:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Akzto3NV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C7F10E362
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 15:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771599696; x=1803135696;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dU0ytLA4sbQuI8HO3skKgO70WOa9QXniAWIlUGXGL20=;
 b=Akzto3NVSsTeGR0CYQjsXpja9le9iRaGivffpP3yrHSR0jHlr4WgkTOI
 ebqHVYSB7swgVs5Oug6gZqAEqra0PTnhlfqMLqfIeikjNUBaKUQpAQmw+
 QvEwITT4H8cGbXcLl/+20m6Gt9C/Cz4d/VMgXYW40h7uv1GRKE6JKqBUi
 TnWBXDf3lGWd8YVolPfcL8Pe9tgTQLWzg9n/EDn/MZFPx5n3YlwZ4CQ98
 HV7K4tjOMl6ET5bIIyzjT4UuhNoWwlJszjMIbRjAwG5SfMbq0fYCddbYm
 bi968Ca8YJc1txmcaI/B1CXKSthpeTCxY+vsVLUxOpPVW5kT5+PcFoTS9 g==;
X-CSE-ConnectionGUID: Xnf8o/+QSrOtYzr6x483gw==
X-CSE-MsgGUID: znAzOUXgTyiv1OonXPF0SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="71896933"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="71896933"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:01:36 -0800
X-CSE-ConnectionGUID: UOYys8GoSFKtcf29ovICug==
X-CSE-MsgGUID: Hd98UC+NRR2hi68Y8MRtlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="245456099"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.6])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:01:35 -0800
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v1 0/6] Replace gtk-doc with cdoc(MkDocs) for API
 reference
Date: Fri, 20 Feb 2026 16:01:54 +0100
Message-ID: <20260220150202.1013804-1-pawel.sikora@intel.com>
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

This series supersedes the previous mkdocs-based API reference generation approach:
https://patchwork.freedesktop.org/series/161238/

The key change in this new series is the switch from mkdoxy to mkdocs-cdoc:
https://github.com/pawelsikora/mkdocs-cdoc/ for generating API reference documentation. 

The mkdocs-cdoc plugin offers several advantages:

1. Similar tooling used as Hawkmoth, providing a familiar workflow for documentation generation
2. No dependency on Doxygen, simplifying the build process and reducing external dependencies
3. Direct parsing of C source code using libclang Python bindings and fallback to regular regex
parsing if clang is not available.

Additionally, gtk-doc markup in the current documentation stays as it is, as mkdocs-cdoc converts
it on the fly. This allows the future transition of multiple files to happen later, not within this
patchset. It also handles reStructuredText in documentation markup comments, allowing for a future
transition of the markup and a potential decision to migrate to Sphinx or use it alongside MkDocs
or other Markdown-based tools for documentation generation.

The series introduces the following changes:

Patch 1: Add mkdocs-cdoc plugin and mdx_linkify extension to mkdocs configuration. API reference
build is split into igt-tests for 'tests' and igt-lib for 'lib' directories.
Patch 2: Add separate API reference introduction pages for index, lib, and tests. These pages are
used by the cdoc plugin and are not included directly in the navigation config.
Patch 3: Update Debian and Fedora dockerfiles to include clang Python bindings and clang
development libraries required by mkdocs-cdoc.
Patch 4: Adjust CSS to set initial max-width for navigation and table of contents, improving
readability when code examples are rendered side by side with explanations.
Patch 5: Update API documentation URLs in lib/intel_batchbuffer to match the new cross-referencing
format.
Patch 6: Simplify GitLab CI by removing gtk-doc and meson build steps; the cdoc plugin
configuration now handles API reference generation via 'mkdocs build'.

Build as before, first dependencies:
$ pip install -r docs/requirements-docs.txt

Then:

$ mkdocs build
to build static html pages.

or
$ mkdocs serve

to run the web server.

Looking forward to your comments,
Kind Regards,
Pawel Sikora

Pawel Sikora (6):
  mkdocs.yml: add mkdocs-cdoc and mdx_linkify
  docs: add pages for API reference introduction
  dockerfiles: update debian and fedora dockerfiles
  docs/css/extra.css: make nav/toc initial max width
  lib/intel_batchbuffer: update api docs url
  gitlab-ci: move api page build to MkDocs(cdoc)

 .gitlab-ci.yml                  |  3 --
 Dockerfile.build-debian         |  4 +-
 Dockerfile.build-debian-minimal |  4 +-
 Dockerfile.build-fedora         |  1 +
 docs/api-intro.md               | 81 +++++++++++++++++++++++++++++++++
 docs/css/extra.css              |  4 ++
 docs/requirements-docs.txt      |  2 +
 docs/running_tests.md           |  2 +-
 docs/tests-intro.md             | 46 +++++++++++++++++++
 lib/intel_batchbuffer.c         |  2 +-
 mkdocs.yml                      | 32 ++++++++++++-
 11 files changed, 172 insertions(+), 9 deletions(-)
 create mode 100644 docs/api-intro.md
 create mode 100644 docs/tests-intro.md

-- 
2.51.0

