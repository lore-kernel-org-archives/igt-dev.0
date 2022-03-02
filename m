Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7BD10E9F6
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Mar 2022 08:15:39 +0000 (UTC)
Date: Wed, 2 Mar 2022 09:15:35 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <Yh8npwk1NWFmZL+H@zkempczy-mobl2>
References: <20220228130328.46176-1-zbigniew.kempczynski@intel.com>
 <20220228130328.46176-2-zbigniew.kempczynski@intel.com>
 <Yh0/o82UPh7Z3cI0@kamilkon-DESK1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yh0/o82UPh7Z3cI0@kamilkon-DESK1>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/intel_memory_regions: Add
 helper which creates supported dma-buf set
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Feb 28, 2022 at 10:33:23PM +0100, Kamil Konieczny wrote:

<cut> 

> > +struct igt_collection *
> > +get_dma_buf_mmap_supported_set(int i915, struct igt_collection *set)
> --------- ^
> There are very few functions dma_buf and a lot of dmabuf, can
> you change name to _dmabuf_ ?

Both names fine for me. But if you insist I will do this in v4.
v3 was sent without this name.

--
Zbigniew
