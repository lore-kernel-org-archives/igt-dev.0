Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACFD10E44E
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Nov 2022 08:49:53 +0000 (UTC)
Date: Wed, 2 Nov 2022 10:49:51 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Message-ID: <Y2IvL/GdWncO91k/@platvala-desk.ger.corp.intel.com>
References: <20221102043814.3821683-1-riana.tauro@intel.com>
 <20221102043814.3821683-3-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102043814.3821683-3-riana.tauro@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] tests/intel-ci/fast-feedback:
 Add basic-hwmon test to BAT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Nov 02, 2022 at 10:08:14AM +0530, Riana Tauro wrote:
> Add basic-hwmon test to fast-feedback list. This test verifies the
> hwmon directory for dgfx and prints all its entries.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

Acked-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  tests/intel-ci/fast-feedback.testlist | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index bd5538a0..f57f8ff3 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -4,6 +4,7 @@ igt@i915_module_load@load
>  # Keep alphabetically sorted by default
>  igt@core_auth@basic-auth
>  igt@debugfs_test@read_all_entries
> +igt@debugfs_test@basic-hwmon
>  igt@fbdev@eof
>  igt@fbdev@info
>  igt@fbdev@nullptr
> -- 
> 2.25.1
> 
