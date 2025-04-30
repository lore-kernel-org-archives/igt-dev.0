Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A62C369D9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 14:17:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445D210E7A6;
	Wed, 30 Apr 2025 14:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dragonic.eu header.i=@dragonic.eu header.b="QKL6SrCM";
	dkim-atps=neutral
X-Greylist: delayed 1742 seconds by postgrey-1.36 at gabe;
 Wed, 30 Apr 2025 14:17:16 UTC
Received: from k11.unixstorm.org (k11.unixstorm.org [91.227.122.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A03810E7A6
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 14:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dragonic.eu
 ; s=x;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8oSdbaeuLoW2onL7sjynxrTmnzYm1keok6HDEoeeZug=; b=QKL6SrCMlgRkThcfRwNDOVoBA3
 O0odHqEbfGpjp5VoyPfozdRGW68mt5qryMLHRgrAhm20VCh/n44XPcx5Wvdq/8X+isvVoZGBkK6xE
 qD0UULZGG85ToD2VUV9600bbfydJsyi795G1Hois++XNxJQKwZr8czDKI/oZxk3R5PqTgzqqjz3Ek
 VO3KiOzGM0+isi8gndAM1MtFzgxIhusxOoe8jBszddhGOCb9y1Pe/S7YzUop/6WZPWEeAVuRl/sjF
 XwI09bjVbNDVlBYPaUCCYVlvmR8WbOzO7w6+HrIjqcy94LGMpYri8vDz3rz6FakYSn/Z02NnYE7xi
 bB03g8oA==;
Received: from 037008241088.gdansk.vectranet.pl ([37.8.241.88]
 helo=folkvangr.lan)
 by k11.unixstorm.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96.2-12-g29d01ae2a) (envelope-from <rk@dragonic.eu>)
 id 1uA7nQ-0001lF-23; Wed, 30 Apr 2025 15:48:20 +0200
Message-ID: <28db0d07c99de4d76d9679084fdfb58060447b56.camel@dragonic.eu>
Subject: Re: [PATCH v2 0/5] Extend IGT to support Android
From: Ryszard Knop <rk@dragonic.eu>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>, 
 igt-dev@lists.freedesktop.org
Cc: sapna1.singh@intel.com, markyacoub@google.com, seanpaul@google.com, 
 carlos.santa@intel.com
Date: Wed, 30 Apr 2025 15:48:00 +0200
In-Reply-To: <20250429204000.41537-1-jeevaka.badrappan@intel.com>
References: <20250429204000.41537-1-jeevaka.badrappan@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-Authenticated-Id: dragoon
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

Hey there,

Are you planning to add Meson changes and docs on how to build this? While =
for Linux itself it's
pretty clear if you look at the Dockerfiles/CI, Android probably needs NDK =
installed and some magic
in the build system to make it work. You likely have these changes done alr=
eady, if you tested this.

Thanks, Ryszard

On Tue, 2025-04-29 at 20:39 +0000, Jeevaka Prabu Badrappan wrote:
> The primary objective of this proposal is to extend the functionality of
> IGT to Android environments.
>=20
> Enabling IGT on Android will allow developers to perform comprehensive
> testing of graphics drivers, ensuring robustness and reliability across
> different platforms.
>=20
> By providing stub implementations for libraries that are not natively
> supported on Android, we will bridge the gap between Android and Linux
> environments, promoting code reuse and reducing development time.
>=20
> Changes done:
> - Create stub implementations of GLib, libunwind, libprocps, and
> other necessary libraries to satisfy IGT dependencies on Android.
> - Replace glib hash table with generic hash table implementation
>=20
> Note:
> - Incase of linux systems, system libraries will be used whereas for
> Android stubs will be used with reduced test coverage.
> - Support will be provided to maintain Android support.
>=20
> Jeevaka Prabu Badrappan (4):
> =C2=A0 Replace program_invocation_short_name with prog_name from command =
line
> =C2=A0 Avoid use of pthread_cancel by introducing an exit flag
> =C2=A0 Replace glib hash table with c specific implementation
> =C2=A0 igt-gpu-tools: Changes to compile for Android
>=20
> Sapna (1):
> =C2=A0 Add stub for libunwind, procps and glib
>=20
> =C2=A0include/stub/glib.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 43 +++++++++++++
> =C2=A0include/stub/libproc2/pids.h |=C2=A0 41 ++++++++++++
> =C2=A0include/stub/libunwind.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 20 ++++++
> =C2=A0lib/igt_core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 ++
> =C2=A0lib/igt_core.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0lib/igt_device_scan.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1=
18 ++++++++++++++++++++++++++---------
> =C2=A0lib/igt_dummyload.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 6 +-
> =C2=A0lib/igt_dummyload.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0lib/igt_kmod.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +++
> =C2=A0lib/xe/xe_spin.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0tests/intel/xe_create.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
 1 +
> =C2=A0tools/gputop.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> =C2=A0tools/intel_gpu_top.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 2 +-
> =C2=A013 files changed, 220 insertions(+), 36 deletions(-)
> =C2=A0create mode 100644 include/stub/glib.h
> =C2=A0create mode 100644 include/stub/libproc2/pids.h
> =C2=A0create mode 100644 include/stub/libunwind.h
