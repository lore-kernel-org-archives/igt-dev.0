Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DB3CAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 16:02:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FED10E190;
	Wed,  8 Oct 2025 16:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="RBi+UeYR";
	dkim-atps=neutral
Received: from mail-qt1-f202.google.com (mail-qt1-f202.google.com
 [209.85.160.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F27110E190
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 16:02:14 +0000 (UTC)
Received: by mail-qt1-f202.google.com with SMTP id
 d75a77b69052e-4d77ae03937so208836781cf.3
 for <igt-dev@lists.freedesktop.org>; Wed, 08 Oct 2025 09:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759939333; x=1760544133;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pDXPI6hEWS2DdTIWRJzMgAwufkW7KPObjOi5XtFq2qE=;
 b=RBi+UeYRveUh9C4/5NWhx7e6mBTOI8YhdALlPVYktapKtDinrs0IvGNvXxR1jAl3QR
 RUmnDPOJWcVUuIb0t5xyyIheyvgJNrLNoMtoiWBIqS6MoPP4VtlIGJ2x8dqmQhyq38KS
 kf+gFo5S7tN6ms2VgxRrVWsSck8DzhIoaXdSqge2xtA/usRfRoLXHp3nvT2lZ1+cMKrU
 4SgxZeMcbLSHi+zmqNVwZw14VtkntC65B2PD3+CbmAvO9qs3Y5gLbnebjQlupNqE8/1n
 aCcsV3ZyQEMuOhTd4PLJhdrwH+oagDLAy2iX+EB3dTo6wgCLXnnGamwp5z3Bjd0IPG83
 lrsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759939333; x=1760544133;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pDXPI6hEWS2DdTIWRJzMgAwufkW7KPObjOi5XtFq2qE=;
 b=ZvYigAP9eyG2McJmKPm/5d4sYG7Ab3yTzlpRXYLk4CUJZjajA+xd4oYGUc3XG8wpyU
 vDUtm3isGzmUgOPJJHGjuxBSDBuGW4jSvWgy46d+HnLPm4OJ+k6S8/BIf8TH17akgX5L
 nPRhbX+qhvpArSKmtd1sZeF5wZmcMxyHM16DXuwIKDY7oIMj6NixVTSVITRF+rZybSM5
 ugVhFx7ks6fC2AGsaOJyG6Nds/o9wwxYHSbRjMuHnCw/HIvKT5/I27kfoiASsdoDDiWE
 yWDxvrAjbg01DucuAGzrbUI7HZAgWaexOcUqT1bHnYIQuDuvchdEFHEeaxB1y9LR+PCa
 5sYg==
X-Gm-Message-State: AOJu0YzuckKA8lZKS386vAP/4a2wXiRHexT+p8MIS6LUIfuuB5KvkjKw
 J5vn2wZYlU/DFEhKr+cAq56HwYjyEiiAgFmVduq74m+1/jZ79nTAkFyw1HCHzCrPzm53gBXR7cM
 jFL8332+Fz8Mk3JTDLBjIYTKcE2LivV47XRbY9fdQGtiEy5vUL0vHqwM3NSNdUjqv6Z6JcEHlVS
 13ZTaZ+XGcSAO40hC//GaIfwyu//7Z3ffbISvl4+fekYnU4bOdYXXUI/DuKF0rOp7wY68=
X-Google-Smtp-Source: AGHT+IGUnczh7ifRAMoebhLljPRHiXMre/XaJeEtVeE8uhk6KPKnc7SCUxDr5WJ5S2EWu0/uwnVp87KrTg4dsSit
X-Received: from qtbc7.prod.google.com ([2002:a05:622a:587:b0:4b5:ffbe:2eff])
 (user=markyacoub job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:988:b0:4dc:4828:b7a6 with SMTP id
 d75a77b69052e-4e6ead85a00mr57970761cf.59.1759939333037; 
 Wed, 08 Oct 2025 09:02:13 -0700 (PDT)
Date: Wed,  8 Oct 2025 12:02:09 -0400
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.740.g6adb054d12-goog
Message-ID: <20251008160209.463702-1-markyacoub@google.com>
Subject: [PATCH i-g-t] lib/drmtest: Remove VKMS from Exclusion list
From: Mark Yacoub <markyacoub@google.com>
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com
Cc: louis.chauvet@bootlin.com, juhapekka.heikkila@gmail.com, 
 Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="UTF-8"
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

[Why]
VKMS (Virtual VKMS) is typically running on a virtual machine where it's
expected to be without a contention with a hardware driver.
When it's there, we would like to run IGT on it.

[How]
Delete VKMS from DRIVER_ANY's exclusion list to allow IGT to be picked
up.

Tested: Ran kms_bw on Android's VM with VKMS enabled.

Change-Id: Ib13ad9261b8c2617370c02d0ffb5aa878bf3d8f8
Signed-off-by: Mark Yacoub <markyacoub@google.com>
---
 lib/drmtest.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/lib/drmtest.h b/lib/drmtest.h
index 8416aa491..ab991da57 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -63,10 +63,8 @@ int __get_drm_device_name(int fd, char *name, int name_size);
  * on a system with them as well as a supported driver, you can end up
  * with a near-100% skip rate if you don't explicitly specify the device,
  * depending on device-load ordering.
- *
- * Exclude VKMS to prefer hardware drivers.
  */
-#define DRIVER_ANY	~(DRIVER_VGEM | DRIVER_VKMS | DRIVER_VIRTIO)
+#define DRIVER_ANY	~(DRIVER_VGEM | DRIVER_VIRTIO)
 
 /*
  * Compile friendly enum for i915/xe.
-- 
2.51.0.740.g6adb054d12-goog

