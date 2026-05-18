Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E71ACD4F52
	for <igt-dev@archiver.kernel.org>; Mon, 18 May 2026 08:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B2210E73F;
	Mon, 18 May 2026 08:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CkmdU7bQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F2A10E745
 for <igt-dev@lists.freedesktop.org>; Mon, 18 May 2026 08:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779094090; x=1810630090;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n0e4UrY1Igbi7rgH7p3eXmGmonx31G7biE3WsjfMa8g=;
 b=CkmdU7bQSsKLDhmfSfzJ3xsGxbnl7oqeJ0TrY2nvp0AVxApaDe5oYdzk
 B8P9b3i9VrVUXpojjnzMJaDjtWRrTBJUMBqnC9kJgHpdAmoQ/ABdzCKFS
 FX7INWfXhNMJSHGIjXJjvCK3MKV+mvLV8a7xt65pIlCxgKYmxRJwCXUHs
 D0/fZO3h/rUtus/MPtb+rncEZEf0HgV9TEngPkc++GWTpizWLTxFvHvV5
 UPu9NsUO6vg6QKVwQlQ8em+kNiMVXsVwpQ2FhUh/ujmq6wUXjvCjggU9u
 MafJi0OiRUuypiN/+KGfx0muWfsvEUmnziv6R3dOa0P0HRS0WNbr2CKbV Q==;
X-CSE-ConnectionGUID: GiFfqSluRAaKx7UfoOuFGw==
X-CSE-MsgGUID: MTlIeGhFTaOmUAs88vVp3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="83812205"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="83812205"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 01:48:10 -0700
X-CSE-ConnectionGUID: amJoMYUcTc6oWGl0AeNY4A==
X-CSE-MsgGUID: gUGmveAaSYW8wbxkkPzniA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="243364259"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 01:48:08 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, jani.nikula@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/2] Add preferred FB modifier helper
Date: Mon, 18 May 2026 14:16:29 +0530
Message-ID: <20260518084631.1085515-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add an IGT‑internal modifier, IGT_FORMAT_MOD_PREFERRED, allowing
tests to request the preferred tiling format without hardcoding
driver‑specific modifiers.

RFC Patch: 164817

Jeevan B (2):
  lib/igt_fb: Add IGT_FORMAT_MOD_PREFERRED helper modifier
  tests/kms_cursor_legacy: Use preferred modifier for non-cursor
    framebuffers

 lib/igt_fb.c              | 38 +++++++++++++++++++++++++++++++++++++-
 lib/igt_fb.h              | 18 ++++++++++++++++++
 tests/kms_cursor_legacy.c |  8 +++++---
 3 files changed, 60 insertions(+), 4 deletions(-)

-- 
2.43.0

