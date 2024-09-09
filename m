Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE43ECE579
	for <igt-dev@archiver.kernel.org>; Mon,  9 Sep 2024 08:47:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A942110E331;
	Mon,  9 Sep 2024 08:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gw+++9B5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60BF10E331
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Sep 2024 08:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725871627; x=1757407627;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1O4aDrNXPvQ+3cDQA9VpgDfjqjTfNzW4guEY4eSIRDA=;
 b=Gw+++9B5AI2lJyvfUF6H1SzCgEAaVA23mFCdEZDJh4lXhQEWku/iWQ76
 /G1MEWCRUvO1uQOngz3Cw5VuDyU7dzpQnUK516VdmxGNIRgZNMvspnKpM
 zxHgxVfqApfO5Vj1D8IaLEawEHRP66Y93HAaNON1t+q/cpyr+BxQsO2qo
 axg6hNsTIe2phPeGY8+R5ObCOg+qaP26aQiMyjNX14HujwcJJ7CFHoU3Y
 hQhTamysmDcYmFq52Zp30kBGnpPRkX0nJjvRtidvTRSRYKBTz5Wt1rus2
 yOzJqF8hRVsEHdFVPbnkOil74qijUx4OjBJ0OKZI4k8AsbfpxZ0GGPtTD g==;
X-CSE-ConnectionGUID: sZO3J87QRUK09gacF7xTZA==
X-CSE-MsgGUID: UN8xbovFR3uI/DM33tXyCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="28336875"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="28336875"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 01:47:07 -0700
X-CSE-ConnectionGUID: X9CE4wjJQzOA2K6QuTsdMw==
X-CSE-MsgGUID: pZY27gxPSL6cazaZFPZuvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="97312790"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.143])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 01:47:02 -0700
Date: Mon, 9 Sep 2024 10:46:58 +0200
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
Subject: Re: [PATCH i-g-t v6 11/17] lib/xe_eudebug: Introduce eu debug
 testing framework
Message-ID: <20240909084658.sx77z5dvo5w456qy@zkempczy-mobl2>
References: <20240905092812.94553-1-christoph.manszewski@intel.com>
 <20240905092812.94553-12-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240905092812.94553-12-christoph.manszewski@intel.com>
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

On Thu, Sep 05, 2024 at 11:28:06AM +0200, Christoph Manszewski wrote:
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> 
> Introduce library which simplifies testing of eu debug capability.
> The library provides event log helpers together with asynchronous
> abstraction for client proccess and the debugger itself.
> 
> xe_eudebug_client creates its own proccess with user's work function,
> and gives machanisms to synchronize beginning of execution and event
> logging.
> 
> xe_eudebug_debugger allows to attach to the given proccess, provides
> asynchronous thread for event reading and introduces triggers - a
> callback mechanism triggered every time subscribed event was read.
> 
> To build the eudebug testing framework 'xe_eudebug' meson build option
> has to be enabled, as it is disabled by default.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuaoppala@linux.intel.com>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>  lib/meson.build     |    5 +
>  lib/xe/xe_eudebug.c | 2249 +++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_eudebug.h |  218 +++++
>  meson.build         |    2 +
>  meson_options.txt   |    5 +
>  5 files changed, 2479 insertions(+)
>  create mode 100644 lib/xe/xe_eudebug.c
>  create mode 100644 lib/xe/xe_eudebug.h

That's my final review. I left only things which may/should be addressed
in the future.

> +static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)

I wonder what's for is passing pipe array instead of just one fd.
fd[0] is always for read, so passing fd[1] here doesn't make sense
(apart of int pipe[2] just points there is a pipe).
> +{
> +	int ret;
> +	int t = 0;
> +	struct pollfd fd = {
> +		.fd = pipe[0],
> +		.events = POLLIN,
> +		.revents = 0
> +	};
> +
> +	/* When child fails we may get stuck forever. Check whether
> +	 * the child process ended with an error.
> +	 */
> +	do {
> +		const int interval_ms = 1000;
> +
> +		ret = poll(&fd, 1, interval_ms);
> +
> +		if (!ret) {
> +			catch_child_failure();
> +			t += interval_ms;
> +		}
> +	} while (!ret && t < timeout_ms);
> +
> +	if (ret > 0)
> +		return read(pipe[0], buf, nbytes);
> +
> +	return 0;
> +}
> +
> +static uint64_t pipe_read(int pipe[2], int timeout_ms)
> +{
> +	uint64_t in;
> +	uint64_t ret;
> +
> +	ret = safe_pipe_read(pipe, &in, sizeof(in), timeout_ms);
> +	igt_assert(ret == sizeof(in));
> +
> +	return in;
> +}
> +
> +static void pipe_signal(int pipe[2], uint64_t token)
> +{
> +	igt_assert(write(pipe[1], &token, sizeof(token)) == sizeof(token));
> +}
> +
> +static void pipe_close(int pipe[2])
> +{
> +	if (pipe[0] != -1)
> +		close(pipe[0]);
> +
> +	if (pipe[1] != -1)
> +		close(pipe[1]);

Just close(pipe[0]); close(pipe[1]); is enough.

> +}
> +
> +static uint64_t __wait_token(int p[2], const uint64_t token, int timeout_ms)

s/p[2]/pipe[2]/ for being consistent.

> +{
> +	uint64_t in;
> +
> +	in = pipe_read(p, timeout_ms);
> +
> +	igt_assert_eq(in, token);
> +
> +	return pipe_read(p, timeout_ms);
> +}
> +
> +static uint64_t client_wait_token(struct xe_eudebug_client *c, const uint64_t token)
> +{
> +	return __wait_token(c->p_in, token, c->timeout_ms);
> +}
> +
> +static uint64_t wait_from_client(struct xe_eudebug_client *c, const uint64_t token)
> +{
> +	return __wait_token(c->p_out, token, c->timeout_ms);

p_in[2] and p_out[2] are weird names, especially p_in[1] is for writing
to the pipe and p_out[0] is for reading from the pipe. So naming is
confusing for the reader. Waiting on p_out is misleading.

> +}
> +
> +static void token_signal(int p[2], const uint64_t token, const uint64_t value)
> +{

Same here, p[2] -> pipe[2].

> +	pipe_signal(p, token);
> +	pipe_signal(p, value);
> +}
> +
> +static void client_signal(struct xe_eudebug_client *c,
> +			  const uint64_t token,
> +			  const uint64_t value)
> +{
> +	token_signal(c->p_out, token, value);
> +}
> +
> +static int __xe_eudebug_connect(int fd, pid_t pid, uint32_t flags, uint64_t events)
> +{
> +	struct drm_xe_eudebug_connect param = {
> +		.pid = pid,
> +		.flags = flags,
> +	};
> +	int debugfd;
> +
> +	debugfd = igt_ioctl(fd, DRM_IOCTL_XE_EUDEBUG_CONNECT, &param);
> +
> +	if (debugfd < 0)
> +		return -errno;
> +
> +	return debugfd;
> +}
> +
> +static void event_log_write_to_fd(struct xe_eudebug_event_log *l, int fd)
> +{
> +	igt_assert_eq(write(fd, &l->head, sizeof(l->head)),
> +		      sizeof(l->head));
> +
> +	igt_assert_eq(write(fd, l->log, l->head), l->head);
> +}
> +
> +static void read_all(int fd, void *buf, size_t nbytes)
> +{
> +	ssize_t remaining_size = nbytes;
> +	ssize_t current_size = 0;
> +	ssize_t read_size = 0;
> +
> +	do {
> +		read_size = read(fd, buf + current_size, remaining_size);
> +		igt_assert_f(read_size >= 0, "read failed: %s\n", strerror(errno));
> +
> +		current_size += read_size;
> +		remaining_size -= read_size;
> +	} while (remaining_size > 0 && read_size > 0);
> +
> +	igt_assert_eq(current_size, nbytes);
> +}
> +
> +static void event_log_read_from_fd(struct xe_eudebug_event_log *l, int fd)
> +{
> +	read_all(fd, &l->head, sizeof(l->head));
> +	igt_assert_lt(l->head, l->max_size);

Instead of asserting reallocing log may happen here. I mean sth like
this should be enough:

if (l->head > l->max_size) {
	l->max_size += MAX_SIZE;
	l->log = realloc(l->log, l->max_size);
	igt_assert(l->log);
}

Anyway, I'm not happy how keeping log have been implemented here.
This is however not a blocker for merging the series. I understand
how convinient is to write the whole log from client to main process
for compare what was noticed from the debugger side.


> +
> +	read_all(fd, l->log, l->head);
> +}
> +

<cut>

> +/**
> + * xe_eudebug_event_log_find_seqno:
> + * @l: event log pointer
> + * @seqno: seqno of event to be found
> + *
> + * Finds the event with given seqno in the event log.
> + *
> + * Returns: pointer to the event with given seqno within @l or NULL seqno is
> + * not present.
> + */
> +struct drm_xe_eudebug_event *
> +xe_eudebug_event_log_find_seqno(struct xe_eudebug_event_log *l, uint64_t seqno)
> +{
> +	struct drm_xe_eudebug_event *e = NULL, *found = NULL;
> +
> +	igt_assert(l);
> +	igt_assert_neq(seqno, 0);
> +	/*
> +	 * Try to catch if seqno is corrupted and prevent too long tests,
> +	 * as our post processing of events is not optimized.
> +	 */
> +	igt_assert_lt(seqno, 10 * 1000 * 1000);
> +
> +	xe_eudebug_for_each_event(e, l) {
> +		if (e->seqno == seqno) {
> +			if (found) {
> +				igt_warn("Found multiple events with the same seqno %lu\n", seqno);
> +				xe_eudebug_event_log_print(l, false);
> +				igt_assert(!found);
> +			}
> +			found = e;
> +		}
> +	}
> +
> +	return found;
> +}
> +
> +static void event_log_sort(struct xe_eudebug_event_log *l)
> +{
> +	struct xe_eudebug_event_log *tmp;
> +	struct drm_xe_eudebug_event *e = NULL;
> +	uint64_t first_seqno = UINT64_MAX;
> +	uint64_t last_seqno = 0;
> +	uint64_t events = 0, added = 0;
> +	uint64_t i;
> +
> +	xe_eudebug_for_each_event(e, l) {
> +		if (e->seqno > last_seqno)
> +			last_seqno = e->seqno;
> +
> +		if (e->seqno < first_seqno)
> +			first_seqno = e->seqno;
> +
> +		events++;
> +	}

Above code suggests this function is called many times during
test execution (scanning first/last seqno). But it run once on the
test completion. Confusing for first-time reader.

> +
> +	tmp = xe_eudebug_event_log_create("tmp", l->max_size);
> +
> +	for (i = first_seqno; i <= last_seqno; i++) {
> +		e = xe_eudebug_event_log_find_seqno(l, i);
> +		if (e) {
> +			xe_eudebug_event_log_write(tmp, e);
> +			added++;
> +		}
> +	}
> +
> +	igt_assert_eq(events, added);
> +	igt_assert_eq(tmp->head, l->head);
> +
> +	memcpy(l->log, tmp->log, tmp->head);
> +
> +	xe_eudebug_event_log_destroy(tmp);

<cut>

> +
> +/**
> + * xe_eudebug_event_log_create:
> + * @name: event log identifier
> + * @max_size: maximum size of created log
> + *
> + * Function creates an Eu Debugger event log with size equal to @max_size.
> + *
> + * Returns: pointer to just created log
> + */
> +#define MAX_EVENT_LOG_SIZE (32 * 1024 * 1024)
> +struct xe_eudebug_event_log *xe_eudebug_event_log_create(const char *name, unsigned int max_size)
> +{
> +	struct xe_eudebug_event_log *l;
> +
> +	igt_assert(name);
> +
> +	l = calloc(1, sizeof(*l));
> +	igt_assert(l);
> +	l->log = calloc(1, max_size);
> +	igt_assert(l->log);
> +	l->max_size = max_size;
> +	strncpy(l->name, name, sizeof(l->name) - 1);
> +	pthread_mutex_init(&l->lock, NULL);
> +
> +	return l;
> +}
> +
> +/**
> + * xe_eudebug_event_log_destroy:
> + * @l: event log pointer
> + *
> + * Frees given event log @l.
> + */
> +void xe_eudebug_event_log_destroy(struct xe_eudebug_event_log *l)
> +{
> +	igt_assert(l);
> +	pthread_mutex_destroy(&l->lock);
> +	free(l->log);
> +	free(l);
> +}
> +
> +/**
> + * xe_eudebug_event_log_write:
> + * @l: event log pointer
> + * @e: event to be written to event log
> + *
> + * Writes event @e to the event log, thread-safe.
> + */
> +void xe_eudebug_event_log_write(struct xe_eudebug_event_log *l, struct drm_xe_eudebug_event *e)
> +{
> +	igt_assert(l);
> +	igt_assert(e);
> +	igt_assert(e->seqno);
> +	/*
> +	 * Try to catch if seqno is corrupted and prevent too long tests,
> +	 * as our post processing of events is not optimized.
> +	 */
> +	igt_assert_lt(e->seqno, 10 * 1000 * 1000);
> +
> +	pthread_mutex_lock(&l->lock);
> +	igt_assert_lt(l->head + e->len, l->max_size);

Similar to the above code reallocing may be added here.

> +	memcpy(l->log + l->head, e, e->len);
> +	l->head += e->len;
> +	pthread_mutex_unlock(&l->lock);
> +}

<cut>

> +
> +/**
> + * xe_eudebug_debugger_stop_worker:
> + * @d: pointer to the debugger
> + *
> + * Stops the debugger worker. Event log is sorted by seqno after closure.
> + */
> +void xe_eudebug_debugger_stop_worker(struct xe_eudebug_debugger *d,
> +				     int timeout_s)
> +{
> +	struct timespec t = {};
> +	int ret;
> +
> +	igt_assert_neq(d->worker_state, DEBUGGER_WORKER_INACTIVE);
> +
> +	d->worker_state = DEBUGGER_WORKER_QUITTING; /* First time be polite. */
> +	igt_assert_eq(clock_gettime(CLOCK_REALTIME, &t), 0);
> +	t.tv_sec += timeout_s;
> +
> +	ret = pthread_timedjoin_np(d->worker_thread, NULL, &t);
> +
> +	if (ret == ETIMEDOUT) {
> +		d->worker_state = DEBUGGER_WORKER_INACTIVE;
> +		ret = pthread_join(d->worker_thread, NULL);

It's possible we stuck here forever (until runner will kill the test).
And I don't like caller is setting INACTIVE instead of thread which
should do that after noticing QUITTING state.

> +	}
> +
> +	igt_assert_f(ret == 0 || ret != ESRCH,
> +		     "pthread join failed with error %d!\n", ret);
> +
> +	event_log_sort(d->log);
> +}

<cut>

> +/**
> + * xe_eudebug_client_create:
> + * @master_fd: xe client used to open the debugger connection
> + * @work: function that opens xe device and executes arbitrary workload
> + * @flags: flags stored in a client structure, can be used at will
> + * of the caller, i.e. to provide the @work function an additional switch.
> + * @data: test's private data, allocated with MAP_SHARED | MAP_ANONYMOUS,
> + * can be shared between client and debugger. Accesible via client->ptr.
> + * Can be NULL.
> + *
> + * Forks and creates the debugger process. @work won't be called until
> + * xe_eudebug_client_start is called.
> + *
> + * Returns: newly created xe_eudebug_debugger structure with its
> + * event log initialized.
> + */
> +struct xe_eudebug_client *xe_eudebug_client_create(int master_fd, xe_eudebug_client_work_fn work,
> +						   uint64_t flags, void *data)
> +{
> +	struct xe_eudebug_client *c;
> +
> +	c = calloc(1, sizeof(*c));
> +	igt_assert(c);
> +
> +	c->flags = flags;
> +	igt_assert(!pipe(c->p_in));
> +	igt_assert(!pipe(c->p_out));

Imo these p_in/p_out are not luckily chosen names.

<cut>

All of my nits may be addressed in the future. Code for me may be
accepted under the flag, especially eudebug kernel changes will reflect
on igt changes as well.

So for this patch:

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

