Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12D7C3DA4C
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:34:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED0B10E5AE;
	Tue,  9 Jul 2024 15:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="pv9jJai8";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F59610E5B4
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:34:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BCDF52001B;
 Tue,  9 Jul 2024 15:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VzopUP/D77NrcMMElciGIyNELXoO5NJqDvO+KTsOyRM=;
 b=pv9jJai8ctJBRI7kYA/TcTCuwqqUUnBNtqtZKFgVlMgOiAKNpcg08CxmXocdmqlIhyVU/Q
 hgFNiEwv2Jr1nW8vK3GTp7ciomQnbLI5jtyETC33966O4COSdGYBIrIeuKvYfchmEY+IFt
 Lsmxja7fSMOTIUfWEoMaujHJtXHCPqEZ8TaphGA6xThv6JkMR1ZyvOM1uRC0/BfzjlzZk/
 WVXmAhzqnMJ91y09WRkwL+SCW0RMckobCZHjpFZPp7UI+GtQQArasZnh3XAY+JnsHm/tEz
 sxdkUrwYNr2fYta7mrlEva9onhZlba1k8qj7xz1spG2mZHmGeGcWQM7ipqkmWg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:27 +0200
Subject: [PATCH i-g-t v2 11/39] tests/chamelium: Extract Chamelium v2 tests
 into a separate directory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-11-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4504;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=qv991YW8QCGYTIdONi7VsoKfIGRIERDtLPAWASCRiqI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViX6WIVDE5WpsuVjWNah7D+6oPXGKfCIh5tH
 GdjlCKkTC6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YlwAKCRAgrS7GWxAs
 4mfwEACdYtjurpoU9z/Myb5EE3/82ei87qCfcTIYNiZOkrN6Fjvzu8N+fcliSGoEOSZTso0d6iC
 E+SejhWvfTH1aFNmUe2v8OkLdJIkW25/NStD3fjXADUPwapEH2ZaJYkVNfnQnXjsFNMV0jZE/6Z
 1ycTEaI6BeVb1E7aeKqpmj4iDd8tIPKxM+lEyRozZOq6ShtNfMKkTBXKgZ8Q2nvnLFcqeAnssy2
 9KbNLszg11fj950TsL1vUnoNAHJGzfVL6LVw2H5R8TkpwJHQR2xBtAKwGOj9glvHWHxyV/RVwe4
 CS8Al20R0dWXFRpsg7fQBvZtZ47QAkxJpvHPvNotVyCkoMSC83+UTeDo7nj8bGf2y4jmOcT2Uvz
 J0hpEu990NQm4VVQGyrikh1B0dJISTLAVvvtp6ztiGn7mJpFs7OqkYBmXiuXTswABDDJkuzgN2Q
 H8UsJA7QBptv06duW8qieDGzlRT1CaiYqVA9i6/O8aX90ZhRHAY33OdMyeyOosFPADd0vZS5zmz
 cQEb0R17L8g6E70cqGmKj5j7cHKgX5ZKb/hvt6jbpmhuSld6tOAfGNE+krgLy4QJhD1PueLt31f
 Dr+p5YFNYBHsl6ZgJfi9P6kUfn6AgQx934GCNjnaRl1Q20KtzEEYmxsHey2kffgSzx+JcVeBby3
 7U/kzf+DqNiigEg==
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
index 357db2723005..30cd7982ea77 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -342,11 +342,11 @@ extra_sources = {
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
@@ -422,7 +422,7 @@ endforeach
 if chamelium.found()
 	foreach prog : chamelium_progs
 		testexe = executable(prog,
-				 [join_paths('chamelium', prog + '.c')] + extra_sources.get(prog, []),
+				 [join_paths('chamelium', 'v2', prog + '.c')] + extra_sources.get(prog, []),
 				 dependencies : test_deps + extra_dependencies.get(prog, []),
 				 install_dir : libexecdir,
 				 install_rpath : libexecdir_rpathdir,

-- 
2.44.2

