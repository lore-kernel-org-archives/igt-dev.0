Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7259F108E1CD
	for <igt-dev@archiver.kernel.org>; Thu, 19 Mar 2026 10:17:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FDD10E145;
	Thu, 19 Mar 2026 10:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.b="qIduRgFN";
	dkim-atps=neutral
X-Greylist: delayed 485 seconds by postgrey-1.36 at gabe;
 Thu, 19 Mar 2026 08:31:24 UTC
Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com
 [162.62.57.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98F310E8E8
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Mar 2026 08:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1773909080;
 bh=WA+vhFOmspInxmXIjZptELW785lb3pMRkeaBKvnyeYU=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To;
 b=qIduRgFNBGlbAABXYHBWdZneSGNRbeVNspJ6/q3jNdT9ldRnhxm1STW6hgjXoRrsM
 NxLL+fHj7J/exPxtQP10oTmZaYfJI4UW/y/7XK0d3eSar3txGh6fu8r0nZwT+KolP+
 JTEjz5YoDcDftE1ZjMd8IXS5nyfLujS31CPmeons=
Received: from [192.168.222.132] ([222.209.98.171])
 by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
 id 403A36EF; Thu, 19 Mar 2026 16:16:03 +0800
X-QQ-mid: xmsmtpt1773908163tyhrp5g6n
Message-ID: <tencent_B3C0E454F1807377EB51D21A2CB4D9E91A06@qq.com>
X-QQ-XMAILINFO: OdpilHhB3DiuBZxcCFH2bGSfMne4GtOG8pJEE6yDeNEn4HhaHI9+F8jZV41AgX
 INbCHr4LDAl+omv59EdXXU/ycTUMy+1eYwD9YB1RPl2ntDAkws39+x47ugp0SM3piCPwoCB3iRcQ
 tK04u3yP2NQAhorhvaUpaaIRFznF7nCYu9xp1O6quqqgEkbbSYNPCT3jbMNdS5m90s0SatIpkd7G
 JJsJ54VUDLMeqfnal66Ag9E7hcB7lSoZPGCqZDQCH10JHoQULsUiLdgrXSPQ9pHxPZF9sVmqbyWu
 tSwU/3oUKh0wXA0SdBTMA8TAHgyBFFvxncCa4nVYhJxM/xk2eGS+0mjEYL6wU33glwX0vLmV5Psn
 na2DVyv9TYAs6Frc0TsXsOQGWC3xTB+IBBHgBLdvsfnEqvYuot+PU8sWIiHqeHM0czf5HcCHV7HR
 S9Fhe6nGjcKkbTRMP5kre5qquOSlg17NNH7qCkHnkGh/ueVdJhuEIs9Oqy6TT/2lTcduj41zTy6v
 lKEs7Tbxr2NQQmVKVmi3obtgK00MliV2Ci8Pr1J4R9fwR8wEw/70894EnQudyV4+EfXkh1sw9FWO
 5mJ3ItEqbbVDdrGxRLx+Id4sHkmKmvCztu5we8Jhz5RpGoL63MpfJL+DuTNvwuF9e7LKolxgG+8s
 lH+TmHBf0bQA0ZPMGf/0/+zCG2GEb717bqd4MmnjTcWyZCBWhBrHR94dbPHxjBG0MwgzSMa+gmS4
 A6+nNyJpq01QobX9p7e5XDxVivJpG1dqcDmR8UVB7igqt/98K8IW6iXmb1q7zzvmXOmotBNZH1nP
 Ps5uy9CBB+J2TemnqYKefIxr24WmJwa9TzhV6jYPkd6Lg9oDvsmu9pcvZenhWy/6BuoxZwWrOxu8
 Tw7LIG0sQ2nuHniMsBfKSng1RP72r5Ogv72QgBzlK4afU+mHfex0gNfOWOy5HdXNE7YknG7s1jyg
 RLq5TttwRUQtS7NUcwvvVYEd58KgJBZHvejTxdWGUJOxdu9Vdk/C9Rajswq3jjsTjqU4UumDJlow
 3HxMQnFdiM9CW9AyBHxcnV0RoBdSpecuxYgxSfxNYo/wsssZa9x/eZFmvH7Yc=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-OQ-MSGID: <232698f3-68ac-4966-b97f-dee1cb0498fb@foxmail.com>
Date: Thu, 19 Mar 2026 01:16:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_plane: Allow planar-pixel-format-settings
 to pass on VKMS
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>
References: <tencent_009881AF754F22143F3943B76A2645C05A0A@qq.com>
 <20260204122952.gl5jttuyhdmr2mm4@kamilkon-DESK.igk.intel.com>
 <37dc23bc-8be4-4d83-beae-1e464530667d@intel.com>
Content-Language: en-US
From: Renjun Wang <renjunw0@foxmail.com>
Cc: renjunw0@foxmail.com
In-Reply-To: <37dc23bc-8be4-4d83-beae-1e464530667d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 19 Mar 2026 10:17:52 +0000
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

Hi Sharma,

The version 2 for this patch is send by Kamil Koneczny[1], and have CI 
results. Do I need to send version 2 patch again?


[1] 
https://lore.kernel.org/igt-dev/20260216185231.164130-1-kamil.konieczny@linux.intel.com/


Best Regards,

On 2/20/26 04:09, Sharma, Swati2 wrote:
> Hi Renjun,
>
> On 04-02-2026 05:59 pm, Kamil Konieczny wrote:
>> Hi Renjun,
>> On 2026-02-01 at 14:11:43 +0800, Renjun Wang wrote:
>>> Set expected_rval to 0 for planar-pixel-format-settings tests when
>>> running on VKMS driver. VKMS currently accepts odd width/height for
>>> NV12, odd horizontal panning for NV12, and odd vertical panning for
>>> P016 formats.
>>>
>>> Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
>>> ---
>>>   tests/kms_plane.c | 25 +++++++++++++------------
>>>   1 file changed, 13 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
>>> index 21d80847c..57adfe199 100644
>>> --- a/tests/kms_plane.c
>>> +++ b/tests/kms_plane.c
>>> @@ -1313,11 +1313,9 @@ static void test_planar_settings(data_t *data)
>>>       int devid;
>>>       int display_ver = -1;
>>>       int rval;
>>> +    bool is_intel = false;
>>> +    bool is_vkms = false;
>>>   -    /*
>>> -     * If here is added non-intel tests below require will need to be
>>> -     * changed to if(..)
>>> -     */
>>>       igt_require_f(data->display.is_atomic, "Atomic mode-set not 
>>> supported\n");
>>>       if (is_intel_device(data->drm_fd)) {
>>>           igt_require_intel(data->drm_fd);
>>> @@ -1325,6 +1323,9 @@ static void test_planar_settings(data_t *data)
>>>           igt_require(intel_display_ver(devid) >= 9);
>>>           display_ver = intel_display_ver(devid);
>>>           igt_require(display_ver >= 9);
>>> +        is_intel = true;
>>> +    } else if (is_vkms_device(data->drm_fd)) {
>>> +        is_vkms = true;
>>>       }
>>>         output = igt_get_single_output_for_pipe(&data->display, pipe);
>>> @@ -1337,12 +1338,12 @@ static void test_planar_settings(data_t *data)
>>>                     DRM_MODE_ATOMIC_ALLOW_MODESET,
>>>                     NULL);
>>>   -    /* test against intel_plane_check_src_coordinates() in i915 */
>> I am not sure if removing this is proper, maybe move it just below
>> before 'if((is_intel...'
>> Same concern below, when you remove other i915 comments.
>>
>> +cc Karthik and Swati
>> Cc: Karthik B S <karthik.b.s@intel.com>
>> Cc: Swati Sharma <swati2.sharma@intel.com>
>>
>>> +    /* Test odd width for NV12 format */
>> Do we need it here, when just below is DRM_FORMAT_NV12?
>> Or is it 'odd width' that is worth pointing out?
>> Same concern below.
>>
>> Overall looks good. Btw Karthik or Swati, please find someone
>> from KMS team and send this for testing, I will ack it then.
>>
>> Regards,
>> Kamil
>
> Agree with Kamil, lets keep existing comments as it is. Please add 
> your changes on top of those.
>
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14559/shards-all.html?testfilter=planar-pixel-format-settings 
>
>
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14559/shards-all.html?testfilter=planar-pixel-format-settings 
>
>
> There isn't any regression on CI results, results are okay.
>
>>
>>>       if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>>>                        DRM_FORMAT_MOD_LINEAR)) {
>>>           int expected_rval = -EINVAL;
>>>   -        if (display_ver >= 20)
>>> +        if ((is_intel && display_ver >= 20) || is_vkms)
>>>               expected_rval = 0;
>>>             igt_create_fb(data->drm_fd, 257, 256,
>>> @@ -1358,12 +1359,12 @@ static void test_planar_settings(data_t *data)
>>>           igt_debug("Odd width NV12 framebuffer test skipped\n");
>>>       }
>>>   -    /* test against intel_plane_check_src_coordinates() in i915 */
>>> +    /* Test odd height for NV12 format */
>>>       if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>>>                        DRM_FORMAT_MOD_LINEAR)) {
>>>           int expected_rval = -EINVAL;
>>>   -        if (display_ver >= 20 && display_ver < 35)
>>> +        if ((is_intel && display_ver >= 20 && display_ver < 35) || 
>>> is_vkms)
>>>               expected_rval = 0;
>>>             igt_create_fb(data->drm_fd, 256, 257,
>>> @@ -1378,13 +1379,12 @@ static void test_planar_settings(data_t *data)
>>>       } else {
>>>           igt_debug("Odd height NV12 framebuffer test skipped\n");
>>>       }
>>> -
>>> -    /* test against intel_plane_check_src_coordinates() in i915 */
>>> +    /*Test odd horizontal panning for NV12 format */
>>>       if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>>>                        DRM_FORMAT_MOD_LINEAR)) {
>>>           int expected_rval = -EINVAL;
>>>   -        if (display_ver >= 35)
>>> +        if ((is_intel && display_ver >= 35) || is_vkms)
>>>               expected_rval = 0;
>>>             igt_create_fb(data->drm_fd, 810, 590,
>>> @@ -1401,11 +1401,12 @@ static void test_planar_settings(data_t *data)
>>>           igt_debug("Odd horizontal pan NV12 framebuffer test 
>>> skipped\n");
>>>       }
>>>   +    /* Test odd vertical panning for P016 format */
>>>       if (igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
>>>                           DRM_FORMAT_MOD_LINEAR)) {
>>>           int expected_rval = -EINVAL;
>>>   -        if (display_ver >= 20 && display_ver < 35)
>>> +        if ((is_intel && display_ver >= 20 && display_ver < 35) || 
>>> is_vkms)
>>>               expected_rval = 0;
>>>             igt_create_color_fb(data->drm_fd, 256, 260,
>>> -- 
>>> 2.47.3
>>>

