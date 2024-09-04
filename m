Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA46CD3431
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 11:26:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3EAB10E76E;
	Wed,  4 Sep 2024 11:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iom61xj5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A3B10E76E
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 11:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725449198; x=1756985198;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ABe4JSGOlU+gUFnaheR3vHtq0BlEI6O2EZhSq6gUFvI=;
 b=iom61xj5ApYmoJkIXCSfG68E0j0WhKdBq54SoGFS5NV8g4usRBh6qrRw
 9CdjjZgXHv4/F2CY8qnQHbBd8YX6OUne54AgPqpLZb2v8wyWL5Fl3ynre
 OQI/tyzWbRmxtnoUo+qQGDyIb4W0RRtQiG7u1O5sO05mhvAeidOo8jU05
 84oBAScYowpv/W1CFbTqgCdCswI5mKJmbdLnKgCkaHIr3iVt0HKqSHU1P
 +7O6zqOVcMxXv8KwsJSufhRJmtodAu5oVm+6WGkwyEsOZ8QNHcEQTIZOU
 lwsX+Tk7NcsxGWZRMZJ6yA5VYvPr4lWvaSPFUmc7SxLOxHjCeBs9R6xeO Q==;
X-CSE-ConnectionGUID: h7h0KmenT3uY+UhEYVuSSQ==
X-CSE-MsgGUID: tBXnyr+BRreXYYtVA6E8xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="27989874"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="27989874"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 04:26:38 -0700
X-CSE-ConnectionGUID: 7XCjpV2NTDm3+xT8bizEXA==
X-CSE-MsgGUID: g9CPV48pTJyU8+Uw2NGVVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="69637889"
Received: from ltuz-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.40])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 04:26:35 -0700
Date: Wed, 4 Sep 2024 13:26:32 +0200
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
Message-ID: <20240904112632.325cl6stlqxomklj@zkempczy-mobl2>
References: <20240829144547.105371-1-christoph.manszewski@intel.com>
 <20240829144547.105371-12-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Forgot to add this in my previous comment.

> +static void event_log_sort(struct xe_eudebug_event_log *l)
> +{
> +	struct xe_eudebug_event_log *tmp;
> +	struct drm_xe_eudebug_event *e = NULL;
> +	uint64_t first_seqno = 0;
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
> +
> +	tmp = xe_eudebug_event_log_create("tmp", l->max_size);
> +
> +	for (i = 1; i <= last_seqno; i++) {

Shouldn't this be i = first_seqno?

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
> +}

--
Zbigniew
