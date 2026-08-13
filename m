Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADAEC5CFEB
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 13:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C14010F327;
	Thu, 13 Aug 2026 13:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="DznBg7uA";
	dkim-atps=neutral
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5ECB10F323
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 13:13:56 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-47c2b362ee2so634120f8f.1
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 06:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1786626835; x=1787231635; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=MPyU5ZJiB+TH6nScuEMS6HFMIAgdMXUb5U4J4ksDT3I=;
 b=DznBg7uAq5foiXSeTmJUhVPJJ2/YvJsk/6LaknGda1XRkqRGJ3uuMqb2ZNHRgzWNsI
 p3j4ndfR3KO/5s3IsTU+fjzGsgP5jikvHCvkeADGEhT0RVq1QcCARU60BlHnIGM8T10M
 ChIz9j2+1mPZnSNdqM+X1rhKfvPSCka7Ap8TYOEiBqtj5KinGwY5T44Kl2gxCsfK2A+4
 BstAD//3usfue/TwNLM+16VJYmw7obHr4HQDxz4zExcANE6EV5tUlVn5w2vF9zxKdlV9
 Nx6ncv2uVk5MrzIXIphJJ1rRM/SwwpKOmY/1HpfUe6rj57Uqb6gDZrlt366i0mhMpVky
 xaMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786626835; x=1787231635;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MPyU5ZJiB+TH6nScuEMS6HFMIAgdMXUb5U4J4ksDT3I=;
 b=ASLPGdq6SX3sSpLGrNBsj8s5YM3btxEGj5ltN6wmEIL3qKfREOFLksncN/uU5Ixv4M
 uHkOb7VsDT4S37YXD82r3NfZH64JBDY3UVgbtFlW3rJI5M6ZU5sQCpij1nJYtYAfdlss
 vVda5bt80qCl/R0d334Yc/8BIJDvOTiL8fYHyXwoSHdK6pfttUenfboquOLUH8WHI5aP
 E/R8QO35nbrBU6foJ919csNpF32RGqkDS7zk5EGnYODdKr6KlPctSImr2KHkAyMuVqFO
 FwZvSMoBIayIJWtgiSi66iyq03c3MGHIEiVRJmfZqvr9aqwzPIOp5mi9ukAbwCduBWWa
 2BWA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrjlOQmhP0fai3u8K6wLhBH5SOE9IiXCm6NROukC9aru+4PjpyXJPPqgCjv+47epyp5OfG7CQvj@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxryR5RryN+VR2ZcMUkvWvUETTtGfIlaW/W4oxJAd6yrUaUmNZ/
 /tQgrgFxn8vKPvwupyvH9flwkOMjJvAgaAglmxle+3ytwXdFmHXkpR0gCtj7lSQ4TLA=
X-Gm-Gg: AR+sD12LPvoiUMOmhhV4RfCr96ZMiocNA817t04G8lIUV9x8sX/NJ9+rJl2fSiVkgEz
 iHeMukIsX2/NTd4tMeaICmHVzD6DfFe799gRReQ0d7QkO8qGegMbfvJyzMTbx4LcX0/h7EuSEse
 MDgC/K4lo4myichZQgxmjTFCLHDiQHUcHfjkWJ8Jk7o5FYMVdHF1ab1QeOfSpQRuxr58pqQO2en
 v14I+oCcBfPuLkfeu9H91gA5kTmj+ZuOp8i0OO8PwV9phWGE0VPyAoJQyWZeRWX30e/pDjKFEja
 d2e2tOXTK/6h1r61HEVfLJ6nrghqZ5pWUTrqNrVKxMcmtTqQsWcPPFVeRh5P46BCTw8BXW8YsC9
 Top13drRC33Z+ljtrYQMg7DM75bL8y2dTVYck0fnArqoRcZuaKEmfrnqs+qK/ROx4zkoahtNzIC
 7UNuvX5RCtsc2Quzja6NUl5Wcc+2HryYxVTWFhWrYIQ7ILmqJC/n2OvTJLmak/YNr6bNBhBJcXo
 ljdQ3BT/5fTarE=
X-Received: by 2002:a5d:530e:0:b0:47f:5ec2:d54 with SMTP id
 ffacd0b85a97d-48159ccd3ccmr6423946f8f.5.1786626834819; 
 Thu, 13 Aug 2026 06:13:54 -0700 (PDT)
Received: from [192.168.0.116] ([81.79.79.1]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815a5c2308sm7097101f8f.33.2026.08.13.06.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 06:13:54 -0700 (PDT)
Message-ID: <92009e34-6467-4a78-a3fc-32a39b381f55@ursulin.net>
Date: Thu, 13 Aug 2026 14:13:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 4/7] lib/xe: Introduce dmem driver and implement
 Xe support
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 igt-dev@lists.freedesktop.org
Cc: siqueira@igalia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>,
 maarten.lankhorst@linux.intel.com,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Natalie Vock <natalie.vock@gmx.de>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, kernel-dev@igalia.com
References: <20260723194313.2748143-1-cascardo@igalia.com>
 <20260723194313.2748143-5-cascardo@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260723194313.2748143-5-cascardo@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 23/07/2026 20:43, Thadeu Lima de Souza Cascardo wrote:
> In order to be reuse the same dmem tests with multiple drivers, we need to
> abstract a few operations. That includes getting the region name, and
> allocating and releasing VRAM. As there is some initialization also when
> multiple allocations are done, also provide init and deinit functions.
> 
> The Xe implementation was based on the original operations from
> xe_cgroups.c written by Thomas Hellström. However, instead of doing a
> deferred backing, followed by a bind, it does a simple non-deferred GEM
> object creation on the VRAM region.
> 
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> ---
>   lib/igt_dmem_driver.h |  24 ++++++++
>   lib/meson.build       |   1 +
>   lib/xe/xe_dmem.c      | 139 ++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 164 insertions(+)
>   create mode 100644 lib/igt_dmem_driver.h
>   create mode 100644 lib/xe/xe_dmem.c
> 
> diff --git a/lib/igt_dmem_driver.h b/lib/igt_dmem_driver.h
> new file mode 100644
> index 000000000000..2f4a4673ab16
> --- /dev/null
> +++ b/lib/igt_dmem_driver.h
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2026 Valve Corporation
> + * Authors:
> + *  Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> + */
> +
> +#ifndef __IGT_DMEM_DRIVER_H__
> +#define __IGT_DMEM_DRIVER_H__
> +
> +#include <stdlib.h>
> +
> +struct igt_dmem_driver {
> +	const char *name;
> +	char * (*get_region_name)(int fd);
> +	int (*init)(void **ctx, int fd, int max_bo);
> +	void (*deinit)(void *ctx);
> +	int (*allocate_vram)(void *ctx, int n_bo, size_t len);
> +	void (*free_vram)(void *ctx, int n_bo);

I expect IGT maintainers might ask for kerneldoc for these.

> +};
> +
> +extern const struct igt_dmem_driver xe_dmem_driver;
> +
> +#endif
> diff --git a/lib/meson.build b/lib/meson.build
> index 868220408f8c..012802475de0 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -126,6 +126,7 @@ lib_sources = [
>   	'igt_msm.c',
>   	'igt_dsc.c',
>   	'igt_hook.c',
> +	'xe/xe_dmem.c',
>   	'xe/xe_gt.c',
>   	'xe/xe_ioctl.c',
>   	'xe/xe_legacy.c',
> diff --git a/lib/xe/xe_dmem.c b/lib/xe/xe_dmem.c
> new file mode 100644
> index 000000000000..1dec8cf8b0a1
> --- /dev/null
> +++ b/lib/xe/xe_dmem.c
> @@ -0,0 +1,139 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2026 Valve Corporation
> + * Authors:
> + *  Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> + */
> +
> +#include <errno.h>
> +
> +#include "igt.h"
> +#include "igt_cgroup.h"
> +#include "igt_dmem_driver.h"
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +static char * xe_dmem_get_region_name(int fd)
> +{
> +	uint64_t vram_region = 0;
> +	uint64_t region;
> +	char *cg_region;
> +
> +	/* Find first VRAM region */
> +	xe_for_each_mem_region(fd, all_memory_regions(fd), region) {
> +		if (xe_region_class(fd, region) == DRM_XE_MEM_REGION_CLASS_VRAM) {
> +			vram_region = region;
> +			break;
> +		}
> +	}

FWIW it looks like that from here..

> +	if (!vram_region)
> +		return NULL;
> +
> +	cg_region = xe_cgroup_region_name(fd, vram_region);
> +
> +	return cg_region;

.. to here could be simplified as return xe_cgroup_region_name(...), 
given the helper returns NULL for non-VRAM regions. Or even return 
straight from the above loop instead of the break. Up to you which of 
the three options you prefer, just thinking out loud.

> +}
> +
> +struct xe_bo {
> +	uint32_t handle;
> +	size_t len;
> +};
> +
> +struct xe_dmem_ctx {
> +	int fd;
> +	struct xe_bo *bos;
> +	uint64_t vram_region;
> +	int max_bo;
> +};
> +
> +static int xe_dmem_init(void **ctx, int fd, int max_bo)
> +{
> +	struct xe_dmem_ctx *xe_ctx;
> +	uint64_t region;
> +
> +	xe_ctx = malloc(sizeof(*xe_ctx));
> +	if (!xe_ctx)
> +		return -ENOMEM;
> +
> +	xe_ctx->bos = calloc(max_bo, sizeof(xe_ctx->bos[0]));
> +	if (!xe_ctx->bos)
> +		goto out;
> +	memset(xe_ctx->bos, 0, max_bo * sizeof(xe_ctx->bos[0]));

calloc already zeroes the memory.

> +	xe_ctx->max_bo = max_bo;

Could the need for max_bo input parameter be avoided if the arrays were 
allocated in chunks and grown? More complex implementation but a simpler 
API.

> +
> +	xe_ctx->vram_region = 0;
> +	/* Find first VRAM region */
> +	xe_for_each_mem_region(fd, all_memory_regions(fd), region) {
> +		if (xe_region_class(fd, region) == DRM_XE_MEM_REGION_CLASS_VRAM) {
> +			xe_ctx->vram_region = region;
> +			break;
> +		}
> +	}
> +	if (!xe_ctx->vram_region)
> +		goto out;
> +
> +	xe_ctx->fd = fd;
> +
> +	*ctx = xe_ctx;
> +
> +	return 0;
> +
> +out:
> +	if (xe_ctx->bos)
> +		free(xe_ctx->bos);
> +	free(xe_ctx);
> +
> +	return -ENOMEM;
> +}
> +
> +static void xe_dmem_deinit(void *ctx)
> +{
> +	struct xe_dmem_ctx *xe_ctx = ctx;
> +
> +	free(xe_ctx->bos);
> +	free(xe_ctx);

Handle cleanup is not desirable?

> +}
> +
> +static int xe_dmem_allocate_vram(void *ctx, int n_bo, size_t len)

Is the last patch in the series the only user of this API? I am thinking 
whether the n_bo input parameter is required and it wouldn't be simpler 
to just return a handle (or null) and grow the internal count. Ie. is 
there a use case for callers to precisely need to control "allocate/free 
at this index"?

> +{
> +	struct xe_dmem_ctx *xe_ctx = ctx;
> +	uint32_t handle;
> +	int err;
> +
> +	if (n_bo >= xe_ctx->max_bo)
> +		return -ENOMEM;

If the max_bo approach remains, I'd be tempted to igt_assert here since 
it is a test writer error to hit it.

Also, return error if a valid handle is already at the requested index?

> +
> +	err = __xe_bo_create(xe_ctx->fd, 0, len, xe_ctx->vram_region, 0,
> +			     NULL, &handle);
> +	if (err)
> +		goto out;
> +
> +	xe_ctx->bos[n_bo].handle = handle;
> +	xe_ctx->bos[n_bo].len = len;
> +
> +out:
> +	return err;
> +}
> +
> +static void xe_dmem_free_vram(void *ctx, int n_bo)
> +{
> +	struct xe_dmem_ctx *xe_ctx = ctx;
> +	size_t len;
> +	if (n_bo >= xe_ctx->max_bo)
> +		return;

Same assert or not comment as above.

> +	len = xe_ctx->bos[n_bo].len;
> +	if (len) {
> +		gem_close(xe_ctx->fd, xe_ctx->bos[n_bo].handle);
> +		xe_ctx->bos[n_bo].len = 0;
> +	}

It looks like the len local is superflous and handle also needs clearing.

> +}
> +
> +const struct igt_dmem_driver xe_dmem_driver = {
> +	.name = "xe",
> +	.get_region_name = xe_dmem_get_region_name,
> +	.init = xe_dmem_init,
> +	.deinit = xe_dmem_deinit,
> +	.allocate_vram = xe_dmem_allocate_vram,
> +	.free_vram = xe_dmem_free_vram,
> +};

Regards,

Tvrtko

