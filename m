Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB3A10E34B
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 05:41:53 +0000 (UTC)
Date: Tue, 26 Sep 2023 07:41:48 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230926054148.7sgjsth6qz2yhfry@zkempczy-mobl2>
References: <20230920161913.54521-1-kamil.konieczny@linux.intel.com>
 <20230920161913.54521-3-kamil.konieczny@linux.intel.com>
 <20230925202941.altye3ysqnysmz63@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230925202941.altye3ysqnysmz63@zkempczy-mobl2>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] lib/drmtest: add multigpu helpers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 10:30:17PM +0200, Zbigniew Kempczyński wrote:

<cut>

> > +	if (_multigpu_count < 2) {
> > +		igt_debug("Multigpu prepare failed, no multi-gpu board or no --device nor IGT_DEVICE used\n");
> 
> I think 'no multi-gpu board _AND_ no --device...' should be used here.
> I've tried to run ./xe_create without passing IGT_DEVICE and I've failed.
> I think as you're require chipset you should handle legacy (iterating)
> device opening (one by one which matches chipset).

I was thinking about above and from the logic point of view is correct
(I mean _OR_). But I would rephrase it to sth like: "Multigpu prepare
failed. Ensure IGT_DEVICE is passed and board is multi-gpu".

--
Zbigniew
