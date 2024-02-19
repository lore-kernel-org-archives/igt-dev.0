Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68F8C48BF8
	for <igt-dev@archiver.kernel.org>; Mon, 19 Feb 2024 16:15:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535B310E395;
	Mon, 19 Feb 2024 16:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RuOgVQou";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5C110E395
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2024 16:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708359331; x=1739895331;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2y0WhZFbucsgdPX6Kqi7TEEPaJOw8rtZFV77/QqkuGc=;
 b=RuOgVQouIvR7kPgxlwtHxHSNZq/QkYyLl1vFgHH0VPZ7z/ncR0ldL5vH
 mD3OUcg5471aug1DtrFdQhfE74XVy3hd3lE7qLe6umoBfKZFjlheuzhIc
 BVpuhjPWtIchyqfYFmVFuxUgiswfQ0dpV4WZuqiMvtg2dGSJy3XBT5Snl
 /lIpXSr4d14reafuFyIq/pjK/u9t9EltRYG8yXbuAC+MUWRm8sJ/tCdQz
 SJN9BozPP3n2/PZoJ9uaRiPUZsLjk4Ncb7cU+ndr3nuqMtTmUIKRJYQjL
 mglOAKjbz0q0J8x4SPdtWNE8s0GApTkD/J7QS2B/XA01dXJyognuhdmZH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13070298"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208";a="13070298"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 08:15:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4693146"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 08:15:30 -0800
Date: Mon, 19 Feb 2024 17:15:09 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t v1] tests/intel/i915_test_config: align JSON
 documentation with xe
Message-ID: <20240219161509.6di4fqdanxiqvsyn@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240216155207.67429-1-kamil.konieczny@linux.intel.com>
 <20240219080830.3619dcd8@maurocar-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240219080830.3619dcd8@maurocar-mobl2>
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

Hi Mauro,
On 2024-02-19 at 08:08:30 +0100, Mauro Carvalho Chehab wrote:
> On Fri, 16 Feb 2024 16:52:07 +0100
> Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> 
> > From: Jari Tahvanainen <jari.tahvanainen@intel.com>
> > 
> > Restructure i915 JSON to align with Xe.
> > 
> > Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Signed-off-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  tests/intel/i915_test_config.json | 45 ++++++++++++++++++++++---------
> >  1 file changed, 32 insertions(+), 13 deletions(-)
> > 
> > diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
> > index ad59677f8..b09f4244e 100644
> > --- a/tests/intel/i915_test_config.json
> > +++ b/tests/intel/i915_test_config.json
> > @@ -16,33 +16,52 @@
> >      "exclude_files": [ "kms_*", "gem_concurrent_all.c", "gem_concurrent_blit.c",
> >                         "xe_*" ],
> >      "fields": {
> > -	"Mega feature": {
> > +        "Category": {
> > +            "_properties_": {
> > +                "mandatory": true,
> > +                "description": "Contains the major group for the tested functionality, being hardware, software or firmware"
> > +            },
> > +            "Mega feature": {
> >                  "_properties_": {
> >                      "description": "Contains the mega feature for end to end use case, e. g. the 'sellable' feature."
> >                  },
> > -                "Category": {
> > -                "_properties_": {
> > -                    "description": "Contains the major group for the tested functionality"
> > -                },
> > -
> >                  "Sub-category": {
> >                      "_properties_": {
> > -                        "description": "Contains the minor group of the functionality"
> > +                        "mandatory": true,
> > +                        "description": "Contains the technical feature/functionality"
> >                      },
> >                      "Functionality": {
> >                          "_properties_": {
> > -                            "description": "Describes the functionality to be tested"
> > +                            "mandatory": true,
> > +                            "description": "Groups page table tests on buckets containg more detailed functionality"
> >                          },
> >                          "Feature": {
> >                              "_properties_": {
> >                                  "description": "Describes the lowest level feature bucket"
> > -                            },
> > -                            "Run type": {
> > -                                "_properties_": {
> > -                                    "description": "Defines what category of testlist it belongs"
> > -                                }
> >                              }
> >                          }
> > +                    },
> > +                    "Run type": {
> > +                        "_properties_": {
> > +                            "mandatory": true,
> > +                            "description": "Defines what category of testlist it belongs",
> > +                            "default-testlist": "FULL",
> > +                            "update-from-file": {
> > +                                "exclude-type": "regex-ignorecase",
> > +                                "append-value-if-not-excluded": "i915 FULL",
> > +                                "include": [
> > +                                    { "i915 BAT": "../intel-ci/fast-feedback.testlist" }
> > +                                ],
> > +                                "exclude": [
> > +                                    { "i915 BAT, 915 FULL": "../intel-ci/blacklist.txt" }
> 
> There is a typo at "915 FULL". It should be, instead: 
> 
> 	{ "i915 BAT, i915 FULL": "../intel-ci/blacklist.txt" }
> 
> or, even better:
> 
> 	{ "all": "../intel-ci/blacklist.txt" }

I will go with this,

Regards,
Kamil

> 
> With that:
> 
> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> 
> > +                                ]
> > +                            },
> > +                            "order": [
> > +                                "boot",
> > +                                "__all__",
> > +                                "kunit"
> > +                            ]
> > +                        }
> >                      }
> >                  }
> >              }
