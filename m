Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBF2E65D2F
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 08:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDBF10EAF5;
	Fri, 22 Nov 2024 08:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E0OIMz1G";
	dkim-atps=neutral
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBFC810E8C7
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 09:38:44 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4315baa51d8so5622025e9.0
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 01:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732181923; x=1732786723; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c2Ra9e7X2J4umjnJzBRCE2K+A1e3AVKrx97rLwbStp8=;
 b=E0OIMz1GfPOtOccfKXYGdc9ZX8Xks/yuAjbLUJexj+wKg36fXKozyeawYkJ1vMKS03
 Csrz3BxtaC/+6kVWYOjWu3pSqHAz4JzINHbQHbiLt2oxqvFuj8apBwRBhPuQUK2XpPzN
 Mlhe6Ky9LUt4R+idCdDDvcIonXZ7yto/RjLLwqCetw6rlZ7u6ULiFxmzJfk9dC7oIL+d
 wMlS5oeSJUPLQwsqvTQYe/kIFi61c3JxADZ//2bX4mzYTNYrfup5nvR/7AgWIkpl4GbF
 /lf5apHMTAm2SDHl8+xmwqNEtM2fAgETbjvgjWxdRbDKW7paiPbHAaSTXR2yzx96E/Wm
 c9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732181923; x=1732786723;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c2Ra9e7X2J4umjnJzBRCE2K+A1e3AVKrx97rLwbStp8=;
 b=iXnI6bpuJzL/SrPp0mJuJs0irJ9tkxNKo4tfCwMvpYrKkPnMc4o21bN45TgxRX/Hih
 j4qcNlJ3XxqHCrMrkwkFMN1tmTq6diRtYXNCH0aEC35vY/YyeivN4R4POuJiYh6lxkH4
 EB2TH0VXfp3h4rH72xZf/9TyLz5s2fjH2pw9b1lPxCKrWiqGViNKoVH8lc129lu0hFvv
 hoJPs5f907lYKj0fVkaX6/kUoia7gcjRTRPhIXJvZQ+Y+By03doGqP8f/dVCgQ1U3OI2
 QuyGfBiQSt8zmM6F/GkVVSmf5+FRXG4Zp6sbQsjLWS37v0MFtdNpgppAXuS7biAuEFRP
 8KoA==
X-Gm-Message-State: AOJu0Yyhuh/t52sMRuhheTvNqjIvhHaDPXFPmXAKetTMPkV4H88SHE92
 tBW/WWodihj5Pexdo4queanCMtqo7ZZdEosVgs1hsftIgIKL3BpK5FII7vS0
X-Google-Smtp-Source: AGHT+IHNU5M9MA9IM/rgHLKmNIU94yqKUP3f9BHPiEsh82VOzoIKGb8bQy/qo8oHG1XZPyurz6v5NA==
X-Received: by 2002:a7b:cde1:0:b0:431:5632:448b with SMTP id
 5b1f17b1804b1-433c8361254mr9912215e9.25.1732181922519; 
 Thu, 21 Nov 2024 01:38:42 -0800 (PST)
Received: from localhost.localdomain (62-178-82-42.cable.dynamic.surfer.at.
 [62.178.82.42]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b463ab2bsm49278805e9.33.2024.11.21.01.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 01:38:41 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: kernel-dev@igalia.com, tursulin@igalia.com,
 Christian Gmeiner <cgmeiner@igalia.com>
Subject: [PATCH i-g-t] gputop: Add memory only utilization type
Date: Thu, 21 Nov 2024 10:38:21 +0100
Message-ID: <20241121093822.3863544-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Nov 2024 08:52:06 +0000
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

From: Christian Gmeiner <cgmeiner@igalia.com>

Add special handling for drivers that only provide memory utilization
fdinfo.

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 tools/gputop.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/gputop.c b/tools/gputop.c
index 43b01f566..4135d84c1 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -35,6 +35,7 @@
 enum utilization_type {
 	UTILIZATION_TYPE_ENGINE_TIME,
 	UTILIZATION_TYPE_TOTAL_CYCLES,
+	UTILIZATION_TYPE_MEMORY_ONLY,
 };
 
 static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
@@ -141,6 +142,9 @@ engines_identical(const struct igt_drm_client *c,
 	    c->engines->max_engine_id != pc->engines->max_engine_id)
 		return false;
 
+	if (!c->engines->num_engines && !pc->engines->num_engines)
+		return true;
+
 	for (i = 0; i <= c->engines->max_engine_id; i++)
 		if (c->engines->capacity[i] != pc->engines->capacity[i] ||
 		    !!c->engines->names[i] != !!pc->engines->names[i] ||
@@ -193,6 +197,8 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
 		utilization_type = UTILIZATION_TYPE_TOTAL_CYCLES;
 	else if (c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_ENGINE_TIME)
 		utilization_type = UTILIZATION_TYPE_ENGINE_TIME;
+	else if (c->regions->num_regions)
+		utilization_type = UTILIZATION_TYPE_MEMORY_ONLY;
 	else
 		return 0;
 
@@ -209,6 +215,13 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
 	       if (!c->total_total_cycles)
 		       return 0;
 	       break;
+	case UTILIZATION_TYPE_MEMORY_ONLY:
+		for (sz = 0, i = 0; i <= c->regions->max_region_id; i++)
+			sz += c->memory[i].total;
+
+		if (sz == 0)
+			return 0;
+		break;
 	}
 
 	/* Print header when moving to a different DRM card. */
@@ -234,6 +247,9 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
 
 	lines++;
 
+	if (utilization_type == UTILIZATION_TYPE_MEMORY_ONLY)
+		goto print_name;
+
 	for (i = 0; c->samples > 1 && i <= c->engines->max_engine_id; i++) {
 		double pct;
 
@@ -249,6 +265,9 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
 			pct = (double)c->utilization[i].delta_cycles / c->utilization[i].delta_total_cycles * 100 /
 				c->engines->capacity[i];
 			break;
+		case UTILIZATION_TYPE_MEMORY_ONLY:
+			/* Nothing to do. */
+			break;
 		}
 
 		/*
@@ -262,6 +281,7 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
 		len += *engine_w;
 	}
 
+print_name:
 	printf(" %-*s\n", con_w - len - 1, c->print_name);
 
 	return lines;
-- 
2.47.0

