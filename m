Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F1FE9A75A
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 10:13:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6308E10E654;
	Tue, 24 Mar 2026 10:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nUHF5UDa";
	dkim-atps=neutral
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B6A10E654
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 10:13:49 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-c7358a7a8d1so617389a12.3
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 03:13:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774347229; cv=none;
 d=google.com; s=arc-20240605;
 b=hXXQeuVo80MoL9ax9pFE0xtznzyEZMUOeggePNWztxXpxC06ZTFj/u0zNHSkfPzaRc
 2uy9jsBUyE3njF61RiecjZ1ej1exhLfIYzqw5MuZm+3u1oX4kJFLMF/wNf9r0RjzaZmz
 nGWWUbxjiiAqA2XA1fsPpjK9pJxUC0cvafi5kCHQSGxG4ckJbbrf9/A9YP5TQGDv8qIy
 n9ANHhe93/WjirLqtWKnSsK++Hr8stXVxQEA5XJCSxiwVFz1H/aj9c6RxWxfhYs2K3YO
 ptrE9GfetNo6aKRC776nmihqvvTIQ0Tz3N+ooEpGvAjsENtE7yuijtkEDPXKBPudqahP
 abig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=LaMVmTR/n+J7gQ7+rXENnMv4HvpepqYlyieqMVN9zh4=;
 fh=rfiFcsVNkq/pOwzHNlLFFP2bLjGGbcAfjZMc111wurs=;
 b=Gd1h1u3QBxBn47xJ+Og44r3fxuR3ghKpRj65sbTjVU4S2f/CPleVhUsUjlv8FdvoId
 XK6bha4VT8ygURSYROkjhJwiN8TKVjMD+YGrqsmeZXmN96ooDTJYODuddmEXXtaw8LUQ
 YiBcKiuX+XdzT2jNp55kWk+ja+3Tr0/anOSP3qn6+hDikaKo7qeV/AIlSOQc0sv3Ot7s
 X8VAsZKvkMdAlhbqHIeEvUPjW43IqAH5uAyqNHoaw8VfGagvT6pY29lguSgb6+zyXT4f
 11Ps0160IUlduIOdWHzYKMZPVTaKG61m0ESvPzzlsKoEvba+ykLjDaYj2LxBF2QknSz7
 oKBA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774347229; x=1774952029; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LaMVmTR/n+J7gQ7+rXENnMv4HvpepqYlyieqMVN9zh4=;
 b=nUHF5UDaDsY9TFMqVWem76JaG9R7P8XvMnPbhzjm4FC9666W1VxA68bESXUAP58MSL
 20qAAn4ND2jckrGv2m0yTX/2fmwdLmKZBUEgO7Tw/GRhXbIfU5S1eUR9Nz5hjP72j/oT
 3YFbk8gDH0omuxDf+ZuDXXPe4Mtu2PCVF2yArgSSP5I5dv9SqOQVxyP3T8rtkRslNAJp
 GgCRCHbyafnW4wbzkuzdktcXegvpQyOkKfEAxjX4V6zPFKo86AwW4Y2XMRkzAzJIGid/
 cvEfyL8nPWFd+1U2oaOcrCAwRs/zSIhOuXbi0FkJ/5Sn/f8FxeDe0Ja4etmrvaXnq7EM
 xZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774347229; x=1774952029;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LaMVmTR/n+J7gQ7+rXENnMv4HvpepqYlyieqMVN9zh4=;
 b=fVejm91MjvyFKIj6MTx+v8i+Oa6j86BN6Pa4ZmV5ZyE8Z/h0Z9hFUIslZXheTpGqrq
 dmRNOpKjJB7e1JJWR+HC5dwZjqonGgUC3gwxeZriHfXIKSSBjrVbMxjDcetb9CNxCEq/
 vs/3NoZ1jhw47cHL4kPso3KbmDwUHVnvID9UyZC06X4X0L04P9bail1jAo5rK0f8+NaL
 9sLdCgn+Ec8FkZ6GHZzKXOYy1R+fSWfGwxxBd+a5+IFMXID1au6SQM2D/QGA06k4w7RP
 evpTmoxz2/rGKmrSLl/Ss16Qm3q/WS18odJvEbbxn8RXqBagppEwZJqNx/fCffUybL0y
 VaoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWscbmdctXbnAMX9zPRbF5BKGrlq2TsSPYOIPIKJ67I1yymOKME577A1FwEWJTpHKjkr6d1/qGW@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxz8v4o+Y5OnSIsz6BPo4WGl3a4f9VktslYIg1FpsukNXZlNBeR
 /mgR5/mYZ8oxvFrncCB52Cc0JPEuimPLWo29tAgJdlZTh4zmnhLeqd23+UnyhpEPBYt4lExTrCa
 4Vr6/F8nvtM1pDa4q/DNT3N0kw00Nao4=
X-Gm-Gg: ATEYQzwBO+PIvuZjUs1m/otwspCS5J9v9Ro+lStCkEG3kk1gRV5mDb2bWGK8wzxt5rg
 S6L59SJTU4uDlKxdcwpDN8TvOEifk+/9QCkPwjZ/ecqZnYeeaeZAwOtKaTIMKzE9s7QzkTog9zZ
 46YxubH99Fp/qt9ngSFG7HpROpD+DXI6VpExv0k7FEfrninZQ0Kygbfb3h366C708rjMnYCTBOH
 EBPHLREtHeH80segY/TOZWh0omdipRgZf5YD+ylAbEM30DIVbeh1gUXsn2y09JeiWDoLqwAEWDK
 o3qKsnV9Q9ug1KLGjXW4nnYeB6YK3Z6QoACMccmzBA==
X-Received: by 2002:a05:6a20:748d:b0:398:a5c7:3dce with SMTP id
 adf61e73a8af0-39bceaa20afmr14424631637.23.1774347228875; Tue, 24 Mar 2026
 03:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260216181610.129209-1-kamil.konieczny@linux.intel.com>
 <177432952945.389452.13551977552710752956@a3b018990fe9>
 <20260324094318.pnjaf3hkkngdudfm@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260324094318.pnjaf3hkkngdudfm@kamilkon-DESK.igk.intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Tue, 24 Mar 2026 12:13:36 +0200
X-Gm-Features: AaiRm51dDVZ7bWlIdwJnxrbMhUSRYzF8JA9bHHrTkG4POjSECbaB6Jmy5K5LD78
Message-ID: <CAJ=qYWT-fsW=A_Oz3AHpZ7CwbO7UOk2oCcm+R2ZUUGuXeUe0Pw@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBsaWIvaWd0X2ZiOiBhZGQgWVVWfA==?=
 =?UTF-8?B?WVZVLTQxMHw0MTF8NDQ0IGZvcm1hdHMgKHJldjIp?=
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org, 
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, 
 Swati Sharma <swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Mar 24, 2026 at 11:43=E2=80=AFAM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi igt-dev,
> On 2026-03-24 at 05:18:49 -0000, Patchwork wrote:
> > =3D=3D Series Details =3D=3D
> >
> > Series: lib/igt_fb: add YUV|YVU-410|411|444 formats (rev2)
> > URL   : https://patchwork.freedesktop.org/series/161665/
> > State : failure
> >
> > =3D=3D Summary =3D=3D
> >
> > CI Bug Log - changes from XEIGT_8820_FULL -> XEIGTPW_14838_FULL
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> >
> > Summary
> > -------
> >
> >   **FAILURE**
> >
> >   Serious unknown changes coming with XEIGTPW_14838_FULL absolutely nee=
d to be
> >   verified manually.
> >
> >   If you think the reported changes have nothing to do with the changes
> >   introduced in XEIGTPW_14838_FULL, please notify your bug team (I915-c=
i-infra@lists.freedesktop.org) to allow them
> >   to document this new failure mode, which will reduce false positives =
in CI.
> >
> >
> >
> > Participating hosts (2 -> 2)
> > ------------------------------
> >
> >   No changes in participating hosts
> >
> > Possible new issues
> > -------------------
> >
> >   Here are the unknown changes that may have been introduced in XEIGTPW=
_14838_FULL:
> >
> > ### IGT changes ###
> >
> > #### Possible regressions ####
> >
> >   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> >     - shard-bmg:          [PASS][1] -> [FAIL][2]
> >    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8820/shard-bmg-4/=
igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> >    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14838/shard-bmg=
-10/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> >
>
> Imho this is unrelated, +cc Karthik, Swati and J-P to be sure
> as the change is in IGT library display code.
>

I don't see how proposed change could cause this error. Look like
usual noise from ci that just sometimes happen.

>
> >
> > Known issues
> > ------------
> >
> >   Here are the changes found in XEIGTPW_14838_FULL that come from known=
 issues:
> >
> > ### IGT changes ###
> >
> > #### Issues hit ####
> >
> >   * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
> >     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124])
> >    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14838/shard-bmg=
-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
> >
> ...cut...
