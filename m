Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751E010E186
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Sep 2023 12:36:39 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Sep 2023 14:36:34 +0200
Message-ID: <20230915123634.453651-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] docs/testplan/conf.py: add sphinx path
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Without that, extensions from other directories might be probed,
which is not what we want to do.

Such solution was imported from the Linux Kernel conf.py
setting.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 docs/testplan/conf.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/testplan/conf.py b/docs/testplan/conf.py
index a7db5c3a230d..bf23881494b6 100644
--- a/docs/testplan/conf.py
+++ b/docs/testplan/conf.py
@@ -8,6 +8,8 @@ import sys
 # Get Sphinx version
 major, minor, patch = sphinx.version_info[:3]
 
+sys.path.insert(0, os.path.abspath('sphinx'))
+
 extensions = []
 
 def which(program):
-- 
2.41.0
