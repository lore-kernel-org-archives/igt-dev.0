Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE9510F62C
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Apr 2022 06:26:51 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Mon,  4 Apr 2022 08:26:31 +0200
Message-Id: <20220404062642.378928-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20220404062642.378928-1-mauro.chehab@linux.intel.com>
References: <20220404062642.378928-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 01/12] scripts/code_cov*: remove the extensions
 from them
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Ch Sai Gowtham <sai.gowtham.ch@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

As those scripts will be installed and executed from the PATH,
remove the extensions from them, in order to make it more elegant
when installed on distros.

Reviewed-by: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/{code_cov_capture.sh => code_cov_capture}                 | 0
 scripts/{code_cov_gather_on_build.sh => code_cov_gather_on_build} | 0
 scripts/{code_cov_gather_on_test.py => code_cov_gather_on_test}   | 0
 scripts/{code_cov_gen_report.sh => code_cov_gen_report}           | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename scripts/{code_cov_capture.sh => code_cov_capture} (100%)
 rename scripts/{code_cov_gather_on_build.sh => code_cov_gather_on_build} (100%)
 rename scripts/{code_cov_gather_on_test.py => code_cov_gather_on_test} (100%)
 rename scripts/{code_cov_gen_report.sh => code_cov_gen_report} (100%)

diff --git a/scripts/code_cov_capture.sh b/scripts/code_cov_capture
similarity index 100%
rename from scripts/code_cov_capture.sh
rename to scripts/code_cov_capture
diff --git a/scripts/code_cov_gather_on_build.sh b/scripts/code_cov_gather_on_build
similarity index 100%
rename from scripts/code_cov_gather_on_build.sh
rename to scripts/code_cov_gather_on_build
diff --git a/scripts/code_cov_gather_on_test.py b/scripts/code_cov_gather_on_test
similarity index 100%
rename from scripts/code_cov_gather_on_test.py
rename to scripts/code_cov_gather_on_test
diff --git a/scripts/code_cov_gen_report.sh b/scripts/code_cov_gen_report
similarity index 100%
rename from scripts/code_cov_gen_report.sh
rename to scripts/code_cov_gen_report
-- 
2.35.1
