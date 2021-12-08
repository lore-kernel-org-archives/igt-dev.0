Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9FE6E0A6
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Dec 2021 19:17:03 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id f125so2943537pgc.0
 for <igt-dev@lists.freedesktop.org>; Wed, 08 Dec 2021 11:17:03 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
Date: Wed,  8 Dec 2021 11:22:14 -0800
Message-Id: <20211208192216.743364-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH igt 0/2] tools/msm_dp_compliance: Multi-connector
 support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Update the compliance tool with an optional arg to specify the connector
name.  This will be required for newer kernels, which will move the
needed debugfs files into a per-connector subdirectory.

Rob Clark (2):
  tools/msm_dp_compliance: Small arg parsing cleanup
  tools/msm_dp_compliance: Add arg to specify connector name

 tools/msm_dp_compliance.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

-- 
2.33.1
