Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A0FC27C52
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 14:25:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7039F10E51A;
	Fri, 31 May 2024 14:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7hYBjcD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B0510E3EF
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 14:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717165509; x=1748701509;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=/E0A43ZdT7B6iHczIGpXoXdQXv36StVew67ZDCmGj6g=;
 b=i7hYBjcDyznRr1iOwSIAlXVKjNYntjXNtP1w7v3Xe10DbSyI8F5h9+N6
 4OpygvdEBcoPjKI01F9RMJRNqz3OFDlVK9xiHxc83ZloPV8c5VtNnTLJq
 3F5vNQbte0q2RsxfuplqkQQ3J+Rst6CfRxnq5DWaRUXSYuRfLdWO9wGYh
 ZJwznbMVJVlBIcI4rlmPKaEKEM5o5NzGkEhC+emd6en+vmOe4kdiicUpP
 eiYzFGSBGCWzH8+MUCSrLBzxDxNSm9tHu/OLXnv4VMJbHLBMWIPdSg31t
 4aOiA3L47rWSVCoeHzT5DEiS06OSOkVzPyG5yN9KYY0zK3TZUetHTNKSO w==;
X-CSE-ConnectionGUID: lMA1QQGIQjavC9sswDxMGA==
X-CSE-MsgGUID: Onl6iYHrTRWdVundQPBV7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25113716"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25113716"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:24:30 -0700
X-CSE-ConnectionGUID: GCl0jmlZS36DFOsIGBanTg==
X-CSE-MsgGUID: TNh4s7xmS96Rze4RCFnI+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36160870"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 31 May 2024 07:24:28 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 31 May 2024 17:24:27 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 12/20] tools/intel_vbt_decode: Allow dumpers to delcate
 min version for the block
Date: Fri, 31 May 2024 17:23:46 +0300
Message-ID: <20240531142354.16528-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
References: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Deal with the case where the same block ID got reused for
two different purposes by having the dumper declare a min
and max BDB versions.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 2d627c821978..e414a1436a01 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -2652,6 +2652,8 @@ get_device_id(unsigned char *bios, int size)
 
 struct dumper {
 	uint8_t id;
+	uint16_t min_bdb_version;
+	uint16_t max_bdb_version;
 	const char *name;
 	void (*dump)(struct context *context,
 		     const struct bdb_block *block);
@@ -2777,6 +2779,14 @@ static bool dump_section(struct context *context, int section_id)
 		return false;
 
 	for (i = 0; i < ARRAY_SIZE(dumpers); i++) {
+		if (dumpers[i].min_bdb_version &&
+		    context->bdb->version < dumpers[i].min_bdb_version)
+			continue;
+
+		if (dumpers[i].max_bdb_version &&
+		    context->bdb->version > dumpers[i].max_bdb_version)
+			continue;
+
 		if (block->id == dumpers[i].id) {
 			dumper = &dumpers[i];
 			break;
-- 
2.44.1

