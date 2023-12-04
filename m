Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89AA010E187
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 08:09:10 +0000 (UTC)
Date: Mon, 4 Dec 2023 09:09:05 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: janga.rahul.kumar@intel.com
Message-ID: <20231204080905.bnbg6lvjg7uzwaw2@zkempczy-mobl2>
References: <20231201113507.3535939-1-janga.rahul.kumar@intel.com>
 <20231201113507.3535939-4-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231201113507.3535939-4-janga.rahul.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests/xe_compute: Update
 documentation regarding test requirements
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Dec 01, 2023 at 05:05:07PM +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Test support for LNL is added. Update documentation to
> reflect those changes.
> 
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/intel/xe_compute.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> index 35ba8b346..1db72785b 100644
> --- a/tests/intel/xe_compute.c
> +++ b/tests/intel/xe_compute.c
> @@ -18,7 +18,7 @@
>  
>  /**
>   * SUBTEST: compute-square
> - * GPU requirement: TGL, PVC
> + * GPU requirement: TGL, PVC, LNL
>   * Description:
>   *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
>   *	for an input dataset..
> -- 
> 2.25.1
>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
