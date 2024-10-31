Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0414BE6748F
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 23:14:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D3910E0B4;
	Thu, 31 Oct 2024 23:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hjBXMYBI";
	dkim-atps=neutral
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3288E10E0B4
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 23:14:13 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-539fb49c64aso2155298e87.0
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 16:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730416451; x=1731021251; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NnSY6PDouz6KDuWuMVsprwXscKSidaz81teE0ishBnk=;
 b=hjBXMYBIzhJjxBkcNgkyRjylwRbEiZgpDwGsRjTosggQGT1HZKF5XJl3BVqK5J2Fsi
 6kI1855zTVmqUkbGUWa3Gdphb3yMJIR/H+NDZBKX3a9T4m6R5JPKcrRK+oRZUzQlij4o
 6M3PQcl0S3eMxK95efpiU8JCD8n9yKduwatyR9/Nb94A8868dA4NRzp5Wvd9+yU0eW4o
 ruGmMd8DWpoztvgZ5HCxUYAvfY4TLfISDeinXdgLKF73WNBaf39PCf/mNDeXhYgv5zYz
 RgIyfve9ilA2jPAMQCiqfWSQhI84sAwsIHFq8v6yN1nfr1H8DBlguOg09HSyeqc4QTHt
 T4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730416451; x=1731021251;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NnSY6PDouz6KDuWuMVsprwXscKSidaz81teE0ishBnk=;
 b=XEGekhrqir4ioY0Uke9sGIor5FhrKz1chpOm7Rb0SI2n5TtzfdEVYaCABOX3bH3Gpg
 ztGYB9ROatK2iRG3mWgyXWAad8kfD25kcGm+gGJJ8VPJXN0r2ldWer3VssadlqA7neCi
 kystHRxrFkxymHNcGtwVKBoAGGpOXJupwE3kUZz7XL07CaMK2bElVKnX1hOGL+qDEJiG
 IGuejxiabtmqrDSLGpsdmAdwgCh/eB+oWiwaKM6G7n4w0eDUpY6gcd3vfPE44Ny1q5qt
 sdVvugywYZT/jY66Beic4e8/pNgkscFmMt2MnBBPwNZfmkj0pAdr+C/BaQM0zapXTc7l
 x3Ow==
X-Gm-Message-State: AOJu0YzY2dgbf11TbyX2cyj0HD+zxMOd7E/Uli5K35EmRw9d6SrVhr7v
 lbG9KJUcntv0nvl4771RorJEJ1ZqoK7jnmP7vHP7b7AZpcU2opE1ulVLNsl+7mwKvJMrJ2BUiJQ
 O
X-Google-Smtp-Source: AGHT+IHG9QU+LRi6BWjnyDTBypD0IAmYFpZ9m53OTr8z5zXxB7X7W5lnlLNWY8lpRdP8gO1+Ip6wrw==
X-Received: by 2002:a05:6512:1149:b0:539:e0e6:cf42 with SMTP id
 2adb3069b0e04-53d65e0b4a4mr1627052e87.43.1730416450930; 
 Thu, 31 Oct 2024 16:14:10 -0700 (PDT)
Received: from rohan.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bc9580bsm358117e87.34.2024.10.31.16.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 16:14:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH i-g-t v3 0/2] tests/kms_properties: rework immutability checks
Date: Fri, 01 Nov 2024 01:14:04 +0200
Message-Id: <20241101-rework-imm-check-v3-0-707c290572c6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADwPJGcC/4WNzQ6CMBAGX8X0bMm2/FVPvofxUGCBDULNllQJ4
 d0tHLx6nG8zs6vwyIReXE+rYAzkyU0R0vNJ1L2dOpTURBYadKZAl5Lx7XiQNI6y7rEeZBsPWFk
 slS1E1F6MLX2O5P0RuSc/O16OD0Ht6xGDC2itoMzzJDNQpEYq2Yw085JUlhffDy7cnjRZdonjT
 uypoH+6AmWUBshNkulY+2dv2/YFUrrh5ewAAAA=
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1480;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fFHPyYa0Tp+oYL8XGolF64Qd8by+Cf5f18ZnhMTEvNE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJA8+ArOPgqgwcR7dAmvyj9gGdeVqjJCPD1sNO
 YzqWk2v5ueJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyQPPgAKCRCLPIo+Aiko
 1fNHB/9nLx8qa/HtjVKMg0vSDfQu3m3TqKoKRp05V8Ir9F8MYBPvk/k6OiHgYSRC/fVaRvDGTa2
 ExAPgr3/MMmkHWUHxRThLSKf62xjeDRLaJHmJ4QbzG9EEv+mUTIZ4DqlU98e3bPdRhjnQ3pWzgG
 5j5bXQI3Gnw/oHYKFq3X5nCVZwLD4VrfjpT1ch/8kfQQ1yuCgONMjaAmN9r/ATutbRcs8kbOSF0
 9EoM7aECbhC1VpQU2JCg3cCIAJv6xHdZMyPMPRoKq4FgIRucbtTPd8EIjcBWt7MP1GwKqrjbWwz
 ptw7xGTiQ5WS6fX0zCdmQ94+G7Rk2MJ07S+63tmcDnY2IOlC
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

