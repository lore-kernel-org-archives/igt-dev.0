Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC1CE909DD
	for <igt-dev@archiver.kernel.org>; Tue, 17 Feb 2026 16:58:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6AA10E51E;
	Tue, 17 Feb 2026 16:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="jdCoJmQN";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A4E10E51E
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Feb 2026 16:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uOGkXAWZjrAW3aIvkHo6cjV+7Q0DHn4CYrVZItJdso0=; b=jdCoJmQNOxMAgHQTROGg5iKb3w
 939LW9Sv5ddvCQe+1iMUyoS9q716qu9Yx5q+7et1+HTeprbOjHa6PoHIqdEbCOsRB6gtAsaBidIi/
 NmXdbv/bogsRpI76AQDwdkZiQKHJKjYnC8pe04P7HjzMRo3elU6Gd+yDeXWu/j/nS3hcyr+6XmZCP
 XW2G7/GLm7Ss9t1ZNZUV13v5PGTFtrbBdFJ5LNJbC1dky58AhqpMp5fFekmQ/1ty06BYetYLCoVP8
 qb2EMrGgZ2QeKCosjkXStrDp+tEZzzlqxvI7osTw81iDcFLnUuENr1xni6XbrGs0Yk1tro5X/PRpV
 9Yqf2CIg==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=[192.168.1.132]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vsOOk-001jzT-2C; Tue, 17 Feb 2026 17:58:06 +0100
Message-ID: <852e3018-2ba2-4687-9794-49291636472d@Igalia.com>
Date: Tue, 17 Feb 2026 08:58:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] tool/intel_hdcp: Show actual HDCP status
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20260216184341.437722-1-John.Harrison@Igalia.com>
 <20260216184341.437722-2-John.Harrison@Igalia.com>
 <DM3PPF208195D8DAFED433B0156A8991F49E36DA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <DM3PPF208195D8DAFED433B0156A8991F49E36DA@DM3PPF208195D8D.namprd11.prod.outlook.com>
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

On 2/16/26 19:00, Kandpal, Suraj wrote:
>> Subject: [PATCH i-g-t v2 1/2] tool/intel_hdcp: Show actual HDCP status
>>
>> The 'video player' showed what the requested HDCP mode was but not the
>> actual status. The menu system does redraw the screen with a special colour to
>> denote the status, but that is immediately overwritten by the player thread. So
>> all you get is a very brief full screen flicker (to be fixed in next patch).
> So we do not want to refer to the next "patch" just mention what this patch is doing.
> Also do not call it a "patch" since once it gets merged it becomes a commit.
But this patch is part of a series and a series of tightly related 
patches has always explained what is happening as a whole. Otherwise, 
you effectively have this patch/commit saying "this is totally broken 
and I'm not doing anything about it".

>
>> Instead, add the current HDCP status as an extra text line of the video player's
>> output so it is permanently visible and clear.
>>
>> Also, move the enable of HDCP inside the mutex lock with the internal state
>> change. That way, the newly added 'enabled/desired'
>> line does not update in advance of the 'requested' line (due to the video player
>> thread being asynchronous and managing to turn HDCP on while the menu
>> thread is waiting on the mutex lock).
>> v2: Split into two patches (review feedback by Kamil)
> You can just write (Kamil) here
>
>> CC: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> CC: Suraj Kandpal <suraj.kandpal@intel.com>
>> Signed-off-by: John Harrison <John.Harrison@Igalia.com>
>> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> ---
>>   tools/intel_hdcp.c | 15 +++++++++++++--
>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index cd5d2b6be..8e29c5e32
>> 100644
>> --- a/tools/intel_hdcp.c
>> +++ b/tools/intel_hdcp.c
>> @@ -482,6 +482,7 @@ static void *video_player_thread(void *arg)
>>   	char timer_str[32];
>>   	time_t current_time, elapsed;
>>   	int minutes, seconds;
>> +	const char *status = NULL;
>>
>>   	data = (data_t *)arg;
>>   	cur_type = data->hdcp_type;
>> @@ -502,6 +503,8 @@ static void *video_player_thread(void *arg)
>>   			prev_type = cur_type;
>>   		}
>>
>> +		status = get_hdcp_status(data, data->selected_connector);
>> +
>>   		switch (cur_type) {
>>   		case HDCP_TYPE_1_4:
>>   			bg_r = 0.0; bg_g = 0.7; bg_b = 0.0;
>> @@ -544,10 +547,18 @@ static void *video_player_thread(void *arg)
>>   		cairo_show_text(cr, timer_str);
>>
>>   		/* Draw HDCP status above timer */
>> +		cairo_set_font_size(cr, font_size);
>> +		cairo_text_extents(cr, status, &ext);
>> +		x = data->width - ext.width - 20;
>> +		y = data->height - ext.height - 20;
>> +
>> +		cairo_move_to(cr, x, y);
>> +		cairo_show_text(cr, status);
>> +
>>   		cairo_set_font_size(cr, font_size);
>>   		cairo_text_extents(cr, hdcp_str, &ext);
>>   		x = data->width - ext.width - 20;
>> -		y = data->height - ext.height - 60;
>> +		y = data->height - ext.height - 120;
>>
>>   		cairo_move_to(cr, x, y);
>>   		cairo_show_text(cr, hdcp_str);
>> @@ -605,8 +616,8 @@ static void stop_video_player(data_t *data)
>>
>>   static void enable_hdcp_type(data_t *data, enum hdcp_type type)  {
>> -		set_hdcp_prop(data, CP_DESIRED, type, data-
>>> selected_connector);
>>   		pthread_mutex_lock(&data->lock);
>> +		set_hdcp_prop(data, CP_DESIRED, type, data-
>>> selected_connector);
> Move this change into its own patch logically a different change
But it is not a logically different change. As per the commit 
description, the only reason for making this change is because the video 
thread is now displaying the HDCP status. Without the display of the 
status, it does not matter that the change occurs asynchronously to that 
display (because there is nothing for it to be asynchronous to). So 
splitting this out into a later patch means this patch would be 
introducing a bug and the follow up patch would need a 'Fixes' tag. 
Which is just pointless for the sake of a one line delta. Or it could be 
a prior patch but then it would need to say 'doing this thing that is 
pointless now but is required by a future patch' and you have already 
said you don't like descriptions referring to future changes.

John.

>
> Regards,
> Suraj Kandpal
>
>>   		data->hdcp_type = type;
>>   		data->video_start_time = time(NULL);
>>   		pthread_mutex_unlock(&data->lock);
>> --
>> 2.43.0

