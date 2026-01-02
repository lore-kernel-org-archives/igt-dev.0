Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B736FA3727
	for <igt-dev@archiver.kernel.org>; Fri,  2 Jan 2026 09:46:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0190510E0DF;
	Fri,  2 Jan 2026 09:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gJ6VI4si";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7716D10E0F7
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Jan 2026 09:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767347197; x=1798883197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lFBK3QorLItOm024CbzBdjtoKfPwZ1Ox9ZNrJfpR81M=;
 b=gJ6VI4sihLB0xEu8d/DPMYqlTnTeq5OptvOAWge+tVg8EW1YZMx1GNP3
 4DL2CpyTVFiFnvJWRc5mi6GhJPxdIuU3XeoISl9ADkWzBjrpB/O+upM6n
 SUnXbiF41ShEpQ8LyCKNWmWENnwtdBPfC1AVSjb3OmhVDk5Ov8Mxq8eNw
 Y3E8EjWQJHcwLbDnQs8zZUuU726W3XXfNySKUEymykcf+BnX/NwZMixwn
 +vAiabtkcN8YmmB6Sa2pj7AdIu7TivGYScNSzrFOOEHj21EuWelUgbpt+
 C7mjEOAE21+BOh3iTKJaxzBmjUe6w07zxc1vv4e3KM8u7n9CA1WrBkD9Z w==;
X-CSE-ConnectionGUID: PtAptvinTCGSGbpfMM0asQ==
X-CSE-MsgGUID: kfhT2f+QRhaX+6HMQBMOyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="94313810"
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; d="scan'208";a="94313810"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2026 01:46:36 -0800
X-CSE-ConnectionGUID: 8C7btM+/Scu6pfHKG8rmug==
X-CSE-MsgGUID: 7jGiQI8AS42vXLRwd/LF4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; d="scan'208";a="202746906"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 01:46:35 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [v2 3/4] lib/igt_hdr: Add helpers to enable and disable HDR on an
 output
Date: Fri,  2 Jan 2026 15:24:50 +0530
Message-Id: <20260102095451.42401-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260102095451.42401-1-swati2.sharma@intel.com>
References: <20260102095451.42401-1-swati2.sharma@intel.com>
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

Add convenience helpers to explicitly enable and disable HDR on an
output connector.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_hdr.c | 16 ++++++++++++++++
 lib/igt_hdr.h |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/lib/igt_hdr.c b/lib/igt_hdr.c
index 85a6b5712..762eaba16 100644
--- a/lib/igt_hdr.c
+++ b/lib/igt_hdr.c
@@ -199,3 +199,19 @@ bool igt_output_supports_hdr(igt_output_t *output)
 {
 	return igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA);
 }
+
+void igt_hdr_disable(igt_output_t *output)
+{
+	igt_hdr_set_metadata(output, NULL);
+	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 8);
+}
+
+void igt_hdr_enable(igt_output_t *output)
+{
+	struct hdr_output_metadata meta;
+
+	/* Fill HDR metadata and enable it on the output */
+	igt_hdr_fill_st2048(&meta);
+	igt_hdr_set_metadata(output, &meta);
+	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
+}
diff --git a/lib/igt_hdr.h b/lib/igt_hdr.h
index e03fca59e..127b5f6d1 100644
--- a/lib/igt_hdr.h
+++ b/lib/igt_hdr.h
@@ -30,4 +30,7 @@ int igt_hdr_set_invalid_metadata(igt_output_t *output,
 bool igt_output_supports_max_bpc(igt_output_t *output);
 bool igt_output_supports_hdr(igt_output_t *output);
 
+void igt_hdr_disable(igt_output_t *output);
+void igt_hdr_enable(igt_output_t *output);
+
 #endif /* IGT_HDR_H */
-- 
2.25.1

