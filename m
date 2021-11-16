Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D5B6E930
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Nov 2021 11:08:14 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id v2so13427062qve.11
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Nov 2021 03:08:14 -0800 (PST)
MIME-Version: 1.0
References: <20211115071610.14773-1-zbigniew.kempczynski@intel.com>
 <20211115071610.14773-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211115071610.14773-3-zbigniew.kempczynski@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 16 Nov 2021 11:07:46 +0000
Message-ID: <CAM0jSHNpsMar+2fLQ5Epir6cRF4FahnkuSv=D4oTEjb6hA0W+g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/intel-ci/fast-feedback: Add
 four subtests of gem_lmem_swapping to BAT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, 15 Nov 2021 at 07:16, Zbigniew Kempczy=C5=84ski
<zbigniew.kempczynski@intel.com> wrote:
>
> Add basic and some random subtests to BAT to verify early lmem swapping
> is working on discrete.
>
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>

Acked-by: Matthew Auld <matthew.auld@intel.com>

According to the logs the below adds ~100+ seconds to BAT on DG1,
hopefully that is acceptable.

> ---
>  tests/intel-ci/fast-feedback.testlist | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-=
feedback.testlist
> index fa5006d2e..de1c6cb46 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -34,6 +34,10 @@ igt@gem_flink_basic@double-flink
>  igt@gem_flink_basic@flink-lifetime
>  igt@gem_huc_copy@huc-copy
>  igt@gem_linear_blits@basic
> +igt@gem_lmem_swapping@basic
> +igt@gem_lmem_swapping@parallel-random-engines
> +igt@gem_lmem_swapping@random-engines
> +igt@gem_lmem_swapping@verify-random
>  igt@gem_mmap@basic
>  igt@gem_mmap_gtt@basic
>  igt@gem_render_linear_blits@basic
> --
> 2.26.0
>
