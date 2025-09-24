Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E17FCAC5B0
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 10:39:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A58E10E147;
	Wed, 24 Sep 2025 10:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="ZD89CAmp";
	dkim-atps=neutral
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE1F10E147
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 10:39:04 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3ee64bc6b85so5003146f8f.3
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 03:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1758710343; x=1759315143;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=isZqyElXKY+PjYAFZjEikCovE1eurEl3M1GzTs7KcmQ=;
 b=ZD89CAmpMKcJaPbhVT8rFluMekTxsdnwGwp8nk4rMMmsIyRz1YcyKEAOMQXvkUGV4Y
 L25bYvprfcyqdh7WovV2IC3tuZlgYfCh/npc18TJGPpvZ2VK3Q+O/x3QEjnPLs5aRsrW
 I15sQBNZBb2pNVFHahVyP/fvlApN8GKiGtk+sgaTtoUjsGVNJ7985wDCRkyL8hFSd3kY
 xjrenf10jRuzIDW24AuTlWM9T2RP3DK/wPF1KdVkoE4+zz58p/stguSWK3/IbqZOw1AP
 a31lggO0w/QhKew7bGv2PvXoxMbLtGpG/iqSCHWK4TZCkNiGRtbXTvg+jtK1D5SBqZgb
 2iVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758710343; x=1759315143;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=isZqyElXKY+PjYAFZjEikCovE1eurEl3M1GzTs7KcmQ=;
 b=fX4Cr0ymRYrxkZAyZQzcspA6Mokc8KyrZXLU8cxxBQTM/C2mUKV+UpekgOefhZN6xp
 mfS1ZEz8OmkxBc+dL4nzAWbMTgBmkSB1LgqbHDGeAVzFuqcKuEWqTdvyOs8OrT63D98o
 fw9v6k2YjlogCfbdILdTw+1pS9i5+tqdmLVKl+cuR+JQ4aPzrHEcymiot/1rADPLJl3X
 VldKZq2AK5R9BqkzLpJSR281QnmfO0gKUrtjfd2f3HP4HGYXJhmdkgk0xlgWCntyobUL
 PjsYQtj9MFpKxKuhq5Rp6VJTFC70QD1mq0SaFl2V70YFQwaCzAiJSeCSkg9VypzYGN5/
 BzRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe8jaKTarhn7cSFsEwZFJq2b+dSHwkvAya6BqkdpTtcreArIDFI9QNiCOt/y85FpC8uLKcCmhr@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxzi3Tz3LJbyvhkj0FsBkdPjSOLz36NyB0OTvRqKI8xIdIXXWmk
 sWjK0FnQ6jlbbsvLqwTMigjoxupJiVgpLYtcWdBDxcnd7f3I9PbLhJapvYwfhtiswg8=
X-Gm-Gg: ASbGnctl+8qW4zQ0ssrSlAzE6jmoFk7gasIGH8tTQXUe5q49kjhAg6J+MuUlYdC38E3
 aMZc+rzn5elg9diTfJmZyXe3aIOCEyFPOTfTj9n7RU8r4qbYYj+OrFAp/xYcqdGdr+JXVnDPCXE
 rrOY7/mgJHc8uQndvBESDUB9sWV3pfrpXiGRNd+eIPsEDudiRUs5IJvH/9+oFCg0SO7LQA9ZjKM
 mtTTBoH8xilvhzUha74vgmX6VO1etgHi28zYvP+ZfbtKHX+R70kP4TrTzTSxru6IJ5QhIO1Vwvq
 dabhgE2chO4P+bRONolE9u5u7COgp2+fbRJD9s7De/0xz1nmjYorjLQol1UPmEKslWNREYXaWJh
 vUROIExuAvXJ0KN2JeidzrZ4dq+v6aNuD4J8=
X-Google-Smtp-Source: AGHT+IHvARyFk2nqKHXkmY617COwFZJOyQ+uBhHJrJqU4/46yRJhEuRLQhDz4GgGsw5j77FBuDtfRg==
X-Received: by 2002:a05:6000:1ac8:b0:3e0:e23f:c6d9 with SMTP id
 ffacd0b85a97d-405c6c1bdb8mr4798304f8f.17.1758710342572; 
 Wed, 24 Sep 2025 03:39:02 -0700 (PDT)
Received: from [192.168.0.101] ([84.66.36.92])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3f70b47ca57sm17086176f8f.0.2025.09.24.03.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 03:39:02 -0700 (PDT)
Message-ID: <6b1c7c5b-5b2a-443c-9980-21ed998fb34b@ursulin.net>
Date: Wed, 24 Sep 2025 11:39:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 4/5] tools/gputop/xe_gputop: Add gputop support for xe
 specific devices
To: Soham Purkait <soham.purkait@intel.com>, igt-dev@lists.freedesktop.org,
 riana.tauro@intel.com, vinay.belgaumkar@intel.com,
 kamil.konieczny@intel.com, krzysztof.karas@intel.com,
 zbigniew.kempczynski@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, ashutosh.dixit@intel.com,
 umesh.nerlige.ramappa@intel.com
References: <20250627181222.227803-1-soham.purkait@intel.com>
 <20250627181222.227803-5-soham.purkait@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250627181222.227803-5-soham.purkait@intel.com>
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


On 27/06/2025 19:12, Soham Purkait wrote:
> Add gputop support for xe-specific devices. Separate driver-specific code
> into respective source files.
> 
> v1:
>   - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
> v2:
>   - Allocate Engine memory all at once, remove PMU
>     normalization and perform proper resource
>     cleanup (Riana)
> v3:
>   - Add GT number.    (Riana)
>   - Cosmetic changes. (Riana)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   tools/gputop/xe_gputop.c | 361 +++++++++++++++++++++++++++++++++++++++
>   tools/gputop/xe_gputop.h |  59 +++++++
>   2 files changed, 420 insertions(+)
>   create mode 100644 tools/gputop/xe_gputop.c
>   create mode 100644 tools/gputop/xe_gputop.h
> 
> diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
> new file mode 100644
> index 000000000..9757369a8
> --- /dev/null
> +++ b/tools/gputop/xe_gputop.c
> @@ -0,0 +1,361 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_gputop.h"
> +
> +#define engine_ptr(pmu_device, n) (&(pmu_device)->engine + (n))
> +
> +static void __update_sample(struct xe_pmu_counter *counter, uint64_t val)
> +{
> +	counter->val.prev = counter->val.cur;
> +	counter->val.cur = val;
> +}
> +
> +static void update_sample(struct xe_pmu_counter *counter, uint64_t *val)
> +{
> +	if (counter->present)
> +		__update_sample(counter, val[counter->idx]);
> +}
> +
> +static const char *class_display_name(unsigned int class)
> +{
> +	switch (class) {
> +	case DRM_XE_ENGINE_CLASS_RENDER:
> +		return "Render/3D";
> +	case DRM_XE_ENGINE_CLASS_COPY:
> +		return "Blitter";
> +	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
> +		return "Video";
> +	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +		return "VideoEnhance";
> +	case DRM_XE_ENGINE_CLASS_COMPUTE:
> +		return "Compute";
> +	default:
> +		return "[unknown]";
> +	}
> +}
> +
> +void xe_clean_up(void *obj, int len)
> +{
> +	struct xe_gputop *gputop_dev = (struct xe_gputop *)obj;
> +	struct xe_pmu_counter pmu_counter;
> +	struct xe_engine *eng;
> +
> +	for (int i = 0; i < len; i++) {
> +		if (gputop_dev[i].card)
> +			free(gputop_dev[i].card);
> +		if (gputop_dev[i].pmu_device_obj) {
> +			for (int j = 0;
> +			     j < gputop_dev[i].pmu_device_obj->num_engines;
> +			     j++) {
> +				eng = engine_ptr(gputop_dev[i].pmu_device_obj,
> +						 j);
> +				if (eng->display_name)
> +					free(eng->display_name);
> +
> +				pmu_counter = eng->engine_active_ticks;
> +				if (pmu_counter.present)
> +					close(pmu_counter.fd);
> +
> +				pmu_counter = eng->engine_total_ticks;
> +				if (pmu_counter.present)
> +					close(pmu_counter.fd);
> +			}
> +			if (gputop_dev[i].pmu_device_obj->device)
> +				free(gputop_dev[i].pmu_device_obj->device);
> +			free(gputop_dev->pmu_device_obj);
> +		}
> +	}
> +}
> +
> +static int _open_pmu(uint64_t type, unsigned int *cnt, struct xe_pmu_counter *pmu, int *fd)
> +{
> +	int fd__ = igt_perf_open_group(type, pmu->config, *fd);
> +
> +	if (fd__ >= 0) {
> +		if (*fd == -1)
> +			*fd = fd__;
> +		pmu->present = true;
> +		pmu->idx = (*cnt)++;
> +		pmu->fd = fd__;
> +	}
> +
> +	return fd__;
> +}
> +
> +void xe_gputop_init(void *ptr, int index,
> +		    struct igt_device_card *card)
> +{
> +	struct xe_gputop *obj;
> +
> +	obj = ((struct xe_gputop *)ptr) + index;
> +	obj->card = card;
> +}
> +
> +static int pmu_format_shift(int xe, const char *name)
> +{
> +	uint32_t start;
> +	int format;
> +	char device[80];
> +
> +	format = perf_event_format(xe_perf_device(xe, device, sizeof(device)),
> +				   name, &start);
> +	if (format)
> +		return 0;
> +
> +	return start;
> +}
> +
> +static int engine_cmp(const void *__a, const void *__b)
> +{
> +	const struct xe_engine *a = (struct xe_engine *)__a;
> +	const struct xe_engine *b = (struct xe_engine *)__b;
> +
> +	if (a->drm_xe_engine.gt_id != b->drm_xe_engine.gt_id)
> +		return a->drm_xe_engine.gt_id - b->drm_xe_engine.gt_id;
> +	else if (a->drm_xe_engine.engine_class != b->drm_xe_engine.engine_class)
> +		return a->drm_xe_engine.engine_class - b->drm_xe_engine.engine_class;
> +	else
> +		return a->drm_xe_engine.engine_instance - b->drm_xe_engine.engine_instance;
> +}
> +
> +void *xe_populate_engines(const void *obj, int index)
> +{
> +	struct xe_gputop *ptr = ((struct xe_gputop *)obj) + index;
> +	struct igt_device_card *card = ptr->card;
> +	uint64_t engine_active_config, engine_total_config;
> +	uint64_t engine_class, engine_instance, gt_shift;
> +	struct drm_xe_engine_class_instance *hwe;
> +	struct xe_pmu_device *engines;
> +	char device[30];
> +	int ret = 0;
> +	int card_fd;
> +
> +	if (!card || !strlen(card->card) || !strlen(card->render))
> +		return NULL;
> +
> +	if (strlen(card->card)) {
> +		card_fd = igt_open_card(card);
> +	} else if (strlen(card->render)) {
> +		card_fd = igt_open_render(card);

I am not 100% sure whether it is this patch, but for sure current gputop 
is pants.

I can neither run it as non-root^1, neither anything can run if gputop 
is started as root since for some reason it claims DRM master^2.

:sadface:

Regards,

Tvrtko

1)
tursulin@x1:~$ ~/build/igt-gpu-tools/build/tools/gputop/gputop
(gputop:18642) xe/xe_query-CRITICAL: Test assertion failure function 
xe_query_config_new, file ../lib/xe/xe_query.c:38:
(gputop:18642) xe/xe_query-CRITICAL: Failed assertion: igt_ioctl(fd, 
(((2U|1U) << (((0+8)+8)+14)) | ((('d')) << (0+8)) | (((0x40 + 0x00)) << 
0) | ((((sizeof(struct drm_xe_device_query)))) << ((0+8)+8))), &query) == 0
(gputop:18642) xe/xe_query-CRITICAL: Last errno: 9, Bad file descriptor
(gputop:18642) xe/xe_query-CRITICAL: error: -1 != 0

11880 openat(AT_FDCWD, "/dev/dri/card0", O_RDWR) = -1 EACCES (Permission 
denied)
11880 ioctl(-1, DRM_IOCTL_XE_DEVICE_QUERY, 0x7ffc03610fa0) = -1 EBADF 
(Bad file descriptor)

2)
IGT-Version: 2.1-g3f9506ebd (x86_64) (Linux: 6.17.0-rc7+ x86_64)
Using IGT_SRANDOM=1758710179 for randomisation
Opened device: /dev/dri/card0
(kms_flip_tiling:18628) igt_debugfs-WARNING: clients:
              command  tgid dev master a   uid      magic 
                                              name                   id
               gputop 18625   0   y    y     0          0 
                                           <unset>                   95
      kms_flip_tiling 18628   0   n    y     0          0 
                                           <unset>                   96
Test requirement not met in function igt_device_set_master, file 
../lib/igt_device.c:65:
Test requirement: __igt_device_set_master(fd) == 0
Can't become DRM master, please check if no other DRM client is running.

P.S. And I still think it was the wrong direction to add XE speicific 
stuff to gputop. Should have remained GPU agnostic and intel_gpu_top 
should have been extended to work with either driver. This just feels 
like mess.

> +	} else {
> +		fprintf(stderr, "Failed to detect device!\n");
> +		return NULL;
> +	}
> +	xe_device_get(card_fd);
> +	engines = malloc(sizeof(struct xe_pmu_device) +
> +			 xe_number_engines(card_fd) * sizeof(struct xe_engine));
> +	if (!engines)
> +		return NULL;
> +
> +	memset(engines, 0, sizeof(struct xe_pmu_device) +
> +	       xe_number_engines(card_fd) * sizeof(struct xe_engine));
> +
> +	engines->num_engines = 0;
> +	gt_shift = pmu_format_shift(card_fd, "gt");
> +	engine_class = pmu_format_shift(card_fd, "engine_class");
> +	engine_instance = pmu_format_shift(card_fd, "engine_instance");
> +	xe_perf_device(card_fd, device, sizeof(device));
> +	engines->device = strdup(device);
> +	ret = perf_event_config(device, "engine-active-ticks", &engine_active_config);
> +	if (ret < 0)
> +		return NULL;
> +
> +	ret = perf_event_config(device, "engine-total-ticks", &engine_total_config);
> +	if (ret < 0)
> +		return NULL;
> +
> +	xe_for_each_engine(card_fd, hwe) {
> +		uint64_t  param_config;
> +		struct xe_engine *engine;
> +
> +		engine = engine_ptr(engines, engines->num_engines);
> +		param_config = (uint64_t)hwe->gt_id << gt_shift | hwe->engine_class << engine_class
> +			| hwe->engine_instance << engine_instance;
> +		engine->drm_xe_engine = *hwe;
> +		engine->engine_active_ticks.config = engine_active_config | param_config;
> +		engine->engine_total_ticks.config = engine_total_config | param_config;
> +
> +		if (engine->engine_active_ticks.config == -1 ||
> +		    engine->engine_total_ticks.config == -1) {
> +			ret = ENOENT;
> +			break;
> +		}
> +
> +		ret = asprintf(&engine->display_name, "GT:%u %s/%u",
> +			       hwe->gt_id,
> +			       class_display_name(engine->drm_xe_engine.engine_class),
> +			       engine->drm_xe_engine.engine_instance);
> +
> +		if (ret <= 0) {
> +			ret = errno;
> +			break;
> +		}
> +
> +		engines->num_engines++;
> +	}
> +
> +	if (!ret) {
> +		errno = ret;
> +		return NULL;
> +	}
> +
> +	qsort(engine_ptr(engines, 0), engines->num_engines,
> +	      sizeof(struct xe_engine), engine_cmp);
> +
> +	ptr->pmu_device_obj = engines;
> +
> +	return engines;
> +}
> +
> +static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
> +{
> +	uint64_t buf[2 + num];
> +	unsigned int i;
> +	ssize_t len;
> +
> +	memset(buf, 0, sizeof(buf));
> +
> +	len = read(fd, buf, sizeof(buf));
> +	assert(len == sizeof(buf));
> +
> +	for (i = 0; i < num; i++)
> +		val[i] = buf[2 + i];
> +
> +	return buf[1];
> +}
> +
> +void xe_pmu_sample(const void *obj, int index)
> +{
> +	struct xe_gputop *ptr = ((struct xe_gputop *)obj) + index;
> +	struct xe_pmu_device *engines = ptr->pmu_device_obj;
> +	const int num_val = engines->num_counters;
> +	uint64_t val[2 + num_val];
> +	unsigned int i;
> +
> +	pmu_read_multi(engines->fd, num_val, val);
> +
> +	for (i = 0; i < engines->num_engines; i++) {
> +		struct xe_engine *engine = engine_ptr(engines, i);
> +
> +		update_sample(&engine->engine_active_ticks, val);
> +		update_sample(&engine->engine_total_ticks, val);
> +	}
> +}
> +
> +int xe_pmu_init(const void *obj, int index)
> +{
> +	struct xe_gputop *ptr = ((struct xe_gputop *)obj) + index;
> +	struct xe_pmu_device *engines = ptr->pmu_device_obj;
> +	struct xe_engine *engine;
> +	unsigned int i;
> +	uint64_t type;
> +	int fd;
> +
> +	type = igt_perf_type_id(engines->device);
> +	engines->fd = -1;
> +	engines->num_counters = 0;
> +
> +	for (i = 0; i < engines->num_engines; i++) {
> +		engine = engine_ptr(engines, i);
> +		fd = _open_pmu(type, &engines->num_counters, &engine->engine_active_ticks,
> +			       &engines->fd);
> +		if (fd < 0)
> +			return -1;
> +		fd = _open_pmu(type, &engines->num_counters, &engine->engine_total_ticks,
> +			       &engines->fd);
> +		if (fd < 0)
> +			return -1;
> +	}
> +	return 0;
> +}
> +
> +static double pmu_active_percentage(struct xe_engine *engine)
> +{
> +	double pmu_active_ticks = engine->engine_active_ticks.val.cur -
> +				  engine->engine_active_ticks.val.prev;
> +	double pmu_total_ticks = engine->engine_total_ticks.val.cur -
> +				 engine->engine_total_ticks.val.prev;
> +	double percentage;
> +
> +	percentage = (pmu_active_ticks * 100) / pmu_total_ticks;
> +	return percentage;
> +}
> +
> +static int
> +print_device_description(const void *obj, int lines, int w, int h)
> +{
> +	char *desc;
> +	int len;
> +
> +	len = asprintf(&desc, "DRIVER: %s || BDF: %s",
> +		       ((struct xe_gputop *)obj)->card->driver,
> +		       ((struct xe_gputop *)obj)->card->pci_slot_name);
> +
> +	printf("\033[7m%s%*s\033[0m\n",
> +	       desc,
> +	       (int)(w - len), " ");
> +	lines++;
> +	free(desc);
> +	return lines;
> +}
> +
> +static int
> +print_engines_header(struct xe_pmu_device *engines,
> +		     int lines, int con_w, int con_h)
> +{
> +	const char *a;
> +
> +	for (unsigned int i = 0;
> +	     i < engines->num_engines && lines < con_h;
> +	     i++) {
> +		struct xe_engine *engine = engine_ptr(engines, i);
> +
> +		if (!engine->num_counters)
> +			continue;
> +
> +		a = "            ENGINES   ACTIVITY  ";
> +
> +		printf("\033[7m%s%*s\033[0m\n",
> +		       a,
> +		       (int)(con_w - strlen(a)), " ");
> +		lines++;
> +
> +		break;
> +	}
> +
> +	return lines;
> +}
> +
> +static int
> +print_engine(struct xe_pmu_device *engines, unsigned int i,
> +	     int lines, int con_w, int con_h)
> +{
> +	struct xe_engine *engine = engine_ptr(engines, i);
> +	double percentage = pmu_active_percentage(engine);
> +
> +	printf("%*s", (int)(strlen("            ENGINES")), engine->display_name);
> +	print_percentage_bar(percentage, con_w - strlen("            ENGINES"));
> +	printf("\n");
> +
> +	return ++lines;
> +}
> +
> +int xe_print_engines(const void *obj, int index, int lines, int w, int h)
> +{
> +	struct xe_gputop *ptr = ((struct xe_gputop *)obj) + index;
> +	struct xe_pmu_device *show = ptr->pmu_device_obj;
> +
> +	lines = print_device_description(ptr, lines, w, h);
> +	lines = print_engines_header(show, lines, w,  h);
> +
> +	for (unsigned int i = 0; i < show->num_engines && lines < h; i++)
> +		lines = print_engine(show, i, lines, w, h);
> +
> +	lines = print_engines_footer(lines, w, h);
> +
> +	return lines;
> +}
> +
> diff --git a/tools/gputop/xe_gputop.h b/tools/gputop/xe_gputop.h
> new file mode 100644
> index 000000000..1e3856071
> --- /dev/null
> +++ b/tools/gputop/xe_gputop.h
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __XE_GPUTOP_H__
> +#define __XE_GPUTOP_H__
> +
> +#include <dirent.h>
> +
> +#include "igt_device_scan.h"
> +#include "igt_perf.h"
> +#include "utils.h"
> +#include "xe/xe_query.h"
> +
> +struct xe_pmu_pair {
> +	uint64_t cur;
> +	uint64_t prev;
> +};
> +
> +struct xe_pmu_counter {
> +	uint64_t type;
> +	uint64_t config;
> +	unsigned int idx;
> +	struct xe_pmu_pair val;
> +	int fd;
> +	bool present;
> +};
> +
> +struct xe_engine {
> +	const char *name;
> +	char *display_name;
> +	struct drm_xe_engine_class_instance drm_xe_engine;
> +	unsigned int num_counters;
> +	struct xe_pmu_counter engine_active_ticks;
> +	struct xe_pmu_counter engine_total_ticks;
> +};
> +
> +struct xe_pmu_device {
> +	unsigned int num_engines;
> +	unsigned int num_counters;
> +	int fd;
> +	char *device;
> +	struct xe_engine engine;
> +};
> +
> +struct xe_gputop {
> +	struct igt_device_card *card;
> +	struct xe_pmu_device *pmu_device_obj;
> +};
> +
> +void xe_gputop_init(void *ptr, int index, struct igt_device_card *card);
> +void *xe_populate_engines(const void *obj, int index);
> +int xe_pmu_init(const void *obj, int index);
> +void xe_pmu_sample(const void *obj, int index);
> +int xe_print_engines(const void *obj, int index, int lines, int w, int h);
> +void xe_clean_up(void *obj, int len);
> +
> +#endif /* __XE_GPUTOP_H__ */

