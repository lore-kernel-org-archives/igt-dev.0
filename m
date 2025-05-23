Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE57C3DA6D
	for <igt-dev@archiver.kernel.org>; Fri, 23 May 2025 10:25:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E34110E7D7;
	Fri, 23 May 2025 10:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IeCwaYRq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7C410E28F
 for <igt-dev@lists.freedesktop.org>; Fri, 23 May 2025 10:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747995901; x=1779531901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aUEsc12pWlMMyD44hP2gpkSXIvIsozlxILMFKgVsGTI=;
 b=IeCwaYRqxm8QryalkpCr3pPcqd3ufTceQxF7fwAALcPEqYKsqlmosJNe
 IS4aNvf74GyuOHigaSgtFZrqCCv6oLCibNAL5WmC0IcfSDvWryxdsfcyL
 B242/5RkBbaVpDqOQfhfeXk/+OGM/4oT+TpRh54pz+IEap1JRyG3qtzWA
 UVL69Nce4sH+pwyidTlBxzfcYMpp2u7oqgeXDDRcMv9IF5c4CgHM1cyNK
 dVQqRB1zU5qNNkSHJu9dG9skqX7zL+xSesdkbsjTCPme4QXPU6OOwVbH3
 C0GxDt2R3zVUaaWnLQ1j13kGetB+j0bk6PgPEfLjeBp9TXvdwYx+JmVcy Q==;
X-CSE-ConnectionGUID: Q362hpNFTmS92BQF8d60JA==
X-CSE-MsgGUID: pFb6/oi3RwaaKERQdkRs6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="60703655"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="60703655"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 03:25:00 -0700
X-CSE-ConnectionGUID: VEPyNavXQJO4cOaVsYygxg==
X-CSE-MsgGUID: zCcK3h4/TM6+Gsf5IXFabA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="140942822"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.146])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 03:24:59 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t 1/1] lib/igt_ktap: fix parsing problems for
 parametrized tests with no params
Date: Fri, 23 May 2025 12:24:56 +0200
Message-ID: <116568369.nniJfEyVGO@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <2001558.taCxCBeP46@jkrzyszt-mobl2.ger.corp.intel.com>
References: <20250523083544.13787-1-jan.sokolowski@intel.com>
 <2001558.taCxCBeP46@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Sorry for responding to myself, but I missed one point.

On Friday, 23 May 2025 12:16:00 CEST Janusz Krzysztofik wrote:
> On Friday, 23 May 2025 10:35:44 CEST Jan Sokolowski wrote:
> > In some cases, parametrized test might have no params and therefore no
> > results to be reported, which causes parser failures.
> 
> Please add an excerpt from an error report and a related KTAP report from 
> dmesg to your commit description for reference.
> 
> > 
> > Add a condition that checks for that in the parser.
> > 
> > Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> > Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> Please provide a reference to a real issue, if there is one tracked publicly.
> 
> > ---
> >  lib/igt_ktap.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/lib/igt_ktap.c b/lib/igt_ktap.c
> > index 300fb2bb5..34306a1a0 100644
> > --- a/lib/igt_ktap.c
> > +++ b/lib/igt_ktap.c
> > @@ -250,6 +250,10 @@ int igt_ktap_parse(const char *buf, struct igt_ktap_results *ktap)
> >  		return -EINPROGRESS;
> >  	}
> >  
> > +	/* in case of parametrized test having no params and hence no results */
> > +	if (igt_debug_on(ktap->expect == SUB_RESULT && code == IGT_EXIT_SKIP))
> > +		ktap->expect = CASE_RESULT;
> 
> NAK.
> 
> That looks like you are trying to address a case when a test case opens a 
> parametrized subtest section but returns no results from parametrized 
> subtests.  If that case is now recognized by the parser as protocol violation 
> while it should not, i.e., empty parametrized results section should be 
> allowed, then that should be fixed in the input parser section, not in a next 
> section that evaluates parsing results.

Please also provide a reference to a generic KTAP or Linux kernel KTAP 
specification that confirms legitimacy of empty section of parametrized 
subtest results.

Thanks,
Janusz

> 
> After the parser detects a KTAP parametrized test case header and a KTAP 
> parametrized test case name, it shouldn't expect any parametrized subtest 
> results like it does now but should just expect a test case result.  KTAP 
> parametrized subtest result lines detected when the KTAP test case result line 
> is expected should still be accepted.  Please find relevant steps in the 
> parser code and fix them.  Then, as soon as the current requirement of at 
> lease one result of a parametrised subtest expected is killed, the SUB_RESULT 
> phase may be dropped from the list of parsing phases as no longer needed.
> 
> Please also add a corresponding test case, based on the now problematic KTAP 
> output, to lib/tests/igt_ktap_parser.c
> 
> Thanks,
> Janusz
> 
> > +
> >  	/* neither a test case name nor result */
> >  	if (ktap->expect != SUB_RESULT && code == IGT_EXIT_INVALID)
> >  		return -EINPROGRESS;
> > 
> 
> 
> 
> 
> 




