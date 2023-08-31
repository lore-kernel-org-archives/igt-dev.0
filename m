Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B803110E6A4
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 14:55:19 +0000 (UTC)
Received: from linux.intel.com (unknown [10.252.5.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 1EAA4580EAA
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 07:55:15 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qbj4i-0020HY-35
 for igt-dev@lists.freedesktop.org; Thu, 31 Aug 2023 16:55:12 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 31 Aug 2023 16:52:13 +0200
Message-ID: <20230831145509.477543-12-mauro.chehab@linux.intel.com>
In-Reply-To: <20230831145509.477543-1-mauro.chehab@linux.intel.com>
References: <20230831145509.477543-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 11/11] scripts/igt_doc.py: use field
 names when create a TestList instance
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Makes the caller more generic by explicitly passing the field
name when calling TestList. This allows updating the class and
eventually re-ordering fields without the need of changes on
igt_doc.py.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index 38e2bdee4f2a..86e49970ea28 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -48,8 +48,10 @@ parser.add_argument('--files', nargs='+',
 
 parse_args = parser.parse_args()
 
-tests = TestList(parse_args.config, parse_args.include_plan, parse_args.files,
-                 parse_args.igt_build_path)
+tests = TestList(config_fname = parse_args.config,
+                 include_plan = parse_args.include_plan,
+                 file_list = parse_args.files,
+                 igt_build_path = parse_args.igt_build_path)
 
 if parse_args.filter_field:
     for filter_expr in parse_args.filter_field:
-- 
2.41.0
