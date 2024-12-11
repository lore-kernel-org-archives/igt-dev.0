Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DCDE7717D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 21:26:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9F810EC1A;
	Wed, 11 Dec 2024 21:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E8xwXL8T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB90D10EC1A
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 21:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733952410; x=1765488410;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=raPRSa/K0X7GDKacEKMqt098jChqAppdNCH1RHN7l7Q=;
 b=E8xwXL8TwMdnfV6L3eLL0XqbrpVgFm3xjAF2JAdO8l741c0My7aFGAJw
 +9MHNgBiyKoXx3nfAOP3NcUpVdzi4UePSq6F7nGW+XfFSdasFTt9mrxsq
 RE4fzp7CLO9xj8+8WkkAGjXRxCS0C9XE2kaXjh5quC8QTkrVVejrCNFRd
 8CRhEABsVCkphIREP16v6bcHhwSwhMQXy2RgLJzXLqrqamlJ7vTkDpY0t
 6DEsYJkC7wIVC7bC8lY++/oOpQe4Q7bi0j2NiDYfAduGY8JqTJWrUQWhD
 qgvg/gxG2EAM57Gv7xRORMEx6GUajveIuRxMrwNq2NsyHG7G0AhIHhtoi Q==;
X-CSE-ConnectionGUID: /5O68A+2SRO+zSWbNEGjtw==
X-CSE-MsgGUID: /oLtIrjtRACIrfbDx92Bsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44823217"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="44823217"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 13:26:50 -0800
X-CSE-ConnectionGUID: JdGiI6LrQBiWDmtYNnv46A==
X-CSE-MsgGUID: AcZijmN9Q7+vsRZ/HWGmyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="126784257"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO [10.245.246.37])
 ([10.245.246.37])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 13:26:47 -0800
Message-ID: <862337aa-7a40-48f7-b77d-b0c5b2494892@intel.com>
Date: Wed, 11 Dec 2024 22:26:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 3/3] tests/intel/xe_eudebug: Add
 basic-vm-bind-ufence-sigint-client test
To: =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20241211135039.5853-1-dominik.karol.piatkowski@intel.com>
 <20241211135039.5853-4-dominik.karol.piatkowski@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241211135039.5853-4-dominik.karol.piatkowski@intel.com>
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

Hi Dominik

On 11.12.2024 14:50, Dominik Karol Piątkowski wrote:
> Add a test that gives user fence in application, holds it, sends SIGINT
> to client and checks if anything breaks.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
> v2:
> - Cleanup after the client in basic-vm-bind-ufence-sigint-client,
>    merge the test into test_basic_ufence
> ---
>   tests/intel/xe_eudebug.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> index 77ce905f0..c543eb064 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -65,6 +65,7 @@ static void test_sysfs_toggle(int fd)
>   #define EXEC_QUEUES_PLACEMENTS		(1 << 8)
>   #define VM_BIND_DELAY_UFENCE_ACK	(1 << 9)
>   #define VM_BIND_UFENCE_RECONNECT	(1 << 10)
> +#define VM_BIND_UFENCE_SIGINT_CLIENT	(1 << 11)
>   #define TEST_DISCOVERY			(1 << 31)
>   
>   #define PAGE_SIZE SZ_4K
> @@ -2135,6 +2136,10 @@ static int wait_for_ufence_events(struct ufence_priv *priv, int timeout_ms)
>    * Description:
>    *	Give user fence in application, hold it, drop the debugger connection and check if anything
>    *	breaks. Expect that held acks are released when connection is dropped.
> + *
> + * SUBTEST: basic-vm-bind-ufence-sigint-client
> + * Description:
> + *	Give user fence in application, hold it, send SIGINT to client and check if anything breaks.
>    */
>   static void test_basic_ufence(int fd, unsigned int flags)
>   {
> @@ -2164,6 +2169,14 @@ static void test_basic_ufence(int fd, unsigned int flags)
>   	if (flags & VM_BIND_DELAY_UFENCE_ACK)
>   		sleep(XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * 4 / 5);
>   
> +	if (flags & VM_BIND_UFENCE_SIGINT_CLIENT) {
> +		kill(c->pid, SIGINT);
> +		c->pid = 0;
> +		xe_eudebug_debugger_stop_worker(d, 1);
> +		xe_eudebug_event_log_print(d->log, true);
> +		goto end;
> +	}
> +
>   	if (flags & VM_BIND_UFENCE_RECONNECT) {
>   		filter = XE_EUDEBUG_FILTER_EVENT_VM_BIND | XE_EUDEBUG_FILTER_EVENT_VM |
>   				XE_EUDEBUG_FILTER_EVENT_OPEN;
> @@ -2181,6 +2194,7 @@ static void test_basic_ufence(int fd, unsigned int flags)
>   
>   	xe_eudebug_session_check(s, true, filter);
>   
> +end:

Well 'goto' has it's place, but I think we could do without it here. How 
about:

```
@@ -2149,7 +2166,28 @@ static void test_basic_ufence(int fd, unsigned 
int flags)
         xe_eudebug_debugger_wait_stage(s, 
STAGE_CLIENT_WAIT_ON_UFENCE_DONE);
         xe_eudebug_assert_f(d, wait_for_ufence_events(priv, 
XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * MSEC_PER_SEC) == 0,
                             "missing ufence events\n");
-       ack_fences(d);
+
+       if (flags & VM_BIND_DELAY_UFENCE_ACK)
+               sleep(XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * 4 / 5);
+
+       if (flags & VM_BIND_UFENCE_SIGINT_CLIENT) {
+               /* Killing client so client log will be empty */
+               filter = XE_EUDEBUG_FILTER_ALL;
+
+               kill(c->pid, SIGINT);
+               c->pid = 0;
+               c->done = 1;
+       } else if (flags & VM_BIND_UFENCE_RECONNECT) {
+               /* Reconnecting debugger after client is done, debugger 
log will be cut */
+               filter = XE_EUDEBUG_FILTER_EVENT_VM_BIND | 
XE_EUDEBUG_FILTER_EVENT_VM |
+                        XE_EUDEBUG_FILTER_EVENT_OPEN;
+
+               xe_eudebug_debugger_detach(d);
+               xe_eudebug_client_wait_done(c);
+               igt_assert_eq(xe_eudebug_debugger_attach(d, c), 0);
+       } else {
+               ack_fences(d);
+       }
```

We have one central place which determines the way we release the 
fences, the rest of the function is common.

Note: this code uses "XE_EUDEBUG_FILTER_ALL" which is currently broken - 
I've sent a fix here: https://patchwork.freedesktop.org/series/142438/

Thanks,
Christoph



>   	xe_eudebug_session_destroy(s);
>   	ufence_priv_destroy(priv);
>   }
> @@ -2842,6 +2856,9 @@ igt_main
>   	igt_subtest("basic-vm-bind-ufence-reconnect")
>   		test_basic_ufence(fd, VM_BIND_UFENCE_RECONNECT);
>   
> +	igt_subtest("basic-vm-bind-ufence-sigint-client")
> +		test_basic_ufence(fd, VM_BIND_UFENCE_SIGINT_CLIENT);
> +
>   	igt_subtest("vma-ufence")
>   		test_vma_ufence(fd, 0);
>   
