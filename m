Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87809C9832A
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 15:51:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2361A10EF7C;
	Tue, 29 Sep 2026 15:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TQtjILQf";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011007.outbound.protection.outlook.com
 [40.93.194.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF31110E1AD
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 15:50:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSsMqffscF1P+a75tQ+raw3djdRx854gdY6NziRxLGjFa0ITRvNHR9yFwhf9NOEP/KGYmTGA8N2m9fKqr0IgBabv54o4Llx2CzeEbaAY4/GQdoqe4g78BPMQ4/ncingpLjWWqBfLdh+BCCkz2IiUyxEMY9ovzgoZrjU5L3suamSGciCQZuRjFziPVUxFpgt5ZTp7S6v85h0534a0WjR5THvMbvLh1Dh3jt3CG2i+U0uJmz7KfliisLEOF/zn8IvgUaUR+T3pTAu7CrCGDnuFCp5+JX++aKJ8zclijE0AWkOG3NsVMTevykFfvNM6BUwGxSHySY3T1qOKNqRYn797hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEfYB6jL2cGuifrYfZdGvy9tKDOUgoZetveWnDNrCbE=;
 b=lHg6hbT7Opro9xRgLJUNKdBqSCPBm4Y1DA57bqn2zdXhu7YEAeJVPG3UcHlK/zShktvzuwbTPJh4OYpBSKHR38H57HO/MaD9mEjWkms/gIGiDS5CdMF6hDh4DerM1zSfXmnQQqh6omLs6EmPjhpDDNzVY81oCd+ME1OOHm3xqlSlh1WJRpBLJnKXmhQ/ZW/m/HptRUNUXK1QT65iU3S0Vtbuw5ZhX4S2YHdZBGRDr7bnvYCrnW9zT+CckqJ9nahLYHrC6VN6QqNezY7Nk1J/Aj9itQ4ZkqpOwlch/e4jkVl5LEN9xx50pVm67fxkqQsw7kBmPMJnth543jQZy7fvcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEfYB6jL2cGuifrYfZdGvy9tKDOUgoZetveWnDNrCbE=;
 b=TQtjILQfeX85l2djxSdh6x8xUopa+NgWTRaNFmJ7R/1IaRsY1pj4LnsVPWM4E8TL6PP5YaqiAvkc4CQ708MJi/7r1sti193oV2Sh/vrJ0F/5tzKda56Q3fN5TAP+wJNF4xwMBBtlS0MCaRiYqX3M5UwmYwwUDBB6EOktd+mKwDE=
Received: from CH2PR10CA0006.namprd10.prod.outlook.com (2603:10b6:610:4c::16)
 by CHBPR12MB463627.namprd12.prod.outlook.com (2603:10b6:610:36c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 15:50:44 +0000
Received: from BN2PEPF0000A805.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::31) by CH2PR10CA0006.outlook.office365.com
 (2603:10b6:610:4c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Tue,
 29 Sep 2026 15:50:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A805.mail.protection.outlook.com (10.167.245.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 15:50:43 +0000
Received: from rocky (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 10:50:42 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alex Hung <alex.hung@amd.com>
Subject: [PATCH i-g-t v2 3/5] lib: Preserve string const qualifiers
Date: Tue, 29 Sep 2026 11:49:48 -0400
Message-ID: <20260929154950.838280-4-alex.hung@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929154950.838280-1-alex.hung@amd.com>
References: <20260929154950.838280-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A805:EE_|CHBPR12MB463627:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d992d34-bfc9-4b25-5c16-08df1e416bc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|10067099003|56012099006|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: pEgdsTlUIqySileV2Gz5+alIJ+mR/wv4LRsWCsD1MCsDqKrLT50h20rheXItVRRqOf/ic+ubza8evT6ayr9z7b3oGgcMUfy+SrqzemL1ynQXHUMhwb8nVdB86POVS5qx1cp76px9rJxRNGeuMa76Ww2jnU/WqosPHBJfYU/u4UHY5fqBfhnonwgJpDNz3XcH64XzGAOVCNjDFslxUM8GkKj2dTTwyR/xQH3JwOWOOjoxih5kepiTXgPF7n4RkAvF1WhNriU/N3tk7DrKWPzahNj86ch23wCacLLqH/ms7MKmrMpwozq1ren3j8cOEuY7iBqqWjA1L/Z+pUepw4j4YXJos23pBvBuly2MewS4VnXaL72l7oFoI5HFtZz4/MFlrnkCRAztrXpnL/t+r5lTa95xfYyx+yoS6ku15fMDFLbRUOE/Fq2xbsDTu1XkUpIr/HjWYwWJPhEgdpLAop6PbHMEQhv3Zsye8c2ZO/NiysQpfPPMBlCBvvbYCBcG3dwavDbzvEo4mVJhK6ADasH1IyUKjIpnJ9tOMFRU20FJe3Dn78JIFevdPl57RyLTTk8W7vWnwJIsnJsmiK0hIGVNH8yAdVsMfMM6VJQQJoSbrKA2KUJiNxjW1vnYFEsiF1lMdIQPXelOpBkk+lPjRtypq3YAVBSHW5cZbM0tOMJU2dR8aUQ63PJ0GCccZrR7KnLDim8Gdi0FUL/uckHAW5fRVg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3opXHibY0i3CEIvB7AD53mhVtk9Mv9rHQFnPLu4sEKftpMQ3dKNPi49f6RCPiEK/0XzX5odRqBRPVGTnzGObkA4ppjzKqdhB1quv8YfD+3+tYL5Twf0kKqiQwehWqQTa4JT3J1GQgqOZAAptJgMJfsyuzoczqJ/feUCN47yEZEx1R5b6h0uYS5Wlkd04E1yUyxIt6BmWWeylf+RJ8J5fHbnexJH+GZKiuv09Pi4xQ/0QS5qYdnmzekh2xPfhLYlqhtd0ULJxmZU6sIwxb8ASE+a6/+XHAHWCLoMHaoR7AnsUvYWwCT1Yr1rb+g8YmZIDsYMZvpvWOLe/q2sbR5Dj8Io5iHK8JcYQ7mV7wCy/QSbdqias6wuM8cOfrhMFYkqm2xEMwSDTqwGLIbC7nhunkHki8MsIFz3AEFAg5MIB47GWvnDyoCghviQLO6rbShtF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 15:50:43.9071 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d992d34-bfc9-4b25-5c16-08df1e416bc2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000A805.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR12MB463627
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

With glibc 2.43, string searches on const input return const pointers.
Storing these results in char * variables causes compiler warnings.

The following warning is observed on Ubuntu 26.04 (wrapped):

  ../lib/igt_drm_fdinfo.c: In function 'parse_region':
  ../lib/igt_drm_fdinfo.c:122:4: warning:
    assignment discards 'const' qualifier from pointer target type
    [-Wdiscarded-qualifiers]

Use const char * for read-only search results and preserve const in
igt_get_dc6_counter() and its callers. Give strtoull() a separate
end pointer in the fdinfo parser so its input pointer can remain
const without a cast.

Assisted-by: Copilot:GPT-6-Astra
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 lib/i915/i915_dp.c   |  2 +-
 lib/igt_core.c       |  2 +-
 lib/igt_drm_fdinfo.c |  7 ++++---
 lib/igt_pm.c         | 10 +++++-----
 lib/igt_pm.h         |  2 +-
 5 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/lib/i915/i915_dp.c b/lib/i915/i915_dp.c
index 3d570f7cc..595010140 100644
--- a/lib/i915/i915_dp.c
+++ b/lib/i915/i915_dp.c
@@ -49,7 +49,7 @@
  */
 static int i915_dp_parse_marked_value(const char *buf, char marked_char, int *result)
 {
-	char *marked_ptr, *val_ptr;
+	const char *marked_ptr, *val_ptr;
 
 	/*
 	 * Look for the marked character
diff --git a/lib/igt_core.c b/lib/igt_core.c
index d5dc5324d..b1d045161 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -1141,7 +1141,7 @@ static int common_init(int *argc, char **argv,
 
 	/* Check for conflicts and calculate space for passed-in extra long options */
 	for  (extra_opt_count = 0; extra_long_opts && extra_long_opts[extra_opt_count].name; extra_opt_count++) {
-		char *conflicting_char;
+		const char *conflicting_char;
 
 		/* check for conflicts with standard long option values */
 		for (i = 0; long_options[i].name; i++) {
diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 74a90c437..056eb2ca8 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -114,7 +114,8 @@ static int parse_region(const char *name, struct drm_client_fdinfo *info,
 			const char **region_map, unsigned int region_entries,
 			uint64_t *val)
 {
-	char *p;
+	const char *p;
+	char *end;
 	ssize_t name_len;
 	int found = -1;
 	unsigned int i;
@@ -160,8 +161,8 @@ static int parse_region(const char *name, struct drm_client_fdinfo *info,
 		goto out;
 
 	p++;
-	*val = strtoull(p, &p, 10);
-	p = (char *)ignore_space(p);
+	*val = strtoull(p, &end, 10);
+	p = ignore_space(end);
 	if (!*p)
 		goto out;
 
diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 7905deb8d..1e3cc7757 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1555,7 +1555,7 @@ uint32_t igt_get_dc_counter(const char *dc_data)
 {
 	char *e;
 	long ret;
-	char *s = strchr(dc_data, ':');
+	const char *s = strchr(dc_data, ':');
 
 	igt_assert(s);
 	s++;
@@ -1586,9 +1586,9 @@ bool igt_support_dc6(int debugfs_fd)
  *
  * Searches for DC6 counter information in the DMC info buffer.
  */
-char *igt_get_dc6_counter(const char *buf)
+const char *igt_get_dc6_counter(const char *buf)
 {
-	char *str;
+	const char *str;
 
 	str = strstr(buf, "DC5 -> DC6 count");
 	if (!str)
@@ -1607,7 +1607,7 @@ char *igt_get_dc6_counter(const char *buf)
 uint32_t igt_read_dc_counter(int debugfs_fd, int dc_flag)
 {
 	char buf[4096];
-	char *str;
+	const char *str;
 
 	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info", buf, sizeof(buf));
 
@@ -1669,7 +1669,7 @@ const char *igt_dc_state_name(int dc_flag)
  */
 void igt_require_dc_counter(int debugfs_fd, int dc_flag)
 {
-	char *str;
+	const char *str;
 	char buf[4096];
 
 	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index cd9dceb1e..328875f9c 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -108,7 +108,7 @@ bool igt_has_pci_pm_capability(struct pci_device *pci_dev);
 void igt_pm_dpms_toggle(igt_output_t *output);
 uint32_t igt_get_dc_counter(const char *dc_data);
 bool igt_support_dc6(int debugfs_fd);
-char *igt_get_dc6_counter(const char *buf);
+const char *igt_get_dc6_counter(const char *buf);
 uint32_t igt_read_dc_counter(int debugfs_fd, int dc_flag);
 bool igt_dc_state_wait_entry(int debugfs_fd, int dc_flag, int prev_dc_count);
 const char *igt_dc_state_name(int dc_flag);
-- 
2.53.0

