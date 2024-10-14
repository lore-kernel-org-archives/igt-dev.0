Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A56DD16256
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 12:32:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E455510E0EA;
	Mon, 14 Oct 2024 12:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lyTqigRL";
	dkim-atps=neutral
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A40810E0EA
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 12:32:14 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a994cd82a3bso630704066b.2
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 05:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728909132; x=1729513932; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=92LitK66j4Yly99O7XVHXcptwe2dOSPrS+U6s6KuT34=;
 b=lyTqigRLYc3qnd0mhdo5bKhhS6eKw3y+8jwz1I+Xhb4CUNxsk9fYF/bjEnD+WoqR2N
 /F5XJcMs0ypK/+tThv5ylOr7oTV9HVXQ9RfNSgTf5YU1gQzRskgweSj4sw1FgcD6n+YE
 iW9EA/VEOgnMFDQUPAyILA1Ika7QIZQIAhzANpJDtZi/d1Zun/Fz52IkhjK1R/NA42DY
 vDwX2ny+BotvhaH5FhoE5SVSJwhGn91VbNHloQ9T/hF5GBm8KuZAc4occKQAF0H5j7OL
 ftBXVNBqwRqdC2AXwUefH5ShSu3VpDU33eURZvKZGLfizcdBQnedNZtUVTHvf95F44Ir
 Pzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728909132; x=1729513932;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=92LitK66j4Yly99O7XVHXcptwe2dOSPrS+U6s6KuT34=;
 b=E2jaHpzMOoPnnbNGeF7zX2Kchim2WeVAaxwhOL9PBHdmvLxOC5cncsC7n76ANDoNgl
 70lCHSh7UbJlfsnl7bW1xJP5SYf3zXK72zQGwPmiWo3nvuFFjZlJLEgN7P3hHTWfZMP8
 2TT3cNzSUs5lw2cEw80ghvTXAPntbO8k2sBrTENBr7Z347Q/fK3FAe2fQj9K5wV6DAH3
 gmcZaCuTu6p4tWuHThpYfIj2IEfVJcR+KydWzxVMD863xKX1J6l7bdCyJ+E6b9pVzllc
 LET3HpCEZSHFS0Gpj2EZ2rgwLF74Gjw9RByxaZtc1Iy5VHY7nSPJJdXmHCA2Eiw7vl9z
 70ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9N9I/jo4ghJjgpWPNbJbJbRN/yv+BqqtgkY4c1FKf3CcKOvg5JvAkzgeq0vFauMUO9eN3a5pA@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFxIBPj85m8DK1acEVL1ASSQAlDzO68KtSPYiL82ZPUmXlBeIK
 aa+cRQcxCHvLZwpxiPn0H6hbw6c90lYjw1tT6+Iekg/7Q2LsaGPl
X-Google-Smtp-Source: AGHT+IHOiqNUsFx+J4cTEcXS7Ngs/Sxx9ilDezZZRSRbuUREvlnwktVYpawvn03zBkA9VaYgun/7Hw==
X-Received: by 2002:a17:906:c10a:b0:a99:fd2c:4f06 with SMTP id
 a640c23a62f3a-a99fd2c5ba6mr534383866b.65.1728909132015; 
 Mon, 14 Oct 2024 05:32:12 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.77])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a9a01f9ad6esm223769966b.53.2024.10.14.05.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 05:32:11 -0700 (PDT)
Message-ID: <5a63e1df-4068-4abf-906f-5f530badfdb0@gmail.com>
Date: Mon, 14 Oct 2024 15:32:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 4/4] tests/kms_writeback: Add dump for valid
 clone mode
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org,
 Esha Bharadwaj <quic_ebharadw@quicinc.com>
References: <20240925-igt-cwb-v4-0-e516cd1e888e@quicinc.com>
 <20240925-igt-cwb-v4-4-e516cd1e888e@quicinc.com>
 <45d3888c-b4cb-4f73-9e70-f4e86b5998ef@quicinc.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <45d3888c-b4cb-4f73-9e70-f4e86b5998ef@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Abhinav,

on Intel i915 and Xe drivers writeback is not implemented and I don't 
know if anyone is working on it. In those ways no need to care about 
Intel drivers.

/Juha-Pekka

On 26.9.2024 0.55, Abhinav Kumar wrote:
> Hi IGT maintainers
> 
> I have given some comments below so that we can skip the test if no 
> valid clones of WB output are found  but at a top level, I wanted to get 
> your feedback that if we validate every clone of WB output with it in a 
> pair-wise fashion, thats something which works for all vendors?
> 
> This will not test the case where lets say WB, output A, output B are 
> all clones of each other and we want to do a 3-way clone mode as it will 
> only test,
> 
> 1) WB with output A
> 2) WB with output B
> 
> But atleast it validates all of WB's clones one pair at a time.
> 
> So wanted to know if we can make this a generic test-case of 
> kms_writeback OR we need to protect this with some cmdline option.
> 
> Thanks
> 
> Abhinav
> On 9/25/2024 1:37 PM, Jessica Zhang wrote:
>> From: Esha Bharadwaj <quic_ebharadw@quicinc.com>
>>
>> Move the regular writeback dump into its own subtest and add a subtest to
>> dump pairs of cloned non-writeback and writeback encoders
>>
>> Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   tests/kms_writeback.c | 86 +++++++++++++++++++++++++++++++++++++++++ 
>> +++++++---
>>   1 file changed, 82 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
>> index 4155961a0..cdbb9e436 100644
>> --- a/tests/kms_writeback.c
>> +++ b/tests/kms_writeback.c
>> @@ -47,6 +47,13 @@
>>   #include "sw_sync.h"
>>   /**
>> + * SUBTEST: dump-writeback
>> + * Description: Dump a non-cloned writeback buffer
>> + *
>> + * SUBTEST: dump-valid-clones
>> + * Description: Dump all valid clone pairs of writeback and non- 
>> writeback
>> + *              connectors
>> + *
>>    * SUBTEST: writeback-check-output-XRGB2101010
>>    * Description: Check XRGB2101010 writeback output with CRC validation
>>    *
>> @@ -450,7 +457,7 @@ static void do_single_commit(igt_output_t *output, 
>> igt_plane_t *plane, igt_fb_t
>>   }
>>   static void commit_and_dump_fb(igt_display_t *display, igt_output_t 
>> *output, igt_plane_t *plane,
>> -                    igt_fb_t *input_fb, drmModeModeInfo *mode)
>> +                   igt_fb_t *input_fb, drmModeModeInfo *mode, char 
>> *suffix)
>>   {
>>       cairo_surface_t *fb_surface_out;
>>       char filepath_out[PATH_MAX];
>> @@ -471,7 +478,8 @@ static void commit_and_dump_fb(igt_display_t 
>> *display, igt_output_t *output, igt
>>       do_single_commit(output, plane, input_fb, &output_fb);
>>       fb_surface_out = igt_get_cairo_surface(display->drm_fd, 
>> &output_fb);
>> -    snprintf(filepath_out, PATH_MAX, "%s/%s.png", path_name, file_name);
>> +    snprintf(filepath_out, PATH_MAX, "%s/%s-%s.png", path_name, 
>> file_name, suffix);
>> +
>>       status = cairo_surface_write_to_png(fb_surface_out, filepath_out);
>>       igt_assert_eq(status, CAIRO_STATUS_SUCCESS);
>>       cairo_surface_destroy(fb_surface_out);
>> @@ -555,6 +563,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, 
>> opt_handler, NULL)
>>       drmModeModeInfo mode;
>>       unsigned int fb_id;
>>       int ret;
>> +    char dump_suffix[PATH_MAX];
>>       memset(&display, 0, sizeof(display));
>> @@ -603,9 +612,78 @@ igt_main_args("b:c:f:dl", long_options, help_str, 
>> opt_handler, NULL)
>>           if (data.list_modes)
>>               list_writeback_modes(&display);
>> -        if (data.dump_check)
>> -            commit_and_dump_fb(&display, output, plane, &input_fb, 
>> &mode);
>>       }
>> +
>> +    /*
>> +     * When dump_check is high, the following subtests will be run.
>> +     * These tests will be skipped if list_modes flag is high.
>> +     */
>> +    igt_describe("Dump a non-cloned writeback buffer");
>> +    igt_subtest("dump-writeback") {
>> +        igt_skip_on(!data.dump_check || data.list_modes);
>> +        snprintf(dump_suffix, PATH_MAX, "encoder%d", output->id);
>> +        commit_and_dump_fb(&display, output, plane, &input_fb, &mode, 
>> dump_suffix);
>> +    }
>> +
>> +    igt_describe("Dump valid clone pairs of writeback and non- 
>> writeback connectors");
>> +    igt_subtest("dump-valid-clones") {
>> +        igt_output_t *nonwb_output;
>> +        enum pipe curr_pipe;
>> +        drmModeModeInfo *nonwb_mode;
>> +        igt_fb_t clone_fb;
>> +
>> +        /*
>> +         * Drop the dump flag check once calling writeback_sequence() is
>> +         * supported
>> +         */
>> +        igt_skip_on(!data.dump_check || data.list_modes);
>> +        igt_skip_on_f(!(data.supported_colors & XRGB8888), 
>> "DRM_FORMAT_XRGB8888 is unsupported\n");
>> +        igt_require(fb_id > 0);
>> +        for_each_output(&display, nonwb_output) {
>> +            if ((nonwb_output->config.connector->connector_type == 
>> DRM_MODE_CONNECTOR_WRITEBACK)
>> +                    || igt_output_clone_valid(display.drm_fd, output, 
>> nonwb_output))
>> +                continue;
>> +
>> +            /* Set up non-writeback cloned output */
>> +            curr_pipe = output->pending_pipe;
>> +            nonwb_mode = igt_output_get_mode(nonwb_output);
>> +
>> +            igt_output_set_pipe(nonwb_output, curr_pipe);
>> +            igt_output_override_mode(output, nonwb_mode);
>> +
>> +            fb_id = igt_create_fb(display.drm_fd, nonwb_mode->hdisplay,
>> +                      nonwb_mode->vdisplay,
>> +                      DRM_FORMAT_XRGB8888,
>> +                      DRM_FORMAT_MOD_LINEAR,
>> +                      &clone_fb);
>> +            igt_assert(fb_id >= 0);
>> +
>> +            /*
>> +             * Currently, only dump the resulting frame. This is
>> +             * because the igt_fb_get_fnv1a_crc() is unable to
>> +             * calculate CRCs for non-32 bit aligned resolutions.
>> +             *
>> +             * Once there is a workaround for this issue, this can
>> +             * be changed to:
>> +             *    if (dump_check flag set)
>> +             *        commit_and_dump_fb()
>> +             *    else
>> +             *        writeback_sequence()
>> +             */
> 
> With https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/ 
> commit/27ba1f4756f12a3694dce6d456aed947f22a8e34 merged, this comment is 
> no longer true.
> 
> We should drop the dump_check restriction for clones test.
> 
> We should also skip this test if there were no possible_clones found for 
> the WB output.
> 

