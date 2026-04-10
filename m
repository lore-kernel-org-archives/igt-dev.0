Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF894F36B96
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 00:37:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCE510E150;
	Fri, 10 Apr 2026 00:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="XE+dJ0ri";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C1C10E150
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 00:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:From:References:To:Subject:MIME-Version:Date:
 Message-ID:Content-Type:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ex8SA5XsStDvAjdeiAMhjaQuqdzr7jSGC59nzfIApAs=; b=XE+dJ0riKe0j4lCpEugrBXLa4t
 tiOyrcynH7skHcW1Jh4rQmB3yOSlPH1wMBEWDcoUBGVhrUUjFNQWZaa0JOkwTQzV1gjklJQuVnkBN
 ecvREFCOVHdRNP7GBkBOHmGDoyIkxpd0e4LLK4Xa5kKEbYnOxb9u5IiZsmpDCl/7DsJQoaZDcV32z
 7BDiaX2pH55/aMlNbLW2gcarqrWqRss+2Z6/grM9PTW/6HvfLEtdZjJ5+6m+hD607q/lTm6tILFyU
 zsnmFAUwBLBsLMDCU1AlyTwmpyfkW3JhMmSw3Bh5nXyQgywptAD4iDiaOjwLEp49MO8w49NeRhkKz
 W9RnECtQ==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=[192.168.1.133]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1wAzsG-00EAZK-Pw; Fri, 10 Apr 2026 02:37:29 +0200
Content-Type: multipart/alternative;
 boundary="------------bL4JNwsuFYTiqxe51aYZY14G"
Message-ID: <f0f8d0b2-9041-46c1-874e-71c7c4fe35ea@Igalia.com>
Date: Thu, 9 Apr 2026 17:37:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] tool/intel_hdcp: Show actual HDCP status
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
References: <20260216184341.437722-1-John.Harrison@Igalia.com>
 <20260216184341.437722-2-John.Harrison@Igalia.com>
 <DM3PPF208195D8DAFED433B0156A8991F49E36DA@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <852e3018-2ba2-4687-9794-49291636472d@Igalia.com>
 <20260224193044.vf5aauujilkcyth3@kamilkon-DESK.igk.intel.com>
 <8466ebfe-5d07-4330-b87f-d6757a65fadb@Igalia.com>
 <20260316190600.52rtxdxekh5dh6iw@kamilkon-DESK.igk.intel.com>
 <43c906e9-d9bf-432d-89a8-b734442a90f1@Igalia.com>
 <DM3PPF208195D8DEFB0B13D82E69455C33AE348A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <DM3PPF208195D8DEFB0B13D82E69455C33AE348A@DM3PPF208195D8D.namprd11.prod.outlook.com>
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

This is a multi-part message in MIME format.
--------------bL4JNwsuFYTiqxe51aYZY14G
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/23/26 21:27, Kandpal, Suraj wrote:
>> Subject: Re: [PATCH i-g-t v2 1/2] tool/intel_hdcp: Show actual HDCP status
>>
>> @Suraj, ping?
>>
>> On 3/16/26 12:06, Kamil Konieczny wrote:
>>> Hi John,
>>> On 2026-02-24 at 14:31:51 -0800, John Harrison wrote:
>>>> On 2/24/26 11:30, Kamil Konieczny wrote:
>>>>> Hi John,
>>>>> On 2026-02-17 at 08:58:01 -0800, John Harrison wrote:
>>>>>> On 2/16/26 19:00, Kandpal, Suraj wrote:
>>>>>>>> Subject: [PATCH i-g-t v2 1/2] tool/intel_hdcp: Show actual HDCP
>>>>>>>> status
>>>>>>>>
>>>>>>>> The 'video player' showed what the requested HDCP mode was but
>>>>>>>> not the actual status. The menu system does redraw the screen
>>>>>>>> with a special colour to denote the status, but that is
>>>>>>>> immediately overwritten by the player thread. So all you get is a very
>> brief full screen flicker (to be fixed in next patch).
>>>>>>> So we do not want to refer to the next "patch" just mention what this
>> patch is doing.
>>>>>>> Also do not call it a "patch" since once it gets merged it becomes a
>> commit.
>>>>>> But this patch is part of a series and a series of tightly related
>>>>>> patches has always explained what is happening as a whole.
>>>>>> Otherwise, you effectively have this patch/commit saying "this is
>>>>>> totally broken and I'm not doing anything about it".
> This comment still stands maybe misunderstood.
> I meant that in the commit message we do not say this " this patch does this ...."
> But something like "this commit ...." reason is when you merge it really is not a patch
Commits are just a superset of patches that have been accepted into a 
tree. Git is a patch management system. You can cherry-pick a commit 
into a different branch, apply it to a completely separate tree, etc. It 
is very much still a patch.

And to quote the kernel patch submission guidelines 
(https://docs.kernel.org/process/submitting-patches.html):

    If one patch depends on another patch in order for a change to be
    complete, that is OK. Simply note*“this patch depends on patch X”*in
    your patch description.


> It becomes "commit" and you don't want to change the message when you are merging the series.
> Also when you want to refer to the to upcoming patches it needs to be referred as "upcoming/later commits."
>
>>>>>>>> Instead, add the current HDCP status as an extra text line of the
>>>>>>>> video player's output so it is permanently visible and clear.
>>>>>>>>
>>>>>>>> Also, move the enable of HDCP inside the mutex lock with the
>>>>>>>> internal state change. That way, the newly added 'enabled/desired'
>>>>>>>> line does not update in advance of the 'requested' line (due to
>>>>>>>> the video player thread being asynchronous and managing to turn
>>>>>>>> HDCP on while the menu thread is waiting on the mutex lock).
>>>>>>>> v2: Split into two patches (review feedback by Kamil)
>>>>>>> You can just write (Kamil) here
>>>>>>>
>>>>>>>> CC: Santhosh Reddy Guddati<santhosh.reddy.guddati@intel.com>
>>>>>>>> CC: Suraj Kandpal<suraj.kandpal@intel.com>
>>>>>>>> Signed-off-by: John Harrison<John.Harrison@Igalia.com>
>>>>>>>> Acked-by: Kamil Konieczny<kamil.konieczny@linux.intel.com>
>>>>>>>> ---
>>>>>>>>      tools/intel_hdcp.c | 15 +++++++++++++--
>>>>>>>>      1 file changed, 13 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index
>>>>>>>> cd5d2b6be..8e29c5e32
>>>>>>>> 100644
>>>>>>>> --- a/tools/intel_hdcp.c
>>>>>>>> +++ b/tools/intel_hdcp.c
>>>>>>>> @@ -482,6 +482,7 @@ static void *video_player_thread(void *arg)
>>>>>>>>      	char timer_str[32];
>>>>>>>>      	time_t current_time, elapsed;
>>>>>>>>      	int minutes, seconds;
>>>>>>>> +	const char *status = NULL;
>>>>>>>>
>>>>>>>>      	data = (data_t *)arg;
>>>>>>>>      	cur_type = data->hdcp_type;
>>>>>>>> @@ -502,6 +503,8 @@ static void *video_player_thread(void *arg)
>>>>>>>>      			prev_type = cur_type;
>>>>>>>>      		}
>>>>>>>>
>>>>>>>> +		status = get_hdcp_status(data, data-
>>> selected_connector);
>>>>>>>> +
>>>>>>>>      		switch (cur_type) {
>>>>>>>>      		case HDCP_TYPE_1_4:
>>>>>>>>      			bg_r = 0.0; bg_g = 0.7; bg_b = 0.0; @@ -544,10
>> +547,18 @@
>>>>>>>> static void *video_player_thread(void *arg)
>>>>>>>>      		cairo_show_text(cr, timer_str);
>>>>>>>>
>>>>>>>>      		/* Draw HDCP status above timer */
>>>>>>>> +		cairo_set_font_size(cr, font_size);
>>>>>>>> +		cairo_text_extents(cr, status, &ext);
>>>>>>>> +		x = data->width - ext.width - 20;
>>>>>>>> +		y = data->height - ext.height - 20;
>>>>>>>> +
>>>>>>>> +		cairo_move_to(cr, x, y);
>>>>>>>> +		cairo_show_text(cr, status);
>>>>>>>> +
>>>>>>>>      		cairo_set_font_size(cr, font_size);
>>>>>>>>      		cairo_text_extents(cr, hdcp_str, &ext);
>>>>>>>>      		x = data->width - ext.width - 20;
>>>>>>>> -		y = data->height - ext.height - 60;
>>>>>>>> +		y = data->height - ext.height - 120;
>>>>>>>>
>>>>>>>>      		cairo_move_to(cr, x, y);
>>>>>>>>      		cairo_show_text(cr, hdcp_str); @@ -605,8 +616,8 @@
>> static
>>>>>>>> void stop_video_player(data_t *data)
>>>>>>>>
>>>>>>>>      static void enable_hdcp_type(data_t *data, enum hdcp_type type)  {
>>>>>>>> -		set_hdcp_prop(data, CP_DESIRED, type, data-
>>>>>>>>> selected_connector);
>>>>>>>>      		pthread_mutex_lock(&data->lock);
>>>>>>>> +		set_hdcp_prop(data, CP_DESIRED, type, data-
>>>>>>>>> selected_connector);
>>>>>>> Move this change into its own patch logically a different change
>>>>>> But it is not a logically different change. As per the commit
>>>>>> description, the only reason for making this change is because the
>>>>>> video thread is now displaying the HDCP status. Without the display
>>>>>> of the status, it does not matter that the change occurs
>>>>>> asynchronously to that display (because there is nothing for it to
>>>>>> be asynchronous to). So splitting this out into a later patch means
>>>>>> this patch would be introducing a bug and the follow up patch
>>>>> Would it help if this change will be the first one in a series?
>>>>>
>>>>> If yes, then it should go first as a fix. If not, if this one change
>>>>> do not help in anything then imho it should stay in this one bigger
>>>>> change.
>>>> That's the thing, there is no reason for the set_hdcp_prop call to be
>>>> inside the mutex lock without adding the display of the HDCP status
>>>> to the video thread. Hence the reason it was previously not inside the lock.
>>>>
>>>> The lock is protecting the display thread. If the display thread does
>>>> not show HDCP status then changing the status asynchronously to that
>>>> thread is totally fine. But with the changes in this patch to add the
>>>> status to the display thread, having an asynchronous update does
>>>> cause 'flickering' of the display - the 'active' line changes before the
>> 'requested' line does.
>>>> You could move the re-order into it's own private patch. But given
>>>> that it is always best to do the least amount of work inside a lock,
>>>> that patch would have to have a description of 'moving this because
>>>> of changes coming in the next commit'. Which is not ideal. Hence I
>>>> think it is better kept together with the rest of this patch.
>>>>
>>>> Thanks,
>>>> John.
>>> Sound reasonable. Suraj could you please ack or review this series?
>>> Does it improve this tool and works as intended?
>>>
> Currently I am seeing some alignment issues when running the tool.
I don't know what you mean by this? Alignment of the info text on the 
screen?

> Also there can be a better approach to fix the flicker. Ideally we targeted the type to only be set
> When HDCP is enabled but on revisiting the code that does not happen which is the root cause of the flicker issue.
Type meaning content type? I.e. only relevant to HDCP2.2? I'm not seeing 
how that is the root cause of the flicker. The fundamental cause of the 
flicker is that there are two independent threads both attempting to 
draw the entire screen at different times. Having only one thread 
responsible for drawing the display is by far the simplest and most 
robust way to ensure there is no flicker.


> I want set_hdcp_prop type to have a data and status variable which it only changes in the mutex when it makes sure HDCP
> Has been enabled/disabled.
>
> Then let the video player thread take the mutex read these variable and change the buffer color based on the actual status
> Green if enabled and red if disabled. We can have the status ENABLED DESIRED and UNDESIRED written on top not a fan of it but it would make things
> Clearer but not at the bottom right where the HDCP type is written.
I don't get this. Why are you not a fan of reporting the HDCP setting? 
The colour coding is a big visual indicator but if you are wanting to 
drop the other colours and have just red vs green then there is a lot 
more combinations of situations to report than just enabled vs disabled. 
And if you are going to keep the different colour per situation then 
having a text display means you don't have to search the code to find 
what each specific colour means.

Either way, reporting the requested state in addition to the actual 
state is definitely useful when debugging problems - is HDCP not enabled 
because it was not requested (bug in the request path) or because it 
failed (bug in the hardware). Likewise, why not have the desired and 
actual status lines next to each other? Having them at completely 
different places on the screen would just make it harder to read.

Also, unless my changes are going in completely the wrong direction to 
how you want to rework the code, is there any reason to not merge them 
as a quick fix until you or Santhosh have the time to do your rework? 
It's been almost two months since I posted the fix with no other 
alternatives being posted in the meantime.

John.

>
> Santhosh can work on it.
>
> Regards,
> Suraj Kandpal
>    
>>> Thanks in advance!
>>>
>>> Regards,
>>> Kamil
>>>
>>>>> Regards,
>>>>> Kamil
>>>>>
>>>>>> would need a 'Fixes' tag. Which is just pointless for the sake of a
>>>>>> one line delta. Or it could be a prior patch but then it would need
>>>>>> to say 'doing this thing that is pointless now but is required by a
>>>>>> future patch' and you have already said you don't like descriptions
>> referring to future changes.
>>>>>> John.
>>>>>>
>>>>>>> Regards,
>>>>>>> Suraj Kandpal
>>>>>>>
>>>>>>>>      		data->hdcp_type = type;
>>>>>>>>      		data->video_start_time = time(NULL);
>>>>>>>>      		pthread_mutex_unlock(&data->lock);
>>>>>>>> --
>>>>>>>> 2.43.0

--------------bL4JNwsuFYTiqxe51aYZY14G
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 3/23/26 21:27, Kandpal, Suraj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:DM3PPF208195D8DEFB0B13D82E69455C33AE348A@DM3PPF208195D8D.namprd11.prod.outlook.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Subject: Re: [PATCH i-g-t v2 1/2] tool/intel_hdcp: Show actual HDCP status

@Suraj, ping?

On 3/16/26 12:06, Kamil Konieczny wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Hi John,
On 2026-02-24 at 14:31:51 -0800, John Harrison wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 2/24/26 11:30, Kamil Konieczny wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">Hi John,
On 2026-02-17 at 08:58:01 -0800, John Harrison wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">On 2/16/26 19:00, Kandpal, Suraj wrote:
</pre>
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre wrap="" class="moz-quote-pre">Subject: [PATCH i-g-t v2 1/2] tool/intel_hdcp: Show actual HDCP
status

The 'video player' showed what the requested HDCP mode was but
not the actual status. The menu system does redraw the screen
with a special colour to denote the status, but that is
immediately overwritten by the player thread. So all you get is a very
</pre>
                  </blockquote>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">brief full screen flicker (to be fixed in next patch).
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">So we do not want to refer to the next "patch" just mention what this
</pre>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">patch is doing.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">Also do not call it a "patch" since once it gets merged it becomes a
</pre>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">commit.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">But this patch is part of a series and a series of tightly related
patches has always explained what is happening as a whole.
Otherwise, you effectively have this patch/commit saying "this is
totally broken and I'm not doing anything about it".
</pre>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This comment still stands maybe misunderstood.
I meant that in the commit message we do not say this " this patch does this ...."
But something like "this commit ...." reason is when you merge it really is not a patch</pre>
    </blockquote>
    Commits are just a superset of patches that have been accepted into
    a tree. Git is a patch management system. You can cherry-pick a
    commit into a different branch, apply it to a completely separate
    tree, etc. It is very much still a patch.<br>
    <br>
    And to quote the kernel patch submission guidelines
    (<a class="moz-txt-link-freetext" href="https://docs.kernel.org/process/submitting-patches.html">https://docs.kernel.org/process/submitting-patches.html</a>):<br>
    <blockquote><span
style="color: rgb(62, 67, 73); font-family: serif; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">If
        one patch depends on another patch in order for a change to be
        complete, that is OK. Simply note<span> </span></span><strong
style="color: rgb(62, 67, 73); font-family: serif; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">“this
        patch depends on patch X”</strong><span
style="color: rgb(62, 67, 73); font-family: serif; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"><span> </span>in
        your patch description.</span><br>
    </blockquote>
    <br>
    <blockquote type="cite"
cite="mid:DM3PPF208195D8DEFB0B13D82E69455C33AE348A@DM3PPF208195D8D.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">
It becomes "commit" and you don't want to change the message when you are merging the series.
Also when you want to refer to the to upcoming patches it needs to be referred as "upcoming/later commits."

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">
</pre>
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre wrap="" class="moz-quote-pre">Instead, add the current HDCP status as an extra text line of the
video player's output so it is permanently visible and clear.

Also, move the enable of HDCP inside the mutex lock with the
internal state change. That way, the newly added 'enabled/desired'
line does not update in advance of the 'requested' line (due to
the video player thread being asynchronous and managing to turn
HDCP on while the menu thread is waiting on the mutex lock).
v2: Split into two patches (review feedback by Kamil)
</pre>
                  </blockquote>
                  <pre wrap="" class="moz-quote-pre">You can just write (Kamil) here

</pre>
                  <blockquote type="cite">
                    <pre wrap="" class="moz-quote-pre">CC: Santhosh Reddy Guddati <a class="moz-txt-link-rfc2396E" href="mailto:santhosh.reddy.guddati@intel.com">&lt;santhosh.reddy.guddati@intel.com&gt;</a>
CC: Suraj Kandpal <a class="moz-txt-link-rfc2396E" href="mailto:suraj.kandpal@intel.com">&lt;suraj.kandpal@intel.com&gt;</a>
Signed-off-by: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.Harrison@Igalia.com">&lt;John.Harrison@Igalia.com&gt;</a>
Acked-by: Kamil Konieczny <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@linux.intel.com">&lt;kamil.konieczny@linux.intel.com&gt;</a>
---
    tools/intel_hdcp.c | 15 +++++++++++++--
    1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index
cd5d2b6be..8e29c5e32
100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -482,6 +482,7 @@ static void *video_player_thread(void *arg)
    	char timer_str[32];
    	time_t current_time, elapsed;
    	int minutes, seconds;
+	const char *status = NULL;

    	data = (data_t *)arg;
    	cur_type = data-&gt;hdcp_type;
@@ -502,6 +503,8 @@ static void *video_player_thread(void *arg)
    			prev_type = cur_type;
    		}

+		status = get_hdcp_status(data, data-
</pre>
                  </blockquote>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">selected_connector);
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre wrap="" class="moz-quote-pre">+
    		switch (cur_type) {
    		case HDCP_TYPE_1_4:
    			bg_r = 0.0; bg_g = 0.7; bg_b = 0.0; @@ -544,10
</pre>
                  </blockquote>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">+547,18 @@
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre wrap="" class="moz-quote-pre">static void *video_player_thread(void *arg)
    		cairo_show_text(cr, timer_str);

    		/* Draw HDCP status above timer */
+		cairo_set_font_size(cr, font_size);
+		cairo_text_extents(cr, status, &amp;ext);
+		x = data-&gt;width - ext.width - 20;
+		y = data-&gt;height - ext.height - 20;
+
+		cairo_move_to(cr, x, y);
+		cairo_show_text(cr, status);
+
    		cairo_set_font_size(cr, font_size);
    		cairo_text_extents(cr, hdcp_str, &amp;ext);
    		x = data-&gt;width - ext.width - 20;
-		y = data-&gt;height - ext.height - 60;
+		y = data-&gt;height - ext.height - 120;

    		cairo_move_to(cr, x, y);
    		cairo_show_text(cr, hdcp_str); @@ -605,8 +616,8 @@
</pre>
                  </blockquote>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">static
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre wrap="" class="moz-quote-pre">void stop_video_player(data_t *data)

    static void enable_hdcp_type(data_t *data, enum hdcp_type type)  {
-		set_hdcp_prop(data, CP_DESIRED, type, data-
</pre>
                    <blockquote type="cite">
                      <pre wrap="" class="moz-quote-pre">selected_connector);
</pre>
                    </blockquote>
                    <pre wrap="" class="moz-quote-pre">    		pthread_mutex_lock(&amp;data-&gt;lock);
+		set_hdcp_prop(data, CP_DESIRED, type, data-
</pre>
                    <blockquote type="cite">
                      <pre wrap="" class="moz-quote-pre">selected_connector);
</pre>
                    </blockquote>
                  </blockquote>
                  <pre wrap="" class="moz-quote-pre">Move this change into its own patch logically a different change
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">But it is not a logically different change. As per the commit
description, the only reason for making this change is because the
video thread is now displaying the HDCP status. Without the display
of the status, it does not matter that the change occurs
asynchronously to that display (because there is nothing for it to
be asynchronous to). So splitting this out into a later patch means
this patch would be introducing a bug and the follow up patch
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Would it help if this change will be the first one in a series?

If yes, then it should go first as a fix. If not, if this one change
do not help in anything then imho it should stay in this one bigger
change.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">That's the thing, there is no reason for the set_hdcp_prop call to be
inside the mutex lock without adding the display of the HDCP status
to the video thread. Hence the reason it was previously not inside the lock.

The lock is protecting the display thread. If the display thread does
not show HDCP status then changing the status asynchronously to that
thread is totally fine. But with the changes in this patch to add the
status to the display thread, having an asynchronous update does
cause 'flickering' of the display - the 'active' line changes before the
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">'requested' line does.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">
You could move the re-order into it's own private patch. But given
that it is always best to do the least amount of work inside a lock,
that patch would have to have a description of 'moving this because
of changes coming in the next commit'. Which is not ideal. Hence I
think it is better kept together with the rest of this patch.

Thanks,
John.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Sound reasonable. Suraj could you please ack or review this series?
Does it improve this tool and works as intended?

</pre>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Currently I am seeing some alignment issues when running the tool.</pre>
    </blockquote>
    I don't know what you mean by this? Alignment of the info text on
    the screen?<br>
    <br>
    <blockquote type="cite"
cite="mid:DM3PPF208195D8DEFB0B13D82E69455C33AE348A@DM3PPF208195D8D.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">
Also there can be a better approach to fix the flicker. Ideally we targeted the type to only be set
When HDCP is enabled but on revisiting the code that does not happen which is the root cause of the flicker issue.</pre>
    </blockquote>
    Type meaning content type? I.e. only relevant to HDCP2.2? I'm not
    seeing how that is the root cause of the flicker. The fundamental
    cause of the flicker is that there are two independent threads both
    attempting to draw the entire screen at different times. Having only
    one thread responsible for drawing the display is by far the
    simplest and most robust way to ensure there is no flicker.<br>
    <br>
    <br>
    <blockquote type="cite"
cite="mid:DM3PPF208195D8DEFB0B13D82E69455C33AE348A@DM3PPF208195D8D.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">
I want set_hdcp_prop type to have a data and status variable which it only changes in the mutex when it makes sure HDCP
Has been enabled/disabled.

Then let the video player thread take the mutex read these variable and change the buffer color based on the actual status
Green if enabled and red if disabled. We can have the status ENABLED DESIRED and UNDESIRED written on top not a fan of it but it would make things
Clearer but not at the bottom right where the HDCP type is written.</pre>
    </blockquote>
    I don't get this. Why are you not a fan of reporting the HDCP
    setting? The colour coding is a big visual indicator but if you are
    wanting to drop the other colours and have just red vs green then
    there is a lot more combinations of situations to report than just
    enabled vs disabled. And if you are going to keep the different
    colour per situation then having a text display means you don't have
    to search the code to find what each specific colour means.<br>
    <br>
    Either way, reporting the requested state in addition to the actual
    state is definitely useful when debugging problems - is HDCP not
    enabled because it was not requested (bug in the request path) or
    because it failed (bug in the hardware). Likewise, why not have the
    desired and actual status lines next to each other? Having them at
    completely different places on the screen would just make it harder
    to read.<br>
    <br>
    Also, unless my changes are going in completely the wrong direction
    to how you want to rework the code, is there any reason to not merge
    them as a quick fix until you or Santhosh have the time to do your
    rework? It's been almost two months since I posted the fix with no
    other alternatives being posted in the meantime. <br>
    <br>
    John.<br>
    <br>
    <blockquote type="cite"
cite="mid:DM3PPF208195D8DEFB0B13D82E69455C33AE348A@DM3PPF208195D8D.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

Santhosh can work on it.

Regards,
Suraj Kandpal 
  
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Thanks in advance!

Regards,
Kamil

</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">Regards,
Kamil

</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">would need a 'Fixes' tag. Which is just pointless for the sake of a
one line delta. Or it could be a prior patch but then it would need
to say 'doing this thing that is pointless now but is required by a
future patch' and you have already said you don't like descriptions
</pre>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">referring to future changes.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">
John.

</pre>
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">Regards,
Suraj Kandpal

</pre>
                  <blockquote type="cite">
                    <pre wrap="" class="moz-quote-pre">    		data-&gt;hdcp_type = type;
    		data-&gt;video_start_time = time(NULL);
    		pthread_mutex_unlock(&amp;data-&gt;lock);
--
2.43.0
</pre>
                  </blockquote>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------bL4JNwsuFYTiqxe51aYZY14G--
