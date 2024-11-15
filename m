Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8D5D68BD7
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 21:19:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C691210E3D3;
	Fri, 15 Nov 2024 21:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PPrHh9Pr";
	dkim-atps=neutral
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BF010E3D3
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 21:19:13 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53b13ea6b78so26642e87.2
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 13:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731705551; x=1732310351; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NnSY6PDouz6KDuWuMVsprwXscKSidaz81teE0ishBnk=;
 b=PPrHh9PrOKs84JFxcrm3QhXbzK3AcizCjJqXTVuKCePnP99S5JVVzHo46GFXGLtnq8
 kSkOkHJO0wdgyi71+ohd4GlMq7ewGgyjco0ByWIIHCXIvxv5Q3X3JT3d21azc7s2HJDt
 OkX+h7rS01tjq2oVnAzwhS+vPKGOURFsf7qmVqAd41R6NMXu0/7ug1P/1nhKG5GRtN/m
 uiymlvAbrhq1blBITkhpuaohIqfsG8EMjYkmiV3F5ybXI+XQ9RR1Z5Jdc9oaBtzIFMjz
 wIeuyZ73Ce54kQL4bQrHiC6QL5Nn92d8scSejBqX9NTwjiIgNnwjCStyb150j0QTuXYO
 xIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731705551; x=1732310351;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NnSY6PDouz6KDuWuMVsprwXscKSidaz81teE0ishBnk=;
 b=kGx1GtvKFbfHz4uxBoX17rcJ8dhNA0piRUSU3y4TkeJxA80PbDqXVrbbPavVS5nXKE
 EUI1NbBEZmDYOkilkjvPiRf+eoYjvSTWG0JGH10Aux9AnIxIH9FYqGXWmpWdDXlIx2vj
 rP2CGcwWET2W5Q7V6YT9ra2q+Afezt37j9t3NW03c1lME6H5JJIFt13FxAFRWKtiIcj6
 AQ2iU+vifJWZK475JDJDmKde48RJAtFnzvcEfrdpHMV34xEdizejdQpygAfDSEve3XB1
 xCuLGSNk6qn5WW07AW1alt8fFGJitQYyqsoIVqML4umpIQ1QdkIV63ZqYiuXNVOx/tL+
 ANhQ==
X-Gm-Message-State: AOJu0Ywhl4MP9b9rZPqX5LBUHoFt7OlnZhP86FcVZxpBblK5q5No30zJ
 Q6z1BPDPiQLHCjm3U2kf82ubZpzAAuSVgt0fvWNS5K1BIZppUG7wzQ9GHLme9sm0g7xA3M4+A0U
 J
X-Google-Smtp-Source: AGHT+IGvtEYW5ztqwR6uIUfvDJthrq/BDp+Qho2pljnbCIcFq3Hf3tzf6Q4PdzI68wokfBDY78eJxw==
X-Received: by 2002:a05:6512:6c9:b0:53d:a025:1142 with SMTP id
 2adb3069b0e04-53dab3bc29fmr3855987e87.54.1731705551039; 
 Fri, 15 Nov 2024 13:19:11 -0800 (PST)
Received: from rohan.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e08161csm215184266b.178.2024.11.15.13.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 13:19:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH i-g-t RESEND v3 0/2] tests/kms_properties: rework
 immutability checks
Date: Fri, 15 Nov 2024 23:18:57 +0200
Message-Id: <20241115-rework-imm-check-v3-0-e4077cf16816@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1480;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fFHPyYa0Tp+oYL8XGolF64Qd8by+Cf5f18ZnhMTEvNE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnN7rKD8XqEABK8ARTH75VJhIPA9SBtQNgoiEgz
 E2BSGVrjymJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZze6ygAKCRCLPIo+Aiko
 1YxbCACAraLUP74EB0AY9hytDXcBM3wbMrxzEOrFSuoFnvS8rC60GmakS+LCrArScxbm0u4xWt0
 SBSqE335e8S23oNkz4KX2llUBDMKvmMa5x+bkIAmfKeoKWKDLHrRuk92t2gnKwwHvnU0sat4ACg
 ndFT5hPvkmO8o5COB11acm7EFxnaifZm/iVZSJlX0wJwFMHlD+2uhIujZxW62rhq7FNE/XKWiKS
 zJ5j5YgoaOkXMIbwaSMe+qOVM9PELJtoz8Q/TUClcOpjpzrChE6m711xJCQB9NLkftAnVyt2H+6
 IgAtXJ45NbPioprXnBwPZkRIXPHTpIkATLIBwjrKMk5ZAvL3
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Following the discussion on IRC, it is actually an error to require that
properties that can not be chaged are marked as immutable.

The DRM_MODE_PROP_IMMUTABLE defines more of the 'direction' of the
property (whether it is set by the kernel or it is expected to be set by
the userspace) rather than simply states that there is no way for the
userspace to change the property.

Drop the existing immutability test and spawn (as an RFC) new sanity
checker for properties.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

---
Changes in v3:
- Split implementation into two patches, one to remove the immutability
  check and another one to add sanity checks.
- Link to v2: https://lore.kernel.org/r/20241018120058.42240-1-dmitry.baryshkov@linaro.org

Changes in v2:
- Moved GAMMA_LUT_SIZE and DEGAMMA_LUT_SIZE to DRM_MODE_OBJECT_CRTC.
- Added debug print to help debugging possible issues.
- Link to v1: https://lore.kernel.org/r/20240902210755.480638-1-dmitry.baryshkov@linaro.org

---
Dmitry Baryshkov (2):
      tests/kms_properties: drop immutability checks
      tests/kms_properties: add sanity checks for properties

 tests/kms_properties.c | 110 ++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 87 insertions(+), 23 deletions(-)
---
base-commit: 31475ea8fdeef38b5ae6b4b8ca6d4e42f8285b42
change-id: 20241027-rework-imm-check-f241ebae71a6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

