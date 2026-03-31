Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC74E10F92E0
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:14:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7417710ECCF;
	Tue, 31 Mar 2026 17:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="q1FaDDnx";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1CA10EC48
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0E48D1A30C6;
 Tue, 31 Mar 2026 17:11:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C87106029D;
 Tue, 31 Mar 2026 17:11:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C25C410450495; 
 Tue, 31 Mar 2026 19:11:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977084; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Ut7zgJE/QeWFD4jXuLHpR/EX9K/taIAI/b+81poMTsw=;
 b=q1FaDDnxIDX41JPnqwbMTZWBONO+XypFVJvoMhh7aaXwcTFQGcc7H7viP5gL67L42vn4MT
 gOJzrraIH3o3IwAGckNOQPEcfHx9achXxA78JSK7AEtHqK552KIe2G87eUR4bgRZW+P/3v
 5SBB30c+2Cfujl1e/wH+CX6bdHcS/9/Qvy4tLu+wEGg/luoOlPBM/Cgyk3wPfbokezhPXY
 JcJfuxrqP30tgbbpUJV9mGrYKQhudxYY7Zw+jnLB2wEym1wi4UHheasF/F32PuqPVzuoy+
 1ku+h7qQeYyhUNUaxO8B0fMGANJTIcsG1iyX0NfmQYz0VwbK2xtIiH928ab42Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:57 +0200
Subject: [PATCH i-g-t v10 40/49] lib/i915/dp: Properly check sscanf results
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-40-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1961;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=mlKgRgQnpCjaAe1Ok2WZixIqI7lbdNRvI4o8c9Q8MH4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzABBBRFHSU19FsQl8lWhlgp8EDdQuHOKkH0BZ
 F64KoDFfeyJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAQRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIeNA/+OoC3bCTb0YNxSAlrMXGE+0a7pKednGU
 31yI8/25rAOSfQ6IUW/mm0owjXjVXY9mELkdYzUOTrNFqosiNof2T9YONvkSbdWNAlo78HzhRIM
 bCygy2exielswhH5+iV+XS0AkHVciPuC9jPcI6GqQ5mU6ZIcB1EEL3tsya6nyGSL162Suz3VTOb
 Gb5MIxMFco189ajHPk39E6IzQW8WNEnp4gMOozWuGQdR32WznLE2MUFLjwcdGWuA44HvfJiIU5t
 LYuwBGhJotsLzDbhLzKr0atQmegBvMoQONKZXIMDzKyw9cBBQkN+7IXY/+q/zaOhJ6gyNAFW5BK
 UvP+CXDfcC3qVQcLRRspsBvGqpECh6u7099QaXWsshyPCoXYdUjAX5w+0QyCfhdsmTGX5pM2U6p
 NM5paOKKhtRRj9WPblvGjmbWP4D5Hb9Q4UaINl31d+2x7lMchuedN4RuySv6V36Ab2VAvuBO4VE
 EM1u7eiSt9GW7Eycr6HPE1DBj3S8PtWiqmCFAFkDzf2aba+Ra3Ntu4asgKFZKOIX7Gr0xHWcKgy
 HD5HKym1bDwn8EERXj3kZT78mtGNTW26jbmonBJq+vLc3wk5Hxs800IxsHOjvgRBoTVW/RO3pG4
 d23p4Kt9GQcPcCqlO9VKELHq6QdNmrUVvY9WYgMdmUNJEqNgYi4g=
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

Current sscanf usage can fail silently, add assert to ensure that the
returned value is correct.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/i915/i915_dp.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/lib/i915/i915_dp.c b/lib/i915/i915_dp.c
index da3dd05c3293..c2cddb955d75 100644
--- a/lib/i915/i915_dp.c
+++ b/lib/i915/i915_dp.c
@@ -128,7 +128,9 @@ int i915_dp_get_max_link_rate(int drm_fd, igt_output_t *output)
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_max_link_rate\n",
 		     output->name);
 
-	sscanf(buf, "%d", &ret);
+	igt_assert_f(sscanf(buf, "%d", &ret) == 1,
+		     "Failed to parse max link rate from %s\n", buf);
+
 	return ret;
 }
 
@@ -150,7 +152,9 @@ int i915_dp_get_max_lane_count(int drm_fd, igt_output_t *output)
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_max_lane_count\n",
 		     output->name);
 
-	sscanf(buf, "%d", &ret);
+	igt_assert_f(sscanf(buf, "%d", &ret) == 1,
+		     "Failed to parse max lane count from %s\n", buf);
+
 	return ret;
 }
 
@@ -257,7 +261,10 @@ int i915_dp_get_pending_lt_failures(int drm_fd, igt_output_t *output)
 					      buf, sizeof(buf));
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_training_failure\n",
 		     output->name);
-	sscanf(buf, "%d", &ret);
+
+	igt_assert_f(sscanf(buf, "%d", &ret) == 1,
+		     "Failed to parse pending link training failures from %s\n", buf);
+
 	return ret;
 }
 
@@ -278,7 +285,10 @@ int i915_dp_get_pending_retrain(int drm_fd, igt_output_t *output)
 					      buf, sizeof(buf));
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_retrain\n",
 		     output->name);
-	sscanf(buf, "%d", &ret);
+
+	igt_assert_f(sscanf(buf, "%d", &ret) == 1,
+		     "Failed to parse pending link retrains from %s\n", buf);
+
 	return ret;
 }
 

-- 
2.52.0

