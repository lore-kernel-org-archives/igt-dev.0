Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B81D6B080
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 16:00:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A399D10E8A3;
	Thu, 29 Jan 2026 16:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I/sLVRbG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558C710E8A3
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 16:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769702427; x=1801238427;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qYAre/IwVjpLoOlrF1PS/lLF3BJUfCh3IIiU5xpjA+s=;
 b=I/sLVRbGxTzy2xb2hRfTIow942W56th6WZoWwpQeC5Ce0LbfIENY3LE/
 dstdwuqNDHQlUpcDRZFL/CECDgfIV+RYg6Yi9sKbXX2CsIUJK8QFReV3k
 zPaZGyU8mQek5egtTs1MK6ksJ3u0pKTyYAl9ViFQeIzqeXUHuG7igVD8b
 /pbeKEMbP89hzpoE7NC9jnTUtLlosbS+uMhex6aGMQPqZhWGxoRpybSBU
 H1IpG1UEfURIJcO8MCnjzWeARIfNc3rzXxI8tELKWSAg0gLo2j6h8wsBT
 wIx+R9J8vnmxQavmDPuToNa01RcCSgd6qs1kIEF2ulUOSJcBOFFo/XIOf A==;
X-CSE-ConnectionGUID: aW2IQl/9QVymHmCGHrmW9Q==
X-CSE-MsgGUID: loWbtQbgTgSVYgPOPQPMkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70982153"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="70982153"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 08:00:27 -0800
X-CSE-ConnectionGUID: 8JCF0lD5QYW5GEM6PaqNxA==
X-CSE-MsgGUID: y/JwFM4uRJyuResCM7dMtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="239858609"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 08:00:25 -0800
Date: Thu, 29 Jan 2026 17:00:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org, chaitanya.kumar.borah@intel.com
Subject: Re: [PATCH i-g-t 2/3] tests/intel/kms_frontbuffer_tracking: Add HDR
 feature support
Message-ID: <20260129160010.rxahctc77fa3f52n@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org, chaitanya.kumar.borah@intel.com
References: <20251203090836.1164827-1-swati2.sharma@intel.com>
 <20251203090836.1164827-3-swati2.sharma@intel.com>
 <20251209133522.pwc6djxzvwefu2uf@kamilkon-DESK.igk.intel.com>
 <93697088-0703-4d67-bec3-3cca3fafd8c1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <93697088-0703-4d67-bec3-3cca3fafd8c1@intel.com>
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

Hi Sharma,,
On 2025-12-31 at 13:52:44 +0530, Sharma, Swati2 wrote:
> Hi Kamil
> Thanks for the review.
> 
> On 09-12-2025 07:05 pm, Kamil Konieczny wrote:
> > Hi Swati,
> > On 2025-12-03 at 14:38:35 +0530, Swati Sharma wrote:
> > > Add FEATURE_HDR and extend feature_str() to cover all feature mask
> > > combinations.
> > > 
> > > Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> > > ---
> > >   tests/intel/kms_frontbuffer_tracking.c | 35 ++++++++++++++++++++++----
> > >   1 file changed, 30 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> > > index 0f162d9a5..eda97f7df 100644
> > > --- a/tests/intel/kms_frontbuffer_tracking.c
> > > +++ b/tests/intel/kms_frontbuffer_tracking.c
> > > @@ -855,8 +855,9 @@ struct test_mode {
> > >   		FEATURE_FBC   = 1,
> > >   		FEATURE_PSR   = 2,
> > >   		FEATURE_DRRS  = 4,
> > > -		FEATURE_COUNT = 8,
> > > -		FEATURE_DEFAULT = 8,
> > > +		FEATURE_HDR   = 8,
> > > +		FEATURE_COUNT = 16,
> > > +		FEATURE_DEFAULT = 16,
> > >   	} feature;
> > >   	/* Possible pixel formats. We just use FORMAT_DEFAULT for most tests and
> > > @@ -3987,12 +3988,36 @@ static const char *feature_str(int feature)
> > >   		return "fbc";
> > >   	case FEATURE_PSR:
> > >   		return "psr";
> > > -	case FEATURE_FBC | FEATURE_PSR:
> > > -		return "fbcpsr";
> > >   	case FEATURE_DRRS:
> > >   		return "drrs";
> > > +	case FEATURE_HDR:
> > > +		return "hdr";
> > > +	case FEATURE_FBC | FEATURE_PSR:
> > > +		return "fbcpsr";
> > Can it be splitted by '-'? imho better: "fbc-psr".
> > Same comment to all or-ed strings below.
> Though this is doable, and a good suggestion. However, it will require to
> change existing code
> plus documentation which is not intended in the series. Can take this as a
> followup?

Yes, it is a suggestion, up to you. Also one more suggestion below.

> > Regards,
> > Kamil
> > 
> > >   	case FEATURE_FBC | FEATURE_DRRS:
> > > -		return "fbcdrrs";
> > > +	        return "fbcdrrs";
> > > +	case FEATURE_FBC | FEATURE_HDR:
> > > +	        return "fbchdr";
> > > +
> > > +	case FEATURE_PSR | FEATURE_DRRS:
> > > +		return "psrdrrs";

Can it be sorted alphabetically here? So 'drrs-psr' or 'drrspsr.'
Same applies below.

Regards,
Kamil

> > > +	case FEATURE_PSR | FEATURE_HDR:
> > > +	        return "hdrpsr";
> > > +	case FEATURE_DRRS | FEATURE_HDR:
> > > +	        return "hdrdrrs";
> > > +
> > > +	case FEATURE_FBC | FEATURE_PSR | FEATURE_DRRS:
> > > +		return "fbcpsrdrrs";
> > > +	case FEATURE_FBC | FEATURE_PSR | FEATURE_HDR:
> > > +		return "hdrfbcpsr";
> > > +	case FEATURE_FBC | FEATURE_DRRS | FEATURE_HDR:
> > > +		return "hdrfbcdrrs";
> > > +	case FEATURE_PSR | FEATURE_DRRS | FEATURE_HDR:
> > > +		return "hdrpsrdrrs";
> > > +
> > > +	case FEATURE_FBC | FEATURE_PSR | FEATURE_DRRS | FEATURE_HDR:
> > > +		return "hdrfbcpsrdrrs";
> > > +
> > >   	default:
> > >   		igt_assert(false);
> > >   	}
> > > -- 
> > > 2.25.1
> > > 
> 
