Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A196CA5FC4
	for <igt-dev@archiver.kernel.org>; Fri,  2 Oct 2026 09:00:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC9410E6B4;
	Fri,  2 Oct 2026 09:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="xuLJCw39";
	dkim-atps=neutral
Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com
 [74.125.225.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E4310E6B4
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Oct 2026 08:59:14 +0000 (UTC)
Received: by mail-wr2-f35.google.com with SMTP id
 ffacd0b85a97d-48b059eae96so1684476f8f.0
 for <igt-dev@lists.freedesktop.org>; Fri, 02 Oct 2026 01:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1790931553; x=1791536353; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=sYAduw/dL7f5WOAZQrXmC63DDSK49xX3s/02ur2phHU=;
 b=xuLJCw39IZYOyHXlufm4P7NlXOD1ZZbcR4sjjo+mwuhJXwizbEvS9wbOW2Y3x9lQEH
 BoHhEImYNOj2GAbpj2AgJG0unukqhNQ/61dwuljtsGp5SAcpmnCEa81HJ+lD7sx8QYd3
 IU0b2cRyWct+LsGnYLjqGghnL72aZSvQWV+JP1MpQ1PL7ET3kVeZk4o3ZnzxjgZNfZwe
 vnzGbq/P3BwGDJ6SXrQndRCcKYxIC2ylX4+wcDWuCaqBrE4ff8j5DNUqQ/OJf1Nch0bK
 eEPs0JjxhcC9HQ59iscFTcjq8O6ZuYQgrgTb8UIgv87qjJUw1oTB3BtePv+WB75HnzDM
 1wbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790931553; x=1791536353;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sYAduw/dL7f5WOAZQrXmC63DDSK49xX3s/02ur2phHU=;
 b=UAmWyPlgwnk+2UI/rT4bw9V+F2jp9V2wMYcQYcd4TMubJPCH5mntwPCIYMwZOWJRH3
 TPy1UN29BknIcC6OVOcTa8hSLtsG4WM2qwDUc6nrDdAkMrR+VQN49ESKxm6LgDftvTDO
 fK6ZwvRFB9wqm1fdglX6hLGfCF3NcKwWfX6k8Re9xUWiQAxwTuxvp/CQVIKjw0X1EX5A
 LE9NsKDWet3IVZKPxcTkDQClsQ5SR58aYOGlo8tzCofqSiMpSSryXZ/Xsq0yE1hci8K3
 VoXQSrqR4Vy1TCNVMA/8zfXzIKWwgsaXqMMdDCvEJbwkazZ/+VHAfmv0TBl95Hognh59
 CCXQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxP6y4jXpC3xgwUIdgtW5adXvbtKscqg6OSu11aTVClc718jmP/btw7vw30Y0EYnMD2EB+WyS5x@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIgUcTIA/DDkP/jHwX3zJYocQ1ye2TbmNWY8Ob+KlAgVA++h96A
 9jdjF0nfW5TxnsRkxCOWYl3tQWq6vjCI0HetGDWLYIf0qFOAEKfT0UZqDYFrkBlUGJ8=
X-Gm-Gg: AYBFou2G6dkAXRX4+EGGO+zO7em9CQVd5iN+1O3cJXtX6PSZTye4qORWA/sq2p7buRK
 L/ACxgXForLSUbs10HWWnNXS/4eH5agCrPBLeCIeo98paYB/quv19STjhXcps1l0VrWhFq+5+AB
 Pzpvmi7g++JaredLRQV4w4EWjbt/1CR7MRAZefBvIaof5qthtnfU3+udHqRkp/PffWvFAOZ2ql9
 xVocWEv5knM19p3LCFlsOiPKTthmn/rM97fRVJAYXllCb4/MYE2lUfZUr4Pp1Kl1veQfQ7WGAUk
 KjT4lkQjcnD1EVq2XxS9/+Ee9GvhwoTTsLG2N2+Gi/qYtw125WiFJz1OM0gwHqKpK1iOXuqwwWw
 EbavuTQhkxYXueZBL91HtZ4E6dbptE4lJasE00RAIcj6EQw9q+baQwyw1gkQb4DiwKxsDNYfw1b
 ZCWt6HmMZxXj8HrmYjJTBMF5/K2g/ckRHh8IKdqAZByDe/0ue9OvwFlrt3ouqhefpeKH6TO96CA
 yJ80dXVKs8LFA==
X-Received: by 2002:a5d:6f05:0:b0:48b:d17:139b with SMTP id
 ffacd0b85a97d-48b1271cd12mr3314923f8f.9.1790931553034; 
 Fri, 02 Oct 2026 01:59:13 -0700 (PDT)
Received: from [192.168.0.116] ([81.79.79.1]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b380fab06sm3941619f8f.20.2026.10.02.01.59.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2026 01:59:11 -0700 (PDT)
Message-ID: <e78e82ea-3cc3-4b22-b5e0-f7c57abfbc0d@ursulin.net>
Date: Fri, 2 Oct 2026 09:59:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/8] tools/gputop/i915_gputop: add i915 PMU engine
 monitoring
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, krzysztof.karas@intel.com,
 krzysztof.niemiec@intel.com
References: <cover.1790331690.git.sebastian.brzezinka@intel.com>
 <84e6c1f62a64cd5f6a9ebe549ce32b123d623f42.1790331690.git.sebastian.brzezinka@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <84e6c1f62a64cd5f6a9ebe549ce32b123d623f42.1790331690.git.sebastian.brzezinka@intel.com>
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


On 25/09/2026 11:57, Sebastian Brzezinka wrote:
> Add an i915 backend for gputop's PMU-based engine monitoring,
> implementing the device_operations interface from utils.h.
> 
> i915_populate_engines() opens the render node (no DRM master needed),
> scans /sys/bus/event_source/devices/<dev>/events/ for "*-busy" entries,
> and decodes engine class/instance from the PMU config value.
> 
> i915_pmu_init() opens a perf event group via igt_perf_open_group()
> (requires CAP_PERFMON or root) and cleans up FDs on partial failure.
> 
> i915_pmu_sample() reads all counters atomically from the group leader
> fd into a heap-allocated buffer, and tracks read success explicitly
> so a failed/short read leaves counters and timestamps unchanged
> instead of using garbage.

Looks like a bunch of code from intel_gpu_top so instead of duplicating 
(be it code or functionality), and since you are making an abstraction 
anyway, it would be much better to make it a library both gputop and 
intel_gpu_top would use.

Same as I added a library for fdinfo access when adding per client 
support to intel_gpu_top and bringing up gputop as a vendor agnostic 
demonstration tool. That would seem like a logical route to take and 
much better for maintenance to have one copy.

Down the road, once feature parity is achived, intel_gpu_top can become 
a symlink to gputop.

Regards,

Tvrtko

> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>   tools/gputop/i915_gputop.c | 473 +++++++++++++++++++++++++++++++++++++
>   tools/gputop/i915_gputop.h |  56 +++++
>   2 files changed, 529 insertions(+)
>   create mode 100644 tools/gputop/i915_gputop.c
>   create mode 100644 tools/gputop/i915_gputop.h
> 
> diff --git a/tools/gputop/i915_gputop.c b/tools/gputop/i915_gputop.c
> new file mode 100644
> index 000000000..de33bb3fd
> --- /dev/null
> +++ b/tools/gputop/i915_gputop.c
> @@ -0,0 +1,473 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <dirent.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <inttypes.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +
> +#include "drm-uapi/i915_drm.h"
> +#include "i915_gputop.h"
> +
> +/* Minimum chars before the "-busy" suffix (e.g. "rcs0") */
> +#define MIN_ENGINE_PREFIX_LEN 4
> +
> +#define engine_ptr(pmu_device, n) (&(pmu_device)->engine[(n)])
> +
> +static void __update_sample(struct i915_pmu_counter *counter, uint64_t val)
> +{
> +	counter->val.prev = counter->val.cur;
> +	counter->val.cur = val;
> +}
> +
> +static void update_sample(struct i915_pmu_counter *counter, uint64_t *val)
> +{
> +	if (counter->present)
> +		__update_sample(counter, val[counter->idx]);
> +}
> +
> +static const char *class_display_name(unsigned int class)
> +{
> +	switch (class) {
> +	case I915_ENGINE_CLASS_RENDER:
> +		return "Render/3D";
> +	case I915_ENGINE_CLASS_COPY:
> +		return "Blitter";
> +	case I915_ENGINE_CLASS_VIDEO:
> +		return "Video";
> +	case I915_ENGINE_CLASS_VIDEO_ENHANCE:
> +		return "VideoEnhance";
> +	case I915_ENGINE_CLASS_COMPUTE:
> +		return "Compute";
> +	default:
> +		return "[unknown]";
> +	}
> +}
> +
> +static int engine_cmp(const void *__a, const void *__b)
> +{
> +	const struct i915_engine *a = (const struct i915_engine *)__a;
> +	const struct i915_engine *b = (const struct i915_engine *)__b;
> +
> +	if (a->class != b->class)
> +		return a->class - b->class;
> +	return a->instance - b->instance;
> +}
> +
> +void i915_gputop_init(void *ptr, int index, struct igt_device_card *card)
> +{
> +	struct i915_gputop *obj = ((struct i915_gputop *)ptr) + index;
> +
> +	obj->card = card;
> +}
> +
> +/*
> + * Read a single uint64 value from a sysfs file relative to a directory fd.
> + * Returns the value on success, or (uint64_t)-1 on failure.
> + */
> +static uint64_t read_sysfs_u64(int dirfd, const char *name)
> +{
> +	char buf[64];
> +	uint64_t val;
> +	ssize_t n;
> +	int fd;
> +
> +	fd = openat(dirfd, name, O_RDONLY);
> +	if (fd < 0)
> +		return (uint64_t)-1;
> +
> +	n = read(fd, buf, sizeof(buf) - 1);
> +	close(fd);
> +	if (n <= 0)
> +		return (uint64_t)-1;
> +
> +	buf[n] = '\0';
> +
> +	/* i915 PMU event files contain e.g. "config=0x1000" */
> +	if (sscanf(buf, "config=0x%" SCNx64, &val) != 1 &&
> +	    sscanf(buf, "event=0x%" SCNx64, &val) != 1 &&
> +	    sscanf(buf, "0x%" SCNx64, &val) != 1 &&
> +	    sscanf(buf, "%" SCNu64, &val) != 1)
> +		return (uint64_t)-1;
> +
> +	return val;
> +}
> +
> +void *i915_populate_engines(const void *obj, int index)
> +{
> +	struct i915_gputop *ptr = ((struct i915_gputop *)obj) + index;
> +	struct igt_device_card *card = ptr->card;
> +	struct i915_pmu_device *engines = NULL;
> +	char sysfs_path[PATH_MAX];
> +	char device[80];
> +	struct dirent *dent;
> +	DIR *d;
> +	int render_fd = -1;
> +	int ret = 0;
> +
> +	if (!card || (!strlen(card->render) && !strlen(card->card)))
> +		return NULL;
> +
> +	/*
> +	 * Open render node to determine i915 PMU device name.
> +	 * Render nodes do not require DRM master privileges.
> +	 */
> +	if (strlen(card->render))
> +		render_fd = igt_open_render(card);
> +	else
> +		render_fd = igt_open_card(card);
> +
> +	if (render_fd < 0) {
> +		fprintf(stderr, "i915: Failed to open device: %s\n",
> +			strerror(errno));
> +		return NULL;
> +	}
> +
> +	i915_perf_device(render_fd, device, sizeof(device));
> +	close(render_fd);
> +
> +	snprintf(sysfs_path, sizeof(sysfs_path),
> +		 "/sys/bus/event_source/devices/%s/events", device);
> +
> +	d = opendir(sysfs_path);
> +	if (!d) {
> +		fprintf(stderr, "i915: Cannot open %s: %s\n",
> +			sysfs_path, strerror(errno));
> +		return NULL;
> +	}
> +
> +	engines = malloc(sizeof(struct i915_pmu_device));
> +	if (!engines) {
> +		closedir(d);
> +		return NULL;
> +	}
> +	memset(engines, 0, sizeof(*engines));
> +	engines->device = strdup(device);
> +	engines->fd = -1;
> +
> +	/* Scan for engine-busy events: entries named like "rcs0-busy" */
> +	while ((dent = readdir(d)) != NULL) {
> +		const char *endswith = "-busy";
> +		const size_t endlen = strlen(endswith);
> +		struct i915_pmu_device *engines_tmp;
> +		struct i915_engine *engine;
> +		uint64_t config;
> +		char namebuf[256];
> +		size_t namelen;
> +
> +		if (dent->d_type != DT_REG && dent->d_type != DT_UNKNOWN)
> +			continue;
> +
> +		namelen = strlen(dent->d_name);
> +		if (namelen < endlen + MIN_ENGINE_PREFIX_LEN)
> +			continue;
> +		if (strcmp(&dent->d_name[namelen - endlen], endswith))
> +			continue;
> +
> +		if (strstr(dent->d_name, ".scale") ||
> +		    strstr(dent->d_name, ".unit"))
> +			continue;
> +
> +		config = read_sysfs_u64(dirfd(d), dent->d_name);
> +		if (config == (uint64_t)-1)
> +			continue;
> +
> +		/* Only accept engine (non-other) configs */
> +		if (config >= __I915_PMU_OTHER(0))
> +			continue;
> +
> +		engines_tmp = realloc(engines,
> +				      sizeof(struct i915_pmu_device) +
> +				      (engines->num_engines + 1) *
> +				      sizeof(struct i915_engine));
> +		if (!engines_tmp) {
> +			ret = errno;
> +			break;
> +		}
> +		engines = engines_tmp;
> +
> +		engine = engine_ptr(engines, engines->num_engines);
> +		memset(engine, 0, sizeof(*engine));
> +
> +		/* Strip "-busy" suffix to get engine name */
> +		strncpy(namebuf, dent->d_name, namelen - endlen);
> +		namebuf[namelen - endlen] = '\0';
> +		engine->name = strdup(namebuf);
> +		if (!engine->name) {
> +			ret = errno;
> +			break;
> +		}
> +
> +		engine->busy.config = config;
> +		engine->class = (config & (__I915_PMU_OTHER(0) - 1)) >>
> +				I915_PMU_CLASS_SHIFT;
> +		engine->instance = (config >> I915_PMU_SAMPLE_BITS) &
> +				   ((1 << I915_PMU_SAMPLE_INSTANCE_BITS) - 1);
> +
> +		ret = asprintf(&engine->display_name, "%s/%u",
> +			       class_display_name(engine->class),
> +			       engine->instance);
> +		if (ret <= 0) {
> +			ret = errno;
> +			free((void *)engine->name);
> +			break;
> +		}
> +		ret = 0;
> +
> +		engines->num_engines++;
> +	}
> +
> +	closedir(d);
> +
> +	if (ret) {
> +		errno = ret;
> +		goto err;
> +	}
> +
> +	if (!engines->num_engines) {
> +		fprintf(stderr, "i915: No engines found for device '%s'\n",
> +			device);
> +		goto err;
> +	}
> +
> +	qsort(engine_ptr(engines, 0), engines->num_engines,
> +	      sizeof(struct i915_engine), engine_cmp);
> +
> +	ptr->pmu_device_obj = engines;
> +	return engines;
> +
> +err:
> +	for (unsigned int i = 0; i < engines->num_engines; i++) {
> +		struct i915_engine *engine = engine_ptr(engines, i);
> +
> +		free((void *)engine->name);
> +		free(engine->display_name);
> +	}
> +	free(engines->device);
> +	free(engines);
> +	return NULL;
> +}
> +
> +static int _open_pmu(uint64_t type, unsigned int *cnt,
> +		     struct i915_pmu_counter *pmu, int *fd)
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
> +int i915_pmu_init(const void *obj, int index)
> +{
> +	struct i915_gputop *ptr = ((struct i915_gputop *)obj) + index;
> +	struct i915_pmu_device *engines = ptr->pmu_device_obj;
> +	uint64_t type;
> +
> +	type = igt_perf_type_id(engines->device);
> +	engines->fd = -1;
> +	engines->num_counters = 0;
> +
> +	for (unsigned int i = 0; i < engines->num_engines; i++) {
> +		struct i915_engine *engine = engine_ptr(engines, i);
> +
> +		if (_open_pmu(type, &engines->num_counters, &engine->busy,
> +			      &engines->fd) < 0) {
> +			/* Close FDs opened in earlier iterations */
> +			for (unsigned int j = 0; j < i; j++) {
> +				struct i915_engine *prev = engine_ptr(engines, j);
> +
> +				if (prev->busy.present) {
> +					close(prev->busy.fd);
> +					prev->busy.present = false;
> +				}
> +			}
> +			engines->fd = -1;
> +			engines->num_counters = 0;
> +			return -1;
> +		}
> +
> +		engine->num_counters++;
> +	}
> +
> +	return 0;
> +}
> +
> +static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
> +{
> +	const size_t buf_size = (2 + num) * sizeof(uint64_t);
> +	uint64_t *buf;
> +	uint64_t ts = 0;
> +	ssize_t len;
> +
> +	buf = malloc(buf_size);
> +	if (!buf)
> +		return 0;
> +
> +	memset(buf, 0, buf_size);
> +	len = read(fd, buf, buf_size);
> +	if (len != (ssize_t)buf_size) {
> +		fprintf(stderr, "i915: PMU read error: expected %zu bytes, got %zd\n",
> +			buf_size, len);
> +		free(buf);
> +		return 0;
> +	}
> +
> +	for (unsigned int i = 0; i < num; i++)
> +		val[i] = buf[2 + i];
> +
> +	ts = buf[1];
> +	free(buf);
> +	return ts;
> +}
> +
> +void i915_pmu_sample(const void *obj, int index)
> +{
> +	struct i915_gputop *ptr = ((struct i915_gputop *)obj) + index;
> +	struct i915_pmu_device *engines = ptr->pmu_device_obj;
> +	const unsigned int num_val = engines->num_counters;
> +	uint64_t *val;
> +
> +	val = calloc(num_val, sizeof(*val));
> +	if (!val)
> +		return;
> +
> +	engines->ts.prev = engines->ts.cur;
> +	engines->ts.cur = pmu_read_multi(engines->fd, num_val, val);
> +
> +	for (unsigned int i = 0; i < engines->num_engines; i++) {
> +		struct i915_engine *engine = engine_ptr(engines, i);
> +
> +		update_sample(&engine->busy, val);
> +	}
> +
> +	free(val);
> +}
> +
> +void i915_clean_up(void *obj, int len)
> +{
> +	struct i915_gputop *gputop_dev = (struct i915_gputop *)obj;
> +
> +	for (int i = 0; i < len; i++) {
> +		if (gputop_dev[i].card)
> +			free(gputop_dev[i].card);
> +
> +		if (!gputop_dev[i].pmu_device_obj)
> +			continue;
> +
> +		for (unsigned int j = 0;
> +		     j < gputop_dev[i].pmu_device_obj->num_engines; j++) {
> +			struct i915_engine *eng =
> +				engine_ptr(gputop_dev[i].pmu_device_obj, j);
> +
> +			free((void *)eng->name);
> +			free(eng->display_name);
> +
> +			if (eng->busy.present)
> +				close(eng->busy.fd);
> +		}
> +
> +		free(gputop_dev[i].pmu_device_obj->device);
> +		free(gputop_dev[i].pmu_device_obj);
> +	}
> +}
> +
> +static double pmu_busy_percentage(struct i915_engine *engine,
> +				  uint64_t elapsed_ns)
> +{
> +	double busy_ns;
> +	double percentage;
> +
> +	if (!elapsed_ns)
> +		return 0.0;
> +
> +	busy_ns = engine->busy.val.cur - engine->busy.val.prev;
> +	percentage = busy_ns * 100.0 / elapsed_ns;
> +
> +	return CLAMP(percentage, 0., 100.);
> +}
> +
> +static int
> +print_device_description(const void *obj, int lines, int w, int h)
> +{
> +	const struct i915_gputop *gputop = (const struct i915_gputop *)obj;
> +	char *desc;
> +	int len;
> +
> +	len = asprintf(&desc, "DRIVER: %s || BDF: %s",
> +		       gputop->card->driver,
> +		       gputop->card->pci_slot_name);
> +
> +	printf(ANSI_HEADER "%s%*s" ANSI_RESET "\n",
> +	       desc, (int)(w - len), " ");
> +	free(desc);
> +
> +	return ++lines;
> +}
> +
> +static int
> +print_engines_header(struct i915_pmu_device *engines, int lines,
> +		     int con_w, int con_h)
> +{
> +	const char *a;
> +
> +	for (unsigned int i = 0;
> +	     i < engines->num_engines && lines < con_h;
> +	     i++) {
> +		if (!engine_ptr(engines, i)->num_counters)
> +			continue;
> +
> +		a = "            ENGINES   ACTIVITY  ";
> +		printf(ANSI_HEADER "%s%*s" ANSI_RESET "\n",
> +		       a, (int)(con_w - (int)strlen(a)), " ");
> +		lines++;
> +		break;
> +	}
> +
> +	return lines;
> +}
> +
> +static int
> +print_engine(struct i915_pmu_device *engines, unsigned int i,
> +	     uint64_t elapsed_ns, int lines, int con_w, int con_h)
> +{
> +	struct i915_engine *engine = engine_ptr(engines, i);
> +	double percentage = pmu_busy_percentage(engine, elapsed_ns);
> +
> +	printf("%*s", (int)strlen("            ENGINES"), engine->display_name);
> +	print_percentage_bar(percentage,
> +			     con_w - (int)strlen("            ENGINES"));
> +	printf("\n");
> +
> +	return ++lines;
> +}
> +
> +int i915_print_engines(const void *obj, int index, int lines, int w, int h)
> +{
> +	struct i915_gputop *ptr = ((struct i915_gputop *)obj) + index;
> +	struct i915_pmu_device *show = ptr->pmu_device_obj;
> +	uint64_t elapsed_ns = show->ts.cur - show->ts.prev;
> +
> +	lines = print_device_description(ptr, lines, w, h);
> +	lines = print_engines_header(show, lines, w, h);
> +
> +	for (unsigned int i = 0; i < show->num_engines && lines < h; i++)
> +		lines = print_engine(show, i, elapsed_ns, lines, w, h);
> +
> +	lines = print_engines_footer(lines, w, h);
> +
> +	return lines;
> +}
> diff --git a/tools/gputop/i915_gputop.h b/tools/gputop/i915_gputop.h
> new file mode 100644
> index 000000000..65684f040
> --- /dev/null
> +++ b/tools/gputop/i915_gputop.h
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef __I915_GPUTOP_H__
> +#define __I915_GPUTOP_H__
> +
> +#include "igt_device_scan.h"
> +#include "igt_perf.h"
> +#include "utils.h"
> +
> +struct i915_pmu_pair {
> +	uint64_t cur;
> +	uint64_t prev;
> +};
> +
> +struct i915_pmu_counter {
> +	uint64_t config;
> +	unsigned int idx;
> +	struct i915_pmu_pair val;
> +	int fd;
> +	bool present;
> +};
> +
> +struct i915_engine {
> +	const char *name;
> +	char *display_name;
> +	unsigned int class;
> +	unsigned int instance;
> +	unsigned int num_counters;
> +	struct i915_pmu_counter busy;
> +};
> +
> +struct i915_pmu_device {
> +	unsigned int num_engines;
> +	unsigned int num_counters;
> +	int fd;
> +	char *device;
> +	struct i915_pmu_pair ts; /* group timestamps from pmu_read_multi */
> +	struct i915_engine engine[]; /* grown via realloc */
> +};
> +
> +struct i915_gputop {
> +	struct igt_device_card *card;
> +	struct i915_pmu_device *pmu_device_obj;
> +};
> +
> +void i915_gputop_init(void *ptr, int index, struct igt_device_card *card);
> +void *i915_populate_engines(const void *obj, int index);
> +int i915_pmu_init(const void *obj, int index);
> +void i915_pmu_sample(const void *obj, int index);
> +int i915_print_engines(const void *obj, int index, int lines, int w, int h);
> +void i915_clean_up(void *obj, int len);
> +
> +#endif /* __I915_GPUTOP_H__ */

