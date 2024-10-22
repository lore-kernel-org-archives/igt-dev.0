Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0524D2C562
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 14:49:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDFD10E6AD;
	Tue, 22 Oct 2024 14:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oF4gulfA";
	dkim-atps=neutral
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAFB10E6A2
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 14:49:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B5C6FF808;
 Tue, 22 Oct 2024 14:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729608580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/Ds6pGqz/aPrX29UCSui18E5GwcUWxn7sPqeAVqI4lg=;
 b=oF4gulfAMzX8tdNTsSLWqSgnnllX0lqrqb2Ck7WDIjIm6G62fE0cGxUhndMIPuUR/9JkDX
 pKFmBHaqb6TPIHdgXlTaoZ/F4pAYUj/1frCgzPtwIFv4iuWDPLd2b/YMWVN4BWOzMZ/zZH
 Qo+LKKLj0z3gBKypudWXRz421N0iGuGmy+FR4WBtDhujNZg75Ujw/RDbHwamTKo9aHX002
 RHq8xpdFY6xB5qCO1vzBEIvoQ18WTyDKxTMs9tJr7qxE53EOjxAxxgbXVibCmVsOPxniJN
 loI8eusc9bK5jqZCUKG+nNOtX1hosXLzIdwFFTYnmKiNcpTVXtgQ/vuH6mIyvg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t 0/4] lib/chamelium: Move chameliumv2 support in its
 own directory
Date: Tue, 22 Oct 2024 16:49:32 +0200
Message-Id: <20241022-b4-cv3-03-cv2-split-v1-0-9f7cc8591ff9@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH27F2cC/4WOy24DIQxFf2XEuk7BMMxj1f+osphhnKnVAAnQq
 FKUfw95KFJXXVnXls+5Z5EpMWUxNmeR6MSZY6hBvTXCfU1hJeClZoESjexxgNmAO2mQug6EfNh
 zAdNpN6BBq6gV9fOQaMe/d+qnYFihiO1jnej4Ux3leZunTOCi91zGJiZeObz7KRdKN4ynnKd7g
 7G5+ZVEfPkV8Frg22eoNST0O9saO5i5VfpjjrHsOWwq+V8Ogo+BS0xACy9PWme16XrrUJH9Q9t
 eLlfDiCQdMwEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3521;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=qKXGZQr3ibJJbJ8m6phVUj/ftsII+6BZ85ljiRSpWGY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnF7uB4TN+QWPTfmaj4Seo3AUWkEP83ylnTUUDX
 +343/ehZzeJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZxe7gQAKCRAgrS7GWxAs
 4kaMD/0YncWwzZ0ynPdlSp9Gu56XVZSyxnbPUPHdKs6GnSak417MmzGxDzjM/htcBinfUImR5xq
 v3LoNb6frxUxrQfy8b8WMjFxCK8NJfYS67kZGLikLaX8rPYnoUuahlTl/zRkcY8uz9bCJ/l0h+1
 +YHtJ52K8CHctSsTltppKSZQz2qy64SCK6Pau9ZXivezDBaU0AWvbHqGv16HfkZNasmhAP62Pf8
 O2l4B/6dlgCcC+3erQuL0qApjI5zEPVRfWX8ykziTm/iJwXxH2FtTSC5r4pGEBX+T9ZKsdHu9c8
 F7TS57i0ntiwkVDGvaUru9gPBR+06C3wW996g7CtuYjpyXZ1wDRie641fMK10rtln2As7IOVjtc
 4wY6x89IXgzhjDLM4qyyhpPFkWp1WDd9fuKBil4blZNzVimWalX8EHIfQUChHRRqmQO8LsbmL0f
 pHksfqn5EQmKnnyL0yk3iRAf0HWICm4QSBol40TYr5/1RhtD49+UWlbkVWKhMEUXHh22Fva6xzZ
 dGV4l+Snq5+dGtdklCFmNYNL+OUp3/wxvzBDzFhNKPe9kvhIOtV0b/KFyP29IDpy6NDN1tN8Duw
 CoIGWROR6GuAa/H2F7I4NGu6OGNF3g+/HkTkfHRdk4UCSRdxSqG3IrU+DPrsPsN883+SKlqXwxC
 YUXgQP0IIz1gS6g==
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

In preparation for the introduction of Chameleon v3, this series move 
the chamelium v2 support in its own folder.

Few rename are done to avoid confusion between chamelium v2 and chamelium 
v3 code.

This series have a small conflict with [1]. If you want to reverse the 
order of the series, let me know, I will resend a new iteration.

[1]: https://lore.kernel.org/all/20240828-b4-cv3-02-monitor-edids-v1-0-29c846bcf251@bootlin.com/

In addition, this series is in conflict with at least:
-https://lore.kernel.org/igt-dev/20241018035914.1740924-1-pranay.samala@intel.com
-https://lore.kernel.org/igt-dev/20241018190627.1367970-1-swati2.sharma@intel.com

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Louis Chauvet (4):
      tests/chamelium: Extract Chamelium v2 tests into a separate directory
      lib/chamelium/v2: Extract chamelium v2 wrapper into its own directory
      lib/chamelium/v2: Rename chamelium to chamelium_v2
      lib/chamelium/v2: Rename HAVE_CHAMELIUM to HAVE_CHAMELIUM_V2

 .gitlab-ci.yml                                  |  2 +-
 docs/testplan/meson.build                       |  4 ++--
 lib/{ => chamelium/v2}/igt_chamelium.c          |  2 +-
 lib/{ => chamelium/v2}/igt_chamelium.h          |  0
 lib/{ => chamelium/v2}/igt_chamelium_stream.c   |  2 +-
 lib/{ => chamelium/v2}/igt_chamelium_stream.h   |  0
 lib/igt.h                                       |  6 +++---
 lib/igt_kms.c                                   |  6 +++---
 lib/meson.build                                 |  9 ++++++---
 lib/monitor_edids/monitor_edids_helper.h        |  2 +-
 lib/tests/meson.build                           |  4 ++--
 meson.build                                     | 18 +++++++++---------
 meson_options.txt                               |  4 ++--
 tests/chamelium/{ => v2}/kms_chamelium_audio.c  |  0
 tests/chamelium/{ => v2}/kms_chamelium_color.c  |  0
 tests/chamelium/{ => v2}/kms_chamelium_edid.c   |  2 +-
 tests/chamelium/{ => v2}/kms_chamelium_frames.c |  0
 tests/chamelium/{ => v2}/kms_chamelium_helper.c |  0
 tests/chamelium/{ => v2}/kms_chamelium_helper.h |  0
 tests/chamelium/{ => v2}/kms_chamelium_hpd.c    |  0
 tests/kms_color_helper.h                        |  2 +-
 tests/kms_feature_discovery.c                   |  6 +++---
 tests/kms_tiled_display.c                       |  6 +++---
 tests/meson.build                               | 18 +++++++++---------
 24 files changed, 48 insertions(+), 45 deletions(-)
---
base-commit: 9b8c0f6da8898f760bfaa2113455eb84b68a69f4
change-id: 20240829-b4-cv3-03-cv2-split-473c924261e5
prerequisite-message-id: 20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com
prerequisite-patch-id: 0562bbe57a0b489e7f46a51717c54ea26296cb8c
prerequisite-patch-id: a16d6fdd238eab5a91630d0934c9186669406fc7
prerequisite-patch-id: c7fcc64d709f283da748a0f9bbe3bd6143d76300
prerequisite-patch-id: 09fc5e2f569fa8287e767ceb353bc0a0f94ae2e1
prerequisite-patch-id: 63cf2f6323333bb8cbd0dbbd883b5c9fe373dea1
prerequisite-message-id: 20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com
prerequisite-patch-id: 90ffdddeda6dd4cd2ae64e60fb31b0bbfee0250f
prerequisite-patch-id: d62e9d4981a68ac6e71544ab2a3dfec37dfa3299
prerequisite-patch-id: 3d898f58702cc303e18d3afc487e46f68641989b
prerequisite-patch-id: 57f5446073d42a01c29e6ff8a24f6609eedb49a1
prerequisite-patch-id: e6d6ee4ecd0e738a60091b19449c8622bb8bb6ae

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

