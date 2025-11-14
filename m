Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93DDCE8D7D
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 19:23:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C7610EAED;
	Fri, 14 Nov 2025 19:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P1Imm0ee";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E1D10EAED
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 19:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763148197; x=1794684197;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8mg/M0bjjth0LDY2sepFi/rLIqu05i4PTy+q70n0cAE=;
 b=P1Imm0eeP9cXtGmVDfR4xIQPPrQpDXAENBN6jE+ZYzJaL4uCYii/h/7u
 Va6G7wMmnXWmIDuna6S6s2OZeXcJ9PSXQPcr/AafapzD/dhONR5LByMdH
 aRb67pVy1ntDKnasA6wZdAXJ9gRzmPvAyd4L4uVshlEw52/UpoesDJp1I
 m4WIo5a+Cn5xq+8j/dVmsN+5b5MmYsT5vW0+3VGcQFMLR+tU6u9cDaUmK
 yq41oh50V4T1zad9p8ODFNYlhat4qJyyenLUbc+D5ENgswDpjlPx/bKi2
 2V/m6yuTKpgwy/hIfuc7ePCi4hnTHoLNlXIJEtOpQvBI+APiF3qdy787x w==;
X-CSE-ConnectionGUID: YN18VlU2R6ODgLNkdnpS+A==
X-CSE-MsgGUID: HM7CZmfiQpyjcWJeeXAPog==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="90727944"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="90727944"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 11:23:17 -0800
X-CSE-ConnectionGUID: p5KARaFXR1WfBq0U+w9ZoQ==
X-CSE-MsgGUID: BfVBEF+UTH28F9vafWpYXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="194158110"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.61])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 11:23:16 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tools/intel_gpu_frequency: Fix help and version options
Date: Fri, 14 Nov 2025 20:23:05 +0100
Message-ID: <20251114192308.133691-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Using either help or version option without root permissions
cause now a fail and stack dump. Fix this and parse those two
early.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/intel_gpu_frequency.c | 42 +++++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
index de0c6ddba..8c3c91313 100644
--- a/tools/intel_gpu_frequency.c
+++ b/tools/intel_gpu_frequency.c
@@ -118,7 +118,7 @@ static int get_frequency(struct freq_info *freq_info)
 }
 
 static void __attribute__((noreturn))
-usage(const char *prog)
+usage(const char *prog, int err)
 {
 	printf("%s A program to manipulate Intel GPU frequencies.\n\n", prog);
 	printf("Usage: %s [-e] [--min | --max] [--get] [--set frequency_mhz]\n\n", prog);
@@ -139,7 +139,7 @@ usage(const char *prog)
 	printf("   intel_gpu_frequency --custom max=750\tSet the max frequency to 750MHz\n");
 	printf("\n");
 	printf("Report bugs to https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues\n");
-	exit(EXIT_FAILURE);
+	exit(err);
 }
 
 static void
@@ -149,6 +149,31 @@ version(const char *prog)
 	printf("Copyright © 2015,2018 Intel Corporation\n");
 }
 
+static void
+parse_version_or_help(int argc, char *argv[])
+{
+	char *s;
+	int c;
+
+	if (argc == 1) /* No args */
+		return;
+
+	s = argv[1];
+	c = *s++;
+	if (c == '-')
+		c = *s++;
+	if (c == '-')
+		c = *s++;
+
+	if (c == 'v') {
+		version(argv[0]);
+		exit(EXIT_SUCCESS);
+	}
+
+	if (c == 'h')
+		usage(argv[0], EXIT_SUCCESS);
+}
+
 /* Returns read or write operation */
 static bool
 parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
@@ -192,7 +217,7 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
 			break;
 		case 's':
 			if (!optarg)
-				usage(argv[0]);
+				usage(argv[0], EXIT_FAILURE);
 
 			if (write == true) {
 				fprintf(stderr, "Only one write may be specified at a time\n");
@@ -207,7 +232,7 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
 			break;
 		case 'c':
 			if (!optarg)
-				usage(argv[0]);
+				usage(argv[0], EXIT_FAILURE);
 
 			if (write == true) {
 				fprintf(stderr, "Only one write may be specified at a time\n");
@@ -264,12 +289,9 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
 			act_upon[MAX] = true;
 			write = true;
 			break;
-		case 'v':
-			version(argv[0]);
-			exit(0);
-		case 'h':
 		default:
-			usage(argv[0]);
+			fprintf(stderr, "Error: unknown option\n");
+			usage(argv[0], EXIT_FAILURE);
 		}
 	}
 
@@ -283,6 +305,8 @@ int main(int argc, char *argv[])
 	bool write, fail, targets[MAX+1] = {false};
 	int i, fd, try = 1, set_freq[MAX+1] = {0};
 
+	parse_version_or_help(argc, argv);
+
 	fd = __drm_open_driver(DRIVER_INTEL);
 	devid = intel_get_drm_devid(fd);
 	device = igt_device_get_card_index(fd);
-- 
2.51.2

