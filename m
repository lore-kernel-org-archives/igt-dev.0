Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79AAC6E0BE
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2020 04:20:55 +0000 (UTC)
Date: Wed, 18 Nov 2020 09:51:45 +0530
From: Kunal Joshi <kunal@intel.com>
Message-ID: <20201118042145.GA49735@intel.com>
References: <20201012094017.18019-1-karthik.b.s@intel.com>
 <2c25c93b7a4048e9a82eee9fccd88c9b@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2c25c93b7a4048e9a82eee9fccd88c9b@intel.com>
Subject: Re: [igt-dev] FW: [PATCH i-g-t] tests/kms_async_flips: Modify
 assert to fix failure seen on few platforms
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
To: "B S, Karthik" <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org
Cc: , Zanoni@intel.com, SowmyaX <sowmyax.kaparthi@intel.com>, Kaparthi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

> Failure is seen on CI on few platforms as one of the flips in between is
> taking longer time. To fix this, added a check to assert for individual
> flips only for the alternate-sync-async-flip subtest. In the
> async-flip-with-page-flip-events subtest we anyway check the overall FPS
> at the end, so we do not need a check for individual flips and this should
> take care of some random flip taking more time in between.
> 
> Also, reduced the MIN_FLIPS_PER_FRAME from 8 to 5 based on the failure
> seen in CI.
> 
> Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/2521
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/kms_async_flips.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
