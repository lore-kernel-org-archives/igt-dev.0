Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9119AC4345F
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 19:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1880010F2E5;
	Thu, 11 Apr 2024 19:41:29 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6535010F2E5
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 19:41:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8FD220007
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 19:41:24 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a51c37a5025so20236666b.1
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 12:41:24 -0700 (PDT)
X-Gm-Message-State: AOJu0YxKx2fhbXJs5/sKXqTWL80UX2cEF2+/Zn5lAGwQyunQA+WQsaf/
 zSaA2IboTG1mHjLsmXeXvs+d7QgnFX0jW9z29+BBUwvkSXSFhIRLluPAQuwLrpnjfeM1Z60GYh7
 kgOKUkD/H9Vp//28/NxR0BZLILCk=
X-Google-Smtp-Source: AGHT+IFzF3nXy7X9W7vmOf71vv2RmZSIymW0cLKzy3QDZ2ecVyz2j6dUHLXuaHs+FbmEaeagV3ZMmjkLs5f7IaQ70WQ=
X-Received: by 2002:a17:906:4ad6:b0:a51:9575:e566 with SMTP id
 u22-20020a1709064ad600b00a519575e566mr404301ejt.33.1712864484152; Thu, 11 Apr
 2024 12:41:24 -0700 (PDT)
MIME-Version: 1.0
From: Peter Senna Tschudin <me@petersenna.com>
Date: Thu, 11 Apr 2024 21:41:11 +0200
X-Gmail-Original-Message-ID: <CA+MoWDqANoCnEUbZ1s+rbH=KMttjX+xobRze3EM-PLZMfSFHfg@mail.gmail.com>
Message-ID: <CA+MoWDqANoCnEUbZ1s+rbH=KMttjX+xobRze3EM-PLZMfSFHfg@mail.gmail.com>
Subject: tests/intel/gem_exec_capture: changing the test size breaks the run
To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-GND-Sasl: me@petersenna.com
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
Reply-To: peter.senna@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Dear list,

After my change*, most of the subtests from gem_exec_capture work, but
only if called one by one using --run-subtest. Here is an example:

$ sudo ./builddir/tests/gem_exec_capture --run-subtest many-4k-incremental
IGT-Version: 1.28-gd54e42369 (x86_64) (Linux: 6.8.4-200.fc39.x86_64 x86_64)
Using IGT_SRANDOM=1712863518 for randomisation
Opened device: /dev/dri/card1
Starting subtest: many-4K-incremental
Target died after 20.010192s
Captured 0 1-blobs out of a total of 131072
Subtest many-4K-incremental: SUCCESS (22.813s)

$ sudo ./builddir/tests/gem_exec_capture --run-subtest many-2M-incremental
IGT-Version: 1.28-gd54e42369 (x86_64) (Linux: 6.8.4-200.fc39.x86_64 x86_64)
Using IGT_SRANDOM=1712863571 for randomisation
Opened device: /dev/dri/card1
Starting subtest: many-2M-incremental
Target died after 20.059585s
Captured 0 512-blobs out of a total of 256
Subtest many-2M-incremental: SUCCESS (20.443s)

When not specifying the sub-test the same tests will fail. Here is the
code that calls the tests when no sub-test is set:

    igt_subtest_f("many-4K-incremental") {
        igt_require(gem_can_store_dword(fd, 0));
        many(fd, dir, 1<<12, INCREMENTAL);
    }

    igt_subtest_f("many-2M-incremental") {
        igt_require(gem_can_store_dword(fd, 0));
        many(fd, dir, 2<<20, INCREMENTAL);
    }

The test many-4K-incremental will succeed and the test
many-2M-incremental will fail. I noticed that changing the parameter
size of the function many() is what causes the test to fail. This
means you can successfully call many() as many times as you want,
given all calls use the same value for size. Now see the following
code:

    // This will succeed but "Captured 0 1-blobs out of a total of 131072"
    igt_subtest_f("many-4K-incremental") {
        igt_require(gem_can_store_dword(fd, 0));
        many(fd, dir, 1<<12, INCREMENTAL);
    }

    // This will fail
    igt_subtest_f("many-2M-incremental") {
        igt_require(gem_can_store_dword(fd, 0));
        many(fd, dir, 2<<20, INCREMENTAL);
    }

    // Captured 256 512-blobs out of a total of 256
    igt_subtest_f("many-2M-incremental") {
        igt_require(gem_can_store_dword(fd, 0));
        many(fd, dir, 2<<20, INCREMENTAL);
    }

There are two oddities:
 - First: simply running the same test again makes it succeed.
 - Second: Running the same test a second time changes the value of
Captured from 0 to max.

Besides calling the test twice, closing and reopening the fd will also
make the calls  succeed.

My first idea was that there was some memory content that was causing
the issue, but I found no evidence of that.

Do you have ideas I can explore to try to find out what is going on here?

Thank you,

Peter


* - https://patchwork.freedesktop.org/series/132291/
