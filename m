Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D7AC83F1A
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 18:47:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B7710E884;
	Thu, 17 Jul 2025 18:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Nw40UqVR";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF7E10E15A
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 18:46:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 91B3C442BA;
 Thu, 17 Jul 2025 18:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752778005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5zj+l/HbI0qp8kf58d5ub4ugzx62HkOhjCgz9Jd/XP4=;
 b=Nw40UqVROz81a4D9F2QZwx06Mimu2Zq+JyjXBVPA8NlYKRd82XYDXV7dS268lzZMTJgtPi
 qx5lI96vAZAdfvaDJ4H967rZ0ZuYwnWwNwOjrq5Hbz9lW9dFexEIdJcronhEUpEQXlsjXW
 k0jhYCPNsIiBMKtQlRLmQCQqC/fIbXt9UsgJX3/UD9i5cksnYKYN2QLLcoYMdUInr65R3u
 7UJYS5GVn9xmLRQxpcm1+PWgmd9CaevIZwEk1fCSoJXDOCB7mLMxusxi9iEE7brukkyO8E
 6rTUNt0Hxfw05YRPo3nQXRD5lV6tQJ6fxURV/NFGH1O5SQOCT/XFdNX2SkEawQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 17 Jul 2025 20:46:41 +0200
Subject: [PATCH i-g-t v2 21/26] lib/unigraf: Add connector autodetection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-unigraf-integration-v2-21-77dc329e584c@bootlin.com>
References: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
In-Reply-To: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, mark.yacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2444;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=cLJcxDwfOzD3N8lGUfAhfmvnpfxaJWYhlnKlPJzqQeg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoeUUN/l/qqdDza/q5xqtSq2qDoiRQJniAHNkDj
 ibjT14v5ZCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaHlFDQAKCRAgrS7GWxAs
 4kyND/oCzDFcINQir3onNdu1jkGs78Uh19VG8LheBfL4BtpNdeQmTT9Ix/+hOt8HldXmrTPJhqA
 LaQd2vn4pY3DyGsTQwMt6xQ8O52QOSGFXYXqksf+ILgrltN/kKTCyVN8MGHt2x93tVzxrZQw9Kq
 Zip/ae+8Bj/L548v+wE1KFTUwkk21DqYhVbSW+7Ec7tFqPKjd+B+6utR/qaFznqq8FCNOzwdKzt
 tzqbm8RNv3n9m/WrQn6MZan4qIiiKt/5Pz2hdUsfdmz/2M3y1XgH1uF73tEpf0zmbi2IcdfuApj
 cC4zvyFF5hlYDp0wy5V5PfpuC8gwcBPf++CoZbb5GkQLgz2mVZnc0nJuDxXMwqF6kabxaz5XZ76
 qMzNEf64bbNY09K5cLsunYEg0KgAy1EySIBXY0AkdUi9UM4riuSzV0PhW7EGJNgvIyIufC660QG
 MGNFjHGQGzsL8OuWR6Q8m4F2bLD74RuvzEhTIMvP4XElD3RLQlJ8qbhKMW3zvtvLa/BssxiZWED
 IFAlACfijfNljh+62BCgZKcZ5ek9VryzRr7nhEsQ6D5owBuMzUfGkM6L45oy87/yl+darmdkMvt
 DkTtbQyyiK5SsfE54Vmp1yyXO0UEb/xgn16ubF54tBE9goJJnJhY9SKchEiXAhTibIttekwps/5
 yPFOJladcvaDg2w==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeiudefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdejtddtteeiiefgleejkeetteevhfdukeegleffjeehgeeivefhgeduffdvvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrieejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepihhgthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrhhkrdihrggtohhusgesghhoohhglhgvrdgtohhm
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

In order to avoid writing custom configuration for each DUT, add a simple
autodetection algorithm.
---
 lib/unigraf/unigraf.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index b59a3627af30642899fcf3e4c9e5b53fb4e54eeb..10f8c5ab671d0e8ccf27d333f6ea66c8219b0892 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -165,8 +165,58 @@ static int unigraf_find_input(char *request) {
 	return chosen_input;
 }
 
+static void unigraf_autodetect_connector(int drm_fd)
+{
+	int newly_connected_count, already_connected_count, diff_len;
+	uint32_t *newly_connected = NULL, *already_connected = NULL;
+	drmModeConnectorPtr connector;
+	uint32_t *diff = NULL;
+	igt_assert(drm_fd);
+
+	unigraf_set_sst();
+	unigraf_hpd_deassert();
+
+	/*
+	 * Hard sleep is required here as we don't know how long it will take for the device under
+	 * test to properly detect the port disconnection.
+	 */
+	sleep(igt_default_display_detect_timeout());
+
+	already_connected_count = igt_get_connected_connectors(drm_fd, &already_connected);
+
+	unigraf_hpd_assert();
+
+	newly_connected_count = kms_wait_for_new_connectors(&newly_connected,
+							    already_connected,
+							    already_connected_count,
+							    drm_fd);
+
+	diff_len = get_list_diff(newly_connected, newly_connected_count,
+				 already_connected, already_connected_count, &diff);
+
+	if (diff_len == 0) {
+		unigraf_debug("No newly connected connector, assuming that the unigraf is not connected.\n");
+	} else if (diff_len > 1) {
+		unigraf_debug("More than one new connectors connected, this is not supported by autodetection.\n");
+	} else {
+		unigraf_debug("Found one connector (%d) connected to the chamelium\n", diff[0]);
+		connector = drmModeGetConnector(drm_fd, diff[0]);
+		igt_assert(connector);
+		igt_assert(asprintf(&unigraf_connector_name, "%s-%u",
+				    kmstest_connector_type_str(connector->connector_type),
+				    connector->connector_type_id) != -1);
+		drmModeFreeConnector(connector);
+	}
+
+	free(already_connected);
+	free(newly_connected);
+	free(diff);
+}
+
 drmModeConnectorPtr unigraf_get_connector(int drm_fd)
 {
+	if(!unigraf_connector_name)
+		unigraf_autodetect_connector(drm_fd);
 	return igt_get_connector_from_name(drm_fd, unigraf_connector_name);
 }
 

-- 
2.50.0

