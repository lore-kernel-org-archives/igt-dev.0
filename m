Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EEDF3D32E
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 16:34:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EF310EC4C;
	Thu,  5 Mar 2026 16:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HlTS9TPb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C8110EC4C
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 16:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772728454; x=1804264454;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lEVV9I0U4xdx8NvZNX5iYjCeEQR5JJvAJSjasmP1xNU=;
 b=HlTS9TPb/AIICkAWl0/wUEsTOpYJ30eLIUuwyJ12K8ihJE2JHTv81143
 KJiCpsNeKFbE8QJsaYMbkyALo0yTFo/qAue2O9QL/9wM38M0vSR6ABFpl
 HIIPiFFyvXRIEhkD2olFmXQpfzxriE0inLSWddeoqkCc7mBTXPD+lneNx
 UJ6SSli0uBNuY5pyLGfHBCLztTCdKxeK4j4MnBEWQYXPa7d0odg7TDQKh
 w8G+tpCbu2/Ldsz/oEDxLAPxq03yEHYlQOmaEiOvRU7k3zU+3cUwWZcro
 60qN5HZwr80GePBH5sMlHp1H7/3MaJZCseNHMjS6ThL345L2NNWBHY48u g==;
X-CSE-ConnectionGUID: pHh/J3bPTAqZgrAub2BGog==
X-CSE-MsgGUID: NMXUHRXZSYOuk2YOiXBUeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="99290316"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="99290316"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 08:34:13 -0800
X-CSE-ConnectionGUID: YhMqjeZKRyi1jryccs86kw==
X-CSE-MsgGUID: r1V70xwNRG+BzPia9s3iDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="217972037"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 08:34:11 -0800
Date: Thu, 5 Mar 2026 17:33:54 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: S Sebinraj <s.sebinraj@intel.com>, igt-dev@lists.freedesktop.org,
 jeevaka.badrappan@intel.com, kamil.konieczny@intel.com,
 zbigniew.kempczynski@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH i-g-t v9] tools/gputop: Add GPU frequencies to the client
 headers
Message-ID: <20260305163354.mufmo3ovn2wsd2m2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 S Sebinraj <s.sebinraj@intel.com>, igt-dev@lists.freedesktop.org,
 jeevaka.badrappan@intel.com, kamil.konieczny@intel.com,
 zbigniew.kempczynski@intel.com, soham.purkait@intel.com
References: <20260211054638.4090041-1-s.sebinraj@intel.com>
 <xocuvxchd3uo7rbewv463aes7sqgziyidmm3gre5om7i2z6vrr@udl5kmjtgypd>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <xocuvxchd3uo7rbewv463aes7sqgziyidmm3gre5om7i2z6vrr@udl5kmjtgypd>
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

Hi Krzysztof,
On 2026-03-05 at 10:25:01 +0000, Krzysztof Karas wrote:
> Hi S Sebinraj,
> 
> [...]
> 
> > +/* Detect which driver is bound to the device */
> This comment still does not answer "which" - it does not give
> you the driver, which is bound, but it checks if the driver you
> gave it is bound.
> This is a minor thing though, so address it only if you plan to
> prepare v10, otherwise ignore it.
> 
> Rest of the code looks good to me:
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> 

Thank you all, I merged it.

Regards,
Kamil 

> > +static bool is_bound(unsigned int drm_minor, const char *driver_name)
> > +{
> > +	char path[256];
> > +	char link[256];
> > +	char *driver;
> > +	ssize_t len;
> > +
> > +	/* Read the driver symlink */
> > +	snprintf(path, sizeof(path), "%s%u/device/driver", 
> > +		 get_sysfs_drm_path(drm_minor), drm_minor);
> > +	len = readlink(path, link, sizeof(link) - 1);
> > +	if (len == -1)
> > +		return false;
> > +
> > +	link[len] = '\0';
> > +
> > +	/* Extract driver name from path (e.g., "bus/pci/drivers/i915" -> "i915") */
> > +	driver = strrchr(link, '/');
> > +	if (!driver)
> > +		return false;
> > +
> > +	driver++; /* Skip the '/' */
> > +	
> > +	return strcmp(driver, driver_name) == 0;
> > +}
> 
> -- 
> Best Regards,
> Krzysztof
