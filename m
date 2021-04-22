Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4776E095
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Apr 2021 11:38:33 +0000 (UTC)
Date: Thu, 22 Apr 2021 14:39:40 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YIFgfCgLIBVXctaw@platvala-desk.ger.corp.intel.com>
References: <20210105081352.82045-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210105081352.82045-1-kunal1.joshi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v6 0/3] Test tiled display with aid of
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jan 05, 2021 at 01:43:49PM +0530, Kunal Joshi wrote:
> As of now we have kms_dp_tiled_display test which needs a physical
> panel. Added changes to have chamelium act as a tiled panel and then
> execute the test.
> 
> Kunal Joshi (3):
>   Make basic chamelium function accessible to other tests
>   Added structures and functions to generate tiled edids
>   Added a subtest where chamelium acts as a tiled panel
> 
>  lib/igt_chamelium.c          | 198 ++++++++++++++++++
>  lib/igt_chamelium.h          |  33 +++
>  lib/igt_edid.c               |  27 +++
>  lib/igt_edid.h               |  20 ++
>  lib/igt_kms.c                | 202 +++++++++++++++++++
>  lib/igt_kms.h                |  25 ++-
>  tests/kms_chamelium.c        | 378 ++++++++++++-----------------------
>  tests/kms_dp_tiled_display.c | 119 ++++++++---
>  8 files changed, 729 insertions(+), 273 deletions(-)


Other than one comment on patch 1/3, this series is

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

The test results are too old to review what happened with BAT
though...
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
