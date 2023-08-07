Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4942110E051
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Aug 2023 08:13:11 +0000 (UTC)
Message-ID: <effeabda-123e-e366-7abc-2188e2d9876b@intel.com>
Date: Mon, 7 Aug 2023 13:43:06 +0530
MIME-Version: 1.0
Content-Language: en-US
To: =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230622054543.3360732-5-jouni.hogander@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20230622054543.3360732-5-jouni.hogander@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [i-g-t, v6,
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


On 6/22/2023 11:15 AM, Jouni Högander wrote:
> Add new test to validate dirtyfb ioctl is working properly with GPU
> frontbuffer rendering.
>
> Create big framebuffer and use only lower right corner for the
> plane. Initiate GPU drawing for a rectangle over the whole
> framebuffer and perform dirtyfb ioctl. Then wait for the drawing to
> complete and collect crc and check that it matches with expected.
>
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
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>

LGTM

Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
