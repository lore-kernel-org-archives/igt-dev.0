Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABE3606A329
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 05:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MffwAaNi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D53410E114;
	Mon, 16 Nov 2026 05:23:15 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B9D10E3AA
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 22:29:14 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5383d650f2dso488371cf.0
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 14:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1794695353; x=1795300153;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:mime-version:date:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=honyIFoW8MifYP2EpWRhT8DiqJpVOD5FKTPE7ZpiK0Y=;
 b=MffwAaNiEX+EfhwGkdvWY8zKODOz8e61Ktegmuv0rfPHmjIlNoUehnIxeTqE3lAHxb
 ynjrsa8KrRdcE2qFzrXZQsrM3r9fwx6AmrIcSvf21+RFQNFp5Hu5NvAeL2ByZIKsWWlE
 PvGD487teeZ69pmiZyxo0o3E4P7vq+zMuihwmBcy+tPbklnvJz9AtmAfUqgAnL/vJ8dx
 QBos4ZMAHGS0iw/krd0P14Z/OSsgOV+bbkfsFQm6PNCgsnc1ib2U2hPSovCvHA5jnH2n
 7fLL0TzTeTqZZ55PKBe5bJy8b/T9kkk66EQpyzp7moNuG1IAEfUkkCNdJOTEc/mzSKGr
 a5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794695353; x=1795300153;
 h=content-type:cc:to:from:subject:message-id:mime-version:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=honyIFoW8MifYP2EpWRhT8DiqJpVOD5FKTPE7ZpiK0Y=;
 b=n0W3n0vNIqaxF1XCzweJu2MsEsBOEDn2XY9ftqRi8Ew7QJE3NmuKPUbI3Ui1VvzB+X
 ZmXz7qHZLWsxHjaEkwu2W9U3d1VNhKT4Pl1sYBT5xfz1BPRCNno5OzQMCOYTujzaAxKe
 NBug/YT8Y8JoKkU+luMlHzJSEeNb17yHDXFLeWgVY+hb+AnZM1HGrJqzp0KVQ/cgYBcA
 gZGBF9t2IAKwmOHNPDk1FmPbs9ordc/kNWZOGJa5J6A39OPwsCRjvxZAAk/5Rg9BCYS0
 L5j8VPyLgo0zYdGK3VRZV05M7lqr30pf9dfECBvJQ7JrjyMSk+gknH45yk/sY7MWZake
 Tc8Q==
X-Gm-Message-State: APuU4Z8J08Ochu/kU1v3mjOEN6Se9Cq+SNYNrdiW7g4CC4NcLHcxaucf
 xdWwe6VdrdWN5cXv+JtisURiCMUWMFZ9SE3NygLJvfTM93fBQIpLWlp1TxWA3b2+mbCqde40J/a
 QfuoZESeR/CNmUwVVd9V6auhw5NqHx7WMhB01LhW1QQSWZ2GnSzn8m+yYipwEzZV35hr+rTGrZd
 kTmlSyZLv2qqtK+rahySJaATPnuNqMNWcs0i5XG+pW/CTR4OMfCUBnOjEc
X-Received: from qtrb1.prod.google.com ([2002:ac8:7541:0:b0:535:d04c:ec22])
 (user=gildekel job=prod-delivery.src-stubby-dispatcher) by
 2002:ac8:5f47:0:b0:537:a19d:41e5 with SMTP id
 d75a77b69052e-55ac8576de7mr102393911cf.50.1794695352408; 
 Sat, 14 Nov 2026 14:29:12 -0800 (PST)
Date: Sat, 14 Nov 2026 17:29:08 -0500
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261114222911.1405626-1-gildekel@google.com>
Subject: [PATCH i-g-t 0/3] lib/igt_hdr: Find HDR in DisplayID EDIDs
From: Gil Dekel <gildekel@google.com>
To: igt-dev@lists.freedesktop.org
Cc: Gil Dekel <gildekel@google.com>, Swati Sharma <swati2.sharma@intel.com>, 
 Karthik B S <karthik.b.s@intel.com>, Mark Yacoub <markyacoub@google.com>
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

igt_is_panel_hdr() only looks in CTA-861 extensions. eDP panels that
describe HDR inside a DisplayID extension are therefore treated as SDR,
and kms_hdr runs invalid-hdr on them, which then fails. Patch 1 splits
the EDID parser out so it can be tested on the host, bounds it by the
blob size, and adds lib/tests/igt_hdr. Patch 2 also walks the CTA data
blocks inside DisplayID extensions. Patch 3 makes invalid-hdr read only
the kernel log written by its own commit.

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Mark Yacoub <markyacoub@google.com>

Gil Dekel (3):
  lib/igt_hdr: Add a testable igt_is_edid_hdr()
  lib/igt_hdr: Parse DisplayID CTA data blocks
  tests/kms_hdr: Use /dev/kmsg in invalid-hdr

 lib/igt_hdr.c         | 147 ++++++++++++++++++++++++++++++++----------
 lib/igt_hdr.h         |   1 +
 lib/tests/igt_hdr.c   | 136 ++++++++++++++++++++++++++++++++++++++
 lib/tests/meson.build |   1 +
 tests/kms_hdr.c       |  49 +++++++++++++-
 5 files changed, 300 insertions(+), 34 deletions(-)
 create mode 100644 lib/tests/igt_hdr.c

-- 
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics

