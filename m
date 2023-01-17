Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFA710E546
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 14:06:21 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 9F747580DE4
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 06:06:19 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pHmbR-00Ba1H-2Q
 for igt-dev@lists.freedesktop.org; Tue, 17 Jan 2023 15:06:17 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 15:06:02 +0100
Message-Id: <20230117140607.2759816-8-mauro.chehab@linux.intel.com>
In-Reply-To: <20230117140607.2759816-1-mauro.chehab@linux.intel.com>
References: <20230117140607.2759816-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 07/12] code_cov_parse_info: add support for
 compressed files
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

Code coverage files are big. Add support for read/write gzipped
files, in order to save I/O, and, depending on the disk, speeding
up the tool.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_parse_info | 56 ++++++++++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 16 deletions(-)
 mode change 100644 => 100755 scripts/code_cov_parse_info

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
old mode 100644
new mode 100755
index 80a9f1c25540..d38ee9ee6a69
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -6,6 +6,8 @@ use Getopt::Long;
 BEGIN { $Pod::Usage::Formatter = 'Pod::Text::Termcap'; }
 use Pod::Usage;
 use Pod::Man;
+use IO::File;
+use IO::Zlib;
 
 my $prefix = qr ".*?(linux)\w*/";
 
@@ -340,8 +342,14 @@ sub read_json($)
 	}
 
 	# Read JSON data
-	open IN, $file or die "can't open $file";
-	while (<IN>) {
+	my $fh;
+	if ($file =~ m/\.gz$/) {
+		$fh = IO::Zlib->new($file, "rb") or die "can't open $file";
+	} else {
+		$fh = IO::File->new($file) or die "can't open $file";
+	}
+	print "reading $file...\n" if ($verbose);
+	while (<$fh>) {
 		my $json = eval {
 			Cpanel::JSON::XS::decode_json($_)
 		};
@@ -361,7 +369,7 @@ sub read_json($)
 			die "Unknown JSON format on file $file\n";
 		}
 	}
-	close IN;
+	$fh->close() or die "Failed to close file $file";
 }
 
 sub read_info($)
@@ -376,11 +384,16 @@ sub read_info($)
 
 	# First step: parse data
 
-	print "reading $file...\n" if ($verbose);
-	open IN, $file or die "can't open $file";
 	# For details on .info file format, see "man geninfo"
 	# http://ltp.sourceforge.net/coverage/lcov/geninfo.1.php
-	while (<IN>) {
+	my $fh;
+	if ($file =~ m/\.gz$/) {
+		$fh = IO::Zlib->new($file, "rb") or die "can't open $file";
+	} else {
+		$fh = IO::File->new($file) or die "can't open $file";
+	}
+	print "reading $file...\n" if ($verbose);
+	while (<$fh>) {
 		# TN:<test name>
 		if (m/^TN:(.*)/) {
 			if ($1 ne $cur_test) {
@@ -571,7 +584,7 @@ sub read_info($)
 		printf("Warning: invalid line: $_");
 	}
 
-	close IN or die;
+	$fh->close() or die "Failed to close file $file";
 }
 
 sub sort_where($$)
@@ -601,9 +614,15 @@ sub write_json_file($)
 		Cpanel::JSON::XS::encode_json(\%record)
 	};
 
-	open OUT, ">$fname" or die "Can't open $fname";
-	print OUT $data or die "Failed to write to $fname";
-	close OUT or die "Failed to close to $fname";
+	if ($fname =~ m/\.gz$/) {
+		my $fh = IO::Zlib->new($fname, "wb") or die "can't open $fname";
+		print $fh $data or die "Failed to write to $fname";
+		$fh->close or die "Failed to write to $fname";
+	} else {
+		open OUT, ">$fname" or die "Can't open $fname";
+		print OUT $data or die "Failed to write to $fname";
+		close OUT or die "Failed to close to $fname";
+	}
 }
 
 sub write_info_file($)
@@ -650,12 +669,17 @@ sub write_info_file($)
 				$data .= "BRDA:$ln,0,$i,$taken\n";
 			}
 		}
-
 		$data .= "end_of_record\n";
 	}
-	open OUT, ">$fname" or die "Can't open $fname";
-	print OUT $data or die "Failed to write to $fname";
-	close OUT or die "Failed to close to $fname";
+	if ($fname =~ m/\.gz$/) {
+		my $fh = IO::Zlib->new($fname, "wb") or die "can't open $fname";
+		print $fh $data or die "Failed to write to $fname";
+		$fh->close or die "Failed to write to $fname";
+	} else {
+		open OUT, ">$fname" or die "Can't open $fname";
+		print OUT $data or die "Failed to write to $fname";
+		close OUT or die "Failed to close to $fname";
+	}
 }
 
 sub print_code_coverage($$$)
@@ -1346,7 +1370,7 @@ if ($ignore_unused) {
 }
 
 foreach my $f (@ARGV) {
-	if ($f =~ /.json$/) {
+	if ($f =~ /\.json(\.gz)?$/) {
 		read_json($f);
 	} else {
 		read_info($f);
@@ -1425,7 +1449,7 @@ if ($show_files) {
 }
 
 if ($output_file) {
-	if ($output_file =~ /.json$/) {
+	if ($output_file =~ /.json(.gz)?$/) {
 		write_json_file($output_file);
 	} else {
 		write_info_file($output_file);
-- 
2.39.0
