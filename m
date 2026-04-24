Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C252FED3F2
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 17:11:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C9F10E2E5;
	Fri, 24 Apr 2026 17:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eNiRHlaF";
	dkim-atps=neutral
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD14710E2E5
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 17:11:37 +0000 (UTC)
Received: by mail-dl1-f50.google.com with SMTP id
 a92af1059eb24-12c565476d7so4259250c88.1
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 10:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777050697; x=1777655497; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OOC5pXK3pji6hdp7V/5GFO9Mk0LMXCNHiloam2nGTp0=;
 b=eNiRHlaFhoohaXnBabwRWxf2H3epYR7GOgAahBQRMKqgc6VOBHxdXf6HRvbVuJ4/Z2
 y6ITlcreoR556vICDF3/9mXxUYMb7RbV3+7GElFRgKgost4iwcTIoRVCS5DRNRDwH3Hu
 KyHEBLesFM9hWMiFabibWkMP6ny6FuenuYUHo1I+OdYdtkN2ewcKYBPww3ZQLs8BVY6y
 soVPxyd108x5qK9A5m7COUi9d6lvvUXb2d3zwpamq1V2dC2zsP6paiXzKGfxxsma3BPA
 +jD1MoZr79QBv1tTISm9K3jEWPlIXkSqZFx/3zCIgUIDwCTXtoNGTEyBzX1W6LrQGx1f
 SKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777050697; x=1777655497;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OOC5pXK3pji6hdp7V/5GFO9Mk0LMXCNHiloam2nGTp0=;
 b=mchCHOhnxd0slnokdgb0yDo2/55JL8db3jblSHoKdXHuRyCqxx9+BAJYYCp7hQsgPk
 fBy9J5I1K22Svc398E6y+iG26vjpDSk3Xfn6oifCIk1Y2f2LS5FuiS/ttBda0sVVDz02
 Wv2FnoqqJpUlSvJkk8a+Yyaq8Ywx6OtSG1r6fcz5Z1kAI4FwtM5xBnTmnh92oPKhcwhG
 ADUzVeA33QJhASj8LGsNXJqLewmGlr7jI/ONNX5EjLp2UY32OMlc6+5Y1PLrpEtR5S1A
 yt6FxgbFi3SgpvNAmu3RlO+FOlXR7WJgx4AM2Di1BPtzwSkOVULp7/5nvl6Az3BZVqbg
 IgwQ==
X-Gm-Message-State: AOJu0YzH7nAHHBSaEQOAp+oIqZvBUVz6t7GtTBYn8FBcYxjvqz8cIvF0
 KIdMQmd4a1dilQxjkaSiiMkvFd8LOnna+s4Bcu7XaboyjNDyosesPavLfkZ0xNez
X-Gm-Gg: AeBDiesmwb5JSWVkva/ys4CmvXzGAKpC1FXLWwPEW2ZlJPB8UKm5II+ugJt45o9edqf
 /mzfwUEw7TP7+K5TOXD8Cp/lbgVOw3YaaVi4YFgvEOSQwOuLvhL/ZGMrhZvnu7oeCMo/nrezdri
 tN3GdBxz8qFQPV6P7I+vyHWurfTkZ+yFp/yX7qd4rtq6ziRd05dekpH2Yo86MGwfWBnaSC2DN2+
 QSEeejYJS3ouwUVDye+ZQqH+Q6PozgD6HqtYx2Zfm3mZQth6KRXNUpHFiICH08PMy1Ai8sBaplG
 eZdiitott0fDhvWqKxhz+LblZlbq6gvwMXtxhcmUM20rlV8HX9e5vEhrqPpDKQi9RdEkyIdxuEH
 XzQpJ16D0CrcsWmAm/XikkdBPuQ/LovV66irouubjs7vhJ9+lR7uQlP9xP2bczLlPPBVJGXJJl9
 0aEevG86Z+jVVnsF/N8KKW8URSc+uU2lk1v4EXkJiQLUeQHbS18OK8eB/IfmrTelVIcHjmow==
X-Received: by 2002:a05:701b:221a:b0:12d:b6cb:bdc9 with SMTP id
 a92af1059eb24-12db6cbc1d3mr5529188c88.9.1777050696696; 
 Fri, 24 Apr 2026 10:11:36 -0700 (PDT)
Received: from localhost ([192.55.55.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12c74a18a2bsm49340101c88.10.2026.04.24.10.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 10:11:36 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Vidya Srinivas <vidya.srinivas@intel.com>
Subject: [PATCH i-g-t 0/2] kms_plane planar-pixel-format-settings restructure
Date: Fri, 24 Apr 2026 20:11:21 +0300
Message-ID: <20260424171123.3963793-1-juhapekka.heikkila@gmail.com>
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

Here restructured planar-pixel-format-settings test into dynamic subtests
and put back in place requirement for Intel hw as all those tests are
testing Intel display engine specific limitations; there's no idea in
running them on non-Intel hw.

Added new dynamic subtests for found corner case. test_nv12_tile4_src_y
subtest will fail until Vidya's fix is merged for the issue:
https://patchwork.freedesktop.org/series/164739/

/Juha-Pekka

Juha-Pekka Heikkila (2):
  tests/kms_plane: Restructure planar-pixel-format-settings test and
    make it Intel only
  tests/kms_plane: Add test_nv12_tile4_src_y planar settings test

 tests/kms_plane.c | 413 +++++++++++++++++++++++++++++++---------------
 1 file changed, 279 insertions(+), 134 deletions(-)

-- 
2.43.0

