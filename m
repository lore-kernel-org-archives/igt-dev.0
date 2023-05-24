Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87BB110E564
 for <igt-dev@lists.freedesktop.org>; Wed, 24 May 2023 03:36:47 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-64d2da69fdfso396535b3a.0
 for <igt-dev@lists.freedesktop.org>; Tue, 23 May 2023 20:36:47 -0700 (PDT)
From: Christopher Snowhill <kode54@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 23 May 2023 20:36:38 -0700
Message-Id: <20230524033640.2006028-1-kode54@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/1] drm-uapi/xe_drm: Update Xe uAPI
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

Update the Xe uAPI contract with upstream changes, including my attempt
at padding out structures so that 32-bit compat userspace will work on
64-bit kernels. 64-bit userspace is unaffected by the change, other
than that padding is explicitly declared now, and must be left zeroed.

Signed-off-by: Christopher Snowhill <kode54@gmail.com>

Christopher Snowhill (1):
  drm-uapi/xe_drm: Update Xe uAPI

 include/drm-uapi/xe_drm.h | 53 +++++++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 10 deletions(-)

-- 
2.40.1
