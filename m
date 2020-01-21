Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60DE6EC18
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2020 09:31:49 +0000 (UTC)
Date: Tue, 21 Jan 2020 10:31:46 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20200121093146.GA17071@zkempczy-desk.igk.intel.com>
References: <20200120180513.11561-1-zbigniew.kempczynski@intel.com>
 <20200121091523.GX25209@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200121091523.GX25209@platvala-desk.ger.corp.intel.com>
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

On Tue, Jan 21, 2020 at 11:15:23AM +0200, Petri Latvala wrote:

<cut>

> > + * // macro for iteration over set data - for_each_collection_data()
> > + * for_each_subset(subset, subset_size, set)
> > + *       for_each_collection_data(data, subset)
> > + *             printf("v: %d, p: %p\n", data->value, data->ptr);
> > + */
> 
> Wonderfully documented. Did you check that this ends up in the docs though?
> 

Eh, I forgot add it to docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml

Apart of that do we need something to change in the code?

--
Zbigniew
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
