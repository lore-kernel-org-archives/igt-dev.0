Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701A910E22A
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 16:42:44 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9b281a2aa94so569968966b.2
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 09:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230925162212.125997-1-robdclark@gmail.com>
In-Reply-To: <20230925162212.125997-1-robdclark@gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 26 Sep 2023 09:42:26 -0700
Message-ID: <CAPj87rOT3wuVpb3t2Ax_YvAMnmtL_xfzGKrdvzBar_QyHqyexw@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH v2] core_getversion: Test for desired device
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Helen Koike <helen.koike@collabora.com>, Emma Anholt <emma@anholt.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, 25 Sept 2023 at 09:22, Rob Clark <robdclark@gmail.com> wrote:
> +       const char *name = getenv("IGT_REQUIRED_DRIVER");
>
> -       fd = drm_open_driver(DRIVER_ANY);
> +       fd = __drm_open_driver(DRIVER_ANY);

Shouldn't this try to open the actual driver name? Otherwise we could
false-fail a test because our 'any driver' picked the wrong device
when multiple of them are present.
