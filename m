Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA29FC590A
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 08:31:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB5610E0AA;
	Thu, 26 Feb 2026 08:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lqhFw/wF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE7310E0AA
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 08:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772094708; x=1803630708;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=plsCDyg/gz/AgrwkrHHCc0K8VIzB2HgAlsY9N0cX2VY=;
 b=lqhFw/wFWY7QOhKdQgJo4fVhvLa6WHZ13anT7TNrjbrQhVmGvyF+MSIA
 ehDE/qZ5MwDBrX1ZWgKoIZ62gk3/yw2keERhw65qHdGNx5THFvn87pVBk
 BnzyCU3VdCkGIt15RdBOLb40tczRUw/Hwa6XBFDGvXXtX51WYb5VRD/fY
 wYACwYMaPTlEXmE2/kE6QoWYw435C7K8Ej34+0YjAOYB3KYDBq/rvLrQo
 /9NZvaD+i0O8PsUKJkn1OCjXes4p8pNgKNOjIRJ2P2czb90yfBd/F66xO
 Zt4JCe6n1mZU/HbDybhgN3jG7Bo4WNaaK4bjoqJWm880UOXBVafjskCzU Q==;
X-CSE-ConnectionGUID: SRm3zAVCS16i17dPVvT6qA==
X-CSE-MsgGUID: XyeMprNgSzyDNhc8jMgISQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72849651"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="72849651"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 00:31:47 -0800
X-CSE-ConnectionGUID: S/T/c0gvSfKVjyCX8xIIwg==
X-CSE-MsgGUID: LMpD/YhzQJ2Tn9z32g7RGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="214739981"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa007.fm.intel.com with ESMTP; 26 Feb 2026 00:31:45 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v7 0/6] kms_flip: limit number of subtests run
Date: Thu, 26 Feb 2026 09:31:09 +0100
Message-ID: <20260226083115.1747856-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Next version of [1]. This series addresses both 2x-* and single output
tests. It also handles timeouts seen on SNB. This series has been tested
on config with 4 outputs connected.

[1] https://lore.kernel.org/igt-dev/20260224133242.1678232-1-michal.grzelak@intel.com

BR,
Michał

---
Changelog:
v6->v7
- remove unused global vars (Jani)
- staticize rest of global vars (Jani)

v5->v6
- fix typo in commit message (Thasleem)
- clarify selecting compatible mode (Thasleem)
- add init of devid & SNB WA

v4->v5
- rename all_pipes to all_crtcs during rebase

v3->v4
- change \gt into \ge sign

v2->v3
- ease counting of pairs of outputs
- limit number of tested outputs
- narrow pair & output limiting to suspend subtests
- add separate param for pair and connector limiting

v1->v2
- split pipe limiting into 2x- and single subtests
- add output pair limiting

Michał Grzelak (6):
  tests/kms_flip: test suspend on one pair of pipes
  tests/kms_flip: run suspend tests on one pipe per output
  tests/kms_flip: limit output pairs when testing suspend
  tests/kms_flip: limit number of outputs wrt suspend
  tests/kms_flip: staticize & remove unused global vars
  tests/kms_flip: test suspend at most twice on SNB

 tests/kms_flip.c | 79 +++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 65 insertions(+), 14 deletions(-)

-- 
2.45.2

