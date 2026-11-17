Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2B7606A337
	for <igt-dev@archiver.kernel.org>; Tue, 17 Nov 2026 14:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aHaHuVYD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C03810E406;
	Tue, 17 Nov 2026 14:02:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870F810E273
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2026 14:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794924097; x=1826460097;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dqvMDV0undHTqRAzLNYayMlSSHkTAa0JnYvWmnAGkik=;
 b=aHaHuVYD40MsiTZCXlEpF4yIn8yWYw8Iu0zYLMTJr+aSe9MWRoPGx5VM
 cpgDLs9wU4LT/wjSoWRpyGagXQ5ExgaCeRjnKjA/HtZDGTY4qZHAJqKXk
 oQaxlUTTLT1whi3QbWgT382MjC0tC6BE50Xh79BgIKwDWaTEPtZ4AkMja
 ZeZv0UacsekHH2vZXXNKmjjNQIDdMMrNf/dzj22NdM7qPxvuRlhFXg6nM
 QvneKa/0rmJkmZM2uSHcgjh/7/rMbuWELIQytAbMjcj71bGH9SIkQdxOl
 4yuM3YVC4RS51WFmHGAgKJo0wod1MaQ5DeA2NX9g+GivCuWaPoxu1HtIQ Q==;
X-CSE-ConnectionGUID: 0uaV7NTLSl6rm4RtYdHZVQ==
X-CSE-MsgGUID: 6ORYkiaKRKKFzLZOyhaGAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3576372"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3576372"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 06:01:36 -0800
X-CSE-ConnectionGUID: 8RaGCGTIR+Kvszs9N0wt5Q==
X-CSE-MsgGUID: 27hwO356Rxe4PRGWIIpvyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; d="scan'208";a="10104117"
Received: from shawnle1-z890-eagle-wifi7.itwn.intel.com ([10.225.64.208])
 by fmviesa008.fm.intel.com with ESMTP; 17 Nov 2026 06:01:35 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shawn Lee <shawn.c.lee@intel.corp-partner.google.com>
Subject: [PATCH v10 0/2] tests/kms_vrr: Add full-range refresh rate testing
Date: Tue, 17 Nov 2026 13:59:37 +0000
Message-ID: <20261117135939.93225-1-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Shawn Lee <shawn.c.lee@intel.corp-partner.google.com>

This series extends kms_vrr to validate hardware stability across the
entire VRR refresh rate spectrum, rather than only fixed step increments.

The first patch reverts a previous workaround that started virtual RR
tests above the midpoint to avoid mode fallback. This workaround is no
longer needed once full-range testing is in place.

The second patch introduces a 'full-range' testing mode to kms_vrr.
When enabled, the test iterates from maximum down to minimum refresh
rate (stepping by 1Hz), covering all supported rates within the VRR
range. For eDP displays, the test is skipped if the panel does not
support multiple refresh rates. Standard behavior (min-to-max with
defined step size) is preserved for existing subtests.

Lee Shawn C (2):
  Revert "tests/kms_vrr: Start virtual RR test above midpoint to avoid
    mode fallback"
  tests/kms_vrr: add support for full range refresh rate testing

 tests/kms_vrr.c | 182 +++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 141 insertions(+), 41 deletions(-)

-- 
2.53.0

