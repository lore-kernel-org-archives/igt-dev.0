Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17035112493
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Apr 2022 05:24:30 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 kamil.konieczny@linux.intel.com
Date: Tue, 26 Apr 2022 10:53:30 +0530
Message-Id: <20220426052331.3453-2-sai.gowtham.ch@intel.com>
In-Reply-To: <20220426052331.3453-1-sai.gowtham.ch@intel.com>
References: <20220426052331.3453-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] i915/gem_pipe_control_store_loop: added
 description for test case
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

From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>

Added test description for subtest that are available.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
---
 tests/i915/gem_pipe_control_store_loop.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/i915/gem_pipe_control_store_loop.c b/tests/i915/gem_pipe_control_store_loop.c
index 983605e3..070e767f 100644
--- a/tests/i915/gem_pipe_control_store_loop.c
+++ b/tests/i915/gem_pipe_control_store_loop.c
@@ -183,9 +183,13 @@ igt_main
 		igt_skip_on(devid == PCI_CHIP_I965_G); /* has totally broken pipe control */
 	}
 
+	igt_describe("checks tlb consistency of the pipe_control target so creates new buffer"
+		     " each time, emit commands and send it to ring for execution and target"
+		     " buffer won't get reused.");
 	igt_subtest("fresh-buffer")
 		store_pipe_control_loop(false, 2);
 
+	igt_describe("Emit commands in reused buffer and send it to ring for execution.");
 	igt_subtest("reused-buffer")
 		store_pipe_control_loop(true, 2);
 
-- 
2.35.1
