Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8478410E13F
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Mar 2022 19:55:20 +0000 (UTC)
Date: Tue, 1 Mar 2022 14:55:15 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <Yh56I/J+C6z29zEX@intel.com>
References: <20220217152646.425503-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217152646.425503-1-Rodrigo.Siqueira@amd.com>
Subject: Re: [igt-dev] [PATCH 0/2] Introduce MAINTAINERS file to IGT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, igt-dev@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>,
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
 Mark Yacoub <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 10:26:44AM -0500, Rodrigo Siqueira wrote:
> IGT is becoming more generic, and multiple vendors are adopting it. For
> example, AMD fully upstream all of its internal changes last year, and
> now we are relying on IGT from the upstream. Additionally, thanks to the
> ChromeOS project, we have other vendors working on the KMS tests as
> well. At this point, I believe that we need some mechanism to better
> contact developers that care about some specific tests or even provide
> an easy way for other people to find the right stakeholder for dealing
> with some particular issue.
> 
> Imho Linux Kernel already has a good solution codified in the
> MAINTAINERS and get_maintainers files. One of the best things about this
> approach was adding reviewers and maintainers (and other options) to the
> specific part of the code and using the get_maintainers tool to extract
> the right people to be part of the series. With this idea in mind, I
> created an RFC that introduces the MAINTAINERS file in IGT, and
> collected feedback. This series is the first version that introduces the
> MAINTAINERS and a wrapper to the get_maintainers file.

But in the Linux Kernel we do for big blocks, not for individual .c files.
For the .c files git blame should be enough imho...

> 
> For this series, I recommend:
> 
> 1. Patch 1: It has the maintainers file. If you want to add yourself to
> some specific test, please, let me know in this patch.
> 2. Patch 2: get_maintainers wrapper, see the CONTRIBUTING page on how to
> use it.
> 
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Mark Yacoub <markyacoub@google.com>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Sun Peng Li(Leo) <sunpeng.li@amd.com>
> Cc: Chao-kai Wang (Stylon) <stylon.wang@amd.com>
> Cc: Wayne Lin <wayne.lin@amd.com>
> Cc: Nicholas Choi <nicholas.choi@amd.com>
> Cc: Martin Peres <martin.peres@mupuf.org>
> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Cc: Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
> Cc: Qingqing Zhuo (Lilian) <qingqing.zhuo@amd.com>
> Cc: Solomon Chiu <solomon.chiu@amd.com>
> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Cc: Dingchen Zhang (David) <Dingchen.Zhang@amd.com>
> 
> Rodrigo Siqueira (2):
>   MAINTAINERS: Introduce MAINTAINERS file
>   scripts: get_maintainer: Introduce get_maintainer wrapper
> 
>  .gitignore                |   1 +
>  CONTRIBUTING.md           |  17 +++-
>  MAINTAINERS               | 198 +++++++++++++++++++++++++++++++++++++-
>  scripts/get_maintainer.sh | 104 ++++++++++++++++++++
>  4 files changed, 317 insertions(+), 3 deletions(-)
>  create mode 100755 scripts/get_maintainer.sh
> 
> -- 
> 2.25.1
> 
