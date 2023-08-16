Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AC510E33F
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Aug 2023 10:47:29 +0000 (UTC)
Message-ID: <d438f85e-8a47-2b4e-9347-da000a15244c@intel.com>
Date: Wed, 16 Aug 2023 16:17:21 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230807195500.4103092-3-bhanuprakash.modem@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20230807195500.4103092-3-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t, V3,
 02/20] tests/kms_cursor_edge_walk: Fix intel specific checks
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


On 8/8/2023 1:24 AM, Bhanuprakash Modem wrote:
> Use the correct helper to check for the intel hardware.
> s/is_i915_device/is_intel_device/
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
