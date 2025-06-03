Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89540C5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 12:41:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3602510E5FB;
	Tue,  3 Jun 2025 12:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b99OLjR7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177B010E61B
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 12:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748954488; x=1780490488;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=okN7YpiK/Yy55SfNBCZOvgOYNf4pM2jsCTx9ozESvKs=;
 b=b99OLjR71nnLG0mDvtr7rR+sh7081uLLkEmd9gFX07H3oJVICYlzRlwO
 oCLTbcvE0LSI7MAEpjGB394Gik+LUnkjwvNrFzohJ+m/eITSxuYXBCgGj
 XfhlQTPK6sF3jBdDotpyAVBIvc7VObvCBlQWlEuj9jpBe6AZCkiLd49Gw
 rWb/ljJHRpPxYzYHy+ZuOwxUoxgQ/2A0lTxt+mdy+lBPSW3tNTCmehDTT
 xJBSzqAxN47iaLqEe9rZjz9OJFoRrY0RU7rd1i8Q7PcS+OZiDFSSh7b4I
 dhM9aoU6+fcxL9KTHVoo1ILISEgPD7ykTa/DRhYbR5QtV8kfCgffVsSLr Q==;
X-CSE-ConnectionGUID: YoH/ZJsIRpOYA9DK5NEUsA==
X-CSE-MsgGUID: Z4kxJlTiRimbq8DwPTsUQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62045703"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="62045703"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 05:41:28 -0700
X-CSE-ConnectionGUID: CduUia6mSn2E5UO6U9DLpA==
X-CSE-MsgGUID: zOP9j7yFS4WUrzJX/JTfFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="149719708"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 05:41:26 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 03 Jun 2025 14:40:39 +0200
Subject: [PATCH 2/3] Dockerfile: bump Fedora version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-bump_docker_distros-v1-2-cf7e062e339c@intel.com>
References: <20250603-bump_docker_distros-v1-0-cf7e062e339c@intel.com>
In-Reply-To: <20250603-bump_docker_distros-v1-0-cf7e062e339c@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=574;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=okN7YpiK/Yy55SfNBCZOvgOYNf4pM2jsCTx9ozESvKs=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoPu1PzmDkM3Cx4Vh6M+s49KB7nMUELtzXSbadG
 J+lWcTKzV+JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaD7tTwAKCRAjYrKT3hD9
 10obC/4le1YLQALQ+4anUo4o1HZOpBlUxeCj7I9X9xn2f2nZoWgNKyXGhfopGywUFJxxqjM7C3q
 Kin6d5FypZCf2BKCKY7U8Q0mQh7VFrqmGa8swmOm1p+PrQsaamXXTTas1NWG1TeQdKSD2CfahAP
 Vc9I8sWR6ffo7EDbeZNK0QPsnp4HcqvS6yz79wHxbL0qV0Lbv5oGzdgKDIhaV8U/FxzkaZAn8xo
 vJi4gti2iiIjwBPdnd3iPL8+zvo3bx7C50XQYNmfPa/YknytstUfIxvYjFPgUGzCiTa06F7ZrKx
 cQzn+H2AZsjcJdvqR0R9Ze/FbgqYfXqBeUelgTZs6/L0bZ0XmaX5XuImhKVqYBo6O9+GnELcd3G
 VjJpqg8enFUh7qcy2qPRV60JdFoyWk/wtxzilz6loXDFUboId5JE3tPthqpCSO5aHOFjHNK9iq+
 C32fB5WGC4gv99OXeS0yTaF5EAO9gS/Uch6dfbQnIVLQkMv8kHFsSPksSSB1zz6S9bA8Y=
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

It is required to update build tools, especially meson.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
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

