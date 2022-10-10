Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3176910E732
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 21:42:21 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
 Lionel G Landwerlin <lionel.g.landwerlin@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Mon, 10 Oct 2022 21:42:01 +0000
Message-Id: <20221010214215.5378-23-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20221010214215.5378-1-umesh.nerlige.ramappa@intel.com>
References: <20221010214215.5378-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 22/36] lib/i915/perf: indentation fix
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

From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/i915/perf_data_reader.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/i915/perf_data_reader.c b/lib/i915/perf_data_reader.c
index fcdd5ed1..10e78e63 100644
--- a/lib/i915/perf_data_reader.c
+++ b/lib/i915/perf_data_reader.c
@@ -337,8 +337,8 @@ bool
 intel_perf_data_reader_init(struct intel_perf_data_reader *reader,
 			    int perf_file_fd)
 {
-        struct stat st;
-        if (fstat(perf_file_fd, &st) != 0) {
+	struct stat st;
+	if (fstat(perf_file_fd, &st) != 0) {
 		snprintf(reader->error_msg, sizeof(reader->error_msg),
 			 "Unable to access file (%s)", strerror(errno));
 		return false;
-- 
2.25.1
