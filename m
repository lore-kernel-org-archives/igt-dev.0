Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2221C67861
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 10:15:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F939112407;
	Fri,  5 Apr 2024 10:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b6nOUhrs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FC5113AB7
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 10:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712312131; x=1743848131;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=BeZXg0rLzka2xUYlKegcaeQp0r7fPj+CEsngsBLvRRk=;
 b=b6nOUhrsRXkB1vcgIn7k/PW+Q2Dv/HsL8rSnCFObCVjPaUgquheKShh9
 YFmfzhZYSa/4Wyt2c5RSqapJzcq4Uzqq1kYOg5Sm6NcwOp6dZJlXOqVCe
 9+WmLE6afzCsX53Ch4/h02rOihwegf/dSrpRt3mAwv48VY8Go1C2eFsU/
 gw2HRrdOW2zU4x+MUYgBSywwWsj9K2b2Ca1oJXzUYucuKlnpIbawZKLrH
 Y+/2OtPc6noW0S/QVnhJHe3iT8UVVmxfz7V/8WoP0oV+1aKw0sH4/VTGj
 Th2hz6tMMH6s6A/tifXwhwxvVYWJohig6a8BXFb0IpAuxD9JRrs7eilYu g==;
X-CSE-ConnectionGUID: ITQAXxBDT0WVVxVwnBHBww==
X-CSE-MsgGUID: tKdg0V42RYGwNIy4Jvwvyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25141718"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="25141718"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 03:15:31 -0700
X-CSE-ConnectionGUID: 20+dCVlTRoudHQpiFpm97Q==
X-CSE-MsgGUID: H5XKRxNST0SL9TyRbb7ong==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="18984772"
Received: from basicluh01.gar.corp.intel.com (HELO localhost.localdomain)
 ([10.223.131.46])
 by orviesa010.jf.intel.com with ESMTP; 05 Apr 2024 03:15:28 -0700
From: Melanie Lobo <melanie.lobo@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com, vidya.srinivas@intel.com,
 swati2.sharma@intel.com, bhanuprakash.modem@intel.com,
 Melanie Lobo <melanie.lobo@intel.com>
Subject: [PATCH 0/2] Support for FP16 format in MTL
Date: Fri,  5 Apr 2024 15:56:20 +0530
Message-Id: <20240405102622.11666-1-melanie.lobo@intel.com>
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

This series adds the support to test FP16 format.

Melanie Lobo (2):
  lib/intel_aux_pgtable: Library to add support for FP16 compressed
    formats
  tests/intel/kms_flip_scaled_crc: Add support for FP16 compressed
    formats

 lib/intel_aux_pgtable.c           |  5 +++++
 tests/intel/kms_flip_scaled_crc.c | 20 ++++++++++++++++++++
 2 files changed, 25 insertions(+)

-- 
2.17.1

