Return-path: <SRS0=Vgj9=TF=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3552010EAF9
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Feb 2022 11:17:29 +0000 (UTC)
Date: Tue, 22 Feb 2022 13:16:37 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>
Message-ID: <YhTGFdDdTuX3m9a+@platvala-desk.ger.corp.intel.com>
References: <20220222103841.2276186-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220222103841.2276186-1-jouni.hogander@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_psr2_sf: Add new testcases
 for moving plane
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

On Tue, Feb 22, 2022 at 12:38:41PM +0200, Jouni Högander wrote:
> Add new testcases which are moving cursor and overlay planes
> without setting any damage areas.
> 
> Cursor testcase is reproducing following bug:
> 
> https://gitlab.freedesktop.org/drm/intel/-/issues/5077
> 
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>  tests/i915/kms_psr2_sf.c | 144 ++++++++++++++++++++++++++++++++++++---
>  1 file changed, 136 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
> index 36f8a786..b9990f87 100644
> --- a/tests/i915/kms_psr2_sf.c
> +++ b/tests/i915/kms_psr2_sf.c
> @@ -43,6 +43,7 @@ IGT_TEST_DESCRIPTION("Tests to varify PSR2 selective fetch by sending multiple"
>  enum operations {
>  	PLANE_UPDATE,
>  	PLANE_UPDATE_CONTINUOUS,
> +	PLANE_MOVE_DAMAGED,
>  	PLANE_MOVE,
>  	OVERLAY_PRIM_UPDATE
>  };
> @@ -51,7 +52,9 @@ enum plane_move_postion {
>  	POS_TOP_LEFT,
>  	POS_TOP_RIGHT,
>  	POS_BOTTOM_LEFT,
> -	POS_BOTTOM_RIGHT
> +	POS_BOTTOM_RIGHT,
> +	POS_BOTTOM_LEFT_NEGATIVE,
> +	POS_TOP_RIGHT_NEGATIVE,
>  };
>  
>  typedef struct {
> @@ -74,6 +77,7 @@ typedef struct {
>  	igt_plane_t *test_plane;
>  	cairo_t *cr;
>  	uint32_t screen_changes;
> +	int cur_x, cur_y;
>  } data_t;
>  
>  static const char *op_str(enum operations op)
> @@ -81,7 +85,8 @@ static const char *op_str(enum operations op)
>  	static const char * const name[] = {
>  		[PLANE_UPDATE] = "plane-update",
>  		[PLANE_UPDATE_CONTINUOUS] = "plane-update-continuous",
> -		[PLANE_MOVE] = "plane-move",
> +		[PLANE_MOVE] = "plane-move-without-damage",
> +		[PLANE_MOVE_DAMAGED] = "plane-move",
>  		[OVERLAY_PRIM_UPDATE] = "overlay-primary-update",
>  	};
>  
> @@ -187,7 +192,7 @@ static void plane_update_setup_squares(data_t *data, igt_fb_t *fb, uint32_t h,
>  	}
>  }
>  
> -static void plane_move_setup_square(data_t *data, igt_fb_t *fb, uint32_t h,
> +static void plane_move_damaged_setup_square(data_t *data, igt_fb_t *fb, uint32_t h,
>  				       uint32_t v)
>  {
>  	int x = 0, y = 0;
> @@ -260,8 +265,8 @@ static void prepare(data_t *data)
>  
>  		data->fb_continuous = &data->fb_overlay;
>  
> -		if (data->op == PLANE_MOVE) {
> -			plane_move_setup_square(data, &data->fb_test,
> +		if (data->op == PLANE_MOVE_DAMAGED) {
> +			plane_move_damaged_setup_square(data, &data->fb_test,
>  					   data->mode->hdisplay/2,
>  					   data->mode->vdisplay/2);
>  
> @@ -273,6 +278,7 @@ static void prepare(data_t *data)
>  
>  		igt_plane_set_fb(sprite, &data->fb_overlay);
>  		data->test_plane = sprite;
> +
>  		break;
>  
>  	case DRM_PLANE_TYPE_PRIMARY:
> @@ -335,6 +341,8 @@ static void prepare(data_t *data)
>  		igt_assert(false);
>  	}
>  
> +	data->cur_x = data->cur_y = 0;
> +
>  	igt_plane_set_fb(primary, &data->fb_primary);
>  
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> @@ -378,7 +386,7 @@ static void plane_update_expected_output(int plane_type, int box_count,
>  	manual(expected);
>  }
>  
> -static void plane_move_expected_output(enum plane_move_postion pos)
> +static void plane_move_damaged_expected_output(enum plane_move_postion pos)
>  {
>  	char expected[64] = {};
>  
> @@ -406,6 +414,42 @@ static void plane_move_expected_output(enum plane_move_postion pos)
>  	manual(expected);
>  }
>  
> +static void plane_move_expected_output(enum plane_move_postion pos)
> +{
> +	char expected[73] = {};
> +
> +	switch (pos) {
> +	case POS_TOP_LEFT:
> +		sprintf(expected,
> +			"screen Green with Blue box on top left corner");
> +		break;
> +	case POS_TOP_RIGHT:
> +		sprintf(expected,
> +			"screen Green with Blue box on top right corner");
> +		break;
> +	case POS_BOTTOM_LEFT:
> +		sprintf(expected,
> +			"screen Green with Blue box on bottom left corner");
> +		break;
> +	case POS_BOTTOM_RIGHT:
> +		sprintf(expected,
> +			"screen Green with Blue box on bottom right corner");
> +		break;
> +	case POS_BOTTOM_LEFT_NEGATIVE:
> +		sprintf(expected,
> +			"screen Green with Blue box on bottom left corner (partly exceeding area)");
> +		break;
> +	case POS_TOP_RIGHT_NEGATIVE:
> +		sprintf(expected,
> +			"screen Green with Blue box on top right corner (partly exceeding area)");
> +		break;
> +	default:
> +		igt_assert(false);
> +	}
> +
> +	manual(expected);
> +}
> +
>  static void overlay_prim_update_expected_output(int box_count)
>  {
>  	char expected[64] = {};
> @@ -421,6 +465,9 @@ static void overlay_prim_update_expected_output(int box_count)
>  static void expected_output(data_t *data)
>  {
>  	switch (data->op) {
> +	case PLANE_MOVE_DAMAGED:
> +		plane_move_damaged_expected_output(data->pos);
> +		break;
>  	case PLANE_MOVE:
>  		plane_move_expected_output(data->pos);
>  		break;
> @@ -487,6 +534,59 @@ static void damaged_plane_move(data_t *data)
>  	expected_output(data);
>  }
>  
> +static void plane_move(data_t *data)
> +{
> +	int target_x, target_y;
> +
> +	switch (data->pos) {
> +	case POS_TOP_LEFT:
> +		target_x = 0;
> +		target_y = 0;
> +		break;
> +	case POS_TOP_RIGHT:
> +		target_x = data->mode->hdisplay - data->fb_test.width;
> +		target_y = 0;
> +		break;
> +	case POS_TOP_RIGHT_NEGATIVE:
> +		target_x = data->mode->hdisplay - data->fb_test.width;
> +		target_y = -data->fb_test.width / 2;
> +		break;
> +	case POS_BOTTOM_LEFT:
> +		target_x = 0;
> +		target_y = data->mode->vdisplay - data->fb_test.height;
> +		break;
> +	case POS_BOTTOM_LEFT_NEGATIVE:
> +	  target_x = -data->fb_test.width / 2;
> +	  target_y = data->mode->vdisplay - data->fb_test.height;
> +		break;
> +	case POS_BOTTOM_RIGHT:
> +	  target_x = data->mode->hdisplay - data->fb_test.width;
> +	  target_y = data->mode->vdisplay - data->fb_test.height;
> +		break;
> +	default:
> +		igt_assert(false);
> +	}
> +
> +	while (data->cur_x != target_x || data->cur_y != target_y) {
> +		if (data->cur_x < target_x)
> +			data->cur_x += min(target_x - data->cur_x, 20);
> +		else if (data->cur_x > target_x)
> +			data->cur_x -= min(data->cur_x - target_x, 20);
> +
> +		if (data->cur_y < target_y)
> +			data->cur_y += min(target_y - data->cur_y, 20);
> +		else if (data->cur_y > target_y)
> +			data->cur_y -= min(data->cur_y - target_y, 20);
> +
> +		igt_plane_set_position(data->test_plane, data->cur_x, data->cur_y);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	}
> +
> +	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2));
> +
> +	expected_output(data);
> +}
> +
>  static void damaged_plane_update(data_t *data)
>  {
>  	igt_plane_t *test_plane = data->test_plane;
> @@ -526,6 +626,8 @@ static void damaged_plane_update(data_t *data)
>  
>  static void run(data_t *data)
>  {
> +	int i;
> +
>  	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2));
>  
>  	data->screen_changes = 0;
> @@ -542,9 +644,15 @@ static void run(data_t *data)
>  			damaged_plane_update(data);
>  		}
>  		break;
> -	case PLANE_MOVE:
> +	case PLANE_MOVE_DAMAGED:
>  		damaged_plane_move(data);
>  		break;
> +	case PLANE_MOVE:
> +		for (i = POS_TOP_LEFT; i <= POS_TOP_RIGHT_NEGATIVE; i++) {
> +			data->pos = i;
> +			plane_move(data);
> +		}
> +		break;
>  	default:
>  		igt_assert(false);
>  	}
> @@ -654,10 +762,20 @@ igt_main
>  		cleanup(&data);
>  	}
>  
> -	/* Only for overlay plane */
>  	data.op = PLANE_MOVE;
>  	/* Verify overlay plane move selective fetch */
>  	igt_describe("Test that selective fetch works on moving overlay plane");
> +	igt_subtest_f("cursor-%s-sf", op_str(data.op)) {
> +		data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
> +		prepare(&data);
> +		run(&data);
> +		cleanup(&data);
> +	}
> +
> +	/* Only for overlay plane */
> +	data.op = PLANE_MOVE_DAMAGED;
> +	/* Verify overlay plane move selective fetch */
> +	igt_describe("Test that selective fetch works on moving overlay plane");
>  	igt_subtest_f("%s-sf-dmg-area", op_str(data.op)) {
>  		for (i = POS_TOP_LEFT; i <= POS_BOTTOM_RIGHT ; i++) {
>  			data.pos = i;
> @@ -668,6 +786,16 @@ igt_main
>  		}
>  	}
>  
> +	data.op = PLANE_MOVE;
> +	/* Verify overlay plane move selective fetch */
> +	igt_describe("Test that selective fetch works on moving overlay plane");
> +	igt_subtest_f("overlay-%s-sf", op_str(data.op)) {
> +		data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> +		prepare(&data);
> +		run(&data);
> +		cleanup(&data);
> +	}

Same text on three igt_describes and subtest names sound like some of
them are copypaste errors.


-- 
Petri Latvala



> +
>  	/* Verify primary plane selective fetch with overplay plane blended */
>  	data.op = OVERLAY_PRIM_UPDATE;
>  	igt_describe("Test that selective fetch works on primary plane "
> -- 
> 2.32.0
> 
