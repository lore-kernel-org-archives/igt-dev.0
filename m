Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D02E6E323
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jul 2021 21:42:21 +0000 (UTC)
From: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Date: Thu, 15 Jul 2021 21:42:14 +0000
Message-ID: <e77f6bcdb73d449a843380378bf55169@intel.com>
References: <20210713120016.463320-1-stylon.wang@amd.com>
 <20210715205316.aj4f6qhbzchhnwd3@outlook.office365.com>
In-Reply-To: <20210715205316.aj4f6qhbzchhnwd3@outlook.office365.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] New tests for ASSR Content
 Protection on DP/eDP
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
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: "Latvala, Petri" <petri.latvala@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Anson.Jacob@amd.com" <Anson.Jacob@amd.com>, "Nicholas.Choi@amd.com" <Nicholas.Choi@amd.com>, "markyacoub@google.com" <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

Re-reported the results.

Lakshmi.

-----Original Message-----
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com> 
Sent: Thursday, July 15, 2021 1:53 PM
To: Vudum, Lakshminarayana <lakshminarayana.vudum@intel.com>
Cc: Latvala, Petri <petri.latvala@intel.com>; arek@hiler.eu; markyacoub@google.com; igt-dev@lists.freedesktop.org; Harry.Wentland@amd.com; Anson.Jacob@amd.com; Nicholas.Choi@amd.com; Stylon Wang <stylon.wang@amd.com>
Subject: Re: [PATCH i-g-t 0/2] New tests for ASSR Content Protection on DP/eDP

Hi Lakshminarayana,

It looks like that we got a false-positive for this patchset [1]. Could you check that?

1. https://patchwork.freedesktop.org/series/92472/

Thanks

On 07/13, Stylon Wang wrote:
> New IGT tests to check if ASSR content protection is correctly 
> enabled/disabled according to eDP specification. Test also applies to 
> internal/non-removable displays that appears as DP displays.
> 
> Stylon Wang (2):
>   tests/amdgpu: New ASSR test on DP/eDP links
>   tests/amdgpu: Add suspend and DPMS subtests to ASSR test
> 
>  tests/amdgpu/amd_assr.c  | 298 +++++++++++++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build |   1 +
>  2 files changed, 299 insertions(+)
>  create mode 100644 tests/amdgpu/amd_assr.c
> 
> --
> 2.32.0
> 

-- 
Rodrigo Siqueira
https://siqueira.tech
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
