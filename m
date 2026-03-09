Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B005F3C245
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 12:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3FE10E4DF;
	Mon,  9 Mar 2026 12:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kV1ygkd/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEA610E181
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 12:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773060023; x=1804596023;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XqrnDMWfzdIIuE0+M4ijlbDVfOsZYSxeMM5Wvh9zxgM=;
 b=kV1ygkd/DvxqNdboHGvZFK0ccJFRwM+KWnfyo6e8Z62dlJBURPGFwfal
 BI8WgpFj6hovMmntpJv6k1Mh+2Gam1tQUgUEDrFLo++nHe2wljEsJ4l0B
 6ns9oye+ZqUEExWospTRjuCnZJLUzV6ytU34sx5rv9bcTYya3WuzJz3Rf
 hjo9XjWJYisjIQZkwJ5FznJE5R9zs9OWH3gMW53OykWuaAL4/UAEKDkhj
 Xj8H/DdcXriVL+s8tKJvB0XJ62JCFFSYcxAoTSd2rtbNmmyvS8B3cbW8W
 /6g+VihVGRw8FRkm2Mje4lwcY8QjK8ISfOMTWpCLw+FtZZrgt49AOGnvc g==;
X-CSE-ConnectionGUID: S0ZORyQCSoGS4szl+oaiKA==
X-CSE-MsgGUID: dsm5DiNGRs6j5zII97X9+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84790789"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="84790789"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 05:40:23 -0700
X-CSE-ConnectionGUID: 2l1l2LLsTqCyAqBjDZI+tA==
X-CSE-MsgGUID: pNrjxAkUT7y1/84pxVcQSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="219866200"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 05:40:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 0/3] lib/kms: fix a CRTC index and pipe mask mixup
Date: Mon,  9 Mar 2026 14:40:11 +0200
Message-ID: <cover.1773059939.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Clean up __igt_pipe_populate_outputs() to use CRTC indexes where
possible, and fix a CRTC index vs. pipe mask confusion.

Jani Nikula (3):
  igt/kms: add some braces for clarity in __igt_pipe_populate_outputs()
  lib/kms: use for_each_crtc() in __igt_pipe_populate_outputs()
  lib/kms: avoid mixing CRTC index and pipe masks in
    __igt_pipe_populate_outputs()

 lib/igt_kms.c | 39 +++++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 18 deletions(-)

-- 
2.47.3

