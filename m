Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C36CC6B0E
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 15:17:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33BA10E909;
	Tue, 13 Oct 2026 15:17:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADF010E922
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 15:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791904610; x=1823440610;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YffNWlcCZfNG8uM/OlM+pBXU+gPid2Y3iQ8UJP6mLiQ=;
 b=fGYRuARz5x5WjZLTQf83LCP3D/3hqA1egJyzYiBiLhAaAVRrF2kZvan+
 PhO2XU1JhT2pGv3wlfW7adHU9klWdQSDeGQqPWfjhwqBlnJIvsVmuPxda
 7ytnxu2sU8n4OUsaq6SlSe09Vj+qr3ZaKZFGjVHGBIYs0uz4jqnJlJD60
 vDYE8TopBlNrr8FU9rE9/slOMiqWscjUE8PWJY6ESuJwU1Wp/sNS5djmP
 /w9c2xZeqNOuzsKzgwpjT7aH9fVPGVff7RTTAJDNqib1iLGjTBpXa+IZ8
 zimt8uZSeI9sUhPct42Qufm7x0OL19QrLmF30Nea0WIOswFlAIKDRbFYE A==;
X-CSE-ConnectionGUID: GthhnfVRTZqVITy3y8SkNA==
X-CSE-MsgGUID: C0gLKla6TW2sgh+2D6YYnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="626584"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="626584"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 08:16:50 -0700
X-CSE-ConnectionGUID: YC+TdSkhQbaCvQijTF1w2Q==
X-CSE-MsgGUID: 651TzTltR0KKO1V/dtUzEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1078097"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.145])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 08:16:49 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 0/2] Fix missing const in lib and runner on Ubuntu 26
Date: Tue, 13 Oct 2026 17:16:42 +0200
Message-ID: <20261013151644.174387-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
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

When compiling igt on Ubuntu 26.04 LTS there are still two warns
about dropped const qualifiers, so lets fix them.

Kamil Konieczny (2):
  lib/igt_chamelium_stream: Fix warn about discarded const
  runner/resultgen: Fix warn about discarded const

 lib/igt_chamelium_stream.c | 2 +-
 runner/resultgen.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.55.0

