Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734EACA101E
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 06:21:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EFD610E3BB;
	Tue,  3 Sep 2024 06:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ex5iYmn4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D0110E3BB
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 06:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725344475; x=1756880475;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=T3cDsnRGEPp6Tj7QPlHl93LWGnkFDslLNsPxu+AXjPw=;
 b=Ex5iYmn4dhWeKYiiSw5Mrqd5iaBajGww3g9PhstN8F5Sp2EKGlWJR9p7
 yKjMhU1XZQr2ck2NnqxGcm1S3I7/mxcgUFHrQOro1MLB9xBhSEA9nh+eZ
 dwfl8b9Uoj74Z5Be0ivza3EPm2w4BD3W0z9XsJ5UE47iZHg7MT1lrAdNw
 Bycdegy0UHDE2or+qgFbFXhhnDXtPUZDIsDxFumXVpDEcIVRB6BIztqcG
 GBgyYhsM1urOVlXUrjcBV2ZmOdS8Bm21jgSs0iYmodmw1vuO4+Gj6DRp8
 irvyOaCRoH3K4RF8zY3j63qi/Qm6hXHGlFyXfMYWq9rJAgNZcFj3qkWJz g==;
X-CSE-ConnectionGUID: vIYQdnqERcqIjFNhagrT4w==
X-CSE-MsgGUID: A2C63G0GS3KF7oUzzxJmjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24102245"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; d="scan'208";a="24102245"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 23:21:15 -0700
X-CSE-ConnectionGUID: R+JSs3+6SZ65IJlPdFSEUA==
X-CSE-MsgGUID: WEcnMXgvRWW/bjOinZ86GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; d="scan'208";a="64426766"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.116])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 23:21:12 -0700
Date: Tue, 3 Sep 2024 08:21:08 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Mika Kuoppala <mika.kuaoppala@linux.intel.com>
Subject: Re: [PATCH i-g-t v5 11/17] lib/xe_eudebug: Introduce eu debug
 testing framework
Message-ID: <20240903062108.yqksbpmwybegwnc3@zkempczy-mobl2>
References: <20240829144547.105371-1-christoph.manszewski@intel.com>
 <20240829144547.105371-12-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240829144547.105371-12-christoph.manszewski@intel.com>
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

On Thu, Aug 29, 2024 at 04:45:41PM +0200, Christoph Manszewski wrote:

<cut>

> diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
> new file mode 100644
> index 000000000..d6c37d8f2
> --- /dev/null
> +++ b/lib/xe/xe_eudebug.h
> @@ -0,0 +1,212 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#include <fcntl.h>
> +#include <pthread.h>
> +#include <stdint.h>
> +#include <xe_drm.h>
> +#include <xe_drm_eudebug.h>
> +
> +#include "igt_list.h"
> +
> +struct xe_eudebug_event_log {
> +	uint8_t *log;
> +	unsigned int head;
> +	unsigned int max_size;
> +	char name[80];
> +	pthread_mutex_t lock;
> +};
> +
> +struct xe_eudebug_debugger {
> +	int fd;
> +	uint64_t flags;
> +
> +	/* Used to smuggle private data */
> +	void *ptr;
> +
> +	struct xe_eudebug_event_log *log;
> +
> +	uint64_t event_count;
> +
> +	uint64_t target_pid;

uint64_t

> +
> +	struct igt_list_head triggers;
> +
> +	int master_fd;
> +
> +	pthread_t worker_thread;
> +	int worker_state;
> +
> +	int p_client[2];
> +};
> +
> +struct xe_eudebug_client {
> +	int pid;

int, I think you should use int or pid_t for both.

It would be good to add some comments how this library part is working
and how to use it.

> +	uint64_t seqno;
> +	uint64_t flags;
> +
> +	/* Used to smuggle private data */
> +	void *ptr;
> +
> +	struct xe_eudebug_event_log *log;
> +
> +	int done;
> +	int p_in[2];
> +	int p_out[2];
> +
> +	/* Used to pickup right device (the one used in debugger) */
> +	int master_fd;
> +
> +	int timeout_ms;
> +};
> +
> +struct xe_eudebug_session {
> +	uint64_t flags;
> +	struct xe_eudebug_client *c;
> +	struct xe_eudebug_debugger *d;
> +};
> +
> +typedef void (*xe_eudebug_client_work_fn)(struct xe_eudebug_client *);
> +typedef void (*xe_eudebug_trigger_fn)(struct xe_eudebug_debugger *,
> +				      struct drm_xe_eudebug_event *);
> +
> +#define xe_eudebug_for_each_engine(fd__, hwe__) \
> +	xe_for_each_engine(fd__, hwe__) \
> +		if (hwe__->engine_class == DRM_XE_ENGINE_CLASS_RENDER || \
> +		    hwe__->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
> +
> +#define xe_eudebug_for_each_event(_e, _log) \
> +	for ((_e) = (_e) ? (void *)(uint8_t *)(_e) + (_e)->len : \
> +		    (void *)(_log)->log; \
> +	    (uint8_t *)(_e) < (_log)->log + (_log)->head; \
> +	    (_e) = (void *)(uint8_t *)(_e) + (_e)->len)
> +
> +#define xe_eudebug_assert(d, c)						\
> +	do {								\
> +		if (!(c)) {						\
> +			xe_eudebug_event_log_print((d)->log, true);	\
> +			igt_assert(c);					\
> +		}							\
> +	} while (0)
> +
> +#define xe_eudebug_assert_f(d, c, f...)					\
> +	do {								\
> +		if (!(c)) {						\
> +			xe_eudebug_event_log_print((d)->log, true);	\
> +			igt_assert_f(c, f);				\
> +		}							\
> +	} while (0)
> +
> +#define XE_EUDEBUG_EVENT_STRING_MAX_LEN		4096
> +
> +/*
> + * Default abort timeout to use across xe_eudebug lib and tests if no specific
> + * timeout value is required.
> + */
> +#define XE_EUDEBUG_DEFAULT_TIMEOUT_SEC		25ULL
> +
> +#define XE_EUDEBUG_FILTER_EVENT_NONE		BIT(DRM_XE_EUDEBUG_EVENT_NONE)
> +#define XE_EUDEBUG_FILTER_EVENT_READ		BIT(DRM_XE_EUDEBUG_EVENT_READ)
> +#define XE_EUDEBUG_FILTER_EVENT_OPEN		BIT(DRM_XE_EUDEBUG_EVENT_OPEN)
> +#define XE_EUDEBUG_FILTER_EVENT_VM		BIT(DRM_XE_EUDEBUG_EVENT_VM)
> +#define XE_EUDEBUG_FILTER_EVENT_EXEC_QUEUE	BIT(DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE)
> +#define XE_EUDEBUG_FILTER_EVENT_EU_ATTENTION	BIT(DRM_XE_EUDEBUG_EVENT_EU_ATTENTION)
> +#define XE_EUDEBUG_FILTER_EVENT_VM_BIND		BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND)
> +#define XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP	BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_OP)
> +#define XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE  BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE)
> +#define XE_EUDEBUG_FILTER_ALL			GENMASK(DRM_XE_EUDEBUG_EVENT_MAX_EVENT, 0)
> +#define XE_EUDEBUG_EVENT_IS_FILTERED(_e, _f)	((1UL << (_e)) & (_f))
> +
> +int xe_eudebug_connect(int fd, pid_t pid, uint32_t flags);
> +const char *xe_eudebug_event_to_str(struct drm_xe_eudebug_event *e, char *buf, size_t len);
> +struct drm_xe_eudebug_event *
> +xe_eudebug_event_log_find_seqno(struct xe_eudebug_event_log *l, uint64_t seqno);
> +struct xe_eudebug_event_log *
> +xe_eudebug_event_log_create(const char *name, unsigned int max_size);
> +void xe_eudebug_event_log_destroy(struct xe_eudebug_event_log *l);
> +void xe_eudebug_event_log_print(struct xe_eudebug_event_log *l, bool debug);
> +void xe_eudebug_event_log_compare(struct xe_eudebug_event_log *c, struct xe_eudebug_event_log *d,
> +				  uint32_t filter);
> +void xe_eudebug_event_log_write(struct xe_eudebug_event_log *l, struct drm_xe_eudebug_event *e);
> +void xe_eudebug_event_log_match_opposite(struct xe_eudebug_event_log *l, uint32_t filter);
> +
> +bool xe_eudebug_debugger_available(int fd);
> +struct xe_eudebug_debugger *
> +xe_eudebug_debugger_create(int xe, uint64_t flags, void *data);
> +void xe_eudebug_debugger_destroy(struct xe_eudebug_debugger *d);
> +int xe_eudebug_debugger_attach(struct xe_eudebug_debugger *d, struct xe_eudebug_client *c);
> +void xe_eudebug_debugger_start_worker(struct xe_eudebug_debugger *d);
> +void xe_eudebug_debugger_stop_worker(struct xe_eudebug_debugger *d, int timeout_s);
> +void xe_eudebug_debugger_dettach(struct xe_eudebug_debugger *d);
> +void xe_eudebug_debugger_set_data(struct xe_eudebug_debugger *c, void *ptr);
> +void xe_eudebug_debugger_add_trigger(struct xe_eudebug_debugger *d, int type,
> +				     xe_eudebug_trigger_fn fn);
> +void xe_eudebug_debugger_signal_stage(struct xe_eudebug_debugger *d, uint64_t stage);
> +void xe_eudebug_debugger_wait_stage(struct xe_eudebug_session *s, uint64_t stage);
> +
> +struct xe_eudebug_client *
> +xe_eudebug_client_create(int xe, xe_eudebug_client_work_fn work, uint64_t flags, void *data);
> +void xe_eudebug_client_destroy(struct xe_eudebug_client *c);
> +void xe_eudebug_client_start(struct xe_eudebug_client *c);
> +void xe_eudebug_client_stop(struct xe_eudebug_client *c);
> +void xe_eudebug_client_wait_done(struct xe_eudebug_client *c);
> +void xe_eudebug_client_signal_stage(struct xe_eudebug_client *c, uint64_t stage);
> +void xe_eudebug_client_wait_stage(struct xe_eudebug_client *c, uint64_t stage);
> +
> +uint64_t xe_eudebug_client_get_seqno(struct xe_eudebug_client *c);
> +void xe_eudebug_client_set_data(struct xe_eudebug_client *c, void *ptr);
> +
> +bool xe_eudebug_enable(int fd, bool enable);
> +
> +int xe_eudebug_client_open_driver(struct xe_eudebug_client *c);
> +void xe_eudebug_client_close_driver(struct xe_eudebug_client *c, int fd);
> +uint32_t xe_eudebug_client_vm_create(struct xe_eudebug_client *c, int fd,
> +				     uint32_t flags, uint64_t ext);
> +void xe_eudebug_client_vm_destroy(struct xe_eudebug_client *c, int fd, uint32_t vm);
> +uint32_t xe_eudebug_client_exec_queue_create(struct xe_eudebug_client *c, int fd,
> +					     struct drm_xe_exec_queue_create *create);
> +void xe_eudebug_client_exec_queue_destroy(struct xe_eudebug_client *c, int fd,
> +					  struct drm_xe_exec_queue_create *create);
> +void xe_eudebug_client_vm_bind_event(struct xe_eudebug_client *c, uint32_t event_flags, int fd,
> +				     uint32_t vm, uint32_t bind_flags,
> +				     uint32_t num_ops, uint64_t *ref_seqno);
> +void xe_eudebug_client_vm_bind_op_event(struct xe_eudebug_client *c, uint32_t event_flags,
> +					uint64_t ref_seqno, uint64_t *op_ref_seqno,
> +					uint64_t addr, uint64_t range,
> +					uint64_t num_extensions);
> +void xe_eudebug_client_vm_bind_op_metadata_event(struct xe_eudebug_client *c,
> +						 uint32_t event_flags, uint64_t op_ref_seqno,
> +						 uint64_t metadata_handle, uint64_t metadata_cookie);
> +void xe_eudebug_client_vm_bind_ufence_event(struct xe_eudebug_client *c, uint32_t event_flags,
> +					    uint64_t ref_seqno);
> +void xe_eudebug_ack_ufence(int debugfd,
> +			   const struct drm_xe_eudebug_event_vm_bind_ufence *f);
> +
> +void xe_eudebug_client_vm_bind_flags(struct xe_eudebug_client *c, int fd, uint32_t vm,
> +				     uint32_t bo, uint64_t offset,
> +				     uint64_t addr, uint64_t size, uint32_t flags,
> +				     struct drm_xe_sync *sync, uint32_t num_syncs,
> +				     uint64_t op_ext);
> +void xe_eudebug_client_vm_bind(struct xe_eudebug_client *c, int fd, uint32_t vm,
> +			       uint32_t bo, uint64_t offset,
> +			       uint64_t addr, uint64_t size);
> +void xe_eudebug_client_vm_unbind_flags(struct xe_eudebug_client *c, int fd,
> +				       uint32_t vm, uint64_t offset,
> +				       uint64_t addr, uint64_t size, uint32_t flags,
> +				       struct drm_xe_sync *sync, uint32_t num_syncs);
> +void xe_eudebug_client_vm_unbind(struct xe_eudebug_client *c, int fd, uint32_t vm,
> +				 uint64_t offset, uint64_t addr, uint64_t size);
> +
> +uint32_t xe_eudebug_client_metadata_create(struct xe_eudebug_client *c, int fd,
> +					   int type, size_t len, void *data);
> +void xe_eudebug_client_metadata_destroy(struct xe_eudebug_client *c, int fd,
> +					uint32_t id, int type, size_t len);
> +
> +struct xe_eudebug_session *xe_eudebug_session_create(int fd,
> +						     xe_eudebug_client_work_fn work,
> +						     unsigned int flags,
> +						     void *test_private);
> +void xe_eudebug_session_destroy(struct xe_eudebug_session *s);
> +void xe_eudebug_session_run(struct xe_eudebug_session *s);
> +void xe_eudebug_session_check(struct xe_eudebug_session *s, bool match_opposite, uint32_t filter);
> diff --git a/meson.build b/meson.build
> index 25bf1e442..207b5819b 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -90,9 +90,11 @@ build_chamelium = get_option('chamelium')
>  build_docs = get_option('docs')
>  build_tests = not get_option('tests').disabled()
>  build_xe = not get_option('xe_driver').disabled()
> +build_xe_eudebug = get_option('xe_eudebug').enabled()
>  with_libdrm = get_option('libdrm_drivers')
>  
>  build_info = ['Build type: ' + get_option('buildtype')]
> +build_info += 'Build Xe EU debugger test framework: @0@'.format(build_xe_eudebug)
>  
>  inc = include_directories('include', 'include/drm-uapi', 'include/linux-uapi', 'lib', 'lib/stubs/syscalls', '.')
>  
> diff --git a/meson_options.txt b/meson_options.txt
> index 6a9493ea6..11922523b 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -42,6 +42,11 @@ option('xe_driver',
>         value : 'enabled',
>         description : 'Build tests for Xe driver')
>  
> +option('xe_eudebug',
> +       type : 'feature',
> +       value : 'disabled',
> +       description : 'Build library for Xe EU debugger')
> +

Good. You've hidden the code behind the option. We may improve it later
but before I'll give my ack here I would like to know more about the
seqno duplicates issue mentioned in my previous email.

--
Zbigniew


>  option('libdrm_drivers',
>         type : 'array',
>         value : ['auto'],
> -- 
> 2.34.1
> 
