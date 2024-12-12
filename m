Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63ACBE77180
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 10:52:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1296910ED5B;
	Thu, 12 Dec 2024 10:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d3umGgH9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C41D10ED5B
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 10:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734000760; x=1765536760;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Br7s1ZvGcD8MvN1qhZKHznLWAo8p/Z7athr4uEDnNQo=;
 b=d3umGgH9AA+x9/eUEVLXOfnHDCWicYklCvAXwh6+xS7ZeGC0/JW57kn0
 CA1vPS4tUWenmU4l2IeHNtz/ldN9dqoH/ykKfT5ZJo++8Tc8IfAE4gVRb
 KY5CFoJTocBH9Nu6Mg7e8X/oGERCqSPl3EwWWiffJwZCnC65IVE0def9+
 8zCMgbkVpXuCA/5kho2r/jRk8u3GwH8fklI5mXop2YVRij445tu1y9Ast
 v4G8+UzNXFF9hUNrCas0QK6NOyU8T8gb1JFZC+ERMXS8tyyGhK8weuOqf
 YHmZyurf4O+MV9fE/YbGG80LtkhXQHp7tISPDU2zIWG9sv5Cl/pGkNmOq Q==;
X-CSE-ConnectionGUID: a2g4ghDlRZCX/tvR4GBtKA==
X-CSE-MsgGUID: U5go9mT3QVq/scuY2fincg==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="59810629"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="59810629"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 02:52:40 -0800
X-CSE-ConnectionGUID: g+Tkn2NfR4eRi84gbkLl0Q==
X-CSE-MsgGUID: OBuO7hdXQ4uBd8l7g2dVrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="127191852"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.64])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 02:52:40 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t 0/1] Fix dist building with iga64 codes script
Date: Thu, 12 Dec 2024 11:52:30 +0100
Message-ID: <20241212105231.49481-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.1
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

Currently distro building with meson is failing:
mkdir build
meson setup build
ninja -C build dist

with:
[300/1928] Generating lib/iga64_generated_codes.c with a custom command
FAILED: lib/iga64_generated_codes.c 

build/meson-private/dist-unpack/igt-gpu-tools-1.29/scripts/generate_iga64_codes: line 43: ../lib/iga64_macros.h: No such file or directory
Generating new lib/iga64_generated_codes.c
Generating iga64_code_gpgpu_fill for platform 2
<command-line>: fatal error: ../lib/iga64_macros.h: No such file or directory
compilation terminated.
DIE: cpp error for iga64_assembly_gpgpu_fill.2

Fix the script to find correct path and also bail out gracefully
when it will not be find.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>

Kamil Konieczny (1):
  scripts/generate_iga64_codes: Fix dist build

 scripts/generate_iga64_codes | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

-- 
2.47.1

