Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A444FD35144
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 07:29:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F63610E2DA;
	Wed,  1 Apr 2026 07:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iMtGJiuu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D79510EC61
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 07:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775028579; x=1806564579;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qKPHFYSSYlKEGa2Z7D/UJASqQxaVszQDPkt+CYfERuA=;
 b=iMtGJiuunytSKlm7JVCxGkxAe39Oq40OljT9ieuCGhhO7U3pX5RXkuUR
 m12CaDEFVg0VpWcV7KyoCGZeaSZUPhWJwu1NzhsfvP64hyNIijGNXX3UV
 26QmNj0bnbiqJI1FzJbDYZC837gD7wiSwEw57CwzxhMZpljxV6N/88T44
 UHWNVVyHlVVB/ngxUBLWbR3F7PXbhjSkOOpwgPbMSxGkdkbbf62Jlapw1
 3uoJlVppklssFShNqFQxvyKutB/6401LmdUwqOTLgHZIbVwY+R8bRk2Rx
 kXhzXhwHMQtB7VzRqysMSouSIvW4CEd9W3gL3Vtzz3L7lrq2tvltR3HM0 w==;
X-CSE-ConnectionGUID: V0TEfIXUShqMvoYClbpaRw==
X-CSE-MsgGUID: 2iQf6ovLSUCWIIoAaeS1aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75230255"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="75230255"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 00:29:38 -0700
X-CSE-ConnectionGUID: TTaet50sQHaeIcqMXI//hw==
X-CSE-MsgGUID: jSmLUmSiQPi/oiF3ohTiyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="225593262"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 00:29:37 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v1 0/2] tests/kms_hdmi_inject: Add low refresh rate subtests
Date: Wed,  1 Apr 2026 12:56:13 +0530
Message-ID: <20260401072615.3456135-1-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
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

This series adds two subtests to validate low refresh rate (11Hz, 10Hz,
5Hz, 4Hz) mode handling on HDMI connectors. The tests verify driver
behavior around the hardware minimum pixel clock threshold (34.38 MHz).

Patch 1 adds a positive test that validates low refresh rates are
achievable when pixel clock is maintained at the hardware minimum by
adjusting vtotal.

Patch 2 adds a negative test that validates the driver correctly rejects
modes when the standard pixel clock calculation drops below the hardware
minimum.

Together these tests ensure the driver properly enforces hardware
constraints while still supporting valid low refresh rate configurations.

Mohammed Bilal (2):
  tests/kms_hdmi_inject: Add inject-low-refresh-fixed-clock subtest
  tests/kms_hdmi_inject: Add inject-low-refresh-default-clock subtest

 tests/kms_hdmi_inject.c | 295 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 295 insertions(+)

-- 
2.48.1

