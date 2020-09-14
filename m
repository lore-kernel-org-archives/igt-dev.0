Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968706E563
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Sep 2020 19:34:55 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 14 Sep 2020 12:34:11 -0700
From: abhinavk@codeaurora.org
In-Reply-To: <20200904005439.17146-1-abhinavk@codeaurora.org>
References: <20200904005439.17146-1-abhinavk@codeaurora.org>
Message-ID: <5f50a0dcdfabb20d151fc967fc97cc27@codeaurora.org>
Subject: Re: [igt-dev] [PATCH i-g-t 0/5] Add support for video pattern DP
 CTS for MSM chipsets
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: tanmay@codeaurora.org, swboyd@chromium.org, khsieh@codeaurora.org, nganji@codeaurora.org, seanpaul@chromium.org, aravindh@codeaurora.org
List-ID: <igt-dev@lists.freedesktop.org>

Hello

Can we get some reviews on this series please?

Thanks

Abhinav

On 2020-09-03 17:54, Abhinav Kumar wrote:
> This series adds support for video pattern DP compliance tests for
> MSM chipsets. The driver side changes for this have been pushed here 
> [1].
> The changes mostly involve cleanup to move useful APIs to common libs 
> so
> that other compliance modules can use them and also leveraging the 
> design
> of intel_dp_compliance to add support for video pattern tests for MSM
> chipsets.
> 
> [1] https://patchwork.kernel.org/project/dri-devel/list/?series=343255
> 
> Abhinav Kumar (5):
>   tools: rename intel_dp_compliance_hotplug to 
> igt_dp_compliance_hotplug
>   lib/igt_kms: move some of the useful dump functions to igt_kms
>   lib/igt_fb: move the CTS fill framebuffer to igt_fb lib
>   tools: move terminal utility functions to a separate file
>   tools: add support for msm_dp_compliance to IGT
> 
>  lib/igt_fb.c                                  |  65 ++
>  lib/igt_fb.h                                  |   3 +
>  lib/igt_kms.c                                 |  92 ++
>  lib/igt_kms.h                                 |   5 +
>  tools/Makefile.am                             |   4 +
>  tools/Makefile.sources                        |  11 +-
>  tools/igt_compliance_utils.c                  |  82 ++
>  ...el_dp_compliance.h => igt_dp_compliance.h} |  13 +-
>  ..._hotplug.c => igt_dp_compliance_hotplug.c} |   9 +-
>  tools/intel_dp_compliance.c                   | 216 +----
>  tools/meson.build                             |  15 +-
>  tools/msm_dp_compliance.c                     | 812 ++++++++++++++++++
>  12 files changed, 1118 insertions(+), 209 deletions(-)
>  create mode 100644 tools/igt_compliance_utils.c
>  rename tools/{intel_dp_compliance.h => igt_dp_compliance.h} (80%)
>  rename tools/{intel_dp_compliance_hotplug.c =>
> igt_dp_compliance_hotplug.c} (93%)
>  create mode 100644 tools/msm_dp_compliance.c
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
