Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B5B10F9DE
 for <igt-dev@lists.freedesktop.org>; Tue, 24 May 2022 13:14:18 +0000 (UTC)
Message-ID: <e9eb514c-5e31-2b8d-3285-58a809ce3352@amd.com>
Date: Tue, 24 May 2022 09:14:13 -0400
Content-Language: en-US
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
References: <20220520203531.14394-1-andrealmeid@igalia.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20220520203531.14394-1-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/2] tests/kms_async_flips: Expand
 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, petri.latvala@intel.com,
 kernel-dev@igalia.com, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi,

I noticed a gitlab warning in this patch:

https://patchwork.freedesktop.org/series/104037/

I think it is a false positive, but I want to check with you before I 
merge it. What do you think?

Thanks
Siqueira

On 2022-05-20 16:35, André Almeida wrote:
> Hi,
> 
> This patchset enables kms_async_flips to run in more vendors. It was
> tested at i915, amdgpu and vc4.
> 
> The first patch adds a helper to keep the same behavior of the test
> while keeping things simple, and the second patch make the test work on
> more platforms.
> 
> Changes from v1:
> - Fix function comment typo
> 
> André Almeida (2):
>    lib/igt_fb: Add support for drawing rectangles with random colors
>    tests/kms_async_flips: Support more vendors
> 
>   lib/igt_fb.c            | 20 ++++++++++++++++++
>   lib/igt_fb.h            |  1 +
>   tests/kms_async_flips.c | 47 ++++++++++++++++++++++++-----------------
>   3 files changed, 49 insertions(+), 19 deletions(-)
> 
