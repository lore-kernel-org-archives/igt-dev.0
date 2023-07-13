Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3265810E5FC
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jul 2023 07:51:02 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3043B580DD6
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jul 2023 00:51:00 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qJr6I-0044Tq-0U
 for igt-dev@lists.freedesktop.org; Thu, 13 Jul 2023 09:50:58 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 13 Jul 2023 09:50:49 +0200
Message-Id: <20230713075054.970457-10-mauro.chehab@linux.intel.com>
In-Reply-To: <20230713075054.970457-1-mauro.chehab@linux.intel.com>
References: <20230713075054.970457-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 09/14] scripts/igt_doc.py: use field
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
index c02029e03a31..4f4c5c755c44 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -48,8 +48,10 @@ parser.add_argument('--files', nargs='+',
 
 parse_args = parser.parse_args()
 
-tests = TestList(parse_args.config, parse_args.include_plan, parse_args.files,
-                 parse_args.built_testlist)
+tests = TestList(config_fname = parse_args.config,
+                 include_plan = parse_args.include_plan,
+                 file_list = parse_args.files,
+                 built_testlist = parse_args.built_testlist)
 
 if parse_args.filter_field:
     for filter_expr in parse_args.filter_field:
-- 
2.40.1
