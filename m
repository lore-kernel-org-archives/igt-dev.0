Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86AC10E52B
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Feb 2022 13:01:13 +0000 (UTC)
Date: Mon, 14 Feb 2022 14:01:09 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <YgpSlb8DezO3da5S@zkempczy-mobl2>
References: <20220214123338.39884-1-zbigniew.kempczynski@intel.com>
 <YgpQRPTsGYqV+NQc@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YgpQRPTsGYqV+NQc@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] DG2 enable (locally)
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Feb 14, 2022 at 02:51:16PM +0200, Petri Latvala wrote:
> On Mon, Feb 14, 2022 at 01:33:36PM +0100, Zbigniew Kempczyński wrote:
> > Unblock code which requires DG2 pciids and definitions.
> > 
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > 
> > Zbigniew Kempczyński (2):
> >   lib/intel_device_info: Introduce i915_pciids_local.h and add DG2
> >     definition
> >   lib/intel_chipset: Add flatccs flag for DG2
> > 
> >  lib/i915_pciids_local.h | 20 ++++++++++++++++++++
> >  lib/intel_chipset.h     |  5 +++++
> >  lib/intel_device_info.c | 10 ++++++++++
> >  3 files changed, 35 insertions(+)
> >  create mode 100644 lib/i915_pciids_local.h
> > 
> > -- 
> > 2.32.0
> > 
> 
> 
> For the series:
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>

Thank you for the review. I'll wait for the results and then'll merge.

--
Zbigniew
