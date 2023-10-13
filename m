Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B61510E5AB
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 06:44:33 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5a7cc03dee5so21983177b3.3
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Oct 2023 23:44:33 -0700 (PDT)
MIME-Version: 1.0
From: chalil jitesh <chaliljitesh@gmail.com>
Date: Fri, 13 Oct 2023 12:14:20 +0530
Message-ID: <CAP8JTaYSZ1-3nuc1qHzHDjk_9xqf_1SvQrykTr_s=dNkghnekw@mail.gmail.com>
To: igt-dev@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000009238da06079363c4"
Subject: [igt-dev] Request for information on the igt-gpu-tools
 intel_infoframes test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--0000000000009238da06079363c4
Content-Type: text/plain; charset="UTF-8"

Hi,

I was trying to test and validate the Displayport Sink device behaviour to
invalid stream packets received, while checking for some tools which we can
use for testing, came to know about the igt-gpu-tools tests which can be
used for testing compliance of displayport driver.

For testing I wanted to send some error DP frames packets (send some
invalid stream data packets) to the DP sink device to check if the sink
device is behaving correctly to error stream data frames received.
Could you please give us information if we can use any tools/tests
available in igt-gpu-tools package, which we can use for testing invalid DP
frames.
Can we use the test like intel_infoframes available in igt-gpu-tools
package to modify/generate the DP error data frames packets which can be
sent to the sink device (or is the test intel_infoframes only supported for
HDMI tests).

Kindly please suggest if any of the tools/tests in igt-gpu-tools package
can be used for testing sending error DP stream packets.

With Thanks and Regards
Jitesh

--0000000000009238da06079363c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi=
,</div><div><br></div><div>I was trying to test and validate the Displaypor=
t Sink device behaviour to invalid stream packets received, while checking =
for some tools which we can use for testing, came to know about the igt-gpu=
-tools tests which can be used for testing compliance of displayport driver=
.</div><div><br></div><div>For testing I wanted to send some error DP frame=
s packets (send some invalid stream data packets) to the DP sink device to =
check if the sink device is behaving correctly to error stream data frames =
received.</div><div>Could you please give us information if we can use any =
tools/tests available in=C2=A0igt-gpu-tools=C2=A0package, which we can use =
for testing invalid DP frames.</div><div>Can we use the test like intel_inf=
oframes available in igt-gpu-tools package to modify/generate the DP error =
data frames packets which can be sent to the sink device (or is the test in=
tel_infoframes only supported for HDMI tests).</div><div><br></div><div>Kin=
dly please suggest if any of the tools/tests in igt-gpu-tools package can b=
e used for testing sending error DP stream packets.</div><div><br></div><di=
v>With Thanks and Regards</div><div>Jitesh</div></div></div></div></div>

--0000000000009238da06079363c4--
