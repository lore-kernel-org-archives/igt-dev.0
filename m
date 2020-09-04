Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA946EB21
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Sep 2020 08:12:48 +0000 (UTC)
Date: Fri, 4 Sep 2020 10:53:06 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200904075305.GU7444@platvala-desk.ger.corp.intel.com>
References: <20200806132935.23293-1-karthik.b.s@intel.com>
 <594bbda7-65ca-91d9-5a63-96f95bf9ac83@daenzer.net>
 <20200807085414.GC7444@platvala-desk.ger.corp.intel.com>
 <a12cbfd5-1e13-2907-816d-f9f93976adc7@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a12cbfd5-1e13-2907-816d-f9f93976adc7@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4] tests/kms_async_flips: Add test to
 validate asynchronous flips
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
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, daniel.vetter@intel.com, Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
List-ID: <igt-dev@lists.freedesktop.org>

> On 8/7/2020 2:24 PM, Petri Latvala wrote:
> > DRIVER_INTEL and the use of i915's X_TILED are the intel-specifics
> > that I spot, anything else in there?

What I didn't spot is that kms_plane_multiple for example already uses
I915 X-tiled mod unconditionally and it seems to be fine for at least
AMDGPU... So it's DRIVER_INTEL only that needs changing for a generic
test.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
