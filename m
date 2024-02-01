Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050BBC4828C
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 00:47:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE4910FE03;
	Thu,  1 Feb 2024 00:47:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A86010FDFF
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 00:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706748464; x=1738284464;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z7Wxpnu5wUViAty1lbUKgMwg8JC0hmbPsOJxdiVYfQs=;
 b=GOKtoqoLAphyo+DfXZzPDU7z2/POtMdEktQ6C1S7rVycH3hqupOmOtQ2
 Bp+HgS4XeTHs3b/8TS46hKlvxCvmPHisZ2ZXN2jVF4lQsSmHKOwuHE2ha
 HIlqc8FuatZ7Dp3zXaH2PnRSxrKxO4fRComxpQmtNkjf+GTKt/zMXWs1T
 tjX9tchz8ikBwaz5LoRZstRaJGcldhGiHg6et2dX66d6+QsBsQJBV2vCT
 MMwvAP8ER6fCS1aZmtSBOY7mT1h5xl0eHVh4Y4b3t0JMlZjk+DfyZpFNH
 oy1jKgwP1K5p4HoHWZ1dP+I18/t8x0EEtBw8pqKmFjEG9CGFmFbQFoScR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3635847"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="3635847"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 16:47:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="1119789340"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="1119789340"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 16:47:37 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/2] fdinfo: drive-by changes
Date: Wed, 31 Jan 2024 16:46:23 -0800
Message-ID: <20240201004744.352041-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

While understanding the interface, I thought of a few changes to make it
easier to understand. Shouldn't change anything.

Lucas De Marchi (2):
  lib/igt_drm_fdinfo: Use longest match first
  lib/igt_drm_fdinfo: Mandatory drm-fields first

 lib/igt_drm_fdinfo.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

-- 
2.43.0

