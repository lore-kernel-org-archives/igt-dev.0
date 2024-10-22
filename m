Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E006AD1CDD5
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 10:29:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4F810E64E;
	Tue, 22 Oct 2024 10:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YyoSfyVz";
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA61410E30F
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 10:29:11 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 6CAA5C2FAA
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 10:28:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3427440007;
 Tue, 22 Oct 2024 10:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729592921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dcJc7SAtT/9pqV+DDfBl44piStSLyM9obSC+FRTbsxU=;
 b=YyoSfyVzrsyOp1jtWvvfCO7FoaNAJe0jPu7k65VHTZva12ed8/iIcZUUodxp3/tMArLCH4
 /iTH8yDunxpjEyayH1nmQhAAPmSEZcCrQY8z4b5jPcDfM9wIin38Mz/E/TI6iWeXe6PKvP
 xNVlyRCedMTCsIj1zm1qA0twhGjdkow046djf+Q7699zcV1+XOY7nT0jHvKL0XaW7hTQkV
 8V4uXspsPh6WHGP+YI8dMhmklEe/MTfgFNfR9+hUKUQufE7LuIF93ZcOVU1R6RGG8kdNmn
 DRBAEAAh4zMNXQOruMQYQDIA+0r13YOacApVogngdZPyC8nYEaiIU/jJtIKN+w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 22 Oct 2024 12:28:36 +0200
Subject: [PATCH i-g-t v2 2/5] lib/igt_kms: Add helper to wait for a
 specific status on a connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-b4-cv3-01-igt-kms-v2-2-8f654694b513@bootlin.com>
References: <20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com>
In-Reply-To: <20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, nicolejadeyee@google.com, 
 seanpaul@google.com, jeremie.dautheribes@bootlin.com, markyacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2299;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ptcZfII1M0+8CqssRf+dNjoR5J1PkiyDoHwvZ1ArZ5A=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnF35VnjkmcAQHi9KD0Yl7BHRoQUUIy/3AD1BZE
 Hz0GHp4qYWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZxd+VQAKCRAgrS7GWxAs
 4kaTD/0dc9T7/cuYVMG3riTMNRsPYPj69t31jrbbiVLTaW9zpKjVGlXbLdeTbpz3fLgFGw/eiaV
 3JOKn5uQ5mu4oxr6sG4aDZQq6CykvajXAWdECnIyY5XeE0kUOXEUezhX+UatBlpK6NYZ5CkPc0e
 EEBHMtNwKhEra8zsNRkAvv+ip2K6Ay+2ag8+rS65vinUwI8JUQooSu38v3Zw2Ql5Jg0EMI6HbOr
 gC/+zGtpB6Zv8Ar/9S3LciV/nAOkCoXDZlsOm55/+55+koW53y6q2xDwAD3s4bzmdRkH+4Oqq7V
 ShrAgNgaekFfD6iZPkstvZF9WRHnE+8SmxYJ/GOf5LxgOBQvxIpzXRSjKbDj0XWQ4spyQDxZ3bc
 GCnvcDv/+AFm6Zr4U1bkvj3LsUulitja69LxlUhk9mGTD06AC0v9jP/FjM9DdHcNp4VjPJGdhyr
 /YFRi7e9ej894Fu7yEvH9prmst2IaE0uXvQZvCf4FEHU8mbR9qKzmBumsA4/GqILQZsN90BK9i/
 3LE442JYNWDqr8tUMLNb3LvB/xL0pebcaZh8L3/bcUJ88OoqfL9XaEe5h5MO9QU1An0oe7z/IQb
 KUq+XhTmO+V+XXklWrOJhLQY7MTw84CMpnVDQo93GXmuexDMJAEHUxDO3IEeXC7qGDPKt7vvRSl
 bn+NoaRsqzWfq8w==
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

During testing with chamelium, it is frequent to wait for a specific
connector status. This new helper is polling the DRM API to wait for this
status. This allows detecting new status without notifier systems (which
can fail if hot plug detection is not working properly on the device under
test.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 38 ++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 +++
 2 files changed, 41 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 195868646a14..40c0a207cd17 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7143,3 +7143,41 @@ float igt_default_detect_timeout(void)
 
 	return timeout;
 }
+
+/**
+ * igt_wait_for_connector_status - Wait for at most @timeout that the connector @connector_id
+ * status become @drm_mode
+ *
+ * @drm_fd: drm file descriptor
+ * @connector_id: connector to monitor
+ * @timeout: maximum duration to wait, in second
+ * @drm_mode: mode to wait for, see enum drmModeConnection
+ *
+ * Returns: true when the status is reached, false if there is a timeout
+ */
+bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
+				   int drm_mode)
+{
+	drmModeConnector *connector;
+	struct timespec start, end;
+
+	if (timeout == 0.0)
+		timeout = igt_default_detect_timeout();
+
+	clock_gettime(CLOCK_MONOTONIC, &start);
+	clock_gettime(CLOCK_MONOTONIC, &end);
+
+	while (igt_time_elapsed(&start, &end) <= timeout) {
+		connector = drmModeGetConnector(drm_fd, connector_id);
+		if (connector && connector->connection == drm_mode) {
+			free(connector);
+			return true;
+		}
+		free(connector);
+		clock_gettime(CLOCK_MONOTONIC, &end);
+	}
+
+	igt_debug("Timeout waiting for connection status %d on connector %d\n", drm_mode,
+		  connector_id);
+	return false;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 4f0030264d9f..4cd4a4f65460 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1263,4 +1263,7 @@ void igt_reset_link_params(int drm_fd, igt_output_t *output);
 
 float igt_default_detect_timeout(void);
 
+bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
+				   int drm_mode);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.46.2

