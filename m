Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D2ED149E7
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 18:37:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDF110EB76;
	Fri, 25 Oct 2024 18:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nm3z3e8q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F0E10EB76
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 18:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729881456; x=1761417456;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kheWFUmTO7+RmT8ci9KAPko+zwce3ozAneNFWq65sXI=;
 b=nm3z3e8qaTV/WL7ByIOvmVKEwliWtqrXQAjGafctRt7cDDRTauxdas17
 SpO/xxV0HG3MFKCHBDHKXgTLgRijMSxKcLaBGjq70G7bBJ8ldvVDJI9gQ
 JvQ8AdhjuHEvXSjKTSNkg0SYN8JMcPuRzdT01Vq2cNdcVA4cMmyFd5O+q
 uKbbaFg8YlmsUMVSrcIh9QnMK/DMG0hpIDO5TaLuuWEjjriAMFdCT4xcL
 yZwzk16sgx787yCMN90cWvPlCe+vtyU6D64CiOE8oK30k0lwlmmEcoTbD
 tQd9k6FZYnRdk89ZU8tNm4gNwwP3PVvwHaxDnqdiuWAh7Rb9AxKZ1GwRU g==;
X-CSE-ConnectionGUID: aMT94H+4ROywnoY6bYC/gg==
X-CSE-MsgGUID: OWSyjYAhSbmFUxFGHCM84A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29691886"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29691886"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 11:37:36 -0700
X-CSE-ConnectionGUID: HTPXM4obTaecWZ7qrgcZVQ==
X-CSE-MsgGUID: cRzfb8OqTSCQuw83MfiAQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="86118029"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 11:37:34 -0700
Date: Fri, 25 Oct 2024 20:37:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v1 1/2] tests/intel/xe_wedged: Ignore more dmesg
 warnings
Message-ID: <20241025183732.noefdjfeyhdtoc2y@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
References: <20241025171240.114267-1-kamil.konieczny@linux.intel.com>
 <20241025171240.114267-2-kamil.konieczny@linux.intel.com>
 <CH0PR11MB54446242D892790759C7D6D6E54F2@CH0PR11MB5444.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CH0PR11MB54446242D892790759C7D6D6E54F2@CH0PR11MB5444.namprd11.prod.outlook.com>
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

Hi Jonathan,
On 2024-10-25 at 17:36:21 +0000, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Kamil Konieczny <kamil.konieczny@linux.intel.com> 
> Sent: Friday, October 25, 2024 10:13 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> Subject: [PATCH i-g-t v1 1/2] tests/intel/xe_wedged: Ignore more dmesg warnings
> > 
> > There are more warnings in dmesg which should be ignored,
> > one comes from driver, for example:
> > 
> > xe 0000:00:02.0: [drm] *ERROR* GT0: reset failed (-ECANCELED)
> > 
> > second from drm:
> > 
> > <4> [438.651441]  ? __pfx___drm_printfn_seq_file+0x10/0x10 [drm]
> > <4> [438.651476]  ? __pfx___drm_puts_seq_file+0x10/0x10 [drm]
> > 
> > so extend regex with them.

Maybe it should be also extended by one more I see on LunarLake without connected
display monitor:

xe 0000:00:02.0: [drm] *ERROR* Failed to write source OUI

so lets wait for CI results and also let me ask display/KMS devs about this.

> > 
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2919

I see that also old one was reopened...
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1958

> > Cc: Jonathan-Cavitt <jonathan.cavitt@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> I don't see anything wrong with this, though I do have a few open, non-blocking
> questions:
> 
> 1. Could we have called igt_emit_ignore_dmesg_regex multiple times instead of
> needing to use a longform inline regex?  It might've been easier to parse that way.

You could but that will override last one, so it will not stack up,
only last one will 'stay' active during this subtest.
I could add '|' at begin of splitted string, for example:

	igt_emit_ignore_dmesg_regex("CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged"
				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED."
				    "|__pfx___drm_[a-z]*seq_file.*drm");

Also spotted now that last dot '.' after '-ECANCELED' is not needed.

> 
> 2. I'm guessing that the igt_emit_ignore_dmesg_regex clears itself after the test
> completes?  I don't see where it clears otherwise, but we've been using this helper
> for a while with no issue, so I suppose it's been correct this entire time.

Strictly speaking it is interpreted by runner/resultsgen.c
during generating results, and yes it is dropped when new (dynamic)subtest
is starting or test exits.

> 
> 3. While I acknowledge that the drm reported errors are expected for this test, may
> I ask for some clarification on why they're expected and/or where they're coming
> from?  This would just be for aiding my understanding of the test/issue.

I do not have any broad knowledge about this, I see in dmesg that a kernel method
of injecting failure is used, so it naturally can lead to a few warnings.
Imho error injection could be intrusive and lead to various errors, also they
are hard to design and write. One simple method which come to mind  would be to
return error from function intended to return a pointer to allocated memory.

Regards,
Kamil

> 
> Thank you for the fix!
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 
> > ---
> >  tests/intel/xe_wedged.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> > index 88e5d47f2..0e4c88ffe 100644
> > --- a/tests/intel/xe_wedged.c
> > +++ b/tests/intel/xe_wedged.c
> > @@ -29,7 +29,9 @@
> >  static void ignore_wedged_in_dmesg(void)
> >  {
> >  	/* this is needed for igt_runner so it will ignore it */
> > -	igt_emit_ignore_dmesg_regex("CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged");
> > +	igt_emit_ignore_dmesg_regex("CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged|"
> > +				    "GT[0-9A-Fa-f]*: reset failed .-ECANCELED.|"
> > +				    "__pfx___drm_[a-z]*seq_file.*drm");
> >  }
> >  
> >  static void force_wedged(int fd)
> > -- 
> > 2.47.0
> > 
> > 
