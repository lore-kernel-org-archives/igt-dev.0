Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298A16E11E
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Nov 2021 14:49:01 +0000 (UTC)
Date: Mon, 8 Nov 2021 16:47:47 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YYk4k+EDP8lo+IE7@platvala-desk.ger.corp.intel.com>
References: <20211013171051.26287-1-jeevan.b@intel.com>
 <20211013171051.26287-3-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013171051.26287-3-jeevan.b@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/3] tests/kms_psr2_sf: Make this a
 generic test and change testcase design
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org, daniel@ffwll.ch
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Oct 13, 2021 at 10:40:50PM +0530, Jeevan B wrote:
> Make this a generic kms test and change testcase design so that it avoids
> new subtest for each block position
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/i915/kms_psr2_sf.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
> index 93347327..c83120c4 100644
> --- a/tests/i915/kms_psr2_sf.c
> +++ b/tests/i915/kms_psr2_sf.c
> @@ -550,7 +550,7 @@ igt_main
>  	igt_fixture {
>  		int r;
>  
> -		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);

Does that make it generic though? The psr functions in lib/igt_psr.c
do stuff on i915_edp_psr_status which pretty much is i915-specific.


-- 
Petri Latvala


>  		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
>  		kmstest_set_vt_graphics_mode();
>  
> @@ -582,9 +582,9 @@ igt_main
>  	}
>  
>  	/* Verify primary plane selective fetch */
> -	for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
> -		igt_describe("Test that selective fetch works on primary plane");
> -		igt_subtest_f("primary-%s-sf-dmg-area-%d", op_str(data.op), i) {
> +	igt_describe("Test that selective fetch works on primary plane");
> +	igt_subtest_f("primary-%s-sf-dmg-area", op_str(data.op)) {
> +		for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
>  			data.damage_area_count = i;
>  			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
>  			prepare(&data);
> @@ -594,9 +594,9 @@ igt_main
>  	}
>  
>  	/* Verify overlay plane selective fetch */
> -	for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
> -		igt_describe("Test that selective fetch works on overlay plane");
> -		igt_subtest_f("overlay-%s-sf-dmg-area-%d", op_str(data.op), i) {
> +	igt_describe("Test that selective fetch works on overlay plane");
> +	igt_subtest_f("overlay-%s-sf-dmg-area", op_str(data.op)) {
> +		for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
>  			data.damage_area_count = i;
>  			data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
>  			prepare(&data);
> @@ -618,9 +618,9 @@ igt_main
>  	/* Only for overlay plane */
>  	data.op = PLANE_MOVE;
>  	/* Verify overlay plane move selective fetch */
> -	for (i = POS_TOP_LEFT; i <= POS_BOTTOM_RIGHT ; i++) {
> -		igt_describe("Test that selective fetch works on moving overlay plane");
> -		igt_subtest_f("%s-sf-dmg-area-%d", op_str(data.op), i) {
> +	igt_describe("Test that selective fetch works on moving overlay plane");
> +	igt_subtest_f("%s-sf-dmg-area", op_str(data.op)) {
> +		for (i = POS_TOP_LEFT; i <= POS_BOTTOM_RIGHT ; i++) {
>  			data.pos = i;
>  			data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
>  			prepare(&data);
> @@ -631,10 +631,10 @@ igt_main
>  
>  	/* Verify primary plane selective fetch with overplay plane blended */
>  	data.op = OVERLAY_PRIM_UPDATE;
> -	for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
> -		igt_describe("Test that selective fetch works on primary plane "
> -			     "with blended overlay plane");
> -		igt_subtest_f("%s-sf-dmg-area-%d", op_str(data.op), i) {
> +	igt_describe("Test that selective fetch works on primary plane "
> +		     "with blended overlay plane");
> +	igt_subtest_f("%s-sf-dmg-area", op_str(data.op)) {
> +		for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
>  			data.damage_area_count = i;
>  			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
>  			prepare(&data);
> -- 
> 2.19.1
> 
