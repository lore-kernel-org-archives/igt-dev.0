Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A7CC54E66
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 08:44:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3135A11201B;
	Fri, 15 Mar 2024 08:44:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I6mn5GFQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBF811201B
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 08:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710492291; x=1742028291;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=C765Hhj0uhnXUVObT+1LI3OB5bXUa6N61Q0NHYKWq1g=;
 b=I6mn5GFQRg8PV+b+JmOIawXo/OR7a40T9jKsTIuuOwyZdS2W98Klf2wz
 5diB76HnyVROvs8oY95XeItuCSo8w0VW5pfT5HpBAyC1f/dYHf5NfDq3V
 OxsZC29s4eg4OOoX1k8WzAsNFZ1Sg28EHhInAX2hlU3Ci7bSrvqKJ+AQU
 wm1kQGFf7MP2vKowBjnACMa8hG7oD1N7+Xv8M4t54xX4qJjam6y1jg3Lz
 mP5Hh8Onb5/sDchd/tsZKJLmQ6z9YSdvUkOChYl0HptfuH6KG42dIvBsN
 x7ubrvIwW4v0426DrJwiqqpK7AYXMSVjkkATGtDNPOg1e2UiLVep4CHD8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5537021"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="5537021"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 01:44:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="827780548"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="827780548"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 15 Mar 2024 01:44:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Mar 2024 10:44:44 +0200
Date: Fri, 15 Mar 2024 10:44:44 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>,
 lukasz.laguna@intel.com
Subject: Re: [PATCH i-g-t] tools/intel_reg: add possibility to select device
Message-ID: <ZfQKfHaSgWUMPvcU@intel.com>
References: <20240314225839.2845585-1-ashutosh.dixit@intel.com>
 <85v85o5sf0.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85v85o5sf0.wl-ashutosh.dixit@intel.com>
X-Patchwork-Hint: comment
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

On Thu, Mar 14, 2024 at 04:01:55PM -0700, Dixit, Ashutosh wrote:
> On Thu, 14 Mar 2024 15:58:39 -0700, Ashutosh Dixit wrote:
> >
> > From: Łukasz Łaguna <lukasz.laguna@intel.com>
> >
> > Device can be selected by slot or using filter. Example:
> >
> > intel_reg dump --slot "0000:01:00.0"
> > intel_reg dump --filter "pci:vendor=8086"
> >
> > Signed-off-by: Łukasz Łaguna <lukasz.laguna@intel.com>
> 
> Is it possible to merge this old patch upstream? Thanks.

Looks like two patches squashed to one. Someone should split
it up properly.

-- 
Ville Syrjälä
Intel
