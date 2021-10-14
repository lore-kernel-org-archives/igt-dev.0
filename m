Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC566E10F
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Oct 2021 11:03:51 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id w14so22543238edv.11
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Oct 2021 04:03:51 -0700 (PDT)
References: <20211012142224.15632-1-juhapekka.heikkila@gmail.com>
 <YWftexnS+5L4uyFd@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <29990b0d-52e8-5ad8-fc1b-6ff6fee1a6e1@gmail.com>
Date: Thu, 14 Oct 2021 14:03:42 +0300
MIME-Version: 1.0
In-Reply-To: <YWftexnS+5L4uyFd@intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: fix size change
 and alpha tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 14.10.2021 11.42, Ville Syrjälä wrote:
> On Tue, Oct 12, 2021 at 05:22:24PM +0300, Juha-Pekka Heikkila wrote:
>> Unify and simplify cursor size change and cursor alpha tests.
>>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>>   tests/kms_cursor_crc.c | 190 ++++++++++++-----------------------------
>>   1 file changed, 56 insertions(+), 134 deletions(-)
>>
>> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
>> index 9faba1a18..7d9ec1927 100644
>> --- a/tests/kms_cursor_crc.c
>> +++ b/tests/kms_cursor_crc.c
>> @@ -71,7 +71,7 @@ typedef struct {
>>   	igt_plane_t *cursor;
>>   	cairo_surface_t *surface;
>>   	uint32_t devid;
>> -	bool hwimageistestimage;
>> +	double alpha;
>>   } data_t;
>>   
>>   #define TEST_DPMS (1<<0)
>> @@ -89,7 +89,7 @@ typedef struct {
>>   	int height;
>>   } cursorarea;
>>   
>> -static void draw_cursor(cairo_t *cr, cursorarea *cursor)
>> +static void draw_cursor(cairo_t *cr, cursorarea *cursor, double alpha)
>>   {
>>   	int wl, wr, ht, hb;
>>   
>> @@ -104,13 +104,13 @@ static void draw_cursor(cairo_t *cr, cursorarea *cursor)
>>   	    (cursor->y < SHRT_MIN) || (cursor->y > SHRT_MAX))
>>   		return;
>>   
>> -	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
>> +	cairo_set_operator(cr, CAIRO_OPERATOR_OVER);
>>   	cairo_set_antialias(cr, CAIRO_ANTIALIAS_NONE);
>>   	/* 4 color rectangles in the corners, RGBY */
>> -	igt_paint_color(cr, cursor->x, cursor->y, wl, ht, RED);
>> -	igt_paint_color(cr, cursor->x + wl, cursor->y, wr, ht, GREEN);
>> -	igt_paint_color(cr, cursor->x, cursor->y + ht, wl, hb, BLUE);
>> -	igt_paint_color(cr, cursor->x + wl, cursor->y + ht, wr, hb, WHITE);
>> +	igt_paint_color_alpha(cr, cursor->x, cursor->y, wl, ht, RED, alpha);
>> +	igt_paint_color_alpha(cr, cursor->x + wl, cursor->y, wr, ht, GREEN, alpha);
>> +	igt_paint_color_alpha(cr, cursor->x, cursor->y + ht, wl, hb, BLUE, alpha);
>> +	igt_paint_color_alpha(cr, cursor->x + wl, cursor->y + ht, wr, hb, WHITE, alpha);
> 
> Is this an actual bugfix? The alpha seems to have disappeared at some
> point.

There's been in use CAIRO_OPERATOR_SOURCE because here was always used 
only alpha 1.0 hence at some point I had dropped that alpha parameter. 
Now I used this function to draw with alpha in use so I put in place 
CAIRO_OPERATOR_OVER and set default alpha in 'data' to 1.0, though now 
that think about it I'll need to set it back to 1.0 after 
'alpha-transparent' subtest.

> 
> Hmm. test_cursor_alpha() is apparently creating its own fb currently,
> and clobbering data->fb which was created by the top level fixture for
> everyone else. Ugh.
> 
> Anyways, the diff is huge, can't really figure out what the heck
> it's doing. There seems to be some code motion in there as well,
> but maybe with other changes sprinkled in? Dunno. Can you split
> it up a bit?


Agree diff is quite big. That code moving is just because 
test_cursor_alpha started to use create_cursor_fb so create_cursor_fb 
need to be after test_cursor_alpha, I can separate that into its own 
patch but it probably will not change much in diff which does actual 
change. Most of diff is just about removing unnecessary code once 
started to use do_single_test also for size change and alpha tests.

I'll have second go to make the patch(es) to see what I get.

/Juha-Pekka
