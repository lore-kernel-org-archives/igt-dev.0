Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDEE10EFA0
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jun 2022 13:33:33 +0000 (UTC)
Date: Fri, 10 Jun 2022 16:31:30 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Ryszard Knop <ryszard.knop@intel.com>
Message-ID: <YqNHsjDBMjtAXgtZ@platvala-desk.ger.corp.intel.com>
References: <20220525152719.1022426-1-ryszard.knop@intel.com>
 <20220525152719.1022426-4-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525152719.1022426-4-ryszard.knop@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] tests/intel-ci/fast-feedback:
 add i915_module_load@load
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, May 25, 2022 at 05:27:19PM +0200, Ryszard Knop wrote:
> This should be the first test that runs in most CI test lists, as it
> makes sure i915 is available, and if not, logs why it can't be loaded.
> 
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>

Acked-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  tests/intel-ci/fast-feedback.testlist | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index b579c20a..c4a7c124 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -1,5 +1,7 @@
> -# Keep alphabetically sorted by default
> +# Try to load the driver if it's not available yet.
> +igt@i915_module_load@load
>  
> +# Keep alphabetically sorted by default
>  igt@core_auth@basic-auth
>  igt@debugfs_test@read_all_entries
>  igt@fbdev@eof
> -- 
> 2.36.1
> 
