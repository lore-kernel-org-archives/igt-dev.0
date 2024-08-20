Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6989C3DA4A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 10:08:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632A410E67D;
	Tue, 20 Aug 2024 10:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e5Ij71d2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2C010E67D
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 10:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724148480; x=1755684480;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=y4y2jeJ0dCMq3WOko8ImqVCWPaw6llBuLCLiI8vpy2w=;
 b=e5Ij71d2MSPHwcXxXjV+lYjaxN/2ySzJwaFG6d4fkQBb/0pfdKfnFNN6
 gnr5HpZyZUExMpoucyxo7NkyHdWMTDhV9scDucAHuYPo1gn9TkUWb6/Zy
 f6OB81Wx9H/YO/tFRehTSjL2DjeY1LK2k9AvhpBxrcGhjj2QC0WB/qoa4
 twx7t050mgaBfNj1lapiY8/s5eXr1u6APL2RXQr3Ll957CqJCu6vjLiNO
 cfTeZRrro6RETi336+wFDK9TnQ3oaVcWzUl50rMSvHiEcKwg+kM2tofC0
 05LEzAownqz3Bl8hLMFnGtVQhE5zO/Nh+xsGyf/vXaJnyH0Joe88Jq0kb g==;
X-CSE-ConnectionGUID: iZtF3xNxRxCXAYWmxUQiPw==
X-CSE-MsgGUID: 74YIQ+awT7mYhnG96tShZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="47832103"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="47832103"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 03:07:59 -0700
X-CSE-ConnectionGUID: 1TMNPTE1SyyEo/Ub1IUAug==
X-CSE-MsgGUID: czi69OrIQvKP1DbIcx+LsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="60373446"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 03:07:58 -0700
Date: Tue, 20 Aug 2024 12:07:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 2/2] device_reset: Require a PCI device
Message-ID: <20240820100755.7vey4gwbrhm3nuzd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Rob Clark <robdclark@chromium.org>
References: <20240814185426.70418-1-robdclark@gmail.com>
 <20240814185426.70418-2-robdclark@gmail.com>
 <20240819173652.t4ctowxlkzwkvjzc@kamilkon-DESK.igk.intel.com>
 <CAF6AEGtEkf4Mzo6iXCcdCUwhXxePKU_RZE8VrVUJwav6GQxhvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGtEkf4Mzo6iXCcdCUwhXxePKU_RZE8VrVUJwav6GQxhvg@mail.gmail.com>
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

Hi Rob,
On 2024-08-19 at 11:51:51 -0700, Rob Clark wrote:
> On Mon, Aug 19, 2024 at 10:37 AM Kamil Konieczny
> <kamil.konieczny@linux.intel.com> wrote:
> >
> > Hi Rob,
> > On 2024-08-14 at 11:54:26 -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> >
> > One nit about subject, please use 'tests/' prefix:
> >
> > [PATCH 2/2] device_reset: Require a PCI device
> >
> > should be:
> >
> > [PATCH 2/2] tests/device_reset: Require a PCI device
> >
> > >
> > > Too much baked in assumptions that the drm device is a PCI device.
> >
> > Do you have examples where it is not true (e.g. not a PCI device)
> > and reset is possible? Just curious.
> 
> maybe usb devices?
> 
> Platform devices cannot be reset at the bus level, since there is no bus.
> 
> BR,
> -R
> 

You are right, could you add a comment in code?
Imho it could help as a reminder that there are such devices.
Or at least document it in commit description.

Regards,
Kamil

> > Regards,
> > Kamil
> >
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  tests/device_reset.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/tests/device_reset.c b/tests/device_reset.c
> > > index 8ed3ef5220fc..c49f94e2faed 100644
> > > --- a/tests/device_reset.c
> > > +++ b/tests/device_reset.c
> > > @@ -200,6 +200,7 @@ static void init_device_fds(struct device_fds *dev)
> > >               igt_require_gem(dev->fds.dev);
> > >
> > >       igt_assert(device_sysfs_path(dev->fds.dev, dev_path));
> > > +     igt_require(strstr(dev_path, "/sys/devices/pci") == dev_path);
> > >       addr_pos = strrchr(dev_path, '/');
> > >       igt_assert(addr_pos);
> > >       igt_assert_eq(sizeof(dev->dev_bus_addr) - 1,
> > > --
> > > 2.46.0
> > >
