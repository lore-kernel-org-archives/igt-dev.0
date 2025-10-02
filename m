Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7EBCAC5B8
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 19:55:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAE410E85D;
	Thu,  2 Oct 2025 19:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XfKk+QRv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8778E10E863
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 19:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759434908; x=1790970908;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=UCci4SBO4osof9Ro0QIl/Del1ZAWKOJcAe8csh10jko=;
 b=XfKk+QRv8m6AqremWnY0F+5mpp0fx/JRA3p8mNAC9U9ITBAV0DY2DhXG
 sPS5jjFC9JzgEjSbAFcuYg+4pcn5KQPcwxY/ZJ+0BI98Nob8weFz0mgg7
 /YfplmSwq79TK6fHfRfwd7nesUbKJeXQNj42zARC2ngsIbcz0qkXSONQ6
 C8sEwYoANTMWzyje3vSpl8IxxYGuaMbaLuIhuo5UPzEKGnn3O2lKDSPrU
 lKi9k10Iyfy/XeXq6KuJhM5VuwkNqFIKcq9WW0vhTbkTJN3lusgvAzOkf
 MGXFGcfwMs3e9PQ3xTywjNch6SUAQr+3jrEI7C4XbkJr0N+ukcMm7ufK1 A==;
X-CSE-ConnectionGUID: MLEZF9OuS+qqRibCFJHHpw==
X-CSE-MsgGUID: 90QelxuzRN6BA0M6QElhgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="79376369"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="79376369"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 12:55:08 -0700
X-CSE-ConnectionGUID: BOKDmC+HTrqAOpVPyFpOgA==
X-CSE-MsgGUID: wEliYPC/TleEgobW3aZL/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="178721466"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 12:55:07 -0700
Date: Thu, 2 Oct 2025 21:55:05 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 6/7] tools/intel_display_poller: Add dsb-status-live
 test
In-Reply-To: <20250922160950.27250-7-ville.syrjala@linux.intel.com>
Message-ID: <a49d86c7-ab10-04ea-a9c3-013e0923c887@intel.com>
References: <20250922160950.27250-1-ville.syrjala@linux.intel.com>
 <20250922160950.27250-7-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-851433103-1759433269=:1357965"
Content-ID: <d2ecca1a-b43d-866d-cd11-36303e9927da@intel.com>
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

--8323329-851433103-1759433269=:1357965
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <61af4919-efd9-e4de-dd48-25b49897de6b@intel.com>

On Mon, 22 Sep 2025, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Add a dsb-status-live test that can be used to poll for live
> status bits in the DSB_STATUS register.
>
> Eg.
> intel_display_poller --pipe a --test dsb-status-live --bit 26
> will look for the DSB safe window rising edge.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>
--8323329-851433103-1759433269=:1357965--
