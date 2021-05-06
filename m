Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23FC6EC9A
 for <igt-dev@lists.freedesktop.org>; Thu,  6 May 2021 04:37:15 +0000 (UTC)
References: <20210504054027.12895-1-pankaj.laxminarayan.bharadiya@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <6abc6015-4413-04ec-fc91-38cd7057a696@intel.com>
Date: Thu, 6 May 2021 10:07:09 +0530
MIME-Version: 1.0
In-Reply-To: <20210504054027.12895-1-pankaj.laxminarayan.bharadiya@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_psr2_sf: Add subtest
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
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, igt-dev@lists.freedesktop.org, gwan-gyeong.mun@intel.com, jose.souza@intel.com
Cc: kishore.kunche@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 5/4/2021 11:10 AM, Pankaj Bharadiya wrote:
> Add description for all subtests.
>
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>

Looks good to me.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> ---
>   tests/kms_psr2_sf.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/tests/kms_psr2_sf.c b/tests/kms_psr2_sf.c
> index 8d3e13019..fd91b4865 100644
> --- a/tests/kms_psr2_sf.c
> +++ b/tests/kms_psr2_sf.c
> @@ -589,6 +589,7 @@ igt_main
>   
>   	/* Verify primary plane selective fetch */
>   	for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
> +		igt_describe("Test that selective fetch works on primary plane");
>   		igt_subtest_f("primary-%s-sf-dmg-area-%d", op_str(data.op), i) {
>   			data.damage_area_count = i;
>   			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
> @@ -600,6 +601,7 @@ igt_main
>   
>   	/* Verify overlay plane selective fetch */
>   	for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
> +		igt_describe("Test that selective fetch works on overlay plane");
>   		igt_subtest_f("overlay-%s-sf-dmg-area-%d", op_str(data.op), i) {
>   			data.damage_area_count = i;
>   			data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> @@ -610,6 +612,7 @@ igt_main
>   	}
>   
>   	/* Verify overlay plane selective fetch */
> +	igt_describe("Test that selective fetch works on cursor plane");
>   	igt_subtest_f("cursor-%s-sf", op_str(data.op)) {
>   		data.damage_area_count = 1;
>   		data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
> @@ -622,6 +625,7 @@ igt_main
>   	data.op = PLANE_MOVE;
>   	/* Verify overlay plane move selective fetch */
>   	for (i = POS_TOP_LEFT; i <= POS_BOTTOM_RIGHT ; i++) {
> +		igt_describe("Test that selective fetch works on moving overlay plane");
>   		igt_subtest_f("%s-sf-dmg-area-%d", op_str(data.op), i) {
>   			data.pos = i;
>   			data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> @@ -634,6 +638,8 @@ igt_main
>   	/* Verify primary plane selective fetch with overplay plane blended */
>   	data.op = OVERLAY_PRIM_UPDATE;
>   	for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
> +		igt_describe("Test that selective fetch works on primary plane "
> +			     "with blended overlay plane");
>   		igt_subtest_f("%s-sf-dmg-area-%d", op_str(data.op), i) {
>   			data.damage_area_count = i;
>   			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
