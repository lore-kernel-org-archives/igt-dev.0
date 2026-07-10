Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D438FC44501
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 02:15:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB6610E10D;
	Fri, 10 Jul 2026 02:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mVaZMEgF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB2110E10D
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2026 02:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783649673; x=1815185673;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qqKOnYns7gtEVhIhed9agMYri61j8ncWtlilGERbEEU=;
 b=mVaZMEgFM0j0W25ClJc0k1P5vyvBj8ISbFKTDfd65C6DRrJtsQEUUVIx
 AZonxxevGbIY4ZJRwGRTOXFhx9HqJUY+OoBMEEPyAG1ibAlpA3qblAk9Y
 kNioyTVttVRogG5B8eWlLb9o4mO/mub2kj600KQY+Hj197vfC68I5nFOo
 AZbFrwNPK85k14KiJ0qk1ZduftGn7Bq8YfVng0rGcCg42oFHV43ZL+gYD
 9wg0FVjWriCBoAyKReqogSxzmuqqbcpFQNE1dXuKrdKlgmmUVvQXYwazG
 FXsNy6w8D+GQGzPyBluj8tLR750qP0S8qWaRlL4+v2JGjKdCOggCvQTuw g==;
X-CSE-ConnectionGUID: Akcx05WFQXS2RJJ/ZDpqVA==
X-CSE-MsgGUID: DIa81mfCSaOdwzBeivuxSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="109892151"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="109892151"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 19:14:32 -0700
X-CSE-ConnectionGUID: ai+49y4uQHCk3JDDsyvQNw==
X-CSE-MsgGUID: xwKxTswdSGmcnM3dOAauhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="248388519"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 19:14:30 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v4 1/2] intel-ci: Add audio/color chamelium tests
Date: Fri, 10 Jul 2026 07:57:40 +0530
Message-ID: <20260710022741.89883-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.53.0
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

Extend chamelium-only testlist with audio-after-suspend tests for
DP/HDMI and kms_chamelium_color_pipeline tests.

v2:
- Update commit message (Kathik)

v3:
- Update the subject (Kamil)
- Split the pacthes (Kamil)
- Move suspend tests at the end (Swati)

v4:
- Update the subject (Swati)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel-ci/chamelium-only.testlist | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
index d627ad414..898c53134 100644
--- a/tests/intel-ci/chamelium-only.testlist
+++ b/tests/intel-ci/chamelium-only.testlist
@@ -14,6 +14,15 @@ igt@kms_chamelium_color@ctm-negative
 igt@kms_chamelium_color@ctm-red-to-blue
 igt@kms_chamelium_color@degamma
 igt@kms_chamelium_color@gamma
+igt@kms_chamelium_color_pipeline@plane-ctm3x4
+igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d
+igt@kms_chamelium_color_pipeline@plane-lut1d
+igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4
+igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d
+igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d
+igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4
+igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4
+igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
 igt@kms_chamelium_edid@dp-edid-read
 igt@kms_chamelium_edid@dp-edid-resolution-list
 igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
@@ -71,6 +80,8 @@ igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate
 # Suspend operations can cause system hangs or connection timeouts,
 # so isolating them at the tail ensures stability of main test
 # execution.
+igt@kms_chamelium_audio@dp-audio-after-suspend
+igt@kms_chamelium_audio@hdmi-audio-after-suspend
 igt@kms_chamelium_edid@dp-edid-change-during-suspend
 igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
 igt@kms_chamelium_hpd@common-hpd-after-suspend
-- 
2.53.0

