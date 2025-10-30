Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483D6CCF9E3
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 15:38:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2FA310E9F7;
	Thu, 30 Oct 2025 15:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nBzanBj6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA73210E9F7
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 15:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761838713; x=1793374713;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FCD2+Gn+jQuhSF/KWgH7XzQm09N4+2tvjQBVcBTyL8o=;
 b=nBzanBj6gO3BveiyZsRTk5WlfL/sW4Sr6nOm5SqMYyO0Bvao1e3Co0BW
 NWyJsSKVvZ9jHiQRwF7I+nG3rUnKqjOGxauDYmGSdHCgHxWvT6eN5WO49
 9Q90pmV6Prnp0cgsAJX1ujZwdNFenZFQhT7/C+Lm9psDDmLSslNfRPg1L
 1X7t9W9VAaAFdwAExa+o2tMZy58vhwStKbRBbnwDfqvq/keMbTzuQ9gp4
 Sssc5ebcrrOaCHsOe3Npsx4Pz99PGro8r431DDc4AM5KdoiZWM1I25K0P
 4wJHqt4CeKjiY3mF5EN+Lv7H2P96uww0NDKji3J0bHbnqrLyJ0I3mrsvQ A==;
X-CSE-ConnectionGUID: McH6ehMaS3SXghw7dxh1fA==
X-CSE-MsgGUID: zWDgUa+pSY2RwEA4HU7ajQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="67845620"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="67845620"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:38:32 -0700
X-CSE-ConnectionGUID: GmbKVGegR3So1LBKAyTojg==
X-CSE-MsgGUID: xb1hYdfeRauuA7S2+cWLvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185190410"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa006.jf.intel.com with ESMTP; 30 Oct 2025 08:38:31 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v2 0/3] tools/intel_gpu_frequency: Add multi-GT support
 and Xe driver compatibility
Date: Thu, 30 Oct 2025 20:54:02 +0530
Message-Id: <20251030152405.3422044-1-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This patch enhances intel_gpu_frequency to support Intel GPUs with
multiple Graphics Technology (GT) units and adds compatibility with
both i915 and Xe drivers.

Key improvements:
- Add runtime GT detection using igt_sysfs_get_num_gt()
  and xe_number_gt()
- Auto-detect driver type (i915 vs Xe) using is_xe_device()
- New --gt/-t option to specify target GT (defaults to GT0)
- New --list-gts/-l option to display available GTs
- Driver-agnostic frequency management with unified interface

Driver-specific implementations:
- Frequency name mapping for Xe (RP1→rpe, RP0→rp0, RPn→rpn for Xe)

Usage examples:
  intel_gpu_frequency --get --gt 1     # Get GT1 frequencies
  intel_gpu_frequency --set 400 --gt 0 # Set GT0 frequency
  intel_gpu_frequency --list-gts       # List available GTs

The tool now auto-detects i915 / Xe drivers and uses appropriate
interfaces

S Sebinraj (3):
  tools/intel_gpu_frequency: Add proper checks as R/W not supported
    simaltaneously
  tools/intel_gpu_frequency: Add multi-GT support
  tools/intel_gpu_frequency: Add Xe driver support

 tools/intel_gpu_frequency.c | 325 ++++++++++++++++++++++++++++--------
 1 file changed, 253 insertions(+), 72 deletions(-)

-- 
2.43.0

