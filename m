Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F17010E2FD
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 14:06:20 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 9A199580DDF
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 06:06:19 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pHmbR-00Ba13-2A
 for igt-dev@lists.freedesktop.org; Tue, 17 Jan 2023 15:06:17 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 15:05:58 +0100
Message-Id: <20230117140607.2759816-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20230117140607.2759816-1-mauro.chehab@linux.intel.com>
References: <20230117140607.2759816-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 03/12] code_cov_parse_info: use numberic
 sort for line numbers
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

The DA and BRDA information is originally numerically sorted.

Sort it the same way at the output data.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_parse_info | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index d3739211b68a..ef44229983b6 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -284,6 +284,21 @@ sub parse_info_data($)
 	close IN or die;
 }
 
+sub sort_where($$)
+{
+	my @a = split ",", shift;
+	my @b = split ",", shift;
+	my $ret;
+
+	$ret = $a[0] <=> $b[0];
+	return $ret if ($ret);
+
+	$ret = $a[1] <=> $b[1];
+	return $ret if ($ret);
+
+	return $a[2] <=> $b[2];
+}
+
 sub write_filtered_file($)
 {
 	my $filter = shift;
@@ -325,10 +340,10 @@ sub write_filtered_file($)
 				}
 			}
 
-			foreach my $ln(sort keys %{ $record{$source}{$func}{da} }) {
+			foreach my $ln(sort { $a <=> $b } keys %{ $record{$source}{$func}{da} }) {
 				$filtered .= "DA:$ln," . $record{$source}{$func}{da}{$ln} . "\n";
 			}
-			foreach my $where(sort keys %{ $record{$source}{$func}{brda} }) {
+			foreach my $where(sort sort_where keys %{ $record{$source}{$func}{brda} }) {
 				my $taken = $record{$source}{$func}{brda}{$where};
 				$taken = "-" if (!$taken);
 				$filtered .= "BRDA:$where,$taken\n";
-- 
2.39.0
