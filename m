Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845DB10E26E
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 15:46:00 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 16 May 2023 17:44:34 +0200
Message-Id: <20230516154434.810356-9-dominik.grzegorzek@intel.com>
In-Reply-To: <20230516154434.810356-1-dominik.grzegorzek@intel.com>
References: <20230516154434.810356-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 8/8] xe/xe_eudebug: Add TEST/SUBTEST
 documentation
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

Document xe_eudebug test, to reflect its internal logic.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/xe/xe_eudebug.c | 49 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/tests/xe/xe_eudebug.c b/tests/xe/xe_eudebug.c
index 92eaab7de..2aca01b10 100644
--- a/tests/xe/xe_eudebug.c
+++ b/tests/xe/xe_eudebug.c
@@ -2,6 +2,15 @@
 /*
  * Copyright © 2023 Intel Corporation
  */
+
+/**
+ * TEST: Test EU Debugger functionality
+ * Category: Software building block
+ * Sub-category: eu debugger
+ * Test category: functionality test
+ * Run type: BAT
+ */
+
 #include <poll.h>
 
 #include <xe_drm_tmp.h>
@@ -123,6 +132,12 @@ static int __debug_connect(int fd, int *debugfd, struct drm_xe_eudebug_connect_p
 	return ret;
 }
 
+/**
+ * SUBTEST: basic-connect
+ * Description:
+ * 	Exercise XE_EUDEBG_CONNECT ioctl with passing
+ *	valid and invalid params.
+ */
 static void test_connect(int fd)
 {
 	struct drm_xe_eudebug_connect_param param = {};
@@ -193,6 +208,11 @@ static void test_connect(int fd)
 	close(debugfd);
 }
 
+/**
+ * SUBTEST: basic-close
+ * Description:
+ * 	Test whether eudebug can be reattached after closure.
+ */
 static void test_close(int fd)
 {
 	struct drm_xe_eudebug_connect_param param = { 0,  };
@@ -216,6 +236,11 @@ static void test_close(int fd)
 	close(debug_fd1);
 }
 
+/**
+ * SUBTEST: basic-read-event
+ * Description:
+ * 	Synchronously exercise eu debugger event polling and reading.
+ */
 #define MAX_EVENT_SIZE (32 * 1024)
 static void test_read_event(int fd)
 {
@@ -265,6 +290,20 @@ static void test_read_event(int fd)
 	xe_eudebug_client_destroy(c);
 }
 
+/**
+ * SUBTEST: basic-client
+ * Description:
+ * 	Attach the debugger to proccess which opens and closes xe drm client.
+ *
+ * SUBTEST: multiple-sessions
+ * Description:
+ * 	Simultaneusly attach many debuggers to many proccesses.
+ * 	Each proccess opens and closes xe drm client.
+ *
+ * SUBTEST: basic-vms
+ * Description:
+ * 	Attach the debugger to procces which creates and destroys a few vms.
+ */
 static void test_basic_sessions(int fd, unsigned int flags, int count)
 {
 	struct session **s;
@@ -320,6 +359,16 @@ static void run_discovery_client(struct xe_eudebug_client *c)
 	}
 }
 
+/**
+ * SUBTEST: discovery-%s
+ * Description: Race discovery against %arg[1] and the debugger dettach.
+ *
+ * arg[1]:
+ *
+ * @race:		resources creation
+ * @empty:		resources destruction
+ * @empty-clients:	client closure
+ */
 static void *discovery_race_thread(void *data)
 {
 	struct {
-- 
2.34.1
