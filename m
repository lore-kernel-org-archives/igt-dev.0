Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A144F10E5A1
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 09:16:34 +0000 (UTC)
Date: Wed, 6 Sep 2023 11:16:27 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Message-ID: <20230906111627.1b9f69f8@maurocar-mobl2>
In-Reply-To: <20230905124127.1250108-1-swati2.sharma@intel.com>
References: <20230905124127.1250108-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel-ci: drop suspend test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue,  5 Sep 2023 18:11:27 +0530
Swati Sharma <swati2.sharma@intel.com> wrote:

> Its safer to run suspend tests under resume runs. Drop
> only suspend test from the ffb.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

LGTM.

Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>

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
