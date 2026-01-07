Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166B6CFD64E
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 15:10:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D0A10E609;
	Wed,  7 Jan 2026 15:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RUdRD7AW";
	dkim-atps=neutral
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3733710E609
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 15:10:28 +0000 (UTC)
Received: by mail-dl1-f44.google.com with SMTP id
 a92af1059eb24-11f42e97229so373901c88.0
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Jan 2026 07:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767798627; x=1768403427; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ULEBj4Y88gWRotk/qKXamxjoBQb2e48hmcH+U4OaHIE=;
 b=RUdRD7AWCoTqQvcyuV+H5aborjvUkjHdfx5OB5EYdYBdhSjLX6Ox73zx/B5l+Nl+2m
 JSg+ipxU2xSqfaH4RUEQoJQcIKq/3zsSks3SjqEhQjE9i7sdHtywn2Dnmovla2Tf+xMI
 oaKMwBZA3cKv9sOTPDUlVsCOyqUfPVSc9+JCH+MzvFzHj6inJ0D4wKLgdTSsaOf2LFnx
 NIGvNPg4WNoQ6BOAA27rU+gF/bOn+S/Mhz7URjvOWyZqygyxOBMmFCsk6DzfvSUs5QJ6
 2v/E+KxG65ozWimQX0SiFCuOggIthwQPdHPNh1avUUKqoKIbXg503XnjTNEe71z5o3uS
 MeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767798627; x=1768403427;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ULEBj4Y88gWRotk/qKXamxjoBQb2e48hmcH+U4OaHIE=;
 b=EJ6Wdj+hifEIUSYlAGg8kUMiOuDLYLjBqrCgRiqnylctVOaZhZmud4WfyJOx+5+J4o
 /P2jva91fXNEYNyphDGq+zrvpGqRGdNF64D+qtVcV/DUYYJNlBT+0Fsc9jKua2R5pzKJ
 ycED0kHyOcxvZa0oL9rb1MHkpOlNVYDNhbnLT4aUf/6OEcaMvB9W7PyWi7jjGtjwUaTS
 p0YwDidrpQ5bflDJ/GfCREZ8KCuN6YOLgupOa9uAmOBWmKFFbA0HgMGl99yHqfQC9zb8
 2YE+YXcdbnV0IY9cWPXMPhJ+Tqhs86tTHI88dtYBO57Sq7X4K2aZSnRe9voiiuG8wrJE
 +jmg==
X-Gm-Message-State: AOJu0Yzq1VS/1YlqNZk36v4IWdUxW0pcz5/HHp8mO8rEAe8OsPMJ1wLf
 PAP8JVhDLkxFO+kes6HIjkOmNivh2AzKpKGqu45DvUJFLJ2ZSoz43423VJLcV/x/bhw=
X-Gm-Gg: AY/fxX4sVnWiz0Ei16mxMchNPV3+FOXonIarIn6fEeRrYTUMAxdLYVDYTGcd4nhT127
 Q8bEpzhJ28lOdgt9LDtq23MbkwoZa1aJg+MFmtzqAuFczKh15HWwFI2WTzY+MxaebIciIQ/62MR
 va51C6gBXC79xmlPx0wPqDlc076aMrVy2Kh71Q7n6bJNanSn2hL0Gf2hyAoRion4XGNM8uIQs3/
 0HrhgHGuS23ESWEX20nG/7/RQYeOKIvqStOCoAB8mIXf+qeYEFMsoQAaqrGSKFJMeEuWO4ImzEz
 M/39XRc6uHiwhB7wZ0E8yv7s8E5g9xc7lLep0oLX+TOeya3gi1EQ7faBF+C0NP+vDAWsv8odUpj
 7IEIuE6vSMSXQ7YKoWjQn+gxg262ZFZ5ej1KcYmqWZGWdyY2NGXZ+UiSJkPRgsqvWH0k0fwmz3L
 DwOy2CSAZiM5AlnJBH5oAy0mj6LMXJMW2CauiTXgLgxs3PfPE=
X-Google-Smtp-Source: AGHT+IEngjEP5LXJfhhVqNy/NQeN5G9Z8o8DDf29oRZk8/498OXVQhDQql24vR83JzPF2LzNMcHWuA==
X-Received: by 2002:a05:7022:23a5:b0:11b:ceee:b760 with SMTP id
 a92af1059eb24-121f8b45319mr1997365c88.23.1767798627076; 
 Wed, 07 Jan 2026 07:10:27 -0800 (PST)
Received: from localhost ([192.55.55.48]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-121f24984b0sm11042695c88.14.2026.01.07.07.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 07:10:26 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [RFC PATCH i-g-t 0/1] compress dmesgs inside jsons
Date: Wed,  7 Jan 2026 17:10:03 +0200
Message-ID: <20260107151004.327093-1-juhapekka.heikkila@gmail.com>
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

Here added compress-js parameter for runner. What it does is at per test level
for results.json in dmesg key is written text "compressed" to maintain
compatibility and on the side of it is written new key dmesg-compressed which
contain dmesg ran through zlib and base64 encoded.

If such is accepted, next is to add support for reading these compressed
jsons into piglit and elsewhere but it shouldn't be much of effort since
all that should be needed is decode base64 and decompress with zlib.

/Juha-Pekka

Juha-Pekka Heikkila (1):
  runner: add possibility to compress dmesgs inside json

 runner/resultgen.c    | 117 ++++++++++++++++++++++++++++++++++++------
 runner/runner_tests.c |   2 +
 runner/settings.c     |   7 +++
 runner/settings.h     |   1 +
 4 files changed, 112 insertions(+), 15 deletions(-)

-- 
2.43.0

