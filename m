Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5483E606A334
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 21:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Ipd8aISH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0264A10F8A1;
	Tue,  3 Nov 2026 21:45:29 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013058.outbound.protection.outlook.com
 [40.93.196.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF7410E1D6
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 21:38:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rR/OfrqGMJTYNL/cJUd9lDIYEjoOYulXpDdbj8lESdMnlCmUWKCmhneFgpsUUacF0Z+P0wS4sig1d0pLJk4Lk+X3uE9TK03B0PAzdE9ZT+2U7B1JtKRDIs/W8Dk03a9VfmKd57LRXhmXfELHBxQd+yYnLDKgV117nvaqUcYh1ht43IeJoR5G5cTB8qGfQrj+hmrLKyRhU6aBls2jxAvtWmHiBgGGOkjBfxpDwRFzm4kKK4pyclmkCx7Ip/hVi54D+g4r/40YRn5aJGyTCKClHdOFeeCpvpru4RgqXttwrQJNVC7y86BhOER8TL2a85BcI9hfBAEJbv2+3+ZctWodlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qGw+WHraRVdA9B9DRCd/TEh+4aW0JLANa9fzdk08M4=;
 b=yJXiH5Bwnief+qmCm8b+vF7f3X+KZXi7ygD1NVnG1ZlEpFhVWdW0t5kFTz2casWkxOpuJ0KjC7RsbKEtyHyOr3m1cWX8K730P42kYYbWjSzrYmRnbukixetmuEHzO4iFVxapxs2gKRjPlsKansEuXBuasjUPU/j7/9iCaNvr7sBiCnift5TII8dFyqKe8kqLVSTPjJ9B/Ws4ZaibIXy9B6wQoyEf2qWgZ1ZCap5WrxilZ5uWjqrj00MXfew+gC7ZBvWiMnxO5Ym2m3QSRJz2OmTvFEtDzG2rqsVBqGwOH2LlVnLAGWR/CVWEh/bil7r05iCgFHkyH5CMiaf750aEqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qGw+WHraRVdA9B9DRCd/TEh+4aW0JLANa9fzdk08M4=;
 b=Ipd8aISHxJHPXrLX4qkh4lT+sfRu4H8dgdW8h2fozWzRGeqKFJgNpYMB4FtulY79H73gB0JGqnRbu5iwO7SZtPHIBmkMlkMiQnznOwZuBghvwbwpYgf6rmtqPePRV82O90nD7BGn2NPYje1sM63hJ++8b2S8EtDsh2G+UA1m0nU=
Received: from BN0PR02CA0008.namprd02.prod.outlook.com (2603:10b6:408:e4::13)
 by BY5PR12MB4211.namprd12.prod.outlook.com (2603:10b6:a03:20f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 21:38:19 +0000
Received: from BN1PEPF00018075.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::6) by BN0PR02CA0008.outlook.office365.com
 (2603:10b6:408:e4::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 3
 Nov 2026 21:38:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00018075.mail.protection.outlook.com (10.167.245.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Tue, 3 Nov 2026 21:38:18 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 15:38:18 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 15:38:18 -0600
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 3 Nov 2026 15:38:17 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v1 01/10] lib/drm-uapi: sync drm_mode.h DMA 3D LUT colorop uAPI
Date: Tue, 3 Nov 2026 16:37:51 -0500
Message-ID: <20261103213800.618130-2-harry.wentland@amd.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103213800.618130-1-harry.wentland@amd.com>
References: <20261103213800.618130-1-harry.wentland@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018075:EE_|BY5PR12MB4211:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c2dd84f-1764-4009-86ad-08df39f2c690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|261022105027099003|261026140227099003|11063799006|56012099006|261026121527099003|261009223027099003|261021121427099003|261102123227099003|261028144727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: bQuqN/NPfWzhCySayXMnPzn0vZh9RBGSrQm2TZqvsDFNCvNCGMKtKblFI85yjnvF+gvGN2hdo1JYMlL4n2fgCrSpr2BOxk6ug+MNX0tIQKQOxSqGuFeSlVqOJPuA3gU2qcyAgh4c0DPiY+jHNmRnK/19ATJPqrPkf6m5jsGW0A9q8n2d4eC0fhO2yaDV8+FRAffHIas9EVBA4EYuTgss4TrD36T2WJVtPlouyrBo57GSWOBkOo5o588Q3/chqej1KG6wLZmvgDsEhnH+BJZTqmjyeHqks0Z28M1L3tWfQvylv+8afef4dVQttntVVANLgJWDq8vqlEFqjBREt61vhtzp6fg9gNvuNVEC+9DwapkFTrlyaAKfo6EILKe6iW7MAox7xRvlROrnrtHwZCwwo273PZQsdmP5+5Nms47ckbTYfTVvjOpLnQtEiUQWd7EB+pyei0t6/WlyIQe6M5g2sLCqzUuzpnjaFCXCJ84GxYHlXPHFsCpVJvAUP68Vu1QnwEMcb5HZtS+ucBZh1J4SpGcDY+lSBFwKUeia1eP4NDINJbr4RD9yF4VGlAbIjid3ig1CIQC+Kj6/vPuoABjWaL4y34TB6DiMrgHUh+miZ/fRtsslCjIblHgmx5ufvIBoPBQFEfVQQKkAmvoRNAdJqWMGSICSHmFAEFeFW0iQ18ubeSXpb4jmTuwcNyBrpdFb7gg2tb373HVAGS8gddujIQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(261022105027099003)(261026140227099003)(11063799006)(56012099006)(261026121527099003)(261009223027099003)(261021121427099003)(261102123227099003)(261028144727099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mYv+it6JADeKhu3syY8wrih8s+87RJx7kPUkALNpItM1Wv282y3M01EDWCWRPOYW5PltHV59A3qAc+0dZq46fGN/p+vJoBiwdQCV939uT3RuiX7csVLHA2FnH147WGbstqpc178PcDaTt8LCCwM9j/UEwvto7nNb8z5ykWEmGL2IPtUFB7jPh7l6L+1OEWaSKAj6LRL1AaTwqXF+sl+M1w0aVLwGIoCPDAfkb+OO3H4sUu8lEgTmLOPHUxUBrMiFazCFFmlXTvY/bOWfeIbIBH//X+xV0phj/PH8MorO3rJlqMFpGd4tCbLOhVzDSWIvFClbdk/7LuAFaIS4Excq/TENtyex1npe01VIdAgxdffphDH5VY2CQCpk5NbendX4ZyjJWeTMcLp+ugXGvFR3OeweoSkmvi/PMMi+PnP3AGI/fP8P9Ks8bl5E/3txsTyE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 21:38:18.5712 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2dd84f-1764-4009-86ad-08df39f2c690
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4211
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

Pull in the DRM_COLOROP_3D_LUT_DMA colorop type, the
drm_colorop_lut3d_traversal_order enum, and struct drm_mode_3dlut_mode
from the kernel uAPI. Needed by the DMA 3D LUT colorop test.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/drm_mode.h | 79 +++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index 2aa005fcd163..9881dbc17e99 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -963,6 +963,44 @@ enum drm_colorop_type {
 	 * operations through this property.
 	 */
 	DRM_COLOROP_FIXED_MATRIX,
+
+	/**
+	 * @DRM_COLOROP_3D_LUT_DMA:
+	 *
+	 * enum string "3D LUT DMA"
+	 *
+	 * A 3D LUT whose data is DMA'd from a framebuffer (via the FB_ID
+	 * property) instead of being carried inline in a DATA blob. This lets
+	 * the driver load the LUT with an address update instead of a large
+	 * sequence of register writes.
+	 *
+	 * The accepted buffer formats are advertised via the read-only
+	 * LUT_3D_FORMATS blob property, an array of struct drm_mode_3dlut_mode.
+	 * Userspace selects one entry by index via the LUT_3D_FORMAT property
+	 * and points FB_ID at a matching framebuffer.
+	 *
+	 * Rendering to the LUT framebuffer is synchronized like rendering to a
+	 * plane framebuffer. With implicit sync the commit waits for the write
+	 * fences on the framebuffer's buffer objects. With explicit sync
+	 * userspace merges the fence for the LUT write into the IN_FENCE_FD of
+	 * the colorop's plane. If IN_FENCE_FD is set, implicit write fences on
+	 * the LUT framebuffer are ignored, as they are for the plane framebuffer.
+	 *
+	 * The hardware may read the LUT framebuffer at any time while a colorop
+	 * state referencing it is current, not only for the first frame.
+	 * Userspace must not write to a LUT framebuffer while it is attached. To
+	 * change the LUT, write a different framebuffer and point FB_ID at it.
+	 * The old framebuffer can be reused once the commit that replaced it has
+	 * completed, e.g. after its flip event or OUT_FENCE_PTR fence.
+	 *
+	 * Removing the LUT framebuffer with RMFB, or closing the DRM file that
+	 * owns it, clears FB_ID and sets BYPASS on every colorop using it, so
+	 * the plane is shown without the LUT. Re-enabling the colorop requires
+	 * a new FB_ID. CLOSEFB leaves the colorop unchanged. Closing the GEM
+	 * handle or a DMA-BUF file descriptor of the LUT buffer does not affect
+	 * the framebuffer.
+	 */
+	DRM_COLOROP_3D_LUT_DMA,
 };
 
 /**
@@ -977,6 +1015,47 @@ enum drm_colorop_lut3d_interpolation_type {
 	DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
 };
 
+/**
+ * enum drm_colorop_lut3d_traversal_order - cube axis enumeration order
+ *
+ * The order in which a 3D LUT's entries are to be traversed.
+ */
+enum drm_colorop_lut3d_traversal_order {
+	/**
+	 * @DRM_COLOROP_LUT3D_TRAVERSAL_RGB:
+	 *
+	 * R varies fastest, then G, then B (B slowest).
+	 */
+	DRM_COLOROP_LUT3D_TRAVERSAL_RGB,
+};
+
+/**
+ * struct drm_mode_3dlut_mode - fast-loadable 3D LUT format
+ * @lut_size: number of entries along one cube edge (e.g. 17 for a 17^3 LUT)
+ * @format: DRM fourcc describing the encoding of a single entry
+ * @modifier: DRM format modifier describing how the entries are laid
+ *	out in memory (e.g. DRM_FORMAT_MOD_LINEAR)
+ * @pitch: row stride in bytes
+ * @traversal_order: enum drm_colorop_lut3d_traversal_order describing how
+ *	entries are traversed
+ * @interpolation: enum drm_colorop_lut3d_interpolation_type specifying how
+ *	the HW interpolates between entries
+ * @flags: reserved, must be zero
+ *
+ * One entry of a &DRM_COLOROP_3D_LUT_DMA colorop's read-only LUT_3D_FORMATS
+ * blob. Userspace selects an entry by index via the LUT_3D_FORMAT property
+ * and points FB_ID at a matching framebuffer.
+ */
+struct drm_mode_3dlut_mode {
+	__u32 lut_size;
+	__u32 format;
+	__u64 modifier;
+	__u32 pitch;
+	__u16 traversal_order;
+	__u16 interpolation;
+	__u32 flags;
+};
+
 /**
  * enum drm_colorop_lut1d_interpolation_type - type of interpolation for 1D LUTs
  */
-- 
2.56.0

