Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F1110E4DF
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jun 2023 12:51:35 +0000 (UTC)
Date: Thu, 15 Jun 2023 14:51:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230615125132.zrijzbpcgx7tm7vu@kamilkon-desk1>
References: <20230615123923.3772582-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230615123923.3772582-1-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] xe-fast-feedback.testlist: better name
 Xe life KUnit tests
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

On 2023-06-15 at 14:39:23 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> It seems that some CI jobs don't work with wildcards on testlists.
> Replace them by the actual KUnit test names.
> 
> As migrate and wa tests are currently problematic, place them
> at the end.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index 73b9bbe656a1..53c6be0ed811 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -277,4 +277,9 @@ igt@kms_psr@cursor_plane_move
>  igt@kms_psr@sprite_plane_onoff
>  
>  # Run KUnit tests at the end
> -igt@xe_live_ktest@.*
> +igt@xe_live_ktest@bo
> +igt@xe_live_ktest@dmabuf
> +igt@xe_live_ktest@pci
> +igt@xe_live_ktest@rtp
> +igt@xe_live_ktest@migrate
> +igt@xe_live_ktest@wa
> -- 
> 2.40.1
> 

