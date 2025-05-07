Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4042C3ABC0
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 11:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8BC10E18F;
	Wed,  7 May 2025 11:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DVIPRAr/";
	dkim-atps=neutral
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699D910E18F
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 11:05:32 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so5757035e9.1
 for <igt-dev@lists.freedesktop.org>; Wed, 07 May 2025 04:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746615931; x=1747220731; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WwM7g46CYznJ28ocITvQGCJqH9DjU2Tu30yb+a2FY0Q=;
 b=DVIPRAr/+5stJ3+fcezHfc7KxNmbAlLI6kqHEUUoFkY52e4dBvuiRdYXc6AkXw/Dr7
 /v9s73UJq7ICPryJnNMP4TcBRNnRO3RoDWqbAwC2h4316F9/mx2BMLpxW/9cF/UJQVzx
 jknLNLPHDHktiyfV56yfeaivnJbPWnpf88VzZ71JHX5Lc5oZIhD9fBZH4BO1Cc4pTM8K
 GwAq1P19IFEJ4cI4MOngTLHqztBzJcdeuLkN1uC+1PQe9peA9CBh821FglR2RL0qNxxo
 vrb4cZNsvoYVaHv/NxhrupUY0mxB0Lwk00xX3WZUzjsnrxwYpOTuOFQp28kGi7bCjd4c
 voJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746615931; x=1747220731;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WwM7g46CYznJ28ocITvQGCJqH9DjU2Tu30yb+a2FY0Q=;
 b=l5nFLJ4rW42RLfrHCk6aoIp4Ib4uWQfwtCJfyRNRlbGIVOID7E1+7EMiAMSTPXmbb1
 HNhXrRVfXhp53wMPOjBiQpQDqQWa1h9y413aDPFi8lxrcaLT0cmySa4XSaEnXiQ9yjjE
 gRQDITNnbhHf+SCG1UivZNIFRLhHek6mfCT4XdSycps6G5SsA00J6iIjX9fl6jcWKSMB
 QVq40gT1jHcYg6XxAQpii0CTHPlGDDZ6InzTONvojiV+bE3ZHZvsPxI5uQ9SiwiXmEyA
 mbP+En+vmL5zwtci9AsC2Yn1JNEEb9jayz8dXwESUc+TrbhVO49tavgD4T9WkaK5UE8d
 Cshw==
X-Gm-Message-State: AOJu0YzxuAPOCBz/8VC5GScGnIjtef4LmQgsaA7ZTO0qXAj4q5W5vEPW
 eb5EP6p0+NdApZ1BL1QqFaMuibPtjIgp2SvOxpseXGPulPylGFjP
X-Gm-Gg: ASbGnctoM30Id41za7gv9zitbMtJhi23bmofA9vkaTQC35WPFAqeqnAIs0JYG1DgW7g
 fAGTMLgrugqWcaLuPZkRgqEH0GIZCKGEkP979O09LuicTrVPe9jHBXt58RulsZPTbcdeNwFcECX
 z0QjTmCTa4agH65GF7b749Kkg1s6Z9qWpf1vw+BDHiarJA/utbZe4pSatCPDQ2mPXo8x8/9Sf64
 jDWz7Fn4HbgZOoWhigmbn7FIVdX9qqZoTQQKIi2JAjFPC24CMS3sosYdFZulS3m5GooUkcowJZy
 kkpwLxGgvlTob7mUqJdB4+CFcnk4LhEcEvYeZod4iSKx3maZLA==
X-Google-Smtp-Source: AGHT+IFttuCD2kSEjBJXfJUwoT5wn5ZgcfugFSf4MKpkbHDTFQHGkSRKQR5/F3ebhOQJsMhEVenO5Q==
X-Received: by 2002:a05:600c:4f54:b0:43d:186d:a4bf with SMTP id
 5b1f17b1804b1-441d443b095mr21896815e9.0.1746615930477; 
 Wed, 07 May 2025 04:05:30 -0700 (PDT)
Received: from fedora ([94.73.35.165]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a0b55d2a1dsm2116593f8f.11.2025.05.07.04.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 04:05:29 -0700 (PDT)
Date: Wed, 7 May 2025 13:05:28 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, aravind.iddamsetty@linux.intel.com,
 louis.chauvet@bootlin.com, Jim Shargo <jshargo@chromium.org>,
 Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH i-g-t 2/5] lib/igt_configfs: Add helper to mount configfs
Message-ID: <aBs-eJqcHlI8cXlJ@fedora>
References: <20250422095602.55041-1-riana.tauro@intel.com>
 <20250422095602.55041-3-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250422095602.55041-3-riana.tauro@intel.com>
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

On Tue, Apr 22, 2025 at 03:25:58PM +0530, Riana Tauro wrote:
> From: José Expósito <jose.exposito89@gmail.com>
> 
> Add a new helper function to mount and open configfs
> 
> Co-developed-by: Jim Shargo <jshargo@chromium.org>
> Signed-off-by: Jim Shargo <jshargo@chromium.org>
> Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> Co-developed-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

The new function igt_configfs_open() looks good to me.

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> ---
>  lib/igt.h          |  1 +
>  lib/igt_configfs.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_configfs.h | 15 +++++++++
>  lib/meson.build    |  1 +
>  4 files changed, 99 insertions(+)
>  create mode 100644 lib/igt_configfs.c
>  create mode 100644 lib/igt_configfs.h
> 
> diff --git a/lib/igt.h b/lib/igt.h
> index 58c39e098..173ca70bf 100644
> --- a/lib/igt.h
> +++ b/lib/igt.h
> @@ -27,6 +27,7 @@
>  #include "drmtest.h"
>  #include "i915_3d.h"
>  #include "igt_aux.h"
> +#include "igt_configfs.h"
>  #include "igt_core.h"
>  #include "igt_debugfs.h"
>  #include "igt_draw.h"
> diff --git a/lib/igt_configfs.c b/lib/igt_configfs.c
> new file mode 100644
> index 000000000..6b202b76f
> --- /dev/null
> +++ b/lib/igt_configfs.c
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Google LLC.
> + * Copyright © 2023 Collabora, Ltd.
> + * Copyright © 2024 Red Hat, Inc.
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <sys/mount.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +
> +#include "igt_aux.h"
> +#include "igt_configfs.h"
> +
> +/**
> + * SECTION:igt_configfs
> + * @short_description: Support code for configfs features
> + * @title: configfs
> + * @include: igt_configfs.h
> + *
> + * This library provides helpers to access configfs features.
> + */
> +
> +/*
> + * General configfs helpers
> + */
> +
> +static const char *__igt_configfs_mount(void)
> +{
> +	if (igt_is_mountpoint("/sys/kernel/config"))
> +		return "/sys/kernel/config";
> +
> +	if (igt_is_mountpoint("/config"))
> +		return "/config";
> +
> +	if (mount("config", "/sys/kernel/config", "configfs", 0, 0))
> +		return NULL;
> +
> +	return "/sys/kernel/config";
> +}
> +
> +/**
> + * igt_configfs_mount:
> + *
> + * This attempts to locate where configfs is mounted on the filesystem,
> + * and if not found, will then try to mount configfs at /sys/kernel/config.
> + *
> + * Returns:
> + * The path to the configfs mount point (e.g. /sys/kernel/config)
> + */
> +const char *igt_configfs_mount(void)
> +{
> +	static const char *path;
> +
> +	if (!path)
> +		path = __igt_configfs_mount();
> +
> +	return path;
> +}
> +
> +/**
> + * igt_configfs_open: open configfs path
> + * @name: name of the configfs directory
> + *
> + * Opens the configfs directory corresponding to the name
> + *
> + * Returns:
> + * The directory fd, or -1 on failure.
> + */
> +int igt_configfs_open(const char *name)
> +{
> +	char path[PATH_MAX];
> +	const char *configfs_path;
> +
> +	configfs_path = igt_configfs_mount();
> +	igt_assert(configfs_path);
> +
> +	snprintf(path, sizeof(path), "%s/%s", configfs_path, name);
> +
> +	return open(path, O_RDONLY);
> +}
> diff --git a/lib/igt_configfs.h b/lib/igt_configfs.h
> new file mode 100644
> index 000000000..91f95659b
> --- /dev/null
> +++ b/lib/igt_configfs.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Google LLC.
> + * Copyright © 2023 Collabora, Ltd.
> + * Copyright © 2024 Red Hat, Inc.
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __IGT_CONFIGFS_H__
> +#define __IGT_CONFIGFS_H__
> +
> +const char *igt_configfs_mount(void);
> +int igt_configfs_open(const char *name);
> +
> +#endif /* __IGT_CONFIGFS_H__ */
> diff --git a/lib/meson.build b/lib/meson.build
> index 8517cd540..59072d8ce 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -18,6 +18,7 @@ lib_sources = [
>  	'i915/i915_crc.c',
>  	'igt_collection.c',
>  	'igt_color_encoding.c',
> +	'igt_configfs.c',
>  	'igt_facts.c',
>  	'igt_crc.c',
>  	'igt_debugfs.c',
> -- 
> 2.47.1
> 
