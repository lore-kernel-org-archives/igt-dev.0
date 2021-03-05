Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351656E221
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Mar 2021 16:43:11 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id a1so2192451qkn.11
 for <igt-dev@lists.freedesktop.org>; Fri, 05 Mar 2021 08:43:07 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
Date: Fri,  5 Mar 2021 11:42:51 -0500
Message-Id: <20210305164253.11788-1-jcline@redhat.com>
In-Reply-To: <20210219172738.263820-1-jcline@redhat.com>
References: <20210219172738.263820-1-jcline@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/2] Fix up the HDR tests for AMD devices
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

A second attempt at getting the HDR tests working again on AMD devices.
AMD hardware requires a primary plane to be enabled whenever the CRTC
is, but the bpc_switch tests are explicitly removing the primary plane
because old Intel hardware (hsw) has scaling restrictions.

However, Intel only supports HDR in Kaby Lake+ so rather than working
around the scaling restriction this just skips the HDR tests on hardware
that doesn't support HDR.

Jeremy Cline (2):
  kms_hdr: Skip HDR tests on pre-Kaby Lake Intel devices
  kms_hdr: Fix bpc-switch tests on AMD hardware

 tests/kms_hdr.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
2.30.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
