Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D8A10E092
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Oct 2022 04:12:15 +0000 (UTC)
Message-ID: <75570864-eab4-97d2-c47e-c020428b534b@intel.com>
Date: Thu, 13 Oct 2022 09:41:49 +0530
Content-Language: en-US
To: Ananya Sharma <ananya.sharma@intel.com>, <igt-dev@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>
References: <20221012123446.30393-1-ananya.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20221012123446.30393-1-ananya.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 0/7] MPO + pipe color test
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

On Wed-12-10-2022 06:04 pm, Ananya Sharma wrote:
> This series includes tests for degamma, gamma, ctm transformation
> for both kms_color as well as kms_color_chamelium. Few changes are
> also made in kms_color_helper to support multiplanes with different
> formats.

With this series, gamma & degamma tests are broken on legacy platforms:
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7950/shards-all.html?testfilter=kms_color

+ Uma to Ack the approach

- Bhanu

> 
> Ananya Sharma (7):
>    tests/kms_color_helper.c
>    tests/kms_color: Degamma MPO + pipe color test
>    tests/kms_color: Gamma MPO + pipe color test
>    tests/kms_color: Ctm MPO + pipe color test
>    tests/chamelium/kms_color_chamelium: degamma for MPO + pipe color test
>    tests/chamelium/kms_color_chamelium: gamma for MPO + pipe color test
>    tests/chamelium/kms_color_chamelium: ctm for MPO + pipe color test
> 
>   tests/chamelium/kms_color_chamelium.c | 368 ++++++++++++++++------
>   tests/kms_color.c                     | 437 +++++++++++++++++++-------
>   tests/kms_color_helper.c              |  26 +-
>   tests/kms_color_helper.h              |  10 +-
>   4 files changed, 617 insertions(+), 224 deletions(-)
> 
