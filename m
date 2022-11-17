Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C0110E577
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Nov 2022 09:05:15 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id t4so903230wmj.5
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Nov 2022 01:05:15 -0800 (PST)
MIME-Version: 1.0
References: <20221117084129.2534819-1-petri.latvala@intel.com>
 <Y3X0zvavwvxhcBqL@platvala-desk.ger.corp.intel.com>
In-Reply-To: <Y3X0zvavwvxhcBqL@platvala-desk.ger.corp.intel.com>
From: Craig Small <csmall@dropbear.xyz>
Date: Thu, 17 Nov 2022 20:05:03 +1100
Message-ID: <CALy8Cw5unkaRt0+ENVKp3gywkr2GthLnMghc1eO2r93xV4L+hg@mail.gmail.com>
To: Petri Latvala <petri.latvala@intel.com>
Content-Type: multipart/alternative; boundary="0000000000001bbb1105eda6e349"
Subject: Re: [igt-dev] [PATCH i-g-t] Use the new procps library libproc2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--0000000000001bbb1105eda6e349
Content-Type: text/plain; charset="UTF-8"

Hi Petri,
  Yes I am the author of the patch.

Feel free to adjust the follow, for example I'm not 100% sure how you
section your program up.

igt_core: Link to libproc2

libprocps, the library that provides information out of the proc filesystem,
has been renamed to libproc2 and has a new API.

This change will use either library and, for the newer one extracts the
values
once, rather than parsing the pids_info over and over.

Signed-off-by: Craig Small <csmall@dropbear.xyz>



>

--0000000000001bbb1105eda6e349
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Petri,<div>=C2=A0 Yes I am the author of the patch.</di=
v><div><br></div><div>Feel free to adjust the follow, for example I&#39;m n=
ot 100% sure how you section your program up.</div><div><br></div><div>igt_=
core: Link to libproc2<br><br>libprocps, the library that provides informat=
ion out of the proc filesystem,<br>has been renamed to libproc2 and has a n=
ew API.<br><br>This change will use either library and, for the newer one e=
xtracts the values<br>once, rather than parsing the pids_info over and over=
.<br><br>Signed-off-by: Craig Small &lt;<a href=3D"mailto:csmall@dropbear.x=
yz">csmall@dropbear.xyz</a>&gt;<br><br></div><div><br></div><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
</blockquote></div></div>

--0000000000001bbb1105eda6e349--
