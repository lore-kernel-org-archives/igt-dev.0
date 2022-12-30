Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E2C10E098
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Dec 2022 20:06:45 +0000 (UTC)
Message-ID: <ee85b614-4430-cae3-fb1c-fc94c39a56fb@intel.com>
Date: Sat, 31 Dec 2022 01:36:08 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Harry Wentland <harry.wentland@amd.com>, igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, uma.shankar@intel.com
References: <20221212192425.387971-1-harry.wentland@amd.com>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <20221212192425.387971-1-harry.wentland@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH 0/2] Add Colorspace tests to kms_hdr
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Harry,

First of all, why do you think kms_hdr is the right place to add 
colorspace tests? Can we have amd specific IGT for the same.
It seems intel doesn't have any plans in near future to expose this debugfs.
++Uma ++Bhanu

On 13-Dec-22 12:54 AM, Harry Wentland wrote:
> We've had a Colorspace property on the drm_connector
> but no IGT tests. These patches add IGT tests for this
> property. They're currently only enabled on amdgpu with
> the kernel at [1] but could be enabled for other drivers
> if those drivers decide to expose a debugfs to read the
> currently applied colorspace.
> 
> [1] https://gitlab.freedesktop.org/hwentland/linux/-/tree/hdr-colorimetry
> 
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Alex Hung <Alex.Hung@amd.com>
> 
> Harry Wentland (2):
>    tests/kms_hdr: Add test for output Colorspace
>    tests/kms_hdr: Add suspend and DPMS Colorspace tests
> 
>   lib/igt_kms.c   |  51 ++++++++++++++++
>   lib/igt_kms.h   |   6 ++
>   tests/kms_hdr.c | 156 ++++++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 213 insertions(+)
> 
> --
> 2.38.1
> 

-- 
~Swati Sharma
