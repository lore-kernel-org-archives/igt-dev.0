Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3971CC3ABD8
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 16:16:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC35410E63F;
	Wed, 14 May 2025 16:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XgYgvxop";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675C810E63F
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 16:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747239406; x=1778775406;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=m3Te+Yfe5+thi4uKURZaqP0sJ9XoNW1WBkX9pRr3g6o=;
 b=XgYgvxopAIzijKuG6VhsDL9xMjyMtiHO1rM1pZXDmtoYqxJgguiiKOTI
 eEyaiHRUgFfeFrPSconU7IdAmIdmYovVhnxiZ8zrhOVncx5VWVmPLwKxl
 8ugRCO+r6oV/2Xfg0PQ/w7bQFqHEMEYeEGek7jRiP/vhf8Uw5qXsW8ZSD
 6MNQ5nYu7f/owDGX8O7qRStuZTlNtO9KpqfP+SqujXDkEGJ1CEZV6l/y9
 7/V/UgomeU/f58RD5WaSRew7TkFk6lm01dwbwS9Kc/umpzz1UY4yyRwBf
 KbKxJvl3NPOl62Vnjizote+SKdMjADuDuz8MyMdIjJYvuA2W0msxbflTt Q==;
X-CSE-ConnectionGUID: +KwbCur6R82Cypc7dWsSgQ==
X-CSE-MsgGUID: JTB/laR5REWp+J5QDByg9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="52955666"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="52955666"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 09:16:39 -0700
X-CSE-ConnectionGUID: BuD+KuAGQtOF/fDvtOSrew==
X-CSE-MsgGUID: MRal8XtySSeY7iwlshHd1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="142115378"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.97])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 09:16:35 -0700
Date: Wed, 14 May 2025 18:16:31 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, 
 "markyacoub@google.com" <markyacoub@google.com>,
 "seanpaul@google.com" <seanpaul@google.com>, 
 "Santa, Carlos" <carlos.santa@intel.com>, "Singh,
 Sapna1" <sapna1.singh@intel.com>
Subject: Re: [PATCH v4 01/15] Add stub for libunwind, procps and glib
Message-ID: <ufza27hzcrxihnl5o2zp3y6rezutjpxa3wsqozmvj3o6zraoiz@b4qr5uhzi5dg>
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
 <20250507160148.53857-2-jeevaka.badrappan@intel.com>
 <hc5xutqxss2jbhsffjzl2cqg3eu7zmva2l5h2hoqj2htzwwhla@edk5zllh7r5m>
 <IA0PR11MB735330013D7B954E8F750D7EED91A@IA0PR11MB7353.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <IA0PR11MB735330013D7B954E8F750D7EED91A@IA0PR11MB7353.namprd11.prod.outlook.com>
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

On Wed, May 14, 2025 at 05:00:24PM +0200, Badrappan, Jeevaka wrote:
> 
> > diff --git a/lib/igt_glib.h b/lib/igt_glib.h
> 
> > new file mode 100644
> 
> > index 000000000..fc1743970
> 
> > --- /dev/null
> 
> > +++ b/lib/igt_glib.h
> 
> 
> > Name igt_something.h may be incidentally included, especially it is
> 
> > not protected with #ifdef ANDROID.  So I would use include/android
> 
> > directory to put these includes there. And I would name them
> 
> > android/glib.h, android/procps.h, and android/unwind.h. For being
> 
> > absolutely sure no other os will include them you may protect these
> 
> > includes with #ifdef ANDROID.
> 
> May i know which one is preferred please?
> <igt_root_dir>/lib/android/glib.h or <igt_root_dir>/include/android/glib.h or <igt_root_dir>/android/glib.h

I would put it to <igt_root_dir>/include/android.

--
Zbigniew

> 
> Thanks and Regards,
> Jeevaka
> 
