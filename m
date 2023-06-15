Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1378A10E4BF
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jun 2023 10:51:22 +0000 (UTC)
Date: Thu, 15 Jun 2023 12:51:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230615105103.5y6yucq3k74scqmf@kamilkon-desk1>
References: <20230615094722.3756326-1-mauro.chehab@linux.intel.com>
 <20230615094722.3756326-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230615094722.3756326-3-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] intel-ci: add Xe live KUnit tests
 to BAT testlist
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

On 2023-06-15 at 11:47:22 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Run Xe live KUnit tests during BAT excecution.
-------------------------------------- ^
execution

With that fixed

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index fb5acd8a0637..73b9bbe656a1 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -275,3 +275,6 @@ igt@kms_prop_blob@basic
>  igt@kms_psr@primary_page_flip
>  igt@kms_psr@cursor_plane_move
>  igt@kms_psr@sprite_plane_onoff
> +
> +# Run KUnit tests at the end
> +igt@xe_live_ktest@.*
> -- 
> 2.40.1
> 

