Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9BA710E497
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 16:29:48 +0000 (UTC)
Received: from linux.intel.com (unknown [10.252.27.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3E462580C7C
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 09:29:46 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pfNou-008EIm-15
 for igt-dev@lists.freedesktop.org; Thu, 23 Mar 2023 17:29:44 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Mar 2023 17:29:39 +0100
Message-Id: <20230323162943.1961396-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC 0/4] Rename the blocked test lists
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


This series contain a a continuation of the discussions with
regards to blacklist/blocklist patches from xe module load
series.

I'm sending it in separate from the original patch series,
in order to not mix subjects.

Mauro Carvalho Chehab (4):
  tests/intel-ci: rename block list files
  tests/intel-ci: add symlinks to avoid breaking CI pipelines
  i915-blocklist.txt: sort the other driver block list
  xe-blocklist.txt: add a blocklist for the Xe driver

 tests/intel-ci/blacklist-pre-merge.txt      | 113 +---------------
 tests/intel-ci/blacklist.txt                | 135 +------------------
 tests/intel-ci/i915-blocklist-pre-merge.txt | 112 ++++++++++++++++
 tests/intel-ci/i915-blocklist.txt           | 140 ++++++++++++++++++++
 tests/intel-ci/xe-blocklist.txt             |  23 ++++
 5 files changed, 277 insertions(+), 246 deletions(-)
 mode change 100644 => 120000 tests/intel-ci/blacklist-pre-merge.txt
 mode change 100644 => 120000 tests/intel-ci/blacklist.txt
 create mode 100644 tests/intel-ci/i915-blocklist-pre-merge.txt
 create mode 100644 tests/intel-ci/i915-blocklist.txt
 create mode 100644 tests/intel-ci/xe-blocklist.txt

-- 
2.39.2
