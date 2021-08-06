Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774D06EA9F
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 07:16:51 +0000 (UTC)
Date: Fri, 6 Aug 2021 09:16:45 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210806071645.GE3285@zkempczy-mobl2>
References: <20210726200026.4815-1-zbigniew.kempczynski@intel.com>
 <20210726200026.4815-18-zbigniew.kempczynski@intel.com>
 <87a6lvtvlk.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a6lvtvlk.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 17/52] tests/gem_eio: Adopt to use
 allocator
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Aug 05, 2021 at 02:44:39PM -0700, Dixit, Ashutosh wrote:
> On Mon, 26 Jul 2021 12:59:51 -0700, Zbigniew Kempczyński wrote:
> >
> > -static void reset_stress(int fd, const intel_ctx_t *ctx0,
> > +static void reset_stress(int fd, uint64_t ahnd, const intel_ctx_t *ctx0,
> 
> I think it would have been ok to allocate ahnd inside reset_stress() but
> looks like we wanted to keep it tied to ctx_create/destroy, so this is:

Yes, spin_sync() is running within ctx0 so I would keep ahnd for ctx0
for whole test (test_reset_stress() goes over rings within ctx0 so they
share vm). If we would recreate ahnd for ctx0 for each run we would 
just evict vmas from previous call.

--
Zbigniew

> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
