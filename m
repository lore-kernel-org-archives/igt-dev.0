Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5C810E59B
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 11:13:09 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5079f9675c6so986661e87.2
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 04:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <20231019193321.90009-1-zbigniew.kempczynski@intel.com>
 <20231019193321.90009-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20231019193321.90009-3-zbigniew.kempczynski@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 20 Oct 2023 12:12:40 +0100
Message-ID: <CAM0jSHPKhnFFJrwOqMzJNUsn1iq-O0AyxucQRgQ7BsB7LxCgbQ@mail.gmail.com>
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/5] lib/intel_blt: Add visible vram
 flag if object needs to be mapped
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

On Thu, 19 Oct 2023 at 20:33, Zbigniew Kempczy=C5=84ski
<zbigniew.kempczynski@intel.com> wrote:
>
> For objects with blitter helper in vram which needs to be mapped
> add visible vram flag to ensure it will be placed in mappable
> vram region.
>
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
