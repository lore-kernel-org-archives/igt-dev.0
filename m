Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD31C83F17
	for <igt-dev@archiver.kernel.org>; Thu, 31 Jul 2025 07:58:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7880E10E255;
	Thu, 31 Jul 2025 07:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hLI0rFIu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA0310E255
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Jul 2025 07:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753948732; x=1785484732;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z5n80YZwEmogk+fjq0XERLPVrF8V3iFgbxe0PYWildA=;
 b=hLI0rFIuX1R1G5mMEVVselfTUQwyxHWkBaoFuLrsuYd/1PnIcgrcbJLK
 jknteqIZhEE+JipbN18IwfAzQFoGiCoHYWMHRX9jBgufD4xckalVYelGr
 6tenkYMu70ihQKhl2x4KmCg23oe5J+bsuLxmDD4WfVQqHgum/kebpRybp
 SX3PxZg60Np0kpEQHwGMy9qzvlNEFmgybjmyDLA8YTazM81j6nKgwFzhH
 nbMDQU1aLy+kD8jahXdi8sL9MBD3xW1aJfy+ckk88MmSLy6vXQ4+o8k18
 yMyO+pjdTCe9wsjjkL8MYU6Yjt3UT/O4GZqFy5C70OvbO68oXeF5IGXCo w==;
X-CSE-ConnectionGUID: N0nIXzXqQ5ifhthITFcSTw==
X-CSE-MsgGUID: ikp6t9WjRMqCzZzTA0TWzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56411015"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="56411015"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 00:58:52 -0700
X-CSE-ConnectionGUID: U9JumNoJQ8G3Hk7YVhVJcQ==
X-CSE-MsgGUID: PUJauhhWTGal1JRkC1cLSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="168473973"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa004.fm.intel.com with ESMTP; 31 Jul 2025 00:58:50 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, imre.deak@intel.com,
 anshuman.gupta@intel.com, dlemoal@kernel.org
Subject: [PATCH i-g-t] lib/igt_pm: Skip LPM policy control on unsupported SATA
 hosts
Date: Thu, 31 Jul 2025 13:11:06 +0530
Message-Id: <20250731074106.2495505-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
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

With [1], LPM policy control is now disabled for external SATA ports.
This led to a regression in our CI runs [2]. Discussions on the regression
resulted in patch [3] which introduces a new sysfs entry, querying
which we can determine if LPM policy control is allowed on a host or not.

Store/Re-store LPM policy only when it is allowed. If the sysfs entry is
not present assume LPM policy control is allowed. This  maintains backward
compatibility.

[1] https://lore.kernel.org/linux-ide/20250701125321.69496-8-dlemoal@kernel.org/
[2] https://lore.kernel.org/linux-ide/07563042-6576-41cd-9a95-de83cfc95de1@intel.com/
[3] https://lore.kernel.org/linux-ide/20250730001947.332661-1-dlemoal@kernel.org/

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 lib/igt_pm.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index cf1c442f8..1ffcdcef3 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -321,6 +321,35 @@ void igt_pm_enable_audio_runtime_pm(void)
 		igt_debug("Failed to enable audio runtime PM! (%d)\n", -err);
 }
 
+static bool lpm_supported_by_sata_host(int host_num)
+{
+	int fd;
+	ssize_t len;
+	char buf[2];
+	char file_name[PATH_MAX];
+
+	snprintf(file_name, PATH_MAX,
+		 "/sys/class/scsi_host/host%d/link_power_management_supported",
+		 host_num);
+
+	fd = open(file_name, O_RDONLY);
+
+	/* assume LPM is supported if sysfs entry is absent. This preserves default behaviour */
+	if (fd < 0)
+		return true;
+
+	len = read(fd, buf, 1);
+
+	close(fd);
+
+	if (len <= 0)
+		return true;
+
+	buf[len] = '\0';
+
+	return buf[0] == '1';
+}
+
 static void __igt_pm_enable_sata_link_power_management(void)
 {
 	int fd, i;
@@ -372,6 +401,9 @@ static void __igt_pm_enable_sata_link_power_management(void)
 	igt_install_exit_handler(__igt_pm_sata_link_pm_exit_handler);
 
 	for (i = 0; i < __scsi_host_cnt; i++) {
+		if (!lpm_supported_by_sata_host(i))
+			continue;
+
 		snprintf(file_name, PATH_MAX,
 			 "/sys/class/scsi_host/host%d/link_power_management_policy",
 			 i);
@@ -412,6 +444,9 @@ static void __igt_pm_restore_sata_link_power_management(void)
 	for (i = 0; i < __scsi_host_cnt; i++) {
 		int8_t policy;
 
+		if (!lpm_supported_by_sata_host(i))
+			continue;
+
 		if (__sata_pm_policies[i] == POLICY_UNKNOWN)
 			continue;
 		else
-- 
2.25.1

