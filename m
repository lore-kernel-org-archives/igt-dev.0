Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F381F10EA2B
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Aug 2022 18:22:35 +0000 (UTC)
Message-ID: <4db84895-d784-53ae-fa17-f01220688954@quicinc.com>
Date: Fri, 26 Aug 2022 11:21:15 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>
References: <20220826034916.30364-1-nidhi1.gupta@intel.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20220826034916.30364-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_atomic_interruptible: Test
 Cleanup
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

Hi Nidhi,

On 8/25/2022 8:49 PM, Nidhi Gupta wrote:
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_atomic_interruptible.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
> index 038cb286..7bcb2d32 100644
> --- a/tests/kms_atomic_interruptible.c
> +++ b/tests/kms_atomic_interruptible.c
> @@ -286,6 +286,8 @@ igt_main
>   	igt_describe("Tests the interrupt properties of legacy modeset");
>   	igt_subtest_with_dynamic("legacy-setmode") {
>   		for_each_pipe_with_valid_output(&display, pipe, output) {
> +			igt_display_require(&display, drm_fd);

I believe `drm_fd` is a member of the display struct and not a local 
variable.

Also, any reason to add extra calls to igt_display_require? There is 
already a call to igt_display_require() here [1]. I also don't think it 
would be necessary to reinitialize all the display resource structs for 
each subtest.

[1] 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_atomic_interruptible.c#L280

> +			igt_display_commit(&display);

Similarly, there is already a commit at the beginning of 
run_plane_test() [2], so is this call necessary?

[2] 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_atomic_interruptible.c#L90

Thanks,

Jessica Zhang

>   			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
>   				run_plane_test(&display, pipe, output, test_legacy_modeset, DRM_PLANE_TYPE_PRIMARY);
>   			break;
> @@ -295,6 +297,8 @@ igt_main
>   	igt_describe("Tests the interrupt properties of atomic modeset");
>   	igt_subtest_with_dynamic("atomic-setmode") {
>   		for_each_pipe_with_valid_output(&display, pipe, output) {
> +			igt_display_require(&display, drm_fd);
> +			igt_display_commit(&display);
>   			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
>   				run_plane_test(&display, pipe, output, test_atomic_modeset, DRM_PLANE_TYPE_PRIMARY);
>   			break;
> @@ -304,6 +308,8 @@ igt_main
>   	igt_describe("Tests the interrupt properties for DPMS");
>   	igt_subtest_with_dynamic("legacy-dpms") {
>   		for_each_pipe_with_valid_output(&display, pipe, output) {
> +			igt_display_require(&display, drm_fd);
> +			igt_display_commit(&display);
>   			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
>   				run_plane_test(&display, pipe, output, test_legacy_dpms, DRM_PLANE_TYPE_PRIMARY);
>   			break;
> @@ -313,6 +319,8 @@ igt_main
>   	igt_describe("Tests the interrupt properties for pageflip");
>   	igt_subtest_with_dynamic("legacy-pageflip") {
>   		for_each_pipe_with_valid_output(&display, pipe, output) {
> +			igt_display_require(&display, drm_fd);
> +			igt_display_commit(&display);
>   			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
>   				run_plane_test(&display, pipe, output, test_pageflip, DRM_PLANE_TYPE_PRIMARY);
>   			break;
> @@ -322,6 +330,8 @@ igt_main
>   	igt_describe("Tests the interrupt properties for cursor");
>   	igt_subtest_with_dynamic("legacy-cursor") {
>   		for_each_pipe_with_valid_output(&display, pipe, output) {
> +			igt_display_require(&display, drm_fd);
> +			igt_display_commit(&display);
>   			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
>   				run_plane_test(&display, pipe, output, test_setcursor, DRM_PLANE_TYPE_CURSOR);
>   			break;
> @@ -331,6 +341,8 @@ igt_main
>   	igt_describe("Tests the interrupt properties for primary plane");
>   	igt_subtest_with_dynamic("universal-setplane-primary") {
>   		for_each_pipe_with_valid_output(&display, pipe, output) {
> +			igt_display_require(&display, drm_fd);
> +			igt_display_commit(&display);
>   			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
>   				run_plane_test(&display, pipe, output, test_setplane, DRM_PLANE_TYPE_PRIMARY);
>   			break;
> @@ -340,6 +352,8 @@ igt_main
>   	igt_describe("Tests the interrupt properties for cursor plane");
>   	igt_subtest_with_dynamic("universal-setplane-cursor") {
>   		for_each_pipe_with_valid_output(&display, pipe, output) {
> +			igt_display_require(&display, drm_fd);
> +			igt_display_commit(&display);
>   			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
>   				run_plane_test(&display, pipe, output, test_setplane, DRM_PLANE_TYPE_CURSOR);
>   			break;
> -- 
> 2.36.0
> 
