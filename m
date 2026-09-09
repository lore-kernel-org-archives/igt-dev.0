Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3581C79FB6
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 11:16:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A85B10E180;
	Wed,  9 Sep 2026 11:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gGoDhy1q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A329A10E147
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 11:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788952560; x=1820488560;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=644+d7IGq65lsSiCnQCAmlcQZj3VseM/fkKfzs3hmOw=;
 b=gGoDhy1qhj1CcQAffTPh7CIqzTS9HOC+55C7jiD5ZpYaNrwmhN4tMxWB
 xTYfgoDU3okMpdBuCvFisXrpNVwy82E7H40IgM2sO0/iiHcwqMHf8puE5
 CuxfFXr7b1blXa3+IqjScPCXDXJ1Oh9pJ8Oavg/IN3T4RFGgh8GeGtFRV
 CnVUWhGhCkyVEER7IT7L0sHcPnXKp2Q5jTwexZqSGbhC8Z6vTHt1Ocrew
 Jvx8VXxt0jQrqpLPlt87zM9xkYLRZkn7mS7HlDVo9wXKHhUWMio9lGE7R
 /f4Meg/FwQphqUkf07x70Xxz7RgD8GzVd6j9vxy/JWH2yfzM61YyxooU3 A==;
X-CSE-ConnectionGUID: BUpRsTd+QlCi8bUq4RAIcA==
X-CSE-MsgGUID: h0oiU6jgQFCfsUKWZawunw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99706641"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="99706641"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 04:16:00 -0700
X-CSE-ConnectionGUID: 4qLC3ZTjTyaiP9Ry6J72/w==
X-CSE-MsgGUID: WgHEjKeoQl+aMprMFq/dwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="270806078"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.43])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 04:15:59 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] man: Make man pages reproducible
Date: Wed,  9 Sep 2026 13:15:51 +0200
Message-ID: <20260909111551.48722-1-kamil.konieczny@linux.intel.com>
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

Man pages are compressed by gzip and default options write to
archive file a timestamp, which leads to different binaries when
generated again after some time.   Do not save timestamp in
archive and make building man pages reproducible.

Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/194
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 man/rst2man.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man/rst2man.sh b/man/rst2man.sh
index b7f289910..f7afcab37 100755
--- a/man/rst2man.sh
+++ b/man/rst2man.sh
@@ -14,4 +14,6 @@ cp "$input" "$out_dir"
 ${rst2man} "$out_dir/$in_file" "${output%.gz}"
 
 rm -f "${output}"
-gzip "${output%.gz}"
+# Do not save timestamp in generated file, so it will be the same binary file
+# when generated again after some time.
+gzip --no-name "${output%.gz}"
-- 
2.55.0

