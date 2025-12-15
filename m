Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC4ED5B16E
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 13:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279CE10E256;
	Mon, 15 Dec 2025 13:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lSAJj18U";
	dkim-atps=neutral
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5762710E256
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 13:45:26 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-c0224fd2a92so3278228a12.2
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 05:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765806325; x=1766411125; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YX4S+WSZxI2WD5vIpzBahiDkHJFL2RGOA7rtBK7wm9U=;
 b=lSAJj18UWrJQ+a0dak1ezYL9wP77ZU7neWZmOoKCP00cb6KMOrTMJAOKxpLfqWh3gI
 xFFUMRbQXu4L+uBm06NtlGWMPcxkJjEl1v8T3bLRVFPo6NwJPmDu99lgOXPxBtFvmdFy
 JxP9DGSEN5z5I1amPJJYEoNp6vrTQ5diIISpdx+za6YO9UaYs3qYJsmgefma/dZ9NSxS
 xgeOiYSt5/1pCAQgE7YDYsV07z2ew2oaYhy+GbR7/s8243K/8//CdKGZ0Ybb5vP3sHwl
 1PUGJzUXzbS5o1sxF5syPVx0sdBm6utUqYFpHdMRy259WmK+kV0TQnPv70WC0ceYGt9E
 yvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765806325; x=1766411125;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YX4S+WSZxI2WD5vIpzBahiDkHJFL2RGOA7rtBK7wm9U=;
 b=U0UH1wTsGVDb+zq9YhZ1DE/Q5h6fs/dkYiZ8S8bboIX2z3+Elp4vl6vg3s/hmoblFt
 pOflQkn/lfDg8Hbr7VSvDkulZTahJoXQn5qo/sA5SdZuBjMWNnAEzYDbj16F0yBIqQSr
 npADlD8tiG4TtyONPFVfhaigDkijSn7xpewYrufg1LJG/PAH7xsCL0IwzYbIVFOrVwOB
 wuV4oChVopTxZmKQxlmV9HLGQOBpqXwK26LmGgIPECbdQDhUYf4WO91BlHwnNTR4McVc
 ZaJP5wPkDcyTJOWi5yxSkO2BV1eT4yHU4E63RUl/6XJzKuwAfzVrYu5coqtI7X7DKGXV
 JVNw==
X-Gm-Message-State: AOJu0Yyp3AQ1Z9+BEym8EfxTZTAnB4gxXEsVdx0Bhz4Ve7ZRONkq019w
 s8icgikS/6+lGXGX3JCelc8sQ3uCCXIu28N/ugriRkN79x5DC3Ku/gCOyztE5lmw
X-Gm-Gg: AY/fxX4Vw5s3QMx3WXm6x9Qq17DU+AUsGI28sddM77z13ptGo96XoheakEfjNVCtgtx
 F2T9eiQ0eDojcDFcZOLOArdM8yv/SG3PSX6eZMv4aP8jqPyohFOs1plV3IK93LhrfkvXrKkc8Tj
 ACqYWxGcJnbBPTQ3IDDO8Ot1qwlt8JCIaycqSx0+YRHVUryZWLp8Ya9JzYfWsTfQV4ouY8lanev
 eYhkXfP29L0WizHSVKbK7SpU3ZHnTeZ0R+sXhQNHHeir0fZ2SEPPiCXc0ENZkobPAbyo2lETw7f
 qTq5zuWFIBe5SVNqLLLW1dcDc9Ip+0Xxulbgh0oxss9nwiORayrtlSIJAdKs5WQ8u3VO1Y0/xzf
 dPn0FjFTPm3UfRJqRcQEYaaZVR8pW3ru9607cS2eaeD6W4Za0uohMxPD0oR0HUWqisujDh7chiT
 JPKaFrvFS9lsdklxVsKUcy+WoQaE9AZZ9G8rkZgggD3UjrCIuuKy2OflkRDg==
X-Google-Smtp-Source: AGHT+IF4AigxfpvmhHy8vmJbqzxE91atbCevmF/gdImx4P0LwmP+JfmzOibry3W0GbrfuP7x4S/1sw==
X-Received: by 2002:a05:7300:f409:b0:2a4:3593:6456 with SMTP id
 5a478bee46e88-2ac2f860504mr7699897eec.6.1765806325328; 
 Mon, 15 Dec 2025 05:45:25 -0800 (PST)
Received: from localhost ([192.55.54.43]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11f2e1bb45csm45543791c88.1.2025.12.15.05.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 05:45:24 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/2] Switch to use kernel standard fault injection in
 i915
Date: Mon, 15 Dec 2025 15:44:33 +0200
Message-ID: <20251215134510.183735-1-juhapekka.heikkila@gmail.com>
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
xe_fault_injection test mostly written by Francois Dugast.
Will later need to see what parts can be moved to libigt but
for now it's outside of the scope of these patches.

/Juha-Pekka

Juha-Pekka Heikkila (2):
  tests/intel/i915_module_load: Add kernel default faul injection tests
  tests/intel/i915_module_load: take out reload-with-fault-injection
    test

 tests/intel/i915_module_load.c | 369 +++++++++++++++++++++++++--------
 1 file changed, 287 insertions(+), 82 deletions(-)

-- 
2.43.0

