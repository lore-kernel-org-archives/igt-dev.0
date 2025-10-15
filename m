Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B7DCCD18E
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 11:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6F310E3A2;
	Wed, 15 Oct 2025 11:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gZRBRBAC";
	dkim-atps=neutral
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E01E710E3A2
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 11:20:11 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-782bfd0a977so5339255b3a.3
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 04:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760527211; x=1761132011; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uzJqxYBsmow3uM1NfhpXNWMgjje83pEMD5Qau5GJ2U4=;
 b=gZRBRBACONZHJkUXflwz0fIfCbIGk3L1T16/AwQXcQgA7Gt3f4LYSbvRLCrZ8rk7qP
 8jVgJlUs8vp64WR7oLQcL/L0gnFSbn4HFyaMhtRhbjr0v4J03UkpqZWPk32p2X61z5Cz
 zgvHUR3KHkPgXD547fm1u1PnKjFO2oCgGxADwSxE9FmQkc7TRxpYHYDhzKp8y2TxSQ6A
 YEN9R7zr2l2yr+yqj3a5k2e/+euUinWWWXQIeZYmD9aZWMTf2h6uFzG6U7BYTIdXg/rs
 /Rt6wYTUohxMK5vj8AHqwdj6SrTrLV5UxpH+N6x/5a+m/dXsPOvEy752nwcc7PHlWdfu
 b8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760527211; x=1761132011;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uzJqxYBsmow3uM1NfhpXNWMgjje83pEMD5Qau5GJ2U4=;
 b=Ke2w7Vq6KQyLIoxj2z6B5qJoM7pxovyoI8KlZrFwxoW2xHoQw2euggwnBdR0CUWpFf
 rZCcKFd8bC7I7TQm01ALWRrzRqVpG5m5b41HCoMClX4II6C2WTkS9fZ8Gstu9P/wdMMu
 tddo9wRrcY4WZmXu+b4n87teaHpC1MG9GxLR9cziyQRpm5D0r0J8CrKLicUbpr5vl1d6
 gtIcy/vzExJO88zuGQE6Or07rM/OROC2wdYGkoDTp63Ojf0uRYjGDXKu8AqV97DAmLep
 UDj5uxsTKqzq+WuejJYAW+riuF/XGhqn/tGuhVmKzgqhyIw820csHoZq8yfvjN5UxmkG
 9Ufw==
X-Gm-Message-State: AOJu0Yz2y04vn2AIz693HMFCJ3meZ9Vf5CIqGcyPgg4js+QO7vit48Ow
 5+zqPNMHQDCZxYcaZ44Bf24cpY3DC64gFwupjFWKvMkM2cGLULsTjAJrboZVXa0FD2c=
X-Gm-Gg: ASbGncvfp2ml5Mh036mRZj1LaHNKhp9xNM6z+ClM8arBXxmJui8kNa8wql3HVt2vlZC
 tS3co1bDNdoY3HE/11wU6z66TDk3+2ujnEHxB5vPH9DqD5tL9CXBhc5f2XreNPTfgRtiCO/OaMz
 SoCDtHDNCT+FNtHHubKVYIO4WYSa+wQgD69oZO8oc9wpEW9ECt8z59r1ts4aMicKx+15bIg6IVQ
 uGDS7bU/U8l14Q30+lYIHacQyX1B1TGm83PXiptA6fWIdnixXZtQ5VeH+i7U7kBm28INegd4Ecr
 46OQmNsWHOx2JDdyjyaxDNEUSf0FJZ/jRoCUx4a7qfDslp+fHv1NvtzWyPFQ0QwsnZMKWZFR85r
 3GiNUQgBWuQYXl0sG+qEQSdZ50DW/3X1ehtsr5SPBb1VSwAObVZr3A0hh8HM=
X-Google-Smtp-Source: AGHT+IHJsZKP10yCI6Tn8/JPzhnEQN6Rw6/7TcggEX+xxVbtb2JCsCXB4XvgIVqKm1i2BfGDgAonlw==
X-Received: by 2002:a05:6a00:1797:b0:781:eaa:9801 with SMTP id
 d2e1a72fcca58-79387e0603fmr33814945b3a.24.1760527210984; 
 Wed, 15 Oct 2025 04:20:10 -0700 (PDT)
Received: from localhost ([134.134.139.69]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992bb11ca0sm18449018b3a.32.2025.10.15.04.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 04:20:10 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "Jani Nikula" <jani.nikula@intel.com>
Subject: [PATCH i-g-t 0/1] [wip] Switch to use kernel standard fault injection
 in i915
Date: Wed, 15 Oct 2025 14:19:36 +0300
Message-ID: <20251015112002.234956-1-juhapekka.heikkila@gmail.com>
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

wip once seen what different platforms in ci say about this
will need to refine the test. Much of the meat'n'bones of
the test are cut'n'paste from xe_fault_injection test mostly
written by Francois Dugast, will need to see what parts can
be shared with tests and moved to libigt.

/Juha-Pekka

Juha-Pekka Heikkila (1):
  tests/intel/i915_module_load: Add kernel default faul injection tests

 tests/intel/i915_module_load.c | 300 +++++++++++++++++++++++++++++++++
 1 file changed, 300 insertions(+)

-- 
2.43.0

