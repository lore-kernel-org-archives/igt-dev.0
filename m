Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6D2C3064D
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 06:31:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA24D10E781;
	Wed, 26 Jun 2024 06:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OTez268n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2504710E086
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jun 2024 06:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719383472; x=1750919472;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TtEuEik3bUBG5zC00vx6udaiLXh+uw9vJhcRNVkwhE0=;
 b=OTez268nGhYo/b2PqDIolGuBHojpVfDgvU9dBz7RZFft0awIBmEuuIrd
 f0EtB8/CIkVAWjKax8KPt911CS5Xkcrkm7GIlbBocBhNt6aTTlNMYcusM
 7+VAvKd2LiX/FdAAYL8Lx0eKIt+WN3aEfPwhJa1jK5MB+6QLi3yZt9si0
 N8DZgxo7g+yecyKgPn/Iphc8riItVhK3AKdZudqLXfGkelK3+Ik671UBl
 4uKxrgDd4e9hI7ngEVPu9Ufb3tddyVFwJ9Mdx7PXKuwRgGSF7nK5oI4MH
 lfelrQ+EKOnq7XIO1zRuGb5WPgHnt/9KO4n4siQrxsfA2K3b0ekxt0oRl g==;
X-CSE-ConnectionGUID: 6RxBgIjiSfyWt8Emgq6hVw==
X-CSE-MsgGUID: BF+jC+KjSzC1Klt5sPwWnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16582998"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="16582998"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 23:31:11 -0700
X-CSE-ConnectionGUID: 7yQv9azCTbStXHUQrcu1MA==
X-CSE-MsgGUID: a/7QvOXVRtCIKvjXRVtRqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="43768214"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.70])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 23:31:10 -0700
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 0/2] lib/gpu_cmds: Fix hardcoded buffer size
Date: Wed, 26 Jun 2024 08:30:16 +0200
Message-Id: <20240626063018.2931-1-dominik.karol.piatkowski@intel.com>
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

This series enables buffers larger than one page to be successfully
submitted, allowing for large shader execution.
Based on the find by Dominik Grzegorzek.

v2: added ALIGN(), added typo fix in separate commit
v3: resubmit due to PW build failure

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Dominik Karol Piatkowski (2):
  lib/gpu_cmds: Fix hardcoded buffer size
  lib/gpu_cmds: Typo fix

 lib/gpu_cmds.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

-- 
2.34.1

