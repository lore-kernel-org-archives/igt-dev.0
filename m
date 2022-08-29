Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9396710F0E2
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Aug 2022 07:35:11 +0000 (UTC)
Date: Mon, 29 Aug 2022 09:35:07 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YwxsK80D5oEeXbf5@zkempczy-mobl2>
References: <20220824043451.21272-1-zbigniew.kempczynski@intel.com>
 <166133372609.9870.6111621960690803640@emeril.freedesktop.org>
 <YwX2Yt2T+LybDRmB@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YwX2Yt2T+LybDRmB@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBsaWIv?=
 =?utf-8?q?igt=5Fdevice=5Fscan=3A__Retry_when_parent_pci_device_lacks_prop?=
 =?utf-8?q?erties_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org,
 Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Aug 24, 2022 at 12:58:58PM +0300, Petri Latvala wrote:
> On Wed, Aug 24, 2022 at 09:35:26AM +0000, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: lib/igt_device_scan: Retry when parent pci device lacks properties (rev2)
> > URL   : https://patchwork.freedesktop.org/series/107646/
> > State : failure
> > 
> > == Summary ==
> > 
> > IGT patchset build failed on latest successful build
> > e01fe99f00692864b709253638c809231d1fb333 i915/guc: Disable i915_pm_rps when SLPC is enabled
> > 
> > 
> 
> Sorry for this, libdrm building changed and everything failed to build
> after that. I'll keep poking this and other affected series through
> the pipeline.

Ok, not a problem at all. I'll resend if necessary.

CI.BAT and CI.IGT emails from patchwork didn't come. I'm pasting from
the page:

Possible regressions

    igt@gem_exec_parallel@contexts@rcs0:
        shard-iclb: PASS -> INCOMPLETE

    igt@kms_cursor_legacy@torture-bo@pipe-b:
        shard-snb: PASS -> INCOMPLETE

Above are not related to the change. 

May I ask for the review?

--
Zbigniew

> 
> 
> -- 
> Petri Latvala
