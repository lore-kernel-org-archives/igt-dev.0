Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDF8CCFA1A
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 19:49:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD1710E15F;
	Tue, 11 Nov 2025 19:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K2UwKn9b";
	dkim-atps=neutral
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0264B10E15F
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 19:49:47 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-7b0246b27b2so127470b3a.0
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 11:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762890587; x=1763495387; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8kkruZLrRZDED36+svV4w/sS3m7XpWHNOsGI4oQeXyo=;
 b=K2UwKn9bYhCf2eTsrxKvLNOMHzSN8XN4doHgemoEkpFXoHIh62Hh3lIxYMbeURy/Vv
 pdk9rLtzWFLHfJfGb2iYvjSApO+GgNiI4TlqRArSzntzErxI45jQF4b1R84Wk444jcyX
 g5dRM5LKfbicRZoioG1kapVOvZ936b3VNNxdrxdalmzwmaePBdoD4dqRttSCM9lwVxYD
 JuFAotBFPMr53jpMz8HcRtpItaR0g0bdC5frMG8YePumTFpZt76HgeXNLDCHwA2G4c0K
 MseI+cRGml04a5WIne6mdo1lZAeVm/Ql70WGKjFwq4jvzbJREklBcNwXFNQShRVMuI82
 Qzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762890587; x=1763495387;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8kkruZLrRZDED36+svV4w/sS3m7XpWHNOsGI4oQeXyo=;
 b=Dc+aC0XkE3pAKIUt9dH7pN2rDR5Qbqp89I70SugGBXUL66LvakWAYFOAgaEoLbTaLx
 izZLQAG0DV/NFLTHkFaCrNl3lSwWBNXkGKJQSaGXBzs82QOvaJ30rwT1C/Z0BVaefMzJ
 is5Qz1CqtFfXSnFOA2/FbK277rSWfVDrlrghGDV5dbUA47YB1Y0tlouubdrfeFBJ5oGl
 0tq5AupCEtLe0W5uIcn2Dvk+fPClXYff5CcP3mk1Nx3q7XdopnAZzaCOOztzkNHKmpqB
 zItji0E2SVIhwlMJ/s7lIxv3ORdRrKoY0S+DGHhvHUWJbTossRKlMjRdOOGD+I2gO9AW
 PHCw==
X-Gm-Message-State: AOJu0Yzb0xdPKVngwuDM9eWTQBAibGp8Awzth6TBQlRquq/1rJ3i1k27
 l5PIoNlNiJlj8TJRo5+hxL8AoY4yOvA9VScrm7sVEnC8wflbKMhsdnydSOH58vNT
X-Gm-Gg: ASbGncvacblui1TqvGopj10wIo3RX36vomliLiCN2cQVkqvpqiXiG+udOQMEbeMAuFQ
 uLVL7Qy71r1uaPQ0xvkn+WksMWFC9mgfn2DqWyYTXYYvABtRXtFA7KdjqV7r62kmIUK7F29g8p0
 5fyTPrI82L6SkzXkddvq3Y8tAwhO6VREFgzl8poJM/qBYrbgZEU+X+07EUju37Ed0ENPqKqrITA
 XcfUSkZlhnGTQIHPgGRO2WHiRxxIeFAZeAA0TRFT7HAjPCE/e+T5h11GK+P5122/KffuOBiS8kA
 tvAAfOrMRkply2Uq3EUpUZzlz9KTPxEmAbiL+/YdjOXT+gcxw77d5nLUNUyOXm8FPRWISXSZsVT
 v5kLV1GnD4HAA4Lf94o3xogqYbgQM+DxMCHApSOc0RHdfCjAjgri2VkmN/FdPrR0H2SfDF1Tnc3
 aaTZu+Rw5xVMefxDQ=
X-Google-Smtp-Source: AGHT+IFOLMNwROOJt5kHkctcI1nOC5jFPNHBKgm5FTUIe0cXXX0pgwAg2OHJdHBtnpHPQra7V+/4rw==
X-Received: by 2002:a05:6a21:e097:b0:34e:be9b:b67f with SMTP id
 adf61e73a8af0-3590b51dd66mr353802637.49.1762890587175; 
 Tue, 11 Nov 2025 11:49:47 -0800 (PST)
Received: from localhost ([192.55.54.41]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bbf167e28basm420879a12.24.2025.11.11.11.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 11:49:46 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/1] Switch to use kernel standard fault injection in
 i915
Date: Tue, 11 Nov 2025 21:49:07 +0200
Message-ID: <20251111194936.444955-1-juhapekka.heikkila@gmail.com>
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

Here added fault-injection subtest to test kernel standard
fault injection mechanism in i915. 

Much of the meat'n'bones of the test are cut'n'paste from
xe_fault_injection test mostly written by Francois Dugast,
will need to see what parts can be shared with tests and
moved to libigt.

/Juha-Pekka

Juha-Pekka Heikkila (1):
  tests/intel/i915_module_load: Add kernel default faul injection tests

 tests/intel/i915_module_load.c | 287 +++++++++++++++++++++++++++++++++
 1 file changed, 287 insertions(+)

-- 
2.43.0

