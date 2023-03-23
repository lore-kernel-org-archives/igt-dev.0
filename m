Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB6410E494
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 16:29:49 +0000 (UTC)
Received: from linux.intel.com (unknown [10.252.27.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 670D7580D67
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 09:29:46 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pfNou-008EIp-19
 for igt-dev@lists.freedesktop.org; Thu, 23 Mar 2023 17:29:44 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Mar 2023 17:29:40 +0100
Message-Id: <20230323162943.1961396-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20230323162943.1961396-1-mauro.chehab@linux.intel.com>
References: <20230323162943.1961396-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC 1/4] tests/intel-ci: rename block list files
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Use a new namespace and add a driver prefix to the name.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 .../{blacklist-pre-merge.txt => i915-blocklist-pre-merge.txt}     | 0
 tests/intel-ci/{blacklist.txt => i915-blocklist.txt}              | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename tests/intel-ci/{blacklist-pre-merge.txt => i915-blocklist-pre-merge.txt} (100%)
 rename tests/intel-ci/{blacklist.txt => i915-blocklist.txt} (100%)

diff --git a/tests/intel-ci/blacklist-pre-merge.txt b/tests/intel-ci/i915-blocklist-pre-merge.txt
similarity index 100%
rename from tests/intel-ci/blacklist-pre-merge.txt
rename to tests/intel-ci/i915-blocklist-pre-merge.txt
diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/i915-blocklist.txt
similarity index 100%
rename from tests/intel-ci/blacklist.txt
rename to tests/intel-ci/i915-blocklist.txt
-- 
2.39.2
