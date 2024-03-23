Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2602AC54E58
	for <igt-dev@archiver.kernel.org>; Sat, 23 Mar 2024 13:05:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F8510F6C6;
	Sat, 23 Mar 2024 13:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UtF/CMnL";
	dkim-atps=neutral
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8542110F6C6
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Mar 2024 13:05:54 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-56bf6591865so795044a12.0
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Mar 2024 06:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711199152; x=1711803952; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=VcHgUkxT0hbWWgB5U4CUcgxqzet2O9BBeh6phvl/Vaw=;
 b=UtF/CMnLn4GiZKF+fMkh9hmZz94h5q0pKGao72FIn+ThEDNQj5lxnrTvAIqf+EUfP7
 bCCgrJhKTJabCTFu8YXrToaAcsenWD2ZOgMQmZcxKvmvnOhMjO0VvICGtCdYCSgLcQ3f
 HX/JddNgL3gu4Eqxm7NLfO9kbMxFy4g5WfwpJviCuIuqRnOejl+dzIV9f85RsgEkJnIx
 6thD77V6xMlWgyVbSLV3UCT92zEPG79lTlEp8I7STd46BvgICUsm71hTbkDmG4fMTNy7
 AXBPIkoZaLYTTURdMFSuQX6iO/UjyE94T+oU/gzcKBkd3OFkxygPcgzpaW2kYRgTRoEs
 eyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711199152; x=1711803952;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VcHgUkxT0hbWWgB5U4CUcgxqzet2O9BBeh6phvl/Vaw=;
 b=fOEgw5buBm6ELLYEkUQyZ5NIf4/5xVxbP1YDqw9TOamlwVQE4zZlriWwRR0lqVuIFF
 X10RqER6Oby9FgM2CKwhBTAhOi+p29q5uJQhmtI6teus8f9wU9mVtSFqjzTwk/3uP6SH
 w2z54DZdkhJpWppnnXfhDz5oAWqlUvYYapQxLOpZXIFDrna64nskVxOOosr8Jt6Cgt+R
 mZOu/RHDy8cHizD+Hw/acqS2o4NAhLpIonvK1DOiKygPyyChw9m/TLSBH+Bn8SYkYZZZ
 ucFi8b5e6LxG9C+uDljJdIFmmmXy1LV9lmO4AAPpDYyZUhBVd19cAAhG/3Pr5J5ZnZMv
 Kxyg==
X-Gm-Message-State: AOJu0Yyz3vEPPPxSkyb6v1RgZopAsdsGk+wEV3J80kqrYRlLTl5qgdoQ
 n5fHoCKGePTwFhPNWFxA84zNu/VM6Oi9T7Xwe2LxysPsNAJ+b4R0QgZowCVqCBS60jBTGo3HfJM
 EiP7V3lBfi4ZK63ySZyvSsy8dLFexj7Bt33E=
X-Google-Smtp-Source: AGHT+IGzoF21+m3QO3pCPD0vOQw95btN/HhAmtHb4iXLQsvm6CeNr0mkxqqwJQpLFER7Mhw4qZtRmjGSp04QfMjz0vI=
X-Received: by 2002:a17:906:ac7:b0:a46:e595:f357 with SMTP id
 z7-20020a1709060ac700b00a46e595f357mr1774830ejf.9.1711199152255; Sat, 23 Mar
 2024 06:05:52 -0700 (PDT)
MIME-Version: 1.0
From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sat, 23 Mar 2024 14:05:39 +0100
Message-ID: <CA+MoWDrG2MVo5qWApRKqRzpykLZ2WpmYusRkmkUd_49e=57xHQ@mail.gmail.com>
Subject: Can you help me debug an issue?
To: igt-dev@lists.freedesktop.org
Cc: "Mistat, Tomasz" <tomasz.mistat@intel.com>
Content-Type: text/plain; charset="UTF-8"
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

Dear List,

I found a commit that introduced a regression that broke the tests
gem_exec_capture@many-4k-incremental and
gem_exec_capture@many-4k-zero. Reverting 93c5ec210 fixes the issue,
but it does not tell what the problem is.

The problem is that `e` gets corrupted when `many()` calls the macro
`find_first_available_engine`, and the corruption happens at the line
`saved = configure_hangs(fd, e, ctx->id);`. By corrupted, I mean that
the field name gets empty and the field class gets a large number.

After `e` gets corrupted, the call to __captureN() will fail because
it expects 'e' to be valid. A simple fix is to add `e =
&saved_engine.engine;` before the call to __captureN().

I have been trying to understand why `e` gets corrupted for a few
hours, and I ran out of ideas. To make the code more gdb-friendly, I
have unfolded the macro find_first_available_engine, but that did not
help me find the reason for the `e` corruption. Here is how I have
unfolded the macros:

-       find_first_available_engine(fd, ctx, e, saved_engine);
+       ctx = intel_ctx_create_all_physical(fd);
+       igt_assert(ctx);
+       for (struct intel_engine_data i =
intel_engine_list_for_ctx_cfg(fd, &(ctx)->cfg);
+            (e = intel_get_current_engine(&i));
+            intel_next_engine(&i)) {
+               if ((gem_class_can_store_dword(fd, e->class)))
+                       break;
+                }
+       igt_assert(e);
+       printf("e->name: %s\n", e->name);
+       saved_engine = configure_hangs(fd, e, ctx->id);
+       printf("e->name: %s\n", e->name);

Reverting 93c5ec210 stops the corruption from happening, and I am
trying to understand why. Can you help me debug this further?

Thank you,

Peter




-- 
                         Peter
