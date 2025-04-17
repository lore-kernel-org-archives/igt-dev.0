Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8116C369B2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 15:41:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA2510EB52;
	Thu, 17 Apr 2025 15:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CFUjoFrG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE2910EB52
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 15:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744904465; x=1776440465;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gvka3N2RrVgZibY/sQOAbceOp7J1R7KLCW7XiUUl+JA=;
 b=CFUjoFrG34j043B4zJfvqwk6AFIjWN+X8bMgdMqrz4pfzUz8EopfTeDp
 BwAWh5sSJr+ZGmN/FC9Riavt5V68w+e3IkALiFn9M4o4xiAgJg9Aderjo
 S6WgdQHIg06Mm2SAH2kEwqmos+4OGZ/ltw8OGlxMBC8E83V4ZfK0h+czA
 dTXZIpvG4JDu/tXAzFflxrM0y06jOpaeFDWO7E3vGfbqk1q/vBWTPWU4B
 BX9sg0WjIBtH+ksOuD5uRx0ggUw6h4USXN6H8kVXFbQjKtYgIwdZOugsE
 uXeaX/wMUY4cA6l/G/mUG0VrzgzvDILhGTQ4RrSXgIu7DfEeDYRb6GBxo g==;
X-CSE-ConnectionGUID: ytiw1ccMTwS1Ibv9Fos5Hw==
X-CSE-MsgGUID: YoWqEwUPSnKMsVIW8gcMGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57885232"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="57885232"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 08:41:04 -0700
X-CSE-ConnectionGUID: dZ7mkjmzTnqNlZlKLGlOrA==
X-CSE-MsgGUID: eb4Ca7oaTeeO9zUkGcU7sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="130600839"
Received: from monicael-mobl3 (HELO fdugast-desk.home) ([10.245.246.190])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 08:41:03 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 0/1] lib/intel_compute: Allow the user to override input
 and output addresses
Date: Thu, 17 Apr 2025 17:40:22 +0200
Message-ID: <20250417154049.634497-1-francois.dugast@intel.com>
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

Zbigniew, this is the patch you already reviewed [1] but using
from_user_pointer() to remove build errors seen when building
on some architectures such as armhf [2] and mips [3].

[1] https://patchwork.freedesktop.org/patch/639707/?series=144360&rev=3#comment_1169810
[2] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/jobs/72030908
[3] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/jobs/72030910

Francois Dugast (1):
  lib/intel_compute: Allow the user to override input and output
    addresses

 lib/intel_compute.c | 128 +++++++++++++++++++++++++++++++-------------
 lib/intel_compute.h |   4 ++
 2 files changed, 95 insertions(+), 37 deletions(-)

-- 
2.43.0

