Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775F1CAC5BA
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 05:09:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9F910E062;
	Wed, 18 Sep 2024 05:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWvMVZxT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B9D10E062
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 05:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726636166; x=1758172166;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SnIYU6ufMGkSaq4+KMl2mlOaN6G91f+tujrjCt9Q5Dc=;
 b=WWvMVZxTEPt0TEVEBOBX1FtPMc79RTYwP7rjAn9shrkliUyGJZ50QIea
 DW/QgpbrDHUVvJCFM3vPCpusT/eEzX+QmwthCSeD+WuPxPu8QLrxNVy95
 io5uLeAor6cTbXUTiJPtbIHzfcJulzAz/bPjX6JoVsPFMD4o+BBqcgw1F
 6IaKdbYkeG2QXUaGkgN2bjRPRtY1G/WvkrGWXYT+bEqVbHqMdXnC2pnYx
 p1q7Mkdj7GW4CNQMwTm5FAueD9OzeQLYxR4Ac9t58JRLvoBOzVKVCOvxd
 V+lW/jygRUpHmLFAFtdQxKzW3tzfZxcoXmINuQYgzuZj+4myuZFSxSXhJ w==;
X-CSE-ConnectionGUID: ipJ0n61zSverxBxXGFfBmA==
X-CSE-MsgGUID: 2gGT9+WfS42ND1ZUq/mAdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="43046606"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="43046606"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 22:09:00 -0700
X-CSE-ConnectionGUID: D/IxXbKNS6SmshYsuXBIOQ==
X-CSE-MsgGUID: 08dnqmdIQ6Kq8DnFlWOKhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="92719011"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.189])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 22:08:57 -0700
Date: Wed, 18 Sep 2024 07:08:54 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
Cc: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "Patelczyk, Maciej" <maciej.patelczyk@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>
Subject: Re: [PATCH i-g-t v6 16/17] tests/xe_eudebug_online: Debug client
 which runs workloads on EU
Message-ID: <20240918050854.7f4gs3vjt74nxr3f@zkempczy-mobl2>
References: <20240905092812.94553-1-christoph.manszewski@intel.com>
 <20240905092812.94553-17-christoph.manszewski@intel.com>
 <20240913113902.pdjcijg3ra6ej7ec@zkempczy-mobl2>
 <dc2e936b96901d45b31b15f77e4e9e69f6483543.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc2e936b96901d45b31b15f77e4e9e69f6483543.camel@intel.com>
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

On Tue, Sep 17, 2024 at 09:34:20PM +0200, Grzegorzek, Dominik wrote:

<cut>

> > > +static int count_set_bits(void *ptr, size_t size)
> > > +{
> > > +	uint8_t *p = ptr;
> > > +	int count = 0;
> > > +	int i, j;
> > > +
> > 
> > hweight()?
> > 
> Are you proposing here to change the name or to implement it without second loop like below?

Yes, I just want to get rid of second loop.

> 
> static int count_set_bits(void *ptr, size_t size)
> {
> 	uint32_t *p = ptr;
> 	int count = 0;
> 	int i;
> 
> 	igt_assert(size % 4 == 0);
> 
> 	for (i = 0; i < size/4; i++)
> 		count += igt_hweight(p[i]);
> 
> 	return count;
> }

You may iterate over uint8_t to cover all sizes, not only % 4.
But if you're sure buffer will always be multiple of 4, this
imo is ok.

<cut>

> > > +static void copy_first_bit(uint8_t *dst, uint8_t *src, int size)
> > > +{
> > > +	bool found = false;
> > > +	int i, j;
> > > +
> > > +	for (i = 0; i < size; i++) {
> > > +		if (found) {
> > > +			dst[i] = 0;
> > 
> > Function is static, but according to line above I would add some
> > comment that it is cleaning dst buffer. copy_first_bit() is misleading
> > as you mean first bit set. First bit is src[0] & 1.
> > 
> > And what 'first' means? Having lets say src = { 0x0, 0xff, 0xcc, 0xaa }
> > I would expect first should be most significant bit of 0xff.
> > 
> > 
> > > +		} else {
> > > +			uint32_t tmp = src[i]; /* in case dst == src */
> > > +
> > > +			for (j = 0; j < 8; j++) {
> > 
> > ffs()? But according to copy copy_nth_bit() I've doubts shouldn't this
> > be fls()?
> > 
> > > +				dst[i] = tmp & (1 << j);
> > > +				if (dst[i]) {
> > > +					found = true;
> > > +					break;
> > > +				}
> > > +			}
> > > +		}
> > > +	}
> > > +}
> > > +
> > > +static void copy_nth_bit(uint8_t *dst, uint8_t *src, int size, int n)
> > > +{
> > > +	int count = 0;
> > > +
> > > +	for (int i = 0; i < size; i++) {
> > > +		uint32_t tmp = src[i];
> > > +
> > > +		for (int j = 7; j >= 0; j--) {
> > 
> > I'm confused. In above function you iterate starting from least
> > significant bit, here you start from most significant bit.
> > Same concern about function name - shouldn't this be copy_nth_bit_set()?
> > 
> > > +			if (tmp & (1 << j)) {
> > > +				count++;
> > > +				if (count == n)
> > > +					dst[i] |= (1 << j);
> > > +				else
> > > +					dst[i] &= ~(1 << j);
> > 
> > Do I understand correctly that you are clearing other bits in dst?
> > It's extremely weird calling function copy_nth_bit() where it scans
> > for n-th bit set, zeroing other bits in dst. Or I just don't understand
> > logic behind this decision.
> 
> You've raised bunch of valid inaccuracies. How about:
> 
> static void only_nth_set_bit(uint8_t *dst, uint8_t *src, int size, int n)
> {
> 	int count = 0;
> 
> 	for (int i = 0; i < size; i++) {
> 		if (count < n) {
> 			uint8_t tmp = src[i];
> 
> 			for (int j = 0; j < 8; j++) {
> 				if (tmp & (1 << j)) {
> 					count++;
> 					if (count == n)
> 						dst[i] |= (1 << j);
> 					else
> 						dst[i] &= ~(1 << j);
> 				} else {
> 					dst[i] &= ~(1 << j);
> 				}
> 			}
> 		} else {
> 			dst[i] = 0;
> 		}
> 	}
> }

Likely I would copy octet by octet from src[i] -> dst[i], tracking
previous/current hweight and when it is bigger than n zeroing rest of bits in
current octet. But this is implementation detail.

In above code you're copying from least significant bit, is this intended?
Previous code was copying from most significant bit so this is
definitely semantic change which according to hw behavior may be
incorrect. May you double check this?

> 
> static void only_first_set_bit(uint8_t *dst, uint8_t *src, int size)
> {
> 	return only_nth_set_bit(dst, src, size, 1);
> }

Nice, code reuse is always good.

I'll drop rest of email to reply in another email. This will narrow
our conversation to interesting part only.

--
Zbigniew
 
