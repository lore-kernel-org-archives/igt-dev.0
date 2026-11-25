Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88045606A336
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 14:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VaavHn/M
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A7310E1C7;
	Wed, 25 Nov 2026 14:43:25 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013031.outbound.protection.outlook.com
 [40.93.196.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E58410E2EA
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 14:41:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grNhrKCszkpV3C+4F4qgyKggGQ+6ykuJV2CRhW2pvxKdRxHMQWPX0HV9/6+phiOusnzh+hBNIptaVBLjrLu5s4ebHabszx/NPaqOyD5deGpyD5yloi0JaZXgxldqfTFPBgxVCZxz3RMo/LbWP9m1bKqU+HVuNZHliOdi8rXRNweqcJUybR4GbfnNz/E20hwO3RfM4cVJzGKezwK1CxckfMc5gZdhef2YR25X9h9REhxQb4Aznwl2pNQKTVdoyHbALGRGiKMn5xotMT7RM2MHv7r9HPmqg3dH8n87cMoFWgjCWkMDjDZTg2oQ7+SMPK/U02HKpBOjWx+/hsZ7wVqbFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oliadUuGspAKvSy1P/pWFgYiqDi3MJ8ZMjeoUYpSeFM=;
 b=xE5FlqKrWQRM7iMXnliNEMT7d9/B9+U4P+phIdfJjEsfftIXz1cLMNb+unbE7/D0oK60fXusSDVLSDbaGBioLC6Cro/DF6zZnvM/Eir1+7/+KS5PdNkewjkvrDlZ/4XiFKV4+dQSaf8vUGTOgSpzuavpHADHWLI/+7Cup++6UCdkGnwLgMScjdbOU/bHfujAKJd16cTRhl4jleHJ+eMA2tEbwVUUfIS4yMjMd7tqZ7bQuMpfh9WuCXJ3049mHm1DXl8xXU7H9Kiod+artS5V5afNDJ0UaMgY84BBQd1Lf4RoDekZTWlSX0RSRNYxK5VX2G+kirC3Vef/sXTAkcIcew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oliadUuGspAKvSy1P/pWFgYiqDi3MJ8ZMjeoUYpSeFM=;
 b=VaavHn/MStYRzbbMoJ8axsjTdRYsj9d240fDioiOvaBJSwSalDRET33oGNIO54jDHOt5FmUjwSh2fQeknPkGUu9dj2MUzjFvbPdH56IPcyXdruOHztVeJ1NSwwBydfNo2kXkztgcSDb8CIbeYw5H2FLAmzkzl3/w9OLX7CoIAPo=
Received: from MW3PR06CA0009.namprd06.prod.outlook.com (2603:10b6:303:2a::14)
 by MN2PR12MB4142.namprd12.prod.outlook.com (2603:10b6:208:1dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 14:41:24 +0000
Received: from CO1PEPF00012E60.namprd05.prod.outlook.com
 (2603:10b6:303:2a:cafe::43) by MW3PR06CA0009.outlook.office365.com
 (2603:10b6:303:2a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 14:41:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E60.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 14:41:23 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 08:41:23 -0600
From: David Francis <David.Francis@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: David Francis <David.Francis@amd.com>
Subject: [PATCH v6 1/2] include: Add GEM_CHANGE_HANDLE to drm.h
Date: Wed, 25 Nov 2026 09:41:09 -0500
Message-ID: <20261125144110.2198338-1-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E60:EE_|MN2PR12MB4142:EE_
X-MS-Office365-Filtering-Correlation-Id: 918e07fa-f389-41cc-7c8c-08df4b022dbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|18002099003|261009223027099003|13003099007|261026140227099003|10067099003|56012099006|11063799006|261102123227099003|261028144727099003|261021121427099003|261022075727099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: yBvtkNIBMc6HuGgKsrRKyTjPnlOttG1tDY3lpcYH5y98AHCwsvEeXT7rbNJ6zVRjStjVhEcm3JMcnJHXoMyDFjPGWCNADa0po97zg5+0SwiK7Oz5+q3FNEW+BCbrJApwkJK087ztWqczlIPGkh4yG1+P78LBQA16jGJNb2k7S/q0yshMIhoni3qTODRIvrQ0os/mNvBMbXlnJ0tEKqG0r+Iz/Mormx2ZLNUxC6GaTiFcXDCytGA99xp989iXeoKBP+GI2NBCAtpsIZjOMY4QZsGB6dwFEu6GbYiaHYi9vouav2mZveIBqTYwpSuZjfdyS8qisexNQTUbMBPWk1FLpgQvCI+xOcqYs7/grFHmbb3V9ga0eHdMtPk7E7RdAdPqbAMpJav7N+LoOiW6WnYhCHZ4f5ttMi9kv6FyeNWY67HkM/zFcEbza11x3/5SmMcdYvtPH6IuYL+YGL/NhmyXYU2sSo55hU5S+7AxV/MPzwrtm+BaJd7ylFCH/mjc+shD7CDs8+DA5U5wnq3Yo/qYqs1tm6Olm8VcIcwvmhacNJGUx7CeZydDYbIS9UlJEwBSMJqAGQace7OGR03lr/hhuATtRqvtQ8VQkGj1oCSAZEypk2rc/5MnGHpnwrjahYpGD6jh4sXDG1muj1Z/fFKN6tW/wQ6XkjxXCEuzL1FJgR4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(18002099003)(261009223027099003)(13003099007)(261026140227099003)(10067099003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261021121427099003)(261022075727099003)(261022105027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Y5J+HHY6DJrCmuFeUpy8wRqhStpn9R0SMiILlYgekeH185di91OC7B0G4CLWSwbwd2V3Q6EWH1n2t5tcwdq52M3duLSb5R5F8OLtVYfI9MI9YTW4hQLS+hiZ5jCY+yty3in7k7uLMYljF/0ujxidQ9s3NpVwF6dsrygmtFQtC4v/sgppcJ5a5ohC7XXkJQdqrr26GuA7KN1qCRrSB5yb9QxG+H8llE1y2MWhKLoiLv7yckUyHyNhBoOZ9aTJNlIll0lxKkt+SagAmBF9jDTKmJpUaIicl70sjIagyz5Xrt7X4f8NPfVYieUUUHnbovmlwjNZ9nmiHmrrkAVl4hat/vAoW+HeFw4qLSLAwkKdDNpbJlotLdKiGIKxsELTsAtTaOdSQ3L99qW4iztmOSb7oRznBEdhqt9YSakCl5OyXw/xKmQDXvWYNusfbj65xW7O
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 14:41:23.8536 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 918e07fa-f389-41cc-7c8c-08df4b022dbe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E60.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142
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

This ioctl was added in kernel patch
https://lore.kernel.org/dri-devel/20250717143556.857893-2-David.Francis@amd.com/

It provides an interface to change the handle of a gem object.

To test it, we need this interface

Signed-off-by: David Francis <David.Francis@amd.com>
---
 include/drm-uapi/drm.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index baa620e3f..cf131da24 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -619,6 +619,21 @@ struct drm_gem_open {
 	__u64 size;
 };
 
+/**
+ * struct drm_gem_change_handle - Argument for &DRM_IOCTL_GEM_CHANGE_HANDLE ioctl.
+ * @handle: The handle of a gem object.
+ * @new_handle: An available gem handle.
+ *
+ * This ioctl changes the handle of a GEM object to the specified one.
+ * The new handle must be unused. On success the old handle is closed
+ * and all further IOCTL should refer to the new handle only.
+ * Calls to DRM_IOCTL_PRIME_FD_TO_HANDLE will return the new handle.
+ */
+struct drm_gem_change_handle {
+	__u32 handle;
+	__u32 new_handle;
+};
+
 /**
  * DRM_CAP_DUMB_BUFFER
  *
@@ -1296,6 +1311,14 @@ extern "C" {
  */
 #define DRM_IOCTL_MODE_CLOSEFB		DRM_IOWR(0xD0, struct drm_mode_closefb)
 
+/**
+ * DRM_IOCTL_GEM_CHANGE_HANDLE - Move an object to a different handle
+ *
+ * Some applications (notably CRIU) need objects to have specific gem handles.
+ * This ioctl changes the object at one gem handle to use a new gem handle.
+ */
+#define DRM_IOCTL_GEM_CHANGE_HANDLE    DRM_IOWR(0xD2, struct drm_gem_change_handle)
+
 /*
  * Device specific ioctls should only be in their respective headers
  * The device specific ioctl range is from 0x40 to 0x9f.
-- 
2.34.1

