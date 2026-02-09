Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEA2E7E0C7
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 11:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEF610E151;
	Mon,  9 Feb 2026 11:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GwlR0SLb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165EC10E151
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 11:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770635988; x=1802171988;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nWC9gIV9BBNghPyttUk+d0rFh+1z+X94eyC8WhsuXIk=;
 b=GwlR0SLb3gDElbcdxengHk7NPMvPMy+X2IUsOOUpuIxejXoIFuSTXI11
 SPaGXntphvhEu5h61DyD3Uw7uIN889P5e1s+tSRgD6k8+9iu9j0oBy+fQ
 YIaujyNw86QUVuo8qvTpimb3FCziE4iLPwDVZbA5FDxOS/melrYZMARdV
 lY5CV45ii0mp4Tvc6U4NAVENptbfO9quMGD11aIuzvir9w9Jfl8XQC4V6
 ZScY79Uluh6fl6R6aN4ARu9KoWNn8G/q6zWDLktNkNwV7/dHGAEPkLxJf
 aedWflmCpW8PuP8SROQwjjMGKlAlvZamp4xT/9yWXBS5bmGFUOp4qB1BV A==;
X-CSE-ConnectionGUID: WMipDv3VQ/uQlQ9RcCRj/A==
X-CSE-MsgGUID: wEjM9+tSSoe82rWsyJUS/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="83115776"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="83115776"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 03:19:48 -0800
X-CSE-ConnectionGUID: zH+qgXs+Ra6ZlGQ6XifBTQ==
X-CSE-MsgGUID: RY1FcTNqT0STpIWgEsVVTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="216063186"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 03:19:47 -0800
Date: Mon, 9 Feb 2026 12:19:23 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: Karthik Poosa <karthik.poosa@intel.com>, igt-dev@lists.freedesktop.org,
 anshuman.gupta@intel.com, riana.tauro@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH i-g-t v11 2/2] tests/intel/xe_pm_residency: Add subtest
 for ASPM Link state residency
Message-ID: <20260209111923.yk33bdi4awunjsx3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Nilawar, Badal" <badal.nilawar@intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>,
 igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 riana.tauro@intel.com, rodrigo.vivi@intel.com
References: <20260204183747.1960879-1-karthik.poosa@intel.com>
 <20260204183747.1960879-3-karthik.poosa@intel.com>
 <b99261d0-08da-410c-99f3-c558837f5539@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b99261d0-08da-410c-99f3-c558837f5539@intel.com>
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

Hi Nilawar,,
On 2026-02-09 at 13:39:18 +0530, Nilawar, Badal wrote:
> 
> On 05-02-2026 00:07, Karthik Poosa wrote:
> > Add subtest aspm_link_residency to verify PCIe ASPM.
> > Active State Power Management (ASPM) is a power management mechanism
> > for PCI Express (PCIe) devices that aims to save power while the devices
> > are in a fully active state.
> > This test uses link state counters from the debugfs
> > dgfx_pcie_link_residencies to verify this.
> > 
[cut]

> 
> Looks good to me.
> 
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> 
> Thanks,
> Badal
> 


Thank you all, I merged it.

Regards,
Kamil

