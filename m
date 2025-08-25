Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2934CA0FEE
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 16:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E82010E4F8;
	Mon, 25 Aug 2025 16:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HVxZYSuU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C5C10E4FB
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 16:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756137605; x=1787673605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qGI/RwzR8183dG7x4Gaz5857+5nWgTdA/oghICevrx4=;
 b=HVxZYSuUd0RTCmql8Ah0zD9YasSK5RXyutXILdNQXjWL6hAiRjTtYE+G
 32FkSMNY8v0z59Tn0gyNig5/zgiyX9Bzbp0+qJp33c/obhHjFyWzrLvSS
 6SI9k5/7tUN6SA/KNPHfVTFkgsHDNJEQ1va6nutVChFiqTvzaLTLiD7zH
 6ZGA/RirOMAPfreXS//jydAkzarFi7gTJOme9u5gO91M5ZArHAihZyQ98
 rfm/HQ/qtgo759QUg/khPkLpTRp498+psWmclTBZEuLa08sKjyF4Errll
 oea0tR4G7+ziHjIFVGypQLoEJGvrgkx9HGKc51nIfPBMZGwBFPtZZH6DZ w==;
X-CSE-ConnectionGUID: +Vcpk8hvQ5OnevSJB7zCvA==
X-CSE-MsgGUID: Id1KooIwRHaHfFQWGL75dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="68948333"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="68948333"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 09:00:04 -0700
X-CSE-ConnectionGUID: PyKqALNsRGyal+zf6rLtZw==
X-CSE-MsgGUID: 2f+cqkMkQOm9gk+thLZaSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="168578249"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 09:00:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH i-g-t v2 4/4] tests/intel/xe_configfs: Reset all custom
 settings on exit
Date: Mon, 25 Aug 2025 08:59:46 -0700
Message-ID: <20250825-configfs-unbind-v2-4-62e7508d3ed7@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825-configfs-unbind-v2-0-62e7508d3ed7@intel.com>
References: <20250825-configfs-unbind-v2-0-62e7508d3ed7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

When exit, make sure there's not device configfs settings, otherwise it
could impact tests running after this.

Reviewed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_configfs.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 4f8b873d2..086f99ba5 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -26,7 +26,17 @@ static char bus_addr[NAME_MAX];
 
 static void restore(int sig)
 {
+	int configfs_fd;
+
 	igt_kmod_unbind("xe", bus_addr);
+
+	/* Drop all custom configfs settings from subtests */
+	configfs_fd = igt_configfs_open("xe");
+	if (configfs_fd >= 0)
+		igt_fs_remove_dir(configfs_fd, bus_addr);
+	close(configfs_fd);
+
+	/* Bind again a clean driver with no custom settings */
 	igt_kmod_bind("xe", bus_addr);
 }
 
@@ -164,7 +174,6 @@ igt_main
 		test_engines_allowed(configfs_device_fd);
 
 	igt_fixture {
-		igt_fs_remove_dir(configfs_fd, bus_addr);
 		close(configfs_device_fd);
 		close(configfs_fd);
 	}

-- 
2.50.1

