Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A16110E576
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Nov 2022 08:54:20 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id v1so2520145wrt.11
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Nov 2022 00:54:20 -0800 (PST)
MIME-Version: 1.0
References: <CALy8Cw536QRzgQywc8B_PcVwA5GfvOy4nTHURLxFM-orDuWi8g@mail.gmail.com>
 <Y3XvfbdbF5qyitOQ@platvala-desk.ger.corp.intel.com>
In-Reply-To: <Y3XvfbdbF5qyitOQ@platvala-desk.ger.corp.intel.com>
From: Craig Small <csmall@dropbear.xyz>
Date: Thu, 17 Nov 2022 19:54:07 +1100
Message-ID: <CALy8Cw6OqAZjbfUpMHGtAwGnzM36aVgx9c70nkH1M9Vn+pK=wg@mail.gmail.com>
To: Petri Latvala <petri.latvala@intel.com>
Content-Type: multipart/alternative; boundary="000000000000052edf05eda6bced"
Subject: Re: [igt-dev] PATCH i-g-t Use the new procps library libproc2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--000000000000052edf05eda6bced
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Nov 2022 at 19:23, Petri Latvala <petri.latvala@intel.com> wrote:

> What is the current distro availability status of libproc2? I can't
> find it at all in Ubuntu, it seems to be in experimental repo only in
> Debian, and I have no idea about the others.
>
Not sure, its a bit wait and see for other distributions. I think one of
the SuSE based ones had it.

The program will have to test for both libprocps and libproc2. I have
purposely put libproc2 into Debian experimental because otherwise the bug
reports for all its dependent projects would be raised higher and any
updates would not pass.
I'm giving those projects time to get the patches into either the Debian
package or, preferably upstream.

After that time then libproc2 will be in Sid and then no more updates of
dependent projects should happen until its fixed.

 - Craig

--000000000000052edf05eda6bced
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 17 Nov 2022 at 19:23, Petri L=
atvala &lt;<a href=3D"mailto:petri.latvala@intel.com">petri.latvala@intel.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">What is the current distro availability status of libproc2? I can&#39;t<b=
r>
find it at all in Ubuntu, it seems to be in experimental repo only in<br>
Debian, and I have no idea about the others.<br></blockquote><div>Not sure,=
 its a bit wait and see for other distributions. I think one of the SuSE ba=
sed ones had it.</div><div><br></div><div>The program will have to test for=
 both libprocps and libproc2. I have purposely put libproc2 into Debian exp=
erimental because otherwise the bug reports for all its dependent projects =
would be raised higher and any updates would not pass.</div><div>I&#39;m gi=
ving those projects time to get the patches into either the Debian package =
or, preferably upstream.</div><div><br></div><div>After that time then libp=
roc2 will be in Sid and then no more updates of dependent projects should h=
appen until its fixed.</div><div><br></div><div>=C2=A0- Craig</div><div><br=
></div></div></div>

--000000000000052edf05eda6bced--
