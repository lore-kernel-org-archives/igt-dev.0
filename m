Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990718940F
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2020 11:54:23 +0000 (UTC)
Date: Fri, 23 Oct 2020 14:54:15 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201023115415.GT7444@platvala-desk.ger.corp.intel.com>
References: <20201023100709.5211-1-karthik.b.s@intel.com>
 <20201023100709.5211-3-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201023100709.5211-3-karthik.b.s@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] CI HAX: Add MST tests to fast
 feedback testlist
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Oct 23, 2020 at 03:37:09PM +0530, Karthik B S wrote:
> Add the MST subtests to the fast feedback test list as
> shards TGL does not have HDCP panels.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/intel-ci/fast-feedback.testlist | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index 83722f83..fbb4275d 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -155,6 +155,12 @@ igt@vgem_basic@mmap
>  igt@vgem_basic@second-client
>  igt@vgem_basic@sysfs
>  
> +# HAX: Temporary addition to the fast-feedback list as shards doesnt have MST setup.
> +igt@kms_content_protectoin@dp-mst-type-0
> +igt@kms_content_protectoin@dp-mst-lic-type-0
> +igt@kms_content_protectoin@dp-mst-type-1
> +igt@kms_content_protectoin@dp-mst-lic-type-1


Typo, protectoin
            ^^^^


Do we have MST setups in BAT farm?


-- 
Petri Latvala



> +
>  # All tests that do module unloading and reloading are executed last.
>  # They will sometimes reveal issues of earlier tests leaving the
>  # driver in a broken state that is not otherwise noticed in that test.
> -- 
> 2.22.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
