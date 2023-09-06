Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CC510E5AC
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 09:27:37 +0000 (UTC)
Date: Wed, 6 Sep 2023 11:27:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230906092733.2fv32s5hvfmosmlf@kamilkon-desk.igk.intel.com>
References: <20230905124127.1250108-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230905124127.1250108-1-swati2.sharma@intel.com>
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

Hi Swati,

On 2023-09-05 at 18:11:27 +0530, Swati Sharma wrote:
> Its safer to run suspend tests under resume runs. Drop
> only suspend test from the ffb.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index a395fa8c3..a2b231c17 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -237,7 +237,6 @@ igt@kms_pipe_crc_basic@nonblocking-crc
>  igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
>  igt@kms_pipe_crc_basic@read-crc
>  igt@kms_pipe_crc_basic@read-crc-frame-sequence
> -igt@kms_pipe_crc_basic@suspend-read-crc
>  igt@kms_prop_blob@basic
>  igt@kms_psr@primary_page_flip
>  igt@kms_psr@cursor_plane_move
> -- 
> 2.25.1
> 
