Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3258310E551
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jul 2023 04:53:15 +0000 (UTC)
Message-ID: <45b56aab-701d-b0a5-288e-f36b48397975@intel.com>
Date: Thu, 20 Jul 2023 10:23:02 +0530
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230719070939.562159-1-kunal1.joshi@intel.com>
 <20230719070939.562159-3-kunal1.joshi@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230719070939.562159-3-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 2/3] tests/intel-ci: Added psr config blacklist
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

Same comments as previous patch.

With those updates in commit message the patch LGTM.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

On 7/19/2023 12:39 PM, Kunal Joshi wrote:
> blacklist for non psr config
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel-ci/psr.blacklist | 1 +
>   1 file changed, 1 insertion(+)
>   create mode 100644 tests/intel-ci/psr.blacklist
>
> diff --git a/tests/intel-ci/psr.blacklist b/tests/intel-ci/psr.blacklist
> new file mode 100644
> index 000000000..8356a92f7
> --- /dev/null
> +++ b/tests/intel-ci/psr.blacklist
> @@ -0,0 +1 @@
> +igt@.*psr.*
