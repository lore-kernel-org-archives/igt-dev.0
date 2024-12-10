Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F84E7717F
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 18:22:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EEBC10E953;
	Tue, 10 Dec 2024 18:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Emzd7OC0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76A410E953
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Dec 2024 18:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733854941; x=1765390941;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cKKJOyYNS/6WdFSWPrMlVUp8ARS4LsAm/c25B1dgeOk=;
 b=Emzd7OC0ldnfuA906w/d4upMzM8fwvYaeMggsVSc/KurZ9jlcqBma/Ve
 2osGs133blk9bWv7Cmgjx5ztyHxMOfdsd+5bKpe0BsnEQ4MAqLdyQAOtV
 2vmg3Yr5QrB3KvIG8KSkIQdTVn3jAzn211YsVyqzHmL6mgzeN4K1Ts2Dp
 lWJafYhAcK8jgCfqPkOQVinKWk3oF6NQp/YLiq4/95cGUEEu/Kvw9lPlT
 CXddILS+px6tzUDmYveRvKp5eeF5oHWWfgFocBYWM/z0yzhexf2lxiwSS
 4/Mmth04rTL/UrA49pENnjuuQKXrSxKPe1swfojjxBJJqWOAjCYAV0KUO w==;
X-CSE-ConnectionGUID: 6865LVtNTyixbhE2iSAiHg==
X-CSE-MsgGUID: MryqJXCDQd6EvRJC9zslaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="56694550"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="56694550"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 10:22:21 -0800
X-CSE-ConnectionGUID: epk1tukfQhOZLWZXJyiRGA==
X-CSE-MsgGUID: SNXDq3cySqOopZge5pQRbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="100300683"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.239])
 ([10.245.246.239])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 10:22:18 -0800
Message-ID: <b62733e3-d141-46bd-92c5-b5186d754072@intel.com>
Date: Tue, 10 Dec 2024 19:22:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tests/intel/xe_eudebug: Add
 basic-vm-bind-drop-debugger-before-ufence-ack test
To: =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20241209141359.5738-1-dominik.karol.piatkowski@intel.com>
 <20241209141359.5738-3-dominik.karol.piatkowski@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241209141359.5738-3-dominik.karol.piatkowski@intel.com>
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
> Add a test that gives user fence in application, holds it, drops the
> debugger connection and checks if anything breaks. It is expected that
> held acks are released when connection is dropped.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>   tests/intel/xe_eudebug.c | 50 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> index 1853dee40..0a4bebf1e 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -2171,6 +2171,53 @@ static void test_basic_ufence(int fd, unsigned int flags)
>   	ufence_priv_destroy(priv);
>   }
>   
> +/**
> + * SUBTEST: basic-vm-bind-drop-debugger-before-ufence-ack
> + * Description:
> + *	Give user fence in application, hold it, drop the debugger connection and check if anything
> + *	breaks. Expect that held acks are released when connection is dropped.
> + */
> +static void test_ufence_drop_debugger_before_ack(int fd)


I can't help but imagine merging this code with the existing 
'test_basic_ufence'.

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
> +	xe_eudebug_debugger_detach(d);
> +	sleep(1);
> +	igt_assert_eq(xe_eudebug_debugger_attach(d, c), 0);

Basically it's this block vs ack.

> +
> +	xe_eudebug_client_wait_done(c);
> +	xe_eudebug_debugger_stop_worker(d, 1);
> +
> +	xe_eudebug_event_log_print(d->log, true);
> +	xe_eudebug_event_log_print(c->log, true);
> +
> +	xe_eudebug_session_check(s, true, XE_EUDEBUG_FILTER_EVENT_VM_BIND |
> +				 XE_EUDEBUG_FILTER_EVENT_VM | XE_EUDEBUG_FILTER_EVENT_OPEN);

And this. Given the fact that the 'UFENCE' filter in 'test_basic_ufence' 
is redundant, we could just introduce a filter variable, that would be 
set accordingly together with the reconnect block.

> +
> +	xe_eudebug_session_destroy(s);
> +	ufence_priv_destroy(priv);
> +} > +
>   struct vm_bind_clear_thread_priv {
>   	struct drm_xe_engine_class_instance *hwe;
>   	struct xe_eudebug_client *c;
> @@ -2825,6 +2872,9 @@ igt_main
>   	igt_subtest("basic-vm-bind-ufence-delay-ack")
>   		test_basic_ufence(fd, VM_BIND_DELAY_UFENCE_ACK);
>   
> +	igt_subtest("basic-vm-bind-drop-debugger-before-ufence-ack")

No strong opinion but 'basic-vm-bind-ufence-reconnect' would be somewhat 
inline what we have in our online test, nicely allows to select ufence 
tests with a glob and is a little bit shorter. It is less descriptive 
but then it also seems quite logical to expect the reconnect to happen 
at the most interesting moment - which for this test is the ufence blocking.

Other than some code organization it looks good so:

Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Thanks,
Christoph

> +		test_ufence_drop_debugger_before_ack(fd);
> +
>   	igt_subtest("vma-ufence")
>   		test_vma_ufence(fd, 0);
>   
