Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A8610E231
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 08:26:09 +0000 (UTC)
Message-ID: <2c2f7621-cc58-6403-c8b8-acd0f5ca6b02@intel.com>
Date: Thu, 22 Sep 2022 13:55:49 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220906140601.23551-1-nidhi1.gupta@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220906140601.23551-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/kms_busy: Test cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue-06-09-2022 07:36 pm, Nidhi Gupta wrote:
> Sanitize the system state before starting the subtest.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/i915/kms_busy.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/tests/i915/kms_busy.c b/tests/i915/kms_busy.c
> index 99a07c2a..6bb9dbec 100644
> --- a/tests/i915/kms_busy.c
> +++ b/tests/i915/kms_busy.c
> @@ -144,6 +144,8 @@ static void test_flip(igt_display_t *dpy, int pipe, bool modeset)
>   	igt_output_t *output;
>   	int timeout;
>   
> +	igt_display_reset(dpy);
> +
>   	if (modeset)
>   		igt_require(dpy->is_atomic);

Please avoid using igt_require*() & igt_skip*() inside the dynamic
subtest, instead don't run the subtest.

- Bhanu

>   
> @@ -230,6 +232,7 @@ static void test_hang(igt_display_t *dpy,
>   	igt_output_t *output;
>   	igt_plane_t *primary;
>   
> +	igt_display_reset(dpy);
>   	output = set_fb_on_crtc(dpy, pipe, &fb[0]);
>   	igt_display_commit2(dpy, COMMIT_ATOMIC);
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> @@ -274,6 +277,8 @@ static void test_pageflip_modeset_hang(igt_display_t *dpy, enum pipe pipe)
>   	igt_spin_t *t;
>   	uint64_t ahnd = get_reloc_ahnd(dpy->drm_fd, 0);
>   
> +	igt_display_reset(dpy);
> +	
>   	output = set_fb_on_crtc(dpy, pipe, &fb);
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   
