Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392BA892B7
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2020 08:15:53 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Wed, 3 Jun 2020 11:15:32 +0300
Message-ID: <20200603081532.969938-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] python: Stop using cElementTree
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

It got removed in Python 3.9 and ever since Python 3.3 it's:
  from xml.etree.ElementTree import *

Link: https://docs.python.org/3.9/whatsnew/3.9.html#removed
Issue: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/86#note_520308

Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>
Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 docs/reference/igt-gpu-tools/generate_description_xml.py | 2 +-
 lib/i915/perf-configs/codegen.py                         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/reference/igt-gpu-tools/generate_description_xml.py b/docs/reference/igt-gpu-tools/generate_description_xml.py
index 8bb0989a..714590f8 100755
--- a/docs/reference/igt-gpu-tools/generate_description_xml.py
+++ b/docs/reference/igt-gpu-tools/generate_description_xml.py
@@ -4,7 +4,7 @@ import re
 import sys
 import os.path
 import subprocess
-import xml.etree.cElementTree as ET
+import xml.etree.ElementTree as ET
 
 from collections import namedtuple
 
diff --git a/lib/i915/perf-configs/codegen.py b/lib/i915/perf-configs/codegen.py
index 88981d73..5f028c22 100644
--- a/lib/i915/perf-configs/codegen.py
+++ b/lib/i915/perf-configs/codegen.py
@@ -1,4 +1,4 @@
-import xml.etree.cElementTree as et
+import xml.etree.ElementTree as et
 
 class Codegen:
 
-- 
2.25.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
