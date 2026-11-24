Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA301606A323
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 09:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NmLfYlIk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD3210E298;
	Wed, 25 Nov 2026 09:50:11 +0000 (UTC)
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DDF10F004
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 18:13:50 +0000 (UTC)
Received: by mail-dl1-f49.google.com with SMTP id
 a92af1059eb24-150ef97e790so27118c88.1
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 10:13:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795544030; cv=none;
 d=google.com; s=arc-20260327;
 b=Uy9fhIV7AayFpBHFEZDYgGFd8mR92Vlzb+LyoqkDfas2mFAXv6c41pjTvox+4ENuI9
 0Ui12XfQ33qrniVLWNuGjCqTZPbX42TAs5AWibCP7WB+udGa9ywYTvP4xKvykXjJucxc
 B940U9KwFCBjhzORYWT9+A7mEF8YHRHFjogeUn7YALzfVQGZxFZRd0sRQJM8mfPaAqWp
 MxZsCJZOOBBBMbtB5D7n+zrnR+jIPeBCOdoTBYt6ISzGo2k1YOKLZLlVTAgUoPIWyEBV
 JB+/ONiTPYNKl5XU047T3FWlAtbEgzzLMOkVjxg9ehFSFmlPy/fgxyoB4YXLvRr28cd7
 FvMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:mime-version:references
 :in-reply-to:dkim-signature;
 bh=v4Qy66jDF+5OkoyBDu6k5A7LB4Q/zbfQIRjg66OWSKQ=;
 fh=zZQbD2dXf0amqm1M0lJOnNjn4Hv6D7QVO/CZf6Z0Iso=;
 b=PxdWQFDXWXGlObrwbGotsW+UFDDWTVpqnRmMPVgDLCqIT+5uJ0kJLs4lgw3g5gucAM
 tdFy8fSfXYObGI4co6SJJmotGN7VYGOUt8U9dk25TNHGxrL+ObHxLD7fEx45uflTolqq
 Abszyhq/yRBfN3yDTDXKrUeDWDxzNEzyEkB05c4QiWPGSvLjpIbGhnZbugAf14ibIR9T
 Yei92altGPayY6tpwUevPV0tuO3K/82Tey7h/h6SR7IDDtTcE1nz2MF5R5d386T+itg2
 sHY/decb4G9KvW7kYNvAxH5eMfMXRp4FZKnphsdOh/hEt6kJ+MJ6qrDUMiQsR0MbeURs
 pu9g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1795544030; x=1796148830;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:mime-version
 :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=v4Qy66jDF+5OkoyBDu6k5A7LB4Q/zbfQIRjg66OWSKQ=;
 b=NmLfYlIkflESGBXOaiW4RDx1oUA+nXP6jOynbf52RNuQJ/h8XM/0mjkpGNntWcDj6U
 Khw27yJvpFsu2oxaXwGs6ssjJQK6oCIU3WvsYoS3FOefNdPU4fB8YjlJePF4jars7eGZ
 XEN3MGckTeV/B/xBOuPza1BefMjINKNu53KTebbXnI6ukMXOUux+aynK03dXOrGqChB0
 pYJublcl9ANp593zXYCE+sfqm6OENLY0SVrAJARZfw+rP/FMjs9H6nkwvZeaKtgB4Zkv
 8dxxI/yXAl68A/XKSb/yW/2NUM+ZaaAtiewxsdfe+c9GFkGUTybxmApRYzRYYI7Fbh7f
 q5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795544030; x=1796148830;
 h=content-type:cc:to:subject:message-id:date:from:mime-version
 :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=v4Qy66jDF+5OkoyBDu6k5A7LB4Q/zbfQIRjg66OWSKQ=;
 b=RMKsdP4hfqVvWqGMRhN/oQqPOfu9DKH3ixpkxGA0sNvECxpcsMAKQVfegom+H4FgFy
 rshe11VYPkfRZBhDo1+zsi7YZVk5EZNz+DHcZlQ94iIRzaQVUTwfgbcz9Jiqlxxo7DWe
 sOJO/55KkjHGhE2UNGHUTrhx+9g5o/eQ8QwXjr3OgUNpt8Eg5A9GO2nG3RYWFXQYJ8Kk
 oyl4gBt5CI34oARVMgyRw4nMloJQlhlfc2GqLP++OUxU2OXEMzX551NZhvsGST5iJZBB
 s66vqI5WgqmfQq+MnMu6YisonM53yVcOyWiUWmfcnUs5RLVt+Kk6Q6/hb+mwgLPYTrQb
 0SiQ==
X-Gm-Message-State: APuU4Z8VcLvmryvjIzSLWZb5Pod/9hMZq+r3P0IMTlHQ3rtcq0yRF/md
 W1XDC8OZmGJAp+baYwKdqsvfP9MowYVhLVg34Ys2+Mh51WwIIGX1aXs+RY84iM2As1GRVQyKjDp
 FHLXT6p5j/6iCisYYbyxJjUH5Q8mfjKnE1xyqODu+QVU4iVsNsAXglchQ
X-Gm-Gg: AZFdTZec+r2l/pe1F2PguMBPBX9qZ5B3s+Gaev08YzmoOyVRlIX829Vj9OuIRTZRClL
 RXmgLOdPslWG+B3YprbnZbHBcXyNy89478Fyl41PXxLx+xk9mvvCbzIjO8aP9AcqZl8KQUxrjT+
 bu01DpBfIx0IWocgWikQ/76SL+JWKdTDLyiRlylobuaf6U+Eaz2B1JbvTasAHz324LFQO3pBkhB
 nZ+5cNwFp7XW3tMC/emC9BS91DYGtA/j/KdCwvwcC+OUUkcJ7Wwg/JKL+26RS83ycGZG74CXso0
 Hs74wKw5uZ7lMvPohBVmq4+EpuG/VqX3q08o6vSOhIJqpajHw7SHJSaotdM7lHv4TFoFRYzWSTI
 dtCx2j1lYIe+fnYEXEkMQ8N9twx7dQOlwkx3dQNCxyc5XS3FSjX2HdIesvfZxzwee41o=
X-Received: by 2002:a05:7022:3a08:b0:1b5:3993:ff76 with SMTP id
 a92af1059eb24-1b563e42fcbmr3092808c88.5.1795544028770; Tue, 24 Nov 2026
 10:13:48 -0800 (PST)
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Nov 2026 10:13:47 -0800
In-Reply-To: <20261115001855.2931860-1-gildekel@google.com>
References: <20261114222902.1404033-1-gildekel@google.com>
 <20261115001855.2931860-1-gildekel@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Gil Dekel <gildekel@google.com>
Date: Tue, 24 Nov 2026 10:13:47 -0800
X-Gm-Features: Aa3M54oq3iwCXAKH2pI4c9ZqukpPqBBIkTU7aEOp4YT7Uli85P29QByRvVPQtYs
Message-ID: <CA++eeROJTXCmV-9YGBnU=CyCkpc0ZJ9HFEkkNj8hvNCOuKQzgQ@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2 0/2] lib/igt_kms: Reset leftover color state
To: igt-dev@lists.freedesktop.org
Cc: Melissa Wen <mwen@igalia.com>, 
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, 
 Mark Yacoub <markyacoub@google.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 25 Nov 2026 09:48:19 +0000
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

Hi all,

Gentle ping on this series; it hasn't had a review yet. It still
applies to current master.

On the CI failures reported against the first posting (Xe.CI.FULL:
kms_plane_scaling max-crc subtests on shard-bmg; i915.CI.Full: suspend
aborts on shard-dg1 and shard-dg2): the same kinds of failures were
reported the same day against my lib/igt_hdr series, which doesn't
touch igt_kms, so I believe they are unrelated to these patches.

Adding Kamil.

Thanks,
Gil
