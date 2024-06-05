Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5D9C27C5F
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 14:30:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361AC10E7D0;
	Wed,  5 Jun 2024 14:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nyIcNo7d";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB2110E23F
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 14:30:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A125A4000D;
 Wed,  5 Jun 2024 14:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1717597818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aR9/FeICJ+9Sbb2CRjBFucU/yBXXsB1jpfbkjnApo0E=;
 b=nyIcNo7d//gKeaSwNwnB7iTQudgmiCNb06NyFPS0LfnSfXt9FO9ZU9+AJLeJV+hFy8mK7P
 2x2FMeQk+G1zTvOLYaSivU7SIUVhshHeAyt69hi0QFPfcPUsOpSRF4f9r4qr77BiFc+E9M
 FlX2h7xiZh+Q0TWpfteC1sA4Ysm2fa4/mrY90JQPbmUxREECVxxhAKAvsjc6z08M7vezGR
 7IggYyQKW8lBByM6O5amx+bjixGwfacRwVYEMzmaXOAzjfdKhaicA6VpvvPMRdAR+kHTxY
 Hp19HowLHXEMh86sOqgL2Rkupy4GpoLoOzJnCcWG+4cC93eVhxvLaOjuH7eehA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 05 Jun 2024 16:30:13 +0200
Subject: [PATCH i-g-t RFC 01/13] tests/chamelium: Extract chamelium v2
 tests into its own directory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-dev-remove-static-ports-v1-1-665f25b7a4db@bootlin.com>
References: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
In-Reply-To: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4502;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Pa3CDHRN54G3lmCC8N8Kr4FMzhLlBc9Go8vXZZj0MZE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmYHZ3QrHaHSGrvLsSZeBSE/4diJK6siaPodU1p
 7GWX6wD7ViJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZmB2dwAKCRAgrS7GWxAs
 4qxaD/9WMlVBibJA+7V2u6vbIVF2JozsfF9OBGy+pxy1pZhp58iIQdOauj89kFLoze7Dq4Fo87p
 h3FthF3RD62HwGnk7PC2oU/edzZKcOseG1hlspKeKsIoLQon9bVBStbWwP6YGQp89ahdnDgqhSP
 JifKka8ZyswAcQ6YAVw0qJo1OiEVtFfmBOoCqOWZqZ3FzKbHykYcS53+dRxnNEHJyXEpKf2MHIp
 XFjfr7HFm/ltBannrtiHTazxtopPOEcdXTQRg12wuA6fvY30W/G8Z3jJsehk8OZWnn+9/yl58QX
 iOBakcD/QevRW9mwuzFiP2+1fk9BdyrTd33A8hKkE57NGYNBgfISosJNSg+k/PZffeZxRuGfV9m
 DuG3Vj017dKqFor9s/YuudsRrsVwUZg/d1n0QLFCiXmjNQIS72tInjtYTn4AQFNhDggyvcl+SqU
 u9WbUdHxhmnlnZVrCZoZTLTKINzM7aMyepPfRJ5phQ8lLlOPYbQTRBuGVALoZU92tlIwBkcbfOn
 U+vCIwv2gx8QmaU4l1MXlrpdHIn+qh4CIoGg+hwKNd9emRNu/+UK62waCrea9o4Dqa4DYw9TeMn
 LUS7zGfApb/rwKP6b/RLVYi1jUiHWfjL3QN/AadoAmfNjxJbnUl7xm++MRGcNzkNNyWn6h6cFtM
 /F38DOn96YZjnIQ==
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

In preparation for the Chamelium v3, the chamelium v2 tests are
moved in its own directory.

The two Chamelium versions have different sets of functionality (audio,
MST, CRC computation, etc.). As most of the tests will need to be
rewritten to works with chamelium v3, to avoid breaking them, it is
simpler to create new ones for v3.

The current identified complexities that necessitate a thorough rework of
the existing v2 tests are:

 - Not all ports are discoverable in v3 (MST ports are not physical
   ports, but they can have EDID, be plugged, etc.), and they can change
   over time.
 - The v3 is unable to perform CRC computation
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
index 758ae090c927..6063a02962a2 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -352,11 +352,11 @@ extra_sources = {
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
@@ -440,7 +440,7 @@ endforeach
 if chamelium.found()
 	foreach prog : chamelium_progs
 		testexe = executable(prog,
-				 [join_paths('chamelium', prog + '.c')] + extra_sources.get(prog, []),
+				 [join_paths('chamelium', 'v2', prog + '.c')] + extra_sources.get(prog, []),
 				 dependencies : test_deps + extra_dependencies.get(prog, []),
 				 install_dir : libexecdir,
 				 install_rpath : libexecdir_rpathdir,

-- 
2.43.2

