Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C0ECCD1BF
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 16:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F0010E60A;
	Tue, 28 Oct 2025 16:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="muK49PNA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0796B10E60A
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 16:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761670363; x=1793206363;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XeC1BKfsz2PwMMXBCdaFRLt/vkwVIwz1oE16JIZzd2Q=;
 b=muK49PNAB98FgNE6J32i1zbSIyvll16txUd7T8xOiDsqc9DySejdUDQ/
 5zxv0lNmdhP0xTsKCiaqBRO0YqyYEKRwZgmCoHZEoB9sjCsWYVVXLnrnC
 vcumscI9A3kofFeCHS4MAAf+HzKgD+v3BXEj6zGrdRxMbbgPPUCpfF99s
 FBOZoyBJukyldCwGwW9Xq3yCCzhvxR+FvRxb7Nepoj0moLL2Hb9xvX0MZ
 Ec6nG0HMdb2ryXtkm0yQKhouTKn42sbcx18fXKz/GmoOZrGU4xqqAzZ0+
 w7KEJc4r2hwQcC9D99toRi8xdqs0lUFoPQWuI9PhApacgKlsNXdist8uP A==;
X-CSE-ConnectionGUID: Nou63d/USH2Ct8/G4pHNXQ==
X-CSE-MsgGUID: 1qILl8+lQQm2TwJRNOoxmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81200086"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="81200086"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 09:52:42 -0700
X-CSE-ConnectionGUID: msyHHcmrRcyihK4JmOosQQ==
X-CSE-MsgGUID: Fa7zKxdGTGy8+CK1MVovKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="216061245"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.157])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 09:52:41 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3 0/1] Sync PCI ids with kernel: split BMG to BMG-G21
 and add NVL-S
Date: Tue, 28 Oct 2025 17:52:34 +0100
Message-ID: <20251028165235.39234-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.1
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

This syncs Intel GPU PCI ids with drm-next kernel commits

edb660ad79ff ("drm/intel/pciids: Add match on vendor/id only")
78de8f876683 ("drm/xe: Handle Wa_22010954014 and Wa_14022085890 as device workarounds")
c002b1764e7b ("drm/xe/nvl: Define NVL-S platform")

with NVL-S being the last one.

v2: squashed into one commit (Lucas)
v3: changed message and desription, added r-b (Lucas)

Kamil Konieczny (1):
  lib/pciids: sync with kernel commit c002b1764e7b

 lib/pciids.h | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

-- 
2.51.1

