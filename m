Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5540BC5321D
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 23:29:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2E910E51B;
	Tue, 20 Aug 2024 23:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nFe39bMW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2444410E4E6
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 23:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724196582; x=1755732582;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xkuajq/XKq+XNzr76of6CVqIYavWOW2RD2uzacbIjSY=;
 b=nFe39bMWq0A7Jg8K0wrJoB6akf9KrxjRAgrCN/vhQo1Aq/ERgRrjr/vk
 +e0NC8oGNWN/wU0NJynBAHcGAHk1B78iGyrZBG+pi9tACQbqYJcBVH1oX
 ejqz7Vl1uNRqr0XpFnbfiQdkag0sECGL4/YM98+YOb0TX/VWVn1YDY/M7
 9HhEq2tMcyTXYUoTYRNhZqUhs/LUNORGwaBq/+katN4IZVIiYOkjL9Lmi
 CK3ENSK+qA4nTa9jn0KV4jDBQREN0DovPwvYML48P2RskzbftDAjHwSeF
 ISo7EQ8JC98AHl7+uyFTRZ9k7ZtYe1G0f+tfuyjwYjOLI0SzdJeNceeB/ A==;
X-CSE-ConnectionGUID: zY289rvWR9mBoLbjnDR0xQ==
X-CSE-MsgGUID: uM8hlZdTQg6n8WSmMsAZtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22339742"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; d="scan'208";a="22339742"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 16:29:41 -0700
X-CSE-ConnectionGUID: FNfNMuZrQsKglAbUknZqFQ==
X-CSE-MsgGUID: 4xCbkOLzRxmbWufyk4p+HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; d="scan'208";a="60599560"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 16:29:42 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 0/6] Parse GSC-based HuC firmware layout
Date: Tue, 20 Aug 2024 16:29:22 -0700
Message-ID: <20240820232928.458248-1-lucas.demarchi@intel.com>
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

We previously assumed the manifest entry would be in a fixed position in
the file, which is not correct. This fixes the version reported for
LNL's HuC firmware. It also prepares it to be able to parse GSC's
headers, but there's still some code missing.

v2: Fix coding style and warnings according to black, pylint, flake8

Lucas De Marchi (6):
  tools/intel-gfx-fw-info: Re-format with black
  tools/intel-gfx-fw-info: Annotate abstract method
  tools/intel-gfx-fw-info: Embed fw decoding
  tools/intel-gfx-fw-info: Override kernel types
  tools/intel-gfx-fw-info: Add proper HuC parser
  tools/intel-gfx-fw-info: do not use bare 'except'

 tools/intel-gfx-fw-info | 205 ++++++++++++++++++++++++++++++----------
 1 file changed, 155 insertions(+), 50 deletions(-)

-- 
2.43.0

