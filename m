Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D7010E281
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Sep 2022 08:47:07 +0000 (UTC)
Date: Mon, 26 Sep 2022 11:46:35 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Message-ID: <YzFmx9NQKF/UM5FB@platvala-desk.ger.corp.intel.com>
References: <20220909104635.2041605-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909104635.2041605-1-kunal1.joshi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_chamelium: Fix common
 suspend/hibernate
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

On Fri, Sep 09, 2022 at 04:16:35PM +0530, Kunal Joshi wrote:
> Currently test executes and fails even if no ports are connected to
> chamelium, Added a igt_fixture to prevent that from happening.
> 
> v2 : try_suspend_resume_hpd already loops through every port (Petri)
> 
> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  tests/chamelium/kms_chamelium.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/chamelium/kms_chamelium.c b/tests/chamelium/kms_chamelium.c
> index d97b439a..1be1c41a 100644
> --- a/tests/chamelium/kms_chamelium.c
> +++ b/tests/chamelium/kms_chamelium.c
> @@ -2945,6 +2945,11 @@ igt_main
>  
>  	igt_describe("Tests that operate on all connectors");
>  	igt_subtest_group {
> +
> +		igt_fixture {
> +			igt_require(data.port_count);
> +		}
> +
>  		igt_describe(test_suspend_resume_hpd_common_desc);
>  		igt_subtest("common-hpd-after-suspend")
>  			test_suspend_resume_hpd_common(&data,
> -- 
> 2.25.1
> 
