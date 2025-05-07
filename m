Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8D3C3ABBF
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 11:08:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCA810E18F;
	Wed,  7 May 2025 11:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="den1qhxK";
	dkim-atps=neutral
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2BE10E18F
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 11:08:42 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so43637175e9.1
 for <igt-dev@lists.freedesktop.org>; Wed, 07 May 2025 04:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746616121; x=1747220921; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BoVyngLx9DK4ffiDKj0ixC+b86xNRYNc5Q5r3I1zArA=;
 b=den1qhxKrqNytssTwsNE4ZLI/WmATLBJWohTV5VNI9WLYNQ4SLGG/UywCSytHlHoPF
 4TD8RuVWOOBxraP6iHnjLEd9xFYepEiXUjoSGlW7IhaZ6nyIYV6YHM+7t4KxDnoVahpo
 pHwu3H5Hc7w44dJeu0U5hNnenn26OKEfPkgOmcP2d1EH0LzJedLXgumEQX97BJJqDgPe
 Rdnu3AMdyRBtlHsjdnFRqcgV81rwg9p9J/UNmE1/a9JJUjVJUv+opt4OqZzYi3j4sJE7
 VxncBBj5fvarXJgM5SPUTkOsE2EJ0sWEzxQOjQRtdpttOWXv9BYtmfSY00Kqss0b6O2b
 1Zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746616121; x=1747220921;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BoVyngLx9DK4ffiDKj0ixC+b86xNRYNc5Q5r3I1zArA=;
 b=TjaIR1Izc2LIVVB7K2tiJ0xDCPb57jzCdGzVrbIrut86NtJYdaMDOCFWNFpW4722iA
 bu98OAS6e91cPWnP9OWOnqT4vA7AGA1Qz5RIAeTrjusJJLOlhUVsDt4iS8GEscperpG0
 VBmYB09dh6fE/UyY5cznR+UXKoXv0WflJe2riqsqk2WGmU7cXhloDcsb+F3h67tfne43
 EyUfJBOXGhRUuZQWx9fQIgDD8XerGb92qqiqtGnfEUFCPkD0TFdQloZ5iTELQCDhJsnU
 uDsTE6SXTkCDuedh8t/Ys2I5o3E1Sv3wxtFmQUg2uqzAO14QoRRx3uUoYTb/OOEFMMig
 cidQ==
X-Gm-Message-State: AOJu0YxeXO3WDiFHYkjfD956RVFvkcG6t1nTptnL+ovmS/fzrWHjCBdb
 vj5w477kMn95i8DebvVcH1ofATn00XXbWpoOu1myfZKhvmKvUaet
X-Gm-Gg: ASbGnctwoLwld3HcRgY6qhe9KMG0c5O8M2s81KdaYN1sViaDzDJ49KMdo03WGVXg68q
 0yNr8kWEYL5kmToGPCuqqVhC4Ji1BD9SJj3t6fAtOh0MKKN1BDgSB7WqAba2p+wENo6sQDK1HHi
 C8c7t2Amgoikh+aQZ6nPw/Khx6aWSoOW7CNhQFj5pIjTxqBrwD0E7pNZ8wM9FOqnB8eYkt56XO1
 8p19cxMo7gHJzBhbU50RpnEanFLne+tKDLwFqQ/RqUCBuurM/RkojarSVp0E6CAC/lIEaiVpA5s
 sSPVAMgwWS/i2SkWU7FuM7QoEx14dTjvCt2TBuM=
X-Google-Smtp-Source: AGHT+IEP8KBLqFLKwAfgeQttup0atJMT602j4tnbwftvN8Rraqnn6OFhg6mgg1hkik2KVBmVSAq/BA==
X-Received: by 2002:a05:600c:3f0d:b0:441:d228:1fe5 with SMTP id
 5b1f17b1804b1-441d44e5896mr16235525e9.33.1746616120575; 
 Wed, 07 May 2025 04:08:40 -0700 (PDT)
Received: from fedora ([94.73.35.165]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441d43d06afsm28526095e9.9.2025.05.07.04.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 04:08:40 -0700 (PDT)
Date: Wed, 7 May 2025 13:08:38 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, aravind.iddamsetty@linux.intel.com,
 louis.chauvet@bootlin.com
Subject: Re: [PATCH i-g-t 3/5] lib/igt_fs: Rename igt_io to igt_fs to add
 additional helpers
Message-ID: <aBs_NkvGFMaPhpD4@fedora>
References: <20250422095602.55041-1-riana.tauro@intel.com>
 <20250422095602.55041-4-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250422095602.55041-4-riana.tauro@intel.com>
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

On Tue, Apr 22, 2025 at 03:25:59PM +0530, Riana Tauro wrote:
> Rename igt_io to igt_fs to add additional helper functions
> to create and remove directories
> 
> Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> Cc: José Expósito <jose.exposito89@gmail.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

I see a reference to igt_io in:
docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml

   <xi:include href="xml/igt_io.xml"/>

I'm not familiar with the way those documents are generated, but, should
it be renamed to igt_fs.xml?

With that change (if required):
Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> ---
>  lib/{igt_io.c => igt_fs.c} | 12 ++++++------
>  lib/{igt_io.h => igt_fs.h} |  6 +++---
>  lib/igt_sysfs.c            |  2 +-
>  lib/meson.build            |  2 +-
>  tests/msm/msm_mapping.c    |  2 +-
>  tests/msm/msm_recovery.c   |  2 +-
>  6 files changed, 13 insertions(+), 13 deletions(-)
>  rename lib/{igt_io.c => igt_fs.c} (93%)
>  rename lib/{igt_io.h => igt_fs.h} (94%)
> 
> diff --git a/lib/igt_io.c b/lib/igt_fs.c
> similarity index 93%
> rename from lib/igt_io.c
> rename to lib/igt_fs.c
> index b5143184f..f6a2530cd 100644
> --- a/lib/igt_io.c
> +++ b/lib/igt_fs.c
> @@ -26,15 +26,15 @@
>  #include <stdlib.h>
>  #include <unistd.h>
>  
> -#include "igt_io.h"
> +#include "igt_fs.h"
>  
>  /**
> - * SECTION:igt_io
> - * @short_description: Helpers for file I/O
> - * @title: io
> - * @include: igt_io.h
> + * SECTION:igt_fs
> + * @short_description: Helpers for file
> + * @title: fs
> + * @include: igt_fs.h
>   *
> - * This library provides helpers for file I/O
> + * This library provides helpers for file systems
>   */
>  
>  /**
> diff --git a/lib/igt_io.h b/lib/igt_fs.h
> similarity index 94%
> rename from lib/igt_io.h
> rename to lib/igt_fs.h
> index eb9ffee1b..84c3fed62 100644
> --- a/lib/igt_io.h
> +++ b/lib/igt_fs.h
> @@ -22,12 +22,12 @@
>   *
>   */
>  
> -#ifndef __IGT_IO_H__
> -#define __IGT_IO_H__
> +#ifndef __IGT_FS_H__
> +#define __IGT_FS_H__
>  
>  #include <stdio.h>
>  
>  ssize_t igt_readn(int fd, char *buf, size_t len);
>  ssize_t igt_writen(int fd, const char *buf, size_t len);
>  
> -#endif /* __IGT_IO_H__ */
> +#endif /* __IGT_FS_H__ */
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index a76af54eb..acb2f7927 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -46,7 +46,7 @@
>  #include "igt_core.h"
>  #include "igt_sysfs.h"
>  #include "igt_device.h"
> -#include "igt_io.h"
> +#include "igt_fs.h"
>  #include "intel_chipset.h"
>  #include "xe/xe_query.h"
>  
> diff --git a/lib/meson.build b/lib/meson.build
> index 59072d8ce..34f7d7baa 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -20,6 +20,7 @@ lib_sources = [
>  	'igt_color_encoding.c',
>  	'igt_configfs.c',
>  	'igt_facts.c',
> +        'igt_fs.c',
>  	'igt_crc.c',
>  	'igt_debugfs.c',
>  	'igt_device.c',
> @@ -30,7 +31,6 @@ lib_sources = [
>  	'igt_gt.c',
>  	'igt_halffloat.c',
>  	'igt_hwmon.c',
> -	'igt_io.c',
>  	'igt_matrix.c',
>  	'igt_os.c',
>  	'igt_params.c',
> diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> index e24618607..02ad2f08a 100644
> --- a/tests/msm/msm_mapping.c
> +++ b/tests/msm/msm_mapping.c
> @@ -29,7 +29,7 @@
>  
>  #include "igt.h"
>  #include "igt_msm.h"
> -#include "igt_io.h"
> +#include "igt_fs.h"
>  
>  /*
>   * Tests to ensure various kernel controlled buffers are mapped with the
> diff --git a/tests/msm/msm_recovery.c b/tests/msm/msm_recovery.c
> index 608836866..53c49ecd4 100644
> --- a/tests/msm/msm_recovery.c
> +++ b/tests/msm/msm_recovery.c
> @@ -26,7 +26,7 @@
>  
>  #include "igt.h"
>  #include "igt_msm.h"
> -#include "igt_io.h"
> +#include "igt_fs.h"
>  
>  static struct msm_device *dev;
>  static struct msm_bo *scratch_bo;
> -- 
> 2.47.1
> 
