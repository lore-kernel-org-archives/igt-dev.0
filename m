Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED90D767DA
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 15:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B64010E8BD;
	Thu, 31 Oct 2024 15:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VAiIe9Oo";
	dkim-atps=neutral
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D0910E7E2
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 18:41:02 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4609c96b2e5so1433471cf.0
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 11:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730313660; x=1730918460; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Auy6yH1CdVRTOgnUPCkOQKny+q+AZCV2Tod3FIFCjT4=;
 b=VAiIe9OoYeIK6F3gHaD4Gy7SS8/JJZ1M0dOu86np50VOsrKu6oXG2vyM3DLIZd7OtT
 znquTnMGwmCf+Dt+WfTCvkqZzIhpmP19cjGDePcGRVYPCvipEWj0YPjgWTgmPGBHdVWv
 58GSz0w9+8mwaZSX9zRp/EUKqxCV3cX3xmBLCAKwsJgn8WgmYsTddfUPEivAC9379OrC
 tG+9f/sOn02rt1TZGJbxbdYBuL725dq2x6qVpjWFrguNU/JpQq9t7ICR+AE8ZBYvxvch
 Mvu5t+SK3Y9JDogFVFvw33FDwMsUTrhxcQQ0+oEccpPMPNeLU+wxAo7NGwaSoUKaQv26
 x/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730313660; x=1730918460;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Auy6yH1CdVRTOgnUPCkOQKny+q+AZCV2Tod3FIFCjT4=;
 b=YQsobCRTqjt4DNUzZzOOzH36WMGPC1bdoawN3Bgz2jRI2KAD9g6/IrYqcrZWrsRa9p
 cqDaLyH785X+NRv77OiSimdi5aQVF+TdShASsFXoBT77W5viHfhHL1UFQYF2iRnK8c5x
 l73emTt/+cR3o2yR9D7TyJ2iifDICYG0QiwkY6r1V4yRC7TMpKsOhoCopR+vGAlhodFO
 TTJl05yHYjEUpcUt/igqHqOM2y3qQV6n+C4heSsB6+/kp4uNjBQNPKWpTr23UU5j0Cti
 yAsDItvHFxYLmSnU9XYv071eRDrXyyaBUr5qWifRQcPJ44WVGceuRXSnKeAxV+VcuZ0P
 m/Eg==
X-Gm-Message-State: AOJu0YyrL1AxMV204x0jNLwsA4PpoMOA/mOghp0eDWe87KVON/hCfBBb
 /+Zxt5bQXodWS/8L4HB/jcy13dwwhAGX5hk8wAnCRFX0OO+Zda2/YdRMRtBnBUc=
X-Google-Smtp-Source: AGHT+IHkR8PiLGiIA7gHUvz6o0/byT95JXAqBxGZ9GkChRQgHB2XZOCsH0riSIo2rIOpJVzkfTKLzQ==
X-Received: by 2002:ac8:58ce:0:b0:461:20b0:9909 with SMTP id
 d75a77b69052e-4613c0541d7mr259647291cf.29.1730313660289; 
 Wed, 30 Oct 2024 11:41:00 -0700 (PDT)
Received: from LUSKPV4LC6K37.teslamotors.com ([136.226.78.81])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-461323a1c20sm56976731cf.84.2024.10.30.11.40.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Oct 2024 11:40:59 -0700 (PDT)
From: Jeff Dagenais <jeff.dagenais@gmail.com>
X-Google-Original-From: Jeff Dagenais <jdagenais@tesla.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeff Dagenais <jdagenais@tesla.com>,
 Jeff Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH i-g-t] scripts/generate_iga64_codes: prevent objcopy from
 modifying the input file
Date: Wed, 30 Oct 2024 11:40:54 -0700
Message-ID: <20241030184054.73065-1-jdagenais@tesla.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 31 Oct 2024 15:02:54 +0000
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

This script uses objcopy in order to dump a section. Objcopy is meant
for copying and expects a second argument. Failing that, it uses the
input file as output. Even though there's no intented change to the
file, this operation still re-writes the file completely.

In most cases, this re-writes the file as it was before. But in
cross-compilation cases, the "objcopy" program in the PATH used here
might be different than the toolchain which generated the ELF file.

In all cases, this causes a racy re-build of the .a, and in the worst
case, the objcopy re-written .o and .a files are actually incompatible
with the cross-linker used downstream in the ninja build causing failure
to find all symbols from the libs passed to this script.

```
../lib/intel_batchbuffer.c:763: undefined reference to
`gen8_gpgpu_fillfunc'
../lib/intel_batchbuffer.c:762: undefined reference to
`xehp_gpgpu_fillfunc'
[...]
```

The intent of the command was just to extract info from the LIBS, not
modify them. Using /dev/null as output file ensures the input files will
not be modified.

Signed-off-by: Jeff Dagenais <jeff.dagenais@gmail.com>
---
 scripts/generate_iga64_codes | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
index d1e40b600..bbf1f7008 100755
--- a/scripts/generate_iga64_codes
+++ b/scripts/generate_iga64_codes
@@ -37,7 +37,7 @@ ASMS=()
 while  read -d $'\0' asm; do
     test -z "$asm" && continue
     ASMS+=( "$asm" )
-done < <(for f in $LIBS; do objcopy --dump-section .iga64_assembly=/dev/stdout $f.p/*.o; done)
+done < <(for f in $LIBS; do objcopy --dump-section .iga64_assembly=/dev/stdout $f.p/*.o /dev/null; done)
 
 # check if we need to recompile - checksum difference and compiler present
 MD5_ASMS="$(md5sum <<< "${ASMS[@]}" | cut -b1-32)"
-- 
2.43.0

