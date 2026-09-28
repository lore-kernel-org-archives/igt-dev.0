Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2687C9832F
	for <igt-dev@archiver.kernel.org>; Mon, 28 Sep 2026 08:10:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C90310E28D;
	Mon, 28 Sep 2026 08:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NsENtT2m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57C410E28D
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Sep 2026 08:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790582758; x=1822118758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kropeZ3SYFqEa6BOmESk/66YgZqizlOLU0w4eSfmn4Q=;
 b=NsENtT2mDolG5Zj9mSNDwbac1zdzGiPejx7FOlKlyToO3LVLqtlc2H9t
 8E0x5HlSsRmIecRhV8vC0xe9UHVtgMEWi6KAJtqKH7atl03eIFQ7t4tZv
 YUM6b8yxiGG/LawlO2h1NIWC3wTlHLaIyEu4LKdSSSFabIYc2GChqc/6m
 h0NuUWqtOM2/iNic2wI3HkDbAXHWu5azXVdEcUrnejszDYRfB8bT3tJtJ
 OrIu+3hrf0Zet9GA5GRq8G+wPFc4c4BjIB2Y/PuwS4jLYPZ/VjAIV/QVP
 mwGcdZj6BfOytgZ7XBkyd8oRLis+3JLvGQp7jzDuWUmuKqIDFrI7aCsDV Q==;
X-CSE-ConnectionGUID: OBhBtUa1QNyCEttbTcNDjQ==
X-CSE-MsgGUID: vhsUF5g0QRmu1U0OIoRBRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="101932249"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="101932249"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:05:58 -0700
X-CSE-ConnectionGUID: +tk422HgTt641+jI/CMrog==
X-CSE-MsgGUID: W860u/bxTw6Ep2efrh8wCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="304458163"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:05:57 -0700
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com,
	kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t 4/7] tools/vmtb: Fix guest timeout handling and PCI BDF
 matching
Date: Mon, 28 Sep 2026 09:25:57 +0200
Message-Id: <20260928072600.426902-5-adam.miszczak@linux.intel.com>
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

Resolve timeouts from keyword or positional arguments and function
defaults. Give VM power-off a configurable 60-second default.

Match complete PCI BDF names using hexadecimal fields and a literal
dot before the function number, rejecting malformed directory names.

Also, avoid nested f-string quotes for compatibility with older Python.

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
---
 tools/vmtb/bench/machines/virtual/vm.py | 48 +++++++++++++++++++------
 1 file changed, 38 insertions(+), 10 deletions(-)

diff --git a/tools/vmtb/bench/machines/virtual/vm.py b/tools/vmtb/bench/machines/virtual/vm.py
index 8229084d4..e0b6fb150 100644
--- a/tools/vmtb/bench/machines/virtual/vm.py
+++ b/tools/vmtb/bench/machines/virtual/vm.py
@@ -2,6 +2,7 @@
 # Copyright © 2024-2026 Intel Corporation
 
 import base64
+import inspect
 import json
 import logging
 import re
@@ -34,13 +35,39 @@ class VirtualMachine(MachineInterface):
 
         @classmethod
         def timeout_signal(cls, func: typing.Callable) -> typing.Callable:
+            timeout_default: int = DEFAULT_TIMEOUT
+
+            # Check for timeout provided as function signature default
+            func_sig = inspect.signature(func)
+            timeout_param = func_sig.parameters.get('timeout')
+            if timeout_param and isinstance(timeout_param.default, int):
+                timeout_default = timeout_param.default
+
+            # Check timeout parameter positional index
+            # (to avoid repeated introspection on every call)
+            timeout_positional_idx: typing.Optional[int] = None
+            positional_params = [
+                name for name, param in func_sig.parameters.items()
+                if param.kind == inspect.Parameter.POSITIONAL_OR_KEYWORD
+            ]
+            if 'timeout' in positional_params:
+                timeout_positional_idx = positional_params.index('timeout')
+
             def timeout_wrapper(*args: typing.Any, **kwargs: typing.Optional[typing.Any]) -> typing.Any:
-                timeout: int = DEFAULT_TIMEOUT
-                if len(args) > 2:
-                    timeout = args[2] # Argument position in execute_wait(self, pid, timeout)
-                elif kwargs.get('timeout') is not None:
-                    if isinstance(kwargs['timeout'], int):
-                        timeout = kwargs['timeout']
+                timeout: int = timeout_default
+
+                # Resolve timeout in this order:
+                # 1. Explicit keyword value, e.g. vm.func(timeout=60)
+                # 2. Explicit positional value, e.g. vm.func(..., 60)
+                # 3. Default function signature value, e.g. def func(self, timeout=60)
+                # 4. Default global value (DEFAULT_TIMEOUT)
+                timeout_kwarg = kwargs.get('timeout')
+                if isinstance(timeout_kwarg, int):
+                    timeout = timeout_kwarg
+                elif (timeout_positional_idx is not None
+                      and len(args) > timeout_positional_idx
+                      and isinstance(args[timeout_positional_idx], int)):
+                    timeout = args[timeout_positional_idx]
 
                 # mypy: silence the following problem in signal.signal() call:
                 # error: Argument 2 to "signal" has incompatible type "Callable[[Signals, FrameType], Any]";
@@ -89,7 +116,8 @@ class VirtualMachine(MachineInterface):
         self.dmesg_logger = self.__setup_dmesg_logger()
 
     def __str__(self) -> str:
-        return f'VM{self.vmnum}-VF:{self.passed_vf_bdfs[0] if self.passed_vf_bdfs else 'N/A'}'
+        vf_bdf = self.passed_vf_bdfs[0] if self.passed_vf_bdfs else 'N/A'
+        return f'VM{self.vmnum}-VF:{vf_bdf}'
 
     def __del__(self) -> None:
         if not self.is_running():
@@ -250,7 +278,7 @@ class VirtualMachine(MachineInterface):
 
         # Look for a directory name with a PCI BDF (e.g. 0000:1a:00.0)
         for bdf in dev_dir_ls:
-            match = re.match(r'\d{4}(?::[0-9a-z-A-Z]{2}){2}.[0-7]', bdf)
+            match = re.fullmatch(r'[0-9a-fA-F]{4}(?::[0-9a-fA-F]{2}){2}\.[0-7]', bdf)
             if match:
                 device = VirtualDevice(bdf, self)
                 detected_devices.append(device)
@@ -328,7 +356,7 @@ class VirtualMachine(MachineInterface):
         return False
 
     @Decorators.timeout_signal
-    def poweroff(self) -> None:
+    def poweroff(self, timeout: int = 60) -> None:
         """Power off VM via the Guest-Agent guest-shutdown(powerdown) command."""
         logger.debug('Powering off VM%s', self.vmnum)
         assert self.process
@@ -343,7 +371,7 @@ class VirtualMachine(MachineInterface):
             while event != 'SHUTDOWN':
                 event = self.qm.get_qmp_event()
         except exceptions.AlarmTimeoutError:
-            logger.warning('VM%s hanged on poweroff. Initiating forced termination', self.vmnum)
+            logger.warning('VM%s has not responded to power off request - force termination', self.vmnum)
             self.process.terminate()
         finally:
             # Wait and make sure that qemu shutdown
-- 
2.39.1

