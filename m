Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EB2C36010
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 15:30:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBD910E5E5;
	Tue,  1 Apr 2025 15:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kW6rc9kV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C350310E5E5
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 15:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743521433; x=1775057433;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v1arCGtMOsrM8zN6WonLyVfQbhmGJbHmX9P2Dmcc73g=;
 b=kW6rc9kV5sLNMyxmaipqOHlDd6iaMrXNo2QcBttWS8zgrB453BkeS/xp
 HTUEkhpS5TGMAy0sF+YzttPXINlh+u6w/vzAfIiig9Y5RQVRSuArPZico
 1OTP7dAFYhX8+rblKV0fLc2B4Mnes/0YDve1s8JzByOTzJ3uhd9u+rmdI
 cxmFS7FlUkNmLBV1nI2BWJRBjNhTSjbXJf8m5khLsWvbNj+JGRhl6HVNz
 ueIzOsPa1bQeyNLbRCbh8Iitn02iZf/F9ZckJYNO47pilyAa1MN85DsNs
 jNY/bYOHYStJkNifJ7ONs1IsfXSex4rjicSulNIkhFV7DV7M0gjPBwB1F Q==;
X-CSE-ConnectionGUID: n+/x4fz2TVyfKAB9GxYHDA==
X-CSE-MsgGUID: kzc+JkyiQPefzJ5WqkrSXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44735461"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="44735461"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:30:32 -0700
X-CSE-ConnectionGUID: X1w75TOSSKmgL0yEP8w/Ew==
X-CSE-MsgGUID: EECk+rD7QTmzjal5K3VXZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126941812"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.116])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:30:29 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Petri Latvala <adrinael@adrinael.net>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v3 0/2] CONTRIBUTING: Add subscription info,
 patchwork link and lib guide
Date: Tue,  1 Apr 2025 17:30:23 +0200
Message-ID: <20250401153025.48366-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

Add info about subscription for igt-dev mailing list and a link
to patchwork and lore.kernel.org where sended patches with test
status could be seen.
Also add some general guidelines about libraries.

v2: rewritten second patch about lib functions (Andrzej, Katarzyna
  and Zbigniew review)
v3: added link to lore.kernel.org in first patch and rewrite second
  with more generic statement for tools/ (Ashutosh)

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

Kamil Konieczny (2):
  CONTRIBUTING: Add subscription and patchwork info
  CONTRIBUTING: Add guide about igt libraries

 CONTRIBUTING.md | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

-- 
2.49.0

