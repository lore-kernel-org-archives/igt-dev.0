Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72258CF8863
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 14:58:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103FA10E768;
	Thu, 20 Nov 2025 14:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k2ZSIKOO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE96B10E768
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 14:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763650708; x=1795186708;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=31ZkjXg/8DxYEmH6QhyUqXtIpooyD54vN+AXwgrRzI0=;
 b=k2ZSIKOOSRgmQ9BbJ+MUN3W7etNuxfvaPt80TigUkcuK7WXOeyyXGs2+
 C1MofpfipGFqPkEpbICp7ggc8E/HTtDkoCrceZXOkgNMRMiOVIXXOEC1o
 mAv1C5LNJbZqKTWZpBhB8wdRu+cAAywurQD9TKplJWKNbzhY8vIg3/tEW
 YHxW7xcniwzn8ZsxQHVcwdMQiM4aHpNWUCqtMvKjd2e6hKYLwo6wg5ojT
 TKTGAvSKb1DE54UE1f9TkPwoOenD9YkulLJNfIORq2BFwawOc6DQfLk+g
 cldl2UtWYbKoT5lf7P088nVfmg6ijLlq/fqhmfjeArfT2JCtainnLAhI6 g==;
X-CSE-ConnectionGUID: Eq0smKZnSSCi3UPqmgzkgg==
X-CSE-MsgGUID: eE1vll9fRnOUcY+cbzPwlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69588546"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="69588546"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 06:58:27 -0800
X-CSE-ConnectionGUID: 1GlhPt5FSOiofqZy1nYv6A==
X-CSE-MsgGUID: hSIyvZtzThq+4Ak27VW0Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="196527695"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.6])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 06:58:26 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] lib/igt_kms: Drop the ioctl fallback for CRTC
 id to pipe mapping
In-Reply-To: <aR8gKIbyRdW-sDLU@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1763634045.git.jani.nikula@intel.com>
 <4ee248cad827f7c6ccb2b35544a6571822abe87d.1763634045.git.jani.nikula@intel.com>
 <aR8gKIbyRdW-sDLU@intel.com>
Date: Thu, 20 Nov 2025 16:58:22 +0200
Message-ID: <ecc9d2cbce7b1320b8036b2b0cf383118cfe4a8f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 20 Nov 2025, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Thu, Nov 20, 2025 at 12:23:14PM +0200, Jani Nikula wrote:
>> The kernel support for i915_pipe debugfs has been around for 2=C2=BD yea=
rs in
>> both i915 and xe. Drop the ioctl fallback for simplicity.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  lib/igt_kms.c | 42 ++++++++----------------------------------
>>  1 file changed, 8 insertions(+), 34 deletions(-)
>>=20
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 0ff56653a4a7..714b851e8037 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -1193,24 +1193,15 @@ void kmstest_dump_mode(drmModeModeInfo *mode)
>>  }
>>=20=20
>>  /*
>> - * With non-contiguous pipes display, crtc mapping is not always same
>> - * as pipe mapping, In i915 pipe is enum id of i915's crtc object.
>> - * hence allocating upper bound igt_pipe array to support non-contiguos
>> - * pipe display and reading pipe enum for a crtc using GET_PIPE_FROM_CR=
TC_ID
>> - * ioctl for a pipe to do pipe ordering with respect to crtc list.
>> + * The hardware pipe may be different from the CRTC index. Figure out t=
he CRTC
>> + * index to pipe mapping from the debugfs.
>>   */
>> -static int __intel_get_pipe_from_crtc_id(int fd, int crtc_id, int crtc_=
idx)
>> +static int __intel_get_pipe_from_crtc_index(int fd, int crtc_idx)
>>  {
>>  	char buf[2];
>>  	int debugfs_fd, res =3D 0;
>> +	char pipe;
>>=20=20
>> -	/*
>> -	 * No GET_PIPE_FROM_CRTC_ID ioctl support for XE. Instead read
>> -	 * from the debugfs "i915_pipe".
>> -	 *
>> -	 * This debugfs is applicable for both i915 & XE. For i915, still
>> -	 * we can fallback to ioctl method to support older kernels.
>> -	 */
>>  	debugfs_fd =3D igt_debugfs_pipe_dir(fd, crtc_idx, O_RDONLY);
>>=20=20
>>  	if (debugfs_fd >=3D 0) {
>> @@ -1218,26 +1209,11 @@ static int __intel_get_pipe_from_crtc_id(int fd,=
 int crtc_id, int crtc_idx)
>>  		close(debugfs_fd);
>>  	}
>>=20=20
>> -	if (res <=3D 0) {
>> -		/* Fallback to older ioctl method. */
>> -		if (is_i915_device(fd)) {
>> -			struct drm_i915_get_pipe_from_crtc_id get_pipe;
>> -
>> -			get_pipe.pipe =3D 0;
>> -			get_pipe.crtc_id =3D  crtc_id;
>> +	igt_assert_f(res > 0, "Failed to read the debugfs i915_pipe.\n");
>>=20=20
>> -			do_ioctl(fd, DRM_IOCTL_I915_GET_PIPE_FROM_CRTC_ID,
>> -				 &get_pipe);
>> +	igt_assert_eq(sscanf(buf, "%c", &pipe), 1);
>>=20=20
>> -			return get_pipe.pipe;
>> -		} else
>> -			igt_assert_f(false, "XE: Failed to read the debugfs i915_pipe.\n");
>> -	} else {
>> -		char pipe;
>> -
>> -		igt_assert_eq(sscanf(buf, "%c", &pipe), 1);
>> -		return kmstest_pipe_to_index(pipe);
>> -	}
>> +	return kmstest_pipe_to_index(pipe);
>>  }
>>=20=20
>>  /**
>> @@ -2985,9 +2961,7 @@ void igt_display_require(igt_display_t *display, i=
nt drm_fd)
>>=20=20
>>  	for (i =3D 0; i < resources->count_crtcs; i++) {
>>  		igt_pipe_t *pipe;
>> -		int pipe_enum =3D (is_intel_dev)?
>> -			__intel_get_pipe_from_crtc_id(drm_fd,
>> -						      resources->crtcs[i], i) : i;
>> +		int pipe_enum =3D is_intel_dev ? __intel_get_pipe_from_crtc_index(drm=
_fd, i) : i;
>>=20=20
>>  		pipe =3D &display->pipes[pipe_enum];
>>  		pipe->pipe =3D pipe_enum;
>
> It looked to me like this thing also get directly fed into bunch of
> places that expect a crtc index. So I suspect you need to change
> this to be the index as well.

In patch 1, I started with the low-hanging fruit that I could actually
check. This in turn is used all over the place, and some might actually
require the physical pipe. Need to double check them. I'm also not sure
why we reorder display->pipes[] in physical pipes order, and does it
really matter.

So I'm thinking these two patches make forward progress, then need to
start identifying places that need the physical pipe. Maybe we should
add pipe->physical_pipe or pipe->hw_pipe or something, and migrate the
ones that need it. Which is a bit silly considering that pipe->pipe is
documented as /* ID of a hardware pipe */ even if it's used as crtc
index, and there's the separate pipe->crtc_offset member corresponding
to crtc_index.

I've looked around at IGT, and I'm basically on the verge of giving up
hope of changing the meaning of "pipe" to anything other than CRTC
index. It's just all over the place. I guess up to the IT maintainers in
the end.

BR,
Jani.




--=20
Jani Nikula, Intel
