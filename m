Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CFF10E01F
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Mar 2022 17:24:52 +0000 (UTC)
Date: Thu, 24 Mar 2022 13:24:49 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Message-ID: <YjypYbg8RYZH+9VN@intel.com>
References: <20220324101852.73089-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324101852.73089-1-riana.tauro@intel.com>
Subject: Re: [igt-dev] [RFC PATCH i-g-t 0/4] Basic Suspend/Resume with i915
 unload
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

On Thu, Mar 24, 2022 at 03:48:48PM +0530, Riana Tauro wrote:
> From: "Tauro, Riana" <riana.tauro@intel.com>
> 
> Exercise suspend/resume cycles without i915 module to know the system wide health 
> of suspend/resume feature before executing i915 suspend/resume tests.

The idea of having a system-wide suspend test is good so if we are failing
the i915 suspend tests but also failing the system suspend without i915 we
can prove that i915 is not the culprit.

But it should be totally independent. Having this before all the tests
looks like a big cheat where you reset all the states before a test.
Besides increasing the test time a lot.

> 
> Tauro, Riana (4):
>   lib/igt_aux: Suspend/resume without i915 module

plus I don't believe this should be a library, but maybe because I believe
this should be a single independent test.

>   lib/drmtest : add function to  call exit handler to unload i915 module
>   tests/i915/i915_suspend: Add suspend/resume cycle without i915 module
>   i915/i915_pm_rpm: Add suspend/resume cycle without i915 module
> 
>  lib/drmtest.c             | 17 +++++++++++++++++
>  lib/drmtest.h             |  1 +
>  lib/igt_aux.c             | 23 +++++++++++++++++++++++
>  lib/igt_aux.h             |  3 +++
>  tests/i915/i915_pm_rpm.c  | 12 ++++++++++++
>  tests/i915/i915_suspend.c | 39 +++++++++++++++++++++++++++++++++------
>  6 files changed, 89 insertions(+), 6 deletions(-)
> 
> -- 
> 2.25.1
> 
