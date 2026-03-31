Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6159C10F92E0
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1922B10EC63;
	Tue, 31 Mar 2026 17:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Url3hUlk";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421D910EC39
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:10:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 26DDAC59955;
 Tue, 31 Mar 2026 17:11:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 83FA86029D;
 Tue, 31 Mar 2026 17:10:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 86E221045043E; 
 Tue, 31 Mar 2026 19:10:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977052; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=X/NhR72njfHjPR/JIEupBrewcujG8uvnozK9ljWJITA=;
 b=Url3hUlkEFZu6xhSt71IH2VS3/tF23aUnAaUwVjt1uGtyelnHMrqUjPY3hTssn0ojpWY02
 pvUkmdjisrANCn97hqowKu6+t4IgHHDQ3CweqnEtSvdNK+TaP8WWcsipFW/qYws4/ST4EL
 VV0rN1/X+vxG/W/bGg/TYgr+pFB5Xva14IleKHRYzGAwsmkfTX1C7I/EquPCcZxdlF2fkx
 bwQnV+y0ryU7fyR/+MjvoBUOSVqJvE6iIXDE0c+jCjPyXnZyz31pwtmNcLoiR8EEO5BR6c
 HtYptRbMOkki+cpMryyafclPpj7trGh90+2SgCMtKWgnQHfFWNkrmXPURVaePg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:19 +0200
Subject: [PATCH i-g-t v10 02/49] lib/igt_kms: Add helper to wait for a
 specific status on a connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-2-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2804;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=7bUT1q7Vnfv0QUhTa4uLX3ASNABA/l/zoI7f0RsLDL4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzAA7qetGAGWLdaAcznhsGoj6HLAofaPl6AlBb
 9HpdSwig5aJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAOxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJAiBAAymz1oBXHh4wvT6kqP0FUKEI3H3zvwml
 vonCaIlKO9RjJXIehcs7YaWWHWxWJcVoH1VETHWUF1CJ0t6M041F5KF84XoztQOo8ijPGYgdOZF
 aPy5RtAc3vnsSlQ8WS7M9mfUA5HcNTif92wo+2hp1syT5hjqRSNDZw+i/agWqf+BcNGbIs7VtuZ
 B2mqI1gtrIBchhI9T4y9oOsvyLjXIoj2x6z0eBgvwbOs9W0FJAkxdqOUbEkr7Ub4fBLzA/Vb6U/
 kjvnq8reGbNOcEAlyOiU81UJJlNf1kdxhi6ol+Fz+zpgfNsHW/2g5JQbC8DyFJoKYuN63EqrQlQ
 peObKOhFpFaVv+amJwRezurLocAPMk5EDlKfmmCf/0orcxnr0LXM0gHH7UlUu0ux9ZdSMIQRTtg
 BKg1pSHf+2ZVRBRJmhlV8qpwtp089eiv7wAvETLnfpnfIlNhTmu2sDMXJGMxKuyrf3QUqFiV6ey
 3CFg84KP3BecFj89OBZklEK2iTM7IiNvl3cLi1jCnRbwFEXUmyUBZWP0t6Qk99wfIXXNwL5je2/
 VQp5fyRgd8m7+fo4K5y9/LHHRHJdmDko59M/+dLMMtu0MonBteunHUDRFv1tKhubDcKCuIVuRvT
 cIuEUZaEBgFC2mTTxWHCbImsd5QQ7UfpSTW7KUYGKU5XFdBvFfTc=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
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
status. This allows detecting it without notifier systems which can fail
if hot plug detection is not working properly on the device under test.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 +++
 2 files changed, 46 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f557fe35e1a4..5c78e0552034 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -90,6 +90,8 @@
  * library as a dependency.
  */
 
+#define WAIT_FOR_CONNECTOR_LOOP_SLEEP_US 10000
+
 /* list of connectors that need resetting on exit */
 #define MAX_CONNECTORS 32
 #define MAX_EDID 2
@@ -8147,3 +8149,44 @@ igt_crtc_t *igt_random_crtc(igt_display_t *display)
 
 	return crtcs[rand() % n];
 }
+
+/**
+ * igt_wait_for_connector_status:
+ * @drm_fd: drm file descriptor
+ * @connector_id: connector to monitor
+ * @timeout: maximum duration to wait, in second. Use -1.0 to set the timeout
+ *           to igt_default_detect_timeout().
+ * @drm_mode: mode to wait for, see enum drmModeConnection
+ *
+ * Wait for at most @timeout that the connector @connector_id  status
+ * become @drm_mode
+ * Returns: true when the status is reached, false if there is a timeout
+ */
+bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
+				   int drm_mode)
+{
+	drmModeConnector *connector;
+	struct timespec start, end;
+
+	if (timeout < 0.0)
+		timeout = igt_default_display_detect_timeout();
+
+	igt_assert_eq(igt_gettime(&start), 0);
+	end = start;
+
+	while (igt_time_elapsed(&start, &end) <= timeout) {
+		connector = drmModeGetConnector(drm_fd, connector_id);
+		if (connector && connector->connection == drm_mode) {
+			drmModeFreeConnector(connector);
+			return true;
+		}
+		drmModeFreeConnector(connector);
+		usleep(WAIT_FOR_CONNECTOR_LOOP_SLEEP_US);
+		igt_assert_eq(igt_gettime(&end), 0);
+	}
+
+	igt_debug("Timeout waiting for connection status %d on connector %d\n", drm_mode,
+		  connector_id);
+
+	return false;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index d7cc22d6cd61..f70976cf042c 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1293,4 +1293,7 @@ void igt_get_and_wait_out_fence(igt_output_t *output);
 
 igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
 
+bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
+				   int drm_mode);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

