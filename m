Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5E3CD5BC9
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 16:39:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4594410E3B6;
	Mon, 25 May 2026 16:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VlQqAxBy";
	dkim-atps=neutral
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DFB10E3B6
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 16:38:59 +0000 (UTC)
Received: by mail-dl1-f45.google.com with SMTP id
 a92af1059eb24-134ac81c445so14801497c88.1
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 09:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779727139; x=1780331939; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hzkeRf7dCKIk3kKlJ5GtjX8nBoDy8sgkrTOVcCg+GxI=;
 b=VlQqAxBy+7RKjhK10tknHQ3OLlf30N7GylYvGF7JUxiNCtt+ykNm1s1TpL4u8C0qnr
 K91FmWY+DOSuCsP2KG1evbDdKVSw1GRx51k1lg9bMyCHIcTUQnYAOot+dqakp1ITIuJJ
 uPxaqo2cprv61RzsOMUtk48m3Fywrqw4jCOuiqLoWlETjyOUUDmvh7TFwQ3typfU1MEz
 ht9UDfwtzpiJzVXZ/5m7233MOAefn++kuszkFlvVj7LFDauZRoIzvLQmVS6Xm4uqnu/9
 6qJIoY0WpKZXQ2c54Xq5arAUZU3sDvs6hrqXbp/2jb6zJb6ikWd4KzBaQMOsZSZsW9Pc
 IwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779727139; x=1780331939;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hzkeRf7dCKIk3kKlJ5GtjX8nBoDy8sgkrTOVcCg+GxI=;
 b=Cm/A4mSESYNMPfeJwCipMnJpgi5ovOu9pjCM1KzfY27Cqy4WSgOnj3SqbAbueyCAC3
 vTjQ+XFd9/74MyOmr8Z+2/fy1kanHzhFV93ZbOrSNRBVO3EbPPbv9sQeQXBmZIC957fl
 MbQUF1VuxtFM0G7eN/IyudQ34gR09y7x+93l2soBuw+SvykaBimZ+KJFB5t5DTuSKGbB
 +hl5QXEcg8R1kDun7907obvAsKACa90q17x2ssIkPq8pdhdIVVL6VA6pXcuCLwrwlMZ0
 o4r85s20nSwz0CxnoExJh3srAVnbqdgBboKFVnchd24SGbwso3oHQnac+7rKOeU2yGYJ
 tJ5g==
X-Gm-Message-State: AOJu0Yx6kEKhUol/tPIhtLMpSPFJ0rhobOAAGG3p6vkSRLTSPUKrfL6s
 w1Rzxa7253A38sQlCCGfAf3CyFnxeHm0MuEm8ys9spwcTwV+TzvQ/FJTCLBPz7gO
X-Gm-Gg: Acq92OFSLmbyM5scszzarIs6XI6zxuGbnSQI/eJr7/82q/zXy5TQQjy8e0A7S1m1/MO
 F+44rQCZMOW1bExENFKiwUFWpeQgpLLvELwipNVaYMfSsDj8H06ZzcF6JpPSYjwWont/5ukYrxR
 PGO6kKUskr8eBBUD44FNava/2JleFsb1Kq1HOqQh9KzEA2jy2HQ0z0wkKY40ztmBrUS5yrBZPIM
 PDgEh4MqZKplR8tpizoaIL1NRTt96O5XZlkAyLC87untyCtkJHsGSjUdtRNMooZYRomVs1emtrb
 gBW8oS/aMG+BYXAtW5jXtGd0fcLWrVCyCjsdKK/0F1OHIz/SfPBcMatMjjMMArRgLLznkekesyp
 xCfBsmUkb8+hm3wlgxeM3iLJ4wk2qz4JkIwi8mKAjlF3C1BP17OxO0gGS2BpznoujB9At7YJEYe
 UTPNev3Mho1F2w17NPQGm3Kjm72R8wpRMX9Jcv4CQkHF3z+5TVGqIwXuYyU/yryNChkPuhzg==
X-Received: by 2002:a05:7022:6ba3:b0:11a:3734:3db3 with SMTP id
 a92af1059eb24-1365fc6d6a9mr6155704c88.32.1779727138864; 
 Mon, 25 May 2026 09:38:58 -0700 (PDT)
Received: from localhost ([192.55.54.43]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1366a4011d9sm6653677c88.6.2026.05.25.09.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 09:38:58 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/9] Enable Vebox engine copy on Intel Xe driver
Date: Mon, 25 May 2026 19:38:41 +0300
Message-ID: <20260525163850.3493602-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Here enabled Vebox engine copy of framebuffers and force 4tiled yuv
framebuffers on Vebox path.

Juha-Pekka Heikkila (9):
  lib: take out duplicate assert
  lib/intel_batchbuffer: make __intel_bb_create gt aware
  lib/xe: add xe_exec_queue_create_class_gt
  lib/intel_batchbuffer: add intel_bb_create_with_gt function
  lib/intel_batchbuffer: move engine class selection to helper
  lib/intel_batchbuffer/xe: add bb exec path to use specific engine and
    gt
  lib: Enable Vebox framebuffer copying on Intel Xe2
  lib/igt_fb: on Intel Xe force Vebox copy on yuv formats
  tests/intel/kms_flip_scaled_crc: add 4tiled p010 to 4tiled p016 test

 lib/igt_fb.c                      |  53 +++++++++++----
 lib/intel_batchbuffer.c           | 103 +++++++++++++++++++++---------
 lib/intel_batchbuffer.h           |   3 +
 lib/veboxcopy_gen12.c             |   2 -
 lib/xe/xe_ioctl.c                 |  20 ++++++
 lib/xe/xe_ioctl.h                 |   2 +
 tests/intel/kms_flip_scaled_crc.c |  13 ++++
 7 files changed, 152 insertions(+), 44 deletions(-)

-- 
2.43.0

