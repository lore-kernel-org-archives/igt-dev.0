Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CACC30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:29:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A6610E6F9;
	Tue,  2 Jul 2024 23:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Trtyl0UO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5963510E6F9
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962987; x=1751498987;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8lbgLQHnh6jlBS9ORHZfUWZl8l2fC8ZzD9ozYP+LYeo=;
 b=Trtyl0UO25MseaOFI+jLY8uBsvjo2kFiFo5KbrXF1ONu5R3SrFMiq5X5
 0CDg5F9KQ8DpefM/aJkqye8+oSuvXu7OXx2qphoS8QOyAiZH/P//OF6/y
 Hk1R7VRpPshkHu0IOZjqBfwdJYpyhlX9C1t0HQLbNIEZbj5Mqk6ihLMxj
 a+xSaJ72SgxjG74FX1AAKCmUZqnI1dor60oaoByYGwy2oOpWzpNaOVwr4
 /6HI9P9S0ZN+THsqp/olJYGT2fy4nzeJ+oOyS3PE8n0+df5NpO26kvUbY
 rZDHoPEs0C/q5zrdOx460H9Btv0ti9TGZGIKiGZkxefdVnN74RabMIkvI g==;
X-CSE-ConnectionGUID: dJSk/oDWQAi+KYl/QltY1g==
X-CSE-MsgGUID: 5fzdNhvURrKWsMzR+LKlsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559686"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559686"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:29:46 -0700
X-CSE-ConnectionGUID: qbQjBS1nRxa7hA1JlYFwlA==
X-CSE-MsgGUID: QKUnhlbLQYeBTEgiuoeohg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043919"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:29:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:29:43 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 31/37] tests/kms_plane: Skip 10bpc formats with media
 compression
Date: Wed,  3 Jul 2024 02:28:11 +0300
Message-ID: <20240702232817.31147-32-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
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

The VEBOX just hangs if we try to use a 10bpc format.
Skip 10bpc with media compression as that would require
using the VEBOX.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_plane.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 8b6fc1cf6aa4..6b5fb7266ef3 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1011,6 +1011,11 @@ static bool skip_format_mod(data_t *data,
 	    modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
 		return true;
 
+	/* VEBOX just hangs with an actual 10bpc format */
+	if (igt_fb_is_gen12_mc_ccs_modifier(modifier) &&
+	    igt_reduce_format(format) == DRM_FORMAT_XRGB2101010)
+		return true;
+
 	/* test each format "class" only once in non-extended tests */
 	if (!data->extended && modifier != DRM_FORMAT_MOD_LINEAR) {
 		struct format_mod rf = {
-- 
2.44.2

