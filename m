Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FF3C3ABC0
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 13:32:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C0B410E087;
	Wed,  7 May 2025 13:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KHFZzaNy";
	dkim-atps=neutral
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8CC10E087
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 13:32:02 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so59238665e9.1
 for <igt-dev@lists.freedesktop.org>; Wed, 07 May 2025 06:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746624721; x=1747229521; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5j6Z8XanShrF2L3SzrENHYiD8ZClbH8cRYRbeVEQwVg=;
 b=KHFZzaNyg/rJr8ygPAY7gfH3ULv+ojOyfqOwYo2GeXU1KMkbrB2fFjbzPKR3PDVseg
 1oTAeVkVGY7+So7+4Ucj97P8B7N5FnmJHaeos8Ds1KAY4jNnKrqH3WzEAIrBacnPxD1t
 Qfl5hV1CSDRGvbM0cu4RUTuoK5YE4EGF75MTR17EOMBDrnHNQPx78n0TtGtE+LSHB93J
 u4smZXbRwCob92uBnsc7IAwqYw4vd5LfHcXmky7UQlI4ZNgKew0vpxeCIkU92cx8N2Tf
 vwk89rfgXM9HuzVg+5csFuUjijwyCrlvwWPy7V6GQX0kwqj1GtLgEaCmGBn1H2ZlMz0W
 5UKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746624721; x=1747229521;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5j6Z8XanShrF2L3SzrENHYiD8ZClbH8cRYRbeVEQwVg=;
 b=CCd2GDC8Nfss+OEO9Dz5zOaBWtkvTwqZHnWowZwiCa9XzuV0Jhp5DDnUyu7P+qGGmL
 d6h0tEaUmaFur3NhZEONVcYG0/BDcKoR+aYFRs6nDrslRYrnanGXoGxXljn7BqzojezV
 pzkmkv1HP2XvA2GKoSP+SqXZOX3XisfqvL17AWU8EgDv4XzmJ1BxAsk53CGeUhHahntW
 R1MpeQ9eGUB7rO0LX2Rq4rOfwpPvvz+TRHhCa+kskg0svb13wUFSxXggGDQiPqC1dPHt
 hOO8D3SXKaWVicv+rcxHsv0v2N/QDir+3/kBj6huq02F60uwu5Np6l9WzmjzfJRpr1DG
 P6zQ==
X-Gm-Message-State: AOJu0YxXdePrpH7h6p83Z/0+VIzysmHrAbs0/LdYh0/zUCKBop7+wXIG
 R3ds29Rmw8+GzD5XlV3YvhfcFKvIi9yLQGlPuM9aSzUR6qxgmK7a
X-Gm-Gg: ASbGnctLbp3cmUYdfzvPFmGO9o348R72GDj/kKZK7jdTv41Z1T+p4YqA1+LMo9XNjy8
 YnZ2EY9TSKirygJ4QcvudewqfMp229dlupPzXhkbVi5jHb5edGdRldjV6F20JKFANBDTLzntzk0
 L1NuceNoi7nWtn3NjPCSPV1Z0TICCr9oSJja50LY96I11JEF5lAzOoDY3vni15Ie9TvEebtQTrD
 LwMQz3O7ElpCtSbSRqUHbfNFMxO3ojeX7KmR8o2jaIa3Lsl9kjJXhK59WMnP4zcns6ArOOqr59o
 AuLZhhiBEOkPdcX3jUS5pkiogssNUoP3Vlo/7Bs=
X-Google-Smtp-Source: AGHT+IGnMN8eWUz+H8iFtrwj00VVV8D3805dnMGh8RZerB9EzhyblKbJnZX91fq29fayhVftYKunrA==
X-Received: by 2002:a05:6000:22c1:b0:39e:f9e8:d07d with SMTP id
 ffacd0b85a97d-3a0b49a5223mr2552841f8f.20.1746624720588; 
 Wed, 07 May 2025 06:32:00 -0700 (PDT)
Received: from fedora ([94.73.35.165]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd34be0csm1143635e9.18.2025.05.07.06.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 06:32:00 -0700 (PDT)
Date: Wed, 7 May 2025 15:31:58 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, aravind.iddamsetty@linux.intel.com,
 louis.chauvet@bootlin.com
Subject: Re: [PATCH i-g-t 4/5] lib/igt_fs: Add helper functions to create and
 remove directories
Message-ID: <aBtgzlUYzS70gKkq@fedora>
References: <20250422095602.55041-1-riana.tauro@intel.com>
 <20250422095602.55041-5-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250422095602.55041-5-riana.tauro@intel.com>
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

On Tue, Apr 22, 2025 at 03:26:00PM +0530, Riana Tauro wrote:
> Add helper function to create directory and return fd of
> the created directory. Also add a function to remove
> directories. This will be used by configfs
> 
> Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> Cc: José Expósito <jose.exposito89@gmail.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  lib/igt_fs.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_fs.h |  2 ++
>  2 files changed, 50 insertions(+)
> 
> diff --git a/lib/igt_fs.c b/lib/igt_fs.c
> index f6a2530cd..1fa281315 100644
> --- a/lib/igt_fs.c
> +++ b/lib/igt_fs.c
> @@ -21,8 +21,10 @@
>   * IN THE SOFTWARE.
>   *
>   */
> +#include <sys/stat.h>

Nit: Missing empty line

With or without the additional line:
Reviewed-by: José Expósito <jose.exposito89@gmail.com>
  
>  #include <errno.h>
> +#include <fcntl.h>
>  #include <stdlib.h>
>  #include <unistd.h>
>  
> @@ -94,3 +96,49 @@ ssize_t igt_writen(int fd, const char *buf, size_t len)
>  	} while (total != len);
>  	return total ?: ret;
>  }
> +
> +/**
> + * igt_fs_create_dir: creates and opens directory
> + * @fd: file descriptor of parent directory
> + * @name: name of the directory to create
> + * @mode: permissions for the directory
> + *
> + * creates a directory under parent directory and returns
> + * the fd
> + *
> + * Returns: directory fd on success, -errno otherwise
> + */
> +int igt_fs_create_dir(int fd, const char *name, mode_t mode)
> +{
> +	int ret;
> +	int dirfd;
> +
> +	ret = mkdirat(fd, name, mode);
> +	if (ret)
> +		return -errno;
> +
> +	dirfd = openat(fd, name, O_DIRECTORY);
> +	if (dirfd < 0)
> +		return -errno;
> +
> +	return dirfd;
> +}
> +
> +/**
> + * igt_fs_remove_directory: removes directory
> + * @fd: fd of parent directory
> + * @name: name of directory to remove
> + *
> + * removes directory under parent directory
> + *
> + * Returns: 0 on success, -errno otherwise
> + */
> +int igt_fs_remove_dir(int fd, const char *name)
> +{
> +	int ret = unlinkat(fd, name, AT_REMOVEDIR);
> +
> +	if (ret)
> +		return -errno;
> +
> +	return 0;
> +}
> diff --git a/lib/igt_fs.h b/lib/igt_fs.h
> index 84c3fed62..ee3e7593b 100644
> --- a/lib/igt_fs.h
> +++ b/lib/igt_fs.h
> @@ -27,6 +27,8 @@
>  
>  #include <stdio.h>
>  
> +int igt_fs_create_dir(int fd, const char *name, mode_t mode);
> +int igt_fs_remove_dir(int fd, const char *name);
>  ssize_t igt_readn(int fd, char *buf, size_t len);
>  ssize_t igt_writen(int fd, const char *buf, size_t len);
>  
> -- 
> 2.47.1
> 
