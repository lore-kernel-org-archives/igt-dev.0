Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DF9D149F9
	for <igt-dev@archiver.kernel.org>; Sat, 26 Oct 2024 00:58:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F164110E2CD;
	Sat, 26 Oct 2024 00:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dATvzLF4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DAA510E151
 for <igt-dev@lists.freedesktop.org>; Sat, 26 Oct 2024 00:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729904293; x=1761440293;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TGBwBAdeN+FDiiDCXBSGz7VfYrmCDY+qhqvPcCUQfvc=;
 b=dATvzLF4oXnVypCmXzi9DijltAHm5lzK0wnWno+IcgvATKfznCcwWSRB
 OQpcAfppoNavfgPzzslDkk9677Zd2TT6/tlz/U41/CF7Aj1qL7A13qSXB
 RRGntoJurlS2B0DmA4HF1s0QtXJm4GcMwwrRD3tVa5Y5R8fR6wPh7nD9c
 5X47mjsqQYR0ZHAt80lPK5Dz6ihUx07M+d1T62QwUKIjLf4yH2gSIKtyE
 Qj/zj5432N8GSV5tYnjQ+epG4pQZwi1KR4/7l2mJG4iCUMbFeJ6O8+yDr
 PAz6ikRnY0uhrw0X1SHl194MDKbBmxTQ0LZ1t9xr6PC9axwQW/dfaQ0Lv g==;
X-CSE-ConnectionGUID: V1Lep0FKS7ilBcnSPchs+A==
X-CSE-MsgGUID: pe+hoQDeRpKYSG+MFBEfmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29770394"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29770394"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 17:57:29 -0700
X-CSE-ConnectionGUID: xIpImtU4QHy3m7VK4rCsWw==
X-CSE-MsgGUID: HnaZv6gfSC6KIqyOrs74Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="111885436"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 17:57:27 -0700
From: fei.yang@intel.com
To: igt-dev@lists.freedesktop.org
Cc: Fei Yang <fei.yang@intel.com>
Subject: [i-g-t 0/1] xe_exec_threads: wait for all submissions to complete
Date: Fri, 25 Oct 2024 18:01:01 -0700
Message-Id: <20241026010102.1470944-1-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
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

From: Fei Yang <fei.yang@intel.com>

In test_compute_mode, there is an one second sleep waiting for all
the submissions to complete, but that is not reliable especially
on pre-si platforms where the GPU could be a lot slower. Instead we
should wait for the ufence to make sure the GPU is inactive before
unbinding the BO.

Signed-off-by: Fei Yang <fei.yang@intel.com>

Fei Yang (1):
  tests/intel/xe_exec_threads: wait for all submissions to complete

 tests/intel/xe_exec_threads.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

-- 
2.25.1

