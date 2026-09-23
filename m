Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F75EC98302
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 14:09:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95CA10E8F9;
	Wed, 23 Sep 2026 14:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="muKkHSaM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D62E210E8F9
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 14:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790172502; x=1821708502;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JeYbstmoN3tX22KVSY6766bs2BRgZMiajjAEYekEYYE=;
 b=muKkHSaMfRHJo6GikdlLtYTOk6C9KKynp3o3IJZCaPW4Qqmi0MDSLHEw
 n/afJpZ9p4tIfwBpacaNbxNOskdZuC0If5HVl7CK+bzFUlDBJgDBWPlHt
 iXhS2vA0U/5NguyA0KXUkp/fALYe+tEhrkGXj6WwRy8zqTSIKWPeNnXSE
 AtcpzVFs8VCvHXmtjf6LR/r+MngUJJGZ9FsWXg66/LbtRQiNa1i0i6bBf
 mxUKqRrKTtD1SDiideNdd12/GkF0SaU6RESOaIUZTn0cPx0dJ5eg0S2BD
 Zz5fsxFku+gJQ//GXsLce7k19u5jAxh3KAN6mOfZZDTKURJQkTV9VYkD2 A==;
X-CSE-ConnectionGUID: q0kwYksiSeWp5qIVKlgP6A==
X-CSE-MsgGUID: rsKV74jXTjSk4Vi8NZ/AFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90988103"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="90988103"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 07:08:21 -0700
X-CSE-ConnectionGUID: izyx2N1YTa6Wnn15lgJtcA==
X-CSE-MsgGUID: CjCAzqggQEmFVWkpTJa97Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="281697482"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.228])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 07:08:20 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t] Dockerfile: bump fedora version to latest
Date: Wed, 23 Sep 2026 16:08:06 +0200
Message-ID: <20260923140806.189792-1-kamil.konieczny@linux.intel.com>
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

Fedora 42 is EOL so bump up it to latest.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 Dockerfile.build-fedora | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
index 30791faef..a65f1030d 100644
--- a/Dockerfile.build-fedora
+++ b/Dockerfile.build-fedora
@@ -1,4 +1,4 @@
-FROM fedora:42
+FROM fedora:44
 
 RUN dnf install -y \
 	gcc flex bison libatomic meson ninja-build xdotool \
-- 
2.55.0

