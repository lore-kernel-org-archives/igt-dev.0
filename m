Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E26C48BF0
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 10:27:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69FD10E607;
	Thu, 15 Feb 2024 10:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YjQrfWhI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79A310E57F
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 10:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707992853; x=1739528853;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=4IivoWxJrnCGudkCyB3CAnPCeEIpqLWcDM72cVBnIhk=;
 b=YjQrfWhI6FDGg0uu5sRnXVu6P+9lRFFPZAhv07mZhgST0RTSZb2ygxvs
 ATi4R52E1iv2aO6S+sWP2O/kE180RqGAJHrG017VvJBPkRfuJ5MRGWdxb
 FPznhDtegepyV3e2kQh0IMOZE6YN22sn3+ulBEvnQ+UAJ5pS3SWu9mtDW
 x8hoT12eMCKHKlfL6AnCKavhtwCe501p61vPNhqdczlalmmNKjP6GwGhm
 QJg6Z1AJjEZOX+hxcr8t9GWEzJ/ovPLa58dkngy+NsUNEmr6IqOFK22Cg
 AJ6rv/+1wHqb3gXDn3sZZL3RzHCLXeNpwRdLCGC8XeXsMusSWASsANeCf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="5038598"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="5038598"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="3480350"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:31 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 244A2580F24
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 02:27:31 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1raYxk-00000003JBK-3Q8w for igt-dev@lists.freedesktop.org;
 Thu, 15 Feb 2024 11:27:28 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 07/17] scripts/code_cov_parse_info: use numberic sort for line
 numbers
Date: Thu, 15 Feb 2024 11:27:16 +0100
Message-ID: <4316061856b4316ccaac868c0b72f7a2b07266ca.1707992666.git.mchehab@kernel.org>
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

The DA and BRDA information is originally numerically sorted.

Sort it the same way at the output data.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_parse_info | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index d28217cc196d..56b27faee812 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -291,6 +291,21 @@ sub parse_info_data($)
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
@@ -332,10 +347,10 @@ sub write_filtered_file($)
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
2.43.0

