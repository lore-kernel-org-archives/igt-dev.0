Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2050.outbound.protection.outlook.com [40.107.212.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9DB10E119
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Jan 2022 14:29:10 +0000 (UTC)
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Date: Mon, 31 Jan 2022 09:28:17 -0500
Message-ID: <20220131142818.2686782-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [RFC i-g-t 0/1] Introduce MAINTAINERS file to IGT
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
Cc: Petri Latvala <petri.latvala@intel.com>, Solomon Chiu <solomon.chiu@amd.com>, Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>, Sean Paul <seanpaul@chromium.org>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

IGT is becoming more generic, and multiple vendors are adopting it. For
example, AMD fully upstream all of its internal changes last year, and
now we are relying on IGT from the upstream. Additionally, thanks to the
ChromeOS project, we have other vendors working on the KMS tests as
well. At this point, I believe that we need some mechanism to better
contact developers that care about some specific tests or even provide an
easy way for other people to find the right stakeholder for dealing with
some particular issue.

Imho Linux Kernel already has a good solution codified in the
MAINTAINERS and get_maintainers files. One of the best things about this
approach was adding reviewers and maintainers (and other options) to the
specific part of the code and using the get_maintainers tool to extract
the right people to be part of the series. With this idea in mind, I
created this RFC that introduces the MAINTAINERS file in IGT, and I have
already added some entries to this file. My approach was:

* Petri and Hiler are the maintainers, and for this reason, their
  contact will be displayed for every patch.
* I add Mark Yacoub as a reviewer for every KMS test.
* I added some AMD folks as reviewers in some specific KMS tests that we
  run in our CI.
* I added some AMD maintainers to amdgpu tests.

If you want to try it in your local repository, you will need the
get_maintainers script from the Linux kernel, and you can use this
command:

 perl /PATH/TO/get_maintainer.pl --no-tree --separator , --nokeywords --nogit --nogit-fallback --norolestats -f <TARGET_TEST>

Anyway, this is just an idea that I want to discuss with the community.
What do you think about having a MAINTAINERs file? Do you want to add
your name as a reviewer to some specific test if you like the idea? Any
other comments or ideas?

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

Best Regards,
Siqueira

Rodrigo Siqueira (1):
  MAINTAINERS: Introduce MAINTAINERS file

 MAINTAINERS | 203 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 201 insertions(+), 2 deletions(-)

-- 
2.25.1
