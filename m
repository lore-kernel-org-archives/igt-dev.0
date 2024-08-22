Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86559C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 11:19:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDC710E057;
	Thu, 22 Aug 2024 11:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gPjnam1j";
	dkim-atps=neutral
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F14B10E057
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 11:19:11 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1fec34f94abso6360335ad.2
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 04:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724325551; x=1724930351; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OLBw0Fa0MYhQ81hibfUW9et301ASbnNSAxK5Xnyewxk=;
 b=gPjnam1jSVa5cmjhSzHpsNPUjZa4HsJ9+N/rwhYGFDZDaci3altyMLAXDTE3Int34+
 v9M9zmYvfNke9JXF8VGrtaJqaiecXARDi8CO7RedoE4iJvEhK8fiSZDlP2zLGkWZE45f
 s7QOZ4pNlCTZz6w3sN9gsO6XVEfOGEPuHm8js6f1WF+EO0zCrTCbrWSCgmmHl4FXZTM3
 kHXbWqyZt/TYhBAKUWYGF/dbfoaFMNOtKe4XWsH+VvMXbv+f5Q9/7AUdWjgLCsXpBitl
 kvG1TzzchJkOjj8rQMfMK/QaJGWjT8C3UdV19c3lqGxxjF4+vC5iRQ1eQq0nlkglmOxv
 mnrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724325551; x=1724930351;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OLBw0Fa0MYhQ81hibfUW9et301ASbnNSAxK5Xnyewxk=;
 b=swVK4yR7VLKAUaw3r0H15nyuAnn2PL9Fn0vUs6+9WRcwy703mxNh7wyjY62A3vjQnc
 prCmLa3hhMgaUbqy87iEFfkKR+/8hZMI7hg+v20S/bMH94S5dtz0rRsaXVrTbNV/tGZz
 ECDILLqmzBGir30+WBOirdrcf9QIY39XkUZlJsECOPUKNMo/pznUPXtsM2r1H+RuUsHx
 E3UMmzWuClyGOkiJG4PJNrAvpuuMsFKQnj58zZilaEcOzLdZbJ8kgwUX/mp0KfNHFy7A
 da1j5HqMp0/RU5CynlX/2mzR2WzeUbfyuQq485QPKSXqGRHheBiwrJFRH6ZjQnqdS2L8
 NHOw==
X-Gm-Message-State: AOJu0YxfTnBdjckVZQwJk5lyGy+oaJAYN57nmLOhKl4+TQ/Ai/RYO//d
 hPfXKOatb5Mz9IV07ciS6+D5zc2BiSW+JR6lWPR9mixGrn8ModLb4Yp4MYaTT74=
X-Google-Smtp-Source: AGHT+IG/jbEM97VrS53Atm+1N4bb61/7aCilWggiVm1iq64xkPpeGpUcqjZdhRppefJcp7R/14kOzA==
X-Received: by 2002:a17:903:22c5:b0:1fb:7c7f:6458 with SMTP id
 d9443c01a7336-203882509b8mr16140885ad.32.1724325550567; 
 Thu, 22 Aug 2024 04:19:10 -0700 (PDT)
Received: from localhost ([134.134.139.73]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20385566590sm10413615ad.26.2024.08.22.04.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 04:19:10 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/3] Add Xe2 ccs modifiers for Intel hw
Date: Thu, 22 Aug 2024 14:22:49 +0300
Message-ID: <20240822112252.4148114-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Here is added support for I915_FORMAT_MOD_4_TILED_BMG_CCS and
I915_FORMAT_MOD_4_TILED_BMG_CCS framebuffer modifiers

/Juha-Pekka

Juha-Pekka Heikkila (3):
  drm/fourcc: Import drm_fourcc header from commit 5151fa3 ("drm/fourcc:
    define Intel Xe2 related tile4 ccs modifiers")
  lib/igt_fb: add Xe2 ccs modifier support
  tests/intel/kms_ccs: Add testing for Xe2 ccs modifiers

 include/drm-uapi/drm_fourcc.h | 57 +++++++++++++++++++++++++++++++----
 lib/igt_fb.c                  | 15 +++++++--
 tests/intel/kms_ccs.c         | 23 +++++++-------
 3 files changed, 76 insertions(+), 19 deletions(-)

-- 
2.45.2

