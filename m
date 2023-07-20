Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0047B10E551
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jul 2023 04:56:16 +0000 (UTC)
Message-ID: <2c602a4d-b955-0d14-1969-19513f0414f2@intel.com>
Date: Thu, 20 Jul 2023 10:26:05 +0530
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230719070939.562159-1-kunal1.joshi@intel.com>
 <20230719070939.562159-4-kunal1.joshi@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230719070939.562159-4-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 3/3] tests/intel-ci: added blacklist to
 meson.build
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


On 7/19/2023 12:39 PM, Kunal Joshi wrote:
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/meson.build | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index d5a6e4f47..9f6ed501d 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -7,6 +7,8 @@ intelci_files = [
>     'blacklist-pre-merge.txt',
>     'xe-fast-feedback.testlist',
>     'xe.blocklist.txt',
> +  'chamelium.blacklist',
> +  'psr.blacklist',
>   ]
>   
>   install_data(sources : intelci_files, install_dir : datadir)
