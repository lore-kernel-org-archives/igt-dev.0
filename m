Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AA6C61CE8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 12:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B198510E82A;
	Thu, 12 Jun 2025 12:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ctlaaS7O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A1210E82A
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 12:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749731484; x=1781267484;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=bi2aSV2VaQeov9J97EuexquhJC+oJ97eqzilq5ZoRoA=;
 b=ctlaaS7OnSVe5f29R9duBCCfTzS3Qtb29aP2k/SNN7ERR/DXzykSM56K
 CihvT5YDFByLZFceGLYHtATGkJbPSSXKRXaRC+ygcd1E+NslornfV+bLL
 BIM1wQ3tH4dNIep8dlasOxjsy4bEBArXJ79fCJHTRhZo/oUPaA3kOQzuU
 CeVNX1a9X2IKdMoe1jR88oO7ra7aITZpQepmLEWdqtPRG8pTYec1CctQV
 JtP0TryUTtkBirfs0CLUI4Yn4A/YK5n1fLpmhBD/skDGkm1NxinbK8oaZ
 vp5e4Hn4x0Pe/TursO6BLKDP8MLpjsgAAP5y0NQidZdClKSpWGZm5B9hs Q==;
X-CSE-ConnectionGUID: UAJ16ncPQN2FqirslgoWzQ==
X-CSE-MsgGUID: GcojAPxeQoybAnQIGOi/+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51777777"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51777777"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 05:31:23 -0700
X-CSE-ConnectionGUID: 0TcxMOsMQcu7Aglv8cTsTg==
X-CSE-MsgGUID: FfLnjd5uS4ymIhub8dmvHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="148061587"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 05:31:18 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 12 Jun 2025 14:30:13 +0200
Subject: [PATCH v4 2/6] Dockerfile: remove MIPS architecture
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-bump_docker_distros-v4-2-10d18745c7d4@intel.com>
References: <20250612-bump_docker_distros-v4-0-10d18745c7d4@intel.com>
In-Reply-To: <20250612-bump_docker_distros-v4-0-10d18745c7d4@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1321;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=bi2aSV2VaQeov9J97EuexquhJC+oJ97eqzilq5ZoRoA=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoSshhDUzzQjvDW13HQBUaUk/3wZx2YZMxoC41C
 eEjzLzJws+JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaErIYQAKCRAjYrKT3hD9
 17JGDACSxInxShpk5vmEE4fuDVV4oGxoZV+vEHNHYmIQOKtLlxGefO4aKmABL9FuY/EO11+KYPM
 QEaQGbImeEX7EoG7eCtqsuVHfM4gGIkxBRvWXNicGcyUrhWAYD5JizI24g5hYVimgsT/S5g4gyB
 e9bEXkCfbs3H4JbWFrJiu32wY5+HQjFIs5zyWE5drdiHzqDYt5w6wRinkdD+rqzr6lKfu3rgclY
 WloOQXcJu48KkoFuBeKasnGzNiioBeWmlZKUJCf8XU1PhI9gq2dGtZgAVr8nR/+6ieOTGWI/s3H
 XJd8pIfzvQZ2iU1zE/edLg3nmSN3Xv03RJgh/wUdZLlCudSp29OpUJCBCKBOks8jPXgswYhyjVe
 8xLOA2NjKYrwPHi+oI2q9tT9F+qP+7g13RHf+8rG41JEf2TpYjAYk1e8vaA3PzbxkBBM2+ZGx3q
 miwlW7J06fDWOuTmO7cph17yk2F4f1Nci08Rk/YTr0eOiEOmH/f1d30iUlnQUFIyZ+jLQ=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

MIPS is no longer supported by gitlab-ci.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 Dockerfile.build-debian-mips | 39 ---------------------------------------
 1 file changed, 39 deletions(-)

diff --git a/Dockerfile.build-debian-mips b/Dockerfile.build-debian-mips
deleted file mode 100644
index 9b7c0a5b4703e8dd9461406731af248b050a0a2b..0000000000000000000000000000000000000000
--- a/Dockerfile.build-debian-mips
+++ /dev/null
@@ -1,39 +0,0 @@
-FROM debian:buster
-
-RUN apt-get update
-RUN apt-get install -y \
-			flex \
-			bison \
-			pkg-config \
-			x11proto-dri2-dev \
-			python-docutils \
-			valgrind \
-			peg
-
-RUN dpkg --add-architecture mips
-RUN apt-get update
-RUN apt-get install -y \
-			gcc-mips-linux-gnu \
-			libatomic1:mips \
-			libpciaccess-dev:mips \
-			libkmod-dev:mips \
-			libprocps-dev:mips \
-			libunwind-dev:mips \
-			libdw-dev:mips \
-			zlib1g-dev:mips \
-			liblzma-dev:mips \
-			libcairo-dev:mips \
-			libpixman-1-dev:mips \
-			libudev-dev:mips \
-			libgsl-dev:mips \
-			libasound2-dev:mips \
-			libjson-c-dev:mips \
-			libcurl4-openssl-dev:mips \
-			libxrandr-dev:mips \
-			libxv-dev:mips \
-			meson \
-			libdrm-dev:mips \
-			qemu-user \
-			qemu-user-static
-
-RUN apt-get clean

-- 
2.43.0

