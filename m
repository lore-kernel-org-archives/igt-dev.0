Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA929C54E5D
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 10:45:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 491D910F559;
	Mon, 18 Mar 2024 10:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RCaKkqnH";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9680B10F549
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 10:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710758741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9cl3peC5xImPUKTejaGeAHKlKFPwwTfXI2gPLWm7Zaw=;
 b=RCaKkqnHx16b35EWIFrh6bIWBXM3xJ8i+RbhhAKlitbTCI5mXZcbSIAQjzxVH7xovYgVm/
 yqkOIe2ePbKiEMai8bSfaR/0BuGTysd8nVg4xwGm7fu+fb4y57z1zaF0G86LH7MofHu6ZM
 BR4082EvtAV9KXvCgx9TpgcpCYXj5XI=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-56XgJPJkPPSJloPeZJ9IFQ-1; Mon, 18 Mar 2024 06:45:39 -0400
X-MC-Unique: 56XgJPJkPPSJloPeZJ9IFQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-5148eaa60acso329738e87.0
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 03:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710758738; x=1711363538;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9cl3peC5xImPUKTejaGeAHKlKFPwwTfXI2gPLWm7Zaw=;
 b=vgixvNK9tQmx//K+iYdOkzYK3Wn328iFhqHmMX8rS1gZ6lmQCHj94fG4GcoO5vtkWF
 wR/7uqMEOJLaov4FUF0R/C1TVjei+KielOidajtZUTHYZU6zn9b8P8eHacw8Qh9tCBum
 k5qcoDTfn7vZlj1DUJqzPxwKRG1PirQfAw7bW8TQ28EYpej6Gau/xyQ1GcJ0XDglJbPh
 C3M4rPcRWm5MPEtTur6SLsjoFdmCqSm72cALeDWN7HyUyvquiYPL7qkJpNrFuh5zIUMT
 FOUm9wd+Dc9xRx8BfEmo41fb5LEr97Pc4IUpAh2+wlPsVakBncdgOe+1jiu0SnRt13TR
 I80Q==
X-Gm-Message-State: AOJu0YwvWOdkrT6iQpuswqcJPzWo8XOlPbO6v6lCu/+7DqbA2S8glfhb
 GWMDp2teUfsGeCUwsfh9bQKomgQaG5m7gdNTidXto7CHeevjhkSfUUlQblhdTnsPM7C5HwusR+4
 xSCwOFfAS22f4ZqxE5ohoeNTjmeR6mIHfvH3wP7rlKh+2J0MxdWfCNAk96QwuTNA=
X-Received: by 2002:a05:6512:3485:b0:513:c25b:8fe with SMTP id
 v5-20020a056512348500b00513c25b08femr7239687lfr.58.1710758738423; 
 Mon, 18 Mar 2024 03:45:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGH7y18M3R5yHv3u704cZGjsIy2eaQodz8xnT0kKZ8EPN2c3BpqeZqsFg/q+OBGzYQeOoV1iQ==
X-Received: by 2002:a05:6512:3485:b0:513:c25b:8fe with SMTP id
 v5-20020a056512348500b00513c25b08femr7239675lfr.58.1710758738060; 
 Mon, 18 Mar 2024 03:45:38 -0700 (PDT)
Received: from toolbox ([2001:9e8:89a6:b300:cdbb:8c1e:2aef:a12d])
 by smtp.gmail.com with ESMTPSA id
 j30-20020a05600c1c1e00b004133825e6cfsm17645951wms.24.2024.03.18.03.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 03:45:37 -0700 (PDT)
Date: Mon, 18 Mar 2024 11:45:36 +0100
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Simon Ser <contact@emersion.fr>,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Sameer Lattannavar <sameer.lattannavar@intel.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH i-g-t 0/5] tests/kms_cursor_crc: Test SIZE_HINTS
Message-ID: <20240318104536.GA1004070@toolbox>
References: <20240315191505.27620-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20240315191505.27620-1-ville.syrjala@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

On Fri, Mar 15, 2024 at 09:15:00PM +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Add some kind of basic test for the SIZE_HINTS property.

Not familiar with the code base but this all makes sense to me.

Acked-by: Sebastian Wick <sebastian.wick@redhat.com>

> Cc: Simon Ser <contact@emersion.fr>
> Cc: Jonas Ådahl <jadahl@redhat.com>
> Cc: Daniel Stone <daniel@fooishbar.org>
> Cc: Sameer Lattannavar <sameer.lattannavar@intel.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> 
> Ville Syrjälä (5):
>   wip: drm-uapi: add drm_plane_size_hints
>   lib/igt_kms: Add IGT_PLANE_SIZE_HINTS
>   tests/kms_cursor_crc: Make require_cursor_size() a bit more sensible
>   tests/kms_cursor_crc: Test the SIZE_HINTS property
>   CI: tests/intel-ci: Run kms_cursor_crc@cursor-size-hints
> 
>  include/drm-uapi/drm_mode.h           | 11 +++++
>  lib/igt_kms.c                         |  1 +
>  lib/igt_kms.h                         |  1 +
>  tests/intel-ci/fast-feedback.testlist |  1 +
>  tests/kms_cursor_crc.c                | 69 +++++++++++++++++++++++++--
>  5 files changed, 80 insertions(+), 3 deletions(-)
> 
> -- 
> 2.43.2
> 

