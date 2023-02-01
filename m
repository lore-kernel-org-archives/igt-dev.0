Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C97B10E40B
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Feb 2023 15:14:22 +0000 (UTC)
Message-ID: <941b3061-3709-e026-9ad7-68acfebebd71@linux.intel.com>
Date: Wed, 1 Feb 2023 16:13:57 +0100
MIME-Version: 1.0
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230201132657.575932-1-zbigniew.kempczynski@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230201132657.575932-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] Unblock crc32 calculation
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

Series is Acked-by: Nirmoy Das <nirmoy.das@intel.com>


On 2/1/2023 2:26 PM, Zbigniew Kempczyński wrote:
> Newer platforms are able to calculate crc32 so stop narrowing that
> operation to DG2 only.
>
> Zbigniew Kempczyński (2):
>    lib/i915_crc: Use system memory buffer on integrated platforms
>    lib/i915_crc: Use graphics version to determine ALU SHL/SHR caps
>
>   lib/i915/i915_crc.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
