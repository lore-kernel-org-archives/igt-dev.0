Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A440B10E17A
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Oct 2023 07:51:44 +0000 (UTC)
Message-ID: <bab476a3-09d8-d903-4788-0b1658e0f370@intel.com>
Date: Tue, 3 Oct 2023 13:21:09 +0530
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20231003062004.462907-1-kunal1.joshi@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20231003062004.462907-1-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/intel-ci/chamelium-only: update test
 name
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


On 10/3/2023 11:50 AM, Kunal Joshi wrote:
> Updated feature_discovery to kms_feature_discovery
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/chamelium-only.testlist | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
> index c9f72d703..7f5c6978e 100644
> --- a/tests/intel-ci/chamelium-only.testlist
> +++ b/tests/intel-ci/chamelium-only.testlist
> @@ -1,4 +1,4 @@
> -igt@feature_discovery@chamelium
> +igt@kms_feature_discovery@chamelium
>   igt@kms_chamelium_audio@dp-audio
>   igt@kms_chamelium_audio@dp-audio-edid
>   igt@kms_chamelium_audio@hdmi-audio
