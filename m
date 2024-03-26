Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F07C54E58
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 07:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1846910E5D6;
	Tue, 26 Mar 2024 07:18:34 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A63810E5D6
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 07:18:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EEEA320003
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 07:18:29 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-56c0a249bacso2440825a12.1
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 00:18:29 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy3ZCQbKOxyOEPLY9+lhzWZOFHTNlVgnWq1VdhESibSuV8MKaKx
 XzY4lndsNRmJgIP1TYovflUNtHoZ3l6rWjeYOM540raVvRgcE8/riB9AS2O1tlqT3aVwq1HOsyr
 Lo1t5ygEsZpAQgC9fQCiUIOkbhXE=
X-Google-Smtp-Source: AGHT+IEXvX9tbgmkYb4+L4GUVrZI15musRYMVEkQQ60lwPe9xdBqc4JS+abeDMEbPuOTZ1sgoic1mNhBxpsJ+WjqCwY=
X-Received: by 2002:a17:906:3e4a:b0:a46:5e1b:58a3 with SMTP id
 t10-20020a1709063e4a00b00a465e1b58a3mr5731680eji.35.1711437509420; Tue, 26
 Mar 2024 00:18:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240325213548.2881-1-me@petersenna.com>
 <171142874445.1039407.14700726387538766924@8e613ede5ea5>
In-Reply-To: <171142874445.1039407.14700726387538766924@8e613ede5ea5>
From: Peter Senna Tschudin <me@petersenna.com>
Date: Tue, 26 Mar 2024 08:18:16 +0100
X-Gmail-Original-Message-ID: <CA+MoWDpaGW-Vi7_kbwdCR2Xe=5j0_CP9Vt3NBUQNUBYm02Q7SA@mail.gmail.com>
Message-ID: <CA+MoWDpaGW-Vi7_kbwdCR2Xe=5j0_CP9Vt3NBUQNUBYm02Q7SA@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_Fix_memory_access_iss?=
 =?UTF-8?Q?ue_due_to_variable_block_scope_=28rev2=29?=
To: igt-dev@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000cdf32c06148b18e6"
X-GND-Sasl: me@petersenna.com
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
Reply-To: peter.senna@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--000000000000cdf32c06148b18e6
Content-Type: text/plain; charset="UTF-8"

[...]


> IGT changes Possible regressions
>
>    -
>
>    igt@gem_exec_capture@many-4k-zero:
>    - shard-rkl: NOTRUN -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10907/shard-rkl-5/igt@gem_exec_capture@many-4k-zero.html>
>    -
>
>    igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>    - shard-dg2: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14481/shard-dg2-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10907/shard-dg2-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>    -
>
>    igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1:
>    - shard-rkl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14481/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10907/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1.html>
>       +1 other test fail
>
> Warnings
>
>    -
>
>    igt@gem_exec_capture@many-4k-incremental:
>    - shard-mtlp: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14481/shard-mtlp-6/igt@gem_exec_capture@many-4k-incremental.html>
>       (i915#9606 <https://gitlab.freedesktop.org/drm/intel/issues/9606>)
>       -> ABORT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10907/shard-mtlp-4/igt@gem_exec_capture@many-4k-incremental.html>
>       +1 other test abort
>       - shard-dg2: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14481/shard-dg2-7/igt@gem_exec_capture@many-4k-incremental.html>
>       (i915#9606 <https://gitlab.freedesktop.org/drm/intel/issues/9606>)
>       -> ABORT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10907/shard-dg2-11/igt@gem_exec_capture@many-4k-incremental.html>
>       - shard-rkl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14481/shard-rkl-3/igt@gem_exec_capture@many-4k-incremental.html>
>       (i915#9606 <https://gitlab.freedesktop.org/drm/intel/issues/9606>)
>       -> ABORT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10907/shard-rkl-4/igt@gem_exec_capture@many-4k-incremental.html>
>
> The timeout seems to be set to a little short of 2 minutes. It takes
almost 4 minutes to complete when running on my "Intel(R) Celeron(R) CPU
 N3150  @ 1.60GHz". Interestingly, after the SUCCESS message the user space
process doesn't do much but the "kworker/1:1H+events_highpri" keeps one CPU
busy.

peter@n3150:~/dev/igt-gpu-tools$ time sudo ./build/tests/gem_exec_capture
--run-subtest many-4K-incremental
IGT-Version: 1.28-g80e9084fd (x86_64) (Linux: 6.7.9-200.fc39.x86_64 x86_64)
Using IGT_SRANDOM=1711436449 for randomisation
Opened device: /dev/dri/card1
Starting subtest: many-4K-incremental
Target died after 19.969394s
Captured 0 1-blobs out of a total of 262144
Subtest many-4K-incremental: SUCCESS (48.920s)

real    3m49.723s
user    0m0.028s
sys     0m0.048s



>
>    -
>       -
>
>    igt@gem_exec_capture@many-4k-zero:
>    - shard-dg1: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14481/shard-dg1-17/igt@gem_exec_capture@many-4k-zero.html>
>       (i915#9606 <https://gitlab.freedesktop.org/drm/intel/issues/9606>)
>       -> ABORT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10907/shard-dg1-17/igt@gem_exec_capture@many-4k-zero.html>
>       +1 other test abort
>       - shard-tglu: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14481/shard-tglu-2/igt@gem_exec_capture@many-4k-zero.html>
>       (i915#9606 <https://gitlab.freedesktop.org/drm/intel/issues/9606>)
>       -> ABORT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10907/shard-tglu-9/igt@gem_exec_capture@many-4k-zero.html>
>       +1 other test abort
>       - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14481/shard-glk8/igt@gem_exec_capture@many-4k-zero.html>
>       (i915#9606 <https://gitlab.freedesktop.org/drm/intel/issues/9606>)
>       -> ABORT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10907/shard-glk9/igt@gem_exec_capture@many-4k-zero.html>
>
> This one is faster, but still takes almost a minute.

$ time sudo ./build/tests/gem_exec_capture --run-subtest many-4K-zero
IGT-Version: 1.28-g80e9084fd (x86_64) (Linux: 6.7.9-200.fc39.x86_64 x86_64)
Using IGT_SRANDOM=1711437134 for randomisation
Opened device: /dev/dri/card1
Starting subtest: many-4K-zero
Target died after 19.966935s
Captured 0 1-blobs out of a total of 262144
Subtest many-4K-zero: SUCCESS (39.697s)

real    0m55.207s
user    0m0.018s
sys     0m0.031s


>
>    -
>
> Known issues
>
> Here are the changes found in IGTPW_10907_full that come from known issues:
>

Did my patch break all that?

>

--000000000000cdf32c06148b18e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">[...]</div><div dir=3D"ltr"><br></div><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div class=3D"msg-799352703503197868"><div><br>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_capture@many-4k-zero:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_10907/shard-rkl-5/igt@gem_exec_capture@many-4k-zero.htm=
l" target=3D"_blank">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_14481/shard-dg2-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html"=
 target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_10907/shard-dg2-6/igt@kms_cursor_legacy@flip-vs-cursor-ato=
mic.html" target=3D"_blank">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_14481/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1.htm=
l" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_10907/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate@a-=
hdmi-a1.html" target=3D"_blank">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_capture@many-4k-incremental:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_14481/shard-mtlp-6/igt@gem_exec_capture@many-4k-incremental.html" t=
arget=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/9606" target=3D"_blank">i915#9606</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10907/shard-mtlp-4/igt@gem_exec_capt=
ure@many-4k-incremental.html" target=3D"_blank">ABORT</a> +1 other test abo=
rt</li>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_14481/shard-dg2-7/igt@gem_exec_capture@many-4k-incremental.html" ta=
rget=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/9606" target=3D"_blank">i915#9606</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_10907/shard-dg2-11/igt@gem_exec_captu=
re@many-4k-incremental.html" target=3D"_blank">ABORT</a></li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_14481/shard-rkl-3/igt@gem_exec_capture@many-4k-incremental.html" ta=
rget=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/9606" target=3D"_blank">i915#9606</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_10907/shard-rkl-4/igt@gem_exec_captur=
e@many-4k-incremental.html" target=3D"_blank">ABORT</a></li></ul></li></ul>=
</div></div></blockquote><div><div>The timeout seems to be set to a little =
short of 2 minutes. It takes almost 4 minutes to complete when running on m=
y &quot;Intel(R) Celeron(R) CPU =C2=A0N3150 =C2=A0@ 1.60GHz&quot;. Interest=
ingly, after the SUCCESS message the user space process doesn&#39;t do much=
 but the &quot;kworker/1:1H+events_highpri&quot; keeps one CPU busy.</div><=
div>=C2=A0</div><div>peter@n3150:~/dev/igt-gpu-tools$ time sudo ./build/tes=
ts/gem_exec_capture --run-subtest many-4K-incremental<br>IGT-Version: 1.28-=
g80e9084fd (x86_64) (Linux: 6.7.9-200.fc39.x86_64 x86_64)<br>Using IGT_SRAN=
DOM=3D1711436449 for randomisation<br>Opened device: /dev/dri/card1<br>Star=
ting subtest: many-4K-incremental<br>Target died after 19.969394s<br>Captur=
ed 0 1-blobs out of a total of 262144<br>Subtest many-4K-incremental: SUCCE=
SS (48.920s)<br><br>real =C2=A0 =C2=A03m49.723s<br>user =C2=A0 =C2=A00m0.02=
8s<br>sys =C2=A0 =C2=A0 0m0.048s</div></div><div><br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-799352=
703503197868"><div><ul><li><ul>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@many-4k-zero:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_14481/shard-dg1-17/igt@gem_exec_capture@many-4k-zero.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/9606" target=3D"_blank">i915#9606</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_10907/shard-dg1-17/igt@gem_exec_capture@m=
any-4k-zero.html" target=3D"_blank">ABORT</a> +1 other test abort</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_14481/shard-tglu-2/igt@gem_exec_capture@many-4k-zero.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/9606" target=3D"_blank">i915#9606</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_10907/shard-tglu-9/igt@gem_exec_capture@m=
any-4k-zero.html" target=3D"_blank">ABORT</a> +1 other test abort</li>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_14481/shard-glk8/igt@gem_exec_capture@many-4k-zero.html" target=3D"=
_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/9606" target=3D"_blank">i915#9606</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_10907/shard-glk9/igt@gem_exec_capture@many-4k=
-zero.html" target=3D"_blank">ABORT</a></li></ul></li></ul></div></div></bl=
ockquote><div>This one is faster, but still takes almost a minute.</div><di=
v><br></div><div>$ time sudo ./build/tests/gem_exec_capture --run-subtest m=
any-4K-zero<br>IGT-Version: 1.28-g80e9084fd (x86_64) (Linux: 6.7.9-200.fc39=
.x86_64 x86_64)<br>Using IGT_SRANDOM=3D1711437134 for randomisation<br>Open=
ed device: /dev/dri/card1<br>Starting subtest: many-4K-zero<br>Target died =
after 19.966935s<br>Captured 0 1-blobs out of a total of 262144<br>Subtest =
many-4K-zero: SUCCESS (39.697s)<br><br>real =C2=A0 =C2=A00m55.207s<br>user =
=C2=A0 =C2=A00m0.018s<br>sys =C2=A0 =C2=A0 0m0.031s<br></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-7993=
52703503197868"><div><ul><li><ul>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10907_full that come from known issu=
es:</p></div></div></blockquote><div><br></div><div>Did my patch break all =
that?</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"=
msg-799352703503197868"><div>

</div>

</div></blockquote></div></div>

--000000000000cdf32c06148b18e6--
