Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEE1CD98F2
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 17:21:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3CE10E2FD;
	Wed, 17 Jun 2026 17:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tp0eBTF9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD41410E2FD
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 17:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781716840; x=1813252840;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ftw0HsG9NkFRYPaxb5Kc/9rGM3CpAtYts+/jO5gmm3s=;
 b=Tp0eBTF9lr5GwAxnHYsyOuKpe8gLoMKKiuLdUfiGiJnaWVHMbpCtFz+9
 oZaW6V065XyR6hqrSKKuW9mAXgx29LrxleC7Sl3YaX2dbsd+AgjcRKXTL
 OB7R4shtoaN8jXC6PAUotNLYRQUJqKk1lExN0AqHW+sZO0+om2nrnczVq
 0w4j1Hg+ypB6rUzA57ev8uXB6n4w60Ex0hffA/ut1RbUbSoSbRGd3Mlh+
 Fv1pyqp3dNoVpkb7F6sS/ymxd+kZidMRusm3tD8fUwFm6AomLbx6v7fNs
 WhWywbsiDXXfYgtBBYV0D42mxbKybYU2ElVbC7jC53wIxFxalD6iRwNR/ g==;
X-CSE-ConnectionGUID: Gch2+1QMRkehA5B4+5Uikw==
X-CSE-MsgGUID: n5dv0cKYRjWUJXZDFd/7eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="70054002"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="70054002"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 10:20:40 -0700
X-CSE-ConnectionGUID: eVo9kwEJTKePg8QjcTgybw==
X-CSE-MsgGUID: AtxrhlidQOCVUtk4Ht+LsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="248201800"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 10:20:38 -0700
Date: Wed, 17 Jun 2026 19:20:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
Cc: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Gupta, Saurabhg" <saurabhg.gupta@intel.com>,
 "Zuo, Alex" <alex.zuo@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_vm: Add fault reserved MBZ assert
Message-ID: <20260617172017.emxbbiiolwn4jyav@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Gupta, Saurabhg" <saurabhg.gupta@intel.com>,
 "Zuo, Alex" <alex.zuo@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>
References: <20260603143628.3739477-1-jonathan.cavitt@intel.com>
 <CH3PR11MB8434C99C95B62A6F6A8C6FCC8D1C2@CH3PR11MB8434.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CH3PR11MB8434C99C95B62A6F6A8C6FCC8D1C2@CH3PR11MB8434.namprd11.prod.outlook.com>
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

Hi all,
On 2026-06-08 at 05:50:42 +0000, Dandamudi, Priyanka wrote:
> 
> 
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Jonathan Cavitt
> > Sent: 03 June 2026 08:06 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Gupta, Saurabhg
> > <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Brost,
> > Matthew <matthew.brost@intel.com>
> > Subject: [PATCH i-g-t] tests/intel/xe_vm: Add fault reserved MBZ assert
> > 
> > In xe_vm_fault, the reserved fields must be zero.  This is not asserted test-
> > side, however, so add the missing assertions.
> > 
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  tests/intel/xe_vm.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c index
> > 408bfdb718..386a0981aa 100644
> > --- a/tests/intel/xe_vm.c
> > +++ b/tests/intel/xe_vm.c
> > @@ -3060,6 +3060,8 @@ static void get_property_exercise(int fd, uint32_t
> > vm)
> >  		igt_assert_eq(f.address, f0.address);
> >  		igt_assert_eq(f.access_type, f0.access_type);
> >  		igt_assert_eq(f.fault_type, f0.fault_type);
> > +		igt_assert_eq(f.reserved[0] | f.reserved[1] |
> > +			      f.reserved[2] | f.reserved[3], 0);
> LGTM,
> Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>


Thank you all, I merged it.

Regards,
Kamil

> >  	}
> >  	free(faults);
> >  }
> > --
> > 2.53.0
> 
