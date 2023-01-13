Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E345C10EAB0
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jan 2023 19:26:09 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 13 Jan 2023 20:25:53 +0100
Message-Id: <20230113192553.89460-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230113192553.89460-1-zbigniew.kempczynski@intel.com>
References: <20230113192553.89460-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] meson.build: Remove -fcommon flag
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Ensure global variables are explicitly defined in one place and
requires importing via extern keyword instead of duplicating definition
resolved during linking time.

Details: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85678

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 meson.build | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meson.build b/meson.build
index bbe1f673e8..7b25627229 100644
--- a/meson.build
+++ b/meson.build
@@ -70,7 +70,6 @@ cc_args = [
 # well with longjmp which is heavily used by IGT framework.
 	'-fno-builtin-malloc',
 	'-fno-builtin-calloc',
-	'-fcommon',
 ]
 
 foreach cc_arg : cc_args
-- 
2.34.1
