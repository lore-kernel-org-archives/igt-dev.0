Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695EF6EC44
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2020 15:40:07 +0000 (UTC)
Date: Fri, 17 Apr 2020 21:00:24 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <20200417153023.GN5533@intel.com>
References: <20200409053951.26929-1-anshuman.gupta@intel.com>
 <20200409053951.26929-5-anshuman.gupta@intel.com>
 <ce12e4fc-a782-6375-da94-25371c47ed0e@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce12e4fc-a782-6375-da94-25371c47ed0e@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5 4/5] tests/i915_pm_lpsp:
 screens-disabled subtest use igt_wait
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
To: "Manna, Animesh" <animesh.manna@intel.com>
Cc: igt-dev@lists.freedesktop.org, jani.nikula@intel.com, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-04-17 at 19:57:47 +0530, Manna, Animesh wrote:
> 
> On 09-04-2020 11:09, Anshuman Gupta wrote:
> >When all screens are disabled, it takes some time to release
> >eDP/DP AUX IO power domain ref count. Also, delayed audio codec
> >disabling takes time to release AUDIO power domain ref-count,
> >using igt_wait to check lpsp after disabling all screens.
> >
> >Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> >---
> >  tests/i915/i915_pm_lpsp.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> >diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
> >index 7be23e6c..e05d3791 100644
> >--- a/tests/i915/i915_pm_lpsp.c
> >+++ b/tests/i915/i915_pm_lpsp.c
> >@@ -79,7 +79,8 @@ static void screens_disabled_subtest(data_t *data)
> >  	}
> >  	igt_require_f(valid_output, "No connected output found\n");
> >-	igt_assert_f(lpsp_is_enabled(data), "lpsp is not enabled\n%s:\n%s\n",
> >+	igt_assert_f(igt_wait(lpsp_is_enabled(data), 1000, 100),
> 
> Better to add code-comment here how the above time is calculated. Is it based on observation or captured anywhere?
Thaks for review i will add a code comment here.
thanks,
Anshuman Gupta.
> 
> Regards,
> Animesh
> 
> >+		     "lpsp is not enabled\n%s:\n%s\n",
> >  		     PWR_DOMAIN_INFO, data->pwr_dmn_info =
> >  		     igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
> >  }
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
