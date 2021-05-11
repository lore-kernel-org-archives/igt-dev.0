Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3D36E9E2
 for <igt-dev@lists.freedesktop.org>; Tue, 11 May 2021 10:07:08 +0000 (UTC)
References: <20210508162303.8235-1-bhanuprakash.modem@intel.com>
 <20210508162303.8235-5-bhanuprakash.modem@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <cb9a6ea2-48c0-2f3b-6fdc-4114a2a081a7@intel.com>
Date: Tue, 11 May 2021 15:37:03 +0530
MIME-Version: 1.0
In-Reply-To: <20210508162303.8235-5-bhanuprakash.modem@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [v5 i-g-t 04/14] tests/debugfs_test: Fix mode
 selection for MST
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 5/8/2021 9:52 PM, Bhanuprakash Modem wrote:
> When two monitors connected through MST, the second monitor also
> tries to use the same mode. So two such modes may not fit into the
> link bandwidth.
>
> This patch will find a combination of modes that fit into the BW.
>
> V2:
> * Add support for legacy commit (Ankit)
>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/debugfs_test.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/tests/debugfs_test.c b/tests/debugfs_test.c
> index 46ba0a8be..e50f213ae 100644
> --- a/tests/debugfs_test.c
> +++ b/tests/debugfs_test.c
> @@ -98,12 +98,14 @@ static void kms_tests(int fd, int debugfs)
>   	igt_display_t display;
>   	struct igt_fb fb[IGT_MAX_PIPES];
>   	enum pipe pipe;
> +	int ret;
>   
>   	igt_fixture
>   		igt_display_require(&display, fd);
>   
>   	igt_subtest("read_all_entries_display_on") {
>   		/* try to light all pipes */
> +retry:
>   		for_each_pipe(&display, pipe) {
>   			igt_output_t *output;
>   
> @@ -128,6 +130,25 @@ static void kms_tests(int fd, int debugfs)
>   			}
>   		}
>   
> +		if (display.is_atomic)
> +			ret = igt_display_try_commit_atomic(&display,
> +					DRM_MODE_ATOMIC_TEST_ONLY |
> +					DRM_MODE_ATOMIC_ALLOW_MODESET,
> +					NULL);
> +		else
> +			ret = igt_display_try_commit2(&display, COMMIT_LEGACY);
> +
> +		if (ret) {
> +			igt_output_t *output;
> +			bool found = igt_override_all_active_output_modes_to_fit_bw(&display);
> +			igt_require_f(found, "No valid mode combo found.\n");
> +
> +			for_each_connected_output(&display, output)
> +				igt_output_set_pipe(output, PIPE_NONE);
> +
> +			goto retry;
> +		}
> +
>   		igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);

I think this commit is not required. We will get here after only when 
try_commit is already a success, either in first try or after retry.

Also request to modify the subject and commit msg to remove MST specific 
use.

With that fixed:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


>   
>   		read_and_discard_sysfs_entries(debugfs, 0);
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
