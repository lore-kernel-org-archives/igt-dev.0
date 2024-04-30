Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5716C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 30 Apr 2024 19:01:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39759112E6C;
	Tue, 30 Apr 2024 19:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O1r2N+L3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F50E112E6C
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Apr 2024 19:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714503688; x=1746039688;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0P3UQIhtpV/CmVbWB0v4jDYlh8Rn9uUjpVecUnWoPUk=;
 b=O1r2N+L3HVh04Og+LMQULVn5xS15cccTLeRC5CkFMOBSoqqObfZC/8zS
 awZKJfcym0t0Z2GvnME9FQo0yRXxF8xqKzC6AQns/Zf5TCMcCZIVRLIuC
 b6I218EuluFtlFCDP2V8aBAy7AIvl04CVq4ngUV4A2ABKPEgDHXriKwlm
 UD4u2wBgCGGbU6YcXCkz+CO3NTYidt6VwDl+7fr288HRsFQcqIM3Tu9rG
 sdCdzXcnTaQ66CaEtXdibGR80+jcQB5JerYRljkl0LL+F06ySJM34pQf0
 0DsE1dtWkRrlDsbH2xklU/jPRrhCa1/kbIU+4/pBs38iMcfPMj22BDFiQ Q==;
X-CSE-ConnectionGUID: uFT3X316SyW/DF/9v59gmQ==
X-CSE-MsgGUID: dnQ9CQlaTjSrzVLojWDmVw==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="14025090"
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="14025090"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 12:01:27 -0700
X-CSE-ConnectionGUID: ctWnKLKWQfi35gAtPsbxTg==
X-CSE-MsgGUID: GGXaAwgpTOuDCXP6/Va4cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="26570786"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 12:01:28 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [CI 1/6] lib/igt_drm_fdinfo: Fix wrong name len assert
Date: Tue, 30 Apr 2024 12:01:45 -0700
Message-ID: <20240430190150.3654507-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

When parsing engine name, at this point we have something like:

	"drm-engine-render:	232409619162 ns"
	            ^      ^
	            |      |
	          name     p

We are copying the engine name to the final destination, but
strlen(name) will actually contain the entire string. Since we already
know the name length, calculated previously, just use it for copying the
string.

Since each name is 256-bytes long, the assert doesn't trigger easily,
but it's better to be correct. And more efficient.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 18dbb5d0b..a1f4ad10d 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -90,8 +90,9 @@ static int parse_engine(char *line, struct drm_client_fdinfo *info,
 
 		if (found < 0) {
 			assert((info->num_engines + 1) < ARRAY_SIZE(info->names));
-			assert((strlen(name) + 1) < sizeof(info->names[0]));
-			strncpy(info->names[info->num_engines], name, name_len);
+			assert(name_len  < sizeof(info->names[0]));
+			memcpy(info->names[info->num_engines], name, name_len);
+			info->names[info->num_engines][name_len] = '\0';
 			found = info->num_engines;
 		}
 	}
-- 
2.43.0

