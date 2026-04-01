Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCC410F6FB7
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 14:46:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F3710EB4D;
	Wed,  1 Apr 2026 14:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PCG1WHS3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E6D10E0CE
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 14:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775054793; x=1806590793;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=xIZsPUjHGcBB5F5IDVF2Z3p7DJZs7X7lAREEXJHNkCA=;
 b=PCG1WHS3wp44BtH2Sc0sWVYZTqnH6I/1J9spJjq0zXYLp0hDXjP1wSBk
 PZq6w3DPTuAHKSz/NHQbn9YJJIPIFqiVq6x17PbdkOAihg8O3HG7zLayQ
 YXR/U8r5RSuRmW4hZ4uB9Z8ROJ6FQn+7MEq1GTZbpAmjXqxoS9Z5syowo
 3pxrQJYtyFd8vqlCJw+7LueJUuVX4F8YH8MV+yHDO13V1wHgnaTJa6zBB
 2GJE4UZ8c7300IoVM5uI77xQ9ZPH4V3bB5shfTXFK7V40Kq8VfcaTXPq2
 RY6TKCnKojbdPR8PqHQei7FeWIPubv3yZ7wbBk3VS/KfHoDvu4sVU4XFi g==;
X-CSE-ConnectionGUID: UUMg1sIHQTGkMhQ7FWHS2Q==
X-CSE-MsgGUID: X97o605FRaeTtB5VMOIsqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75988731"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="75988731"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 07:46:33 -0700
X-CSE-ConnectionGUID: FQ9gJJAdTxGYOSpiH+42Ow==
X-CSE-MsgGUID: yIxKbrymRtKyjeyi2qqNKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="223400441"
Received: from pravik2x-mobl.gar.corp.intel.com (HELO [10.247.196.34])
 ([10.247.196.34])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 07:46:32 -0700
Message-ID: <b3da52de-231c-42f0-8425-6ce6898736c6@intel.com>
Date: Wed, 1 Apr 2026 20:16:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/6] lib/igt_kms: Export get_max_pipe_hdisplay as
 public helper
To: Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
References: <20260401115542.1074290-1-kunal1.joshi@intel.com>
 <20260401115542.1074290-5-kunal1.joshi@intel.com>
 <ce85b64f62910b4c1d571eaf65ff4b9ab090bacd@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <ce85b64f62910b4c1d571eaf65ff4b9ab090bacd@intel.com>
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

Hello Jani,

On 01-04-2026 17:17, Jani Nikula wrote:
> On Wed, 01 Apr 2026, Kunal Joshi <kunal1.joshi@intel.com> wrote:
>> Rename the static get_max_pipe_hdisplay to igt_get_max_pipe_hdisplay
>> and export it as a public API. This function returns the maximum
>> hdisplay a single pipe can drive. Tests like basic-max-non-joiner
>> need this value to distinguish outputs that can reach the single-pipe
>> boundary from those that cannot
>>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> ---
>>   lib/igt_kms.c | 8 ++++----
>>   lib/igt_kms.h | 1 +
>>   2 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index dbd419a9b..961538932 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -6907,12 +6907,12 @@ int igt_get_current_cdclk(int fd)
>>   }
>>   
>>   /**
>> - * get_max_hdisplay:
>> + * igt_get_max_pipe_hdisplay:
>>    * @drm_fd: drm file descriptor
>>    *
>>    * Returns: The maximum hdisplay supported per pipe.
>>    */
>> -static int get_max_pipe_hdisplay(int drm_fd)
>> +int igt_get_max_pipe_hdisplay(int drm_fd)
> This is purely about Intel limitations, isn't it? The name is misleading
> for anything else.
>
> BR,
> Jani.
Correct, Will add intel prefix.

Thanks and Regards
Kunal Joshi
>
>>   {
>>   	int dev_id = intel_get_drm_devid(drm_fd);
>>   
>> @@ -6933,7 +6933,7 @@ static int get_max_pipe_hdisplay(int drm_fd)
>>    */
>>   bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock)
>>   {
>> -	return (mode->hdisplay > get_max_pipe_hdisplay(drm_fd) ||
>> +	return (mode->hdisplay > igt_get_max_pipe_hdisplay(drm_fd) ||
>>   		mode->clock > max_dotclock);
>>   }
>>   
>> @@ -7047,7 +7047,7 @@ bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe)
>>    */
>>   bool igt_ultrajoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock)
>>   {
>> -	return (mode->hdisplay > 2 * get_max_pipe_hdisplay(drm_fd) ||
>> +	return (mode->hdisplay > 2 * igt_get_max_pipe_hdisplay(drm_fd) ||
>>   		mode->clock > 2 * max_dotclock);
>>   }
>>   
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index f994d91d3..2b5196c90 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -1236,6 +1236,7 @@ void igt_sort_connector_modes(drmModeConnector *connector,
>>   bool igt_max_bpc_constraint(igt_display_t *display, igt_crtc_t *crtc,
>>   			    igt_output_t *output, int bpc);
>>   int igt_get_max_dotclock(int fd);
>> +int igt_get_max_pipe_hdisplay(int drm_fd);
>>   int igt_get_max_cdclk(int fd);
>>   int igt_get_current_cdclk(int fd);
>>   bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock);
