Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92970C83F09
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 17:05:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E3E10E6B5;
	Tue,  8 Jul 2025 17:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GrG+chaJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2117E10E6B5
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 17:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751994303; x=1783530303;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kISgSRjlKN5pLG1vm++DKa7LjGoDffNPpPppOFmyOrA=;
 b=GrG+chaJ7qOG/PuaAwmHJdTqUVXDbYMEJ9ZBrmwoGvLIYkgDAJjwhCLZ
 qiwGmMYaAv4jbuz9A8xAoQ0ghJVAt5BNqDse5oC8595fWpAsMYqdk8EJK
 h+aAfPi4ygb0NrflJpYOlnTAFrvTbo1OS3B51QBZfZhNNBASf7AvNb8V6
 VvGS4MSlykmtIlKmXjHmlfj65pS21O5eO3UWmM2rTWgWt070hpE90b/Al
 8ybtJ2PkWjtL/CfuUSsw6Axyo7s35VqWg4L5A6annf8ew0NZOMru0KqAV
 C9RgNBZ7yXzZUJY00um7SmxZvn0AURQAeQsXz8ZcjHjOcNQauGm59EJ6P Q==;
X-CSE-ConnectionGUID: EocqxmN3Th+oO5StpXVu9g==
X-CSE-MsgGUID: WpZE4v1zSDWim7QmZKHRpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="57911476"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="57911476"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 10:05:03 -0700
X-CSE-ConnectionGUID: LV9rS1NYT4CCEp0ngYlEHQ==
X-CSE-MsgGUID: 0eg+P8Q4Q3aZB4iuUsr+jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="155179876"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 10:05:01 -0700
Date: Tue, 8 Jul 2025 19:04:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_oa: Look at errno only when system
 calls fail
Message-ID: <20250708170459.hqt3nlzcmbmzmo6n@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 igt-dev@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250708151659.3556357-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250708151659.3556357-1-ashutosh.dixit@intel.com>
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

Hi Ashutosh,
On 2025-07-08 at 08:16:59 -0700, Ashutosh Dixit wrote:
> errno is set only when system calls fail, so it is incorrect to look at
> errno when system calls succeed.
> 

LGTM,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5339
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tests/intel/xe_oa.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index cb59918ef9..724fea73f0 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -1431,7 +1431,7 @@ read_2_oa_reports(int format_id,
>  
>  		while ((ret = read(stream_fd, buf + len, buf_size)) < 0 && errno == EINTR)
>  			;
> -		if (errno == EIO) {
> +		if (ret < 0 && errno == EIO) {
>  			oa_status = get_stream_status(stream_fd);
>  			continue;
>  		}
> @@ -1869,7 +1869,7 @@ static void test_oa_exponents(const struct drm_xe_engine_class_instance *hwe)
>  
>  			while ((ret = read(stream_fd, buf, buf_size)) < 0 && errno == EINTR)
>  				;
> -			if (errno == EIO) {
> +			if (ret < 0 && errno == EIO) {
>  				oa_status = get_stream_status(stream_fd);
>  				continue;
>  			}
> @@ -2532,7 +2532,6 @@ test_buffer_fill(const struct drm_xe_engine_class_instance *hwe)
>  
>  	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
>  
> -	errno = 0;
>  	/* Read 0 bytes repeatedly until you see an EIO */
>  	while (-1 == read(stream_fd, buf, 0)) {
>  		if (errno == EIO) {
> @@ -2607,7 +2606,7 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
>  	       ((len = read(stream_fd, &buf[total_len], buf_size - total_len)) > 0 ||
>  		(len == -1 && (errno == EINTR || errno == EIO)))) {
>  		/* Assert only for default OA buffer size */
> -		if (errno == EIO && !oa_buffer_size) {
> +		if (len < 0 && errno == EIO && !oa_buffer_size) {
>  			oa_status = get_stream_status(stream_fd);
>  			igt_assert(!(oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW));
>  		}
> -- 
> 2.48.1
> 
