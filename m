Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC74C83F1A
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 17:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1361910E86E;
	Thu, 17 Jul 2025 17:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ayJsCw/0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0E710E871
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 17:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752772886; x=1784308886;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mT0FG7+9JooH9zkkIo2Tyt2RNf+ra85//eJ2Nu6f2MI=;
 b=ayJsCw/0DpmTSyeX8g9gK+A/GfWtW1faQPTsrkXRCiCNn5xAMR4BrKjN
 Kf+IxZSq3y9trMakxF4KIYDrBaRVy9Oe+eUi/b+iQMoi0kgag+S56++zb
 YVOa7RGWO93jbC8Iu0zpF70BBFqBSmgzY7Gm7xGRJ6CcRSTsjazNFUgM2
 Nl08q9UhwoV/7aYA0blGSGjk68GnQ3bpiBmZxV32Z742dCmks4n+AD6v/
 YecGNk+N0PYEnAajR/i2ZqsLvivKXEGWY40wq0Mq+WHHvD/St0W6Wzdqq
 WIUQdc/LH+uTFCBjZvs38xWMM+treMZ7nsdx3tPhRZEcZRwFNh30GwhB6 w==;
X-CSE-ConnectionGUID: nrsvicsXSqqRpfcvKt2gCg==
X-CSE-MsgGUID: ha+u8cYAR6KvLxDfLulP+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="65751863"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="65751863"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 10:21:25 -0700
X-CSE-ConnectionGUID: PJT33mUETqGxBYN9orYXdA==
X-CSE-MsgGUID: AHvQFOtZQH+l1kkP5l5otA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="157249084"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 10:21:24 -0700
Date: Thu, 17 Jul 2025 19:20:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] scripts/igt_doc: fix a deprecation warning
Message-ID: <20250717172058.dudvkajbydbhh3vc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20250715162436.130710-1-michael.j.ruhl@intel.com>
 <20250716114847.duqdf32rsxdepbea@kamilkon-DESK.igk.intel.com>
 <IA1PR11MB6418EC31B0DCF739EA0CFE9FC156A@IA1PR11MB6418.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <IA1PR11MB6418EC31B0DCF739EA0CFE9FC156A@IA1PR11MB6418.namprd11.prod.outlook.com>
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

Hi Ruhl,,
On 2025-07-16 at 12:20:30 +0000, Ruhl, Michael J wrote:
> >-----Original Message-----
> >From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> >Sent: Wednesday, July 16, 2025 7:49 AM
> >To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> >Cc: igt-dev@lists.freedesktop.org; De Marchi, Lucas
> ><lucas.demarchi@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> >Subject: Re: [PATCH] scripts/igt_doc: fix a deprecation warning
> >
> >Hi Michael,
> >On 2025-07-15 at 12:24:36 -0400, Michael J. Ruhl wrote:
> >> The regular expression usage has count as the third parameter,
> >> which results in this error message:
> >>
> >> DeprecationWarning: 'count' is passed as positional argument
> >>
> >> So the current usage incorrectly uses the flag value as a count.
> >>
> >> Specify the parameter name to get the correct usage.
> >>
> >> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> >
> >Thank you, I already merged it but please see one nit below.
> >
> >> ---
> >>  scripts/igt_doc.py | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> >> index fa2c2c7ca..3a37a9701 100755
> >> --- a/scripts/igt_doc.py
> >> +++ b/scripts/igt_doc.py
> >> @@ -37,7 +37,7 @@ class IgtTestList(TestList):
> >>                  run_type = "other"
> >>              else:
> >>                  for driver in self.drivers:
> >> -                    result = re.sub(r"^" + driver + r"[\W_]*", "", run_type,
> >re.IGNORECASE)
> >> +                    result = re.sub(r"^" + driver + r"[\W_]*", "", run_type, flags =
> >re.IGNORECASE)
> >
> >According to Python doc, there should be also count=0:
> >
> >result = re.sub(r"^" + driver + r"[\W_]*", "", run_type, count = 0, flags =
> >re.IGNORECASE)
> >
> >Please see: https://docs.python.org/3/library/re.html#re.sub
> 
> Hi Kamil,
> 
> My understanding was that that indicated that the default value of count/flags if they
> where not explicitly set....  Looking at the examples, I see they are setting flags, but not
> count.
> 
> I can provide an update with count = 0, but it is not clear to me that that is required.
> 
> Thoughts?

I am not python programmer, not sure if that AI suggestion is true.

After second reading of examples from above link I see there is
exactly same code you wrote, no count and flags only, so imho no
need for more changes.

Regards,
Kamil

> 
> Mike
> 
> >Regards,
> >Kamil
> >
> >>                      if result != run_type:
> >>                          driver_set = set([driver])
> >>                          run_type = result
> >> --
> >> 2.50.0
> >>
