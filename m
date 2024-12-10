Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E06E7717F
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 18:38:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A220110E2CD;
	Tue, 10 Dec 2024 18:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mUaXczk2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E37E10E2CD
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Dec 2024 18:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733855923; x=1765391923;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UdZ7G7VvQQ8oinybApvIdmvqNQ/xUyEF0eIr58MXktI=;
 b=mUaXczk29Oy4lEEvLpvfsX47+ATEJ7AuwNkhwxuhMR0kXfqkMNFvkIM2
 rl4LuKW7ZA6AiY98OFqGoKOIPNlsAYl02sdGqJWgvLX0Io0D1JClvV6py
 Ec2swGFw/dMYWRH4Rn9unYgZw9iCrlMjRjSs0cc/bIxWVAgDmQOCUgZYR
 zJwN8Y/izEgegt/A8h4xvid/aZQf3acJ9bF5o55XSxHLmB9L3NYW4Ksdv
 csjoNaIjrJoKYEbvyZebmLByTBOPFlH35uMrXDmaUUd76CJEpTx/MEx3o
 +kkQn8p8LL7FZODeXYnpkAgzsnRswWS5iXtq/i0VaDZX8/LtgeAc/RHnH w==;
X-CSE-ConnectionGUID: BulFAThQSOGCoUY8jShjIA==
X-CSE-MsgGUID: Agr1ssqfQxiuPPMT8Lvm6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="37996899"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="37996899"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 10:38:42 -0800
X-CSE-ConnectionGUID: XVUPESsrStyrbvzomzv9Iw==
X-CSE-MsgGUID: yLEgCzPhQPW1c7qQMnqgHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="96306657"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.239])
 ([10.245.246.239])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 10:38:41 -0800
Message-ID: <06dd3382-a279-4aed-9825-569943045a4d@intel.com>
Date: Tue, 10 Dec 2024 19:38:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_eudebug: Add
 basic-vm-bind-ufence-sigint-client test
To: =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20241209141359.5738-1-dominik.karol.piatkowski@intel.com>
 <20241209141359.5738-4-dominik.karol.piatkowski@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241209141359.5738-4-dominik.karol.piatkowski@intel.com>
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

On 9.12.2024 15:13, Dominik Karol Piątkowski wrote:
> Add a test that gives user fence in application, holds it, sends SIGINT
> to client and checks if anything breaks.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>   tests/intel/xe_eudebug.c | 44 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 44 insertions(+)
> 
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> index 0a4bebf1e..8728d5b23 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -2218,6 +2218,47 @@ static void test_ufence_drop_debugger_before_ack(int fd)
>   	ufence_priv_destroy(priv);
>   }
>   
> +/**
> + * SUBTEST: basic-vm-bind-ufence-sigint-client
> + * Description:
> + *	Give user fence in application, hold it, send SIGINT to client and check if anything breaks.
> + */
> +static void test_ufence_sigint_client(int fd)
> +{
> +	struct xe_eudebug_debugger *d;
> +	struct xe_eudebug_session *s;
> +	struct xe_eudebug_client *c;
> +	struct ufence_priv *priv;
> +
> +	priv = ufence_priv_create();
> +	s = xe_eudebug_session_create(fd, basic_ufence_client, 0, priv);
> +	c = s->client;
> +	d = s->debugger;
> +
> +	xe_eudebug_debugger_add_trigger(d,
> +					DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
> +					basic_ufence_trigger);
> +
> +	igt_assert_eq(xe_eudebug_debugger_attach(d, c), 0);
> +	xe_eudebug_debugger_start_worker(d);
> +	xe_eudebug_client_start(c);
> +
> +	xe_eudebug_debugger_wait_stage(s, STAGE_CLIENT_WAIT_ON_UFENCE_DONE);
> +	xe_eudebug_assert_f(d, wait_for_ufence_events(priv, XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * MSEC_PER_SEC) == 0,
> +			    "missing ufence events\n");
> +
> +	kill(c->pid, SIGINT);
> +
> +	xe_eudebug_debugger_stop_worker(d, 1);
> +
> +	xe_eudebug_event_log_print(d->log, true);
> +
> +	xe_eudebug_debugger_destroy(s->debugger);
> +	free(s);

Shouldn't we somehow cleanup after the client? A hacky way would be to 
set the c->pid to 0 and just call the session_destroy function. 
Alternatively we could improve the 'xe_eudebug_client_wait_done' 
function to handle a dead process with some return value and which I 
imagine could improve the log readability on error/crash conditions (we 
wouldn't try to read an invalid pipe).

If you would for some reason go the second route it would also be 
rewarded by the possibility to cleanly merge this with the other ufence 
test functions =) If not then apart from the ack/reconnect/kill block we 
would also need to make the client wait done call conditional and... I 
don't know about that, maybe that would also be worth it to reduce code 
duplication. But no strong opinion on that.

Thanks,
Christoph

> +
> +	ufence_priv_destroy(priv);
> +}
> +
>   struct vm_bind_clear_thread_priv {
>   	struct drm_xe_engine_class_instance *hwe;
>   	struct xe_eudebug_client *c;
> @@ -2875,6 +2916,9 @@ igt_main
>   	igt_subtest("basic-vm-bind-drop-debugger-before-ufence-ack")
>   		test_ufence_drop_debugger_before_ack(fd);
>   
> +	igt_subtest("basic-vm-bind-ufence-sigint-client")
> +		test_ufence_sigint_client(fd);
> +
>   	igt_subtest("vma-ufence")
>   		test_vma_ufence(fd, 0);
>   
