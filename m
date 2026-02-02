Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4637DE7DEF3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC71310E4D2;
	Mon,  2 Feb 2026 14:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JMMLrRRR";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F8710E4E3
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 33395C237F3
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6A91460767;
 Mon,  2 Feb 2026 14:32:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 375A6119A88FC; Mon,  2 Feb 2026 15:32:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042758; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=b+AFcqzBj7aWmIbmBW7eS2S1MpwcdwW/c/c6A7h4QqU=;
 b=JMMLrRRRdwNO1gPK+YfsOB0j1/tIy2x7v+RRFm0v8WyrULviBOlpY++BznUJZ4RB2MqFJO
 ezk7EoJQ4xgKAz3IwBASVuUkT44hcGLju0aPFq2mDWK8RgUXDotZmOfM5UA0KmwM+BHaqb
 UOlfU3PAEF/IXmzPV9xUlY7Uhjgc3tbTTwbZxddjaMmtXk5nbRxDxDIqMXm/mb39q+ADKe
 WKkfM91WXR2+oJVjakRhKQjKq20zFuzuatGSav57P+OUNoc/L4Q7iToNGhHuSnSxJTkRZ/
 TYvIPb9bAAefsIbBL6SWqBmqcWcuQWlNJZSsYbTa8Gs1r3kcMU99VW942aqq2A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:32:52 +0100
Subject: [PATCH i-g-t v6 13/48] lib/igt_kms: Add const when make sense
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-13-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1476;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=CE0CTVgZtkBEkD/fqb8wJ/3/HRjQ5iRv/hGc5Opfkzo=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWQ2QMjhqYwk3sr9N9/XGhn85I0GadncrIBH
 PUjzIIhQEyJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1kBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJTERAAouWc2mqhAHaOUzCmlfd8ZusPPALivjF
 7igtLpO8FkMg62pBTQPFBIb+iagQ6hgKeY0yojfU3Qa3Ti7+3oL2UpVAAt2qyvwTtF59ejf+04z
 xSesNcmyP3O59AzT/QMPei6I5kteNXF9HaeCSDbjehxzEkFq63gxuQ7Z1j9MhG6dBALofujPG/g
 pCCPyeeMJvayEv5aWf0K9FhCXXyikFD0E5xYKPYAI7js+clPodOfhPCRGLsWpGbRiyEO2mEiC4k
 GB67BwjoWRf5s8pr/5DvWURKW5UeNbV0bPxlTtrxwNnrXCREXcuawdSs7lMEjSV9mzwalGsCkEe
 L5Z47uDAN8b91p3pj/DNa48cTRqwmA+hNcr7Y8szDxpTYegKivljaKKJTBgkQM0NnNNeYVooW/C
 6Id0le9mp7NHPTrjAVf/ZiBr0QhUPrqLayO6Kq7BNqas2SQDXBBDP8CBtfroI/Y8DqrWPiK25WV
 Dcva+ANJ+Vk6FMh6dDGG3oEIsXBJa4RE3QXJduaMNznx+jLPMQHHPJ2QCAo4K9yBMmbigNILhoq
 Hv+3JwSrtx0GXcWxXNW7tPEJC6dDk5qp9bK1FpB9JxqOCa7lyeTuMxgtzHwzK0y2/krL67YRXh3
 R1HIRS64gjgYaBUDsaCtjMJRH3sZVWSdaGsb25IQXMSgYxS2Ibnw=
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

Const qualifier helps to avoid unwanted modification of a pointer.
To help avoiding those errors, modify the function signature to
use const.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 lib/igt_kms.c | 2 +-
 lib/igt_kms.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2754b3bc0c91..799952c18f07 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5163,7 +5163,7 @@ int igt_display_drop_events(igt_display_t *display)
  *
  * Returns: String representing a connector's name, e.g. "DP-1".
  */
-const char *igt_output_name(igt_output_t *output)
+const char *igt_output_name(const igt_output_t *output)
 {
 	return output->name;
 }
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 42d47071d932..50a02a9b5aa1 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -601,7 +601,7 @@ igt_pipe_crc_t *igt_crtc_crc_new(igt_crtc_t *crtc, const char *source);
 igt_pipe_crc_t *igt_crtc_crc_new_nonblock(igt_crtc_t *crtc, const char *source);
 
 igt_crtc_t *igt_output_get_driving_crtc(igt_output_t *output);
-const char *igt_output_name(igt_output_t *output);
+const char *igt_output_name(const igt_output_t *output);
 bool kmstest_mode_is_valid(const drmModeModeInfo *mode);
 drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
 drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);

-- 
2.52.0

