Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBE0CFD315
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 08:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763C410E2E4;
	Tue, 25 Nov 2025 08:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gJRAPJH5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7352410E2E4
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 08:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764060453; x=1795596453;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XTEYFS3bW0mMvhs1D8G1u6q+LPqesOQQX9pYGM/3nVU=;
 b=gJRAPJH567roeUTZ8nLZG1xY91nwvNp+Cu2hmqzIjTTFeut/gRFdVqp2
 WjTt4vsNb9hdUaFern+X4/+jbv0J3TpC8DdjPgZFf6GJUR+QIY4eZzu3d
 48RVvMFN1CL/ReLhhmOGSyvzdjIb5x+VsZdec6fEaYEg8oCMuIm7KM4CG
 Nl8I4hzJtY6VvTmDWes+LGoDck/A+oR+t7E2bUSrEpfMmsTc8tXIS3ERl
 XM3iE5dEGRcr6QvozvzG66T0jWiaXc6PWSmrpTjNHZc/cHEOLfny1Snnh
 CE/ELOpq66MirYqCnD+gJUTpFO0jgj9U5n7forT1EuEbz/bvcQB1Wq8no g==;
X-CSE-ConnectionGUID: pGnwyCdQTI65LjmuZ0g2GA==
X-CSE-MsgGUID: Liyf6F78TWS6BLRogdbU4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="69929018"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="69929018"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 00:47:33 -0800
X-CSE-ConnectionGUID: cfxemxCkRTK95izOcrNAvg==
X-CSE-MsgGUID: Tdy6KJuYTEeGSWLK0IU8BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="223549581"
Received: from soc-dcgdq34.clients.intel.com (HELO [10.66.97.209])
 ([10.66.97.209])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 00:47:31 -0800
Message-ID: <605bf8f9-4517-4522-a428-9a9587c49026@intel.com>
Date: Tue, 25 Nov 2025 14:17:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 01/35] lib/igt_pipe_crc: separate CRTC index from
 pipe
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
References: <20251123152412.599801-1-kunal1.joshi@intel.com>
 <20251123152412.599801-2-kunal1.joshi@intel.com> <aSSu4eSzuKMa4R2q@intel.com>
 <235aeb5e8949b83daf535586475fe047714458a9@intel.com>
 <aSTGQa80OSZSiLty@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <aSTGQa80OSZSiLty@intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hello Jani and Ville,

Thanks for commenting on the patch,

On 25-11-2025 02:25, Ville Syrjälä wrote:
> On Mon, Nov 24, 2025 at 10:31:31PM +0200, Jani Nikula wrote:
>> On Mon, 24 Nov 2025, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
>>> On Sun, Nov 23, 2025 at 08:53:38PM +0530, Kunal Joshi wrote:
>>>> The pipe CRC helpers have historically treated the logical pipe enum as if it
>>>> were the CRTC index, and used that directly in the debugfs paths under
>>>> crtc-<index>/crc/. This only works as long as crtc_index == pipe, which is no
>>>> longer guaranteed once pipes are virtualized, fused off, or reordered.
>>>>
>>>> Introduce an explicit CRTC index in igt_pipe_crc and wire it through the
>>>> debugfs control/data paths. Add new constructors that take either a raw CRTC
>>>> index or an igt_display+pipe pair, and update kms_pipe_crc_basic to use the
>>>> display-aware helper so it always uses display->pipes[pipe].crtc_offset.
>>>>
>>>> Keep the existing igt_pipe_crc_new(fd, pipe, ...) API as a thin wrapper that
>>>> still assumes crtc_index == pipe for now so existing callers continue to work.
>>>> This is a first incremental step towards fully decoupling CRTC indices from
>>>> hardware pipes across the KMS tests.
>>>> ---
>>>>   lib/igt_pipe_crc.c         | 39 +++++++++++++++++++++++++++++++++++---
>>>>   lib/igt_pipe_crc.h         |  6 ++++++
>>>>   tests/kms_pipe_crc_basic.c | 12 ++++++------
>>>>   3 files changed, 48 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/lib/igt_pipe_crc.c b/lib/igt_pipe_crc.c
>>>> index 866bf2881..24aa72bcc 100644
>>>> --- a/lib/igt_pipe_crc.c
>>>> +++ b/lib/igt_pipe_crc.c
>>>> @@ -190,6 +190,8 @@ struct _igt_pipe_crc {
>>>>   	int flags;
>>>>   
>>>>   	enum pipe pipe;
>>> This whole pipe thing needs to go away.
>> I think there's basically two approaches:
>>
>> 1) Just assume pipe == crtc_index everywhere, and single out the cases
>>     where the "physical" pipe is actually something else. Use a separate
>>     enum for the physical pipe. The downside is that this will continue
>>     to confuse and trick people, because the kernel has largely migrated
>>     away from this.
>>
>> 2) Roll up the sleeves, and call things by their real names. enum pipe
>>     needs to mean the physical pipe, and everything else needs to be
>>     converted to crtc_index. And where the physical pipe is not needed,
>>     which is most places, it needs to be removed. Like here.
>>
>> I'm in favour of 2, if the churn it causes is acceptable. Personally I
>> think it's worth it to clarify a lot of things all over the place.
> Yeah, I think we want as much as possible to just use igt_pipe_t and
> rename it to igt_crtc_t. I wrote a bunch of cocci for that as well.
> Looks like my current wip branch has about 40 patches or so. That's
> pretty much all pure refactoring. After that things will get harder
> and probably will involve manual work to convert most of the tests
> to iterate over igt_crtc_t instead of pipes.

Yeah makes sense,

>>>> +	/* CRTC index in drmModeRes.crtcs used for debugfs paths. */
>>>> +	unsigned int crtc_index;
>>>>   	char *source;
>>>>   };
>>>>   
>>>> @@ -215,7 +217,8 @@ void igt_require_pipe_crc(int fd)
>>>>   }
>>>>   
>>>>   static igt_pipe_crc_t *
>>>> -pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
>>>> +pipe_crc_new_internal(int fd, enum pipe pipe, unsigned int crtc_index,
>>>> +		     const char *source, int flags)
>>>>   {
>>>>   	igt_pipe_crc_t *pipe_crc;
>>>>   	char buf[128];
>>>> @@ -235,7 +238,7 @@ pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
>>>>   	pipe_crc = calloc(1, sizeof(struct _igt_pipe_crc));
>>>>   	igt_assert(pipe_crc);
>>>>   
>>>> -	sprintf(buf, "crtc-%d/crc/control", pipe);
>>>> +	sprintf(buf, "crtc-%u/crc/control", crtc_index);
>>>>   	pipe_crc->ctl_fd = openat(debugfs, buf, O_WRONLY);
>>>>   	igt_assert(pipe_crc->ctl_fd != -1);
>>>>   
>>>> @@ -243,6 +246,7 @@ pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
>>>>   	pipe_crc->fd = fd;
>>>>   	pipe_crc->dir = debugfs;
>>>>   	pipe_crc->pipe = pipe;
>>>> +	pipe_crc->crtc_index = crtc_index;
>>>>   	pipe_crc->source = strdup(env_source);
>>>>   	igt_assert(pipe_crc->source);
>>>>   	pipe_crc->flags = flags;
>>>> @@ -250,6 +254,15 @@ pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
>>>>   	return pipe_crc;
>>>>   }
>>>>   
>>>> +static igt_pipe_crc_t *
>>>> +pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
>>>> +{
>>>> +	/* Existing callers pass a logical pipe; assume crtc_index == pipe
>>>> +	 * until they are converted to use the new helpers.
>>>> +	 */
>>>> +	return pipe_crc_new_internal(fd, pipe, pipe, source, flags);
>>>> +}
>>>> +
>>>>   /**
>>>>    * igt_pipe_crc_new:
>>>>    * @fd: fd of the device
>>>> @@ -288,6 +301,26 @@ igt_pipe_crc_new_nonblock(int fd, enum pipe pipe, const char *source)
>>>>   	return pipe_crc_new(fd, pipe, source, O_RDONLY | O_NONBLOCK);
>>>>   }
>>>>   
>>>> +igt_pipe_crc_t *
>>>> +igt_pipe_crc_new_for_crtc(int fd, unsigned int crtc_index,
>>>> +			 const char *source)
>>>> +{
>>>> +	return pipe_crc_new_internal(fd, PIPE_A, crtc_index, source, O_RDONLY);
>>>> +}
>>>> +
>>>> +igt_pipe_crc_t *
>>>> +igt_pipe_crc_new_for_display(struct igt_display *display, enum pipe pipe,
>>>> +			     const char *source)
>>>> +{
>>> I think it's better to just pass in the whole igt_pipe_t.
>>> In fact I already wrote the cocci for that, but I need to
>>> get a bunch of refactroing done in before it can be done.
>>> I already posted two small refactoring series, but more
>>> will be needed.
>> That with the s/igt_pipe_t/igt_crtc_t/ rename would be great.
>>
>> There are a few special cases like tools/intel_display_crc.c which
>> currently don't have any igt_pipe_t available. But I think the parameter
>> for it should anyway be crtc_index not pipe.
> Yeah, looks like what I did in my wip branch is s/pipe/crtc_index/
> for the current stuff, and then add igt_crtc_crc_new*(igt_crtc_t*, ...)
> wrappers around that.
>
>> Hmm, looking at the tool, how does it even work at all? Where does
>> ctx.fd come from? I digress.
> Looks completely broken to me. Looking at the git log, passing vs.
> not passing the fd to the crc stuff has been applied and reverted
> a few times. Personally I just frob the crc debugfs directly
> whenever I need to grab CRCs outside of igts, so IMO we could just
> nuke the tool.
Please let me know if i can drop this series.
And also if you need me to start working on anything specific that maybe 
required post your series.

Thanks and Regards
Kunal Joshi
