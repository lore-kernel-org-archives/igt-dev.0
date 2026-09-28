Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88567C9833E
	for <igt-dev@archiver.kernel.org>; Mon, 28 Sep 2026 08:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3412510E6C6;
	Mon, 28 Sep 2026 08:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VAiF4ktn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC0A10E28D
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Sep 2026 08:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790582746; x=1822118746;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JOhFtKg8CeOybPF6GJPcMbHVRT4ct7UZt5FHfC62rVI=;
 b=VAiF4ktnRmWyRoxMTOUYchH5gp/7/W/7mYM1rSSoyIeHqBSEuhgw/mtB
 YB5C4Zxr14IB/J24LJxtqbswM0OwCq7Q+HMe/UsTDpNQOgYouWcDlnzXb
 Gr7OXy1T//X/U1zMhKRwtmt7jlnq5UFoxwkXZcmV4/qC5uv7GcUpSyNUG
 m8gPTvtm8emxlySBXCjka6LTbMYEeLL3IcJDvWMoA9rrq61d/EV/RZmYD
 b972ZlaRlgl/m80V8EEoxDqM/yebYHn6pUVyZp+bPY4RUH3o1o/ZVILa2
 RPWboc/54cjiJ7Hl2zoAaeEHMjgrmNGHNgSBtWf6MFUQUa0kPj7v1mHJG g==;
X-CSE-ConnectionGUID: LJRUChX3SEOc+opMWWYYtw==
X-CSE-MsgGUID: iA/trNnfRkSyIpOCdnNpfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="101932231"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="101932231"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:05:46 -0700
X-CSE-ConnectionGUID: 8MheU9IeRmquEz5i7mWhpA==
X-CSE-MsgGUID: FJ9JwMJcRWSdOzxi+bEwbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="304458108"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:05:45 -0700
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com,
	kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t 1/7] tools/vmtb: Introduce asynchronous VM state
 save/load functions
Date: Mon, 28 Sep 2026 09:25:54 +0200
Message-Id: <20260928072600.426902-2-adam.miszczak@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20260928072600.426902-1-adam.miszczak@linux.intel.com>
References: <20260928072600.426902-1-adam.miszczak@linux.intel.com>
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

Split existing VM snapshot save/load functions into explicit initialization
and completion-check phases.
Making save and load as asynchronous/non-blocking operations allows
parallel migration of multiple VMs.

Refactor QMP 'query_jobs' handling function to keep reading QMP responses
until the requested job type is received. Remove unused 'get_qmp_event_job'
since 'query_jobs' now consumes JOB_STATUS_CHANGE events.

Add handling of QMP command acknowledgments to ensure QEMU has
processed a command before proceeding.
Implement __wait_for_ack() helper that consumes the QMP acknowledgment
(empty return on success) and raises QmpError on an error response.
Apply __wait_for_ack() to confirm QMP commands that have no event-based
confirmation: 'stop', 'cont', 'snapshot-save' and 'snapshot-load'.
Remaining commands like 'system_reset' or 'system_wakeup' are confirmed
via events in VirtualMachine wrappers.

Also tighten query_status() to wait until the response contains both
the 'status' and 'running' fields (QMP StatusInfo type), avoiding acting
on a partial return.

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
---
 tools/vmtb/bench/exceptions.py                | 10 ++-
 .../machines/virtual/backends/qmp_monitor.py  | 55 +++++++++-------
 tools/vmtb/bench/machines/virtual/vm.py       | 66 +++++++++++++------
 3 files changed, 86 insertions(+), 45 deletions(-)

diff --git a/tools/vmtb/bench/exceptions.py b/tools/vmtb/bench/exceptions.py
index 95ca2aa9b..1c151669a 100644
--- a/tools/vmtb/bench/exceptions.py
+++ b/tools/vmtb/bench/exceptions.py
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: MIT
-# Copyright © 2024 Intel Corporation
+# Copyright © 2024-2026 Intel Corporation
 
 class BenchError(Exception):
     pass
@@ -19,11 +19,19 @@ class GuestAgentError(GuestError):
     pass
 
 
+class GuestMigrationError(GuestError):
+    pass
+
+
 class AlarmTimeoutError(GuestError):
     pass
 
 
 # Generic errors:
+class QmpError(BenchError):
+    pass
+
+
 class GemWsimError(BenchError):
     pass
 
diff --git a/tools/vmtb/bench/machines/virtual/backends/qmp_monitor.py b/tools/vmtb/bench/machines/virtual/backends/qmp_monitor.py
index d364a5711..8b273ca07 100644
--- a/tools/vmtb/bench/machines/virtual/backends/qmp_monitor.py
+++ b/tools/vmtb/bench/machines/virtual/backends/qmp_monitor.py
@@ -9,6 +9,8 @@ import threading
 import time
 import typing
 
+from bench.exceptions import QmpError
+
 logger = logging.getLogger('QmpMonitor')
 
 
@@ -46,7 +48,7 @@ class QmpMonitor():
         self.sockf.flush()
 
         ret: typing.Dict = {}
-        while 'status' not in ret:
+        while not ('status' in ret and 'running' in ret):
             qmp_msg = self.qmp_queue.get()
             if 'return' in qmp_msg:
                 ret = qmp_msg.get('return')
@@ -55,26 +57,27 @@ class QmpMonitor():
         logger.debug('Machine status: %s', status)
         return status
 
-    def query_jobs(self, requested_type: str) -> typing.Tuple[str, str]:
+    def query_jobs(self, requested_type: str) -> typing.Tuple[str, typing.Optional[str]]:
         json.dump({'execute': 'query-jobs'}, self.sockf)
         self.sockf.flush()
 
-        job_type: str = ''
-        job_status: str = ''
-        job_error: str = ''
-        ret: typing.Dict = {}
+        job_status: str = 'N/A'
+        job_error: typing.Optional[str] = None
+        is_job_info: bool = False
 
-        qmp_msg = self.qmp_queue.get()
-        # logger.debug('[QMP RSP Queue] -> %s', qmp_msg)
-        if 'return' in qmp_msg:
-            ret = qmp_msg.get('return')
-            for param in ret:
-                job_type = param.get('type')
-                job_status = param.get('status')
-                job_error = param.get('error')
+        while not is_job_info:
+            qmp_msg = self.qmp_queue.get()
+            if 'return' in qmp_msg:
+                ret = qmp_msg.get('return')
+                if not isinstance(ret, list):
+                    continue
 
-                if job_type == requested_type:
-                    break
+                for job_info in ret:
+                    if job_info.get('type') == requested_type:
+                        job_status = job_info.get('status')
+                        job_error = job_info.get('error')
+                        is_job_info = True
+                        break
 
         return (job_status, job_error)
 
@@ -84,15 +87,15 @@ class QmpMonitor():
         event: str = qmp_msg.get('event', '')
         return event
 
-    def get_qmp_event_job(self) -> str:
+    def __wait_for_ack(self, cmd_name: str) -> None:
+        """Consume QMP command acknowledgment (empty return on success).
+        Throw QmpError exception on error response."""
         qmp_msg = self.qmp_queue.get()
-        # logger.debug('[QMP RSP Queue] -> %s', qmp_msg)
-
-        status: str = ''
-        if qmp_msg.get('event') == 'JOB_STATUS_CHANGE':
-            status = qmp_msg.get('data', {}).get('status', '')
-
-        return status
+        while not ('return' in qmp_msg or 'error' in qmp_msg):
+            qmp_msg = self.qmp_queue.get()
+        if 'error' in qmp_msg:
+            desc = qmp_msg['error'].get('desc', 'unknown error')
+            raise QmpError(f'QMP {cmd_name} failed: {desc}')
 
     def system_reset(self) -> None:
         json.dump({'execute': 'system_reset'}, self.sockf)
@@ -105,10 +108,12 @@ class QmpMonitor():
     def stop(self) -> None:
         json.dump({'execute': 'stop'}, self.sockf)
         self.sockf.flush()
+        self.__wait_for_ack('stop')
 
     def cont(self) -> None:
         json.dump({'execute': 'cont'}, self.sockf)
         self.sockf.flush()
+        self.__wait_for_ack('cont')
 
     def quit(self) -> None:
         json.dump({'execute': 'quit'}, self.sockf)
@@ -149,6 +154,7 @@ class QmpMonitor():
             'arguments': {'job-id': job_id, 'tag': snapshot_tag, 'vmstate': node_name, 'devices': [node_name]}},
             self.sockf)
         self.sockf.flush()
+        self.__wait_for_ack('snapshot-save')
 
     def load_snapshot(self) -> None:
         job_id: str = f'loadvm_{time.time()}'
@@ -160,3 +166,4 @@ class QmpMonitor():
             'arguments': {'job-id': job_id, 'tag': snapshot_tag, 'vmstate': node_name, 'devices': [node_name]}},
             self.sockf)
         self.sockf.flush()
+        self.__wait_for_ack('snapshot-load')
diff --git a/tools/vmtb/bench/machines/virtual/vm.py b/tools/vmtb/bench/machines/virtual/vm.py
index 2469af965..8229084d4 100644
--- a/tools/vmtb/bench/machines/virtual/vm.py
+++ b/tools/vmtb/bench/machines/virtual/vm.py
@@ -84,6 +84,7 @@ class VirtualMachine(MachineInterface):
 
         self.migrate_source_image: typing.Optional[str] = None
         self.migrate_destination_vm: bool = False
+        self._migration_ongoing: bool = False
 
         self.dmesg_logger = self.__setup_dmesg_logger()
 
@@ -558,32 +559,57 @@ class VirtualMachine(MachineInterface):
 
         return True
 
-    @Decorators.timeout_signal
-    def save_state(self) -> None:
-        logger.debug('Saving VM%s state (snapshot)', self.vmnum)
+    def save_state_init(self) -> None:
+        """Initiate VM snapshot-save operation (asynchronous)."""
+        logger.debug("Starting VM%s state save (snapshot)", self.vmnum)
         self.qm.save_snapshot()
+        self._migration_ongoing = True
 
-        job_status: str = self.qm.get_qmp_event_job()
-        while job_status != 'concluded':
-            job_status = self.qm.get_qmp_event_job()
+    def load_state_init(self) -> None:
+        """Initiate VM snapshot-load operation (asynchronous)."""
+        logger.debug("Starting VM%s state load (snapshot)", self.vmnum)
+        self.qm.load_snapshot()
+        self._migration_ongoing = True
 
-        job_status, job_error = self.qm.query_jobs('snapshot-save')
-        if job_status == 'concluded' and job_error is not None:
-            raise exceptions.GuestError(f'VM{self.vmnum} state save error: {job_error}')
+    def __is_snapshot_operation_complete(self, op_name: str) -> bool:
+        """Poll VM snapshot save/load job completion."""
+        if not self._migration_ongoing:
+            logger.warning("VM%s migration is not in progress", self.vmnum)
+            return False
 
-        logger.debug('VM%s state save finished successfully', self.vmnum)
+        job_status, job_error = self.qm.query_jobs(f'snapshot-{op_name}')
+        if job_error is not None:
+            logger.error("VM%s snapshot-%s error: %s", self.vmnum, op_name, job_error)
+            return False
+
+        return job_status == 'concluded'
 
     @Decorators.timeout_signal
-    def load_state(self) -> None:
-        logger.debug('Loading VM state (snapshot)')
-        self.qm.load_snapshot()
+    def save_state_check(self, timeout: int = DEFAULT_TIMEOUT) -> None:
+        """Check if previously started snapshot-save has completed successfully."""
+        if not self.__is_snapshot_operation_complete('save'):
+            logger.error("VM%s state save has not completed", self.vmnum)
+            raise exceptions.GuestMigrationError(f'VM{self.vmnum} state save has not completed')
+
+        self._migration_ongoing = False
+        logger.debug("VM%s state save finished successfully", self.vmnum)
+
+    @Decorators.timeout_signal
+    def load_state_check(self, timeout: int = DEFAULT_TIMEOUT) -> None:
+        """Check if previously started snapshot-load has completed successfully."""
+        if not self.__is_snapshot_operation_complete('load'):
+            logger.error("VM%s state load has not completed", self.vmnum)
+            raise exceptions.GuestMigrationError(f'VM{self.vmnum} state load has not completed')
 
-        job_status: str = self.qm.get_qmp_event_job()
-        while job_status != 'concluded':
-            job_status = self.qm.get_qmp_event_job()
+        self._migration_ongoing = False
+        logger.debug("VM%s state load finished successfully", self.vmnum)
 
-        job_status, job_error = self.qm.query_jobs('snapshot-load')
-        if job_status == 'concluded' and job_error is not None:
-            raise exceptions.GuestError(f'VM{self.vmnum} state load error: {job_error}')
+    def save_state(self) -> None:
+        """Save VF state - submit snapshot-save and check result (synchronous save)."""
+        self.save_state_init()
+        self.save_state_check()
 
-        logger.debug('VM state load finished successfully')
+    def load_state(self) -> None:
+        """Load VF state - submit snapshot-load and check result (synchronous load)."""
+        self.load_state_init()
+        self.load_state_check()
-- 
2.39.1

