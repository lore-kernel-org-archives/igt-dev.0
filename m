Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CB0FC590F
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 08:36:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1BE610E179;
	Thu, 26 Feb 2026 08:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vwv+mopi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C6410E16D
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 08:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772094965; x=1803630965;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sQcu5xAP1RVQVWwfWOoJVIv8xmuqlr310+Rm2SY9EEk=;
 b=Vwv+mopi/RVSylhkJ593dVAu2dXDkGT0cjSLIAJZcN2TYuNR5tbTZVhg
 1/dQ8GXD42svOYnzPW2Pb6jpOi9j8qL0S8Gp9Na1PSAeTF/Tvj1W0nMy5
 VlzpkYPbm3/ubSIB4Zse+zsWymfhJHbPRFTqhOLjkWRC4MknCmjhzyQU+
 UXa97JbdMp0OqnCbkbts1BUm5tLXVP2w6oUILWNToN+hpNOIHuhdknHwt
 wwiOO11c3+cZ8WnYgcQRa7bj0ZhpTKQtxDUh9417BrUSv/MRW0AykoR31
 jyJeYIHwELqWY3wOvBPMVuVrU4RxHNICidR9SwVRj423njc8iDfy0OiQA Q==;
X-CSE-ConnectionGUID: 6nFkKfNFTG+Y1KGe7C45hg==
X-CSE-MsgGUID: LVuCFnKwR7O8WtLuh0vpuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73060943"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="73060943"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 00:36:01 -0800
X-CSE-ConnectionGUID: jCu7GOGNQDGzHMdyRQl/pQ==
X-CSE-MsgGUID: ZnC5m289Qaa0F3pQMtP8CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="254256259"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 00:36:00 -0800
Date: Thu, 26 Feb 2026 09:35:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v7 03/48] lib/igt_kms: Add function to list
 connected connectors
Message-ID: <20260226083540.sv27zkbcuy3ai55g@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
 <20260223-unigraf-integration-v7-3-73dc9143c8c1@bootlin.com>
 <20260223144150.6b053827@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260223144150.6b053827@kmaincent-XPS-13-7390>
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

Hi Kory,
On 2026-02-23 at 14:41:50 +0100, Kory Maincent wrote:
> On Mon, 23 Feb 2026 13:09:10 +0100
> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> 
> > Introduce the igt_get_connected_connectors() function, which returns a
> > list of connector IDs that are currently connected according to DRM.
> > 
> > This function includes a timeout mechanism because connectors can be
> > unplugged at any time. Also, especially with MST, the connector can be
> > listed by drmModeGetResources() but not yet accessible with
> > drmModeGetConnector().
> 
> There are memory leaks but it seems accepted by design in IGT. Then:

Please point them out, lets try to remove them if possible,

Regards,
Kamil

> Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
> 
> Thank you!
> -- 
> Köry Maincent, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com
