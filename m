Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E4B10E65E
 for <igt-dev@lists.freedesktop.org>; Fri, 12 May 2023 09:32:31 +0000 (UTC)
Message-ID: <5b8cbb1b-572c-9516-1399-a42d12b3be9c@intel.com>
Date: Fri, 12 May 2023 11:32:27 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, igt-dev@lists.freedesktop.org
References: <20230512092728.6612-1-nirmoy.das@intel.com>
 <20230512092728.6612-2-nirmoy.das@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
In-Reply-To: <20230512092728.6612-2-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] intel-ci: Remove prime_vgem userptr
 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 12.05.2023 11:27, Nirmoy Das wrote:
> This is test is not valid anymore so remove it.
>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   tests/intel-ci/fast-feedback.testlist | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index d9fcb62d6e..cfe7cb4aa3 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -145,7 +145,6 @@ igt@prime_vgem@basic-fence-read
>   igt@prime_vgem@basic-gtt
>   igt@prime_vgem@basic-read
>   igt@prime_vgem@basic-write
> -igt@prime_vgem@basic-userptr
>   igt@vgem_basic@setversion
>   igt@vgem_basic@create
>   igt@vgem_basic@debugfs
