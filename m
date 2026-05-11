Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43FBCD37AC
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 12:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455BA10E6FE;
	Mon, 11 May 2026 12:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dy2vTnEF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CC010E6FE
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 12:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778504206; x=1810040206;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=rAFRUHMKTCjGv7gUgJ7Wjo89KxQpDBe+YWMwueXQlH4=;
 b=Dy2vTnEFU1Xrkl06+S/PQYW8+nHPzcrYmpIEsT5yPBCgYCuie/WFFAHZ
 N9W29qDFRTLoMrJnPu7eX493y5g34BNq9LayspjLNpnkMVbF7h3M2QsCO
 JB/wc7o/Rn7w7SjjiG7cM9fHbgYtsxsdBKPOZhAOy06pwEA19ezFgfZke
 YdZV8kfPwioLTZZxmZ98TgLuySDzQnUC0DkR2103RbFU0fJL66DYFLk8z
 oopYGXRxz2xHhsnNr6865f0pdL2B7XhVjtZWXYhiOcBi81yQfo3KuNhIN
 CcvCHgKmsx08xFetImzyTn14PmF2y7+ihkqb5VVJCiqaZlJBNQw/EC9Ez Q==;
X-CSE-ConnectionGUID: IMNw5mEZTOiRMJIdjnA0Hg==
X-CSE-MsgGUID: 9C1a/ZMZStmozUCgkYh+Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="104847962"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="104847962"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:56:46 -0700
X-CSE-ConnectionGUID: auc5U/cmRnWkeWB40M6LXA==
X-CSE-MsgGUID: oa7RU9vzQHmqapMAC3WSJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="275575365"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:56:44 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v3 0/2] lib/igt_core: add timestamps to error logs
Date: Mon, 11 May 2026 14:55:22 +0200
Message-Id: <20260511-add_timestamps_to_logs-v3-0-041130e1f7ef@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALrRAWoC/3WOQQ7CIBBFr2JYi1LaqrjyHsY0UxgsRkrDYKNpe
 neLbty4fJM/L29ihNEhseNqYhFHRy70C5TrFdMd9FfkzizMpJA7UZWCgzFNch4pgR+oSaG5hyt
 xc6issWaPttJseR4iWvf8iM+XL9OjvaFO2ZYXLRDyNkKvu3x6DJQigt96oIQxLzpHKcTXp20ss
 umbUYv6X8ZY8IJLo2pbKbUEtSfXJ7xvdPAsZ4zyV7P/q5FccFWrApVAATv41czz/AYMhTTANwE
 AAA==
X-Change-ID: 20260430-add_timestamps_to_logs-d84fdfd7ef4c
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, 
 Stuart Summers <stuart.summers@intel.com>, 
 Jari Tahvanainen <jari.tahvanainen@intel.com>, 
 Mateusz Grabski <mateusz.grabski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=rAFRUHMKTCjGv7gUgJ7Wjo89KxQpDBe+YWMwueXQlH4=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBqAdHCYGT78pSIjN+kZtrIRvuyehZtA8M0KcPdb
 o1YPtVdlguJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCagHRwgAKCRAjYrKT3hD9
 1zUMDAC5QWnuuGAUD4qEUKPsAd1oPU24mhhjOCGbveedh0lofHpunCPxcNhbZdKicMg5gnQGo4x
 S6emmxVK97SmruCdGtnrctgWRlkW4vKSdOOYwxqh58aeyzqjuly7rv13ilRK0AkRC0abkdDDOWf
 74UOgwyAk3Kweir0fvzhXbdWoD4yLJxI1wq0bq4c+IaDFg2p/bfcYsJUkvZpAmDZxe/WwjCaifp
 72oumuMCSf0ENc63lKp+zh+Ife+liQaLu9vkDorgKVUptTgM6D/KupsxnsJ116N+E7w95JMru8A
 +IADNFrgO02lShCxNlFM4Mxw7E0jlpKNNer9JeKMuuIHLtSx31YMi+SS1BDFW/7nUJsMX05x4Dn
 NyfzvHSUKO9Yt/RFD/FOCVwshsxiGTd1y6BSFz2+G8IzyD/ANNo3Jm7WfXmNUhTDbSWXFhgjj1H
 /YyYovW8I5eKriYOwESxm3NDuGniLSab2RH4CiUnruFVdJFgB3ZwVYP+uTi4ZKQisSxc0=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

This patchset adds timestamps to error logs in IGT.
One of side effects of adding timestamps is detection by CI of previously
hidden errors in errno handling. Patch preventing such situation has been added.
Since correcting errno handling requires multiple, sometimes subtle, fixes,
this task will be done in separate patchset.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Changes in v3:
- added patch avoid errno resetting in igt_gettime
- dropped errno fixes - they will be handled with separate patchset
- Link to v2: https://patch.msgid.link/20260507-add_timestamps_to_logs-v2-0-9591e90e0a6a@intel.com

Changes in v2:
- added fixes to errno handling
- adjusted format string to be the same as in dmesg
- Link to v1: https://patch.msgid.link/20260505-add_timestamps_to_logs-v1-1-2d95f499fdfb@intel.com

---
Andrzej Hajda (2):
      lib/igt_core: do not reset errno in igt_gettime
      lib/igt_core: add timestamps to error logs

 lib/igt_core.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)
---
base-commit: c186075d9363a80e4a7469aeb64f08714c8dc1e9
change-id: 20260430-add_timestamps_to_logs-d84fdfd7ef4c

Best regards,
--  
Andrzej Hajda <andrzej.hajda@intel.com>

