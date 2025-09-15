Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36981CAC598
	for <igt-dev@archiver.kernel.org>; Tue, 16 Sep 2025 11:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A508210E03D;
	Tue, 16 Sep 2025 11:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iLO1uu7x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EA910E4B7
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Sep 2025 13:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757943080; x=1789479080;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=jTOIbOj6QTafx4dZSJZQkXs9lRVThRxJSFSAGd5Cog0=;
 b=iLO1uu7xWdqdYLgzs0+woQHOkcxc7RUVkByVBszaH0Po9ynti4ZAxHRV
 SgW32c7wT3X4s5ljtLpyfcbRBzOeTAybqgqFH47oNEo7AnyswLfiZjYvk
 ElhV5QyOKddDict+qacD+mAEgexlhDlkXReM8Vxx6E2snTkuXPuH4TPzo
 9WcKof7a4AjUw/jyWSaNOGKp4+N0L7Y6WHV7CtDw6a6TQFIxFC9t/D9YD
 XyKrA/2RKgfgRoafZQEsIuj9eQX95Q2YhDPaQt3a4eVw+JEVgppfb8355
 eLgyXHhQup40rUhl4g1VWaXoU+8T4pNQe8iSnu+FrCIZ5ZtW0rJl6xDk/ Q==;
X-CSE-ConnectionGUID: db/Y871iTjWPA0xPWIpN/Q==
X-CSE-MsgGUID: phw/hDQiS0Ck+OYksbc0ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="59422736"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="59422736"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 06:31:20 -0700
X-CSE-ConnectionGUID: OAC4mVJBRx+HYEb0nh7Whw==
X-CSE-MsgGUID: PoFgcUDyRuG89sn7y9/puQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="174247830"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 06:31:19 -0700
Date: Mon, 15 Sep 2025 15:33:22 +0200 (CEST)
From: "michal.grzelak" <mgrzelak@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, 
 "Grzelak, Michal" <michal.grzelak@intel.com>
Subject: Re: [PATCH i-g-t v2 1/1] lib/igt_psr: Skip the test when PSR is
 disabled
In-Reply-To: <98f87611cc7586b5a6f5295e78c818f20df3205c.camel@intel.com>
Message-ID: <ed2e1099-1d26-4a57-9363-63d23d2a91f1@intel.com>
References: <20250828104311.1279788-1-michal.grzelak@intel.com>
 <20250828104311.1279788-2-michal.grzelak@intel.com>
 <98f87611cc7586b5a6f5295e78c818f20df3205c.camel@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-15875880-1757943205=:937659"
X-Mailman-Approved-At: Tue, 16 Sep 2025 11:19:26 +0000
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-15875880-1757943205=:937659
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 15 Sep 2025, Hogander, Jouni wrote:

> On Thu, 2025-08-28 at 12:43 +0200, Michał Grzelak wrote:
>> If PSR setup timing is not met, then PSR will stay disabled and test
>> will fail anyway. Skip the test upon finding that setup timing was
>> not
>> met.
>>
>> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
>
> Reviewed-by: Jouni Högander <jouni.hogander@intel.com>

Thanks for the review.

BR,
Michał

--8323329-15875880-1757943205=:937659--
