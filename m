Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471FACD5BB3
	for <igt-dev@archiver.kernel.org>; Fri, 22 May 2026 15:18:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35BC10E058;
	Fri, 22 May 2026 15:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="j2ySyqsZ";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A983310E058
 for <igt-dev@lists.freedesktop.org>; Fri, 22 May 2026 15:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1779463087;
 bh=a6O93Q7mEAbCV5iI0weEzjao2p2E7PBd3+0xj4giAhw=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=j2ySyqsZvb1VEf2IJNtH37jD1mGLL0UFBMO5A0A8Sc0Pij2o8NDm5AemiwexqBbLc
 v9nA5e51DEnID9geza8X+p4xdFALDGuLZc49IWOt1nHlfJTWiipG2wqw4/+czxyDU9
 LRw8rA28VXhsgfdl00ug5ZNfvMO+EvcmSuNKgBTTlt3KKWq8MI207DuU7m75yDB+ak
 FXhx15OjL2O4HPnvG20j/X+i9yEc2Isa/U+4kKINa1qDdeHg6b5LF3pQfkvJghVkOf
 E9A+M3rvg8stUm73ThtwbvxfMwfIL9QIfOIB/YR5lSq9Dv1V1DUPCihNaTm9yQIpRt
 D/Wq1ytCir0dQ==
Message-ID: <bc5f4fb5-4491-4d25-8a71-952a1fd9ebdb@lankhorst.se>
Date: Fri, 22 May 2026 17:17:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/kms_color: Add background-color subtest
 to test the BACKGROUND_COLOR property
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20260505194419.500600-5-dev@lankhorst.se>
 <20260505194419.500600-8-dev@lankhorst.se>
 <PH7PR11MB6053708C6EB6F603AAF14A89E7002@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <PH7PR11MB6053708C6EB6F603AAF14A89E7002@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hello,

Den 2026-05-19 kl. 16:25, skrev Samala, Pranay:
> Hi Maarten,
> 
>  
> 
>> -----Original Message-----
> 
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org <mailto:igt-dev-bounces@lists.freedesktop.org>> On Behalf Of
> 
>> Maarten Lankhorst
> 
>> Sent: Wednesday, May 6, 2026 1:14 AM
> 
>> To: igt-dev@lists.freedesktop.org <mailto:igt-dev@lists.freedesktop.org>
> 
>> Cc: Maarten Lankhorst <dev@lankhorst.se <mailto:dev@lankhorst.se>>
> 
>> Subject: [PATCH i-g-t 4/4] tests/kms_color: Add background-color subtest to
> 
>> test the BACKGROUND_COLOR property
> 
>>
> 
>> The BACKGROUND_COLOR crtc property has recently been added.
> 
>> Add some intel CRC tests to verify this property.
> 
>>
> 
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se <mailto:dev@lankhorst.se>>
> 
>> ---
> 
>>  tests/kms_color.c | 79
> 
>> +++++++++++++++++++++++++++++++++++++++++++++++
> 
>>  1 file changed, 79 insertions(+)
> 
>>
> 
>> diff --git a/tests/kms_color.c b/tests/kms_color.c index
> 
>> 565edb2dc9..e445c8b002 100644
> 
>> --- a/tests/kms_color.c
> 
>> +++ b/tests/kms_color.c
> 
>> @@ -46,6 +46,10 @@
> 
>>   * Description: Verify that setting the legacy gamma LUT resets the gamma
> 
>> LUT
> 
>>   *              set through GAMMA_LUT property
> 
>>   *
> 
>> + * SUBTEST: background-color
> 
>> + * Description: Verify that a 8-bit background color has the same CRC
> 
>> + * as a 8-bit primary plane in the same color.
> 
>> + *
> 
>>   * SUBTEST: ctm-%s
> 
>>   * Description: Check the color transformation %arg[1]
> 
>>   *
> 
>> @@ -957,6 +961,68 @@ run_deep_color_tests_for_crtc(data_t *data,
> 
>> igt_crtc_t *crtc)
> 
>>             test_cleanup(data);
> 
>>  }
> 
>>
> 
>> +static void
> 
>> +run_background_color_tests_for_crtc(data_t *data, igt_crtc_t *crtc) {
> 
>> +          igt_output_t *output;
> 
>> +          struct igt_fb fb;
> 
>> +          typeof(data->mode) mode;
> 
>> +          uint64_t black = DRM_ARGB64_PREP(0xffff, 0, 0, 0);
> 
>> +          uint64_t red  = DRM_ARGB64_PREP(0xffff, 0xffff, 0, 0);
> 
>> +          uint64_t green = DRM_ARGB64_PREP(0xffff, 0, 0xffff, 0);
> 
>> +          uint64_t blue = DRM_ARGB64_PREP(0xffff, 0, 0, 0xffff);
> 
>> +          uint64_t colors[] = { black, red, green, blue };
> 
>> +
> 
>> +          igt_require(igt_crtc_has_prop(crtc,
> 
>> IGT_CRTC_BACKGROUND_COLOR));
> 
>> +          test_setup(data, crtc);
> 
>> +
> 
>> +          output = igt_get_single_output_for_crtc(crtc);
> 
>> +          igt_require(output);
> 
>> +
> 
>> +          mode = igt_output_get_mode(output);
> 
>> +
> 
>> +          data->color_depth = 8;
> 
>> +          data->drm_format = DRM_FORMAT_XRGB8888;
> 
>> +          data->output = output;
> 
>> +          data->mode = NULL;
> 
>  
> 
> After fetching mode into a local variable, setting data->mode = NULL is not required.
> 
> Either you can remove this data->mode or fetch mode into data->mode itself and
> 
> avoid use of mode variable.
I zero it in case it's used elsewhere an to prevent dangling pointers.

That said, I'll just remove the assignment.

> 
>  
> 
>> +
> 
>> +          igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> 
>> +                               data->drm_format, DRM_FORMAT_MOD_LINEAR, &fb);
> 
>> +
> 
>> +          igt_output_set_crtc(output, crtc);
> 
>> +
> 
>> +          for (unsigned long i = 0; i < ARRAY_SIZE(colors); i++) {
> 
>> +                         igt_crc_t plane_crc, bg_crc;
> 
>> +
> 
>> +                         uint64_t color = colors[i];
> 
>> +                         uint32_t xrgb =
> 
>> +                                        (DRM_ARGB64_GETA_BPCS(color, 8) << 24) |
> 
>> +                                        (DRM_ARGB64_GETR_BPCS(color, 8) << 16) |
> 
>> +                                        (DRM_ARGB64_GETG_BPCS(color, 8) << 8) |
> 
>> +                                        (DRM_ARGB64_GETB_BPCS(color, 8));
> 
>> +
> 
>> +                         /*
> 
>> +                         * Set a different background color and  a fully opaque plane
> 
>> +                         * with the correct color.
> 
>> +                         */
> 
>> +                         igt_draw_fill_fb(data->drm_fd, &fb, xrgb);
> 
>> +                         igt_plane_set_fb(data->primary, &fb);
> 
>> +                         igt_crtc_set_prop_value(crtc,
> 
>> IGT_CRTC_BACKGROUND_COLOR, colors[i ^ 1]);
> 
>> +                         igt_display_commit2(&data->display, COMMIT_ATOMIC);
> 
>> +                         igt_pipe_crc_collect_crc(data->pipe_crc, &plane_crc);
> 
>> +
> 
>> +                         igt_plane_set_fb(data->primary, NULL);
> 
>> +                         igt_crtc_set_prop_value(crtc,
> 
>> IGT_CRTC_BACKGROUND_COLOR, color);
> 
>> +                         igt_display_commit2(&data->display, COMMIT_ATOMIC);
> 
>> +                         igt_pipe_crc_collect_crc(data->pipe_crc, &bg_crc);
> 
>> +
> 
>> +                         igt_assert_crc_equal(&plane_crc, &bg_crc);
> 
>> +          }
> 
>> +
> 
>  
> 
> The FB is never cleaned up, and output is not detached from the CRTC on exit.
> 
> Please add full teardown (igt_output_set_crtc(.., NULL), final atomic commit, and igt_remove_fb(..)).

My personal preference here is to perform as little cleanup as possible, in
particular always assume the previous subtest failed and the subtest cleanup never ran.

With this, I don't bother with cleanup as the next subtest *must* assume the
previous test failed somewhere in the middle, and call igt_display_reset()
in order to not fail with different expectations on the current atomic state.

Personally I wouldn't even add igt_display_fini() and close() calls,
and have all cleanups handled by performing a process exit instead.

Removing the fb should be done though, I'll add that.

>  
> 
>> +
> 
> Please avoid this extra blank line.
> 
>  
> 
>> +          test_cleanup(data);
> 
>> +}
> 
>> +
> 
>>  static void
> 
>>  run_invalid_tests_for_pipe(data_t *data)  { @@ -1165,6 +1231,19 @@
> 
>> run_tests_for_pipe(data_t *data)
> 
>>                                                          break;
> 
>>                            }
> 
>>             }
> 
>> +
> 
>> +          igt_describe("Verify that the background color is set correctly");
> 
>> +          igt_subtest_with_dynamic("background-color") {
> 
>> +                         for_each_crtc(&data->display, crtc) {
> 
>  
> 
> Since test iterates over all CRTCs with one compatible output each, lets use
> 
> for_each_crtc_with_single_output() helper. It already provides a single valid
> 
> output per CRTC, so we can drop the extra igt_get_single_output_for_crtc()
> 
> lookup and avoid igt_require(output) inside the dynamic subtest.
> 

I should have known, having written for_each_pipe_with_single_output in 2018. :-)

Kind regards,
~Maarten Lankhorst
