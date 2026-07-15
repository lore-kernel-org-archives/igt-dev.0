Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6948C4450A
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 04:19:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED9010E125;
	Wed, 15 Jul 2026 04:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cMR3emPp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D54610E125
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 04:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784089163; x=1815625163;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IayhZ2zOzmRMPeQUemt8iMxqd8lQWBmyeruLhyEXs7A=;
 b=cMR3emPpv45D6o+u5uFzJL+xPDKxr30c/YWxJLFOfN61MWh8h61Ri6gD
 fj6jTxh7rx69pBYwTH7WP2/q0QHmyEu/bjH4YGVgXBljea3oh4NCljDky
 hz0KhJ//jkYd3qYqORtJoLNmy3D0dY4FndQmFn3IiW3zbGI+h9ho1Eyar
 tyP9duLxoe/gSsmnXWXMQrzMo8BNA8o7c6hj/VtAx1o8TnQzIiK/JbbSv
 6ANz60vIVkvWNRGsIvyk/TSYTqTCNM9RXXJZKG3/y43RJ/NC12mM0ZwL0
 gLvh/LbqAGarM/TlcDIQ0KzgR+BA8V7/soG1/6CgOTJvcyecfOlrpHiqG w==;
X-CSE-ConnectionGUID: TmvgAjc9QJGbAqGKppkoMA==
X-CSE-MsgGUID: rnjFZxrcTHihr2PFVRq9Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84807135"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="84807135"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 21:19:22 -0700
X-CSE-ConnectionGUID: encYYujTQNO/ADAcKIYZdQ==
X-CSE-MsgGUID: txMCceqtQNq/5t11XF6WkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="256692228"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 21:19:21 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v2 0/2] Enable multi-format testing for chamelium color
 tests
Date: Wed, 15 Jul 2026 10:02:24 +0530
Message-ID: <20260715043226.169521-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.53.0
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

This series adds multi-format coverage to kms_chamelium_color 
pipe color tests.

To ensure deterministic behavior across YUV formats, the first patch
updates framebuffer creation to explicitly specify YCbCr encoding/range
instead of relying on implicit defaults.

The second patch extends gamma, degamma, and CTM tests to run across
multiple pixel formats at the dynamic subtest level. This adds coverage
for format-dependent color pipeline behavior.

Pranay Samala (2):
  tests/chamelium/kms_chamelium_color: Prepare FB creation for explicit
    YUV color range handling
  tests/chamelium/kms_chamelium_color: Add multi-format coverage for
    pipe color tests

 tests/chamelium/kms_chamelium_color.c | 240 +++++++++++++++-----------
 1 file changed, 139 insertions(+), 101 deletions(-)

-- 
2.53.0

