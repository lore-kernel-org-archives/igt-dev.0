Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0715810E392
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jul 2023 06:37:32 +0000 (UTC)
Date: Tue, 25 Jul 2023 06:37:19 +0000
To: =?utf-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <tGRNs3O1zv1sqMjGeR6kX4GMYKG5K9-1ll13Rnv797HudW3sHx91ACtQkUiFo1_2lIeVHqTz1abSCLAEgR62L9vRs2ikHb8GdD1zDnJNhoU=@emersion.fr>
In-Reply-To: <20230725041807.f4cydvkattmc7sie@zkempczy-mobl2>
References: <2aafc4e6-0ba7-5d78-4adb-0a0368f74792@nvidia.com>
 <20230725041807.f4cydvkattmc7sie@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH] tests/syncobj_sync_file: new test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: James Jones <jajones@nvidia.com>, igt-dev@lists.freedesktop.org,
 Austin Shafer <ashafer@nvidia.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tuesday, July 25th, 2023 at 06:18, Zbigniew Kempczy=C5=84ski <zbigniew.k=
empczynski@intel.com> wrote:

> At the moment (before uapi will be accepted) I would add locally in the t=
est:
> - drm.h definitions naming them LOCAL_DRM_IOCTL_...
> - two functions locally in the test. In this case names can stay, when
> uapi will be accepted and merged just move them to igt_syncobj.c/h
> (use inside LOCAL_DRM_IOCTL_... until official merge).
>=20
> After uapi merge we do verbatim copy of header from the kernel
> include directory and remove "localization" described above.
>=20
> I'm sorry for inconvinience but that's the rules.

Alternatively, just get the IGT patch reviewed on the list and hold off
merging until the kernel part lands.
