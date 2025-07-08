Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F61AC8303C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 22:04:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2E410E1D5;
	Tue,  8 Jul 2025 22:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8NVPyzC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A09E10E1D5
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 22:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752012291; x=1783548291;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a5hyvXXJHFtZtLjZZDuVqlxQw3fmoXx5ClCQ/GqdlMA=;
 b=G8NVPyzC5pC8/+b5H98+em0qlKqZ/+YiNwGCqkNiv7PEl1Z2BZ/adw4e
 KZbzOkaGTNeCT8yxObm3KcJU63i0JVBwuAvJfx8A8ZiDPkXeMTDDzjwz4
 cgLCG/sRb2QeK6LvNEkZhNxkHq9By8DPBwcKWiZulBTVBu5KK1aP2CfkE
 U5E6sFoQNmz9jp9ONa9Fc3AF3jo+zQdVAok7D90pzMpcuhVM1gzdML7Z4
 ITzJaOv9PEzCh/i4JtiioE3T5ovkTDIU8Rl3eDVBpalIjz1oH+Giqfmi7
 AOQswsUH7/0ZIECCrzpy5/DQYnruWci+pVrekbMs7D2JdPLCRBWxnYCTX A==;
X-CSE-ConnectionGUID: Q6zHd9QlQpCpntUFAUBfRA==
X-CSE-MsgGUID: iF7/2LlRQ7yNige5tx+4mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="64848994"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="64848994"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 15:04:50 -0700
X-CSE-ConnectionGUID: gEuNGDIATmmB2GY0yVeHsQ==
X-CSE-MsgGUID: vBLqFWIfR52o5c3XR82TAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="159920390"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 15:04:48 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, mitulkumar.ajitkumar.golani@intel.com,
 karthik.b.s@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 0/2] tests/kms_vrr: Improve test flow and apply
 cmdline refresh rate
Date: Wed,  9 Jul 2025 03:35:00 +0530
Message-ID: <20250708220502.803610-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

These changes enhance test reliability and allow better control
over refresh rate behavior across connected outputs.

Naladala Ramanaidu (2):
  tests/kms_vrr: Improve VRR test robustness with cleanup before
    assertions
  tests/kms_vrr: Refactor VRR test to use global refresh rate from
    cmdline

 tests/kms_vrr.c | 168 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 111 insertions(+), 57 deletions(-)

-- 
2.43.0

