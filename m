Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2495AC3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 15:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60E110E2CC;
	Mon, 19 Aug 2024 15:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d6wIB18g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5A810E2CC
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 15:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724081641; x=1755617641;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uRIPAhvx05ij/9ufN0Vs4R0XfH8aL7J+xlz5melLjjI=;
 b=d6wIB18g79q9QCycMlNVd4a7V9nsSNOwfS/jDhAFY9jHS3l8DQw9X3f1
 /Jb/Wz9MRa37S7fBQSsXy7NXwzQSaaL83jYUuL5G4HZrq2vBimNp7zbW8
 lZpokzd5VaFhqpuxbRS9CePnM/hNLm+q1xsCeTbZc+GdV2JU6eJAPslaJ
 AeXYrfTLG/VNwPXGcKKfNEKdIHMHWcIpRQ808mRMWVJtS4rTd8dD7aVRv
 9skkMv9BjIqu67TFcWyD/MKwr+nBputM5nyMHfl5oStw5GQtnGAI4fYTW
 41tPdcqjI/VSvnuR55uP/qzZLxtssHVObFtHk1OBxQtKswauJNERXVuGr g==;
X-CSE-ConnectionGUID: simZslzZRzywBor5/0H7qA==
X-CSE-MsgGUID: ppTD+iUXTu+rducazPlTBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22307779"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="22307779"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 08:34:00 -0700
X-CSE-ConnectionGUID: 2yHXiCO3Sn2nbxF+GqssTw==
X-CSE-MsgGUID: 35b2P5UiTBq/3raUU0MCqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="65087214"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.81])
 ([10.245.246.81])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 08:33:56 -0700
Message-ID: <636cd45d-e9fa-487b-a0c2-486573a1eb58@intel.com>
Date: Mon, 19 Aug 2024 17:33:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 04/14] lib/xe_eudebug: Introduce eu debug testing
 framework
To: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Patelczyk, Maciej" <maciej.patelczyk@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "karolina.stolarek@intel.com" <karolina.stolarek@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "mika.kuaoppala@linux.intel.com" <mika.kuaoppala@linux.intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>
References: <20240809123813.109365-1-christoph.manszewski@intel.com>
 <20240809123813.109365-5-christoph.manszewski@intel.com>
 <7b486d72c81225e6f747f99636f908f3503a3578.camel@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <7b486d72c81225e6f747f99636f908f3503a3578.camel@intel.com>
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

Hi Dominik,

On 19.08.2024 10:30, Grzegorzek, Dominik wrote:
> On Fri, 2024-08-09 at 14:38 +0200, Christoph Manszewski wrote:
>> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>>
>> Introduce library which simplifies testing of eu debug capability.
>> The library provides event log helpers together with asynchronous
>> abstraction for client proccess and the debugger itself.
>>
>> xe_eudebug_client creates its own proccess with user's work function,
>> and gives machanisms to synchronize beginning of execution and event
>> logging.
>>
>> xe_eudebug_debugger allows to attach to the given proccess, provides
>> asynchronous thread for event reading and introduces triggers -
>> a callback mechanism triggered every time subscribed event was read.
>>
>> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>> Signed-off-by: Mika Kuoppala <mika.kuaoppala@linux.intel.com>
>> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
>> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
>> Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>> ---
>>   lib/meson.build     |    1 +
>>   lib/xe/xe_eudebug.c | 2192 +++++++++++++++++++++++++++++++++++++++++++
>>   lib/xe/xe_eudebug.h |  206 ++++
>>   3 files changed, 2399 insertions(+)
>>   create mode 100644 lib/xe/xe_eudebug.c
>>   create mode 100644 lib/xe/xe_eudebug.h
>>
>> diff --git a/lib/meson.build b/lib/meson.build
>> index f711e60a7..969ca4101 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -111,6 +111,7 @@ lib_sources = [
>>   	'igt_msm.c',
>>   	'igt_dsc.c',
>>   	'xe/xe_gt.c',
>> +	'xe/xe_eudebug.c',
>>   	'xe/xe_ioctl.c',
>>   	'xe/xe_mmio.c',
>>   	'xe/xe_query.c',
>> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
>> new file mode 100644
>> index 000000000..4eac87476
>> --- /dev/null
>> +++ b/lib/xe/xe_eudebug.c
>> @@ -0,0 +1,2192 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <fcntl.h>
>> +#include <poll.h>
>> +#include <signal.h>
>> +#include <sys/select.h>
>> +#include <sys/stat.h>
>> +#include <sys/types.h>
>> +#include <sys/wait.h>
>> +
>> +#include "igt.h"
>> +#include "igt_sysfs.h"
>> +#include "intel_pat.h"
>> +#include "xe_eudebug.h"
>> +#include "xe_ioctl.h"
>> +
>> +struct event_trigger {
>> +	xe_eudebug_trigger_fn fn;
>> +	int type;
>> +	struct igt_list_head link;
>> +};
>> +
>> +struct seqno_list_entry {
>> +	struct igt_list_head link;
>> +	uint64_t seqno;
>> +};
>> +
>> +struct match_dto {
>> +	struct drm_xe_eudebug_event *target;
>> +	struct igt_list_head *seqno_list;
>> +	uint64_t client_handle;
>> +	uint32_t filter;
>> +
>> +	/* store latest 'EVENT_VM_BIND' seqno */
>> +	uint64_t *bind_seqno;
>> +	/* latest vm_bind_op seqno matching bind_seqno */
>> +	uint64_t *bind_op_seqno;
>> +};
>> +
>> +#define CLIENT_PID  1
>> +#define CLIENT_RUN  2
>> +#define CLIENT_FINI 3
>> +#define CLIENT_STOP 4
>> +#define CLIENT_STAGE 5
>> +#define DEBUGGER_STAGE 6
>> +
>> +#define DEBUGGER_WORKER_INACTIVE  0
>> +#define DEBUGGER_WORKER_ACTIVE  1
>> +#define DEBUGGER_WORKER_QUITTING 2
>> +
>> +static const char *type_to_str(unsigned int type)
>> +{
>> +	switch (type) {
>> +	case DRM_XE_EUDEBUG_EVENT_NONE:
>> +		return "none";
>> +	case DRM_XE_EUDEBUG_EVENT_READ:
>> +		return "read";
>> +	case DRM_XE_EUDEBUG_EVENT_OPEN:
>> +		return "client";
>> +	case DRM_XE_EUDEBUG_EVENT_VM:
>> +		return "vm";
>> +	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE:
>> +		return "exec_queue";
>> +	case DRM_XE_EUDEBUG_EVENT_EU_ATTENTION:
>> +		return "attention";
>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND:
>> +		return "vm_bind";
>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP:
>> +		return "vm_bind_op";
>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE:
>> +		return "vm_bind_ufence";
>> +	case DRM_XE_EUDEBUG_EVENT_METADATA:
>> +		return "metadata";
>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA:
>> +		return "vm_bind_op_metadata";
>> +	}
>> +
>> +	return "UNKNOWN";
>> +}
>> +
>> +static const char *event_type_to_str(struct drm_xe_eudebug_event *e, char *buf)
>> +{
>> +	sprintf(buf, "%s(%d)", type_to_str(e->type), e->type);
>> +
>> +	return buf;
>> +}
>> +
>> +static const char *flags_to_str(unsigned int flags)
>> +{
>> +	if (flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
>> +		if (flags & DRM_XE_EUDEBUG_EVENT_NEED_ACK)
>> +			return "create|ack";
>> +		else
>> +			return "create";
>> +	}
>> +	if (flags & DRM_XE_EUDEBUG_EVENT_DESTROY)
>> +		return "destroy";
>> +
>> +	if (flags & DRM_XE_EUDEBUG_EVENT_STATE_CHANGE)
>> +		return "state-change";
>> +
>> +	igt_assert(!(flags & DRM_XE_EUDEBUG_EVENT_NEED_ACK));
>> +
>> +	return "flags unknown";
>> +}
>> +
>> +static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *b)
>> +{
>> +	switch (e->type) {
>> +	case DRM_XE_EUDEBUG_EVENT_OPEN: {
>> +		struct drm_xe_eudebug_event_client *ec = (struct drm_xe_eudebug_event_client *)e;
>> +
>> +		sprintf(b, "handle=%llu", ec->client_handle);
>> +		break;
>> +	}
>> +	case DRM_XE_EUDEBUG_EVENT_VM: {
>> +		struct drm_xe_eudebug_event_vm *evm = (struct drm_xe_eudebug_event_vm *)e;
>> +
>> +		sprintf(b, "client_handle=%llu, handle=%llu",
>> +			evm->client_handle, evm->vm_handle);
>> +		break;
>> +	}
>> +	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE: {
>> +		struct drm_xe_eudebug_event_exec_queue *ee = (void *)e;
>> +
>> +		sprintf(b, "client_handle=%llu, vm_handle=%llu, "
>> +			   "exec_queue_handle=%llu, engine_class=%d, exec_queue_width=%d",
>> +			ee->client_handle, ee->vm_handle,
>> +			ee->exec_queue_handle, ee->engine_class, ee->width);
>> +		break;
>> +	}
>> +	case DRM_XE_EUDEBUG_EVENT_EU_ATTENTION: {
>> +		struct drm_xe_eudebug_event_eu_attention *ea = (void *)e;
>> +
>> +		sprintf(b, "client_handle=%llu, exec_queue_handle=%llu, "
>> +			   "lrc_handle=%llu, bitmask_size=%d",
>> +			ea->client_handle, ea->exec_queue_handle,
>> +			ea->lrc_handle, ea->bitmask_size);
>> +		break;
>> +	}
>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
>> +		struct drm_xe_eudebug_event_vm_bind *evmb = (void *)e;
>> +
>> +		sprintf(b, "client_handle=%llu, vm_handle=%llu, flags=0x%x, num_binds=%u",
>> +			evmb->client_handle, evmb->vm_handle, evmb->flags, evmb->num_binds);
>> +		break;
>> +	}
>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP: {
>> +		struct drm_xe_eudebug_event_vm_bind_op *op = (void *)e;
>> +
>> +		sprintf(b, "vm_bind_ref_seqno=%lld, addr=%016llx, range=%llu num_extensions=%llu",
>> +			op->vm_bind_ref_seqno, op->addr, op->range, op->num_extensions);
>> +		break;
>> +	}
>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE: {
>> +		struct drm_xe_eudebug_event_vm_bind_ufence *f = (void *)e;
>> +
>> +		sprintf(b, "vm_bind_ref_seqno=%lld", f->vm_bind_ref_seqno);
>> +		break;
>> +	}
>> +	case DRM_XE_EUDEBUG_EVENT_METADATA: {
>> +		struct drm_xe_eudebug_event_metadata *em = (void *)e;
>> +
>> +		sprintf(b, "client_handle=%llu, metadata_handle=%llu, type=%llu, len=%llu",
>> +			em->client_handle, em->metadata_handle, em->type, em->len);
>> +		break;
>> +	}
>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA: {
>> +		struct drm_xe_eudebug_event_vm_bind_op_metadata *op = (void *)e;
>> +
>> +		sprintf(b, "vm_bind_op_ref_seqno=%lld, metadata_handle=%llu, metadata_cookie=%llu",
>> +			op->vm_bind_op_ref_seqno, op->metadata_handle, op->metadata_cookie);
>> +		break;
>> +	}
>> +	default:
>> +		strcpy(b, "<...>");
>> +	}
>> +
>> +	return b;
>> +}
>> +
>> +/**
>> + * xe_eudebug_event_to_str:
>> + * @e: pointer to event
>> + * @buf: target to write string representation of @e
>> + * @len: size of target buffer @buf
>> + *
>> + * Creates string representation for given event.
>> + *
>> + * Returns: the written input buffer pointed by @buf.
>> + */
>> +const char *xe_eudebug_event_to_str(struct drm_xe_eudebug_event *e, char *buf, size_t len)
>> +{
>> +	char a[256];
>> +	char b[256];
>> +
>> +	snprintf(buf, len, "(%llu) %15s:%s: %s",
>> +		 e->seqno,
>> +		 event_type_to_str(e, a),
>> +		 flags_to_str(e->flags),
>> +		 event_members_to_str(e, b));
>> +
>> +	return buf;
>> +}
>> +
>> +static void catch_child_failure(void)
>> +{
>> +	pid_t pid;
>> +	int status;
>> +
>> +	pid = waitpid(-1, &status, WNOHANG);
>> +
>> +	if (pid == 0 || pid == -1)
>> +		return;
>> +
>> +	if (!WIFEXITED(status))
>> +		return;
>> +
>> +	igt_assert_f(WEXITSTATUS(status) == 0, "Client failed!\n");
>> +}
>> +
>> +static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)
>> +{
>> +	int ret;
>> +	int t = 0;
>> +	struct pollfd fd = {
>> +		.fd = pipe[0],
>> +		.events = POLLIN,
>> +		.revents = 0
>> +	};
>> +
>> +	/* When child fails we may get stuck forever. Check whether
>> +	 * the child process ended with an error.
>> +	 */
>> +	do {
>> +		const int interval_ms = 1000;
>> +
>> +		ret = poll(&fd, 1, interval_ms);
>> +
>> +		if (!ret) {
>> +			catch_child_failure();
>> +			t += interval_ms;
>> +		}
>> +	} while (!ret && t < timeout_ms);
>> +
>> +	if (ret > 0)
>> +		return read(pipe[0], buf, nbytes);
>> +
>> +	return 0;
>> +}
>> +
>> +static uint64_t pipe_read(int pipe[2], int timeout_ms)
>> +{
>> +	uint64_t in;
>> +	uint64_t ret;
>> +
>> +	ret = safe_pipe_read(pipe, &in, sizeof(in), timeout_ms);
>> +	igt_assert(ret == sizeof(in));
>> +
>> +	return in;
>> +}
>> +
>> +static void pipe_signal(int pipe[2], uint64_t token)
>> +{
>> +	igt_assert(write(pipe[1], &token, sizeof(token)) == sizeof(token));
>> +}
>> +
>> +static void pipe_close(int pipe[2])
>> +{
>> +	if (pipe[0] != -1)
>> +		close(pipe[0]);
>> +
>> +	if (pipe[1] != -1)
>> +		close(pipe[1]);
>> +}
>> +
>> +static uint64_t __wait_token(int p[2], const uint64_t token, int timeout_ms)
>> +{
>> +	uint64_t in;
>> +
>> +	in = pipe_read(p, timeout_ms);
>> +
>> +	igt_assert_eq(in, token);
>> +
>> +	return pipe_read(p, timeout_ms);
>> +}
>> +
>> +static uint64_t client_wait_token(struct xe_eudebug_client *c,
>> +				 const uint64_t token)
>> +{
>> +	return __wait_token(c->p_in, token, c->timeout_ms);
>> +}
>> +
>> +static uint64_t wait_from_client(struct xe_eudebug_client *c,
>> +				 const uint64_t token)
>> +{
>> +	return __wait_token(c->p_out, token, c->timeout_ms);
>> +}
>> +
>> +static void token_signal(int p[2], const uint64_t token, const uint64_t value)
>> +{
>> +	pipe_signal(p, token);
>> +	pipe_signal(p, value);
>> +}
>> +
>> +static void client_signal(struct xe_eudebug_client *c,
>> +			  const uint64_t token,
>> +			  const uint64_t value)
>> +{
>> +	token_signal(c->p_out, token, value);
>> +}
>> +
>> +static int __xe_eudebug_connect(int fd, pid_t pid, uint32_t flags, uint64_t events)
>> +{
>> +	struct drm_xe_eudebug_connect param = {
>> +		.pid = pid,
>> +		.flags = flags,
>> +	};
>> +	int debugfd;
>> +
>> +	debugfd = igt_ioctl(fd, DRM_IOCTL_XE_EUDEBUG_CONNECT, &param);
>> +
>> +	if (debugfd < 0)
>> +		return -errno;
>> +
>> +	return debugfd;
>> +}
>> +
>> +static void event_log_write_to_fd(struct xe_eudebug_event_log *l, int fd)
>> +{
>> +	igt_assert_eq(write(fd, &l->head, sizeof(l->head)),
>> +		      sizeof(l->head));
>> +
>> +	igt_assert_eq(write(fd, l->log, l->head), l->head);
>> +}
>> +
>> +static void read_all(int fd, void *buf, size_t nbytes)
>> +{
>> +	ssize_t remaining_size = nbytes;
>> +	ssize_t current_size = 0;
>> +	ssize_t read_size = 0;
>> +
>> +	do {
>> +		read_size = read(fd, buf + current_size, remaining_size);
>> +		igt_assert_f(read_size >= 0, "read failed: %s\n", strerror(errno));
>> +
>> +		current_size += read_size;
>> +		remaining_size -= read_size;
>> +	} while (remaining_size > 0 && read_size > 0);
>> +
>> +	igt_assert_eq(current_size, nbytes);
>> +}
>> +
>> +static void event_log_read_from_fd(struct xe_eudebug_event_log *l, int fd)
>> +{
>> +	read_all(fd, &l->head, sizeof(l->head));
>> +	igt_assert_lt(l->head, l->max_size);
>> +
>> +	read_all(fd, l->log, l->head);
>> +}
>> +
>> +typedef int (*cmp_fn_t)(struct drm_xe_eudebug_event *, void *);
>> +
>> +static struct drm_xe_eudebug_event *
>> +event_cmp(struct xe_eudebug_event_log *l,
>> +	  struct drm_xe_eudebug_event *current,
>> +	  cmp_fn_t match,
>> +	  void *data)
>> +{
>> +	struct drm_xe_eudebug_event *e = current;
>> +
>> +	xe_eudebug_for_each_event(e, l) {
>> +		if (match(e, data))
>> +			return e;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static int match_type_and_flags(struct drm_xe_eudebug_event *a, void *data)
>> +{
>> +	struct drm_xe_eudebug_event *b = data;
>> +
>> +	if (a->type == b->type &&
>> +	    a->flags == b->flags)
>> +		return 1;
>> +
>> +	return 0;
>> +}
>> +
>> +static int match_fields(struct drm_xe_eudebug_event *a, void *data)
>> +{
>> +	struct drm_xe_eudebug_event *b = data;
>> +	int ret = 0;
>> +
>> +	ret = match_type_and_flags(a, data);
>> +	if (!ret)
>> +		return ret;
>> +
>> +	ret = 0;
>> +
>> +	switch (a->type) {
>> +	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE: {
>> +		struct drm_xe_eudebug_event_exec_queue *ae = (void *)a;
>> +		struct drm_xe_eudebug_event_exec_queue *be = (void *)b;
>> +
>> +		if (ae->engine_class == be->engine_class && ae->width == be->width)
>> +			ret = 1;
>> +		break;
>> +	}
>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
>> +		struct drm_xe_eudebug_event_vm_bind *ea = (void *)a;
>> +		struct drm_xe_eudebug_event_vm_bind *eb = (void *)b;
>> +
>> +		if (ea->num_binds == eb->num_binds)
>> +			ret = 1;
>> +		break;
>> +	}
>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP: {
>> +		struct drm_xe_eudebug_event_vm_bind_op *ea = (void *)a;
>> +		struct drm_xe_eudebug_event_vm_bind_op *eb = (void *)b;
>> +
>> +		if (ea->addr == eb->addr && ea->range == eb->range &&
>> +		    ea->num_extensions == eb->num_extensions)
>> +			ret = 1;
>> +		break;
>> +	}
>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA: {
>> +		struct drm_xe_eudebug_event_vm_bind_op_metadata *ea = (void *)a;
>> +		struct drm_xe_eudebug_event_vm_bind_op_metadata *eb = (void *)b;
>> +
>> +		if (ea->metadata_handle == eb->metadata_handle &&
>> +		    ea->metadata_cookie == eb->metadata_cookie)
>> +			ret = 1;
>> +		break;
>> +	}
>> +
>> +	default:
>> +		ret = 1;
>> +		break;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int match_client_handle(struct drm_xe_eudebug_event *e, void *data)
>> +{
>> +	struct match_dto *md = (void *)data;
>> +	uint64_t *bind_seqno = md->bind_seqno;
>> +	uint64_t *bind_op_seqno = md->bind_op_seqno;
>> +	uint64_t h = md->client_handle;
>> +
>> +	if (XE_EUDEBUG_EVENT_IS_FILTERED(e->type, md->filter))
>> +		return 0;
>> +
>> +	switch (e->type) {
>> +	case DRM_XE_EUDEBUG_EVENT_OPEN: {
>> +		struct drm_xe_eudebug_event_client *client = (struct drm_xe_eudebug_event_client *)e;
>> +
>> +		if (client->client_handle == h)
>> +			return 1;
>> +		break;
>> +	}
>> +	case DRM_XE_EUDEBUG_EVENT_VM: {
>> +		struct drm_xe_eudebug_event_vm *vm = (struct drm_xe_eudebug_event_vm *)e;
>> +
>> +		if (vm->client_handle == h)
>> +			return 1;
>> +		break;
>> +	}
>> +	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE: {
>> +		struct drm_xe_eudebug_event_exec_queue *ee = (struct drm_xe_eudebug_event_exec_queue *)e;
>> +
>> +		if (ee->client_handle == h)
>> +			return 1;
>> +		break;
>> +	}
>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
>> +		struct drm_xe_eudebug_event_vm_bind *evmb = (struct drm_xe_eudebug_event_vm_bind *)e;
>> +
>> +		if (evmb->client_handle == h) {
>> +			*bind_seqno = evmb->base.seqno;
>> +			return 1;
>> +		}
>> +		break;
>> +	}
>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP: {
>> +		struct drm_xe_eudebug_event_vm_bind_op *eo = (struct drm_xe_eudebug_event_vm_bind_op *)e;
>> +
>> +		if (eo->vm_bind_ref_seqno == *bind_seqno) {
>> +			*bind_op_seqno = eo->base.seqno;
>> +			return 1;
>> +		}
>> +		break;
>> +	}
>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE: {
>> +		struct drm_xe_eudebug_event_vm_bind_ufence *ef  = (struct drm_xe_eudebug_event_vm_bind_ufence *)e;
>> +
>> +		if (ef->vm_bind_ref_seqno == *bind_seqno)
>> +			return 1;
>> +
>> +		break;
>> +	}
>> +	case DRM_XE_EUDEBUG_EVENT_METADATA: {
>> +		struct drm_xe_eudebug_event_metadata *em = (struct drm_xe_eudebug_event_metadata *)e;
>> +
>> +		if (em->client_handle == h)
>> +			return 1;
>> +		break;
>> +	}
>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA: {
>> +		struct drm_xe_eudebug_event_vm_bind_op_metadata *eo = (struct drm_xe_eudebug_event_vm_bind_op_metadata *)e;
>> +
>> +		if (eo->vm_bind_op_ref_seqno == *bind_op_seqno)
>> +			return 1;
>> +		break;
>> +	}
>> +	default:
>> +		break;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int match_opposite_resource(struct drm_xe_eudebug_event *e, void *data)
>> +{
>> +
>> +	struct drm_xe_eudebug_event *d = (void *)data;
>> +	int ret;
>> +
>> +	d->flags ^= DRM_XE_EUDEBUG_EVENT_CREATE | DRM_XE_EUDEBUG_EVENT_DESTROY;
>> +	d->flags &= ~(DRM_XE_EUDEBUG_EVENT_NEED_ACK);
>> +	ret = match_type_and_flags(e, data);
>> +	d->flags ^= DRM_XE_EUDEBUG_EVENT_CREATE | DRM_XE_EUDEBUG_EVENT_DESTROY;
>> +
>> +	if (!ret)
>> +		return 0;
>> +
>> +	switch (e->type) {
>> +	case DRM_XE_EUDEBUG_EVENT_OPEN: {
>> +		struct drm_xe_eudebug_event_client *client = (struct drm_xe_eudebug_event_client *)e;
>> +		struct drm_xe_eudebug_event_client *filter = (struct drm_xe_eudebug_event_client *)data;
>> +
>> +		if (client->client_handle == filter->client_handle)
>> +			return 1;
>> +		break;
>> +	}
>> +	case DRM_XE_EUDEBUG_EVENT_VM: {
>> +		struct drm_xe_eudebug_event_vm *vm = (struct drm_xe_eudebug_event_vm *)e;
>> +		struct drm_xe_eudebug_event_vm *filter = (struct drm_xe_eudebug_event_vm *)data;
>> +
>> +		if (vm->vm_handle == filter->vm_handle)
>> +			return 1;
>> +		break;
>> +	}
>> +	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE: {
>> +		struct drm_xe_eudebug_event_exec_queue *ee = (void *)e;
>> +		struct drm_xe_eudebug_event_exec_queue *filter = (struct drm_xe_eudebug_event_exec_queue *)data;
>> +
>> +		if (ee->exec_queue_handle == filter->exec_queue_handle)
>> +			return 1;
>> +		break;
>> +	}
>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
>> +		struct drm_xe_eudebug_event_vm_bind *evmb = (void *)e;
>> +		struct drm_xe_eudebug_event_vm_bind *filter = (struct drm_xe_eudebug_event_vm_bind *)data;
>> +
>> +		if (evmb->vm_handle == filter->vm_handle &&
>> +		    evmb->num_binds == filter->num_binds)
>> +			return 1;
>> +		break;
>> +	}
>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP: {
>> +		struct drm_xe_eudebug_event_vm_bind_op *avmb = (void *)e;
>> +		struct drm_xe_eudebug_event_vm_bind_op *filter = (struct drm_xe_eudebug_event_vm_bind_op *)data;
>> +
>> +		if (avmb->addr == filter->addr &&
>> +		    avmb->range == filter->range)
>> +			return 1;
>> +		break;
>> +	}
>> +	case DRM_XE_EUDEBUG_EVENT_METADATA: {
>> +		struct drm_xe_eudebug_event_metadata *em = (void *)e;
>> +		struct drm_xe_eudebug_event_metadata *filter = (struct drm_xe_eudebug_event_metadata *)data;
>> +
>> +		if (em->metadata_handle == filter->metadata_handle)
>> +			return 1;
>> +		break;
>> +	}
>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA: {
>> +		struct drm_xe_eudebug_event_vm_bind_op_metadata *avmb = (void *)e;
>> +		struct drm_xe_eudebug_event_vm_bind_op_metadata *filter = (struct drm_xe_eudebug_event_vm_bind_op_metadata *)data;
>> +
>> +		if (avmb->metadata_handle == filter->metadata_handle &&
>> +		    avmb->metadata_cookie == filter->metadata_cookie)
>> +			return 1;
>> +		break;
>> +	}
>> +
>> +	default:
>> +		break;
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int match_full(struct drm_xe_eudebug_event *e, void *data)
>> +{
>> +	struct seqno_list_entry *sl;
>> +
>> +	struct match_dto *md = (void *)data;
>> +	int ret = 0;
>> +
>> +	ret = match_client_handle(e, md);
>> +	if (!ret)
>> +		return 0;
>> +
>> +	ret = match_fields(e, md->target);
>> +	if (!ret)
>> +		return 0;
>> +
>> +	igt_list_for_each_entry(sl, md->seqno_list, link) {
>> +		if (sl->seqno == e->seqno)
>> +			return 0;
>> +	}
>> +
>> +	return 1;
>> +}
>> +
>> +static struct drm_xe_eudebug_event *
>> +event_type_match(struct xe_eudebug_event_log *l,
>> +		 struct drm_xe_eudebug_event *target,
>> +		 struct drm_xe_eudebug_event *current)
>> +{
>> +	return event_cmp(l, current, match_type_and_flags, target);
>> +}
>> +
>> +static struct drm_xe_eudebug_event *
>> +client_match(struct xe_eudebug_event_log *l,
>> +	     uint64_t client_handle,
>> +	     struct drm_xe_eudebug_event *current,
>> +	     uint32_t filter,
>> +	     uint64_t *bind_seqno,
>> +	     uint64_t *bind_op_seqno)
>> +{
>> +	struct match_dto md = {
>> +		.client_handle = client_handle,
>> +		.filter = filter,
>> +		.bind_seqno = bind_seqno,
>> +		.bind_op_seqno = bind_op_seqno,
>> +	};
>> +
>> +	return event_cmp(l, current, match_client_handle, &md);
>> +}
>> +
>> +static struct drm_xe_eudebug_event *
>> +opposite_event_match(struct xe_eudebug_event_log *l,
>> +		    struct drm_xe_eudebug_event *target,
>> +		    struct drm_xe_eudebug_event *current)
>> +{
>> +	return event_cmp(l, current, match_opposite_resource, target);
>> +}
>> +
>> +static struct drm_xe_eudebug_event *
>> +event_match(struct xe_eudebug_event_log *l,
>> +	    struct drm_xe_eudebug_event *target,
>> +	    uint64_t client_handle,
>> +	    struct igt_list_head *seqno_list,
>> +	    uint64_t *bind_seqno,
>> +	    uint64_t *bind_op_seqno)
>> +{
>> +	struct match_dto md = {
>> +		.target = target,
>> +		.client_handle = client_handle,
>> +		.seqno_list = seqno_list,
>> +		.bind_seqno = bind_seqno,
>> +		.bind_op_seqno = bind_op_seqno,
>> +	};
>> +
>> +	return event_cmp(l, NULL, match_full, &md);
>> +}
>> +
>> +static void compare_client(struct xe_eudebug_event_log *c, struct drm_xe_eudebug_event *_ce,
>> +			   struct xe_eudebug_event_log *d, struct drm_xe_eudebug_event *_de,
>> +			   uint32_t filter)
>> +{
>> +	struct drm_xe_eudebug_event_client *ce = (void *)_ce;
>> +	struct drm_xe_eudebug_event_client *de = (void *)_de;
>> +	uint64_t cbs = 0, dbs = 0, cbso = 0, dbso = 0;
>> +
>> +	struct igt_list_head matched_seqno_list;
>> +	struct drm_xe_eudebug_event *hc, *hd;
>> +	struct seqno_list_entry *entry, *tmp;
>> +
>> +	igt_assert(ce);
>> +	igt_assert(de);
>> +
>> +	igt_debug("client: %llu -> %llu\n", ce->client_handle, de->client_handle);
>> +
>> +	hc = NULL;
>> +	hd = NULL;
>> +	IGT_INIT_LIST_HEAD(&matched_seqno_list);
>> +
>> +	do {
>> +		hc = client_match(c, ce->client_handle, hc, filter, &cbs, &cbso);
>> +		if (!hc)
>> +			break;
>> +
>> +		hd = event_match(d, hc, de->client_handle, &matched_seqno_list, &dbs, &dbso);
>> +
>> +		igt_assert_f(hd, "%s (%llu): no matching event type %u found for client %llu\n",
>> +			     c->name,
>> +			     hc->seqno,
>> +			     hc->type,
>> +			     ce->client_handle);
>> +
>> +		igt_debug("comparing %s %llu vs %s %llu\n",
>> +			  c->name, hc->seqno, d->name, hd->seqno);
>> +
>> +		/*
>> +		 * Store the seqno of the event that was matched above,
>> +		 * inside 'matched_seqno_list', to avoid it getting matched
>> +		 * by subsequent 'event_match' calls.
>> +		 */
>> +		entry = malloc(sizeof(*entry));
>> +		entry->seqno = hd->seqno;
>> +		igt_list_add(&entry->link, &matched_seqno_list);
>> +	} while (hc);
>> +
>> +	igt_list_for_each_entry_safe(entry, tmp, &matched_seqno_list, link)
>> +		free(entry);
>> +}
>> +
>> +/**
>> + * xe_eudebug_event_log_find_seqno:
>> + * @l: event log pointer
>> + * @seqno: seqno of event to be found
>> + *
>> + * Finds the event with given seqno in the event log.
>> + *
>> + * Returns: pointer to the event with given seqno within @l or NULL seqno is
>> + * not present.
>> + */
>> +struct drm_xe_eudebug_event *
>> +xe_eudebug_event_log_find_seqno(struct xe_eudebug_event_log *l, uint64_t seqno)
>> +{
>> +	struct drm_xe_eudebug_event *e = NULL, *found = NULL;
>> +
>> +	igt_assert_neq(seqno, 0);
>> +	/*
>> +	 * Try to catch if seqno is corrupted and prevent too long tests,
>> +	 * as our post processing of events is not optimized.
>> +	 */
>> +	igt_assert_lt(seqno, 10 * 1000 * 1000);
>> +
>> +	xe_eudebug_for_each_event(e, l) {
>> +		if (e->seqno == seqno) {
>> +			if (found) {
>> +				igt_warn("Found multiple events with the same seqno %lu\n", seqno);
>> +				xe_eudebug_event_log_print(l, false);
>> +				igt_assert(!found);
>> +			}
>> +			found = e;
>> +		}
>> +	}
>> +
>> +	return found;
>> +}
>> +
>> +static void event_log_sort(struct xe_eudebug_event_log *l)
>> +{
>> +	struct xe_eudebug_event_log *tmp;
>> +	struct drm_xe_eudebug_event *e = NULL;
>> +	uint64_t first_seqno = 0;
>> +	uint64_t last_seqno = 0;
>> +	uint64_t events = 0, added = 0;
>> +	uint64_t i;
>> +
>> +	xe_eudebug_for_each_event(e, l) {
>> +		if (e->seqno > last_seqno)
>> +			last_seqno = e->seqno;
>> +
>> +		if (e->seqno < first_seqno)
>> +			first_seqno = e->seqno;
>> +
>> +		events++;
>> +	}
>> +
>> +	tmp = xe_eudebug_event_log_create("tmp", l->max_size);
>> +
>> +	for (i = 1; i <= last_seqno; i++) {
>> +		e = xe_eudebug_event_log_find_seqno(l, i);
>> +		if (e) {
>> +			xe_eudebug_event_log_write(tmp, e);
>> +			added++;
>> +		}
>> +	}
>> +
>> +	igt_assert_eq(events, added);
>> +	igt_assert_eq(tmp->head, l->head);
>> +
>> +	memcpy(l->log, tmp->log, tmp->head);
>> +
>> +	xe_eudebug_event_log_destroy(tmp);
>> +}
>> +
>> +/**
>> + * xe_eudebug_connect:
>> + * @fd: Xe file descriptor
>> + * @pid: client PID
>> + * @flags: connection flags
>> + *
>> + * Opens the xe eu debugger connection to the process described by @pid
>> + *
>> + * Returns: 0 if the debugger was successfully attached, -errno otherwise.
>> + */
>> +int xe_eudebug_connect(int fd, pid_t pid, uint32_t flags)
>> +{
>> +	int ret;
>> +	uint64_t events = 0; /* events filtering not supported yet! */
>> +
>> +	ret = __xe_eudebug_connect(fd, pid, flags, events);
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * xe_eudebug_event_log_create:
>> + * @name: event log identifier
>> + * @max_size: maximum size of created log
>> + *
>> + * Function creates an Eu Debugger event log with size equal to @max_size.
>> + *
>> + * Returns: pointer to just created log
>> + */
>> +#define MAX_EVENT_LOG_SIZE (32 * 1024 * 1024)
>> +struct xe_eudebug_event_log *xe_eudebug_event_log_create(const char *name, unsigned int max_size)
>> +{
>> +	struct xe_eudebug_event_log *l;
>> +
>> +	l = calloc(1, sizeof(*l));
>> +	igt_assert(l);
>> +	l->log = calloc(1, max_size);
>> +	igt_assert(l->log);
>> +	l->max_size = max_size;
>> +	strncpy(l->name, name, sizeof(l->name) - 1);
>> +	pthread_mutex_init(&l->lock, NULL);
>> +
>> +	return l;
>> +}
>> +
>> +/**
>> + * xe_eudebug_event_log_destroy:
>> + * @l: event log pointer
>> + *
>> + * Frees given event log @l.
>> + */
>> +void xe_eudebug_event_log_destroy(struct xe_eudebug_event_log *l)
>> +{
>> +	pthread_mutex_destroy(&l->lock);
>> +	free(l->log);
>> +	free(l);
>> +}
>> +
>> +/**
>> + * xe_eudebug_event_log_write:
>> + * @l: event log pointer
>> + * @e: event to be written to event log
>> + *
>> + * Writes event @e to the event log, thread-safe.
>> + */
>> +void xe_eudebug_event_log_write(struct xe_eudebug_event_log *l, struct drm_xe_eudebug_event *e)
>> +{
>> +	igt_assert(e->seqno);
>> +	/*
>> +	 * Try to catch if seqno is corrupted and prevent too long tests,
>> +	 * as our post processing of events is not optimized.
>> +	 */
>> +	igt_assert_lt(e->seqno, 10 * 1000 * 1000);
>> +
>> +	pthread_mutex_lock(&l->lock);
>> +	igt_assert_lt(l->head + e->len, l->max_size);
>> +	memcpy(l->log + l->head, e, e->len);
>> +	l->head += e->len;
>> +
>> +#ifdef DEBUG_LOG
>> +	igt_info("%s: wrote %u bytes to eventlog, free %u bytes\n",
>> +		 l->name, e->len, l->max_size - l->head);
>> +#endif
>> +	pthread_mutex_unlock(&l->lock);
> I'm not fan of #ifdef debug logs. As the event log has been proven in action,
> can we just strip it out?

Sure, will do.

Thanks,
Christoph

> <cut>
> 
> Regards,
> Dominik
> 
