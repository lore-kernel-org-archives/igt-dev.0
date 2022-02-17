Return-path: <SRS0=aXFB=TA=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD45A10ED4F
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Feb 2022 15:27:26 +0000 (UTC)
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Arkadiusz Hiler <arek@hiler.eu>, Petri Latvala <petri.latvala@intel.com>
Date: Thu, 17 Feb 2022 10:26:44 -0500
Message-ID: <20220217152646.425503-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 0/2] Introduce MAINTAINERS file to IGT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org,
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Solomon
 Chiu <solomon.chiu@amd.com>, Sean Paul <seanpaul@chromium.org>,
 Mark Yacoub <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

IGT is becoming more generic, and multiple vendors are adopting it. For
example, AMD fully upstream all of its internal changes last year, and
now we are relying on IGT from the upstream. Additionally, thanks to the
ChromeOS project, we have other vendors working on the KMS tests as
well. At this point, I believe that we need some mechanism to better
contact developers that care about some specific tests or even provide
an easy way for other people to find the right stakeholder for dealing
with some particular issue.

Imho Linux Kernel already has a good solution codified in the
MAINTAINERS and get_maintainers files. One of the best things about this
approach was adding reviewers and maintainers (and other options) to the
specific part of the code and using the get_maintainers tool to extract
the right people to be part of the series. With this idea in mind, I
created an RFC that introduces the MAINTAINERS file in IGT, and
collected feedback. This series is the first version that introduces the
MAINTAINERS and a wrapper to the get_maintainers file.

For this series, I recommend:

1. Patch 1: It has the maintainers file. If you want to add yourself to
some specific test, please, let me know in this patch.
2. Patch 2: get_maintainers wrapper, see the CONTRIBUTING page on how to
use it.

Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Mark Yacoub <markyacoub@google.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Sun Peng Li(Leo) <sunpeng.li@amd.com>
Cc: Chao-kai Wang (Stylon) <stylon.wang@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>
Cc: Nicholas Choi <nicholas.choi@amd.com>
Cc: Martin Peres <martin.peres@mupuf.org>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
Cc: Qingqing Zhuo (Lilian) <qingqing.zhuo@amd.com>
Cc: Solomon Chiu <solomon.chiu@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Dingchen Zhang (David) <Dingchen.Zhang@amd.com>

Rodrigo Siqueira (2):
  MAINTAINERS: Introduce MAINTAINERS file
  scripts: get_maintainer: Introduce get_maintainer wrapper

 .gitignore                |   1 +
 CONTRIBUTING.md           |  17 +++-
 MAINTAINERS               | 198 +++++++++++++++++++++++++++++++++++++-
 scripts/get_maintainer.sh | 104 ++++++++++++++++++++
 4 files changed, 317 insertions(+), 3 deletions(-)
 create mode 100755 scripts/get_maintainer.sh

-- 
2.25.1
