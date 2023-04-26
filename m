Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59ED610E105
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Apr 2023 20:08:12 +0000 (UTC)
Date: Wed, 26 Apr 2023 22:08:07 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Message-ID: <20230426200807.nh26kb72exhykmbb@zkempczy-mobl2>
References: <20230425154017.374465-1-zbigniew.kempczynski@intel.com>
 <20230425154017.374465-7-zbigniew.kempczynski@intel.com>
 <41400bc9-844d-bade-3eab-03d7285bf343@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41400bc9-844d-bade-3eab-03d7285bf343@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v6 06/15] lib/intel_bufops: Add Xe
 support in bufops
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

On Wed, Apr 26, 2023 at 02:18:01PM +0200, Manszewski, Christoph wrote:
> > +/**
> > + * buf_ops_get_driver
> > + * @bops: pointer to buf_ops
> > + *
> > + * Returns: intel driver enum value
> > + */
> > +enum intel_driver buf_ops_get_driver(struct buf_ops *bops)
> > +{
> 
> Maybe 'igt_assert(bops)' here? At least that's what buf_ops_get_fd does, and
> it adds some layer of protection over just wrapping 'bops->driver'.

Agree, this is public function and checking bops != null makes sense.

--
Zbigniew

> 
> Anyway:
> Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>
> 
