Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2E9606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 05:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RbhlNgn0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12C810E009;
	Mon, 16 Nov 2026 05:22:22 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A7310E027
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 22:29:06 +0000 (UTC)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-55d2c5f10ddso8573111cf.0
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 14:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1794695345; x=1795300145;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:mime-version:date:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ukCJS5Rpy8S+pdkFLRO93CxP9JlBgrgii0jaQRv/9fA=;
 b=RbhlNgn0ipmK+x2LYXs1hCz6vyUNq57ywGbBOBjchbFGmm3WgDmTTMBUzbCyvo2Ufn
 5aG3MUudPuUedFd5FwhIJIX8F0izu3k2AZGTz1Iwi81yP0V8k/5e1Ju4AYERjiz9F1od
 /5ruGkFdg13i3CdWwIavcaQ0uTmTwWHjL1N2cmKvrlyJVe9DTSiWYCDxfXAbIvEW7cQD
 eD1zXfpEXbZVe4kmPVjKiWW7vvJu+EQYYEEXyEMBhofDj97iCZ9YM51QkueOYUG8oQNm
 0QvFnwouAANZOhyrghDY3hkxO+l6OCm23/dUJSHY2JKngBRm4Gp+0xEBacDAJ6pk3GmO
 twag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794695345; x=1795300145;
 h=content-type:cc:to:from:subject:message-id:mime-version:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ukCJS5Rpy8S+pdkFLRO93CxP9JlBgrgii0jaQRv/9fA=;
 b=gVtKFHU0IkuRlfFanryGijVfE/CVyDg9Q8DXpcHeXHBeepGta3dWoUXeigOTnrTRVI
 nHrNZRB29oY0OE14TqOwbQ9Ts7/yJzpzbEbXRMUakISGjcYUBnWqbgMvPjy+rWyxcfYF
 NN4MpldnNO46oO1Y8UJ6kjkYchLV+IaRcCVheepKYrak/3XfWrORzAAH0z1eFKLgX/Oz
 YfmWmxEnRB5RetxXwI9zeLPfwpxUuS5QsG7IjQ3oVtzB4uNX7sEUGlibblgzpC+YZyMF
 V+mvh33LFxHwi5eEeTLnBcvkjGKHhvvf4uBlwV1Aj3iF/QEpGMcltP2HQKL4l+hUoaeh
 acng==
X-Gm-Message-State: APuU4Z9Eb0eHDaYbujmNBXXac719eFLAGYCnawTV1nYxkljddBh19Xte
 nq0Ie2eSU0Ju29Ze7JctgQ5rd1TwxJD51KkeuFeZgIteSOblC1QPxek5kcUeviBjvgdwni+Ietb
 Y7/eksf8pAHnTJaQDbzZTS9j10NJBUugMUPUZOUnNsuvWnJhu7HFrsccyFBTguZSohKFLXsC7Pr
 cvgM32L2m8j2HbsySFOj1iQLoJ6N8RqJEXSSWRyXyLqhq/GvbN+x1RdDZE
X-Received: from qvblx3.prod.google.com ([2002:a05:6214:5f03:b0:91f:2f1d:db07])
 (user=gildekel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:514b:b0:55c:8389:57f3 with SMTP id
 d75a77b69052e-55c83895b79mr43986161cf.49.1794695343560; 
 Sat, 14 Nov 2026 14:29:03 -0800 (PST)
Date: Sat, 14 Nov 2026 17:29:00 -0500
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261114222902.1404033-1-gildekel@google.com>
Subject: [PATCH i-g-t 0/2] lib/igt_kms: Reset leftover KMS color state
From: Gil Dekel <gildekel@google.com>
To: igt-dev@lists.freedesktop.org
Cc: Gil Dekel <gildekel@google.com>, Melissa Wen <mwen@igalia.com>, 
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, 
 Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 16 Nov 2026 05:17:02 +0000
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
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A KMS client that exits without cleaning up can leave plane color
pipelines and connector colorimetry set, and IGT inherits that state
without always being able to see it. Patch 1 resets COLOR_PIPELINE to
Bypass even for tests that never enable the color pipeline client cap.
Patch 2 resets the connector Colorspace property to Default.

Cc: Melissa Wen <mwen@igalia.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Mark Yacoub <markyacoub@google.com>

Gil Dekel (2):
  lib/igt_kms: Reset leftover COLOR_PIPELINE
  lib/igt_kms: Reset connector Colorspace

 lib/igt_kms.c | 126 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |   1 +
 2 files changed, 127 insertions(+)

-- 
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics

