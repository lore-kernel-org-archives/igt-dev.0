Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006CE10E487
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jul 2023 14:53:47 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-31779e89e39so182868f8f.2
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jul 2023 07:53:45 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
In-Reply-To: <CADSE00L4H_fAEXizdyoPZJLztr7b3dBZoiXECRnUpLcevR+Dzw@mail.gmail.com>
References: <20230721130458.64856-1-aesteve@redhat.com>
 <20230721130458.64856-4-aesteve@redhat.com>
 <87cz0gjcd6.fsf@minerva.mail-host-address-is-not-set>
 <CADSE00L4H_fAEXizdyoPZJLztr7b3dBZoiXECRnUpLcevR+Dzw@mail.gmail.com>
Date: Wed, 26 Jul 2023 16:53:43 +0200
Message-ID: <874jlq4tc8.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH 3/3] kms_cursor_legacy:
 modeset-atomic-cursor-hotspot
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, belmouss@redhat.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Albert Esteve <aesteve@redhat.com> writes:

> On Tue, Jul 25, 2023 at 4:26=E2=80=AFPM Javier Martinez Canillas <javierm=
@redhat.com>
> wrote:
>

[...]

>> Also, there's
>> https://docs.kernel.org/gpu/drm-uapi.html#c.DRM_CAP_CURSOR_WIDTH
>> and DRM_CAP_CURSOR_HEIGHT to query the hardware cursor size. Maybe you
>> should
>> use that instead of assume a 64x64 cursor size ?
>>
>
> In many other tests in the same file the size of the cursor is hardcoded =
to
> 64, same as here.
> So I kept it consistent.
> Could be a nice refactor, but I guess it is outside the scope of this pat=
ch.
>

Ah, didn't look at the rest of the file but yes, agreed that is better to
keep it consistent and in any case the whole file could be cleaned up in
a separate patch.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat
