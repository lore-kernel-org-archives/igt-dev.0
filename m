Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A367C606A324
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 09:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OyuDZHhL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3461128DD;
	Fri, 27 Nov 2026 09:39:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA831128FF
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 09:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795772317; x=1827308317;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zQ7CL9CyIzedATvi7xgRdqjxSTiGcV8+YO1JAX2VCkg=;
 b=OyuDZHhLNsil0B5yXlzqyEGBgpnmZ+gU/aZ/jivdZXB9NSwo/Aq540PH
 uLD8j2rwBEkfH1W+V8Awb9Cib7sQ7C6Qyoyr4XF9XIkixwK7I4mDEOt5U
 yMEN48MkNDuCH9x3pzKP9gBNYqbfrP/WfbZxDW4ceLtfJzd2mLMop7GdO
 pZtv44QOkceKehCPkmun135HlBUU8nXQz0HdUXa59aaibGdNNBGzVWxQI
 WQ2ZoqH11QtVWipIAMj6uU+5WTo6YhkJ6M5GFq0bcTPfTe2UVi2L5SKft
 fTN3nQ+OU0NJHHH87ChbTCTXX33no8RaHXmb1GdQo2hcHYoM+D4OA20hb w==;
X-CSE-ConnectionGUID: h5LMJje5SPaqReH7ftBSrw==
X-CSE-MsgGUID: tvxODPpSTpaAecVbHf27oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4593220"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4593220"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 01:38:37 -0800
X-CSE-ConnectionGUID: Wd8ASrIWTJGJlcqYpnBZew==
X-CSE-MsgGUID: SaQJVgo1QbmZFKBv+8zFTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12501338"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 01:38:35 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>, Jeevan B <jeevan.b@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t 0/2] Move the Intel joiner helpers to lib/igt_joiner
Date: Fri, 27 Nov 2026 15:05:08 +0530
Message-ID: <20261127093510.2291076-1-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

igt_kms.[ch] is meant to be generic, but it carries a lot of Intel
specific pipe joiner code. The remaining joiner helpers live in
tests/intel/kms_joiner_helper.[ch], which is built into each test that
needs it, so it can't be used by the library or by generic tests.

Patch 1 moves kms_joiner_helper.[ch] to lib/igt_joiner.[ch]. Patch 2
moves the Intel joiner code out of igt_kms.[ch] into it. This also
resolves the TODO added to igt_kms.c in commit 3830ca6a5068 ("lib/igt_kms:
Add support to check joiner mode limit") to move these helpers to the
joiner specific library file.

Both are pure code moves with no functional change. The checkpatch
findings on patch 2 are on the moved code as is.

Cc: Jeevan B <jeevan.b@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>

Karthik B S (2):
  lib/igt_joiner: Move kms_joiner_helper to the library
  lib/igt_joiner: Move the Intel joiner helpers out of igt_kms

 lib/igt.h                          |   1 +
 lib/igt_joiner.c                   | 929 +++++++++++++++++++++++++++++
 lib/igt_joiner.h                   |  69 +++
 lib/igt_kms.c                      | 642 +-------------------
 lib/igt_kms.h                      |  36 --
 lib/meson.build                    |   1 +
 tests/intel/kms_dp_link_training.c |   2 +-
 tests/intel/kms_dsc_helper.h       |   2 +-
 tests/intel/kms_joiner.c           |   2 +-
 tests/intel/kms_joiner_helper.c    | 290 ---------
 tests/intel/kms_joiner_helper.h    |  31 -
 tests/intel/kms_mmap_write_crc.c   |   1 +
 tests/intel/kms_mst.c              |   2 +-
 tests/meson.build                  |  16 +-
 14 files changed, 1011 insertions(+), 1013 deletions(-)
 create mode 100644 lib/igt_joiner.c
 create mode 100644 lib/igt_joiner.h
 delete mode 100644 tests/intel/kms_joiner_helper.c
 delete mode 100644 tests/intel/kms_joiner_helper.h

-- 
2.43.0

