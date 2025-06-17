Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1AEC7114A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB04810E4F4;
	Tue, 17 Jun 2025 04:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vNJxrVC8";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4686410E4F4
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:39:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tSA3Mv0Hap+45EQZ+1zdDiwm3xYPnKqv6MSEL79tRorrAY49WVVT67lMA9CM7wWvX0obmDdQnMBfbwofiRBZG3gUKHToCpO1zFwEjHIIWUx2UkC1vAezzEjtt8chRsa0+5eYHaxuoVPrQdowbzlsV24aj1HwP9PCW9dy1h65A0jvyjrrvgRgoFmXiLT9byRLBOaPaS70UmNTXeM2TIzxKHtm7rLYYRj0yd58NU8ph9TuhaxbNhR+OThGENq7hRKwpJARW94+pZhGuuaW0IG8GLf+PEjXli+YEY7wk6dny2e9wxkcKYqx3s4y0oNU96g68i2i91MGqW5Limd8a5krNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQvnx+It+svnTZ6m/vkD32jOb9TeMuOfjdSsV851Ypg=;
 b=xsPjARhyjdpHJ71JIQrYf81nVv0Sf8vP9Ailp+6jsrAIkKMnAEyhfjwVkNYtFi/Y2nShXEHVyKohj5E/hMjvt7bTw00dZ+QsceukLzK/xCk1U2vKrJc5f/8jmAbGTPIGhQNEdwIfFCmIkdcqYzoZIHpG4Uffotcj4PO7AvcIq8BC/f6a5ayxu/pag8ch5khlb31ZLRD8A8UuAeEwpWDrAmGFydDigG03xExvP8Mzy+VyCDx26kFwicsb3iAIxpfSDk03a9QCC1A4jWJHzq+LCQkpLAguUV5Za7lS/EltRJjuP95bGPrrH3lqKTeiANQq62jQ92AocqRCXTGjqZgQ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQvnx+It+svnTZ6m/vkD32jOb9TeMuOfjdSsV851Ypg=;
 b=vNJxrVC802IglpCqUU5jT4UzFNNDrTIwTKAyNrP3EPxZMceBXrtESz07wvqF1G7zRV8xRjHXBZu3WOHyET8P61dRJ5ejy2S8WvPKdV9mP9Novwed/YUqVUAeIAt3NqD8k/1ud2CMOnp+hUvnTL7c7NKvRKCkKR5xAorxD2S4zFA=
Received: from SJ0PR03CA0199.namprd03.prod.outlook.com (2603:10b6:a03:2ef::24)
 by MW6PR12MB9000.namprd12.prod.outlook.com (2603:10b6:303:24b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:39:10 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::4e) by SJ0PR03CA0199.outlook.office365.com
 (2603:10b6:a03:2ef::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Tue,
 17 Jun 2025 04:39:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:39:10 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:39:09 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 12/36] lib/igt_fb: Add copy_fb function
Date: Mon, 16 Jun 2025 22:36:07 -0600
Message-ID: <20250617043631.2920587-13-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617043631.2920587-1-alex.hung@amd.com>
References: <20250617043631.2920587-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|MW6PR12MB9000:EE_
X-MS-Office365-Filtering-Correlation-Id: 079aae24-0cfc-4a89-0960-08ddad58e739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KzApKq8W6CQrhwakWEcF9D2tR014qJRFZ9ImoTiXvdSlgn3AxJKUcWgIMzKE?=
 =?us-ascii?Q?hU9snPn+TOypOMZQziDXf4LFLqgoWwy0aTP2C0flIhitekjL4QqTotf8x3Nj?=
 =?us-ascii?Q?7k4f1hpckJoHcLDNNKRhy9m+M2nv0CyEaNB8Rn7ozGyZNDWmiE5ksQOvrucY?=
 =?us-ascii?Q?kW0sqbLoGjAT/BMXzIQtC/0kCUicWtMmI4BHYVHL2cbf5iJyMShn3HINO2xG?=
 =?us-ascii?Q?+x0hWGa8vsujmDsz57UxI5Fu8KGgC4DREFOWhzTgPQKrq0zA02ElyJ8w82ht?=
 =?us-ascii?Q?P3sJ8EXE44SDM6YK1yJjGmTkKQpLKPVYGForLxOvXsob5uzxMIIcJ+Q16cqN?=
 =?us-ascii?Q?4nr1FqbH0zEQE1rSHhSxVpMeq6QiP1MgSBvdQMURlJ3Fpmb9W5iaZIJDEYT+?=
 =?us-ascii?Q?zzhNN5dbaydS8OikziPqDm9CeJ5wf+a+TxHMuc1YtRke2D/S07ucrViP308Q?=
 =?us-ascii?Q?qnQycdyE42I4T1cFrOcAmUFdCvMFQHwIKc6Gya3U6KmwhbAiSGV9nFTchBb2?=
 =?us-ascii?Q?ng/ZsdjRRpWAZB+K8mqZLQrrEu8Mpl5+V/lTB/nUElvsjiqISliFTgbWpBy7?=
 =?us-ascii?Q?PQmHPtIenhWEdshhvT9r+LLvUAssNBtqa7g5ojZvesl9xAbLirv0NjDBSFsM?=
 =?us-ascii?Q?AfdmF55yJqSEfk5ndB3kzWWYvVva0ulroBYGU+NWEIp5jwIiW5Gc4je5HM5f?=
 =?us-ascii?Q?E4Bc1Lg/lQYvDOwymCLQOnMFbagFWOrMkTD/THY5FSnrbMY3DDQFyWjbPKdD?=
 =?us-ascii?Q?ZlRQDKly9iNeKKSa2bEqDiczK3vLAmgurPCRdPHKaQimCP2a+47TKiH5o/tP?=
 =?us-ascii?Q?4m55vPy6OK+wUpG8uj/uFSARY2hDV/wZqcOVsQog0MOEUfdb3GXHXpfz+ulD?=
 =?us-ascii?Q?35JddR0x2h/tvEiLeiEGLoVD9goqalGuH//UH16x0f2Ay0xSXSqu07ljmN2F?=
 =?us-ascii?Q?cnlIKc2OMBb8OTMZs/S36kGtKpq23ZeiMfBGhw1/3Ec61yIrqb4MOTpj5ttx?=
 =?us-ascii?Q?OuMuzuY304kBRrrruwrNjwH5cIOuiihCWhxT5l4YWdtRpDKJqeqC71AxNE4g?=
 =?us-ascii?Q?I6rN7jnMQq2R0MiWYsSAE2f8b1wQAxq/Nc2CABVF0qFWaiCzyvURYed7hB2h?=
 =?us-ascii?Q?xW5lXw4NQxmTPFI7PUSqf0FWIQ70dhRr1wKVUtbF23qzZi075Iek8mLhKOgi?=
 =?us-ascii?Q?FBTl7P4B50LnUbAcHYQ9r+hjeMWvmvphoOsKKfYXLOHpeDQO4ZyimBquzf83?=
 =?us-ascii?Q?uIsfo17Vrg3hpDfL//4ZzhY9axhc7RtSwyAAPMwJGvTaqTXPv4I6OaNlLfyR?=
 =?us-ascii?Q?7+9J7Nq3M9Dn0K9mCU9xHQOerEqSbsu3XuoPB83B1mJIVIVGyG4pyCYpc1R+?=
 =?us-ascii?Q?f+JJ1jbksxjo5Fg83bbCWeapP1MftRFUOu6DlpX+rba2NiTclj4bZdE7XZgu?=
 =?us-ascii?Q?dn43xcEBvGPSu3nRckVuDZSv5iCR1X2A019qBSFaNViCzd9V9X/pqbxJzEE6?=
 =?us-ascii?Q?x6LhtWSLa8TMgvUO5SbC0P7A/EyRH7VdyhC6?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:39:10.3738 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 079aae24-0cfc-4a89-0960-08ddad58e739
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9000
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

From: Harry Wentland <harry.wentland@amd.com>

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_fb.c | 34 ++++++++++++++++++++++++++++++++++
 lib/igt_fb.h |  1 +
 2 files changed, 35 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 45692b170..f2c09de50 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2170,6 +2170,40 @@ unsigned int igt_create_fb(int fd, int width, int height, uint32_t format,
 					  fb, 0, 0);
 }
 
+unsigned int igt_copy_fb(int fd, struct igt_fb *src, struct igt_fb *fb)
+{
+	char *in_ptr, *out_ptr;
+	int cpp = igt_drm_format_to_bpp(src->drm_format) / 8;
+
+	int fb_id = 0;
+	igt_assert(src);
+
+	/* TODO allow multiple planes */
+	if (src->num_planes != 1)
+		return -EINVAL;
+
+	/* TODO expand for other formats */
+	if (src->drm_format != DRM_FORMAT_XRGB8888)
+		return -EINVAL;
+
+	fb_id = igt_create_fb(fd, src->width, src->height, src->drm_format,
+			    src->modifier, fb);
+
+	/* copy buffer contents */
+	/* TODO simplify :D */
+	in_ptr = igt_fb_map_buffer(fb->fd, src);
+	igt_assert(in_ptr);
+	out_ptr = igt_fb_map_buffer(fb->fd, fb);
+	igt_assert(out_ptr);
+
+	igt_memcpy_from_wc(out_ptr, in_ptr, fb->width * fb->height * cpp);
+
+	igt_fb_unmap_buffer(fb, out_ptr);
+	igt_fb_unmap_buffer(src, in_ptr);
+
+	return fb_id;
+}
+
 /**
  * igt_create_color_fb:
  * @fd: open drm file descriptor
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index fe0bb580c..b2176558b 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -141,6 +141,7 @@ struct intel_buf *igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
 					  const struct igt_fb *fb, const char *name);
 unsigned int igt_create_fb(int fd, int width, int height, uint32_t format,
 			   uint64_t modifier, struct igt_fb *fb);
+unsigned int igt_copy_fb(int fd, struct igt_fb *src, struct igt_fb *fb);
 unsigned int igt_create_color_fb(int fd, int width, int height,
 				 uint32_t format, uint64_t modifier,
 				 double r, double g, double b,
-- 
2.43.0

