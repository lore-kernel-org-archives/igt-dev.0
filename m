Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEC3CD5BD0
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 13:07:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA1D10E31A;
	Mon, 25 May 2026 13:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="nA0hiBR2";
	dkim-atps=neutral
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C8310E321
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 13:07:26 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-694891f8f62so5259216eaf.2
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 06:07:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779714445; cv=none;
 d=google.com; s=arc-20240605;
 b=laxxcPqZ7KxxJ0jM3n0OPiVR73u5n6xVdUjZsudbwU7InEiujY05X8fUGtbm8C/pW3
 f4twgry8yU/XAT3y4U9WVFBSQSrBLQfOhhus+GCA8Y7+2zr1DeFAXMLMCTew12FRibb0
 q3v9Ms70gUdLlR/9CI0FJEGeJBxm31jsUi2NrfdvjG5cgOoThhnGWEJ2XLGj7YQHdIxR
 ziaxye7mYs1RPdS9Yw74CTzBl9QYIuwFHVUyzPgitNfcwwE4B4Z5rChO7s2rW22MS3qJ
 aAG+zS8ZfSwkwWx+cP00KudKh64KRd7Z7WlNdNED/xAwEvbqNq9+nntDzxAUggSkLOD6
 hVGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=p6EpcBQnEubApobh4bStrovQwoNjUzLgS4TFbM4TlLo=;
 fh=7R/vQdn0NiIUrcQiHvuD0TTDNIhV8WMv7SV8PEVfa2w=;
 b=IiQkDouVchYvwfRRjHZ95nDJCH/tQD+dSS8PedRdTxClMJZUAZeL3fSAYUO062OVUB
 BVaew0HH10LJGLRXBBYA0BEa/apbAMlwdDiqfSBDixB23yIDvBB0cZ0+DToa3MQ4Ause
 +X3acq5I2XkzTBrafvc4pVz1RejPdZbNPqsjKJKtF2dG1MZeJuAXGG+pYqGuPrhS6rqe
 DcVMHXLwcU393X3NXnYgU7PAMYZy1DMhvRghkFF3S0wxoTyWvISJ9GEXm9v1h1w0/4Hr
 v5rfhku02sT9lWbptw97Un4QZ5Ba4Uc/aqFr0DjH+0klWL5okcm9ZGWhdRKHT1rDYGZC
 e17g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1779714445; x=1780319245;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p6EpcBQnEubApobh4bStrovQwoNjUzLgS4TFbM4TlLo=;
 b=nA0hiBR26dXuqTW1cHePZuk2qPrS9e+vFk0TxKhKSDQqO2HNWY6/c0Dl6MRTbZx3Ya
 7MoZSOa8gK23qN3lbxw645J2P8uOp9k56E+nKRsbqHJhvazvjfep0KFYv7HY0sEL/cA5
 fjMxUgCv++Jo0V8G7j9sSt8PTlq9/ZjkWUqps8NlBsAg8OOK7BA/LzbnabKvmWGZn8Zt
 BXWWRGSBM167eBPIIda1i7IW0kDZkO+/Z56XEjk2gIHLEfC/idUik0FY940drI6CzSxU
 J4CGK3B92oeMWKbDc4FQpxswAu5iTKSjgsxNoVPZiWi0IUQJx/71Tduk8XwL2QktkVi+
 OnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779714445; x=1780319245;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p6EpcBQnEubApobh4bStrovQwoNjUzLgS4TFbM4TlLo=;
 b=BN+fqr6iwBLlAxgD5lVq9gz/qe7EuzkQlP9FIhWvMIwZgJ5U5leMhebmoObNkGs14U
 UzDs8kB/bHuDVRwKDNEuyg9yipjRZiFvqjhelyc2FZbDHaRoBgeAQiTVfi24DwGCbho9
 8Q2RrblDLN4njtoR5Nybvav0f4syPHW5EFXOtSUcpacxYG7hyoXuM+C6dxScgyfs9pP8
 +KqFjc4HYR4m+U5v1dU+pMWs+zQ6FF5Px8Pr8ypogI0zcPp1azUtn6dVORaJNXy7ePaV
 tE/OeNCcks6PGK5CpVV7F0WFRHET59VPvx7rMQxaKR0TxvWlPIBaigi3irC+4V6Lyt5u
 Qg+g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8DQu9zMZyR0Wy/WBFArbx1e1+CaJ0KjlcTL5C+pRFm4CgPOq0igaHL3VLe4fqumbOmMSOBHVOD@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBzIKLa+6i911LuGmU4ikFstz/pEJBB4iFuSqEYLmwQzUxtLDp
 K5k9QAqEiPYXMU/yvXfDDRGX+KTCbNoEfvmJu3OBHP+1F7bkRa3hs2t0pxAY3y8ZhaaFE7ulWpY
 x7fR3pKx7XeU9QkfU9PkdDAlKJypyRb/kFExYKrqw
X-Gm-Gg: Acq92OH8LEE9aZV4lgKmyv0iJkp5UkmE2DcR9ZXFW2KXzPpNsEgdR0ZJnCVG17ibkDX
 wLUevBmtf2VmSN0H/SvTgRZuaoN9QXro4amWZK/RKXVfGFZRW3hvBnqwZafCDVkcjmX0Swx9Y7w
 oHdKN5BebYYkeBB541OepgxglaOO78pTJi10AU04f1itJu6CVCBITaMJLG7ojImsjLA0rFHCuVr
 +DeP510USlGmtuv7W6cdsvEqrkb6KdaVdfcf1a5+0QlejR0T/ZoQIoLZoIN3JBUj/Sg9X+0o0r9
 NbLMfTWS4U8MB1n01vjIY3JoWtzzgfifUkgzznxeClpO3QE8
X-Received: by 2002:a4a:e903:0:b0:69d:8055:d92d with SMTP id
 006d021491bc7-69d8055feaamr7440511eaf.3.1779714445065; Mon, 25 May 2026
 06:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260520064651.3266598-1-jason-jh.lin@mediatek.com>
 <20260520064651.3266598-3-jason-jh.lin@mediatek.com>
 <ag28FVTooBC6Yly3@intel.com>
 <53284b68be0216eab50946da686968691fa59a56.camel@mediatek.com>
 <ag7g07pHLWgPViVh@intel.com>
 <988bcdc233564b398a87190cb40489d43ed3922c.camel@mediatek.com>
 <ahCdAq03EHvn3zu9@intel.com>
 <af89358195f2780dd882f339db7198e48543fb50.camel@mediatek.com>
In-Reply-To: <af89358195f2780dd882f339db7198e48543fb50.camel@mediatek.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Mon, 25 May 2026 09:07:13 -0400
X-Gm-Features: AVHnY4Kmfd21D0bZ2iv0lT7ELqjCo342p8mcukE4WjNVU_bTfOaUzTIVAMn8ZJM
Message-ID: <CAC0gqY5ggHL8DM4qNHfpvx5Kc+_oZ63ogjU8k5fkaWfGeZ+SRw@mail.gmail.com>
Subject: Re: [PATCH i-g-t 2/2] tests/kms_setmode: Disable CPU deep sleep for
 accurate vblank timestamps
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Cc: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, 
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>, 
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "gildekel@google.com" <gildekel@google.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
 =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, 
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>, 
 "navaremanasi@google.com" <navaremanasi@google.com>,
 "fshao@chromium.org" <fshao@chromium.org>, 
 "markyacoub@chromium.org" <markyacoub@chromium.org>
Content-Type: multipart/alternative; boundary="0000000000004e8bbc0652a40fdb"
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

--0000000000004e8bbc0652a40fdb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 23, 2026 at 2:02=E2=80=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=
=A5=A5) <
Jason-JH.Lin@mediatek.com> wrote:

> >
> [snip]
>
> > > Hi Ville,
> > >
> > > Thank you for the feedback.
> > >
> > > You're right - the patch was purely to pass IGT tests, not to fix a
> > > real problem (although we haven't encountered any issue within
> > > randomly ~200us jitter on our current platform).
> > >
> > > I've investigated the real-world impact of this ~200us timestamp
> > > jitter. In our current Android SurfaceFlinger implementation,
> > > real-world usage is stable with CPU deep sleep enabled.
> > > It seems this issue only appears in IGT single-CRTC testing where
> > > CPU
> > > enters deep sleep during idle periods between frames.
> > > Therefore, we prefer not to disable CPU deep sleep system-wide in
> > > kernel due to power consumption concerns.
> > >
> > > However, I'd like to understand how the 1-scanline standard was
> > > originally defined for this test. Do real-world use cases actually
> > > require this level of precision?
> >
> > I don't have specific examples, but people cared about precision
> > enough to add the whole timestamp correction thingy into the kernel.
> > And in i915 we also sometimes use the timestamps to cook up a frame
> > counter (when the hardware lacks one) and I wouldn't want to do that
> > without adjusting the timestamps based on the scanout position.
> >
> > Anyways, since this is usually implemented via a scanline counter
> > (sometimes even a pixel counter) that's the kind of accuracy one
> > would expect to get, and so that's what one tests for to make sure
> > it's working correctly.
> >
> > >
> > > Not all platforms support or implement get_scanout_position() -
> > > could the standard be relaxed for such platforms?
> >
> > If you don't implement accurate timestamps then the test is
> > expected to fail. I see nothing wrong in that.
> >
> > Relaxing the test doesn't make sense to me because then it can
> > no longer tell you whether your timestamps are accurate or not.
> > Although I guess you could have another similar test that
> > makes sure that the timestamps are at least somewhat sane,
> > even if not very accurate.
> >
>
> Hi Ville,
>
> I understand your point, and I agree that implementing
> get_scanout_position() is the proper long-term fix.
>
> However, I'd like to explain our reasoning for this patch.
> The purpose of this test is to verify the accuracy of the kernel vblank
> timestamp itself. We have identified that disabling CPU idle eliminates
> the jitter and the test passes, which confirms that our timestamp
> implementation is correct - the ~200us jitter is caused by CPU idle
> wakeup latency as an external interference, not by the timestamp
> mechanism itself.
>
> Therefore, before we complete the get_scanout_position()
> implementation, we believe this patch still has value - it allows the
> test to effectively verify our timestamp accuracy by removing the
> external CPU idle interference, while also preventing other potential
> issues from affecting timestamp precision on MediaTek platforms.
>
here is my 2c:
As this test uncovered another bug (external CPU Idle interference), it
MUST not be removed. Otherwise, we hide a bug, even if it wasn't the
intended test.
Therefore, if you decide with Ville that there is value in your workaround,
it must be ANOTHER test.
Test#1 shows that you have an accurate timestamp without interference (this
shall pass for MTK)
another test showing that CPU idleness with throw off the accuracy of the
timestamp (will fail)
This will give you 2 results: accurate timestamps that deviates sometime.
It's up to you and the platform owner to decide if this is an acceptable
behavior.
But, we shall not change a test to hide a bug.

-Mark

>
> We will add a clear note in the commit message and comments, for
> example:
> /*
>  * Disable CPU deep sleep to eliminate wakeup latency interference
>  * during vblank timestamp verification.
>  *
>  * NOTE: This is a temporary workaround for platforms that have not yet
>  * implemented get_scanout_position(). Once get_scanout_position() is
>  * properly implemented, the vblank timestamp will be accurately
>  * compensated regardless of CPU idle states, and this workaround can
>  * be removed.
>  */
> if (is_mtk_device(fd))
>     igt_disable_cpu_deep_sleep();
>
> Additionally, this note serves as a reference for other platforms
> facing the same issue, helping them understand that CPU idle wakeup
> latency may interfere with vblank timestamp accuracy, and encouraging
> them to implement get_scanout_position() as the  proper solution.
>
> Would this approach be acceptable to you?
>
> Best regards,
> Jason-JH Lin
>

--0000000000004e8bbc0652a40fdb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, May 23,=
 2026 at 2:02=E2=80=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=A5=A5) &lt;<a =
href=3D"mailto:Jason-JH.Lin@mediatek.com">Jason-JH.Lin@mediatek.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; <br=
>
[snip]<br>
<br>
&gt; &gt; Hi Ville,<br>
&gt; &gt; <br>
&gt; &gt; Thank you for the feedback.<br>
&gt; &gt; <br>
&gt; &gt; You&#39;re right - the patch was purely to pass IGT tests, not to=
 fix a<br>
&gt; &gt; real problem (although we haven&#39;t encountered any issue withi=
n<br>
&gt; &gt; randomly ~200us jitter on our current platform).<br>
&gt; &gt; <br>
&gt; &gt; I&#39;ve investigated the real-world impact of this ~200us timest=
amp<br>
&gt; &gt; jitter. In our current Android SurfaceFlinger implementation,<br>
&gt; &gt; real-world usage is stable with CPU deep sleep enabled.<br>
&gt; &gt; It seems this issue only appears in IGT single-CRTC testing where=
<br>
&gt; &gt; CPU<br>
&gt; &gt; enters deep sleep during idle periods between frames.<br>
&gt; &gt; Therefore, we prefer not to disable CPU deep sleep system-wide in=
<br>
&gt; &gt; kernel due to power consumption concerns.<br>
&gt; &gt; <br>
&gt; &gt; However, I&#39;d like to understand how the 1-scanline standard w=
as<br>
&gt; &gt; originally defined for this test. Do real-world use cases actuall=
y<br>
&gt; &gt; require this level of precision?<br>
&gt; <br>
&gt; I don&#39;t have specific examples, but people cared about precision<b=
r>
&gt; enough to add the whole timestamp correction thingy into the kernel.<b=
r>
&gt; And in i915 we also sometimes use the timestamps to cook up a frame<br=
>
&gt; counter (when the hardware lacks one) and I wouldn&#39;t want to do th=
at<br>
&gt; without adjusting the timestamps based on the scanout position.<br>
&gt; <br>
&gt; Anyways, since this is usually implemented via a scanline counter<br>
&gt; (sometimes even a pixel counter) that&#39;s the kind of accuracy one<b=
r>
&gt; would expect to get, and so that&#39;s what one tests for to make sure=
<br>
&gt; it&#39;s working correctly.<br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; Not all platforms support or implement get_scanout_position() -<b=
r>
&gt; &gt; could the standard be relaxed for such platforms?<br>
&gt; <br>
&gt; If you don&#39;t implement accurate timestamps then the test is<br>
&gt; expected to fail. I see nothing wrong in that.<br>
&gt; <br>
&gt; Relaxing the test doesn&#39;t make sense to me because then it can<br>
&gt; no longer tell you whether your timestamps are accurate or not.<br>
&gt; Although I guess you could have another similar test that<br>
&gt; makes sure that the timestamps are at least somewhat sane,<br>
&gt; even if not very accurate.<br>
&gt; <br>
<br>
Hi Ville,<br>
<br>
I understand your point, and I agree that implementing<br>
get_scanout_position() is the proper long-term fix.<br>
<br>
However, I&#39;d like to explain our reasoning for this patch.<br>
The purpose of this test is to verify the accuracy of the kernel vblank<br>
timestamp itself. We have identified that disabling CPU idle eliminates<br>
the jitter and the test passes, which confirms that our timestamp<br>
implementation is correct - the ~200us jitter is caused by CPU idle<br>
wakeup latency as an external interference, not by the timestamp<br>
mechanism itself.<br>
<br>
Therefore, before we complete the get_scanout_position()<br>
implementation, we believe this patch still has value - it allows the<br>
test to effectively verify our timestamp accuracy by removing the<br>
external CPU idle interference, while also preventing other potential<br>
issues from affecting timestamp precision on MediaTek platforms.<br></block=
quote><div>here is my 2c:=C2=A0</div><div>As this test uncovered another bu=
g (external CPU Idle interference), it MUST not be removed. Otherwise, we h=
ide a bug, even if it wasn&#39;t the intended test.</div><div>Therefore, if=
 you decide with Ville that there is value in your workaround, it must be A=
NOTHER test.</div><div>Test#1 shows that you have an accurate timestamp wit=
hout interference (this shall pass for MTK)</div><div>another test showing =
that CPU idleness with throw off the accuracy of the timestamp (will fail)<=
/div><div>This will give you 2 results: accurate timestamps that deviates s=
ometime. It&#39;s up to you and the platform owner to decide if this is an =
acceptable behavior.=C2=A0</div><div>But, we shall not change a test to hid=
e a bug.</div><div><br></div><div>-Mark</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
We will add a clear note in the commit message and comments, for<br>
example:<br>
/*<br>
=C2=A0* Disable CPU deep sleep to eliminate wakeup latency interference<br>
=C2=A0* during vblank timestamp verification.<br>
=C2=A0*<br>
=C2=A0* NOTE: This is a temporary workaround for platforms that have not ye=
t<br>
=C2=A0* implemented get_scanout_position(). Once get_scanout_position() is<=
br>
=C2=A0* properly implemented, the vblank timestamp will be accurately<br>
=C2=A0* compensated regardless of CPU idle states, and this workaround can<=
br>
=C2=A0* be removed.<br>
=C2=A0*/<br>
if (is_mtk_device(fd))<br>
=C2=A0 =C2=A0 igt_disable_cpu_deep_sleep();<br>
<br>
Additionally, this note serves as a reference for other platforms<br>
facing the same issue, helping them understand that CPU idle wakeup<br>
latency may interfere with vblank timestamp accuracy, and encouraging<br>
them to implement get_scanout_position() as the=C2=A0 proper solution.<br>
<br>
Would this approach be acceptable to you?<br>
<br>
Best regards,<br>
Jason-JH Lin<br>
</blockquote></div></div>

--0000000000004e8bbc0652a40fdb--
