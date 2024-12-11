Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947F2E7717D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 19:29:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BCA10EC00;
	Wed, 11 Dec 2024 19:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Suw2naPj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFDE10EC00
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 19:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733945368; x=1765481368;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mmzXRTnJFEMOTziqyXlfDavprya3Wdza3t2JcjCFDbE=;
 b=Suw2naPjpJVFbtYoLdNOyQe/nujMnPibDvR3cujmW4Y06OWo6IDtttKX
 Yey7bBb0a1HC6WXNaoXdBJ2/fDXpc6ExtO/6/nP6sZgKzEA0OF8TBrLTn
 Bc/Yu7dJWgsSSScaHSgSFLLVwwagjH70rIOZt0R9IqMdTrfrRPzrkP66g
 HwvIVvzqGhCdn5/7ezDjGCYH1V5pcasNf/1J3O8iJJcvbB8CJBPVw93Jn
 /GF0LwIYNCb0TdF+L5ql0XQpILwhr/GV2U37oAQVuR2+tALMjGg08OZO+
 WKuSMa141BXLr6Jei7anfoSf6EQp0A165+1Q22btB/7t7iNXD8DoHOJH0 Q==;
X-CSE-ConnectionGUID: gP8agY/aT9KROS/MQiTuVA==
X-CSE-MsgGUID: nNDmDTy5T5q9YG7tOuZ/8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34471370"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="34471370"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 11:29:28 -0800
X-CSE-ConnectionGUID: PGW0bLnvRkCNNaKBF3HIfQ==
X-CSE-MsgGUID: +Him74VXTW2aNFqRj8yWiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="126750910"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO [10.245.246.37])
 ([10.245.246.37])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 11:29:26 -0800
Message-ID: <4b3050a4-f4d4-4236-8e43-13cce9c15dd1@intel.com>
Date: Wed, 11 Dec 2024 20:29:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 2/3] tests/intel/xe_eudebug: Add
 basic-vm-bind-ufence-reconnect test
To: =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20241211135039.5853-1-dominik.karol.piatkowski@intel.com>
 <20241211135039.5853-3-dominik.karol.piatkowski@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241211135039.5853-3-dominik.karol.piatkowski@intel.com>
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

On 11.12.2024 14:50, Dominik Karol Piątkowski wrote:
> Add a test that gives user fence in application, holds it, drops the
> debugger connection and checks if anything breaks. It is expected that
> held acks are released when connection is dropped.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
> v2:
> - Rename basic-vm-bind-drop-debugger-before-ufence-ack to
>    basic-vm-bind-ufence-reconnect and merge it into test_basic_ufence
> ---
>   tests/intel/xe_eudebug.c | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> index 1853dee40..77ce905f0 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -64,6 +64,7 @@ static void test_sysfs_toggle(int fd)
>   #define VM_BIND_OP_MAP_USERPTR		(1 << 7)
>   #define EXEC_QUEUES_PLACEMENTS		(1 << 8)
>   #define VM_BIND_DELAY_UFENCE_ACK	(1 << 9)
> +#define VM_BIND_UFENCE_RECONNECT	(1 << 10)
>   #define TEST_DISCOVERY			(1 << 31)
>   
>   #define PAGE_SIZE SZ_4K
> @@ -2129,6 +2130,11 @@ static int wait_for_ufence_events(struct ufence_priv *priv, int timeout_ms)
>    * SUBTEST: basic-vm-bind-ufence-delay-ack
>    * Description:
>    *	Give user fence in application and check if delayed ufence ack works
> + *
> + * SUBTEST: basic-vm-bind-ufence-reconnect
> + * Description:
> + *	Give user fence in application, hold it, drop the debugger connection and check if anything
> + *	breaks. Expect that held acks are released when connection is dropped.
>    */
>   static void test_basic_ufence(int fd, unsigned int flags)
>   {
> @@ -2136,6 +2142,7 @@ static void test_basic_ufence(int fd, unsigned int flags)
>   	struct xe_eudebug_session *s;
>   	struct xe_eudebug_client *c;
>   	struct ufence_priv *priv;
> +	uint32_t filter = XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE;
>   
>   	priv = ufence_priv_create();
>   	s = xe_eudebug_session_create(fd, basic_ufence_client, flags, priv);
> @@ -2157,7 +2164,14 @@ static void test_basic_ufence(int fd, unsigned int flags)
>   	if (flags & VM_BIND_DELAY_UFENCE_ACK)
>   		sleep(XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * 4 / 5);
>   
> -	ack_fences(d);
> +	if (flags & VM_BIND_UFENCE_RECONNECT) {
> +		filter = XE_EUDEBUG_FILTER_EVENT_VM_BIND | XE_EUDEBUG_FILTER_EVENT_VM |
> +				XE_EUDEBUG_FILTER_EVENT_OPEN;
> +		xe_eudebug_debugger_detach(d);
> +		sleep(1);

Sorry for missing that in the first round but what do we wait for here 
exactly? To me it looks a little like we try to wait for the client to 
finish, so we don't get a replay in the event log and don't call our 
trigger again. That is properly handled in interrupt-reconnect I think. 
It requires the client wait for a stage, cleaning the debugger log and 
removing the trigger.

But I don't think it is worth the hassle and your approach works fine. 
Just please use 'xe_eudebug_client_wait_done' instead of a timeout if 
this what you are actually trying to achieve here (unless you don't, 
then please just add some short comment/explanation in the code).

> +		igt_assert_eq(xe_eudebug_debugger_attach(d, c), 0);
> +	} else
> +		ack_fences(d);

Nit: missing braces.

Thanks,
Christoph
>   
>   	xe_eudebug_client_wait_done(c);
>   	xe_eudebug_debugger_stop_worker(d, 1);
> @@ -2165,7 +2179,7 @@ static void test_basic_ufence(int fd, unsigned int flags)
>   	xe_eudebug_event_log_print(d->log, true);
>   	xe_eudebug_event_log_print(c->log, true);
>   
> -	xe_eudebug_session_check(s, true, XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE);
> +	xe_eudebug_session_check(s, true, filter);
>   
>   	xe_eudebug_session_destroy(s);
>   	ufence_priv_destroy(priv);
> @@ -2825,6 +2839,9 @@ igt_main
>   	igt_subtest("basic-vm-bind-ufence-delay-ack")
>   		test_basic_ufence(fd, VM_BIND_DELAY_UFENCE_ACK);
>   
> +	igt_subtest("basic-vm-bind-ufence-reconnect")
> +		test_basic_ufence(fd, VM_BIND_UFENCE_RECONNECT);
> +
>   	igt_subtest("vma-ufence")
>   		test_vma_ufence(fd, 0);
>   
