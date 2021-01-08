Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83A189581
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Jan 2021 12:21:56 +0000 (UTC)
Date: Fri, 8 Jan 2021 14:21:52 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20210108122152.GR7444@platvala-desk.ger.corp.intel.com>
References: <20201208170109.23073-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201208170109.23073-1-pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/3] Add FB_DAMAGE_CLIPS prop and new
 test for Selective fetch
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
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Dec 08, 2020 at 10:31:06PM +0530, Pankaj Bharadiya wrote:
> Add new test for selective fetch
>  
> Pankaj Bharadiya (3):
>   lib/kms: Add fb damage clip plane property
>   lib/igt_psr: Add function to check PSR2 selective fetch
>   tests: Add new PSR2 selective fetch test
> 
>  lib/igt_kms.c          |   3 +
>  lib/igt_kms.h          |   1 +
>  lib/igt_psr.c          |  10 +
>  lib/igt_psr.h          |   1 +
>  tests/Makefile.sources |   1 +
>  tests/kms_psr2_sf.c    | 649 +++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build      |   1 +
>  7 files changed, 666 insertions(+)
>  create mode 100644 tests/kms_psr2_sf.c

Merged the series btw.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
