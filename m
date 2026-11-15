Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA65606A323
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 05:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bvUTnFzv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69E010E240;
	Mon, 16 Nov 2026 05:27:42 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE3510E8C7
 for <igt-dev@lists.freedesktop.org>; Sun, 15 Nov 2026 00:19:20 +0000 (UTC)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-53639e47be2so46374351cf.3
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 16:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1794701959; x=1795306759;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=t9gqeYaQ9W5i62Ypxpl3HBUReDFh4MZWNDA29EpFV+A=;
 b=bvUTnFzvAtrrvX+G6G9PoTzwFi0XtChyWS5bZ+GCQydJyIrOfIUx2xkLkcGnkeHfFM
 WRFG8KpJqznFBRntPF7qQf1VxcGySRY4mKfWNEW0aoiit9iQRe96g2yvOSN770RZkcHP
 C9a6iem/dhZegS7N6cl+jbyrUwAdlDT/mQL3VfbKT9GbIlY2UTkRrGDbU2YLjcXWO0mI
 DmdijMHSi4QMLRm9ZaxypLRqh7rUHI7UgJK9eNVdctVzFvcIEtw3MT/WK8KRFCAVuVUU
 qc9Dl+HU/eeC6NhjnVSuFczm0HXLiIzKbFm05Wv6RbZSBsERFKh2kUukWAvbELhACp4r
 sbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794701959; x=1795306759;
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=t9gqeYaQ9W5i62Ypxpl3HBUReDFh4MZWNDA29EpFV+A=;
 b=th/wbxd9ikhidqVSIvxB72S9T0mL5pluV4fpU1GJNWC7Ni3cg0K08NgPwcijLEIxvf
 MLSmkFQVHlEWW/eRQuqRLbmJDJC/JheeMQlLoAmvTwGTqBDyo0Pi0zegzkJRpPXwMu8X
 suozNvXnnCVe0y4s2OyZuv9whvXoz+KZP+KC5kQBnNImprL0XY4jkMFGv92ikJmJLr+/
 KvNp9HqTrJziEG9JOgGZNbdqjrCn4kXDeyfo4zruzTprrRM8ppj3a3puA4O6o7KcwCxg
 nBZkNnFpPhyVZpk5jVHZVLF1z/Sb9ntYEncVpaOTRSfiK7CXIjIYTDQm0Ck2lJE2T2yB
 u+8A==
X-Gm-Message-State: APuU4Z8TAe1bB6FJUKwsRNPGgJadK6TglSbivknmClq6WrQMekMK9slW
 g7i7bGZPkzyR6XFehOJZloGnQSitIjf6a0b+ww6u2wnM6B/u2GHxrcTYDwGl0dgqpYe+7R0rL/6
 uHsC2bChh6aVjTRcLKsyKd2G0ZigPHhF+/uaO3QhRJynjRBxsRXmjCRZwThR+czF06l9Zu6QHGy
 YvxZtvSJCyCjbmGSX09Li5Eto47jRMxJRLMK24GHcv5USZilyvGxP0nZMh
X-Received: from qvar3-n2.prod.google.com
 ([2002:a0c:f143:0:20b0:91c:8e99:6dd5])
 (user=gildekel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:138a:b0:535:a5fb:67f6 with SMTP id
 d75a77b69052e-55ac9a6c6c7mr111855871cf.66.1794701958768; 
 Sat, 14 Nov 2026 16:19:18 -0800 (PST)
Date: Sat, 14 Nov 2026 19:19:01 -0500
In-Reply-To: <20261114222911.1405626-1-gildekel@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261114222911.1405626-1-gildekel@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261115001917.2933254-1-gildekel@google.com>
Subject: [PATCH i-g-t v2 0/3] lib/igt_hdr: Find HDR in DisplayID EDIDs
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

v2:
- Apologies for the v1 bloat from agent-assisted drafting; replace the
  raw panel EDID dump in Patch 2/3 with a synthetic
  make_displayid_cta_edid() helper.

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Mark Yacoub <markyacoub@google.com>

Gil Dekel (3):
  lib/igt_hdr: Add a testable igt_is_edid_hdr()
  lib/igt_hdr: Parse DisplayID CTA data blocks
  tests/kms_hdr: Use /dev/kmsg in invalid-hdr

 lib/igt_hdr.c         | 146 ++++++++++++++++++++++++++++++++----------
 lib/igt_hdr.h         |   1 +
 lib/tests/igt_hdr.c   | 100 +++++++++++++++++++++++++++++
 lib/tests/meson.build |   1 +
 tests/kms_hdr.c       |  49 +++++++++++++-
 5 files changed, 263 insertions(+), 34 deletions(-)
 create mode 100644 lib/tests/igt_hdr.c

-- 
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics

