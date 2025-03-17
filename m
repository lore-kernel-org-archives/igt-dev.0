Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80365C35FF3
	for <igt-dev@archiver.kernel.org>; Mon, 17 Mar 2025 09:29:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6B710E0CD;
	Mon, 17 Mar 2025 09:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BkrIevMq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388B110E0CD
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Mar 2025 09:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742203741; x=1773739741;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=35q9mERajgkp2iF3nmm2L+egDnQ7cxJMDbGtOH4Of3M=;
 b=BkrIevMqTYhj/WXc7F7zsCoLJmmSlQ7QI5nsW0MD5Ov5Ho0FkKnLCouE
 SEL67n8Yn/J8OQIk/y/onb3qLoiP0DFNk0Y2FC5eYvaeSMmw30L0K71su
 BZyEtimDAXSRfGIqSTaC7wbxT4XlBFyjDjCnnMcpoaDWhaOa6s3fNDuUg
 4dGgBDKWFbrfeg5w1k6D8ij7bS92u9TJduLGkaoGGqY++fADtpu/Bd1i5
 jmhrngcVo8FPhC3A0VF0xxHe5bnfwiWsZO/D6V0JBB3J8nW2ALCbEGzAq
 6iOWeY2vH7619HkqovCnS1bXYxYcCRuLIU7aPrcdQ4kaBdAMG/BEn9PJx A==;
X-CSE-ConnectionGUID: HfpkXUbaQRK4oSvLB71MOw==
X-CSE-MsgGUID: wQnnQSnHQxylNF8FbF1PYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43392631"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="43392631"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 02:29:00 -0700
X-CSE-ConnectionGUID: CbFQFxm6RcWewI/mFEYlTw==
X-CSE-MsgGUID: oClYGj1ZRNKVAQmuhQrTrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="126548958"
Received: from unknown (HELO localhost) ([10.237.72.193])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 02:28:59 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: Re: [PATCH i-g-t] lib/intel_allocator_simple: Prevent deadlock due
 to log mutex contention
In-Reply-To: <20250317065215.oaw2cnj7zmty3zra@zkempczy-mobl2>
References: <20250314115444.293063-1-mika.kuoppala@linux.intel.com>
 <20250317065215.oaw2cnj7zmty3zra@zkempczy-mobl2>
Date: Mon, 17 Mar 2025 11:28:50 +0200
Message-ID: <87h63sknu5.fsf@mkuoppal-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> writes:

> On Fri, Mar 14, 2025 at 01:54:44PM +0200, Mika Kuoppala wrote:
>> On the allocator::handle_request() we hold allocator's own mutex while
>> we check if the simple allocator is empty with allocator_close().
>> That in turn will call igt_debug that tries to take igt_log mutex.
>>=20
>> If the another thread encountered an error and is trying to print it,
>> it is also trying to take igt_log mutex. And there wont be
>> allocator requests received by the client anymore as the handle_request()
>> is stuck. So we deadlock.
>>=20
>> The intel_allocator does put logging behind unset define
>> but the intel_allocator_simple uses igt_info and igt_debug
>> directly. Follow the main allocator's lead and put the
>> logging inside intel_allocator_simple behind a unset define
>> with a warning that enabling it risks rare but possible deadlock.
>
> Hmm, to get deadlock I would expect scenario where igt_log() code
> would lock allocator mutex. But this doesn't happen.
>
> The below callstack shows:
>
> 1. allocator code locks:
>    -> handle_request() -> map_mutex
>    -> igt_log() -> log_buffer_mutex
>
>
> 2. second thread locks only log_buffer_mutex
>
> 3. third thread locks only log_buffer_mutex
>

> I don't see any deadlock here. What is causing we stuck on locking
> in log_buffer_mutex? All below three callstacks are calling:
>
> static void _igt_log_buffer_append(char *line)
> {
> 	pthread_mutex_lock(&log_buffer_mutex);
>
> 	free(log_buffer.entries[log_buffer.end]);
> 	log_buffer.entries[log_buffer.end] =3D line;
> 	log_buffer.end++;
> 	if (log_buffer.end =3D=3D log_buffer.start)
> 		log_buffer.start++;
>
> 	pthread_mutex_unlock(&log_buffer_mutex);
> }
>
> Locking/unlocking log_buffer_mutex is paired in all igt_log() functions.
>
> Why we stuck on log_buffer_mutex?

It seems I have cutpasted two times the same
callstack :(

Here is the proper callstack to be the last one:

#0  __libc_msgrcv (msgflg=3D0, msgtyp=3D<optimized out>, msgsz=3D64, msgp=
=3D0x7fff266abf50, msqid=3D11) at ../sysdeps/unix/sysv/linux/msgrcv.c:26
#1  __libc_msgrcv (msqid=3D11, msgp=3Dmsgp@entry=3D0x7fff266abf50, msgsz=3D=
msgsz@entry=3D64, msgtyp=3D41811, msgflg=3Dmsgflg@entry=3D0) at ../sysdeps/=
unix/sysv/linux/msgrcv.c:22
#2  0x00007f7195c7cbe5 in msgqueue_recv_resp (channel=3D<optimized out>, re=
sponse=3D0x7fff266ac090) at ../lib/intel_allocator_msgchannel.c:162
#3  0x00007f7195c7ac94 in recv_resp (response=3D0x7fff266ac090, tid=3D<opti=
mized out>, msgchan=3D0x7f7195d5b380 <msgqueue_channel>) at ../lib/intel_al=
locator.c:209
#4  send_req_recv_resp (response=3D0x7fff266ac090, request=3D0x7fff266ac0b0=
, msgchan=3D0x7f7195d5b380 <msgqueue_channel>) at ../lib/intel_allocator.c:=
458
#5  handle_request (req=3Dreq@entry=3D0x7fff266ac0b0, resp=3Dresp@entry=3D0=
x7fff266ac090) at ../lib/intel_allocator.c:729
#6  0x00007f7195c7bce3 in intel_allocator_close (allocator_handle=3D263) at=
 ../lib/intel_allocator.c:1088
#7  0x00007f7195c82cfe in intel_bb_destroy (ibb=3Dibb@entry=3D0x556bef15c4d=
0) at ../lib/intel_batchbuffer.c:1319
#8  0x0000556bbde692b7 in run_online_client (c=3Dc@entry=3D0x556bef15b480) =
at ../tests/intel/xe_eudebug_online.c:1147
#9  0x00007f7195ceb8e9 in xe_eudebug_client_create (master_fd=3Dmaster_fd@e=
ntry=3D3, work=3Dwork@entry=3D0x556bbde68de0 <run_online_client>, flags=3Df=
lags@entry=3D16777216, data=3Ddata@entry=3D0x7f7195c00000)
    at ../lib/xe/xe_eudebug.c:1421
#10 0x00007f7195cec0ad in xe_eudebug_session_create (fd=3Dfd@entry=3D3, wor=
k=3Dwork@entry=3D0x556bbde68de0 <run_online_client>, flags=3Dflags@entry=3D=
16777216,
    test_private=3Dtest_private@entry=3D0x7f7195c00000) at ../lib/xe/xe_eud=
ebug.c:1590
#11 0x0000556bbde6bfc1 in test_set_breakpoint_online_sigint_debugger (flags=
=3D16777216, hwe=3D0x556bef159ce8, fd=3D3) at ../tests/intel/xe_eudebug_onl=
ine.c:1554
#12 __igt_unique____real_main2500 () at ../tests/intel/xe_eudebug_online.c:=
2525
#13 0x0000556bbde6704d in main (argc=3D<optimized out>, argv=3D<optimized
#out>) at ../tests/intel/xe_eudebug_online.c:2500

But indeed, this does not yet explain why wouldn't the handle_request()
manage to get the log mutex, manage to send response to the client and
make it proceed from intel_allocator_close().

I try to repro if I could figure out why they are waiting on the same
futex without progress.

Thanks for taking a look and sorry for confusion with the cutpaste.
-Mika


>
> --
> Zbigniew
>
>>=20
>> Here are the stacks for the deadlock:
>>=20
>> 0  futex_wait (private=3D0, expected=3D2, futex_word=3D0x7f7195d5ff80 <l=
og_buffer_mutex>) at ../sysdeps/nptl/futex-internal.h:146
>> 1  __GI___lll_lock_wait (futex=3Dfutex@entry=3D0x7f7195d5ff80 <log_buffe=
r_mutex>, private=3D0) at ./nptl/lowlevellock.c:49
>> 2  0x00007f7195898002 in lll_mutex_lock_optimized (mutex=3D0x7f7195d5ff8=
0 <log_buffer_mutex>) at ./nptl/pthread_mutex_lock.c:48
>> 3  ___pthread_mutex_lock (mutex=3Dmutex@entry=3D0x7f7195d5ff80 <log_buff=
er_mutex>) at ./nptl/pthread_mutex_lock.c:93
>> 4  0x00007f7195cc0867 in _igt_log_buffer_append (
>>    line=3D0x7f718800be70 "(xe_eudebug_online:40711) [thread:40713] intel=
_allocator_simple-DEBUG: <ial: 0x7f7188009e20, fd: 5> objects: 0, reserved_=
areas: 1\n") at ../lib/igt_core.c:461
>> 5  igt_vlog (domain=3D0x7f7195cfca78 "intel_allocator_simple", level=3DI=
GT_LOG_DEBUG, format=3D<optimized out>, args=3Dargs@entry=3D0x7f71931fe8d0)=
 at ../lib/igt_core.c:3215
>> 6  0x00007f7195cc0b23 in igt_log (domain=3Ddomain@entry=3D0x7f7195cfca78=
 "intel_allocator_simple", level=3Dlevel@entry=3DIGT_LOG_DEBUG,
>>    format=3Dformat@entry=3D0x7f7195cfc4b0 "<ial: %p, fd: %d> objects: %l=
d, reserved_areas: %ld\n") at ../lib/igt_core.c:3137
>> 7  0x00007f7195c7d851 in intel_allocator_simple_is_empty (ial=3D<optimiz=
ed out>) at ../lib/intel_allocator_simple.c:613
>> 8  0x00007f7195c7aa99 in __allocator_put (al=3D0x556bef180950) at ../lib=
/intel_allocator.c:312
>> 9  allocator_close (ahnd=3D263) at ../lib/intel_allocator.c:430
>> 10 0x00007f7195c7add1 in handle_request (req=3Dreq@entry=3D0x7f71931feaf=
0, resp=3Dresp@entry=3D0x7f71931fead0) at ../lib/intel_allocator.c:561
>> 11 0x00007f7195c7b567 in allocator_thread_loop (data=3D<optimized out>) =
at ../lib/intel_allocator.c:766
>> 12 0x00007f7195894ac3 in start_thread (arg=3D<optimized out>) at ./nptl/=
pthread_create.c:442
>> 13 0x00007f7195926850 in clone3 () at ../sysdeps/unix/sysv/linux/x86_64/=
clone3.S:81
>>=20
>> 0  futex_wait (private=3D0, expected=3D2, futex_word=3D0x7f7195d5ff80 <l=
og_buffer_mutex>) at ../sysdeps/nptl/futex-internal.h:146
>> 1  __GI___lll_lock_wait (futex=3Dfutex@entry=3D0x7f7195d5ff80 <log_buffe=
r_mutex>, private=3D0) at ./nptl/lowlevellock.c:49
>> 2  0x00007f7195898002 in lll_mutex_lock_optimized (mutex=3D0x7f7195d5ff8=
0 <log_buffer_mutex>) at ./nptl/pthread_mutex_lock.c:48
>> 3  ___pthread_mutex_lock (mutex=3Dmutex@entry=3D0x7f7195d5ff80 <log_buff=
er_mutex>) at ./nptl/pthread_mutex_lock.c:93
>> 4  0x00007f7195cc0867 in _igt_log_buffer_append (line=3D0x556bef182920 "=
(xe_eudebug_online:40711) xe/xe_eudebug-CRITICAL: Test assertion failure fu=
nction __wait_token, file ../lib/xe/xe_eudebug.c:303:\n")
>>    at ../lib/igt_core.c:461
>> 5  igt_vlog (domain=3D0x7f7195d27b7f "xe/xe_eudebug", level=3DIGT_LOG_CR=
ITICAL, format=3D<optimized out>, args=3Dargs@entry=3D0x7fff266ac070) at ..=
/lib/igt_core.c:3215
>> 6  0x00007f7195cc0b23 in igt_log (domain=3Ddomain@entry=3D0x7f7195d27b7f=
 "xe/xe_eudebug", level=3Dlevel@entry=3DIGT_LOG_CRITICAL,
>>    format=3Dformat@entry=3D0x7f7195d19e60 "Test assertion failure functi=
on %s, file %s:%i:\n") at ../lib/igt_core.c:3137
>> 7  0x00007f7195cc2bd1 in __igt_fail_assert (domain=3Ddomain@entry=3D0x7f=
7195d27b7f "xe/xe_eudebug", file=3Dfile@entry=3D0x7f7195d27b68 "../lib/xe/x=
e_eudebug.c", line=3Dline@entry=3D303,
>>    func=3Dfunc@entry=3D0x7f7195d278b8 <__func__.29> "__wait_token", asse=
rtion=3Dassertion@entry=3D0x7f7195d1b044 "ret > 0", f=3Df@entry=3D0x7f7195d=
27fd8 "Pipe read timeout waiting for token '%s:(%ld)'\n")
>>    at ../lib/igt_core.c:2254
>> 8  0x00007f7195ce9944 in __wait_token (pipe=3Dpipe@entry=3D0x556bef15b4b=
4, token=3Dtoken@entry=3D3, timeout_ms=3D60000) at ../lib/xe/xe_eudebug.c:3=
03
>> 9  0x00007f7195cebcf1 in wait_from_client (token=3D3, c=3D<optimized out=
>) at ../lib/xe/xe_eudebug.c:324
>> 10 xe_eudebug_client_wait_done (c=3D0x556bef15b480) at ../lib/xe/xe_eude=
bug.c:1523
>> 11 xe_eudebug_client_wait_done (c=3D0x556bef15b480) at ../lib/xe/xe_eude=
bug.c:1519
>> 12 0x0000556bbde6bf19 in test_set_breakpoint_online_sigint_debugger (fla=
gs=3D16777216, hwe=3D0x556bef159ce8, fd=3D3) at ../tests/intel/xe_eudebug_o=
nline.c:1591
>> 13 __igt_unique____real_main2500 () at ../tests/intel/xe_eudebug_online.=
c:2525
>> 14 0x0000556bbde6704d in main (argc=3D<optimized out>, argv=3D<optimized=
 out>) at ../tests/intel/xe_eudebug_online.c:2500
>>=20
>> 0  futex_wait (private=3D0, expected=3D2, futex_word=3D0x7f7195d5ff80 <l=
og_buffer_mutex>) at ../sysdeps/nptl/futex-internal.h:146
>> 1  __GI___lll_lock_wait (futex=3Dfutex@entry=3D0x7f7195d5ff80 <log_buffe=
r_mutex>, private=3D0) at ./nptl/lowlevellock.c:49
>> 2  0x00007f7195898002 in lll_mutex_lock_optimized (mutex=3D0x7f7195d5ff8=
0 <log_buffer_mutex>) at ./nptl/pthread_mutex_lock.c:48
>> 3  ___pthread_mutex_lock (mutex=3Dmutex@entry=3D0x7f7195d5ff80 <log_buff=
er_mutex>) at ./nptl/pthread_mutex_lock.c:93
>> 4  0x00007f7195cc0867 in _igt_log_buffer_append (line=3D0x556bef182920 "=
(xe_eudebug_online:40711) xe/xe_eudebug-CRITICAL: Test assertion failure fu=
nction __wait_token, file ../lib/xe/xe_eudebug.c:303:\n")
>>    at ../lib/igt_core.c:461
>> 5  igt_vlog (domain=3D0x7f7195d27b7f "xe/xe_eudebug", level=3DIGT_LOG_CR=
ITICAL, format=3D<optimized out>, args=3Dargs@entry=3D0x7fff266ac070) at ..=
/lib/igt_core.c:3215
>> 6  0x00007f7195cc0b23 in igt_log (domain=3Ddomain@entry=3D0x7f7195d27b7f=
 "xe/xe_eudebug", level=3Dlevel@entry=3DIGT_LOG_CRITICAL,
>>    format=3Dformat@entry=3D0x7f7195d19e60 "Test assertion failure functi=
on %s, file %s:%i:\n") at ../lib/igt_core.c:3137
>> 7  0x00007f7195cc2bd1 in __igt_fail_assert (domain=3Ddomain@entry=3D0x7f=
7195d27b7f "xe/xe_eudebug", file=3Dfile@entry=3D0x7f7195d27b68 "../lib/xe/x=
e_eudebug.c", line=3Dline@entry=3D303,
>>    func=3Dfunc@entry=3D0x7f7195d278b8 <__func__.29> "__wait_token", asse=
rtion=3Dassertion@entry=3D0x7f7195d1b044 "ret > 0", f=3Df@entry=3D0x7f7195d=
27fd8 "Pipe read timeout waiting for token '%s:(%ld)'\n")
>>    at ../lib/igt_core.c:2254
>> 8  0x00007f7195ce9944 in __wait_token (pipe=3Dpipe@entry=3D0x556bef15b4b=
4, token=3Dtoken@entry=3D3, timeout_ms=3D60000) at ../lib/xe/xe_eudebug.c:3=
03
>> 9  0x00007f7195cebcf1 in wait_from_client (token=3D3, c=3D<optimized out=
>) at ../lib/xe/xe_eudebug.c:324
>> 10 xe_eudebug_client_wait_done (c=3D0x556bef15b480) at ../lib/xe/xe_eude=
bug.c:1523
>> 11 xe_eudebug_client_wait_done (c=3D0x556bef15b480) at ../lib/xe/xe_eude=
bug.c:1519
>> 12 0x0000556bbde6bf19 in test_set_breakpoint_online_sigint_debugger (fla=
gs=3D16777216, hwe=3D0x556bef159ce8, fd=3D3) at ../tests/intel/xe_eudebug_o=
nline.c:1591
>> 13 __igt_unique____real_main2500 () at ../tests/intel/xe_eudebug_online.=
c:2525
>> 14 0x0000556bbde6704d in main (argc=3D<optimized out>, argv=3D<optimized=
 out>) at ../tests/intel/xe_eudebug_online.c:2500
>>=20
>> Cc: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
>> Cc: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@intel.com>
>> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> ---
>>  lib/intel_allocator_simple.c | 88 ++++++++++++++++++++----------------
>>  1 file changed, 48 insertions(+), 40 deletions(-)
>>=20
>> diff --git a/lib/intel_allocator_simple.c b/lib/intel_allocator_simple.c
>> index 25b92db11..a73b16854 100644
>> --- a/lib/intel_allocator_simple.c
>> +++ b/lib/intel_allocator_simple.c
>> @@ -11,6 +11,14 @@
>>  #include "intel_bufops.h"
>>  #include "igt_map.h"
>>=20=20
>> +/* Enabling these you risk deadlock with igt_vlog mutex */
>> +#ifdef ALLOCDBG
>> +#define alloc_info igt_info
>> +#define alloc_debug igt_debug
>> +#else
>> +#define alloc_info(...) {}
>> +#define alloc_debug(...) {}
>> +#endif
>>=20=20
>>  /* Avoid compilation warning */
>>  struct intel_allocator *
>> @@ -505,7 +513,7 @@ static bool intel_allocator_simple_reserve(struct in=
tel_allocator *ial,
>>  		return true;
>>  	}
>>=20=20
>> -	igt_debug("Failed to reserve %llx + %llx\n", (long long)start, (long l=
ong)size);
>> +	alloc_debug("Failed to reserve %llx + %llx\n", (long long)start, (long=
 long)size);
>>  	return false;
>>  }
>>=20=20
>> @@ -534,19 +542,19 @@ static bool intel_allocator_simple_unreserve(struc=
t intel_allocator *ial,
>>  	entry =3D igt_map_search_entry(ials->reserved, &start);
>>=20=20
>>  	if (!entry || !entry->data) {
>> -		igt_debug("Only reserved blocks can be unreserved\n");
>> +		alloc_debug("Only reserved blocks can be unreserved\n");
>>  		return false;
>>  	}
>>  	rec =3D entry->data;
>>=20=20
>>  	if (rec->size !=3D size) {
>> -		igt_debug("Only the whole block unreservation allowed\n");
>> +		alloc_debug("Only the whole block unreservation allowed\n");
>>  		return false;
>>  	}
>>=20=20
>>  	if (rec->handle !=3D handle) {
>> -		igt_debug("Handle %u doesn't match reservation handle: %u\n",
>> -			 rec->handle, handle);
>> +		alloc_debug("Handle %u doesn't match reservation handle: %u\n",
>> +			    rec->handle, handle);
>>  		return false;
>>  	}
>>=20=20
>> @@ -610,10 +618,10 @@ static bool intel_allocator_simple_is_empty(struct=
 intel_allocator *ial)
>>  {
>>  	struct intel_allocator_simple *ials =3D ial->priv;
>>=20=20
>> -	igt_debug("<ial: %p, fd: %d> objects: %" PRId64
>> -		  ", reserved_areas: %" PRId64 "\n",
>> -		  ial, ial->fd,
>> -		  ials->allocated_objects, ials->reserved_areas);
>> +	alloc_debug("<ial: %p, fd: %d> objects: %" PRId64
>> +		    ", reserved_areas: %" PRId64 "\n",
>> +		    ial, ial->fd,
>> +		    ials->allocated_objects, ials->reserved_areas);
>>=20=20
>>  	return !ials->allocated_objects && !ials->reserved_areas;
>>  }
>> @@ -632,51 +640,51 @@ static void intel_allocator_simple_print(struct in=
tel_allocator *ial, bool full)
>>  	igt_assert(ials);
>>  	heap =3D &ials->heap;
>>=20=20
>> -	igt_info("intel_allocator_simple <ial: %p, fd: %d> on "
>> -		 "[0x%"PRIx64" : 0x%"PRIx64"]:\n", ial, ial->fd,
>> -		 ials->start, ials->end);
>> +	alloc_info("intel_allocator_simple <ial: %p, fd: %d> on "
>> +		   "[0x%"PRIx64" : 0x%"PRIx64"]:\n", ial, ial->fd,
>> +		   ials->start, ials->end);
>>=20=20
>>  	if (full) {
>> -		igt_info("holes:\n");
>> +		alloc_info("holes:\n");
>>  		simple_vma_foreach_hole(hole, heap) {
>> -			igt_info("offset =3D %"PRIu64" (0x%"PRIx64", "
>> -				 "size =3D %"PRIu64" (0x%"PRIx64")\n",
>> -				 hole->offset, hole->offset, hole->size,
>> -				 hole->size);
>> +			alloc_info("offset =3D %"PRIu64" (0x%"PRIx64", "
>> +				   "size =3D %"PRIu64" (0x%"PRIx64")\n",
>> +				   hole->offset, hole->offset, hole->size,
>> +				   hole->size);
>>  			total_free +=3D hole->size;
>>  		}
>>  		igt_assert(total_free <=3D ials->total_size);
>> -		igt_info("total_free: %" PRIx64
>> -			 ", total_size: %" PRIx64
>> -			 ", allocated_size: %" PRIx64
>> -			 ", reserved_size: %" PRIx64 "\n",
>> -			 total_free, ials->total_size, ials->allocated_size,
>> -			 ials->reserved_size);
>> +		alloc_info("total_free: %" PRIx64
>> +			   ", total_size: %" PRIx64
>> +			   ", allocated_size: %" PRIx64
>> +			   ", reserved_size: %" PRIx64 "\n",
>> +			   total_free, ials->total_size, ials->allocated_size,
>> +			   ials->reserved_size);
>>  		igt_assert(total_free =3D=3D
>>  			   ials->total_size - ials->allocated_size - ials->reserved_size);
>>=20=20
>> -		igt_info("objects:\n");
>> +		alloc_info("objects:\n");
>>  		igt_map_foreach(ials->objects, pos) {
>>  			struct intel_allocator_record *rec =3D pos->data;
>>=20=20
>> -			igt_info("handle =3D %d, offset =3D %"PRIu64" "
>> -				"(0x%"PRIx64", size =3D %"PRIu64" (0x%"PRIx64")\n",
>> -				 rec->handle, rec->offset, rec->offset,
>> -				 rec->size, rec->size);
>> +			alloc_info("handle =3D %d, offset =3D %"PRIu64" "
>> +				   "(0x%"PRIx64", size =3D %"PRIu64" (0x%"PRIx64")\n",
>> +				   rec->handle, rec->offset, rec->offset,
>> +				   rec->size, rec->size);
>>  			allocated_objects++;
>>  			allocated_size +=3D rec->size;
>>  		}
>>  		igt_assert(ials->allocated_size =3D=3D allocated_size);
>>  		igt_assert(ials->allocated_objects =3D=3D allocated_objects);
>>=20=20
>> -		igt_info("reserved areas:\n");
>> +		alloc_info("reserved areas:\n");
>>  		igt_map_foreach(ials->reserved, pos) {
>>  			struct intel_allocator_record *rec =3D pos->data;
>>=20=20
>> -			igt_info("offset =3D %"PRIu64" (0x%"PRIx64", "
>> -				 "size =3D %"PRIu64" (0x%"PRIx64")\n",
>> -				 rec->offset, rec->offset,
>> -				 rec->size, rec->size);
>> +			alloc_info("offset =3D %"PRIu64" (0x%"PRIx64", "
>> +				   "size =3D %"PRIu64" (0x%"PRIx64")\n",
>> +				   rec->offset, rec->offset,
>> +				   rec->size, rec->size);
>>  			reserved_areas++;
>>  			reserved_size +=3D rec->size;
>>  		}
>> @@ -687,12 +695,12 @@ static void intel_allocator_simple_print(struct in=
tel_allocator *ial, bool full)
>>  			total_free +=3D hole->size;
>>  	}
>>=20=20
>> -	igt_info("free space: %"PRIu64"B (0x%"PRIx64") (%.2f%% full)\n"
>> -		 "allocated objects: %"PRIu64", reserved areas: %"PRIu64"\n",
>> -		 total_free, total_free,
>> -		 ((double) (ials->total_size - total_free) /
>> -		  (double) ials->total_size) * 100,
>> -		 ials->allocated_objects, ials->reserved_areas);
>> +	alloc_info("free space: %"PRIu64"B (0x%"PRIx64") (%.2f%% full)\n"
>> +		   "allocated objects: %"PRIu64", reserved areas: %"PRIu64"\n",
>> +		   total_free, total_free,
>> +		   ((double) (ials->total_size - total_free) /
>> +		    (double) ials->total_size) * 100,
>> +		   ials->allocated_objects, ials->reserved_areas);
>>  }
>>=20=20
>>  struct intel_allocator *
>> @@ -702,7 +710,7 @@ intel_allocator_simple_create(int fd, uint64_t start=
, uint64_t end,
>>  	struct intel_allocator *ial;
>>  	struct intel_allocator_simple *ials;
>>=20=20
>> -	igt_debug("Using simple allocator\n");
>> +	alloc_debug("Using simple allocator\n");
>>=20=20
>>  	ial =3D calloc(1, sizeof(*ial));
>>  	igt_assert(ial);
>> --=20
>> 2.43.0
>>=20
