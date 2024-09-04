Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85A6CD3431
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 13:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6593610E7BF;
	Wed,  4 Sep 2024 13:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WB8HehUi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A4810E7BF
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 13:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725455520; x=1756991520;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=puhGYExEzJbbwfv+iW9cKD7RuA2pfegAbQct7nZyhSE=;
 b=WB8HehUiLAFhECKodQ5q+5lC0oQTv/1wC+04yWjGi2hBQTFHUMMI8SjU
 qy1/ViC7tKaxVhHL5k5pF+qmKR9gV1e6TFfo6HsBl7Hsvb/RQYivp02WK
 MY61FijTskxHNAedDcP43tcdsvzUExHb79BSBU9IYU8b3Muoze+W599NK
 ddSsBw2KuNQtfOHPN4tl2azx0DgN1UGB1A//syoS8ghxw5BH5KG4TewNC
 n9AB+8/PORzUrOxGZiKzj89wwQW5BwN+6CxpdiS/53TU7n+mUJLe5gMtU
 FnAprWjHttNckkqTblt5SmHPu/x5Kta2dMYq93BEdnRsp+497Sy/OtrKc A==;
X-CSE-ConnectionGUID: kjXwWf40SVaWstGAcrL5cA==
X-CSE-MsgGUID: vkFCVIC0REuPU3eQr1VJWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24276364"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="24276364"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 06:12:00 -0700
X-CSE-ConnectionGUID: P1WN0LFeT3yEUOMpHE8ePA==
X-CSE-MsgGUID: pjGXqCS7Qm6Q+gt7q3Eobg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="70146882"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.28])
 ([10.245.246.28])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 06:11:24 -0700
Message-ID: <53740cc2-f27d-4242-a6dc-c0b605ab0e28@intel.com>
Date: Wed, 4 Sep 2024 15:11:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 11/17] lib/xe_eudebug: Introduce eu debug testing
 framework
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Mika Kuoppala <mika.kuaoppala@linux.intel.com>
References: <20240829144547.105371-1-christoph.manszewski@intel.com>
 <20240829144547.105371-12-christoph.manszewski@intel.com>
 <20240904112632.325cl6stlqxomklj@zkempczy-mobl2>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240904112632.325cl6stlqxomklj@zkempczy-mobl2>
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

Hi Zbigniew,

On 4.09.2024 13:26, Zbigniew Kempczyński wrote:
> On Thu, Aug 29, 2024 at 04:45:41PM +0200, Christoph Manszewski wrote:
> 
> <cut>
> 
> Forgot to add this in my previous comment.
> 
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
> 
> Shouldn't this be i = first_seqno?

So as we discussed offline - indeed it should. What's more, first_seqno 
should be initialized to UINT64_MAX. I will fix that in the next 
revision - thanks!

Christoph

> 
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
> 
> --
> Zbigniew
