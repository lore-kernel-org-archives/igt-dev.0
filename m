Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED3EC4345F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 22:05:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA37D11206F;
	Mon, 22 Apr 2024 22:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="lwi3buHR";
	dkim-atps=neutral
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9045E10FB33
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 22:05:51 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4VNfTB4Yg1z9w0K;
 Mon, 22 Apr 2024 22:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1713823550; bh=TCsq1cmRO0QER8IRJdSbx/CEyCbaRaMEhm4IovEgAu4=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=lwi3buHROwXNhTnM+6c0ufMC0cwOwJC1OyXlnzyPtmFpYHl1ZSgL0ag49iApSdPDb
 ECZW0NDjQ0lfs5tQmo+QPqQBRiqFcgtDYIdh8ws6ptMIv0iBTzGvz32F5asI4Njn+d
 xrqEcdQqJyInS41zFzArkERH0Q4fle1x6lm71jZc=
X-Riseup-User-ID: 8A63DBEB6ED1904962F6466AF318621897995182E5532554A71E36B7A1F4C984
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4VNfT73tRvzJt66;
 Mon, 22 Apr 2024 22:05:47 +0000 (UTC)
Message-ID: <64d1d5a1-e3fd-4c11-87f5-7504f4089756@riseup.net>
Date: Mon, 22 Apr 2024 19:05:44 -0300
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t v4 5/7] benchmarks/kms_fb_stress: Don't paint the
 FB's if the format is not supported by Pixman
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
References: <20240411-kms_fb_stress-dev-v4-0-7a8f3a419ebb@riseup.net>
 <20240411-kms_fb_stress-dev-v4-5-7a8f3a419ebb@riseup.net>
 <20240419150023.aomxc7cn2spb2wsa@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <20240419150023.aomxc7cn2spb2wsa@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 19/04/24 12:00, Kamil Konieczny wrote:
> Hi Arthur,
> On 2024-04-11 at 15:51:15 -0300, Arthur Grillo wrote:
>> Pixman requires strides to be divisible by sizeof(uint32_t).
>> So, don't paint the FB's if the stride is not.
> 
> Why are you limiting stress to pixman? What about an option for

Actually I'm not. I do the stress, I just don't paint the FB's, due to
the pixman limitation.

Best Regards,
~Arthur Grillo

> non-dword aligned stress benchmark? Btw most hardware use dword
> or qword alignment.

> 
>>
>> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
>> ---
>>  benchmarks/kms_fb_stress.c | 62 +++++++++++++++++++++++++++++++++++-----------
>>  1 file changed, 48 insertions(+), 14 deletions(-)
>>
>> diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
>> index 76e82e0d76ea..bb85dfb18d2b 100644
>> --- a/benchmarks/kms_fb_stress.c
>> +++ b/benchmarks/kms_fb_stress.c
>> @@ -46,26 +46,60 @@ static void plane_setup(struct plane_t *plane, int index)
>>  	igt_plane_set_fb(plane->base, &plane->fbs[index]);
>>  }
>>  
>> +static bool have_supported_pixman_stride(int fd, struct plane_t *plane) {
>> +	unsigned stride;
>> +
>> +	igt_calc_fb_size(fd, plane->rect.width, plane->rect.height,
>> +			 plane->format, DRM_FORMAT_MOD_LINEAR,
>> +			 NULL, &stride);
>> +
>> +	return stride % sizeof(uint32_t) == 0;
> 
> I do not see int this function pixman related ioctl, all you
> do is checking stride is dword aligned, imho it would be better
> to rename this function, like has_stride_dw_aligned (you are
> free to find out better name).
> 
>> +}
>> +
>>  static void gen_fbs(struct data_t *data)
>>  {
>>  	struct kms_t *kms = &data->kms;
>>  	drmModeModeInfo *mode = igt_output_get_mode(data->wb_output);
>>  
>>  	for (int i = 0; i < NUM_FBS; i++) {
>> -		igt_create_color_fb(data->fd, kms->primary.rect.width, kms->primary.rect.height,
>> -				    kms->primary.format, DRM_FORMAT_MOD_LINEAR,
>> -				    !i, i, i,
>> -				    &kms->primary.fbs[i]);
>> -
>> -		igt_create_color_fb(data->fd, kms->overlay_a.rect.width, kms->overlay_a.rect.height,
>> -				    kms->overlay_a.format, DRM_FORMAT_MOD_LINEAR,
>> -				    i, !i, i,
>> -				    &kms->overlay_a.fbs[i]);
>> -
>> -		igt_create_color_fb(data->fd, kms->overlay_b.rect.width, kms->overlay_b.rect.height,
>> -				    kms->overlay_b.format, DRM_FORMAT_MOD_LINEAR,
>> -				    i, i, !i,
>> -				    &kms->overlay_b.fbs[i]);
>> +		if (have_supported_pixman_stride(data->fd, &kms->primary)) {
>> +			igt_create_color_fb(data->fd,
>> +					    kms->primary.rect.width, kms->primary.rect.height,
>> +					    kms->primary.format, DRM_FORMAT_MOD_LINEAR,
>> +					    !i, i, i,
>> +					    &kms->primary.fbs[i]);
>> +		} else {
>> +			igt_create_fb(data->fd,
>> +				      kms->primary.rect.width, kms->primary.rect.height,
>> +				      kms->primary.format, DRM_FORMAT_MOD_LINEAR,
>> +				      &kms->primary.fbs[i]);
>> +		}
>> +
>> +		if (have_supported_pixman_stride(data->fd, &kms->overlay_a)) {
>> +			igt_create_color_fb(data->fd,
>> +					    kms->overlay_a.rect.width, kms->overlay_a.rect.height,
>> +					    kms->overlay_a.format, DRM_FORMAT_MOD_LINEAR,
>> +					    i, !i, i,
>> +					    &kms->overlay_a.fbs[i]);
>> +		} else {
>> +			igt_create_fb(data->fd,
>> +				      kms->overlay_a.rect.width, kms->overlay_a.rect.height,
>> +				      kms->overlay_a.format, DRM_FORMAT_MOD_LINEAR,
>> +				      &kms->overlay_a.fbs[i]);
>> +		}
> 
> It looks like repeating code, maybe create a function?
> 
> Regards,
> Kamil
> 
>> +
>> +		if (have_supported_pixman_stride(data->fd, &kms->overlay_b)) {
>> +			igt_create_color_fb(data->fd,
>> +					    kms->overlay_b.rect.width, kms->overlay_b.rect.height,
>> +					    kms->overlay_b.format, DRM_FORMAT_MOD_LINEAR,
>> +					    i, i, !i,
>> +					    &kms->overlay_b.fbs[i]);
>> +		} else {
>> +			igt_create_fb(data->fd,
>> +				      kms->overlay_b.rect.width, kms->overlay_b.rect.height,
>> +				      kms->overlay_b.format, DRM_FORMAT_MOD_LINEAR,
>> +				      &kms->overlay_b.fbs[i]);
>> +		}
>>  
>>  		kms->writeback.rect.width = mode->hdisplay;
>>  		kms->writeback.rect.height = mode->vdisplay;
>>
>> -- 
>> 2.44.0
>>
