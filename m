Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891D110E973
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Oct 2023 11:07:53 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9a6190af24aso309973366b.0
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Oct 2023 04:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231027104351.449765-1-contact@emersion.fr>
In-Reply-To: <20231027104351.449765-1-contact@emersion.fr>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 27 Oct 2023 12:07:39 +0100
Message-ID: <CAPj87rM=eYyJrvTnVv0uF+0VutUV2QEaA3sTP1nAJO=Cz9C=sQ@mail.gmail.com>
To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH v3] tests/kms_closefb: add CLOSEFB IOCTL test
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

Hi,

On Fri, 27 Oct 2023 at 11:44, Simon Ser <contact@emersion.fr> wrote:
> CLOSEFB is the same as RMFB but keeps the FB alive as long as any
> plane is using it. Check the behavior of that IOCTL.

This looks good to me; the positive tests are there and I can't see
any negative tests this doesn't cover either.

Reviewed-by: Daniel Stone <daniels@collabora.com>

Thanks!
-d
