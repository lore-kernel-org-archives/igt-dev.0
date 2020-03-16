Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDE66E46B
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2020 16:12:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 677CE117E421
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2020 16:11:37 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Mon, 16 Mar 2020 12:11:32 -0400
Message-Id: <20200316161132.29833-5-lyude@redhat.com>
In-Reply-To: <20200316161132.29833-1-lyude@redhat.com>
References: <20200316161132.29833-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/4] meson: Add -fcommon to cc_flags
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

Now that we've fixed a bunch of build breakages on systems where
-fcommon is the default (gcc 10+), let's start building with -fcommon by
default so we can make sure things don't break with this in the future.
Supposedly it's supposed to be able to generate better code anyway!

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meson.build b/meson.build
index bcb69e1c..0d7092bd 100644
--- a/meson.build
+++ b/meson.build
@@ -70,6 +70,7 @@ cc_args = [
 # well with longjmp which is heavily used by IGT framework.
 	'-fno-builtin-malloc',
 	'-fno-builtin-calloc',
+	'-fcommon',
 ]
 
 foreach cc_arg : cc_args
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
