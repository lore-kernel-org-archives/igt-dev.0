Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098EAD0D169
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 18:42:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2FB10E64F;
	Wed,  7 Jan 2026 18:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ibi26U37";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD21510E64F
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 18:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767811337; x=1799347337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DVm4gh3HyGIdWwHOpAZ4TTwUuKa+xcg6vuFrbtu166Y=;
 b=ibi26U37WhbcDXc9PUHAVLf1HoIMG2Kdh8MzC25zxNMostI8yJgS8WhA
 EbJ835UNpnWYcQLZwrRRmAPJ6FhOfAaFwbmRCGGur0ywH91IaDGhMv24n
 y/GcarIh6calYDNC3UVqKl/Yu5aJOoRTXU9g9mX+iwluF1I8WQjhL32zp
 vAC+OxYyYOpit9ajdUpf14leONhmijrRVEAint3QPmR8NuwaQtW+3a8zy
 6Z4NVq19OAIIigU+PHHUTQhlmP5LTmM4E/fSZ3sgFzKmOwQsIpVRhnabO
 WsC863st9LONs+mdYsAkDzdzau54k40YHBRFbDwwhcoCHQDNk0YO69EkI g==;
X-CSE-ConnectionGUID: jtfC3EkxQ7eHN2RLZIev4A==
X-CSE-MsgGUID: TUPbBw0oTc2TdxHSoeC+Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69236251"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="69236251"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:42:17 -0800
X-CSE-ConnectionGUID: uua7rQIWSkynaGAXclKZHg==
X-CSE-MsgGUID: ipW20ytbSey3Eki6+GWmGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="202199867"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:42:15 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v4 1/6] tools: Rename tools/gputop to tools/gputop.src
Date: Thu,  8 Jan 2026 00:07:34 +0530
Message-Id: <20260107183739.84597-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107183739.84597-1-soham.purkait@intel.com>
References: <20260107183739.84597-1-soham.purkait@intel.com>
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

