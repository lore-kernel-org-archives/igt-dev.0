Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5D0CA5FC5
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 13:55:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E3510F428;
	Wed, 30 Sep 2026 13:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWow9WX2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC5110F426
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 13:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790776512; x=1822312512;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mpfDQxZZ6U0KGAz8WUSIx2SP82HtYfZEJ4XeYW3Jugg=;
 b=dWow9WX2kYRMEItOi1zteUmpjIiDLJmQXq1vG0ulsJHjlboZx/Q6Br4v
 jWEaFojTneTu3UCzodG2Px2DBH93zNhhyh6FtEoiy44r69QJNv+qvJe95
 isQxY9yU5DRrSIOplAzQzO/+XgWW6tzObVxBEoaE2C16iyAOJbAzNgoAV
 BHZgrFsRmYI9S1k4pHE9N+pYMMjWAyyu6VT4BMmcsuQbNwEww7ZvzxToW
 vj/4byY4cOMc3A6Klv6NP2TNgCJcwMmWUFtYN2cwCpzMbIDoFbxMqQiWy
 zDfVwjyTUVqYsrKcDHl9HWCBfiGDbYGDGl8Fzv+R2hW52KlzEw1HLRjpm A==;
X-CSE-ConnectionGUID: QOqAAodtTsWQgSgEXQDK/Q==
X-CSE-MsgGUID: kepI7DKWTn2KYL132DO3PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91531581"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="91531581"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 06:55:12 -0700
X-CSE-ConnectionGUID: DCPUuo1RRziQFjXws29Z6Q==
X-CSE-MsgGUID: 5d0NL8T+QiOcNtmQv+NcAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="279492526"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 06:55:11 -0700
Date: Wed, 30 Sep 2026 15:55:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org, Rob Clark <rob.clark@oss.qualcomm.com>
Subject: Re: [PATCH i-g-t v2 5/5] tests/msm_mapping: Keep parser buffers
 writable
Message-ID: <20260930135508.oughyhblhcvww7yj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org,
 Rob Clark <rob.clark@oss.qualcomm.com>
References: <20260929154950.838280-1-alex.hung@amd.com>
 <20260929154950.838280-6-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929154950.838280-6-alex.hung@amd.com>
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

Hi Alex,
On 2026-09-29 at 11:49:50 -0400, Alex Hung wrote:
> With glibc 2.43, strstr() on const input returns a const pointer.
> Assigning that result to char * in endswith() discards const and
> causes a compiler warning.
> 
> The following warning is observed on Ubuntu 26.04 (wrapped):
> 
>   ../tests/msm/msm_mapping.c: In function 'endswith':
>   ../tests/msm/msm_mapping.c:128:19: warning:
>     initialization discards 'const' qualifier from pointer target type
>     [-Wdiscarded-qualifiers]
> 
> Keep the get_line() return value, line pointer and endswith() input
> writable because endswith() modifies the buffer. This preserves
> mutable access through the parser without casting away const.
> 
> Assisted-by: Copilot:GPT-6-Astra
> Signed-off-by: Alex Hung <alex.hung@amd.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Also +cc Rob Clark <rob.clark@oss.qualcomm.com>

Regards,
Kamil

> ---
>  tests/msm/msm_mapping.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> index 05960627c..52b494abf 100644
> --- a/tests/msm/msm_mapping.c
> +++ b/tests/msm/msm_mapping.c
> @@ -102,7 +102,7 @@ wait_for_stall_on_fault(int drm_fd)
>   * Helper to find named buffer address
>   */
>  
> -static const char *
> +static char *
>  get_line(char **buf)
>  {
>  	char *ret, *eol;
> @@ -123,7 +123,7 @@ get_line(char **buf)
>  }
>  
>  static bool
> -endswith(const char *str, const char *end)
> +endswith(char *str, const char *end)
>  {
>  	char *p = strstr(str, end);
>  
> @@ -166,7 +166,7 @@ get_bo_addr(int drm_fd, const char *name)
>  	 */
>  
>  	while (*p) {
> -		const char *line = get_line(&p);
> +		char *line = get_line(&p);
>  
>  		if (endswith(line, name)) {
>  			uint64_t addr, dummy;
> -- 
> 2.53.0
> 
