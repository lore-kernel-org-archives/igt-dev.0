Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0B8C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 22:18:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E5110F8D5;
	Mon, 22 Apr 2024 22:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="Zlgn9Dnd";
	dkim-atps=neutral
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FC310F8D5
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 22:18:25 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4VNflh3y3wz9v7t;
 Mon, 22 Apr 2024 22:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1713824304; bh=IudQae/tx0u90M2Q/vQE70boVUO1b/vHlIIRwqQN17g=;
 h=From:Subject:Date:To:Cc:From;
 b=Zlgn9DndqIyHs0x02ioJPW/Bw7UqGrR5/7oZ36gNcwepnnJsudOLQAXxosJNPpQHb
 fjAkSBESNnoR1JXqHhqvz9fGYsjGuCSAip8G/V/TbON6o1VsA1HiRjFQcXVuKbwMU7
 fWvGdhaS+A7By0Q9RHfbGTvwHvTDWLX9vvsG69+g=
X-Riseup-User-ID: F4E6F34B1843A51296C254AB99F0822A7593D862E594F4FFF0AC27BC228386A1
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VNfld1by1zFv5M;
 Mon, 22 Apr 2024 22:18:21 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH i-g-t v5 0/8] benchmarks/kms_fb_stress: benchmark formats
Date: Mon, 22 Apr 2024 19:18:15 -0300
Message-Id: <20240422-kms_fb_stress-dev-v5-0-0c577163dc88@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACfiJmYC/33OwW7CMAwG4FdBOZMpTpy24cR7TAglrTuiiRbFX
 cSE+u5LuTBEhW+/pf+zb4IpRWKx29xEohw5jkMJdrsR7ckPXyRjV7LQSqPSupLfZz724chTImb
 ZUZatM56grnqnQJTeJVEfr3fz81DyKfI0pt/7iQzL9p2WQSoJLaBDHUAj7lNk+rl8DDSJhcv6Q
 Rhl1whdiLop401DtjIvhPlP1GuEKURng8PGW4RALwQ+CARYI3D5wje98QiOQngi5nn+A5ynj7V
 8AQAA
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

After some discussion[1], I changed how to tackle the problem. (2x)

With the upcoming addition of YUV format to VKMS[2] it would be great to
test the their performance. So, test all formats available.

- PATCH #1: Just a non-related assert that I found needed while developing
- PATCH #2: Log the KMS structure
- PATCH #3: Moving code, should be noop
- PATCH #4, #5 & #6 : Fix a couple of bugs found while developing
- PATCH #7: Add a enable_overlay flag in preparation for #8
- PATCH #8: The new benchmark that tests performance between format

[1]: https://lore.kernel.org/all/6979cd2e-2b00-4dc4-8e41-66b435cf7ea8@riseup.net/
[2]: https://lore.kernel.org/all/20240304-yuv-v4-11-76beac8e9793@bootlin.com/

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
Changes in v5:
- Move global data variable to main (Kamil Konieczny)
- Create a function for creating fbs named `create_fb` (Kamil Konieczny)
- Move the stride checking to inside the `create_fb`
- Link to v4: https://lore.kernel.org/r/20240411-kms_fb_stress-dev-v4-0-7a8f3a419ebb@riseup.net

Changes in v4:
- Change (again) how the new test is done, now it just uses the primary
  and writeback, and changes the formats based on primary format list.
  (Pekka Paalanen)
- Add an enable_overlay flag, for the new test.
- Remove the addition of command-line flags, as I don't see them that
  useful anymore (Pekka Paalanen)
- Change the RGB565 test to a stride test (Pekka Paalanen)
- Link to v3: https://lore.kernel.org/r/20240307-kms_fb_stress-dev-v3-0-d5b948a541be@riseup.net

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
Arthur Grillo (8):
      benchmarks/kms_fb_stress: Assert that we have an supported pipe
      benchmarks/kms_fb_stress: Log the KMS structure
      benchmarks/kms_fb_stress: Separate the benchmark in a subtest
      benchmarks/kms_fb_stress: Free resources on the stress procedure
      benchmarks/kms_fb_stress: Move FB creation to a separate function
      benchmarks/kms_fb_stress: Don't paint the FB's if the format is not supported by Pixman
      benchmarks/kms_fb_stress: Optionally enable the overlay planes
      benchmarks/kms_fb_stress: Create a benchmark for formats

 benchmarks/kms_fb_stress.c | 227 +++++++++++++++++++++++++++++++++------------
 1 file changed, 166 insertions(+), 61 deletions(-)
---
base-commit: e490cb6ffc497275544b36871c24af0a04f98470
change-id: 20240226-kms_fb_stress-dev-c93ae176f901

Best regards,
-- 
Arthur Grillo <arthurgrillo@riseup.net>

