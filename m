Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABCD10E418
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Sep 2023 04:06:44 +0000 (UTC)
Message-ID: <273dc23f-4fed-cf18-7d78-3187a5df836c@intel.com>
Date: Thu, 7 Sep 2023 09:36:20 +0530
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230905124127.1250108-1-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230905124127.1250108-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel-ci: drop suspend test
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


On 9/5/2023 6:11 PM, Swati Sharma wrote:
> Its safer to run suspend tests under resume runs. Drop
> only suspend test from the ffb.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/xe-fast-feedback.testlist | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index a395fa8c3..a2b231c17 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -237,7 +237,6 @@ igt@kms_pipe_crc_basic@nonblocking-crc
>   igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
>   igt@kms_pipe_crc_basic@read-crc
>   igt@kms_pipe_crc_basic@read-crc-frame-sequence
> -igt@kms_pipe_crc_basic@suspend-read-crc
>   igt@kms_prop_blob@basic
>   igt@kms_psr@primary_page_flip
>   igt@kms_psr@cursor_plane_move
