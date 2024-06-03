Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7D7C25B75
	for <igt-dev@archiver.kernel.org>; Mon,  3 Jun 2024 07:35:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA0610E2E8;
	Mon,  3 Jun 2024 07:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XxQFMSJ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C9410E2E8
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Jun 2024 07:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717400129; x=1748936129;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bQ6MJzjaoDU7Cq5n4gC5hdD11LVttm8rf/y/QwqgV34=;
 b=XxQFMSJ/En4jitNUQ6bduz8fN7wX425fLqkDoiif61A+Na9ABRM79lJW
 EmRHBUG7dVfssUtXLtS6fj5wGGWpum458C3m3yJMWUkVAIOJglrwZooLB
 4wpm68A3iuYz1eUsJPTCxYt/fI5y7VRuymLTkHm+cYUDaVEi/YsJ3AYPT
 X9cKoxEldEHzMs207H7940flHn4VIxFFrcfyY7Q8MJvyq7LIqNvrdzAg/
 5NVMw+hnNehpavV9hSuCSapRstSaUAFLCRZ+5pLs26Jv7edAeQ72SX/Kt
 MoUX75WrT5phqQE+MbtblxLnfXuomRtsBX/zzxfrJDhFYVFK/qjY3ukpi w==;
X-CSE-ConnectionGUID: Qvns6dfDSiGfWcaT9Jc19A==
X-CSE-MsgGUID: aJzSm0stQ4+2vzKgRLDLWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="13747246"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="13747246"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 00:35:24 -0700
X-CSE-ConnectionGUID: LTAKOOtyRM+8XtuQ3z56/Q==
X-CSE-MsgGUID: LnUbPH5vS2aTwAo9nsf9CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="37421815"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.24])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 00:35:21 -0700
Date: Mon, 3 Jun 2024 09:35:18 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t v4] tools/mk_detect_intel_gpu: add a tool to detect
 Intel GPUs from their PCI IDs
Message-ID: <20240603073518.u37dkix3rxahhdbq@zkempczy-mobl2>
References: <20240522120240.48463-1-mauro.chehab@linux.intel.com>
 <87a5kiqa6l.fsf@intel.com> <875xv6q8ob.fsf@intel.com>
 <20240522144627.tdiadqyfgk67ox55@kamilkon-DESK.igk.intel.com>
 <87r0dtouhu.fsf@intel.com> <20240523103558.42876c98@maurocar-mobl2>
 <87le40q4gi.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87le40q4gi.fsf@intel.com>
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

On Thu, May 23, 2024 at 12:10:05PM +0300, Jani Nikula wrote:
<cut>

> >
> > The generated script itself doesn't require anything other than lspci to
> > run, as what the script does, on its 35 lines of code (not including the
> > PCI ID database), is:
> >
> > 	1. run lspci -nm
> >
> > 	2. If the PCI ID device is at the database, it prints:
> >
> > 		print "Detected GPU PCI device: $id$subtype, PCI ID: $pci_id\n";
> >
> > 	   For the above example, the output is:
> >
> > 		Detected GPU PCI device: CFL (CML_U_GT2), PCI ID: 8086:9b41
> >
> > 	3. If multiple Intel GPUs are found, it prints a warning, as DUT
> > 	   tests may require an extra parameter to use the right GPU:
> >
> > 		Warning: More than one Intel GPUs detected
> >
> > 	4. if no Intel GPU is found, it will print:
> >
> > 		Warning: No Intel GPUs detected
> 
> The way I see it, intel_device_info.c and igt_device_scan.c have all the
> building blocks necessary to accomplish this. As long as
> intel_device_match[] is kept up-to-date, which naturally will be, it
> needs no further maintenance. It could be added to lsgpu as an option.
> 

Currently igt_device_scan.c is limited to devices which have drm driver
loaded (that was danvet requirement of udev scanning of drm devices, not
pci). But if I'm not wrong it would be relatively simple to add
scan_pci_devices() in which we would iterate over udev pci devices and
filter out 300 class then add some switch to display it lsgpu. We would
at least keep this simply in igt, without any additional scripting/tools
needed.

--
Zbigniew
