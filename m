Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850CCCAC5B0
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 19:54:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BF410E39D;
	Thu,  2 Oct 2025 19:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SQVmGJpo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F83C10E39D
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 19:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759434868; x=1790970868;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=yMo9RSYtIDxi7Pm8dyj2jO+3wtMZpGtibYcRm0ROaao=;
 b=SQVmGJpoyHd0eAEYsE97fOD+6x+IR+5YLp9dq3BbHo1stEVcShEPVBHr
 mRu+QN9aswfGxXX4m61Xy8tZ1tQTCdWpz9SS36t0mLmizQEutCYi9mkqA
 W41+qXeCqYzWlY9tPVaaUq63zTOdyjYHJqNhV9q+xacN7+dr85LNvlGJR
 ZOUXFu0/G2CTD6m2yr70E7k7sAYiYpqCXLLphv6O0ZtufQxbXcmi3HSSr
 CmifuL4C22UuotR8ZBpCv6pZxJqlhcc6/E8XyY8NGsPolBz8FwLShbvyo
 qxHwRRTXyFy6DOH1S+tUE7rbgweFIvZd03vRax76SF0PQm1K5L9WERw53 g==;
X-CSE-ConnectionGUID: fvoo8BpURWSPVvVKmK1KDg==
X-CSE-MsgGUID: ZypmQ5cKStWByr10i1GDJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61437328"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="61437328"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 12:54:28 -0700
X-CSE-ConnectionGUID: 4zdH88MjQBaAviVRA13aeQ==
X-CSE-MsgGUID: AeG7kh/cQW2GoJ+d611Qew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="184413051"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 12:54:27 -0700
Date: Thu, 2 Oct 2025 21:54:25 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/7] tools/intel_display_poller: Use
 intel_display_ver() instead of intel_gen()
In-Reply-To: <20250922160950.27250-4-ville.syrjala@linux.intel.com>
Message-ID: <5ac358ed-7163-d2ec-f2de-ce159c1f755d@intel.com>
References: <20250922160950.27250-1-ville.syrjala@linux.intel.com>
 <20250922160950.27250-4-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="8323329-1662908285-1759416415=:1357965"
Content-ID: <a7c5997a-6d8c-6b07-4641-4098c026eb98@intel.com>
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

--8323329-1662908285-1759416415=:1357965
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <d40363ae-0dcb-2c1f-457c-cf2efd8460a4@intel.com>

On Mon, 22 Sep 2025, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Use intel_display_ver() instead of intel_gen() for the display
> hardware version checks. These two can return different numbers
> on the more modern platforms, and using the wrong number could
> lead us down invalid paths.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>
--8323329-1662908285-1759416415=:1357965--
