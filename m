Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353FBC6FD1F
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 18:16:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA7B10EF47;
	Tue, 26 Mar 2024 18:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SwHM4/Qo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDEA10EF3E
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 18:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711476992; x=1743012992;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Cl+90Gj13qmnAyLOxHkRdNzxN/sJ6T1PDzAOJk0ekNU=;
 b=SwHM4/Qo+g79xOd/I26MBee5n7KO4ontCk8dQVwmwUEpjgb/a33AjDDM
 9S763RNnGK1BYlRfpzn2wSr5zj2E/MbvxMD0wD+aOkKDFetH7zaT4CgbF
 6FvXs1rLansJv9EmcL6+dNTNNy4VfSPA1NgwhQzpOD+53wC/HROtflual
 FwwCKLXWWwYKtk7jpnDKar6GPAg6CdEZyAR8NITAfT0qjAejJugIiy/+R
 2z6DgVi23V4rBhEEqh6bUyxDXy9kQjpdF0sZxcYBlQ/p6yTWG59Ocuknr
 2Ul9fz9QOT55VCuP+K/yduLPc2nllR9B4bL9pal4RMLT9EzjdwUVQ/MJt A==;
X-CSE-ConnectionGUID: tDQSNQTcQ025g5wfw60t+w==
X-CSE-MsgGUID: M2gbVaZbQAC7wWlAzTgTZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17179462"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="17179462"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 11:16:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="20761731"
Received: from jrandhaw-desk.jf.intel.com ([10.24.12.119])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 11:16:30 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, matthew.auld@intel.com,
 kamil.konieczny@linux.intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH i-g-t,
 v2] tests/intel/xe_vm: Fix WB caching PAT index for coherency mode
Date: Tue, 26 Mar 2024 11:16:27 -0700
Message-Id: <20240326181628.130143-1-jagmeet.randhawa@intel.com>
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

Addressing Matt Aulds comments: I have updated the description.

Addressing Kamils comments: I have removed the VLK number.

Jagmeet Randhawa (1):
  Fix WB caching PAT index for coherency mode

 tests/intel/xe_vm.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.25.1

