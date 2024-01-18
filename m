Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AC6C47422
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 13:15:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9447610E7CF;
	Thu, 18 Jan 2024 13:15:01 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2064.outbound.protection.outlook.com [40.107.244.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC81D10E7CF
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 13:15:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3p8DcRvOBmH0Jo9h3u8dp19rb3C/LjxSEPbetBE8GptnREOSxDXYQ9kEn/JZaA5qf6YPHC+4U+bmnmqrGHjEEtag0/KwBo0mCftpNpNdJ5HR+Nep1idM8PUT3yfr7z+wa3qPGniaEWyYEscB4PD9yrpjdt9VHHva8f4Btks1D74DX2yf8WXLU/l83l/CEV0ijoNu1AwiDQ7RHT021pM2t5V2kacOgGad4pFM9P3IfedlK4u/2pI4nAnS/g5CLC26C+oSWhU8jGJHaDV1rgrRj6cuUbGZS8WcQ58KUx8233RZI+lyITcwg0GRgwJhtgzxREoVXnpAvVgKenE2DgQpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNvE21mIgZqQCYQS+KUmMV+LPQtLHR1vU6kSBM1Y398=;
 b=Z2t1AH2yxks/Pl72bJZL2Z3+wT4SHEh8mz31/1e1oBHf0XqVVi2aynX/PCj4omdHUo6piHhPcaILQgGT+VLR9H/RqTUmycPOVyjrgmuotz9DZv84bLQuTtElsEQAArFVIQhhRP0puz3N5kubBrSb3RovElevks2K3CAphCshD5IiFj8ODXbdMAO2ZVMl2S2iEzrERfFBrh7JjKgVCEifCXUoBSOvg92U44M8p9tYuzk9aM/7dUnXSA4M10O4ws7jxm+3arTYGtEs44WlZ8zmSH4PBng/9Eopgumpa6jfmx9uO+AmA/bSQJkSKIF/QO3o5YjqsCWyjp7d1+o7NfH5Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNvE21mIgZqQCYQS+KUmMV+LPQtLHR1vU6kSBM1Y398=;
 b=HCqh37FeOTbbCVxJPWIJQo+jkuHykAjQWnbqHaoeWwg1+by/wFbLOQhoZDygDiZKsdsGkubiVEHcsa9LZfJ0QTayI1Yiw4J9NDVo5wcbnhZumFvYeXakJ/5uZrfJ/vjU2S3PmC5yT/BI6ovdBIurfGvwZaZK3twzCEfmpblgwPE=
Received: from DS7P222CA0006.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::23) by
 CH2PR12MB4907.namprd12.prod.outlook.com (2603:10b6:610:68::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.24; Thu, 18 Jan 2024 13:14:58 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:8:2e:cafe::5c) by DS7P222CA0006.outlook.office365.com
 (2603:10b6:8:2e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24 via Frontend
 Transport; Thu, 18 Jan 2024 13:14:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Thu, 18 Jan 2024 13:14:58 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 18 Jan
 2024 07:14:57 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 18 Jan
 2024 07:14:57 -0600
Received: from hersenwu-Majolica-CZN.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Thu, 18 Jan 2024 07:14:57 -0600
From: Hersen Wu <hersenxs.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>, <rodrigo.siqueira@amd.com>,
 <aurabindo.pillai@amd.com>, <alex.hung@amd.com>, <hamza.mahfooz@amd.com>,
 <wayne.lin@amd.com>
Subject: [PATCH 1/3] [i-g-t] lib/igt_amd: add debugfs disallow edp enter psr
Date: Thu, 18 Jan 2024 08:14:52 -0500
Message-ID: <20240118131454.19652-1-hersenxs.wu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|CH2PR12MB4907:EE_
X-MS-Office365-Filtering-Correlation-Id: ce7991a7-7c51-433a-0414-08dc1827788f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1QMMNwl85ifdoCN3Kko3uC3CgnMu0SJuRlyiDgIVbDAQ6dUXZM4x1SpnvnD8pnEid8ClsdRX1y57sjbwnqq7kJEpO2xYKA5YSc/UtgWzYFzAnLUw9xuOt6VoBoEqIoqjd0yujDSslNEUXsAyy/sxGLkFCok8yecuPSJlsXKg6CJKdHmzGN71laJR6sP6VsPyZ6Gupph4wdNgO0ksxDPEMKnyOidWKVS9hs4MvI3LZ8IuUpKyqX8oDIdU4pX5YBAg61XdP29AAeysnChtg88a4GomIPtstPsUfMNitsAuypJE697L3FSiJx/DOWRhBxQ2Zn9QZdnVzeX8V0l0CVTBFSb2gI9dmekk8bs/QnnshWC4WLpORAtStKbgyd4ddbVCkcQ8A2evgQH8B4/TOMhfSCuAGBmSfgvZhtEKCKSWF2TRMivLjE27hb/Xn54PW+KkbYLXyPbS7hgioF9pQc1YpTBMKUJTpcDxQOY12L4ulqACQ9Mv9mLqHJDYtGKmSrO1ZtOl96glFtSXzHdQf84E9tXBUJF6TAaHhdyAlCKoQ0Y2bFU54gW5omCK7i1zCcJqAdiKtLHZ9j9qr+W2gl2seohFdFF3FP1GWcy5YQqHgV4jg8lVv+0f3+Gn6aN54SS64odJ1S9gvvRzukFFi5jz4WaN9D6igctvs83HZyP6juRDJb+y98r3l8MCWhFu20JxzvA0AMB3ne2sB1pLhzHw0kGGYmOIry31IhQzbAP5Zn6ocJL9K2q+ipvqR93NmICLgK442OvJrhVi9NF1udsKKg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(396003)(39860400002)(136003)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(82310400011)(46966006)(36840700001)(40470700004)(1076003)(47076005)(26005)(2616005)(336012)(426003)(83380400001)(81166007)(356005)(36860700001)(41300700001)(82740400003)(8676002)(8936002)(6636002)(5660300002)(316002)(54906003)(2906002)(4326008)(110136005)(70206006)(6666004)(478600001)(70586007)(7696005)(36756003)(86362001)(40480700001)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 13:14:58.4103 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7991a7-7c51-433a-0414-08dc1827788f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4907
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
Cc: Hersen Wu <hersenxs.wu@amd.com>, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

When igt app call this debugfs, it will pass disable flag
to kernel. The flag  will block psr setup and enable.

When igt read psr edp rx crc, read may be timeout.
After bootup, AMD kernel driver setup psr with dpcd 0x170 = 5.
this notify rx psr enable and let rx fw start checking crc
for rx fw internal logic. rx fw may not update crc read count
within dpcd 0x246. read count is always 0. this  will lead tx
crc reading timeout.

With IGT app sequence below, rx fw crc checking for rx internal
logic is disabled. upon tx read rx crc, rx fw will check crc and
update crc count within dpcd 0x246. so IGT app can read rx crc
successfully.

expected app sequence is as below:
1. disable eDP PHY and notify eDP rx with dpcd 0x600 = 2.
2. echo 0x1 /sys/kernel/debug/dri/0/eDP-X/disallow_edp_enter_psr
3. enable eDP PHY and notify eDP rx with dpcd 0x600 = 1 but
   without dpcd 0x170 = 5.
4. read crc from rx dpcd 0x270, 0x246, etc.
5. echo 0x0 /sys/kernel/debug/dri/0/eDP-X/disallow_edp_enter_psr.
   this will let eDP back to normal with psr setup dpcd 0x170 = 5.

Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
---
 lib/igt_amd.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_amd.h |  2 ++
 2 files changed, 51 insertions(+)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 247a42f37..d0b53c08a 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -1153,6 +1153,55 @@ void igt_amd_allow_edp_hotplug_detect(int drm_fd, char *connector_name, bool ena
 	close(hpd_fd);
 }
 
+/**
+ * igt_amd_disallow_edp_enter_psr: notify kernel skip edp psr setup and enable
+ * @drm_fd: DRM file descriptor
+ * @connector_name: The connector's name
+ * @enable: skip kernel eDP psr setup and enable -- disallow edp enter psr
+ * example usage: disallow psr
+ * echo 0x1 >
+ * /sys/kernel/debug/dri/0/eDP-1/disallow_edp_enter_psr
+ *
+ * expected IGT sequence is as below:
+ * 1. disable eDP PHY and notify eDP rx with dpcd 0x600 = 2.
+ *    for example, kmstest_set_connector_dpms off will do this.
+ * 2. echo 0x1 /sys/kernel/debug/dri/0/eDP-X/disallow_edp_enter_psr
+ * 3. enable eDP PHY and notify eDP rx with dpcd 0x600 = 1 but
+ *    without dpcd 0x170 = 5.
+ *    for example, kmstest_set_connector_dpms on will do this.
+ * 4. read crc from rx dpcd 0x270, 0x246, etc.
+ *    igt_pipe_crc_collect_crc will do this.
+ * 5. echo 0x0 /sys/kernel/debug/dri/0/eDP-X/disallow_edp_enter_psr.
+ *    this will let eDP back to normal with psr setup dpcd 0x170 = 5.
+ */
+void igt_amd_disallow_edp_enter_psr(int drm_fd, char *connector_name, bool enable)
+{
+	int fd, ret, wr_len;
+	const char *allow_edp_psr = "1";
+	const char *dis_allow_edp_psr = "0";
+
+	/* if current psr is not enabled, skip this debugfs */
+	if (!igt_amd_psr_support_drv(drm_fd, connector_name, PSR_MODE_1) &&
+		!igt_amd_psr_support_drv(drm_fd, connector_name, PSR_MODE_2))
+		return;
+
+	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
+	igt_assert(fd >= 0);
+	ret = openat(fd, DEBUGFS_DISALLOW_EDP_ENTER_PSR, O_WRONLY);
+	close(fd);
+	igt_assert(ret >= 0);
+
+	if (enable) {
+		wr_len = write(ret, allow_edp_psr, strlen(allow_edp_psr));
+		igt_assert_eq(wr_len, strlen(allow_edp_psr));
+	} else {
+		wr_len = write(ret, dis_allow_edp_psr, strlen(dis_allow_edp_psr));
+		igt_assert_eq(wr_len, strlen(dis_allow_edp_psr));
+	}
+
+	close(ret);
+}
+
 static bool get_dm_capabilities(int drm_fd, char *buf, size_t size)
 {
 	int ret, fd;
diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index 254b5d37b..6780b99de 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -50,6 +50,7 @@
 #define DEBUGFS_EDP_PSR_CAP	"psr_capability"
 #define DEBUGFS_EDP_PSR_STATE	"psr_state"
 #define DEBUGFS_ALLOW_EDP_HOTPLUG_DETECT "allow_edp_hotplug_detection"
+#define DEBUGFS_DISALLOW_EDP_ENTER_PSR "disallow_edp_enter_psr"
 
 /* amdgpu DM interface entries */
 #define DEBUGFS_DM_VISUAL_CONFIRM "amdgpu_dm_visual_confirm"
@@ -194,6 +195,7 @@ bool igt_amd_psr_support_drv(int drm_fd, char *connector_name, enum psr_mode mod
 bool igt_amd_output_has_psr_state(int drm_fd, char *connector_name);
 int  igt_amd_read_psr_state(int drm_fd, char *connector_name);
 void igt_amd_allow_edp_hotplug_detect(int drm_fd, char *connector_name, bool enable);
+void igt_amd_disallow_edp_enter_psr(int drm_fd, char *connector_name, bool enable);
 
 /* DM interface helpers */
 bool igt_amd_has_visual_confirm(int drm_fd);
-- 
2.25.1

