Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CFBC54798
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 23:15:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ABFA1123F3;
	Tue,  5 Mar 2024 23:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="KZNS3v9X";
	dkim-atps=neutral
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D881F1123F3
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 23:15:47 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4TqBJ31j6fz9vvQ;
 Tue,  5 Mar 2024 23:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1709680547; bh=TTn+h1D4H6RYVXtLQ0auJmzRoA18yVRKIiMyjHcvtuI=;
 h=From:Subject:Date:To:Cc:From;
 b=KZNS3v9X+jtDjsQgAvpl2PLeEwNLoa1ANy/n4HtRV4N3RJw7oi8a254NeJm+Xmb82
 zFqHgEm51UK1NxZmbl4tdpQYlnVkP4txc7EeKUCsIwMzKZ+zXwqtYOuH9kzw8NWIMA
 aZF8pEICerKodHCTC7cuYsVWhXBE6p0xM3cjeZT8=
X-Riseup-User-ID: D78A62F680E9A856D8C5122C465A257C37C24B6E98FDD74815B89DA74EF31623
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4TqBHz2YDXzFvSQ;
 Tue,  5 Mar 2024 23:15:43 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH i-g-t v2 0/7] benchmarks/kms_fb_stress: Test all possible
 combinations of formats
Date: Tue, 05 Mar 2024 20:15:37 -0300
Message-Id: <20240305-kms_fb_stress-dev-v2-0-78888a38e563@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJmn52UC/32NWwrCMBBFt1Lm20hmDJX65T6klD4mdhDbkqlBK
 dm7sQvw8xy4526gHIQVLsUGgaOozFMGOhTQj+10ZyNDZiBLzhKV5vHUxneNroFVzcDR9NWpZTy
 XvrIIebcE9vLem7c68yi6zuGzX0T82X+1iMYa7NFVjjok565BlF/LceIV6pTSF8EUM56zAAAA
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

This is the second version of the series. After some discussion[1],
I changed how to tackle the problem.

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

