Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD3DEA8130
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 16:10:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3653E10E5C3;
	Tue, 10 Feb 2026 16:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hit+SoYJ";
	dkim-atps=neutral
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABBD10E5C3
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 16:10:04 +0000 (UTC)
Received: by mail-dl1-f44.google.com with SMTP id
 a92af1059eb24-1270ac5d3efso3647685c88.1
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 08:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770739803; x=1771344603; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qOWLaa5smsjw0opWcy1jKZzhc4d56ZD8Oi/aPIS3Jzo=;
 b=Hit+SoYJAHBl+W3U75bb6hDsIpH+t+FBbjmORbU55q3VA5QMJg+QRiYONGCKASfCbm
 KNobaU42s5yY3gqeCdqQuAMg5SwXP+KoMktb0Sx4GwbO2IL3rMAixEDq+dlOD8aAR53G
 Pv0wu9k0TE1DKXGAR90CgVwEw1SwImlRVsRBcBxZkJU6/egETTfEdZ1/OzPYw7Ri6o6G
 85iwSPgtNQY6Yz57FGhrfaPDW1kSNFIkNEqSwMo5CxDGMtyoeUAtBG8DIxPsJA3eM73U
 BV6OMy61gQn0voNkigpSVxO8Q8MeKrIsnb5sRLy4SlGmh5MWhV3/p25m4GW0cgc4CK/6
 T7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770739803; x=1771344603;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qOWLaa5smsjw0opWcy1jKZzhc4d56ZD8Oi/aPIS3Jzo=;
 b=feuVqv/1Jp0g34hkoFoV/joZGW5iRpdku0l/niG688Xr71Mm5+szT0b6mojlxY9UeQ
 mR5ZlATHmpgATbD1YtvtdVRLzdErb8WJ6/XpL87hsxD3Yij7Xs4GHK6mC60X5iTHjHuD
 VgbjysXBzI4NstX5Z6eKZVZkoD16uQeGWUR9+sgOkIgfqw+nhU6P4G+UhZ15M3Va+c5O
 eZqUYeTXvKPvMavFeRn1ytbVaWW5trv4ZAtn7MOrBugAVYE2Uhmg0JCJfY+tVYLxQLsB
 Bpj+e4mmyPt6S0F6jqgKi2/mn6nWWEjpADg7MVh8iFiAikG8vCn3yzrhvEm4GkRlLJt4
 6Ldw==
X-Gm-Message-State: AOJu0YxJdWRSDkbdenJz8Kn5mFXJjMvdjr5INva58wukxcds07YjtDwO
 Nq/I7WUpXvYYJzKb7JQT8D3GEvr4W17ODsz1y7hoNrA/3uCCHweni6Gr8+JkPq3T
X-Gm-Gg: AZuq6aLeexHUlaT6J0QTFLTaiFum44EfBzC9yuarx09kQts0NtnuOGGYsOmriUEmD8L
 rAuTfNLYJBoUjkdz7nGDPCDNgOJkG/V7dcfyZy2rkUDYwj3kjNHHqYzL28o3s0jgEF7CnQGI9bT
 CVluLv+8TEKiuJYu2/VqYjwf6oOx/sc4NJdTYLiaVlVlGG/x3yF4BXpAU7s69afEn/uHMaZUdOr
 AK25f8IL3mqqtrIMUnzd/Jxl9u8o5Y7hAv/PYRgaxVr//sicArC2+p4qLrRnwhqyXWZbqQfFpd8
 swqpJm3Iqr70JuwAF6AwKbOjgLUZv0dqJLjaVTm6SCo1TVnbIrrlIgS8LgtHclxKZzy58pycQOB
 JvWQOcmwygwu+OBZzvxnddNoAfEgHC8hzQekRq3FjKGtBn+JZvJpeoEOqtWrKCEBzfgGlliz7Z/
 43l1NuCpMrJlvru7eWTztmQ1CFBZke2CsaNHFjd8+cu+bjJIixiN5OgeB13cQx
X-Received: by 2002:a05:7022:418a:b0:11b:d6f2:a6d6 with SMTP id
 a92af1059eb24-1270400c96cmr7261432c88.34.1770739802803; 
 Tue, 10 Feb 2026 08:10:02 -0800 (PST)
Received: from localhost ([192.55.54.45]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12717d89610sm6173958c88.16.2026.02.10.08.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 08:10:02 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/7] Enable Vebox engine copy on Intel Xe driver
Date: Tue, 10 Feb 2026 18:09:34 +0200
Message-ID: <20260210160942.2219370-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Here enabled Vebox engine copy of framebuffers and force yuv framebuffers
on Vebox path.

This is to test Vebox engine along with other engines. Vebox is forced
to be used when tiling convert is needed and destination is not linear.

Juha-Pekka Heikkila (7):
  lib: take out duplicate assert
  lib/xe: add xe_exec_queue_create_class_gt
  lib/intel_batchbuffer: add intel_bb_create_with_gt function
  lib/intel_batchbuffer: move engine class selection to helper
  lib/intel_batchbuffer/xe: add bb exec path to use specific engine and
    gt
  lib: Enable Vebox framebuffer copying on Intel Xe2
  lib/igt_fb: on Intel force Vebox copy on yuv formats

 lib/igt_fb.c            | 51 +++++++++++++++++++++------
 lib/intel_batchbuffer.c | 77 +++++++++++++++++++++++++++++------------
 lib/intel_batchbuffer.h |  3 ++
 lib/veboxcopy_gen12.c   |  2 --
 lib/xe/xe_ioctl.c       | 20 +++++++++++
 lib/xe/xe_ioctl.h       |  2 ++
 6 files changed, 121 insertions(+), 34 deletions(-)

-- 
2.43.0

