Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668A1C54798
	for <igt-dev@archiver.kernel.org>; Thu,  7 Mar 2024 19:41:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0C210ED94;
	Thu,  7 Mar 2024 19:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="kaXwy4uV";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1DD10ED94
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2024 19:41:15 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4TrKRZ65t1zDqP1;
 Thu,  7 Mar 2024 19:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1709840475; bh=FgdoJkiuCYLXUxY47RzlcksaItfRuTsdiZQXD9kQxGU=;
 h=From:Subject:Date:To:Cc:From;
 b=kaXwy4uVsFh0sYjZ4D30EnszUMqU/H4j7v9UrFF7uAKOOXqGEOkGr0SoBhTyDQj3f
 9Fv1rQG8L670gwqd44iSu5HIxO/QoertgYjT1WXTif9m2k0OnJDaLgzfdDrSHEr4k3
 scI/Z9mTxsFCj2OcHwXbDrdjNY6cI6q6gFdB1XPg=
X-Riseup-User-ID: 8931EB31B7E93915F66040502748CDC0BB733F8DE584512C7E8D3C4EFC15FF14
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4TrKRW3MpBzJtT4;
 Thu,  7 Mar 2024 19:41:11 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH i-g-t v3 0/7] benchmarks/kms_fb_stress: Test all possible
 combinations of formats
Date: Thu, 07 Mar 2024 16:41:02 -0300
Message-Id: <20240307-kms_fb_stress-dev-v3-0-d5b948a541be@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE4Y6mUC/33N2wrCMAyA4VcZvbbSpt3xyvcQGTtkLojbaGZRx
 t7dbjciiLn7A/myCEZHyKKIFuHQE9M4hDCHSDR9NVxRUhtagAKrABJ5u3PZ1SXPDplli142ual
 Qp0mXKy3C3eSwo+duni+he+J5dK/9hdfb9p/mtVRSN9rmFmoN1p4cMT6m44Cz2DgPH8Ko+BcBg
 UizMJXJME7MF7Gu6xuWv1k39gAAAA==
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Arthur Grillo <arthurgrillo@riseup.net>
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

After some discussion[1], I changed how to tackle the problem.

With the upcoming addition of YUV format to VKMS[2] it would be great to
test the their performance. So, test all possible combinations of
formats.

Also, to focus in an combination subset, add command-line options to
arbitrarily select the format of each plane and writeback.

- PATCH #1: Just a non-related assert that I found needed while developing
- PATCH #2: Log the KMS structure
- PATCH #3: Moving code, should be noop
- PATCH #4 & #5: Fix a couple of bugs found while developing patch #6
- PATCH #6: Test all possible combinations
- PATCH #7: Add command-line options

[1]: https://lore.kernel.org/all/6979cd2e-2b00-4dc4-8e41-66b435cf7ea8@riseup.net/
[2]: https://lore.kernel.org/all/20240304-yuv-v4-11-76beac8e9793@bootlin.com/

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
Changes in v3:
- Make the help message and commit message more clear on how the
  command-line options work (Louis Chauvet)
- Link to v2: https://lore.kernel.org/r/20240305-kms_fb_stress-dev-v2-0-78888a38e563@riseup.net

Changes in v2:
- Change how the command-line options work, now they pin the specific
  format and let the other change.
- Add a patch to test all the possible formats combination
- Add a couple of patches to fix some bugs
- Move the KMS logging patch to the beginning of the series
- Move the default_kms definition to the static struct data_t variable
- Link to v1: https://lore.kernel.org/r/20240226-kms_fb_stress-dev-v1-0-1c14942b1244@riseup.net

---
Arthur Grillo (7):
      benchmarks/kms_fb_stress: Assert that we have an supported pipe
      benchmarks/kms_fb_stress: Log the KMS structure
      benchmarks/kms_fb_stress: Move the stress procedure to its own function
      benchmarks/kms_fb_stress: Free resources on the stress procedure
      benchmarks/kms_fb_stress: Don't paint the FB's if the format is DRM_FORMAT_RGB565
      benchmarks/kms_fb_stress: Test every possible format combinations
      benchmarks/kms_fb_stress: Add command line options to pin the planes or writeback formats

 benchmarks/kms_fb_stress.c | 342 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 273 insertions(+), 69 deletions(-)
---
base-commit: 32369affc1fdb8194c4e7274d1d4dfd74f4aae88
change-id: 20240226-kms_fb_stress-dev-c93ae176f901

Best regards,
-- 
Arthur Grillo <arthurgrillo@riseup.net>

