Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82963C77B7C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 14:02:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390B510E854;
	Thu,  3 Jul 2025 14:02:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lBCeUAyP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8D710E854
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 14:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751551328; x=1783087328;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ig3YabUqYeJxK2K/jcndzRKHg+URdh+3vnfsqEGQhb8=;
 b=lBCeUAyPFzmkcdO9t39sEmoyI5PcQNFWzeWRioMKp6loCdKAhdLt+CD/
 zdtkFCj2QccNxnbntIwxhf5GJHpUoES0MEnCRyttF3sBuoCmi1aDYW1oB
 +KCnfsqS69X0xPc14vADUS92AD5EvRYYcoBlJ+m/76B+2wiv69DKFDaCj
 5pMnuYZcr8oqPq0BnBt4ChmxvFgBaIUAlRgN8JZ4Mjh1IWJN94tuYosvA
 yZyW9Ov76Iq2Mee59JQlccDZ170PRGd6P0MwGMiNITRmtf6UmGuCvaqXE
 X1Vrz+CsJA+yXMUeh/zZqZV6htGLTpFl1iAbQ8Uy+ibPt7jHd5p9XP0VN w==;
X-CSE-ConnectionGUID: a13trT1WSiqQQNi0YaZGcg==
X-CSE-MsgGUID: +4zl0UpCTOyeBXFo/swqFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53974698"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="53974698"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 07:02:07 -0700
X-CSE-ConnectionGUID: Kejir33qTry93z/el+juUg==
X-CSE-MsgGUID: FhbgVNOiQXq4c71KxPe0uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="154145934"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.120])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 07:02:05 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v1 0/2] intel-ci: Rename i915 blocklist and testlists
Date: Thu,  3 Jul 2025 16:01:56 +0200
Message-ID: <20250703140158.136166-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

Lets make our block/test/lists similar to Xe and rename them,
adding 'i915-' prefix to fast-feedback, and 'i915.' to rest.

Cc: Ewelina Musial <ewelina.musial@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

Kamil Konieczny (2):
  intel-ci: rename i915 blocklists
  intel-ci: rename i915 testlists

 tests/intel-ci/README                          | 18 +++++++++---------
 ...i915-fast-feedback-chamelium-only.testlist} |  0
 ...ck.testlist => i915-fast-feedback.testlist} |  0
 ...-merge.txt => i915.blocklist-pre-merge.txt} |  5 +++--
 .../{blacklist.txt => i915.blocklist.txt}      |  0
 ...y.testlist => i915.chamelium-only.testlist} |  0
 tests/intel-ci/meson.build                     | 10 +++++-----
 tests/intel/i915_test_config.json              |  4 ++--
 tests/intel/kms_test_config.json               |  8 ++++----
 9 files changed, 23 insertions(+), 22 deletions(-)
 rename tests/intel-ci/{fast-feedback-chamelium-only.testlist => i915-fast-feedback-chamelium-only.testlist} (100%)
 rename tests/intel-ci/{fast-feedback.testlist => i915-fast-feedback.testlist} (100%)
 rename tests/intel-ci/{blacklist-pre-merge.txt => i915.blocklist-pre-merge.txt} (97%)
 rename tests/intel-ci/{blacklist.txt => i915.blocklist.txt} (100%)
 rename tests/intel-ci/{chamelium-only.testlist => i915.chamelium-only.testlist} (100%)

-- 
2.49.0

