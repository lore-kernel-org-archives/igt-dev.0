Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D14AC7115F
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 14:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44CD10E72B;
	Tue, 17 Jun 2025 14:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MWLbJUYb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98AF610E727
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 14:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750169182; x=1781705182;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=ZEA0P4OELLhZT0FRICI6AniZOQJxu+5CDMJ79vuXlzA=;
 b=MWLbJUYbBFtbZOP0NhaRlL3Hon67ImaRCzsLFecqiYUx4xJB+1AhtDnI
 T2RhSTYIS8DiV9dZAWIWQc3rsBZPHGfpuePmwSq2FauhIyh6A1WTYTIZA
 UDXGKN3i7AQtA8EyCSmIxPLhjDTuMl0nc47AKUbr9GASHbOAXm246sMnH
 6rQ+3ipNpUX8nZrLaXZP0I4Oa+UUxHUdFvxAHijw9HFcZbgx2p7mrF7EM
 eO+gkBW5ug7RtwqKkawDZ7jqtKIvq+pN3sXaKH8vTgpsGEEuHj9ErYWL4
 dVvcTnbz/HuzYkOMEjXH4IOET31Oodz2h4VgA4ugKrauh+KuUh+aIzRdN A==;
X-CSE-ConnectionGUID: rWGES/kdRmOriKPlvNXDLw==
X-CSE-MsgGUID: vjIJxsQxQC+wdKZ07WwZ3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52431604"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="52431604"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:06:22 -0700
X-CSE-ConnectionGUID: T+anQnUsRKeXtHvodpzSwQ==
X-CSE-MsgGUID: byZN55O6RkGKexxPNfxjMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="172036309"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:06:20 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 17 Jun 2025 16:05:23 +0200
Subject: [PATCH 1/3] gitlab-ci: build docs before installation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-bump_fedora_to_42-v1-1-d04e6a0455fd@intel.com>
References: <20250617-bump_fedora_to_42-v1-0-d04e6a0455fd@intel.com>
In-Reply-To: <20250617-bump_fedora_to_42-v1-0-d04e6a0455fd@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=865;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=ZEA0P4OELLhZT0FRICI6AniZOQJxu+5CDMJ79vuXlzA=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoUXYsIj3/B2QLgUGioA6gHQFqfF0NeUSLdwPcL
 TdlUXIn5R+JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaFF2LAAKCRAjYrKT3hD9
 10HDDACzrUmd5rfCKrz2cc7GIkOEZLcaiPXhdZEWrwAzcYYfeIY+6RZhmN1ytET3gPoDwZ61qP6
 GLT3avZHdfMq/QyseufNI+okwHYTWILgwM1gpgCIBzl/78R8vU91ylUcQVZrG1Coa4WczR5qCiP
 EsrQ7E7reE6mAJncko7HdzBFaR0BRalmfUnnq/nBnGozmQUnGpOj+o8F/HiXwBLVDahLueE7eDo
 QXMUxrh5+n4gwDzJgsEFDtBTTxEv6wkx8ZU/0w8H/4VAUwL6PG+imOdV0G2Lb9EHMrqEMUonCFf
 T2fBniqTlX19CNw7p0l73mUcp/EVka4eekRz7OyRWWsd+SagBCLv4JqehoLUzmoKRFbPPM4Bnj0
 xO5t88V7bb1odF4wyHiYgIUrvB3W299hyv7qhWV5j6TRn2WcXHsqoIPCTF2jH80tPoQn+AAzGa2
 7Zjt8nynyIZoIbfoOB55m1Xd19agFbDKzlO6zU5Fu5l279C6iCvyTZc+0Drqcq7I39gbQ=
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

The proper way seems to 1st build then install.
Not sure why it works with old gtkdoc, but newer one
reports error.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 587bf884708b315b3c015fec9467f7993bd56417..637112e4e10d678a70c9a6964ec9b2ce55876c34 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -76,8 +76,8 @@ build:tests-fedora:
   script:
     - meson setup --prefix=/opt/igt $MESON_OPTIONS build
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
-    - DESTDIR="$PWD/installdir" ninja -C build install
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} igt-gpu-tools-doc
+    - DESTDIR="$PWD/installdir" ninja -C build install
   artifacts:
     paths:
       - build

-- 
2.43.0

