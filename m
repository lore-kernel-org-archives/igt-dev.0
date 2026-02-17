Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D11E909DD
	for <igt-dev@archiver.kernel.org>; Tue, 17 Feb 2026 17:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E86088DE5;
	Tue, 17 Feb 2026 17:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="kKg0XXar";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28F910E51F
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Feb 2026 17:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=meyCP/foNUmLQaweWa+2h5yYN0LvcxAhNSfTCCtYy84=; b=kKg0XXar4vGaf+HxmHPYOmesrT
 puJ6PFVqnYma5Ykcw2pzo6ATHnXh8WBpIzzBqZMBoqDsujCx1J/8SqH7o76JeSrPO7grdprw3isZ7
 1g99JxuQP7nZGDWWSzsqjibfINDc6HmaAC43gUGt7TAnKmypRsBPVOX3TQinpQ/v8JnYxoJ6WJZf2
 zzITRLz4gsnLBkyf5S9IU7fwEteraUk5DPxCfpWSMjTlpnXlW/Dtr1S7L6biF4hi3UHNQXoqyxMVu
 YlfydqMFbFvHtU24g8nr5/wI4d4SoPjB5u7lqYwOSG+15WbNmu/tTUgZ7Mug0F39+U5yoQQpVONHl
 ym995uZA==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=[192.168.1.132]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vsORH-001k2u-I9; Tue, 17 Feb 2026 18:00:43 +0100
Message-ID: <dca6abad-9517-409e-8ad1-df8978d19362@Igalia.com>
Date: Tue, 17 Feb 2026 09:00:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] tool/intel_hdcp: Fix flickering when
 changing HDCP state
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20260216184341.437722-1-John.Harrison@Igalia.com>
 <20260216184341.437722-3-John.Harrison@Igalia.com>
 <DM3PPF208195D8D0D66091BFD0243899168E36DA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <DM3PPF208195D8D0D66091BFD0243899168E36DA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 2/16/26 19:07, Kandpal, Suraj wrote:
>> Subject: [PATCH i-g-t v2 2/2] tool/intel_hdcp: Fix flickering when changing
>> HDCP state
>>
>> The menu system would redraw the screen with a special colour to denote the
> * color
>
>> current HDCP status after a change was requested. However, the screen was
>> immediately redrawn by the player thread with a background colour denoting
> *color
>
>> the requested HDCP level. So all you actually got was a very brief full screen
>> flicker of the background colour.
> *color
>
> You can keep this description here and remove it from the previous patch
But this issue is the entire point of the previous patch. If you remove 
the description as to why a change is being made then the review 
feedback becomes 'why is this change being made?' and 'there is already 
a display of the status - it's in the background colour'.

>
>> As the current HDCP status is now being shown as a separate line of text in
>> the video player's output, there is no need to use the screen background to
>> show the same. So, drop the menu updates once the video player is running to
>> remove the flickering.
>>
>> Also, don't stop the video player thread when HDCP is disabled so that the
>> status update continues (given that the menu thread is no longer redrawing
>> the screen now).
>>
>> v2: Split into two patches (review feedback by Kamil)
>>
>> CC: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> CC: Suraj Kandpal <suraj.kandpal@intel.com>
>> Signed-off-by: John Harrison <John.Harrison@Igalia.com>
>> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> ---
>>   tools/intel_hdcp.c | 34 +++++-----------------------------
>>   1 file changed, 5 insertions(+), 29 deletions(-)
>>
>> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index
>> 8e29c5e32..56ed720cf 100644
>> --- a/tools/intel_hdcp.c
>> +++ b/tools/intel_hdcp.c
>> @@ -102,24 +102,13 @@ static void draw_menu_text(cairo_t *cr, data_t
>> *data)
>>   	}
>>   }
>>
>> -static void draw_menu(data_t *data, const char *status)
>> +static void draw_menu(data_t *data)
>>   {
>>   	cairo_t *cr = igt_get_cairo_ctx(data->fd, &data->fb);
>>
>> -	/* Background color and text color based on HDCP status */
>> -	if (strcmp(status, "INIT") == 0) {
>> -		cairo_set_source_rgb(cr, 0.051, 0.278, 0.631);
>> -		cairo_paint(cr);
>> -		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
>> -	} else if (strcmp(status, "Enabled") == 0) {
>> -		cairo_set_source_rgb(cr, 0.0, 1.0, 0.0);
>> -		cairo_paint(cr);
>> -		cairo_set_source_rgb(cr, 0.0, 0.0, 0.0);
>> -	} else {
>> -		cairo_set_source_rgb(cr, 1.0, 0.0, 0.0);
>> -		cairo_paint(cr);
>> -		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
>> -	}
>> +	cairo_set_source_rgb(cr, 0.051, 0.278, 0.631);
>> +	cairo_paint(cr);
>> +	cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
>>
>>   	draw_menu_text(cr, data);
>>
>> @@ -678,13 +667,12 @@ int main(int argc, char **argv)  {
>>   	data_t data;
>>   	pthread_t tid;
>> -	const char *status = NULL;
>>   	igt_plane_t *primary;
>>
>>   	data.selected_connector = -1;
>>   	test_init(&data);
>>
>> -	draw_menu(&data, "INIT");
>> +	draw_menu(&data);
>>   	primary = igt_output_get_plane_type(data.output,
>> DRM_PLANE_TYPE_PRIMARY);
>>   	igt_plane_set_fb(primary, &data.fb);
>>   	igt_display_commit2(&data.display, COMMIT_ATOMIC); @@ -718,7
>> +706,6 @@ int main(int argc, char **argv)
>>   			enable_hdcp_type(&data, HDCP_TYPE_2_2_TYPE_1);
>>   			break;
>>   		case 5:
>> -			stop_video_player(&data);
> This removal to stop video player should be in it's own patch
>
> As a rule of thumb if you have to add Also in the commit message keep it in a separate patch
Again, the removal of the stop is because of the remove of the menu 
redraw. If you don't do both together then you are introducing a bug 
where disabling HDCP does not result in a display update so the user is 
not aware that anything actually happened. On the kernel side, there is 
an absolute rule that an intermediate patch in a series must not break 
things and require a later patch to fix it again. You can split patches 
up to help with review but they need to be squashed back into an atomic 
change for merge. I would assume the same applies to the IGT tree. And a 
one line change does not seem like it needs the extra work and 
complication of splitting out and squashing back just to make the review 
simpler.

John.

>
> Regards,
> Suraj Kandpal
>
>>   			set_hdcp_prop(&data, CP_UNDESIRED,
>> HDCP_TYPE_2_2_TYPE_1,
>>   				      data.selected_connector);
>>   			data.hdcp_type = HDCP_TYPE_NONE;
>> @@ -727,17 +714,6 @@ int main(int argc, char **argv)
>>   			break;
>>   		}
>>
>> -		if (cmd == 1) {
>> -			draw_menu(&data, "INIT");
>> -		} else {
>> -			status = get_hdcp_status(&data,
>> data.selected_connector);
>> -			draw_menu(&data, status);
>> -		}
>> -
>> -		primary = igt_output_get_plane_type(data.output,
>> DRM_PLANE_TYPE_PRIMARY);
>> -		igt_plane_set_fb(primary, &data.fb);
>> -		igt_display_commit2(&data.display, COMMIT_ATOMIC);
>> -
>>   		usleep(200 * 1000);
>>   	}
>>
>> --
>> 2.43.0

