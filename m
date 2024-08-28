Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B356C5AE5A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 14:32:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E5E10E546;
	Wed, 28 Aug 2024 14:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XOO0gdik";
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A2510E543
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 14:31:58 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id C3F4DC824D
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 14:31:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B334C0003;
 Wed, 28 Aug 2024 14:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724855516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4XrBzplPgaoZ+fLPd4fQkXGJ28E2xApY+U3I2O+AuC8=;
 b=XOO0gdikZmjm5cZTdM9aXbBLZwcdee4wmkVBaQoXiIYKSazllvfPnDHrbXsBOA9QfPTqsl
 66ppXLBnkrbVY8tPrh40xhzMxuvM8QPmcFcP3msRVgR+3OZF2S0yYx3HLp7X2/zsyq67qe
 GoyuEZGZYr+vAwjP7rNguUAITdJLBPUgluk+eoBRx5h0nmTm3gz1jklZFGhCr2gCSFLJBu
 ohO8u4EVt0y/hb2+cDcf+Ix0usInUEFuWVb9XslQ7u4nq3NcxqVxgUklmxBgITQOChHiA2
 6szDWXWbqsD/JOokmV+ZK3JyDScmfYqQsZlIr78Q8Vm6SPQbTZhF+I3XuzpmkQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Aug 2024 16:31:50 +0200
Subject: [PATCH i-g-t 1/5] lib/igt_kms: Add a detect timeout value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-b4-cv3-01-igt-kms-v1-1-d6e21b1e5d04@bootlin.com>
References: <20240828-b4-cv3-01-igt-kms-v1-0-d6e21b1e5d04@bootlin.com>
In-Reply-To: <20240828-b4-cv3-01-igt-kms-v1-0-d6e21b1e5d04@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, nicolejadeyee@google.com, 
 seanpaul@google.com, jeremie.dautheribes@bootlin.com, markyacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2641;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=jiH29O3/vH79x403ZtAhRa5IPAIkazycKqhLVdGURo8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmzzTZclPXQEaEDOmwzMdbHLiNDQ1nU/ugio8Wb
 TrmC0HCKMmJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZs802QAKCRAgrS7GWxAs
 4hBxD/9Tmfp1CiLD7rpA/ehGls2vCoxSOTls+RHJcFFfBITj7gnZdNhh7r24I6Kidb53yvY1asa
 I3kJgtP3ObWCF3+L9aYSWe/bvB5KNc1aNn0GMrY7ZgW9yr0T84b8hbIFl1TnuHIRgtFn7FD7jFC
 Bdtg3djJJFpf0GdbuhFOica8BT8lPCEmSWaAOG88wQ742p5gxe2GY3kTLvJe8KhTJhKSY3pvwEA
 GykUiWsWnc3SwP60zEB+qCMQw3wjTxpJy0BRzBpVT0jL3fZOr5FMCEowKYD7WSqDJ4DwdQJZbM+
 7iGmwqcsAD80QSLvNqbX1woKNWdQ4hDX36iW7OyEO9EVp0sr6RKdD0NFOO7+HZB9rSa94I9Njjx
 DwZ2W5J0G5OXUSjx48LvuzIZqdMVRF0iA60pSPrZKfslnw3tfX8s19b/qrd+9HspMoZXI6lkgI+
 n5+vXTvKMY0/22SKAfLd+aOcBoG/3ZmEHHyaZYTXQDylRqm8MC5LfmM1R30/yw+l57Aa/ltb7e0
 PlHBjFha3/SegNU4+w48wsxfFP1rJRJKThyfPe/M9v0RSoSipj+iUKwOsxAw8Q1BSUDZRohFiFp
 KQae/JOJ0rlUrRNevBeScOFP/TwR2u1alqdClyiOiBA8RV9DWdqEZHG4lx3xljTKjaJIHMaXxKR
 QAUJ+DnQz9woj8w==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

Some tests need to wait for a specific connector status. In order to make
the timeout customisable for each target, add an option in the
configuration file.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_core.c |  3 +++
 lib/igt_kms.c  | 24 ++++++++++++++++++++++++
 lib/igt_kms.h  |  9 +++++++++
 3 files changed, 36 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index e0edfe18f50e..6ad63ad31593 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -265,6 +265,9 @@
  *	&num; It is not mandatory and allows overriding default values.
  *	[DUT]
  *	SuspendResumeDelay=10
+ *	&num; The following option define the timeout for detection feature
+ *	&num; (waiting for a connector status)
+ *	DetectTimeout=10.0
  * ]|
  *
  * Some specific configuration options may be used by specific parts of IGT,
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index dd530dbabf89..d78b239c3bd7 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -57,6 +57,7 @@
 #include "intel_chipset.h"
 #include "igt_debugfs.h"
 #include "igt_device.h"
+#include "igt_rc.h"
 #include "igt_sysfs.h"
 #include "sw_sync.h"
 #ifdef HAVE_CHAMELIUM
@@ -6705,3 +6706,26 @@ int get_num_scalers(igt_display_t *display, enum pipe pipe)
 
 	return num_scalers;
 }
+
+/**
+ * igt_default_detect_timeout - Get the default timeout value for detection feature
+ *
+ * Some tests requires to wait for a specific connector status. This value will determine the
+ * timeout value for this waiting.
+ */
+float igt_default_detect_timeout(void)
+{
+	static double timeout = 0.0;
+	static bool first_call = true;
+
+	if (first_call) {
+		if (igt_key_file)
+			timeout = g_key_file_get_double(igt_key_file, "DUT", "DetectTimeout", NULL);
+		else
+			timeout = DEFAULT_DETECT_TIMEOUT;
+
+		first_call = false;
+	}
+
+	return timeout;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 25ba509164e3..e4a64cb19322 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -39,6 +39,13 @@
 #include "igt_fb.h"
 #include "ioctl_wrappers.h"
 
+/**
+ * define DEFAULT_DETECT_TIMEOUT - Default timeout used for some detection functions
+ *
+ * It can be overiden by option DetectTimeout in the .igtrc file.
+ */
+#define DEFAULT_DETECT_TIMEOUT 10.0
+
 /* Low-level helpers with kmstest_ prefix */
 
 /**
@@ -1225,4 +1232,6 @@ bool igt_check_output_is_dp_mst(igt_output_t *output);
 int igt_get_dp_mst_connector_id(igt_output_t *output);
 int get_num_scalers(igt_display_t *display, enum pipe pipe);
 
+float igt_default_detect_timeout(void);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.44.2

