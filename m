Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B40C369B1
	for <igt-dev@archiver.kernel.org>; Sun, 13 Apr 2025 17:56:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E6110E269;
	Sun, 13 Apr 2025 17:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uql0RktS";
	dkim-atps=neutral
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C326E10E269
 for <igt-dev@lists.freedesktop.org>; Sun, 13 Apr 2025 17:56:41 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so28793985e9.2
 for <igt-dev@lists.freedesktop.org>; Sun, 13 Apr 2025 10:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744566997; x=1745171797; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ptr3uPOOR3zzbrESXooCKxoKEgKRGjCHN8ZPm8Or6B0=;
 b=Uql0RktSinwJVF2bewn5GEfH8XOd7en+XOHChep10h3eRmaEYU1pbKOOQpAzAluIqw
 EPxZpqTJSGuHvpzxb6jh6tUcXHuA7Xsqqs6eAFS1JPuBQCv4WoWPkAf0MLcjOX65RXPW
 Iu3jpE2MUSsD8I0JAUBY6E+k4K1DnUC6UzTMtMkTbivj1IEJPOljx5BkFiWBuyhwKuZr
 cl0A+t6q9NBr/qMGuOMgWFBTQRBtNmOGiLlck2yiKzlRR1S49kpGZALD0ZjZzkuAF4Oy
 mI19eJT/E6RdyGP6a/OlCpxERnngq1optVURMlS1KMAh56ngQiKyiTFdu25wPpAEcUQB
 /6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744566997; x=1745171797;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ptr3uPOOR3zzbrESXooCKxoKEgKRGjCHN8ZPm8Or6B0=;
 b=et0NT+LqviAGn7trWhvTobwcbNK28EqqDcNRo5C0AnUIX87nmQUcCJKiGGwTehp0je
 VHImzIXkNwokHBjE5fSjHpmen/QCH3bE9ynsVHGsh3R5Qgufr2GSr+PxZyTJQPNytIzR
 8DmXWrCe3L1OObai4u7FOtzfrynkJO60G6N5iIcyvENXiuvhi7u6tdZLKKMsU/1sFlOr
 kXrbkDgl/yskUaUkY5A1n5xcoeTM0rJNnJx81ZEAWqOPCuUUZHR3k45w7H6jknZL1wep
 BWuGEgyJysK/SLz6jGOOznjTZPBaB9ElfqUaG9bv5z+5RCUKxshrDsL5VnY1Bph+jGgp
 4Xrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCKDWNV2bUrzpFGrR72L5YIw5P4yDq+e1jBhRz+sM0nRqn4trtUcWoVVNM4r5eZoCgYOf77Fgl@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWPj22D8pVSlnNVKH6opVX8DwGVDzUbTObBg4fgJGbbrL9pWz5
 DrhRXhxAUxQzQGJVZ3Gk07VFPCBJliToQAItYKgCASb7tWgdKrbTeDF2KQ==
X-Gm-Gg: ASbGnctWpk2bqBfG+YPG8w4n9BlkGZO9CcEmlI5iC+wHaNOVrqnVz5SCzwmBXnoeBD+
 5wg2ruiHAybMlg/SxshcdK/YAQrxWUXcgO8ZcwH2U/IEsQOJ+3s4r3BbLvuPyfK35Oh3hKzMZYE
 B0YkZNrXo3cYM+jHdN54QzGiGaQf7JGbI5JPwNcQKlP4A2f1AZfBazh8z46ihC5AAXjPlslcYUB
 kNZWeW0jx0+OwiDQnvyNQVGZGVeCX6+dciEr9BlVh6xOCb6kGdM1owiPl4W0ZUJ2mVPTVfwFBUW
 wDqsdg7+dYc+NlJGfVvLXZmmtkdcwIKuWyWNeQ==
X-Google-Smtp-Source: AGHT+IEDyAlbDAY1FJ+SfXFheBiPRDLLc5alp2OjTqrOqg9wfVsT43pds8uz74lZLcbz+XlYYe8GxA==
X-Received: by 2002:a05:600c:1da1:b0:43c:fb5b:84d8 with SMTP id
 5b1f17b1804b1-43f3a95de2cmr101728045e9.16.1744566996480; 
 Sun, 13 Apr 2025 10:56:36 -0700 (PDT)
Received: from fedora ([94.73.34.49]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f20625592sm154268475e9.10.2025.04.13.10.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Apr 2025 10:56:36 -0700 (PDT)
Date: Sun, 13 Apr 2025 19:56:34 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t 1/2] lib/igt_configfs: Add library for configfs
Message-ID: <Z_v60iG59FCxZnpT@fedora>
References: <20250410060727.1857299-1-riana.tauro@intel.com>
 <20250410060727.1857299-2-riana.tauro@intel.com>
 <b1240c51-3a5c-4e5d-b6b7-afd14edbc6fc@bootlin.com>
 <52b194b8-9e12-4228-93da-23d6c02dd34f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52b194b8-9e12-4228-93da-23d6c02dd34f@intel.com>
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

Hi Riana,

On Fri, Apr 11, 2025 at 04:28:00PM +0530, Riana Tauro wrote:
> Hi Louis
> 
> On 4/11/2025 1:23 PM, Louis Chauvet wrote:
> > Hi Riana,
> > 
> > Le 10/04/2025 à 08:07, Riana Tauro a écrit :
> > > Add library functions to open configfs and create
> > > and remove configfs directories.
> > 
> > Can you take a look at [1], something similar was proposed few weeks
> > ago? The main difference is that [1] checks that /sys/kernel/config is
> > actually a mount point.
> I hadn't looked at this. Thank you for the link
> 
> @Jose is this close to merge? If not, can i send [2] and [3] as part of this
> series?
> 
> [2]https://lore.kernel.org/all/20250218165011.9123-3-jose.exposito89@gmail.com/
> [3]https://lore.kernel.org/all/20250218165011.9123-4-jose.exposito89@gmail.com/>

Sure, feel free to send them as part of your series.

The VKMS changes required by my tests are not merged yet, so, most likely,
your series will be merged sooner.

Please CC me in v2 and I'll review it.

> > +Cc: José Exposito

Thanks for CCing me :)

> > [1]:https://lore.kernel.org/all/20250218165011.9123-4-
> > jose.exposito89@gmail.com/
> > 
> > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > ---
> > >   lib/igt_configfs.c | 88 ++++++++++++++++++++++++++++++++++++++++++++++
> > >   lib/igt_configfs.h | 13 +++++++
> > >   lib/meson.build    |  1 +
> > >   3 files changed, 102 insertions(+)
> > >   create mode 100644 lib/igt_configfs.c
> > >   create mode 100644 lib/igt_configfs.h
> > > 
> > > diff --git a/lib/igt_configfs.c b/lib/igt_configfs.c
> > > new file mode 100644
> > > index 000000000..57d59f1c4
> > > --- /dev/null
> > > +++ b/lib/igt_configfs.c
> > > @@ -0,0 +1,88 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2025 Intel Corporation
> > > + */
> > > +#include <sys/mount.h>
> > > +#include <sys/stat.h>
> > > +
> > > +#include <errno.h>
> > > +#include <fcntl.h>
> > > +#include <limits.h>
> > > +
> > > +#include "igt_configfs.h"
> > > +#include "igt_core.h"
> > > +
> > > +static const char *igt_configfs_mount(void)
> > > +{
> > > +    struct stat st;
> > > +
> > > +    if (stat("/sys/kernel/debug", &st) == 0)
> > > +        return "/sys/kernel/config";
> > > +
> > > +    if (mount("none", "/sys/kernel/config", "configfs", 0, 0))
> > > +        return NULL;
> > > +
> > > +    return "/sys/kernel/config";
> > > +}
> > > +
> > > +/**
> > > + * igt_configfs_open: open configfs path
> > > + * @name: name of the configfs directory
> > > + *
> > > + * Opens the configfs directory corresponding to the name
> > > + *
> > > + * Returns:
> > > + * The directory fd, or -1 on failure.
> > > + */
> > > +int igt_configfs_open(const char *name)
> > > +{
> > > +    char path[PATH_MAX];
> > > +    const char *configfs_path;
> > > +
> > > +    configfs_path = igt_configfs_mount();
> > > +    igt_assert(configfs_path);
> > > +
> > > +    snprintf(path, sizeof(path), "%s/%s", configfs_path, name);
> > > +
> > > +    return open(path, O_RDONLY);
> > > +}
> > 
> > The usage of file descriptors for folders is nice here!
> > 
> > @José, I think this may reduce the complexity of the vkms tests. At
> > least it will avoid having snprintf(%s/%s, vkms_root, vkms_item). What
> > do you think?

In v2, I wrapped all path related code in gettiers like
igt_vkms_get_device_enabled_path() or igt_vkms_get_plane_path(), and
all of those getters are just calling common code.

I don't think it'll reduce *test* code complexity, but if we end up using
these methods, I'll have to adapt lib/igt_vkms.c to use them.

> > > +
> > > +/**
> > > + * igt_configfs_create_directory: creates configfs group
> > > + * @fd: fd of configfs parent directory
> > > + * @name: name of the directory to create
> > > + *
> > > + * creates a directory under configfs parent directory
> > > + *
> > > + * Returns: 0 on success, -errno otherwise
> > 
> > This seems wrong, as the function returns a file descriptor, did I miss
> > something?
> > Missed this. Will fix it>> + */
> > > +int igt_configfs_create_directory(int fd, const char *name)
> > > +{
> > > +    int ret;
> > > +    int dirfd;
> > > +
> > > +    ret = mkdirat(fd, name, 0755);
> > > +    if (ret)
> > > +        return -errno;
> > > +
> > > +    dirfd = openat(fd, name, O_DIRECTORY);
> > > +    if (dirfd < 0)
> > > +        return -errno;
> > > +
> > > +    return dirfd;
> > > +}
> > > +
> > > +/**
> > > + * igt_configfs_remove_directory: removes configfs group
> > > + * @fd: fd of configfs parent directory
> > > + * @name: name of directory to create
> > > + *
> > > + * removes directory under configfs parent directory
> > > + */
> > > +void igt_configfs_remove_directory(int fd, const char *name)
> > > +{
> > > +    int ret = unlinkat(fd, name, AT_REMOVEDIR);
> > > +
> > > +    if (ret)
> > > +        igt_warn("Unable to remove %s directory: %s\n", name,
> > > strerror(errno));
> > > +}
> > 
> > I completely understand the point of those helpers, but I don't think
> > they are configfs-specific. The file descriptor is passed by argument,
> > so you could use it for any interface (configfs, debugfs, sysfs...).
> > 
> > I don't see any igt_fs.c, do you think it beneficial to create such file?
> 
> I thought of calling the igt_configfs_open here but that would not work for
> nested configfs directories.
> 
> This could be moved to igt_io and that can be renamed to igt_fs as that has
> only file read and write calls
> 
> Thank you
> Riana Tauro>
> > @José, do you think it make sense to also reuse igt_sysfs helpers for
> > the VKMS tests? (igt_sysfs_get/set_s32/u32/boolean only use a directory
> > fd + path, if you decide to use fd for vkms, it will avoid code
> > duplication)

Definetely, if we are adding equivalents for configfs, I have my own
write/read_int() and write/read_bool() functions that could be replaced by
them.

Thanks
Jose

> > Thanks a lot Riana for this implementation and new ideas.
> > 
> > Louis Chauvet
> > 
> > > diff --git a/lib/igt_configfs.h b/lib/igt_configfs.h
> > > new file mode 100644
> > > index 000000000..d839db49a
> > > --- /dev/null
> > > +++ b/lib/igt_configfs.h
> > > @@ -0,0 +1,13 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2025 Intel Corporation
> > > + */
> > > +
> > > +#ifndef IGT_CONFIGFS_H
> > > +#define IGT_CONFIGFS_H
> > > +
> > > +int igt_configfs_open(const char *name);
> > > +int igt_configfs_create_directory(int fd, const char *name);
> > > +void igt_configfs_remove_directory(int fd, const char *name);
> > > +
> > > +#endif /* IGT_CONFIGFS_H */
> > > diff --git a/lib/meson.build b/lib/meson.build
> > > index d7bb72c57..f087947e7 100644
> > > --- a/lib/meson.build
> > > +++ b/lib/meson.build
> > > @@ -19,6 +19,7 @@ lib_sources = [
> > >       'igt_collection.c',
> > >       'igt_color_encoding.c',
> > >       'igt_facts.c',
> > > +    'igt_configfs.c',
> > >       'igt_crc.c',
> > >       'igt_debugfs.c',
> > >       'igt_device.c',
> > 
> 
