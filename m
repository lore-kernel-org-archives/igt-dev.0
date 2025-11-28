Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FBBD116E2
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 16:18:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A96310E08D;
	Fri, 28 Nov 2025 16:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fn54ougY";
	dkim-atps=neutral
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC1E10E08D
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 16:18:40 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b7370698a8eso105795366b.0
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 08:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764346719; x=1764951519; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Vdwax26KRvH5j7XssP4Yn8bAZnuO0sLNyqtKJr95HPA=;
 b=Fn54ougYCKC2J3MxYIpApMnDY/LNm+i4YoDcQW6PYdIOAKl3p+K/QZQKYYIof3+L46
 Qq98SgnqqiGzQeqgvPdeaKKpsVBZ5EgAhNL5qeSZOhGEP8lKOgdN3ziZqRi/lmcQ2xdU
 MwI/LNClhjRzW8VcWRMMUPEGjV7MrerOASlxU55gVP3Bx2+qOtrnJfyYd7pGwXuazXig
 BFwBYmfAqDn6o0nPlOSndvRIjYn0vhxeWHsvvT9X4UTbI8hMSxCzeQ84xE9dhDd6QEJm
 kBIyEEj3CvnSkPIARe8yoc6dJrlCl+UbSGmqGssEgVjs/HkwEopPF4resqbW1AJSpKPu
 6Lqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764346719; x=1764951519;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vdwax26KRvH5j7XssP4Yn8bAZnuO0sLNyqtKJr95HPA=;
 b=ChnxTk4t1O5yWobiAeIeNDguV23fW/HHC2eqSLqizhWPngm2RPKPzW52VK/qFQ9pW2
 BI1iEM8RMZ5NwZmk5PMCGtMvAaFHOf6SBRobdrTlx5YyfVRIvILNEQ9R3rPbp37+kMOw
 o1jFAJMRP8SSVwvPFEErRmx1mlrC+1KWWlQaUFfpNE8aTU/IRlN0oA7UF5HkC7vMJ93X
 XAdN6Lko0HhzzY5qQEwHfRQOcA+URjXTKkgCQ3Jr3sDJF1deyXwveOyJas/J1s52wvu0
 uz79MgVg7+r/eNOnpWKWgagUSMmvUsfHk+/T7xdBbpU34RV8ADsJTkbYI2Do+IyuRVwE
 J5Pw==
X-Gm-Message-State: AOJu0Yxwn9Cynl+LAhJhdxYABiTFDMrxmYun11vBufsmNwnTl34iNBLe
 sU+s52b9Y0gz412xDpLAj8PR03FBI246WoxDKudlv3Zthl9LirQYBIR/Bj3WS8Ycvuw=
X-Gm-Gg: ASbGncuDcRXuZvtnWR6PdIIqQdLmy1Gp1Qyn8Xmp1r0muCdieRGT9N2zvUaQGnzAnz4
 8CjKgF9QdwAhLs930vWM0kCsa5UlZfFPK1BpPJE3waIyfPZMWCplAV8nWlbXDYfc7dqa5G4Wfpc
 yzCYtzkRDOnyVzHaL3MYDooyLVGuS3M10wAAQ7Y0/A0Ies3LzqDnW54DsZSeeauU4Ut4GF2eH67
 DutRLqOtfAu6UTplmRikLzvkiNbvpPblTzUzc7Hc06StuxbAuVlsHWGe25zlzZYMNjjy+uj9Cnr
 miG/ns+0KeFueQ2dG9IgK2AAzyyUVaTXK88Oq/yVQAjjLEGx4RmPtckeGp4MUDd1BiHO7QpWXQs
 xgNDMuojce6l2mHR1PlP8LSzLBVyYUUhVwiuoGNFrdSme6yaTbU/aOOz0Az9052nweItlRSuxlb
 jXI4GIlPQoUdqpvmYs6kFxe/i+kelLVml4YRIaTq64jA==
X-Google-Smtp-Source: AGHT+IFr7vbsgG2LlvJkZqWuE9ERcV5K3EwQkYX7JuFsxZvd8NjcLpipfrtGboDOHbXrSual3PgrFg==
X-Received: by 2002:a17:907:3f0a:b0:b73:b05b:1f9c with SMTP id
 a640c23a62f3a-b767157ffe1mr3435448066b.14.1764346718646; 
 Fri, 28 Nov 2025 08:18:38 -0800 (PST)
Received: from localhost (84-40-238-204.cgnat.inetia.pl. [84.40.238.204])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f519e2a7sm484115866b.19.2025.11.28.08.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 08:18:38 -0800 (PST)
From: Kostiantyn Naddur <kostianaddur@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Pawel Sikora <pawel.sikora@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Kostiantyn Naddur <kostianaddur@gmail.com>
Subject: [PATH i-g-t v1 0/1] tools/intel_gpu_frequency: prevent SEGFAULT w/o
 root
Date: Fri, 28 Nov 2025 17:18:24 +0100
Message-ID: <20251128161832.24515-1-kostianaddur@gmail.com>
X-Mailer: git-send-email 2.52.0
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

Dear Maintainers,

This patch addresses a core dump in intel_gpu_frequency that occurs when the tool is executed without root privileges and the write modes for frequency files are not correctly specified.

While debugging, printf("%s %s\n", freq_info->path, freq_info->mode) in initialize_freq_info() made it clear that the write mode logic was allowing invalid access patterns. To fix the issue without breaking existing read-only usage, this patch introduces verify_write_cond(). The helper checks both the program’s privilege level and the requested write mode, updating the "min" and "max" modes to "rb+" when needed. This prevents crashes while preserving expected behavior for read-only operations.

The issue is tracked here:

Fixes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/184

Feedback is welcome.

Thanks,
Kostiantyn Naddur

Kostiantyn Naddur (1):
  tools/intel_gpu_frequency: prevent failure w/o root by properly
    specifying the write mode

 tools/intel_gpu_frequency.c | 38 +++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

-- 
2.52.0

