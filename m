Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074E6D111A0
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 03:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBD910E368;
	Mon,  4 Nov 2024 03:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i+saKgEu";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B9810E368
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Nov 2024 03:57:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kNBmNCahus/5i4NaGJGZ8v3f7eW3aG2s2wuVLiBESlqvlcLERJ2C8i6QMzni/BEXi/W7OQrzgarOiGSKvSCjj+JC55PtkYIsACXqbbqpbKNSL8BrxahxQk8CRauU6jeAhh+6c5AGZM1lKF3ykJ4bTlPGTtB4mCWAiFszM4WwpPpDx5w8JwZ57xKIj8ixAkhunhalwNMHbA6WtgM+ghOFjcc09HkbAVJYmpEO4AhHUi/1pIlLwC9kT2/gBXrzKwJq05dEjBrAruVoWwaNpnSaNNaqImENs8himL1ggSOxg1RLAfW1iPk2jlKL8h3NhjwmjQJg6X2lozVKr2bREydpLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NeSSekrSrS9i5Eq6HBPe3qudvK9nHBRRBZmttFRAYE=;
 b=xp0IAprXHTqK8z4pSeIrueRgui9ZOsRf11rJzBjTnrsHGm+teze3u7YN+xpZRWYtWMd7qne+2wxJVWnEm9mCReSElhLi5gBTNJLTKIrhG8GFO+19ncnQEYlsipYcZ56Bl/WTytOEd0hXC4sKwz3GFAhWUJ50APfMMxvNplC9C0FaiXf1WM+VVF2XYmAjMEKFxAL0f5FI+j/ApgwByrHfEse/PJVcr8nP7pCvq9847ovoLdRkA/hvTGB++3dCIklr2RanRniKs699/YU04tANRvJVYMujVWAd2tQCwEddAdbb7+LX+/PUA76V9bBPyXyq0DrmsqKumcBZ0OkWrov5RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NeSSekrSrS9i5Eq6HBPe3qudvK9nHBRRBZmttFRAYE=;
 b=i+saKgEuPnbcAL75fG8dAb3WBAnzeFqnn2br1sRWx5KCO/8G9eDP2rnQyOb84WykaywyU57JKjRxlkat8KoPbLLMNlmtWAosA2JmCTyshXkQrFPiUni2GnTF/1ypNaIBfF8RN6Fkks0xN+DSjg6ODtudcCJF0TTzkXekce3vBsc=
Received: from BN9PR03CA0213.namprd03.prod.outlook.com (2603:10b6:408:f8::8)
 by DM4PR12MB7696.namprd12.prod.outlook.com (2603:10b6:8:100::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 03:57:22 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:408:f8:cafe::13) by BN9PR03CA0213.outlook.office365.com
 (2603:10b6:408:f8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30 via Frontend
 Transport; Mon, 4 Nov 2024 03:57:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.0 via Frontend Transport; Mon, 4 Nov 2024 03:57:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 3 Nov
 2024 21:56:59 -0600
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 3 Nov 2024 21:56:58 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Christian
 Koenig" <christian.koenig@amd.com>
Subject: [PATCH] lib/amdgpu_pci_unplug: fix bo mapping to CPU
Date: Sun, 3 Nov 2024 22:56:53 -0500
Message-ID: <20241104035653.146383-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|DM4PR12MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: 62b17876-e0c9-4939-0062-08dcfc84c975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X2gs/LK//nSkEfGXapqbZG5soQ9+bTLtb3Jb5ZZeKAhHHUXJPuiZV9LNrKtO?=
 =?us-ascii?Q?3Rbb/64J44yLYrvG/IKhoUc3jvo6UNmtfPy+2KZyDyfM+Mb8Cal6yGsdCwP1?=
 =?us-ascii?Q?4Vl0Q7EA1tC+kFYR/BYAMCeSKJjGWssUxCC8sD59s33e5U1tRqfPAXLpid4h?=
 =?us-ascii?Q?jV/QX8uqfItaAM83TShwd3VPM0I6eK8dP2iLMhzaxrOwtDZFm+x2cailGBSa?=
 =?us-ascii?Q?jmg3Fl5MSazCudf2P01R0YS2p+9R0Dn3x2MqMSUXjvbBh9kZzPiVjA4WH/Mv?=
 =?us-ascii?Q?iZECrhOhVHJTRRkc9Oylr1lO43MkvRUiHmD0mcbLHl+i9H7KkqEfhA9ncr0l?=
 =?us-ascii?Q?cRFFhf2oBTArE6XPasMng3TVpTAAUyXsu/9cupbGR2v989LjZiROyDr3ckf7?=
 =?us-ascii?Q?KuUeGWhy7hz0YWjUtoTwUZ0i7dbTwbAQMc+1VCRdb2KjBfQh6Z+55hymGkyY?=
 =?us-ascii?Q?JZ0Hp7OWm2DFq3ls2sVK/pYYTaONCdUWBh7lsCh8ivyVzFqxoCynBddIwV0i?=
 =?us-ascii?Q?j13enj0gU5XyeOSe7Uk4Mm5wQMEK5+S6mlYtWr44q8iBHBbzUTtlYY0Rm3qP?=
 =?us-ascii?Q?Lzq4c6clAHY5BiqD2RkW14H2f8bsd5P7M43qL9IqESyI3RLzzVS3J5eRJVP0?=
 =?us-ascii?Q?1zSsoLTihqPEl0PD2K7LDPIQyJpfOJ+32kkbkIblMWLxBweXbEBdySn3dcke?=
 =?us-ascii?Q?0VmNz1QJ7TBwg76YXkeEZcNR0SLn/x5UfVGInkSlHfRUvkTEQ9TQPSnpNQaF?=
 =?us-ascii?Q?6pJedp/DDyiD5LdY+LBdvyqK1YvDUkch5AbwCjh0iZagaogrZpNAA95J668a?=
 =?us-ascii?Q?hM9ob/YQvN+2FO7bQ7UmI56VvJ2x16j8+eTRZfQ11PEQxFHjf7S/NsLBV8zV?=
 =?us-ascii?Q?67nRNuyn3ySbRe9fcMv3AtmHqkBk7olbMS458rHohceytrzWN5jH4yJASD5O?=
 =?us-ascii?Q?gnN23FDsawJ+h4HdjyIb69dS/ws/T+1OoruNS+eie/FpIrFwlYWXPX2GsBIl?=
 =?us-ascii?Q?/LAJxGKZVj9Lv5s8lWqB4IoRslV6ymxTJiwW1Nnt/SpQbps67nVzoa71asew?=
 =?us-ascii?Q?W1XCb1Lv+/q+FllNKIh8VLPxGeI94N6AVOxTDgBPLvqfa8ONKEW/7z9xsGWV?=
 =?us-ascii?Q?POHoIoxxpGPAwYBCS+Z3ifxgnpLbWF5bqda0c9Qt63i7Nrdfz1R6ou9t3qzm?=
 =?us-ascii?Q?jxWmzhNlvcokynFbVSwOaYk7jCjcnTzXPdpXHq5yQnOt3UM1+O1qUqHEZ0lI?=
 =?us-ascii?Q?q2Qx+ICF/QKtQsZ7xB4p9I7ieFYqNUyGIRWeEgJ42wSuL//m6TyazRiDWII3?=
 =?us-ascii?Q?Ymya1C8ureeCslP5xvjhLnJVdu94Q9krcKNvyL2HenWUVkSK8q2xuRabAfAg?=
 =?us-ascii?Q?7r+4f3wwXLfjnRIR7TXrQAl5MG9tDI2LZmj5xNas5vLNq9aylw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 03:57:22.4757 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b17876-e0c9-4939-0062-08dcfc84c975
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7696
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

This commit addresses a bug in the buffer object (BO) mapping to the CPU by adding
the AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED flag to prevent mapping failures.
After an AMDGPU PCI unplug, we now handle expected failures in the DRM_AMDGPU_GEM_VA
ioctl call.

Additionally, amd_pci_unplug.c has been reformatted to comply with kernel code
formatting standards.

Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_pci_unplug.c | 82 ++++++++++++++++++++-----------------
 1 file changed, 44 insertions(+), 38 deletions(-)

diff --git a/lib/amdgpu/amd_pci_unplug.c b/lib/amdgpu/amd_pci_unplug.c
index 078398b5e..107e1cbbd 100644
--- a/lib/amdgpu/amd_pci_unplug.c
+++ b/lib/amdgpu/amd_pci_unplug.c
@@ -18,8 +18,7 @@
  * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
- *
-*/
+ */
 #include <linux/limits.h>
 #include <fcntl.h>
 #include <sys/stat.h>
@@ -68,10 +67,10 @@ static int
 amdgpu_hotunplug_trigger(const char *pathname)
 {
 	int len;
-	int fd= -1;
+	int fd = -1;
 
 	fd = open(pathname, O_WRONLY);
-	if (fd <= 0 )
+	if (fd <= 0)
 		goto release;
 
 	len = write(fd, "1", 1);
@@ -93,7 +92,7 @@ amdgpu_hotunplug_setup_test(bool render_mode, const struct amd_pci_unplug_setup
 
 	unplug->num_devices = amdgpu_open_devices(render_mode, MAX_CARDS_SUPPORTED,
 											  unplug->drm_amdgpu_fds);
-	if (unplug->num_devices == 0 )
+	if (unplug->num_devices == 0)
 		goto release;
 
 	if (setup->open_device && setup->open_device2 && unplug->num_devices < 2) {
@@ -105,7 +104,7 @@ amdgpu_hotunplug_setup_test(bool render_mode, const struct amd_pci_unplug_setup
 	tmp_str = amdgpu_get_device_from_fd(unplug->drm_amdgpu_fds[0]);
 	abort_oom_if_null(tmp_str);
 	unplug->sysfs_remove = realloc(tmp_str, strlen(tmp_str) * 2);
-	abort_oom_if_null(unplug->sysfs_remove );
+	abort_oom_if_null(unplug->sysfs_remove);
 	strcat(unplug->sysfs_remove, "/remove");
 
 	r = amdgpu_device_initialize(unplug->drm_amdgpu_fds[0], &major_version,
@@ -140,6 +139,7 @@ static void
 amdgpu_hotunplug_teardown_test(struct amd_pci_unplug *unplug)
 {
 	int i;
+
 	if (unplug->device_handle) {
 		amdgpu_device_deinitialize(unplug->device_handle);
 		unplug->device_handle = NULL;
@@ -149,7 +149,7 @@ amdgpu_hotunplug_teardown_test(struct amd_pci_unplug *unplug)
 		unplug->device_handle2 = NULL;
 	}
 	for (i = 0; i < unplug->num_devices; i++) {
-		if (unplug->drm_amdgpu_fds[i] >= 0 ) {
+		if (unplug->drm_amdgpu_fds[i] >= 0) {
 			close(unplug->drm_amdgpu_fds[i]);
 			unplug->drm_amdgpu_fds[i] = -1;
 		}
@@ -206,10 +206,11 @@ amdgpu_nop_cs(void *handle)
 	struct amdgpu_cs_request ibs_request;
 	struct amdgpu_cs_ib_info ib_info;
 	int bo_cmd_size = 4096;
-	struct amd_pci_unplug * unplug = handle;
+	struct amd_pci_unplug *unplug = handle;
 	amdgpu_device_handle device_handle = unplug->device_handle;
 
-	struct amdgpu_cmd_base * base_cmd = get_cmd_base();
+	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
+
 	r = amdgpu_cs_ctx_create(device_handle, &context);
 	igt_assert_eq(r, 0);
 
@@ -221,7 +222,7 @@ amdgpu_nop_cs(void *handle)
 
 	memset(ib_result_cpu, 0, bo_cmd_size);
 	base_cmd->attach_buf(base_cmd, ib_result_cpu, bo_cmd_size);
-	base_cmd->emit_repeat(base_cmd, GFX_COMPUTE_NOP , 16);
+	base_cmd->emit_repeat(base_cmd, GFX_COMPUTE_NOP, 16);
 
 	r = amdgpu_bo_list_create(device_handle, 1, &ib_result_handle, NULL, &bo_list);
 	igt_assert_eq(r, 0);
@@ -252,10 +253,11 @@ amdgpu_nop_cs(void *handle)
 }
 
 static pthread_t*
-amdgpu_create_cs_thread(struct amd_pci_unplug * unplug)
+amdgpu_create_cs_thread(struct amd_pci_unplug *unplug)
 {
 	int r;
 	pthread_t *thread = malloc(sizeof(*thread));
+
 	if (!thread)
 		return NULL;
 
@@ -270,7 +272,7 @@ amdgpu_create_cs_thread(struct amd_pci_unplug * unplug)
 }
 
 static void
-amdgpu_wait_cs_thread(struct amd_pci_unplug * unplug, pthread_t *thread)
+amdgpu_wait_cs_thread(struct amd_pci_unplug *unplug, pthread_t *thread)
 {
 	unplug->do_cs = false;
 
@@ -280,13 +282,13 @@ amdgpu_wait_cs_thread(struct amd_pci_unplug * unplug, pthread_t *thread)
 
 static void
 amdgpu_hotunplug_test(bool render_mode, const struct amd_pci_unplug_setup *setup,
-					  struct amd_pci_unplug * unplug,  bool with_cs)
+					  struct amd_pci_unplug *unplug,  bool with_cs)
 {
 	int r;
 	pthread_t *thread = NULL;
 
 	r = amdgpu_hotunplug_setup_test(render_mode, setup, unplug);
-	igt_assert_eq(r , 1);
+	igt_assert_eq(r, 1);
 
 	if (with_cs)
 		thread = amdgpu_create_cs_thread(unplug);
@@ -311,9 +313,9 @@ amdgpu_hotunplug_simple(struct amd_pci_unplug_setup *setup,
 	amdgpu_hotunplug_test(true, setup, unplug, false);
 }
 
- void
- amdgpu_hotunplug_with_cs(struct amd_pci_unplug_setup *setup,
- 						 struct amd_pci_unplug *unplug)
+void
+amdgpu_hotunplug_with_cs(struct amd_pci_unplug_setup *setup,
+						struct amd_pci_unplug *unplug)
 {
 	memset(unplug, 0, sizeof(*unplug));
 	setup->open_device = true;
@@ -327,39 +329,44 @@ amdgpu_hotunplug_with_exported_bo(struct amd_pci_unplug_setup *setup,
 	int r;
 	uint32_t dma_buf_fd;
 	unsigned int *ptr;
-	amdgpu_bo_handle bo_handle;
+	amdgpu_bo_handle bo;
+	amdgpu_va_handle va_handle;
+	uint64_t bo_mc;
 
-	struct amdgpu_bo_alloc_request request = {
-		.alloc_size = 4096,
-		.phys_alignment = 4096,
-		.preferred_heap = AMDGPU_GEM_DOMAIN_GTT,
-		.flags = 0,
-	};
 	memset(unplug, 0, sizeof(*unplug));
 	setup->open_device = true;
 
 	r = amdgpu_hotunplug_setup_test(true, setup, unplug);
-	igt_assert_eq(r , 1);
+	igt_assert_eq(r, 1);
 
-	r = amdgpu_bo_alloc(unplug->device_handle, &request, &bo_handle);
-	igt_assert_eq(r, 0);
+	bo = gpu_mem_alloc(unplug->device_handle,
+			   4096, 4096,
+			   AMDGPU_GEM_DOMAIN_VRAM,
+			   AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED,
+			   &bo_mc, &va_handle);
 
-	r = amdgpu_bo_export(bo_handle, amdgpu_bo_handle_type_dma_buf_fd, &dma_buf_fd);
+	r = amdgpu_bo_export(bo, amdgpu_bo_handle_type_dma_buf_fd, &dma_buf_fd);
 	igt_assert_eq(r, 0);
 
-	ptr = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, dma_buf_fd, 0);
+	r = amdgpu_bo_cpu_map(bo, (void **)&ptr);
 
 	r = amdgpu_hotunplug_remove(unplug);
 	igt_assert_eq(r > 0, 1);
 
-	amdgpu_bo_free(bo_handle);
-
 	amdgpu_hotunplug_teardown_test(unplug);
 
-	*ptr = 0xdeafbeef;
+	if (ptr && ptr != MAP_FAILED)
+		*ptr = 0xdeafbeef;
 
-	munmap(ptr, 4096);
-	close (dma_buf_fd);
+	amdgpu_bo_cpu_unmap(bo);
+
+	r = amdgpu_bo_va_op(bo, 0, 4096, bo_mc, 0, AMDGPU_VA_OP_UNMAP);
+	/* here the expected failure EBADF  9 Bad file number */
+	r = amdgpu_va_range_free(va_handle);
+	igt_assert_eq(r, 0);
+	r = amdgpu_bo_free(bo);
+	igt_assert_eq(r, 0);
+	close(dma_buf_fd);
 
 	r = amdgpu_hotunplug_rescan();
 	igt_assert_eq(r > 0, 1);
@@ -382,7 +389,7 @@ amdgpu_hotunplug_with_exported_fence(struct amd_pci_unplug_setup *setup,
 	struct amdgpu_cs_fence fence_status = {0};
 	int shared_fd;
 	int bo_cmd_size = 4096;
-	struct amdgpu_cmd_base * base_cmd = get_cmd_base();
+	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
 
 	memset(unplug, 0, sizeof(*unplug));
 	setup->open_device = true;
@@ -390,9 +397,8 @@ amdgpu_hotunplug_with_exported_fence(struct amd_pci_unplug_setup *setup,
 
 
 	r = amdgpu_hotunplug_setup_test(true, setup, unplug);
-	if( r != 1) {
+	if (r != 1)
 		goto release;
-	}
 
 	r = amdgpu_cs_ctx_create(unplug->device_handle, &context);
 	igt_assert_eq(r, 0);
@@ -404,7 +410,7 @@ amdgpu_hotunplug_with_exported_fence(struct amd_pci_unplug_setup *setup,
 	igt_assert_eq(r, 0);
 	memset(ib_result_cpu, 0, bo_cmd_size);
 	base_cmd->attach_buf(base_cmd, ib_result_cpu, bo_cmd_size);
-	base_cmd->emit_repeat(base_cmd, GFX_COMPUTE_NOP , 16);
+	base_cmd->emit_repeat(base_cmd, GFX_COMPUTE_NOP, 16);
 
 	r = amdgpu_bo_list_create(unplug->device_handle, 1, &ib_result_handle, NULL,
 							  &bo_list);
-- 
2.25.1

