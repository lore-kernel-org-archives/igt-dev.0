Return-path: <SRS0=2yIq=TB=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0CC10EB4F
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Feb 2022 08:15:37 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Date: Fri, 18 Feb 2022 08:15:31 +0000
Message-ID: <f83be4eaab5f4dd9998213284929cd1f@intel.com>
References: <20220216102633.26949-1-jeevan.b@intel.com>
 <20220216102633.26949-5-jeevan.b@intel.com> <20220217125118.GA3127@intel.com>
In-Reply-To: <20220217125118.GA3127@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 04/15] igt/tests: Add support for
 Tile4(TileF) format to kms_draw_crc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Heikkila,
 Juha-pekka" <juha-pekka.heikkila@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

>-----Original Message-----
>From: Lisovskiy, Stanislav <stanislav.lisovskiy@intel.com>
>Sent: Thursday, February 17, 2022 6:21 PM
>To: B, Jeevan <jeevan.b@intel.com>
>Cc: igt-dev@lists.freedesktop.org; Heikkila, Juha-pekka <juha-
>pekka.heikkila@intel.com>; Kahola, Mika <mika.kahola@intel.com>
>Subject: Re: [PATCH i-g-t v3 04/15] igt/tests: Add support for Tile4(TileF=
) format
>to kms_draw_crc
>
>On Wed, Feb 16, 2022 at 03:56:22PM +0530, Jeevan B wrote:
>> From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
>>
>> kms_draw_crc would be the first sample test to support new format.
>>
>> v2: add check for tile-4 support
>>
>> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
>> Signed-off-by: Jeevan B <jeevan.b@intel.com>
>> ---
>>  tests/i915/kms_draw_crc.c | 18 +++++++++++-------
>>  1 file changed, 11 insertions(+), 7 deletions(-)
>>
>> diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
>> index 82c368e1..33b7bdf4 100644
>> --- a/tests/i915/kms_draw_crc.c
>> +++ b/tests/i915/kms_draw_crc.c
>> @@ -41,25 +41,24 @@ drmModeConnectorPtr
>> drm_connectors[MAX_CONNECTORS];  struct buf_ops *bops;  igt_pipe_crc_t
>> *pipe_crc;
>>
>> -#define N_FORMATS 3
>> -static const uint32_t formats[N_FORMATS] =3D {
>> +static const uint32_t formats[] =3D {
>>  	DRM_FORMAT_XRGB8888,
>>  	DRM_FORMAT_RGB565,
>>  	DRM_FORMAT_XRGB2101010,
>>  };
>>
>> -#define N_MODIFIER_METHODS 3
>> -static const uint64_t modifiers[N_MODIFIER_METHODS] =3D {
>> +static const uint64_t modifiers[] =3D {
>>  	DRM_FORMAT_MOD_LINEAR,
>>  	I915_FORMAT_MOD_X_TILED,
>>  	I915_FORMAT_MOD_Y_TILED,
>> +	I915_FORMAT_MOD_4_TILED,
>>  };
>>
>>  struct base_crc {
>>  	bool set;
>>  	igt_crc_t crc;
>>  };
>> -struct base_crc base_crcs[N_FORMATS];
>> +struct base_crc base_crcs[ARRAY_SIZE(formats)];
>>
>>  struct modeset_params ms;
>>
>> @@ -178,6 +177,9 @@ static void draw_method_subtest(enum
>> igt_draw_method method,  {
>>  	igt_crc_t crc;
>>
>> +	igt_skip_on(modifier =3D=3D I915_FORMAT_MOD_4_TILED &&
>> +		    !HAS_4TILE(intel_get_drm_devid(drm_fd)));
>
>I wonder, why we don't use format_is_supported call here.
>We anyway call it, however its done with igt_require..
>
>Didn't we have somekind of more unified way of testing formats, only suppo=
rted
>by current kernel/platform?
>
>I thought Ville did something about this..

No, we have has_4tile other than that I don't think there is other way.=20

Thanks=20
Jeevan B
>
>Stan
>
>> +
>>  	igt_skip_on(method =3D=3D IGT_DRAW_MMAP_WC &&
>!gem_mmap__has_wc(drm_fd));
>>  	igt_skip_on(method =3D=3D IGT_DRAW_MMAP_GTT &&
>>  		    !gem_has_mappable_ggtt(drm_fd)); @@ -315,6 +317,8 @@
>static
>> const char *modifier_str(int modifier_index)
>>  		return "xtiled";
>>  	case I915_FORMAT_MOD_Y_TILED:
>>  		return "ytiled";
>> +	case I915_FORMAT_MOD_4_TILED:
>> +		return "4tiled";
>>  	default:
>>  		igt_assert(false);
>>  	}
>> @@ -328,9 +332,9 @@ igt_main
>>  	igt_fixture
>>  		setup_environment();
>>
>> -	for (format_idx =3D 0; format_idx < N_FORMATS; format_idx++) {
>> +	for (format_idx =3D 0; format_idx < ARRAY_SIZE(formats); format_idx++)
>> +{
>>  	for (method =3D 0; method < IGT_DRAW_METHOD_COUNT; method++) {
>> -	for (modifier_idx =3D 0; modifier_idx < N_MODIFIER_METHODS;
>modifier_idx++) {
>> +	for (modifier_idx =3D 0; modifier_idx < ARRAY_SIZE(modifiers);
>> +modifier_idx++) {
>>  		igt_describe("This subtest verfies igt_draw library works "
>>  			     "with different modifiers, DRM_FORMATS,
>DRAW_METHODS.");
>>  		igt_subtest_f("draw-method-%s-%s-%s",
>> --
>> 2.17.1
>>
