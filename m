Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60A910E0FA
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jan 2024 06:00:40 +0000 (UTC)
Message-ID: <ee67fc9d-611e-4c9e-b912-153db30edba1@intel.com>
Date: Fri, 5 Jan 2024 11:30:26 +0530
MIME-Version: 1.0
Subject: Re: [i-g-t,1/4] lib/i915/intel_drrs: Fix igt helper to get drrs status
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231228075149.745785-1-bhanuprakash.modem@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20231228075149.745785-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 12/28/2023 1:21 PM, Bhanuprakash Modem wrote:
> intel_is_drrs_supported() helper is giving False if DRRS
> supports on selected pipe which is not correct. Fix the
> helper to give True if DRRS supports on selected pipe.
>
> Fixes: c6f857e46 lib/i915/drrs: Add drrs helpers
> Cc: Jouni Högander <jouni.hogander@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
