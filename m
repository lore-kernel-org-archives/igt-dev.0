Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83158ECD9B0
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 01:06:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E86F10E1FF;
	Fri,  6 Feb 2026 01:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZQPGf6iL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809C210E1FF
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 01:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770339960; x=1801875960;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YlP8zRnjyS3Rdfz9nQZS/mp05CcgYbn8LCl+GRbdZvI=;
 b=ZQPGf6iLRgFXZGwWdlaPPIO5GxAIQfslICUtF6vtpxiYY9p1vLTtHoZF
 zhsdpUTkscnWAPX2YctIyWJOuDkCNj3rZSC96eTZmzGiX1wf2QChWyEco
 27GQM7MItiEojJqkXoToLgGrvT2QgPRpGCL7I2XxL+1i6bdWTf6p6A/3p
 2VgDzpgVqPCg/Zoqeuq7B3xT0vnagfCn1Yd3sdNhNqxdiLWvMntXPwLoX
 wvUvU6fzckuxeLUj3hUWkX9eK+JjdUsqXGNd7lr0WKxz8g3SIryPzqKPX
 PxaHI3ch1Ocsd4JW7tJgvSj0FSVLp3ehebduBXhEa0NoK9iaNKnPEQxhh w==;
X-CSE-ConnectionGUID: Y2UzjBzuSMqSbXgL6Ci6yg==
X-CSE-MsgGUID: Wt4+K5EtSUK4hRSJcNIq4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="82919018"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="82919018"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 17:06:00 -0800
X-CSE-ConnectionGUID: FlRQ5b0tSpiUiboGjNv53Q==
X-CSE-MsgGUID: sU1R9yjWRxOQKJXwaD0VRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="210115652"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.188])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 17:05:59 -0800
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v1 0/4] Replace gtk-doc with mkdoxy(MkDocs) for API
 reference
Date: Fri,  6 Feb 2026 02:05:47 +0100
Message-ID: <20260206010551.267237-1-pawel.sikora@intel.com>
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

Dear maintainers,
This patch ports our API documentation by switching from gtk-doc to mkdoxy(MkDocs) with Doxygen.

Reasons to change from gtk-doc:

1. Unified toolchain: Only MkDocs needed, no external tools
2. Integrated docs: API reference now part of main docs, not external link
3. Simpler workflow: One build system for all documentation

This is a first step. Our current documentation markup has issues - missing docs,
inconsistent formatting - that prevent both mkdocs and Sphinx plugins from working optimally.
Once we clean up the markup across lib/tests, we can re-evaluate tools like Hawkmoth or other
modern solutions. Or create a Hawkmoth integration into MkDocs via plugin.

For now, this gives us:

* Immediate improvement (unified tools, integrated docs)
* Reliable parsing (Doxygen handles existing comments)
* Foundation for future cleanup

What's included:

* mkdoxy integration within MkDocs replacing gtk-doc
* API reference page and test glossary generation
* Updated build configuration

Kind Regards,
Pawel Sikora

Pawel Sikora (4):
  mkdocs.yml: add mkdoxy and mdx_linkify
  scripts: add scripts to support api reference docs
  docs: add API Reference user docs
  .gitlab-ci: add generation of API Reference with mkdocs

 .gitlab-ci.yml                        |   4 +-
 docs/api.md                           |   2 +
 docs/api_reference.md                 | 114 ++++++++++++
 docs/api_tests_glossary.md            |   5 +
 docs/requirements-docs.txt            |   2 +
 mkdocs.yml                            |  63 ++++++-
 scripts/list_of_tests_to_md.py        | 250 ++++++++++++++++++++++++++
 scripts/update_igt_version_in_docs.py |  75 ++++++++
 8 files changed, 513 insertions(+), 2 deletions(-)
 create mode 100644 docs/api_reference.md
 create mode 100644 docs/api_tests_glossary.md
 create mode 100644 scripts/list_of_tests_to_md.py
 create mode 100644 scripts/update_igt_version_in_docs.py

-- 
2.51.0

