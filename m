Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76D110E034
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Nov 2023 06:03:52 +0000 (UTC)
Message-ID: <8de97077-76f6-f387-e9a5-40701f7f5b08@intel.com>
Date: Mon, 13 Nov 2023 11:33:34 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org, karthik.b.s@intel.com, swati2.sharma@intel.com
References: <20230825082541.905799-4-bhanuprakash.modem@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20230825082541.905799-4-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t, V6,
 3/5] tests/i915/kms_big_joiner: Fix Bigjoiner checks
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


On 8/25/2023 1:55 PM, Bhanuprakash Modem wrote:
> Bigjoiner will come in the picture when the resolution > 5K or
> clock > max dot-clock. Add a support to check the selected mode
> clock is greater than the max dot-clock.
>
> V2: - Handle both 5k & max dot clock cases
>      - Other minor cleanups
> V3: - Fix the logic to avoid the retry
> V4: - consistent naming for bigjoiner
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
