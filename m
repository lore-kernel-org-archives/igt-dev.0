Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D3610E423
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Aug 2023 13:46:59 +0000 (UTC)
Message-ID: <f883dc8b-c48c-ba92-04a3-9147d97a0fad@intel.com>
Date: Wed, 23 Aug 2023 19:16:54 +0530
MIME-Version: 1.0
Content-Language: en-US
To: =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230822094035.3424673-5-jouni.hogander@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20230822094035.3424673-5-jouni.hogander@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [i-g-t, v8,
 4/4] tests/kms_dirtyfb: Add new test for dirtyfb ioctl
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


On 8/22/2023 3:10 PM, Jouni Högander wrote:
> Add new test to validate dirtyfb ioctl is working properly with GPU
> frontbuffer rendering.
>
> Create big framebuffer and use only lower right corner for the
> plane. Initiate GPU drawing for a rectangle over the whole
> framebuffer and perform dirtyfb ioctl. Then wait for the drawing to
> complete and collect crc and check that it matches with expected.
>
> v7:
>   - Add new style documentation
> v6:
>   - Perform igt_display_reset in prepare
> v5:
>   - Modifiations to support Xe as well
> v4:
>   - Check connector type when PSR is tested
> v3:
>   - Use spinner
>   - Drop allocating big frambuffers
> v2:
>   - Change license comment
>   - Move disable_features and do not apply for FEATURE_DEFAULT
>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
