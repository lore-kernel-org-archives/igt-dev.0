Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0079C5B574
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 08:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61EF410EAC9;
	Tue, 11 Aug 2026 08:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YsTHvIba";
	dkim-atps=neutral
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A422D10E93D
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Aug 2026 17:00:32 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4953e04ef16so18827475e9.2
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Aug 2026 10:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786381231; x=1786986031; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=bBSIGkkyITXMJF/IzgXQOmkDY1W3N7M1eyq3mP4entc=;
 b=YsTHvIbaHhKv++ZEDxjbQIClproK8nUUJJNOto2WW6o2ikMQQUfZcT6Gg/BzYLxVfv
 IKCaxi9++BsKPVbnkfrpzYEQPW8Sr2tq7PBeOgJ0n0ZUxBaTgLWUUgQyn2YawBiIkxBQ
 OV1FwqSdrjxWnd4bKIG9VpNDPV49YZYrC6agyDo3VVOOyMB/dRptgUZXVrqZbZ+VlbcC
 zGyS3J9G0r6LO5vNqRVLo+GAFMzlK+SdDWY/m+yFvbRIta1SIxInuBJNfHcZ+4RmPfje
 0o3M03I5CZkIMAhmueCvKsGr+R3OqCHcPxlVZlKv9OdIICC/La7ojFIgmCkIMORxtwhH
 4vCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786381231; x=1786986031;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bBSIGkkyITXMJF/IzgXQOmkDY1W3N7M1eyq3mP4entc=;
 b=D3IXBgBMvzwIcg2bwQzhS62fzG7U9H5OMjHCgmxrLsfYk5pvnoKLXFX4ZcYyL1BZ33
 b8MoccZ+LIGyaosOFwEOv2HR5/sMO4VyIr5/jL9hejhdjjscNV25Cc4pa8/Kx5NET6JM
 SvzZlb2UA5+UV1rhOS8QiUTFG/w8wE0mdslBjLXHN+VcwGCPMfIVD8hJ9WQeaJrOR+lU
 MagKEZmya7/a/ey0GXu5CglzxHpfJYtgdeNvh6OiEeHujgFctP56BsPHGP26co6RNb3z
 6AwW8V2f7w9KgL+tWGrLtCP0b1JaFEWUHxfzKD8ZkwOB4g6Oly8KbWbOT5ad6VnL3Hfh
 Og3Q==
X-Gm-Message-State: AOJu0YwmZt+xv3qHhvmuvE+vSpwdnXo3GXeIh3SjSy8Jvjn0J8T6o0JQ
 /AawkrnMAVEtsfkhKudYMMjf/KorokdV1ZZ/6spp2v9jDi7PQSycAuDRsaaR9Nv2
X-Gm-Gg: AR+sD13CMrBU3X4VTBdyowhSGcIEjZ4L/AUTu99/QM7GqvXzadXGd/8VeyK8jF1gzv7
 jVzAuxohaaMVGxIKGTPkuprjd6UsAFccG+rTaIpDCwcqaU/mr3SkdiqJGFGzPQ8JigflG91jykl
 kIrXOqw3LghIH5PIvmIopVNa66J6KRcddzxy2rqsZIhuyMQF7Bl9T4gXjcOs66yY2ugino/IP3O
 7XdQ8ZsmtV4INqr9VdlLerI2+Vasa11AZLkQkonpKaKlCeX+cJztzFR2OSOu+8uUFOHoLeXCiTK
 oAjDygztVtIJeUQRewEVcuzQ03Pk5MugeZEYqfFnh4lRhMED4Jw/IkyxffBXqNoqGR6mzuU3kzz
 6kgmIrQf1aH1pWBVi+6HWk/4o58UP+gWnnDOkryXNJJl0e2aVOUmrwcEr93Xm71dTiANNfobEom
 xSzI2fag+7SUkEK2Qqpe7KNxWFnYAp20mZtuNNO16MgUJmqHm+lpsTY7LpLlB0xjBHSsMHsy2FG
 O5goFJ4t2Dh2oHzE60DTWUxYIbAeW3QhcS4qecKZA4=
X-Received: by 2002:a05:600c:3ba6:b0:495:779a:ed33 with SMTP id
 5b1f17b1804b1-49959e0c481mr391537155e9.7.1786381230835; 
 Mon, 10 Aug 2026 10:00:30 -0700 (PDT)
Received: from flumenarch.lan (83.10.193.118.ipv4.supernova.orange.pl.
 [83.10.193.118]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-480021e8b09sm40587325f8f.23.2026.08.10.10.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2026 10:00:28 -0700 (PDT)
From: Luka Mamrikishvili <lmamrikishvili01@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Luka Mamrikishvili <lmamrikishvili01@gmail.com>
Subject: [PATCH] tests/sw_sync: fix invalid fd test
Date: Mon, 10 Aug 2026 19:00:19 +0200
Message-ID: <20260810170019.479199-1-lmamrikishvili01@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 11 Aug 2026 08:02:24 +0000
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

The invalid file fd test overwrites the file descriptor returned by
mkstemp() with a DRM device file descriptor. As a result, it tests a
device fd twice instead of testing a regular file fd, and leaks both
the first device fd and temporary file fd.

Close the device fd after its test and retain the temporary file fd
for the file fd test.

Signed-off-by: Luka Mamrikishvili <lmamrikishvili01@gmail.com>
---
 tests/sw_sync.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/sw_sync.c b/tests/sw_sync.c
index 8012652d6..a75ec044b 100644
--- a/tests/sw_sync.c
+++ b/tests/sw_sync.c
@@ -334,6 +334,7 @@ static void test_sync_merge_invalid(void)
 	fence_invalid = drm_open_driver(DRIVER_ANY);
 	fence_merge = sync_fence_merge(in_fence, fence_invalid);
 	igt_assert_f(fence_merge < 0, "Verify invalid fd (device fd) handling");
+	close(fence_invalid);
 
 	fence_invalid = mkstemp(tmppath);
 	if (fence_invalid == -1) {
@@ -341,7 +342,6 @@ static void test_sync_merge_invalid(void)
 		goto out;
 	}
 	unlink(tmppath);
-	fence_invalid = drm_open_driver(DRIVER_ANY);
 	fence_merge = sync_fence_merge(in_fence, fence_invalid);
 	close(fence_invalid);
 	igt_assert_f(fence_merge < 0, "Verify invalid fd (file fd) handling");
-- 
2.55.0

