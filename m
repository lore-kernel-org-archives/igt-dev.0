Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F1CC25B75
	for <igt-dev@archiver.kernel.org>; Mon,  3 Jun 2024 08:01:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C175810E2F7;
	Mon,  3 Jun 2024 08:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GDKQ+YpA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49C010E2F7
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Jun 2024 08:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717401683; x=1748937683;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=zm2xMnchWoPuLcgPBe6rg92St+RWPuUm022Adbxu9/4=;
 b=GDKQ+YpAodxhCMn+T18Za7QjKI8Kb0ejPnUfmVx9ayHhAUlUXh0bKECa
 JGDxdCojInRveUDYJhl7ICMytL17rjffmLW1w85Gef1LPAQ2W3yn24Fnd
 OI/H9q3UVIBqhrGb79o5VblH/0KiCugAaNnnn5qbQDv/EVJdLk0jq/Y21
 uaKZe07gd5bpZ+5DLFvMyDT7jwZT4PokyMoM652TABaMOfh1tONOU0SMR
 /UcGvK92oYp5j7OduHS3LTHbv9FF974bZqXZzcyI1UQwltfQdJPCMcvId
 C2BYjshD3Nt3VXUuBlcv/Rq99BtuMvPoamKTFuaGOeVs8UE4DR/9lpt+e Q==;
X-CSE-ConnectionGUID: ZTRdZDDJQXGhkpKn1Hrhaw==
X-CSE-MsgGUID: 3cSy0fI8QBiu16t0XhKh0g==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="14107411"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="14107411"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 01:01:23 -0700
X-CSE-ConnectionGUID: /HnFELj5SZmhUuLmFHGVIg==
X-CSE-MsgGUID: 8MePmqrhRuWtlcwdfwoX7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="36805767"
Received: from basicluh01.gar.corp.intel.com (HELO localhost.localdomain)
 ([10.223.131.46])
 by fmviesa006.fm.intel.com with ESMTP; 03 Jun 2024 01:01:19 -0700
From: Melanie Lobo <melanie.lobo@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vidya.srinivas@intel.com,
	Melanie Lobo <melanie.lobo@intel.com>
Subject: [PATCH 0/2] Support for RGB16161616_64B compressed formats
Date: Mon,  3 Jun 2024 13:43:38 +0530
Message-Id: <20240603081340.30723-1-melanie.lobo@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231010134540.28485-1-melanie.lobo@intel.com>
References: <20231010134540.28485-1-melanie.lobo@intel.com>
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

Support XRGB16161616_64B and ARGB16161616_64B compressed formats

Melanie Lobo (2):
  lib/intel_aux_pgtable: Library to add support for RGB16161616_64B
    format
  tests/intel/kms_flip_scaled_crc: Add support for RGB16161616_64B
    compressed formats

 lib/intel_aux_pgtable.c           |  5 ++++
 tests/intel/kms_flip_scaled_crc.c | 42 +++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

-- 
2.17.1

