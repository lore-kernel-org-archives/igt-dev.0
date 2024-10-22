Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1125D2C561
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 14:49:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1BCB10E1F4;
	Tue, 22 Oct 2024 14:49:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mHf3vyhv";
	dkim-atps=neutral
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A287110E69E
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 14:49:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 94131FF805;
 Tue, 22 Oct 2024 14:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729608581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AKdHUE9hCReNawyxJ2c1bWwkjoU2oSN+DM5Pzq0NuqU=;
 b=mHf3vyhvSJxOUsI8uuuX/NBihkCt7cTliDnRD5VII5Wc+YNoAMUKF0485LFWWJPXcX2yMK
 B9XLqjDctHaNYjd5iom7PBp6q7SXX/kde93aYQ1YdgwDgawoaJ+3VimlDodhpraHnQbpQ9
 1ikKpTHcu//mVop85whs4qD16CMagAf9I1iRhBbig4QmuqxeEKVuoE5F8wSK4/5UZkQuJz
 73uAxRYByAOO4JtZMrBaspATWwBWEceVL+1c0XRodD91OU20UT6lFPoZev387S7htyozdS
 mK2LHGLNrznEh0DEQvq/e/tfEiwcJkCJy2cUn95IjVhiY6AAoBG2Squ+XOGVUA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 22 Oct 2024 16:49:33 +0200
Subject: [PATCH i-g-t 1/4] tests/chamelium: Extract Chamelium v2 tests into
 a separate directory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-b4-cv3-03-cv2-split-v1-1-9f7cc8591ff9@bootlin.com>
References: <20241022-b4-cv3-03-cv2-split-v1-0-9f7cc8591ff9@bootlin.com>
In-Reply-To: <20241022-b4-cv3-03-cv2-split-v1-0-9f7cc8591ff9@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, nicolejadeyee@google.com, 
 seanpaul@google.com, jeremie.dautheribes@bootlin.com, markyacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com, 
 20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4504;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=3T/E5TaHaKM+614VmfLXM/BJGizD1960ooupPYJ3oxM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnF7uBKE3ksfqOMTC7Q8NbWKdqhYnezaKjbsAXm
 Ggh0WHu/eSJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZxe7gQAKCRAgrS7GWxAs
 4r4PD/0dLvHCpJ42nVLnv+ThKtinQ4xqR/E25E9wDMx+V25TqTCRqnFyiYgvtPqsPyqqnQE1h9q
 Th6vKNBbUJc5Un5KG4ybrvPUmdw+VeqmYU5dujY2tDivPD+DwQfdGJT1QabrmnZnnRHLKCjSOgj
 YFXv4f5eHjJelFDWew2a5RnhgO7B49DboImxqA0IENtMLFAFYbtGjLtdYrbbTPzjRGzTZD3LPVm
 2kkQONnUA23dUdbAok299m8W23JNviI2H4hCDVCCQvWS/nM6QdgBWNS8uHuLGVxLhSw8nL6lAwR
 ZmPA1Pqz8qOHOZDM2ZlpnN+YIpDCQI8MOdoBNPuJ8EXJkIsFpRlfHSP5LoJcTZct9QobZOwhO67
 ZjT4gLnEk02mlzAMHHmCAhnwN/wHnEgJXPrrEF27Gfxj0HR3aDDH9tN7TEjThCm8XLywU9d6E99
 bemRQQeHXUarkg27L9an8kU7klqyJWJnflos3N3g+vvRlsfSmguXKs5sj+QtO6NHmy33lwKJwXr
 3eglCg0liB8GRU+QHN4pDFFnXZW3fO51ytcl8b6vKCseOf2T7UzNLS7eqTVLz5oIIjjRoVVpFZ/
 dpO7mCwTtPtPnLk0aM4n5B+5KhVUsymevsD4nGj4CUl5UKyJcphp7crNKJRF3iBl5sPdtWGVZe5
 ikK/yNAS7PrzQAw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

In preparation for Chamelium v3, the Chamelium v2 tests have been moved to
their own directory.

The two Chamelium versions have different sets of functionality (audio,
MST, CRC computation, etc.). Since most of the tests will need to be
rewritten to work with Chamelium v3, it is simpler to create new ones for
v3 to avoid breaking the existing tests.

The following complexities necessitate a thorough rework of the existing
v2 tests:

 - Not all ports are discoverable in v3 (MST ports are not physical
   ports, but they can have EDID, be plugged, etc.), and they can change
   over time.
 - The v3 is unable to perform CRC computation.
 - Not all ports can be plugged at once, which is a feature used by the
   existing v2 wrapper to set up the Chamelium.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/chamelium/{ => v2}/kms_chamelium_audio.c  |  0
 tests/chamelium/{ => v2}/kms_chamelium_color.c  |  0
 tests/chamelium/{ => v2}/kms_chamelium_edid.c   |  0
 tests/chamelium/{ => v2}/kms_chamelium_frames.c |  0
 tests/chamelium/{ => v2}/kms_chamelium_helper.c |  0
 tests/chamelium/{ => v2}/kms_chamelium_helper.h |  0
 tests/chamelium/{ => v2}/kms_chamelium_hpd.c    |  0
 tests/meson.build                               | 10 +++++-----
 8 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/v2/kms_chamelium_audio.c
similarity index 100%
rename from tests/chamelium/kms_chamelium_audio.c
rename to tests/chamelium/v2/kms_chamelium_audio.c
diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/v2/kms_chamelium_color.c
similarity index 100%
rename from tests/chamelium/kms_chamelium_color.c
rename to tests/chamelium/v2/kms_chamelium_color.c
diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/v2/kms_chamelium_edid.c
similarity index 100%
rename from tests/chamelium/kms_chamelium_edid.c
rename to tests/chamelium/v2/kms_chamelium_edid.c
diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/v2/kms_chamelium_frames.c
similarity index 100%
rename from tests/chamelium/kms_chamelium_frames.c
rename to tests/chamelium/v2/kms_chamelium_frames.c
diff --git a/tests/chamelium/kms_chamelium_helper.c b/tests/chamelium/v2/kms_chamelium_helper.c
similarity index 100%
rename from tests/chamelium/kms_chamelium_helper.c
rename to tests/chamelium/v2/kms_chamelium_helper.c
diff --git a/tests/chamelium/kms_chamelium_helper.h b/tests/chamelium/v2/kms_chamelium_helper.h
similarity index 100%
rename from tests/chamelium/kms_chamelium_helper.h
rename to tests/chamelium/v2/kms_chamelium_helper.h
diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/v2/kms_chamelium_hpd.c
similarity index 100%
rename from tests/chamelium/kms_chamelium_hpd.c
rename to tests/chamelium/v2/kms_chamelium_hpd.c
diff --git a/tests/meson.build b/tests/meson.build
index 34b87b125bf2..4cb199d34527 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -358,11 +358,11 @@ extra_sources = {
 	'dumb_buffer': ['dumb_buffer.c' ],
 	'testdisplay': [ 'testdisplay_hotplug.c' ],
 	'kms_color':  [ 'kms_color_helper.c' ],
-	'kms_chamelium_audio': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
+	'kms_chamelium_audio': [ join_paths ('chamelium', 'v2', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_color':  [ 'kms_color_helper.c' ],
-	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
-	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
-	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
+	'kms_chamelium_edid': [ join_paths ('chamelium', 'v2', 'kms_chamelium_helper.c') ],
+	'kms_chamelium_frames': [ join_paths ('chamelium', 'v2', 'kms_chamelium_helper.c') ],
+	'kms_chamelium_hpd': [ join_paths ('chamelium', 'v2', 'kms_chamelium_helper.c') ],
 	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
 	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
 }
@@ -438,7 +438,7 @@ endforeach
 if chamelium.found()
 	foreach prog : chamelium_progs
 		testexe = executable(prog,
-				 [join_paths('chamelium', prog + '.c')] + extra_sources.get(prog, []),
+				 [join_paths('chamelium', 'v2', prog + '.c')] + extra_sources.get(prog, []),
 				 dependencies : test_deps + extra_dependencies.get(prog, []),
 				 install_dir : libexecdir,
 				 install_rpath : libexecdir_rpathdir,

-- 
2.46.2

