Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89ED410E87A
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jul 2023 10:51:59 +0000 (UTC)
Date: Fri, 14 Jul 2023 10:51:40 +0000
To: vitaly prosyak <vprosyak@amd.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <06OkdrrkL8ABiWhy4nPXw_lclBvhLJEfUB5CtzibhOPMUfuWQ44lhZ1E0pLWQO_YhLKgbjDJYytG_ASQwA-JG7Vd9GJXQatoJdRLHxuV1Q4=@emersion.fr>
In-Reply-To: <52b3847c-c424-4471-ed56-772df242bfb6@amd.com>
References: <20230712071701.11235-1-contact@emersion.fr>
 <eb80b08d-f705-32ec-93e0-ab0edf8a8ad1@amd.com>
 <52b3847c-c424-4471-ed56-772df242bfb6@amd.com>
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
Cc: "Ho, Kenny" <Kenny.Ho@amd.com>, James Jones <jajones@nvidia.com>,
 igt-dev@lists.freedesktop.org, Austin Shafer <ashafer@nvidia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Friday, July 14th, 2023 at 12:14, vitaly prosyak <vprosyak@amd.com> wrot=
e:

> The new test syncobj_eventfd is successful, but there is a failure
> for test kms_getfb caused by the kernel patch(drm/syncobj: WIP add
> IOCTL to register an eventfd). Is there any test failure on Intel CI?

Ooops! It seems like DRM_IOCTL_SYNCOBJ_EVENTFD clashes with
DRM_IOCTL_MODE_GETFB2. I'll re-send a new version which avoids the
collision.
