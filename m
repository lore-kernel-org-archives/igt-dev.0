Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5861C10E4CC
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Feb 2022 16:18:35 +0000 (UTC)
Date: Fri, 25 Feb 2022 17:18:31 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YhkBV3X9+GAQrXJD@kamilkon-DESK1>
References: <20220225110626.82776-1-zbigniew.kempczynski@intel.com>
 <20220225110626.82776-3-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220225110626.82776-3-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] lib/i915_blt: Add library for
 blitter
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Mauro Chehab <mauro.chehab@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Dnia 2022-02-25 at 12:06:25 +0100, Zbigniew Kempczyński napisał(a):
> Blitter commands became complicated thus manual bitshifting is error
> prone and hard debugable - XY_BLOCK_COPY_BLT is the best example -
> in extended version (for DG2+) it takes 20 dwords of command data.
> To avoid mistakes and dozens of arguments for command library provides
> input data in more structured form.
> 
> Currently supported commands:
> - XY_BLOCK_COPY_BLT:
>   a)  TGL/DG1 uses shorter version of command which doesn't support
>       compression
>   b)  DG2+ command is extended and supports compression
> - XY_CTRL_SURF_COPY_BLT
> - XY_FAST_COPY_BLT
> 
> Source, destination and batchbuffer are provided to blitter functions
> as objects (structs). This increases readability and allows use same
> object in many functions. Only drawback of such attitude is some fields
> used in one function may be ignored in another. As an example is
> blt_copy_object which contains a lot of information about gem object.
> In block-copy all of data are used but in fast-copy only some of them
> (fast-copy doesn't support compression).
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  .../igt-gpu-tools/igt-gpu-tools-docs.xml      |    1 +
>  lib/i915/i915_blt.c                           | 1087 +++++++++++++++++
>  lib/i915/i915_blt.h                           |  196 +++
>  lib/meson.build                               |    1 +
>  4 files changed, 1285 insertions(+)
>  create mode 100644 lib/i915/i915_blt.c
>  create mode 100644 lib/i915/i915_blt.h
> 
> diff --git a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
> index 0dc5a0b7e..3a2edbae1 100644
> --- a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
> +++ b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
> @@ -16,6 +16,7 @@
>    <chapter>
>      <title>API Reference</title>
>      <xi:include href="xml/drmtest.xml"/>
> +    <xi:include href="xml/i915_blt.xml"/>

Imho this should be placed at i915 API.

>      <xi:include href="xml/igt_alsa.xml"/>
>      <xi:include href="xml/igt_audio.xml"/>
>      <xi:include href="xml/igt_aux.xml"/>
[...]
I will need more time for review of this patch.

Regards,
Kamil Konieczny
