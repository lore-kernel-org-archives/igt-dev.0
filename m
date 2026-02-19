Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812E1E9A03B
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 09:36:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B3210E280;
	Thu, 19 Feb 2026 09:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ElPbKJ2Y";
	dkim-atps=neutral
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com
 [74.125.224.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D2B10E25D
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 04:10:52 +0000 (UTC)
Received: by mail-yx1-f49.google.com with SMTP id
 956f58d0204a3-649e97f1e1eso338644d50.1
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Feb 2026 20:10:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771474251; cv=none;
 d=google.com; s=arc-20240605;
 b=JawHBWOr7mcSI36XOmHvQpyeuDo4RPHsaA/lecvLoDaXDyJxgd8iHCLOFCoDChPHAW
 mtWugngypNrUkAqhd6HT/ly22MOKDM6qWH9ILhRLJLMU2prWGIzx25XrzZ/AYKslxPbH
 JzvthfdnrF2RmSIShxBYbZVljjLhN9rK9xnodwLls2UuJwt4IgHWvd81O3lQtvbNqvwy
 yDz5sEKpe7rUGrVFwZXiKj1JT7CJVEu1viwov9z0MDo7YTNk90FZzaFDSDf5PhRe9QD/
 6ET7DVk/dAhH81MqQx+iAJny9gHXYRKFZ3Ah567OCMowSiozpqVhtM4XKaHKk3MILJSL
 oKOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=vF7SsAkNR9eYmjWQZor3delLbaufeJNSW/hvl+P1Two=;
 fh=EX0PTiD1xokl/cAGDPMTEx05jGXdhO5EftfjRYYG43A=;
 b=NejpiItJJnZM4jVOjqSJZwcCvC788Z9OqnuMxHnJ8KchV+CZ8ljltR7R7YDR/F+0zx
 qcRBHnuNkyJd7bOzhRLx2oBp8bkFgn4kpdHsgzlWwRgB8RaVP/GC88Qqtvr9yzFlWn/d
 0jljtrKR7tBt+4kv+/tWSAk7l7sqSqqIqJKGgHRIwKpejurazg4Q937RXHdaEvqkx9Ho
 7wMifFGxiUO9r/juULb4YoUMwXXB8zxkgEsLem8ZxCGXEStz1QM3/lko8L8CD4JmRDVZ
 cnhKqlE/a2QX45oYvl9oTuGWdSTd8zTypNU4Jfh/usgEX6g8DMj30AA/WkduGhLKU6lv
 ebzA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771474251; x=1772079051; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=vF7SsAkNR9eYmjWQZor3delLbaufeJNSW/hvl+P1Two=;
 b=ElPbKJ2Yc8mPsBPD58W0pbyBCF2I5OgdmpzyssIib5LDZtY4paTOZVwlAlYRlYkjM1
 DYzMJ6VMKgCfEOHSVurneXJHm/1LXRLgIsRrQQpQAMn5o4rkJ5o6KKamOWSpkSaYUlsk
 LKTYVLZESIVdCBINMBJFnfowp75wKYIhMDYyEi5SdKGPv3IyOUolBwiyAk+Z2xufiTjv
 R8y0MBLyrbAGOrel3gVwZoQ7yTPwdoGc7pGp/3G8h+/zX8mMaEEn9W4ZWdHwKJnWTM4t
 8yI+qqkcoZmdrqxPJJtKPY0C5XQ/O+7A5Bq8/GrA32jmPaDRUl/NH61JaFk/6dnB6Qxx
 n0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771474251; x=1772079051;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vF7SsAkNR9eYmjWQZor3delLbaufeJNSW/hvl+P1Two=;
 b=BfXWvXTMZO3aIg+JoyKG87H3hVHhCNiBKL2akVksg8g6CehsCc3Vz8dEZAoBqk/HMA
 4ClEz5TV6bj0wG+6oBA9Wger3MCX9pWeEQrI0mV1g9KcHO1B0n2P/0xDyTVg0a1Gmcfw
 GbDGOBGeZElgHsnKnapFcYBoM9coz/aTM2XOMkJk92eMiBNd+DDORYsXzvodRCXvXFLt
 RlcKxxdyQh2mueRE6b0iwd3MwjOVFgxrEULXlk0xN9K4RAMttGmtBHvXJRfNpMqAQPwz
 Q0EZmCKdVFPD3F7PXMnRnwrrhfuLWLuFVCz2x+dlhqhUv9glBy41SNUHxJ9w6H2Qwsdl
 soBA==
X-Gm-Message-State: AOJu0YyNc0h7tCXO5+CmarsJ4EdWPANhW7NBNIXDihPGN4Oq75FAg1wE
 YG9Ww5QJiMZ43RrGMuwGnr78Kbiv7D77PyYxOxQRQAXIRRkj2MDrIBO/xsuE67eNtdIEt3H3Lbi
 7cKd8xQVRZniKNajbgsZvHyIG1+4cV5nPvReG
X-Gm-Gg: AZuq6aKKKEUQ58B+icx6CZLLojBLkSL9Z+5Sr6m/BFz9b6pzaiy7IKPo8zqblQhrVQU
 ItcLZpPearIXrZ93EI0Ug7rXr7dMauBGaE6D1Yv7oQjReaajUPDovEyadLFspQTzuStQ+9B2j3b
 bFqKUQB5EpOEQ5FJCFf4/7CVBWgMyKkUmASXtMqgaRdLxYujEixMCPiEzKMF+m+c4BqQhe8eIql
 8ZZzgU8ime/P3kUKIl17Qgkz9wAtdq1BreKhSJ5ktTZEPdWlkLf/avEH/BfW4Kavut5l3KMBDFN
 XWza
X-Received: by 2002:a53:a383:0:b0:649:ef06:15f3 with SMTP id
 956f58d0204a3-64c14ac28a4mr14462932d50.10.1771474250559; Wed, 18 Feb 2026
 20:10:50 -0800 (PST)
MIME-Version: 1.0
From: jim.cromie@gmail.com
Date: Wed, 18 Feb 2026 21:10:24 -0700
X-Gm-Features: AZwV_QjswIP-pCa8eQWr00yfcjDmILlaohBNh2v-8zqk9dJQi91Or_yLWNcwGjY
Message-ID: <CAJfuBxwazTagCUjsTr3MW7X8v4byStriyif+-Cq_B9FraLzihw@mail.gmail.com>
Subject: failing prime_busy@before,after tests
To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 19 Feb 2026 09:36:31 +0000
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

hey folks.

Im testing a patchset fixing DRM_USE_DYNAMIC_DEBUG=y,
against DRM-CI on gitlab.freedesktop.org

and its failing prime_busy tests before and after.
and several more.
https://gitlab.freedesktop.org/jim.cromie/kernel-drm-next-dd/-/jobs/93571016

This is almost certainly because the overheads of toggling all the
static-keys under all the altered drm-*dbg() calls are much bigger
than just toggling a word: /sys/modules/drm/parameters/debug

Whats a workable solution?

is this timeout already parameterized, such that I could
set some CI variable ?
It seems to be something thats affecting multiple tests,
probably each with a different scaling factor.

this 1st one is 800/150 too long.

00:16:12.165: ERROR - Igt error: (kms_sysfs_edid_timing:852) CRITICAL:
Test assertion failure function __igt_unique____real_main60, file
../tests/kms_sysfs_edid_timing.c:120:
00:16:12.165: ERROR - Igt error: (kms_sysfs_edid_timing:852) CRITICAL:
Failed assertion: mean.max < THRESHOLD_PER_CONNECTOR * 1e6
00:16:12.165: ERROR - Igt error: (kms_sysfs_edid_timing:852) CRITICAL:
card0-DP-2: single probe time exceeded 150ms, max=800.51ms,
avg=800.05ms

one of the prime-busy fails

22:51:39.140: DEBUG - Begin test syncobj_timeline@invalid-signal-illegal-handle
22:51:39.140: DEBUG - End test syncobj_timeline@invalid-signal-illegal-handle
22:51:39.140: DEBUG - Begin test sw_sync@timeline_closed_signaled
22:51:39.140: DEBUG - End test sw_sync@timeline_closed_signaled
22:51:39.140: DEBUG - Begin test prime_busy@after-wait
22:51:44.184: ERROR - Igt error: (prime_busy:296) CRITICAL: Test
assertion failure function busy, file ../tests/intel/prime_busy.c:114:
22:51:44.184: ERROR - Igt error: (prime_busy:296) CRITICAL: Failed
assertion: poll(pfd, 1, timeout * 1000) == 1
22:51:44.185: ERROR - Igt error: Dynamic subtest bcs0 failed.
22:51:44.185: ERROR - Igt error: **** DEBUG ****
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_dummyload-DEBUG:
Test requirement passed: nengine
22:51:44.185: ERROR - Igt error: (prime_busy:296) CRITICAL: Test
assertion failure function busy, file ../tests/intel/prime_busy.c:114:
22:51:44.185: ERROR - Igt error: (prime_busy:296) CRITICAL: Failed
assertion: poll(pfd, 1, timeout * 1000) == 1
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_core-INFO: Stack trace:
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_core-INFO: #0
../lib/igt_core.c:2075 __igt_fail_assert()
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_core-INFO: #1
../tests/intel/prime_busy.c:114 test_mode()
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_core-INFO: #2
../tests/intel/prime_busy.c:180 __igt_unique____real_main151()
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_core-INFO: #3
../tests/intel/prime_busy.c:151 main()
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_core-INFO: #4
[__libc_init_first+0x8a]
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_core-INFO: #5
[__libc_start_main+0x85]
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_core-INFO: #6
[_start+0x21]
22:51:44.185: ERROR - Igt error: **** END ****
22:51:44.185: ERROR - Igt error: (prime_busy:296) CRITICAL: Test
assertion failure function busy, file ../tests/intel/prime_busy.c:114:
22:51:44.185: ERROR - Igt error: (prime_busy:296) CRITICAL: Failed
assertion: poll(pfd, 1, timeout * 1000) == 1
22:51:44.185: ERROR - Igt error: Dynamic subtest vcs0 failed.
22:51:44.185: ERROR - Igt error: **** DEBUG ****
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_dummyload-DEBUG:
Test requirement passed: nengine
22:51:44.185: ERROR - Igt error: (prime_busy:296) CRITICAL: Test
assertion failure function busy, file ../tests/intel/prime_busy.c:114:
22:51:44.185: ERROR - Igt error: (prime_busy:296) CRITICAL: Failed
assertion: poll(pfd, 1, timeout * 1000) == 1
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_core-INFO: Stack trace:
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_core-INFO: #0
../lib/igt_core.c:2075 __igt_fail_assert()
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_core-INFO: #1
../tests/intel/prime_busy.c:114 test_mode()
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_core-INFO: #2
../tests/intel/prime_busy.c:180 __igt_unique____real_main151()
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_core-INFO: #3
../tests/intel/prime_busy.c:151 main()
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_core-INFO: #4
[__libc_init_first+0x8a]
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_core-INFO: #5
[__libc_start_main+0x85]
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_core-INFO: #6
[_start+0x21]
22:51:44.185: ERROR - Igt error: **** END ****
22:51:44.185: ERROR - Igt error: (prime_busy:296) CRITICAL: Test
assertion failure function busy, file ../tests/intel/prime_busy.c:114:
22:51:44.185: ERROR - Igt error: (prime_busy:296) CRITICAL: Failed
assertion: poll(pfd, 1, timeout * 1000) == 1
22:51:44.185: ERROR - Igt error: Dynamic subtest vecs0 failed.
22:51:44.185: ERROR - Igt error: **** DEBUG ****
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_dummyload-DEBUG:
Test requirement passed: nengine
22:51:44.185: ERROR - Igt error: (prime_busy:296) CRITICAL: Test
assertion failure function busy, file ../tests/intel/prime_busy.c:114:
22:51:44.185: ERROR - Igt error: (prime_busy:296) CRITICAL: Failed
assertion: poll(pfd, 1, timeout * 1000) == 1
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_core-INFO: Stack trace:
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_core-INFO: #0
../lib/igt_core.c:2075 __igt_fail_assert()
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_core-INFO: #1
../tests/intel/prime_busy.c:114 test_mode()
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_core-INFO: #2
../tests/intel/prime_busy.c:180 __igt_unique____real_main151()
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_core-INFO: #3
../tests/intel/prime_busy.c:151 main()
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_core-INFO: #4
[__libc_init_first+0x8a]
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_core-INFO: #5
[__libc_start_main+0x85]
22:51:44.185: ERROR - Igt error: (prime_busy:296) igt_core-INFO: #6
[_start+0x21]
22:51:44.185: ERROR - Igt error: **** END ****
22:51:44.185: ERROR - Test prime_busy@after-wait: Fail: See
"/results/igt.prime_busy@after-wait.log"
22:51:44.185: DEBUG - End test prime_busy@after-wait
22:51:44.185: DEBUG - Begin test prime_busy@after-wait
22:51:54.271: ERROR - Igt error: (prime_busy:298) CRITICAL: Test
assertion failure function busy, file ../tests/intel/prime_busy.c:114:
22:51:59.325: ERROR - Igt error: (prime_busy:298) CRITICAL: Failed
assertion: poll(pfd, 1, timeout * 1000) == 1
22:51:59.325: ERROR - Igt error: Dynamic subtest rcs0 failed.
22:51:59.325: ERROR - Igt error: **** DEBUG ****
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_dummyload-DEBUG:
Test requirement passed: nengine
22:51:59.325: ERROR - Igt error: (prime_busy:298) CRITICAL: Test
assertion failure function busy, file ../tests/intel/prime_busy.c:114:
22:51:59.325: ERROR - Igt error: (prime_busy:298) CRITICAL: Failed
assertion: poll(pfd, 1, timeout * 1000) == 1
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: Stack trace:
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #0
../lib/igt_core.c:2075 __igt_fail_assert()
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #1
../tests/intel/prime_busy.c:114 test_mode()
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #2
../tests/intel/prime_busy.c:180 __igt_unique____real_main151()
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #3
../tests/intel/prime_busy.c:151 main()
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #4
[__libc_init_first+0x8a]
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #5
[__libc_start_main+0x85]
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #6
[_start+0x21]
22:51:59.325: ERROR - Igt error: **** END ****
22:51:59.325: ERROR - Igt error: (prime_busy:298) CRITICAL: Test
assertion failure function busy, file ../tests/intel/prime_busy.c:114:
22:51:59.325: ERROR - Igt error: (prime_busy:298) CRITICAL: Failed
assertion: poll(pfd, 1, timeout * 1000) == 1
22:51:59.325: ERROR - Igt error: Dynamic subtest bcs0 failed.
22:51:59.325: ERROR - Igt error: **** DEBUG ****
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_dummyload-DEBUG:
Test requirement passed: nengine
22:51:59.325: ERROR - Igt error: (prime_busy:298) CRITICAL: Test
assertion failure function busy, file ../tests/intel/prime_busy.c:114:
22:51:59.325: ERROR - Igt error: (prime_busy:298) CRITICAL: Failed
assertion: poll(pfd, 1, timeout * 1000) == 1
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: Stack trace:
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #0
../lib/igt_core.c:2075 __igt_fail_assert()
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #1
../tests/intel/prime_busy.c:114 test_mode()
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #2
../tests/intel/prime_busy.c:180 __igt_unique____real_main151()
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #3
../tests/intel/prime_busy.c:151 main()
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #4
[__libc_init_first+0x8a]
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #5
[__libc_start_main+0x85]
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #6
[_start+0x21]
22:51:59.325: ERROR - Igt error: **** END ****
22:51:59.325: ERROR - Igt error: (prime_busy:298) CRITICAL: Test
assertion failure function busy, file ../tests/intel/prime_busy.c:114:
22:51:59.325: ERROR - Igt error: (prime_busy:298) CRITICAL: Failed
assertion: poll(pfd, 1, timeout * 1000) == 1
22:51:59.325: ERROR - Igt error: Dynamic subtest vcs0 failed.
22:51:59.325: ERROR - Igt error: **** DEBUG ****
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_dummyload-DEBUG:
Test requirement passed: nengine
22:51:59.325: ERROR - Igt error: (prime_busy:298) CRITICAL: Test
assertion failure function busy, file ../tests/intel/prime_busy.c:114:
22:51:59.325: ERROR - Igt error: (prime_busy:298) CRITICAL: Failed
assertion: poll(pfd, 1, timeout * 1000) == 1
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: Stack trace:
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #0
../lib/igt_core.c:2075 __igt_fail_assert()
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #1
../tests/intel/prime_busy.c:114 test_mode()
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #2
../tests/intel/prime_busy.c:180 __igt_unique____real_main151()
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #3
../tests/intel/prime_busy.c:151 main()
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #4
[__libc_init_first+0x8a]
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #5
[__libc_start_main+0x85]
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #6
[_start+0x21]
22:51:59.325: ERROR - Igt error: **** END ****
22:51:59.325: ERROR - Igt error: (prime_busy:298) CRITICAL: Test
assertion failure function busy, file ../tests/intel/prime_busy.c:114:
22:51:59.325: ERROR - Igt error: (prime_busy:298) CRITICAL: Failed
assertion: poll(pfd, 1, timeout * 1000) == 1
22:51:59.325: ERROR - Igt error: Dynamic subtest vecs0 failed.
22:51:59.325: ERROR - Igt error: **** DEBUG ****
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_dummyload-DEBUG:
Test requirement passed: nengine
22:51:59.325: ERROR - Igt error: (prime_busy:298) CRITICAL: Test
assertion failure function busy, file ../tests/intel/prime_busy.c:114:
22:51:59.325: ERROR - Igt error: (prime_busy:298) CRITICAL: Failed
assertion: poll(pfd, 1, timeout * 1000) == 1
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: Stack trace:
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #0
../lib/igt_core.c:2075 __igt_fail_assert()
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #1
../tests/intel/prime_busy.c:114 test_mode()
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #2
../tests/intel/prime_busy.c:180 __igt_unique____real_main151()
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #3
../tests/intel/prime_busy.c:151 main()
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #4
[__libc_init_first+0x8a]
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #5
[__libc_start_main+0x85]
22:51:59.325: ERROR - Igt error: (prime_busy:298) igt_core-INFO: #6
[_start+0x21]
22:51:59.325: ERROR - Igt error: **** END ****
22:51:59.325: ERROR - Test prime_busy@after-wait: Fail: See
"/results/igt.prime_busy@after-wait.log"
22:51:59.325: DEBUG - End test prime_busy@after-wait
