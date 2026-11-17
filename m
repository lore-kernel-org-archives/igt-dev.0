Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5B3606A31C
	for <igt-dev@archiver.kernel.org>; Tue, 17 Nov 2026 03:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l48tpPGf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FB310E3AE;
	Tue, 17 Nov 2026 03:16:06 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F1010E048
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2026 03:14:01 +0000 (UTC)
Received: by mail-dl1-f53.google.com with SMTP id
 a92af1059eb24-1ae7fc5681dso1884c88.1
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 19:14:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794885240; cv=none;
 d=google.com; s=arc-20260327;
 b=CtiMdS+4dw3GBZj6aMnaRb6ccxjMSnfn2YZHLtWVVyc60twXabKaG58OlgZxVGerfK
 rALNXLeKoNeE3Kda+A8yFRygBufAu5pmTpMnGO0ioE29qpzDNxgp0lyNS9hVFNCrIRM8
 CzWc3BoxARbYgoEyEJJxWolyf1lpOUURFBcxeTujbiuuXwOQh95L1ikaOxilDDk43unA
 9LiNbbTdykecqZgnIWCAxpPLpvKEcVNIHjbNlYjuQGOf/XGnthici64VLT45m7yL2PFE
 53MaTZOqbd3jT0cK+LyqZyuXmilfE4EwwickMYvEPx5tJNMZkaodd2XI1Y5GZBlusfOQ
 bU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:mime-version:references
 :in-reply-to:dkim-signature;
 bh=o7kN7ukYbwOLhuWox/I4juA7xU3apr2HGI6Yc0aYT4s=;
 fh=hDNzNJDK+tvGJsqEazIRqDtDkOUJuM9+KHMVv1PZz7o=;
 b=VOyqwx4d1dzwxpa16a1MEp03KUD7zNLBKnaSbygGYAVbvqr6gdWB+icXarrUoEx3mN
 GrInj8aQh6H709kB5l6Vl9KoF885cFY3DE5HCas18CZS1yi6VBFoRJxCgmF8q6kFnfts
 qbNtL+mSbtCuJs112p9ZPMyXDwhjGPbuGm+JCTs5ItmxZRUtJP334/jFW3LB82yzZcps
 VrdYwk2J9zQ7fv9n4f1khStgdanv4/bb5e9OXWik4Rfk3VfdsiTGh0QwEQhT8cSM/nuj
 0/EqchRrZ+9DxQpNSKaXm/UeVoqiMUGyO35mWFtPR4XjLMU5sitFwdQSHxsn6/Ael8bQ
 eMjg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1794885240; x=1795490040;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:mime-version
 :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=o7kN7ukYbwOLhuWox/I4juA7xU3apr2HGI6Yc0aYT4s=;
 b=l48tpPGfItAXDuExTXgoQem9CDyUqB+D0BAlymvXkxEStSkDlx/eWRos4lHE88KoZk
 QiUsclFlNLCJcfoRGpKc30y709FSEO+3+8lLmWejVT4sPnlv/RbrpLvLipDo113zyhe8
 bJRLo8WpWhlFaO32dk/vka+TjPbi89KPYQ0o1NqyUrfxa/xrW8+d72ZWUFRJO1R7DAJF
 h5gQWpDVW1THgPSojLyUpuVbg+pJZ0i9kfIH2lAf7LoI/piZUNTPHttn63YWCpGT15Wc
 JwT7k6c5cchNtOOS+NorZEpVB0a8WxrPh4WAVrlucgsyJGSJi280nRsbzoubeHz0KHhS
 3NNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794885240; x=1795490040;
 h=content-type:cc:to:subject:message-id:date:from:mime-version
 :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=o7kN7ukYbwOLhuWox/I4juA7xU3apr2HGI6Yc0aYT4s=;
 b=cRTmqUWTqEn5wX6uUFOHT+xp/FOljDFyU9jn/glMQxMzWKEv7t2jmi0fHHJ/jaotA/
 g6wCEojSbDRNpYqOqWmLL5Yo4zv8b6aby887/Qhm/32iK4rSj+PoV7VaEcBraw17l9xo
 So3fWOuIPfUx4THPlApYe9htyuUeEoQl0yH4buhK4k0DhGWawf6XmtqjG1aCrO3MhMw0
 +5Li8q4PcCJjwxBBObyIZACBngJF/ujRh15bI3WjN5G2LoGZhEQesK8Vqh9riUbHJDsp
 pJzFD3HcaAvuHGThUoGd+ZRBmYl1gX3vxfjYrEsC/ryV1UHMv9P577jX4Z3UodLbtcjE
 pyJQ==
X-Forwarded-Encrypted: i=1;
 AL+hErFjbRQYpyEfgax/wvxlMEiN6ogMrH4aO6oCpAOPGQLhv9SPYt9/YyxN97ql9MBLCSNMEjqWo6bw@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+QwV1ytsaXQv7tBAA/cUdwDgM4u9pAs/LeAHIKuiRO02/nsIAk
 h4P3621rXogE3TGkHlyhWXDQVx3vxAc2uImeHULoSMdUD+xa7FTN9inp6KHgc0Q5ShuCDSK4vVE
 G+LWUXmhRKBHJs1klKZ/ID3bm5vrIgwNZXnz6q0/5
X-Gm-Gg: AYBFou11LC7tNXDDo8v5QsUAsPHbgfqPp5zO8ijQUC1j/TT6+0QRsAftwERBVFoNP8i
 aUgnL5f0eKvcRMCu7qkC9haz734dVVuNhVx5l+A8SAZLvDR4xrbvcUcbeftQ9yCG3QZMSJTR4KL
 Zy0x+hL3BRIH+glfQsLYniTX/jYbIeFI0AUTasVGtdySDTEfe4ZC3hsVZ68ld+e25Nk2k6Oqrf1
 U3hFb1Utx2c2TtCVL6g7BY9P5kFPCG8PjvQykPTERz/oSTyNNUz98FlbkRRCZmIVHMcBOFFBN4O
 Nv87i7eYzHwfodjZVFpGPbJSnDCm+xpAvuoOSchPvR2FxWClpizkEhsKlIuCh/hlrxiJKBkdWep
 wz4p6HY6YYIsfGpeOHL892PwyGi1pAt1x3uROZH1wsMGLor9LbVxMuO8j8tBUES0jdMQ=
X-Received: by 2002:a05:7022:f509:b0:15e:608d:75f8 with SMTP id
 a92af1059eb24-1b53a9613famr215260c88.3.1794885239322; Mon, 16 Nov 2026
 19:13:59 -0800 (PST)
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Nov 2026 21:13:57 -0600
In-Reply-To: <2830247d327fd002ee4d22be4168a1f44b4f0f85@intel.com>
References: <20261114222855.1403127-1-gildekel@google.com>
 <2830247d327fd002ee4d22be4168a1f44b4f0f85@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Gil Dekel <gildekel@google.com>
Date: Mon, 16 Nov 2026 21:13:57 -0600
X-Gm-Features: Aa3M54rTYKvYspRjDVLKdLZx17rPRWWJbGKEVxSQ2gxboB6lfSrKGUV1DtgSZuM
Message-ID: <CA++eeROZg-x483xRZU5yM8XdN9hz3okEVX--b6OF7pwkeHFsTg@mail.gmail.com>
Subject: Re: [PATCH i-g-t] lib/igt_kms: Skip connectors that can't scan out
To: Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="UTF-8"
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
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jani,

On Mon, Nov 16, 2026 at 12:09:49PM +0200, Jani Nikula wrote:
> Why do "some drivers" use DRM_MODE_CONNECTOR_VIRTUAL instead of
> DRM_MODE_CONNECTOR_WRITEBACK? If they used writeback consistently, could
> we handle all of this in a more clean fashion?
>
> Are there upstream drivers that expose writeback as virtual? Or is "some
> drivers" essentially a single downstream driver?

Upstream drm/msm uses DRM_MODE_CONNECTOR_WRITEBACK; the VIRTUAL
writeback connector I hit is Qualcomm's downstream msm SDE driver (the
same case reverted commit 321448df7fc9 tried to address). Still,
verifying during fixture setup that an ambiguous connector can actually
accept a scanout modeset seems like a clean, uAPI-driven guard so KMS
tests don't pick a non-scanout sink and fail their first commit.

> What's the runtime penalty of doing all this for all tests? Meaningful
> hit for running CI?

Negligible in practice, and zero on upstream CI:
- DRM_MODE_ATOMIC_TEST_ONLY only runs the kernel's in-memory
  atomic_check (microseconds, no hardware programming or vblank waits),
  once per igt_display_require().
- Physical-only drivers (i915, xe, amdgpu, nouveau, upstream msm) and
  virtual-only drivers (vkms, virtio_gpu, vmwgfx) skip the probe
  completely (0 extra ioctls); it only runs when physical and CONNECTED
  VIRTUAL connectors coexist on the same device.

> IMO the kms_setmode change needs to be split to a separate patch.
[...]
> See for_each_output().

Agreed on both. I plan to send a split v3 using igt_display_t directly
(~80 lines in lib/igt_kms.c with for_each_output()) and moving
kms_setmode into its own patch - does that direction work for you?

BR,
Gil
