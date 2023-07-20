Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EB110E551
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jul 2023 04:51:07 +0000 (UTC)
Message-ID: <8fc0dc67-d19a-99e6-90b6-9e884179be62@intel.com>
Date: Thu, 20 Jul 2023 10:20:53 +0530
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230719070939.562159-1-kunal1.joshi@intel.com>
 <20230719070939.562159-2-kunal1.joshi@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230719070939.562159-2-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/3] tests/intel-ci: Added chamelium config
 blacklist
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

Hi,

Please update the subject to say "non-chamelium" config blacklist. Feels 
a little misleading currently.

On 7/19/2023 12:39 PM, Kunal Joshi wrote:
> blacklist for non chamelium config

Please add details as to where/why this will be used.

With these updates to the commit message, the patch LGTM.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel-ci/chamelium.blacklist | 1 +
>   1 file changed, 1 insertion(+)
>   create mode 100644 tests/intel-ci/chamelium.blacklist
>
> diff --git a/tests/intel-ci/chamelium.blacklist b/tests/intel-ci/chamelium.blacklist
> new file mode 100644
> index 000000000..c0325b555
> --- /dev/null
> +++ b/tests/intel-ci/chamelium.blacklist
> @@ -0,0 +1 @@
> +igt@.*chamelium.*
