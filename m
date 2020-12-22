Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18F589FE3
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Dec 2020 05:53:16 +0000 (UTC)
References: <20201217015000.2213437-1-arundhati.hagaragi@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <d463c7c5-1712-1916-b1f5-ca2124edba21@intel.com>
Date: Tue, 22 Dec 2020 11:23:11 +0530
MIME-Version: 1.0
In-Reply-To: <20201217015000.2213437-1-arundhati.hagaragi@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_plane: Added test
 description
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
To: Arundhati Hagaragi <arundhati.hagaragi@intel.com>, igt-dev@lists.freedesktop.org
Cc: nidhi1.gupta@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 12/17/2020 7:20 AM, Arundhati Hagaragi wrote:
> Added test description for test case
>
> Cc: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
>
> v2: modified subtests description to be more specific. (Karthik)
> ---
>   tests/kms_plane.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 3642d66f..d01e2404 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1051,29 +1051,37 @@ run_tests_for_pipe_plane(data_t *data, enum pipe pipe)
>   	}
>   
>   	data->crop = 0;
> +	igt_describe("verifying position of two planes fully covering each other");

Hi,

The planes do not fully cover each other. The 2 planes together fully 
cover the screen.
IMHO, it should be more like, "Verify plane position by using 2 planes 
to create a fully covered screen."

>   	igt_subtest_f("plane-position-covered-pipe-%s-planes",
>   		      kmstest_pipe_name(pipe))
>   		test_plane_position(data, pipe, 0);
>   
> +	igt_describe("verifying position of two planes partially covering each other");
"Verify plane position using 2 planes to create a partially covered screen."
>   	igt_subtest_f("plane-position-hole-pipe-%s-planes",
>   		      kmstest_pipe_name(pipe))
>   		test_plane_position(data, pipe,
>   				    TEST_POSITION_PARTIALLY_COVERED);
>   
> +	igt_describe("verifying position of two planes partially covering each other and"
> +		"check for DPMS");
Similar to above.
>   	igt_subtest_f("plane-position-hole-dpms-pipe-%s-planes",
>   		      kmstest_pipe_name(pipe))
>   		test_plane_position(data, pipe,
>   				    TEST_POSITION_PARTIALLY_COVERED |
>   				    TEST_DPMS);
>   
> +	igt_describe("verifying panning at top left position for two planes");

I don't think this uses 2 planes. Looks like a redundancy in the test 
actually. Please change the description accordingly.

I've sent a patch for fixing the redundancy.
>   	igt_subtest_f("plane-panning-top-left-pipe-%s-planes",
>   		      kmstest_pipe_name(pipe))
>   		test_plane_panning(data, pipe, TEST_PANNING_TOP_LEFT);
>   
> +	igt_describe("verifying panning at bottom right position for two planes");
Same as above.
>   	igt_subtest_f("plane-panning-bottom-right-pipe-%s-planes",
>   		      kmstest_pipe_name(pipe))
>   		test_plane_panning(data, pipe, TEST_PANNING_BOTTOM_RIGHT);
>   
> +	igt_describe("verifying panning at bottom right position for two planes and "
> +		"executes system suspend cycles");

Same as above.

I think we're missing a few subtests here.
Please add description for them also in this patch only,
so that we can get it done in one go.

Thanks,
Karthik.B.S

>   	igt_subtest_f("plane-panning-bottom-right-suspend-pipe-%s-planes",
>   		      kmstest_pipe_name(pipe))
>   		test_plane_panning(data, pipe, TEST_PANNING_BOTTOM_RIGHT |


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
