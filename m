Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29336C88E5C
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:24:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5ECD10E37D;
	Wed, 16 Sep 2026 11:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lj4MYINJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6590810E3B2
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557549; x=1821093549;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZMIgvPptqgOdOee+y1Jdy7sFbXUHa/DwQLAi5xgO+G8=;
 b=lj4MYINJV+thXwllFUwDV1xLxxI7pXDdwpLstZDbPuJsIuJJVhSb6wbb
 vGVz0OcQqiskRhhUWejSWL08hsUlcY4SUIhaUeiLwRQUrSnaN75y9vRr5
 c0Jd9PzvLuvk5JtoJpbR8RSv+E2Qc/011zpU+qvFj6VBaFvc2820qvkJX
 8lJC/QunnYAT5Thhi7r3kQ6U/vCXqFzSQNUL6My5JTBXjIbwAqsqz4jRa
 3IKT11t/9ZKoJktKl15VK+SRUixuml7jwKMcE+uvz25ZJIG+R+ngH792f
 cOSBFkLANEBOdhwc+vNsHWh3aKuRh44eiO49HmsR7REZpM4z5ksBdbygj A==;
X-CSE-ConnectionGUID: eEyByyB5TpKOl9LPhkPiag==
X-CSE-MsgGUID: EIGlEtHTSd6s59k1UZSBsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="441054"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="441054"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:19:09 -0700
X-CSE-ConnectionGUID: Gg3cXjfQR7SBJ5fCxCZpOQ==
X-CSE-MsgGUID: 4aLrYHTJSxuXFSgV1oVX+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296802258"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.146])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:19:08 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: [PATCH i-g-t v2 0/3] Bump debian version to bookworm
Date: Wed, 16 Sep 2026 13:18:59 +0200
Message-ID: <20260916111902.73626-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
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

Bullseye is EOL so bump up debian to bookworm. This is needed
when a rebuild of debian containers is done, which is the case
for a fix.
Removing also libproc/libproc2 packages, as /proc parsing was
implemented recently in igt_aux lib.

v2: removing libproc (Andrzej)

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>

Kamil Konieczny (3):
  Dockerfile: remove libproc packages
  Dockerfile: bump debian version
  gitlab-ci: Fix computing sum for debian image

 .gitlab-ci/pull-or-rebuild.sh   | 7 ++++++-
 Dockerfile.build-debian-arm64   | 3 +--
 Dockerfile.build-debian-armhf   | 3 +--
 Dockerfile.build-debian-minimal | 3 +--
 Dockerfile.build-fedora         | 1 -
 5 files changed, 9 insertions(+), 8 deletions(-)

-- 
2.55.0

