Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A7EC52D6F
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 07:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FADC10E45A;
	Wed, 21 Aug 2024 07:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YwY4vx9h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD2110E45A
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 07:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724223957; x=1755759957;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ztfjXtCnNd2y5+t6ueaTbzRsNlYe1gABCkDLc2O/n4I=;
 b=YwY4vx9hvQjCRGeRNKasq/cqMBan+ZZ+BzLgNSWF4KA5ocQ2HnGlAs4C
 vof4GyOtRzoJbw4cPr+x4fuPAK4xI8W6RtcMXJdh9uD9VGzQqKAAxe1q5
 cSjlB83/1DMwR5DmSWFGBBAGEGlvojFEW4V/hKZ/TbMxhtdLw72YurUqf
 QhzhRKyG9N63d9ZYqXLtpqZh47ph9Y8z0nUeFY0w7CsrYqZjK59YzcWb8
 /muvP6frQWBNRXXoAIOM7eRMy8Na/SXzlYTnOjP/BpTkZHEm9XXB2PBoP
 U8GP9vhtEuSdyPvKaNHMa50Uxpouor1/pX6vPycC/N6YYHSckKgaqZtsf Q==;
X-CSE-ConnectionGUID: NpJ+FXGuS7G732XlTopVfg==
X-CSE-MsgGUID: g9nszkGNRJ+2ObkQ1foSvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22535696"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22535696"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 00:05:56 -0700
X-CSE-ConnectionGUID: +eozA7INQjiE6QBVW/psIg==
X-CSE-MsgGUID: PxB/JapJQh2TRAKcryI4Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61028318"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.17])
 ([10.245.246.17])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 00:05:52 -0700
Message-ID: <dcd3fcfe-6901-482e-80c9-b06a4784caed@intel.com>
Date: Wed, 21 Aug 2024 09:05:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 04/14] lib/xe_eudebug: Introduce eu debug testing
 framework
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Mika Kuoppala <mika.kuaoppala@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
References: <20240809123813.109365-1-christoph.manszewski@intel.com>
 <20240809123813.109365-5-christoph.manszewski@intel.com>
 <20240820081446.3me2errug45y62h5@zkempczy-mobl2>
 <1be506bf-8e3e-4423-9ebc-38150bb99f2e@intel.com>
 <20240820174518.nrce2dvoqp6c7x6v@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240820174518.nrce2dvoqp6c7x6v@kamilkon-DESK.igk.intel.com>
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

Hi Kamil,

On 20.08.2024 19:45, Kamil Konieczny wrote:
> Hi Manszewski,,
> On 2024-08-20 at 18:14:07 +0200, Manszewski, Christoph wrote:
>> Hi Zbigniew,
>>
>> On 20.08.2024 10:14, Zbigniew Kempczyński wrote:
>>> On Fri, Aug 09, 2024 at 02:38:03PM +0200, Christoph Manszewski wrote:
>>>> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>>>>
>>>> Introduce library which simplifies testing of eu debug capability.
>>>> The library provides event log helpers together with asynchronous
>>>> abstraction for client proccess and the debugger itself.
>>>>
>>>> xe_eudebug_client creates its own proccess with user's work function,
>>>> and gives machanisms to synchronize beginning of execution and event
>>>> logging.
>>>>
>>>> xe_eudebug_debugger allows to attach to the given proccess, provides
>>>> asynchronous thread for event reading and introduces triggers -
>>>> a callback mechanism triggered every time subscribed event was read.
>>>>
>>>> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>>>> Signed-off-by: Mika Kuoppala <mika.kuaoppala@linux.intel.com>
>>>> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
>>>> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
>>>> Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
>>>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>>>> ---
>>>>    lib/meson.build     |    1 +
>>>>    lib/xe/xe_eudebug.c | 2192 +++++++++++++++++++++++++++++++++++++++++++
>>>>    lib/xe/xe_eudebug.h |  206 ++++
>>>>    3 files changed, 2399 insertions(+)
>>>>    create mode 100644 lib/xe/xe_eudebug.c
>>>>    create mode 100644 lib/xe/xe_eudebug.h
>>>>
>>>> diff --git a/lib/meson.build b/lib/meson.build
>>>> index f711e60a7..969ca4101 100644
>>>> --- a/lib/meson.build
>>>> +++ b/lib/meson.build
>>>> @@ -111,6 +111,7 @@ lib_sources = [
>>>>    	'igt_msm.c',
>>>>    	'igt_dsc.c',
>>>>    	'xe/xe_gt.c',
>>>> +	'xe/xe_eudebug.c',
>>>>    	'xe/xe_ioctl.c',
>>>>    	'xe/xe_mmio.c',
>>>>    	'xe/xe_query.c',
>>>
>>> As eudebug is quite big feature I think it should be separated and
>>> hidden behind a feature flag (check meson_options.txt), lets say
>>> 'xe_eudebug' which would be disabled by default. This way you can
>>> develop it upstream even if kernel side is not officially merged.
>>> I'm pragramatic and I see no reason to block not accepted feature
>>> especially this would imo speed up developement. A final step when
>>> kernel change would be accepted and merged would be to sync with
>>> uapi and remove local definitions.
>>>
>>> I look forward maintainers comments is my attitude acceptable.
>>
>> I agree that it is a good idea. The only problem that arises is for
>> 'xe_exec_sip'. We add a dependency on eudebug to this test - any ideas how
>> to approach this correctly? The only thing that comes to my mind is
>> conditional compilation with 'ifdef' statements but it doesn't appear to be
>> pretty.
> 
> What about adding skips in added tests if kernel do not support eudebug?

If the kernel doesn't support eudebug it skips already (see 
'xe_eudebug_enable' in the test fixtures).

Thanks,
Christoph
> 
> This way you can have it without conditional compilation with
> ifdef/meson and also have it compile-time tested (if CI support test-with
> for Xe kernels).
> 
> Regards,
> Kamil
> 
>>
>> Thanks,
>> Christoph
>>>
>>> --
>>> Zbigniew
>>>
>>>
>>>> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
>>>> new file mode 100644
>>>> index 000000000..4eac87476
>>>> --- /dev/null
>>>> +++ b/lib/xe/xe_eudebug.c
>>>> @@ -0,0 +1,2192 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright © 2023 Intel Corporation
>>>> + */
>>>> +
>>>> +#include <fcntl.h>
>>>> +#include <poll.h>
>>>> +#include <signal.h>
>>>> +#include <sys/select.h>
>>>> +#include <sys/stat.h>
>>>> +#include <sys/types.h>
>>>> +#include <sys/wait.h>
>>>> +
>>>> +#include "igt.h"
>>>> +#include "igt_sysfs.h"
>>>> +#include "intel_pat.h"
>>>> +#include "xe_eudebug.h"
>>>> +#include "xe_ioctl.h"
>>>> +
>>>> +struct event_trigger {
>>>> +	xe_eudebug_trigger_fn fn;
>>>> +	int type;
>>>> +	struct igt_list_head link;
>>>> +};
>>>> +
>>>> +struct seqno_list_entry {
>>>> +	struct igt_list_head link;
>>>> +	uint64_t seqno;
>>>> +};
>>>> +
>>>> +struct match_dto {
>>>> +	struct drm_xe_eudebug_event *target;
>>>> +	struct igt_list_head *seqno_list;
>>>> +	uint64_t client_handle;
>>>> +	uint32_t filter;
>>>> +
>>>> +	/* store latest 'EVENT_VM_BIND' seqno */
>>>> +	uint64_t *bind_seqno;
>>>> +	/* latest vm_bind_op seqno matching bind_seqno */
>>>> +	uint64_t *bind_op_seqno;
>>>> +};
>>>> +
>>>> +#define CLIENT_PID  1
>>>> +#define CLIENT_RUN  2
>>>> +#define CLIENT_FINI 3
>>>> +#define CLIENT_STOP 4
>>>> +#define CLIENT_STAGE 5
>>>> +#define DEBUGGER_STAGE 6
>>>> +
>>>> +#define DEBUGGER_WORKER_INACTIVE  0
>>>> +#define DEBUGGER_WORKER_ACTIVE  1
>>>> +#define DEBUGGER_WORKER_QUITTING 2
>>>> +
>>>> +static const char *type_to_str(unsigned int type)
>>>> +{
>>>> +	switch (type) {
>>>> +	case DRM_XE_EUDEBUG_EVENT_NONE:
>>>> +		return "none";
>>>> +	case DRM_XE_EUDEBUG_EVENT_READ:
>>>> +		return "read";
>>>> +	case DRM_XE_EUDEBUG_EVENT_OPEN:
>>>> +		return "client";
>>>> +	case DRM_XE_EUDEBUG_EVENT_VM:
>>>> +		return "vm";
>>>> +	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE:
>>>> +		return "exec_queue";
>>>> +	case DRM_XE_EUDEBUG_EVENT_EU_ATTENTION:
>>>> +		return "attention";
>>>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND:
>>>> +		return "vm_bind";
>>>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP:
>>>> +		return "vm_bind_op";
>>>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE:
>>>> +		return "vm_bind_ufence";
>>>> +	case DRM_XE_EUDEBUG_EVENT_METADATA:
>>>> +		return "metadata";
>>>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA:
>>>> +		return "vm_bind_op_metadata";
>>>> +	}
>>>> +
>>>> +	return "UNKNOWN";
>>>> +}
>>>> +
>>>> +static const char *event_type_to_str(struct drm_xe_eudebug_event *e, char *buf)
>>>> +{
>>>> +	sprintf(buf, "%s(%d)", type_to_str(e->type), e->type);
>>>> +
>>>> +	return buf;
>>>> +}
>>>> +
>>>> +static const char *flags_to_str(unsigned int flags)
>>>> +{
>>>> +	if (flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
>>>> +		if (flags & DRM_XE_EUDEBUG_EVENT_NEED_ACK)
>>>> +			return "create|ack";
>>>> +		else
>>>> +			return "create";
>>>> +	}
>>>> +	if (flags & DRM_XE_EUDEBUG_EVENT_DESTROY)
>>>> +		return "destroy";
>>>> +
>>>> +	if (flags & DRM_XE_EUDEBUG_EVENT_STATE_CHANGE)
>>>> +		return "state-change";
>>>> +
>>>> +	igt_assert(!(flags & DRM_XE_EUDEBUG_EVENT_NEED_ACK));
>>>> +
>>>> +	return "flags unknown";
>>>> +}
>>>> +
>>>> +static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *b)
>>>> +{
>>>> +	switch (e->type) {
>>>> +	case DRM_XE_EUDEBUG_EVENT_OPEN: {
>>>> +		struct drm_xe_eudebug_event_client *ec = (struct drm_xe_eudebug_event_client *)e;
>>>> +
>>>> +		sprintf(b, "handle=%llu", ec->client_handle);
>>>> +		break;
>>>> +	}
>>>> +	case DRM_XE_EUDEBUG_EVENT_VM: {
>>>> +		struct drm_xe_eudebug_event_vm *evm = (struct drm_xe_eudebug_event_vm *)e;
>>>> +
>>>> +		sprintf(b, "client_handle=%llu, handle=%llu",
>>>> +			evm->client_handle, evm->vm_handle);
>>>> +		break;
>>>> +	}
>>>> +	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE: {
>>>> +		struct drm_xe_eudebug_event_exec_queue *ee = (void *)e;
>>>> +
>>>> +		sprintf(b, "client_handle=%llu, vm_handle=%llu, "
>>>> +			   "exec_queue_handle=%llu, engine_class=%d, exec_queue_width=%d",
>>>> +			ee->client_handle, ee->vm_handle,
>>>> +			ee->exec_queue_handle, ee->engine_class, ee->width);
>>>> +		break;
>>>> +	}
>>>> +	case DRM_XE_EUDEBUG_EVENT_EU_ATTENTION: {
>>>> +		struct drm_xe_eudebug_event_eu_attention *ea = (void *)e;
>>>> +
>>>> +		sprintf(b, "client_handle=%llu, exec_queue_handle=%llu, "
>>>> +			   "lrc_handle=%llu, bitmask_size=%d",
>>>> +			ea->client_handle, ea->exec_queue_handle,
>>>> +			ea->lrc_handle, ea->bitmask_size);
>>>> +		break;
>>>> +	}
>>>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
>>>> +		struct drm_xe_eudebug_event_vm_bind *evmb = (void *)e;
>>>> +
>>>> +		sprintf(b, "client_handle=%llu, vm_handle=%llu, flags=0x%x, num_binds=%u",
>>>> +			evmb->client_handle, evmb->vm_handle, evmb->flags, evmb->num_binds);
>>>> +		break;
>>>> +	}
>>>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP: {
>>>> +		struct drm_xe_eudebug_event_vm_bind_op *op = (void *)e;
>>>> +
>>>> +		sprintf(b, "vm_bind_ref_seqno=%lld, addr=%016llx, range=%llu num_extensions=%llu",
>>>> +			op->vm_bind_ref_seqno, op->addr, op->range, op->num_extensions);
>>>> +		break;
>>>> +	}
>>>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE: {
>>>> +		struct drm_xe_eudebug_event_vm_bind_ufence *f = (void *)e;
>>>> +
>>>> +		sprintf(b, "vm_bind_ref_seqno=%lld", f->vm_bind_ref_seqno);
>>>> +		break;
>>>> +	}
>>>> +	case DRM_XE_EUDEBUG_EVENT_METADATA: {
>>>> +		struct drm_xe_eudebug_event_metadata *em = (void *)e;
>>>> +
>>>> +		sprintf(b, "client_handle=%llu, metadata_handle=%llu, type=%llu, len=%llu",
>>>> +			em->client_handle, em->metadata_handle, em->type, em->len);
>>>> +		break;
>>>> +	}
>>>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA: {
>>>> +		struct drm_xe_eudebug_event_vm_bind_op_metadata *op = (void *)e;
>>>> +
>>>> +		sprintf(b, "vm_bind_op_ref_seqno=%lld, metadata_handle=%llu, metadata_cookie=%llu",
>>>> +			op->vm_bind_op_ref_seqno, op->metadata_handle, op->metadata_cookie);
>>>> +		break;
>>>> +	}
>>>> +	default:
>>>> +		strcpy(b, "<...>");
>>>> +	}
>>>> +
>>>> +	return b;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_event_to_str:
>>>> + * @e: pointer to event
>>>> + * @buf: target to write string representation of @e
>>>> + * @len: size of target buffer @buf
>>>> + *
>>>> + * Creates string representation for given event.
>>>> + *
>>>> + * Returns: the written input buffer pointed by @buf.
>>>> + */
>>>> +const char *xe_eudebug_event_to_str(struct drm_xe_eudebug_event *e, char *buf, size_t len)
>>>> +{
>>>> +	char a[256];
>>>> +	char b[256];
>>>> +
>>>> +	snprintf(buf, len, "(%llu) %15s:%s: %s",
>>>> +		 e->seqno,
>>>> +		 event_type_to_str(e, a),
>>>> +		 flags_to_str(e->flags),
>>>> +		 event_members_to_str(e, b));
>>>> +
>>>> +	return buf;
>>>> +}
>>>> +
>>>> +static void catch_child_failure(void)
>>>> +{
>>>> +	pid_t pid;
>>>> +	int status;
>>>> +
>>>> +	pid = waitpid(-1, &status, WNOHANG);
>>>> +
>>>> +	if (pid == 0 || pid == -1)
>>>> +		return;
>>>> +
>>>> +	if (!WIFEXITED(status))
>>>> +		return;
>>>> +
>>>> +	igt_assert_f(WEXITSTATUS(status) == 0, "Client failed!\n");
>>>> +}
>>>> +
>>>> +static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)
>>>> +{
>>>> +	int ret;
>>>> +	int t = 0;
>>>> +	struct pollfd fd = {
>>>> +		.fd = pipe[0],
>>>> +		.events = POLLIN,
>>>> +		.revents = 0
>>>> +	};
>>>> +
>>>> +	/* When child fails we may get stuck forever. Check whether
>>>> +	 * the child process ended with an error.
>>>> +	 */
>>>> +	do {
>>>> +		const int interval_ms = 1000;
>>>> +
>>>> +		ret = poll(&fd, 1, interval_ms);
>>>> +
>>>> +		if (!ret) {
>>>> +			catch_child_failure();
>>>> +			t += interval_ms;
>>>> +		}
>>>> +	} while (!ret && t < timeout_ms);
>>>> +
>>>> +	if (ret > 0)
>>>> +		return read(pipe[0], buf, nbytes);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static uint64_t pipe_read(int pipe[2], int timeout_ms)
>>>> +{
>>>> +	uint64_t in;
>>>> +	uint64_t ret;
>>>> +
>>>> +	ret = safe_pipe_read(pipe, &in, sizeof(in), timeout_ms);
>>>> +	igt_assert(ret == sizeof(in));
>>>> +
>>>> +	return in;
>>>> +}
>>>> +
>>>> +static void pipe_signal(int pipe[2], uint64_t token)
>>>> +{
>>>> +	igt_assert(write(pipe[1], &token, sizeof(token)) == sizeof(token));
>>>> +}
>>>> +
>>>> +static void pipe_close(int pipe[2])
>>>> +{
>>>> +	if (pipe[0] != -1)
>>>> +		close(pipe[0]);
>>>> +
>>>> +	if (pipe[1] != -1)
>>>> +		close(pipe[1]);
>>>> +}
>>>> +
>>>> +static uint64_t __wait_token(int p[2], const uint64_t token, int timeout_ms)
>>>> +{
>>>> +	uint64_t in;
>>>> +
>>>> +	in = pipe_read(p, timeout_ms);
>>>> +
>>>> +	igt_assert_eq(in, token);
>>>> +
>>>> +	return pipe_read(p, timeout_ms);
>>>> +}
>>>> +
>>>> +static uint64_t client_wait_token(struct xe_eudebug_client *c,
>>>> +				 const uint64_t token)
>>>> +{
>>>> +	return __wait_token(c->p_in, token, c->timeout_ms);
>>>> +}
>>>> +
>>>> +static uint64_t wait_from_client(struct xe_eudebug_client *c,
>>>> +				 const uint64_t token)
>>>> +{
>>>> +	return __wait_token(c->p_out, token, c->timeout_ms);
>>>> +}
>>>> +
>>>> +static void token_signal(int p[2], const uint64_t token, const uint64_t value)
>>>> +{
>>>> +	pipe_signal(p, token);
>>>> +	pipe_signal(p, value);
>>>> +}
>>>> +
>>>> +static void client_signal(struct xe_eudebug_client *c,
>>>> +			  const uint64_t token,
>>>> +			  const uint64_t value)
>>>> +{
>>>> +	token_signal(c->p_out, token, value);
>>>> +}
>>>> +
>>>> +static int __xe_eudebug_connect(int fd, pid_t pid, uint32_t flags, uint64_t events)
>>>> +{
>>>> +	struct drm_xe_eudebug_connect param = {
>>>> +		.pid = pid,
>>>> +		.flags = flags,
>>>> +	};
>>>> +	int debugfd;
>>>> +
>>>> +	debugfd = igt_ioctl(fd, DRM_IOCTL_XE_EUDEBUG_CONNECT, &param);
>>>> +
>>>> +	if (debugfd < 0)
>>>> +		return -errno;
>>>> +
>>>> +	return debugfd;
>>>> +}
>>>> +
>>>> +static void event_log_write_to_fd(struct xe_eudebug_event_log *l, int fd)
>>>> +{
>>>> +	igt_assert_eq(write(fd, &l->head, sizeof(l->head)),
>>>> +		      sizeof(l->head));
>>>> +
>>>> +	igt_assert_eq(write(fd, l->log, l->head), l->head);
>>>> +}
>>>> +
>>>> +static void read_all(int fd, void *buf, size_t nbytes)
>>>> +{
>>>> +	ssize_t remaining_size = nbytes;
>>>> +	ssize_t current_size = 0;
>>>> +	ssize_t read_size = 0;
>>>> +
>>>> +	do {
>>>> +		read_size = read(fd, buf + current_size, remaining_size);
>>>> +		igt_assert_f(read_size >= 0, "read failed: %s\n", strerror(errno));
>>>> +
>>>> +		current_size += read_size;
>>>> +		remaining_size -= read_size;
>>>> +	} while (remaining_size > 0 && read_size > 0);
>>>> +
>>>> +	igt_assert_eq(current_size, nbytes);
>>>> +}
>>>> +
>>>> +static void event_log_read_from_fd(struct xe_eudebug_event_log *l, int fd)
>>>> +{
>>>> +	read_all(fd, &l->head, sizeof(l->head));
>>>> +	igt_assert_lt(l->head, l->max_size);
>>>> +
>>>> +	read_all(fd, l->log, l->head);
>>>> +}
>>>> +
>>>> +typedef int (*cmp_fn_t)(struct drm_xe_eudebug_event *, void *);
>>>> +
>>>> +static struct drm_xe_eudebug_event *
>>>> +event_cmp(struct xe_eudebug_event_log *l,
>>>> +	  struct drm_xe_eudebug_event *current,
>>>> +	  cmp_fn_t match,
>>>> +	  void *data)
>>>> +{
>>>> +	struct drm_xe_eudebug_event *e = current;
>>>> +
>>>> +	xe_eudebug_for_each_event(e, l) {
>>>> +		if (match(e, data))
>>>> +			return e;
>>>> +	}
>>>> +
>>>> +	return NULL;
>>>> +}
>>>> +
>>>> +static int match_type_and_flags(struct drm_xe_eudebug_event *a, void *data)
>>>> +{
>>>> +	struct drm_xe_eudebug_event *b = data;
>>>> +
>>>> +	if (a->type == b->type &&
>>>> +	    a->flags == b->flags)
>>>> +		return 1;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int match_fields(struct drm_xe_eudebug_event *a, void *data)
>>>> +{
>>>> +	struct drm_xe_eudebug_event *b = data;
>>>> +	int ret = 0;
>>>> +
>>>> +	ret = match_type_and_flags(a, data);
>>>> +	if (!ret)
>>>> +		return ret;
>>>> +
>>>> +	ret = 0;
>>>> +
>>>> +	switch (a->type) {
>>>> +	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE: {
>>>> +		struct drm_xe_eudebug_event_exec_queue *ae = (void *)a;
>>>> +		struct drm_xe_eudebug_event_exec_queue *be = (void *)b;
>>>> +
>>>> +		if (ae->engine_class == be->engine_class && ae->width == be->width)
>>>> +			ret = 1;
>>>> +		break;
>>>> +	}
>>>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
>>>> +		struct drm_xe_eudebug_event_vm_bind *ea = (void *)a;
>>>> +		struct drm_xe_eudebug_event_vm_bind *eb = (void *)b;
>>>> +
>>>> +		if (ea->num_binds == eb->num_binds)
>>>> +			ret = 1;
>>>> +		break;
>>>> +	}
>>>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP: {
>>>> +		struct drm_xe_eudebug_event_vm_bind_op *ea = (void *)a;
>>>> +		struct drm_xe_eudebug_event_vm_bind_op *eb = (void *)b;
>>>> +
>>>> +		if (ea->addr == eb->addr && ea->range == eb->range &&
>>>> +		    ea->num_extensions == eb->num_extensions)
>>>> +			ret = 1;
>>>> +		break;
>>>> +	}
>>>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA: {
>>>> +		struct drm_xe_eudebug_event_vm_bind_op_metadata *ea = (void *)a;
>>>> +		struct drm_xe_eudebug_event_vm_bind_op_metadata *eb = (void *)b;
>>>> +
>>>> +		if (ea->metadata_handle == eb->metadata_handle &&
>>>> +		    ea->metadata_cookie == eb->metadata_cookie)
>>>> +			ret = 1;
>>>> +		break;
>>>> +	}
>>>> +
>>>> +	default:
>>>> +		ret = 1;
>>>> +		break;
>>>> +	}
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int match_client_handle(struct drm_xe_eudebug_event *e, void *data)
>>>> +{
>>>> +	struct match_dto *md = (void *)data;
>>>> +	uint64_t *bind_seqno = md->bind_seqno;
>>>> +	uint64_t *bind_op_seqno = md->bind_op_seqno;
>>>> +	uint64_t h = md->client_handle;
>>>> +
>>>> +	if (XE_EUDEBUG_EVENT_IS_FILTERED(e->type, md->filter))
>>>> +		return 0;
>>>> +
>>>> +	switch (e->type) {
>>>> +	case DRM_XE_EUDEBUG_EVENT_OPEN: {
>>>> +		struct drm_xe_eudebug_event_client *client = (struct drm_xe_eudebug_event_client *)e;
>>>> +
>>>> +		if (client->client_handle == h)
>>>> +			return 1;
>>>> +		break;
>>>> +	}
>>>> +	case DRM_XE_EUDEBUG_EVENT_VM: {
>>>> +		struct drm_xe_eudebug_event_vm *vm = (struct drm_xe_eudebug_event_vm *)e;
>>>> +
>>>> +		if (vm->client_handle == h)
>>>> +			return 1;
>>>> +		break;
>>>> +	}
>>>> +	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE: {
>>>> +		struct drm_xe_eudebug_event_exec_queue *ee = (struct drm_xe_eudebug_event_exec_queue *)e;
>>>> +
>>>> +		if (ee->client_handle == h)
>>>> +			return 1;
>>>> +		break;
>>>> +	}
>>>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
>>>> +		struct drm_xe_eudebug_event_vm_bind *evmb = (struct drm_xe_eudebug_event_vm_bind *)e;
>>>> +
>>>> +		if (evmb->client_handle == h) {
>>>> +			*bind_seqno = evmb->base.seqno;
>>>> +			return 1;
>>>> +		}
>>>> +		break;
>>>> +	}
>>>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP: {
>>>> +		struct drm_xe_eudebug_event_vm_bind_op *eo = (struct drm_xe_eudebug_event_vm_bind_op *)e;
>>>> +
>>>> +		if (eo->vm_bind_ref_seqno == *bind_seqno) {
>>>> +			*bind_op_seqno = eo->base.seqno;
>>>> +			return 1;
>>>> +		}
>>>> +		break;
>>>> +	}
>>>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE: {
>>>> +		struct drm_xe_eudebug_event_vm_bind_ufence *ef  = (struct drm_xe_eudebug_event_vm_bind_ufence *)e;
>>>> +
>>>> +		if (ef->vm_bind_ref_seqno == *bind_seqno)
>>>> +			return 1;
>>>> +
>>>> +		break;
>>>> +	}
>>>> +	case DRM_XE_EUDEBUG_EVENT_METADATA: {
>>>> +		struct drm_xe_eudebug_event_metadata *em = (struct drm_xe_eudebug_event_metadata *)e;
>>>> +
>>>> +		if (em->client_handle == h)
>>>> +			return 1;
>>>> +		break;
>>>> +	}
>>>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA: {
>>>> +		struct drm_xe_eudebug_event_vm_bind_op_metadata *eo = (struct drm_xe_eudebug_event_vm_bind_op_metadata *)e;
>>>> +
>>>> +		if (eo->vm_bind_op_ref_seqno == *bind_op_seqno)
>>>> +			return 1;
>>>> +		break;
>>>> +	}
>>>> +	default:
>>>> +		break;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int match_opposite_resource(struct drm_xe_eudebug_event *e, void *data)
>>>> +{
>>>> +
>>>> +	struct drm_xe_eudebug_event *d = (void *)data;
>>>> +	int ret;
>>>> +
>>>> +	d->flags ^= DRM_XE_EUDEBUG_EVENT_CREATE | DRM_XE_EUDEBUG_EVENT_DESTROY;
>>>> +	d->flags &= ~(DRM_XE_EUDEBUG_EVENT_NEED_ACK);
>>>> +	ret = match_type_and_flags(e, data);
>>>> +	d->flags ^= DRM_XE_EUDEBUG_EVENT_CREATE | DRM_XE_EUDEBUG_EVENT_DESTROY;
>>>> +
>>>> +	if (!ret)
>>>> +		return 0;
>>>> +
>>>> +	switch (e->type) {
>>>> +	case DRM_XE_EUDEBUG_EVENT_OPEN: {
>>>> +		struct drm_xe_eudebug_event_client *client = (struct drm_xe_eudebug_event_client *)e;
>>>> +		struct drm_xe_eudebug_event_client *filter = (struct drm_xe_eudebug_event_client *)data;
>>>> +
>>>> +		if (client->client_handle == filter->client_handle)
>>>> +			return 1;
>>>> +		break;
>>>> +	}
>>>> +	case DRM_XE_EUDEBUG_EVENT_VM: {
>>>> +		struct drm_xe_eudebug_event_vm *vm = (struct drm_xe_eudebug_event_vm *)e;
>>>> +		struct drm_xe_eudebug_event_vm *filter = (struct drm_xe_eudebug_event_vm *)data;
>>>> +
>>>> +		if (vm->vm_handle == filter->vm_handle)
>>>> +			return 1;
>>>> +		break;
>>>> +	}
>>>> +	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE: {
>>>> +		struct drm_xe_eudebug_event_exec_queue *ee = (void *)e;
>>>> +		struct drm_xe_eudebug_event_exec_queue *filter = (struct drm_xe_eudebug_event_exec_queue *)data;
>>>> +
>>>> +		if (ee->exec_queue_handle == filter->exec_queue_handle)
>>>> +			return 1;
>>>> +		break;
>>>> +	}
>>>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
>>>> +		struct drm_xe_eudebug_event_vm_bind *evmb = (void *)e;
>>>> +		struct drm_xe_eudebug_event_vm_bind *filter = (struct drm_xe_eudebug_event_vm_bind *)data;
>>>> +
>>>> +		if (evmb->vm_handle == filter->vm_handle &&
>>>> +		    evmb->num_binds == filter->num_binds)
>>>> +			return 1;
>>>> +		break;
>>>> +	}
>>>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP: {
>>>> +		struct drm_xe_eudebug_event_vm_bind_op *avmb = (void *)e;
>>>> +		struct drm_xe_eudebug_event_vm_bind_op *filter = (struct drm_xe_eudebug_event_vm_bind_op *)data;
>>>> +
>>>> +		if (avmb->addr == filter->addr &&
>>>> +		    avmb->range == filter->range)
>>>> +			return 1;
>>>> +		break;
>>>> +	}
>>>> +	case DRM_XE_EUDEBUG_EVENT_METADATA: {
>>>> +		struct drm_xe_eudebug_event_metadata *em = (void *)e;
>>>> +		struct drm_xe_eudebug_event_metadata *filter = (struct drm_xe_eudebug_event_metadata *)data;
>>>> +
>>>> +		if (em->metadata_handle == filter->metadata_handle)
>>>> +			return 1;
>>>> +		break;
>>>> +	}
>>>> +	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA: {
>>>> +		struct drm_xe_eudebug_event_vm_bind_op_metadata *avmb = (void *)e;
>>>> +		struct drm_xe_eudebug_event_vm_bind_op_metadata *filter = (struct drm_xe_eudebug_event_vm_bind_op_metadata *)data;
>>>> +
>>>> +		if (avmb->metadata_handle == filter->metadata_handle &&
>>>> +		    avmb->metadata_cookie == filter->metadata_cookie)
>>>> +			return 1;
>>>> +		break;
>>>> +	}
>>>> +
>>>> +	default:
>>>> +		break;
>>>> +	}
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int match_full(struct drm_xe_eudebug_event *e, void *data)
>>>> +{
>>>> +	struct seqno_list_entry *sl;
>>>> +
>>>> +	struct match_dto *md = (void *)data;
>>>> +	int ret = 0;
>>>> +
>>>> +	ret = match_client_handle(e, md);
>>>> +	if (!ret)
>>>> +		return 0;
>>>> +
>>>> +	ret = match_fields(e, md->target);
>>>> +	if (!ret)
>>>> +		return 0;
>>>> +
>>>> +	igt_list_for_each_entry(sl, md->seqno_list, link) {
>>>> +		if (sl->seqno == e->seqno)
>>>> +			return 0;
>>>> +	}
>>>> +
>>>> +	return 1;
>>>> +}
>>>> +
>>>> +static struct drm_xe_eudebug_event *
>>>> +event_type_match(struct xe_eudebug_event_log *l,
>>>> +		 struct drm_xe_eudebug_event *target,
>>>> +		 struct drm_xe_eudebug_event *current)
>>>> +{
>>>> +	return event_cmp(l, current, match_type_and_flags, target);
>>>> +}
>>>> +
>>>> +static struct drm_xe_eudebug_event *
>>>> +client_match(struct xe_eudebug_event_log *l,
>>>> +	     uint64_t client_handle,
>>>> +	     struct drm_xe_eudebug_event *current,
>>>> +	     uint32_t filter,
>>>> +	     uint64_t *bind_seqno,
>>>> +	     uint64_t *bind_op_seqno)
>>>> +{
>>>> +	struct match_dto md = {
>>>> +		.client_handle = client_handle,
>>>> +		.filter = filter,
>>>> +		.bind_seqno = bind_seqno,
>>>> +		.bind_op_seqno = bind_op_seqno,
>>>> +	};
>>>> +
>>>> +	return event_cmp(l, current, match_client_handle, &md);
>>>> +}
>>>> +
>>>> +static struct drm_xe_eudebug_event *
>>>> +opposite_event_match(struct xe_eudebug_event_log *l,
>>>> +		    struct drm_xe_eudebug_event *target,
>>>> +		    struct drm_xe_eudebug_event *current)
>>>> +{
>>>> +	return event_cmp(l, current, match_opposite_resource, target);
>>>> +}
>>>> +
>>>> +static struct drm_xe_eudebug_event *
>>>> +event_match(struct xe_eudebug_event_log *l,
>>>> +	    struct drm_xe_eudebug_event *target,
>>>> +	    uint64_t client_handle,
>>>> +	    struct igt_list_head *seqno_list,
>>>> +	    uint64_t *bind_seqno,
>>>> +	    uint64_t *bind_op_seqno)
>>>> +{
>>>> +	struct match_dto md = {
>>>> +		.target = target,
>>>> +		.client_handle = client_handle,
>>>> +		.seqno_list = seqno_list,
>>>> +		.bind_seqno = bind_seqno,
>>>> +		.bind_op_seqno = bind_op_seqno,
>>>> +	};
>>>> +
>>>> +	return event_cmp(l, NULL, match_full, &md);
>>>> +}
>>>> +
>>>> +static void compare_client(struct xe_eudebug_event_log *c, struct drm_xe_eudebug_event *_ce,
>>>> +			   struct xe_eudebug_event_log *d, struct drm_xe_eudebug_event *_de,
>>>> +			   uint32_t filter)
>>>> +{
>>>> +	struct drm_xe_eudebug_event_client *ce = (void *)_ce;
>>>> +	struct drm_xe_eudebug_event_client *de = (void *)_de;
>>>> +	uint64_t cbs = 0, dbs = 0, cbso = 0, dbso = 0;
>>>> +
>>>> +	struct igt_list_head matched_seqno_list;
>>>> +	struct drm_xe_eudebug_event *hc, *hd;
>>>> +	struct seqno_list_entry *entry, *tmp;
>>>> +
>>>> +	igt_assert(ce);
>>>> +	igt_assert(de);
>>>> +
>>>> +	igt_debug("client: %llu -> %llu\n", ce->client_handle, de->client_handle);
>>>> +
>>>> +	hc = NULL;
>>>> +	hd = NULL;
>>>> +	IGT_INIT_LIST_HEAD(&matched_seqno_list);
>>>> +
>>>> +	do {
>>>> +		hc = client_match(c, ce->client_handle, hc, filter, &cbs, &cbso);
>>>> +		if (!hc)
>>>> +			break;
>>>> +
>>>> +		hd = event_match(d, hc, de->client_handle, &matched_seqno_list, &dbs, &dbso);
>>>> +
>>>> +		igt_assert_f(hd, "%s (%llu): no matching event type %u found for client %llu\n",
>>>> +			     c->name,
>>>> +			     hc->seqno,
>>>> +			     hc->type,
>>>> +			     ce->client_handle);
>>>> +
>>>> +		igt_debug("comparing %s %llu vs %s %llu\n",
>>>> +			  c->name, hc->seqno, d->name, hd->seqno);
>>>> +
>>>> +		/*
>>>> +		 * Store the seqno of the event that was matched above,
>>>> +		 * inside 'matched_seqno_list', to avoid it getting matched
>>>> +		 * by subsequent 'event_match' calls.
>>>> +		 */
>>>> +		entry = malloc(sizeof(*entry));
>>>> +		entry->seqno = hd->seqno;
>>>> +		igt_list_add(&entry->link, &matched_seqno_list);
>>>> +	} while (hc);
>>>> +
>>>> +	igt_list_for_each_entry_safe(entry, tmp, &matched_seqno_list, link)
>>>> +		free(entry);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_event_log_find_seqno:
>>>> + * @l: event log pointer
>>>> + * @seqno: seqno of event to be found
>>>> + *
>>>> + * Finds the event with given seqno in the event log.
>>>> + *
>>>> + * Returns: pointer to the event with given seqno within @l or NULL seqno is
>>>> + * not present.
>>>> + */
>>>> +struct drm_xe_eudebug_event *
>>>> +xe_eudebug_event_log_find_seqno(struct xe_eudebug_event_log *l, uint64_t seqno)
>>>> +{
>>>> +	struct drm_xe_eudebug_event *e = NULL, *found = NULL;
>>>> +
>>>> +	igt_assert_neq(seqno, 0);
>>>> +	/*
>>>> +	 * Try to catch if seqno is corrupted and prevent too long tests,
>>>> +	 * as our post processing of events is not optimized.
>>>> +	 */
>>>> +	igt_assert_lt(seqno, 10 * 1000 * 1000);
>>>> +
>>>> +	xe_eudebug_for_each_event(e, l) {
>>>> +		if (e->seqno == seqno) {
>>>> +			if (found) {
>>>> +				igt_warn("Found multiple events with the same seqno %lu\n", seqno);
>>>> +				xe_eudebug_event_log_print(l, false);
>>>> +				igt_assert(!found);
>>>> +			}
>>>> +			found = e;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	return found;
>>>> +}
>>>> +
>>>> +static void event_log_sort(struct xe_eudebug_event_log *l)
>>>> +{
>>>> +	struct xe_eudebug_event_log *tmp;
>>>> +	struct drm_xe_eudebug_event *e = NULL;
>>>> +	uint64_t first_seqno = 0;
>>>> +	uint64_t last_seqno = 0;
>>>> +	uint64_t events = 0, added = 0;
>>>> +	uint64_t i;
>>>> +
>>>> +	xe_eudebug_for_each_event(e, l) {
>>>> +		if (e->seqno > last_seqno)
>>>> +			last_seqno = e->seqno;
>>>> +
>>>> +		if (e->seqno < first_seqno)
>>>> +			first_seqno = e->seqno;
>>>> +
>>>> +		events++;
>>>> +	}
>>>> +
>>>> +	tmp = xe_eudebug_event_log_create("tmp", l->max_size);
>>>> +
>>>> +	for (i = 1; i <= last_seqno; i++) {
>>>> +		e = xe_eudebug_event_log_find_seqno(l, i);
>>>> +		if (e) {
>>>> +			xe_eudebug_event_log_write(tmp, e);
>>>> +			added++;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	igt_assert_eq(events, added);
>>>> +	igt_assert_eq(tmp->head, l->head);
>>>> +
>>>> +	memcpy(l->log, tmp->log, tmp->head);
>>>> +
>>>> +	xe_eudebug_event_log_destroy(tmp);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_connect:
>>>> + * @fd: Xe file descriptor
>>>> + * @pid: client PID
>>>> + * @flags: connection flags
>>>> + *
>>>> + * Opens the xe eu debugger connection to the process described by @pid
>>>> + *
>>>> + * Returns: 0 if the debugger was successfully attached, -errno otherwise.
>>>> + */
>>>> +int xe_eudebug_connect(int fd, pid_t pid, uint32_t flags)
>>>> +{
>>>> +	int ret;
>>>> +	uint64_t events = 0; /* events filtering not supported yet! */
>>>> +
>>>> +	ret = __xe_eudebug_connect(fd, pid, flags, events);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_event_log_create:
>>>> + * @name: event log identifier
>>>> + * @max_size: maximum size of created log
>>>> + *
>>>> + * Function creates an Eu Debugger event log with size equal to @max_size.
>>>> + *
>>>> + * Returns: pointer to just created log
>>>> + */
>>>> +#define MAX_EVENT_LOG_SIZE (32 * 1024 * 1024)
>>>> +struct xe_eudebug_event_log *xe_eudebug_event_log_create(const char *name, unsigned int max_size)
>>>> +{
>>>> +	struct xe_eudebug_event_log *l;
>>>> +
>>>> +	l = calloc(1, sizeof(*l));
>>>> +	igt_assert(l);
>>>> +	l->log = calloc(1, max_size);
>>>> +	igt_assert(l->log);
>>>> +	l->max_size = max_size;
>>>> +	strncpy(l->name, name, sizeof(l->name) - 1);
>>>> +	pthread_mutex_init(&l->lock, NULL);
>>>> +
>>>> +	return l;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_event_log_destroy:
>>>> + * @l: event log pointer
>>>> + *
>>>> + * Frees given event log @l.
>>>> + */
>>>> +void xe_eudebug_event_log_destroy(struct xe_eudebug_event_log *l)
>>>> +{
>>>> +	pthread_mutex_destroy(&l->lock);
>>>> +	free(l->log);
>>>> +	free(l);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_event_log_write:
>>>> + * @l: event log pointer
>>>> + * @e: event to be written to event log
>>>> + *
>>>> + * Writes event @e to the event log, thread-safe.
>>>> + */
>>>> +void xe_eudebug_event_log_write(struct xe_eudebug_event_log *l, struct drm_xe_eudebug_event *e)
>>>> +{
>>>> +	igt_assert(e->seqno);
>>>> +	/*
>>>> +	 * Try to catch if seqno is corrupted and prevent too long tests,
>>>> +	 * as our post processing of events is not optimized.
>>>> +	 */
>>>> +	igt_assert_lt(e->seqno, 10 * 1000 * 1000);
>>>> +
>>>> +	pthread_mutex_lock(&l->lock);
>>>> +	igt_assert_lt(l->head + e->len, l->max_size);
>>>> +	memcpy(l->log + l->head, e, e->len);
>>>> +	l->head += e->len;
>>>> +
>>>> +#ifdef DEBUG_LOG
>>>> +	igt_info("%s: wrote %u bytes to eventlog, free %u bytes\n",
>>>> +		 l->name, e->len, l->max_size - l->head);
>>>> +#endif
>>>> +	pthread_mutex_unlock(&l->lock);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_event_log_print:
>>>> + * @l: event log pointer
>>>> + * @debug: when true function uses igt_debug instead of igt_info.
>>>> + *
>>>> + * Prints given event log.
>>>> + */
>>>> +void
>>>> +xe_eudebug_event_log_print(struct xe_eudebug_event_log *l, bool debug)
>>>> +{
>>>> +	struct drm_xe_eudebug_event *e = NULL;
>>>> +	int level = debug ? IGT_LOG_DEBUG : IGT_LOG_INFO;
>>>> +	char str[XE_EUDEBUG_EVENT_STRING_MAX_LEN];
>>>> +
>>>> +	igt_log(IGT_LOG_DOMAIN, level,
>>>> +		"event log '%s' (%u bytes):\n", l->name, l->head);
>>>> +
>>>> +	xe_eudebug_for_each_event(e, l) {
>>>> +		xe_eudebug_event_to_str(e, str, XE_EUDEBUG_EVENT_STRING_MAX_LEN);
>>>> +		igt_log(IGT_LOG_DOMAIN, level, "%s\n", str);
>>>> +	}
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_event_log_compare:
>>>> + * @a: event log pointer
>>>> + * @b: event log pointer
>>>> + * @filter: mask that represents events to be skipped during comparison, useful
>>>> + * for events like 'VM_BIND' since they can be asymmetric. Note that
>>>> + * 'DRM_XE_EUDEBUG_EVENT_OPEN' will always be matched.
>>>> + *
>>>> + * Compares and asserts event logs @a, @b if the event
>>>> + * sequence matches.
>>>> + */
>>>> +void xe_eudebug_event_log_compare(struct xe_eudebug_event_log *a, struct xe_eudebug_event_log *b,
>>>> +				  uint32_t filter)
>>>> +{
>>>> +	struct drm_xe_eudebug_event *ae = NULL;
>>>> +	struct drm_xe_eudebug_event *be = NULL;
>>>> +
>>>> +	xe_eudebug_for_each_event(ae, a) {
>>>> +		if (ae->type == DRM_XE_EUDEBUG_EVENT_OPEN &&
>>>> +		    ae->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
>>>> +			be = event_type_match(b, ae, be);
>>>> +
>>>> +			compare_client(a, ae, b, be, filter);
>>>> +			compare_client(b, be, a, ae, filter);
>>>> +		}
>>>> +	}
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_event_log_match_opposite:
>>>> + * @l: event log pointer
>>>> + * @filter: mask that represents events to be skipped during comparison, useful
>>>> + * for events like 'VM_BIND' since they can be asymmetric
>>>> + *
>>>> + * Matches and asserts content of all opposite events (create vs destroy).
>>>> + */
>>>> +void
>>>> +xe_eudebug_event_log_match_opposite(struct xe_eudebug_event_log *l, uint32_t filter)
>>>> +{
>>>> +	struct drm_xe_eudebug_event *ce = NULL;
>>>> +	struct drm_xe_eudebug_event *de = NULL;
>>>> +
>>>> +	xe_eudebug_for_each_event(ce, l) {
>>>> +		if (ce->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
>>>> +			uint8_t offset = sizeof(struct drm_xe_eudebug_event);
>>>> +			int opposite_matching;
>>>> +
>>>> +			if (XE_EUDEBUG_EVENT_IS_FILTERED(ce->type, filter))
>>>> +				continue;
>>>> +
>>>> +			/* No opposite matching for binds */
>>>> +			if ((ce->type >= DRM_XE_EUDEBUG_EVENT_VM_BIND &&
>>>> +			     ce->type <= DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE) ||
>>>> +			    ce->type == DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA)
>>>> +				continue;
>>>> +
>>>> +			de = opposite_event_match(l, ce, ce);
>>>> +
>>>> +			igt_assert_f(de, "no opposite event of type %u found\n", ce->type);
>>>> +
>>>> +			igt_assert_eq(ce->len, de->len);
>>>> +			opposite_matching = memcmp((uint8_t *)de + offset,
>>>> +						   (uint8_t *)ce + offset,
>>>> +						   de->len - offset) == 0;
>>>> +
>>>> +			igt_assert_f(opposite_matching,
>>>> +				     "%s: create|destroy event not "
>>>> +				     "maching (%llu) vs (%llu)\n",
>>>> +				     l->name, de->seqno, ce->seqno);
>>>> +		}
>>>> +	}
>>>> +}
>>>> +
>>>> +static void debugger_run_triggers(struct xe_eudebug_debugger *d,
>>>> +				  struct drm_xe_eudebug_event *e)
>>>> +{
>>>> +	struct event_trigger *t;
>>>> +
>>>> +	igt_list_for_each_entry(t, &d->triggers, link) {
>>>> +		if (e->type == t->type)
>>>> +			t->fn(d, e);
>>>> +	}
>>>> +}
>>>> +
>>>> +#define MAX_EVENT_SIZE (32 * 1024)
>>>> +static int
>>>> +xe_eudebug_read_event(int fd, struct drm_xe_eudebug_event *event)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	event->type = DRM_XE_EUDEBUG_EVENT_READ;
>>>> +	event->flags = 0;
>>>> +	event->len = MAX_EVENT_SIZE;
>>>> +
>>>> +	ret = igt_ioctl(fd, DRM_XE_EUDEBUG_IOCTL_READ_EVENT, event);
>>>> +	if (ret < 0)
>>>> +		return -errno;
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static void *debugger_worker_loop(void *data)
>>>> +{
>>>> +	uint8_t buf[MAX_EVENT_SIZE];
>>>> +	struct drm_xe_eudebug_event *e = (void *)buf;
>>>> +	struct xe_eudebug_debugger *d = data;
>>>> +	struct pollfd p = {
>>>> +		.events = POLLIN,
>>>> +		.revents = 0,
>>>> +	};
>>>> +	int timeout_ms = 100, ret;
>>>> +
>>>> +	igt_assert(d->master_fd >= 0);
>>>> +
>>>> +	do {
>>>> +		p.fd = d->fd;
>>>> +		ret = poll(&p, 1, timeout_ms);
>>>> +
>>>> +		if (ret == -1) {
>>>> +			igt_info("poll failed with errno %d\n", errno);
>>>> +			break;
>>>> +		}
>>>> +
>>>> +		if (ret == 1 && (p.revents & POLLIN)) {
>>>> +			int err = xe_eudebug_read_event(d->fd, e);
>>>> +
>>>> +			if (!err) {
>>>> +				++d->event_count;
>>>> +
>>>> +				xe_eudebug_event_log_write(d->log, e);
>>>> +				debugger_run_triggers(d, e);
>>>> +			} else {
>>>> +				igt_info("xe_eudebug_read_event returned %d\n", ret);
>>>> +			}
>>>> +		}
>>>> +	} while ((ret && READ_ONCE(d->worker_state) == DEBUGGER_WORKER_QUITTING) ||
>>>> +		 READ_ONCE(d->worker_state) == DEBUGGER_WORKER_ACTIVE);
>>>> +
>>>> +	d->worker_state = DEBUGGER_WORKER_INACTIVE;
>>>> +	return NULL;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_debugger_available:
>>>> + * @fd: Xe file descriptor
>>>> + *
>>>> + * Returns: true it debugger connection is available, false otherwise.
>>>> + */
>>>> +bool xe_eudebug_debugger_available(int fd)
>>>> +{
>>>> +	struct drm_xe_eudebug_connect param = { .pid = getpid() };
>>>> +	int debugfd;
>>>> +
>>>> +	debugfd = igt_ioctl(fd, DRM_IOCTL_XE_EUDEBUG_CONNECT, &param);
>>>> +	if (debugfd >= 0)
>>>> +		close(debugfd);
>>>> +
>>>> +	return debugfd >= 0;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_debugger_create:
>>>> + * @master_fd: xe client used to open the debugger connection
>>>> + * @flags: flags stored in a debugger structure, can be used at will
>>>> + * of the caller, i.e. to be used inside triggers.
>>>> + * @data: test's private data, allocated with MAP_SHARED | MAP_ANONYMOUS,
>>>> + * can be shared between client and debugger. Can be NULL.
>>>> + *
>>>> + * Returns: newly created xe_eudebug_debugger structure with its
>>>> + * event log initialized. Note that to open the connection
>>>> + * you need call @xe_eudebug_debugger_attach.
>>>> + */
>>>> +struct xe_eudebug_debugger *
>>>> +xe_eudebug_debugger_create(int master_fd, uint64_t flags, void *data)
>>>> +{
>>>> +	struct xe_eudebug_debugger *d;
>>>> +
>>>> +	d = calloc(1, sizeof(*d));
>>>> +	d->flags = flags;
>>>> +	igt_assert(d);
>>>> +	IGT_INIT_LIST_HEAD(&d->triggers);
>>>> +	d->log = xe_eudebug_event_log_create("debugger", MAX_EVENT_LOG_SIZE);
>>>> +	d->fd = -1;
>>>> +	d->master_fd = master_fd;
>>>> +	d->ptr = data;
>>>> +
>>>> +	return d;
>>>> +}
>>>> +
>>>> +static void debugger_destroy_triggers(struct xe_eudebug_debugger *d)
>>>> +{
>>>> +	struct event_trigger *t, *tmp;
>>>> +
>>>> +	igt_list_for_each_entry_safe(t, tmp, &d->triggers, link)
>>>> +		free(t);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_debugger_destroy:
>>>> + * @d: pointer to the debugger
>>>> + *
>>>> + * Frees xe_eudebug_debugger structure pointed by @d. If the debugger
>>>> + * connection was still opened it terminates it.
>>>> + */
>>>> +void xe_eudebug_debugger_destroy(struct xe_eudebug_debugger *d)
>>>> +{
>>>> +	if (d->worker_state)
>>>> +		xe_eudebug_debugger_stop_worker(d, 1);
>>>> +
>>>> +	if (d->target_pid)
>>>> +		xe_eudebug_debugger_dettach(d);
>>>> +
>>>> +	xe_eudebug_event_log_destroy(d->log);
>>>> +	debugger_destroy_triggers(d);
>>>> +	free(d);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_debugger_attach:
>>>> + * @d: pointer to the debugger
>>>> + * @c: pointer to the client
>>>> + *
>>>> + * Opens the xe eu debugger connection to the process described by @c (c->pid)
>>>> + *
>>>> + * Returns: 0 if the debugger was successfully attached, -errno otherwise.
>>>> + */
>>>> +int xe_eudebug_debugger_attach(struct xe_eudebug_debugger *d,
>>>> +			       struct xe_eudebug_client *c)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	igt_assert_eq(d->fd, -1);
>>>> +	igt_assert_neq(c->pid, 0);
>>>> +	ret = xe_eudebug_connect(d->master_fd, c->pid, 0);
>>>> +
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	d->fd = ret;
>>>> +	d->target_pid = c->pid;
>>>> +	d->p_client[0] = c->p_in[0];
>>>> +	d->p_client[1] = c->p_in[1];
>>>> +
>>>> +	igt_debug("debugger connected to %lu\n", d->target_pid);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_debugger_dettach:
>>>> + * @d: pointer to the debugger
>>>> + *
>>>> + * Closes previously opened xe eu debugger connection. Asserts if
>>>> + * the debugger has active session.
>>>> + */
>>>> +void xe_eudebug_debugger_dettach(struct xe_eudebug_debugger *d)
>>>> +{
>>>> +	igt_assert(d->target_pid);
>>>> +	close(d->fd);
>>>> +	d->target_pid = 0;
>>>> +	d->fd = -1;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_debugger_add_trigger:
>>>> + * @d: pointer to the debugger
>>>> + * @type: the type of the event which activates the trigger
>>>> + * @fn: function to be called when event of @type was read by the debugger.
>>>> + *
>>>> + * Adds function @fn to the list of triggers activated when event of @type
>>>> + * has been read by worker.
>>>> + * Note: Triggers are activated by the worker.
>>>> + */
>>>> +void xe_eudebug_debugger_add_trigger(struct xe_eudebug_debugger *d,
>>>> +				     int type, xe_eudebug_trigger_fn fn)
>>>> +{
>>>> +	struct event_trigger *t;
>>>> +
>>>> +	t = calloc(1, sizeof(*t));
>>>> +	IGT_INIT_LIST_HEAD(&t->link);
>>>> +	t->type = type;
>>>> +	t->fn = fn;
>>>> +
>>>> +	igt_list_add_tail(&t->link, &d->triggers);
>>>> +	igt_debug("added trigger %p\n", t);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_debugger_start_worker:
>>>> + * @d: pointer to the debugger
>>>> + *
>>>> + * Starts the debugger worker. Worker is resposible for reading all
>>>> + * incoming events from the debugger, put then into debugger log and
>>>> + * execute appropriate event triggers. Note that using the debuggers
>>>> + * event log while worker is running is not safe.
>>>> + */
>>>> +void xe_eudebug_debugger_start_worker(struct xe_eudebug_debugger *d)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	d->worker_state = true;
>>>> +	ret = pthread_create(&d->worker_thread, NULL, &debugger_worker_loop, d);
>>>> +
>>>> +	igt_assert_f(ret == 0, "Debugger worker thread creation failed!");
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_debugger_stop_worker:
>>>> + * @d: pointer to the debugger
>>>> + *
>>>> + * Stops the debugger worker. Event log is sorted by seqno after closure.
>>>> + */
>>>> +void xe_eudebug_debugger_stop_worker(struct xe_eudebug_debugger *d,
>>>> +				     int timeout_s)
>>>> +{
>>>> +	struct timespec t = {};
>>>> +	int ret;
>>>> +
>>>> +	igt_assert(d->worker_state);
>>>> +
>>>> +	d->worker_state = DEBUGGER_WORKER_QUITTING; /* First time be polite. */
>>>> +	igt_assert_eq(clock_gettime(CLOCK_REALTIME, &t), 0);
>>>> +	t.tv_sec += timeout_s;
>>>> +
>>>> +	ret = pthread_timedjoin_np(d->worker_thread, NULL, &t);
>>>> +
>>>> +	if (ret == ETIMEDOUT) {
>>>> +		d->worker_state = DEBUGGER_WORKER_INACTIVE;
>>>> +		ret = pthread_join(d->worker_thread, NULL);
>>>> +	}
>>>> +
>>>> +	igt_assert_f(ret == 0 || ret != ESRCH,
>>>> +		     "pthread join failed with error %d!\n", ret);
>>>> +
>>>> +	event_log_sort(d->log);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_debugger_signal_stage:
>>>> + * @d: pointer to the debugger
>>>> + * @stage: stage to signal
>>>> + *
>>>> + * Signals to client, waiting in xe_eudebug_client_wait_stage(),
>>>> + * releasing it to proceed.
>>>> + */
>>>> +void xe_eudebug_debugger_signal_stage(struct xe_eudebug_debugger *d, uint64_t stage)
>>>> +{
>>>> +	token_signal(d->p_client, CLIENT_STAGE, stage);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_debugger_wait_stage:
>>>> + * @s: pointer to xe_eudebug_debugger structure
>>>> + * @stage: stage to wait on
>>>> + *
>>>> + * Pauses debugger until the client has signalled the corresponding stage with
>>>> + * xe_eudebug_client_signal_stage. This is only for situations where the actual
>>>> + * event flow is not enough to coordinate between client/debugger and extra sync
>>>> + * mechanism is needed.
>>>> + */
>>>> +void xe_eudebug_debugger_wait_stage(struct xe_eudebug_session *s, uint64_t stage)
>>>> +{
>>>> +	u64 stage_in;
>>>> +
>>>> +	igt_debug("debugger xe client fd: %d pausing for stage %lu\n", s->d->master_fd, stage);
>>>> +
>>>> +	stage_in = wait_from_client(s->c, DEBUGGER_STAGE);
>>>> +	igt_debug("debugger xe client fd: %d stage %lu, expected %lu, stage\n", s->d->master_fd,
>>>> +		  stage_in, stage);
>>>> +
>>>> +	igt_assert_eq(stage_in, stage);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_client_create:
>>>> + * @master_fd: xe client used to open the debugger connection
>>>> + * @work: function that opens xe device and executes arbitrary workload
>>>> + * @flags: flags stored in a client structure, can be used at will
>>>> + * of the caller, i.e. to provide the @work function an additional switch.
>>>> + * @data: test's private data, allocated with MAP_SHARED | MAP_ANONYMOUS,
>>>> + * can be shared between client and debugger. Accesible via client->ptr.
>>>> + * Can be NULL.
>>>> + *
>>>> + * Forks and creates the debugger process. @work won't be called until
>>>> + * xe_eudebug_client_start is called.
>>>> + *
>>>> + * Returns: newly created xe_eudebug_debugger structure with its
>>>> + * event log initialized.
>>>> + */
>>>> +struct xe_eudebug_client *xe_eudebug_client_create(int master_fd, xe_eudebug_client_work_fn work,
>>>> +						   uint64_t flags, void *data)
>>>> +{
>>>> +	struct xe_eudebug_client *c;
>>>> +
>>>> +	c = calloc(1, sizeof(*c));
>>>> +	c->flags = flags;
>>>> +	igt_assert(c);
>>>> +	igt_assert(!pipe(c->p_in));
>>>> +	igt_assert(!pipe(c->p_out));
>>>> +	c->seqno = 1;
>>>> +	c->log = xe_eudebug_event_log_create("client", MAX_EVENT_LOG_SIZE);
>>>> +	c->done = 0;
>>>> +	c->ptr = data;
>>>> +	c->master_fd = master_fd;
>>>> +	c->timeout_ms = XE_EUDEBUG_DEFAULT_TIMEOUT_MS;
>>>> +
>>>> +	igt_fork(child, 1) {
>>>> +		int mypid;
>>>> +
>>>> +		igt_assert_eq(c->pid, 0);
>>>> +
>>>> +		close(c->p_out[0]);
>>>> +		c->p_out[0] = -1;
>>>> +		close(c->p_in[1]);
>>>> +		c->p_in[1] = -1;
>>>> +
>>>> +		mypid = getpid();
>>>> +		client_signal(c, CLIENT_PID, mypid);
>>>> +
>>>> +		c->pid = client_wait_token(c, CLIENT_RUN);
>>>> +		igt_assert_eq(c->pid, mypid);
>>>> +		if (work)
>>>> +			work(c);
>>>> +
>>>> +		client_signal(c, CLIENT_FINI, c->seqno);
>>>> +
>>>> +		event_log_write_to_fd(c->log, c->p_out[1]);
>>>> +
>>>> +		c->pid = client_wait_token(c, CLIENT_STOP);
>>>> +		igt_assert_eq(c->pid, mypid);
>>>> +	}
>>>> +
>>>> +	close(c->p_out[1]);
>>>> +	c->p_out[1] = -1;
>>>> +	close(c->p_in[0]);
>>>> +	c->p_in[0] = -1;
>>>> +
>>>> +	c->pid = wait_from_client(c, CLIENT_PID);
>>>> +
>>>> +	igt_info("client running with pid %d\n", c->pid);
>>>> +
>>>> +	return c;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_client_stop:
>>>> + * @c: pointer to xe_eudebug_client structure
>>>> + *
>>>> + * Waits for the end of client's work and exits the proccess.
>>>> + */
>>>> +void xe_eudebug_client_stop(struct xe_eudebug_client *c)
>>>> +{
>>>> +	if (c->pid) {
>>>> +		int waitstatus;
>>>> +
>>>> +		xe_eudebug_client_wait_done(c);
>>>> +
>>>> +		token_signal(c->p_in, CLIENT_STOP, c->pid);
>>>> +		igt_assert_eq(waitpid(c->pid, &waitstatus, 0),
>>>> +			      c->pid);
>>>> +		c->pid = 0;
>>>> +	}
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_client_destroy:
>>>> + * @c: pointer to xe_eudebug_client structure to be freed
>>>> + *
>>>> + * Frees the @c client structure. Note that it calls xe_eudebug_client_stop if
>>>> + * client proccess has not terminated yet.
>>>> + */
>>>> +void xe_eudebug_client_destroy(struct xe_eudebug_client *c)
>>>> +{
>>>> +	xe_eudebug_client_stop(c);
>>>> +	pipe_close(c->p_in);
>>>> +	pipe_close(c->p_out);
>>>> +	xe_eudebug_event_log_destroy(c->log);
>>>> +	free(c);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_client_get_seqno:
>>>> + * @c: pointer to xe_eudebug_client structure
>>>> + *
>>>> + * Increments and returns current seqno value of the given client @c
>>>> + *
>>>> + * Returns: incremented seqno
>>>> + */
>>>> +uint64_t xe_eudebug_client_get_seqno(struct xe_eudebug_client *c)
>>>> +{
>>>> +	return c->seqno++;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_client_start:
>>>> + * @c: pointer to xe_eudebug_client structure
>>>> + *
>>>> + * Starts execution of client's work function within the client's proccess.
>>>> + */
>>>> +void xe_eudebug_client_start(struct xe_eudebug_client *c)
>>>> +{
>>>> +	token_signal(c->p_in, CLIENT_RUN, c->pid);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_client_wait_done:
>>>> + * @c: pointer to xe_eudebug_client structure
>>>> + *
>>>> + * Waits for the client work end updates the event log.
>>>> + * Doesn't terminate the client's proccess yet.
>>>> + */
>>>> +void xe_eudebug_client_wait_done(struct xe_eudebug_client *c)
>>>> +{
>>>> +	if (!c->done) {
>>>> +		c->done = 1;
>>>> +		c->seqno = wait_from_client(c, CLIENT_FINI);
>>>> +		event_log_read_from_fd(c->log, c->p_out[0]);
>>>> +	}
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_client_signal_stage:
>>>> + * @c: pointer to the client
>>>> + * @stage: stage to signal
>>>> + *
>>>> + * Signals to debugger, waiting in xe_eudebug_debugger_wait_stage(),
>>>> + * releasing it to proceed.
>>>> + */
>>>> +void xe_eudebug_client_signal_stage(struct xe_eudebug_client *c, uint64_t stage)
>>>> +{
>>>> +	token_signal(c->p_out, DEBUGGER_STAGE, stage);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_client_wait_stage:
>>>> + * @c: pointer to xe_eudebug_client structure
>>>> + * @stage: stage to wait on
>>>> + *
>>>> + * Pauses client until the debugger has signalled the corresponding stage with
>>>> + * xe_eudebug_debugger_signal_stage. This is only for situations where the
>>>> + * actual event flow is not enough to coordinate between client/debugger and extra
>>>> + * sync mechanism is needed.
>>>> + *
>>>> + */
>>>> +void xe_eudebug_client_wait_stage(struct xe_eudebug_client *c, uint64_t stage)
>>>> +{
>>>> +	u64 stage_in;
>>>> +
>>>> +	if (c->done) {
>>>> +		igt_warn("client: %d already done before %lu\n", c->pid, stage);
>>>> +		return;
>>>> +	}
>>>> +
>>>> +	igt_debug("client: %d pausing for stage %lu\n", c->pid, stage);
>>>> +
>>>> +	stage_in = client_wait_token(c, CLIENT_STAGE);
>>>> +	igt_debug("client: %d stage %lu, expected %lu, stage\n", c->pid, stage_in, stage);
>>>> +
>>>> +	igt_assert_eq(stage_in, stage);
>>>> +}
>>>> +
>>>> +
>>>> +/**
>>>> + * xe_eudebug_session_create:
>>>> + * @fd: XE file descriptor
>>>> + * @work: function passed to the xe_eudebug_client_create
>>>> + * @flags: flags passed to client and debugger
>>>> + * @test_private: test's  data, allocated with MAP_SHARED | MAP_ANONYMOUS,
>>>> + * passed to client and debugger. Can be NULL.
>>>> + *
>>>> + * Creates session together with client and debugger structures.
>>>> + */
>>>> +struct xe_eudebug_session *xe_eudebug_session_create(int fd,
>>>> +						     xe_eudebug_client_work_fn work,
>>>> +						     unsigned int flags,
>>>> +						     void *test_private)
>>>> +{
>>>> +	struct xe_eudebug_session *s;
>>>> +
>>>> +	s = calloc(1, sizeof(*s));
>>>> +	igt_assert(s);
>>>> +
>>>> +	s->c = xe_eudebug_client_create(fd, work, flags, test_private);
>>>> +	s->d = xe_eudebug_debugger_create(fd, flags, test_private);
>>>> +	s->flags = flags;
>>>> +
>>>> +	return s;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_session_run:
>>>> + * @s: pointer to xe_eudebug_session structure
>>>> + *
>>>> + * Attaches debugger to client's proccess, starts debugger's
>>>> + * async event reader, starts client and once client finish
>>>> + * it stops debugger worker.
>>>> + */
>>>> +void xe_eudebug_session_run(struct xe_eudebug_session *s)
>>>> +{
>>>> +	struct xe_eudebug_debugger *debugger = s->d;
>>>> +	struct xe_eudebug_client *client = s->c;
>>>> +
>>>> +	igt_assert_eq(xe_eudebug_debugger_attach(debugger, client), 0);
>>>> +
>>>> +	xe_eudebug_debugger_start_worker(debugger);
>>>> +
>>>> +	xe_eudebug_client_start(client);
>>>> +	xe_eudebug_client_wait_done(client);
>>>> +
>>>> +	xe_eudebug_debugger_stop_worker(debugger, 1);
>>>> +
>>>> +	xe_eudebug_event_log_print(debugger->log, true);
>>>> +	xe_eudebug_event_log_print(client->log, true);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_session_check:
>>>> + * @s: pointer to xe_eudebug_session structure
>>>> + * @match_opposite: indicates whether check should match all
>>>> + * create and destroy events.
>>>> + * @filter: mask that represents events to be skipped during comparison, useful
>>>> + * for events like 'VM_BIND' since they can be asymmetric
>>>> + *
>>>> + * Validate debugger's log against the log created by the client.
>>>> + */
>>>> +void xe_eudebug_session_check(struct xe_eudebug_session *s, bool match_opposite, uint32_t filter)
>>>> +{
>>>> +	xe_eudebug_event_log_compare(s->c->log, s->d->log, filter);
>>>> +
>>>> +	if (match_opposite)
>>>> +		xe_eudebug_event_log_match_opposite(s->d->log, filter);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_session_destroy:
>>>> + * @s: pointer to xe_eudebug_session structure
>>>> + *
>>>> + * Destroy session together with its debugger and client.
>>>> + */
>>>> +void xe_eudebug_session_destroy(struct xe_eudebug_session *s)
>>>> +{
>>>> +	xe_eudebug_debugger_destroy(s->d);
>>>> +	xe_eudebug_client_destroy(s->c);
>>>> +
>>>> +	free(s);
>>>> +}
>>>> +
>>>> +#define to_base(x) ((struct drm_xe_eudebug_event *)&x)
>>>> +
>>>> +static void base_event(struct xe_eudebug_client *c,
>>>> +		       struct drm_xe_eudebug_event *e,
>>>> +		       uint32_t type,
>>>> +		       uint32_t flags,
>>>> +		       uint64_t size)
>>>> +{
>>>> +	e->type = type;
>>>> +	e->flags = flags;
>>>> +	e->seqno = xe_eudebug_client_get_seqno(c);
>>>> +	e->len = size;
>>>> +}
>>>> +
>>>> +static void client_event(struct xe_eudebug_client *c, uint32_t flags, int client_fd)
>>>> +{
>>>> +	struct drm_xe_eudebug_event_client ec;
>>>> +
>>>> +	base_event(c, to_base(ec), DRM_XE_EUDEBUG_EVENT_OPEN, flags, sizeof(ec));
>>>> +
>>>> +	ec.client_handle = client_fd;
>>>> +
>>>> +	xe_eudebug_event_log_write(c->log, (void *)&ec);
>>>> +}
>>>> +
>>>> +static void vm_event(struct xe_eudebug_client *c, uint32_t flags, int client_fd, uint32_t vm_id)
>>>> +{
>>>> +	struct drm_xe_eudebug_event_vm evm;
>>>> +
>>>> +	base_event(c, to_base(evm), DRM_XE_EUDEBUG_EVENT_VM, flags, sizeof(evm));
>>>> +
>>>> +	evm.client_handle = client_fd;
>>>> +	evm.vm_handle = vm_id;
>>>> +
>>>> +	xe_eudebug_event_log_write(c->log, (void *)&evm);
>>>> +}
>>>> +
>>>> +static void exec_queue_event(struct xe_eudebug_client *c, uint32_t flags,
>>>> +			     int client_fd, uint32_t vm_id,
>>>> +			     uint32_t exec_queue_handle, uint16_t class,
>>>> +			     uint16_t width)
>>>> +{
>>>> +	struct drm_xe_eudebug_event_exec_queue ee;
>>>> +
>>>> +	base_event(c, to_base(ee), DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
>>>> +		   flags, sizeof(ee));
>>>> +
>>>> +	ee.client_handle = client_fd;
>>>> +	ee.vm_handle = vm_id;
>>>> +	ee.exec_queue_handle = exec_queue_handle;
>>>> +	ee.engine_class = class;
>>>> +	ee.width = width;
>>>> +
>>>> +	xe_eudebug_event_log_write(c->log, (void *)&ee);
>>>> +}
>>>> +
>>>> +static void metadata_event(struct xe_eudebug_client *c, uint32_t flags,
>>>> +			   int client_fd, uint32_t id, uint64_t type, uint64_t len)
>>>> +{
>>>> +	struct drm_xe_eudebug_event_metadata em;
>>>> +
>>>> +	base_event(c, to_base(em), DRM_XE_EUDEBUG_EVENT_METADATA,
>>>> +		   flags, sizeof(em));
>>>> +
>>>> +	em.client_handle = client_fd;
>>>> +	em.metadata_handle = id;
>>>> +	em.type = type;
>>>> +	em.len = len;
>>>> +
>>>> +	xe_eudebug_event_log_write(c->log, (void *)&em);
>>>> +}
>>>> +
>>>> +static int enable_getset(int fd, bool *old, bool *new)
>>>> +{
>>>> +	static const char * const fname = "enable_eudebug";
>>>> +	int ret = 0;
>>>> +
>>>> +	int sysfs, device_fd;
>>>> +	bool val_before;
>>>> +	struct stat st;
>>>> +
>>>> +	igt_assert(new || old);
>>>> +
>>>> +	igt_assert_eq(fstat(fd, &st), 0);
>>>> +	sysfs = igt_sysfs_open(fd);
>>>> +	if (sysfs < 0)
>>>> +		return -1;
>>>> +
>>>> +	device_fd = openat(sysfs, "device", O_DIRECTORY | O_RDONLY);
>>>> +	close(sysfs);
>>>> +	if (device_fd < 0)
>>>> +		return -1;
>>>> +
>>>> +	if (!__igt_sysfs_get_boolean(device_fd, fname, &val_before)) {
>>>> +		ret = -1;
>>>> +		goto out;
>>>> +	}
>>>> +
>>>> +	igt_debug("enable_eudebug before: %d\n", val_before);
>>>> +
>>>> +	if (old)
>>>> +		*old = val_before;
>>>> +
>>>> +	ret = 0;
>>>> +	if (new) {
>>>> +		if (__igt_sysfs_set_boolean(device_fd, fname, *new))
>>>> +			igt_assert_eq(igt_sysfs_get_boolean(device_fd, fname), *new);
>>>> +		else
>>>> +			ret = -1;
>>>> +	}
>>>> +
>>>> +out:
>>>> +	close(device_fd);
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_enable
>>>> + * @fd: xe client
>>>> + * @enable: state toggle - true to enable, false to disable
>>>> + *
>>>> + * Enables/disables eudebug capability by writing to
>>>> + * '/sys/class/drm/card<N>/device/enable_eudebug' sysfs entry.
>>>> + *
>>>> + * Returns: previous toggle value, i.e. true when eudebugging was enabled,
>>>> + * false when eudebugging was disabled.
>>>> + */
>>>> +bool xe_eudebug_enable(int fd, bool enable)
>>>> +{
>>>> +	bool old = false;
>>>> +	int ret = enable_getset(fd, &old, &enable);
>>>> +
>>>> +	if (ret) {
>>>> +		igt_skip_on(enable);
>>>> +		old = false;
>>>> +	}
>>>> +
>>>> +	return old;
>>>> +}
>>>> +
>>>> +/* Eu debugger wrappers around resource creating xe ioctls. */
>>>> +
>>>> +/**
>>>> + * xe_eudebug_client_open_driver:
>>>> + * @c: pointer to xe_eudebug_client structure
>>>> + *
>>>> + * Calls drm_open_client(DRIVER_XE) and logs the corresponding
>>>> + * event in client's event log.
>>>> + *
>>>> + * Returns: valid DRM file descriptor
>>>> + */
>>>> +int xe_eudebug_client_open_driver(struct xe_eudebug_client *c)
>>>> +{
>>>> +	int fd;
>>>> +
>>>> +	fd = drm_reopen_driver(c->master_fd);
>>>> +	client_event(c, DRM_XE_EUDEBUG_EVENT_CREATE, fd);
>>>> +
>>>> +	return fd;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_client_close_driver:
>>>> + * @c: pointer to xe_eudebug_client structure
>>>> + * @fd: xe client
>>>> + *
>>>> + * Calls close driver and logs the corresponding event in
>>>> + * client's event log.
>>>> + */
>>>> +void xe_eudebug_client_close_driver(struct xe_eudebug_client *c, int fd)
>>>> +{
>>>> +	client_event(c, DRM_XE_EUDEBUG_EVENT_DESTROY, fd);
>>>> +	close(fd);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_client_vm_create:
>>>> + * @c: pointer to xe_eudebug_client structure
>>>> + * @fd: xe client
>>>> + * @flags: vm bind flags
>>>> + * @ext: pointer to the first user extension
>>>> + *
>>>> + * Calls xe_vm_create() and logs corresponding events
>>>> + * (including vm set metadata events) in client's event log.
>>>> + *
>>>> + * Returns: valid vm handle
>>>> + */
>>>> +uint32_t xe_eudebug_client_vm_create(struct xe_eudebug_client *c, int fd,
>>>> +				     uint32_t flags, uint64_t ext)
>>>> +{
>>>> +	uint32_t vm;
>>>> +
>>>> +	vm = xe_vm_create(fd, flags, ext);
>>>> +	vm_event(c, DRM_XE_EUDEBUG_EVENT_CREATE, fd, vm);
>>>> +
>>>> +	return vm;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_client_vm_destroy:
>>>> + * @c: pointer to xe_eudebug_client structure
>>>> + * fd: xe client
>>>> + * vm: vm handle
>>>> + *
>>>> + * Calls xe_vm_destroy() and logs the corresponding event in
>>>> + * client's event log.
>>>> + */
>>>> +void xe_eudebug_client_vm_destroy(struct xe_eudebug_client *c, int fd, uint32_t vm)
>>>> +{
>>>> +	xe_vm_destroy(fd, vm);
>>>> +	vm_event(c, DRM_XE_EUDEBUG_EVENT_DESTROY, fd, vm);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_client_exec_queue_create:
>>>> + * @c: pointer to xe_eudebug_client structure
>>>> + * @fd: xe client
>>>> + * @create: exec_queue create drm struct
>>>> + *
>>>> + * Calls xe exec queue create ioctl and logs the corresponding event in
>>>> + * client's event log.
>>>> + *
>>>> + * Returns: valid exec queue handle
>>>> + */
>>>> +uint32_t xe_eudebug_client_exec_queue_create(struct xe_eudebug_client *c, int fd,
>>>> +					     struct drm_xe_exec_queue_create *create)
>>>> +{
>>>> +	uint16_t class = ((struct drm_xe_engine_class_instance *)(create->instances))[0].engine_class;
>>>> +
>>>> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, create), 0);
>>>> +
>>>> +	if (class == DRM_XE_ENGINE_CLASS_COMPUTE || class == DRM_XE_ENGINE_CLASS_RENDER)
>>>> +		exec_queue_event(c, DRM_XE_EUDEBUG_EVENT_CREATE, fd, create->vm_id,
>>>> +				 create->exec_queue_id, class, create->width);
>>>> +
>>>> +	return create->exec_queue_id;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_client_exec_queue_destroy:
>>>> + * @c: pointer to xe_eudebug_client structure
>>>> + * @fd: xe client
>>>> + * @create: exec_queue create drm struct which was used for creation
>>>> + *
>>>> + * Calls xe exec_queue destroy ioctl and logs the corresponding event in
>>>> + * client's event log.
>>>> + */
>>>> +void xe_eudebug_client_exec_queue_destroy(struct xe_eudebug_client *c, int fd,
>>>> +					  struct drm_xe_exec_queue_create *create)
>>>> +{
>>>> +	struct drm_xe_exec_queue_destroy destroy = { .exec_queue_id = create->exec_queue_id, };
>>>> +	uint16_t class = ((struct drm_xe_engine_class_instance *)(create->instances))[0].engine_class;
>>>> +
>>>> +	if (class == DRM_XE_ENGINE_CLASS_COMPUTE || class == DRM_XE_ENGINE_CLASS_RENDER)
>>>> +		exec_queue_event(c, DRM_XE_EUDEBUG_EVENT_DESTROY, fd, create->vm_id,
>>>> +				 create->exec_queue_id, class, create->width);
>>>> +
>>>> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, &destroy), 0);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_client_vm_bind_event:
>>>> + * @c: pointer to xe_eudebug_client structure
>>>> + * @event_flags: base event flags
>>>> + * @fd: xe client
>>>> + * @vm: vm handle
>>>> + * @bind_flags: bind flags of vm_bind_event
>>>> + * @num_binds: number of bind (operations) for event
>>>> + * @ref_seqno: base vm bind reference seqno
>>>> + * Logs vm bind event in client's event log.
>>>> + */
>>>> +void xe_eudebug_client_vm_bind_event(struct xe_eudebug_client *c,
>>>> +				     uint32_t event_flags, int fd,
>>>> +				     uint32_t vm, uint32_t bind_flags,
>>>> +				     uint32_t num_binds, u64 *ref_seqno)
>>>> +{
>>>> +	struct drm_xe_eudebug_event_vm_bind evmb;
>>>> +
>>>> +	base_event(c, to_base(evmb), DRM_XE_EUDEBUG_EVENT_VM_BIND,
>>>> +		   event_flags, sizeof(evmb));
>>>> +	evmb.client_handle = fd;
>>>> +	evmb.vm_handle = vm;
>>>> +	evmb.flags = bind_flags;
>>>> +	evmb.num_binds = num_binds;
>>>> +
>>>> +	*ref_seqno = evmb.base.seqno;
>>>> +
>>>> +	xe_eudebug_event_log_write(c->log, (void *)&evmb);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_client_vm_bind_op_event:
>>>> + * @c: pointer to xe_eudebug_client structure
>>>> + * @event_flags: base event flags
>>>> + * @bind_ref_seqno: base vm bind reference seqno
>>>> + * @op_ref_seqno: output, the vm_bind_op event seqno
>>>> + * @addr: ppgtt address
>>>> + * @size: size of the binding
>>>> + * @num_extensions: number of vm bind op extensions
>>>> + *
>>>> + * Logs vm bind op event in client's event log.
>>>> + */
>>>> +void xe_eudebug_client_vm_bind_op_event(struct xe_eudebug_client *c, uint32_t event_flags,
>>>> +					uint64_t bind_ref_seqno, uint64_t *op_ref_seqno,
>>>> +					uint64_t addr, uint64_t range,
>>>> +					uint64_t num_extensions)
>>>> +{
>>>> +	struct drm_xe_eudebug_event_vm_bind_op op;
>>>> +
>>>> +	base_event(c, to_base(op), DRM_XE_EUDEBUG_EVENT_VM_BIND_OP,
>>>> +		   event_flags, sizeof(op));
>>>> +	op.vm_bind_ref_seqno = bind_ref_seqno;
>>>> +	op.addr = addr;
>>>> +	op.range = range;
>>>> +	op.num_extensions = num_extensions;
>>>> +
>>>> +	*op_ref_seqno = op.base.seqno;
>>>> +
>>>> +	xe_eudebug_event_log_write(c->log, (void *)&op);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_client_vm_bind_op_metadata_event:
>>>> + * @c: pointer to xe_eudebug_client structure
>>>> + * @event_flags: base event flags
>>>> + * @op_ref_seqno: base vm bind op reference seqno
>>>> + * @metadata_handle: metadata handle
>>>> + * @metadata_cookie: metadata cookie
>>>> + *
>>>> + * Logs vm bind op metadata event in client's event log.
>>>> + */
>>>> +void xe_eudebug_client_vm_bind_op_metadata_event(struct xe_eudebug_client *c,
>>>> +						 uint32_t event_flags, uint64_t op_ref_seqno,
>>>> +						 uint64_t metadata_handle, uint64_t metadata_cookie)
>>>> +{
>>>> +	struct drm_xe_eudebug_event_vm_bind_op_metadata op;
>>>> +
>>>> +	base_event(c, to_base(op), DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA,
>>>> +		   event_flags, sizeof(op));
>>>> +	op.vm_bind_op_ref_seqno = op_ref_seqno;
>>>> +	op.metadata_handle = metadata_handle;
>>>> +	op.metadata_cookie = metadata_cookie;
>>>> +
>>>> +	xe_eudebug_event_log_write(c->log, (void *)&op);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_client_vm_bind_ufence_event:
>>>> + * @c: pointer to xe_eudebug_client structure
>>>> + * @event_flags: base event flags
>>>> + * @ref_seqno: base vm bind event seqno
>>>> + *
>>>> + * Logs vm bind ufence event in client's event log.
>>>> + */
>>>> +void xe_eudebug_client_vm_bind_ufence_event(struct xe_eudebug_client *c, uint32_t event_flags,
>>>> +					    uint64_t ref_seqno)
>>>> +{
>>>> +	struct drm_xe_eudebug_event_vm_bind_ufence f;
>>>> +
>>>> +	base_event(c, to_base(f), DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
>>>> +		   event_flags, sizeof(f));
>>>> +	f.vm_bind_ref_seqno = ref_seqno;
>>>> +
>>>> +	xe_eudebug_event_log_write(c->log, (void *)&f);
>>>> +}
>>>> +
>>>> +static bool has_user_fence(const struct drm_xe_sync *sync, uint32_t num_syncs)
>>>> +{
>>>> +	while (num_syncs--)
>>>> +		if (sync[num_syncs].type == DRM_XE_SYNC_TYPE_USER_FENCE)
>>>> +			return true;
>>>> +
>>>> +	return false;
>>>> +}
>>>> +
>>>> +#define for_each_metadata(__m, __ext)					\
>>>> +	for ((__m) = from_user_pointer(__ext);				\
>>>> +	     (__m);							\
>>>> +	     (__m) = from_user_pointer((__m)->base.next_extension))	\
>>>> +		if ((__m)->base.name == XE_VM_BIND_OP_EXTENSIONS_ATTACH_DEBUG)
>>>> +
>>>> +static int  __xe_eudebug_client_vm_bind(struct xe_eudebug_client *c,
>>>> +					int fd, uint32_t vm, uint32_t exec_queue,
>>>> +					uint32_t bo, uint64_t offset,
>>>> +					uint64_t addr, uint64_t size,
>>>> +					uint32_t op, uint32_t flags,
>>>> +					struct drm_xe_sync *sync,
>>>> +					uint32_t num_syncs,
>>>> +					uint32_t prefetch_region,
>>>> +					uint8_t pat_index, uint64_t op_ext)
>>>> +{
>>>> +	struct drm_xe_vm_bind_op_ext_attach_debug *metadata;
>>>> +	const bool ufence = has_user_fence(sync, num_syncs);
>>>> +	const uint32_t bind_flags = ufence ?
>>>> +		DRM_XE_EUDEBUG_EVENT_VM_BIND_FLAG_UFENCE : 0;
>>>> +	uint64_t seqno = 0, op_seqno = 0, num_metadata = 0;
>>>> +	uint32_t bind_base_flags = 0;
>>>> +	int ret;
>>>> +
>>>> +	for_each_metadata(metadata, op_ext)
>>>> +		num_metadata++;
>>>> +
>>>> +	switch (op) {
>>>> +	case DRM_XE_VM_BIND_OP_MAP:
>>>> +		bind_base_flags = DRM_XE_EUDEBUG_EVENT_CREATE;
>>>> +		break;
>>>> +	case DRM_XE_VM_BIND_OP_UNMAP:
>>>> +		bind_base_flags = DRM_XE_EUDEBUG_EVENT_DESTROY;
>>>> +		igt_assert_eq(num_metadata, 0);
>>>> +		igt_assert_eq(ufence, false);
>>>> +		break;
>>>> +	default:
>>>> +		/* XXX unmap all? */
>>>> +		igt_assert(op);
>>>> +		break;
>>>> +	}
>>>> +
>>>> +	ret = ___xe_vm_bind(fd, vm, exec_queue, bo, offset, addr, size,
>>>> +			    op, flags, sync, num_syncs, prefetch_region,
>>>> +			    pat_index, 0, op_ext);
>>>> +
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	if (!bind_base_flags)
>>>> +		return -EINVAL;
>>>> +
>>>> +	xe_eudebug_client_vm_bind_event(c, DRM_XE_EUDEBUG_EVENT_STATE_CHANGE,
>>>> +					fd, vm, bind_flags, 1, &seqno);
>>>> +	xe_eudebug_client_vm_bind_op_event(c, bind_base_flags,
>>>> +					   seqno, &op_seqno, addr, size,
>>>> +					   num_metadata);
>>>> +
>>>> +	for_each_metadata(metadata, op_ext)
>>>> +		xe_eudebug_client_vm_bind_op_metadata_event(c,
>>>> +							    DRM_XE_EUDEBUG_EVENT_CREATE,
>>>> +							    op_seqno,
>>>> +							    metadata->metadata_id,
>>>> +							    metadata->cookie);
>>>> +	if (ufence)
>>>> +		xe_eudebug_client_vm_bind_ufence_event(c, DRM_XE_EUDEBUG_EVENT_CREATE |
>>>> +						       DRM_XE_EUDEBUG_EVENT_NEED_ACK,
>>>> +						       seqno);
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static void _xe_eudebug_client_vm_bind(struct xe_eudebug_client *c, int fd,
>>>> +				       uint32_t vm, uint32_t bo,
>>>> +				       uint64_t offset, uint64_t addr, uint64_t size,
>>>> +				       uint32_t op,
>>>> +				       uint32_t flags,
>>>> +				       struct drm_xe_sync *sync,
>>>> +				       uint32_t num_syncs,
>>>> +				       uint64_t op_ext)
>>>> +{
>>>> +	const uint32_t exec_queue_id = 0;
>>>> +	const uint32_t prefetch_region = 0;
>>>> +
>>>> +	igt_assert_eq(__xe_eudebug_client_vm_bind(c, fd, vm, exec_queue_id, bo, offset,
>>>> +						  addr, size, op, flags,
>>>> +						  sync, num_syncs, prefetch_region,
>>>> +						  DEFAULT_PAT_INDEX, op_ext),
>>>> +		      0);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_client_vm_bind_flags
>>>> + * @c: pointer to xe_eudebug_client structure
>>>> + * @fd: xe client
>>>> + * @vm: vm handle
>>>> + * @bo: buffer object handle
>>>> + * @offset: offset within buffer object
>>>> + * @addr: ppgtt address
>>>> + * @size: size of the binding
>>>> + * @flags: vm_bind flags
>>>> + * @sync: sync objects
>>>> + * @num_syncs: number of sync objects
>>>> + * @op_ext: BIND_OP extensions
>>>> + *
>>>> + * Calls xe vm_bind ioctl and logs the corresponding event in client's event log.
>>>> + */
>>>> +void xe_eudebug_client_vm_bind_flags(struct xe_eudebug_client *c, int fd, uint32_t vm,
>>>> +				     uint32_t bo, uint64_t offset,
>>>> +				     uint64_t addr, uint64_t size, uint32_t flags,
>>>> +				     struct drm_xe_sync *sync, uint32_t num_syncs,
>>>> +				     uint64_t op_ext)
>>>> +{
>>>> +	_xe_eudebug_client_vm_bind(c, fd, vm, bo, offset, addr, size,
>>>> +				   DRM_XE_VM_BIND_OP_MAP, flags,
>>>> +				   sync, num_syncs, op_ext);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_client_vm_bind
>>>> + * @c: pointer to xe_eudebug_client structure
>>>> + * @fd: xe client
>>>> + * @vm: vm handle
>>>> + * @bo: buffer object handle
>>>> + * @offset: offset within buffer object
>>>> + * @addr: ppgtt address
>>>> + * @size: size of the binding
>>>> + *
>>>> + * Calls xe vm_bind ioctl and logs the corresponding event in client's event log.
>>>> + */
>>>> +void xe_eudebug_client_vm_bind(struct xe_eudebug_client *c, int fd, uint32_t vm,
>>>> +			       uint32_t bo, uint64_t offset,
>>>> +			       uint64_t addr, uint64_t size)
>>>> +{
>>>> +	const uint32_t flags = 0;
>>>> +	struct drm_xe_sync *sync = NULL;
>>>> +	const uint32_t num_syncs = 0;
>>>> +	const uint64_t op_ext = 0;
>>>> +
>>>> +	xe_eudebug_client_vm_bind_flags(c, fd, vm, bo, offset, addr, size,
>>>> +					flags,
>>>> +					sync, num_syncs, op_ext);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_client_vm_unbind_flags
>>>> + * @c: pointer to xe_eudebug_client structure
>>>> + * @fd: xe client
>>>> + * @vm: vm handle
>>>> + * @offset: offset
>>>> + * @addr: ppgtt address
>>>> + * @size: size of the binding
>>>> + * @flags: vm_bind flags
>>>> + * @sync: sync objects
>>>> + * @num_syncs: number of sync objects
>>>> + *
>>>> + * Calls xe vm_unbind ioctl and logs the corresponding event in client's event log.
>>>> + */
>>>> +void xe_eudebug_client_vm_unbind_flags(struct xe_eudebug_client *c, int fd,
>>>> +				       uint32_t vm, uint64_t offset,
>>>> +				       uint64_t addr, uint64_t size, uint32_t flags,
>>>> +				       struct drm_xe_sync *sync, uint32_t num_syncs)
>>>> +{
>>>> +	_xe_eudebug_client_vm_bind(c, fd, vm, 0, offset, addr, size,
>>>> +				   DRM_XE_VM_BIND_OP_UNMAP, flags,
>>>> +				   sync, num_syncs, 0);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_client_vm_unbind
>>>> + * @c: pointer to xe_eudebug_client structure
>>>> + * @fd: xe client
>>>> + * @vm: vm handle
>>>> + * @offset: offset
>>>> + * @addr: ppgtt address
>>>> + * @size: size of the binding
>>>> + *
>>>> + * Calls xe vm_unbind ioctl and logs the corresponding event in client's event log.
>>>> + */
>>>> +void xe_eudebug_client_vm_unbind(struct xe_eudebug_client *c, int fd, uint32_t vm,
>>>> +				 uint64_t offset, uint64_t addr, uint64_t size)
>>>> +{
>>>> +	const uint32_t flags = 0;
>>>> +	struct drm_xe_sync *sync = NULL;
>>>> +	const uint32_t num_syncs = 0;
>>>> +
>>>> +	xe_eudebug_client_vm_unbind_flags(c, fd, vm, offset, addr, size,
>>>> +					  flags, sync, num_syncs);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_client_metadata_create:
>>>> + * @c: pointer to xe_eudebug_client structure
>>>> + * @fd: xe client
>>>> + * @type: debug metadata type
>>>> + * @len: size of @data
>>>> + * @data: debug metadata paylad
>>>> + *
>>>> + * Calls xe metadata create ioctl and logs the corresponding event in
>>>> + * client's event log.
>>>> + *
>>>> + * Return: valid debug metadata id.
>>>> + */
>>>> +uint32_t xe_eudebug_client_metadata_create(struct xe_eudebug_client *c, int fd,
>>>> +					   int type, size_t len, void *data)
>>>> +{
>>>> +	struct drm_xe_debug_metadata_create create = {
>>>> +		.type = type,
>>>> +		.user_addr = to_user_pointer(data),
>>>> +		.len = len
>>>> +	};
>>>> +
>>>> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEBUG_METADATA_CREATE, &create), 0);
>>>> +
>>>> +	metadata_event(c, DRM_XE_EUDEBUG_EVENT_CREATE, fd, create.metadata_id, type, len);
>>>> +
>>>> +	return create.metadata_id;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_eudebug_client_metadata_destroy:
>>>> + * @c: pointer to xe_eudebug_client structure
>>>> + * @fd: xe client
>>>> + * @id: xe debug metadata handle
>>>> + * @type: debug metadata type
>>>> + * @len: size of debug metadata payload
>>>> + *
>>>> + * Calls xe metadata destroy ioctl and logs the corresponding event in
>>>> + * client's event log.
>>>> + */
>>>> +void xe_eudebug_client_metadata_destroy(struct xe_eudebug_client *c, int fd,
>>>> +					uint32_t id, int type, size_t len)
>>>> +{
>>>> +	struct drm_xe_debug_metadata_destroy destroy = { .metadata_id = id };
>>>> +
>>>> +
>>>> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEBUG_METADATA_DESTROY, &destroy), 0);
>>>> +
>>>> +	metadata_event(c, DRM_XE_EUDEBUG_EVENT_DESTROY, fd, id, type, len);
>>>> +}
>>>> +
>>>> +void xe_eudebug_ack_ufence(int debugfd,
>>>> +			   const struct drm_xe_eudebug_event_vm_bind_ufence *f)
>>>> +{
>>>> +	struct drm_xe_eudebug_ack_event ack = { 0, };
>>>> +	char event_str[XE_EUDEBUG_EVENT_STRING_MAX_LEN];
>>>> +
>>>> +	ack.type = f->base.type;
>>>> +	ack.seqno = f->base.seqno;
>>>> +
>>>> +	xe_eudebug_event_to_str((void *)f, event_str, XE_EUDEBUG_EVENT_STRING_MAX_LEN);
>>>> +	igt_debug("delivering ack for event: %s\n", event_str);
>>>> +	igt_assert_eq(igt_ioctl(debugfd, DRM_XE_EUDEBUG_IOCTL_ACK_EVENT, &ack), 0);
>>>> +}
>>>> diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
>>>> new file mode 100644
>>>> index 000000000..444f5a7b7
>>>> --- /dev/null
>>>> +++ b/lib/xe/xe_eudebug.h
>>>> @@ -0,0 +1,206 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright © 2023 Intel Corporation
>>>> + */
>>>> +#include <fcntl.h>
>>>> +#include <pthread.h>
>>>> +#include <stdint.h>
>>>> +#include <xe_drm.h>
>>>> +
>>>> +#include "igt_list.h"
>>>> +
>>>> +struct xe_eudebug_event_log {
>>>> +	uint8_t *log;
>>>> +	unsigned int head;
>>>> +	unsigned int max_size;
>>>> +	char name[80];
>>>> +	pthread_mutex_t lock;
>>>> +};
>>>> +
>>>> +struct xe_eudebug_debugger {
>>>> +	int fd;
>>>> +	uint64_t flags;
>>>> +
>>>> +	/* Used to smuggle private data */
>>>> +	void *ptr;
>>>> +
>>>> +	struct xe_eudebug_event_log *log;
>>>> +
>>>> +	uint64_t event_count;
>>>> +
>>>> +	uint64_t target_pid;
>>>> +
>>>> +	struct igt_list_head triggers;
>>>> +
>>>> +	int master_fd;
>>>> +
>>>> +	pthread_t worker_thread;
>>>> +	int worker_state;
>>>> +
>>>> +	int p_client[2];
>>>> +};
>>>> +
>>>> +struct xe_eudebug_client {
>>>> +	int pid;
>>>> +	uint64_t seqno;
>>>> +	uint64_t flags;
>>>> +
>>>> +	/* Used to smuggle private data */
>>>> +	void *ptr;
>>>> +
>>>> +	struct xe_eudebug_event_log *log;
>>>> +
>>>> +	int done;
>>>> +	int p_in[2];
>>>> +	int p_out[2];
>>>> +
>>>> +	/* Used to pickup right device (the one used in debugger) */
>>>> +	int master_fd;
>>>> +
>>>> +	int timeout_ms;
>>>> +};
>>>> +
>>>> +struct xe_eudebug_session {
>>>> +	uint64_t flags;
>>>> +	struct xe_eudebug_client *c;
>>>> +	struct xe_eudebug_debugger *d;
>>>> +};
>>>> +
>>>> +typedef void (*xe_eudebug_client_work_fn)(struct xe_eudebug_client *);
>>>> +typedef void (*xe_eudebug_trigger_fn)(struct xe_eudebug_debugger *,
>>>> +				      struct drm_xe_eudebug_event *);
>>>> +
>>>> +#define xe_eudebug_for_each_event(_e, _log) \
>>>> +	for ((_e) = (_e) ? (void *)(uint8_t *)(_e) + (_e)->len : \
>>>> +		    (void *)(_log)->log; \
>>>> +	    (uint8_t *)(_e) < (_log)->log + (_log)->head; \
>>>> +	    (_e) = (void *)(uint8_t *)(_e) + (_e)->len)
>>>> +
>>>> +#define xe_eudebug_assert(d, c)						\
>>>> +	do {								\
>>>> +		if (!(c)) {						\
>>>> +			xe_eudebug_event_log_print((d)->log, true);	\
>>>> +			igt_assert(c);					\
>>>> +		}							\
>>>> +	} while (0)
>>>> +
>>>> +#define xe_eudebug_assert_f(d, c, f...)					\
>>>> +	do {								\
>>>> +		if (!(c)) {						\
>>>> +			xe_eudebug_event_log_print((d)->log, true);	\
>>>> +			igt_assert_f(c, f);				\
>>>> +		}							\
>>>> +	} while (0)
>>>> +
>>>> +#define XE_EUDEBUG_EVENT_STRING_MAX_LEN		4096
>>>> +
>>>> +/*
>>>> + * Default abort timeout to use across xe_eudebug lib and tests if no specific
>>>> + * timeout value is required.
>>>> + */
>>>> +#define XE_EUDEBUG_DEFAULT_TIMEOUT_MS		25000ULL
>>>> +
>>>> +#define XE_EUDEBUG_FILTER_EVENT_NONE		BIT(DRM_XE_EUDEBUG_EVENT_NONE)
>>>> +#define XE_EUDEBUG_FILTER_EVENT_READ		BIT(DRM_XE_EUDEBUG_EVENT_READ)
>>>> +#define XE_EUDEBUG_FILTER_EVENT_OPEN		BIT(DRM_XE_EUDEBUG_EVENT_OPEN)
>>>> +#define XE_EUDEBUG_FILTER_EVENT_VM		BIT(DRM_XE_EUDEBUG_EVENT_VM)
>>>> +#define XE_EUDEBUG_FILTER_EVENT_EXEC_QUEUE	BIT(DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE)
>>>> +#define XE_EUDEBUG_FILTER_EVENT_EU_ATTENTION	BIT(DRM_XE_EUDEBUG_EVENT_EU_ATTENTION)
>>>> +#define XE_EUDEBUG_FILTER_EVENT_VM_BIND		BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND)
>>>> +#define XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP	BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_OP)
>>>> +#define XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE  BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE)
>>>> +#define XE_EUDEBUG_FILTER_ALL			GENMASK(DRM_XE_EUDEBUG_EVENT_MAX_EVENT, 0)
>>>> +#define XE_EUDEBUG_EVENT_IS_FILTERED(_e, _f)	((1UL << _e) & _f)
>>>> +
>>>> +int xe_eudebug_connect(int fd, pid_t pid, uint32_t flags);
>>>> +const char *xe_eudebug_event_to_str(struct drm_xe_eudebug_event *e, char *buf, size_t len);
>>>> +struct drm_xe_eudebug_event *
>>>> +xe_eudebug_event_log_find_seqno(struct xe_eudebug_event_log *l, uint64_t seqno);
>>>> +struct xe_eudebug_event_log *
>>>> +xe_eudebug_event_log_create(const char *name, unsigned int max_size);
>>>> +void xe_eudebug_event_log_destroy(struct xe_eudebug_event_log *l);
>>>> +void xe_eudebug_event_log_print(struct xe_eudebug_event_log *l, bool debug);
>>>> +void xe_eudebug_event_log_compare(struct xe_eudebug_event_log *c, struct xe_eudebug_event_log *d,
>>>> +				  uint32_t filter);
>>>> +void xe_eudebug_event_log_write(struct xe_eudebug_event_log *l, struct drm_xe_eudebug_event *e);
>>>> +void xe_eudebug_event_log_match_opposite(struct xe_eudebug_event_log *l, uint32_t filter);
>>>> +
>>>> +bool xe_eudebug_debugger_available(int fd);
>>>> +struct xe_eudebug_debugger *
>>>> +xe_eudebug_debugger_create(int xe, uint64_t flags, void *data);
>>>> +void xe_eudebug_debugger_destroy(struct xe_eudebug_debugger *d);
>>>> +int xe_eudebug_debugger_attach(struct xe_eudebug_debugger *d, struct xe_eudebug_client *c);
>>>> +void xe_eudebug_debugger_start_worker(struct xe_eudebug_debugger *d);
>>>> +void xe_eudebug_debugger_stop_worker(struct xe_eudebug_debugger *d, int timeout_s);
>>>> +void xe_eudebug_debugger_dettach(struct xe_eudebug_debugger *d);
>>>> +void xe_eudebug_debugger_set_data(struct xe_eudebug_debugger *c, void *ptr);
>>>> +void xe_eudebug_debugger_add_trigger(struct xe_eudebug_debugger *d, int type,
>>>> +				     xe_eudebug_trigger_fn fn);
>>>> +void xe_eudebug_debugger_signal_stage(struct xe_eudebug_debugger *d, uint64_t stage);
>>>> +void xe_eudebug_debugger_wait_stage(struct xe_eudebug_session *s, uint64_t stage);
>>>> +
>>>> +struct xe_eudebug_client *
>>>> +xe_eudebug_client_create(int xe, xe_eudebug_client_work_fn work, uint64_t flags, void *data);
>>>> +void xe_eudebug_client_destroy(struct xe_eudebug_client *c);
>>>> +void xe_eudebug_client_start(struct xe_eudebug_client *c);
>>>> +void xe_eudebug_client_stop(struct xe_eudebug_client *c);
>>>> +void xe_eudebug_client_wait_done(struct xe_eudebug_client *c);
>>>> +void xe_eudebug_client_signal_stage(struct xe_eudebug_client *c, uint64_t stage);
>>>> +void xe_eudebug_client_wait_stage(struct xe_eudebug_client *c, uint64_t stage);
>>>> +
>>>> +uint64_t xe_eudebug_client_get_seqno(struct xe_eudebug_client *c);
>>>> +void xe_eudebug_client_set_data(struct xe_eudebug_client *c, void *ptr);
>>>> +
>>>> +bool xe_eudebug_enable(int fd, bool enable);
>>>> +
>>>> +int xe_eudebug_client_open_driver(struct xe_eudebug_client *c);
>>>> +void xe_eudebug_client_close_driver(struct xe_eudebug_client *c, int fd);
>>>> +uint32_t xe_eudebug_client_vm_create(struct xe_eudebug_client *c, int fd,
>>>> +				     uint32_t flags, uint64_t ext);
>>>> +void xe_eudebug_client_vm_destroy(struct xe_eudebug_client *c, int fd, uint32_t vm);
>>>> +uint32_t xe_eudebug_client_exec_queue_create(struct xe_eudebug_client *c, int fd,
>>>> +					     struct drm_xe_exec_queue_create *create);
>>>> +void xe_eudebug_client_exec_queue_destroy(struct xe_eudebug_client *c, int fd,
>>>> +					  struct drm_xe_exec_queue_create *create);
>>>> +void xe_eudebug_client_vm_bind_event(struct xe_eudebug_client *c, uint32_t event_flags, int fd,
>>>> +				     uint32_t vm, uint32_t bind_flags,
>>>> +				     uint32_t num_ops, uint64_t *ref_seqno);
>>>> +void xe_eudebug_client_vm_bind_op_event(struct xe_eudebug_client *c, uint32_t event_flags,
>>>> +					uint64_t ref_seqno, uint64_t *op_ref_seqno,
>>>> +					uint64_t addr, uint64_t range,
>>>> +					uint64_t num_extensions);
>>>> +void xe_eudebug_client_vm_bind_op_metadata_event(struct xe_eudebug_client *c,
>>>> +						 uint32_t event_flags, uint64_t op_ref_seqno,
>>>> +						 uint64_t metadata_handle, uint64_t metadata_cookie);
>>>> +void xe_eudebug_client_vm_bind_ufence_event(struct xe_eudebug_client *c, uint32_t event_flags,
>>>> +					    uint64_t ref_seqno);
>>>> +void xe_eudebug_ack_ufence(int debugfd,
>>>> +			   const struct drm_xe_eudebug_event_vm_bind_ufence *f);
>>>> +
>>>> +void xe_eudebug_client_vm_bind_flags(struct xe_eudebug_client *c, int fd, uint32_t vm,
>>>> +				     uint32_t bo, uint64_t offset,
>>>> +				     uint64_t addr, uint64_t size, uint32_t flags,
>>>> +				     struct drm_xe_sync *sync, uint32_t num_syncs,
>>>> +				     uint64_t op_ext);
>>>> +void xe_eudebug_client_vm_bind(struct xe_eudebug_client *c, int fd, uint32_t vm,
>>>> +			       uint32_t bo, uint64_t offset,
>>>> +			       uint64_t addr, uint64_t size);
>>>> +void xe_eudebug_client_vm_unbind_flags(struct xe_eudebug_client *c, int fd,
>>>> +				       uint32_t vm, uint64_t offset,
>>>> +				       uint64_t addr, uint64_t size, uint32_t flags,
>>>> +				       struct drm_xe_sync *sync, uint32_t num_syncs);
>>>> +void xe_eudebug_client_vm_unbind(struct xe_eudebug_client *c, int fd, uint32_t vm,
>>>> +				 uint64_t offset, uint64_t addr, uint64_t size);
>>>> +
>>>> +uint32_t xe_eudebug_client_metadata_create(struct xe_eudebug_client *c, int fd,
>>>> +					   int type, size_t len, void *data);
>>>> +void xe_eudebug_client_metadata_destroy(struct xe_eudebug_client *c, int fd,
>>>> +					uint32_t id, int type, size_t len);
>>>> +
>>>> +struct xe_eudebug_session *xe_eudebug_session_create(int fd,
>>>> +						     xe_eudebug_client_work_fn work,
>>>> +						     unsigned int flags,
>>>> +						     void *test_private);
>>>> +void xe_eudebug_session_destroy(struct xe_eudebug_session *s);
>>>> +void xe_eudebug_session_run(struct xe_eudebug_session *s);
>>>> +void xe_eudebug_session_check(struct xe_eudebug_session *s, bool match_opposite, uint32_t filter);
>>>> -- 
>>>> 2.34.1
>>>>
