Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D8B606A33F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 05:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AIPGa/yf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6FD10E114;
	Mon, 16 Nov 2026 05:25:55 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D7510E290
 for <igt-dev@lists.freedesktop.org>; Sun, 15 Nov 2026 00:18:58 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93909014c85so15060085a.0
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 16:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1794701937; x=1795306737;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=h0a/xYz4ZSynBVjUq3nHGVkLcAIMsTQVAe6vTitm4E8=;
 b=AIPGa/yfGXjG1q/Z25hEdACbWoqtXMtrUK8hv7Aoz5jivMFjMRLj4t8jY2lNVv6wZ4
 KBJpHlqUhu0Fv5xtIBQPYWEzIrx6pBZQLhXYRLMOmbKEjtp2TV3pGEtIaYdaGeNow6W5
 31oKH51ORd2FhSzkPzs4NduVSQqdA4ql+VTf+KGH9+epMv2az88ZQ19zRkjLGmxXW+Xk
 /X/RioCFvPmBMC4RfY57VnHZ9KM/t7A/j1MMeL1bpAz3WodsvRtPN0FO/oKAUhZTEVjZ
 DuID4iafHz4zQZ1YSaHChfRRxFIQvyTzHNJtbGxAxhFe0KFqjxaCb9A+lucjw+dzbRW+
 q1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794701937; x=1795306737;
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=h0a/xYz4ZSynBVjUq3nHGVkLcAIMsTQVAe6vTitm4E8=;
 b=cnMHVCesdKmbZgWqJYPjY6oY+IOyqJsx3aLkMKT4xm+NfkIKw7bA/eJ7ZKo4XWMiHD
 +7x1xXYvSH9so0TNDraGyKzWYLN83z31cSC6ngJqUSr/uMaK3izxkh1g5h2KVTi7BnDf
 BXxQbRQ5mugmuxc5c6C6udLkLjF1kPz5Lb06dnbZRrlgHmGQqPMJzREt3SNrCcOrehAX
 dVpouJn51CaRHVJR2c9MponXtbJ4pxs2wb6k2cMtXtlzy1aJzTW3QTgvTdWxWzgVWWfY
 K1z9MLGOorZsN4/mleev/dk/qE9hvJizxJuy4PzjXDwSvFZyU1hyhdHcMLvuY82xNXKe
 wAMQ==
X-Gm-Message-State: APuU4Z+jSv9bAkhCEOxb23T39CIizz+FyYZ4M/ulDT94y4FzBV/4nPJt
 OzF4pk7bxHZUQBWhSX6XY1r3H1cV4ir5UTA4Xd8cCb0a/7dAteSAjPOXjX0AXEvj94hka0OCRei
 lAW6ZnrZlSprPd1wIj5zQW251Y+eWZydgYq2dQ7UqW6JQvfh36/JklwEXKHV8hlNkBSPvJ2mUDD
 kUER2/Qpj+8v4W24CX3yF0XpxO35uNsT4hl7N8zCQi1rW4zJUQx4ICJUNx
X-Received: from qkip25.prod.google.com ([2002:a05:620a:22f9:b0:93e:606f:e8f3])
 (user=gildekel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:2985:b0:945:d1b3:f047 with SMTP id
 af79cd13be357-9494bc18be5mr1089456685a.37.1794701936721; 
 Sat, 14 Nov 2026 16:18:56 -0800 (PST)
Date: Sat, 14 Nov 2026 19:18:53 -0500
In-Reply-To: <20261114222902.1404033-1-gildekel@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261114222902.1404033-1-gildekel@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261115001855.2931860-1-gildekel@google.com>
Subject: [PATCH i-g-t v2 0/2] lib/igt_kms: Reset leftover color state
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

v2:
- Apologies for the over-engineered v1 bloat from agent-assisted
  drafting; reuse plane_resources from igt_display_require() and build
  one drmModeAtomicReq inline in Patch 1/2 without temporary arrays.

Cc: Melissa Wen <mwen@igalia.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Mark Yacoub <markyacoub@google.com>

Gil Dekel (2):
  lib/igt_kms: Reset leftover COLOR_PIPELINE
  lib/igt_kms: Reset connector Colorspace

 lib/igt_kms.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 75 insertions(+)

-- 
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics

