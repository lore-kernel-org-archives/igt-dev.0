Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAE1E77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 17:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E7410E2CF;
	Fri, 20 Dec 2024 17:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQ9Jsf57";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1AC910E2CF
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 17:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734714329; x=1766250329;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/kvOACRyfB1iVEEoxHQQnwSyKecpopkTh+N+cj5jnCs=;
 b=DQ9Jsf57GcH7qPABK8ZHco3E5xULDlTWmzyH9bKAbUwkbe+ymE/4QxE1
 o8fLvfgj7UXntEDRjOkj+aap16+cTpMEpD3VtabKjyB64mBxtErcf2YQe
 3XXhpkhvu/B6/h5Z7r0lgNAx2wk9wOI9a0dq2+ymXMqX3Q6a+1RLoLZg3
 ZpnuAmGpIkIgAAxjdC7ZSm8cgIVC+2cvFDI74SCXSSUVGX3ifGHJUO5hz
 /9GHymm4L3W3HiwXDL8K+Nlynpx0cTV83QW9JmXNzM99Ey65t3Y18kCtH
 H8T7JEePeb4aD6F/O8D8Lwd0NNCfVaanSU8k6GpxwlMD3ZTnFTKRdJsM1 g==;
X-CSE-ConnectionGUID: ozufG0WTQNi8N4f9LLeFAQ==
X-CSE-MsgGUID: tPCOjiULSvazQJD8w5P2nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="34983778"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="34983778"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 09:05:27 -0800
X-CSE-ConnectionGUID: jLyiaHPeQpSIqy9QhXZIaQ==
X-CSE-MsgGUID: jfDhDdeWTpGNqBGTgp5nLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="129372768"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 09:05:25 -0800
Date: Fri, 20 Dec 2024 18:05:22 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org, Francois Dugast <francois.dugast@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, ryszard.knop@intel.com,
 jari.tahvanainen@intel.com
Subject: Re: Add env info to igt_runner (was: Re: [PATCH i-g-t 4/4]
 lib/igt_device_scan: Fix scan vs bind/unbind/reload)
Message-ID: <20241220170522.3nevqraywqmhlix2@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, ryszard.knop@intel.com,
 jari.tahvanainen@intel.com
References: <ujidcfwjkj5mvdc7nsfhbl76gk4vswl7ibqkwy24xieiwlpfer@ly57qp226qsh>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ujidcfwjkj5mvdc7nsfhbl76gk4vswl7ibqkwy24xieiwlpfer@ly57qp226qsh>
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

Hi Lucas,
On 2024-12-19 at 11:24:09 -0600, Lucas De Marchi wrote:
> hijacking the thread and adding some people to Cc for the igt_runner question.
> Previously In-Reply-To: <rnw3q6mhthnwyvowvszr2gllyjtbb2mozk4em272xlmkvm7pyl@szbhtg3sd7d7>
> 
> On Thu, Dec 19, 2024 at 10:35:00AM -0600, Lucas De Marchi wrote:
> > On Wed, Dec 18, 2024 at 07:34:19AM +0100, Zbigniew Kempczyński wrote:
> > > On Tue, Dec 17, 2024 at 09:13:24PM -0800, Lucas De Marchi wrote:
> > > > There's no guarantee a card will end up with the same device node when
> > > > modules are loaded/unloaded and drivers bound/unbound. There's some
> > > > fundamental issue with the igt's the way it is and it's also puzzling
> > > > from the logs it looks like the device vanished from the bus, when in
> > > > reality is just the SW state out of sync with what the kernel is
> > > > exporting.
> > > > 
> > > > Re-scanning when trying to match a device is not expensive compared to
> > > > what most tests are doing, so simply force it to occur whenever trying
> > > > to match a card.
> > > 
> > > I also should comment the above. It is generally true, but I've noticed
> > > getting attributes might be expensive. Even it may take up to few
> > > seconds, that's why I've added some attributes we don't fetch from udev
> > > (see is_on_blacklist()). If I'm not wrong getting 'config' was a cause
> > > to limit attributes we fetch.
> > 
> > why would we get all attributes and exclude some?  Shouldn't we get only
> > the attributes we actually use? AFAIK this logic is basically used by
> > --device/IGT_DEVICE, right? What filters we normally use?
> > 
> > I usually pass the pci slot (because I know that won't change
> > dynamically and cause surprises). Apparently CI passes vendor/devid:
> > 
> > 	export IGT_DEVICE=pci:vendor=$1,device=$2
> > 
> > (but it seems to vary depending on pipeline)
> > 
> > Some devs pass the device node directly too as in a lot of places
> > there's only ever card0 possible.
> 
> 
> Could we dump the env and args somewhere so we know how igt_runner or
> individual tests are being called without looking at the CI piepeline
> sources? I was thinking about either having that info in the stdout
> output of igt_runner or in the json. Another possibility would be in
> dmesg, but I'm not sure it's a good option. Thoughts?

Not only that, also parameters used to start igt_runner,
what was in .igtrc file (if any), current wall time,
testlist prepared to run, free memory and free disk.
metadata file for igt_resume, it will enable with prepared
teslist to re-execute run.

Also kernel config from /boot ? Or should it be in shard
run info (avoided duplication).

Maybe some other info, either igt_facts or lspci output?
Should we ask also display team and our CI?

+cc Jari from display

Regards,
Kamil

> 
> My preferred option would be to have e.g.:
> 
> {
>   "__type__": "TestrunResult",
>   "results_version": 10,
>   "name": "xe-2403-995cd30a4e222b6a7b4b40c36219e4937fd7109e\/bat-bmg-1\/0",
>   "uname": "Linux bat-bmg-1 6.13.0-rc3-xe+ #1 SMP PREEMPT_DYNAMIC Thu Dec 19 14:40:51 UTC 2024 x86_64",
>   "time_elapsed": {
>     "__type__": "TimeAttribute",
>     "start": 1734621126.8734231,
>     "end": 1734621288.5994539
>   },
>   "environment": {
>     "IGT_DEVICE": ...
>     <any IGT_* env var>
>   },
>   "argv": [ ... ]
> 
> 
> Lucas De Marchi
