Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95175C61DD3
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 12:39:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209E810E81C;
	Mon, 31 Aug 2026 12:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N7c0aOBO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F9910E76C
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 12:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788179931; x=1819715931;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=EqE1f8WhuNSTAMUL3HJUWjHIlBaequB0A0cAAXZektw=;
 b=N7c0aOBOg4hUklzmGaxXIjLSRy4hYWGlz80OY8rDeqam1r6VAPUnuAoD
 EOu/0FXGpYcn4X3fIYUmTmSlMrWceueTKe6ybbAhmRzR/bXZG7lbxeUhY
 Hs4eagBubtowhZr72Cg5zwcHAtm6wL8wXj96uf5pJ9R9aBkpOQ4mn4atV
 9sdsBXnXaP6GDItTPbFUkLRJ7UUfWNMoXUTDNaixsxOdjZpdTPNxM72Ho
 bN0rDIxj1Srw33x1mED04lYUlXSENcBBjf0o7YvrKxZPJtyx9iedx7oYC
 9kDYolCgL+PMHZVXPCln+C/HJNbZAV2XdLmC+dfLo6HZ2/p5DbK7t3z+8 A==;
X-CSE-ConnectionGUID: QFvcmO5hS/amC58eaXfpOA==
X-CSE-MsgGUID: QOYICvlHTzShUXRwnfzWjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92395876"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="92395876"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 05:38:51 -0700
X-CSE-ConnectionGUID: jw550/bTTFKujwShzwz0LQ==
X-CSE-MsgGUID: enBr7V/1QBaqaPG3Y+AkSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="266202459"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.22])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 05:38:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com, raag.jadav@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v3 04/10] lib/igt_drm_netlink: add get_error_counter
 support
In-Reply-To: <cb23ad61-d462-48cc-953c-5b053c0152c8@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
 <20260824164133.129138-5-ravi.kishore.koppuravuri@intel.com>
 <84ff04863f33194b966399d4593d1363339866d7@intel.com>
 <cb23ad61-d462-48cc-953c-5b053c0152c8@intel.com>
Date: Mon, 31 Aug 2026 15:38:46 +0300
Message-ID: <7ff9e8160d25444ad506b51806665924d57c1cbf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 31 Aug 2026, "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com> wrote:
> On 31-08-2026 14:18, Jani Nikula wrote:
>> On Mon, 24 Aug 2026, Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com> wrote:
>>> +static int init_app_context(struct app_context *ctx)
>>> +{
>>> +	if (!ctx)
>>> +		return -EINVAL;
>>> +
>>> +	ctx->sock = NULL;
>>> +	ctx->node_id = UINT32_MAX;
>>> +	ctx->error_id = UINT32_MAX;
>>> +	ctx->error_value = 0;
>>> +	ctx->last_nl_error = 0;
>>> +	ctx->cmd_done = false;
>>> +	ctx->reply_received = false;
>>> +	ctx->ack_received = false;
>>> +	ctx->response_required = false;
>>> +	ctx->family_id = -1;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void cleanup_app_context(struct app_context *ctx)
>>> +{
>>> +	if (!ctx)
>>> +		return;
>>> +
>>> +	ctx->sock = NULL;
>>> +	ctx->node_id = UINT32_MAX;
>>> +	ctx->error_id = UINT32_MAX;
>>> +	ctx->error_value = 0;
>>> +	ctx->last_nl_error = 0;
>>> +	ctx->cmd_done = false;
>>> +	ctx->reply_received = false;
>>> +	ctx->ack_received = false;
>>> +	ctx->response_required = false;
>>> +	ctx->family_id = -1;
>>> +}

Btw, the two functions above do the exact same thing. Why doesn't one
call the other?

Also, why not memset(ctx, 0, sizeof(*ctx)) and then set the non-zero
ones separately?

>>>   struct app_context {
>>>   	struct nl_sock *sock;
>>> +	uint32_t node_id;
>>> +	uint32_t error_id;
>>> +	uint32_t error_value;
>>> +	int last_nl_error;
>>> +	bool cmd_done;
>>> +	bool reply_received;
>>> +	bool ack_received;
>>> +	bool response_required;
>>>   	int family_id;
>>>   };
>>>   
>>>   void igt_cleanup_nl_socket(struct app_context *ctx);
>>>   int igt_init_nl_socket(struct app_context *ctx);
>>> +int igt_get_error_counter(struct app_context *ctx);
>> This is really inconsistent naming, though.
>
> igt_init_nl_socket() and igt_cleanup_nl_socket() are the library 
> functions to initialize and cleanup the netlink socket.
>
> igt_get_error_counter() is the library function to get the error counter.
>
> "igt_" is the prefix used for all the library functions, as suggested by 
> Kamil.
>
> I am not clear why this naming is inconsistent. Could you please 
> elaborate your suggestion here.

Point is, there are a gazillion functions starting with "igt_", and the
above don't make it any more specific. The "igt get error counter" could
refer to any error counter.

I guess I'd have named all the functions and types to have the
igt_drm_netlink_ prefix. Or similar. And then you immediately know what
this is about, without having to look up the function definitions or
documentation.

BR,
Jani.


-- 
Jani Nikula, Intel
