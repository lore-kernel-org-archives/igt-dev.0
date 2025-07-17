Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32041C83F34
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 18:46:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDBB10E899;
	Thu, 17 Jul 2025 18:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="AFc8uKhq";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B10B10E883
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 18:46:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD74B442B0;
 Thu, 17 Jul 2025 18:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752778007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hE0wiLVzSD5T+ZVEmvzxgXT8O8EnjnL9OL3V2rIA4Gk=;
 b=AFc8uKhqYzsx9HC4KckFQgJXpyjhi7fse5saNCSqFqRyM8oIONM7foHNGrOHSi4pmIyqKD
 nyc7XTPUYD6Hhg6dTY1xzMEUNBpOJc84eQieNBh66DWqmZym7LRFYBeCYyXdYRBUSo+9ZT
 rLuJd4ESJCB3kFMIRNvVVN6JE0d17RR4g+hbv00WeZPKrQ/LxJwZyGeFZ6au1qQblaqiSn
 rjv34ESDFSwHPH1p3hWOWIQdl4F8UlaLW/it1oSnFtqi+DiYenLZXlYKpqXRPf05akHcfk
 7dEeqO+ak3So4TP2RswchjWIQEzbUU1ieukEE2MKRXaw6Dtnbv08y6pKD0Op1A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 17 Jul 2025 20:46:46 +0200
Subject: [PATCH i-g-t v2 26/26] lib/igt_pipe_crc: Add ungiraf crc calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250717-unigraf-integration-v2-26-77dc329e584c@bootlin.com>
References: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
In-Reply-To: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, mark.yacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1515;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=101SeUpaycFUy8V6yM2FTMKQqjrsf400qp5UEZU3ucg=;
 b=kA0DAAgBIK0uxlsQLOIByyZiAGh5RQ+hpAMBKJfAQyOJMqtmtBcm2qW6BZ1zDqVmpFO9FeeuX
 YkCMwQAAQgAHRYhBE+PuD++eDwxDFBZBCCtLsZbECziBQJoeUUPAAoJECCtLsZbECziNrUP/2R8
 CWkR5YU3Dx5+x4Bn+JWaB9MaCeDq6C9dWWxKLC5aZUZbVs79TC5naAU1CjOQDifKOjFEeZf2n/N
 YewIfV6cqa1jLfKqXBIPOcbDSRui3ONXjLaRVF7ths+4alniKv4w27m7lopPyzGXkzcqvO3cz/a
 Ezya5AGr1CLDyECRQdUr4b9BQ0fnedMoURwl1VKAc6RUL3Ta5ilMbI+cJdRLqoYDsPrUbQVakrZ
 lC1NScqZgJmD7f8cxkjj2Bsth7G9D+LCdcbptOpZ3NwX0mNaIkV5rr1dGqQ21Vvyjvu1VGd7DVR
 moQusMBRmgCbp1CjOi+YI0fTzhTiq1FP/PrDbWq1boSNUWbVXDvlytpsGk+j+KsRr4HGvtV0K8m
 kj6KPDWTHVQog+jBeCw5R7y7X+p6oS6MMoD3TGYx83NZPcPdOXcNMvh7ve426EEv7/fgR7ZjrfA
 71GvDqTuVWc1cTJxdxyuUXJavu7KNK2nKiKhSjAwiuGq68wbPSlJuOTYnRfrkVuPtiYYE8Zr5fz
 x3F2gu2PJ26dAOd3CcTHjo8voHh1JWsm16O02cqe97paMFdvNaNSbk2onN6y1wQ49qIZ+3FGdb8
 BlZt9WanByGvFFxqr1xcuqsgP/W4t2HbrlwHKXYCqesFk7faGJrckcpAaF5y+b7qva4pOR2cD1E
 KxSub
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeiudefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtieevieduhedttdfgtefhuddufeffudetkeegveeuteduveehheeivedttddtkeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrieejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepihhgthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrhhkrdihrggtohhusgesghhoohhglhgvrdgtohhm
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

Unigraf can read crc from the physical output, use this CRC instead of
internal CRC when configured. This allows to also test the hardware signal
generation.

This small addition allows to use the unigraf device for most of the
kms_* tests.
---
 lib/igt_pipe_crc.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/lib/igt_pipe_crc.c b/lib/igt_pipe_crc.c
index 866bf2881cbd04df0ae0cc8fe91fe0626367144f..76244d00934ea09fd79cfd23734196f11eee1e1a 100644
--- a/lib/igt_pipe_crc.c
+++ b/lib/igt_pipe_crc.c
@@ -3,6 +3,8 @@
  * Copyright © 2013 Intel Corporation
  */
 
+#include "igt_core.h"
+#include "unigraf/unigraf.h"
 #include <inttypes.h>
 #include <sys/stat.h>
 #include <sys/mount.h>
@@ -348,6 +350,17 @@ static int read_crc(igt_pipe_crc_t *pipe_crc, igt_crc_t *out)
 	return bytes_read;
 }
 
+#if HAVE_UNIGRAF
+static int read_crc_unigraf(igt_pipe_crc_t *pipe_crc, igt_crc_t *out)
+{
+	unigraf_read_crc(out);
+
+	out->has_valid_frame = true;
+
+	return out->n_words;
+}
+#endif
+
 static void read_one_crc(igt_pipe_crc_t *pipe_crc, igt_crc_t *out)
 {
 	int ret;
@@ -359,6 +372,15 @@ static void read_one_crc(igt_pipe_crc_t *pipe_crc, igt_crc_t *out)
 	} while (ret == -EINTR);
 
 	fcntl(pipe_crc->crc_fd, F_SETFL, pipe_crc->flags);
+	printf("crc: 0x%x\n", out->crc[0]);
+
+#if HAVE_UNIGRAF
+	if (unigraf_open_device() && unigraf_use_crc()) {
+		read_crc_unigraf(pipe_crc, out);
+
+		return;
+	}
+#endif
 }
 
 /**

-- 
2.50.0

