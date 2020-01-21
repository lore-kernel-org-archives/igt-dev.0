Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B496EC2B
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2020 10:04:00 +0000 (UTC)
Date: Tue, 21 Jan 2020 11:03:57 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20200121100357.GA17840@zkempczy-desk.igk.intel.com>
References: <20200120180513.11561-1-zbigniew.kempczynski@intel.com>
 <20200121094448.GA25209@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200121094448.GA25209@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3] lib/igt_collection: Adding
 combinatorics facility
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jan 21, 2020 at 11:44:48AM +0200, Petri Latvala wrote:

<cut>

I'll check formatting and send in v4.
 
> > + */
> > +
> > +#if defined(__GNUC__)
> > +#define NUM_BITS(v) __builtin_popcount(v)
> > +#else
> > +/* Taken from Hacker's Delight, for non-gcc compiler */
> 
> Hmm, what's the license for these bits?
>

I've no idea. It is just O(1) pattern known for years collected
in the book mentioned above. I guess I could put it here without
any annotation.

--
Zbigniew. 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
