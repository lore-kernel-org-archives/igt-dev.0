Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01B3C52D7C
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 13:24:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43EB310E34D;
	Tue, 13 Aug 2024 13:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C1yVfSvz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4AED10E349
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 13:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723555497; x=1755091497;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DyhpneWSd83TByNVX1AMxgG8Uf2qTyoYmQP+UfggQGI=;
 b=C1yVfSvzrZm/FBTIuCWN/HndAt0KgNVOO3+Ojqzer75iEeowQgavWTSl
 FkAWlMJ1ppLbds81dXqcZ0ESn2sMQuwZvUUxBjxBS4n4jDu1oxWNDASW9
 VnxWhVlRde3Sqr9/tIUnaziENSIxdMUuA0Kh7YiJxXd8a8nwJB/QrwWhV
 rV7MDJu0mWId6wXGFE2J/UKYSIltwa8vLaW17pryyptBHdbd1VN1M/u3u
 cc2XSrzU28Wq3ra+Do73Lyz4G+5+ILacIyNBpXIX+NDB8JCbZhRi26B7/
 /r46KYFI+AWGCqjParJ9MYecNq7hrKI/uoe5JNiT8Hh8vMOlsYHejUODo Q==;
X-CSE-ConnectionGUID: NCXXADBLQAud9ugzD3UQUQ==
X-CSE-MsgGUID: QDZgfnoOQnO2viJ5KLc49w==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21579257"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="21579257"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 06:24:57 -0700
X-CSE-ConnectionGUID: X4CTKRuaSrKPuwezKEGSjw==
X-CSE-MsgGUID: Ovz3w/o3QumLMlqx3spl4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="63515032"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 06:24:56 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t 0/2] Clear all KMS properties on reset
Date: Tue, 13 Aug 2024 18:45:18 +0530
Message-ID: <20240813131520.2715442-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

Just to sanitize all properties we should clear all
KMS (connector/crtc/plane) properties on reset.

Bhanuprakash Modem (2):
  lib/igt_kms: Clear all pipe properties on reset
  lib/igt_kms: Clear all connector properties on reset

 lib/igt_kms.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

-- 
2.43.2

