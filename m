Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B38F10E3A7
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Sep 2022 13:04:34 +0000 (UTC)
Date: Mon, 12 Sep 2022 16:04:25 +0300
From: Imre Deak <imre.deak@intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Message-ID: <Yx8uWTr9PNP/M08v@ideak-desk.fi.intel.com>
References: <20220909114911.1852-1-swati2.sharma@intel.com>
 <20220909114911.1852-2-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909114911.1852-2-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/5] tests/i915/i915_pm_dc: Add test
 description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Sep 09, 2022 at 05:19:07PM +0530, Swati Sharma wrote:
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Commit message is missing, something to explain why moving the
description is required. With that:

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  tests/i915/i915_pm_dc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
> index f664a2a2c..40811ae52 100644
> --- a/tests/i915/i915_pm_dc.c
> +++ b/tests/i915/i915_pm_dc.c
> @@ -44,6 +44,8 @@
>  #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
>  #define KMS_POLL_DISABLE 0
>  
> +IGT_TEST_DESCRIPTION("Tests to validate display power DC states.");
> +
>  bool kms_poll_saved_state;
>  
>  typedef struct {
> @@ -473,7 +475,6 @@ static void kms_poll_state_restore(int sig)
>  	}
>  }
>  
> -IGT_TEST_DESCRIPTION("These tests validate Display Power DC states");
>  int main(int argc, char *argv[])
>  {
>  	data_t data = {};
> -- 
> 2.25.1
> 
