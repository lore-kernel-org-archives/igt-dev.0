Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FA3EEE277
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 00:44:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEE110EC8A;
	Fri, 13 Sep 2024 00:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="Fcl/2Fzm";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768F210EBE9
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 00:44:56 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4X4b6Z5lh6zDqS1;
 Fri, 13 Sep 2024 00:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1726187975; bh=ojbBt3VogtzOonWaVg8SOhxt4p1Dtfq7F8bNW8DK0ZI=;
 h=From:Subject:Date:To:Cc:From;
 b=Fcl/2FzmagBnsLzNC6b0j/vzlrNUy/jlZDgg8WGz7hAAZCmLpSSBeSW9W5325A/RH
 VQ+NTDGp3XtGtq/30eLPNvCPCD3SoNjMJwSVyNODLIp9ID/fxwIW3vkNlDT+W5vSNx
 JcniZiZQ9Wfl+m8uhzMYMA8Yls6gJYSeORGAiSac=
X-Riseup-User-ID: 5617B5AF49F021346EC8CCBB2C2F4423E6CEFE31B6B28596EE287B9AB160E591
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4X4b6W632lzFs2w;
 Fri, 13 Sep 2024 00:39:31 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH i-g-t v6 00/12] benchmarks/kms_fb_stress: benchmark formats
Date: Thu, 12 Sep 2024 21:39:24 -0300
Message-Id: <20240912-kms_fb_stress-dev-v6-0-71e9a65397e9@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALyJ42YC/33OTWrDMBAF4KsErauikUY/zqr3KCFI8rgRpU6QH
 NESfPfK2STFprN7A++bubFCOVFh+92NZaqppPPYgnnZsXjy4wfx1LfMpJAopDT886sch3AsU6Z
 SeE+Vx055AmuGTgBrvUumIX3fzfdDy6dUpnP+uZ+osGz/0ypwwSECdigDSMS3nApdL68jTWzhq
 nwQSugtQjbCujZeOdJGrQj1TNgtQjWi16FD5zVCoBWBDwIBtghcvvBuUB6hoxBWhH4ipNwidCN
 E1NaCUX107g8xz/MvlVJLhb8BAAA=
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
test the their performance. So, create a test for the primary plane
formats and a test for the writeback formats

- PATCH #1: A fix from a breaking change introduced on commit
  dc2d7fb4f978 ("lib/igt_kms: move setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback")
- PATCH #2: Just a non-related assert that I found needed while developing
- PATCH #3: Log the KMS structure
- PATCH #4: Moving code, should be noop
- PATCH #5, #6 & #7 : Fix a couple of bugs found while developing
- PATCH #8 Move code to out of a loop (noop)
- PATCH #9: Add a enable switch for every plane. Preparation for the
  next couple commits
- PATCH #10: Add benchmark that tests primary plane formats performance
- PATCH #11: Add benchmark that tests writeback formats performance
- PATCH #12: Add new YUV formats to IGT that will be supported by VKMS

[1]: https://lore.kernel.org/all/6979cd2e-2b00-4dc4-8e41-66b435cf7ea8@riseup.net/
[2]: https://lore.kernel.org/all/20240304-yuv-v4-11-76beac8e9793@bootlin.com/

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
Changes in v6:
- Set DRM_CLIENT_CAP_WRITEBACK_CONNECTORS before igt_require, needed
  after commit dc2d7fb4f978 ("lib/igt_kms: move setting
  DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback")
- Split test into a primary plane and writeback tests (Louis Chauvet)
- Add new YUV formats
- Add KMS logging only after adding the enable switches to avoid some
  changing of new code throughout the patches
- Adhere to the new igt_calc_fb_size() API. Commit 83d7d630cff0
  ("lib/igt_fb: Make igt_calc_fb_size() somewhat usable") changed how
  the igt_calc_fb_size() is called.
- Link to v5: https://lore.kernel.org/r/20240422-kms_fb_stress-dev-v5-0-0c577163dc88@riseup.net

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
Arthur Grillo (12):
      benchmarks/kms_fb_stress: Set DRM_CLIENT_CAP_WRITEBACK_CONNECTORS before igt_require()
      benchmarks/kms_fb_stress: Assert that we have a supported pipe
      benchmarks/kms_fb_stress: Separate the benchmark in a subtest
      benchmarks/kms_fb_stress: Free resources on the stress procedure
      benchmarks/kms_fb_stress: Move FB creation to a separate function
      benchmarks/kms_fb_stress: Don't paint the FB's if the format is not supported by Pixman
      benchmarks/kms_fb_stress: Set writeback rectangle size outside the loop
      benchmarks/kms_fb_stress: Add enable switches for every plane
      benchmarks/kms_fb_stress: Log the KMS structure
      benchmarks/kms_fb_stress: Create a benchmark for primary plane formats
      benchmarks/kms_fb_stress: Create a benchmark for writeback formats
      lib/igt_fb: Add non sub-sampled YUV formats

 benchmarks/kms_fb_stress.c | 320 ++++++++++++++++++++++++++++++++++++---------
 lib/igt_fb.c               |  46 +++++++
 2 files changed, 304 insertions(+), 62 deletions(-)
---
base-commit: 72661cec25b3b81c46dbe57bb9953f554d88626f
change-id: 20240226-kms_fb_stress-dev-c93ae176f901

Best regards,
-- 
Arthur Grillo <arthurgrillo@riseup.net>

