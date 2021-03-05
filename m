Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFDB6E1A2
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Mar 2021 11:09:08 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20210305064421.23388-1-nidhi1.gupta@intel.com>
References: <20210305064421.23388-1-nidhi1.gupta@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 05 Mar 2021 11:09:05 +0000
Message-ID: <161494254503.15221.6286278624136957022@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2]
 tests/kms_rotation_crc@exhaust-fences: added check for HW detiler
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
To: Nidhi Gupta <nidhi1.gupta@intel.com>, igt-dev@lists.freedesktop.org
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Nidhi Gupta (2021-03-05 06:44:21)
> HW detiler not supported on platforms w/o aperture.
> Added feature test macro to query the kernel for the
> global gpu aperture size. Aperture size should be
> greater than zero to support HW detiler, if not skip
> the test.

Which is already a requirement for the test. So what are you actually
trying to achieve?

        igt_require(total_fbs_size < total_aperture_size * 0.9);

Maybe that it's mistakenly calling gem_available_aperture_size() and not
gem_mappable_aperture_size().
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
