Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705146E038
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jun 2021 04:21:38 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso7825976wmg.2
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jun 2021 21:21:38 -0700 (PDT)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Fri, 11 Jun 2021 06:21:21 +0200
Message-Id: <20210611042123.25282-1-mario.kleiner.de@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] Add support for testing of 16 bpc fixed point
 framebuffers. II.
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
Cc: mario.kleiner.de@gmail.com
List-ID: <igt-dev@lists.freedesktop.org>

Now with the R-b by Ville added to patch 2/2, and drm_fourcc.h
synchronized from the current drm-next branch's drm_fourcc.h,
to provide the new 16 bpc fixed point fourcc's.

Thanks,
-mario


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
