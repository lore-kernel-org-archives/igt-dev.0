Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6804E606A32F
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 15:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hCrtqzU6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DBC10E541;
	Wed, 18 Nov 2026 15:49:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E09510FE11
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 15:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795016742; x=1826552742;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RL+AVZJ34VNS3XgcHJQBD8LII4sO2hu7pjNWlZzakKw=;
 b=hCrtqzU6Rucf81rXGR4wi1Wv84lze3hK0Ry5FY/wlsr7DzPe/Q5DqUlk
 KONUFZ9NCJkvDcfv6CXeh+2mMIsO9SY5ygIerKhaE4/HQyQ+gLoTtvfLh
 PcC8vcU3onKBlYVfVwlpVbGDAp5neTtpaOpNFbeY98gOMacMyDMq+Xrnn
 wWS8S5ijcZN5P+8MT23dc6G5bzzEcerHglDKUM3495yh+JbqeQrXgBvJM
 Q14cuK0rg8xvihhS66sWQfGON1OXjPwUr0e+c7Pk5kOqfrDCrO1sbHvPW
 ADzoYPs6SrCR4sdOFh6l/ZthmcAm8RiYxMJ1ucUxGr0S8JICt49o/Y0Ny g==;
X-CSE-ConnectionGUID: RK3ZjIhdRauAuBu8TmQlhQ==
X-CSE-MsgGUID: CV1m1sAKR3Cfm4bHedzjnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3720371"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3720371"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:45:42 -0800
X-CSE-ConnectionGUID: 96MgWDsnRPmgoPU/gN0XRA==
X-CSE-MsgGUID: UvCsiCpjQzeUAHQN4nPt2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10319402"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:45:40 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, pranay.samala@intel.com, karthik.b.s@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 5/8] lib/igt_kmod: Unload intel_display together with
 the GPU driver
Date: Wed, 18 Nov 2026 21:14:20 +0530
Message-ID: <20261118154426.345883-6-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118154426.345883-1-jeevan.b@intel.com>
References: <20261118154426.345883-1-jeevan.b@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With display split into a dedicated intel_display module, it stays loaded
after i915 or xe is removed and keeps its module parameters, so a driver
unload followed by a load with display parameters (e.g. disable_display=1)
is not a real reload.

Make __igt_intel_driver_unload() and igt_xe_driver_unload() also unload
intel_display. It is left alone when another GPU driver still holds it,
since igt_kmod_unload() would otherwise remove the holders as well. No
change on kernels where display is built into the GPU driver.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_kmod.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 76680fca5..4161d3c8d 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -585,6 +585,38 @@ int igt_audio_driver_load(char **who)
 	return ret;
 }
 
+/*
+ * With display split into a dedicated intel_display module, it stays loaded
+ * after the GPU driver is removed and keeps its module parameters. Unload it
+ * as well so that a driver unload is a full unload.
+ *
+ * It is left alone when still in use by another GPU driver, as
+ * igt_kmod_unload() would otherwise unload the holders too. Does nothing on
+ * kernels where display is built into the GPU driver.
+ */
+static int intel_display_unload_if_unused(void)
+{
+	DIR *d;
+	struct dirent *de;
+	bool in_use = false;
+
+	if (!igt_kmod_is_loaded("intel_display"))
+		return 0;
+
+	d = opendir("/sys/module/intel_display/holders");
+	if (d) {
+		while ((de = readdir(d))) {
+			if (strcmp(de->d_name, ".") && strcmp(de->d_name, "..")) {
+				in_use = true;
+				break;
+			}
+		}
+		closedir(d);
+	}
+
+	return in_use ? 0 : igt_kmod_unload("intel_display");
+}
+
 int __igt_intel_driver_unload(char **who, const char *driver)
 {
 	int ret;
@@ -624,6 +656,16 @@ int __igt_intel_driver_unload(char **who, const char *driver)
 		}
 	}
 
+	if (strcmp(driver, "intel_display")) {
+		ret = intel_display_unload_if_unused();
+		if (ret) {
+			if (who)
+				*who = strdup_realloc(*who, "intel_display");
+
+			return ret;
+		}
+	}
+
 	return 0;
 }
 
@@ -763,6 +805,9 @@ int igt_xe_driver_unload(void)
 	if (igt_kmod_is_loaded("xe"))
 		return IGT_EXIT_FAILURE;
 
+	if (intel_display_unload_if_unused())
+		return IGT_EXIT_FAILURE;
+
 	return IGT_EXIT_SUCCESS;
 }
 
-- 
2.43.0

