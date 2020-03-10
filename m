Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D7189CAC
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2020 19:42:06 +0000 (UTC)
Date: Tue, 10 Mar 2020 12:43:24 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
Message-ID: <20200310194324.GB953@intel.com>
References: <1579494027-2018-1-git-send-email-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579494027-2018-1-git-send-email-kunal1.joshi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/3] Test tiled display with aid of
 chamelium.
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
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

So one qq, on the Chamelium board we do expect the first subtest of basic test pattern
will be skipped right?

In general, Series 

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Could you Ankit or Karthik also add a tested by tag?

Manasi

On Mon, Jan 20, 2020 at 09:50:24AM +0530, Kunal Joshi wrote:
> As of now we have kms_dp_tiled_display test which needs a physical
> panel.Added changes to have chamelium act as a tiled panel and then
> execute the test.
> 
> Kunal Joshi (3):
>   Make basic chamelium function accessible to other tests.
>   Added structures and functions to generate tiled edids.
>   Added a subtest where chamelium acts as a tiled panel.
> 
>  lib/igt_chamelium.c          | 152 +++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_chamelium.h          |  33 ++++++++++
>  lib/igt_edid.c               |  27 ++++++++
>  lib/igt_edid.h               |  20 ++++++
>  lib/igt_kms.c                | 102 +++++++++++++++++++++++++++++
>  lib/igt_kms.h                |   2 +
>  tests/kms_chamelium.c        |  81 +----------------------
>  tests/kms_dp_tiled_display.c | 111 ++++++++++++++++++++++++-------
>  8 files changed, 424 insertions(+), 104 deletions(-)
> 
> -- 
> 2.7.4
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
