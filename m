Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6C5E6BF0C
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 13:07:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F083410E9DE;
	Fri, 30 Jan 2026 13:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oGHafHix";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680EF10E9DE
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 13:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769778420; x=1801314420;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qtiLY3/HkOdSRt+5cx1ljYo+Aoyz0hNmeyvvHxDmkHM=;
 b=oGHafHixitolsgFz4RZsgbpDgj1tMLi+QPgUZBkMzhyUMTPiZAZ0rgqW
 GmRAlrY8zzYMtiRVggHbzsEtxjbmP8uwSqqUA+xXnoU6j7uFaG+6/vXmR
 nEx87frYnfNt2BSpCRGXUNdtlRj1Z9nSBJryLe/uhzIlxQdwhz3Fvq0ok
 VtyFwmmRZ7iPUHMCsXdBgK7rVAIZcKLyqdA2FyDh7et32jvvMCDDYqck/
 Fu8o8umbhXU9PR2wq76Vpcd8RIJU19bthcMNhhSunqn1mxBhLuyQzuY8a
 aXb30v7LUeVP+HQCGdMAfw28bzJUlV/4Yii8F2+tRZBDw9jFNCPxc/qEq w==;
X-CSE-ConnectionGUID: pPPmmC5pTmO8ehrLEf8/9g==
X-CSE-MsgGUID: OIuj8dmgSnWPyYr5NXkT5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71115127"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="71115127"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 05:07:00 -0800
X-CSE-ConnectionGUID: Fl5+PMa6RjmQsBuKkSgbBQ==
X-CSE-MsgGUID: e1feAj4MTwW775HHFMs2OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="246473473"
Received: from jsokolow-alderlakeclientplatform.igk.intel.com ([172.28.176.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 05:06:58 -0800
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 Jan Sokolowski <jan.sokolowski@gmail.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 0/1] RFC: Bash autocompletion feature for igt
Date: Fri, 30 Jan 2026 14:11:21 +0100
Message-ID: <20260130131122.5655-1-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.43.0
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

  This is a RFC for a feature that I've found to be useful not only
for me, but according to the rest of my team, to be of use to other
igt developers and users, that is, bash autocompletion feature.

This RFC currently only has an incomplete support for igt tests,
and supports following suggestions: --*, --run-subtest *, --device *.

Before I'll continue with the work, I'd like to ask what are your
opinions on this feature? Which tools other than tests could benefit
from having autocompletion added? 

Signed-off-by: Jan Sokolowski <jan.sokolowski@gmail.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>


Jan Sokolowski (1):
  RFC /scripts/bash-autocomplete: Create bash autocompletion scripts for
    tests

 meson.sh                                      |  6 ++
 .../install_completions.sh                    | 85 +++++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100755 scripts/bash_autocompletion/install_completions.sh

-- 
2.43.0

