Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B786C10E066
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jun 2023 21:35:12 +0000 (UTC)
Date: Wed, 7 Jun 2023 14:35:01 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZID4BZptc7FxNNL9@orsosgc001.jf.intel.com>
References: <20230606012150.2119065-1-ashutosh.dixit@intel.com>
 <20230606012150.2119065-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230606012150.2119065-4-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] tests/gem_ctx_freq: Disable SLPC
 efficient freq for the test
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

On Mon, Jun 05, 2023 at 06:21:49PM -0700, Ashutosh Dixit wrote:
>When SLPC efficient freq is enabled, GPU frequencies can be outside the
>min/max range set from sysfs. Any test which compares actual GPU frequency
>against set frequencies is therefore meaninful only when SLPC efficient

typo: meaningful

>freq is disabled.
>
>Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6786
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> tests/i915/gem_ctx_freq.c | 15 ++++++++++++++-
> 1 file changed, 14 insertions(+), 1 deletion(-)
>
>diff --git a/tests/i915/gem_ctx_freq.c b/tests/i915/gem_ctx_freq.c
>index b2f6c2af55e1..6dfcf4187d4b 100644
>--- a/tests/i915/gem_ctx_freq.c
>+++ b/tests/i915/gem_ctx_freq.c
>@@ -131,6 +131,15 @@ static bool get_sysfs_freq(int dirfd, uint32_t *min, uint32_t *max)
> 		igt_sysfs_rps_scanf(dirfd, RPS_MAX_FREQ_MHZ, "%u", max) == 1);
> }
>
>+static void slpc_ignore_efficient_freq(int dirfd, bool val)
>+{
>+	if (!(gem_using_guc_submission(i915) && i915_is_slpc_enabled(i915)))
>+		return;

I think i915_is_slpc_enabled(i915) should be enough here, since 
intel_guc_debugfs_register() in kmd does not create "guc_slpc_info" if 
guc is not enabled.

Regards,
Umesh
