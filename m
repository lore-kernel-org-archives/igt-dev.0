Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65641D2E034
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 08:03:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3906610EA2C;
	Fri,  5 Dec 2025 08:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bi6g7OtH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A284D10E232
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 07:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764920053; x=1796456053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gjoxpyjYZe4EkTx9E+8u806r9IR+IM6ypLod0al+5mI=;
 b=Bi6g7OtH4+qHonow0lBMiANGxuOfi1mCQh1/WemQd/MTQ6xT8mZkBwpV
 j+KIwbBvIRAFs9vZuTkr0/3TzM0LfK6sR2NLugVd9LmSJmNnam/S4xWGl
 vRwp59vv7CzLIbeIHnMwVib2hDhKsbPlfOZjN2xd7oGk0MsAW6XA+Zqk+
 M0LIm4gwOlpL+gzEV8yaCTqyPSxfsuG3S0Bby2RYiInznuyWMDIY7M5vA
 b6SUs7nkLN/YcWmUX9nWEaxRJe4ZyNuiwR9R+fEMXQrSMzrDm2NB8V7J5
 Muf9ndN0lEOiCocyXj/kTru00rp1eznG6SA4aynDYgckBqeyZipyS/2tT g==;
X-CSE-ConnectionGUID: FrmT0g+xQl6SgcUdGUeWHQ==
X-CSE-MsgGUID: m16TYzs7SWGCuwy3iIVdAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="67115886"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="67115886"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 23:34:13 -0800
X-CSE-ConnectionGUID: oT7Ds3MOSYiSm9e+8EcbjQ==
X-CSE-MsgGUID: jw02RcrJTwOWFBxNaPm0DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="199664801"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 23:34:11 -0800
From: Moahmmed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t 1/2] RFC: chamelium/kms_chamelium_hpd: add helper
 function to select connector port
Date: Fri,  5 Dec 2025 13:02:48 +0530
Message-ID: <20251205073249.653927-2-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251205073249.653927-1-mohammed.bilal@intel.com>
References: <20251205073249.653927-1-mohammed.bilal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 05 Dec 2025 08:03:06 +0000
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

From: Mohammed Bilal <mohammed.bilal@intel.com>

Introduce a new helper function get_port() which returns the
chamelium_port matching the requested connector type.
The helper iterates through the available ports and
returns the first match, or NULL if no matching connector is found.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/chamelium/kms_chamelium_hpd.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index 161f494e9..3c8af63bd 100644
--- a/tests/chamelium/kms_chamelium_hpd.c
+++ b/tests/chamelium/kms_chamelium_hpd.c
@@ -158,6 +158,21 @@ enum test_modeset_mode {
 	TEST_MODESET_OFF,
 };
 
+__maybe_unused
+static struct chamelium_port *get_port(struct chamelium_port **ports,
+				       int port_count, int connector_type)
+{
+	int i;
+
+	for (i = 0; i < port_count; i++) {
+		if (chamelium_port_get_type(ports[i]) ==
+		    connector_type)
+			return ports[i];
+	}
+
+	return NULL;
+}
+
 static void try_suspend_resume_hpd(chamelium_data_t *data,
 				   struct chamelium_port *port,
 				   enum igt_suspend_state state,
-- 
2.48.1

