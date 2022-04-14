Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A494B10FBD5
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Apr 2022 12:25:11 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Thu, 14 Apr 2022 14:25:00 +0200
Message-Id: <a5c0609c589b33fd6f8c546313a4ce5cc19fd38e.1649939026.git.mchehab@kernel.org>
In-Reply-To: <cover.1649939026.git.mchehab@kernel.org>
References: <cover.1649939026.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 10/12] code_cov_parse_info: fix --show-lines
 logic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Ch Sai Gowtham <sai.gowtham.ch@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

print_code_coverage function needs to first read the number
of lines and then simplify the $file by removing its prefix.

Without that, it ends trying to access an uninitiated value,
leading to warnings and not doing what's expected.

While here, also check if the ln data is valid, just in case
the .info file might have some FN field(s) missing.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v3 00/12] at: https://lore.kernel.org/all/cover.1649939026.git.mchehab@kernel.org/

 scripts/code_cov_parse_info | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index c8284a297b33..0d9bac38cea9 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -378,8 +378,10 @@ sub print_code_coverage($$$)
 			}
 
 			if ($show_lines) {
+				my $ln = $all_func{$func}{$file}->{ln};
 				$file =~ s,$prefix,linux/,;
-				$name = "$func() from $file:" . $all_func{$func}{$file}->{ln};
+				$name = "$func() from $file";
+				$name .= ":" . $ln if ($ln);
 			} elsif (scalar @keys > 1) {
 				$file =~ s,$prefix,linux/,;
 				$name = "$func() from $file:";
-- 
2.35.1
