Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF3FC5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 08:13:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EC810E1C6;
	Tue,  3 Jun 2025 08:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XUh61EAN";
	dkim-atps=neutral
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B9E10E1BD
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 02:55:58 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-4a42f28017eso61790771cf.0
 for <igt-dev@lists.freedesktop.org>; Mon, 02 Jun 2025 19:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748919357; x=1749524157; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4SiwW80LhKjupvPgr6hcwunZ/yDfte7OkNg/zW63Ets=;
 b=XUh61EAN8YTTr6/m+289/Hx+2g+dr7AhAGZLL61BZ1/1eFl0nqjLMlUNF7+uN1RwuT
 zYWLSivtpkD/7ojU+7kXmlS6upb2N9dASqL5QMM2YOL488mohXcWqJneCiCTr4IKZypv
 qrysENQ7erM+FeBUje1Q4RESrg1ryhr0hDfFlyDR6Q3fUUKVpdBb1XVeTf9zZ6IPFPqN
 6JfDbXwSuUNbkMpADPVWpYWZf2bJVKzpUoUmMU5G0wAdIR5AvTseUSDbZqYOyc/ABysQ
 hKA/aJG1QdbskTnhL5RztSF1R7AzmXBrKMzQFVo44GBGo9jyVty0t3Ry8t+x7p6VTI6f
 fPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748919357; x=1749524157;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4SiwW80LhKjupvPgr6hcwunZ/yDfte7OkNg/zW63Ets=;
 b=Ml7OaE0tvBrmI3oQLbiOsCveSSFBQ+rsw6CFCTo2T8GyRO4b3h/unMaKpEaXXv24xq
 KSKND04djeDmIJoGid+3s7FxIQom5l6L3Xa3nM8CoxM4lCmfHXT6U2R1FpFWBmSvNTUf
 M8Gij+RnWwYOj11jVvRBWxfzONqwPTpn52hpnMZYKGzBZaPtCkYTowiuLL4Qz0jtJhol
 d0d9dczhU+Fs/ebA55sbxwXvLX7tOXRYV9W3ppCBoGdxORw8OqXYv2E6i/PF08f+hab1
 RaQ9f2KLUcNVQbsKZT3tN+W4lRjtUEpUYznsi82zN/2Lpqjl5ji3lLKwbbJjM9EeIAen
 Gztg==
X-Gm-Message-State: AOJu0YxDRzIGVhMlGHd4J2DAEvkQZj0glApnFec1VP0+jKGVPn6A2HL6
 kB9XXt1OoHaoZdmVQKKsTMV7CH7pyeYl7365uRW43ag2Xs9R8NpxR0JBYpuKQMUpQPAvSOQ/wvG
 C1x7s3Hv0ateqTksr/ur/EnJCcZWDulEhKJOWHT8=
X-Gm-Gg: ASbGncsIOpuamW4TML4hEXpKpmZD78WaO2JbmID0pxW1S7dmaRCpHIT8Eb8U1+w631M
 tgfUndth98j2vVjp7EvbiZe9Y6UbsWxBweHpo6E+uOJVa0PGFhVRaxO317jdnPhBIqUR4gviV/w
 4zEdIvUCNvZfhVBhy+zhBZZWkN00Kq21iNnC47KfFdfkzt8ckEKiwxYQ==
X-Google-Smtp-Source: AGHT+IGB4VIbPfYTSni1fF4XY1p/EXviBCiQKRJj2j5eL96TjhnE4Vr1MOpLzu+RJsxYb4WnCVdsj+fh3+U38xjeFKg=
X-Received: by 2002:a05:622a:228e:b0:4a3:4412:dfcd with SMTP id
 d75a77b69052e-4a59b17d8eemr15265891cf.22.1748919357322; Mon, 02 Jun 2025
 19:55:57 -0700 (PDT)
MIME-Version: 1.0
From: Bram Stolk <b.stolk@gmail.com>
Date: Mon, 2 Jun 2025 19:55:46 -0700
X-Gm-Features: AX0GCFtVUqia1NEmD5IvV-OX-fYbwFPaR7bcc5CZxMCy96SNLtO3pl5pMmgkc-0
Message-ID: <CABYXEks8fkP15bNZJyr3A49F1eNbn1MPnYLkUtNm6FCP=nksgA@mail.gmail.com>
Subject: [PATCH i-g-t] xe-perf-record: use correct sysctl suggestion.
To: igt-dev@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="00000000000008c07c0636a20584"
X-Mailman-Approved-At: Tue, 03 Jun 2025 08:12:59 +0000
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

--00000000000008c07c0636a20584
Content-Type: text/plain; charset="UTF-8"

From e03269c796207749afe2f7d49ac64b672e7185af Mon Sep 17 00:00:00 2001
From: Bram Stolk <b.stolk@gmail.com>
Date: Sat, 31 May 2025 11:40:18 -0700
Subject: [PATCH i-g-t] xe-perf-record: use correct sysctl suggestion.

On xe, perf_stream_paranoid is not used.
Instead, observation_paranoid should be used.

Signed-off-by: Bram Stolk <b.stolk@gmail.com>
---
 tools/xe-perf/xe_perf_recorder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xe-perf/xe_perf_recorder.c
b/tools/xe-perf/xe_perf_recorder.c
index 9cf51f3e1..5bd91aeb1 100644
--- a/tools/xe-perf/xe_perf_recorder.c
+++ b/tools/xe-perf/xe_perf_recorder.c
@@ -1137,7 +1137,7 @@ main(int argc, char *argv[])
  if (ctx.metric_set->perf_oa_metrics_set == 0) {
  fprintf(stderr,
  "Unable to load performance configuration, consider running:\n"
- "   sysctl dev.xe.perf_stream_paranoid=0\n");
+ "   sysctl dev.xe.observation_paranoid=0\n");
  goto fail;
  }

-- 
2.48.1

--00000000000008c07c0636a20584
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>From e03269c796207749afe2f7d49ac64b672e7185af Mon Sep=
 17 00:00:00 2001<br>From: Bram Stolk &lt;<a href=3D"mailto:b.stolk@gmail.c=
om">b.stolk@gmail.com</a>&gt;<br>Date: Sat, 31 May 2025 11:40:18 -0700<br>S=
ubject: [PATCH i-g-t] xe-perf-record: use correct sysctl suggestion.<br><br=
>On xe, perf_stream_paranoid is not used.<br>Instead, observation_paranoid =
should be used.<br><br>Signed-off-by: Bram Stolk &lt;<a href=3D"mailto:b.st=
olk@gmail.com">b.stolk@gmail.com</a>&gt;<br>---<br>=C2=A0tools/xe-perf/xe_p=
erf_recorder.c | 2 +-<br>=C2=A01 file changed, 1 insertion(+), 1 deletion(-=
)<br><br>diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_p=
erf_recorder.c<br>index 9cf51f3e1..5bd91aeb1 100644<br>--- a/tools/xe-perf/=
xe_perf_recorder.c<br>+++ b/tools/xe-perf/xe_perf_recorder.c<br>@@ -1137,7 =
+1137,7 @@ main(int argc, char *argv[])<br>=C2=A0	if (ctx.metric_set-&gt;pe=
rf_oa_metrics_set =3D=3D 0) {<br>=C2=A0		fprintf(stderr,<br>=C2=A0			&quot;=
Unable to load performance configuration, consider running:\n&quot;<br>-			=
&quot; =C2=A0 sysctl dev.xe.perf_stream_paranoid=3D0\n&quot;);<br>+			&quot=
; =C2=A0 sysctl dev.xe.observation_paranoid=3D0\n&quot;);<br>=C2=A0		goto f=
ail;<br>=C2=A0	}<br>=C2=A0<br>-- <br>2.48.1</div><div><br></div></div>

--00000000000008c07c0636a20584--
