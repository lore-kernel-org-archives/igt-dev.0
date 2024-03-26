Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F389EC6FD1F
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 14:13:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE5E10E5F7;
	Tue, 26 Mar 2024 14:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RH8f1/KT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436AA10E5F7
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 14:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711462438; x=1742998438;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TbFnRPHka+KwDDKxx4DluaBmlHRg3azKs+6XhhNGGSY=;
 b=RH8f1/KTo0yjsYnm+ofJe6pSrNCKLly3KxNw452Dz5alZ+FZPwl5HUva
 JxdrSAjzjp+hLlRanI4r/ue9ktv7y4YgwPr2aByMYduE4GPco4rWiZOu6
 j8d74Wf98QTw7Q0Ffkt+e1JhZf4nY5/45gwkplINXGCWxyEQ5UqSz5VV8
 qa+X/r0C4fY/+WgMVNxTdhQSFDUI9z0yFeR37dZtQxq9HiYb4ddNYfXNo
 kNeK+QWq5QMFdlVxEoY9HEDnIb0JDzSAW19qrgBaDRep47FCafO+b7q5z
 uu/QP5kS/dyRwKnBHd4UFODp9MJ2TY9puzkWKuad3s2C5TL/o7APW+6vl g==;
X-CSE-ConnectionGUID: M1kR+b11QreYKncjbiXqzw==
X-CSE-MsgGUID: qXDiGmkkTFyuwrOBJouP9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17147225"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="17147225"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 07:13:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="53437588"
Received: from unknown (HELO localhost.localdomain) ([10.190.238.8])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 07:13:56 -0700
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
 Vandita Kulkarni <vandita.kulkarni@intel.com>
Subject: [v4 0/3] Add support to paint already mmaped buffer
Date: Tue, 26 Mar 2024 19:44:19 +0530
Message-ID: <20240326141422.13993-1-vandita.kulkarni@intel.com>
X-Mailer: git-send-email 2.43.2
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

On some of the platforms first write after mmap takes longer time,
hence provide and option to just update the fb incase we are resuing
the mmaped fb.

v2: merge patches 1 and 3 from v1 to patch 1, and fix review comments
v3: Fixed assert on cpu and gtt draw methods
v4: Fix cases of render draw method

Vandita Kulkarni (3):
  lib/igt_draw: Dont mmap, if the buffer is already mmapped
  lib/igt_draw: Sanitize the buffer data in the beginning
  tests/kms_async_flips: Reuse the already mmapped buffer

 lib/igt_draw.c                         | 64 ++++++++++++++++----------
 lib/igt_draw.h                         |  2 +-
 tests/intel/kms_frontbuffer_tracking.c |  2 +-
 tests/kms_async_flips.c                | 16 +++++--
 4 files changed, 54 insertions(+), 30 deletions(-)

-- 
2.43.2

