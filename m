Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934F3C4829E
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 10:27:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234DB10E610;
	Thu, 15 Feb 2024 10:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JaK2jgb+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF1410E57F
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 10:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707992852; x=1739528852;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=PraAr7vlArh2kNw/06S9rtR5cd0oZfau5IISNFDvKaQ=;
 b=JaK2jgb+wrjPV4rLE0H+tmv7F6nw2xjeNdkeT5G1gIxHwpd2L82Iy8bY
 D95O5pcts3yprP+iirsprVNiK9PjowagbwKHhLLYUSdsFskOiGFUhYs41
 t+SCqvpWinfh4LgmJVmEqKVcjcnxTc9b48ZCMr2eLisuRy39bPesp/8L9
 XJTyEkW6b1TsEDGCZrNSlh7rsPyPdBmncseCCLx+I5EhtZZMshjVf7/Vj
 VDyfWwts9gqUeCo4Rc2C885iA8C8KiBwoK6RwXwTlofrcSl1I4jOQiKik
 8m1QkQr6/wvNZ7PXZITESt1N+vZV0luz2HuiQYllmYWSjZ6eB/XJ9gs31 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="5038596"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="5038596"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="3480346"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:31 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id E980B580E7A
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 02:27:30 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1raYxk-00000003JBe-3iol for igt-dev@lists.freedesktop.org;
 Thu, 15 Feb 2024 11:27:28 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 12/17] scripts/code_cov_parse_info: add support for compressed
 files
Date: Thu, 15 Feb 2024 11:27:21 +0100
Message-ID: <27bdbf06fc32030b895b2276393af4138c7ae8e8.1707992666.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707992666.git.mchehab@kernel.org>
References: <cover.1707992666.git.mchehab@kernel.org>
MIME-Version: 1.0
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
index 8180b9c1f82e..50d10a30d7f9
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -6,6 +6,8 @@ use Getopt::Long;
 BEGIN { $Pod::Usage::Formatter = 'Pod::Text::Termcap'; }
 use Pod::Usage;
 use Pod::Man;
+use IO::File;
+use IO::Zlib;
 
 my $prefix = qr ".*?(linux)\w*/";
 
@@ -341,8 +343,14 @@ sub read_json($)
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
@@ -362,7 +370,7 @@ sub read_json($)
 			die "Unknown JSON format on file $file\n";
 		}
 	}
-	close IN;
+	$fh->close() or die "Failed to close file $file";
 }
 
 sub read_info($)
@@ -377,11 +385,16 @@ sub read_info($)
 
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
@@ -568,7 +581,7 @@ sub read_info($)
 		printf("Warning: invalid line: $_");
 	}
 
-	close IN or die;
+	$fh->close() or die "Failed to close file $file";
 }
 
 sub sort_where($$)
@@ -598,9 +611,15 @@ sub write_json_file($)
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
@@ -648,12 +667,17 @@ sub write_info_file($)
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
@@ -1354,7 +1378,7 @@ if ($ignore_unused) {
 }
 
 foreach my $f (@ARGV) {
-	if ($f =~ /.json$/) {
+	if ($f =~ /\.json(\.gz)?$/) {
 		read_json($f);
 	} else {
 		read_info($f);
@@ -1435,7 +1459,7 @@ if ($show_files) {
 }
 
 if ($output_file) {
-	if ($output_file =~ /.json$/) {
+	if ($output_file =~ /.json(.gz)?$/) {
 		write_json_file($output_file);
 	} else {
 		write_info_file($output_file);
-- 
2.43.0

