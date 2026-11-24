Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF7F606A321
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 09:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nXd3W2Qj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B82A10FA8C;
	Wed, 25 Nov 2026 09:55:46 +0000 (UTC)
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0BD10F84F
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 18:26:20 +0000 (UTC)
Received: by mail-dl1-f41.google.com with SMTP id
 a92af1059eb24-150ef97e790so27301c88.1
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 10:26:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795544780; cv=none;
 d=google.com; s=arc-20260327;
 b=jHB+sN1VdDiEPAxUW7g7cNIKanc34W36mEHIma66O2j6uKfk1p6Z15MhqNF7gWxhhg
 /oIsAOkyRUj/H9cfOyuHoFZj3VyRvTgoVvi4zDMrosQdpkUMFXQ6KjOdQ/wLlu0HKp2w
 4aeDXc4HzwcAt/H9jPzec5UoFgX+nA5n4YlSPYDDXSStgN8DpDLXDFnLNys+AMJC5bE0
 xPDwsiQCUlr+FzIG66UrJ0BWBM4mQzAtqWQmWOMekGQKBZ1LsNPesibnk3tokHb4xYsO
 CcpRtEynVxtm91zuK2GB+NMjYHpBGpAK40Cb6D8mLQHGtvBp+zjxx0Dt76EpULFS8dX0
 FSpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:mime-version:references
 :in-reply-to:dkim-signature;
 bh=G3VIqX916atV5OraiO1oQCGFdyuEStwP1cI/B8AeJz0=;
 fh=l9O4ZOKoyqpSxIKZRbHikeoUprnf/EyiO+xKJjrKVW8=;
 b=Dz/iK5EQHO6D/NUOWCGwNVkgnzo8V7eAymBcxm7j194ac+z9z2XTEnCWYSZSw8LiLz
 anz/uL8gstFl/aNkRz2YkpgEEJkq/3QpfpXqrcJzW1YezYxObkPRH8gJYuV62BNJw6Hg
 cRcEdA2pA3ylfSXEqKwVxDjy2KFJUlrKHqYwpEwPDsiEpLu6soh5CvpvryYq/WVmXuJx
 oib1RRgbP6Y6ltk7pywUqgy+4Nv6QXppSdNyd1MpZfpxZqQq9ctwAdmXhHYA16+aQWS8
 efu9XL5VySfwk+oGqgvw+nPZG9ElzRRX2lyNspWebWUGR0Y4WGC1FV7D1JAHTBGkZgfF
 Oh8Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1795544780; x=1796149580;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:mime-version
 :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=G3VIqX916atV5OraiO1oQCGFdyuEStwP1cI/B8AeJz0=;
 b=nXd3W2QjjHGO2onHedbGs3P9cAyxofRbcGlESlcJFCkUcJ4o1tVLzt6duGtRnllo9Z
 KqC2PvTEDeH8c3cyFlRiFLH2Rnd3K2e0/uINjngohaItz9YkyrMv2KxBhkauvwwIDt8p
 tM/ZT3wOmu5xoS+6U6GuwsIt6hwmPGsbfmyzIxFS+bmKHlxovd2Yc8QP23ENfKTrrPzq
 2TNxWEH+4qtUSTrDAkcGJyNSXfh+O9X18looSrhm+P2N6lwkfWPFEy2wNLXps6KDuADZ
 W8dgtH7zFHnWubd2SIBOryUV1kH+jfQw3GLA35/ZPnwvZ/xAqPCnXQL8EAI5uwQ4xH/y
 hi8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795544780; x=1796149580;
 h=content-type:cc:to:subject:message-id:date:from:mime-version
 :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=G3VIqX916atV5OraiO1oQCGFdyuEStwP1cI/B8AeJz0=;
 b=0iAyVPdO5/bA+79lnTFLVQFC4W3+zE+LE6OQi/Z5XE6cQyRUXdPE/9DAdCIWmq7HBJ
 CjqS8OwDx6/JLpDMSGQxaN2qo0plxbQbO9lvVPYWvLWtHaBiKwuQCirWaqYlKNK7C4+P
 lT8vnRVJZpipQYZHT6PruVO1oRPu+GkWIjm/c/cCcafV6a86USbZs3vTNYgSoDD/dBuD
 UmVa7iuBXIjPH1kUHAOreKkQHQsSuhyMHeryNqgbD8DHSsixut6MasA0GEGzho5uBDDr
 oN8jOOtgRIcKT5gBigjvolUE3n44d+I9k+z9L0DdQ1RvLgt4n0eXhYczXHdMfWegXxaJ
 4TJg==
X-Forwarded-Encrypted: i=1;
 AL+hErFpMtvd1aYy3JjUmCG2HGk6hUTYTvC0bZhWMYxBqsDLLnEYVdUur1UaDnFR7fW8W28xb0knE4gF@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9vgWABDjbG5xhmGP28pf8Uae++AyvORzGpvpBdD9DZxV5UJsB4
 3hc+5aKLM8ZHu+E2QAVNg6ZJqoGK6K9+0jPbt7SelxdpxYGhr7KFaMjX3wG+XPwyv61+j6NrNa8
 Aa0/eI5JInvKwHJ9iea9J9wjOcuhXd28cgDiLq48C
X-Gm-Gg: AZFdTZd4yHCdg2RVrbvzRJTnjg5GFiQNWGnq8CE8cR04rKsCiFMIniMd9j4ygn9aIPP
 DU8xMXh+wNGDe5sl3t2X0xxyfHyb2GdoDb8NgH9NRksy7YGuzezbas0hwmLlfAC756vvTmCM46C
 nakIHiQvPf7+O5D/YsebKddxuy+9tScDEmshAZWAcHI9GGMmZSDJs4ft2xl90mw8QC65QThAdYl
 4VbssQcdJVFZxAE5xgrr9Y6GkWlQ1V7yhZoed2O85I/hmr4qmPjdAOpghZaCAtZ8wnToYaPii9S
 uP1vKOshjcNI2ve14yK0zDmMGitmR/Rw80s9KP9vNCwck/4Fo2oc4ByHTicxuWkrARGT8MX/di3
 KSemlYyvUaAdATWPDbil5TinYUvA+itadhVd5PsdwKopfPDQZmqbxBXDW/yk9dSQLm68=
X-Received: by 2002:a05:701a:cca2:20b0:1b3:c4ba:8e0b with SMTP id
 a92af1059eb24-1b56338d12dmr3045277c88.2.1795544779142; Tue, 24 Nov 2026
 10:26:19 -0800 (PST)
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Nov 2026 10:26:18 -0800
In-Reply-To: <20261121115236.124211-1-contact@emersion.fr>
References: <20261121115236.124211-1-contact@emersion.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Gil Dekel <gildekel@google.com>
Date: Tue, 24 Nov 2026 10:26:18 -0800
X-Gm-Features: Aa3M54oKvdpvWfL09RePKp7BAey3MdY3x-40Jh26CTIQqjyrVeHvasxHYWp7V6g
Message-ID: <CA++eeRNu6hCHrKUdNKcs_so5F+3rsdBpmHszP9qjZc2gfiSi9Q@mail.gmail.com>
Subject: Re: [PATCH] lib/igt_hdr: switch to libdisplay-info for EDID parsing
To: Simon Ser <contact@emersion.fr>, igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>, Swati Sharma <swati2.sharma@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Mark Yacoub <markyacoub@google.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 25 Nov 2026 09:48:20 +0000
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Simon,

On Sat, Nov 21, 2026 at 11:52:49AM +0000, Simon Ser wrote:
> Replace manual EDID/CTA parsing with libdisplay-info [1].
[...]
> As a bonus, igt_hdr now extracts HDR static metadata from CTA
> DisplayID blocks for free, because the high-level libdisplay-info
> helper does this already.

Thanks for putting this together - no deadline on my side, so no rush.

I tested the lib/igt_hdr.c change against libdisplay-info 0.4.0 on the
Intel xe eDP OLED panel from my series (HDR static metadata in a
DisplayID 2.0 CTA data block, no CTA-861 extension):
- kms_hdr@invalid-hdr: FAIL -> SKIP
- kms_hdr@invalid-metadata-sizes: SKIP -> SUCCESS
- kms_hdr@bpc-switch: SUCCESS -> SUCCESS

I'll drop patches 1/3 and 2/3 of my series in favor of this. A few
comments inline below.

[...]
> diff --git a/lib/igt_hdr.c b/lib/igt_hdr.c
> index c0ed9e843163..b8175ceef1f7 100644
> --- a/lib/igt_hdr.c
> +++ b/lib/igt_hdr.c
> @@ -11,6 +11,8 @@
>  #include <termios.h>
>  #include <unistd.h>
>
> +#include <libdisplay-info/info.h>

Nit: #include "igt_edid.h" (at line 7, and in lib/igt_hdr.h) looks
unused now.

[...]
>  /**
>   * igt_is_panel_hdr:
>   * @fd: DRM file descriptor
> @@ -63,13 +38,10 @@ static bool cta_block(const char *edid_ext)
>  bool igt_is_panel_hdr(int fd, igt_output_t *output)

Nit: the doc comment right above igt_is_panel_hdr() still says "in the
CTA extension".

[...]
> +	info = di_info_parse_edid(edid_blob->data, edid_blob->length);
> +	igt_assert(info);

di_info_parse_edid() returns NULL when an EDID fails its base-block
checksum, so igt_assert(info) fails the test where the old code
returned false. Would it make sense to warn and return false when !info
instead of asserting?

[...]
> diff --git a/meson.build b/meson.build
> index eec131375e06..e7c685116b13 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -151,6 +151,7 @@ build_info += 'Valgrind annotations: @0@'.format(valgrind.found())
>  cairo = dependency('cairo', version : '>1.12.0', required : true)
>  libpci = dependency('libpci', required : true)
>  libudev = dependency('libudev', required : true)
> +libdisplay_info = dependency('libdisplay-info', required : true)

DisplayID CTA HDR parsing landed in libdisplay-info 0.4.0; 0.2.0 and
0.3.0 only check CTA-861 extensions (and return pq=0 on this panel's
EDID). Since build-fedora currently pulls 0.3.0, could this require
version : '>= 0.4.0' so Meson also falls back to your 0.4.0 wrap there?

Happy to add my R-b and T-b once we settle on these.

Thanks,
Gil
