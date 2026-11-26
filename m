Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0664606A321
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 08:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mBp7LhQg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3971810E55B;
	Thu, 26 Nov 2026 08:52:34 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB7610E082
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 03:04:29 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-cd61cef87f1so3009510a12.0
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 19:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795662269; x=1796267069; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=k0d5pYNf/oH31hbc5DAwZ2y7lvx9jHsf/xXMKNjjrew=;
 b=mBp7LhQg64xVd2IIkPmelQfjBiwN7OFHy4Qp6bLemQcAJYXgHc8Fpu9sxxvifvs/fz
 5no7rrZ8oMYJnDMjS1DDQ3MYD2g9CXEKmXVZzhX8vDjalC3ZCaRM5M37Uu7wPsJHikd2
 hJRCgHR0ClnA3CqBHI7ubqzmSOrRNm/cfo2y6l9Rxc6yYwhBNcZFBavfJ6IEFquATcEi
 REitD32jhYKor8xtKGIDo4fCJT8MJNoxceM3nXQnEOVkvBXXsUNWOsumpuQFIca7Mzcr
 ZddnmybWKyDU8OACE8tm9AP2+fLeXM52cqZCn4qaKCJc8JkCB0PFl2/lgIvxaSxOBgmT
 q36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795662269; x=1796267069;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=k0d5pYNf/oH31hbc5DAwZ2y7lvx9jHsf/xXMKNjjrew=;
 b=TX5kwOr6D5PKPX3ACC9D+41S2jv6mXttpzgQv1fFzYcZ9gp1Ho3lLCJzN1Zw2z/YTX
 7pxDzX69sSwcBKUPDwcPLj0F2LVF40qtqFPokE6TxVa0c41eaJ54EB9R0KdQ2M2Gikus
 YGb9ca3MvbzXMBWn6Atn7ykSRFpk8WbJMS2Qsu79wL5bpcDTY/L2D33aOXCi/EOmHEA6
 lCXvjVPs6FaUfpdOwSg8k3UqthQfBkYRaZ4qquiH1H2FGjjEVMz3idl8hK9iRMCqQ4aG
 eySvypWR9fp6hM6CcI/fk9orBs64t5bTiis4FpFAlzBT3Ip5vvlm51hxu6Wp45VOkS5p
 ydGQ==
X-Gm-Message-State: APuU4Z/nAFU+6z/u2amtXaDxyZPmoKf8jgyv/NQDCLL0UcEflDFYjl2j
 sJpQAE1+LJWkuOuCanQ//xzW+XYr6VNT3hEwH5niBuwZXYyf+D7yTfbOdqooWOQs
X-Gm-Gg: AZFdTZfu1qoHkk0aaoEWt0C6HGYr4JubpkxZVsZ2ZWwxXJiTk/makma4jMPZADGGQaU
 hfbOLNm5Zv7+D7ztvQwIc0kd2tSq55hZ4pRBeI+01kQqBj8uQIPDd+9Hv+p8DKBQXRoFyNSGfMD
 WC64UdfYKpC3OdpywaefiDiDaeN9TusTrV4MeIwF9rL7KFeKKGFtkRM9TTxsIVCbt0ZBq0EE0AR
 XBB/3pBrGPDRZPF7jj9S4hh0Li+HpjKMliBUSyUBYv3qhDGq8N/zRSaoWn1zUvLrutym0wP1/01
 cE1Yz3tZkbL3myP7oGv3jcJiF0opM1p+Kxckf/L7DY6q7VIm8W0pdWzxxOcwo/0HC8oFVJjjCFd
 sDs8M80dv6aJEMWqKoujoc/blLmpj/dvEsyln30iKtT40ofml/r6Nu9xVmr+Kugf3BbtcrbUqxY
 ERYqFeepDd2FbKs2iS8Yw8/PUm+N9IRYJ/OSwLuBalGIyMANTdjVxBxfnr5ggNtVbJdh/o2pzQR
 aoWNsUpKEHyewWizdgRTqQqRTo9A7jzieYJUq6dfCOUqjLsUd39dQTLL5M9h9kK3ashqK57mAq7
 rw8d3TeUyAc6biFTxdrkTZNXNwMGDl7Qo9JP0tgzotc27+mXwyJZiZATyJzM6TFCEZXv1GVPATL
 biYzVh0kcfw==
X-Received: by 2002:a17:90b:2b50:b0:3b4:c66d:262e with SMTP id
 98e67ed59e1d1-3b4c66d27a6mr7107149a91.64.1795662268610; 
 Wed, 25 Nov 2026 19:04:28 -0800 (PST)
Received: from DESKTOP-TPPBPA1 (36-226-201-204.dynamic-ip.hinet.net.
 [36.226.201.204]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cde6cea7c29sm9780647a12.1.2026.11.25.19.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 19:04:28 -0800 (PST)
From: Roy <rongh7426@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Roy <rongh7426@gmail.com>
Subject: [PATCH i-g-t] tests/kms_lease: Drain late lease uevents before
 lease-uevent
Date: Thu, 26 Nov 2026 11:04:24 +0800
Message-ID: <20261126030425.641533-1-rongh7426@gmail.com>
X-Mailer: git-send-email 2.51.1.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 26 Nov 2026 08:45:46 +0000
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

lease-uevent flushes the uevent monitor and then asserts that creating
a lease does not send a lease uevent. The monitor from
igt_watch_uevents() listens for events after udevd has processed them,
so a lease uevent from the previous subtest can still be on its way
through udevd when the flush runs, and it then shows up as a lease
change for the new lease.

This happens every time on a Raspberry Pi 5 (vc4) when
implicit-plane-lease runs right before lease-uevent, as it does in a
full kms_lease run. The kernel uevents from implicit-plane-lease closing
its leases come 0.15 ms before lease-uevent starts, and udevd passes
them on 1-3 ms later:

  Starting subtest: lease-uevent
  (kms_lease) CRITICAL: Failed assertion: !igt_lease_change_detected(uevent_monitor, 1)
  Subtest lease-uevent: FAIL

lease-uevent passes when it runs on its own, or with a 200 ms sleep
before the flush.

Instead of flushing, consume events until no lease uevent arrives for a
second. The subtest takes one second longer.

Tested on a Raspberry Pi 5 (Raspberry Pi OS kernel 6.18.39):
- implicit-plane-lease followed by lease-uevent: 3/3 FAIL before,
  5/5 pass after
- full kms_lease run: 1 failure before, all 21 subtests pass after

This change and its description were written with the help of an AI
coding assistant (Claude); the test runs above were done on real
hardware.

Signed-off-by: Roy <rongh7426@gmail.com>
---
 tests/kms_lease.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 4e9a69d..8e2b821 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -1215,7 +1215,13 @@ static void lease_uevent(data_t *data)
 
 	uevent_monitor = igt_watch_uevents();
 
-	igt_flush_uevents(uevent_monitor);
+	/*
+	 * The monitor sees events after udevd has processed them, so lease
+	 * events from an earlier subtest can still arrive after a flush.
+	 * Wait until no lease event comes in for a second.
+	 */
+	while (igt_lease_change_detected(uevent_monitor, 1))
+		;
 
 	lease_fd = create_simple_lease(data->master.fd, data);
 
-- 
2.51.1.windows.1

