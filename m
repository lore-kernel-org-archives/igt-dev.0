Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE8510E4A4
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 07:46:08 +0000 (UTC)
Date: Wed, 12 Jul 2023 07:45:52 +0000
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <eUc6v9Nr-nnUwveiM4oZOwXG9QRfrSwIshIMsS8edwtDGNVj1vpMaSxtNOl7wRZbsx-EB-ti-4PBIvJvZx9-rJv78bo_GnEDnnKyZtHEhHo=@emersion.fr>
In-Reply-To: <994a354b-0d69-f7ee-0781-45d2a619fbe7@intel.com>
References: <20230712071701.11235-1-contact@emersion.fr>
 <994a354b-0d69-f7ee-0781-45d2a619fbe7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH v2] tests/syncobj_eventfd: new test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: James Jones <jajones@nvidia.com>, igt-dev@lists.freedesktop.org,
 Austin Shafer <ashafer@nvidia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wednesday, July 12th, 2023 at 09:37, Lionel Landwerlin <lionel.g.landwer=
lin@intel.com> wrote:

> These tests look correct to me.

Thanks for having a look!

> Are you not planning on testing/supporting
> DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT and DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AL=
L ?

DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT is implied: the IOCTL will never
fail because a fence hasn't materialized. There is no use-case for this
flag: if user-space wants this behavior they can try to extract a
sync_file (which will fail if it hasn't materialized yet) and then poll
that sync_file.

DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL doesn't make sense for this IOCTL
because only a single syncobj is passed in.

Simon
