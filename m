Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B391C27C6E
	for <igt-dev@archiver.kernel.org>; Thu, 13 Jun 2024 17:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FE810EB35;
	Thu, 13 Jun 2024 17:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BIR5gRx5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA5410EB35
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2024 17:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718299204; x=1749835204;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ScJpastVVT0T/CI+6JshuQooMhwtj4+CV9f8gBSFvxw=;
 b=BIR5gRx52V/5YgD1507XjIElA8+d8Z6mPo26LSKvzUDjvOjOHKbegAX3
 Byar1BvK0Tr+Ym+WItTh1/Tn5eZwF6UAyDKCPOXXbrcX7l+l4o3TM53dB
 ANO2JLhrz4a6FYNKGXkl7c/cEEkCG8zTHojuXtBdr12PRMukDe41bk3Hw
 GivlhxXbqj2VXis6UF3mIitNvdPGFCZ7bSKeGNEM4Ulf7ahxa2UpEA7y3
 J/CQpfRdFY5pRS0MlyvO2SXZ4eQt8p0LjM+NjJn9vB48PrmUvoh4b599L
 42mFMaG0u8eRuxu84uNeb7hYs0r/mWwnszb7Xg3ME9XYvZ0CmezC3NefC w==;
X-CSE-ConnectionGUID: nm6izY0ASUu7+wwxylIXBQ==
X-CSE-MsgGUID: S8M0BnjoTr2hRXZbBxNwSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="18970879"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="18970879"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 10:20:02 -0700
X-CSE-ConnectionGUID: 6qNKRFKWSk+bTa5BHKbIbQ==
X-CSE-MsgGUID: ZyqXbzxuTtyk+ZUT4qFo0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="40187569"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 13 Jun 2024 10:20:00 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 13 Jun 2024 20:19:59 +0300
Date: Thu, 13 Jun 2024 20:19:59 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 04/27] tools/intel_vbt_decode: Decode block 3
 (Display Toggle Option)
Message-ID: <ZmsqP1cTxLn8Dywl@intel.com>
References: <20240607135758.31421-1-ville.syrjala@linux.intel.com>
 <20240607135758.31421-5-ville.syrjala@linux.intel.com>
 <87o785i4qi.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o785i4qi.fsf@intel.com>
X-Patchwork-Hint: comment
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

On Thu, Jun 13, 2024 at 12:14:45PM +0300, Jani Nikula wrote:
> On Fri, 07 Jun 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Decode VBT block 3 (Display Toggle Option).
> >
> > On ALM the block appears to contain some kind of actual toggle
> > list of child devices, on all more modern machines it just has
> > the feature bits.
> >
> > Example output from ALM:
> > BDB block 3 (27 bytes, min 3 bytes) - Display toggle option block:
> >         0000: 03 1b 00 00 0c 00 08 00  01 00 09 00 02 00 00 00
> >         0010: 00 00 00 00 00 00 00 00  00 00 00 00 00 00
> >
> >         Feature bits: 0x00
> >         Num entries: 12
> >         Toggle list #1: LFP1 (0x0008)
> >         Toggle list #2: CRT (0x0001)
> >         Toggle list #3: CRT,LFP1 (0x0009)
> >         Toggle list #4: TV (0x0002)
> >         Toggle list #5: none (0x0000)
> >         Toggle list #6: none (0x0000)
> >         Toggle list #7: none (0x0000)
> >         Toggle list #8: none (0x0000)
> >         Toggle list #9: none (0x0000)
> >         Toggle list #10: none (0x0000)
> >         Toggle list #11: none (0x0000)
> >         Toggle list #12: none (0x0000)
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  tools/intel_vbt_decode.c | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >
> > diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> > index cee1d5196a9a..4281bd7e520e 100644
> > --- a/tools/intel_vbt_decode.c
> > +++ b/tools/intel_vbt_decode.c
> > @@ -316,6 +316,8 @@ static size_t block_min_size(const struct context *context, int section_id)
> >  		return sizeof(struct bdb_general_features);
> >  	case BDB_GENERAL_DEFINITIONS:
> >  		return sizeof(struct bdb_general_definitions);
> > +	case BDB_DISPLAY_TOGGLE:
> > +		return sizeof(struct bdb_display_toggle);
> >  	case BDB_PSR:
> >  		return sizeof(struct bdb_psr);
> >  	case BDB_CHILD_DEVICE_TABLE:
> > @@ -1249,6 +1251,20 @@ static void dump_general_definitions(struct context *context,
> >  			   child_dev_num, defs->child_dev_size);
> >  }
> >  
> > +static void dump_display_toggle(struct context *context,
> > +				const struct bdb_block *block)
> > +{
> > +	const struct bdb_display_toggle *t = block_data(block);
> > +
> > +	printf("\tFeature bits: 0x%02x\n", t->feature_bits);
> > +	printf("\tNum entries: %d\n", t->num_entries);
> > +
> > +	for (int i = 0 ; i < t->num_entries; i++)
> 
> Superfluous space before ; there. Seems to have been copy-pasted to a
> few patches in the series.

Fixed those up while pushing. Thanks.

-- 
Ville Syrjälä
Intel
