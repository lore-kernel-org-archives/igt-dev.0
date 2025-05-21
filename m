Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6F1C54E71
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 05:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D274D10E10A;
	Wed, 21 May 2025 05:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQr9Bqmr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018B110E056
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 05:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747806035; x=1779342035;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J9sFY5uhHZVwCFi+XWTD+V6vlz8RH7WNYJ/86CNyQ1A=;
 b=AQr9BqmrIZc5cYv9oQMA12xS4fl46+l+tFbQmtjUIjOLUUnsmDWEFKgS
 BJ3TfdNrgZPgx8n3woB00FQgLiKOvU5C0Wfy/rVkij5mfZVjIfIiy5gnm
 qemBriN0UrO8z62+jQH7cF7WS5MUoKAPhWOT0AT2EoBFo1/wf9b7EClhy
 l24ibiSwTcTXVNRzQf05e23dE+03z2Wst9mJ/qXmvFi09BSflIcbfA1em
 28XizdrgABIYR6AUjnhO8eiDLUx5jDf4mNp33GpnBs+LQvaAIiHqLbESc
 MNCdxCQDzeeLnup3sU0zp0Ip4wVUxACKg9PO6YDP4PyJKnx11Uor3/ltH A==;
X-CSE-ConnectionGUID: QnQZQdZKRBigwIr2zHfI2Q==
X-CSE-MsgGUID: J5HPb3boQuif5jzldUYNLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49693906"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49693906"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 22:40:34 -0700
X-CSE-ConnectionGUID: gvqihCtqT5+ihtcvW1kNSA==
X-CSE-MsgGUID: ZVLEiLrXQiiuzuow4vk3Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="139758246"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 22:40:33 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH 0/2] add test to validate dock/undock and switch
Date: Wed, 21 May 2025 11:26:17 +0530
Message-Id: <20250521055619.1961965-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

add test to validate docking/undocking scenarios on TBT Hub
and switching from TBT to DP-ALT mode and vice versa.

Rely on Microsoft USB4 switch 3141 for the same
Below is link to documentation for Microsoft USB4 switch 3141
https://mcci.com/wp-content/uploads/2021/09/950001601a_Model-3141-USB4%E2%84%A2-Switch-User-Manual.pdf

Kunal Joshi (2):
  lib/igt_usb4_switch: add helper library for Microsoft USB4 switch 3141
  tests/intel/kms_usb4_switch: add test to validate dock/undock and
    switch

 lib/igt_usb4_switch.c         | 392 ++++++++++++++++++++++++++++++++++
 lib/igt_usb4_switch.h         |  78 +++++++
 lib/meson.build               |   1 +
 tests/intel/kms_usb4_switch.c | 299 ++++++++++++++++++++++++++
 tests/meson.build             |   1 +
 5 files changed, 771 insertions(+)
 create mode 100644 lib/igt_usb4_switch.c
 create mode 100644 lib/igt_usb4_switch.h
 create mode 100644 tests/intel/kms_usb4_switch.c

-- 
2.25.1

