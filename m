Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DDC10E00C
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jan 2023 21:51:35 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id s26so3249386ioa.11
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jan 2023 13:51:35 -0800 (PST)
Received: from chromium.org ([2620:15c:183:200:de68:80db:55c1:8e83])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a6bf906000000b007046e9e138esm2503448iog.22.2023.01.13.13.51.34
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 13:51:34 -0800 (PST)
Date: Fri, 13 Jan 2023 14:51:33 -0700
From: Drew Davenport <ddavenport@chromium.org>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y8HSZU4U2mN4294U@chromium.org>
References: <20230113133929.1.I536fe5414d54f6ab9aac42c2c702fc8fc481f7f9@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113133929.1.I536fe5414d54f6ab9aac42c2c702fc8fc481f7f9@changeid>
Subject: Re: [igt-dev] [PATCH] tests/kms_plane_scaling: Free leaking fbs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

It looks like this is already fixed by another recent change. Sorry for
the noise, and please disregard.

Drew
