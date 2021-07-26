Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC676E8E9
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jul 2021 09:14:22 +0000 (UTC)
Date: Mon, 26 Jul 2021 12:16:45 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YP59fVOk0hGoDxd/@platvala-desk.ger.corp.intel.com>
References: <20210624172436.1467489-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210624172436.1467489-1-markyacoub@chromium.org>
Subject: Re: [igt-dev] [PATCH] Add .vscode to gitignore
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org, seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jun 24, 2021 at 05:24:36PM +0000, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> Given the popularity of vscode, .vscode is a directory that holds
> the personal vscode preferences.
> 
> ---
>  .gitignore | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/.gitignore b/.gitignore
> index 88dd0338..119c80ba 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -50,3 +50,5 @@ results
>  build
>  patches
>  Makefile
> +
> +.vscode
> \ No newline at end of file

Newline at the end please.

With that,

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> -- 
> 2.32.0.93.g670b81a890-goog
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
