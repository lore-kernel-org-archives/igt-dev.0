Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C881C87FC6
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 18:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024D410E896;
	Thu, 17 Jul 2025 18:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RMEaG9Ow";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F7510E883
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 18:46:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27BA2442B0;
 Thu, 17 Jul 2025 18:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752778003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e1ZAhcsJklpMg1/wlC5uffunuiVd7V13+TPYnoSfsvs=;
 b=RMEaG9Owcom4JVP0DXzwrToZfv+sVpGgZZrp2lRYBp80520jNIrldePKU3Zxpz4ryGUgoP
 HU5CkymC7xeUnSF6KbPbrqxyRrZ9kHBgQMbS6pMbxLwmlx1p1/yZWEzdmOLzHFHI+rTwH3
 YmIbjH0ePPiumVTW4tCaF0spp3qJ8qs77sK5+O4FJGHVHhZb33vGQt9DldVqxw7JrEPcea
 BSJPhj88kuBdRm0M3oEcKG2ijiEHJ05Yv7a9FjsHx5esZfOqeus7a+9T4/tEcfBY4pnJ1W
 34kz9VtHwSLJRbH5ntwsLdBH3EnesT4QGpEWTJ/rm+pdudsyxF1frcmG7bREew==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 17 Jul 2025 20:46:32 +0200
Subject: [PATCH i-g-t v2 12/26] lib/igt_kms: Automatically connect unigraf
 on display require
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-unigraf-integration-v2-12-77dc329e584c@bootlin.com>
References: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
In-Reply-To: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, mark.yacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=687;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=t84DjfYhWVLFtIrm1rbfGvnWU49O42H7tuHj1MjmbXk=;
 b=kA0DAAgBIK0uxlsQLOIByyZiAGh5RQrI1jfCJxv9Jqj9z9bandMjN9Xcg13EpkaGEV638hXCp
 okCMwQAAQgAHRYhBE+PuD++eDwxDFBZBCCtLsZbECziBQJoeUUKAAoJECCtLsZbECziUq8QAM7P
 WkGrXbay1LHn6o8tPyEwEMIaO2OxF+p6gbpRiU/UVbKGEK9jfchKCVV108/Tr5Qz+AMh7jlUlNb
 ArqN4jT1ob5IeU44R9pJGc6rZ7Z/KPvJlgraWla3w4g2EV4QmWhKeDw/yTvVW0W1wAAxe65Nh0u
 cQgKF++PIXA3HRyrzwamkLlS3hzg98FcHw4ZL+ACJ5yzchEMMKIs9RjU3OQWAPqsztRNs4j8e78
 v4mjsxc+1dEcG6fTSV0c7TSkYQKvR1u/boMxlvaMbCBR8J/O8ifMZaUeHIalf67r8GlomJnbaWx
 7FtzfTfPDOz7ANSh/IULK6yEu4nFvo6guYf+Cymh6rx0Zmnmhk3kj4HqKK6C0RDhNI/B6j5hI35
 ed5CzTwA2f6XbEcamdmUPzLhml//VdO2FkVHwDnnKgpno8S1sP5PHDYl7+Gm97bYIDmSSZ83xHI
 zFlTZ1ZNmqqm/uq/Ec+t80J1bZS6PXGFwIMvfgou9ZR0/Wi3+NG7kFS3W3FVEb8OFTgKk3w126V
 JuEvqyCuilaubf67+wgAB6fezlcoi7ZMRYuM8IxLBUFJQk+l1kz2/RSeII2SUpJrEwBmUnZLhk0
 oMZTW1hP08IxLzXAk7d1GN0M282WQbPhxdHG4Bq8J03ZPerpvDpp6krCedrPj4UAEMDfct6O5OS
 7qt+6
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

As Unigraf can emualte a display, automatically connect it for all
devices. If a test is already using unigraf, this have no effect.
---
 lib/igt_kms.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c79f9b946ca84c7c374ca514c05def2c34f81383..95ad7885a7dc284031e2f0fda2b0655474f295d2 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2926,6 +2926,12 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	int i;
 	bool is_intel_dev;
 
+#ifdef HAVE_UNIGRAF
+	if (unigraf_open_device()) {
+		sleep(1);
+	}
+#endif
+
 	memset(display, 0, sizeof(igt_display_t));
 
 	LOG_INDENT(display, "init");

-- 
2.50.0

