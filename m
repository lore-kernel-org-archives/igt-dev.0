Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F09D0D157
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 18:32:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4089710E24E;
	Wed,  7 Jan 2026 18:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSWDq+lJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F19E10E24E
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 18:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767810723; x=1799346723;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DVm4gh3HyGIdWwHOpAZ4TTwUuKa+xcg6vuFrbtu166Y=;
 b=mSWDq+lJe7OD9rGgnD/bVEtfvh+KcSvb9CwbyQfsm2GnrndZinTF4VcP
 TVGvHAZLeqvdc7fa++jSXMUJoDaTNv+IYtKoQIIjT7WoMPcXfzApHREdF
 mNEnmjV9ReCEn8e6U47sEalRVkGfC61UlakSqDIDcr3UyhKWhcBTTngUd
 myaKQL35wUhixOuDR8R9WbOWRQlDYWFjdAfrHqNQAHByWSHC/97enwIXN
 jjOIlAkRBuJ39VdpZJTgCpEJrVfNSuZBnFF6FDHiYmM9/yWaNUD5hGh8/
 zBSgRDjKTObKSVlbYbagQOEKaVyuDZ89QvXV7lBPhsZTyf/+wNeYkThUr g==;
X-CSE-ConnectionGUID: uEtvevpDRLuOiMvqi8moqw==
X-CSE-MsgGUID: ytcy0HO0QHai2rJdnMYF+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="80549391"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="80549391"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:32:03 -0800
X-CSE-ConnectionGUID: hN459u/8Q9WkFft+YXywkw==
X-CSE-MsgGUID: hHDqxr75Sa2ICYdOc++lBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="207845950"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:31:28 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v4 1/6] tools: Rename tools/gputop to tools/gputop.src
Date: Wed,  7 Jan 2026 23:56:49 +0530
Message-Id: <20260107182654.84173-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107182654.84173-1-soham.purkait@intel.com>
References: <20260107182654.84173-1-soham.purkait@intel.com>
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

The GPUTOP source directory is renamed to gputop.src
under tools/ path and gputop.c under tools/ is also moved
under tools/gputop.src, to implement engine busyness in
gputop.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tools/{ => gputop.src}/gputop.c          | 0
 tools/{gputop => gputop.src}/utils.c     | 0
 tools/{gputop => gputop.src}/utils.h     | 0
 tools/{gputop => gputop.src}/xe_gputop.c | 0
 tools/{gputop => gputop.src}/xe_gputop.h | 0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename tools/{ => gputop.src}/gputop.c (100%)
 rename tools/{gputop => gputop.src}/utils.c (100%)
 rename tools/{gputop => gputop.src}/utils.h (100%)
 rename tools/{gputop => gputop.src}/xe_gputop.c (100%)
 rename tools/{gputop => gputop.src}/xe_gputop.h (100%)

diff --git a/tools/gputop.c b/tools/gputop.src/gputop.c
similarity index 100%
rename from tools/gputop.c
rename to tools/gputop.src/gputop.c
diff --git a/tools/gputop/utils.c b/tools/gputop.src/utils.c
similarity index 100%
rename from tools/gputop/utils.c
rename to tools/gputop.src/utils.c
diff --git a/tools/gputop/utils.h b/tools/gputop.src/utils.h
similarity index 100%
rename from tools/gputop/utils.h
rename to tools/gputop.src/utils.h
diff --git a/tools/gputop/xe_gputop.c b/tools/gputop.src/xe_gputop.c
similarity index 100%
rename from tools/gputop/xe_gputop.c
rename to tools/gputop.src/xe_gputop.c
diff --git a/tools/gputop/xe_gputop.h b/tools/gputop.src/xe_gputop.h
similarity index 100%
rename from tools/gputop/xe_gputop.h
rename to tools/gputop.src/xe_gputop.h
-- 
2.34.1

