Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A158310E146
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jun 2023 12:49:12 +0000 (UTC)
Message-ID: <88e47f5d-4e6a-a416-05fe-531e0c5876d4@intel.com>
Date: Wed, 14 Jun 2023 18:18:32 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230531065407.362625-1-swati2.sharma@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20230531065407.362625-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 0/3] check dsc hardware capability
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

Changes LGTM.

With minor comments addressed in Patch#3:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

On 5/31/2023 12:24 PM, Swati Sharma wrote:
> Instead of assuming dsc is supported gen11+, lets use has_dsc
> flag in i915_capability to check h/w support.
>
> Swati Sharma (3):
>    tests: s/igt_is_dsc_supported/igt_is_dsc_supported_by_sink
>    tests: s/check_dsc_on_connector/is_dsc_supported_by_sink
>    tests: add igt_is_dsc_supported_by_source()
>
>   lib/igt_dsc.c               | 28 +++++++++++++++++++++++++---
>   lib/igt_dsc.h               |  3 ++-
>   tests/i915/kms_dsc.c        |  4 ++--
>   tests/i915/kms_dsc_helper.c | 14 ++++++++++++--
>   tests/i915/kms_dsc_helper.h |  3 ++-
>   tests/i915/kms_psr2_sf.c    |  2 +-
>   tests/kms_invalid_mode.c    |  5 ++---
>   7 files changed, 46 insertions(+), 13 deletions(-)
>
