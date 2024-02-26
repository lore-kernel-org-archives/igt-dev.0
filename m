Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A7DC48BF6
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 19:42:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8D410E7B2;
	Mon, 26 Feb 2024 19:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="dPCuh5e4";
	dkim-atps=neutral
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BA310E7B2
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 19:42:37 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4Tk9xn0fYLz9s6r;
 Mon, 26 Feb 2024 19:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1708976557; bh=SZiaqgakDuFIJEyOwDBGcHTr0YtpJ0TibI/CeUcEDVE=;
 h=From:Subject:Date:To:Cc:From;
 b=dPCuh5e4/gUUUW5d9x7jbLTKfi4tnNUIgaMvWGtNN6YjwOCGNyhZiAO8yEsA8Em5Z
 NZ4FdOtzq+unMMdcvimFD6BM68V2wH0LcKFKAfA7rjLSEmM3iq51okwLYFcAlVAtAH
 X7eY7RW7Y+nLK/57rfsvYAcJm2tsc3kcUzFmYKMk=
X-Riseup-User-ID: 564F44BD97A2B073153F3E8FEFB6D0BCEAE5EFD55D6CE0C3B11303845B9D45EF
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4Tk9xW0v8yzFt7B;
 Mon, 26 Feb 2024 19:42:22 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH i-g-t 0/3] benchmarks/kms_fb_stress: Add command-line
 options to change the planes and writeback formats
Date: Mon, 26 Feb 2024 16:42:16 -0300
Message-Id: <20240226-kms_fb_stress-dev-v1-0-1c14942b1244@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJjp3GUC/x3MSwqAMAwA0auUrC20URS9ikhRm2oQPzQignh3i
 8u3mHlAKDIJNOqBSBcL71uCzRSMc79NpNknAxosDGKpl1VcGJyckUS0p0uPdd6TrcpQGwupOyI
 Fvv9n273vBzaIcDxjAAAA
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
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

With the upcoming addition of YUV format to VKMS[1] it would be great to
test the their performance. To be able to do this, this series adds
command-line options to arbitrarily select the format of each plane and
writeback.

- PATCH #1: Just a non-related assert that I found needed while
  developing the feature
- PATCH #2: The command-line options implementation
- PATCH #3: Log the KMS structure

[1]: https://lore.kernel.org/r/20240226-yuv-v3-6-ff662f0994db@bootlin.com

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
Arthur Grillo (3):
      benchmarks/kms_fb_stress: Assert that we have an supported pipe
      benchmarks/kms_fb_stress: Add command line options to change the planes and writeback formats
      benchmarks/kms_fb_stress: Log the KMS structure

 benchmarks/kms_fb_stress.c | 106 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 92 insertions(+), 14 deletions(-)
---
base-commit: 9ee96f431b2baf552e95c9d839cdfbcdae2c8b41
change-id: 20240226-kms_fb_stress-dev-c93ae176f901

Best regards,
-- 
Arthur Grillo <arthurgrillo@riseup.net>

