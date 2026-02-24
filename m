Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8BFEFB811
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 08:23:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC44D10E4DC;
	Tue, 24 Feb 2026 08:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IdDmzekA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FD610E4DC
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 08:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771921394; x=1803457394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BkDtJ4rNMES2/xv8BoQpGJL6ywHDGcrrSMEAgmpxOs4=;
 b=IdDmzekASNk+tzjNz5c3VcLedQ00wrPULukpqYAqe1LwmdVAWuHwqZfT
 MmaVLVLwi+Oo5ZjlgQ4yf0FMHIhfenwTxlIn3Wx7y8xrtpmKlhL0KIN14
 cPklBx6siIHKZcJvSNjf/JIOUn1st+Q6Wynck3C1LS0AH/LRvPONCaBFs
 nqpZgSe+eeIRNGSg01/vndUpyglAHgvZ9Lbo0sEJKqkjj5NiBTo406Pjj
 hWPGLdapukpbb9Q0HrFq7sgvmcI+AyaAVJD7aZPS/08Q41enKjIt5hK8K
 enCAMVVnfEFIZMSUzTkogtF/4Wu8JL9Y7S2ysAWTLioBER4xagm2RVf/6 w==;
X-CSE-ConnectionGUID: 1/nBjGbKQsOp/Z+8QLuwNA==
X-CSE-MsgGUID: FIcqXOZOREeDEitaf6EVDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76540558"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="76540558"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:23:14 -0800
X-CSE-ConnectionGUID: d4T0P76BTw+6GXb56/kppA==
X-CSE-MsgGUID: C97czRBrRgyU2yaqzOyLGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220351665"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:23:13 -0800
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com,
	kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t 03/10] tools/vmtb: Fix VM snapshot query handling
Date: Tue, 24 Feb 2026 08:50:20 +0100
Message-Id: <20260224075027.2409675-4-adam.miszczak@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20260224075027.2409675-1-adam.miszczak@linux.intel.com>
References: <20260224075027.2409675-1-adam.miszczak@linux.intel.com>
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

QMP command 'query-named-block-nodes' is used to select a block device
for saving VM snapshot (QMP 'snapshot-save').

Add polling for the command's return message in QMP response queue.
It sporadically happened that unsolicited QMP message like:
[QMP RSP] <- {"timestamp": {...}, "event": "RTC_CHANGE" ...}
was falsely taken as a response to previously submitted
QMP 'query-named-block-nodes' command.
Hence, no 'block device node' argument is passed to
'snapshot-load' command which leads to migration tests fail.
Also, add a condition to check if a given block node
is writable (not read-only).

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
---
 .../machines/virtual/backends/qmp_monitor.py  | 25 ++++++++++---------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/tools/vmtb/bench/machines/virtual/backends/qmp_monitor.py b/tools/vmtb/bench/machines/virtual/backends/qmp_monitor.py
index ef3c8aa1c..d364a5711 100644
--- a/tools/vmtb/bench/machines/virtual/backends/qmp_monitor.py
+++ b/tools/vmtb/bench/machines/virtual/backends/qmp_monitor.py
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: MIT
-# Copyright © 2024 Intel Corporation
+# Copyright © 2024-2026 Intel Corporation
 
 import json
 import logging
@@ -123,17 +123,18 @@ class QmpMonitor():
         ret: typing.Dict = {}
 
         qmp_msg = self.qmp_queue.get()
-        # logger.debug('[QMP RSP Queue] -> %s', qmp_msg)
-        if 'return' in qmp_msg:
-            ret = qmp_msg.get('return')
-            for block in ret:
-                if block.get('drv') == 'qcow2':
-                    node_name = block.get('node-name')
-                    # Get the most recent state snapshot from the snapshots list:
-                    snapshots = block.get('image').get('snapshots')
-                    if snapshots:
-                        snapshot_tag = snapshots[-1].get('name')
-                    break
+        while 'return' not in qmp_msg:
+            qmp_msg = self.qmp_queue.get()
+
+        ret = qmp_msg.get('return')
+        for block in ret:
+            if block.get('drv') == 'qcow2' and block.get('ro') is False:
+                node_name = block.get('node-name')
+                # Get the most recent state snapshot from the snapshots list:
+                snapshots = block.get('image').get('snapshots')
+                if snapshots:
+                    snapshot_tag = snapshots[-1].get('name')
+                break
 
         return (node_name, snapshot_tag)
 
-- 
2.39.1

