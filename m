Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06709C71133
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 16:11:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8466810E6D1;
	Wed, 11 Jun 2025 16:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JrYqx1u1";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3097B10E6B3
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 16:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749658258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oFOQqSD5Hhr8Sj46raYWQpfF1yVmVYEX+2BJgYnIpjU=;
 b=JrYqx1u1qZVztbj9hD6G4Isxg2WrqnFb4ci+nWq3U50BKcqB3ICdb2iRupFnoZahNUmuTl
 Zuoln1DuETHo6zr0m7T0q1hmjL38W9YMJN40TD9y8de6V05IPEZrRYGuFh9JVlFmJek044
 1rRRQg5bwRu+YmooJ2olkPPODCQ11eg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-CIkQRMGVP5G30olufb9UaQ-1; Wed, 11 Jun 2025 12:10:55 -0400
X-MC-Unique: CIkQRMGVP5G30olufb9UaQ-1
X-Mimecast-MFC-AGG-ID: CIkQRMGVP5G30olufb9UaQ_1749658254
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a4f8192e2cso27153f8f.3
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 09:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749658254; x=1750263054;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oFOQqSD5Hhr8Sj46raYWQpfF1yVmVYEX+2BJgYnIpjU=;
 b=UVKFnfrmfxCaQ0wiVdHqc/JMoNRR36LpQCorf2PRA8Sqe4vL85un+kEZyJAp82/x2F
 0a6wDxy3krC9oZnvzJu309AvGwSpbQdErEbHpsThrUENu0GS2O0QRFoItgBTVfZjXkC4
 JxL17RSfJDSiNphnPM/UbYnXqMEPykaXJPDsxTEHJ8zhcTmCGS/qLojURs3lz/tLTTBl
 ypdyx0aL0ufiLxLRaYZMKzvoEfPcqXKdnU5Q19Ct4uQianztvRuwr6Psvah+xLH6dUxM
 346PTJrixOE/wzqiI1gTo5TO86leagX3iuOS+5F46Z9ENPmHyFIeTYOgudodTm5FZGBS
 wYzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj6TIxywV77NuTzLOj5i2ZiuRjF3kvpb6eDZSyYIYksWNA+evVEhRrsi2lmlUnr6G5MZPRi7r9@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYF8ZrMSps46t/JiFhe2S2A13BNv9I3vOD136Rc4g/BQebrvxX
 aUh3ZmV/615jtZ0aXymTbwjByJybltiT50II/xUw5tN6QH00deqtLUWRRxtCsMLWJ48+3y4krZa
 tBZfFMdmil1/XvTAyNcXgfNKMJh0f5MlFKjhGV93GXZZz8iEWqGMbxj6iTMK3uR0HR0g=
X-Gm-Gg: ASbGncu08Dv0g1Caom5pS2J4DXmZ1J4DpvwcUyo+InbcN5ZaZcqQW6UbAuCslN/TD6k
 uVWuKKpz6APj2TJLUjCnGD/ND5alGOtdrDjr9cn4oPZck8Se4G4Qlhn1Zu+n7QRysjStB6+aOb9
 hZjjzv+yAF13EBQ1mmJqB7WWBBStPBjgVXNi+KxVZdcEnozt7KZO+ji7GDYWCNDKy5S6HMfKEWy
 8XBhbaR6dKVn+g+U2qAZAUIrEEqldqaAmiYW4JKvYCRkVcu4Z6MTnperfctIn0jkjr6wcfAUi2b
 6NSTjdraqsSamG9LT+E+nw==
X-Received: by 2002:a05:6000:2083:b0:3a4:eec8:c9b3 with SMTP id
 ffacd0b85a97d-3a5586f34b5mr3014137f8f.23.1749658254098; 
 Wed, 11 Jun 2025 09:10:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhp/VoURwMu2JxzZ7RLK9PVj+b8a616TDt7T8LnzLztyMzSPJBoI31+h+uHQ4tJ6sdF9fsAg==
X-Received: by 2002:a05:6000:2083:b0:3a4:eec8:c9b3 with SMTP id
 ffacd0b85a97d-3a5586f34b5mr3014098f8f.23.1749658253684; 
 Wed, 11 Jun 2025 09:10:53 -0700 (PDT)
Received: from [10.43.17.222] ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53229de48sm16051104f8f.10.2025.06.11.09.10.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 09:10:53 -0700 (PDT)
Message-ID: <a1ede824-3651-429a-a269-0e933066b12a@redhat.com>
Date: Wed, 11 Jun 2025 18:10:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] tests/drm_virtgpu: Add functional coverage for core
 VirtIO-GPU ioctls
To: Dorinda Bassey <dbassey@redhat.com>, igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, javierm@redhat.com, aesteve@redhat.com
References: <20250610163135.1122267-1-dbassey@redhat.com>
From: Erico Nunes <ernunes@redhat.com>
In-Reply-To: <20250610163135.1122267-1-dbassey@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ADwV9hkhy5Pd8Xx3YP5zfcWiq7V-nyqxH2rIzMBFk8M_1749658254
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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

Hello,

On 6/10/25 6:30 PM, Dorinda Bassey wrote:
> This test suite adds coverage for multiple DRM ioctls specific
> to the VirtIO-GPU driver, verifying functionality such as
> resource creation, memory mapping, 3D transfers, context
> initialization, and parameter querying.
> Each test validates a key ioctl to ensure correct behavior from
> user space and backend implementations. Each subtest is
> self-contained and can be executed independently.
> 
> Included subtests:
>   - drm-virtgpu-map
>   - drm-virtgpu-execbuffer
>   - drm-virtgpu-resource-info
>   - drm-virtgpu-3d-transfer-to-host
>   - drm-virtgpu-3d-transfer-from-host
>   - drm-virtgpu-3d-wait
>   - drm-virtgpu-resource-create-blob
>   - drm-virtgpu-get-caps
>   - drm-virtgpu-context-init
>   - drm-virtgpu-getparam
> 
> How to Test with QEMU virtio-vga-gl or rustvmm vhost-device-gpu
> 
> 1. Launch a QEMU guest with virtio-vga-gl
> ./build/qemu-system-x86_64 \
>   -enable-kvm \
>   -cpu host \
>   -m 4096 \
>   -machine q35 \
>   -display gtk,gl=on \
>   -vga none \
>   -device virtio-vga-gl \
>   -drive file=image.qcow2,format=qcow2 \
>   -netdev user,id=n0,hostfwd=tcp::2222-:22 \
>   -device virtio-net-pci,netdev=n0
> 
> ssh into the guest and run the tests.
> 
> 2. Start the vhost-device-gpu backend and Launch a QEMU
> guest with vhost-user-gpu-pci or vhost-user-vga, see guide on:
> https://crates.io/crates/vhost-device-gpu

Overall this looks quite good to me. Thanks for doing this initial batch
of tests for virtio-gpu. I think it is a good start to build upon and
start enabling some more DRM tests in CIs especially since this can
astract hardware details.

I have a couple of comments below, to consider if you will do another
respin:


> 
>  tests/drm_virtgpu.c | 425 ++++++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build   |   1 +
>  2 files changed, 426 insertions(+)
>  create mode 100644 tests/drm_virtgpu.c

Would it make sense for this to live in its own subdirectory? Since it
is testing "device-specific" commands (for virtio-gpu being the device).
I see that some of the other drivers have their own directory, and
currently this one is bundled together with some fairly generic DRM or
KMS API tests in meson.build.
But I'm not sure if there is a policy for this so I'd leave it to the
igt maintainers.

> +#define VIRTGPU_DEVICE "/dev/dri/card0"

VIRTGPU_DEVICE is unused since an earlier revision, so it can be removed.

> +static const struct {
> +	const char *name;
> +	uint64_t id;
> +} params[] = {
> +	{"3D_FEATURES", VIRTGPU_PARAM_3D_FEATURES},
> +	{"CAPSET_QUERY_FIX", VIRTGPU_PARAM_CAPSET_QUERY_FIX},
> +	{"RESOURCE_BLOB", VIRTGPU_PARAM_RESOURCE_BLOB},
> +	{"HOST_VISIBLE", VIRTGPU_PARAM_HOST_VISIBLE},
> +	{"CROSS_DEVICE", VIRTGPU_PARAM_CROSS_DEVICE},
> +	{"CONTEXT_INIT", VIRTGPU_PARAM_CONTEXT_INIT},
> +	{"SUPPORTED_CAPSET_IDs", VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs},
> +	{"EXPLICIT_DEBUG_NAME", VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME},
> +};

Might make sense to move this params array to the "drm-virtgpu-getparam"
subtest since it is only used there.

Considering these you can add my:
Reviewed-by: Erico Nunes <ernunes@redhat.com>

Thanks

Erico

