Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7F5C369AB
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 07:41:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9AA10E75C;
	Thu, 24 Apr 2025 07:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fj7h8Z+N";
	dkim-atps=neutral
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A3310E75C
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 07:41:52 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id
 d9443c01a7336-2243803b776so11465135ad.0
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 00:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745480512; x=1746085312; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BxW6rG6Pg9zy7zccWsTsZ6f6qQm3evWcLz3jyRKfCzY=;
 b=Fj7h8Z+NW0Xs4gGZMbGaHNHh4v+75nrsi7VYlJJTxjKLSpJqyJbIEQjMFMndbb+dwG
 +UykHghw7KsK6NAc9xtWAVJ94Q3kAVzHvy5UeGHjDihSGkfW978h9u/0HMSvUmp+Z/JX
 Td6ZUxKibqvoscNRY3k3W/rMe3vmC0FXG6/V/9K8fIDlR+sJrWjQObNPddTcxSd3+EH+
 JacbYm172IkVHFsZ/EU+gTkY5GZKt1kAmpQFBJte5jrDCge33o94S5MQtJXwmTGT0hfP
 6qNCknUoBsdwQIoSK2zkxN7ifIbqxrGcKTkBlnuWeK+180BUMjnPeTSmLoZ92U2spHmA
 zGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745480512; x=1746085312;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BxW6rG6Pg9zy7zccWsTsZ6f6qQm3evWcLz3jyRKfCzY=;
 b=Vm41pWC59fxhtu7PSbiqBt7eP8wJ9gWGI+V10jJEBf59RqOWDyo9FLASk0uK48bPJ7
 Axvv/8zwQrQO3vPP1qe4lK/Xo+eQhHstHGSBgaN8TZM1XNfZ1cj3KuV1hhuCY3alXUub
 lzHrg6d02poYxAoXaNJTfgxrsm2Ajv6pqn2nYbTsHljpOOBJ6RT1gfO8xYNNba6PwK5/
 4OSVt+VV743fHTUJisZM0iDC7pZDNxQ9fjKBo0d2Ww8a0U6oiPLI7FddYn5p5fXW50O0
 mcPxM+n3kx4o26CxuGyA7B8ksZ0cGYR/LdXDi46BFAgOyocnF73PoOl/0YM/1Z3mftkU
 h0wQ==
X-Gm-Message-State: AOJu0YxK/Q0+/vL+xZoRtLyE23522ZyZRRWbogU52uQ2sFxRklfwbEbj
 Mbo6xmguJlUypYdH3YPvA4aCjv36gmFs2f2/Ennh8/HeqcjMNanPgBJ0QP2Luw==
X-Gm-Gg: ASbGncsSrjASkQ3FJnaLCRwd5wxhVlP/4yVZ42FKgF/CRhuCIZGX0bxMASSSUUPAsAh
 ZObNCoIIGiKn8RlcBEKTEN721bGSNTlYMouW+uctUJvSKlGe9EHn2xCgiBsmgZto1RB+jEZCONK
 1StMRg8v6WEXBfSs++rDvq9dQJ/2bT9i/IzGKgnG/z0Y9/VPGMYRC78kjmv2VSBu2Eo+9zTQNwP
 84o3Vz5VmX1/ph59hu9Bdd5Y0mQv3RcFJnlsgrHSuRxX2avZsYFES8/QIUK87dxZnx0aWC4aRYj
 ySKHbgpmaX+AiN4jimeygKo9u47YddFbUZpF+FDrs0e2weNM5Us//YLKCg==
X-Google-Smtp-Source: AGHT+IG8HZFQEB6fnfMz4FCsHzB7tpnH6Xz1CQZ58f/PSE2WuRx51iXTtEdRAlP5VEH/3ZRSiEsDDg==
X-Received: by 2002:a17:902:ecc1:b0:215:a179:14ca with SMTP id
 d9443c01a7336-22db3bb2266mr21288995ad.2.1745480512190; 
 Thu, 24 Apr 2025 00:41:52 -0700 (PDT)
Received: from git-send-email.moeko.lan ([139.227.17.39])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db50e7a33sm6656265ad.146.2025.04.24.00.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 00:41:51 -0700 (PDT)
From: Tomita Moeko <tomitamoeko@gmail.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
	Tomita Moeko <tomitamoeko@gmail.com>
Subject: [PATCH i-g-t] tools/intel_gtt: add support for gen10+ devices
Date: Thu, 24 Apr 2025 15:41:35 +0800
Message-ID: <20250424074135.171022-1-tomitamoeko@gmail.com>
X-Mailer: git-send-email 2.47.2
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

Gen10 and later devices all have the same 64 bit GGTT entries as gen8.
Additionally, devices from Meator Lake onwards have bits 45:12 for
physical address [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=341ad0e8e254267704e0b87e35ad23aba5c02359

Signed-off-by: Tomita Moeko <tomitamoeko@gmail.com>
---
 tools/intel_gtt.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/intel_gtt.c b/tools/intel_gtt.c
index c0f3d16a6..658336d99 100644
--- a/tools/intel_gtt.c
+++ b/tools/intel_gtt.c
@@ -86,7 +86,14 @@ static uint64_t get_phys(uint32_t pt_offset)
 			break;
 		case 8:
 		case 9:
-			phys = phys & 0x7ffffff000;
+		case 10:
+		case 11:
+		case 12:
+		case 20:
+			if (intel_graphics_ver(devid) >= IP_VER(12, 70))
+				phys = phys & 0x3ffffffff000;
+			else
+				phys = phys & 0x7ffffff000;
 			break;
 		default:
 			fprintf(stderr, "Unsupported platform\n");
-- 
2.47.2

