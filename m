Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA81C71136
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 12:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB11610E82A;
	Thu, 12 Jun 2025 12:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fh9JMlRz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0909D10E82A
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 12:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749731547; x=1781267547;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=6NNcDdjY+br+0o0DRG4kpOcCDMlQWLnevHmZxny1jCo=;
 b=Fh9JMlRzeuwatTULLlW4ve3/PMsqldB4+T9tr6rDt3O6DclKUeQI2+EO
 QIVi7ZGm+n3MsqSF8Bkz8caTVXLq8mBDPhDEeq+JNSfKfiT8vz5vbyKSD
 YOpAAnhxYHUSciMkCN0JlB8t418Pk/gpdiUQxzdNSdvu/3qkPxQc/PFwH
 NC5HF+tb/dMtluwqeSSnlxV81bfT0EMSKra7Zr4z870DP6wO6wwpSI1x0
 f2CnHxDw6HzxoDVitKCNXnYI/f0NP3W6Wh+F9DnKGlwh9xgSzFpAH7iLt
 mksnCYHkp3h5XYPWC55EDUmDi6e3Y4ovqhzxOdbC+wqjMeBQqsh6RLGYD Q==;
X-CSE-ConnectionGUID: tNx6A3GkQnqd5A5t7GnCig==
X-CSE-MsgGUID: ABeJDmBVQhO8Xah9KeYiFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51777815"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51777815"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 05:31:38 -0700
X-CSE-ConnectionGUID: Ol0MM6+bQKa9UN4clIeE9A==
X-CSE-MsgGUID: kt4tY+0gQUuCYWvlc7TfdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="148061597"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 05:31:22 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 12 Jun 2025 14:30:15 +0200
Subject: [PATCH v4 4/6] Dockerfile: bump fedora version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-bump_docker_distros-v4-4-10d18745c7d4@intel.com>
References: <20250612-bump_docker_distros-v4-0-10d18745c7d4@intel.com>
In-Reply-To: <20250612-bump_docker_distros-v4-0-10d18745c7d4@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=684;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=6NNcDdjY+br+0o0DRG4kpOcCDMlQWLnevHmZxny1jCo=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoSshiE75NQCvRHSYajHR1w5RUXRSN7UDfXs49B
 SYfi7laGUOJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaErIYgAKCRAjYrKT3hD9
 157yC/9jiyf7s/bOJM54UvVlA9nCxcXLTgcC6oZttVorpoiM49Uy04SZL1bPj16uhTOpQ6e/6OA
 Half9ToaLST+Hd4GOKZ55ELVlhB+c6YaAycLtIb+7Il1flSJrQacGI9c5bYQDTXLJL94yaoOUeD
 FAcVNJuDiOrhYkUfTbdhBXrV6HkR6nyqShoFscbC90z98OvDVEdeFf7PwZ2F5xXALd988j+pde6
 oS3QxF12zVCQjD1KmLej99aImrNmI5iauhoKOmMXXB0tBanEVsbDM+/ddeCMMhNU4Z32Ae6F8T7
 XrW4uhvzASORRgKVScBpzJAQVGa9EYa22UexTbu8XcK6E2uIcRbEt65GU3rBzLrDyaMud59Q+As
 G1OufxDNNaIM2ODyjhQVpi/BKlfAHRnqeDeIF14QL6OJ/Q5IUOhp/s45wetnL1/jOqB0tLNomkT
 s/UOSOyLbdv3V4DO0j1pkfqq4NYGRa7oA9Fk5EeU4i0FDk6plTAKaCMu20EgTAKrmeMMY=
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

Strategy for fedora is to bump to the latest version.

v2: updated description
v3: bump to latest version

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Petri Latvala <adrinael@adrinael.net> #irc
---
 Dockerfile.build-fedora | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
index dc5d1b16b48880694167750cd3990bd7d7154d43..00f45857c20f82320500e7230e72c9522527e7a9 100644
--- a/Dockerfile.build-fedora
+++ b/Dockerfile.build-fedora
@@ -1,4 +1,4 @@
-FROM fedora:31
+FROM fedora:33
 
 RUN dnf install -y \
 	gcc flex bison libatomic meson ninja-build xdotool \

-- 
2.43.0

