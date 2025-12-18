Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D12D6E2AD
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 15:59:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4A210EA1C;
	Thu, 18 Dec 2025 15:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="f36s8rqr";
	dkim-atps=neutral
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38A510EA1C
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 15:59:46 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-4f0013c54efso2779381cf.1
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 07:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1766073585; x=1766678385;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q6Zu7UiEUr/FoVVmbpprOsKHy/chw86XggRasdKz55U=;
 b=f36s8rqreMNwsSdZtbCvApvbok3PIHmnD4TeX3WHnSuETa36TvPvYQxhmLdq/v9CQw
 gzlMo3/QIrH/e7yWZurgoPchvKn/Arnm21TWQKg/MwvC8Ku+/8U9BykPu4bTgChvNECQ
 EDf33zgmfZBoQKWWKFR9V4jUe9fm2iH0ljzM8ufTSTj9pJ2XK8uegG6JID9q7Cl8gfw+
 LjVrsVtlwiz7ACe2f8qtNs9tMvBx10rAzR8Ky4eqS7WHdbLxEVSwqqRiVi1KPRDttM1o
 OwebS6fYNBoNcSq2F6YcictNzcI+XJ/6onfFYUtww4WSmmllJx0VlYzASC5I7bmopsk/
 HjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766073585; x=1766678385;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q6Zu7UiEUr/FoVVmbpprOsKHy/chw86XggRasdKz55U=;
 b=GZROm8n8hXk8hPzH6u9nj2nC0Wpp1diO151jXUO+ru4pNGTeQFMC/oeZ6CFkz5dEPm
 G2SkmjkdVXm5qwob+QPPef9qWdm/WKbIwRWGkGtJHnCqV9WOaiE1XQAW1i08C7fQmrqI
 fZ2ErYP2cyq5LDMTwB/Ogyb9824/xe3ws9YfSBG5M8UlugK3fIxK8qPiXAJfNVKsPhTb
 DBM7SxThecjGqtxNXJZJ7260mgK7bBIPxjOE9UIsncfY6qV0yReMu9UGunHG7LyicVzs
 IsytA572IlhOmj7f4ooub4/NNjky4gjdj3D/KB22AqLns5f5S5tFF6019BRudS7gfyiu
 YOOQ==
X-Gm-Message-State: AOJu0YyBDcYPYlFm34mGcf38JlIcLwM9VlhbEcMXnaFouJ0QsAIw4VKe
 6j27GOFgH0kI7AKgDN61Ty1l02Uz5/unHmMdeG+CHRRkFLQcVsa7FmqKFzQAEcMfNWhRTJg1nKo
 vVXwRPrJ6+L9Lqz6OcSykErB7lkb5rAXrw5st9Bdi
X-Gm-Gg: AY/fxX7UKsl74mitgqfVHgOYZwpphnn3QRSoj3Ibne3H88nBhPbyQgop7UiX+jZ/LT5
 9KsQRIK2UG7YVCP4HjKMy/sahxABspFK1f9caln/gP2evwrFdr+PP9+gqVoeOQHDn2yOsSiyuvW
 TcvpD7UIWDDJJ1xX1e+Z9nvPznur1xE59JquJyIQb6WdDDtFQTwf+RPNiy+KmzgJ4AWGQMYpNqV
 FaLSfzKWpAe8b2FB3WTBxtjPr7QZBSKb5jTrki52pteTI+iGVaF+8QlE+4MUq8oDO5CkLbKO2ib
 mD13V4t/KZXzAo3tK5zjx+BtkA==
X-Google-Smtp-Source: AGHT+IFBkEm9OiCyM5/PHSQVYRyhZaXt+lPgRdFlmIkXWw5rIzAwsCM60mB376CkufJniW28PNcMCzqK9RbTSOthXEY=
X-Received: by 2002:ac8:690c:0:b0:4f0:21f2:cc98 with SMTP id
 d75a77b69052e-4f1d05dd186mr305373041cf.50.1766073583589; Thu, 18 Dec 2025
 07:59:43 -0800 (PST)
MIME-Version: 1.0
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <4114fcac-ad4a-4028-a01e-d3d33c45c67c@bootlin.com>
In-Reply-To: <4114fcac-ad4a-4028-a01e-d3d33c45c67c@bootlin.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Thu, 18 Dec 2025 10:59:32 -0500
X-Gm-Features: AQt7F2q_oF3ulD4XDPfGaAiWcMa_rWZailxJORBplGbIqVRczY0Dc6b-e_uYVCs
Message-ID: <CAC0gqY540WmYaByFeuD-dOQ-6OAGysmLGMoWPgqiR5iRpwGMdg@mail.gmail.com>
Subject: Re: [PATCH i-g-t v4 00/46] Unigraf integration
To: Louis Chauvet <louis.chauvet@bootlin.com>, ville.syrjala@linux.intel.com, 
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com, 
 khaled.almahallawy@intel.com
Content-Type: multipart/alternative; boundary="000000000000996d1a06463c0c72"
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

--000000000000996d1a06463c0c72
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello maintainers,
These patches are needed by the Display team to enable IGT on our UCDs in
the lab, leveraging its testing capabilities for the intel driver with
external monitors. I will ask Louis' team to do the reviews. But feel free
to interject at any point if things don't look right to you.
Thanks!

On Thu, Dec 18, 2025 at 9:50=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com>
wrote:

> Hi everyone,
>
> Small ping on this series, I understand this is a big series, so if you
> think this is useful I can try to split it in multiple sub-series and
> resend them.
>
> Thanks a lot,
> Louis Chauvet
>
> On 11/10/25 14:39, Louis Chauvet wrote:
> > Hi everyone,
> >
> > I am excited to share I currently have access to a Unigraf device,
> > which I believe could significantly enhance the capabilities within IGT=
.
> > This device has the potential to enable testing of low-level hardware
> > features that are currently not covered. Specifically, Unigraf devices
> can
> > assist in testing link training, signal integrity, HDCP, DSC, and more.
> >
> > It's important to note that the Unigraf SDK is not open-source, and the
> > communication protocol with the device is proprietary. As a result, I
> have
> > utilized the libTSI.so library, which can be downloaded from [1]. In th=
is
> > RFC, I have not used the official TSI_types.h header because it was
> > incompatible with C, so I hardcoded some necessary values. The next
> > iteration will use the official TSI_types.h (they plan to fix it for th=
e
> > next release).
> >
> > This RFC is intentionally concise to gather initial feedback from the
> > community regarding the integration of a proprietary device into the te=
st
> > suite. I plan to expand on this work by adding more features and pushin=
g
> > the developments upstream.
> >
> > I have also started to work on MST testing (hotplug, link training,
> > bandwith limitation), but I have a big issue: connector detection is ve=
ry
> > strange when changing MST configurat (MST->SST, sink count...).
> >
> > If I use the Unigraf GUI or my own C script outside IGT, everything see=
ms
> > fine: `watch -n0 modetest -c` update connector status almost immediatly
> > after a HDP pulse, never hang and always have the correct result.
> >
> > But if I do the same in IGT (same script in igt_main), igt have too
> > much/not all connectors, and some of them are broken (no EDID property
> > for example). I tried to run `watch -n0 modetest -c` in parallel, but
> > modetest can:
> > - hang
> > - only update once igt test is finished.
> >
> > Do you have any hint about something I missed in IGT to properly
> enumerate
> > connectors? I tried close/open the DRM device, added a lot of delay
> > everywhere, emulate plug/unplug... I used kms_wait_for_new_connectors (=
in
> > this series) and for_each_connected_output to get list the connectors.
> >
> > Looking forward to your thoughts and suggestions!
> >
> > Thanks,
> > Louis Chauvet
> >
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> > Changes in v4:
> > - Rebased on master
> > - Fixed multiple unigraf callbacks
> > - Created link training tests
> > - Link to v3:
> https://lore.kernel.org/r/20250823-unigraf-integration-v3-0-cdc36d5fab4c@=
bootlin.com
> >
> > Changes in v3:
> > - Rebased on master
> > - Added support for MST
> > - Repair autodetection and CRC usage
> > - Link to v2:
> https://lore.kernel.org/r/20250717-unigraf-integration-v2-0-77dc329e584c@=
bootlin.com
> >
> > Changes in v2:
> > - Splitted in many commits
> > - Add CRC support
> > - Link to v1:
> https://lore.kernel.org/r/20250517-unigraf-integration-v1-1-044acd2133dd@=
bootlin.com
> >
> > ---
> > Louis Chauvet (46):
> >        lib/igt_kms: Add a detect timeout value
> >        lib/igt_kms: Add helper to wait for a specific status on a
> connector
> >        lib/igt_kms: Add function to list connected connectors
> >        lib/igt_kms: Add helper to obtain a connector by its name or MST
> path
> >        lib/igt_kms: Add helper to wait for new connectors
> >        lib/igt_kms: Add helper to get a pipe from a connector
> >        lib/igt_kms: Expose dump_connector_attrs
> >        lib/igt_kms: Expose reset_connectors_at_exit
> >        lib/igt_kms: Expose connector_attr_set and igt_connector_attr_se=
t
> >        lib/igt_debugfs: Move debugfs helpers to the proper location
> >        lib/igt_debugfs: Add const when make sense
> >        lib/igt_amd: Add const when make sense
> >        lib/igt_kms: Add const when make sense
> >        lib/monitor_edids: Add helper functions for using monitor_edid
> objects
> >        lib/monitor_edids: Add helper to get an EDID by its name
> >        lib/monitor_edids: Add helper to print all available EDID names
> >        lib/unigraf: Add used defines for TSI_Types
> >        lib/unigraf: Add TSI.h
> >        lib/unigraf: Initial Unigraf support
> >        lib/igt_kms: Automatically connect unigraf on display require
> >        lib/unigraf: Introduce device configuration
> >        lib/unigraf: Introduce role configuration
> >        lib/unigraf: Introduce input configuration
> >        lib/unigraf: Add reset function
> >        lib/unigraf: Add unigraf assert and deassert helpers
> >        lib/unigraf: Add plug/unplug helpers
> >        lib/unigraf: Allows sst/mst configuration
> >        lib/unigraf: Add helpers to read and write edid
> >        lib/unigraf: Add connector configuration
> >        tests/unigraf: Add basic unigraf tests
> >        lib/unigraf: Add unigraf CRC capture
> >        lib/unigraf: Add configuration for CRC usage
> >        lib/unigraf: add unigraf_get_connector_by_stream
> >        lib/unigraf: Add helper to check timings received by unigraf
> >        lib/igt_pipe_crc: Add ungiraf crc calculation
> >        lib/unigraf: Add lane count configuration
> >        docs/unigraf: Add unigraf documentation
> >        lib/unigraf: Add helpers to set maximum link rate
> >        lib/i915/dp: Move DP-related function for i915 to proper folder
> >        lib/i915/dp: Rename functions to avoid confusion
> >        lib/i915/dp: Add helper to get maximum supported rate
> >        lib/igt_dp: Create generic helpers for DP information
> >        lib/igt_kms: Add asserts to avoid null pointer dereference
> >        lib/igt_kms: Add helper to get a pipe from an output
> >        lib/unigraf: Add helpers to get the current LT status
> >        tests/unigraf/unigraf_lt: Add test for link training
> >
> >   docs/unigraf.txt                         |  81 +++
> >   lib/i915/i915_dp.c                       | 354 +++++++++++++
> >   lib/i915/i915_dp.h                       |  23 +
> >   lib/igt_amd.c                            |   2 +-
> >   lib/igt_amd.h                            |   2 +-
> >   lib/igt_core.c                           |   4 +
> >   lib/igt_debugfs.c                        |  96 +++-
> >   lib/igt_debugfs.h                        |  15 +-
> >   lib/igt_dp.c                             | 101 ++++
> >   lib/igt_dp.h                             |  89 ++++
> >   lib/igt_kms.c                            | 825
> ++++++++++++++++---------------
> >   lib/igt_kms.h                            |  58 ++-
> >   lib/igt_pipe_crc.c                       |  28 ++
> >   lib/meson.build                          |  12 +
> >   lib/monitor_edids/dp_edids.h             |   3 +
> >   lib/monitor_edids/hdmi_edids.h           |   3 +
> >   lib/monitor_edids/monitor_edids_helper.c | 126 +++++
> >   lib/monitor_edids/monitor_edids_helper.h |  10 +-
> >   lib/unigraf/TSI.h                        | 226 +++++++++
> >   lib/unigraf/TSI_types.h                  | 117 +++++
> >   lib/unigraf/unigraf.c                    | 758
> ++++++++++++++++++++++++++++
> >   lib/unigraf/unigraf.h                    | 257 ++++++++++
> >   meson.build                              |  14 +
> >   tests/intel/kms_dp_link_training.c       |  19 +-
> >   tests/intel/kms_dp_linktrain_fallback.c  |  57 +--
> >   tests/meson.build                        |   4 +
> >   tests/unigraf/meson.build                |  13 +
> >   tests/unigraf/unigraf_connectivity.c     | 123 +++++
> >   tests/unigraf/unigraf_lt.c               | 178 +++++++
> >   29 files changed, 3130 insertions(+), 468 deletions(-)
> > ---
> > base-commit: bfab3ea5fab190f4ebf083db4dfe703f6d4f40c6
> > change-id: 20250425-unigraf-integration-11ed330755d5
> >
> > Best regards,
>
>

--000000000000996d1a06463c0c72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello maintainers,<div>These patches are needed by the Dis=
play team to enable IGT on our UCDs in the lab, leveraging its=C2=A0testing=
 capabilities for the intel driver with external monitors. I will ask Louis=
&#39; team to do the reviews. But feel free to interject at any point if th=
ings don&#39;t look right to you.</div><div>Thanks!</div></div><br><div cla=
ss=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Thu, Dec 18, 2025 at 9:50=E2=80=AFAM Louis Chauvet &lt;<a href=3D"ma=
ilto:louis.chauvet@bootlin.com">louis.chauvet@bootlin.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi everyone,<br>
<br>
Small ping on this series, I understand this is a big series, so if you <br=
>
think this is useful I can try to split it in multiple sub-series and <br>
resend them.<br>
<br>
Thanks a lot,<br>
Louis Chauvet<br>
<br>
On 11/10/25 14:39, Louis Chauvet wrote:<br>
&gt; Hi everyone,<br>
&gt; <br>
&gt; I am excited to share I currently have access to a Unigraf device,<br>
&gt; which I believe could significantly enhance the capabilities within IG=
T.<br>
&gt; This device has the potential to enable testing of low-level hardware<=
br>
&gt; features that are currently not covered. Specifically, Unigraf devices=
 can<br>
&gt; assist in testing link training, signal integrity, HDCP, DSC, and more=
.<br>
&gt; <br>
&gt; It&#39;s important to note that the Unigraf SDK is not open-source, an=
d the<br>
&gt; communication protocol with the device is proprietary. As a result, I =
have<br>
&gt; utilized the libTSI.so library, which can be downloaded from [1]. In t=
his<br>
&gt; RFC, I have not used the official TSI_types.h header because it was<br=
>
&gt; incompatible with C, so I hardcoded some necessary values. The next<br=
>
&gt; iteration will use the official TSI_types.h (they plan to fix it for t=
he<br>
&gt; next release).<br>
&gt; <br>
&gt; This RFC is intentionally concise to gather initial feedback from the<=
br>
&gt; community regarding the integration of a proprietary device into the t=
est<br>
&gt; suite. I plan to expand on this work by adding more features and pushi=
ng<br>
&gt; the developments upstream.<br>
&gt; <br>
&gt; I have also started to work on MST testing (hotplug, link training,<br=
>
&gt; bandwith limitation), but I have a big issue: connector detection is v=
ery<br>
&gt; strange when changing MST configurat (MST-&gt;SST, sink count...).<br>
&gt; <br>
&gt; If I use the Unigraf GUI or my own C script outside IGT, everything se=
ems<br>
&gt; fine: `watch -n0 modetest -c` update connector status almost immediatl=
y<br>
&gt; after a HDP pulse, never hang and always have the correct result.<br>
&gt; <br>
&gt; But if I do the same in IGT (same script in igt_main), igt have too<br=
>
&gt; much/not all connectors, and some of them are broken (no EDID property=
<br>
&gt; for example). I tried to run `watch -n0 modetest -c` in parallel, but<=
br>
&gt; modetest can:<br>
&gt; - hang<br>
&gt; - only update once igt test is finished.<br>
&gt; <br>
&gt; Do you have any hint about something I missed in IGT to properly enume=
rate<br>
&gt; connectors? I tried close/open the DRM device, added a lot of delay<br=
>
&gt; everywhere, emulate plug/unplug... I used kms_wait_for_new_connectors =
(in<br>
&gt; this series) and for_each_connected_output to get list the connectors.=
<br>
&gt; <br>
&gt; Looking forward to your thoughts and suggestions!<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Louis Chauvet<br>
&gt; <br>
&gt; Signed-off-by: Louis Chauvet &lt;<a href=3D"mailto:louis.chauvet@bootl=
in.com" target=3D"_blank">louis.chauvet@bootlin.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes in v4:<br>
&gt; - Rebased on master<br>
&gt; - Fixed multiple unigraf callbacks<br>
&gt; - Created link training tests<br>
&gt; - Link to v3: <a href=3D"https://lore.kernel.org/r/20250823-unigraf-in=
tegration-v3-0-cdc36d5fab4c@bootlin.com" rel=3D"noreferrer" target=3D"_blan=
k">https://lore.kernel.org/r/20250823-unigraf-integration-v3-0-cdc36d5fab4c=
@bootlin.com</a><br>
&gt; <br>
&gt; Changes in v3:<br>
&gt; - Rebased on master<br>
&gt; - Added support for MST<br>
&gt; - Repair autodetection and CRC usage<br>
&gt; - Link to v2: <a href=3D"https://lore.kernel.org/r/20250717-unigraf-in=
tegration-v2-0-77dc329e584c@bootlin.com" rel=3D"noreferrer" target=3D"_blan=
k">https://lore.kernel.org/r/20250717-unigraf-integration-v2-0-77dc329e584c=
@bootlin.com</a><br>
&gt; <br>
&gt; Changes in v2:<br>
&gt; - Splitted in many commits<br>
&gt; - Add CRC support<br>
&gt; - Link to v1: <a href=3D"https://lore.kernel.org/r/20250517-unigraf-in=
tegration-v1-1-044acd2133dd@bootlin.com" rel=3D"noreferrer" target=3D"_blan=
k">https://lore.kernel.org/r/20250517-unigraf-integration-v1-1-044acd2133dd=
@bootlin.com</a><br>
&gt; <br>
&gt; ---<br>
&gt; Louis Chauvet (46):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/igt_kms: Add a detect timeout value<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/igt_kms: Add helper to wait for a speci=
fic status on a connector<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/igt_kms: Add function to list connected=
 connectors<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/igt_kms: Add helper to obtain a connect=
or by its name or MST path<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/igt_kms: Add helper to wait for new con=
nectors<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/igt_kms: Add helper to get a pipe from =
a connector<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/igt_kms: Expose dump_connector_attrs<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/igt_kms: Expose reset_connectors_at_exi=
t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/igt_kms: Expose connector_attr_set and =
igt_connector_attr_set<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/igt_debugfs: Move debugfs helpers to th=
e proper location<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/igt_debugfs: Add const when make sense<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/igt_amd: Add const when make sense<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/igt_kms: Add const when make sense<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/monitor_edids: Add helper functions for=
 using monitor_edid objects<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/monitor_edids: Add helper to get an EDI=
D by its name<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/monitor_edids: Add helper to print all =
available EDID names<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/unigraf: Add used defines for TSI_Types=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/unigraf: Add TSI.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/unigraf: Initial Unigraf support<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/igt_kms: Automatically connect unigraf =
on display require<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/unigraf: Introduce device configuration=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/unigraf: Introduce role configuration<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/unigraf: Introduce input configuration<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/unigraf: Add reset function<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/unigraf: Add unigraf assert and deasser=
t helpers<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/unigraf: Add plug/unplug helpers<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/unigraf: Allows sst/mst configuration<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/unigraf: Add helpers to read and write =
edid<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/unigraf: Add connector configuration<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 tests/unigraf: Add basic unigraf tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/unigraf: Add unigraf CRC capture<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/unigraf: Add configuration for CRC usag=
e<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/unigraf: add unigraf_get_connector_by_s=
tream<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/unigraf: Add helper to check timings re=
ceived by unigraf<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/igt_pipe_crc: Add ungiraf crc calculati=
on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/unigraf: Add lane count configuration<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 docs/unigraf: Add unigraf documentation<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/unigraf: Add helpers to set maximum lin=
k rate<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/i915/dp: Move DP-related function for i=
915 to proper folder<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/i915/dp: Rename functions to avoid conf=
usion<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/i915/dp: Add helper to get maximum supp=
orted rate<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/igt_dp: Create generic helpers for DP i=
nformation<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/igt_kms: Add asserts to avoid null poin=
ter dereference<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/igt_kms: Add helper to get a pipe from =
an output<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lib/unigraf: Add helpers to get the current=
 LT status<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 tests/unigraf/unigraf_lt: Add test for link=
 training<br>
&gt; <br>
&gt;=C2=A0 =C2=A0docs/unigraf.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 81 +++<br>
&gt;=C2=A0 =C2=A0lib/i915/i915_dp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 354 +++++++++++++<br>
&gt;=C2=A0 =C2=A0lib/i915/i915_dp.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 23 +<br>
&gt;=C2=A0 =C2=A0lib/igt_amd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0lib/igt_amd.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0lib/igt_core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br=
>
&gt;=C2=A0 =C2=A0lib/igt_debugfs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 96 +++-<br>
&gt;=C2=A0 =C2=A0lib/igt_debugfs.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 15 +-<br>
&gt;=C2=A0 =C2=A0lib/igt_dp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 101 ++++<br>
&gt;=C2=A0 =C2=A0lib/igt_dp.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 89 ++++<=
br>
&gt;=C2=A0 =C2=A0lib/igt_kms.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 825 ++++++++++++++++=
---------------<br>
&gt;=C2=A0 =C2=A0lib/igt_kms.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 58 ++-<br>
&gt;=C2=A0 =C2=A0lib/igt_pipe_crc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 28 ++<br>
&gt;=C2=A0 =C2=A0lib/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +<br>
&gt;=C2=A0 =C2=A0lib/monitor_edids/dp_edids.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 =C2=A0lib/monitor_edids/hdmi_edids.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 =C2=A0lib/monitor_edids/monitor_edids_helper.c | 126 +++++<br>
&gt;=C2=A0 =C2=A0lib/monitor_edids/monitor_edids_helper.h |=C2=A0 10 +-<br>
&gt;=C2=A0 =C2=A0lib/unigraf/TSI.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 226 +++++++++<br>
&gt;=C2=A0 =C2=A0lib/unigraf/TSI_types.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 117 +++++<br>
&gt;=C2=A0 =C2=A0lib/unigraf/unigraf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 758 ++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0lib/unigraf/unigraf.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 257 ++++++++++<br>
&gt;=C2=A0 =C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 14 +<br=
>
&gt;=C2=A0 =C2=A0tests/intel/kms_dp_link_training.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 19 +-<br>
&gt;=C2=A0 =C2=A0tests/intel/kms_dp_linktrain_fallback.c=C2=A0 |=C2=A0 57 +=
--<br>
&gt;=C2=A0 =C2=A0tests/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
&gt;=C2=A0 =C2=A0tests/unigraf/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 13 +<br>
&gt;=C2=A0 =C2=A0tests/unigraf/unigraf_connectivity.c=C2=A0 =C2=A0 =C2=A0| =
123 +++++<br>
&gt;=C2=A0 =C2=A0tests/unigraf/unigraf_lt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 178 +++++++<br>
&gt;=C2=A0 =C2=A029 files changed, 3130 insertions(+), 468 deletions(-)<br>
&gt; ---<br>
&gt; base-commit: bfab3ea5fab190f4ebf083db4dfe703f6d4f40c6<br>
&gt; change-id: 20250425-unigraf-integration-11ed330755d5<br>
&gt; <br>
&gt; Best regards,<br>
<br>
</blockquote></div>

--000000000000996d1a06463c0c72--
