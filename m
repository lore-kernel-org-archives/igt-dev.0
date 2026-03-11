Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB89FD88F4
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 04:59:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5FD10E314;
	Wed, 11 Mar 2026 04:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FuqrFWQC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC0C10E314
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 04:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773205179; x=1804741179;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xIJeEUCRTJONDieux4XbCEUzSFVOIedR6urc/21KHms=;
 b=FuqrFWQC1/X/FAa9vRTcb8SqSDSZ78rFcTgmhp5tdEz2/VgVt/FYKXuv
 hGQ74J2maDM0Io4408tmZ3ltvlCcQsueWnKlL5zhj+uywYkYwkgiQc1j8
 anok/NB9DK2m84tK+X10dUX/FoLgMly+Kr8lLfanKlTVfgzhrIX997G6S
 BVtGWe8Pm2ziwy/AGbT39zgEK+zXPsk98fby/1coYAR4Sa0IPXWFUSzUp
 m8alelWEqCF9PaLSGEVhAfC6toagt9YkgPlY5vpn6vp26iuBl8Ntbf4dZ
 nqwb+9ekjRY9ayIi7czEHakSfMREUo18qZt9EiDpW76Y8aDJNWlxVhpOq w==;
X-CSE-ConnectionGUID: LE/Gn/2YQt2NXGS7MB/7Fg==
X-CSE-MsgGUID: AisH111FSPmkxlyRMMhR3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="73287498"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="73287498"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 21:59:38 -0700
X-CSE-ConnectionGUID: Y8/cL8xzR4CmNfS0AH+TJA==
X-CSE-MsgGUID: EjETogG6SjSNn9uziOXo/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="219470177"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by orviesa006.jf.intel.com with ESMTP; 10 Mar 2026 21:59:37 -0700
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 0/2] Validate compute walker interrupt notification
Date: Wed, 11 Mar 2026 10:29:32 +0530
Message-ID: <20260311045931.2950741-4-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310051840.2885701-4-priyanka.dandamudi@intel.com>
References: <20260310051840.2885701-4-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add test to validate compute walker notification and update libs related
to compute walker for post sync.

v2: Resending it as dependent lib changes got merged.


Priyanka Dandamudi (2):
  lib/gpu_cmds: Add support for compute walker interrupt
  tests/intel/xe_non_msix: Test compute walker interrupt on non msix

 lib/gpgpu_shader.c        |   4 +-
 lib/gpgpu_shader.h        |   2 +
 lib/gpu_cmds.c            |  15 +-
 lib/gpu_cmds.h            |   9 +-
 tests/intel/xe_non_msix.c | 301 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 6 files changed, 326 insertions(+), 6 deletions(-)
 create mode 100644 tests/intel/xe_non_msix.c

-- 
2.43.0

