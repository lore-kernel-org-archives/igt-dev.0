Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AC3C5478C
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 21:14:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DF210F28F;
	Mon, 26 Feb 2024 21:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iwfRgqXY";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2081.outbound.protection.outlook.com [40.107.100.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970F210F28D
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 21:14:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEhnqNZBtJKH3yRVo+BM3UZiNoKrDiq60D+SJPjFOF9Lyo1exyVgbF40gY+1AqtDERhlNEf/nx75qyKVlgnliftO0zTsTnPYOXCqc4oZZeEsuIYeAVIXNw6d+3p2tZjTZS3VT1Xx7tc2dP3re+rEyqIy5QOr7w3Tmo9dLY5ZES7OAiqgyWfsjpP8eXuOiXXl6XN775LgKFAIuoK5VOaFNPAUnPN2098XZZ4L+NRDthEdeAUi0e+948VFrK23BH20ORmM1nErqLMNY1KcsFHDfAL4Jq0bL8eeZ4sZ3rAWTcEekkAnVZJ+2NPtgFEHnrqCdm6X6p4Guw2JFWovnuXrdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AtgmlWF7av9PH/hXtQCcjb+RoIM7oIpu1Cw91479WCE=;
 b=W2OccEz4VzKKss9r75zwAE8afpUAhs30m/S6985Hf0VaFoGl3jNboIP0sa0CQSu/LvJNiEZlltCs2dgHLKg8HrNUWgvRsB3SE5xbfSlDmryhj+8T/iVYV2jd9YHWZzw2rC6F9qcQU4fyy5bijAZqp4h9iGgEitf+pY22b8nNKH3g0VG1fE2fAebqHFgj7nmxk140RbHHvU4FQpDPdJrQ6vcz8YV85XQ52SFA3+Qorw8Gb6xLP0wTx4NA1aQCDoV7U4c4xdKy24JAO+oBN6RAj6QiVkKkt+qiRrlzE52x6XRByKoL0SnJWzPH5gU3Q1f/Tz5mKw7zPCtPfnkAOl/LeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtgmlWF7av9PH/hXtQCcjb+RoIM7oIpu1Cw91479WCE=;
 b=iwfRgqXYogNh+4Trhao1Qp3J+ScAMVo3UL3HJUYIW8RDfTcp26Hx5QNua+JycED79PDNuTPejOyGCRXh0kjh2fNiYWONet/ILNt6xO66znYoQKyjpL4j2Zk9wd9zlxLNMdWHTUku3szSR+sFq4NbJ5zq6gr3IhY4DTxnCNNoelA=
Received: from CH2PR12CA0024.namprd12.prod.outlook.com (2603:10b6:610:57::34)
 by IA0PR12MB8932.namprd12.prod.outlook.com (2603:10b6:208:492::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.33; Mon, 26 Feb
 2024 21:14:32 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::de) by CH2PR12CA0024.outlook.office365.com
 (2603:10b6:610:57::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:14:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:14:32 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:31 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:14:31 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v5 05/32] include/drm-uapi: Add COLOROP object
Date: Mon, 26 Feb 2024 16:13:49 -0500
Message-ID: <20240226211416.100660-6-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211416.100660-1-harry.wentland@amd.com>
References: <20240226211416.100660-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|IA0PR12MB8932:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a30340d-8a0a-4edf-747f-08dc370fed37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zTMSTi7iPB1lCJ6Sk+DSf3wY3+xm1s7tQOcG29JvDe+4xuob1jU7haqFBHdIpYwRNoRio0w1H/ZAcM9j3phTnyFeXOk+n1+n1YBKebCbnqtWuIotuhQM86fBRtjBj19hnq6X5Q/IE6ONIT2hFys/b0aPwpPw83JC98ouDgRcC7Pmkr9irP2ryjNkFasTMGoqOpF4EkFqqYjQxWMTz15fk5Ddj8qA9Ivg47hee/AVWOEG0KruAVMNSIF7FCxFT1q/GkCxx4NTAKhd2lvAiASnPQroENXf7IGqrawAdLzkVli1Q5LLE2Ip1w5Vjr9sNx9+9WCDqrGiplAfFp/deIzdZQp67YJk7lJBTuMDvYXa7jeYYYSFyKbo3Ipudxi2azorlBCxWXh/IHiYmn6zR2WQmSJowj1OfR/osG5UE8KccZ8LxpeWwJRzHR6rDM1pexVEwHCi9tjwmHX+sUH+gYvwFwqst1i3NQK1Mthr2lYWEXZFPaF6AJKORRsOKoLNB4uVYM14fon49VDYgH533nHkTBnTvl84ivjZOxZwU3kQ9YHjEerSysP3JCxClL20ukJsTIQ4nMCW1Ckr1bBR8ScPYKorGS1875zgDJpQFGbMYTeMY6kuEV8m1G1UPBqBFZvi1ifpxQIj4uAacSkJ4bGq1ezORgddlt2hZRInI2mDHkWrJupdcA5WOZzi2DMfkgQJUk/xypYW8+nzhbgwmce3SGJaAhM+qSuAqNcG1I4+Tvm9EXYkN3Z11sz5B97csckN
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:14:32.2858 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a30340d-8a0a-4edf-747f-08dc370fed37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8932
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

DRM is introducing a new DRM core obejct, a drm_colorop. This
object will represent one color operation in a color pipeline.

Introduce the object type in the drm-uapi.

v3:
- move enum drm_colorop_type to drm_mode.h

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/drm_mode.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index ea1b639bcb28..c49526bca034 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -629,6 +629,7 @@ struct drm_mode_connector_set_property {
 #define DRM_MODE_OBJECT_FB 0xfbfbfbfb
 #define DRM_MODE_OBJECT_BLOB 0xbbbbbbbb
 #define DRM_MODE_OBJECT_PLANE 0xeeeeeeee
+#define DRM_MODE_OBJECT_COLOROP 0xfafafafa
 #define DRM_MODE_OBJECT_ANY 0
 
 struct drm_mode_obj_get_properties {
@@ -857,6 +858,10 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+enum drm_colorop_type {
+	DRM_COLOROP_1D_CURVE
+};
+
 /**
  * struct hdr_metadata_infoframe - HDR Metadata Infoframe Data.
  *
-- 
2.44.0

