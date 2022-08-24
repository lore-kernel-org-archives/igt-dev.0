Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D079B0EC
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Aug 2022 09:59:59 +0000 (UTC)
Date: Wed, 24 Aug 2022 12:58:58 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YwX2Yt2T+LybDRmB@platvala-desk.ger.corp.intel.com>
References: <20220824043451.21272-1-zbigniew.kempczynski@intel.com>
 <166133372609.9870.6111621960690803640@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166133372609.9870.6111621960690803640@emeril.freedesktop.org>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Aug 24, 2022 at 09:35:26AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_device_scan: Retry when parent pci device lacks properties (rev2)
> URL   : https://patchwork.freedesktop.org/series/107646/
> State : failure
> 
> == Summary ==
> 
> IGT patchset build failed on latest successful build
> e01fe99f00692864b709253638c809231d1fb333 i915/guc: Disable i915_pm_rps when SLPC is enabled
> 
> 

Sorry for this, libdrm building changed and everything failed to build
after that. I'll keep poking this and other affected series through
the pipeline.


-- 
Petri Latvala
