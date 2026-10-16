Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08230CCA464
	for <igt-dev@archiver.kernel.org>; Fri, 16 Oct 2026 09:01:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24E31126B8;
	Fri, 16 Oct 2026 09:01:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DDE331126B8
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2026 09:00:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AAD014BF
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2026 02:00:08 -0700 (PDT)
Received: from [10.2.11.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 EA3EC3F871
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2026 02:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
 t=1792141211; bh=XIAnKTdb9cfaIow00Rw3ZD3ngCn88RMDB6KpT+R2rjA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cqMqLmpPIMtWTqVQYdgqiEkCxixFo6waOEz2wOmZSmo+HQxB37jBouqplNVJAqxFP
 sALeMN8GXmynakApvV4NxT9j7eLYNqLGgF1SzYzxvZ6xzISWgXJQ1G5kS9ARGzQovR
 MJbnt8+U1Iaw5aFDknY7cd7oDJNr/m7StgwLWr8Y=
Date: Fri, 16 Oct 2026 10:00:08 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: igt-dev@lists.freedesktop.org, boris.brezillon@collabora.com,
 adrian.larumbe@collabora.com, steven.price@arm.com,
 daniel.almeida@collabora.com, kamil.konieczny@linux.intel.com
Subject: Re: [PATCH i-g-t 1/2] panthor: Return size from PANTHOR_DEV_QUERY
Message-ID: <atHnmJhjW66YqrP-@e142607>
References: <20261015-b4-dev_query-v1-0-70ffafa4131e@collabora.com>
 <20261015-b4-dev_query-v1-1-70ffafa4131e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261015-b4-dev_query-v1-1-70ffafa4131e@collabora.com>
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

On Thu, Oct 15, 2026 at 04:44:57PM -0700, Deborah Brouwer wrote:
> The size of the type being queried will be updated by the kernel driver
> when the user pointer is null. Return the query size so that we can check
> that it was correctly calculated.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  lib/igt_panthor.c | 6 +++++-
>  lib/igt_panthor.h | 2 +-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
> index 11d8ec342..5aca0a020 100644
> --- a/lib/igt_panthor.c
> +++ b/lib/igt_panthor.c
> @@ -178,8 +178,10 @@ void igt_panthor_group_submit_simple(int fd, uint32_t group_handle,
>   * @err: expected error code, or 0 for success
>   *
>   * Query GPU information.
> + *
> + * Returns: the size of the type being queried.
>   */
> -void igt_panthor_query(int fd, int32_t type, void *data, size_t size, int err)
> +uint32_t igt_panthor_query(int fd, int32_t type, void *data, size_t size, int err)
>  {
>  	struct drm_panthor_dev_query query = {
>  		.type = type,
> @@ -191,6 +193,8 @@ void igt_panthor_query(int fd, int32_t type, void *data, size_t size, int err)
>  		do_ioctl_err(fd, DRM_IOCTL_PANTHOR_DEV_QUERY, &query, err);
>  	else
>  		do_ioctl(fd, DRM_IOCTL_PANTHOR_DEV_QUERY, &query);
> +
> +	return query.size;
>  }
>  
>  /**
> diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
> index ba4a9bf1e..2ecce57de 100644
> --- a/lib/igt_panthor.h
> +++ b/lib/igt_panthor.h
> @@ -16,7 +16,7 @@ struct panthor_bo {
>  	void *map;
>  };
>  
> -void igt_panthor_query(int fd, int32_t type, void *data, size_t size, int err);
> +uint32_t igt_panthor_query(int fd, int32_t type, void *data, size_t size, int err);
>  void igt_panthor_vm_create_userva_range(int fd, uint32_t *vm_id, int err, uint64_t *uva_range);
>  void igt_panthor_vm_destroy(int fd, uint32_t vm_id, int err);
>  void igt_panthor_vm_bind_offset(int fd, uint32_t vm_id, uint32_t bo_handle, uint64_t va,
> 
> -- 
> 2.56.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
